import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/daily_challenge_engine.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';

QuestionCandidate candidate(
  String id,
  String lessonId,
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
      contentLessonId: lessonId,
      skill: 'skill',
      difficulty: difficulty,
    ),
  );
}

void main() {
  group('DailyChallengeEngine', () {
    final candidates = <QuestionCandidate>[
      candidate('f1', 'lesson-a', ExerciseDifficulty.foundation),
      candidate('f2', 'lesson-a', ExerciseDifficulty.foundation),
      candidate('f3', 'lesson-b', ExerciseDifficulty.foundation),
      candidate('i1', 'lesson-a', ExerciseDifficulty.intermediate),
      candidate('i2', 'lesson-b', ExerciseDifficulty.intermediate),
      candidate('i3', 'lesson-b', ExerciseDifficulty.intermediate),
      candidate('c1', 'lesson-b', ExerciseDifficulty.challenge),
      candidate('c2', 'lesson-c', ExerciseDifficulty.challenge),
    ];

    test('usa somente aulas concluídas', () {
      final selected = DailyChallengeEngine.select(
        candidates: candidates,
        completedContentLessonIds: const <String>{'lesson-a'},
        date: DateTime(2026, 10, 5),
      );

      expect(selected, isNotEmpty);
      expect(
        selected.every(
          (candidate) => candidate.metadata.subtopicId == 'lesson-a',
        ),
        isTrue,
      );
    });

    test('é determinístico durante o mesmo dia', () {
      final first = DailyChallengeEngine.select(
        candidates: candidates,
        completedContentLessonIds: const <String>{'lesson-a', 'lesson-b'},
        date: DateTime(2026, 10, 5),
      );
      final second = DailyChallengeEngine.select(
        candidates: candidates,
        completedContentLessonIds: const <String>{'lesson-a', 'lesson-b'},
        date: DateTime(2026, 10, 5),
      );

      expect(
        first.map((item) => item.questionId),
        second.map((item) => item.questionId),
      );
    });

    test('muda a seleção entre dias quando há variedade suficiente', () {
      final first = DailyChallengeEngine.select(
        candidates: candidates,
        completedContentLessonIds: const <String>{'lesson-a', 'lesson-b'},
        date: DateTime(2026, 10, 5),
      );
      final second = DailyChallengeEngine.select(
        candidates: candidates,
        completedContentLessonIds: const <String>{'lesson-a', 'lesson-b'},
        date: DateTime(2026, 10, 6),
      );

      expect(
        first.map((item) => item.questionId).join(','),
        isNot(second.map((item) => item.questionId).join(',')),
      );
    });

    test('busca equilíbrio 2 foundation, 2 intermediate e 1 challenge', () {
      final selected = DailyChallengeEngine.select(
        candidates: candidates,
        completedContentLessonIds: const <String>{'lesson-a', 'lesson-b'},
        date: DateTime(2026, 10, 5),
      );

      final foundation = selected
          .where(
            (item) =>
                item.metadata.difficulty == ExerciseDifficulty.foundation,
          )
          .length;
      final intermediate = selected
          .where(
            (item) =>
                item.metadata.difficulty == ExerciseDifficulty.intermediate,
          )
          .length;
      final challenge = selected
          .where(
            (item) =>
                item.metadata.difficulty == ExerciseDifficulty.challenge,
          )
          .length;

      expect(foundation, 2);
      expect(intermediate, 2);
      expect(challenge, 1);
    });

    test('não duplica e limita à quantidade disponível', () {
      final repeated = candidate(
        'same',
        'lesson-a',
        ExerciseDifficulty.foundation,
      );

      final selected = DailyChallengeEngine.select(
        candidates: <QuestionCandidate>[repeated, repeated],
        completedContentLessonIds: const <String>{'lesson-a'},
        date: DateTime(2026, 10, 5),
        questionCount: 5,
      );

      expect(selected, hasLength(1));
      expect(selected.single.questionId, 'same');
    });
  });
}
