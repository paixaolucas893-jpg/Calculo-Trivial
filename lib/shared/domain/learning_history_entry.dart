enum LearningActivitySource {
  practice,
  personalizedReview,
  dailyChallenge,
}

class LearningHistoryEntry {
  static const int maxQuestionIdLength = 160;
  static const int maxContentLessonIdLength = 160;

  static const Set<String> _allowedJsonKeys = <String>{
    'questionId',
    'contentLessonId',
    'isCorrect',
    'source',
    'occurredAtEpochMs',
  };

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

    final keys = value.keys.whereType<String>().toSet();

    if (keys.length != value.keys.length ||
        !keys.every(_allowedJsonKeys.contains)) {
      return null;
    }

    final questionIdValue = value['questionId'];
    final contentLessonIdValue = value['contentLessonId'];
    final isCorrect = value['isCorrect'];
    final sourceName = value['source'];
    final occurredAtEpochMs = value['occurredAtEpochMs'];

    if (questionIdValue is! String ||
        !_isValidIdentifier(
          questionIdValue,
          maxLength: maxQuestionIdLength,
        ) ||
        isCorrect is! bool ||
        sourceName is! String ||
        occurredAtEpochMs is! int ||
        occurredAtEpochMs <= 0) {
      return null;
    }

    String? contentLessonId;

    if (contentLessonIdValue != null) {
      if (contentLessonIdValue is! String ||
          !_isValidIdentifier(
            contentLessonIdValue,
            maxLength: maxContentLessonIdLength,
          )) {
        return null;
      }

      contentLessonId = contentLessonIdValue.trim();
    }

    LearningActivitySource? source;

    for (final candidate in LearningActivitySource.values) {
      if (candidate.name == sourceName) {
        source = candidate;
        break;
      }
    }

    if (source == null) return null;

    return LearningHistoryEntry(
      questionId: questionIdValue.trim(),
      contentLessonId: contentLessonId,
      isCorrect: isCorrect,
      source: source,
      occurredAtEpochMs: occurredAtEpochMs,
    );
  }

  static bool _isValidIdentifier(
    String value, {
    required int maxLength,
  }) {
    final normalized = value.trim();

    return normalized.isNotEmpty && normalized.length <= maxLength;
  }
}
