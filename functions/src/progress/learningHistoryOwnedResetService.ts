import {
  Firestore,
} from "firebase-admin/firestore";

import {
  beginHistoryReset,
  finishHistoryReset,
  LearningHistoryGenerationState,
  parseHistoryGeneration,
} from "./learningHistoryGeneration";

import {
  createLearningHistoryResetOperation,
  LearningHistoryResetOperation,
  requireLearningHistoryResetOwner,
} from "./learningHistoryResetOperation";

/**
 * Persists exclusive reset ownership in a Firestore transaction.
 *
 * Not connected to any public function or purge workflow.
 */
export class LearningHistoryOwnedResetService {
  /**
   * @param {Firestore} firestore Trusted Admin SDK instance.
   */
  constructor(private readonly firestore: Firestore) {}

  /**
   * @param {string} uid Trusted authenticated UID.
   * @return {DocumentReference} Control document.
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
   * Atomically acquires a new reset with a unique operation ID.
   *
   * @param {string} uid Trusted authenticated UID.
   * @return {Promise<LearningHistoryResetOperation>} Owned reset.
   */
  async begin(uid: string): Promise<LearningHistoryResetOperation> {
    const ref = this.control(uid);

    return this.firestore.runTransaction(async (tx) => {
      const snapshot = await tx.get(ref);

      const current = snapshot.exists ?
        parseHistoryGeneration(snapshot.data()) :
        {generation: 0, status: "active" as const};

      if (current.status === "resetting") {
        throw new Error("History reset already in progress.");
      }

      const next = beginHistoryReset(current);
      const operation = createLearningHistoryResetOperation(
        next.generation,
      );

      tx.set(ref, operation);
      return operation;
    });
  }

  /**
   * Finishes only the operation that acquired the reset.
   *
   * @param {string} uid Trusted authenticated UID.
   * @param {LearningHistoryResetOperation} operation Backend-held token.
   * @return {Promise<LearningHistoryGenerationState>} Active state.
   */
  async finish(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<LearningHistoryGenerationState> {
    const ref = this.control(uid);

    // Conservative preflight: Firestore queries do not expose missing
    // parent documents that still contain descendant collections.
    // listDocuments includes those references.
    //
    // This check is not transactional. A separate trusted administrative
    // writer could still create descendants after this preflight.
    // Automatic recovery must remain disabled.
    const user = this.firestore.collection("users").doc(uid);
    const references = await user.collection("learningHistory")
      .listDocuments();

    if (references.length > 0) {
      throw new Error("History reset has remaining document references.");
    }

    return this.firestore.runTransaction(async (tx) => {
      const snapshot = await tx.get(ref);

      if (!snapshot.exists) {
        throw new Error("Missing history reset barrier.");
      }

      requireLearningHistoryResetOwner(
        snapshot.data(),
        operation.generation,
        operation.operationId,
      );

      // All reads must occur before the control document is updated.
      const user = this.firestore.collection("users").doc(uid);
      const history = user.collection("learningHistory");
      const progress = user.collection("progress").doc("current");

      const remaining = await tx.get(history.limit(1));
      if (!remaining.empty) {
        throw new Error("History reset still has undeleted events.");
      }

      const legacy = await tx.get(progress);
      if (legacy.exists) {
        const value = legacy.data()?.learningHistory;
        if (
          value !== undefined &&
          (!Array.isArray(value) || value.length > 0)
        ) {
          throw new Error("Legacy history cleanup is incomplete.");
        }
      }

      const current = parseHistoryGeneration(snapshot.data());
      const next = finishHistoryReset(
        current,
        operation.generation,
      );

      tx.set(ref, next);
      return next;
    });
  }
}
