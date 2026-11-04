import assert from "node:assert/strict";
import test from "node:test";
import {Firestore} from "firebase-admin/firestore";

import {
  createLearningHistoryResetCoordinator,
} from "./learningHistoryResetService";

test("internal wiring blocks, purges both stores, then reopens", async () => {
  const steps: string[] = [];
  let control: {generation: number; status: string} | null = null;
  let legacyHistory: unknown[] = [{questionId: "q1"}];
  const controlRef = {kind: "control"};
  const progressRef = {
    kind: "progress",
    async get() {
      return {exists: true};
    },
    async update(value: {learningHistory: unknown[]}) {
      steps.push("legacy");
      legacyHistory = value.learningHistory;
    },
  };

  const fake = {
    collection(name: string) {
      assert.equal(name, "users");
      return {
        doc(uid: string) {
          assert.equal(uid, "user-a");
          return {
            collection(section: string) {
              if (section === "learningHistory") {
                return {path: "users/user-a/learningHistory"};
              }
              if (section === "learningHistoryControl") {
                return {
                  doc(id: string) {
                    assert.equal(id, "current");
                    return controlRef;
                  },
                };
              }
              assert.equal(section, "progress");
              return {
                doc(id: string) {
                  assert.equal(id, "current");
                  return progressRef;
                },
              };
            },
          };
        },
      };
    },
    async runTransaction(
      callback: (tx: {
        get(ref: unknown): Promise<{exists: boolean; data(): unknown}>;
        set(ref: unknown, value: {generation: number; status: string}): void;
      }) => Promise<unknown>,
    ) {
      return callback({
        async get(ref: unknown) {
          assert.equal(ref, controlRef);
          return {
            exists: control !== null,
            data() {
              return control;
            },
          };
        },
        set(ref: unknown, value: {generation: number; status: string}) {
          assert.equal(ref, controlRef);
          steps.push(value.status);
          control = value;
        },
      });
    },
    async recursiveDelete(ref: {path: string}) {
      assert.equal(ref.path, "users/user-a/learningHistory");
      steps.push("purge");
    },
  } as unknown as Firestore;

  const coordinator = createLearningHistoryResetCoordinator(fake);
  const result = await coordinator.reset("user-a");
  assert.deepEqual(result, {generation: 1, status: "active"});
  assert.deepEqual(legacyHistory, []);
  assert.deepEqual(steps, ["resetting", "purge", "legacy", "active"]);
});
