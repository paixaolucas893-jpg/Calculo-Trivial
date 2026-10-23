import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';
import 'package:calcquest/shared/domain/skill_review_aggregator.dart';
import 'package:calcquest/shared/domain/skill_review_summary.dart';

void main() {
  QuestionCandidate candidate({
    required String id,
    required String moduleId,
    String? contentLessonId,
    String? skill,
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
      contentLessonId: contentLessonId,
      skill: skill,
    );

    return QuestionMetadataAdapter.fromExercise(
      moduleId: moduleId,
      exercise: exercise,
    );
  }

  group('SkillReviewAggregator', () {
    test('agrega questões diferentes da mesma habilidade', () {
      final candidates = <QuestionCandidate>[
        candidate(
          id: 'q-1',
          moduleId: 'algebra-fundamental',
          contentLessonId: 'algebra-02-termos-semelhantes',
          skill: 'Reduzir termos semelhantes',
        ),
        candidate(
          id: 'q-2',
          moduleId: 'algebra-fundamental',
          contentLessonId: 'algebra-02-termos-semelhantes',
          skill: 'Reduzir termos semelhantes',
        ),
      ];

      final summaries = SkillReviewAggregator.build(
        candidates: candidates,
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-1': QuestionPerformance(
            attempts: 2,
            correct: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
          'q-2': QuestionPerformance(
            attempts: 3,
            correct: 2,
            incorrect: 1,
            lastAnswerCorrect: true,
          ),
        },
        learningHistory: const <LearningHistoryEntry>[
          LearningHistoryEntry(
            questionId: 'q-1',
            contentLessonId: 'algebra-02-termos-semelhantes',
            isCorrect: false,
            source: LearningActivitySource.practice,
            occurredAtEpochMs: 1760000000000,
          ),
          LearningHistoryEntry(
            questionId: 'q-2',
            contentLessonId: 'algebra-02-termos-semelhantes',
            isCorrect: true,
            source: LearningActivitySource.personalizedReview,
            occurredAtEpochMs: 1760000001000,
          ),
        ],
      );

      expect(summaries, hasLength(1));

      final summary = summaries.single;

      expect(summary.key, 'skill:reduzir termos semelhantes');
      expect(summary.groupingBasis, SkillReviewGroupingBasis.skill);
      expect(summary.label, 'Reduzir termos semelhantes');
      expect(summary.questionIds, <String>['q-1', 'q-2']);
      expect(summary.attemptedQuestionCount, 2);
      expect(summary.totalAttempts, 5);
      expect(summary.correct, 3);
      expect(summary.incorrect, 2);
      expect(summary.unresolvedQuestionCount, 1);
      expect(summary.accuracy, closeTo(0.6, 0.0001));
      expect(summary.recentCorrect, 1);
      expect(summary.recentIncorrect, 1);
      expect(summary.lastOccurredAtEpochMs, 1760000001000);
      expect(summary.hasEvidence, isTrue);
      expect(summary.hasUnresolvedError, isTrue);
      expect(summary.hasRecentError, isTrue);
    });

    test('usa subtopicId quando skill não está preenchida', () {
      final summaries = SkillReviewAggregator.build(
        candidates: <QuestionCandidate>[
          candidate(
            id: 'q-1',
            moduleId: 'funcoes',
            contentLessonId: 'funcoes-01-conceito-dominio-imagem',
          ),
          candidate(
            id: 'q-2',
            moduleId: 'funcoes',
            contentLessonId: 'funcoes-01-conceito-dominio-imagem',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{},
      );

      expect(summaries, hasLength(1));
      expect(
        summaries.single.key,
        'subtopic:funcoes-01-conceito-dominio-imagem',
      );
      expect(
        summaries.single.groupingBasis,
        SkillReviewGroupingBasis.subtopic,
      );
      expect(summaries.single.questionIds, <String>['q-1', 'q-2']);
    });

    test('usa questionId como último fallback', () {
      final summaries = SkillReviewAggregator.build(
        candidates: <QuestionCandidate>[
          candidate(
            id: 'q-sem-metadado',
            moduleId: 'limites',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{},
      );

      expect(summaries, hasLength(1));
      expect(summaries.single.key, 'question:q-sem-metadado');
      expect(
        summaries.single.groupingBasis,
        SkillReviewGroupingBasis.question,
      );
      expect(summaries.single.label, 'q-sem-metadado');
    });

    test('ignora histórico de questão fora do banco disponível', () {
      final summaries = SkillReviewAggregator.build(
        candidates: <QuestionCandidate>[
          candidate(
            id: 'q-1',
            moduleId: 'derivadas',
            contentLessonId: 'derivadas-01-significado',
            skill: 'Interpretar derivada',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{},
        learningHistory: const <LearningHistoryEntry>[
          LearningHistoryEntry(
            questionId: 'q-removida',
            isCorrect: false,
            source: LearningActivitySource.practice,
            occurredAtEpochMs: 1760000000000,
          ),
        ],
      );

      expect(summaries, hasLength(1));
      expect(summaries.single.recentAttempts, 0);
      expect(summaries.single.lastOccurredAtEpochMs, isNull);
      expect(summaries.single.hasEvidence, isFalse);
    });

    test('não duplica desempenho quando o mesmo candidato aparece repetido', () {
      final repeated = candidate(
        id: 'q-1',
        moduleId: 'equacoes-inequacoes',
        contentLessonId: 'equacoes-01',
        skill: 'Resolver equações',
      );

      final summaries = SkillReviewAggregator.build(
        candidates: <QuestionCandidate>[repeated, repeated],
        performanceByQuestionId: const <String, QuestionPerformance>{
          'q-1': QuestionPerformance(
            attempts: 2,
            correct: 1,
            incorrect: 1,
            lastAnswerCorrect: false,
          ),
        },
      );

      expect(summaries, hasLength(1));
      expect(summaries.single.questionIds, <String>['q-1']);
      expect(summaries.single.totalAttempts, 2);
      expect(summaries.single.incorrect, 1);
    });

    test('ordena os resumos de forma determinística pela chave', () {
      final summaries = SkillReviewAggregator.build(
        candidates: <QuestionCandidate>[
          candidate(
            id: 'q-b',
            moduleId: 'algebra-fundamental',
            skill: 'Skill B',
          ),
          candidate(
            id: 'q-a',
            moduleId: 'algebra-fundamental',
            skill: 'Skill A',
          ),
        ],
        performanceByQuestionId: const <String, QuestionPerformance>{},
      );

      expect(
        summaries.map((summary) => summary.key).toList(),
        <String>['skill:skill a', 'skill:skill b'],
      );
    });
  });
}
