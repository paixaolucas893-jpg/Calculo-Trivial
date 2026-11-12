import assert from "node:assert/strict";
import test from "node:test";

import {
  LearningHistoryResetCoordinator,
} from "./learningHistoryResetCoordinator";

test("diagnoses overlapping resets for the same account", async () => {
  let generation = 0;
  let resetting = false;
  let activePurges = 0;
  let maximumConcurrentPurges = 0;
  let beginCount = 0;

  let releaseFirstPurge: () => void = () => {
    throw new Error("Purge gate not initialized.");
  };
  let signalFirstPurge: () => void = () => {
    throw new Error("Purge signal not initialized.");
  };

  const firstPurgeEntered = new Promise<void>((resolve) => {
    signalFirstPurge = resolve;
  });

  const firstPurgeGate = new Promise<void>((resolve) => {
    releaseFirstPurge = resolve;
  });

  const coordinator = new LearningHistoryResetCoordinator({
    async begin() {
      beginCount++;
      if (!resetting) {
        generation++;
        resetting = true;
      }
      return {generation, status: "resetting"};
    },
    async purgeEvents() {
      activePurges++;
      maximumConcurrentPurges = Math.max(
        maximumConcurrentPurges,
        activePurges,
      );

      try {
        if (activePurges === 1) {
          signalFirstPurge();
          await firstPurgeGate;
        }
      } finally {
        activePurges--;
      }
    },
    async clearLegacyHistory() {
      return;
    },
    async finish(_uid: string, expectedGeneration: number) {
      if (!resetting || expectedGeneration !== generation) {
        throw new Error("Stale reset completion.");
      }

      resetting = false;
      return {generation, status: "active"};
    },
  });

  const first = coordinator.reset("user_a");

  await firstPurgeEntered;

  const second = coordinator.reset("user_a");
  const outcomes = Promise.allSettled([first, second]);

  // Allow the rejected request to settle before releasing the first.
  await new Promise<void>((resolve) => setImmediate(resolve));

  const overlapDetected = maximumConcurrentPurges > 1;

  releaseFirstPurge();

  const results = await outcomes;

  assert.equal(beginCount, 1);
  assert.equal(results.length, 2);
  assert.equal(results[0].status, "fulfilled");
  assert.equal(results[1].status, "rejected");

  // Security requirement for the corrected implementation:
  // concurrent requests must never overlap their purges.
  assert.equal(overlapDetected, false);
});
