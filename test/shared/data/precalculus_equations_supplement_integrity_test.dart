import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';

void main() {
  group('Integridade do suplemento de Equações de Pré-Cálculo', () {
    test('possui as três lacunas canônicas adicionadas', () {
      final ids = precalculusEquationsSupplementLessons
          .map((lesson) => lesson.id)
          .toList();

      expect(
        ids,
        equals([
          'equations-09-radicais',
          'equations-10-inequacoes-quadraticas',
          'equations-11-inequacoes-racionais',
        ]),
      );
    });

    test('todas as aulas seguem o padrão universitário completo', () {
      for (final lesson in precalculusEquationsSupplementLessons) {
        expect(lesson.topicId, 'equacoes-inequacoes');
        expect(lesson.objective.trim(), isNotEmpty);
        expect(
          lesson.sections.length,
          greaterThanOrEqualTo(10),
          reason: '${lesson.id} ainda está curta demais.',
        );
        expect(
          lesson.takeaways.length,
          greaterThanOrEqualTo(6),
          reason: '${lesson.id} precisa de síntese conceitual mais robusta.',
        );
        expect(
          lesson.duration,
          isNot(anyOf(contains('15 min'), contains('18 min'))),
          reason: '${lesson.id} ainda usa a duração do formato resumido.',
        );
        expect(lesson.check.question.trim(), isNotEmpty);
        expect(lesson.check.choices.length, greaterThanOrEqualTo(3));
        expect(
          lesson.check.correctIndex,
          inInclusiveRange(0, lesson.check.choices.length - 1),
        );
        expect(lesson.check.explanation.trim(), isNotEmpty);
      }
    });

    test('IDs e durações permanecem iguais em português e inglês', () {
      final portuguese = precalculusEquationsSupplementLessons;
      final english = localizedPrecalculusEquationsSupplementLessons(
        const Locale('en'),
      );

      expect(
        english.map((lesson) => lesson.id).toList(),
        equals(portuguese.map((lesson) => lesson.id).toList()),
      );

      expect(
        english.map((lesson) => lesson.duration).toList(),
        equals(portuguese.map((lesson) => lesson.duration).toList()),
      );
    });
  });
}
