import 'dart:math';

import 'package:calcquest/shared/domain/question_selection_engine.dart';

class ExerciseQuestionSelector {
  const ExerciseQuestionSelector._();

  static List<String> select({
    required Iterable<String> availableQuestionIds,
    Iterable<String> previousSessionIds = const <String>[],
    int questionCount = 10,
    Random? random,
  }) {
    return QuestionSelectionEngine.selectQuestionIds(
      availableQuestionIds: availableQuestionIds,
      primaryAvoidIds: previousSessionIds,
      questionCount: questionCount,
      random: random,
    );
  }
}
