import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/localized_continuity_course_data.dart';
import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

void main() {
  group('Integridade do curso de Continuidade', () {
    test('possui sete aulas autorais e progressivas', () {
      expect(continuityCourseLessons, hasLength(7));

      final ids = continuityCourseLessons.map((lesson) => lesson.id).toList();

      expect(ids.toSet(), hasLength(ids.length));
      expect(
        ids,
        equals([
          'continuidade-01-significado',
          'continuidade-02-dominio',
          'continuidade-03-descontinuidades',
          'continuidade-04-partes',
          'continuidade-05-parametros',
          'continuidade-06-valor-intermediario',
          'continuidade-07-sintese',
        ]),
      );
    });

    test('todas as aulas possuem estrutura pedagógica completa', () {
      for (final lesson in continuityCourseLessons) {
        expect(lesson.topicId, 'continuidade');
        expect(lesson.title.trim(), isNotEmpty);
        expect(lesson.description.trim(), isNotEmpty);
        expect(lesson.objective.trim(), isNotEmpty);
        expect(
          lesson.sections.length,
          greaterThanOrEqualTo(10),
          reason: '${lesson.id} ainda está curta demais para o padrão universitário.',
        );
        expect(
          lesson.takeaways.length,
          greaterThanOrEqualTo(7),
          reason: '${lesson.id} precisa de síntese conceitual mais robusta.',
        );
        expect(
          lesson.duration,
          isNot(equals('≈ 5 min')),
          reason: '${lesson.id} ainda usa duração do formato resumido.',
        );
        expect(lesson.closing.trim(), isNotEmpty);

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


    test('todas as aulas mantêm ao menos quatro exemplos resolvidos em PT e EN', () {
      final catalogs = <List<CourseLessonData>>[
        continuityCourseLessons,
        englishContinuityCourseLessons,
      ];

      for (final lessons in catalogs) {
        for (final lesson in lessons) {
          final workedExamples = lesson.sections
              .expand((section) => section.blocks)
              .whereType<WorkedExampleBlockData>()
              .length;

          expect(
            workedExamples,
            greaterThanOrEqualTo(4),
            reason: '${lesson.id} precisa manter ao menos quatro exemplos resolvidos.',
          );
        }
      }
    });

    test('as quarenta e cinco atividades cobrem todas as aulas', () {
      final lessonIds = continuityCourseLessons
          .map((lesson) => lesson.id)
          .toSet();
      final coveredLessonIds = <String>{};

      expect(mockContinuityExercises, hasLength(45));

      for (final exercise in mockContinuityExercises) {
        expect(
          lessonIds,
          contains(exercise.contentLessonId),
          reason: '${exercise.id} aponta para uma aula inexistente.',
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
        equals(lessonIds),
        reason: 'Cada aula precisa ter ao menos uma atividade relacionada.',
      );
    });
    test('português e inglês mantêm IDs, ordem, duração e estrutura', () {
      final portuguese = continuityCourseLessons;
      final english = englishContinuityCourseLessons;

      expect(
        english.map((lesson) => lesson.id).toList(),
        equals(portuguese.map((lesson) => lesson.id).toList()),
      );
      expect(
        english.map((lesson) => lesson.duration).toList(),
        equals(portuguese.map((lesson) => lesson.duration).toList()),
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