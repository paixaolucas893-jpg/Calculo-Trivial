import {
  LearningHistoryGenerationState,
} from "./learningHistoryGeneration";

import {
  LearningHistoryResetOperation,
} from "./learningHistoryResetOperation";

/** Trusted dependencies for an operation-owned history reset. */
export interface OwnedResetDependencies {
  begin(uid: string): Promise<LearningHistoryResetOperation>;
  purgeEvents(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<void>;
  clearLegacyHistory(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<void>;
  finish(
    uid: string,
    operation: LearningHistoryResetOperation,
  ): Promise<LearningHistoryGenerationState>;
}

/**
 * Coordinates an owned reset without exposing a public endpoint.
 *
 * An interrupted operation remains blocked. Automatic recovery is
 * intentionally unsupported until a safe recovery protocol exists.
 */
export class LearningHistoryOwnedResetCoordinator {
  private readonly activeResets = new Set<string>();

  /**
   * @param {OwnedResetDependencies} deps Trusted backend operations.
   */
  constructor(private readonly deps: OwnedResetDependencies) {}

  /**
   * Purges history before completing the operation-owned barrier.
   *
   * @param {string} uid Trusted authenticated user ID.
   * @return {Promise<LearningHistoryGenerationState>} Active state.
   */
  async reset(uid: string): Promise<LearningHistoryGenerationState> {
    if (this.activeResets.has(uid)) {
      throw new Error("History reset already in progress.");
    }

    this.activeResets.add(uid);

    try {
      const operation = await this.deps.begin(uid);

      if (
        operation.status !== "resetting" ||
        !Number.isSafeInteger(operation.generation) ||
        operation.generation < 1 ||
        typeof operation.operationId !== "string" ||
        operation.operationId.length === 0
      ) {
        throw new Error("Invalid owned reset operation.");
      }

      await this.deps.purgeEvents(uid, operation);
      await this.deps.clearLegacyHistory(uid, operation);

      return await this.deps.finish(uid, operation);
    } finally {
      this.activeResets.delete(uid);
    }
  }
}
