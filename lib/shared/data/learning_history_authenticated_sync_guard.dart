/// Checks the active Firebase Auth identity immediately around remote I/O.
///
/// This is deliberately independent of Firebase for deterministic race tests.
class LearningHistoryAuthenticatedSyncGuard {
  const LearningHistoryAuthenticatedSyncGuard(this.currentUserId);

  final String? Function() currentUserId;

  void requireUser(String expectedUserId) {
    if (expectedUserId.trim().isEmpty ||
        expectedUserId.contains('/') ||
        currentUserId() != expectedUserId) {
      throw StateError('Learning-history authentication session changed.');
    }
  }
}
