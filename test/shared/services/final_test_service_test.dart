import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/services/final_test_service.dart';

void main() {
  group('shouldUseLocalFinalTestFallback', () {
    test('allows fallback only for backend availability failures', () {
      expect(shouldUseLocalFinalTestFallback('not-found'), isTrue);
      expect(shouldUseLocalFinalTestFallback('unavailable'), isTrue);
      expect(shouldUseLocalFinalTestFallback('deadline-exceeded'), isTrue);
    });

    test('does not bypass authentication, security or rate limits', () {
      expect(shouldUseLocalFinalTestFallback('permission-denied'), isFalse);
      expect(shouldUseLocalFinalTestFallback('unauthenticated'), isFalse);
      expect(shouldUseLocalFinalTestFallback('resource-exhausted'), isFalse);
      expect(shouldUseLocalFinalTestFallback('internal'), isFalse);
    });
  });

  group('countCorrectLocalFinalTestAnswers', () {
    test('counts only matching option ids', () {
      final correct = countCorrectLocalFinalTestAnswers(
        correctOptionByQuestionId: const <String, String>{
          'q1': 'a',
          'q2': 'b',
          'q3': 'c',
        },
        answers: const <TrustedFinalTestAnswer>[
          TrustedFinalTestAnswer(questionId: 'q1', optionId: 'a'),
          TrustedFinalTestAnswer(questionId: 'q2', optionId: 'd'),
          TrustedFinalTestAnswer(questionId: 'q3', optionId: 'c'),
        ],
      );

      expect(correct, 2);
    });

    test('ignores unknown question ids', () {
      final correct = countCorrectLocalFinalTestAnswers(
        correctOptionByQuestionId: const <String, String>{
          'q1': 'a',
        },
        answers: const <TrustedFinalTestAnswer>[
          TrustedFinalTestAnswer(questionId: 'unknown', optionId: 'a'),
        ],
      );

      expect(correct, 0);
    });
  });
}
