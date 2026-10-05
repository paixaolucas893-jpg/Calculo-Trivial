import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/question_performance.dart';

void main() {
  group('QuestionPerformance', () {
    test('registra tentativas e erros sem histórico detalhado', () {
      const initial = QuestionPerformance();

      final wrong = initial.record(isCorrect: false);
      final recovered = wrong.record(isCorrect: true);

      expect(wrong.attempts, 1);
      expect(wrong.incorrect, 1);
      expect(wrong.lastAnswerCorrect, isFalse);
      expect(wrong.needsReview, isTrue);

      expect(recovered.attempts, 2);
      expect(recovered.correct, 1);
      expect(recovered.incorrect, 1);
      expect(recovered.lastAnswerCorrect, isTrue);
      expect(recovered.accuracy, 0.5);
      expect(recovered.needsReview, isTrue);
    });

    test('sai da revisão ao recuperar pelo menos 80% de acerto', () {
      var performance = const QuestionPerformance();

      performance = performance.record(isCorrect: false);

      for (var i = 0; i < 4; i++) {
        performance = performance.record(isCorrect: true);
      }

      expect(performance.accuracy, 0.8);
      expect(performance.lastAnswerCorrect, isTrue);
      expect(performance.needsReview, isFalse);
    });

    test('erro mais recente mantém a questão pendente mesmo com boa média', () {
      const performance = QuestionPerformance(
        attempts: 10,
        correct: 9,
        incorrect: 1,
        lastAnswerCorrect: false,
      );

      expect(performance.accuracy, 0.9);
      expect(performance.needsReview, isTrue);
    });

    test('merge mantém contadores internamente consistentes', () {
      const local = QuestionPerformance(
        attempts: 2,
        correct: 2,
        incorrect: 0,
        lastAnswerCorrect: true,
      );
      const remote = QuestionPerformance(
        attempts: 2,
        correct: 0,
        incorrect: 2,
        lastAnswerCorrect: false,
      );

      final merged = local.merge(remote);

      expect(merged.correct, 2);
      expect(merged.incorrect, 2);
      expect(merged.attempts, greaterThanOrEqualTo(4));
    });
  });
}
