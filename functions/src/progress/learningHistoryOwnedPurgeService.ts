import {Firestore} from "firebase-admin/firestore";

import {
  LearningHistoryResetOperation,
  requireLearningHistoryResetOwner,
} from "./learningHistoryResetOperation";

/**
 * Deletes event documents in operation-fenced transactions.
 *
 * This service is not wired to a public endpoint.
 */
export class LearningHistoryOwnedPurgeService {
  /**
   * @param {Firestore} firestore Trusted Admin SDK instance.
   */
  constructor(private readonly firestore: Firestore) {}

  /**
   * Deletes one bounded batch after validating persisted ownership.
   *
   * @param {string} uid Trusted authenticated user ID.
   * @param {LearningHistoryResetOperation} operation Owned operation.
   * @return {Promise<number>} Number of deleted event documents.
   */
  async purgeBatch(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<number> {
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

    const history = user.collection("learningHistory");

    return this.firestore.runTransaction(async (tx) => {
      const barrier = await tx.get(control);

      requireLearningHistoryResetOwner(
        barrier.data(),
        operation.generation,
        operation.operationId,
      );

      const events = await tx.get(history.limit(40));

      for (const event of events.docs) {
        tx.delete(event.ref);
      }

      return events.size;
    });
  }

  /**
   * Purges event documents until no documents remain.
   *
   * @param {string} uid Trusted authenticated user ID.
   * @param {LearningHistoryResetOperation} operation Owned operation.
   * @return {Promise<void>} Completion.
   */
  async purgeEvents(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<void> {
    let deleted: number;

    do {
      deleted = await this.purgeBatch(uid, operation);
    } while (deleted > 0);
  }
}
