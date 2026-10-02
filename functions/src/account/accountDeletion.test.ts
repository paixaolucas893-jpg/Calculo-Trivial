import assert from "node:assert/strict";
import test from "node:test";

import {
  HttpsError,
} from "firebase-functions/v2/https";

import {
  AccountDeletionExecutor,
  createTutorOwnerHash,
  handleDeleteAccount,
} from "./accountDeletion";

/**
 * Captures account deletion calls without touching Firebase.
 */
class FakeDeletionExecutor
implements AccountDeletionExecutor {
  deletedUids: string[] = [];
  shouldFail = false;

  /**
   * Records one requested uid or simulates a backend failure.
   *
   * @param {string} uid Authenticated user id.
   * @return {Promise<void>} Completion promise.
   */
  async delete(
    uid: string,
  ): Promise<void> {
    if (this.shouldFail) {
      throw new Error(
        "simulated failure",
      );
    }

    this.deletedUids.push(uid);
  }
}

test("rejects unauthenticated account deletion", async () => {
  const executor =
    new FakeDeletionExecutor();

  await assert.rejects(
    () =>
      handleDeleteAccount(
        {
          authUid: null,
          authTime: null,
          data: {},
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(
        error instanceof HttpsError,
      );
      assert.equal(
        error.code,
        "unauthenticated",
      );
      return true;
    },
  );

  assert.deepEqual(
    executor.deletedUids,
    [],
  );
});

test("rejects client-controlled account fields", async () => {
  const executor =
    new FakeDeletionExecutor();

  const nowSeconds =
    Math.floor(Date.now() / 1000);

  await assert.rejects(
    () =>
      handleDeleteAccount(
        {
          authUid: "uid_a",
          authTime:
            nowSeconds - 60,
          data: {
            uid: "uid_b",
          },
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(
        error instanceof HttpsError,
      );
      assert.equal(
        error.code,
        "invalid-argument",
      );
      return true;
    },
  );

  assert.deepEqual(
    executor.deletedUids,
    [],
  );
});

test("deletes only the authenticated account", async () => {
  const executor =
    new FakeDeletionExecutor();

  const nowSeconds =
    Math.floor(Date.now() / 1000);

  const result =
    await handleDeleteAccount(
      {
        authUid: "uid_a",
        authTime:
          nowSeconds - 60,
        data: {},
      },
      executor,
    );

  assert.deepEqual(
    result,
    {
      status: "ok",
    },
  );

  assert.deepEqual(
    executor.deletedUids,
    ["uid_a"],
  );
});

test("maps internal deletion failures to a generic error", async () => {
  const executor =
    new FakeDeletionExecutor();

  executor.shouldFail = true;

  const nowSeconds =
    Math.floor(Date.now() / 1000);

  await assert.rejects(
    () =>
      handleDeleteAccount(
        {
          authUid: "uid_a",
          authTime:
            nowSeconds - 60,
          data: null,
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(
        error instanceof HttpsError,
      );
      assert.equal(
        error.code,
        "internal",
      );
      assert.equal(
        error.message,
        "Não foi possível excluir a conta. Tente novamente.",
      );
      return true;
    },
  );
});

test("owner hash is stable without exposing the uid", () => {
  const first =
    createTutorOwnerHash(
      "uid_a",
    );
  const second =
    createTutorOwnerHash(
      "uid_a",
    );

  assert.equal(
    first,
    second,
  );
  assert.equal(
    first.length,
    64,
  );
  assert.equal(
    first.includes("uid_a"),
    false,
  );
});

test("rejects account deletion without recent authentication", async () => {
  const executor =
    new FakeDeletionExecutor();

  await assert.rejects(
    () =>
      handleDeleteAccount(
        {
          authUid: "uid_a",
          authTime: null,
          data: {},
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(
        error instanceof HttpsError,
      );
      assert.equal(
        error.code,
        "failed-precondition",
      );
      return true;
    },
  );

  assert.deepEqual(
    executor.deletedUids,
    [],
  );
});

test("rejects account deletion with stale authentication", async () => {
  const executor =
    new FakeDeletionExecutor();

  const nowSeconds =
    Math.floor(Date.now() / 1000);

  await assert.rejects(
    () =>
      handleDeleteAccount(
        {
          authUid: "uid_a",
          authTime:
            nowSeconds - 601,
          data: {},
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(
        error instanceof HttpsError,
      );
      assert.equal(
        error.code,
        "failed-precondition",
      );
      return true;
    },
  );

  assert.deepEqual(
    executor.deletedUids,
    [],
  );
});

test("allows account deletion with recent authentication", async () => {
  const executor =
    new FakeDeletionExecutor();

  const nowSeconds =
    Math.floor(Date.now() / 1000);

  const result =
    await handleDeleteAccount(
      {
        authUid: "uid_a",
        authTime:
          nowSeconds - 60,
        data: {},
      },
      executor,
    );

  assert.deepEqual(
    result,
    {
      status: "ok",
    },
  );

  assert.deepEqual(
    executor.deletedUids,
    ["uid_a"],
  );
});
