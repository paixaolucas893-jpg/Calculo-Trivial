import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/data/localized_limits_course_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';

void main() {
  group('Integridade do curso de Limites', () {
    test('possui oito aulas autorais e progressivas', () {
      expect(limitsCourseLessons, hasLength(8));

      final ids = limitsCourseLessons.map((lesson) => lesson.id).toList();

      expect(ids.toSet(), hasLength(ids.length));
      expect(
        ids,
        equals([
          'limites-01-intuicao',
          'limites-02-laterais',
          'limites-03-propriedades',
          'limites-04-fatoracao',
          'limites-05-racionalizacao',
          'limites-06-infinito',
          'limites-07-trigonometricos',
          'limites-08-sintese',
        ]),
      );
    });

    test('todas as aulas possuem conteúdo pedagógico completo', () {
      for (final lesson in limitsCourseLessons) {
        expect(lesson.topicId, 'limites');
        expect(lesson.title.trim(), isNotEmpty);
        expect(lesson.description.trim(), isNotEmpty);
        expect(lesson.objective.trim(), isNotEmpty);
        expect(
          lesson.sections.length,
          greaterThanOrEqualTo(8),
          reason: '${lesson.id} ainda está curta demais para o padrão universitário.',
        );
        expect(
          lesson.takeaways.length,
          greaterThanOrEqualTo(7),
          reason: '${lesson.id} precisa de uma síntese conceitual mais robusta.',
        );
        expect(
          lesson.duration,
          isNot(contains('5 min')),
          reason: '${lesson.id} ainda usa a duração do formato resumido.',
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

    test('português e inglês mantêm IDs, ordem e duração', () {
      final portuguese = limitsCourseLessons;
      final english = localizedLimitsCourseLessons(const Locale('en'));

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

    test('as quarenta e cinco atividades estão ligadas às aulas ensinadas', () {
      final lessonIds = limitsCourseLessons.map((lesson) => lesson.id).toSet();
      final coveredLessonIds = <String>{};

      expect(mockLimitsExercises, hasLength(45));

      for (final exercise in mockLimitsExercises) {
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
  });
}