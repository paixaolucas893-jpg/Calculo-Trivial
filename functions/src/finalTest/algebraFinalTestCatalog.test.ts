import assert from "node:assert/strict";
import test from "node:test";

import {
  ALGEBRA_FINAL_TEST_CATALOG,
  toPublicFinalTestQuestion,
} from "./algebraFinalTestCatalog";

const VISIBLE_ALGEBRA_LESSON_IDS = new Set([
  "precalculo-00-01-reais",
  "precalculo-00-02-operacoes",
  "precalculo-00-03-linguagem",
  "precalculo-00-04-potencias-raizes",
  "precalculo-00-05-modulo",
  "algebra-01-linguagem",
  "algebra-02-termos-semelhantes",
  "algebra-03-distributiva",
  "algebra-09-monomios-polinomios",
  "algebra-10-operacoes-polinomios",
  "algebra-05-produtos-notaveis",
  "algebra-06-fatoracao",
  "algebra-07-fracoes-algebricas",
  "algebra-08-sintese",
]);

test("Algebra final-test catalog keeps trusted lesson metadata", () => {
  assert.equal(ALGEBRA_FINAL_TEST_CATALOG.length, 34);

  const ids =
    ALGEBRA_FINAL_TEST_CATALOG
      .map((question) => question.id);

  assert.equal(
    new Set(ids).size,
    ids.length,
  );

  for (
    const question
    of ALGEBRA_FINAL_TEST_CATALOG
  ) {
    assert.equal(
      typeof question.contentLessonId,
      "string",
    );
    assert.ok(
      (question.contentLessonId ?? "")
        .length > 0,
    );
  }
});

test(
  "Algebra final-test catalog covers every visible lesson in the Algebra path",
  () => {
    const covered = new Set(
      ALGEBRA_FINAL_TEST_CATALOG
        .map(
          (question) =>
            question.contentLessonId,
        )
        .filter(
          (value): value is string =>
            typeof value === "string",
        ),
    );

    for (
      const lessonId
      of VISIBLE_ALGEBRA_LESSON_IDS
    ) {
      assert.ok(
        covered.has(lessonId),
        `Missing secure final-test coverage for visible lesson ${lessonId}`,
      );
    }
  },
);

test(
  "public Algebra final-test payload omits trusted answer and lesson metadata",
  () => {
    const publicQuestion =
      toPublicFinalTestQuestion(
        ALGEBRA_FINAL_TEST_CATALOG[0],
      );

    assert.deepEqual(
      Object.keys(
        publicQuestion,
      ).sort(),
      [
        "id",
        "options",
        "statement",
      ],
    );

    assert.equal(
      "correctOptionId" in
        publicQuestion,
      false,
    );

    assert.equal(
      "contentLessonId" in
        publicQuestion,
      false,
    );
  },
);
