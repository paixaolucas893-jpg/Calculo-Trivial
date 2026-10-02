import assert from "node:assert/strict";
import test from "node:test";

import {
  HttpsError,
} from "firebase-functions/v2/https";

import {
  PersonalDataExport,
  handleExportMyData,
} from "./personalDataExport";

/**
 * Captures export calls without touching Firebase.
 */
class FakeExportExecutor {
  exportedUids: string[] = [];
  shouldFail = false;

  /**
   * Returns a deterministic fake export.
   *
   * @param {string} uid Authenticated uid.
   * @return {Promise<PersonalDataExport>} Fake export.
   */
  async export(
    uid: string,
  ): Promise<PersonalDataExport> {
    if (this.shouldFail) {
      throw new Error("simulated failure");
    }

    this.exportedUids.push(uid);

    return {
      exportedAt: "2026-10-01T12:00:00.000Z",
      account: {
        uid,
        email: "student@example.com",
        displayName: "Student",
        emailVerified: true,
        disabled: false,
        providers: ["password"],
        creationTime: "2026-01-01T00:00:00.000Z",
        lastSignInTime: "2026-10-01T11:00:00.000Z",
      },
      userDocument: {
        name: "Student",
      },
      progress: {
        completedLessonIds: ["funcoes"],
      },
      tutorSessions: [],
    };
  }
}

test("rejects unauthenticated data export", async () => {
  const executor = new FakeExportExecutor();

  await assert.rejects(
    () =>
      handleExportMyData(
        {
          authUid: null,
          data: {},
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(error instanceof HttpsError);
      assert.equal(error.code, "unauthenticated");
      return true;
    },
  );

  assert.deepEqual(executor.exportedUids, []);
});

test("rejects client-controlled export fields", async () => {
  const executor = new FakeExportExecutor();

  await assert.rejects(
    () =>
      handleExportMyData(
        {
          authUid: "uid_a",
          data: {
            uid: "uid_b",
          },
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(error instanceof HttpsError);
      assert.equal(error.code, "invalid-argument");
      return true;
    },
  );

  assert.deepEqual(executor.exportedUids, []);
});

test("exports only the authenticated user", async () => {
  const executor = new FakeExportExecutor();

  const result =
    await handleExportMyData(
      {
        authUid: "uid_a",
        data: {},
      },
      executor,
    );

  assert.equal(result.account.uid, "uid_a");
  assert.deepEqual(executor.exportedUids, ["uid_a"]);
});

test("maps internal export failures to a generic error", async () => {
  const executor = new FakeExportExecutor();
  executor.shouldFail = true;

  await assert.rejects(
    () =>
      handleExportMyData(
        {
          authUid: "uid_a",
          data: null,
        },
        executor,
      ),
    (error: unknown) => {
      assert.ok(error instanceof HttpsError);
      assert.equal(error.code, "internal");
      return true;
    },
  );
});
