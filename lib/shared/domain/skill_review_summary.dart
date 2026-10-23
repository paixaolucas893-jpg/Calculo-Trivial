enum SkillReviewGroupingBasis {
  skill,
  subtopic,
  question,
}

class SkillReviewSummary {
  final String key;
  final SkillReviewGroupingBasis groupingBasis;
  final String label;
  final List<String> moduleIds;
  final List<String> contentLessonIds;
  final List<String> questionIds;
  final int attemptedQuestionCount;
  final int totalAttempts;
  final int correct;
  final int incorrect;
  final int unresolvedQuestionCount;
  final int recentCorrect;
  final int recentIncorrect;
  final int? lastOccurredAtEpochMs;

  const SkillReviewSummary({
    required this.key,
    required this.groupingBasis,
    required this.label,
    required this.moduleIds,
    required this.contentLessonIds,
    required this.questionIds,
    required this.attemptedQuestionCount,
    required this.totalAttempts,
    required this.correct,
    required this.incorrect,
    required this.unresolvedQuestionCount,
    required this.recentCorrect,
    required this.recentIncorrect,
    required this.lastOccurredAtEpochMs,
  });

  int get recentAttempts => recentCorrect + recentIncorrect;

  bool get hasEvidence => totalAttempts > 0 || recentAttempts > 0;

  bool get hasUnresolvedError => unresolvedQuestionCount > 0;

  bool get hasRecentError => recentIncorrect > 0;

  double get accuracy {
    if (totalAttempts <= 0) return 0;

    return (correct / totalAttempts).clamp(0.0, 1.0).toDouble();
  }
}
