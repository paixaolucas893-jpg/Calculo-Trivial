import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {
  deleteApp,
  initializeApp,
} from "firebase-admin/app";

import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedResetCoordinator,
} from "./learningHistoryOwnedResetCoordinator";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

import {
  LearningHistoryOwnedLegacyCleanupService,
} from "./learningHistoryOwnedLegacyCleanupService";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

/**
 * Uses only a local emulator and an isolated demo project.
 *
 * @param {string} label Unique test label.
 * @param {Function} run Asynchronous test callback.
 * @return {Promise<void>} Completion.
 */
async function withEmulator(
  label: string,
  run: (
    db: ReturnType<typeof getFirestore>,
    uid: string,
    otherUid: string,
  ) => Promise<void>,
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
  const uid = "test_owned_flow_" + suffix;
  const otherUid = "test_other_flow_" + suffix;

  const app = initializeApp(
    {projectId},
    label + "-" + suffix,
  );

  const db = getFirestore(app);

  try {
    await run(db, uid, otherUid);
  } finally {
    try {
      await db.recursiveDelete(db.collection("users").doc(uid));
      await db.recursiveDelete(db.collection("users").doc(otherUid));
    } finally {
      await deleteApp(app);
    }
  }
}

test("owned reset deletes only history and preserves progress", async () => {
  await withEmulator("owned-flow", async (db, uid, otherUid) => {
    const user = db.collection("users").doc(uid);
    const other = db.collection("users").doc(otherUid);

    const history = user.collection("learningHistory");
    const progress = user.collection("progress").doc("current");
    const otherProgress = other.collection("progress").doc("current");

    await history.doc("event-1").set({lesson: "algebra"});
    await history.doc("event-2").set({lesson: "funcoes"});

    await progress.set({
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 12,
      points: 250,
    });

    await otherProgress.set({
      learningHistory: [{lesson: "geometria"}],
      completedLessons: 7,
    });

    const owned = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);
    const legacy = new LearningHistoryOwnedLegacyCleanupService(db);

    const coordinator = new LearningHistoryOwnedResetCoordinator({
      begin: (id) => owned.begin(id),
      purgeEvents: (id, operation) => purge.purgeEvents(id, operation),
      clearLegacyHistory: (id, operation) =>
        legacy.clearLegacyHistory(id, operation),
      finish: (id, operation) => owned.finish(id, operation),
    });

    const result = await coordinator.reset(uid);

    assert.deepEqual(result, {
      generation: 1,
      status: "active",
    });

    assert.equal((await history.get()).size, 0);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [],
      completedLessons: 12,
      points: 250,
    });

    assert.deepEqual((await otherProgress.get()).data(), {
      learningHistory: [{lesson: "geometria"}],
      completedLessons: 7,
    });

    const control = await user
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.deepEqual(control.data(), result);
  });
});

test("purge failure leaves owned reset blocked", async () => {
  await withEmulator("owned-failure", async (db, uid) => {
    const user = db.collection("users").doc(uid);
    const history = user.collection("learningHistory");
    const progress = user.collection("progress").doc("current");

    await history.doc("event-1").set({lesson: "algebra"});
    await progress.set({
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 3,
    });

    const owned = new LearningHistoryOwnedResetService(db);
    const legacy = new LearningHistoryOwnedLegacyCleanupService(db);

    const coordinator = new LearningHistoryOwnedResetCoordinator({
      begin: (id) => owned.begin(id),
      async purgeEvents() {
        throw new Error("simulated purge failure");
      },
      clearLegacyHistory: (id, operation) =>
        legacy.clearLegacyHistory(id, operation),
      finish: (id, operation) => owned.finish(id, operation),
    });

    await assert.rejects(
      () => coordinator.reset(uid),
      /simulated purge failure/,
    );

    const control = await user
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.equal(control.data()?.generation, 1);
    assert.equal(control.data()?.status, "resetting");
    assert.equal(typeof control.data()?.operationId, "string");

    assert.equal((await history.get()).size, 1);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 3,
    });

    await assert.rejects(() => owned.begin(uid));
  });
});
