import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/localized_limits_exercise_content.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';

void main() {
  test('todas as quarenta e cinco questões de Limites possuem versão em inglês', () {
    expect(mockLimitsExercises, hasLength(45));

    for (var index = 0; index < mockLimitsExercises.length; index++) {
      final exercise = mockLimitsExercises[index];
      final localized = localizeLimitsExerciseContent(
        exercise,
        const Locale('en'),
      );

      expect(
        localized.title,
        'Question ${index + 1} of 45',
        reason: '${exercise.id} não possui título inglês sincronizado.',
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