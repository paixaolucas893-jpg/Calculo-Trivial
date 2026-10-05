import 'dart:math';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';

class PersonalizedReviewSelector {
  const PersonalizedReviewSelector._();

  static List<QuestionCandidate> select({
    required Iterable<QuestionCandidate> candidates,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    Iterable<String> previousSessionIds = const <String>[],
    int questionCount = 10,
  }) {
    if (questionCount <= 0) return const <QuestionCandidate>[];

    final previous = previousSessionIds.toSet();
    final unique = <String, QuestionCandidate>{};

    for (final candidate in candidates) {
      unique.putIfAbsent(candidate.questionId, () => candidate);
    }

    final eligible = unique.values.where((candidate) {
      return performanceByQuestionId[candidate.questionId]?.needsReview ?? false;
    }).toList(growable: false);

    int difficultyRank(ExerciseDifficulty difficulty) {
      return switch (difficulty) {
        ExerciseDifficulty.foundation => 0,
        ExerciseDifficulty.intermediate => 1,
        ExerciseDifficulty.challenge => 2,
      };
    }

    int compare(QuestionCandidate a, QuestionCandidate b) {
      final aPerformance = performanceByQuestionId[a.questionId]!;
      final bPerformance = performanceByQuestionId[b.questionId]!;

      final aUnresolved = aPerformance.lastAnswerCorrect == false ? 1 : 0;
      final bUnresolved = bPerformance.lastAnswerCorrect == false ? 1 : 0;
      if (aUnresolved != bUnresolved) return bUnresolved.compareTo(aUnresolved);

      final errorRateCompare =
          bPerformance.errorRate.compareTo(aPerformance.errorRate);
      if (errorRateCompare != 0) return errorRateCompare;

      final incorrectCompare =
          bPerformance.incorrect.compareTo(aPerformance.incorrect);
      if (incorrectCompare != 0) return incorrectCompare;

      final attemptsCompare =
          bPerformance.attempts.compareTo(aPerformance.attempts);
      if (attemptsCompare != 0) return attemptsCompare;

      final difficultyCompare = difficultyRank(
        b.metadata.difficulty,
      ).compareTo(difficultyRank(a.metadata.difficulty));
      if (difficultyCompare != 0) return difficultyCompare;

      return a.questionId.compareTo(b.questionId);
    }

    final fresh = eligible.where(
      (candidate) => !previous.contains(candidate.questionId),
    ).toList()
      ..sort(compare);

    final repeated = eligible.where(
      (candidate) => previous.contains(candidate.questionId),
    ).toList()
      ..sort(compare);

    final targetCount = min(questionCount, eligible.length);

    return <QuestionCandidate>[
      ...fresh,
      ...repeated,
    ].take(targetCount).toList(growable: false);
  }
}
