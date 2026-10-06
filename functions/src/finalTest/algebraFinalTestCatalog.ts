/**
 * Public option sent to a final-test client.
 */
export interface FinalTestOption {
  id: string;
  text: string;
}

/**
 * Trusted final-test question stored exclusively on the backend.
 */
export interface TrustedFinalTestQuestion {
  id: string;
  contentLessonId: string;
  statement: string;
  options: readonly FinalTestOption[];
  correctOptionId: string;
}

/**
 * Public representation of a final-test question.
 *
 * The correct answer must never be included here.
 */
export interface PublicFinalTestQuestion {
  id: string;
  statement: string;
  options: readonly FinalTestOption[];
}

/**
 * Canonical server-exclusive Algebra final-test catalog.
 *
 * These questions must not be copied into the Flutter application.
 * Only the backend owns correctOptionId.
 */
export const ALGEBRA_FINAL_TEST_CATALOG:
readonly TrustedFinalTestQuestion[] = [
  {
    id: "final-algebra-v1-01",
    contentLessonId: "algebra-02-termos-semelhantes",
    statement: "Simplifique:\n9x + 4x - 6x",
    correctOptionId: "c",
    options: [
      {id: "a", text: "5x"},
      {id: "b", text: "6x"},
      {id: "c", text: "7x"},
      {id: "d", text: "19x"},
    ],
  },
  {
    id: "final-algebra-v1-02",
    contentLessonId: "algebra-02-termos-semelhantes",
    statement: "Simplifique:\n11a - 3a + 5a",
    correctOptionId: "b",
    options: [
      {id: "a", text: "8a"},
      {id: "b", text: "13a"},
      {id: "c", text: "9a"},
      {id: "d", text: "19a"},
    ],
  },
  {
    id: "final-algebra-v1-03",
    contentLessonId: "algebra-01-linguagem",
    statement: "Calcule 3x^2 - 2x para x = -3.",
    correctOptionId: "d",
    options: [
      {id: "a", text: "21"},
      {id: "b", text: "-33"},
      {id: "c", text: "27"},
      {id: "d", text: "33"},
    ],
  },
  {
    id: "final-algebra-v1-04",
    contentLessonId: "algebra-01-linguagem",
    statement: "Qual e o coeficiente de -12y^4?",
    correctOptionId: "a",
    options: [
      {id: "a", text: "-12"},
      {id: "b", text: "12"},
      {id: "c", text: "4"},
      {id: "d", text: "y"},
    ],
  },
  {
    id: "final-algebra-v1-05",
    contentLessonId: "algebra-03-distributiva",
    statement: "Simplifique:\n4(2x - 3) + 2x",
    correctOptionId: "b",
    options: [
      {id: "a", text: "8x - 12"},
      {id: "b", text: "10x - 12"},
      {id: "c", text: "10x - 3"},
      {id: "d", text: "6x - 12"},
    ],
  },
  {
    id: "final-algebra-v1-06",
    contentLessonId: "algebra-03-distributiva",
    statement: "Simplifique:\n7a - 3(a + 2)",
    correctOptionId: "c",
    options: [
      {id: "a", text: "4a + 6"},
      {id: "b", text: "10a - 6"},
      {id: "c", text: "4a - 6"},
      {id: "d", text: "4a - 2"},
    ],
  },
  {
    id: "final-algebra-v1-07",
    contentLessonId: "precalculo-00-04-potencias-raizes",
    statement: "Efetue a multiplicacao:\n(-4x^3)(3x^2)",
    correctOptionId: "d",
    options: [
      {id: "a", text: "-12x^6"},
      {id: "b", text: "12x^5"},
      {id: "c", text: "-7x^5"},
      {id: "d", text: "-12x^5"},
    ],
  },
  {
    id: "final-algebra-v1-08",
    contentLessonId: "algebra-05-produtos-notaveis",
    statement: "Desenvolva:\n(x + 5)(x - 3)",
    correctOptionId: "a",
    options: [
      {id: "a", text: "x^2 + 2x - 15"},
      {id: "b", text: "x^2 - 2x - 15"},
      {id: "c", text: "x^2 + 8x + 15"},
      {id: "d", text: "x^2 + 2x + 15"},
    ],
  },
  {
    id: "final-algebra-v1-09",
    contentLessonId: "precalculo-00-04-potencias-raizes",
    statement: "Simplifique:\n(18x^4 y^3) / (6x^2 y)",
    correctOptionId: "b",
    options: [
      {id: "a", text: "3x^2 y"},
      {id: "b", text: "3x^2 y^2"},
      {id: "c", text: "12x^2 y^2"},
      {id: "d", text: "3x^6 y^4"},
    ],
  },
  {
    id: "final-algebra-v1-10",
    contentLessonId: "algebra-06-fatoracao",
    statement: "Fatore:\n10x + 15",
    correctOptionId: "c",
    options: [
      {id: "a", text: "10(x + 5)"},
      {id: "b", text: "3(5x + 5)"},
      {id: "c", text: "5(2x + 3)"},
      {id: "d", text: "5(2x + 15)"},
    ],
  },
  {
    id: "final-algebra-v1-11",
    contentLessonId: "precalculo-00-04-potencias-raizes",
    statement: "Simplifique, considerando x diferente de zero:\nx^7 / x^3",
    correctOptionId: "a",
    options: [
      {id: "a", text: "x^4"},
      {id: "b", text: "x^10"},
      {id: "c", text: "x^3"},
      {id: "d", text: "4x"},
    ],
  },
  {
    id: "final-algebra-v1-12",
    contentLessonId: "precalculo-00-04-potencias-raizes",
    statement: "Simplifique:\n(3x^2)^2",
    correctOptionId: "d",
    options: [
      {id: "a", text: "6x^4"},
      {id: "b", text: "9x^2"},
      {id: "c", text: "6x^2"},
      {id: "d", text: "9x^4"},
    ],
  },
  {
    id: "final-algebra-v1-13",
    contentLessonId: "algebra-03-distributiva",
    statement: "Simplifique:\n5(x - 1) - 2(x + 4)",
    correctOptionId: "b",
    options: [
      {id: "a", text: "3x + 3"},
      {id: "b", text: "3x - 13"},
      {id: "c", text: "7x - 13"},
      {id: "d", text: "3x - 9"},
    ],
  },
  {
    id: "final-algebra-v1-14",
    contentLessonId: "algebra-01-linguagem",
    statement: "Calcule 4a^2 + 2a para a = -2.",
    correctOptionId: "c",
    options: [
      {id: "a", text: "20"},
      {id: "b", text: "8"},
      {id: "c", text: "12"},
      {id: "d", text: "-12"},
    ],
  },
  {
    id: "final-algebra-v1-15",
    contentLessonId: "algebra-05-produtos-notaveis",
    statement: "Desenvolva:\n(x + 6)^2",
    correctOptionId: "a",
    options: [
      {id: "a", text: "x^2 + 12x + 36"},
      {id: "b", text: "x^2 + 6x + 36"},
      {id: "c", text: "x^2 + 36"},
      {id: "d", text: "x^2 - 12x + 36"},
    ],
  },
  {
    id: "final-algebra-v1-16",
    contentLessonId: "algebra-06-fatoracao",
    statement: "Fatore:\nx^2 - 25",
    correctOptionId: "d",
    options: [
      {id: "a", text: "(x - 25)(x + 1)"},
      {id: "b", text: "(x - 5)^2"},
      {id: "c", text: "(x + 5)^2"},
      {id: "d", text: "(x - 5)(x + 5)"},
    ],
  },
  {
    id: "final-algebra-v1-17",
    contentLessonId: "algebra-07-fracoes-algebricas",
    statement: "Simplifique:\nx/4 + x/6",
    correctOptionId: "b",
    options: [
      {id: "a", text: "x/10"},
      {id: "b", text: "5x/12"},
      {id: "c", text: "2x/5"},
      {id: "d", text: "x/24"},
    ],
  },
  {
    id: "final-algebra-v1-18",
    contentLessonId: "algebra-02-termos-semelhantes",
    statement: "Simplifique:\n8x^2 y - 5x^2 y - 4x^2 y",
    correctOptionId: "c",
    options: [
      {id: "a", text: "7x^2 y"},
      {id: "b", text: "-9x^2 y"},
      {id: "c", text: "-x^2 y"},
      {id: "d", text: "x^2 y"},
    ],
  },
  {
    id: "final-algebra-v1-19",
    contentLessonId: "algebra-08-sintese",
    statement: "Simplifique:\n3(x + 2) + (x - 4)(x + 4)",
    correctOptionId: "a",
    options: [
      {id: "a", text: "x^2 + 3x - 10"},
      {id: "b", text: "x^2 + 3x + 10"},
      {id: "c", text: "2x^2 - 10"},
      {id: "d", text: "x^2 - 3x - 10"},
    ],
  },
  {
    id: "final-algebra-v1-20",
    contentLessonId: "algebra-03-distributiva",
    statement: "Simplifique:\n2(3x - 5) - (x - 7)",
    correctOptionId: "d",
    options: [
      {id: "a", text: "5x - 17"},
      {id: "b", text: "7x - 3"},
      {id: "c", text: "5x + 3"},
      {id: "d", text: "5x - 3"},
    ],
  },
  {
    id: "final-algebra-v1-21",
    contentLessonId: "precalculo-00-01-reais",
    statement: "Qual numero abaixo e irracional?",
    correctOptionId: "a",
    options: [
      {id: "a", text: "sqrt(3)"},
      {id: "b", text: "0,75"},
      {id: "c", text: "-5"},
      {id: "d", text: "7/2"},
    ],
  },
  {
    id: "final-algebra-v1-22",
    contentLessonId: "precalculo-00-01-reais",
    statement: "Qual intervalo representa -1 < x <= 4?",
    correctOptionId: "c",
    options: [
      {id: "a", text: "[-1, 4]"},
      {id: "b", text: "(-1, 4)"},
      {id: "c", text: "(-1, 4]"},
      {id: "d", text: "[-1, 4)"},
    ],
  },
  {
    id: "final-algebra-v1-23",
    contentLessonId: "precalculo-00-02-operacoes",
    statement: "Calcule: 4 + 3 * 2^2",
    correctOptionId: "d",
    options: [
      {id: "a", text: "28"},
      {id: "b", text: "20"},
      {id: "c", text: "14"},
      {id: "d", text: "16"},
    ],
  },
  {
    id: "final-algebra-v1-24",
    contentLessonId: "precalculo-00-02-operacoes",
    statement: "Calcule: 8 - (3 - 6)",
    correctOptionId: "b",
    options: [
      {id: "a", text: "5"},
      {id: "b", text: "11"},
      {id: "c", text: "-1"},
      {id: "d", text: "17"},
    ],
  },
  {
    id: "final-algebra-v1-25",
    contentLessonId: "precalculo-00-03-linguagem",
    statement: "Na expressao -6x + 9, qual e o coeficiente de x?",
    correctOptionId: "a",
    options: [
      {id: "a", text: "-6"},
      {id: "b", text: "6"},
      {id: "c", text: "9"},
      {id: "d", text: "x"},
    ],
  },
  {
    id: "final-algebra-v1-26",
    contentLessonId: "precalculo-00-03-linguagem",
    statement: "Qual valor deve ser excluido do dominio de 1/(x+5)?",
    correctOptionId: "c",
    options: [
      {id: "a", text: "5"},
      {id: "b", text: "0"},
      {id: "c", text: "-5"},
      {id: "d", text: "1"},
    ],
  },
  {
    id: "final-algebra-v1-27",
    contentLessonId: "precalculo-00-04-potencias-raizes",
    statement: "Simplifique: sqrt(49x^2), considerando x >= 0.",
    correctOptionId: "b",
    options: [
      {id: "a", text: "49x"},
      {id: "b", text: "7x"},
      {id: "c", text: "7x^2"},
      {id: "d", text: "14x"},
    ],
  },
  {
    id: "final-algebra-v1-28",
    contentLessonId: "precalculo-00-04-potencias-raizes",
    statement: "Qual e o valor de 5^0?",
    correctOptionId: "d",
    options: [
      {id: "a", text: "0"},
      {id: "b", text: "5"},
      {id: "c", text: "25"},
      {id: "d", text: "1"},
    ],
  },
  {
    id: "final-algebra-v1-29",
    contentLessonId: "precalculo-00-05-modulo",
    statement: "Resolva |x-2|=4.",
    correctOptionId: "a",
    options: [
      {id: "a", text: "x=-2 ou x=6"},
      {id: "b", text: "x=2 ou x=4"},
      {id: "c", text: "x=-4 ou x=2"},
      {id: "d", text: "x=4 ou x=6"},
    ],
  },
  {
    id: "final-algebra-v1-30",
    contentLessonId: "precalculo-00-05-modulo",
    statement: "Qual desigualdade equivale a |x-3|<2?",
    correctOptionId: "c",
    options: [
      {id: "a", text: "x<1 ou x>5"},
      {id: "b", text: "1<=x<=5"},
      {id: "c", text: "1<x<5"},
      {id: "d", text: "x>5"},
    ],
  },

];

/**
 * Returns a trusted Algebra question by ID.
 *
 * @param {string} questionId Question identifier.
 * @return {TrustedFinalTestQuestion | undefined} Trusted question.
 */
export function getAlgebraFinalTestQuestion(
  questionId: string,
): TrustedFinalTestQuestion | undefined {
  return ALGEBRA_FINAL_TEST_CATALOG.find(
    (question) =>
      question.id === questionId,
  );
}

/**
 * Removes the answer key before a question leaves the backend.
 *
 * @param {TrustedFinalTestQuestion} question Trusted question.
 * @return {PublicFinalTestQuestion} Safe public question.
 */
export function toPublicFinalTestQuestion(
  question: TrustedFinalTestQuestion,
): PublicFinalTestQuestion {
  return {
    id: question.id,
    statement: question.statement,
    options: question.options,
  };
}