import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {deleteApp, initializeApp} from "firebase-admin/app";
import {Firestore, getFirestore} from "firebase-admin/firestore";

import {
  createLearningHistoryOwnedResetCoordinator,
} from "./learningHistoryOwnedResetFactory";

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

/**
 * Executes an isolated scenario using only the Firestore Emulator.
 *
 * @param {string} label Test label.
 * @param {Function} run Asynchronous scenario callback.
 * @return {Promise<void>} Completion.
 */
async function withEmulator(
  label: string,
  run: (db: Firestore, uid: string, otherUid: string) =>
    Promise<void>,
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
  const uid = "test_owned_complete_" + suffix;
  const otherUid = "test_owned_other_" + suffix;

  const app = initializeApp({projectId}, label + "-" + suffix);
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

test("full owned reset purges events and preserves other data", async () => {
  await withEmulator("owned-complete", async (db, uid, otherUid) => {
    const user = db.collection("users").doc(uid);
    const other = db.collection("users").doc(otherUid);
    const history = user.collection("learningHistory");
    const progress = user.collection("progress").doc("current");
    const otherHistory = other.collection("learningHistory");

    const batch = db.batch();

    for (let index = 0; index < 65; index++) {
      batch.set(history.doc(`event-${index}`), {
        lesson: "algebra",
      });
    }

    batch.set(progress, {
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 12,
      points: 250,
    });

    batch.set(otherHistory.doc("keep"), {
      lesson: "geometria",
    });

    await batch.commit();

    const coordinator =
      createLearningHistoryOwnedResetCoordinator(db);

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

    assert.equal((await otherHistory.get()).size, 1);

    const control = await user
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.deepEqual(control.data(), result);
  });
});

test("legacy failure retains owned barrier and blocks retry", async () => {
  await withEmulator("owned-interrupted", async (db, uid) => {
    const user = db.collection("users").doc(uid);
    const history = user.collection("learningHistory");
    const progress = user.collection("progress").doc("current");

    await history.doc("old-event").set({lesson: "algebra"});

    await progress.set({
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 3,
    });

    const operations = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);
    const legacy = new LearningHistoryOwnedLegacyCleanupService(db);

    const coordinator = new LearningHistoryOwnedResetCoordinator({
      begin: (id) => operations.begin(id),
      purgeEvents: (id, operation) =>
        purge.purgeEvents(id, operation),
      async clearLegacyHistory() {
        throw new Error("simulated interruption");
      },
      finish: (id, operation) =>
        operations.finish(id, operation),
    });

    await assert.rejects(
      () => coordinator.reset(uid),
      /simulated interruption/,
    );

    assert.equal((await history.get()).size, 0);

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [{lesson: "algebra"}],
      completedLessons: 3,
    });

    const control = await user
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.equal(control.data()?.status, "resetting");
    assert.equal(control.data()?.generation, 1);
    assert.equal(typeof control.data()?.operationId, "string");

    await assert.rejects(() => legacy.clearLegacyHistory(
      uid,
      {
        generation: 1,
        status: "resetting",
        operationId: randomUUID(),
      },
    ));

    const freshCoordinator =
      createLearningHistoryOwnedResetCoordinator(db);

    await assert.rejects(() => freshCoordinator.reset(uid));

    assert.equal(
      (await user.collection("learningHistoryControl")
        .doc("current").get()).data()?.status,
      "resetting",
    );
  });
});
