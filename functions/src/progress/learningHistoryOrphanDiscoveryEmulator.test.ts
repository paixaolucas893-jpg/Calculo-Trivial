import assert from "node:assert/strict";
import {randomUUID} from "node:crypto";
import test from "node:test";

import {
  deleteApp,
  initializeApp,
} from "firebase-admin/app";

import {getFirestore} from "firebase-admin/firestore";

test("Firestore discovers descendants of missing event documents", async () => {
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
  const uid = "test_orphan_discovery_" + suffix;

  const app = initializeApp(
    {projectId},
    "orphan-discovery-" + suffix,
  );

  const db = getFirestore(app);
  const user = db.collection("users").doc(uid);
  const history = user.collection("learningHistory");

  const event = history.doc("old-event");

  const child = event
    .collection("unexpectedChildren")
    .doc("child-1");

  try {
    await event.set({questionId: "old-question"});

    await child.set({
      value: "unexpected descendant",
    });

    // Firestore deletes the parent document, not its descendants.
    await event.delete();

    const parent = await event.get();
    const descendant = await child.get();

    assert.equal(parent.exists, false);
    assert.equal(descendant.exists, true);

    // Ordinary queries only return existing parent documents.
    const query = await history.limit(1).get();

    assert.equal(query.empty, true);

    console.log("MAIN_COLLECTION_QUERY: EMPTY");

    // listDocuments should also expose missing document references
    // when they have descendant collections.
    const references = await history.listDocuments();

    console.log(
      "LIST_DOCUMENTS_COUNT:",
      references.length,
    );

    console.log(
      "LIST_DOCUMENT_IDS:",
      references.map((ref) => ref.id).join(","),
    );

    const orphanReference = references.find(
      (ref) => ref.id === "old-event",
    );

    assert.ok(
      orphanReference,
      "Missing parent with descendants was not discovered.",
    );

    const collections = await orphanReference.listCollections();

    console.log(
      "DESCENDANT_COLLECTION_IDS:",
      collections.map((item) => item.id).join(","),
    );

    assert.ok(
      collections.some(
        (item) => item.id === "unexpectedChildren",
      ),
      "Descendant collection was not discovered.",
    );

    assert.equal(
      (await child.get()).exists,
      true,
    );

    console.log("ORPHAN_DISCOVERY: CONFIRMED");
  } finally {
    try {
      // Cleanup is restricted to the temporary test account.
      await db.recursiveDelete(user);
    } finally {
      await deleteApp(app);
    }
  }
});
