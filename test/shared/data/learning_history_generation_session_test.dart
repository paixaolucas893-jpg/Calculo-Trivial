import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/learning_history_generation_session.dart';
import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

void main() {
  const active = LearningHistoryGenerationState(
    generation: 2,
    status: 'active',
  );
  const resetting = LearningHistoryGenerationState(
    generation: 3,
    status: 'resetting',
  );

  test('refresh stores state only for the bound user', () async {
    final session = LearningHistoryGenerationSession();
    session.bindUser('user-a');
    final result = await session.refresh((uid) async {
      expect(uid, 'user-a');
      return active;
    });
    expect(result.generation, 2);
    expect(session.verifiedState, same(active));
  });

  test('switching account invalidates verified generation', () async {
    final session = LearningHistoryGenerationSession();
    session.bindUser('user-a');
    await session.refresh((_) async => active);
    session.bindUser('user-b');
    expect(session.verifiedState, isNull);
    expect(session.userId, 'user-b');
    await session.refresh((uid) async {
      expect(uid, 'user-b');
      return resetting;
    });
    expect(session.verifiedState?.allowsNewEvents, isFalse);
    session.bindUser(null);
    expect(session.verifiedState, isNull);
  });

  test('late response from previous account cannot be accepted', () async {
    final session = LearningHistoryGenerationSession();
    final delayed = Completer<LearningHistoryGenerationState>();
    session.bindUser('user-a');
    final pending = session.refresh((_) => delayed.future);
    session.bindUser('user-b');
    delayed.complete(active);
    await expectLater(pending, throwsStateError);
    expect(session.verifiedState, isNull);
  });

  test('invalidating before reset rejects an in-flight read', () async {
    final session = LearningHistoryGenerationSession();
    final delayed = Completer<LearningHistoryGenerationState>();
    session.bindUser('user-a');
    final pending = session.refresh((_) => delayed.future);
    session.invalidate();
    delayed.complete(active);
    await expectLater(pending, throwsStateError);
    expect(session.verifiedState, isNull);
  });

  test('failed server fetch never retains earlier authorization', () async {
    final session = LearningHistoryGenerationSession();
    session.bindUser('user-a');
    await session.refresh((_) async => active);
    await expectLater(
      session.refresh((_) async => throw StateError('offline')),
      throwsStateError,
    );
    expect(session.verifiedState, isNull);
  });

  test('old overlapping refresh cannot override a newer read', () async {
    final session = LearningHistoryGenerationSession();
    final delayed = Completer<LearningHistoryGenerationState>();
    session.bindUser('user-a');
    final older = session.refresh((_) => delayed.future);
    await session.refresh((_) async => resetting);
    delayed.complete(active);
    await expectLater(older, throwsStateError);
    expect(session.verifiedState, same(resetting));
  });

  test('unbound and invalid users are rejected', () async {
    final session = LearningHistoryGenerationSession();
    await expectLater(
      session.refresh((_) async => active),
      throwsStateError,
    );
    expect(() => session.bindUser(' '), throwsArgumentError);
    expect(() => session.bindUser('user/a'), throwsArgumentError);
  });
}
