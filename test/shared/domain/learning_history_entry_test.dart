import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/learning_history_entry.dart';

void main() {
  group('LearningHistoryEntry', () {
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
    });
  });
}
