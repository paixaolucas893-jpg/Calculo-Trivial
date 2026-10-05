import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/localized_derivatives_exercise_content.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';

void main() {
  test('todas as cinquenta questões de Derivadas possuem versão em inglês', () {
    expect(mockDerivativesExercises, hasLength(50));

    for (final exercise in mockDerivativesExercises) {
      final localized = localizeDerivativesExerciseContent(
        exercise,
        const Locale('en'),
      );

      expect(localized.title.contains('Question'), isTrue);
      expect(localized.title.contains('Questão'), isFalse);
      expect(localized.statement.trim(), isNotEmpty);
      expect(localized.explanation.trim(), isNotEmpty);
      expect(localized.skill?.trim(), isNotEmpty);
    }
  });
}
