import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/domain/learning_history_entry.dart';

/// Durable local outbox for immutable learning-history events.
///
/// Removes an entry only after the caller has confirmed it on the server.
/// This is deliberately separate from AppProgress until integration tests
/// cover account switching, reset, and data deletion.
class PendingLearningHistoryQueue {
  PendingLearningHistoryQueue(this._preferences);

  final SharedPreferences _preferences;
  Future<void> _writes = Future<void>.value();

  String _key(String userId) {
    if (userId.trim().isEmpty) {
      throw ArgumentError.value(userId, 'userId', 'Must not be empty');
    }
    return '${userId}_learning_history_pending_v1';
  }

  List<LearningHistoryEntry> _read(String userId) {
    final raw = _preferences.getString(_key(userId));
    if (raw == null) return <LearningHistoryEntry>[];
    try {
      final data = jsonDecode(raw);
      if (data is! List) return <LearningHistoryEntry>[];
      return data
          .map(LearningHistoryEntry.fromJson)
          .whereType<LearningHistoryEntry>()
          .where((event) => event.eventId != null)
          .toList(growable: false);
    } on FormatException {
      return <LearningHistoryEntry>[];
    }
  }

  Future<List<LearningHistoryEntry>> pending(String userId) async {
    await _writes;
    return List<LearningHistoryEntry>.unmodifiable(_read(userId));
  }

  Future<void> enqueue(String userId, LearningHistoryEntry entry) {
    if (entry.eventId == null) {
      throw ArgumentError('Pending event requires a stable UUID.');
    }
    return _serialize(() async {
      final items = _read(userId);
      if (items.any((item) => item.eventId == entry.eventId)) return;
      await _preferences.setString(
        _key(userId),
        jsonEncode(<Map<String, dynamic>>[
          ...items.map((item) => item.toJson()),
          entry.toJson(),
        ]),
      );
    });
  }

  /// Call only after a successful createOrConfirm for the same ID.
  Future<void> acknowledge(String userId, String eventId) {
    return _serialize(() async {
      final remaining = _read(userId)
          .where((entry) => entry.eventId != eventId)
          .map((entry) => entry.toJson())
          .toList(growable: false);
      await _preferences.setString(_key(userId), jsonEncode(remaining));
    });
  }

  Future<void> _serialize(Future<void> Function() action) {
    final result = _writes.then((_) => action());
    _writes = result.catchError((Object _) {});
    return result;
  }
}
