import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/state/app_progress.dart';

class FinalTestSessionBuilder {
  const FinalTestSessionBuilder._();

  static List<ExerciseData> build({
    required String lessonId,
    required Iterable<ExerciseData> exercises,
    required Iterable<String> practiceQuestionIds,
    int questionCount = 10,
  }) {
    final candidates = QuestionMetadataAdapter.fromExercises(
      moduleId: lessonId,
      exercises: exercises,
    );

    return AppProgress.selectFinalTestCandidates(
      lessonId: lessonId,
      candidates: candidates,
      practiceQuestionIds: practiceQuestionIds,
      questionCount: questionCount,
    ).map((candidate) => candidate.exercise).toList(growable: false);
  }
}
