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
  LearningHistoryGenerationService,
} from "./learningHistoryGenerationService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("legacy finish cannot bypass an owned reset", async () => {
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
  const uid = "test_legacy_bypass_" + suffix;

  const app = initializeApp(
    {projectId},
    "legacy-bypass-" + suffix,
  );

  const db = getFirestore(app);
  const userRef = db.collection("users").doc(uid);

  try {
    const owned = new LearningHistoryOwnedResetService(db);
    const legacy = new LearningHistoryGenerationService(db);

    const operation = await owned.begin(uid);

    const control = userRef
      .collection("learningHistoryControl")
      .doc("current");

    assert.deepEqual(
      (await control.get()).data(),
      operation,
    );

    // Legacy callers must not close a reset they do not own.
    await assert.rejects(
      () => legacy.finish(uid, operation.generation),
    );

    // The authorized operation must remain unchanged.
    assert.deepEqual(
      (await control.get()).data(),
      operation,
    );

    // The legitimate owner can still complete the operation.
    const result = await owned.finish(uid, operation);

    assert.deepEqual(result, {
      generation: 1,
      status: "active",
    });
  } finally {
    try {
      await db.recursiveDelete(userRef);
    } finally {
      await deleteApp(app);
    }
  }
});
