import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/personalized_review_session_builder.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';

QuestionCandidate _candidate({
  required String id,
  required String lessonId,
  required String skill,
  ExerciseDifficulty difficulty = ExerciseDifficulty.foundation,
}) {
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
      contentLessonId: lessonId,
      skill: skill,
      difficulty: difficulty,
    ),
  );
}

void main() {
  group('PersonalizedReviewSessionBuilder with Smart Review', () {
    test('prefere questão equivalente antes de repetir erro direto', () {
      final selected = PersonalizedReviewSessionBuilder.build(
        candidates: <QuestionCandidate>[
          _candidate(
            id: 'q-erro',
            lessonId: 'lesson-1',
            skill: 'Distributiva',
          ),
          _candidate(
            id: 'q-equivalente',
            lessonId: 'lesson-1',
            skill: 'Distributiva',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-erro': QuestionPerformance(
            attempts: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        learningHistory: const <LearningHistoryEntry>[
          LearningHistoryEntry(
            questionId: 'q-erro',
            contentLessonId: 'lesson-1',
            isCorrect: false,
            source: LearningActivitySource.practice,
            occurredAtEpochMs: 1760000000000,
          ),
        ],
        studiedContentLessonIds: const <String>['lesson-1'],
        questionCount: 1,
      );

      expect(selected, hasLength(1));
      expect(selected.single.questionId, 'q-equivalente');
    });

    test('não introduz questão nova de conteúdo ainda não estudado', () {
      final selected = PersonalizedReviewSessionBuilder.build(
        candidates: <QuestionCandidate>[
          _candidate(
            id: 'q-erro',
            lessonId: 'lesson-1',
            skill: 'Potências',
          ),
          _candidate(
            id: 'q-equivalente',
            lessonId: 'lesson-1',
            skill: 'Potências',
          ),
          _candidate(
            id: 'q-futura',
            lessonId: 'lesson-2',
            skill: 'Potências',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-erro': QuestionPerformance(
            attempts: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-1'],
        questionCount: 3,
      );

      expect(
        selected.map((candidate) => candidate.questionId),
        <String>['q-equivalente', 'q-erro'],
      );
    });

    test('reduz a sessão quando não há itens pedagógicos suficientes', () {
      final selected = PersonalizedReviewSessionBuilder.build(
        candidates: <QuestionCandidate>[
          _candidate(
            id: 'q-erro',
            lessonId: 'lesson-1',
            skill: 'Frações',
          ),
          _candidate(
            id: 'q-futura',
            lessonId: 'lesson-2',
            skill: 'Frações',
          ),
          _candidate(
            id: 'q-dominada',
            lessonId: 'lesson-3',
            skill: 'Outra habilidade',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-erro': QuestionPerformance(
            attempts: 2,
            correct: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
          'q-dominada': QuestionPerformance(
            attempts: 3,
            correct: 3,
            incorrect: 0,
            lastAnswerCorrect: true,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-1'],
        questionCount: 10,
      );

      expect(selected.map((candidate) => candidate.questionId), <String>[
        'q-erro',
      ]);
    });

    test('mantém saída determinística para a mesma entrada', () {
      final candidates = <QuestionCandidate>[
        _candidate(
          id: 'q-erro',
          lessonId: 'lesson-1',
          skill: 'Equações',
        ),
        _candidate(
          id: 'q-b',
          lessonId: 'lesson-1',
          skill: 'Equações',
        ),
        _candidate(
          id: 'q-a',
          lessonId: 'lesson-1',
          skill: 'Equações',
        ),
      ];

      const performance = <String, QuestionPerformance>{
        'q-erro': QuestionPerformance(
          attempts: 1,
          incorrect: 1,
          lastAnswerCorrect: false,
        ),
      };

      final first = PersonalizedReviewSessionBuilder.build(
        candidates: candidates,
        performanceByQuestionId: performance,
        studiedContentLessonIds: const <String>['lesson-1'],
      );
      final second = PersonalizedReviewSessionBuilder.build(
        candidates: candidates,
        performanceByQuestionId: performance,
        studiedContentLessonIds: const <String>['lesson-1'],
      );

      expect(
        first.map((candidate) => candidate.questionId).toList(),
        second.map((candidate) => candidate.questionId).toList(),
      );
    });
  });
}
