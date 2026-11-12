import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {deleteApp, initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("owned purge rejects another operation without deletion", async () => {
  const host = process.env.FIRESTORE_EMULATOR_HOST;
  const projectId = "demo-calculo-trivial";

  if (!host || !/^(localhost|127\.0\.0\.1):[0-9]+$/.test(host)) {
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
  const uid = "test_fenced_denial_" + suffix;
  const app = initializeApp({projectId}, "fenced-denial-" + suffix);
  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);

  try {
    const owned = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);

    await user.collection("learningHistory")
      .doc("event-1").set({lesson: "algebra"});

    const operation = await owned.begin(uid);

    await assert.rejects(() => purge.purgeBatch(uid, {
      ...operation,
      operationId: randomUUID(),
    }));

    assert.equal(
      (await user.collection("learningHistory").get()).size,
      1,
    );

    const control = await user
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.deepEqual(control.data(), operation);
  } finally {
    try {
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});

test("owned purge deletes multiple fenced batches", async () => {
  const host = process.env.FIRESTORE_EMULATOR_HOST;
  const projectId = "demo-calculo-trivial";

  if (!host || !/^(localhost|127\.0\.0\.1):[0-9]+$/.test(host)) {
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
  const uid = "test_fenced_batches_" + suffix;
  const app = initializeApp({projectId}, "fenced-batches-" + suffix);
  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);

  try {
    const owned = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);
    const history = user.collection("learningHistory");

    const batch = db.batch();

    for (let index = 0; index < 65; index++) {
      batch.set(history.doc(`event-${index}`), {
        lesson: "algebra",
      });
    }

    await batch.commit();

    const operation = await owned.begin(uid);
    await purge.purgeEvents(uid, operation);

    assert.equal((await history.get()).size, 0);

    const control = await user
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.deepEqual(control.data(), operation);

    const result = await owned.finish(uid, operation);

    assert.deepEqual(result, {
      generation: 1,
      status: "active",
    });
  } finally {
    try {
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});
