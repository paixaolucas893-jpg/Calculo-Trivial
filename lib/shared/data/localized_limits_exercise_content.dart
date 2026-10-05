import 'package:flutter/widgets.dart';

import 'mock_exercise_data.dart';

class _ExerciseTranslation {
  final String title;
  final String statement;
  final String explanation;
  final String? skill;
  final Map<String, String> options;

  const _ExerciseTranslation({
    required this.title,
    required this.statement,
    required this.explanation,
    this.skill,
    this.options = const <String, String>{},
  });
}

ExerciseData localizeLimitsExerciseContent(
  ExerciseData exercise,
  Locale locale,
) {
  if (locale.languageCode != 'en') {
    return exercise;
  }

  final translation = _englishLimitsExercises[exercise.id];
  if (translation == null) {
    return exercise;
  }

  return ExerciseData(
    id: exercise.id,
    title: translation.title,
    statement: translation.statement,
    options: exercise.options
        .map(
          (option) => ExerciseOptionData(
            id: option.id,
            text: translation.options[option.id] ?? option.text,
          ),
        )
        .toList(growable: false),
    correctOptionId: exercise.correctOptionId,
    explanation: translation.explanation,
    contentLessonId: exercise.contentLessonId,
    skill: translation.skill ?? exercise.skill,
    difficulty: exercise.difficulty,
  );
}

