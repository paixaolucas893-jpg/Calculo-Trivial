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
  handleLearningHistoryReset,
} from "./learningHistoryResetCallableHandler";

import {
  createLearningHistoryOwnedResetCoordinator,
} from "./learningHistoryOwnedResetFactory";

test("real emulator resets only authenticated history", async () => {
  const host = process.env.FIRESTORE_EMULATOR_HOST;

  if (
    !host ||
    !/^(localhost|127\.0\.0\.1):[0-9]+$/.test(host)
  ) {
    throw new Error("Local Firestore Emulator is required.");
  }

  if (process.env.GCLOUD_PROJECT &&
      process.env.GCLOUD_PROJECT !== "demo-calculo-trivial") {
    throw new Error("Unexpected Firebase project.");
  }

  const app = initializeApp({
    projectId: "demo-calculo-trivial",
  }, "learning-history-reset-test-" + randomUUID());

  const db = getFirestore(app);
  const suffix = randomUUID().replace(/-/g, "");
  const uid = "test_reset_" + suffix;
  const otherUid = "test_other_" + suffix;

  const userRef = db.collection("users").doc(uid);
  const otherRef = db.collection("users").doc(otherUid);
  const history = userRef.collection("learningHistory");
  const progress = userRef.collection("progress").doc("current");
  const control = userRef
    .collection("learningHistoryControl").doc("current");

  try {
    await history.doc("event_one").set({questionId: "q1"});
    await history.doc("event_two").set({questionId: "q2"});

    await progress.set({
      learningHistory: [{questionId: "legacy_q1"}],
      dailyAnsweredQuestions: 7,
      studyStreak: 3,
    });

    await otherRef.collection("learningHistory")
      .doc("other_event").set({questionId: "other_q"});

    const coordinator = createLearningHistoryOwnedResetCoordinator(db);

    const first = await handleLearningHistoryReset({
      authUid: uid,
      authTime: Math.floor(Date.now() / 1000),
      data: {},
    }, coordinator);

    assert.deepEqual(first, {
      status: "ok",
      generation: 1,
    });

    assert.deepEqual((await control.get()).data(), {
      generation: 1,
      status: "active",
    });

    assert.equal((await history.get()).size, 0);

    const savedProgress = (await progress.get()).data();
    assert.deepEqual(savedProgress?.learningHistory, []);
    assert.equal(savedProgress?.dailyAnsweredQuestions, 7);
    assert.equal(savedProgress?.studyStreak, 3);

    assert.equal(
      (await otherRef.collection("learningHistory").get()).size,
      1,
    );

    const second = await handleLearningHistoryReset({
      authUid: uid,
      authTime: Math.floor(Date.now() / 1000),
      data: {},
    }, coordinator);

    assert.deepEqual(second, {
      status: "ok",
      generation: 2,
    });

    assert.deepEqual((await control.get()).data(), {
      generation: 2,
      status: "active",
    });
  } finally {
    try {
      await Promise.all([
        db.recursiveDelete(userRef),
        db.recursiveDelete(otherRef),
      ]);
    } finally {
      await deleteApp(app);
    }
  }
});
