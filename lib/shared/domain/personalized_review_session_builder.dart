import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/personalized_review_selector.dart';
import 'package:calcquest/shared/domain/personalized_review_session_item.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';
import 'package:calcquest/shared/domain/smart_review_planner.dart';

class PersonalizedReviewSessionBuilder {
  const PersonalizedReviewSessionBuilder._();

  static List<QuestionCandidate> build({
    required Iterable<QuestionCandidate> candidates,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    Iterable<LearningHistoryEntry> learningHistory =
        const <LearningHistoryEntry>[],
    Iterable<String> previousSessionIds = const <String>[],
    Iterable<String> studiedContentLessonIds = const <String>[],
    int questionCount = 10,
  }) {
    return buildDetailed(
      candidates: candidates,
      performanceByQuestionId: performanceByQuestionId,
      learningHistory: learningHistory,
      previousSessionIds: previousSessionIds,
      studiedContentLessonIds: studiedContentLessonIds,
      questionCount: questionCount,
    )
        .map((item) => item.candidate)
        .toList(growable: false);
  }

  static List<PersonalizedReviewSessionItem> buildDetailed({
    required Iterable<QuestionCandidate> candidates,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    Iterable<LearningHistoryEntry> learningHistory =
        const <LearningHistoryEntry>[],
    Iterable<String> previousSessionIds = const <String>[],
    Iterable<String> studiedContentLessonIds = const <String>[],
    int questionCount = 10,
  }) {
    final smartPlan = SmartReviewPlanner.build(
      candidates: candidates,
      performanceByQuestionId: performanceByQuestionId,
      learningHistory: learningHistory,
      previousSessionIds: previousSessionIds,
      studiedContentLessonIds: studiedContentLessonIds,
      questionCount: questionCount,
    );

    if (smartPlan.isNotEmpty) {
      return smartPlan
          .map(PersonalizedReviewSessionItem.fromSmartReview)
          .toList(growable: false);
    }

    return PersonalizedReviewSelector.select(
      candidates: candidates,
      performanceByQuestionId: performanceByQuestionId,
      previousSessionIds: previousSessionIds,
      questionCount: questionCount,
    )
        .map(PersonalizedReviewSessionItem.fromLegacy)
        .toList(growable: false);
  }
}
