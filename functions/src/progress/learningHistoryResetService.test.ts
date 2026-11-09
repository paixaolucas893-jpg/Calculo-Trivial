import assert from "node:assert/strict";
import test from "node:test";

import {Firestore} from "firebase-admin/firestore";

import {
  createLearningHistoryResetCoordinator,
} from "./learningHistoryResetService";

test("legacy reset factory refuses execution", () => {
  let firestoreAccessed = false;

  const fake = {
    collection() {
      firestoreAccessed = true;
      throw new Error("Firestore must not be accessed.");
    },
  } as unknown as Firestore;

  assert.throws(
    () => createLearningHistoryResetCoordinator(fake),
    /Legacy history reset is disabled/,
  );

  assert.equal(firestoreAccessed, false);
});
