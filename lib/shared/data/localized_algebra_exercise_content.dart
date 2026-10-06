import 'package:flutter/widgets.dart';

import 'mock_exercise_data.dart';

class _ExerciseTranslation {
  final String title;
  final String statement;
  final String explanation;
  final String? skill;

  const _ExerciseTranslation({
    required this.title,
    required this.statement,
    required this.explanation,
    this.skill,
  });
}

ExerciseData localizeAlgebraExerciseContent(
  ExerciseData exercise,
  Locale locale,
) {
  if (locale.languageCode != 'en') {
    final normalizedStatement = exercise.statement.replaceAll(r'\n', '\n');
    if (normalizedStatement == exercise.statement) {
      return exercise;
    }

    return ExerciseData(
      id: exercise.id,
      title: exercise.title,
      statement: normalizedStatement,
      options: exercise.options,
      correctOptionId: exercise.correctOptionId,
      explanation: exercise.explanation,
      contentLessonId: exercise.contentLessonId,
      skill: exercise.skill,
      difficulty: exercise.difficulty,
    );
  }

  final translation = _englishAlgebraExercises[exercise.id];
  if (translation == null) {
    return exercise;
  }

  return ExerciseData(
    id: exercise.id,
    title: translation.title,
    statement: translation.statement,
    options: exercise.options,
    correctOptionId: exercise.correctOptionId,
    explanation: translation.explanation,
    contentLessonId: exercise.contentLessonId,
    skill: translation.skill ?? exercise.skill,
    difficulty: exercise.difficulty,
  );
}

