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

test("two backend instances cannot acquire the same reset", async () => {
  const host = process.env.FIRESTORE_EMULATOR_HOST;

  if (!host || !/^(localhost|127\.0\.0\.1):[0-9]+$/.test(host)) {
    throw new Error("Local Firestore Emulator is required.");
  }

  const project = "demo-calculo-trivial";

  if (
    process.env.GCLOUD_PROJECT &&
    process.env.GCLOUD_PROJECT !== project
  ) {
    throw new Error("Unexpected Firebase project.");
  }

  const app = initializeApp(
    {projectId: project},
    "distributed-reset-test-" + randomUUID(),
  );

  const db = getFirestore(app);
  const uid = "test_distributed_" + randomUUID().replace(/-/g, "");
  const userRef = db.collection("users").doc(uid);

  try {
    const instanceA = new LearningHistoryGenerationService(db);
    const instanceB = new LearningHistoryGenerationService(db);

    const first = await instanceA.begin(uid);

    assert.deepEqual(first, {
      generation: 1,
      status: "resetting",
    });

    // A distinct backend instance must not acquire an active reset.
    await assert.rejects(() => instanceB.begin(uid));

    const snapshot = await userRef
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.equal(snapshot.data()?.generation, 1);
    assert.equal(snapshot.data()?.status, "resetting");
  } finally {
    try {
      await db.recursiveDelete(userRef);
    } finally {
      await deleteApp(app);
    }
  }
});
