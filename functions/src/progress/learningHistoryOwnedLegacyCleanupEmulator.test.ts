import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {deleteApp, initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedLegacyCleanupService,
} from "./learningHistoryOwnedLegacyCleanupService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("legacy cleanup requires ownership and preserves progress", async () => {
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
  const uid = "test_owned_legacy_" + suffix;

  const app = initializeApp(
    {projectId},
    "owned-legacy-" + suffix,
  );

  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);

  const progress = user.collection("progress").doc("current");

  try {
    await progress.set({
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 12,
      points: 250,
    });

    const owned = new LearningHistoryOwnedResetService(db);
    const cleanup = new LearningHistoryOwnedLegacyCleanupService(db);

    const operation = await owned.begin(uid);

    await assert.rejects(() => cleanup.clearLegacyHistory(
      uid,
      {...operation, operationId: randomUUID()},
    ));

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 12,
      points: 250,
    });

    await cleanup.clearLegacyHistory(uid, operation);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [],
      completedLessons: 12,
      points: 250,
    });

    const result = await owned.finish(uid, operation);

    assert.deepEqual(result, {
      generation: 1,
      status: "active",
    });

    await assert.rejects(() =>
      cleanup.clearLegacyHistory(uid, operation),
    );

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [],
      completedLessons: 12,
      points: 250,
    });
  } finally {
    try {
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});
