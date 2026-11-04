import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/learning_history_attempt_factory.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

void main() {
  const factory = LearningHistoryAttemptFactory();
  final attemptDate = DateTime.utc(2026, 11, 4, 10);

  test('attempt captures active origin generation before it is queued', () {
    final event = factory.create(
      generationState: const LearningHistoryGenerationState(
        generation: 4,
        status: 'active',
      ),
      questionId: 'q-1',
      isCorrect: true,
      source: LearningActivitySource.practice,
      occurredAt: attemptDate,
    );

    expect(event.generation, 4);
    expect(event.eventId, isNotNull);
    expect(event.occurredAtEpochMs, attemptDate.millisecondsSinceEpoch);
    expect(LearningHistoryEntry.fromJson(event.toJson())?.generation, 4);
  });

  test('resetting state refuses to create an uploadable event', () {
    expect(
      () => factory.create(
        generationState: const LearningHistoryGenerationState(
          generation: 4,
          status: 'resetting',
        ),
        questionId: 'q-1',
        isCorrect: true,
        source: LearningActivitySource.practice,
        occurredAt: attemptDate,
      ),
      throwsStateError,
    );
  });

  test('legacy generation is explicitly stamped zero', () {
    final event = factory.create(
      generationState: LearningHistoryGenerationState.legacy,
      questionId: 'q-1',
      isCorrect: false,
      source: LearningActivitySource.personalizedReview,
      occurredAt: attemptDate,
    );
    expect(event.generation, 0);
  });

  test('separate attempts have stable and distinct event IDs', () {
    final first = factory.create(
      generationState: LearningHistoryGenerationState.legacy,
      questionId: 'q-1',
      isCorrect: true,
      source: LearningActivitySource.practice,
      occurredAt: attemptDate,
    );
    final second = factory.create(
      generationState: LearningHistoryGenerationState.legacy,
      questionId: 'q-1',
      isCorrect: true,
      source: LearningActivitySource.practice,
      occurredAt: attemptDate,
    );
    expect(first.eventId, isNot(second.eventId));
  });
}
