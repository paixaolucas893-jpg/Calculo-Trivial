import {Firestore} from "firebase-admin/firestore";

import {
  LearningHistoryResetOperation,
  requireLearningHistoryResetOwner,
} from "./learningHistoryResetOperation";

/**
 * Clears the legacy history field behind an owned reset barrier.
 *
 * Not connected to a public endpoint.
 */
export class LearningHistoryOwnedLegacyCleanupService {
  /**
   * @param {Firestore} firestore Trusted Admin SDK instance.
   */
  constructor(private readonly firestore: Firestore) {}

  /**
   * Clears legacy history only while the operation owns the barrier.
   *
   * @param {string} uid Trusted authenticated user ID.
   * @param {LearningHistoryResetOperation} operation Owned reset.
   * @return {Promise<void>} Completion.
   */
  async clearLegacyHistory(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<void> {
    if (
      typeof uid !== "string" ||
      uid.trim().length === 0 ||
      uid.includes("/")
    ) {
      throw new Error("Invalid trusted user ID.");
    }

    const user = this.firestore.collection("users").doc(uid);

    const control = user
      .collection("learningHistoryControl")
      .doc("current");

    const progress = user
      .collection("progress")
      .doc("current");

    await this.firestore.runTransaction(async (tx) => {
      const barrier = await tx.get(control);

      requireLearningHistoryResetOwner(
        barrier.data(),
        operation.generation,
        operation.operationId,
      );

      const snapshot = await tx.get(progress);

      if (snapshot.exists) {
        tx.update(progress, {learningHistory: []});
      }
    });
  }
}
