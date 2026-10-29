import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/learning_history_entry.dart';

void main() {
  group('LearningHistoryEntry', () {
    test('gera UUID v4 distinto para tentativas diferentes', () {
      final first = LearningHistoryEntry.newEventId();
      final second = LearningHistoryEntry.newEventId();
      expect(first, isNot(second));
      expect(
        first,
        matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}
    test('serializa e restaura um evento válido', () {
      const entry = LearningHistoryEntry(
        questionId: 'q-1',
        contentLessonId: 'funcoes-01-conceito-dominio-imagem',
        isCorrect: false,
        source: LearningActivitySource.personalizedReview,
        occurredAtEpochMs: 1760000000000,
      );

      final restored = LearningHistoryEntry.fromJson(entry.toJson());

      expect(restored, isNotNull);
      expect(restored!.questionId, entry.questionId);
      expect(restored.contentLessonId, entry.contentLessonId);
      expect(restored.isCorrect, isFalse);
      expect(restored.source, LearningActivitySource.personalizedReview);
      expect(restored.occurredAtEpochMs, entry.occurredAtEpochMs);
    });

    test('rejeita payload malformado', () {
      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': '',
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'isCorrect': true,
          'source': 'unknown',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'contentLessonId': 123,
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000.5,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
          'freeText': 'campo inesperado',
        }),
        isNull,
      );
    });

    test('rejeita identificadores acima dos limites definidos', () {
      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q' * (LearningHistoryEntry.maxQuestionIdLength + 1),
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'contentLessonId':
              'l' * (LearningHistoryEntry.maxContentLessonIdLength + 1),
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );
    });
  });
}
)),
      );
    });

    test('preserva eventId na serialização sem quebrar evento legado', () {
      final eventId = LearningHistoryEntry.newEventId();
      final entry = LearningHistoryEntry(
        eventId: eventId,
        questionId: 'q-1',
        isCorrect: true,
        source: LearningActivitySource.practice,
        occurredAtEpochMs: 1760000000000,
      );
      expect(LearningHistoryEntry.fromJson(entry.toJson())?.eventId, eventId);
      expect(LearningHistoryEntry.fromJson({
        'questionId': 'q-1',
        'isCorrect': true,
        'source': 'practice',
        'occurredAtEpochMs': 1760000000000,
      })?.eventId, isNull);
      expect(LearningHistoryEntry.fromJson({...entry.toJson(), 'eventId': 'invalid'}), isNull);
    });

    test('serializa e restaura um evento válido', () {
      const entry = LearningHistoryEntry(
        questionId: 'q-1',
        contentLessonId: 'funcoes-01-conceito-dominio-imagem',
        isCorrect: false,
        source: LearningActivitySource.personalizedReview,
        occurredAtEpochMs: 1760000000000,
      );

      final restored = LearningHistoryEntry.fromJson(entry.toJson());

      expect(restored, isNotNull);
      expect(restored!.questionId, entry.questionId);
      expect(restored.contentLessonId, entry.contentLessonId);
      expect(restored.isCorrect, isFalse);
      expect(restored.source, LearningActivitySource.personalizedReview);
      expect(restored.occurredAtEpochMs, entry.occurredAtEpochMs);
    });

    test('rejeita payload malformado', () {
      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': '',
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'isCorrect': true,
          'source': 'unknown',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'contentLessonId': 123,
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000.5,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
          'freeText': 'campo inesperado',
        }),
        isNull,
      );
    });

    test('rejeita identificadores acima dos limites definidos', () {
      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q' * (LearningHistoryEntry.maxQuestionIdLength + 1),
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );

      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          'questionId': 'q-1',
          'contentLessonId':
              'l' * (LearningHistoryEntry.maxContentLessonIdLength + 1),
          'isCorrect': true,
          'source': 'practice',
          'occurredAtEpochMs': 1760000000000,
        }),
        isNull,
      );
    });
  });
}
