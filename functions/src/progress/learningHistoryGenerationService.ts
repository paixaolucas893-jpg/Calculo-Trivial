import {
  Firestore,
} from "firebase-admin/firestore";

import {
  beginHistoryReset,
  finishHistoryReset,
  LearningHistoryGenerationState,
  parseHistoryGeneration,
} from "./learningHistoryGeneration";

/**
 * Persists the reset barrier in Firestore before any historical purge.
 *
 * This is backend-only. The client must not be allowed to update the
 * control document; no callable is exposed by this service.
 */
export class LearningHistoryGenerationService {
  /**
   * @param {Firestore} firestore Admin SDK instance.
   */
  constructor(
    private readonly firestore: Firestore,
  ) {}

  /**
   * @param {string} uid Trusted authenticated user ID.
   * @return {DocumentReference} Firestore control reference.
   */
  private control(uid: string) {
    if (
      typeof uid !== "string" ||
      uid.trim().length === 0 ||
      uid.includes("/")
    ) {
      throw new Error("Invalid trusted user ID.");
    }
    return this.firestore
      .collection("users")
      .doc(uid)
      .collection("learningHistoryControl")
      .doc("current");
  }

  /**
   * Atomically rotates the generation before deletion begins.
   * A repeated request while resetting preserves its current generation.
   *
   * @param {string} uid Trusted user ID.
   * @return {Promise<LearningHistoryGenerationState>} Resetting state.
   */
  async begin(uid: string): Promise<LearningHistoryGenerationState> {
    const ref = this.control(uid);
    return this.firestore.runTransaction(async (tx) => {
      const snapshot = await tx.get(ref);
      // A missing control record is the legacy generation zero.
      const current = snapshot.exists ?
        parseHistoryGeneration(snapshot.data()) :
        {generation: 0, status: "active" as const};
      const next = beginHistoryReset(current);
      tx.set(ref, next);
      return next;
    });
  }

  /**
   * Atomically finishes the same generation after remote purge succeeds.
   * A stale completion cannot reactivate a different reset.
   *
   * @param {string} uid Trusted user ID.
   * @param {number} expectedGeneration Reset generation.
   * @return {Promise<LearningHistoryGenerationState>} Active state.
   */
  async finish(
    uid: string,
    expectedGeneration: number,
  ): Promise<LearningHistoryGenerationState> {
    const ref = this.control(uid);
    return this.firestore.runTransaction(async (tx) => {
      const snapshot = await tx.get(ref);
      if (!snapshot.exists) {
        throw new Error("Missing history reset barrier.");
      }
      const current = parseHistoryGeneration(snapshot.data());
      const next = finishHistoryReset(current, expectedGeneration);
      tx.set(ref, next);
      return next;
    });
  }
}
