import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {deleteApp, initializeApp} from "firebase-admin/app";
import {Firestore, getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

/**
 * Runs an isolated local Firestore Emulator scenario.
 *
 * @param {string} label Scenario identifier.
 * @param {Function} run Scenario callback.
 * @return {Promise<void>} Completion.
 */
async function withEmulator(
  label: string,
  run: (db: Firestore, uid: string) => Promise<void>,
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
  const uid = "test_stale_owned_purge_" + suffix;

  const app = initializeApp(
    {projectId},
    label + "-" + suffix,
  );

  const db = getFirestore(app);

  try {
    await run(db, uid);
  } finally {
    try {
      await db.recursiveDelete(db.collection("users").doc(uid));
    } finally {
      await deleteApp(app);
    }
  }
}

test("old operation cannot delete after ownership changes", async () => {
  await withEmulator("stale-owner", async (db, uid) => {
    const user = db.collection("users").doc(uid);
    const history = user.collection("learningHistory");
    const control = user
      .collection("learningHistoryControl")
      .doc("current");

    const batch = db.batch();

    for (let index = 0; index < 65; index++) {
      batch.set(history.doc(`event-${index}`), {
        lesson: "algebra",
      });
    }

    await batch.commit();

    const operations = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);

    const original = await operations.begin(uid);

    const firstDeleted = await purge.purgeBatch(uid, original);

    assert.equal(firstDeleted, 40);
    assert.equal((await history.get()).size, 25);

    // Simulate a control-plane ownership change in the emulator.
    // A production recovery procedure must never perform this
    // takeover without establishing safe execution fencing.
    const replacement = {
      generation: original.generation,
      status: "resetting" as const,
      operationId: randomUUID(),
    };

    await control.set(replacement);

    await assert.rejects(() => purge.purgeBatch(uid, original));

    assert.equal((await history.get()).size, 25);
    assert.deepEqual((await control.get()).data(), replacement);

    await purge.purgeEvents(uid, replacement);

    assert.equal((await history.get()).size, 0);

    const finished = await operations.finish(uid, replacement);

    assert.deepEqual(finished, {
      generation: 1,
      status: "active",
    });
  });
});

test("completed operation cannot purge a later generation", async () => {
  await withEmulator("stale-generation", async (db, uid) => {
    const user = db.collection("users").doc(uid);
    const history = user.collection("learningHistory");

    const operations = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);

    const first = await operations.begin(uid);
    await purge.purgeEvents(uid, first);
    await operations.finish(uid, first);

    await history.doc("new-event").set({
      lesson: "funcoes",
    });

    const second = await operations.begin(uid);

    assert.equal(second.generation, 2);

    await assert.rejects(() => purge.purgeBatch(uid, first));

    assert.equal((await history.get()).size, 1);

    await purge.purgeEvents(uid, second);

    assert.equal((await history.get()).size, 0);

    const finished = await operations.finish(uid, second);

    assert.deepEqual(finished, {
      generation: 2,
      status: "active",
    });
  });
});
