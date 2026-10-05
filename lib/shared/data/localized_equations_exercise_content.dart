import 'package:flutter/widgets.dart';

import 'mock_exercise_data.dart';

class _EquationExerciseTranslation {
  final String title;
  final String statement;
  final String explanation;
  final Map<String, String> options;

  const _EquationExerciseTranslation({
    required this.title,
    required this.statement,
    required this.explanation,
    this.options = const <String, String>{},
  });
}

ExerciseData localizeEquationsExerciseContent(
  ExerciseData exercise,
  Locale locale,
) {
  if (locale.languageCode != 'en') {
    return exercise;
  }

  final translation = _englishEquationExercises[exercise.id];
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
    skill: exercise.skill,
    difficulty: exercise.difficulty,
  );
}

const Map<String, _EquationExerciseTranslation> _englishEquationExercises = {
  'equacao-1': _EquationExerciseTranslation(
    title: 'Question 1 of 50',
    statement: 'Solve the equation:\nx + 3 = 8',
    explanation:
        'To isolate x, subtract 3 from both sides: x = 8 - 3. Therefore, x = 5.',
  ),
  'equacao-2': _EquationExerciseTranslation(
    title: 'Question 2 of 50',
    statement: 'Solve the equation:\n2x = 10',
    explanation:
        'To isolate x, divide both sides by 2: x = 10 ÷ 2. Therefore, x = 5.',
  ),
  'equacao-3': _EquationExerciseTranslation(
    title: 'Question 3 of 50',
    statement: 'Solve the equation:\nx - 4 = 9',
    explanation:
        'To isolate x, add 4 to both sides: x = 9 + 4. Therefore, x = 13.',
  ),
  'equacao-4': _EquationExerciseTranslation(
    title: 'Question 4 of 50',
    statement: 'Solve the equation:\n3x + 2 = 11',
    explanation:
        'First subtract 2 from both sides: 3x = 9. Then divide by 3: x = 3.',
  ),
  'inequacao-1': _EquationExerciseTranslation(
    title: 'Question 5 of 50',
    statement: 'Solve the inequality:\nx + 2 > 7',
    explanation:
        'To isolate x, subtract 2 from both sides: x > 7 - 2. Therefore, x > 5.',
  ),
  'equacao-5': _EquationExerciseTranslation(
    title: 'Question 6 of 50',
    statement: 'Solve the equation:\n5x - 7 = 18',
    explanation:
        'Add 7 to both sides: 5x = 25. Then divide by 5 to obtain x = 5.',
  ),
  'equacao-distributiva': _EquationExerciseTranslation(
    title: 'Question 7 of 50',
    statement: 'Solve the equation:\n4(x - 2) = 12',
    explanation:
        'Divide both sides by 4: x - 2 = 3. Adding 2 to both sides gives x = 5.',
  ),
  'equacao-fracao': _EquationExerciseTranslation(
    title: 'Question 8 of 50',
    statement: 'Solve the equation:\nx/3 + 2 = 6',
    explanation:
        'Subtract 2 from both sides: x/3 = 4. Multiplying both sides by 3 gives x = 12.',
  ),
  'inequacao-2': _EquationExerciseTranslation(
    title: 'Question 9 of 50',
    statement: 'Solve the inequality:\n2x - 3 ≤ 7',
    explanation:
        'Add 3 to both sides: 2x ≤ 10. Dividing by 2, which is positive, keeps the inequality sign unchanged: x ≤ 5.',
  ),
  'inequacao-negativa': _EquationExerciseTranslation(
    title: 'Question 10 of 50',
    statement: 'Solve the inequality:\n-3x > 12',
    explanation:
        'When dividing an inequality by a negative number, reverse the inequality sign. Dividing by -3 gives x < -4.',
  ),
  'equacao-termos-dois-lados': _EquationExerciseTranslation(
    title: 'Question 11 of 50',
    statement: 'Solve the equation:\n2x + 5 = x - 3',
    explanation:
        'Subtract x from both sides and then subtract 5: x = -3 - 5. Therefore, x = -8.',
  ),
  'equacao-distributiva-dois-lados': _EquationExerciseTranslation(
    title: 'Question 12 of 50',
    statement: 'Solve the equation:\n3(x + 1) = 2x + 7',
    explanation:
        'Distribute first: 3x + 3 = 2x + 7. Subtracting 2x and 3 from both sides gives x = 4.',
  ),
  'equacao-fracionaria-2': _EquationExerciseTranslation(
    title: 'Question 13 of 50',
    statement: 'Solve the equation:\n(x - 2) / 4 = 3',
    explanation:
        'Multiply both sides by 4: x - 2 = 12. Adding 2 gives x = 14.',
  ),
  'sistema-linear-1': _EquationExerciseTranslation(
    title: 'Question 14 of 50',
    statement: 'Solve the system:\nx + y = 7\nx - y = 1',
    explanation:
        'Add the equations to get 2x = 8, so x = 4. Substitute into x + y = 7 to obtain y = 3.',
    options: {
      'a': 'x = 4 and y = 3',
      'b': 'x = 3 and y = 4',
      'c': 'x = 7 and y = 1',
      'd': 'x = 2 and y = 5',
    },
  ),
  'equacao-quadratica-1': _EquationExerciseTranslation(
    title: 'Question 15 of 50',
    statement: 'Solve the equation:\nx² - 9 = 0',
    explanation: 'We have x² = 9. Therefore, x can be 3 or -3.',
    options: {
      'c': 'x = -3 or x = 3',
    },
  ),
  'equacao-quadratica-2': _EquationExerciseTranslation(
    title: 'Question 16 of 50',
    statement: 'Solve the equation:\nx² - 5x + 6 = 0',
    explanation:
        'Factor the expression: (x - 2)(x - 3) = 0. Therefore, x = 2 or x = 3.',
    options: {
      'a': 'x = -2 or x = -3',
      'b': 'x = 2 or x = 3',
      'c': 'x = 1 or x = 6',
      'd': 'x = -1 or x = -6',
    },
  ),
  'inequacao-3': _EquationExerciseTranslation(
    title: 'Question 17 of 50',
    statement: 'Solve the inequality:\n5 - 2x < 9',
    explanation:
        'Subtract 5: -2x < 4. When dividing by -2, reverse the inequality sign to obtain x > -2.',
  ),
  'inequacao-distributiva': _EquationExerciseTranslation(
    title: 'Question 18 of 50',
    statement: 'Solve the inequality:\n3(x - 1) ≥ 2x + 4',
    explanation:
        'Distribute first: 3x - 3 ≥ 2x + 4. Subtract 2x and add 3 to obtain x ≥ 7.',
  ),
  'equacao-modular-1': _EquationExerciseTranslation(
    title: 'Question 19 of 50',
    statement: 'Solve the equation:\n|x| = 5',
    explanation:
        'The distance from x to zero is 5. Therefore, x can be 5 or -5.',
    options: {
      'c': 'x = -5 or x = 5',
    },
  ),
  'equacao-sem-solucao': _EquationExerciseTranslation(
    title: 'Question 20 of 50',
    statement: 'Solve the equation:\n2(x + 1) = 2x + 5',
    explanation:
        'Distributing gives 2x + 2 = 2x + 5. Subtracting 2x leaves 2 = 5, which is a contradiction. There is no solution.',
    options: {
      'b': 'No solution',
      'c': 'All real numbers',
    },
  ),
  'equacao-identidade-1': _EquationExerciseTranslation(
    title: 'Question 21 of 50',
    statement: 'Solve the equation:\n3(x + 2) = 3x + 6',
    explanation:
        'Distributing the left side gives 3x + 6 = 3x + 6. The identity is true for every real number, so the equation has infinitely many solutions.',
    options: {
      'c': 'No solution',
      'd': 'All real numbers',
    },
  ),
  'equacao-radical-1': _EquationExerciseTranslation(
    title: 'Question 22 of 50',
    statement: 'Solve the equation:\n√(x + 5) = 4',
    explanation:
        'Squaring both sides gives x + 5 = 16, so x = 11. Checking confirms √16 = 4.',
  ),
  'inequacao-quadratica-1': _EquationExerciseTranslation(
    title: 'Question 23 of 50',
    statement: 'Solve the inequality:\nx² - 5x + 6 < 0',
    explanation:
        'Factor x² - 5x + 6 = (x - 2)(x - 3). Since the parabola opens upward, the expression is negative between the roots. Therefore, 2 < x < 3.',
    options: {
      'd': 'x ≤ 2 or x ≥ 3',
    },
  ),
  'inequacao-racional-1': _EquationExerciseTranslation(
    title: 'Question 24 of 50',
    statement: 'Solve the inequality:\n(x - 1) / (x + 2) > 0',
    explanation:
        'The critical points are x = 1, where the numerator is zero, and x = -2, which is excluded from the domain. The quotient is positive on (-∞,-2) and (1,∞).',
    options: {
      'a': 'x < -2 or x > 1',
      'b': '-2 < x < 1',
      'c': 'x ≤ -2 or x ≥ 1',
      'd': 'x > -2',
    },
  ),

  'equacao-equivalencia-2': _EquationExerciseTranslation(
    title: 'Question 25 of 50',
    statement:
        'Which operation preserves the equivalence of the equation x + 7 = 12?',
    explanation:
        'An equation remains equivalent when the same operation is applied to both sides. Subtracting 7 from both sides preserves the solution set.',
    options: {
      'a': 'Subtract 7 only from the left side',
      'b': 'Subtract 7 from both sides',
      'c': 'Multiply only the right side by 7',
      'd': 'Replace x with 7',
    },
  ),
  'equacao-verificacao-1': _EquationExerciseTranslation(
    title: 'Question 26 of 50',
    statement: 'Which value satisfies the equation 4x − 3 = 13?',
    explanation:
        'Substituting x = 4 gives 4·4 − 3 = 16 − 3 = 13. Therefore x = 4 satisfies the equation exactly.',
  ),
  'equacao-caso-especial-2': _EquationExerciseTranslation(
    title: 'Question 27 of 50',
    statement: 'Solve:\n5(x − 2) = 5x − 10',
    explanation:
        'Distributing the left side gives 5x − 10 = 5x − 10. The identity is true for every real number, so there are infinitely many solutions.',
    options: {
      'c': 'No solution',
      'd': 'All real numbers',
    },
  ),
  'equacao-caso-especial-3': _EquationExerciseTranslation(
    title: 'Question 28 of 50',
    statement: 'Solve:\n4(x + 1) = 4x + 9',
    explanation:
        'Distributing gives 4x + 4 = 4x + 9. Subtracting 4x from both sides leaves 4 = 9, a contradiction, so there is no solution.',
    options: {
      'c': 'No solution',
      'd': 'All real numbers',
    },
  ),
  'sistema-linear-2': _EquationExerciseTranslation(
    title: 'Question 29 of 50',
    statement: 'Solve the system:\nx + y = 9\nx − y = 3',
    explanation:
        'Adding the equations gives 2x = 12, so x = 6. Substituting into x + y = 9 gives y = 3.',
  ),
  'sistema-linear-3': _EquationExerciseTranslation(
    title: 'Question 30 of 50',
    statement: 'Solve the system:\n2x + y = 7\nx − y = 2',
    explanation:
        'From the second equation, y = x − 2. Substitute into the first: 2x + x − 2 = 7, so 3x = 9 and x = 3. Then y = 1.',
  ),
  'sistema-linear-4': _EquationExerciseTranslation(
    title: 'Question 31 of 50',
    statement:
        'An adult ticket costs 20 and a child ticket costs 12. Ten tickets were sold for a total of 168. How many were adult tickets?',
    explanation:
        'Let a be adult tickets and c child tickets. Then a + c = 10 and 20a + 12c = 168. Substituting c = 10 − a gives 8a = 48, so a = 6.',
  ),
  'equacao-quadratica-3': _EquationExerciseTranslation(
    title: 'Question 32 of 50',
    statement: 'Solve:\nx² − 4x − 5 = 0',
    explanation:
        'Factor x² − 4x − 5 as (x − 5)(x + 1). By the zero-product property, x = 5 or x = −1.',
    options: {
      'a': 'x = 1 or x = 5',
      'b': 'x = −5 or x = −1',
      'c': 'x = 4 or x = −5',
      'd': 'x = 5 or x = −1',
    },
  ),
  'equacao-quadratica-4': _EquationExerciseTranslation(
    title: 'Question 33 of 50',
    statement: 'Solve:\n2x² − 3x − 2 = 0',
    explanation:
        'Factor 2x² − 3x − 2 as (2x + 1)(x − 2). Thus 2x + 1 = 0 or x − 2 = 0, giving x = −1/2 or x = 2.',
    options: {
      'a': 'x = 1/2 or x = 2',
      'b': 'x = −1/2 or x = 2',
      'c': 'x = −2 or x = 1/2',
      'd': 'x = −1 or x = 2',
    },
  ),
  'equacao-quadratica-5': _EquationExerciseTranslation(
    title: 'Question 34 of 50',
    statement: 'Solve:\nx² + 2x − 7 = 0',
    explanation:
        'Using the quadratic formula, x = [−2 ± √(4 + 28)]/2 = [−2 ± √32]/2 = −1 ± 2√2.',
  ),
  'equacao-modular-2': _EquationExerciseTranslation(
    title: 'Question 35 of 50',
    statement: 'Solve:\n|x − 3| = 5',
    explanation:
        'The distance from x to 3 is 5. Therefore x − 3 = 5 or x − 3 = −5, which gives x = 8 or x = −2.',
    options: {
      'a': 'x = 2 or x = 8',
      'b': 'x = −8 or x = 2',
      'c': 'x = −2 or x = 8',
      'd': 'x = 3 or x = 5',
    },
  ),
  'inequacao-modular-1': _EquationExerciseTranslation(
    title: 'Question 36 of 50',
    statement: 'Solve:\n|x| < 4',
    explanation:
        'The inequality |x| < 4 means the distance from x to zero is less than 4. This is equivalent to −4 < x < 4.',
  ),
  'inequacao-modular-2': _EquationExerciseTranslation(
    title: 'Question 37 of 50',
    statement: 'Solve:\n|x + 1| ≥ 3',
    explanation:
        'For |A| ≥ 3, either A ≤ −3 or A ≥ 3. Thus x + 1 ≤ −3 or x + 1 ≥ 3, giving x ≤ −4 or x ≥ 2.',
  ),
  'equacao-modular-sem-solucao-1': _EquationExerciseTranslation(
    title: 'Question 38 of 50',
    statement: 'Solve:\n|2x − 1| = −3',
    explanation:
        'The absolute value of a real number is always nonnegative. It can never equal −3, so the equation has no real solution.',
    options: {
      'a': 'No real solution',
      'd': 'All real numbers',
    },
  ),
  'equacao-radical-2': _EquationExerciseTranslation(
    title: 'Question 39 of 50',
    statement: 'Solve:\n√(x − 1) = 5',
    explanation:
        'Squaring both sides gives x − 1 = 25. Therefore x = 26, and checking gives √25 = 5.',
  ),
  'equacao-radical-3': _EquationExerciseTranslation(
    title: 'Question 40 of 50',
    statement: 'Solve:\n√(2x + 3) = x',
    explanation:
        'The left side is nonnegative, so x must be nonnegative. Squaring gives 2x + 3 = x², or x² − 2x − 3 = 0. The candidates are 3 and −1, but only x = 3 satisfies the original equation.',
    options: {
      'b': 'x = −1 or x = 3',
      'd': 'No solution',
    },
  ),
  'equacao-radical-4': _EquationExerciseTranslation(
    title: 'Question 41 of 50',
    statement: 'Solve:\n√(x + 4) + 2 = x',
    explanation:
        'Isolate the radical: √(x + 4) = x − 2, so x ≥ 2. Squaring gives x² − 5x = 0. The candidates are 0 and 5, and only x = 5 satisfies the original equation.',
    options: {
      'b': 'x = 0 or x = 5',
    },
  ),
  'equacao-radical-5': _EquationExerciseTranslation(
    title: 'Question 42 of 50',
    statement:
        'When solving a radical equation by squaring both sides, which precaution is essential?',
    explanation:
        'Squaring can introduce extraneous solutions that satisfy the transformed equation but not the original. Every candidate solution must therefore be checked in the original equation.',
    options: {
      'a': 'Check the solutions in the original equation',
      'b': 'Always reverse the signs of the solutions',
      'c': 'Automatically discard positive roots',
      'd': 'Multiply the equation by −1',
    },
  ),
  'inequacao-quadratica-2': _EquationExerciseTranslation(
    title: 'Question 43 of 50',
    statement: 'Solve:\nx² − 9 > 0',
    explanation:
        'Factor as (x − 3)(x + 3) > 0. The product is positive outside the roots, so x < −3 or x > 3.',
  ),
  'inequacao-quadratica-3': _EquationExerciseTranslation(
    title: 'Question 44 of 50',
    statement: 'Solve:\nx² + x − 6 ≤ 0',
    explanation:
        'Factor as (x + 3)(x − 2) ≤ 0. Since the parabola opens upward, the expression is nonpositive between the roots, including them: −3 ≤ x ≤ 2.',
  ),
  'inequacao-quadratica-4': _EquationExerciseTranslation(
    title: 'Question 45 of 50',
    statement: 'Solve:\n−x² + 4x + 5 > 0',
    explanation:
        'The zeros are x = −1 and x = 5. Because the leading coefficient is negative, the parabola opens downward and is positive between the roots. Thus −1 < x < 5.',
  ),
  'inequacao-quadratica-5': _EquationExerciseTranslation(
    title: 'Question 46 of 50',
    statement:
        'When solving a quadratic inequality with a sign chart, which points should divide the real line into intervals?',
    explanation:
        'The real zeros are the points where the polynomial can change sign. They divide the real line into intervals for sign analysis.',
    options: {
      'a': 'Only the vertex',
      'b': 'Only the leading coefficient',
      'c': 'Only x = 0',
      'd': 'The real roots of the polynomial',
    },
  ),
  'inequacao-racional-2': _EquationExerciseTranslation(
    title: 'Question 47 of 50',
    statement: 'Solve:\n(x + 1)/(x − 2) < 0',
    explanation:
        'The critical points are x = −1, which zeros the numerator, and x = 2, which is excluded from the domain. The quotient is negative only on (−1, 2).',
  ),
  'inequacao-racional-3': _EquationExerciseTranslation(
    title: 'Question 48 of 50',
    statement: 'Solve:\n(x − 3)/(x + 1) ≥ 0',
    explanation:
        'The critical points are x = 3 and x = −1. The denominator excludes x = −1, while x = 3 may be included because it zeros the numerator. The solution is x < −1 or x ≥ 3.',
  ),
  'inequacao-racional-4': _EquationExerciseTranslation(
    title: 'Question 49 of 50',
    statement: 'Solve:\n1/(x − 4) > 0',
    explanation:
        'The numerator 1 is always positive, so the sign depends on the denominator. For the quotient to be positive we need x − 4 > 0, hence x > 4.',
  ),
  'inequacao-racional-5': _EquationExerciseTranslation(
    title: 'Question 50 of 50',
    statement:
        'In a rational inequality, can a value that makes the denominator zero belong to the solution set?',
    explanation:
        'No. If the denominator is zero, the rational expression is undefined. That value must always be excluded regardless of the inequality symbol.',
    options: {
      'a': 'No, because the expression is undefined',
      'b': 'Yes, when the inequality uses ≥',
      'c': 'Yes, when the numerator is also zero',
      'd': 'Yes, if the value is positive',
    },
  ),

};