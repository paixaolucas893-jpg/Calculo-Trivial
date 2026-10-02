import assert from "node:assert/strict";
import {
  readFileSync,
  readdirSync,
  statSync,
} from "node:fs";
import {
  join,
  resolve,
} from "node:path";
import test from "node:test";

/**
 * Returns every TypeScript source file under one directory.
 *
 * @param {string} directory Directory to scan.
 * @return {string[]} Source file paths.
 */
function listTypeScriptFiles(
  directory: string,
): string[] {
  const files: string[] = [];

  for (
    const entry of readdirSync(directory)
  ) {
    const fullPath =
      join(directory, entry);

    if (statSync(fullPath).isDirectory()) {
      files.push(
        ...listTypeScriptFiles(
          fullPath,
        ),
      );
      continue;
    }

    if (
      fullPath.endsWith(".ts") &&
      !fullPath.endsWith(".test.ts")
    ) {
      files.push(fullPath);
    }
  }

  return files;
}

/**
 * Reads application sources from the original TypeScript tree.
 *
 * npm test executes from functions/lib after compilation, so ../src points
 * back to the reviewed sources.
 *
 * @return {Map<string, string>} File contents keyed by path.
 */
function readApplicationSources():
Map<string, string> {
  const sourceRoot =
    resolve(
      process.cwd(),
      "..",
      "src",
    );

  const result =
    new Map<string, string>();

  for (
    const path of
      listTypeScriptFiles(
        sourceRoot,
      )
  ) {
    result.set(
      path,
      readFileSync(
        path,
        "utf8",
      ),
    );
  }

  return result;
}

test(
  "Tutor sources do not log prompt or user content",
  () => {
    const sources =
      readApplicationSources();

    const forbiddenLoggingCalls = [
      "console.log(",
      "console.info(",
      "console.warn(",
      "console.error(",
      "logger.log(",
      "logger.info(",
      "logger.warn(",
      "logger.error(",
      "functions.logger",
    ];

    const sensitiveTerms = [
      "userMessage",
      "buildTutorPrompt",
      "rawResponse",
      "request.data",
      "response.text",
      "systemInstruction",
      "TutorModelRequest",
    ];

    for (
      const [
        path,
        content,
      ] of sources
    ) {
      if (
        !path.includes("/tutor/") &&
        !path.includes("/gemini/") &&
        !path.endsWith("/index.ts")
      ) {
        continue;
      }

      for (
        const call of
          forbiddenLoggingCalls
      ) {
        assert.equal(
          content.includes(call),
          false,
          `Sensitive Tutor source must not contain ${call}: ${path}`,
        );
      }

      const hasLoggingReference =
        forbiddenLoggingCalls.some(
          (call) =>
            content.includes(call),
        );

      if (hasLoggingReference) {
        for (
          const term of
            sensitiveTerms
        ) {
          assert.equal(
            content.includes(term),
            false,
            `Tutor logging must never include ${term}: ${path}`,
          );
        }
      }
    }
  },
);

test(
  "Gemini client never exposes provider errors",
  () => {
    const sources =
      readApplicationSources();

    const clientEntry =
      [...sources.entries()]
        .find(
          ([path]) =>
            path.endsWith(
              "/gemini/GeminiTutorClient.ts",
            ),
        );

    assert.ok(
      clientEntry,
      "GeminiTutorClient.ts must exist.",
    );

    const content =
      clientEntry[1];

    assert.match(
      content,
      /catch \(error: unknown\)/,
    );

    assert.match(
      content,
      /code:\s*"UNAVAILABLE"/,
    );

    assert.equal(
      content.includes(
        "message: error",
      ),
      false,
    );

    assert.equal(
      content.includes(
        "stack: error",
      ),
      false,
    );
  },
);
