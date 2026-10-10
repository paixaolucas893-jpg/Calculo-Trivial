import 'package:calcquest/shared/domain/question_metadata.dart';

enum SmartReviewReason {
  unresolvedError,
  repeatedSkillError,
  lowAccuracy,
  reinforcement,
}

class SmartReviewPlanItem {
  final QuestionCandidate candidate;
  final String skillKey;
  final String skillLabel;
  final SmartReviewReason reason;

  const SmartReviewPlanItem({
    required this.candidate,
    required this.skillKey,
    required this.skillLabel,
    required this.reason,
  });

  String get questionId => candidate.questionId;
}
