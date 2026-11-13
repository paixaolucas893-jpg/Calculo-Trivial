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

test("Firestore enforces persistent reset ownership", async () => {
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
  const uid = "test_owned_" + suffix;

  const appA = initializeApp(
    {projectId},
    "owned-a-" + suffix,
  );

  const appB = initializeApp(
    {projectId},
    "owned-b-" + suffix,
  );

  const dbA = getFirestore(appA);
  const dbB = getFirestore(appB);
  const userRef = dbA.collection("users").doc(uid);

  try {
    const instanceA = new LearningHistoryOwnedResetService(dbA);
    const instanceB = new LearningHistoryOwnedResetService(dbB);

    const operation = await instanceA.begin(uid);

    assert.equal(operation.generation, 1);
    assert.equal(operation.status, "resetting");
    assert.equal(typeof operation.operationId, "string");

    const control = userRef
      .collection("learningHistoryControl")
      .doc("current");

    assert.deepEqual((await control.get()).data(), operation);

    await assert.rejects(() => instanceB.begin(uid));

    await assert.rejects(() => instanceB.finish(uid, {
      ...operation,
      operationId: randomUUID(),
    }));

    assert.deepEqual((await control.get()).data(), operation);

    const finished = await instanceA.finish(uid, operation);

    assert.deepEqual(finished, {
      generation: 1,
      status: "active",
    });

    assert.deepEqual((await control.get()).data(), finished);

    await assert.rejects(() => instanceA.finish(uid, operation));

    const second = await instanceB.begin(uid);

    assert.equal(second.generation, 2);
    assert.notEqual(second.operationId, operation.operationId);

    await assert.rejects(() => instanceA.finish(uid, operation));

    assert.deepEqual((await control.get()).data(), second);

    const final = await instanceB.finish(uid, second);

    assert.deepEqual(final, {
      generation: 2,
      status: "active",
    });
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
