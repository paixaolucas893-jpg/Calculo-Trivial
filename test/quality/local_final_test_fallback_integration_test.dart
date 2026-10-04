import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fallback local usa os seis bancos e preserva dez questões', () {
    final source = File(
      'lib/shared/services/final_test_service.dart',
    ).readAsStringSync();

    expect(source, contains('mockExercises'));
    expect(source, contains('mockEquationsExercises'));
    expect(source, contains('mockFunctionsExercises'));
    expect(source, contains('mockLimitsExercises'));
    expect(source, contains('mockContinuityExercises'));
    expect(source, contains('mockDerivativesExercises'));
    expect(source, contains('FinalTestSessionBuilder.build('));
    expect(source, contains('questionCount: 10'));
    expect(source, contains('selectedExercises.length != 10'));
  });

  test('fallback só cobre indisponibilidade de infraestrutura', () {
    final source = File(
      'lib/shared/services/final_test_service.dart',
    ).readAsStringSync();

    expect(source, contains("'not-found'"));
    expect(source, contains("'unavailable'"));
    expect(source, contains("'deadline-exceeded'"));
    expect(source, contains("'internal'"));

    final fallbackMethod = RegExp(
      r'static bool _shouldUseLocalFallback\(String code\) \{([\s\S]*?)\n  \}',
    ).firstMatch(source);

    expect(fallbackMethod, isNotNull);
    final body = fallbackMethod!.group(1)!;
    expect(body, isNot(contains("'permission-denied'")));
    expect(body, isNot(contains("'unauthenticated'")));
    expect(body, isNot(contains("'resource-exhausted'")));
  });

  test('resultado local não finge recompensa aplicada pelo backend', () {
    final source = File(
      'lib/shared/services/final_test_service.dart',
    ).readAsStringSync();

    expect(source, contains('rewardAlreadyAppliedByBackend: false'));
    expect(source, contains('ModuleMasteryTracker.recordFinalTestResult('));
    expect(source, contains('accuracy >= 0.80'));
  });

  test('as seis telas passam histórico da prática e respeitam origem da recompensa', () {
    const files = <String>[
      'algebra_final_test_screen.dart',
      'equations_final_test_screen.dart',
      'functions_final_test_screen.dart',
      'limits_final_test_screen.dart',
      'continuity_final_test_screen.dart',
      'derivatives_final_test_screen.dart',
    ];

    for (final file in files) {
      final source = File(
        'lib/features/exercises/presentation/$file',
      ).readAsStringSync();

      expect(
        source,
        contains('practiceQuestionIds: widget.practiceQuestionIds'),
        reason: '$file deve evitar repetir a prática no teste local.',
      );
      expect(
        source,
        contains(
          'rewardAlreadyAppliedByBackend: result.rewardAlreadyAppliedByBackend',
        ),
        reason: '$file deve aplicar recompensa local somente quando necessário.',
      );
    }
  });
}
