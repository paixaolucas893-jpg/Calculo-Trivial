import {
  HttpsError,
} from "firebase-functions/v2/https";

import {
  LearningHistoryGenerationState,
} from "./learningHistoryGeneration";

export interface LearningHistoryResetExecutor {
  reset(uid: string): Promise<LearningHistoryGenerationState>;
}

export interface LearningHistoryResetRequest {
  authUid: string | null;
  authTime: number | null;
  data: unknown;
}

/**
 * Validates a trusted history-reset request.
 *
 * This handler is not exported as a Firebase callable.
 * Its backend integration must remain disabled until
 * client reset and stale-device protections are verified.
 *
 * @param {LearningHistoryResetRequest} request Caller context.
 * @param {LearningHistoryResetExecutor} executor Trusted reset service.
 * @return {Promise<object>} Confirmed reset result.
 */
export async function handleLearningHistoryReset(
  request: LearningHistoryResetRequest,
  executor: LearningHistoryResetExecutor,
): Promise<{
  status: "ok";
  generation: number;
}> {
  const uid = request.authUid;

  if (
    typeof uid !== "string" ||
    uid.trim().length === 0 ||
    uid.includes("/")
  ) {
    throw new HttpsError(
      "unauthenticated",
      "Faça login para redefinir o histórico.",
    );
  }

  if (
    request.data !== null &&
    request.data !== undefined &&
    (
      typeof request.data !== "object" ||
      Array.isArray(request.data) ||
      Object.keys(request.data).length !== 0
    )
  ) {
    throw new HttpsError(
      "invalid-argument",
      "A solicitação de redefinição não é válida.",
    );
  }

  const nowSeconds = Math.floor(Date.now() / 1000);
  const maximumAuthenticationAgeSeconds = 5 * 60;
  const authTime = request.authTime;

  if (
    typeof authTime !== "number" ||
    !Number.isFinite(authTime) ||
    authTime > nowSeconds ||
    nowSeconds - authTime > maximumAuthenticationAgeSeconds
  ) {
    throw new HttpsError(
      "failed-precondition",
      "Faça login novamente antes de redefinir o histórico.",
    );
  }

  try {
    const result = await executor.reset(uid);

    if (
      result.status !== "active" ||
      !Number.isSafeInteger(result.generation) ||
      result.generation < 1
    ) {
      throw new Error("History reset was not confirmed.");
    }

    return {
      status: "ok",
      generation: result.generation,
    };
  } catch {
    throw new HttpsError(
      "internal",
      "Não foi possível redefinir o histórico. Tente novamente.",
    );
  }
}
