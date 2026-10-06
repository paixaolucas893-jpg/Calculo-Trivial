import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/localized_algebra_course_content.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/precalculus_foundations_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

void main() {
  group('Integridade do curso de Álgebra Fundamental', () {
    test('possui dez aulas autorais e progressivas', () {
      expect(algebraCourseLessons, hasLength(10));

      final ids = algebraCourseLessons.map((lesson) => lesson.id).toList();

      expect(ids.toSet(), hasLength(ids.length));
      expect(
        ids,
        equals([
          'algebra-01-linguagem',
          'algebra-02-termos-semelhantes',
          'algebra-03-distributiva',
          'algebra-04-potencias',
          'algebra-09-monomios-polinomios',
          'algebra-10-operacoes-polinomios',
          'algebra-05-produtos-notaveis',
          'algebra-06-fatoracao',
          'algebra-07-fracoes-algebricas',
          'algebra-08-sintese',
        ]),
      );
    });

    test('português e inglês mantêm os mesmos IDs e a mesma ordem', () {
      final portugueseIds = algebraCourseLessons
          .map((lesson) => lesson.id)
          .toList();
      final englishIds = localizedAlgebraCourseLessons(
        const Locale('en'),
      ).map((lesson) => lesson.id).toList();

      expect(englishIds, equals(portugueseIds));
    });


    test('português e inglês mantêm paridade estrutural por aula', () {
      final englishLessons = localizedAlgebraCourseLessons(
        const Locale('en'),
      );

      for (var index = 0; index < algebraCourseLessons.length; index++) {
        final portuguese = algebraCourseLessons[index];
        final english = englishLessons[index];

        int workedExamples(CourseLessonData lesson) {
          return lesson.sections
              .expand((section) => section.blocks)
              .whereType<WorkedExampleBlockData>()
              .length;
        }

        expect(english.id, portuguese.id);
        expect(
          english.sections.length,
          portuguese.sections.length,
          reason: '${portuguese.id} precisa ter o mesmo número de seções em PT e EN.',
        );
        expect(
          workedExamples(english),
          workedExamples(portuguese),
          reason: '${portuguese.id} precisa ter o mesmo número de exemplos resolvidos em PT e EN.',
        );
        expect(
          english.takeaways.length,
          portuguese.takeaways.length,
          reason: '${portuguese.id} precisa ter a mesma síntese conceitual em PT e EN.',
        );
        expect(
          english.duration,
          portuguese.duration,
          reason: '${portuguese.id} precisa manter a mesma duração estimada em PT e EN.',
        );
        expect(
          english.check.choices.length,
          portuguese.check.choices.length,
          reason: '${portuguese.id} precisa manter o mesmo formato de check em PT e EN.',
        );
      }
    });

    test('todas as aulas seguem estrutura universitária completa', () {
      for (final lesson in algebraCourseLessons) {
        expect(lesson.topicId, 'algebra-fundamental');
        expect(lesson.title.trim(), isNotEmpty);
        expect(lesson.description.trim(), isNotEmpty);
        expect(lesson.objective.trim(), isNotEmpty);
        expect(
          lesson.sections.length,
          greaterThanOrEqualTo(8),
          reason: '${lesson.id} ainda está curta demais.',
        );
        expect(
          lesson.takeaways.length,
          greaterThanOrEqualTo(5),
          reason: '${lesson.id} precisa de síntese conceitual mais robusta.',
        );
        expect(lesson.closing.trim(), isNotEmpty);
        expect(
          lesson.duration.trim(),
          isNot(equals('≈ 5 min')),
          reason: '${lesson.id} ainda usa duração do formato resumido antigo.',
        );

        for (final section in lesson.sections) {
          expect(section.title.trim(), isNotEmpty);
          expect(section.blocks, isNotEmpty);
        }

        expect(lesson.check.question.trim(), isNotEmpty);
        expect(lesson.check.choices.length, greaterThanOrEqualTo(3));
        expect(lesson.check.correctIndex, greaterThanOrEqualTo(0));
        expect(
          lesson.check.correctIndex,
          lessThan(lesson.check.choices.length),
        );
        expect(lesson.check.explanation.trim(), isNotEmpty);
      }
    });


    test('todas as aulas possuem base acadêmica explícita em PT e EN', () {
      final catalogs = <List<CourseLessonData>>[
        algebraCourseLessons,
        localizedAlgebraCourseLessons(const Locale('en')),
      ];

      for (final lessons in catalogs) {
        for (final lesson in lessons) {
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
            reason: '${lesson.id} precisa manter referência acadêmica explícita.',
          );
        }
      }
    });

    test('cada aula visível da trilha possui ao menos quatro questões', () {
      final visibleLessons = <CourseLessonData>[
        ...precalculusFoundationsCourseLessons,
        ...algebraCourseLessons.where(
          (lesson) => lesson.id != 'algebra-04-potencias',
        ),
      ];
      final countsByLesson = <String, int>{};

      for (final exercise in mockExercises) {
        final lessonId = exercise.contentLessonId!;
        countsByLesson[lessonId] = (countsByLesson[lessonId] ?? 0) + 1;
      }

      for (final lesson in visibleLessons) {
        expect(
          countsByLesson[lesson.id] ?? 0,
          greaterThanOrEqualTo(4),
          reason: '${lesson.id} precisa de cobertura suficiente para reduzir repetição.',
        );
      }

      expect(
        countsByLesson['algebra-04-potencias'] ?? 0,
        0,
        reason: 'A aula removida da trilha não deve continuar recebendo questões.',
      );
    });

    test('as sessenta e seis atividades cobrem somente aulas visíveis', () {
      final visibleLessonIds = <String>{
        ...precalculusFoundationsCourseLessons.map((lesson) => lesson.id),
        ...algebraCourseLessons
            .where((lesson) => lesson.id != 'algebra-04-potencias')
            .map((lesson) => lesson.id),
      };
      final coveredLessonIds = <String>{};

      expect(mockExercises, hasLength(66));

      for (final exercise in mockExercises) {
        expect(
          visibleLessonIds,
          contains(exercise.contentLessonId),
          reason: '${exercise.id} aponta para uma aula fora da trilha visível.',
        );
        expect(
          exercise.skill?.trim(),
          isNotEmpty,
          reason: '${exercise.id} não informa a habilidade avaliada.',
        );
        expect(
          exercise.explanation.trim().length,
          greaterThanOrEqualTo(60),
          reason: '${exercise.id} precisa de uma explicação mais completa.',
        );

        coveredLessonIds.add(exercise.contentLessonId!);
      }

      expect(
        coveredLessonIds,
        equals(visibleLessonIds),
        reason: 'Cada aula visível precisa ter cobertura no banco de prática.',
      );
    });
  });
}