const Map<String, _ExerciseTranslation> _englishAlgebraExercises = {
  'simplificacao-1': _ExerciseTranslation(
    title: 'Question 1 of 66',
    statement: 'Simplify the expression:\n3x + 5x − 2x',
    explanation:
        'Add only the coefficients of like terms: 3 + 5 − 2 = 6. The literal part x remains unchanged, so the simplified expression is 6x.',
    skill: 'Combine like terms',
  ),
  'simplificacao-2': _ExerciseTranslation(
    title: 'Question 2 of 66',
    statement: 'Simplify the expression:\n7a − 2a + 4a',
    explanation:
        'All terms have the same literal part a. Add the coefficients 7 − 2 + 4 = 9 and keep the variable, giving 9a.',
    skill: 'Combine like terms',
  ),
  'simplificacao-3': _ExerciseTranslation(
    title: 'Question 3 of 66',
    statement: 'Evaluate 2x² − 3x for x = −2.',
    explanation:
        'Substitute x = −2: 2(−2)² − 3(−2). Evaluate the power first: 2·4 + 6 = 14, so the numerical value is 14.',
    skill: 'Evaluate an algebraic expression',
  ),
  'simplificacao-4': _ExerciseTranslation(
    title: 'Question 4 of 66',
    statement: 'What is the coefficient of −8x³?',
    explanation:
        'The coefficient is the number multiplying the literal part. In −8x³, the literal part is x³ and the number multiplying it is −8.',
    skill: 'Identify coefficients',
  ),
  'simplificacao-5': _ExerciseTranslation(
    title: 'Question 5 of 66',
    statement: 'Simplify the expression:\n12x − 5x + 2x',
    explanation:
        'Because all three terms contain x, add the coefficients: 12 − 5 + 2 = 9. Therefore, the equivalent expression is 9x.',
    skill: 'Combine like terms',
  ),
  'distributiva-1': _ExerciseTranslation(
    title: 'Question 6 of 66',
    statement: 'Simplify the expression:\n2(3x − 4) + x',
    explanation:
        'Apply the distributive property to every term inside the parentheses: 2(3x − 4) = 6x − 8. Then add x to obtain 7x − 8.',
    skill: 'Apply the distributive property',
  ),
  'distributiva-2': _ExerciseTranslation(
    title: 'Question 7 of 66',
    statement: 'Simplify the expression:\n5a − 2(a + 3)',
    explanation:
        'The factor −2 multiplies both a and 3, producing −2a − 6. Therefore, 5a − 2a − 6 = 3a − 6.',
    skill: 'Distribute negative signs',
  ),
  'potencias-1': _ExerciseTranslation(
    title: 'Question 8 of 66',
    statement: 'Multiply:\n(−3x²)(2x)',
    explanation:
        'Multiply the coefficients: −3·2 = −6. For the same base x, add the exponents: x²·x = x³. The product is −6x³.',
    skill: 'Multiply monomials',
  ),
  'produto-notavel-1': _ExerciseTranslation(
    title: 'Question 9 of 66',
    statement: 'Expand the product:\n(x + 3)(x − 2)',
    explanation:
        'Distribute each term: x² − 2x + 3x − 6. Combining −2x + 3x gives x² + x − 6.',
    skill: 'Expand binomials',
  ),
  'divisao-monomios-1': _ExerciseTranslation(
    title: 'Question 10 of 66',
    statement: 'Simplify the expression:\n(12x³y²) / (3xy)',
    explanation:
        'Divide the coefficients and subtract exponents of equal bases: 12/3 = 4, x³/x = x², and y²/y = y. The result is 4x²y.',
    skill: 'Divide monomials',
  ),
  'fator-comum-1': _ExerciseTranslation(
    title: 'Question 11 of 66',
    statement: 'Factor the expression:\n6x + 9',
    explanation:
        'The greatest common factor of 6x and 9 is 3. Factoring out 3 gives 6x = 3·2x and 9 = 3·3, so the result is 3(2x + 3).',
    skill: 'Factor out the greatest common factor',
  ),
  'quociente-potencias-1': _ExerciseTranslation(
    title: 'Question 12 of 66',
    statement: 'Simplify, assuming x ≠ 0:\nx⁵ / x²',
    explanation:
        'When dividing powers with the same base, subtract the exponents: x⁵/x² = x⁵⁻² = x³. The restriction x ≠ 0 prevents division by zero.',
    skill: 'Use the quotient rule for powers',
  ),
  'potencia-potencia-1': _ExerciseTranslation(
    title: 'Question 13 of 66',
    statement: 'Simplify the expression:\n(2x²)³',
    explanation:
        'Raise each factor to the third power: 2³ = 8 and (x²)³ = x⁶ because the exponents are multiplied. Therefore, the expression becomes 8x⁶.',
    skill: 'Evaluate a power of a power',
  ),
  'distributiva-3': _ExerciseTranslation(
    title: 'Question 14 of 66',
    statement: 'Simplify the expression:\n3(x + 2) − 2(x − 1)',
    explanation:
        'Distributing gives 3x + 6 − 2x + 2. Notice that −2 times −1 gives +2. Combining like terms gives x + 8.',
    skill: 'Combine distribution and sign rules',
  ),
  'valor-numerico-1': _ExerciseTranslation(
    title: 'Question 15 of 66',
    statement: 'Evaluate 2a² − 3a for a = −2.',
    explanation:
        'Substitute a = −2: 2(−2)² − 3(−2). Evaluate the power first: 2·4 + 6. Therefore, the value is 14.',
    skill: 'Evaluate an algebraic expression',
  ),
  'quadrado-soma-1': _ExerciseTranslation(
    title: 'Question 16 of 66',
    statement: 'Expand the special product:\n(x + 4)²',
    explanation:
        'Use (a + b)² = a² + 2ab + b². Here, a = x and b = 4, so the result is x² + 8x + 16.',
    skill: 'Use the square of a sum',
  ),
  'diferenca-quadrados-1': _ExerciseTranslation(
    title: 'Question 17 of 66',
    statement: 'Factor the expression:\nx² − 9',
    explanation:
        'This is a difference of squares: x² − 3². The identity a² − b² = (a − b)(a + b) gives (x − 3)(x + 3).',
    skill: 'Factor a difference of squares',
  ),
  'soma-fracoes-algebricas-1': _ExerciseTranslation(
    title: 'Question 18 of 66',
    statement: 'Simplify the expression:\nx/2 + x/3',
    explanation:
        'The least common multiple of 2 and 3 is 6. Rewrite x/2 as 3x/6 and x/3 as 2x/6, then add to obtain 5x/6.',
    skill: 'Add algebraic fractions',
  ),
  'termos-semelhantes-1': _ExerciseTranslation(
    title: 'Question 19 of 66',
    statement: 'Simplify:\n4x²y − 7x²y + 2x²y',
    explanation:
        'All terms have the same literal part x²y. Add the coefficients 4 − 7 + 2 = −1, so the result is −x²y.',
    skill: 'Combine terms with two variables',
  ),
  'sintese-algebrica-1': _ExerciseTranslation(
    title: 'Question 20 of 66',
    statement: 'Simplify:\n2(x + 1) + (x − 3)(x + 3)',
    explanation:
        'Use two tools: 2(x + 1) = 2x + 2 and (x − 3)(x + 3) = x² − 9. Adding the results gives x² + 2x − 7.',
    skill: 'Choose algebraic strategies',
  ),
  'polinomios-estrutura-1': _ExerciseTranslation(
    title: 'Question 21 of 66',
    statement:
        'Consider P(x)=−3x⁵+2x²−7. What are its degree and leading coefficient?',
    explanation:
        'The largest exponent is 5, so the degree of P is 5. The coefficient of the highest-degree term −3x⁵ is −3, so −3 is the leading coefficient.',
    skill: 'Identify degree and leading coefficient',
  ),
  'polinomios-classificacao-1': _ExerciseTranslation(
    title: 'Question 22 of 66',
    statement: 'Which expression is NOT a polynomial in x?',
    explanation:
        'A polynomial in x uses only nonnegative integer exponents. The expression 3/x equals 3x⁻¹, so it contains a negative exponent and is not a polynomial.',
    skill: 'Recognize polynomial expressions',
  ),
  'operacoes-polinomios-1': _ExerciseTranslation(
    title: 'Question 23 of 66',
    statement: 'Compute (2x²+3x−1) − (x²−5x+4).',
    explanation:
        'Distribute the negative sign through the entire second polynomial: 2x²+3x−1−x²+5x−4. Combining like terms gives x²+8x−5.',
    skill: 'Subtract polynomials with sign control',
  ),
  'operacoes-polinomios-2': _ExerciseTranslation(
    title: 'Question 24 of 66',
    statement: 'Expand (x−2)(x²+3x+4).',
    explanation:
        'Distribute x and then −2: x³+3x²+4x−2x²−6x−8. Combining like terms gives x³+x²−2x−8.',
    skill: 'Multiply polynomials',
  ),
  'linguagem-agrupamento-1': _ExerciseTranslation(
    title: 'Question 25 of 66',
    statement: 'Which expression represents “the square of the sum of x and 3”?',
    explanation:
        'The wording asks for x and 3 to be added first and then for the entire sum to be squared. The required grouping gives (x + 3)².',
    skill: 'Translate verbal language with grouping',
  ),
  'linguagem-modelagem-1': _ExerciseTranslation(
    title: 'Question 26 of 66',
    statement:
        'A service charges a fixed fee of 12 plus 4.50 per hour of use. If h is the number of hours, which expression represents the total cost?',
    explanation:
        'The total has a fixed part, 12, and a variable part of 4.5 for each hour. For h hours the variable cost is 4.5h, so the total is 12 + 4.5h.',
    skill: 'Model situations with algebraic expressions',
  ),
  'termos-semelhantes-2': _ExerciseTranslation(
    title: 'Question 27 of 66',
    statement: 'Simplify:\n5x² − 3x + 2x² + 7x',
    explanation:
        'Combine terms with the same literal part: 5x² + 2x² = 7x² and −3x + 7x = 4x. Therefore the simplified expression is 7x² + 4x.',
    skill: 'Combine like terms of different degrees',
  ),
  'termos-semelhantes-3': _ExerciseTranslation(
    title: 'Question 28 of 66',
    statement: 'Which term is like 4a²b?',
    explanation:
        'Like terms must have exactly the same variables raised to exactly the same powers. Therefore −7a²b has the same literal part as 4a²b.',
    skill: 'Recognize like terms',
  ),
  'distributiva-4': _ExerciseTranslation(
    title: 'Question 29 of 66',
    statement: 'Simplify:\n−3(2x − 5) + 4x',
    explanation:
        'Distributing −3 gives −6x + 15. Then combine the x-terms: −6x + 4x = −2x. The simplified expression is −2x + 15.',
    skill: 'Apply distribution with a negative factor',
  ),
  'distributiva-5': _ExerciseTranslation(
    title: 'Question 30 of 66',
    statement: 'Simplify:\n2[3x − (x − 4)]',
    explanation:
        'Removing the inner parentheses changes the signs: 3x − x + 4 = 2x + 4. Multiplying the entire result by 2 gives 4x + 8.',
    skill: 'Combine grouping, signs, and distribution',
  ),
  'potencias-2': _ExerciseTranslation(
    title: 'Question 31 of 66',
    statement: 'Simplify:\n(3a²b)²',
    explanation:
        'The exponent applies to every factor. We have 3² = 9, (a²)² = a⁴, and b². Thus (3a²b)² = 9a⁴b².',
    skill: 'Raise a monomial to a power',
  ),
  'potencias-3': _ExerciseTranslation(
    title: 'Question 32 of 66',
    statement: 'Simplify, assuming x ≠ 0:\n(2x³) / (8x)',
    explanation:
        'Divide the coefficients, 2/8 = 1/4, and subtract exponents of the same base: x³/x = x². The result is x²/4.',
    skill: 'Simplify quotients of monomials',
  ),
  'produto-notavel-2': _ExerciseTranslation(
    title: 'Question 33 of 66',
    statement: 'Expand:\n(x − 5)²',
    explanation:
        'Use (a − b)² = a² − 2ab + b². With a = x and b = 5, this gives x² − 10x + 25.',
    skill: 'Use the square of a difference',
  ),
  'produto-notavel-3': _ExerciseTranslation(
    title: 'Question 34 of 66',
    statement: 'Expand:\n(2x + 3)²',
    explanation:
        'Using (a + b)² = a² + 2ab + b² gives (2x)² = 4x², 2·2x·3 = 12x, and 3² = 9. Therefore the result is 4x² + 12x + 9.',
    skill: 'Expand the square of a binomial',
  ),
  'produto-notavel-4': _ExerciseTranslation(
    title: 'Question 35 of 66',
    statement: 'Multiply:\n(3x − 2)(3x + 2)',
    explanation:
        'The factors form a product of a difference and a sum: (a − b)(a + b) = a² − b². Taking a = 3x and b = 2 gives 9x² − 4.',
    skill: 'Use the product of a sum and a difference',
  ),
  'fatoracao-2': _ExerciseTranslation(
    title: 'Question 36 of 66',
    statement: 'Factor completely:\n8x² + 12x',
    explanation:
        'The greatest common factor of 8x² and 12x is 4x. Factoring it out gives 4x(2x + 3), which is completely factored.',
    skill: 'Factor out the greatest common factor',
  ),
  'fatoracao-3': _ExerciseTranslation(
    title: 'Question 37 of 66',
    statement: 'Factor:\nx² + 7x + 12',
    explanation:
        'We need two numbers whose product is 12 and whose sum is 7. The numbers 3 and 4 satisfy both conditions, so the factorization is (x + 3)(x + 4).',
    skill: 'Factor a monic quadratic trinomial',
  ),
  'fatoracao-4': _ExerciseTranslation(
    title: 'Question 38 of 66',
    statement: 'Factor:\n4x² − 25',
    explanation:
        'This is a difference of squares because 4x² = (2x)² and 25 = 5². Therefore 4x² − 25 = (2x − 5)(2x + 5).',
    skill: 'Factor a difference of squares with a coefficient',
  ),
  'fracoes-algebricas-2': _ExerciseTranslation(
    title: 'Question 39 of 66',
    statement: 'Simplify, with x ≠ 3:\n(x² − 9) / (x − 3)',
    explanation:
        'Factor the numerator as (x − 3)(x + 3). Since x ≠ 3, the common factor x − 3 can be canceled, leaving x + 3.',
    skill: 'Simplify rational expressions by factoring',
  ),
  'fracoes-algebricas-3': _ExerciseTranslation(
    title: 'Question 40 of 66',
    statement: 'Add, assuming x ≠ 0:\n2/x + 3/(2x)',
    explanation:
        'The common denominator is 2x. Rewrite 2/x as 4/(2x), then add 4/(2x) + 3/(2x) to obtain 7/(2x).',
    skill: 'Add rational expressions with related denominators',
  ),
  'fracoes-algebricas-4': _ExerciseTranslation(
    title: 'Question 41 of 66',
    statement: 'Multiply, assuming x ≠ 0:\n(x/3) · (9/x²)',
    explanation:
        'Multiplying gives 9x/(3x²). Simplify 9/3 to 3 and x/x² to 1/x. The product therefore reduces to 3/x.',
    skill: 'Multiply and simplify rational expressions',
  ),
  'fracoes-algebricas-5': _ExerciseTranslation(
    title: 'Question 42 of 66',
    statement:
        'Simplify and preserve the restrictions:\n(x² − 4) / (x² + x − 6)',
    explanation:
        'Factor the numerator as (x − 2)(x + 2) and the denominator as (x − 2)(x + 3). Cancel x − 2, but retain the original restrictions x ≠ 2 and x ≠ −3.',
    skill: 'Simplify rational expressions while preserving restrictions',
  ),
  'sintese-algebrica-2': _ExerciseTranslation(
    title: 'Question 43 of 66',
    statement: 'Simplify:\n3(x − 2) + (x + 1)²',
    explanation:
        'Use distribution and a special product: 3(x − 2) = 3x − 6 and (x + 1)² = x² + 2x + 1. Adding them gives x² + 5x − 5.',
    skill: 'Combine distribution and special products',
  ),
  'sintese-algebrica-3': _ExerciseTranslation(
    title: 'Question 44 of 66',
    statement: 'Simplify, with x ≠ 4:\n(x² − 16) / (x² − 8x + 16)',
    explanation:
        'Factor x² − 16 as (x − 4)(x + 4) and x² − 8x + 16 as (x − 4)². Cancel one x − 4 factor to obtain (x + 4)/(x − 4), with x ≠ 4.',
    skill: 'Combine special products and rational expressions',
  ),
  'sintese-algebrica-4': _ExerciseTranslation(
    title: 'Question 45 of 66',
    statement: 'Factor:\n2a(a − 3) − (a − 3)(a + 1)',
    explanation:
        'The common factor is a − 3. Factoring gives (a − 3)[2a − (a + 1)] = (a − 3)(a − 1).',
    skill: 'Recognize a common factor in a compound expression',
  ),
  'sintese-algebrica-5': _ExerciseTranslation(
    title: 'Question 46 of 66',
    statement:
        'A student simplified (x² + 6x + 9)/(x + 3) to x + 3. Which condition must remain attached to the simplification?',
    explanation:
        'The numerator is (x + 3)², so cancellation gives x + 3. However, the original expression is undefined at x = −3, so the restriction x ≠ −3 must remain.',
    skill: 'Analyze simplifications and domain restrictions',
  ),
  'polinomios-estrutura-2': _ExerciseTranslation(
    title: 'Question 47 of 66',
    statement:
        'Let P(x) = 7 − 2x⁴ + x². Which ordered pair gives (degree, leading coefficient)?',
    explanation:
        'In descending powers, P(x) = −2x⁴ + x² + 7. The highest exponent is 4 and the coefficient of the leading term is −2, giving (4, −2).',
    skill: 'Identify degree and leading coefficient from unordered form',
  ),
  'polinomios-classificacao-2': _ExerciseTranslation(
    title: 'Question 48 of 66',
    statement: 'Which expression is NOT a polynomial in x?',
    explanation:
        'Polynomial exponents must be nonnegative integers. Since √x = x^(1/2), the expression √x + 1 contains a fractional exponent and is not a polynomial.',
    skill: 'Distinguish polynomials from non-polynomial expressions',
  ),
  'operacoes-polinomios-3': _ExerciseTranslation(
    title: 'Question 49 of 66',
    statement: 'Add:\n(3x² − 2x + 5) + (x² + 7x − 1)',
    explanation:
        'Combine like terms: 3x² + x² = 4x², −2x + 7x = 5x, and 5 − 1 = 4. The sum is 4x² + 5x + 4.',
    skill: 'Add polynomials',
  ),
  'operacoes-polinomios-4': _ExerciseTranslation(
    title: 'Question 50 of 66',
    statement: 'Expand:\n(2x − 1)(x² + x + 3)',
    explanation:
        'Distribute 2x and then −1: 2x³ + 2x² + 6x − x² − x − 3. Combining like terms gives 2x³ + x² + 5x − 3.',
    skill: 'Multiply a binomial by a trinomial',
  ),

  'fundamentos-reais-1': _ExerciseTranslation(
    title: 'Question 51 of 66',
    statement: 'Which number below is rational?',
    explanation: 'A rational number can be written as a ratio of two integers with a nonzero denominator. The number −3/5 is already in that form, so it belongs to the rational numbers.',
    skill: 'Classify real numbers',
  ),
  'fundamentos-reais-2': _ExerciseTranslation(
    title: 'Question 52 of 66',
    statement: 'Write in interval notation:\n−2 ≤ x < 4',
    explanation: 'The value −2 is included, so the interval uses a bracket on the left. The value 4 is excluded, so the interval uses a parenthesis on the right: [−2, 4).',
    skill: 'Represent inequalities with intervals',
  ),
  'fundamentos-reais-3': _ExerciseTranslation(
    title: 'Question 53 of 66',
    statement: 'What is the distance between −3 and 5 on the real line?',
    explanation: 'Distance between real numbers a and b is |a−b|. Here, |−3−5|=|−8|=8, and distance is always nonnegative.',
    skill: 'Compute distance on the real line',
  ),
  'fundamentos-reais-4': _ExerciseTranslation(
    title: 'Question 54 of 66',
    statement: 'Which number is irrational?',
    explanation: '√7 is irrational because 7 is not a perfect square and its square root cannot be written as a ratio of integers. The other options are rational.',
    skill: 'Distinguish rational and irrational numbers',
  ),
  'fundamentos-operacoes-1': _ExerciseTranslation(
    title: 'Question 55 of 66',
    statement: 'Evaluate using the correct order of operations:\n3 + 2·5',
    explanation: 'Multiplication comes before addition. First compute 2·5=10, then 3+10=13.',
    skill: 'Apply order of operations',
  ),
  'fundamentos-operacoes-2': _ExerciseTranslation(
    title: 'Question 56 of 66',
    statement: 'Evaluate:\n18 ÷ 3 · (2 + 1)',
    explanation: 'First compute the grouping: 2+1=3. Division and multiplication have the same priority and proceed left to right: 18÷3=6 and 6·3=18.',
    skill: 'Evaluate expressions with grouping',
  ),
  'fundamentos-operacoes-3': _ExerciseTranslation(
    title: 'Question 57 of 66',
    statement: 'Evaluate:\n7 − (3 − 5)',
    explanation: 'Compute inside the parentheses first: 3−5=−2. Then 7−(−2)=7+2=9.',
    skill: 'Control signs in grouped expressions',
  ),
  'fundamentos-operacoes-4': _ExerciseTranslation(
    title: 'Question 58 of 66',
    statement: 'What is the value of −2²?',
    explanation: 'Without parentheses, the exponent applies only to 2: −2²=−(2²)=−4. By contrast, (−2)² would equal 4.',
    skill: 'Interpret signs and powers',
  ),
  'fundamentos-linguagem-1': _ExerciseTranslation(
    title: 'Question 59 of 66',
    statement: 'In the expression 5x − 7, what is the coefficient of x?',
    explanation: 'The coefficient is the number multiplying the variable. In 5x−7, the variable term is 5x, so the coefficient is 5.',
    skill: 'Identify coefficients and terms',
  ),
  'fundamentos-linguagem-2': _ExerciseTranslation(
    title: 'Question 60 of 66',
    statement: 'Which expression represents “three times a number x, increased by 4”?',
    explanation: 'Three times x is 3x. Increasing that result by 4 gives 3x+4.',
    skill: 'Translate verbal language into algebra',
  ),
  'fundamentos-linguagem-3': _ExerciseTranslation(
    title: 'Question 61 of 66',
    statement: 'Evaluate 2a + 3 for a = −1.',
    explanation: 'Substitute a=−1: 2(−1)+3=−2+3=1. The sign of the substituted value must be preserved.',
    skill: 'Evaluate an expression by substitution',
  ),
  'fundamentos-linguagem-4': _ExerciseTranslation(
    title: 'Question 62 of 66',
    statement: 'Which value must be excluded from the expression 1/(x − 2)?',
    explanation: 'The denominator cannot be zero. Requiring x−2≠0 gives x≠2, so 2 must be excluded from the domain.',
    skill: 'Identify a domain restriction',
  ),
  'fundamentos-modulo-1': _ExerciseTranslation(
    title: 'Question 63 of 66',
    statement: 'Evaluate |−7|.',
    explanation: 'Absolute value represents distance from zero. The number −7 is 7 units from zero, so |−7|=7.',
    skill: 'Interpret absolute value',
  ),
  'fundamentos-modulo-2': _ExerciseTranslation(
    title: 'Question 64 of 66',
    statement: 'Solve:\n|x − 3| = 5',
    explanation: 'The distance from x to 3 must be 5. Thus x−3=5 or x−3=−5, giving x=8 or x=−2.',
    skill: 'Solve an absolute-value equation',
  ),
  'fundamentos-modulo-3': _ExerciseTranslation(
    title: 'Question 65 of 66',
    statement: 'Solve:\n|x − 4| < 2',
    explanation: 'The inequality means the distance from x to 4 is less than 2. Therefore 4−2<x<4+2, so 2<x<6.',
    skill: 'Interpret an absolute-value inequality',
  ),
  'fundamentos-modulo-4': _ExerciseTranslation(
    title: 'Question 66 of 66',
    statement: 'If |x + 1| = 0, what is x?',
    explanation: 'An absolute value is zero only when the expression inside it is zero. Therefore x+1=0 and x=−1.',
    skill: 'Use the zero absolute-value condition',
  ),

};