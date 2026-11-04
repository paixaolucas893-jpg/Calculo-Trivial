import assert from "node:assert/strict";
import test from "node:test";

import {
  Firestore,
} from "firebase-admin/firestore";

import {
  LearningHistoryPurgeService,
} from "./learningHistoryPurge";

/**
 * Creates an Admin Firestore fake for exercising the purge target.
 *
 * @param {string[]} removedPaths Captures deleted collection paths.
 * @param {boolean} fail Whether the fake deletion fails.
 * @return {Firestore} Fake instance; no Firebase network calls.
 */
function fakeFirestore(
  removedPaths: string[],
  fail = false,
): Firestore {
  const fake = {
    collection(root: string) {
      assert.equal(root, "users");
      return {
        doc(uid: string) {
          return {
            collection(name: string) {
              assert.equal(name, "learningHistory");
              return {
                path: `users/${uid}/${name}`,
              };
            },
          };
        },
      };
    },
    async recursiveDelete(target: {path: string}) {
      if (fail) {
        throw new Error("simulated Firestore failure");
      }
      removedPaths.push(target.path);
    },
  };
  return fake as unknown as Firestore;
}

test("purge targets only the requested user history collection", async () => {
  const paths: string[] = [];
  const service = new LearningHistoryPurgeService(
    fakeFirestore(paths),
  );
  await service.purgeEvents("uid_a");
  assert.deepEqual(
    paths,
    ["users/uid_a/learningHistory"],
  );
});

test("purge refuses empty or path-like user identifiers", async () => {
  const paths: string[] = [];
  const service = new LearningHistoryPurgeService(
    fakeFirestore(paths),
  );
  await assert.rejects(() => service.purgeEvents(" "));
  await assert.rejects(() => service.purgeEvents("a/b"));
  assert.deepEqual(paths, []);
});

test("purge surfaces remote errors without claiming success", async () => {
  const paths: string[] = [];
  const service = new LearningHistoryPurgeService(
    fakeFirestore(paths, true),
  );
  await assert.rejects(
    () => service.purgeEvents("uid_a"),
    /simulated Firestore failure/,
  );
  assert.deepEqual(paths, []);
});

test("legacy cleanup modifies only the history array", async () => {
  const updates: unknown[] = [];
  const fake = {
    collection(name: string) {
      assert.equal(name, "users");
      return {
        doc(uid: string) {
          assert.equal(uid, "uid_a");
          return {
            collection(section: string) {
              assert.equal(section, "progress");
              return {
                doc(id: string) {
                  assert.equal(id, "current");
                  return {
                    async get() {
                      return {exists: true};
                    },
                    async update(value: unknown) {
                      updates.push(value);
                    },
                  };
                },
              };
            },
          };
        },
      };
    },
  } as unknown as Firestore;
  await new LearningHistoryPurgeService(fake)
    .clearLegacyHistory("uid_a");
  assert.deepEqual(updates, [{learningHistory: []}]);
});

test("legacy cleanup does not recreate missing progress", async () => {
  let updated = false;
  const fake = {
    collection() {
      return {
        doc() {
          return {
            collection() {
              return {
                doc() {
                  return {
                    async get() {
                      return {exists: false};
                    },
                    async update() {
                      updated = true;
                    },
                  };
                },
              };
            },
          };
        },
      };
    },
  } as unknown as Firestore;
  await new LearningHistoryPurgeService(fake)
    .clearLegacyHistory("uid_a");
  assert.equal(updated, false);
});
