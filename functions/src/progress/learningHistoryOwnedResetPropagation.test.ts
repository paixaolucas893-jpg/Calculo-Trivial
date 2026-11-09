import assert from "node:assert/strict";
import test from "node:test";

import {
  LearningHistoryOwnedResetCoordinator,
} from "./learningHistoryOwnedResetCoordinator";

import {
  LearningHistoryResetOperation,
} from "./learningHistoryResetOperation";

test("coordinator forwards ownership to each destructive stage", async () => {
  const operation: LearningHistoryResetOperation = {
    generation: 7,
    status: "resetting",
    operationId: "test-owned-operation",
  };

  const steps: string[] = [];

  const coordinator = new LearningHistoryOwnedResetCoordinator({
    async begin(uid) {
      assert.equal(uid, "student-1");
      steps.push("begin");
      return operation;
    },
    async purgeEvents(uid, owned) {
      assert.equal(uid, "student-1");
      assert.strictEqual(owned, operation);
      steps.push("purge");
    },
    async clearLegacyHistory(uid, owned) {
      assert.equal(uid, "student-1");
      assert.strictEqual(owned, operation);
      steps.push("legacy");
    },
    async finish(uid, owned) {
      assert.equal(uid, "student-1");
      assert.strictEqual(owned, operation);
      steps.push("finish");
      return {generation: 7, status: "active"};
    },
  });

  const result = await coordinator.reset("student-1");

  assert.deepEqual(steps, [
    "begin",
    "purge",
    "legacy",
    "finish",
  ]);

  assert.deepEqual(result, {
    generation: 7,
    status: "active",
  });
});
