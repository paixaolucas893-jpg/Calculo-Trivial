import 'package:flutter/widgets.dart';

import 'mock_exercise_data.dart';

class _ExerciseTranslation {
  final String statement;
  final String explanation;
  final String? skill;
  final Map<String, String> options;

  const _ExerciseTranslation({
    required this.statement,
    required this.explanation,
    this.skill,
    this.options = const <String, String>{},
  });
}

ExerciseData localizeContinuityExerciseContent(
  ExerciseData exercise,
  Locale locale,
) {
  if (locale.languageCode != 'en') return exercise;

  final translation = _englishContinuityExercises[exercise.id];
  if (translation == null) return exercise;

  return ExerciseData(
    id: exercise.id,
    title: exercise.title.replaceFirst('Questão', 'Question'),
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

const Map<String, _ExerciseTranslation> _englishContinuityExercises = {
  'continuidade-tres-condicoes': _ExerciseTranslation(
    statement: 'For a function f to be continuous at x = a, which conditions must be satisfied?',
    explanation: 'Check in order: f(a) must be defined; the two-sided limit lim x→a f(x) must exist; finally, the limit must equal the actual function value, lim x→a f(x)=f(a). If any condition fails, f is discontinuous at a.',
    skill: 'Three conditions for continuity',
    options: {
      'a': 'Only f(a) must exist',
      'b': 'Only the limit must exist',
      'c': 'f(a) exists, the limit exists, and lim x → a f(x) = f(a)',
      'd': 'The derivative of f must be zero',
    },
  ),
  'continuidade-polinomial': _ExerciseTranslation(
    statement: 'For which real numbers is f(x) = 3x² - 2x + 5 continuous?',
    explanation: 'Polynomials are built from sums and products of nonnegative integer powers of x, operations that preserve continuity. There are no denominators or roots restricting the domain, so f is continuous for every real number.',
    skill: 'Families of continuous functions',
    options: {
      'a': 'For all real numbers',
      'b': 'Only for x > 0',
      'c': 'Only for x ≠ 0',
      'd': 'Only for integers',
    },
  ),
  'continuidade-racional-dominio': _ExerciseTranslation(
    statement: 'Where is f(x) = (x + 1) / (x - 2) not continuous?',
    explanation: 'A rational function is continuous at every point in its domain. Solving x−2=0 gives x=2; division is undefined there. Therefore, the intervals of continuity are (−∞,2) and (2,+∞).',
    skill: 'Domain of a rational function',
    options: {
      'd': 'It is continuous on all ℝ',
    },
  ),
  'continuidade-furo-corrigido': _ExerciseTranslation(
    statement: 'Let f(x) = (x² - 1)/(x - 1) for x ≠ 1, and f(1) = 2. Is f continuous at x = 1?',
    explanation: 'Factor x²−1=(x−1)(x+1). For x near 1 and different from 1, the expression equals x+1, whose limit is 2. Since f(1) is defined as 2, the value and the limit agree, so all three conditions are satisfied.',
    skill: 'Repairing a removable discontinuity',
    options: {
      'a': 'Yes, because the limit and f(1) are both 2',
      'b': 'No, because the limit is 0',
      'c': 'No, because f(1) does not exist',
      'd': 'Yes, because every rational function is continuous',
    },
  ),
  'continuidade-furo-nao-corrigido': _ExerciseTranslation(
    statement: 'Let f(x) = (x² - 1)/(x - 1) for x ≠ 1, and f(1) = 3. What type of discontinuity occurs at x = 1?',
    explanation: 'The simplified expression x+1 shows that the limit at 1 exists and equals 2. However, f(1)=3. Since only the value at the point prevents equality, the discontinuity is removable: redefining f(1)=2 would fix it.',
    skill: 'Classifying a removable hole',
    options: {
      'a': 'None; the function is continuous',
      'b': 'Infinite discontinuity',
      'c': 'Jump discontinuity',
      'd': 'Removable discontinuity',
    },
  ),
  'continuidade-partes-simples': _ExerciseTranslation(
    statement: 'If f(x) = x + 1 for x < 1 and f(x) = 2x for x ≥ 1, is f continuous at x = 1?',
    explanation: 'Use x+1 from the left: the limit is 2. Use 2x from the right: the limit is also 2. The second rule includes x=1, so f(1)=2. Since the left limit, right limit, and function value agree, f is continuous.',
    skill: 'Matching pieces of a piecewise function',
    options: {
      'a': 'No, because the one-sided limits do not exist',
      'b': 'Yes, because both one-sided limits and f(1) equal 2',
      'c': 'No, because f(1) = 1',
      'd': 'Yes, because f(1) = 0',
    },
  ),
  'continuidade-salto': _ExerciseTranslation(
    statement: 'If f(x) = -1 for x < 0 and f(x) = 1 for x ≥ 0, what happens at x = 0?',
    explanation: 'Approaching zero from the left, the function stays at −1. From the right, it stays at 1. Since the one-sided limits are finite but different, the two-sided limit does not exist and the discontinuity is a jump.',
    skill: 'Jump discontinuity',
    options: {
      'a': 'The function is continuous',
      'b': 'There is a removable discontinuity',
      'c': 'There is a jump discontinuity',
      'd': 'There is an infinite discontinuity',
    },
  ),
  'continuidade-infinita': _ExerciseTranslation(
    statement: 'What type of discontinuity does f(x) = 1/(x - 2) have at x = 2?',
    explanation: 'Near x = 2, the magnitude of the function values grows without bound. There is a vertical asymptote, so the discontinuity is infinite.',
    skill: 'Infinite discontinuity',
    options: {'a': 'Infinite', 'b': 'Removable', 'c': 'Finite jump', 'd': 'None'},
  ),
  'continuidade-modulo': _ExerciseTranslation(
    statement: 'Is f(x) = |x| continuous at x = 0?',
    explanation: 'A corner in the graph does not imply discontinuity. From the left, |x|=−x and the limit is 0; from the right, |x|=x and the limit is also 0. Since f(0)=0, all three conditions are satisfied.',
    skill: 'Continuity at a corner point',
    options: {
      'a': 'No, because there is a corner in the graph',
      'b': 'No, because the limit equals 1',
      'c': 'Only from the right',
      'd': 'Yes',
    },
  ),
  'continuidade-parte-inteira': _ExerciseTranslation(
    statement: 'What behavior does the floor function f(x) = ⌊x⌋ have at integer values?',
    explanation: 'When crossing an integer n, values from the left remain at n−1, while values from the right and at the point equal n. The one-sided limits are finite but different, which gives a jump discontinuity.',
    skill: 'Jumps of the floor function',
    options: {
      'a': 'It is continuous at all integers',
      'b': 'It has jump discontinuities',
      'c': 'It has only removable holes',
      'd': 'It always tends to infinity',
    },
  ),
  'continuidade-seno': _ExerciseTranslation(
    statement: 'On which set is f(x) = sin(x) continuous?',
    explanation: 'The sine function is defined and continuous for every real number. Restricting it to [0,2π] would confuse one period with its domain, which is ℝ.',
    skill: 'Continuity of a trigonometric function',
    options: {
      'a': 'Only on [0, 2π]',
      'b': 'Only for x ≠ 0',
      'c': 'On all ℝ',
      'd': 'Only at multiples of π',
    },
  ),
  'continuidade-raiz': _ExerciseTranslation(
    statement: 'On its real domain, where is f(x) = √x continuous?',
    explanation: 'Over the real numbers, √x requires x≥0. The function is continuous on its entire domain; at x=0, continuity is checked from the right because negative values are outside the domain.',
    skill: 'Continuity on the square-root domain',
    options: {
      'c': 'ℝ except 0',
      'd': 'Only at x = 0',
    },
  ),
  'continuidade-composicao': _ExerciseTranslation(
    statement: 'If g is continuous at a and f is continuous at g(a), what can we say about f(g(x)) at a?',
    explanation: 'Because g(x) approaches g(a) as x→a and f is continuous at g(a), the limit passes through the outer function. Thus lim x→a f(g(x))=f(g(a)), exactly the continuity condition for the composition.',
    skill: 'Composition of continuous functions',
    options: {
      'a': 'It is always discontinuous',
      'b': 'Its limit is necessarily zero',
      'c': 'Nothing can be concluded',
      'd': 'It is continuous at a',
    },
  ),
  'continuidade-valor-intermediario': _ExerciseTranslation(
    statement: 'A function f is continuous on [1, 2], with f(1) = -3 and f(2) = 4. What does the Intermediate Value Theorem guarantee?',
    explanation: 'The function is continuous on [1,2], and zero lies between f(1)=−3 and f(2)=4. By the Intermediate Value Theorem, there is at least one c in (1,2) such that f(c)=0. The theorem does not guarantee uniqueness or that c=1.5.',
    skill: 'Intermediate Value Theorem',
    options: {
      'a': 'f is a linear function',
      'b': 'There exists c in (1, 2) with f(c) = 0',
      'c': 'f has exactly one root',
      'd': 'f(1.5) = 0 necessarily',
    },
  ),
  'continuidade-parametro-ponto': _ExerciseTranslation(
    statement: 'If f(x) = x² for x ≠ 2 and f(2) = k, what value of k makes f continuous at x = 2?',
    explanation: 'The limit of x² as x approaches 2 is 4. For continuity, f(2) must also equal 4.',
    skill: 'Defining a value to remove a hole',
  ),
  'continuidade-parametro-partes': _ExerciseTranslation(
    statement: 'If f(x) = 2x + 1 for x < 1 and f(x) = x + k for x ≥ 1, what value of k makes f continuous at x = 1?',
    explanation: 'Evaluate each piece at the switching point. From the left, 2(1)+1=3. From the right and at the point, the second rule gives 1+k. Set 1+k=3 and solve: k=2.',
    skill: 'Parameter in a piecewise function',
  ),
  'continuidade-valor-indefinido': _ExerciseTranslation(
    statement: 'The limit lim x → a f(x) exists and is finite, but f(a) is not defined. Is f continuous at a?',
    explanation: 'No. The first continuity condition requires f(a) to be defined. This situation usually represents a removable discontinuity.',
    skill: 'Identifying a missing function value',
    options: {
      'a': 'Yes, because it is enough for the limit to exist',
      'b': 'Yes, if a is positive',
      'c': 'No, because f(a) must exist',
      'd': 'No, because the limit should be infinite',
    },
  ),
  'continuidade-extremo-intervalo': _ExerciseTranslation(
    statement: 'To check continuity at the left endpoint a of a closed interval [a, b], which limit is used?',
    explanation: 'At the left endpoint a, there are no domain points in [a,b] smaller than a. Therefore, the relevant approach uses values greater than a: the right-hand limit, which must equal f(a).',
    skill: 'One-sided continuity at an endpoint',
    options: {
      'a': 'Only the left-hand limit',
      'b': 'No limit',
      'c': 'Always a limit at infinity',
      'd': 'The right-hand limit',
    },
  ),
  'continuidade-removivel-conceito': _ExerciseTranslation(
    statement: 'When is a discontinuity called removable?',
    explanation: 'It is removable when the limit at the point exists and is finite, allowing the function to be made continuous simply by redefining its value at that point.',
    skill: 'Repairing a removable discontinuity',
    options: {
      'a': 'When redefining the value at the point can make the function continuous',
      'b': 'When the one-sided limits are different',
      'c': 'When there is a vertical asymptote',
      'd': 'When the function has no domain',
    },
  ),
  'continuidade-inversa-dominio': _ExerciseTranslation(
    statement: 'On which intervals is f(x) = 1/x continuous?',
    explanation: 'Start with the domain: 1/x is undefined at x=0. Rational functions are continuous wherever the denominator is nonzero, so split the domain at that point. The maximal intervals of continuity are (−∞,0) and (0,+∞).',
    skill: 'Complete domain-and-continuity analysis',
    options: {
      'a': 'Only on (0, +∞)',
      'b': 'On (-∞, 0) and (0, +∞)',
      'c': 'On all ℝ',
      'd': 'Only at x = 1',
    },
  ),
  'continuidade-condicoes-2': _ExerciseTranslation(
    statement:
        'Suppose lim x → 3 f(x) = 5, but f(3) = 2. What can we conclude about continuity at x = 3?',
    explanation:
        'For continuity at x = 3, the limit must exist and equal the function value. Here the limit is 5 while f(3) is 2, so f is not continuous at x = 3.',
    skill: 'Apply equality between limit and function value',
    options: {
      'a': 'f is continuous because the limit exists',
      'b': 'f is continuous because f(3) is defined',
      'c': 'f is not continuous because the limit differs from f(3)',
      'd': 'Nothing can be concluded',
    },
  ),
  'continuidade-condicoes-3': _ExerciseTranslation(
    statement:
        'If f(a) exists but the one-sided limits at a are different, can f be continuous at a?',
    explanation:
        'No. Different one-sided limits mean the two-sided limit at a does not exist. Without the two-sided limit, one of the required conditions for continuity fails.',
    skill: 'Relate one-sided limits to continuity',
    options: {
      'a': 'Yes, whenever f(a) exists',
      'b': 'No, because the two-sided limit does not exist',
      'c': 'Yes, if f(a) = 0',
      'd': 'Yes, if the right-hand limit exists',
    },
  ),
  'continuidade-partes-2': _ExerciseTranslation(
    statement:
        'Let f(x) = x² for x < 2 and f(x) = 3x − 2 for x ≥ 2. Is f continuous at x = 2?',
    explanation:
        'From the left, x² tends to 4. From the right, 3x − 2 tends to 4. Because the second rule includes x = 2, f(2) = 4. All three values agree, so f is continuous at x = 2.',
    skill: 'Check continuity at a piecewise junction',
    options: {
      'a': 'Yes, because both one-sided limits and f(2) equal 4',
      'b': 'No, because f(2) = 2',
      'c': 'No, because the left-hand limit is 2',
      'd': 'No, because piecewise functions are never continuous',
    },
  ),
  'continuidade-partes-3': _ExerciseTranslation(
    statement:
        'Let f(x) = x + 4 for x < 1 and f(x) = 2x + 1 for x ≥ 1. What behavior occurs at x = 1?',
    explanation:
        'The left-hand limit is 1 + 4 = 5. The right-hand limit is 2·1 + 1 = 3. Since the one-sided limits are finite but different, there is a jump discontinuity.',
    skill: 'Classify a jump in a piecewise function',
    options: {
      'a': 'Continuity',
      'b': 'Removable discontinuity',
      'c': 'Infinite discontinuity',
      'd': 'Jump discontinuity',
    },
  ),
  'continuidade-tvi-2': _ExerciseTranslation(
    statement:
        'If f is continuous on [0, 4], with f(0) = 2 and f(4) = 10, what does the Intermediate Value Theorem guarantee?',
    explanation:
        'Because f is continuous on the closed interval and 7 lies between f(0)=2 and f(4)=10, the IVT guarantees at least one c in (0,4) such that f(c)=7.',
    skill: 'Apply the Intermediate Value Theorem to an intermediate value',
    options: {
      'a': 'f(c) = 7 for every c in (0,4)',
      'b': 'There is exactly one c such that f(c) = 7',
      'c': 'There is at least one c in (0,4) such that f(c) = 7',
      'd': 'f(2) = 7 necessarily',
    },
  ),
  'continuidade-tvi-3': _ExerciseTranslation(
    statement:
        'A function continuous on [1, 3] satisfies f(1) = 5 and f(3) = 9. Does the IVT guarantee a c in (1,3) with f(c) = 12?',
    explanation:
        'No. The IVT guarantees values between 5 and 9 because those are the endpoint function values. Since 12 is not between 5 and 9, the theorem gives no such guarantee.',
    skill: 'Recognize the scope of the Intermediate Value Theorem',
    options: {
      'a': 'No, because 12 is not between 5 and 9',
      'b': 'Yes, because f is continuous',
      'c': 'Yes, and c = 2',
      'd': 'Yes, provided f is increasing',
    },
  ),
  'continuidade-tvi-raiz-1': _ExerciseTranslation(
    statement:
        'If f is continuous on [−2, 1], f(−2) < 0 and f(1) > 0, what does the IVT guarantee?',
    explanation:
        'Zero lies between a negative value and a positive value. Since f is continuous on the interval, the IVT guarantees at least one c in (−2,1) such that f(c)=0.',
    skill: 'Use the IVT to guarantee existence of a root',
    options: {
      'a': 'f has exactly one root',
      'b': 'There is at least one root in (−2,1)',
      'c': 'The root is necessarily c = 0',
      'd': 'f has no roots',
    },
  ),
  'continuidade-sintese-roteiro-1': _ExerciseTranslation(
    statement:
        'What is the most appropriate first check when analyzing continuity of a function at x = a?',
    explanation:
        'The procedure starts with the domain and the function value at the point: first determine whether f(a) is defined. Then inspect the two-sided limit and finally compare the limit with f(a).',
    skill: 'Organize a continuity-analysis procedure',
    options: {
      'a': 'Compute the derivative at a',
      'b': 'Look for a horizontal asymptote',
      'c': 'Apply the IVT immediately',
      'd': 'Check whether f(a) is defined',
    },
  ),
  'continuidade-sintese-classificacao-1': _ExerciseTranslation(
    statement:
        'At x = a, the two-sided limit exists and equals L, but f(a) does not exist. What is the most likely classification?',
    explanation:
        'When the two-sided limit exists and is finite but the function value is missing, the discontinuity is usually removable: defining f(a)=L restores continuity.',
    skill: 'Classify a discontinuity from limit and function value',
    options: {
      'a': 'Jump discontinuity',
      'b': 'Infinite discontinuity',
      'c': 'Removable discontinuity',
      'd': 'Automatic continuity',
    },
  ),
  'continuidade-sintese-completa-1': _ExerciseTranslation(
    statement:
        'A rational function has denominator x(x − 2). On which intervals can it be continuous, assuming no factors cancel?',
    explanation:
        'Possible breaks occur where the denominator is zero: x=0 and x=2. A rational function is continuous on each interval of its domain, so the maximal intervals are (−∞,0), (0,2), and (2,+∞).',
    skill: 'Combine domain and intervals of continuity',
    options: {
      'a': '(−∞,0), (0,2), and (2,+∞)',
      'b': '(−∞,2) and (2,+∞)',
      'c': 'All real numbers',
      'd': '[0,2]',
    },
  ),

};