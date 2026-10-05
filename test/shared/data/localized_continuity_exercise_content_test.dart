import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/localized_continuity_exercise_content.dart';
import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';

void main() {
  test('todas as quarenta e cinco questões de Continuidade possuem versão em inglês', () {
    expect(mockContinuityExercises, hasLength(45));

    for (final exercise in mockContinuityExercises) {
      final localized = localizeContinuityExerciseContent(
        exercise,
        const Locale('en'),
      );

      expect(
        localized.title.contains('Question'),
        isTrue,
        reason: '${exercise.id} não possui título inglês.',
      );
      expect(
        localized.title.contains('Questão'),
        isFalse,
        reason: '${exercise.id} caiu no fallback em português.',
      );
      expect(localized.statement.trim(), isNotEmpty);
      expect(localized.explanation.trim(), isNotEmpty);
      expect(localized.skill?.trim(), isNotEmpty);
    }
  });
}