import 'dart:math';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';
import 'package:calcquest/shared/domain/skill_review_aggregator.dart';
import 'package:calcquest/shared/domain/skill_review_summary.dart';
import 'package:calcquest/shared/domain/smart_review_plan.dart';

class SmartReviewPlanner {
  const SmartReviewPlanner._();

  static List<SmartReviewPlanItem> build({
    required Iterable<QuestionCandidate> candidates,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    Iterable<LearningHistoryEntry> learningHistory =
        const <LearningHistoryEntry>[],
    Iterable<String> previousSessionIds = const <String>[],
    Iterable<String> studiedContentLessonIds = const <String>[],
    int questionCount = 10,
  }) {
    if (questionCount <= 0) {
      return const <SmartReviewPlanItem>[];
    }

    final uniqueCandidates = <String, QuestionCandidate>{};
    for (final candidate in candidates) {
      uniqueCandidates.putIfAbsent(candidate.questionId, () => candidate);
    }

    if (uniqueCandidates.isEmpty) {
      return const <SmartReviewPlanItem>[];
    }

    final history = learningHistory.toList(growable: false);
    final summaries = SkillReviewAggregator.build(
      candidates: uniqueCandidates.values,
      performanceByQuestionId: performanceByQuestionId,
      learningHistory: history,
    ).where(_isEligible).toList(growable: true)
      ..sort(_compareSummaries);

    if (summaries.isEmpty) {
      return const <SmartReviewPlanItem>[];
    }

    final previous = previousSessionIds.toSet();
    final studiedLessons = studiedContentLessonIds.toSet();

    final attemptedLessonIds = <String>{};
    final recentErrorQuestionIds = <String>{};

    for (final candidate in uniqueCandidates.values) {
      final performance = performanceByQuestionId[candidate.questionId];
      final lessonId = candidate.exercise.contentLessonId?.trim();

      if (performance?.hasAttempts == true &&
          lessonId != null &&
          lessonId.isNotEmpty) {
        attemptedLessonIds.add(lessonId);
      }
    }

    for (final entry in history) {
      if (!entry.isCorrect) {
        recentErrorQuestionIds.add(entry.questionId);
      }

      final lessonId = entry.contentLessonId?.trim();
      if (lessonId != null && lessonId.isNotEmpty) {
        attemptedLessonIds.add(lessonId);
      }
    }

    final candidateById = uniqueCandidates;
    final queues = <String, List<QuestionCandidate>>{};

    for (final summary in summaries) {
      final skillCandidates = summary.questionIds
          .map((questionId) => candidateById[questionId])
          .whereType<QuestionCandidate>()
          .where(
            (candidate) => _isContentAvailable(
              candidate: candidate,
              performanceByQuestionId: performanceByQuestionId,
              studiedLessonIds: studiedLessons,
              attemptedLessonIds: attemptedLessonIds,
            ),
          )
          .toList(growable: true);

      if (skillCandidates.isEmpty) {
        continue;
      }

      skillCandidates.sort(
        (a, b) => _compareCandidates(
          a,
          b,
          performanceByQuestionId: performanceByQuestionId,
          previousSessionIds: previous,
          recentErrorQuestionIds: recentErrorQuestionIds,
        ),
      );

      queues[summary.key] = skillCandidates;
    }

    if (queues.isEmpty) {
      return const <SmartReviewPlanItem>[];
    }

    final targetCount = min(questionCount, uniqueCandidates.length);
    final selected = <SmartReviewPlanItem>[];
    final selectedIds = <String>{};

    var madeProgress = true;

    while (selected.length < targetCount && madeProgress) {
      madeProgress = false;

      for (final summary in summaries) {
        if (selected.length >= targetCount) {
          break;
        }

        final queue = queues[summary.key];
        if (queue == null || queue.isEmpty) {
          continue;
        }

        QuestionCandidate? next;

        while (queue.isNotEmpty && next == null) {
          final candidate = queue.removeAt(0);
          if (selectedIds.add(candidate.questionId)) {
            next = candidate;
          }
        }

        if (next == null) {
          continue;
        }

        selected.add(
          SmartReviewPlanItem(
            candidate: next,
            skillKey: summary.key,
            skillLabel: summary.label,
            reason: _reasonFor(summary),
          ),
        );
        madeProgress = true;
      }
    }

    return List<SmartReviewPlanItem>.unmodifiable(selected);
  }

