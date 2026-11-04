import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

/// Session-scoped, server-verified generation state.
///
/// No cached generation is trusted after a user change, reset, or failed
/// refresh. A late network response cannot authorize a different session.
/// This is an internal component; it does not enable uploads or reset.
class LearningHistoryGenerationSession {
  String? _userId;
  LearningHistoryGenerationState? _verifiedState;
  int _revision = 0;

  String? get userId => _userId;

  /// Null means no verified generation is available for this session.
  LearningHistoryGenerationState? get verifiedState => _verifiedState;

  void bindUser(String? userId) {
    if (userId != null && (userId.trim().isEmpty || userId.contains('/'))) {
      throw ArgumentError.value(userId, 'userId', 'Invalid user ID');
    }
    if (_userId == userId) return;
    _userId = userId;
    invalidate();
  }

  /// Call before a reset or whenever previously verified state is uncertain.
  void invalidate() {
    _revision++;
    _verifiedState = null;
  }

  /// Refresh from the server; never accept a stale in-flight response.
  ///
  /// [load] must use a server-only Firestore read, not cached data.
  Future<LearningHistoryGenerationState> refresh(
    Future<LearningHistoryGenerationState> Function(String userId) load,
  ) async {
    final currentUser = _userId;
    if (currentUser == null) {
      throw StateError('No authenticated user is bound.');
    }

    invalidate();
    final requestRevision = _revision;

    final result = await load(currentUser);
    if (_revision != requestRevision || _userId != currentUser) {
      throw StateError('Generation request belongs to an expired session.');
    }

    _verifiedState = result;
    return result;
  }
}
