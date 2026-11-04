import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/data/learning_history_generation_session.dart';
import 'package:calcquest/shared/data/learning_history_outbox_sync_service.dart';
import 'package:calcquest/shared/data/pending_learning_history_queue.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  LearningHistoryEntry event(int? generation) => LearningHistoryEntry(
        eventId: LearningHistoryEntry.newEventId(),
        generation: generation,
        questionId: 'q1',
        isCorrect: true,
        source: LearningActivitySource.practice,
        occurredAtEpochMs: 1760000000000,
      );

  const active = LearningHistoryGenerationState(
    generation: 2,
    status: 'active',
  );

  test('only current-generation entries are confirmed and acknowledged',
      () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession()..bindUser('user-a');
    final stale = event(1);
    final unknown = event(null);
    final current = event(2);
    for (final item in <LearningHistoryEntry>[stale, unknown, current]) {
      await queue.enqueue('user-a', item);
    }

    final writes = <String>[];
    final service = LearningHistoryOutboxSyncService(
      queue: queue,
      session: session,
      readGeneration: (_) async => active,
      writeOrConfirm: (_, item) async {
        writes.add(item.eventId!);
      },
    );

    expect(await service.sync('user-a'), 1);
    expect(writes, <String>[current.eventId!]);
    final retained = await queue.pending('user-a');
    expect(retained.map((item) => item.eventId).toSet(), <String?>{
      stale.eventId,
      unknown.eventId,
    });
  });

  test('resetting generation prevents writes and preserves events',
      () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession()..bindUser('user-a');
    final current = event(2);
    await queue.enqueue('user-a', current);
    var wrote = false;
    final service = LearningHistoryOutboxSyncService(
      queue: queue,
      session: session,
      readGeneration: (_) async => const LearningHistoryGenerationState(
        generation: 2,
        status: 'resetting',
      ),
      writeOrConfirm: (_, __) async {
        wrote = true;
      },
    );

    expect(await service.sync('user-a'), 0);
    expect(wrote, isFalse);
    expect((await queue.pending('user-a')).single.eventId, current.eventId);
  });

  test('failed write keeps identical event available for retry', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession()..bindUser('user-a');
    final current = event(2);
    await queue.enqueue('user-a', current);

    final service = LearningHistoryOutboxSyncService(
      queue: queue,
      session: session,
      readGeneration: (_) async => active,
      writeOrConfirm: (_, __) async {
        throw StateError('network failure');
      },
    );

    await expectLater(service.sync('user-a'), throwsStateError);
    final remaining = await PendingLearningHistoryQueue(prefs)
        .pending('user-a');
    expect(remaining.single.eventId, current.eventId);
    expect(remaining.single.generation, 2);
  });

  test('account switch during upload leaves event unacknowledged', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession()..bindUser('user-a');
    final current = event(2);
    await queue.enqueue('user-a', current);

    final service = LearningHistoryOutboxSyncService(
      queue: queue,
      session: session,
      readGeneration: (_) async => active,
      writeOrConfirm: (_, __) async {
        session.bindUser('user-b');
      },
    );
    await expectLater(service.sync('user-a'), throwsStateError);
    expect((await queue.pending('user-a')).single.eventId, current.eventId);
    expect(await queue.pending('user-b'), isEmpty);
  });

  test('server read failure leaves queue intact without sending', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession()..bindUser('user-a');
    final current = event(2);
    await queue.enqueue('user-a', current);
    var calls = 0;

    final service = LearningHistoryOutboxSyncService(
      queue: queue,
      session: session,
      readGeneration: (_) async => throw StateError('offline'),
      writeOrConfirm: (_, __) async {
        calls++;
      },
    );

    await expectLater(service.sync('user-a'), throwsStateError);
    expect(calls, 0);
    expect(session.verifiedState, isNull);
    expect((await queue.pending('user-a')).single.eventId, current.eventId);
  });

  test('mismatched user cannot read or send queued events', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final session = LearningHistoryGenerationSession()..bindUser('user-b');
    var calls = 0;
    final service = LearningHistoryOutboxSyncService(
      queue: queue,
      session: session,
      readGeneration: (_) async {
        calls++;
        return active;
      },
      writeOrConfirm: (_, __) async {
        calls++;
      },
    );

    await expectLater(service.sync('user-a'), throwsStateError);
    expect(calls, 0);
  });
}
