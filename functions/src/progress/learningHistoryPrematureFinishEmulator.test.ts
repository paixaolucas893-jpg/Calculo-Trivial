import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {
  deleteApp,
  initializeApp,
} from "firebase-admin/app";

import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("finish rejects reset with undeleted history", async () => {
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
  const uid = "test_premature_finish_" + suffix;

  const app = initializeApp(
    {projectId},
    "premature-finish-" + suffix,
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

    await progress.set({
      learningHistory: [{questionId: "old-question"}],
      completedLessons: 8,
    });

    const service = new LearningHistoryOwnedResetService(db);
    const operation = await service.begin(uid);

    assert.equal(operation.generation, 1);
    assert.equal(operation.status, "resetting");
    assert.equal(typeof operation.operationId, "string");

    // No purge or legacy cleanup has been executed.
    // Even the legitimate owner must not reopen the barrier.
    await assert.rejects(
      () => service.finish(uid, operation),
    );

    assert.deepEqual(
      (await control.get()).data(),
      operation,
    );

    assert.equal((await history.get()).size, 1);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [{questionId: "old-question"}],
      completedLessons: 8,
    });
  } finally {
    try {
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});
