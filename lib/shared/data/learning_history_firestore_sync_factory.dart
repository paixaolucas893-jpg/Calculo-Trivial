import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/data/learning_history_authenticated_sync_guard.dart';
import 'package:calcquest/shared/data/learning_history_event_service.dart';
import 'package:calcquest/shared/data/learning_history_generation_reader.dart';
import 'package:calcquest/shared/data/learning_history_generation_session.dart';
import 'package:calcquest/shared/data/learning_history_outbox_sync_service.dart';
import 'package:calcquest/shared/data/pending_learning_history_queue.dart';

/// Internal Firestore composition of the offline outbox synchronization.
///
/// This factory does not start uploads. It must remain detached from startup,
/// background tasks and reset until end-to-end security checks are complete.
/// Firebase Auth is checked before and after every asynchronous server call;
/// Firestore rules remain the authority for generation changes mid-write.
LearningHistoryOutboxSyncService createFirestoreLearningHistoryOutboxSync({
  required FirebaseAuth auth,
  required FirebaseFirestore firestore,
  required SharedPreferences preferences,
  required LearningHistoryGenerationSession session,
}) {
  final authGuard = LearningHistoryAuthenticatedSyncGuard(
    () => auth.currentUser?.uid,
  );
  final reader = LearningHistoryGenerationReader(firestore);
  final events = LearningHistoryEventService(firestore);

  return LearningHistoryOutboxSyncService(
    queue: PendingLearningHistoryQueue(preferences),
    session: session,
    readGeneration: (userId) async {
      authGuard.requireUser(userId);
      final state = await reader.read(userId);
      authGuard.requireUser(userId);
      return state;
    },
    writeOrConfirm: (userId, entry) async {
      authGuard.requireUser(userId);
      await events.createOrConfirm(userId: userId, entry: entry);
      authGuard.requireUser(userId);
    },
  );
}
