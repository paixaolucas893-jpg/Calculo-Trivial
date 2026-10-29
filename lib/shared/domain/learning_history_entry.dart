import 'dart:math';

enum LearningActivitySource {
  practice,
  personalizedReview,
  dailyChallenge,
}

class LearningHistoryEntry {
  static const int maxQuestionIdLength = 160;
  static const int maxContentLessonIdLength = 160;

  static const Set<String> _allowedJsonKeys = <String>{
    'eventId',
    'questionId',
    'contentLessonId',
    'isCorrect',
    'source',
    'occurredAtEpochMs',
  };

  final String? eventId;
  final String questionId;
  final String? contentLessonId;
  final bool isCorrect;
  final LearningActivitySource source;
  final int occurredAtEpochMs;

  const LearningHistoryEntry({
    this.eventId,
    required this.questionId,
    required this.isCorrect,
    required this.source,
    required this.occurredAtEpochMs,
    this.contentLessonId,
  });

  static final RegExp _uuidV4 = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}
      DateTime.fromMillisecondsSinceEpoch(occurredAtEpochMs).toLocal();

  String get deduplicationKey => eventId ?? [
        questionId,
        contentLessonId ?? '',
        isCorrect ? '1' : '0',
        source.name,
        occurredAtEpochMs.toString(),
      ].join('|');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (eventId != null) 'eventId': eventId,
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

    final eventIdValue = value['eventId'];
    if (eventIdValue != null &&
        (eventIdValue is! String || !_uuidV4.hasMatch(eventIdValue))) {
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
      eventId: eventIdValue as String?,
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
,
  );

  static String newEventId() {
    final bytes = List<int>.generate(16, (_) => Random.secure().nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-'
        '${hex.substring(20)}';
  }

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