const Map<String, _ExerciseTranslation> _englishLimitsExercises = {
  'limite-substituicao-direta': _ExerciseTranslation(
    title: 'Question 1 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 3  (2x² - x + 1)',
    explanation:
        'Because the polynomial is continuous, substitute x = 3 directly: 2(3²) - 3 + 1 = 18 - 3 + 1 = 16.',
    skill: 'Direct substitution in polynomials',
  ),
  'limite-fatoracao': _ExerciseTranslation(
    title: 'Question 2 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 2  (x² - 4) / (x - 2)',
    explanation:
        'Direct substitution gives 0/0. Factor x² - 4 = (x - 2)(x + 2). Cancel x - 2, leaving x + 2. Therefore, the limit is 2 + 2 = 4.',
    skill: 'Difference of squares',
    options: {'d': 'Does not exist'},
  ),
  'limite-racionalizacao': _ExerciseTranslation(
    title: 'Question 3 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 0  (√(x + 9) - 3) / x',
    explanation:
        'Direct substitution gives 0/0. Multiply by the conjugate √(x + 9) + 3. The numerator becomes x and cancels with the denominator, leaving 1/(√(x + 9) + 3). At x = 0, this is 1/6.',
    skill: 'Rationalize using a conjugate',
  ),
  'limite-trigonometrico-fundamental': _ExerciseTranslation(
    title: 'Question 4 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 0  sin(x) / x',
    explanation:
        'Substitution gives 0/0, which is an indeterminate form, not the answer. In radians, sin(x) and x are equivalent near zero, so sin(x)/x tends to 1.',
    skill: 'Fundamental trigonometric limit',
    options: {'d': 'Does not exist'},
  ),
  'limite-no-infinito': _ExerciseTranslation(
    title: 'Question 5 of 45',
    statement: 'Evaluate the limit:\n\nlim x → ∞  (3x² - 2x + 1) / (x² + 5)',
    explanation:
        'Divide numerator and denominator by x². The terms containing 1/x and 1/x² tend to zero, leaving the ratio of leading coefficients, 3/1. Therefore, the limit is 3.',
    skill: 'Dominant terms with equal degrees',
  ),
  'limite-racional-direto': _ExerciseTranslation(
    title: 'Question 6 of 45',
    statement:
        'The table shows values of f(x) near x = 2:\n\nx: 1.9 | 1.99 | 2.01 | 2.1\nf(x): 4.8 | 4.98 | 5.02 | 5.2\n\nWhat is the best prediction for lim x → 2 f(x)?',
    explanation:
        'From both sides of 2, the outputs approach 5: 4.98 from the left and 5.02 from the right. The limit describes this trend, so it is 5. The exact value of f(2) is not needed.',
    skill: 'Read trends from a table',
    options: {'c': '4.98', 'd': 'Cannot be predicted'},
  ),
  'limite-fatoracao-segundo': _ExerciseTranslation(
    title: 'Question 7 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 1  (x² - 1) / (x - 1)',
    explanation:
        'Factor x² - 1 = (x - 1)(x + 1). Cancel x - 1, leaving x + 1. As x approaches 1, the limit is 2.',
    skill: 'Cancel the factor causing 0/0',
    options: {'d': 'Does not exist'},
  ),
  'limite-infinito-grau-menor': _ExerciseTranslation(
    title: 'Question 8 of 45',
    statement: 'Evaluate the limit:\n\nlim x → ∞  (2x + 1) / (x² + 3)',
    explanation:
        'Divide everything by x². All terms with x in the denominator tend to zero while the denominator tends to 1. Therefore, the quotient tends to 0.',
    skill: 'Compare polynomial degrees',
  ),
  'limite-lateral-modulo': _ExerciseTranslation(
    title: 'Question 9 of 45',
    statement: 'Evaluate the one-sided limit:\n\nlim x → 0⁺  |x| / x',
    explanation:
        'As x approaches zero from the right, x is positive and |x| = x. Therefore, |x|/x = 1.',
    skill: 'Right-hand limit',
    options: {'c': 'Does not exist'},
  ),
  'limite-bilateral-modulo': _ExerciseTranslation(
    title: 'Question 10 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 0  |x| / x',
    explanation:
        'From the right, |x|/x tends to 1; from the left, it tends to -1. Because the one-sided limits are different, the two-sided limit does not exist.',
    skill: 'Compare one-sided limits',
    options: {'c': 'Does not exist'},
  ),
  'limite-polinomial-negativo': _ExerciseTranslation(
    title: 'Question 11 of 45',
    statement: 'Evaluate the limit:\n\nlim x → -1  (x³ + 2x)',
    explanation:
        'The polynomial is continuous. Substituting x = -1 gives (-1)³ + 2(-1) = -1 - 2 = -3.',
    skill: 'Substitution with a negative number',
  ),
  'limite-fatoracao-terceiro': _ExerciseTranslation(
    title: 'Question 12 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 3  (x² - 9) / (x - 3)',
    explanation:
        'Direct substitution gives 0/0. Factor x² - 9 as (x - 3)(x + 3). For x near 3, cancel x - 3. The remaining expression x + 3 tends to 6.',
    skill: 'Difference of squares',
  ),
  'limite-racionalizacao-2': _ExerciseTranslation(
    title: 'Question 13 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 4  (√x - 2) / (x - 4)',
    explanation:
        'Direct substitution gives 0/0. Multiply by the conjugate √x + 2. The product in the numerator becomes x - 4, which cancels the denominator. The remaining expression 1/(√x + 2) tends to 1/4.',
    skill: 'Rationalize a difference involving a square root',
  ),
  'limite-trigonometrico-2': _ExerciseTranslation(
    title: 'Question 14 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 0  sin(2x) / x',
    explanation:
        'Rewrite sin(2x)/x as 2·sin(2x)/(2x). As x approaches zero, 2x also approaches zero and the fundamental ratio tends to 1. Therefore, the result is 2.',
    skill: 'Rewrite into the form sin(u)/u',
    options: {'d': 'Does not exist'},
  ),
  'limite-cosseno': _ExerciseTranslation(
    title: 'Question 15 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 0  (1 - cos x) / x',
    explanation:
        'After rationalizing, (1 - cos x)/x = sin²(x)/[x(1 + cos x)]. Rewrite it as [sin(x)/x]·[sin(x)/(1 + cos x)]. The factors tend to 1 and 0, so the limit is 0.',
    skill: 'Trigonometric identity and conjugate',
  ),
  'limite-infinito-cubico': _ExerciseTranslation(
    title: 'Question 16 of 45',
    statement: 'Evaluate the limit:\n\nlim x → ∞  (5x³ + x) / (2x³ - 1)',
    explanation:
        'Divide all terms by x³. The terms 1/x² and 1/x³ tend to zero, so the expression approaches 5/2, the ratio of the leading coefficients.',
    skill: 'Dominant cubic terms',
  ),
  'limite-infinito-grau-maior': _ExerciseTranslation(
    title: 'Question 17 of 45',
    statement: 'Evaluate the limit:\n\nlim x → ∞  x² / (x + 1)',
    explanation:
        'Divide numerator and denominator by x to obtain x/(1 + 1/x). The denominator tends to 1 while the numerator grows without bound, so the ratio tends to +∞.',
    skill: 'Unbounded growth',
  ),
  'limite-lateral-reciproco-direita': _ExerciseTranslation(
    title: 'Question 18 of 45',
    statement: 'Evaluate the one-sided limit:\n\nlim x → 0⁺  1/x',
    explanation:
        'From the right, x takes positive values that get closer to zero. Therefore, 1/x grows without bound and tends to +∞.',
    skill: 'Infinite behavior from the right',
  ),
  'limite-lateral-reciproco-esquerda': _ExerciseTranslation(
    title: 'Question 19 of 45',
    statement: 'Evaluate the one-sided limit:\n\nlim x → 0⁻  1/x',
    explanation:
        'From the left, x takes negative values increasingly close to zero. Therefore, 1/x tends to -∞.',
    skill: 'Infinite behavior from the left',
  ),
  'limite-bilateral-reciproco': _ExerciseTranslation(
    title: 'Question 20 of 45',
    statement: 'Evaluate the limit:\n\nlim x → 0  1/x',
    explanation:
        'Compare both sides first. As x approaches zero from the right, 1/x tends to +∞. From the left, it tends to -∞. Because the one-sided behaviors do not match, the two-sided limit does not exist.',
    skill: 'Determine whether a two-sided limit exists',
    options: {'c': 'Does not exist'},
  ),
  'limite-intuicao-grafico-1': _ExerciseTranslation(
    title: 'Question 21 of 45',
    statement:
        'A graph shows that as x approaches 2 from both sides, f(x) approaches 7, but f(2) = 10. What is lim x → 2 f(x)?',
    explanation:
        'A limit depends on the behavior of f(x) as x approaches 2, not necessarily on the exact value f(2). Since the outputs approach 7 from both sides, the limit is 7.',
    skill: 'Distinguish function value from limit value',
    options: {'d': 'Does not exist'},
  ),
  'limite-intuicao-buraco-1': _ExerciseTranslation(
    title: 'Question 22 of 45',
    statement:
        'If f(x) = (x² − 1)/(x − 1) for x ≠ 1 and f(1) = 8, what is lim x → 1 f(x)?',
    explanation:
        'For x ≠ 1, factor x² − 1 = (x − 1)(x + 1), so f(x) = x + 1. As x approaches 1, x + 1 approaches 2. The isolated value f(1) = 8 does not change the limit.',
    skill: 'Interpret a limit at a removable discontinuity',
    options: {'d': 'Does not exist'},
  ),
  'limite-propriedade-quociente-1': _ExerciseTranslation(
    title: 'Question 23 of 45',
    statement:
        'If lim x → a f(x) = 6 and lim x → a g(x) = 2, what is lim x → a [f(x)/g(x)]?',
    explanation:
        'By the quotient law, when the denominator limit is nonzero, the limit of the quotient is the quotient of the limits. Thus 6/2 = 3.',
    skill: 'Apply the quotient law for limits',
  ),
  'limite-racionalizacao-3': _ExerciseTranslation(
    title: 'Question 24 of 45',
    statement: 'Evaluate:\nlim x → 0  (√(1 + x) − 1)/x',
    explanation:
        'Direct substitution gives 0/0. Multiply by the conjugate to obtain 1/[√(1 + x) + 1]. As x → 0, the denominator tends to 2, so the limit is 1/2.',
    skill: 'Rationalize a radical expression near 1',
  ),
  'limite-infinito-assintota-horizontal-1': _ExerciseTranslation(
    title: 'Question 25 of 45',
    statement:
        'For f(x) = (4x² + 1)/(2x² − 3), what is the horizontal asymptote?',
    explanation:
        'At infinity, when numerator and denominator have the same degree, the limit is the ratio of leading coefficients: 4/2 = 2. Therefore the horizontal asymptote is y = 2.',
    skill: 'Relate limits at infinity to horizontal asymptotes',
  ),
  'limite-trigonometrico-3': _ExerciseTranslation(
    title: 'Question 26 of 45',
    statement: 'Evaluate:\nlim x → 0  sin(5x)/(2x)',
    explanation:
        'Rewrite sin(5x)/(2x) as (5/2)·[sin(5x)/(5x)]. The bracketed factor tends to 1 by the fundamental trigonometric limit, so the result is 5/2.',
    skill: 'Adjust constants in the fundamental trigonometric limit',
  ),
  'limite-sintese-tecnica-1': _ExerciseTranslation(
    title: 'Question 27 of 45',
    statement:
        'Direct substitution into (x² − 9)/(x − 3) as x → 3 gives 0/0. Which technique should be tried first?',
    explanation:
        'The numerator is factorable: x² − 9 is a difference of squares. Factoring allows the factor x − 3 to cancel and reveals the limit.',
    skill: 'Choose factoring from an indeterminate form',
    options: {
      'a': 'Factoring',
      'b': 'Rationalization',
      'c': 'Sign chart',
      'd': 'Differentiation',
    },
  ),
  'limite-sintese-tecnica-2': _ExerciseTranslation(
    title: 'Question 28 of 45',
    statement:
        'Direct substitution into (√(x + 4) − 2)/x as x → 0 gives 0/0. Which technique is most natural?',
    explanation:
        'A difference involving a square root strongly suggests multiplying by the conjugate. This removes the radical from the numerator and makes simplification possible.',
    skill: 'Choose rationalization for a radical limit',
    options: {
      'a': 'Polynomial division',
      'b': 'Factoring by grouping',
      'c': 'Rationalization with the conjugate',
      'd': 'Use only a table of values',
    },
  ),
  'limite-sintese-laterais-1': _ExerciseTranslation(
    title: 'Question 29 of 45',
    statement:
        'To decide whether lim x → a f(x) exists, which condition is required?',
    explanation:
        'A two-sided limit exists only when the left-hand and right-hand limits both exist and are equal. If the one-sided values differ, the two-sided limit does not exist.',
    skill: 'Diagnose existence of a two-sided limit',
    options: {
      'a': 'f(a) must exist',
      'b': 'f(a) must equal zero',
      'c': 'The right-hand limit must be positive',
      'd': 'The one-sided limits must exist and be equal',
    },
  ),
  'limite-sintese-ordem-1': _ExerciseTranslation(
    title: 'Question 30 of 45',
    statement:
        'Which diagnostic sequence is most appropriate when solving an elementary algebraic limit?',
    explanation:
        'An efficient strategy is to start with direct substitution. If an indeterminate form appears, inspect the expression and choose factoring, rationalization, a trigonometric identity, or degree comparison as appropriate.',
    skill: 'Organize a strategy for solving limits',
    options: {
      'a': 'Always factor before substituting',
      'b': 'Substitute; diagnose; choose the appropriate technique',
      'c': 'Always rationalize first',
      'd': 'Compute f(a) and stop',
    },
  ),

  'limite-propriedade-potencia-1': _ExerciseTranslation(
    title: 'Question 31 of 45',
    statement: 'If lim x→a f(x)=3, what is lim x→a [f(x)]⁴?',
    explanation: 'By the power law for limits, the limit may pass through the continuous power function. Thus 3⁴=81.',
    skill: 'Apply the power law for limits',
  ),
  'limite-fatoracao-cubos-1': _ExerciseTranslation(
    title: 'Question 32 of 45',
    statement: 'Evaluate:\nlim x→2 (x³−8)/(x−2)',
    explanation: 'Factor x³−8=(x−2)(x²+2x+4). Cancel x−2 and evaluate 2²+2·2+4=12.',
    skill: 'Factor a difference of cubes in a limit',
  ),
  'limite-fatoracao-parametro-1': _ExerciseTranslation(
    title: 'Question 33 of 45',
    statement: 'Find k so that lim x→1 (x²+kx−1−k)/(x−1)=5.',
    explanation: 'The numerator factors as (x−1)(x+k+1). The limit is k+2. Setting k+2=5 gives k=3.',
    skill: 'Determine a parameter from a factorable limit',
  ),
  'limite-racionalizacao-soma-1': _ExerciseTranslation(
    title: 'Question 34 of 45',
    statement: 'Evaluate:\nlim x→0 [√(4+x)−2]/x',
    explanation: 'Multiply by the conjugate to get 1/[√(4+x)+2]. As x→0, the denominator approaches 4, so the limit is 1/4.',
    skill: 'Rationalize a radical with a constant',
  ),
  'limite-infinito-grau-menor-1': _ExerciseTranslation(
    title: 'Question 35 of 45',
    statement: 'Evaluate:\nlim x→∞ (3x+1)/(x²+5)',
    explanation: 'The denominator has higher degree than the numerator. Dividing by x² shows every numerator term tends to zero, so the limit is 0.',
    skill: 'Compare polynomial degrees at infinity',
  ),
  'limite-infinito-grau-maior-1': _ExerciseTranslation(
    title: 'Question 36 of 45',
    statement: 'What is the behavior of (2x³−x)/(x²+1) as x→∞?',
    explanation: 'The dominant behavior is approximately 2x³/x²=2x, which grows without bound positively. Therefore the limit is +∞.',
    skill: 'Analyze dominant growth at infinity',
  ),
  'limite-infinito-raiz-1': _ExerciseTranslation(
    title: 'Question 37 of 45',
    statement: 'Evaluate:\nlim x→∞ √(x²+1)/x',
    explanation: 'For x>0, √(x²+1)=x√(1+1/x²). Dividing by x leaves √(1+1/x²), which tends to 1.',
    skill: 'Factor the dominant term inside a radical',
  ),
  'limite-trig-1menoscos-1': _ExerciseTranslation(
    title: 'Question 38 of 45',
    statement: 'Evaluate:\nlim x→0 (1−cos x)/x',
    explanation: 'Using 1−cos x=2sin²(x/2), the numerator is of order x² while the denominator is of order x, so the quotient tends to 0.',
    skill: 'Use a trigonometric identity in a limit',
  ),
  'limite-trig-tan-1': _ExerciseTranslation(
    title: 'Question 39 of 45',
    statement: 'Evaluate:\nlim x→0 tan(x)/x',
    explanation: 'tan x/x=[sin x/x]/cos x. The first factor tends to 1 and cos x tends to 1, so the limit is 1.',
    skill: 'Derive the tangent limit from the sine limit',
  ),
  'limite-lateral-racional-1': _ExerciseTranslation(
    title: 'Question 40 of 45',
    statement: 'For f(x)=1/(x−2), what is lim x→2⁺ f(x)?',
    explanation: 'Approaching 2 from the right makes x−2 positive and close to zero. Its reciprocal grows without bound positively, so the limit is +∞.',
    skill: 'Determine an infinite one-sided limit',
  ),
  'limite-sintese-combinado-1': _ExerciseTranslation(
    title: 'Question 41 of 45',
    statement: 'Evaluate:\nlim x→1 [(x²−1)/(x−1)]·[(√x−1)/(x−1)]',
    explanation: 'The first factor tends to 2 after factoring. The second tends to 1/2 after rationalizing. Their product is 1.',
    skill: 'Combine factoring and rationalization',
  ),
  'limite-sintese-pedaco-1': _ExerciseTranslation(
    title: 'Question 42 of 45',
    statement: 'If f(x)=x+1 for x<0 and f(x)=x² for x≥0, what is lim x→0 f(x)?',
    explanation: 'The left-hand limit is 1 while the right-hand limit is 0. Since they differ, the two-sided limit does not exist.',
    skill: 'Analyze a piecewise-function limit',
    options: {'a': 'Does not exist'},
  ),
  'limite-sintese-parametro-partes-1': _ExerciseTranslation(
    title: 'Question 43 of 45',
    statement: 'If f(x)=kx+1 for x<2 and f(x)=x²−1 for x≥2, which k makes lim x→2 f(x) exist?',
    explanation: 'The right-hand limit is 3 and the left-hand limit is 2k+1. Setting 2k+1=3 gives k=1.',
    skill: 'Determine a parameter from equality of one-sided limits',
  ),
  'limite-intuicao-epsilon-1': _ExerciseTranslation(
    title: 'Question 44 of 45',
    statement: 'The statement “f(x) can be made arbitrarily close to L when x is sufficiently close to a” describes which idea?',
    explanation: 'This is the core intuition behind the epsilon-delta definition of a limit: control the closeness of f(x) to L by controlling the closeness of x to a.',
    skill: 'Connect intuition with the formal limit definition',
    options: {
      'a': 'Uniform continuity',
      'b': 'Definition of a limit',
      'c': 'Derivative',
      'd': 'Definite integral',
    },
  ),
  'limite-propriedade-raiz-1': _ExerciseTranslation(
    title: 'Question 45 of 45',
    statement: 'If lim x→a f(x)=9 and f(x)≥0 near a, what is lim x→a √f(x)?',
    explanation: 'The square-root function is continuous for nonnegative inputs, so the limit is √9=3.',
    skill: 'Apply continuity of the square root to limits',
  ),

};