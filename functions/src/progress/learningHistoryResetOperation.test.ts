import assert from "node:assert/strict";
import test from "node:test";

import {
  createLearningHistoryResetOperation,
  requireLearningHistoryResetOwner,
} from "./learningHistoryResetOperation";

test("each reset receives a distinct operation identity", () => {
  const first = createLearningHistoryResetOperation(1);
  const second = createLearningHistoryResetOperation(1);

  assert.equal(first.status, "resetting");
  assert.equal(first.generation, 1);
  assert.notEqual(first.operationId, second.operationId);
  assert.match(first.operationId, /^[0-9a-f-]{36}$/);
});

test("the matching operation can verify ownership", () => {
  const operation = createLearningHistoryResetOperation(4);

  assert.doesNotThrow(() =>
    requireLearningHistoryResetOwner(
      operation,
      4,
      operation.operationId,
    ),
  );
});

test("another operation cannot claim the same generation", () => {
  const first = createLearningHistoryResetOperation(4);
  const second = createLearningHistoryResetOperation(4);

  assert.throws(() =>
    requireLearningHistoryResetOwner(
      first,
      4,
      second.operationId,
    ),
  );
});

test("stale generation cannot finish an operation", () => {
  const operation = createLearningHistoryResetOperation(5);

  assert.throws(() =>
    requireLearningHistoryResetOwner(
      operation,
      4,
      operation.operationId,
    ),
  );
});

test("active or malformed states cannot claim ownership", () => {
  const operation = createLearningHistoryResetOperation(2);

  for (const state of [
    null,
    {},
    {generation: 2, status: "active"},
    {generation: 2, status: "resetting"},
    {generation: 2, status: "resetting", operationId: ""},
  ]) {
    assert.throws(() =>
      requireLearningHistoryResetOwner(
        state,
        2,
        operation.operationId,
      ),
    );
  }
});

test("invalid generations are rejected", () => {
  for (const generation of [0, -1, 1.5, Number.MAX_SAFE_INTEGER + 1]) {
    assert.throws(() =>
      createLearningHistoryResetOperation(generation),
    );
  }
});
