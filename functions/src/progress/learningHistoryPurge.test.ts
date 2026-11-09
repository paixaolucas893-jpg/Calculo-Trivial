import assert from "node:assert/strict";
import test from "node:test";

import {Firestore} from "firebase-admin/firestore";

import {
  LearningHistoryPurgeService,
} from "./learningHistoryPurge";

/**
 * Creates a Firestore instance that fails if accessed.
 *
 * @return {Firestore} Guarded test double.
 */
function forbiddenFirestore(): Firestore {
  return {
    collection() {
      throw new Error("Legacy API must not access Firestore.");
    },
    async recursiveDelete() {
      throw new Error("Legacy API must not delete documents.");
    },
  } as unknown as Firestore;
}

test("legacy event purge is disabled", async () => {
  const service = new LearningHistoryPurgeService(
    forbiddenFirestore(),
  );

  await assert.rejects(
    () => service.purgeEvents("uid_a"),
    /Legacy learning history purge is disabled/,
  );
});

test("legacy progress cleanup is disabled", async () => {
  const service = new LearningHistoryPurgeService(
    forbiddenFirestore(),
  );

  await assert.rejects(
    () => service.clearLegacyHistory("uid_a"),
    /Legacy learning history cleanup is disabled/,
  );
});

test("legacy methods reject invalid user identifiers", async () => {
  const service = new LearningHistoryPurgeService(
    forbiddenFirestore(),
  );

  for (const uid of ["", " ", "a/b"]) {
    await assert.rejects(
      () => service.purgeEvents(uid),
      /Invalid trusted user ID/,
    );

    await assert.rejects(
      () => service.clearLegacyHistory(uid),
      /Invalid trusted user ID/,
    );
  }
});
