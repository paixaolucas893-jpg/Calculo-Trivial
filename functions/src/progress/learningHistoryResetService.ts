import {Firestore} from "firebase-admin/firestore";

import {
  LearningHistoryResetCoordinator,
} from "./learningHistoryResetCoordinator";

/**
 * Disabled legacy composition root.
 *
 * The old workflow does not authorize destructive stages with operationId.
 * Do not reconnect it to a callable or a background worker.
 *
 * @param {Firestore} _firestore Unused legacy dependency.
 */
export function createLearningHistoryResetCoordinator(
  _firestore: Firestore,
): LearningHistoryResetCoordinator {
  void _firestore;

  throw new Error(
    "Legacy history reset is disabled. Use the owned workflow.",
  );
}
