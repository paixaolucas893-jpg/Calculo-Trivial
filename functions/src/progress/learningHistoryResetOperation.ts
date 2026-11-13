import {randomUUID} from "node:crypto";

/** Server-owned identity for a running history reset. */
export interface LearningHistoryResetOperation {
  generation: number;
  status: "resetting";
  operationId: string;
}

/**
 * Creates a unique backend-owned reset identity.
 *
 * @param {number} generation Newly acquired generation.
 * @return {LearningHistoryResetOperation} Operation identity.
 */
export function createLearningHistoryResetOperation(
  generation: number,
): LearningHistoryResetOperation {
  if (
    !Number.isSafeInteger(generation) ||
    generation < 1
  ) {
    throw new Error("Invalid reset generation.");
  }

  return {
    generation,
    status: "resetting",
    operationId: randomUUID(),
  };
}

/**
 * Rejects a completion request without matching ownership.
 *
 * @param {unknown} value Persisted reset control state.
 * @param {number} generation Expected generation.
 * @param {string} operationId Backend-held operation identity.
 * @return {void} Throws unless ownership matches.
 */
export function requireLearningHistoryResetOwner(
  value: unknown,
  generation: number,
  operationId: string,
): void {
  if (
    value === null ||
    typeof value !== "object" ||
    Array.isArray(value)
  ) {
    throw new Error("Invalid reset ownership state.");
  }

  const state = value as Record<string, unknown>;

  if (
    state.status !== "resetting" ||
    !Number.isSafeInteger(state.generation) ||
    state.generation !== generation ||
    typeof state.operationId !== "string" ||
    state.operationId.length === 0 ||
    typeof operationId !== "string" ||
    operationId.length === 0 ||
    state.operationId !== operationId
  ) {
    throw new Error("Reset operation is not authorized.");
  }
}
