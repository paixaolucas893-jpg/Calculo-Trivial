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

import {
  LearningHistoryPurgeService,
} from "./learningHistoryPurge";

test("unowned purge cannot delete events of an owned reset", async () => {
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
  const uid = "test_unowned_purge_" + suffix;

  const app = initializeApp(
    {projectId},
    "unowned-purge-" + suffix,
  );

  const db = getFirestore(app);
  const userRef = db.collection("users").doc(uid);
  const history = userRef.collection("learningHistory");

  try {
    const owned = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryPurgeService(db);

    await history.doc("event-1").set({
      lesson: "algebra",
    });

    const operation = await owned.begin(uid);

    assert.equal(operation.status, "resetting");
    assert.equal(typeof operation.operationId, "string");

    // The old purge API supplies no operation identity.
    // It must not delete events protected by an owned reset.
    await assert.rejects(
      () => purge.purgeEvents(uid),
    );

    const event = await history.doc("event-1").get();
    assert.equal(event.exists, true);

    const control = await userRef
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.deepEqual(control.data(), operation);
  } finally {
    try {
      await db.recursiveDelete(userRef);
    } finally {
      await deleteApp(app);
    }
  }
});
