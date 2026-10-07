import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/data/precalculus_foundations_course_data.dart';
import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';

const exerciseBanks = [
  (name: 'Álgebra Fundamental', questions: mockExercises, expectedCount: 66),
  (
    name: 'Equações e Inequações',
    questions: mockEquationsExercises,
    expectedCount: 50,
  ),
  (name: 'Funções', questions: mockFunctionsExercises, expectedCount: 60),
  (name: 'Limites', questions: mockLimitsExercises, expectedCount: 45),
  (
    name: 'Continuidade',
    questions: mockContinuityExercises,
    expectedCount: 45,
  ),
  (name: 'Derivadas', questions: mockDerivativesExercises, expectedCount: 50),
];

void main() {
  group('Integridade dos bancos de exercícios', () {
    for (final bank in exerciseBanks) {
      test('${bank.name} possui a quantidade canônica de questões', () {
        expect(
          bank.questions,
          hasLength(bank.expectedCount),
          reason:
              '${bank.name} deve possuir exatamente ${bank.expectedCount} questões.',
        );
      });

      test('${bank.name} possui questões válidas', () {
        final questionIds = bank.questions
            .map((question) => question.id.trim())
            .toList();

        expect(
          questionIds.toSet(),
          hasLength(questionIds.length),
          reason: '${bank.name} possui IDs de questões duplicados.',
        );

        for (final question in bank.questions) {
          expect(
            question.id.trim(),
            isNotEmpty,
            reason: '${bank.name} possui uma questão sem ID.',
          );

          expect(
            question.statement.trim(),
            isNotEmpty,
            reason: 'A questão ${question.id} não possui enunciado.',
          );

          expect(
            question.explanation.trim(),
            isNotEmpty,
            reason: 'A questão ${question.id} não possui explicação.',
          );

          expect(
            question.options,
            hasLength(4),
            reason: 'A questão ${question.id} deve possuir 4 alternativas.',
          );

          final optionIds = question.options
              .map((option) => option.id.trim())
              .toList();

          final optionTexts = question.options
              .map((option) => option.text.trim())
              .toList();

          expect(
            optionIds.every((id) => id.isNotEmpty),
            isTrue,
            reason: 'A questão ${question.id} possui alternativa sem ID.',
          );

          expect(
            optionTexts.every((text) => text.isNotEmpty),
            isTrue,
            reason: 'A questão ${question.id} possui alternativa sem texto.',
          );

          expect(
            optionIds.toSet(),
            hasLength(optionIds.length),
            reason:
                'A questão ${question.id} possui IDs de alternativas duplicados.',
          );

          expect(
            optionTexts.toSet(),
            hasLength(optionTexts.length),
            reason: 'A questão ${question.id} possui alternativas repetidas.',
          );

          expect(
            optionIds.where((id) => id == question.correctOptionId),
            hasLength(1),
            reason:
                'A resposta correta da questão ${question.id} não corresponde '
                'a uma única alternativa.',
          );
        }
      });
    }


    test('Álgebra cobre exatamente as quatorze aulas visíveis da trilha', () {
      final visibleLessonIds = <String>{
        ...precalculusFoundationsCourseLessons.map((lesson) => lesson.id),
        ...algebraCourseLessons
            .where((lesson) => lesson.id != 'algebra-04-potencias')
            .map((lesson) => lesson.id),
      };

      final coveredLessonIds = mockExercises
          .map((question) => question.contentLessonId)
          .whereType<String>()
          .toSet();

      expect(visibleLessonIds, hasLength(14));
      expect(coveredLessonIds, equals(visibleLessonIds));
      expect(
        coveredLessonIds,
        isNot(contains('algebra-04-potencias')),
        reason:
            'A aula antiga de potências não aparece na trilha e não deve receber questões.',
      );
    });

    test('Equações cobre todas as onze aulas com metadados pedagógicos', () {
      final lessonIds = <String>{
        ...equationsCourseLessons.map((lesson) => lesson.id),
        ...precalculusEquationsSupplementLessons.map((lesson) => lesson.id),
      };
      final covered = <String>{};

      for (final question in mockEquationsExercises) {
        expect(
          question.contentLessonId?.trim(),
          isNotEmpty,
          reason: '${question.id} precisa informar contentLessonId.',
        );
        expect(
          question.skill?.trim(),
          isNotEmpty,
          reason: '${question.id} precisa informar a habilidade avaliada.',
        );
        expect(
          lessonIds,
          contains(question.contentLessonId),
          reason: '${question.id} aponta para uma aula inexistente.',
        );
        covered.add(question.contentLessonId!);
      }

      expect(
        covered,
        equals(lessonIds),
        reason: 'Cada uma das 11 aulas de Equações precisa ter ao menos uma atividade.',
      );
    });

    test('cada aula de Equações possui ao menos quatro questões', () {
      final countsByLesson = <String, int>{};

      for (final question in mockEquationsExercises) {
        final lessonId = question.contentLessonId!;
        countsByLesson[lessonId] = (countsByLesson[lessonId] ?? 0) + 1;
      }

      final lessonIds = <String>{
        ...equationsCourseLessons.map((lesson) => lesson.id),
        ...precalculusEquationsSupplementLessons.map((lesson) => lesson.id),
      };

      for (final lessonId in lessonIds) {
        expect(
          countsByLesson[lessonId] ?? 0,
          greaterThanOrEqualTo(4),
          reason: '$lessonId precisa de cobertura suficiente para reduzir repetição.',
        );
      }
    });

    test('Funções cobre todas as quatorze aulas com metadados pedagógicos', () {
      final lessonIds = precalculusFunctionsCourseLessons
          .map((lesson) => lesson.id)
          .toSet();
      final covered = <String>{};

      for (final question in mockFunctionsExercises) {
        expect(
          question.contentLessonId?.trim(),
          isNotEmpty,
          reason: '${question.id} precisa informar contentLessonId.',
        );
        expect(
          question.skill?.trim(),
          isNotEmpty,
          reason: '${question.id} precisa informar a habilidade avaliada.',
        );
        expect(
          lessonIds,
          contains(question.contentLessonId),
          reason: '${question.id} aponta para uma aula inexistente.',
        );

        covered.add(question.contentLessonId!);
      }

      expect(
        covered,
        equals(lessonIds),
        reason: 'Cada uma das 14 aulas de Funções precisa ter ao menos uma atividade.',
      );
    });

    test('cada aula de Funções possui ao menos três questões', () {
      final countsByLesson = <String, int>{};

      for (final question in mockFunctionsExercises) {
        final lessonId = question.contentLessonId!;
        countsByLesson[lessonId] = (countsByLesson[lessonId] ?? 0) + 1;
      }

      for (final lesson in precalculusFunctionsCourseLessons) {
        expect(
          countsByLesson[lesson.id] ?? 0,
          greaterThanOrEqualTo(3),
          reason: '${lesson.id} precisa de cobertura suficiente para reduzir repetição.',
        );
      }
    });

    test('todos os bancos possuem metadados pedagógicos completos', () {
      for (final bank in exerciseBanks) {
        for (final question in bank.questions) {
          expect(
            question.contentLessonId?.trim(),
            isNotEmpty,
            reason: '${bank.name}: ${question.id} precisa informar contentLessonId.',
          );
          expect(
            question.skill?.trim(),
            isNotEmpty,
            reason: '${bank.name}: ${question.id} precisa informar a habilidade avaliada.',
          );
        }
      }
    });

    test('todos os IDs de questões são globalmente únicos', () {
      final allQuestionIds = exerciseBanks
          .expand((bank) => bank.questions)
          .map((question) => question.id.trim())
          .toList();

      expect(
        allQuestionIds.toSet(),
        hasLength(allQuestionIds.length),
        reason: 'Existem IDs repetidos entre bancos de assuntos diferentes.',
      );
    });
  });
}