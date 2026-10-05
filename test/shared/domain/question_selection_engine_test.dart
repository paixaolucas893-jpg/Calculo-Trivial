import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_selection_engine.dart';

void main() {
  group('QuestionSelectionEngine.selectQuestionIds', () {
    test('prioritizes primary then secondary avoidance tiers', () {
      final selected = QuestionSelectionEngine.selectQuestionIds(
        availableQuestionIds: const ['q1', 'q2', 'q3', 'q4'],
        primaryAvoidIds: const ['q3', 'q4'],
        secondaryAvoidIds: const ['q2', 'q4'],
        questionCount: 4,
        random: Random(1),
      );

      expect(selected[0], 'q1');
      expect(selected[1], 'q2');
      expect(selected[2], 'q3');
      expect(selected[3], 'q4');
    });

    test('hard exclusions are never selected', () {
      final selected = QuestionSelectionEngine.selectQuestionIds(
        availableQuestionIds: const ['q1', 'q2', 'q3'],
        excludedQuestionIds: const ['q2'],
        questionCount: 10,
        random: Random(2),
      );

      expect(selected.toSet(), {'q1', 'q3'});
    });

    test('deduplicates ids and caps the requested count', () {
      final selected = QuestionSelectionEngine.selectQuestionIds(
        availableQuestionIds: const ['q1', 'q1', 'q2'],
        questionCount: 10,
        random: Random(3),
      );

      expect(selected, hasLength(2));
      expect(selected.toSet(), {'q1', 'q2'});
    });

    test('seed produces deterministic selection', () {
      final bank = List<String>.generate(20, (index) => 'q${index + 1}');

      final first = QuestionSelectionEngine.selectQuestionIds(
        availableQuestionIds: bank,
        questionCount: 10,
        seed: 42,
      );
      final second = QuestionSelectionEngine.selectQuestionIds(
        availableQuestionIds: bank,
        questionCount: 10,
        seed: 42,
      );

      expect(first, second);
    });
  });

  group('QuestionSelectionEngine.selectCandidates', () {
    QuestionCandidate candidate({
      required String id,
      required String moduleId,
      String? topicId,
      String? subtopicId,
      ExerciseDifficulty difficulty = ExerciseDifficulty.foundation,
    }) {
      final exercise = ExerciseData(
        id: id,
        title: id,
        statement: id,
        options: const <ExerciseOptionData>[
          ExerciseOptionData(id: 'a', text: 'A'),
          ExerciseOptionData(id: 'b', text: 'B'),
        ],
        correctOptionId: 'a',
        explanation: 'Explicação',
        difficulty: difficulty,
      );

      return QuestionCandidate(
        exercise: exercise,
        metadata: QuestionMetadata(
          questionId: id,
          moduleId: moduleId,
          topicId: topicId,
          subtopicId: subtopicId,
          difficulty: difficulty,
          questionType: QuestionType.multipleChoice,
        ),
      );
    }

    test('filters by module, topic, subtopic and difficulty', () {
      final candidates = <QuestionCandidate>[
        candidate(
          id: 'q1',
          moduleId: 'funcoes',
          topicId: 'dominio',
          subtopicId: 'intervalos',
          difficulty: ExerciseDifficulty.foundation,
        ),
        candidate(
          id: 'q2',
          moduleId: 'funcoes',
          topicId: 'dominio',
          subtopicId: 'intervalos',
          difficulty: ExerciseDifficulty.intermediate,
        ),
        candidate(
          id: 'q3',
          moduleId: 'limites',
          topicId: 'dominio',
          subtopicId: 'intervalos',
          difficulty: ExerciseDifficulty.intermediate,
        ),
      ];

      final selected = QuestionSelectionEngine.selectCandidates(
        candidates: candidates,
        moduleId: 'funcoes',
        topicId: 'dominio',
        subtopicId: 'intervalos',
        difficulties: const {ExerciseDifficulty.intermediate},
        questionCount: 10,
        seed: 7,
      );

      expect(selected.map((candidate) => candidate.questionId), ['q2']);
    });
  });
}
