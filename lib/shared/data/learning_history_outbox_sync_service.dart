import 'package:calcquest/shared/data/learning_history_generation_session.dart';
import 'package:calcquest/shared/data/learning_history_queue_sync_policy.dart';
import 'package:calcquest/shared/data/pending_learning_history_queue.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

/// Internal, manually invoked synchronization of versioned offline attempts.
///
/// This is NOT attached to app startup, background tasks, or the reset UI.
/// Firestore rules remain the authoritative race barrier between reading the
/// generation and committing a write. Unknown-generation events stay queued.
class LearningHistoryOutboxSyncService {
  LearningHistoryOutboxSyncService({
    required this.queue,
    required this.session,
    required this.readGeneration,
    required this.writeOrConfirm,
  });

  bool _syncInProgress = false;

  final PendingLearningHistoryQueue queue;
  final LearningHistoryGenerationSession session;
  final Future<LearningHistoryGenerationState> Function(String userId)
      readGeneration;
  final Future<void> Function(String userId, LearningHistoryEntry entry)
      writeOrConfirm;

  /// Returns the number of server-confirmed attempts acknowledged locally.
  ///
  /// Stops before writing when account identity or generation is uncertain.
  /// Any failed read, write, or acknowledgment propagates without deleting
  /// unconfirmed entries from the durable outbox.
  Future<int> sync(String userId) async {
    if (_syncInProgress) {
      throw StateError('Learning-history synchronization already in progress.');
    }
    _syncInProgress = true;
    try {
      return await _syncOnce(userId);
    } finally {
      _syncInProgress = false;
    }
  }

  Future<int> _syncOnce(String userId) async {
    if (userId.trim().isEmpty || session.userId != userId) {
      throw StateError('Learning-history session does not match user.');
    }

    final state = await session.refresh(readGeneration);
    if (!state.allowsNewEvents) {
      return 0;
    }

    final entries = await queue.pending(userId);
    const policy = LearningHistoryQueueSyncPolicy();
    var confirmed = 0;

    for (final entry in entries) {
      // Never upgrade an unversioned legacy event to the current generation.
      if (!policy.canUploadVersioned(state: state, entry: entry)) {
        continue;
      }

      if (session.userId != userId ||
          !identical(session.verifiedState, state)) {
        throw StateError('Learning-history session changed during sync.');
      }

      await writeOrConfirm(userId, entry);

      // A confirmed write can be retried by ID if the session changed.
      // Do not acknowledge it under an expired session.
      if (session.userId != userId ||
          !identical(session.verifiedState, state)) {
        throw StateError('Learning-history session changed during sync.');
      }

      await queue.acknowledge(userId, entry.eventId!);
      confirmed++;
    }

    return confirmed;
  }
}
