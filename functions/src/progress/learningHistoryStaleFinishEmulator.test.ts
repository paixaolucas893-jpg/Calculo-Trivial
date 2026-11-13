import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {
  deleteApp,
  initializeApp,
} from "firebase-admin/app";

import {
  getFirestore,
} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("another instance cannot finish without operation ID", async () => {
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
  const uid = "test_stale_finish_" + suffix;

  const appA = initializeApp(
    {projectId},
    "finish-a-" + suffix,
  );

  const appB = initializeApp(
    {projectId},
    "finish-b-" + suffix,
  );

  const dbA = getFirestore(appA);
  const dbB = getFirestore(appB);
  const userRef = dbA.collection("users").doc(uid);

  const controlRef = userRef
    .collection("learningHistoryControl")
    .doc("current");

  try {
    const instanceA = new LearningHistoryOwnedResetService(dbA);
    const instanceB = new LearningHistoryOwnedResetService(dbB);

    const acquired = await instanceA.begin(uid);

    assert.equal(acquired.generation, 1);
    assert.equal(acquired.status, "resetting");
    assert.equal(typeof acquired.operationId, "string");

    const unauthorized = {
      ...acquired,
      operationId: randomUUID(),
    };

    await assert.rejects(
      () => instanceB.finish(uid, unauthorized),
      /Reset operation is not authorized/,
    );

    // Unauthorized completion must not change the barrier.
    assert.deepEqual(
      (await controlRef.get()).data(),
      acquired,
    );

    // Only the matching operation identity may close it.
    const completed = await instanceA.finish(uid, acquired);

    assert.deepEqual(completed, {
      generation: 1,
      status: "active",
    });

    assert.deepEqual(
      (await controlRef.get()).data(),
      completed,
    );

    // Replaying a completed operation must be rejected.
    await assert.rejects(
      () => instanceB.finish(uid, acquired),
      /Reset operation is not authorized/,
    );
  } finally {
    try {
      await dbA.recursiveDelete(userRef);
    } finally {
      await Promise.all([
        deleteApp(appA),
        deleteApp(appB),
      ]);
    }
  }
});
