import 'package:calcquest/shared/domain/personalized_review_selector.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';

class PersonalizedReviewSessionBuilder {
  const PersonalizedReviewSessionBuilder._();

  static List<QuestionCandidate> build({
    required Iterable<QuestionCandidate> candidates,
    required Map<String, QuestionPerformance> performanceByQuestionId,
    Iterable<String> previousSessionIds = const <String>[],
    int questionCount = 10,
  }) {
    return PersonalizedReviewSelector.select(
      candidates: candidates,
      performanceByQuestionId: performanceByQuestionId,
      previousSessionIds: previousSessionIds,
      questionCount: questionCount,
    );
  }
}
