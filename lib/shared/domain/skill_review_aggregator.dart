import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';
import 'package:calcquest/shared/domain/skill_review_summary.dart';

class SkillReviewAggregator {
  const SkillReviewAggregator._();

  static List<SkillReviewSummary> build({
    required Iterable<QuestionCandidate> candidates,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    Iterable<LearningHistoryEntry> learningHistory =
        const <LearningHistoryEntry>[],
  }) {
    final uniqueCandidates = <String, QuestionCandidate>{};

    for (final candidate in candidates) {
      uniqueCandidates.putIfAbsent(candidate.questionId, () => candidate);
    }

    final buckets = <String, _MutableSkillReviewSummary>{};
    final bucketByQuestionId = <String, _MutableSkillReviewSummary>{};

    for (final candidate in uniqueCandidates.values) {
      final grouping = _resolveGrouping(candidate);
      final bucket = buckets.putIfAbsent(
        grouping.key,
        () => _MutableSkillReviewSummary(
          key: grouping.key,
          groupingBasis: grouping.groupingBasis,
          label: grouping.label,
        ),
      );

      bucket.moduleIds.add(candidate.metadata.moduleId);

      final contentLessonId = candidate.exercise.contentLessonId?.trim();
      if (contentLessonId != null && contentLessonId.isNotEmpty) {
        bucket.contentLessonIds.add(contentLessonId);
      }

      bucket.questionIds.add(candidate.questionId);
      bucketByQuestionId[candidate.questionId] = bucket;

      final performance = performanceByQuestionId[candidate.questionId];

      if (performance == null || !performance.hasAttempts) {
        continue;
      }

      bucket.attemptedQuestionIds.add(candidate.questionId);
      bucket.totalAttempts += performance.attempts;
      bucket.correct += performance.correct;
      bucket.incorrect += performance.incorrect;

      if (performance.lastAnswerCorrect == false) {
        bucket.unresolvedQuestionIds.add(candidate.questionId);
      }
    }

    for (final entry in learningHistory) {
      final bucket = bucketByQuestionId[entry.questionId];

      if (bucket == null) {
        continue;
      }

      if (entry.isCorrect) {
        bucket.recentCorrect++;
      } else {
        bucket.recentIncorrect++;
      }

      final previousTimestamp = bucket.lastOccurredAtEpochMs;
      if (previousTimestamp == null ||
          entry.occurredAtEpochMs > previousTimestamp) {
        bucket.lastOccurredAtEpochMs = entry.occurredAtEpochMs;
      }
    }

    final summaries = buckets.values.map((bucket) => bucket.freeze()).toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return List<SkillReviewSummary>.unmodifiable(summaries);
  }

  static _ResolvedGrouping _resolveGrouping(QuestionCandidate candidate) {
    final rawSkill = candidate.metadata.skill?.trim();

    if (rawSkill != null && rawSkill.isNotEmpty) {
      return _ResolvedGrouping(
        key: 'skill:${_normalizedKeyPart(rawSkill)}',
        groupingBasis: SkillReviewGroupingBasis.skill,
        label: rawSkill,
      );
    }

    final rawSubtopic = candidate.metadata.subtopicId?.trim();

    if (rawSubtopic != null && rawSubtopic.isNotEmpty) {
      return _ResolvedGrouping(
        key: 'subtopic:${_normalizedKeyPart(rawSubtopic)}',
        groupingBasis: SkillReviewGroupingBasis.subtopic,
        label: rawSubtopic,
      );
    }

    final questionId = candidate.questionId.trim();

    return _ResolvedGrouping(
      key: 'question:${_normalizedKeyPart(questionId)}',
      groupingBasis: SkillReviewGroupingBasis.question,
      label: questionId,
    );
  }

  static String _normalizedKeyPart(String value) {
    return value.trim().toLowerCase();
  }
}

class _ResolvedGrouping {
  final String key;
  final SkillReviewGroupingBasis groupingBasis;
  final String label;

  const _ResolvedGrouping({
    required this.key,
    required this.groupingBasis,
    required this.label,
  });
}

class _MutableSkillReviewSummary {
  final String key;
  final SkillReviewGroupingBasis groupingBasis;
  final String label;
  final Set<String> moduleIds = <String>{};
  final Set<String> contentLessonIds = <String>{};
  final Set<String> questionIds = <String>{};
  final Set<String> attemptedQuestionIds = <String>{};
  final Set<String> unresolvedQuestionIds = <String>{};

  int totalAttempts = 0;
  int correct = 0;
  int incorrect = 0;
  int recentCorrect = 0;
  int recentIncorrect = 0;
  int? lastOccurredAtEpochMs;

  _MutableSkillReviewSummary({
    required this.key,
    required this.groupingBasis,
    required this.label,
  });

  SkillReviewSummary freeze() {
    final sortedModuleIds = moduleIds.toList()..sort();
    final sortedContentLessonIds = contentLessonIds.toList()..sort();
    final sortedQuestionIds = questionIds.toList()..sort();

    return SkillReviewSummary(
      key: key,
      groupingBasis: groupingBasis,
      label: label,
      moduleIds: List<String>.unmodifiable(sortedModuleIds),
      contentLessonIds: List<String>.unmodifiable(sortedContentLessonIds),
      questionIds: List<String>.unmodifiable(sortedQuestionIds),
      attemptedQuestionCount: attemptedQuestionIds.length,
      totalAttempts: totalAttempts,
      correct: correct,
      incorrect: incorrect,
      unresolvedQuestionCount: unresolvedQuestionIds.length,
      recentCorrect: recentCorrect,
      recentIncorrect: recentIncorrect,
      lastOccurredAtEpochMs: lastOccurredAtEpochMs,
    );
  }
}
