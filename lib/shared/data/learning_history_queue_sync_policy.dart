import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

/// Conservative upload decision for the existing version-1 offline outbox.
///
/// Version-1 events do not persist the generation in which they occurred.
/// Do not infer their generation from the latest server state: doing so
/// would revive pre-reset attempts from a device that was offline.
/// Keep blocked events in durable storage for explicit reconciliation.
class LearningHistoryQueueSyncPolicy {
  const LearningHistoryQueueSyncPolicy();

  /// Only legacy generation zero events can be safely considered for upload.
  ///
  /// This check does not authorize writing. The network upload still needs
  /// authentication, Firestore rules, stable event IDs and server confirmation.
  bool canUploadV1({
    required LearningHistoryGenerationState state,
    required LearningHistoryEntry entry,
  }) {
    return state.allowsNewEvents &&
        state.generation == 0 &&
        entry.eventId != null &&
        (entry.generation == null || entry.generation == 0);
  }

  /// A versioned event is eligible only for its original active generation.
  ///
  /// The generation must be captured when the attempt is created. It must
  /// never be assigned or rewritten during a retry after a server reset.
  bool canUploadVersioned({
    required LearningHistoryGenerationState state,
    required LearningHistoryEntry entry,
  }) {
    return state.allowsNewEvents &&
        entry.eventId != null &&
        entry.generation != null &&
        entry.generation == state.generation;
  }

  /// Fail closed if any queued event cannot be assigned to this generation.
  ///
  /// The caller must not acknowledge or delete blocked events automatically.
  bool canUploadAllV1({
    required LearningHistoryGenerationState state,
    required List<LearningHistoryEntry> pending,
  }) {
    return pending.every((entry) => canUploadV1(state: state, entry: entry));
  }
}
