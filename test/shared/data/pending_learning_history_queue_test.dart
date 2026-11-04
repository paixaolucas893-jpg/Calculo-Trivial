import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/data/pending_learning_history_queue.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  LearningHistoryEntry makeEvent(String id) => LearningHistoryEntry(
        eventId: id,
        questionId: 'q1',
        isCorrect: true,
        source: LearningActivitySource.practice,
        occurredAtEpochMs: 1760000000000,
      );

  test('pending events survive queue re-instantiation', () async {
    final prefs = await SharedPreferences.getInstance();
    final event = makeEvent(LearningHistoryEntry.newEventId());
    await PendingLearningHistoryQueue(prefs).enqueue('user-a', event);
    final restored = await PendingLearningHistoryQueue(prefs).pending('user-a');
    expect(restored.single.eventId, event.eventId);
  });

  test('enqueues same ID once and keeps user queues isolated', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final event = makeEvent(LearningHistoryEntry.newEventId());
    await Future.wait([
      queue.enqueue('user-a', event),
      queue.enqueue('user-a', event),
    ]);
    expect((await queue.pending('user-a')).length, 1);
    expect(await queue.pending('user-b'), isEmpty);
  });

  test('acknowledgement removes only the confirmed ID', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final first = makeEvent(LearningHistoryEntry.newEventId());
    final second = makeEvent(LearningHistoryEntry.newEventId());
    await queue.enqueue('user-a', first);
    await queue.enqueue('user-a', second);
    await queue.acknowledge('user-a', first.eventId!);
    expect((await queue.pending('user-a')).single.eventId, second.eventId);
  });

  test('clear discards only the selected user pending events', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final first = makeEvent(LearningHistoryEntry.newEventId());
    final second = makeEvent(LearningHistoryEntry.newEventId());
    await queue.enqueue('user-a', first);
    await queue.enqueue('user-b', second);

    await queue.clear('user-a');
    expect(await queue.pending('user-a'), isEmpty);
    expect((await queue.pending('user-b')).single.eventId, second.eventId);
    expect(prefs.containsKey('user-a_learning_history_pending_v1'), isFalse);
  });

  test('clear cannot be undone by previously queued enqueues', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    final pendingWrites = <Future<void>>[];
    for (var i = 0; i < 12; i++) {
      pendingWrites.add(
        queue.enqueue('user-a', makeEvent(LearningHistoryEntry.newEventId())),
      );
    }
    final clear = queue.clear('user-a');
    await Future.wait(<Future<void>>[...pendingWrites, clear]);
    expect(await queue.pending('user-a'), isEmpty);
  });

  test('requires a stable ID before queuing', () async {
    final prefs = await SharedPreferences.getInstance();
    final queue = PendingLearningHistoryQueue(prefs);
    expect(
      () => queue.enqueue(
        'user-a',
        const LearningHistoryEntry(
          questionId: 'q1',
          isCorrect: true,
          source: LearningActivitySource.practice,
          occurredAtEpochMs: 1760000000000,
        ),
      ),
      throwsArgumentError,
    );
  });
}
