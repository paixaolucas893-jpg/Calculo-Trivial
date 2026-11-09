import {
  LearningHistoryGenerationState,
} from "./learningHistoryGeneration";

/**
 * Backend-only reset dependencies. No client-callable endpoint is exposed.
 */
export interface LearningHistoryResetDependencies {
  begin(uid: string): Promise<LearningHistoryGenerationState>;
  purgeEvents(uid: string): Promise<void>;
  clearLegacyHistory(uid: string): Promise<void>;
  finish(
    uid: string,
    expectedGeneration: number,
  ): Promise<LearningHistoryGenerationState>;
}

/**
 * Coordinates an event-history purge behind a persisted reset barrier.
 *
 * A failure after begin intentionally leaves the generation blocked.
 * Retrying resumes the same generation and attempts the purge again.
 * Do not expose this until legacy progress and client writes are guarded.
 */
export class LearningHistoryResetCoordinator {
  /**
   * @param {LearningHistoryResetDependencies} deps Trusted backend services.
   */
  constructor(
    private readonly deps: LearningHistoryResetDependencies,
  ) {}

  /**
   * Rotate and block, purge, then resume only after confirmed deletion.
   *
   * @param {string} uid Authenticated UID from a trusted backend.
   * @return {Promise<LearningHistoryGenerationState>} Active generation.
   */
  /** Tracks reset operations running in this coordinator instance. */
  private readonly activeResets = new Set<string>();

  /**
   * Prevents overlapping resets within this coordinator instance.
   *
   * @param {string} uid Authenticated user identifier.
   * @return {Promise<LearningHistoryGenerationState>} Reset result.
   */
  /**
   * Prevents overlapping resets in this coordinator instance.
   *
   * @param {string} uid Authenticated user identifier.
   * @return {Promise<LearningHistoryGenerationState>} Reset result.
   */
  async reset(uid: string): Promise<LearningHistoryGenerationState> {
    if (this.activeResets.has(uid)) {
      throw new Error("History reset already in progress.");
    }

    this.activeResets.add(uid);

    try {
      const barrier = await this.deps.begin(uid);
      if (barrier.status !== "resetting") {
        throw new Error("Reset barrier was not activated.");
      }

      await this.deps.purgeEvents(uid);
      // The legacy progress array is a separate persistence location.
      // Never reopen event writes until it has also been cleared.
      await this.deps.clearLegacyHistory(uid);
      return await this.deps.finish(uid, barrier.generation);
    } finally {
      this.activeResets.delete(uid);
    }
  }
}
