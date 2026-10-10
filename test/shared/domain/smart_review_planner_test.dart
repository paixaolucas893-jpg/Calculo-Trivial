import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';
import 'package:calcquest/shared/domain/smart_review_plan.dart';
import 'package:calcquest/shared/domain/smart_review_planner.dart';

void main() {
  QuestionCandidate candidate({
    required String id,
    required String skill,
    required String lessonId,
    ExerciseDifficulty difficulty = ExerciseDifficulty.foundation,
  }) {
    final exercise = ExerciseData(
      id: id,
      title: id,
      statement: 'Enunciado',
      options: const <ExerciseOptionData>[
        ExerciseOptionData(id: 'a', text: 'A'),
        ExerciseOptionData(id: 'b', text: 'B'),
      ],
      correctOptionId: 'a',
      explanation: 'Explicação',
      contentLessonId: lessonId,
      skill: skill,
      difficulty: difficulty,
    );

    return QuestionMetadataAdapter.fromExercise(
      moduleId: 'algebra-fundamental',
      exercise: exercise,
    );
  }

  group('SmartReviewPlanner', () {
    test('prioriza habilidade com erro não resolvido', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(id: 'q-a', skill: 'Habilidade A', lessonId: 'lesson-a'),
          candidate(id: 'q-b', skill: 'Habilidade B', lessonId: 'lesson-b'),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-a': QuestionPerformance(
            attempts: 1,
            correct: 0,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
          'q-b': QuestionPerformance(
            attempts: 4,
            correct: 3,
            incorrect: 1,
            lastAnswerCorrect: true,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-a', 'lesson-b'],
        questionCount: 1,
      );

      expect(plan, hasLength(1));
      expect(plan.single.questionId, 'q-a');
      expect(plan.single.reason, SmartReviewReason.unresolvedError);
    });

    test('prefere outra questão da mesma habilidade antes do erro direto', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(id: 'q-erro', skill: 'Distributiva', lessonId: 'lesson-1'),
          candidate(id: 'q-transferencia', skill: 'Distributiva', lessonId: 'lesson-1'),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-erro': QuestionPerformance(
            attempts: 1,
            correct: 0,
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
        questionCount: 1,
      );

      expect(plan, hasLength(1));
      expect(plan.single.questionId, 'q-transferencia');
    });

    test('não usa questão nova de conteúdo futuro', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(id: 'q-erro', skill: 'Potências', lessonId: 'lesson-atual'),
          candidate(id: 'q-futura', skill: 'Potências', lessonId: 'lesson-futura'),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-erro': QuestionPerformance(
            attempts: 1,
            correct: 0,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-atual'],
        questionCount: 2,
      );

      expect(plan.map((item) => item.questionId), <String>['q-erro']);
    });

    test('distribui a sessão entre habilidades elegíveis em rodadas', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(id: 'a-1', skill: 'Skill A', lessonId: 'lesson-a'),
          candidate(id: 'a-2', skill: 'Skill A', lessonId: 'lesson-a'),
          candidate(id: 'b-1', skill: 'Skill B', lessonId: 'lesson-b'),
          candidate(id: 'b-2', skill: 'Skill B', lessonId: 'lesson-b'),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'a-1': QuestionPerformance(
            attempts: 1,
            correct: 0,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
          'b-1': QuestionPerformance(
            attempts: 1,
            correct: 0,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-a', 'lesson-b'],
        questionCount: 4,
      );

      expect(plan, hasLength(4));
      expect(plan[0].skillKey, isNot(plan[1].skillKey));
      expect(plan[2].skillKey, plan[0].skillKey);
      expect(plan[3].skillKey, plan[1].skillKey);
    });

    test('evita a sessão anterior quando existe alternativa', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(id: 'q-antiga', skill: 'Frações', lessonId: 'lesson-1'),
          candidate(id: 'q-nova', skill: 'Frações', lessonId: 'lesson-1'),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-antiga': QuestionPerformance(
            attempts: 2,
            correct: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        previousSessionIds: const <String>['q-nova'],
        studiedContentLessonIds: const <String>['lesson-1'],
        questionCount: 1,
      );

      expect(plan.single.questionId, 'q-antiga');
    });

    test('prioriza foundation e intermediate antes de challenge', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(
            id: 'q-erro',
            skill: 'Equações',
            lessonId: 'lesson-1',
            difficulty: ExerciseDifficulty.intermediate,
          ),
          candidate(
            id: 'q-desafio',
            skill: 'Equações',
            lessonId: 'lesson-1',
            difficulty: ExerciseDifficulty.challenge,
          ),
          candidate(
            id: 'q-base',
            skill: 'Equações',
            lessonId: 'lesson-1',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-erro': QuestionPerformance(
            attempts: 1,
            correct: 0,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-1'],
        questionCount: 1,
      );

      expect(plan.single.questionId, 'q-base');
    });

    test('mesma entrada produz a mesma ordem', () {
      final candidates = <QuestionCandidate>[
        candidate(id: 'q-3', skill: 'Skill A', lessonId: 'lesson-a'),
        candidate(id: 'q-1', skill: 'Skill A', lessonId: 'lesson-a'),
        candidate(id: 'q-2', skill: 'Skill A', lessonId: 'lesson-a'),
      ];
      const performance = <String, QuestionPerformance>{
        'q-3': QuestionPerformance(
          attempts: 1,
          correct: 0,
          incorrect: 1,
          lastAnswerCorrect: false,
        ),
      };

      final first = SmartReviewPlanner.build(
        candidates: candidates,
        performanceByQuestionId: performance,
        studiedContentLessonIds: const <String>['lesson-a'],
        questionCount: 3,
      );
      final second = SmartReviewPlanner.build(
        candidates: candidates,
        performanceByQuestionId: performance,
        studiedContentLessonIds: const <String>['lesson-a'],
        questionCount: 3,
      );

      expect(
        first.map((item) => item.questionId).toList(),
        second.map((item) => item.questionId).toList(),
      );
    });

    test('não cria sessão quando não há evidência de dificuldade', () {
      final plan = SmartReviewPlanner.build(
        candidates: <QuestionCandidate>[
          candidate(id: 'q-1', skill: 'Skill A', lessonId: 'lesson-a'),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-1': QuestionPerformance(
            attempts: 2,
            correct: 2,
            incorrect: 0,
            lastAnswerCorrect: true,
          ),
        },
        studiedContentLessonIds: const <String>['lesson-a'],
      );

      expect(plan, isEmpty);
    });
  });
}