  static bool _isEligible(SkillReviewSummary summary) {
    if (summary.incorrect <= 0) {
      return false;
    }

    return summary.hasUnresolvedError ||
        summary.hasRecentError ||
        summary.accuracy < 0.80;
  }

  static int _compareSummaries(
    SkillReviewSummary a,
    SkillReviewSummary b,
  ) {
    final unresolvedCompare = b.unresolvedQuestionCount.compareTo(
      a.unresolvedQuestionCount,
    );
    if (unresolvedCompare != 0) return unresolvedCompare;

    final recentErrorCompare = b.recentIncorrect.compareTo(a.recentIncorrect);
    if (recentErrorCompare != 0) return recentErrorCompare;

    final accuracyCompare = a.accuracy.compareTo(b.accuracy);
    if (accuracyCompare != 0) return accuracyCompare;

    final incorrectCompare = b.incorrect.compareTo(a.incorrect);
    if (incorrectCompare != 0) return incorrectCompare;

    final aLast = a.lastOccurredAtEpochMs ?? 0;
    final bLast = b.lastOccurredAtEpochMs ?? 0;
    final recencyCompare = bLast.compareTo(aLast);
    if (recencyCompare != 0) return recencyCompare;

    return a.key.compareTo(b.key);
  }

  static bool _isContentAvailable({
    required QuestionCandidate candidate,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    required Set<String> studiedLessonIds,
    required Set<String> attemptedLessonIds,
  }) {
    final performance = performanceByQuestionId[candidate.questionId];

    if (performance?.hasAttempts == true) {
      return true;
    }

    final lessonId = candidate.exercise.contentLessonId?.trim();

    if (lessonId == null || lessonId.isEmpty) {
      return false;
    }

    return studiedLessonIds.contains(lessonId) ||
        attemptedLessonIds.contains(lessonId);
  }

  static int _compareCandidates(
    QuestionCandidate a,
    QuestionCandidate b, {
    required Map<String, QuestionPerformance> performanceByQuestionId,
    required Set<String> previousSessionIds,
    required Set<String> recentErrorQuestionIds,
  }) {
    final aPrevious = previousSessionIds.contains(a.questionId) ? 1 : 0;
    final bPrevious = previousSessionIds.contains(b.questionId) ? 1 : 0;
    if (aPrevious != bPrevious) return aPrevious.compareTo(bPrevious);

    final aUnresolved =
        performanceByQuestionId[a.questionId]?.lastAnswerCorrect == false;
    final bUnresolved =
        performanceByQuestionId[b.questionId]?.lastAnswerCorrect == false;

    final aDirectRetry = aUnresolved || recentErrorQuestionIds.contains(a.questionId)
        ? 1
        : 0;
    final bDirectRetry = bUnresolved || recentErrorQuestionIds.contains(b.questionId)
        ? 1
        : 0;
    if (aDirectRetry != bDirectRetry) {
      return aDirectRetry.compareTo(bDirectRetry);
    }

    final difficultyCompare = _difficultyRank(
      a.metadata.difficulty,
    ).compareTo(_difficultyRank(b.metadata.difficulty));
    if (difficultyCompare != 0) return difficultyCompare;

    final aAttempted =
        performanceByQuestionId[a.questionId]?.hasAttempts == true ? 1 : 0;
    final bAttempted =
        performanceByQuestionId[b.questionId]?.hasAttempts == true ? 1 : 0;
    if (aAttempted != bAttempted) return aAttempted.compareTo(bAttempted);

    return a.questionId.compareTo(b.questionId);
  }

  static int _difficultyRank(ExerciseDifficulty difficulty) {
    return switch (difficulty) {
      ExerciseDifficulty.foundation => 0,
      ExerciseDifficulty.intermediate => 1,
      ExerciseDifficulty.challenge => 2,
    };
  }

  static SmartReviewReason _reasonFor(SkillReviewSummary summary) {
    if (summary.unresolvedQuestionCount > 0) {
      return SmartReviewReason.unresolvedError;
    }

    if (summary.recentIncorrect >= 2 || summary.incorrect >= 2) {
      return SmartReviewReason.repeatedSkillError;
    }

    if (summary.accuracy < 0.80) {
      return SmartReviewReason.lowAccuracy;
    }

    return SmartReviewReason.reinforcement;
  }
}
