import assert from "node:assert/strict";
import test from "node:test";

import {
  HttpsError,
} from "firebase-functions/v2/https";

import {
  LearningHistoryGenerationState,
} from "./learningHistoryGeneration";

import {
  handleLearningHistoryReset,
  LearningHistoryResetExecutor,
  LearningHistoryResetRequest,
} from "./learningHistoryResetCallableHandler";

/**
 * Test-only executor that records calls without modifying Firestore.
 */
class FakeResetExecutor implements LearningHistoryResetExecutor {
  calls: string[] = [];
  result: LearningHistoryGenerationState = {
    generation: 1,
    status: "active",
  };
  shouldFail = false;

  /**
   * @param {string} uid Trusted authenticated user.
   * @return {Promise<LearningHistoryGenerationState>} Result.
   */
  async reset(uid: string): Promise<LearningHistoryGenerationState> {
    this.calls.push(uid);
    if (this.shouldFail) {
      throw new Error("private backend details");
    }
    return this.result;
  }
}

/**
 * @param {Partial<LearningHistoryResetRequest>} overrides Changes.
 * @return {LearningHistoryResetRequest} Valid default request.
 */
function request(
  overrides: Partial<LearningHistoryResetRequest> = {},
): LearningHistoryResetRequest {
  return {
    authUid: "user_a",
    authTime: Math.floor(Date.now() / 1000),
    data: {},
    ...overrides,
  };
}

/**
 * @param {unknown} error Thrown error.
 * @param {string} code Expected Firebase code.
 * @return {boolean} Whether the error matches.
 */
function hasCode(error: unknown, code: string): boolean {
  return error instanceof HttpsError && error.code === code;
}

test("reset rejects unauthenticated requests", async () => {
  const executor = new FakeResetExecutor();
  await assert.rejects(
    () => handleLearningHistoryReset(
      request({authUid: null}),
      executor,
    ),
    (error: unknown) => hasCode(error, "unauthenticated"),
  );
  assert.deepEqual(executor.calls, []);
});

test("reset rejects invalid authenticated UID", async () => {
  const executor = new FakeResetExecutor();
  for (const uid of ["", "  ", "user/other"]) {
    await assert.rejects(
      () => handleLearningHistoryReset(
        request({authUid: uid}),
        executor,
      ),
      (error: unknown) => hasCode(error, "unauthenticated"),
    );
  }
  assert.deepEqual(executor.calls, []);
});

test("reset rejects caller-supplied UID", async () => {
  const executor = new FakeResetExecutor();
  await assert.rejects(
    () => handleLearningHistoryReset(
      request({data: {uid: "user_b"}}),
      executor,
    ),
    (error: unknown) => hasCode(error, "invalid-argument"),
  );
  assert.deepEqual(executor.calls, []);
});

test("reset rejects invalid request bodies", async () => {
  const executor = new FakeResetExecutor();
  for (const data of [[], "reset", 1, {confirm: true}]) {
    await assert.rejects(
      () => handleLearningHistoryReset(
        request({data}),
        executor,
      ),
      (error: unknown) => hasCode(error, "invalid-argument"),
    );
  }
  assert.deepEqual(executor.calls, []);
});

test("reset requires recent authentication", async () => {
  const executor = new FakeResetExecutor();
  const now = Math.floor(Date.now() / 1000);
  for (const authTime of [null, now - 301, now + 60]) {
    await assert.rejects(
      () => handleLearningHistoryReset(
        request({authTime}),
        executor,
      ),
      (error: unknown) => hasCode(error, "failed-precondition"),
    );
  }
  assert.deepEqual(executor.calls, []);
});

test("reset accepts valid authenticated request", async () => {
  const executor = new FakeResetExecutor();
  const result = await handleLearningHistoryReset(
    request(),
    executor,
  );
  assert.deepEqual(result, {
    status: "ok",
    generation: 1,
  });
  assert.deepEqual(executor.calls, ["user_a"]);
});

test("reset accepts an empty null payload", async () => {
  const executor = new FakeResetExecutor();
  const result = await handleLearningHistoryReset(
    request({data: null}),
    executor,
  );
  assert.deepEqual(result, {
    status: "ok",
    generation: 1,
  });
});

test("reset rejects unconfirmed backend results", async () => {
  const invalidStates: LearningHistoryGenerationState[] = [
    {generation: 1, status: "resetting"},
    {generation: 0, status: "active"},
    {generation: -1, status: "active"},
    {generation: 1.5, status: "active"},
  ];

  for (const state of invalidStates) {
    const executor = new FakeResetExecutor();
    executor.result = state;

    await assert.rejects(
      () => handleLearningHistoryReset(request(), executor),
      (error: unknown) => hasCode(error, "internal"),
    );
    assert.deepEqual(executor.calls, ["user_a"]);
  }
});

test("reset hides backend failure details", async () => {
  const executor = new FakeResetExecutor();
  executor.shouldFail = true;

  await assert.rejects(
    () => handleLearningHistoryReset(request(), executor),
    (error: unknown) => (
      hasCode(error, "internal") &&
      error instanceof Error &&
      !error.message.includes("private backend details")
    ),
  );

  assert.deepEqual(executor.calls, ["user_a"]);
});
