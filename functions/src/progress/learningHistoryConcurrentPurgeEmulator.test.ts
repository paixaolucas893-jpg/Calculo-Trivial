import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {
  deleteApp,
  initializeApp,
} from "firebase-admin/app";

import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("concurrent owned purge batches do not double delete", async () => {
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
  const uid = "test_concurrent_purge_" + suffix;

  const appA = initializeApp(
    {projectId},
    "concurrent-purge-a-" + suffix,
  );

  const appB = initializeApp(
    {projectId},
    "concurrent-purge-b-" + suffix,
  );

  const dbA = getFirestore(appA);
  const dbB = getFirestore(appB);

  const user = dbA.collection("users").doc(uid);
  const history = user.collection("learningHistory");

  try {
    const batch = dbA.batch();

    for (let i = 0; i < 65; i++) {
      batch.set(history.doc("event-" + i), {
        questionId: "q-" + i,
      });
    }

    await batch.commit();

    const owner = new LearningHistoryOwnedResetService(dbA);
    const operation = await owner.begin(uid);

    const purgeA = new LearningHistoryOwnedPurgeService(dbA);
    const purgeB = new LearningHistoryOwnedPurgeService(dbB);

    // Both instances hold the same legitimate operation identity.
    // Their transactional batches run concurrently.
    const [deletedA, deletedB] = await Promise.all([
      purgeA.purgeBatch(uid, operation),
      purgeB.purgeBatch(uid, operation),
    ]);

    assert.equal(deletedA + deletedB, 65);
    assert.equal((await history.get()).size, 0);

    const control = user
      .collection("learningHistoryControl")
      .doc("current");

    assert.deepEqual((await control.get()).data(), operation);

    const finished = await owner.finish(uid, operation);

    assert.deepEqual(finished, {
      generation: 1,
      status: "active",
    });

    // A completed operation must not delete any later event.
    await history.doc("new-event").set({
      questionId: "new-question",
      generation: 1,
    });

    await assert.rejects(
      () => purgeB.purgeBatch(uid, operation),
    );

    assert.equal((await history.get()).size, 1);
  } finally {
    try {
      await dbA.recursiveDelete(user);
    } finally {
      await Promise.all([
        deleteApp(appA),
        deleteApp(appB),
      ]);
    }
  }
});
