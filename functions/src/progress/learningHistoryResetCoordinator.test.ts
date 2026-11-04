import assert from "node:assert/strict";
import test from "node:test";

import {
  LearningHistoryGenerationState,
} from "./learningHistoryGeneration";
import {
  LearningHistoryResetCoordinator,
  LearningHistoryResetDependencies,
} from "./learningHistoryResetCoordinator";

/**
 * Test-only in-memory reset dependencies.
 */
class FakeResetDependencies implements LearningHistoryResetDependencies {
  state: LearningHistoryGenerationState = {
    generation: 0,
    status: "active",
  };
  steps: string[] = [];
  shouldFailPurge = false;

  /**
   * @param {string} uid Trusted user identifier.
   * @return {Promise<LearningHistoryGenerationState>} Reset barrier.
   */
  async begin(uid: string): Promise<LearningHistoryGenerationState> {
    this.steps.push("begin:" + uid);
    if (this.state.status === "active") {
      this.state = {
        generation: this.state.generation + 1,
        status: "resetting",
      };
    }
    return this.state;
  }

  /**
   * @param {string} uid Trusted user identifier.
   * @return {Promise<void>} Purge result.
   */
  async purgeEvents(uid: string): Promise<void> {
    this.steps.push("purge:" + uid);
    if (this.shouldFailPurge) {
      throw new Error("simulated purge failure");
    }
  }

  /**
   * @param {string} uid Trusted user identifier.
   * @param {number} expectedGeneration Reset generation.
   * @return {Promise<LearningHistoryGenerationState>} Active state.
   */
  async finish(
    uid: string,
    expectedGeneration: number,
  ): Promise<LearningHistoryGenerationState> {
    this.steps.push("finish:" + uid);
    assert.equal(this.state.status, "resetting");
    assert.equal(this.state.generation, expectedGeneration);
    this.state = {
      generation: expectedGeneration,
      status: "active",
    };
    return this.state;
  }
}

test("reset blocks then purges before reactivating history", async () => {
  const deps = new FakeResetDependencies();
  const service = new LearningHistoryResetCoordinator(deps);
  const result = await service.reset("uid_a");
  assert.deepEqual(result, {generation: 1, status: "active"});
  assert.deepEqual(deps.steps, [
    "begin:uid_a",
    "purge:uid_a",
    "finish:uid_a",
  ]);
});

test("failed deletion leaves barrier blocked for a safe retry", async () => {
  const deps = new FakeResetDependencies();
  const service = new LearningHistoryResetCoordinator(deps);
  deps.shouldFailPurge = true;

  await assert.rejects(
    () => service.reset("uid_a"),
    /simulated purge failure/,
  );
  assert.deepEqual(deps.state, {
    generation: 1,
    status: "resetting",
  });
  assert.deepEqual(deps.steps, ["begin:uid_a", "purge:uid_a"]);

  deps.shouldFailPurge = false;
  const result = await service.reset("uid_a");
  assert.deepEqual(result, {generation: 1, status: "active"});
});

test("barrier must be active before purge is attempted", async () => {
  const deps = new FakeResetDependencies();
  deps.begin = async () => ({generation: 2, status: "active"});
  const service = new LearningHistoryResetCoordinator(deps);
  await assert.rejects(
    () => service.reset("uid_a"),
    /Reset barrier was not activated/,
  );
  assert.deepEqual(deps.steps, []);
});
