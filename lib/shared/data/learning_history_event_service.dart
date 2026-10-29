import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:calcquest/shared/domain/learning_history_entry.dart';

/// Firestore access for immutable learning attempts.
///
/// Does not change progress, XP, gold, or the legacy history array.
/// Callers must persist an event ID locally before the first network write.
class LearningHistoryEventService {
  LearningHistoryEventService(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _collection(String userId) {
    if (userId.trim().isEmpty) {
      throw ArgumentError.value(userId, 'userId', 'Must not be empty');
    }
    return _firestore.collection('users').doc(userId).collection('learningHistory');
  }

  /// Creates one immutable event at its stable UUID v4 document ID.
  ///
  /// A second create with the same ID is denied by Firestore rules. The caller
  /// should never generate a replacement ID when retrying an uncertain write.
  Future<void> create({
    required String userId,
    required LearningHistoryEntry entry,
  }) async {
    final eventId = entry.eventId;
    if (eventId == null || eventId.isEmpty) {
      throw ArgumentError('Event needs a stable ID before it can be written.');
    }

    final fields = entry.toJson();
    fields.remove('eventId');

    await _collection(userId).doc(eventId).set(<String, dynamic>{
      ...fields,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Loads the most recent entries, bounded by Firestore security rules.
  Future<List<LearningHistoryEntry>> recent({
    required String userId,
    int maxResults = 100,
  }) async {
    if (maxResults < 1 || maxResults > 100) {
      throw RangeError.range(maxResults, 1, 100, 'maxResults');
    }

    final result = await _collection(userId)
        .orderBy('occurredAtEpochMs', descending: true)
        .limit(maxResults)
        .get();

    return result.docs
        .map((document) => LearningHistoryEntry.fromJson(<String, dynamic>{
              ...document.data()..remove('createdAt'),
              'eventId': document.id,
            }))
        .whereType<LearningHistoryEntry>()
        .toList(growable: false);
  }
}
