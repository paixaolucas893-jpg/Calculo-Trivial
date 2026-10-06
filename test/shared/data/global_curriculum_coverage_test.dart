import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data.dart';
import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_foundations_course_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

typedef CurriculumCoverageSpec = ({
  String name,
  List<CourseLessonData> lessons,
  List<ExerciseData> questions,
  int minimumQuestionsPerLesson,
});

void main() {
  final coverageSpecs = <CurriculumCoverageSpec>[
    (
      name: 'Álgebra',
      lessons: <CourseLessonData>[
        ...precalculusFoundationsCourseLessons,
        ...algebraCourseLessons.where(
          (lesson) => lesson.id != 'algebra-04-potencias',
        ),
      ],
      questions: mockExercises,
      minimumQuestionsPerLesson: 4,
    ),
    (
      name: 'Equações e Inequações',
      lessons: <CourseLessonData>[
        ...equationsCourseLessons,
        ...precalculusEquationsSupplementLessons,
      ],
      questions: mockEquationsExercises,
      minimumQuestionsPerLesson: 4,
    ),
    (
      name: 'Funções',
      lessons: precalculusFunctionsCourseLessons,
      questions: mockFunctionsExercises,
      minimumQuestionsPerLesson: 3,
    ),
    (
      name: 'Limites',
      lessons: limitsCourseLessons,
      questions: mockLimitsExercises,
      minimumQuestionsPerLesson: 4,
    ),
    (
      name: 'Continuidade',
      lessons: continuityCourseLessons,
      questions: mockContinuityExercises,
      minimumQuestionsPerLesson: 4,
    ),
    (
      name: 'Derivadas',
      lessons: derivativesCourseLessons,
      questions: mockDerivativesExercises,
      minimumQuestionsPerLesson: 5,
    ),
  ];

  group('Cobertura curricular global', () {
    test('o currículo atual possui sessenta e duas aulas avaliáveis', () {
      final lessonIds = coverageSpecs
          .expand((spec) => spec.lessons)
          .map((lesson) => lesson.id)
          .toList();

      expect(lessonIds, hasLength(62));
      expect(
        lessonIds.toSet(),
        hasLength(lessonIds.length),
        reason:
            'A mesma aula canônica não deve ser duplicada entre os conjuntos '
            'avaliáveis atuais.',
      );
      expect(
        lessonIds,
        isNot(contains('algebra-04-potencias')),
        reason:
            'A aula legada de potências não aparece na jornada atual e não '
            'deve ser tratada como conteúdo avaliável separado.',
      );
    });

    for (final spec in coverageSpecs) {
      test('${spec.name} não possui questões órfãs', () {
        final lessonIds = spec.lessons.map((lesson) => lesson.id).toSet();

        for (final question in spec.questions) {
          expect(
            question.contentLessonId?.trim(),
            isNotEmpty,
            reason:
                '${spec.name}: ${question.id} precisa informar '
                'contentLessonId.',
          );
          expect(
            lessonIds,
            contains(question.contentLessonId),
            reason:
                '${spec.name}: ${question.id} aponta para uma aula que não '
                'faz parte do conjunto avaliável atual.',
          );
        }
      });

      test('${spec.name} cobre todas as aulas avaliáveis', () {
        final countsByLesson = <String, int>{};

        for (final question in spec.questions) {
          final lessonId = question.contentLessonId!;
          countsByLesson[lessonId] = (countsByLesson[lessonId] ?? 0) + 1;
        }

        for (final lesson in spec.lessons) {
          expect(
            countsByLesson[lesson.id] ?? 0,
            greaterThanOrEqualTo(spec.minimumQuestionsPerLesson),
            reason:
                '${spec.name}: ${lesson.id} precisa manter pelo menos '
                '${spec.minimumQuestionsPerLesson} questões no banco atual.',
          );
        }

        expect(
          countsByLesson.keys.toSet(),
          equals(spec.lessons.map((lesson) => lesson.id).toSet()),
          reason:
              '${spec.name}: a cobertura do banco precisa corresponder '
              'exatamente às aulas avaliáveis atuais.',
        );
      });
    }

    test('nenhum ID de questão é reutilizado entre bancos', () {
      final questionIds = coverageSpecs
          .expand((spec) => spec.questions)
          .map((question) => question.id)
          .toList();

      expect(
        questionIds.toSet(),
        hasLength(questionIds.length),
        reason:
            'IDs de questões precisam permanecer globalmente únicos para '
            'progresso, revisão e diagnóstico futuro.',
      );
    });
  });
}
