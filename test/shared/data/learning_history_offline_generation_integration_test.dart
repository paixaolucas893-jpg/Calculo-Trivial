import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/data/learning_history_generation_session.dart';
import 'package:calcquest/shared/data/learning_history_queue_sync_policy.dart';
import 'package:calcquest/shared/data/pending_learning_history_queue.dart';
import 'package:calcquest/shared/domain/learning_history_attempt_factory.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  const factory = LearningHistoryAttemptFactory();
  const policy = LearningHistoryQueueSyncPolicy();
  final occurredAt = DateTime.utc(2026, 11, 4, 12);

  LearningHistoryEntry makeAttempt(
    LearningHistoryGenerationState state,
  ) {
    return factory.create(
      generationState: state,
      questionId: 'q-1',
      isCorrect: true,
      source: LearningActivitySource.practice,
      occurredAt: occurredAt,
    );
  }

  test('offline event stays in original generation after remote reset',
      () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession();
    session.bindUser('user-a');

    const beforeReset =
        LearningHistoryGenerationState(generation: 1, status: 'active');
    await session.refresh((_) async => beforeReset);
    final event = makeAttempt(session.verifiedState!);
    await queue.enqueue('user-a', event);

    // Another device resets the server while this device is offline.
    session.invalidate();
    const afterReset =
        LearningHistoryGenerationState(generation: 2, status: 'active');
    await session.refresh((_) async => afterReset);

    final pending = await PendingLearningHistoryQueue(prefs).pending('user-a');
    expect(pending.single.generation, 1);
    expect(
      policy.canUploadVersioned(state: session.verifiedState!, entry: pending.single),
      isFalse,
    );
    expect((await queue.pending('user-a')).single.eventId, event.eventId);
  });

  test('account switching cannot reassign queued events', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession();
    session.bindUser('user-a');

    const stateA =
        LearningHistoryGenerationState(generation: 3, status: 'active');
    await session.refresh((_) async => stateA);
    final original = makeAttempt(session.verifiedState!);
    await queue.enqueue('user-a', original);

    session.bindUser('user-b');
    expect(session.verifiedState, isNull);
    const stateB =
        LearningHistoryGenerationState(generation: 4, status: 'active');
    await session.refresh((_) async => stateB);
    final other = makeAttempt(session.verifiedState!);
    await queue.enqueue('user-b', other);

    expect((await queue.pending('user-a')).single.generation, 3);
    expect((await queue.pending('user-b')).single.generation, 4);
    expect(
      policy.canUploadVersioned(state: stateB, entry: original),
      isFalse,
    );
  });

  test('stale server refresh cannot authorize a queued event', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession();
    final server = Completer<LearningHistoryGenerationState>();
    session.bindUser('user-a');
    final refresh = session.refresh((_) => server.future);

    session.invalidate();
    server.complete(
      const LearningHistoryGenerationState(
        generation: 1,
        status: 'active',
      ),
    );
    await expectLater(refresh, throwsStateError);
    expect(session.verifiedState, isNull);

    // Preserve local learning attempts without pretending a generation was
    // verified. Such entries cannot be uploaded after the reset.
    final local = LearningHistoryEntry(
      eventId: LearningHistoryEntry.newEventId(),
      questionId: 'q-1',
      isCorrect: true,
      source: LearningActivitySource.practice,
      occurredAtEpochMs: occurredAt.millisecondsSinceEpoch,
    );
    await queue.enqueue('user-a', local);
    const afterReset =
        LearningHistoryGenerationState(generation: 2, status: 'active');
    expect(
      policy.canUploadV1(state: afterReset, entry: local),
      isFalse,
    );
    expect((await queue.pending('user-a')).single.generation, isNull);
  });

  test('resetting generation cannot create uploadable attempts', () async {
    final session = LearningHistoryGenerationSession();
    session.bindUser('user-a');
    await session.refresh(
      (_) async => const LearningHistoryGenerationState(
        generation: 2,
        status: 'resetting',
      ),
    );
    expect(
      () => makeAttempt(session.verifiedState!),
      throwsStateError,
    );
  });
}
