import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/learning_history_entry.dart';

void main() {
  group('LearningHistoryEntry', () {
    test('gera IDs UUID v4 distintos e válidos', () {
      final first = LearningHistoryEntry.newEventId();
      final second = LearningHistoryEntry.newEventId();
      expect(first, isNot(second));
      expect(first.length, 36);
      expect(first[14], '4');
      expect('89ab'.contains(first[19]), isTrue);
      expect(first.split('-').length, 5);
    });

    test('preserva IDs novos e aceita registros antigos', () {
      final id = LearningHistoryEntry.newEventId();
      final entry = LearningHistoryEntry(
        eventId: id,
        questionId: 'q-1',
        isCorrect: true,
        source: LearningActivitySource.practice,
        occurredAtEpochMs: 1760000000000,
      );
      expect(LearningHistoryEntry.fromJson(entry.toJson())?.eventId, id);
      final legacy = Map<String, dynamic>.from(entry.toJson())
        ..remove('eventId');
      expect(LearningHistoryEntry.fromJson(legacy)?.eventId, isNull);
      expect(
        LearningHistoryEntry.fromJson(<String, dynamic>{
          ...entry.toJson(),
          'eventId': 'not-a-uuid',
        }),
        isNull,
      );
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
