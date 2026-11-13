import {Firestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedLegacyCleanupService,
} from "./learningHistoryOwnedLegacyCleanupService";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetCoordinator,
} from "./learningHistoryOwnedResetCoordinator";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

/**
 * Creates an internal operation-fenced reset workflow.
 *
 * Not exported from the Cloud Functions entrypoint.
 *
 * @param {Firestore} firestore Trusted Admin SDK instance.
 * @return {LearningHistoryOwnedResetCoordinator} Coordinator.
 */
export function createLearningHistoryOwnedResetCoordinator(
  firestore: Firestore,
): LearningHistoryOwnedResetCoordinator {
  const operations = new LearningHistoryOwnedResetService(firestore);
  const purge = new LearningHistoryOwnedPurgeService(firestore);
  const legacy = new LearningHistoryOwnedLegacyCleanupService(firestore);

  return new LearningHistoryOwnedResetCoordinator({
    begin: (uid) => operations.begin(uid),
    purgeEvents: (uid, operation) =>
      purge.purgeEvents(uid, operation),
    clearLegacyHistory: (uid, operation) =>
      legacy.clearLegacyHistory(uid, operation),
    finish: (uid, operation) =>
      operations.finish(uid, operation),
  });
}
