import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/smart_review_plan.dart';

enum PersonalizedReviewSelectionSource {
  smartReview,
  legacy,
}

class TutorReviewContext {
  final String moduleId;
  final String? contentLessonId;
  final String? skill;
  final ExerciseDifficulty difficulty;
  final SmartReviewReason reviewReason;

  const TutorReviewContext({
    required this.moduleId,
    required this.difficulty,
    required this.reviewReason,
    this.contentLessonId,
    this.skill,
  });
}

class PersonalizedReviewSessionItem {
  final QuestionCandidate candidate;
  final PersonalizedReviewSelectionSource source;
  final SmartReviewReason? reason;
  final String? skillKey;
  final String? skillLabel;
  final TutorReviewContext? tutorContext;

  const PersonalizedReviewSessionItem({
    required this.candidate,
    required this.source,
    this.reason,
    this.skillKey,
    this.skillLabel,
    this.tutorContext,
  });

  factory PersonalizedReviewSessionItem.fromSmartReview(
    SmartReviewPlanItem item,
  ) {
    final candidate = item.candidate;
    final exercise = candidate.exercise;

    return PersonalizedReviewSessionItem(
      candidate: candidate,
      source: PersonalizedReviewSelectionSource.smartReview,
      reason: item.reason,
      skillKey: item.skillKey,
      skillLabel: item.skillLabel,
      tutorContext: TutorReviewContext(
        moduleId: candidate.metadata.moduleId,
        contentLessonId: _normalized(exercise.contentLessonId),
        skill: _normalized(candidate.metadata.skill),
        difficulty: candidate.metadata.difficulty,
        reviewReason: item.reason,
      ),
    );
  }

  factory PersonalizedReviewSessionItem.fromLegacy(
    QuestionCandidate candidate,
  ) {
    return PersonalizedReviewSessionItem(
      candidate: candidate,
      source: PersonalizedReviewSelectionSource.legacy,
    );
  }

  String get questionId => candidate.questionId;

  static String? _normalized(String? value) {
    final normalized = value?.trim();

    if (normalized == null || normalized.isEmpty) {
      return null;
    }

    return normalized;
  }
}
