import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/localized_functions_exercise_content.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';

void main() {
  test('todas as cinquenta questões de Funções possuem versão em inglês', () {
    expect(mockFunctionsExercises, hasLength(50));

    for (var index = 0; index < mockFunctionsExercises.length; index++) {
      final exercise = mockFunctionsExercises[index];
      final localized = localizeFunctionsExerciseContent(
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
        localized.explanation.trim(),
        isNotEmpty,
        reason: '${exercise.id} precisa de explicação em inglês.',
      );
    }
  });
}
