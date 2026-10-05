import 'dart:math';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';

class QuestionSelectionEngine {
  const QuestionSelectionEngine._();

  static List<String> selectQuestionIds({
    required Iterable<String> availableQuestionIds,
    Iterable<String> primaryAvoidIds = const <String>[],
    Iterable<String> secondaryAvoidIds = const <String>[],
    Iterable<String> excludedQuestionIds = const <String>[],
    int questionCount = 10,
    int? seed,
    Random? random,
  }) {
    assert(seed == null || random == null);

    if (questionCount <= 0) {
      return const <String>[];
    }

    final excludedIds = excludedQuestionIds.toSet();
    final uniqueQuestionIds = <String>[];
    final seen = <String>{};

    for (final questionId in availableQuestionIds) {
      if (excludedIds.contains(questionId) || !seen.add(questionId)) {
        continue;
      }
      uniqueQuestionIds.add(questionId);
    }

    if (uniqueQuestionIds.isEmpty) {
      return const <String>[];
    }

    final primaryAvoid = primaryAvoidIds.toSet();
    final secondaryAvoid = secondaryAvoidIds.toSet();
    final randomGenerator = random ?? Random(seed);

    List<String> shuffledWhere(bool Function(String id) predicate) {
      final ids = uniqueQuestionIds.where(predicate).toList()
        ..shuffle(randomGenerator);
      return ids;
    }

    final preferredFresh = shuffledWhere(
      (id) => !primaryAvoid.contains(id) && !secondaryAvoid.contains(id),
    );
    final preferredRepeated = shuffledWhere(
      (id) => !primaryAvoid.contains(id) && secondaryAvoid.contains(id),
    );
    final avoidedFresh = shuffledWhere(
      (id) => primaryAvoid.contains(id) && !secondaryAvoid.contains(id),
    );
    final avoidedRepeated = shuffledWhere(
      (id) => primaryAvoid.contains(id) && secondaryAvoid.contains(id),
    );

    final targetCount = min(questionCount, uniqueQuestionIds.length);

    return <String>[
      ...preferredFresh,
      ...preferredRepeated,
      ...avoidedFresh,
      ...avoidedRepeated,
    ].take(targetCount).toList(growable: false);
  }

  static List<QuestionCandidate> selectCandidates({
    required Iterable<QuestionCandidate> candidates,
    String? moduleId,
    String? topicId,
    String? subtopicId,
    Set<ExerciseDifficulty>? difficulties,
    Iterable<String> primaryAvoidIds = const <String>[],
    Iterable<String> secondaryAvoidIds = const <String>[],
    Iterable<String> excludedQuestionIds = const <String>[],
    int questionCount = 10,
    int? seed,
    Random? random,
  }) {
    final filteredCandidates = candidates.where((candidate) {
      final metadata = candidate.metadata;

      if (moduleId != null && metadata.moduleId != moduleId) {
        return false;
      }
      if (topicId != null && metadata.topicId != topicId) {
        return false;
      }
      if (subtopicId != null && metadata.subtopicId != subtopicId) {
        return false;
      }
      if (difficulties != null &&
          difficulties.isNotEmpty &&
          !difficulties.contains(metadata.difficulty)) {
        return false;
      }

      return true;
    }).toList(growable: false);

    final candidatesById = <String, QuestionCandidate>{
      for (final candidate in filteredCandidates)
        candidate.questionId: candidate,
    };

    final selectedIds = selectQuestionIds(
      availableQuestionIds: filteredCandidates.map(
        (candidate) => candidate.questionId,
      ),
      primaryAvoidIds: primaryAvoidIds,
      secondaryAvoidIds: secondaryAvoidIds,
      excludedQuestionIds: excludedQuestionIds,
      questionCount: questionCount,
      seed: seed,
      random: random,
    );

    return selectedIds
        .map((questionId) => candidatesById[questionId])
        .whereType<QuestionCandidate>()
        .toList(growable: false);
  }
}
