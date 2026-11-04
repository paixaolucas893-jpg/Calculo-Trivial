/**
 * A reset rotates a monotonically increasing learning-history generation.
 * Old devices must not upload attempts from earlier generations.
 *
 * The server owns this state; it must never be accepted from arbitrary
 * client writes. This module is not an endpoint or a completed reset flow.
 */
export interface LearningHistoryGenerationState {
  generation: number;
  status: "active" | "resetting";
}

/**
 * Normalize a trusted database state; never silently accept corrupt data.
 *
 * @param {unknown} value Raw server-side control document.
 * @return {LearningHistoryGenerationState} Validated state.
 */
export function parseHistoryGeneration(
  value: unknown,
): LearningHistoryGenerationState {
  if (
    value === null ||
    typeof value !== "object" ||
    Array.isArray(value)
  ) {
    throw new Error("Invalid learning history control state.");
  }

  const fields = value as Record<string, unknown>;
  if (
    typeof fields.generation !== "number" ||
    !Number.isSafeInteger(fields.generation) ||
    fields.generation < 0 ||
    (fields.status !== "active" &&
      fields.status !== "resetting")
  ) {
    throw new Error("Invalid learning history control state.");
  }

  return {
    generation: fields.generation,
    status: fields.status,
  };
}

/**
 * Begin an administrative reset by blocking new event writes and rotating
 * the generation. Repeated calls while resetting keep the same generation.
 *
 * @param {LearningHistoryGenerationState} current Current stored state.
 * @return {LearningHistoryGenerationState} New state.
 */
export function beginHistoryReset(
  current: LearningHistoryGenerationState,
): LearningHistoryGenerationState {
  const previous = parseHistoryGeneration(current);
  if (previous.status === "resetting") {
    return previous;
  }
  if (previous.generation >= Number.MAX_SAFE_INTEGER) {
    throw new Error("Learning history generation exhausted.");
  }
  return {
    generation: previous.generation + 1,
    status: "resetting",
  };
}

/**
 * Finish only the same generation after its remote purge completes.
 *
 * @param {LearningHistoryGenerationState} current Current stored state.
 * @param {number} expectedGeneration Generation associated with purge.
 * @return {LearningHistoryGenerationState} New active state.
 */
export function finishHistoryReset(
  current: LearningHistoryGenerationState,
  expectedGeneration: number,
): LearningHistoryGenerationState {
  const previous = parseHistoryGeneration(current);
  if (
    previous.status !== "resetting" ||
    previous.generation !== expectedGeneration
  ) {
    throw new Error("Stale or unfinished learning history reset.");
  }
  return {
    generation: expectedGeneration,
    status: "active",
  };
}

/**
 * A new event may only be accepted in the active current generation.
 *
 * @param {LearningHistoryGenerationState} state Server-owned control state.
 * @param {number} eventGeneration Generation recorded with the event.
 * @return {boolean} Whether it belongs to current active generation.
 */
export function acceptsHistoryEvent(
  state: LearningHistoryGenerationState,
  eventGeneration: number,
): boolean {
  const current = parseHistoryGeneration(state);
  return current.status === "active" &&
    Number.isSafeInteger(eventGeneration) &&
    eventGeneration === current.generation;
}
