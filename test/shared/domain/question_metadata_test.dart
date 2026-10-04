import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';

void main() {
  group('QuestionMetadataAdapter', () {
    test('adapts a legacy exercise without changing the exercise model', () {
      const exercise = ExerciseData(
        id: 'legacy-q1',
        title: 'Questão',
        statement: '2 + 2 = ?',
        options: <ExerciseOptionData>[
          ExerciseOptionData(id: 'a', text: '3'),
          ExerciseOptionData(id: 'b', text: '4'),
        ],
        correctOptionId: 'b',
        explanation: '2 + 2 = 4.',
        contentLessonId: 'algebra-01-linguagem',
        skill: 'Somar',
        difficulty: ExerciseDifficulty.foundation,
      );

      final candidate = QuestionMetadataAdapter.fromExercise(
        moduleId: 'algebra-fundamental',
        exercise: exercise,
      );

      expect(candidate.exercise, same(exercise));
      expect(candidate.questionId, 'legacy-q1');
      expect(candidate.metadata.moduleId, 'algebra-fundamental');
      expect(candidate.metadata.topicId, isNull);
      expect(candidate.metadata.subtopicId, 'algebra-01-linguagem');
      expect(candidate.metadata.skill, 'Somar');
      expect(candidate.metadata.difficulty, ExerciseDifficulty.foundation);
      expect(candidate.metadata.questionType, QuestionType.multipleChoice);
      expect(candidate.metadata.sourceReference, isNull);
      expect(candidate.correctAnswer, 'b');
      expect(candidate.explanation, '2 + 2 = 4.');
    });

    test('supports progressive metadata overrides', () {
      const exercise = ExerciseData(
        id: 'derivada-cadeia-1',
        title: 'Questão',
        statement: 'Derive f(x).',
        options: <ExerciseOptionData>[
          ExerciseOptionData(id: 'a', text: 'A'),
          ExerciseOptionData(id: 'b', text: 'B'),
        ],
        correctOptionId: 'a',
        explanation: 'Aplicação da regra da cadeia.',
        contentLessonId: 'derivadas-04-regra-da-cadeia',
        skill: 'Aplicar regra da cadeia',
        difficulty: ExerciseDifficulty.intermediate,
      );

      final candidate = QuestionMetadataAdapter.fromExercise(
        moduleId: 'derivadas',
        exercise: exercise,
        metadataOverride: const QuestionMetadataOverride(
          topicId: 'regras-de-derivacao',
          subtopicId: 'regra-da-cadeia',
          sourceReference: 'OpenStax Calculus',
        ),
      );

      expect(candidate.metadata.topicId, 'regras-de-derivacao');
      expect(candidate.metadata.subtopicId, 'regra-da-cadeia');
      expect(candidate.metadata.sourceReference, 'OpenStax Calculus');
    });

    test('adapts all current question banks without migration', () {
      final catalogs = <String, List<ExerciseData>>{
        'algebra-fundamental': mockExercises,
        'equacoes-inequacoes': mockEquationsExercises,
        'funcoes': mockFunctionsExercises,
        'limites': mockLimitsExercises,
        'continuidade': mockContinuityExercises,
        'derivadas': mockDerivativesExercises,
      };

      final candidates = <QuestionCandidate>[
        for (final entry in catalogs.entries)
          ...QuestionMetadataAdapter.fromExercises(
            moduleId: entry.key,
            exercises: entry.value,
          ),
      ];

      expect(candidates, hasLength(136));
      expect(
        candidates.every(
          (candidate) =>
              candidate.questionId.isNotEmpty &&
              candidate.metadata.moduleId.isNotEmpty &&
              candidate.metadata.skill?.isNotEmpty == true &&
              candidate.metadata.subtopicId?.isNotEmpty == true,
        ),
        isTrue,
      );
    });
  });
}
