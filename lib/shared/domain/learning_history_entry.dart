enum LearningActivitySource {
  practice,
  personalizedReview,
  dailyChallenge,
}

class LearningHistoryEntry {
  final String questionId;
  final String? contentLessonId;
  final bool isCorrect;
  final LearningActivitySource source;
  final int occurredAtEpochMs;

  const LearningHistoryEntry({
    required this.questionId,
    required this.isCorrect,
    required this.source,
    required this.occurredAtEpochMs,
    this.contentLessonId,
  });

  DateTime get occurredAt =>
      DateTime.fromMillisecondsSinceEpoch(occurredAtEpochMs).toLocal();

  String get deduplicationKey => [
        questionId,
        contentLessonId ?? '',
        isCorrect ? '1' : '0',
        source.name,
        occurredAtEpochMs.toString(),
      ].join('|');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'questionId': questionId,
      'contentLessonId': contentLessonId,
      'isCorrect': isCorrect,
      'source': source.name,
      'occurredAtEpochMs': occurredAtEpochMs,
    };
  }

  static LearningHistoryEntry? fromJson(dynamic value) {
    if (value is! Map) return null;

    final questionId = value['questionId'];
    final contentLessonId = value['contentLessonId'];
    final isCorrect = value['isCorrect'];
    final sourceName = value['source'];
    final occurredAtEpochMs = value['occurredAtEpochMs'];

    if (questionId is! String ||
        questionId.trim().isEmpty ||
        isCorrect is! bool ||
        sourceName is! String ||
        occurredAtEpochMs is! num) {
      return null;
    }

    LearningActivitySource? source;

    for (final candidate in LearningActivitySource.values) {
      if (candidate.name == sourceName) {
        source = candidate;
        break;
      }
    }

    if (source == null) return null;

    final timestamp = occurredAtEpochMs.toInt();

    if (timestamp <= 0) return null;

    return LearningHistoryEntry(
      questionId: questionId,
      contentLessonId:
          contentLessonId is String && contentLessonId.trim().isNotEmpty
              ? contentLessonId
              : null,
      isCorrect: isCorrect,
      source: source,
      occurredAtEpochMs: timestamp,
    );
  }
}
