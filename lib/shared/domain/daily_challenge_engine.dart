import 'dart:math';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';

class DailyChallengeEngine {
  const DailyChallengeEngine._();

  static int seedForDate(DateTime date) {
    final local = date.toLocal();
    return local.year * 10000 + local.month * 100 + local.day;
  }

  static List<QuestionCandidate> select({
    required Iterable<QuestionCandidate> candidates,
    required Set<String> completedContentLessonIds,
    required DateTime date,
    int questionCount = 5,
  }) {
    if (questionCount <= 0 || completedContentLessonIds.isEmpty) {
      return const <QuestionCandidate>[];
    }

    final unique = <String, QuestionCandidate>{};

    for (final candidate in candidates) {
      final subtopicId = candidate.metadata.subtopicId;
      if (subtopicId == null ||
          !completedContentLessonIds.contains(subtopicId)) {
        continue;
      }
      unique.putIfAbsent(candidate.questionId, () => candidate);
    }

    if (unique.isEmpty) {
      return const <QuestionCandidate>[];
    }

    final random = Random(seedForDate(date));
    final all = unique.values.toList(growable: false);

    List<QuestionCandidate> shuffled(ExerciseDifficulty difficulty) {
      final items = all
          .where((candidate) => candidate.metadata.difficulty == difficulty)
          .toList();
      items.shuffle(random);
      return items;
    }

    final foundation = shuffled(ExerciseDifficulty.foundation);
    final intermediate = shuffled(ExerciseDifficulty.intermediate);
    final challenge = shuffled(ExerciseDifficulty.challenge);

    final selected = <QuestionCandidate>[];
    final selectedIds = <String>{};

    void takeFrom(List<QuestionCandidate> source, int count) {
      for (final candidate in source) {
        if (selected.length >= questionCount || count <= 0) break;
        if (!selectedIds.add(candidate.questionId)) continue;
        selected.add(candidate);
        count--;
      }
    }

    takeFrom(foundation, 2);
    takeFrom(intermediate, 2);
    takeFrom(challenge, 1);

    if (selected.length < questionCount) {
      final remaining = all
          .where((candidate) => !selectedIds.contains(candidate.questionId))
          .toList()
        ..shuffle(random);

      takeFrom(remaining, questionCount - selected.length);
    }

    selected.shuffle(Random(seedForDate(date) ^ 0x5f3759df));

    return selected.take(min(questionCount, selected.length)).toList(
          growable: false,
        );
  }
}
