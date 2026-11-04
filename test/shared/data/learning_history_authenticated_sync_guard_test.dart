import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/learning_history_authenticated_sync_guard.dart';

void main() {
  test('allows operations only for the authenticated account', () {
    String? currentUserId = 'user-a';
    final guard = LearningHistoryAuthenticatedSyncGuard(() => currentUserId);

    expect(() => guard.requireUser('user-a'), returnsNormally);
    expect(() => guard.requireUser('user-b'), throwsStateError);

    currentUserId = 'user-b';
    expect(() => guard.requireUser('user-a'), throwsStateError);
    expect(() => guard.requireUser('user-b'), returnsNormally);
  });

  test('sign-out or malformed identity blocks synchronization', () {
    String? currentUserId = 'user-a';
    final guard = LearningHistoryAuthenticatedSyncGuard(() => currentUserId);

    expect(() => guard.requireUser(''), throwsStateError);
    expect(() => guard.requireUser('user/a'), throwsStateError);
    currentUserId = null;
    expect(() => guard.requireUser('user-a'), throwsStateError);
  });

  test('user switch during a remote operation fails second check', () async {
    String? currentUserId = 'user-a';
    final guard = LearningHistoryAuthenticatedSyncGuard(() => currentUserId);

    Future<void> simulatedWrite() async {
      guard.requireUser('user-a');
      await Future<void>.delayed(Duration.zero);
      guard.requireUser('user-a');
    }

    final pending = simulatedWrite();
    currentUserId = 'user-b';
    await expectLater(pending, throwsStateError);
  });
}
