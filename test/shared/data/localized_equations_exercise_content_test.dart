import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/localized_equations_exercise_content.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';

void main() {
  test('todas as cinquenta questões de Equações possuem versão em inglês', () {
    expect(mockEquationsExercises, hasLength(50));

    for (var index = 0; index < mockEquationsExercises.length; index++) {
      final exercise = mockEquationsExercises[index];
      final localized = localizeEquationsExerciseContent(
        exercise,
        const Locale('en'),
      );

      expect(
        localized.title,
        'Question ${index + 1} of 50',
        reason: '${exercise.id} não possui título inglês sincronizado.',
      );
      expect(
        localized.title.contains('Questão'),
        isFalse,
        reason: '${exercise.id} caiu no fallback em português.',
      );
      expect(
        localized.statement.trim(),
        isNotEmpty,
        reason: '${exercise.id} precisa de enunciado em inglês.',
      );
      expect(
        localized.explanation.trim().length,
        greaterThanOrEqualTo(50),
        reason: '${exercise.id} precisa de explicação inglesa completa.',
      );
    }
  });
}
