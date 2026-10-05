import 'dart:math';

import 'package:calcquest/shared/domain/question_selection_engine.dart';

class FinalTestQuestionSelector {
  const FinalTestQuestionSelector._();

  static List<String> select({
    required Iterable<String> availableQuestionIds,
    Iterable<String> practiceQuestionIds = const <String>[],
    Iterable<String> previousFinalTestIds = const <String>[],
    int questionCount = 10,
    Random? random,
  }) {
    return QuestionSelectionEngine.selectQuestionIds(
      availableQuestionIds: availableQuestionIds,
      primaryAvoidIds: practiceQuestionIds,
      secondaryAvoidIds: previousFinalTestIds,
      questionCount: questionCount,
      random: random,
    );
  }
}
