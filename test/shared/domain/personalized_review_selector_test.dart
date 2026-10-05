import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/personalized_review_selector.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';

QuestionCandidate candidate(
  String id,
  ExerciseDifficulty difficulty,
) {
  return QuestionMetadataAdapter.fromExercise(
    moduleId: 'module',
    exercise: ExerciseData(
      id: id,
      title: id,
      statement: id,
      options: const <ExerciseOptionData>[
        ExerciseOptionData(id: 'a', text: 'A'),
        ExerciseOptionData(id: 'b', text: 'B'),
        ExerciseOptionData(id: 'c', text: 'C'),
        ExerciseOptionData(id: 'd', text: 'D'),
      ],
      correctOptionId: 'a',
      explanation: 'Explanation',
      contentLessonId: 'lesson',
      skill: 'skill',
      difficulty: difficulty,
    ),
  );
}

void main() {
  group('PersonalizedReviewSelector', () {
    test('seleciona apenas questões que ainda precisam de revisão', () {
      final candidates = <QuestionCandidate>[
        candidate('weak', ExerciseDifficulty.foundation),
        candidate('mastered', ExerciseDifficulty.challenge),
        candidate('never-wrong', ExerciseDifficulty.intermediate),
      ];

      final selected = PersonalizedReviewSelector.select(
        candidates: candidates,
        performanceByQuestionId: const <String, QuestionPerformance>{
          'weak': QuestionPerformance(
            attempts: 2,
            correct: 1,
            incorrect: 1,
            lastAnswerCorrect: true,
          ),
          'mastered': QuestionPerformance(
            attempts: 5,
            correct: 4,
            incorrect: 1,
            lastAnswerCorrect: true,
          ),
          'never-wrong': QuestionPerformance(
            attempts: 3,
            correct: 3,
            incorrect: 0,
            lastAnswerCorrect: true,
          ),
        },
      );

      expect(selected.map((item) => item.questionId), <String>['weak']);
    });

    test('prioriza erro não resolvido e maior taxa de erro', () {
      final candidates = <QuestionCandidate>[
        candidate('resolved', ExerciseDifficulty.challenge),
        candidate('unresolved-low', ExerciseDifficulty.foundation),
        candidate('unresolved-high', ExerciseDifficulty.intermediate),
      ];

      final selected = PersonalizedReviewSelector.select(
        candidates: candidates,
        performanceByQuestionId: const <String, QuestionPerformance>{
          'resolved': QuestionPerformance(
            attempts: 2,
            correct: 1,
            incorrect: 1,
            lastAnswerCorrect: true,
          ),
          'unresolved-low': QuestionPerformance(
            attempts: 4,
            correct: 3,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
          'unresolved-high': QuestionPerformance(
            attempts: 2,
            correct: 0,
            incorrect: 2,
            lastAnswerCorrect: false,
          ),
        },
      );

      expect(
        selected.map((item) => item.questionId),
        <String>['unresolved-high', 'unresolved-low', 'resolved'],
      );
    });

    test('evita a sessão anterior antes de repetir', () {
      final candidates = <QuestionCandidate>[
        candidate('old', ExerciseDifficulty.challenge),
        candidate('fresh', ExerciseDifficulty.foundation),
      ];

      final performance = <String, QuestionPerformance>{
        'old': const QuestionPerformance(
          attempts: 1,
          incorrect: 1,
          lastAnswerCorrect: false,
        ),
        'fresh': const QuestionPerformance(
          attempts: 1,
          incorrect: 1,
          lastAnswerCorrect: false,
        ),
      };

      final selected = PersonalizedReviewSelector.select(
        candidates: candidates,
        performanceByQuestionId: performance,
        previousSessionIds: const <String>['old'],
        questionCount: 1,
      );

      expect(selected.single.questionId, 'fresh');
    });

    test('limita a quantidade sem duplicar questões', () {
      final repeated = candidate('same', ExerciseDifficulty.challenge);
      final candidates = <QuestionCandidate>[
        repeated,
        repeated,
        candidate('other', ExerciseDifficulty.foundation),
      ];

      final selected = PersonalizedReviewSelector.select(
        candidates: candidates,
        performanceByQuestionId: const <String, QuestionPerformance>{
          'same': QuestionPerformance(
            attempts: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
          'other': QuestionPerformance(
            attempts: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        questionCount: 10,
      );

      expect(selected, hasLength(2));
      expect(selected.map((item) => item.questionId).toSet(), hasLength(2));
    });
  });
}
