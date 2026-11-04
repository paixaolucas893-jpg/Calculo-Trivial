import {Firestore} from "firebase-admin/firestore";

import {
  LearningHistoryGenerationService,
} from "./learningHistoryGenerationService";
import {
  LearningHistoryPurgeService,
} from "./learningHistoryPurge";
import {
  LearningHistoryResetCoordinator,
} from "./learningHistoryResetCoordinator";

/**
 * Internal composition root for the reset coordinator.
 *
 * A privileged caller must authenticate the target user and explicitly
 * authorize reset before invoking it. There is deliberately no Firebase
 * callable, trigger or export from the Cloud Functions entrypoint.
 *
 * Do not expose this operation until client generation handling, offline
 * queue invalidation and the entire progress-reset contract are ready.
 *
 * @param {Firestore} firestore Privileged Admin SDK Firestore instance.
 * @return {LearningHistoryResetCoordinator} Internal reset coordinator.
 */
export function createLearningHistoryResetCoordinator(
  firestore: Firestore,
): LearningHistoryResetCoordinator {
  const generations = new LearningHistoryGenerationService(firestore);
  const purge = new LearningHistoryPurgeService(firestore);

  return new LearningHistoryResetCoordinator({
    begin: (uid) => generations.begin(uid),
    purgeEvents: (uid) => purge.purgeEvents(uid),
    clearLegacyHistory: (uid) => purge.clearLegacyHistory(uid),
    finish: (uid, generation) => generations.finish(uid, generation),
  });
}
