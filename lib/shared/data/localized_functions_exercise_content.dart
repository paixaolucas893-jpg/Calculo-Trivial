import 'package:flutter/widgets.dart';

import 'mock_exercise_data.dart';

class _ExerciseTranslation {
  final String title;
  final String statement;
  final String explanation;
  final Map<String, String> options;

  const _ExerciseTranslation({
    required this.title,
    required this.statement,
    required this.explanation,
    this.options = const <String, String>{},
  });
}

ExerciseData localizeFunctionsExerciseContent(
  ExerciseData exercise,
  Locale locale,
) {
  if (locale.languageCode != 'en') {
    return exercise;
  }

  final translation = _englishFunctionsExercises[exercise.id];
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

const Map<String, _ExerciseTranslation> _englishFunctionsExercises = {
  'funcoes-dominio': _ExerciseTranslation(
    title: 'Question 1 of 50',
    statement:
        'Consider the function:\n\nf(x) = √(x - 2)\n\nWhat is the domain of f?',
    explanation:
        'For the square root to be real, the radicand must be greater than or equal to zero. Thus, x - 2 ≥ 0, so x ≥ 2. Therefore, the domain is [2, ∞).',
  ),
  'funcoes-composicao': _ExerciseTranslation(
    title: 'Question 2 of 50',
    statement:
        'Let:\n\nf(x) = 2x + 1\ng(x) = x²\n\nDetermine (f ∘ g)(x).',
    explanation:
        'For the composition (f ∘ g)(x), compute f(g(x)). Since g(x) = x², substitute x² into f: f(x²) = 2x² + 1.',
  ),
  'funcoes-inversa': _ExerciseTranslation(
    title: 'Question 3 of 50',
    statement:
        'Consider the function:\n\nf(x) = 3x - 6\n\nWhat is the inverse function f⁻¹(x)?',
    explanation:
        'Write y = 3x - 6 and solve for x: y + 6 = 3x, so x = (y + 6)/3. Replacing y with x gives f⁻¹(x) = (x + 6)/3.',
  ),
  'funcoes-paridade': _ExerciseTranslation(
    title: 'Question 4 of 50',
    statement:
        'Consider the function:\n\nf(x) = x² + 4\n\nHow is this function classified by parity?',
    explanation:
        'Computing f(-x) gives (-x)² + 4 = x² + 4 = f(x). Therefore, f(-x) = f(x), which characterizes an even function.',
    options: {
      'a': 'Even function',
      'b': 'Odd function',
      'c': 'Neither even nor odd',
      'd': 'Constant function',
    },
  ),
  'funcoes-imagem-quadratica': _ExerciseTranslation(
    title: 'Question 5 of 50',
    statement:
        'Consider the function:\n\nf(x) = x² - 4x + 3\n\nWhat is the minimum value of f(x)?',
    explanation:
        'Complete the square: f(x) = (x - 2)² - 1. Since (x - 2)² ≥ 0, the minimum occurs at x = 2. Therefore, the minimum value is -1.',
  ),
  'funcoes-valor-numerico': _ExerciseTranslation(
    title: 'Question 6 of 50',
    statement:
        'Consider the function:\n\nf(x) = 2x² - x + 1\n\nWhat is the value of f(3)?',
    explanation:
        'Substitute x = 3: f(3) = 2(3²) - 3 + 1 = 18 - 3 + 1 = 16.',
  ),
  'funcoes-raizes': _ExerciseTranslation(
    title: 'Question 7 of 50',
    statement:
        'Consider the function:\n\nf(x) = x² - 5x + 6\n\nWhat are the zeros of f?',
    explanation:
        'Factor the polynomial: x² - 5x + 6 = (x - 2)(x - 3). Therefore, the zeros are x = 2 and x = 3.',
    options: {
      'a': 'x = -2 and x = -3',
      'b': 'x = 1 and x = 6',
      'c': 'x = -1 and x = -6',
      'd': 'x = 2 and x = 3',
    },
  ),
  'funcoes-coeficiente-angular': _ExerciseTranslation(
    title: 'Question 8 of 50',
    statement:
        'Consider the linear function:\n\nf(x) = -3x + 4\n\nWhat is the slope?',
    explanation:
        'In the form f(x) = ax + b, the slope is a. In this case, a = -3.',
  ),
  'funcoes-composicao-inversa': _ExerciseTranslation(
    title: 'Question 9 of 50',
    statement:
        'Let:\n\nf(x) = x + 2\ng(x) = 3x\n\nDetermine (g ∘ f)(x).',
    explanation:
        'Compute g(f(x)). Since f(x) = x + 2, substitute it into g: g(x + 2) = 3(x + 2) = 3x + 6.',
  ),
  'funcoes-imagem-modulo': _ExerciseTranslation(
    title: 'Question 10 of 50',
    statement:
        'Consider the function:\n\nf(x) = |x|\n\nWhat is the range of f?',
    explanation:
        'Absolute value is never negative. The function can take the value zero and any positive value, so its range is [0, ∞).',
  ),
  'funcoes-dominio-racional': _ExerciseTranslation(
    title: 'Question 11 of 50',
    statement:
        'Consider the function:\n\nf(x) = 1 / (x - 4)\n\nWhat is the domain of f?',
    explanation:
        'The denominator cannot be zero. Since x - 4 = 0 when x = 4, the domain contains all real numbers except 4.',
  ),
  'funcoes-valor-numerico-2': _ExerciseTranslation(
    title: 'Question 12 of 50',
    statement:
        'Consider the function:\n\nf(x) = -x² + 4x\n\nWhat is the value of f(2)?',
    explanation:
        'Substitute x = 2: f(2) = -(2²) + 4 · 2 = -4 + 8 = 4.',
  ),
  'funcoes-vertice': _ExerciseTranslation(
    title: 'Question 13 of 50',
    statement:
        'Consider the function:\n\nf(x) = x² - 6x + 5\n\nWhat is the minimum value of f?',
    explanation:
        'Complete the square: f(x) = (x - 3)² - 4. The minimum occurs at x = 3 and equals -4.',
  ),
  'funcoes-crescimento-afim': _ExerciseTranslation(
    title: 'Question 14 of 50',
    statement:
        'Consider the function:\n\nf(x) = 2x + 1\n\nHow is it classified by monotonicity?',
    explanation:
        'The slope is 2, which is positive. Therefore, the function is increasing.',
    options: {
      'a': 'Decreasing',
      'b': 'Increasing',
      'c': 'Constant',
      'd': 'Periodic',
    },
  ),
  'funcoes-intersecao-eixo-y': _ExerciseTranslation(
    title: 'Question 15 of 50',
    statement:
        'Consider the function:\n\nf(x) = -3x + 6\n\nAt what value does the graph intersect the y-axis?',
    explanation:
        'The y-intercept occurs when x = 0. Thus, f(0) = 6.',
  ),
  'funcoes-inversa-2': _ExerciseTranslation(
    title: 'Question 16 of 50',
    statement:
        'Consider the function:\n\nf(x) = 2x + 4\n\nWhat is the inverse function?',
    explanation:
        'Write y = 2x + 4 and solve for x: x = (y - 4)/2. Therefore, f⁻¹(x) = (x - 4)/2.',
  ),
  'funcoes-composicao-3': _ExerciseTranslation(
    title: 'Question 17 of 50',
    statement:
        'Let:\n\nf(x) = x²\ng(x) = x + 1\n\nDetermine (f ∘ g)(x).',
    explanation:
        'Compute f(g(x)). Substituting g(x) = x + 1 into f gives (x + 1)².',
  ),
  'funcoes-impar': _ExerciseTranslation(
    title: 'Question 18 of 50',
    statement:
        'Consider the function:\n\nf(x) = x³ - x\n\nHow is it classified by parity?',
    explanation:
        'Computing f(-x) gives -x³ + x = -(x³ - x) = -f(x). Therefore, the function is odd.',
    options: {
      'a': 'Even function',
      'b': 'Odd function',
      'c': 'Neither even nor odd',
      'd': 'Constant function',
    },
  ),
  'funcoes-exponencial': _ExerciseTranslation(
    title: 'Question 19 of 50',
    statement:
        'Consider the function:\n\nf(x) = 2ˣ\n\nWhat is the value of f(3)?',
    explanation: 'Substitute x = 3: f(3) = 2³ = 8.',
  ),
  'funcoes-imagem-quadratica-2': _ExerciseTranslation(
    title: 'Question 20 of 50',
    statement:
        'Consider the function:\n\nf(x) = -(x - 1)² + 4\n\nWhat is the range of f?',
    explanation:
        'The parabola opens downward and has maximum value 4. Therefore, it takes every value less than or equal to 4.',
  ),
  'funcoes-logaritmo-1': _ExerciseTranslation(
    title: 'Question 21 of 50',
    statement: 'Solve:\nlog₂(x) = 3',
    explanation:
        'By the definition of logarithm, log₂(x) = 3 is equivalent to 2³ = x. Since 2³ = 8, x = 8.',
  ),
  'funcoes-radianos-1': _ExerciseTranslation(
    title: 'Question 22 of 50',
    statement: 'Convert 150° to radians.',
    explanation:
        'Multiply 150° by π/180°. Thus, 150π/180 = 5π/6.',
  ),
  'funcoes-circulo-unitario-1': _ExerciseTranslation(
    title: 'Question 23 of 50',
    statement: 'On the unit circle, what is sin(π/6)?',
    explanation:
        'The angle π/6 is 30°. On the unit circle, the y-coordinate is 1/2, so sin(π/6) = 1/2.',
  ),
  'funcoes-trig-grafico-1': _ExerciseTranslation(
    title: 'Question 24 of 50',
    statement: 'For f(x) = 3 sin(x), what is the amplitude of the graph?',
    explanation:
        'For A·sin(x), the amplitude is |A|. Since A = 3, the amplitude is 3.',
  ),
  'funcoes-identidade-trig-1': _ExerciseTranslation(
    title: 'Question 25 of 50',
    statement: 'Which expression is identically equal to 1?',
    explanation:
        'The fundamental Pythagorean identity is sin²(x) + cos²(x) = 1 for every real x.',
    options: {
      'a': 'sin(x) + cos(x)',
      'b': 'sin²(x) + cos²(x)',
      'c': 'tan(x) + 1',
      'd': 'sin²(x) - cos²(x)',
    },
  ),
  'funcoes-inversa-trig-1': _ExerciseTranslation(
    title: 'Question 26 of 50',
    statement: 'What is the principal value of arcsin(1/2)?',
    explanation:
        'The arcsine function returns the principal angle in [-π/2, π/2]. Since sin(π/6) = 1/2, arcsin(1/2) = π/6.',
  ),
  'funcoes-conica-1': _ExerciseTranslation(
    title: 'Question 27 of 50',
    statement: 'Which conic is represented by x²/9 + y²/4 = 1?',
    explanation:
        'An equation of the form x²/a² + y²/b² = 1, with positive unequal a and b, represents an ellipse centered at the origin.',
    options: {
      'a': 'Ellipse',
      'b': 'Hyperbola',
      'c': 'Parabola',
      'd': 'Line',
    },
  ),
  'funcoes-taxa-media-1': _ExerciseTranslation(
    title: 'Question 28 of 50',
    statement:
        'Consider f(x) = x². What is the average rate of change of f on [1, 3]?',
    explanation:
        'The average rate is [f(3) - f(1)] / (3 - 1). Since f(3) = 9 and f(1) = 1, we get (9 - 1)/2 = 4.',
  ),

  'funcoes-dominio-raiz-2': _ExerciseTranslation(
    title: 'Question 29 of 50',
    statement: 'Determine the domain of:\nf(x) = √(5 − 2x)',
    explanation:
        'For the square root to be real, we need 5 − 2x ≥ 0. Thus −2x ≥ −5 and, after dividing by −2, the inequality reverses: x ≤ 5/2.',
  ),
  'funcoes-racional-assintota-vertical-1': _ExerciseTranslation(
    title: 'Question 30 of 50',
    statement: 'For f(x) = 2/(x − 3), what is the vertical asymptote?',
    explanation:
        'A vertical asymptote occurs where the denominator is zero and the function is undefined. Since x − 3 = 0 at x = 3, the vertical asymptote is x = 3.',
  ),
  'funcoes-racional-assintota-horizontal-1': _ExerciseTranslation(
    title: 'Question 31 of 50',
    statement: 'For f(x) = (3x + 1)/(x − 2), what is the horizontal asymptote?',
    explanation:
        'The numerator and denominator have the same degree. The horizontal asymptote is the ratio of leading coefficients, 3/1 = 3, so y = 3.',
  ),
  'funcoes-racional-simplificacao-1': _ExerciseTranslation(
    title: 'Question 32 of 50',
    statement:
        'Let f(x) = (x² − 4)/(x − 2), with x ≠ 2. Which expression describes f(x) on the rest of its domain?',
    explanation:
        'Factor x² − 4 as (x − 2)(x + 2). For x ≠ 2, cancel x − 2 to obtain f(x) = x + 2, while x = 2 remains excluded from the original domain.',
  ),
  'funcoes-exponencial-equacao-1': _ExerciseTranslation(
    title: 'Question 33 of 50',
    statement: 'Solve:\n3ˣ = 27',
    explanation:
        'Since 27 = 3³, the equation becomes 3ˣ = 3³. Equal positive bases imply equal exponents, so x = 3.',
  ),
  'funcoes-exponencial-crescimento-1': _ExerciseTranslation(
    title: 'Question 34 of 50',
    statement:
        'A population is modeled by P(t) = 500·1.08ᵗ. What does the factor 1.08 represent?',
    explanation:
        'In an exponential model A·bᵗ, the factor b is the multiplier per time unit. Since 1.08 = 1 + 0.08, the model represents 8% growth per period.',
    options: {
      'a': '8% decrease per period',
      'b': '1.08% growth per period',
      'c': '8% growth per period',
      'd': 'A fixed increase of 8 units',
    },
  ),
  'funcoes-exponencial-decaimento-1': _ExerciseTranslation(
    title: 'Question 35 of 50',
    statement: 'Which function represents exponential decay?',
    explanation:
        'An exponential function A·bˣ shows decay when 0 < b < 1. Among the choices, (1/2)ˣ has a positive base smaller than 1.',
  ),
  'funcoes-logaritmo-2': _ExerciseTranslation(
    title: 'Question 36 of 50',
    statement: 'Evaluate:\nlog₁₀(0.01)',
    explanation:
        'Because 0.01 = 10⁻², we are looking for the exponent to which 10 must be raised to obtain 0.01. Therefore log₁₀(0.01) = −2.',
  ),
  'funcoes-logaritmo-propriedade-1': _ExerciseTranslation(
    title: 'Question 37 of 50',
    statement: 'For a > 0 and b > 0, which identity is correct?',
    explanation:
        'The product rule for logarithms states that log(ab) = log(a) + log(b), provided both logarithm arguments are positive.',
  ),
  'funcoes-logaritmo-dominio-1': _ExerciseTranslation(
    title: 'Question 38 of 50',
    statement: 'Determine the domain of:\nf(x) = ln(x − 4)',
    explanation:
        'The argument of a real logarithm must be strictly positive. Thus x − 4 > 0, which gives x > 4.',
  ),
  'funcoes-circulo-unitario-2': _ExerciseTranslation(
    title: 'Question 39 of 50',
    statement: 'On the unit circle, what is cos(5π/3)?',
    explanation:
        'The angle 5π/3 is 300°. The corresponding unit-circle point is (1/2, −√3/2), and cosine is the x-coordinate. Therefore cos(5π/3) = 1/2.',
  ),
  'funcoes-trig-periodo-1': _ExerciseTranslation(
    title: 'Question 40 of 50',
    statement: 'What is the period of f(x) = sin(2x)?',
    explanation:
        'For sin(Bx), the period is 2π/|B|. Here B = 2, so the period is 2π/2 = π.',
  ),
  'funcoes-trig-amplitude-deslocamento-1': _ExerciseTranslation(
    title: 'Question 41 of 50',
    statement: 'For f(x) = 2cos(x) − 1, what are the amplitude and midline?',
    explanation:
        'In A cos(x) + D, the amplitude is |A| and the midline is y = D. Here A = 2 and D = −1, so the amplitude is 2 and the midline is y = −1.',
    options: {
      'a': 'amplitude 1; midline y = 2',
      'b': 'amplitude −2; midline y = −1',
      'c': 'amplitude 2; midline y = 1',
      'd': 'amplitude 2; midline y = −1',
    },
  ),
  'funcoes-trig-periodo-cosseno-1': _ExerciseTranslation(
    title: 'Question 42 of 50',
    statement: 'What is the period of g(x) = cos(x/3)?',
    explanation:
        'Here B = 1/3. The period of cos(Bx) is 2π/|B|, so 2π/(1/3) = 6π.',
  ),
  'funcoes-equacao-trig-1': _ExerciseTranslation(
    title: 'Question 43 of 50',
    statement: 'On 0 ≤ x < 2π, solve:\nsin(x) = 1/2',
    explanation:
        'Sine equals 1/2 in Quadrants I and II, with reference angle π/6. Thus the solutions in the interval are x = π/6 and x = 5π/6.',
  ),
  'funcoes-identidade-trig-2': _ExerciseTranslation(
    title: 'Question 44 of 50',
    statement: 'For cos(x) ≠ 0, which expression equals tan(x)?',
    explanation:
        'By definition, tangent is the quotient of sine and cosine: tan(x) = sin(x)/cos(x), provided cos(x) is nonzero.',
  ),
  'funcoes-inversa-trig-2': _ExerciseTranslation(
    title: 'Question 45 of 50',
    statement: 'What is the principal value of arccos(−1)?',
    explanation:
        'The arccos function returns values in [0, π]. In that interval, the angle whose cosine is −1 is π.',
  ),
  'funcoes-inversa-trig-3': _ExerciseTranslation(
    title: 'Question 46 of 50',
    statement: 'What is the principal value of arctan(1)?',
    explanation:
        'The arctan function returns values in (−π/2, π/2). Since tan(π/4) = 1, arctan(1) = π/4.',
  ),
  'funcoes-conica-2': _ExerciseTranslation(
    title: 'Question 47 of 50',
    statement: 'Which conic is represented by x² + y² = 25?',
    explanation:
        'An equation of the form x² + y² = r² represents a circle centered at the origin. Since r² = 25, the radius is 5.',
    options: {
      'a': 'Circle',
      'b': 'Noncircular ellipse',
      'c': 'Hyperbola',
      'd': 'Parabola',
    },
  ),
  'funcoes-conica-3': _ExerciseTranslation(
    title: 'Question 48 of 50',
    statement: 'Which conic is represented by x²/9 − y²/4 = 1?',
    explanation:
        'An equation with a difference of two normalized squared terms, such as x²/a² − y²/b² = 1, represents a hyperbola.',
    options: {
      'a': 'Circle',
      'b': 'Ellipse',
      'c': 'Hyperbola',
      'd': 'Parabola',
    },
  ),
  'funcoes-taxa-media-2': _ExerciseTranslation(
    title: 'Question 49 of 50',
    statement:
        'For f(x) = 3x + 2, what is the average rate of change on [1, 5]?',
    explanation:
        'The average rate is [f(5) − f(1)]/(5 − 1). Since f(5) = 17 and f(1) = 5, we get (17 − 5)/4 = 3.',
  ),
  'funcoes-taxa-media-3': _ExerciseTranslation(
    title: 'Question 50 of 50',
    statement:
        'For f(x) = x² + 1, what is the average rate of change on [2, 4]?',
    explanation:
        'Compute [f(4) − f(2)]/(4 − 2). Since f(4) = 17 and f(2) = 5, the result is (17 − 5)/2 = 6.',
  ),

};