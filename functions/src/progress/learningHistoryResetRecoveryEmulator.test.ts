import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {deleteApp, initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";
import {HttpsError} from "firebase-functions/v2/https";

import {
  LearningHistoryOwnedLegacyCleanupService,
} from "./learningHistoryOwnedLegacyCleanupService";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetCoordinator,
} from "./learningHistoryOwnedResetCoordinator";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

import {
  handleLearningHistoryReset,
} from "./learningHistoryResetCallableHandler";

/**
 * Verifies a fail-closed interruption in the local emulator.
 *
 * @param {string} failurePoint Stage to interrupt.
 * @return {Promise<void>} Completion.
 */
async function verifyInterruptedReset(
  failurePoint: "purge" | "legacy",
): Promise<void> {
  const host = process.env.FIRESTORE_EMULATOR_HOST;
  const projectId = "demo-calculo-trivial";

  if (
    !host ||
    !/^(localhost|127\.0\.0\.1):[0-9]+$/.test(host)
  ) {
    throw new Error("Local Firestore Emulator is required.");
  }

  if (
    (process.env.GCLOUD_PROJECT &&
      process.env.GCLOUD_PROJECT !== projectId) ||
    (process.env.GOOGLE_CLOUD_PROJECT &&
      process.env.GOOGLE_CLOUD_PROJECT !== projectId)
  ) {
    throw new Error("Unexpected Firebase project.");
  }

  const suffix = randomUUID().replace(/-/g, "");
  const uid = "test_owned_recovery_" + suffix;

  const app = initializeApp(
    {projectId},
    "owned-recovery-" + suffix,
  );

  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);

  const control = user
    .collection("learningHistoryControl")
    .doc("current");

  const history = user.collection("learningHistory");
  const progress = user.collection("progress").doc("current");

  try {
    await history.doc("event-1").set({
      questionId: "old-question",
    });

    await progress.set({
      learningHistory: [{questionId: "old-question"}],
      studyStreak: 4,
    });

    const operations = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);
    const legacy = new LearningHistoryOwnedLegacyCleanupService(db);

    const coordinator = new LearningHistoryOwnedResetCoordinator({
      begin: (id) => operations.begin(id),

      purgeEvents: async (id, operation) => {
        if (failurePoint === "purge") {
          throw new Error("simulated private purge failure");
        }

        await purge.purgeEvents(id, operation);
      },

      clearLegacyHistory: async (id, operation) => {
        if (failurePoint === "legacy") {
          throw new Error("simulated private legacy failure");
        }

        await legacy.clearLegacyHistory(id, operation);
      },

      finish: (id, operation) =>
        operations.finish(id, operation),
    });

    const request = {
      authUid: uid,
      authTime: Math.floor(Date.now() / 1000),
      data: {},
    };

    const privateError = (error: unknown) =>
      error instanceof HttpsError &&
      error.code === "internal" &&
      !error.message.includes("simulated private");

    await assert.rejects(
      () => handleLearningHistoryReset(request, coordinator),
      privateError,
    );

    const barrier = (await control.get()).data();

    assert.equal(barrier?.generation, 1);
    assert.equal(barrier?.status, "resetting");
    assert.equal(typeof barrier?.operationId, "string");

    const remainingEvents = failurePoint === "purge" ? 1 : 0;
    assert.equal((await history.get()).size, remainingEvents);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [{questionId: "old-question"}],
      studyStreak: 4,
    });

    // A second backend instance cannot acquire an unfinished reset.
    const secondCoordinator = new LearningHistoryOwnedResetCoordinator({
      begin: (id) => operations.begin(id),
      purgeEvents: (id, operation) =>
        purge.purgeEvents(id, operation),
      clearLegacyHistory: (id, operation) =>
        legacy.clearLegacyHistory(id, operation),
      finish: (id, operation) =>
        operations.finish(id, operation),
    });

    await assert.rejects(
      () => handleLearningHistoryReset(request, secondCoordinator),
      privateError,
    );

    assert.deepEqual((await control.get()).data(), barrier);

    assert.equal((await history.get()).size, remainingEvents);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [{questionId: "old-question"}],
      studyStreak: 4,
    });
  } finally {
    try {
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
}

test("purge interruption preserves barrier and rejects retry", async () => {
  await verifyInterruptedReset("purge");
});

test("legacy interruption preserves barrier and rejects retry", async () => {
  await verifyInterruptedReset("legacy");
});
