import assert from "node:assert/strict";
import test from "node:test";

import {
  acceptsHistoryEvent,
  beginHistoryReset,
  finishHistoryReset,
  parseHistoryGeneration,
} from "./learningHistoryGeneration";

test("reset rotates the generation and blocks event uploads", () => {
  const before = {
    generation: 7,
    status: "active" as const,
  };
  const resetting = beginHistoryReset(before);
  assert.deepEqual(resetting, {
    generation: 8,
    status: "resetting",
  });
  assert.equal(acceptsHistoryEvent(resetting, 8), false);
  assert.equal(acceptsHistoryEvent(resetting, 7), false);

  const after = finishHistoryReset(resetting, 8);
  assert.deepEqual(after, {
    generation: 8,
    status: "active",
  });
  assert.equal(acceptsHistoryEvent(after, 7), false);
  assert.equal(acceptsHistoryEvent(after, 8), true);
});

test("retries preserve the same resetting generation", () => {
  const resetting = {
    generation: 4,
    status: "resetting" as const,
  };
  assert.deepEqual(beginHistoryReset(resetting), resetting);
});

test("stale reset completion cannot reopen event writes", () => {
  const resetting = {
    generation: 9,
    status: "resetting" as const,
  };
  assert.throws(
    () => finishHistoryReset(resetting, 8),
    /Stale or unfinished/,
  );
  assert.throws(
    () => finishHistoryReset({
      generation: 9,
      status: "active",
    }, 9),
    /Stale or unfinished/,
  );
});

test("corrupt generation and overflow fail closed", () => {
  assert.throws(() => parseHistoryGeneration({generation: -1, status: "active"}));
  assert.throws(() => parseHistoryGeneration({generation: 1.5, status: "active"}));
  assert.throws(() => parseHistoryGeneration({generation: "1", status: "active"}));
  assert.throws(() => parseHistoryGeneration({generation: 1, status: "unknown"}));
  assert.throws(() => parseHistoryGeneration(null));
  assert.throws(
    () => beginHistoryReset({
      generation: Number.MAX_SAFE_INTEGER,
      status: "active",
    }),
    /exhausted/,
  );
});

test("events cannot use a newer or invalid generation", () => {
  const state = {
    generation: 3,
    status: "active" as const,
  };
  assert.equal(acceptsHistoryEvent(state, 2), false);
  assert.equal(acceptsHistoryEvent(state, 4), false);
  assert.equal(acceptsHistoryEvent(state, 3.5), false);
  assert.equal(acceptsHistoryEvent(state, 3), true);
});
