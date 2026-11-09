import assert from "node:assert/strict";
import test from "node:test";

import {
  HttpsError,
} from "firebase-functions/v2/https";

import {
  LearningHistoryGenerationState,
} from "./learningHistoryGeneration";

import {
  LearningHistoryResetCoordinator,
  LearningHistoryResetDependencies,
} from "./learningHistoryResetCoordinator";

import {
  handleLearningHistoryReset,
} from "./learningHistoryResetCallableHandler";

/**
 * Simulates the trusted backend without using production Firestore.
 */
class FakeDependencies implements LearningHistoryResetDependencies {
  state: LearningHistoryGenerationState = {
    generation: 0,
    status: "active",
  };
  steps: string[] = [];
  failPurge = false;
  failLegacy = false;

  /**
   * @param {string} uid Trusted user ID.
   * @return {Promise<LearningHistoryGenerationState>} Barrier state.
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
   * @param {string} uid Trusted user ID.
   * @return {Promise<void>} Completion.
   */
  async purgeEvents(uid: string): Promise<void> {
    this.steps.push("purge:" + uid);
    if (this.failPurge) {
      throw new Error("private purge failure");
    }
  }

  /**
   * @param {string} uid Trusted user ID.
   * @return {Promise<void>} Completion.
   */
  async clearLegacyHistory(uid: string): Promise<void> {
    this.steps.push("legacy:" + uid);
    if (this.failLegacy) {
      throw new Error("private legacy failure");
    }
  }

  /**
   * @param {string} uid Trusted user ID.
   * @param {number} generation Expected generation.
   * @return {Promise<LearningHistoryGenerationState>} Final state.
   */
  async finish(
    uid: string,
    generation: number,
  ): Promise<LearningHistoryGenerationState> {
    this.steps.push("finish:" + uid);
    assert.equal(this.state.status, "resetting");
    assert.equal(this.state.generation, generation);
    this.state = {
      generation,
      status: "active",
    };
    return this.state;
  }
}

/**
 * @param {string} uid Authenticated user ID.
 * @return {object} Valid request context.
 */
function request(uid = "user_a") {
  return {
    authUid: uid,
    authTime: Math.floor(Date.now() / 1000),
    data: {},
  };
}

test("authenticated reset completes operations in safe order", async () => {
  const deps = new FakeDependencies();
  const coordinator = new LearningHistoryResetCoordinator(deps);

  const result = await handleLearningHistoryReset(
    request(),
    coordinator,
  );

  assert.deepEqual(result, {
    status: "ok",
    generation: 1,
  });
  assert.deepEqual(deps.steps, [
    "begin:user_a",
    "purge:user_a",
    "legacy:user_a",
    "finish:user_a",
  ]);
  assert.deepEqual(deps.state, {
    generation: 1,
    status: "active",
  });
});

test("unauthenticated request never reaches coordinator", async () => {
  const deps = new FakeDependencies();
  const coordinator = new LearningHistoryResetCoordinator(deps);

  await assert.rejects(
    () => handleLearningHistoryReset(
      {...request(), authUid: null},
      coordinator,
    ),
    (error: unknown) => (
      error instanceof HttpsError &&
      error.code === "unauthenticated"
    ),
  );

  assert.deepEqual(deps.steps, []);
});

test("reset acts only on authenticated account", async () => {
  const deps = new FakeDependencies();
  const coordinator = new LearningHistoryResetCoordinator(deps);

  await handleLearningHistoryReset(
    request("user_b"),
    coordinator,
  );

  assert.deepEqual(deps.steps, [
    "begin:user_b",
    "purge:user_b",
    "legacy:user_b",
    "finish:user_b",
  ]);
});

test("failed purge leaves barrier blocked until safe retry", async () => {
  const deps = new FakeDependencies();
  deps.failPurge = true;
  const coordinator = new LearningHistoryResetCoordinator(deps);

  await assert.rejects(
    () => handleLearningHistoryReset(request(), coordinator),
    (error: unknown) => (
      error instanceof HttpsError &&
      error.code === "internal" &&
      !error.message.includes("private purge failure")
    ),
  );

  assert.deepEqual(deps.state, {
    generation: 1,
    status: "resetting",
  });

  deps.failPurge = false;

  const result = await handleLearningHistoryReset(
    request(),
    coordinator,
  );

  assert.deepEqual(result, {
    status: "ok",
    generation: 1,
  });
  assert.deepEqual(deps.state, {
    generation: 1,
    status: "active",
  });
});

test("legacy cleanup failure never reopens barrier", async () => {
  const deps = new FakeDependencies();
  deps.failLegacy = true;
  const coordinator = new LearningHistoryResetCoordinator(deps);

  await assert.rejects(
    () => handleLearningHistoryReset(request(), coordinator),
    (error: unknown) => (
      error instanceof HttpsError &&
      error.code === "internal"
    ),
  );

  assert.deepEqual(deps.state, {
    generation: 1,
    status: "resetting",
  });
  assert.equal(
    deps.steps.some((step) => step.startsWith("finish:")),
    false,
  );
});
