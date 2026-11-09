import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {
  deleteApp,
  initializeApp,
} from "firebase-admin/app";

import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedLegacyCleanupService,
} from "./learningHistoryOwnedLegacyCleanupService";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("finish requires legacy cleanup after event purge", async () => {
  const projectId = "demo-calculo-trivial";
  const host = process.env.FIRESTORE_EMULATOR_HOST;

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
  const uid = "test_legacy_finish_guard_" + suffix;

  const app = initializeApp(
    {projectId},
    "legacy-finish-guard-" + suffix,
  );

  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);

  const history = user.collection("learningHistory");
  const progress = user.collection("progress").doc("current");

  const control = user
    .collection("learningHistoryControl")
    .doc("current");

  try {
    await history.doc("old-event").set({
      questionId: "old-question",
    });

    const originalProgress = {
      learningHistory: [{questionId: "old-question"}],
      completedLessons: 12,
      points: 250,
    };

    await progress.set(originalProgress);

    const owner = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);
    const cleanup = new LearningHistoryOwnedLegacyCleanupService(db);

    const operation = await owner.begin(uid);

    // Only event documents are deleted.
    await purge.purgeEvents(uid, operation);

    assert.equal((await history.get()).size, 0);
    assert.deepEqual(
      (await progress.get()).data(),
      originalProgress,
    );

    // The matching owner cannot finish with legacy history pending.
    await assert.rejects(
      () => owner.finish(uid, operation),
      /Legacy history cleanup is incomplete/,
    );

    assert.deepEqual(
      (await control.get()).data(),
      operation,
    );

    // Complete cleanup using the same authorized operation.
    await cleanup.clearLegacyHistory(uid, operation);

    assert.deepEqual(
      (await progress.get()).data(),
      {
        learningHistory: [],
        completedLessons: 12,
        points: 250,
      },
    );

    const finished = await owner.finish(uid, operation);

    assert.deepEqual(finished, {
      generation: 1,
      status: "active",
    });

    assert.deepEqual(
      (await control.get()).data(),
      finished,
    );

    assert.equal((await history.get()).size, 0);
  } finally {
    try {
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});
