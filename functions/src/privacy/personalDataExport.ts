import {
  Auth,
  UserRecord,
} from "firebase-admin/auth";
import {
  DocumentData,
  Firestore,
  QueryDocumentSnapshot,
  Timestamp,
} from "firebase-admin/firestore";
import {
  HttpsError,
} from "firebase-functions/v2/https";

/**
 * Serializable personal-data export returned to the authenticated user.
 */
export interface PersonalDataExport {
  exportedAt: string;
  account: {
    uid: string;
    email: string | null;
    displayName: string | null;
    emailVerified: boolean;
    disabled: boolean;
    providers: string[];
    creationTime: string | null;
    lastSignInTime: string | null;
  };
  userDocument: Record<string, unknown> | null;
  progress: Record<string, unknown> | null;
  tutorSessions: Record<string, unknown>[];
}

interface ExportMyDataRequest {
  authUid: string | null;
  data: unknown;
}

/**
 * Reads the authenticated user's exportable Firebase data.
 */
export class FirebasePersonalDataExportService {
  /**
   * Creates the export service.
   *
   * @param {Firestore} firestore Firestore Admin instance.
   * @param {Auth} auth Firebase Authentication Admin instance.
   */
  constructor(
    private readonly firestore: Firestore,
    private readonly auth: Auth,
  ) {}

  /**
   * Exports data owned by one authenticated uid.
   *
   * @param {string} uid Authenticated Firebase uid.
   * @return {Promise<PersonalDataExport>} Serializable export.
   */
  async export(
    uid: string,
  ): Promise<PersonalDataExport> {
    const [
      userRecord,
      userSnapshot,
      progressSnapshot,
      tutorSessionsSnapshot,
    ] = await Promise.all([
      this.auth.getUser(uid),
      this.firestore
        .collection("users")
        .doc(uid)
        .get(),
      this.firestore
        .collection("users")
        .doc(uid)
        .collection("progress")
        .doc("current")
        .get(),
      this.firestore
        .collection("tutorSessions")
        .where("uid", "==", uid)
        .get(),
    ]);

    return {
      exportedAt: new Date().toISOString(),
      account: serializeAccount(userRecord),
      userDocument: userSnapshot.exists ?
        serializeRecord(userSnapshot.data() ?? {}) :
        null,
      progress: progressSnapshot.exists ?
        serializeRecord(progressSnapshot.data() ?? {}) :
        null,
      tutorSessions: tutorSessionsSnapshot.docs
        .map((snapshot) =>
          serializeTutorSession(snapshot)),
    };
  }
}

/**
 * Validates and serves one authenticated personal-data export request.
 *
 * @param {ExportMyDataRequest} request Callable request.
 * @param {object} executor Export executor.
 * @return {Promise<PersonalDataExport>} User-owned export.
 */
export async function handleExportMyData(
  request: ExportMyDataRequest,
  executor: {
    export(uid: string): Promise<PersonalDataExport>;
  },
): Promise<PersonalDataExport> {
  if (!request.authUid) {
    throw new HttpsError(
      "unauthenticated",
      "Faça login para acessar seus dados.",
    );
  }

  if (hasUnexpectedData(request.data)) {
    throw new HttpsError(
      "invalid-argument",
      "A solicitação não é válida.",
    );
  }

  try {
    return await executor.export(request.authUid);
  } catch {
    throw new HttpsError(
      "internal",
      "Não foi possível preparar seus dados agora.",
    );
  }
}

/**
 * Converts Firebase Authentication metadata to the public export format.
 *
 * @param {UserRecord} user Firebase user record.
 * @return {object} Serializable account metadata.
 */
function serializeAccount(
  user: UserRecord,
): PersonalDataExport["account"] {
  return {
    uid: user.uid,
    email: user.email ?? null,
    displayName: user.displayName ?? null,
    emailVerified: user.emailVerified,
    disabled: user.disabled,
    providers: user.providerData
      .map((provider) => provider.providerId),
    creationTime:
      user.metadata.creationTime ?? null,
    lastSignInTime:
      user.metadata.lastSignInTime ?? null,
  };
}

/**
 * Serializes one Tutor session document.
 *
 * @param {QueryDocumentSnapshot<DocumentData>} snapshot Session snapshot.
 * @return {Record<string, unknown>} Serializable session.
 */
function serializeTutorSession(
  snapshot: QueryDocumentSnapshot<DocumentData>,
): Record<string, unknown> {
  return {
    sessionId: snapshot.id,
    ...serializeRecord(snapshot.data()),
  };
}

/**
 * Serializes a Firestore object into a plain JSON-compatible record.
 *
 * @param {unknown} value Firestore value.
 * @return {Record<string, unknown>} Serializable record.
 */
function serializeRecord(
  value: unknown,
): Record<string, unknown> {
  const serialized = serializeValue(value);

  if (
    serialized === null ||
    Array.isArray(serialized) ||
    typeof serialized !== "object"
  ) {
    return {};
  }

  return serialized as Record<string, unknown>;
}

/**
 * Recursively converts Firestore timestamps and nested values.
 *
 * @param {unknown} value Value to serialize.
 * @return {unknown} JSON-compatible value.
 */
function serializeValue(
  value: unknown,
): unknown {
  if (value instanceof Timestamp) {
    return value.toDate().toISOString();
  }

  if (Array.isArray(value)) {
    return value.map(serializeValue);
  }

  if (
    value !== null &&
    typeof value === "object"
  ) {
    return Object.fromEntries(
      Object.entries(
        value as Record<string, unknown>,
      ).map(([key, entry]) => [
        key,
        serializeValue(entry),
      ]),
    );
  }

  return value;
}

/**
 * Rejects client-controlled fields for the export callable.
 *
 * @param {unknown} data Callable payload.
 * @return {boolean} True when unexpected fields are present.
 */
function hasUnexpectedData(
  data: unknown,
): boolean {
  if (
    data === null ||
    data === undefined
  ) {
    return false;
  }

  if (
    typeof data !== "object" ||
    Array.isArray(data)
  ) {
    return true;
  }

  return Object.keys(data).length > 0;
}
