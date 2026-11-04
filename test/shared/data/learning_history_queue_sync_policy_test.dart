import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/data/learning_history_queue_sync_policy.dart';
import 'package:calcquest/shared/data/pending_learning_history_queue.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  const policy = LearningHistoryQueueSyncPolicy();

  LearningHistoryEntry event() => LearningHistoryEntry(
        eventId: LearningHistoryEntry.newEventId(),
        questionId: 'q1',
        isCorrect: true,
        source: LearningActivitySource.practice,
        occurredAtEpochMs: 1760000000000,
      );

  test('legacy pending event is eligible only before first reset', () {
    final entry = event();
    expect(
      policy.canUploadV1(
        state: LearningHistoryGenerationState.legacy,
        entry: entry,
      ),
      isTrue,
    );
    expect(
      policy.canUploadV1(
        state: const LearningHistoryGenerationState(
          generation: 1,
          status: 'active',
        ),
        entry: entry,
      ),
      isFalse,
    );
  });

  test('resetting status always rejects legacy uploads', () {
    expect(
      policy.canUploadV1(
        state: const LearningHistoryGenerationState(
          generation: 0,
          status: 'resetting',
        ),
        entry: event(),
      ),
      isFalse,
    );
  });

  test('events without a stable ID cannot be uploaded', () {
    expect(
      policy.canUploadV1(
        state: LearningHistoryGenerationState.legacy,
        entry: const LearningHistoryEntry(
          questionId: 'q1',
          isCorrect: false,
          source: LearningActivitySource.practice,
          occurredAtEpochMs: 1760000000000,
        ),
      ),
      isFalse,
    );
  });

  test('offline outbox survives a blocked generation check', () async {
    final preferences = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(preferences);
    final oldEvent = event();
    await queue.enqueue('user-a', oldEvent);

    final pending = await queue.pending('user-a');
    expect(
      policy.canUploadAllV1(
        state: const LearningHistoryGenerationState(
          generation: 2,
          status: 'active',
        ),
        pending: pending,
      ),
      isFalse,
    );

    final restored = await PendingLearningHistoryQueue(preferences)
        .pending('user-a');
    expect(restored.single.eventId, oldEvent.eventId);
  });

  test('an empty outbox does not require event reconciliation', () {
    expect(
      policy.canUploadAllV1(
        state: const LearningHistoryGenerationState(
          generation: 3,
          status: 'active',
        ),
        pending: <LearningHistoryEntry>[],
      ),
      isTrue,
    );
  });
}
