import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

void main() {
  test('missing server control can use legacy generation zero', () {
    const state = LearningHistoryGenerationState.legacy;
    expect(state.generation, 0);
    expect(state.status, 'active');
    expect(state.allowsNewEvents, isTrue);
  });

  test('active server generation permits new attempts', () {
    final state = LearningHistoryGenerationState.fromJson(
      <String, dynamic>{'generation': 3, 'status': 'active'},
    );
    expect(state.generation, 3);
    expect(state.allowsNewEvents, isTrue);
  });

  test('resetting server state does not permit new attempts', () {
    final state = LearningHistoryGenerationState.fromJson(
      <String, dynamic>{'generation': 4, 'status': 'resetting'},
    );
    expect(state.allowsNewEvents, isFalse);
  });

  test('malformed generation states fail closed', () {
    final invalidStates = <Map<String, dynamic>>[
      <String, dynamic>{},
      <String, dynamic>{'generation': -1, 'status': 'active'},
      <String, dynamic>{'generation': 1.0, 'status': 'active'},
      <String, dynamic>{'generation': '1', 'status': 'active'},
      <String, dynamic>{'generation': 1, 'status': 'invalid'},
      <String, dynamic>{'generation': 1},
    ];

    for (final invalid in invalidStates) {
      expect(
        () => LearningHistoryGenerationState.fromJson(invalid),
        throwsFormatException,
      );
    }
  });
}
