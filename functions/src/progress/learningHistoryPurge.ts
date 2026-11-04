import {
  CollectionReference,
  Firestore,
} from "firebase-admin/firestore";

/**
 * Administrative primitive for purging individual learning events.
 *
 * This class is NOT an endpoint. Do not expose or call it during a client
 * reset until an epoch/generation guard blocks stale-device writes and
 * remote legacy-history restoration.
 */
export class LearningHistoryPurgeService {
  /**
   * @param {Firestore} firestore Admin SDK instance.
   */
  constructor(
    private readonly firestore: Firestore,
  ) {}

  /**
   * Deletes the authenticated user's event subcollection.
   *
   * Authentication and the stale-writer barrier belong to the trusted
   * orchestrator that will invoke this method in a later phase.
   *
   * @param {string} uid User ID supplied by a trusted backend.
   * @return {Promise<void>} Resolves only after remote deletion succeeds.
   */
  async purgeEvents(uid: string): Promise<void> {
    if (
      typeof uid !== "string" ||
      uid.trim().length === 0 ||
      uid.includes("/")
    ) {
      throw new Error("Invalid trusted user ID.");
    }

    const history: CollectionReference =
      this.firestore
        .collection("users")
        .doc(uid)
        .collection("learningHistory");

    await this.firestore.recursiveDelete(history);
  }
  /**
   * Clears the old history array without deleting unrelated progress.
   *
   * This does not block an outdated client from writing the field again;
   * a complete reset still requires a server-side legacy-write barrier.
   *
   * @param {string} uid Trusted user ID supplied by backend.
   * @return {Promise<void>} Resolves after a confirmed server update.
   */
  async clearLegacyHistory(uid: string): Promise<void> {
    if (
      typeof uid !== "string" ||
      uid.trim().length === 0 ||
      uid.includes("/")
    ) {
      throw new Error("Invalid trusted user ID.");
    }

    const progress = this.firestore
      .collection("users")
      .doc(uid)
      .collection("progress")
      .doc("current");

    const snapshot = await progress.get();
    if (snapshot.exists) {
      await progress.update({learningHistory: []});
    }
  }
}
