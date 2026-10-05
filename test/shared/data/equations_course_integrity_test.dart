import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/localized_equations_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

void main() {
  group('Integridade do curso base de Equações', () {
    test('possui oito aulas autorais e progressivas', () {
      expect(equationsCourseLessons, hasLength(8));

      final ids = equationsCourseLessons.map((lesson) => lesson.id).toList();

      expect(ids.toSet(), hasLength(ids.length));
      expect(
        ids,
        equals([
          'equations-01-equilibrio',
          'equations-02-primeiro-grau',
          'equations-03-parenteses-fracoes',
          'equations-04-casos-especiais',
          'equations-05-sistemas-lineares',
          'equations-06-quadraticas',
          'equations-07-inequacoes',
          'equations-08-modulo-revisao',
        ]),
      );
    });

    test('mantém profundidade acadêmica em PT e EN', () {
      final catalogs = <List<CourseLessonData>>[
        equationsCourseLessons,
        localizedEquationsCourseLessons(const Locale('en')),
      ];

      for (final lessons in catalogs) {
        for (final lesson in lessons) {
          expect(lesson.topicId, 'equacoes-inequacoes');
          expect(
            lesson.sections.length,
            greaterThanOrEqualTo(10),
            reason: '${lesson.id} ainda está curta demais.',
          );

          final workedExamples = lesson.sections
              .expand((section) => section.blocks)
              .whereType<WorkedExampleBlockData>()
              .length;

          expect(
            workedExamples,
            greaterThanOrEqualTo(4),
            reason: '${lesson.id} precisa manter ao menos quatro exemplos resolvidos.',
          );

          final referenceBlocks = lesson.sections
              .expand((section) => section.blocks)
              .whereType<ConceptBlockData>()
              .where(
                (block) =>
                    block.content.contains('OpenStax') &&
                    (block.content.contains('Sullivan') ||
                        block.content.contains('Blitzer')),
              )
              .length;

          expect(
            referenceBlocks,
            greaterThanOrEqualTo(1),
            reason: '${lesson.id} precisa manter base acadêmica explícita.',
          );

          expect(lesson.check.question.trim(), isNotEmpty);
          expect(lesson.takeaways.length, greaterThanOrEqualTo(5));
          expect(lesson.closing.trim(), isNotEmpty);
        }
      }
    });

    test('português e inglês mantêm IDs, ordem e estrutura', () {
      final portuguese = equationsCourseLessons;
      final english = localizedEquationsCourseLessons(const Locale('en'));

      expect(
        english.map((lesson) => lesson.id).toList(),
        equals(portuguese.map((lesson) => lesson.id).toList()),
      );

      for (var index = 0; index < portuguese.length; index++) {
        expect(
          english[index].sections.length,
          equals(portuguese[index].sections.length),
          reason: '${portuguese[index].id} deve manter paridade estrutural PT/EN.',
        );
      }
    });
  });
}
