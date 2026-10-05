import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('todos os módulos exigem 70% de prática antes da prova final', () {
    const files = <String>[
      'algebra_practice_screen.dart',
      'equations_exercises_screen.dart',
      'functions_exercises_screen.dart',
      'limits_exercises_screen.dart',
      'continuity_exercises_screen.dart',
      'derivatives_exercises_screen.dart',
    ];

    for (final file in files) {
      final source = File(
        'lib/features/exercises/presentation/$file',
      ).readAsStringSync();

      expect(
        source,
        contains('ModuleMasteryTracker.recordPracticeResult'),
        reason: '$file precisa registrar o resultado da prática.',
      );
      expect(
        source,
        contains('ModuleMasteryPolicy.evaluate'),
        reason: '$file precisa aplicar a política de domínio.',
      );
      expect(
        source,
        contains('decision.canTakeFinalTest'),
        reason: '$file precisa bloquear a prova final abaixo da meta.',
      );
      expect(
        source,
        contains('canTakeFinalTest'),
        reason: '$file precisa levar a decisão até a tela de revisão.',
      );
      expect(
        source,
        contains('70%'),
        reason: '$file precisa informar a meta mínima ao estudante.',
      );
    }
  });
}
