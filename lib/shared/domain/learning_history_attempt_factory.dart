import 'package:calcquest/shared/domain/learning_history_entry.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

/// Captures the verified generation at attempt creation time, not at upload.
///
/// Callers must first obtain a trusted generation state for the current
/// authenticated user and invalidate that state after account changes,
/// reset notifications, or uncertain synchronization. This factory makes no
/// network calls and does not enable remote uploading.
class LearningHistoryAttemptFactory {
  const LearningHistoryAttemptFactory();

  LearningHistoryEntry create({
    required LearningHistoryGenerationState generationState,
    required String questionId,
    required bool isCorrect,
    required LearningActivitySource source,
    required DateTime occurredAt,
    String? contentLessonId,
  }) {
    if (!generationState.allowsNewEvents) {
      throw StateError('History reset is in progress.');
    }
    if (generationState.generation < 0) {
      throw StateError('Invalid history generation.');
    }

    return LearningHistoryEntry(
      eventId: LearningHistoryEntry.newEventId(),
      generation: generationState.generation,
      questionId: questionId,
      contentLessonId: contentLessonId,
      isCorrect: isCorrect,
      source: source,
      occurredAtEpochMs: occurredAt.toUtc().millisecondsSinceEpoch,
    );
  }
}
