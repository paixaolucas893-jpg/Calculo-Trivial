import assert from "node:assert/strict";
import test from "node:test";

import {
  Firestore,
} from "firebase-admin/firestore";

import {
  LearningHistoryGenerationService,
} from "./learningHistoryGenerationService";

type ControlData = {
  generation: number;
  status: "active" | "resetting";
};

/**
 * In-memory transaction fake with atomic read/write ordering.
 *
 * @param {ControlData | null} initial Initial stored control state.
 * @return {object} Fake transaction state.
 */
function fakeStore(initial: ControlData | null): {
  firestore: Firestore;
  get: () => ControlData | null;
} {
  let state = initial;
  const ref = {
    path: "users/uid_a/learningHistoryControl/current",
  };
  const firestore = {
    collection(name: string) {
      assert.equal(name, "users");
      return {
        doc(uid: string) {
          assert.equal(uid, "uid_a");
          return {
            collection(section: string) {
              assert.equal(section, "learningHistoryControl");
              return {
                doc(id: string) {
                  assert.equal(id, "current");
                  return ref;
                },
              };
            },
          };
        },
      };
    },
    async runTransaction<T>(
      fn: (tx: {
        get: (target: unknown) => Promise<{
          exists: boolean;
          data: () => ControlData | null;
        }>;
        set: (target: unknown, value: ControlData) => void;
      }) => Promise<T>,
    ) {
      return fn({
        async get(target: unknown) {
          assert.equal(target, ref);
          return {
            exists: state !== null,
            data: () => state,
          };
        },
        set(target: unknown, value: ControlData) {
          assert.equal(target, ref);
          state = value;
        },
      });
    },
  } as unknown as Firestore;
  return {
    firestore,
    get: () => state,
  };
}

test("backend creates reset barrier before deleting anything", async () => {
  const store = fakeStore(null);
  const service = new LearningHistoryGenerationService(store.firestore);
  const barrier = await service.begin("uid_a");
  assert.deepEqual(barrier, {generation: 1, status: "resetting"});
  assert.deepEqual(store.get(), barrier);
});

test("repeated reset acquisition is rejected until completion", async () => {
  const store = fakeStore({generation: 3, status: "active"});
  const service = new LearningHistoryGenerationService(store.firestore);

  const barrier = await service.begin("uid_a");
  assert.deepEqual(barrier, {generation: 4, status: "resetting"});

  await assert.rejects(
    () => service.begin("uid_a"),
    /already in progress/,
  );

  assert.deepEqual(store.get(), {
    generation: 4,
    status: "resetting",
  });

  await assert.rejects(() => service.finish("uid_a", 3));

  assert.deepEqual(store.get(), {
    generation: 4,
    status: "resetting",
  });

  const active = await service.finish("uid_a", 4);
  assert.deepEqual(active, {generation: 4, status: "active"});
});

test("invalid account cannot mutate server reset state", async () => {
  const store = fakeStore(null);
  const service = new LearningHistoryGenerationService(store.firestore);
  await assert.rejects(() => service.begin("other/uid"));
  assert.equal(store.get(), null);
});
