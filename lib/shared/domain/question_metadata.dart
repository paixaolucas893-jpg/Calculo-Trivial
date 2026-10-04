import 'package:calcquest/shared/data/mock_exercise_data.dart';

enum QuestionType { multipleChoice }

class QuestionMetadata {
  final String questionId;
  final String moduleId;
  final String? topicId;
  final String? subtopicId;
  final ExerciseDifficulty difficulty;
  final String? skill;
  final QuestionType questionType;
  final String? sourceReference;

  const QuestionMetadata({
    required this.questionId,
    required this.moduleId,
    required this.difficulty,
    required this.questionType,
    this.topicId,
    this.subtopicId,
    this.skill,
    this.sourceReference,
  });
}

class QuestionMetadataOverride {
  final String? topicId;
  final String? subtopicId;
  final QuestionType? questionType;
  final String? sourceReference;

  const QuestionMetadataOverride({
    this.topicId,
    this.subtopicId,
    this.questionType,
    this.sourceReference,
  });
}

class QuestionCandidate {
  final ExerciseData exercise;
  final QuestionMetadata metadata;

  const QuestionCandidate({
    required this.exercise,
    required this.metadata,
  });

  String get questionId => metadata.questionId;
  String get correctAnswer => exercise.correctOptionId;
  String get explanation => exercise.explanation;
}

class QuestionMetadataAdapter {
  const QuestionMetadataAdapter._();

  static QuestionCandidate fromExercise({
    required String moduleId,
    required ExerciseData exercise,
    QuestionMetadataOverride? metadataOverride,
  }) {
    return QuestionCandidate(
      exercise: exercise,
      metadata: QuestionMetadata(
        questionId: exercise.id,
        moduleId: moduleId,
        topicId: metadataOverride?.topicId,
        subtopicId:
            metadataOverride?.subtopicId ?? exercise.contentLessonId,
        difficulty: exercise.difficulty,
        skill: exercise.skill,
        questionType:
            metadataOverride?.questionType ?? QuestionType.multipleChoice,
        sourceReference: metadataOverride?.sourceReference,
      ),
    );
  }

  static List<QuestionCandidate> fromExercises({
    required String moduleId,
    required Iterable<ExerciseData> exercises,
    Map<String, QuestionMetadataOverride> metadataOverrides =
        const <String, QuestionMetadataOverride>{},
  }) {
    return exercises
        .map(
          (exercise) => fromExercise(
            moduleId: moduleId,
            exercise: exercise,
            metadataOverride: metadataOverrides[exercise.id],
          ),
        )
        .toList(growable: false);
  }
}
