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

test("simultaneous backend instances acquire reset exclusively", async () => {
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
  const uid = "test_race_" + suffix;

  const appA = initializeApp(
    {projectId},
    "race-a-" + suffix,
  );

  const appB = initializeApp(
    {projectId},
    "race-b-" + suffix,
  );

  const dbA = getFirestore(appA);
  const dbB = getFirestore(appB);

  try {
    const serviceA = new LearningHistoryGenerationService(dbA);
    const serviceB = new LearningHistoryGenerationService(dbB);

    const results = await Promise.allSettled([
      serviceA.begin(uid),
      serviceB.begin(uid),
    ]);

    const successful = results.filter(
      (result) => result.status === "fulfilled",
    );

    const rejected = results.filter(
      (result) => result.status === "rejected",
    );

    assert.equal(successful.length, 1);
    assert.equal(rejected.length, 1);

    const winner = successful[0];
    assert.equal(winner.status, "fulfilled");

    if (winner.status === "fulfilled") {
      assert.deepEqual(winner.value, {
        generation: 1,
        status: "resetting",
      });
    }

    const control = await dbA
      .collection("users")
      .doc(uid)
      .collection("learningHistoryControl")
      .doc("current")
      .get();

    assert.deepEqual(control.data(), {
      generation: 1,
      status: "resetting",
    });
  } finally {
    try {
      await dbA.recursiveDelete(
        dbA.collection("users").doc(uid),
      );
    } finally {
      await Promise.all([
        deleteApp(appA),
        deleteApp(appB),
      ]);
    }
  }
});
