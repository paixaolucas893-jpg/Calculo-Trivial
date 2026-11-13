import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:calcquest/shared/domain/learning_history_generation_state.dart';

/// Read-only lookup for the server-owned learning-history reset barrier.
///
/// This service is not connected to event uploading or the reset button yet.
/// An unavailable server must not be mistaken for a missing control document.
class LearningHistoryGenerationReader {
  LearningHistoryGenerationReader(this._firestore);

  final FirebaseFirestore _firestore;

  /// Returns the current server state, or legacy generation zero only when
  /// the server confirms that the control document does not exist.
  Future<LearningHistoryGenerationState> read(String userId) async {
    if (userId.trim().isEmpty || userId.contains('/')) {
      throw ArgumentError.value(userId, 'userId', 'Invalid user ID');
    }

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('learningHistoryControl')
        .doc('current')
        .get(const GetOptions(source: Source.server));

    final data = snapshot.data();
    if (!snapshot.exists) {
      return LearningHistoryGenerationState.legacy;
    }
    if (data == null) {
      throw const FormatException('Missing learning-history control payload.');
    }
    return LearningHistoryGenerationState.fromJson(data);
  }
}
