import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/practice_question_rotation_selector.dart';

void main() {
  group('PracticeQuestionRotationSelector', () {
    test('prioriza questões nunca vistas nas sessões recentes', () {
      final available = List<String>.generate(
        30,
        (index) => 'q${index + 1}',
      );

      final selected = PracticeQuestionRotationSelector.select(
        availableQuestionIds: available,
        previousSessionIds: available.take(10),
        recentHistoryIds: available.take(20),
        questionCount: 10,
        random: Random(1),
      );

      expect(
        selected.toSet(),
        equals(available.skip(20).take(10).toSet()),
      );
    });

    test('quando precisa repetir, usa primeiro as vistas há mais tempo', () {
      final available = List<String>.generate(
        12,
        (index) => 'q${index + 1}',
      );

      final selected = PracticeQuestionRotationSelector.select(
        availableQuestionIds: available,
        previousSessionIds: const <String>['q11', 'q12'],
        recentHistoryIds: available,
        questionCount: 4,
        random: Random(2),
      );

      expect(selected, <String>['q1', 'q2', 'q3', 'q4']);
    });

    test('evita a sessão imediatamente anterior enquanto houver alternativa', () {
      final available = List<String>.generate(
        15,
        (index) => 'q${index + 1}',
      );

      final selected = PracticeQuestionRotationSelector.select(
        availableQuestionIds: available,
        previousSessionIds: available.take(10),
        recentHistoryIds: available,
        questionCount: 5,
        random: Random(3),
      );

      expect(
        selected.toSet().intersection(available.take(10).toSet()),
        isEmpty,
      );
    });

    test('mantém janela recente com no máximo quarenta IDs', () {
      var history = <String>[];

      for (var session = 0; session < 6; session++) {
        history = PracticeQuestionRotationSelector.appendToRecentHistory(
          currentHistoryIds: history,
          selectedQuestionIds: List<String>.generate(
            10,
            (index) => 'q${session * 10 + index + 1}',
          ),
        );
      }

      expect(history, hasLength(40));
      expect(history.first, 'q21');
      expect(history.last, 'q60');
    });

    test('rever uma questão move seu ID para o fim da janela', () {
      final history =
          PracticeQuestionRotationSelector.appendToRecentHistory(
        currentHistoryIds: const <String>['q1', 'q2', 'q3'],
        selectedQuestionIds: const <String>['q1'],
      );

      expect(history, <String>['q2', 'q3', 'q1']);
    });
  });
}
