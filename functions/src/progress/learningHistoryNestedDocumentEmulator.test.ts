import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {deleteApp, initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";

import {
  LearningHistoryOwnedLegacyCleanupService,
} from "./learningHistoryOwnedLegacyCleanupService";

import {
  LearningHistoryOwnedPurgeService,
} from "./learningHistoryOwnedPurgeService";

import {
  LearningHistoryOwnedResetService,
} from "./learningHistoryOwnedResetService";

test("reset cannot finish with descendant event documents", async () => {
  const projectId = "demo-calculo-trivial";
  const host = process.env.FIRESTORE_EMULATOR_HOST;

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
  const uid = "test_nested_history_" + suffix;

  const app = initializeApp(
    {projectId},
    "nested-history-" + suffix,
  );

  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);
  const history = user.collection("learningHistory");
  const event = history.doc("old-event");

  const descendant = event
    .collection("unexpectedChildren")
    .doc("child-1");

  const progress = user.collection("progress").doc("current");

  const control = user
    .collection("learningHistoryControl")
    .doc("current");

  try {
    // Administrative data only: clients cannot create this structure.
    await event.set({questionId: "old-question"});
    await descendant.set({legacyPayload: "must-not-survive"});

    await progress.set({
      learningHistory: [{questionId: "old-question"}],
      completedLessons: 9,
    });

    const owner = new LearningHistoryOwnedResetService(db);
    const purge = new LearningHistoryOwnedPurgeService(db);
    const cleanup = new LearningHistoryOwnedLegacyCleanupService(db);

    const operation = await owner.begin(uid);

    await purge.purgeEvents(uid, operation);
    await cleanup.clearLegacyHistory(uid, operation);

    // Deleting the event document must not be confused with
    // recursively deleting all its descendant documents.
    assert.equal((await history.get()).size, 0);

    const survivingChild = await descendant.get();

    assert.equal(
      survivingChild.exists,
      true,
      "Expected the Firestore nested-document scenario.",
    );

    // Desired safety contract: do not reopen the barrier while
    // an event descendant still exists.
    await assert.rejects(
      () => owner.finish(uid, operation),
      /descendant|nested|incomplete|history/i,
    );

    assert.deepEqual(
      (await control.get()).data(),
      operation,
    );

    assert.deepEqual((await progress.get()).data(), {
      learningHistory: [],
      completedLessons: 9,
    });
  } finally {
    try {
      // Test-only cleanup is recursive and limited to this unique UID.
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});
