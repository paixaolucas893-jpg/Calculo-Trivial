import assert from "node:assert/strict";
import test from "node:test";

import {
  LearningHistoryOwnedResetCoordinator,
  OwnedResetDependencies,
} from "./learningHistoryOwnedResetCoordinator";

import {
  LearningHistoryResetOperation,
} from "./learningHistoryResetOperation";

const operation: LearningHistoryResetOperation = {
  generation: 4,
  status: "resetting",
  operationId: "test-operation-4",
};

test("owned reset executes purge before authorized finish", async () => {
  const steps: string[] = [];

  const deps: OwnedResetDependencies = {
    async begin(uid) {
      assert.equal(uid, "uid_a");
      steps.push("begin");
      return operation;
    },
    async purgeEvents() {
      steps.push("purge");
    },
    async clearLegacyHistory() {
      steps.push("legacy");
    },
    async finish(uid, owned) {
      assert.equal(uid, "uid_a");
      assert.deepEqual(owned, operation);
      steps.push("finish");
      return {generation: 4, status: "active"};
    },
  };

  const coordinator = new LearningHistoryOwnedResetCoordinator(deps);
  const result = await coordinator.reset("uid_a");

  assert.deepEqual(steps, [
    "begin",
    "purge",
    "legacy",
    "finish",
  ]);

  assert.deepEqual(result, {
    generation: 4,
    status: "active",
  });
});

test("purge failure never invokes finish", async () => {
  const steps: string[] = [];

  const deps: OwnedResetDependencies = {
    async begin() {
      steps.push("begin");
      return operation;
    },
    async purgeEvents() {
      steps.push("purge");
      throw new Error("simulated purge failure");
    },
    async clearLegacyHistory() {
      steps.push("legacy");
    },
    async finish() {
      steps.push("finish");
      return {generation: 4, status: "active"};
    },
  };

  const coordinator = new LearningHistoryOwnedResetCoordinator(deps);

  await assert.rejects(
    () => coordinator.reset("uid_a"),
    /simulated purge failure/,
  );

  assert.deepEqual(steps, ["begin", "purge"]);
});

test("legacy cleanup failure never invokes finish", async () => {
  const steps: string[] = [];

  const deps: OwnedResetDependencies = {
    async begin() {
      steps.push("begin");
      return operation;
    },
    async purgeEvents() {
      steps.push("purge");
    },
    async clearLegacyHistory() {
      steps.push("legacy");
      throw new Error("simulated legacy failure");
    },
    async finish() {
      steps.push("finish");
      return {generation: 4, status: "active"};
    },
  };

  const coordinator = new LearningHistoryOwnedResetCoordinator(deps);

  await assert.rejects(
    () => coordinator.reset("uid_a"),
    /simulated legacy failure/,
  );

  assert.deepEqual(steps, ["begin", "purge", "legacy"]);
});

test("overlapping calls cannot acquire reset twice", async () => {
  let releasePurge: (() => void) | undefined;
  let acquisitions = 0;

  const blockedPurge = new Promise<void>((resolve) => {
    releasePurge = resolve;
  });

  const deps: OwnedResetDependencies = {
    async begin() {
      acquisitions++;
      return operation;
    },
    async purgeEvents() {
      await blockedPurge;
    },
    async clearLegacyHistory() {
      assert.ok(true);
    },
    async finish() {
      return {generation: 4, status: "active"};
    },
  };

  const coordinator = new LearningHistoryOwnedResetCoordinator(deps);

  const first = coordinator.reset("uid_a");

  try {
    await assert.rejects(
      () => coordinator.reset("uid_a"),
      /already in progress/,
    );

    assert.equal(acquisitions, 1);
  } finally {
    releasePurge?.();
  }

  await first;
  assert.equal(acquisitions, 1);
});
