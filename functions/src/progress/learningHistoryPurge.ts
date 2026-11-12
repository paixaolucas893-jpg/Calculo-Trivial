import {Firestore} from "firebase-admin/firestore";

/**
 * Disabled legacy history deletion API.
 *
 * Destructive operations must use the operation-owned,
 * transaction-fenced services instead.
 */
export class LearningHistoryPurgeService {
  /**
   * @param {Firestore} firestore Legacy constructor dependency.
   */
  constructor(private readonly firestore: Firestore) {}

  /**
   * Rejects unowned event deletion.
   *
   * @param {string} uid Trusted user identifier.
   */
  async purgeEvents(uid: string): Promise<void> {
    this.validateUid(uid);
    void this.firestore;

    throw new Error(
      "Legacy learning history purge is disabled.",
    );
  }

  /**
   * Rejects unowned legacy progress modification.
   *
   * @param {string} uid Trusted user identifier.
   */
  async clearLegacyHistory(uid: string): Promise<void> {
    this.validateUid(uid);
    void this.firestore;

    throw new Error(
      "Legacy learning history cleanup is disabled.",
    );
  }

  /**
   * Validates the trusted user identifier.
   *
   * @param {string} uid User identifier.
   */
  private validateUid(uid: string): void {
    if (
      typeof uid !== "string" ||
      uid.trim().length === 0 ||
      uid.includes("/")
    ) {
      throw new Error("Invalid trusted user ID.");
    }
  }
}
