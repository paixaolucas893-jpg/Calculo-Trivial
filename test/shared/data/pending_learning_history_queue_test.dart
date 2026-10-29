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
