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

ExerciseData localizeDerivativesExerciseContent(
  ExerciseData exercise,
  Locale locale,
) {
  if (locale.languageCode != 'en') return exercise;

  final translation = _englishDerivativesExercises[exercise.id];
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

const Map<String, _ExerciseTranslation> _englishDerivativesExercises = {
  'derivada-significado': _ExerciseTranslation(
    statement: "What is the main geometric interpretation of the derivative f'(a)?",
    explanation: "The derivative f′(a) is the limit of the slopes of secant lines as the second point approaches a. Geometrically, this limit gives the slope of the tangent line to the graph at (a,f(a)); in applications, it represents an instantaneous rate of change.",
    skill: 'Geometric interpretation of the derivative',
    options: {
      'a': 'The area under the graph',
      'b': 'The slope of the tangent line',
      'c': 'The maximum value of the function',
      'd': 'The distance from the origin',
    },
  ),
  'derivada-potencia-cubica': _ExerciseTranslation(
    statement: "If f(x) = x³, what is f'(x)?",
    explanation: "By the power rule, the derivative of xⁿ is n·xⁿ⁻¹. Therefore, (x³)' = 3x².",
    skill: 'Power rule',
  ),
  'derivada-polinomio': _ExerciseTranslation(
    statement: 'Find the derivative of f(x) = 5x² - 3x + 4.',
    explanation: 'Use linearity and differentiate term by term: (5x²)′=10x, (−3x)′=−3, and the constant 4 has derivative zero. Therefore, f′(x)=10x−3.',
    skill: 'Term-by-term differentiation',
  ),
  'derivada-constante': _ExerciseTranslation(
    statement: 'What is the derivative of the constant function f(x) = 12?',
    explanation: 'A constant function does not change. Its rate of change, and therefore its derivative, is zero.',
    skill: 'Derivative of a constant',
  ),
  'derivada-identidade': _ExerciseTranslation(
    statement: "If f(x) = x, what is f'(x)?",
    explanation: 'For f(x)=x, every increase Δx in the input produces the same increase Δx in the output. Thus Δf/Δx is always 1, so f′(x)=1 at every point.',
    skill: 'Derivative of the identity function',
  ),
  'derivada-raiz': _ExerciseTranslation(
    statement: 'For x > 0, what is the derivative of f(x) = √x?',
    explanation: 'Rewrite √x as x¹ᐟ². By the power rule, (x¹ᐟ²)′=(1/2)x⁻¹ᐟ²=1/(2√x), valid for x>0.',
    skill: 'Fractional exponents',
  ),
  'derivada-inversa': _ExerciseTranslation(
    statement: 'For x ≠ 0, what is the derivative of f(x) = 1/x?',
    explanation: "Since 1/x=x⁻¹, use the power rule: (x⁻¹)'=−x⁻²=−1/x². The negative sign reflects that 1/x decreases on each interval of its domain.",
    skill: 'Negative exponents',
  ),
  'derivada-produto': _ExerciseTranslation(
    statement: 'Find the derivative of f(x) = x²(x + 1).',
    explanation: 'You may expand first: x²(x+1)=x³+x², so f′(x)=3x²+2x. The product rule gives the same result: 2x(x+1)+x².',
    skill: 'Product rule or algebraic expansion',
  ),
  'derivada-quociente-simplificado': _ExerciseTranslation(
    statement: 'For x ≠ 0, differentiate f(x) = (x² + 1)/x.',
    explanation: 'Simplify first: (x²+1)/x=x+1/x=x+x⁻¹. Differentiate term by term to get 1−x⁻², so f′(x)=1−1/x².',
    skill: 'Simplifying before differentiating',
  ),
  'derivada-regra-cadeia': _ExerciseTranslation(
    statement: 'Find the derivative of f(x) = (2x + 1)³.',
    explanation: 'Separate the layers: the outer function is u³ and the inner function is u=2x+1. Differentiate the outer function and multiply by the inner derivative 2. Thus f′(x)=6(2x+1)².',
    skill: 'Chain rule',
  ),
  'derivada-seno': _ExerciseTranslation(
    statement: 'What is the derivative of f(x) = sin(x)?',
    explanation: 'The derivative of sin(x) is cos(x). Thus d/dx[sin(x)]=cos(x).',
    skill: 'Derivative of sine',
    options: {
      'c': 'sin(x)',
      'd': '-sin(x)',
    },
  ),
  'derivada-cosseno': _ExerciseTranslation(
    statement: 'What is the derivative of f(x) = cos(x)?',
    explanation: 'The derivative of cosine is −sin(x). Therefore, d/dx[cos(x)]=−sin(x).',
    skill: 'Derivative of cosine',
    options: {
      'a': 'sin(x)',
      'd': '-sin(x)',
    },
  ),
  'derivada-exponencial': _ExerciseTranslation(
    statement: 'What is the derivative of f(x) = eˣ?',
    explanation: 'The base e is defined so that the instantaneous growth rate of eˣ equals the function value itself. Therefore, d/dx[eˣ]=eˣ.',
    skill: 'Derivative of the natural exponential',
  ),
  'derivada-logaritmo': _ExerciseTranslation(
    statement: 'For x > 0, what is the derivative of f(x) = ln(x)?',
    explanation: 'For x>0, the natural logarithm has derivative 1/x. The rate remains positive but decreases as x grows.',
    skill: 'Derivative of the natural logarithm',
  ),
  'derivada-inclinacao-ponto': _ExerciseTranslation(
    statement: 'What is the slope of the tangent line to f(x) = x² at x = 2?',
    explanation: "First differentiate: f'(x)=2x. Evaluate at x=2: f'(2)=4. Therefore, the tangent slope is 4.",
    skill: 'Tangent slope at a point',
  ),
  'derivada-equacao-tangente': _ExerciseTranslation(
    statement: 'What is the tangent line to f(x) = x² at the point (1, 1)?',
    explanation: 'Differentiate to get f′(x)=2x. At x=1, the slope is 2. Using point-slope form, y−1=2(x−1), so y=2x−1.',
    skill: 'Equation of the tangent line',
  ),
  'derivada-ponto-critico': _ExerciseTranslation(
    statement: 'At what x-value does f(x) = x² - 4x have derivative equal to zero?',
    explanation: "Differentiate: f'(x)=2x−4. Set the derivative equal to zero: 2x−4=0, so x=2.",
    skill: 'Locating a critical point',
  ),
  'derivabilidade-continuidade': _ExerciseTranslation(
    statement: 'If a function is differentiable at x = a, what must be true?',
    explanation: 'If the derivative exists at a, the function must be continuous there. The converse is false: continuity does not guarantee differentiability, as |x| at zero shows.',
    skill: 'Differentiability and continuity',
    options: {
      'a': 'It has a maximum at a',
      'b': 'It is continuous at a',
      'c': 'Its derivative is zero at a',
      'd': 'It is a polynomial function',
    },
  ),
  'derivada-modulo-zero': _ExerciseTranslation(
    statement: 'Why is f(x) = |x| not differentiable at x = 0?',
    explanation: 'For x<0, |x|=−x and the slope is −1. For x>0, |x|=x and the slope is 1. Since the one-sided derivatives at zero are different, there is no unique tangent line.',
    skill: 'One-sided derivatives at a corner',
    options: {
      'a': 'The one-sided derivatives are different',
      'b': 'The function is not defined at zero',
      'c': 'The function limit is infinite',
      'd': 'The function is not continuous at zero',
    },
  ),
  'derivada-velocidade': _ExerciseTranslation(
    statement: 'The position of an object is s(t) = t² + 3t meters. What is its instantaneous velocity at t = 2 s?',
    explanation: 'Instantaneous velocity is the derivative of position. Differentiate s(t)=t²+3t to get v(t)=2t+3. Then v(2)=7 m/s.',
    skill: 'Instantaneous velocity',
  ),
  'derivada-taxa-media-limite-1': _ExerciseTranslation(
    statement: 'The derivative f′(a) can be defined as the limit of which expression, when that limit exists?',
    explanation: 'The derivative at a is the limit of the difference quotient [f(a+h)−f(a)]/h as h approaches zero. This converts average rate of change into instantaneous rate of change.',
    skill: 'Recognize the limit definition of the derivative',
  ),
  'derivada-significado-unidade-1': _ExerciseTranslation(
    statement: 'If s(t) is measured in meters and t in seconds, what is the unit of s′(t)?',
    explanation: 'A derivative measures change in the output quantity per change in the input quantity. Therefore meters divided by seconds gives m/s.',
    skill: 'Interpret derivative units',
  ),
  'derivada-crescente-sinal-1': _ExerciseTranslation(
    statement: 'If f′(a) > 0, which local interpretation is most appropriate?',
    explanation: 'A positive derivative means the tangent slope is positive. Locally, the function is increasing as x increases near a.',
    skill: 'Interpret the sign of a derivative',
    options: {
      'a': 'The function is locally increasing',
      'b': 'The function is constant',
      'c': 'The function necessarily has a maximum',
      'd': 'The function is discontinuous',
    },
  ),
  'derivada-secante-tangente-1': _ExerciseTranslation(
    statement: 'In the geometric definition of the derivative, what happens to secant lines as the second point approaches the first?',
    explanation: 'When the limit exists, the slopes of the secant lines approach the slope of the tangent line. This limiting process is the geometric basis of the derivative.',
    skill: 'Relate secant lines to the tangent line',
    options: {
      'a': 'They always become horizontal',
      'b': 'They pass through the origin',
      'c': 'They become parallel to the y-axis',
      'd': 'Their slopes approach the tangent slope',
    },
  ),
  'derivada-potencia-quinta-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = 4x⁵ − 2x² + 7',
    explanation: 'Apply the power rule term by term: 4x⁵ gives 20x⁴, −2x² gives −4x, and the constant 7 gives zero. Thus f′(x)=20x⁴−4x.',
    skill: 'Apply the power rule to a polynomial',
  ),
  'derivada-produto-2': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = (x² + 1)(x − 3)',
    explanation: 'Using the product rule, f′(x)=2x(x−3)+(x²+1). Simplifying gives 3x²−6x+1.',
    skill: 'Apply the product rule',
  ),
  'derivada-produto-trig-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = x·sin(x)',
    explanation: 'Using (uv)′=u′v+uv′ with u=x and v=sin(x), we get f′(x)=sin(x)+x cos(x).',
    skill: 'Apply the product rule with a trigonometric function',
  ),
  'derivada-quociente-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = x/(x + 1)',
    explanation: 'By the quotient rule, f′(x)=[(x+1)−x]/(x+1)²=1/(x+1)².',
    skill: 'Apply the quotient rule',
  ),
  'derivada-quociente-trig-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = sin(x)/x, with x ≠ 0',
    explanation: 'By the quotient rule, f′(x)=[x cos(x)−sin(x)]/x². The order u′v−uv′ in the numerator is essential.',
    skill: 'Apply the quotient rule with a trigonometric function',
  ),
  'derivada-cadeia-quadrado-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = (x² + 3)⁴',
    explanation: 'The outer derivative is 4u³ and the inner derivative of u=x²+3 is 2x. Therefore f′(x)=8x(x²+3)³.',
    skill: 'Apply the chain rule to a composite power',
  ),
  'derivada-cadeia-raiz-1': _ExerciseTranslation(
    statement: 'Differentiate where defined:\nf(x) = √(3x + 1)',
    explanation: 'Rewrite as (3x+1)^(1/2). The chain rule gives (1/2)(3x+1)^(−1/2)·3 = 3/[2√(3x+1)].',
    skill: 'Apply the chain rule to a radical',
  ),
  'derivada-cadeia-seno-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = sin(4x)',
    explanation: 'Differentiate the outer sine to cosine and multiply by the inner derivative 4. Thus f′(x)=4cos(4x).',
    skill: 'Apply the chain rule to sine',
  ),
  'derivada-cadeia-exponencial-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = e^(2x²)',
    explanation: 'For e^u, the derivative is e^u·u′. Here u=2x² and u′=4x, so f′(x)=4x e^(2x²).',
    skill: 'Apply the chain rule to the natural exponential',
  ),
  'derivada-cadeia-log-1': _ExerciseTranslation(
    statement: 'Differentiate on the domain:\nf(x) = ln(x² + 1)',
    explanation: 'For ln(u), the derivative is u′/u. With u=x²+1 and u′=2x, f′(x)=2x/(x²+1).',
    skill: 'Apply the chain rule to the natural logarithm',
  ),
  'derivada-cadeia-camadas-1': _ExerciseTranslation(
    statement: 'Differentiate:\nf(x) = [1 + (2x − 1)²]³',
    explanation: 'Differentiate from the outside inward: 3[1+(2x−1)²]²·2(2x−1)·2, giving 12(2x−1)[1+(2x−1)²]².',
    skill: 'Apply the chain rule through multiple layers',
  ),
  'derivada-tangente-trig-1': _ExerciseTranslation(
    statement: 'What is the derivative of f(x) = tan(x), where defined?',
    explanation: 'The derivative of tan(x) is sec²(x) at every point in the domain of tangent.',
    skill: 'Differentiate tangent',
    options: {
      'c': 'cot(x)',
    },
  ),
  'derivada-exponencial-base-a-1': _ExerciseTranslation(
    statement: 'For a > 0 and a ≠ 1, what is the derivative of aˣ?',
    explanation: 'The derivative of aˣ is aˣ ln(a). The special case a=e reduces to eˣ because ln(e)=1.',
    skill: 'Differentiate an exponential with general base',
  ),
  'derivada-log-base-a-1': _ExerciseTranslation(
    statement: 'For x > 0, what is the derivative of logₐ(x), with a > 0 and a ≠ 1?',
    explanation: 'Since logₐ(x)=ln(x)/ln(a) and ln(a) is constant, the derivative is 1/[x ln(a)].',
    skill: 'Differentiate a logarithm with general base',
  ),
  'derivada-tangente-polinomio-1': _ExerciseTranslation(
    statement: 'For f(x) = x³ − x, what is the tangent slope at x = 1?',
    explanation: 'Differentiate to obtain f′(x)=3x²−1. Evaluating at x=1 gives f′(1)=2.',
    skill: 'Compute tangent slope for a polynomial',
  ),
  'derivada-tangente-equacao-2': _ExerciseTranslation(
    statement: 'Find the tangent line to f(x)=x²+1 at x=2.',
    explanation: 'We have f(2)=5 and f′(2)=4. Using point-slope form, y−5=4(x−2), so y=4x−3.',
    skill: 'Find the equation of a tangent line',
  ),
  'derivada-normal-1': _ExerciseTranslation(
    statement: 'If the tangent line to a curve has slope 3 at a point, what is the slope of the normal line there?',
    explanation: 'Tangent and normal lines are perpendicular. Their finite nonzero slopes are negative reciprocals, so the normal slope is −1/3.',
    skill: 'Relate tangent and normal lines',
  ),
  'derivada-horizontal-1': _ExerciseTranslation(
    statement: 'At a point where f′(a)=0, what is the slope of the tangent line?',
    explanation: 'By definition f′(a) is the tangent slope. If f′(a)=0, the tangent line is horizontal.',
    skill: 'Interpret a zero derivative geometrically',
  ),
  'derivabilidade-canto-2': _ExerciseTranslation(
    statement: 'A continuous function has a corner at x=a, with left derivative −2 and right derivative 3. Is it differentiable at a?',
    explanation: 'No. The one-sided derivatives must be equal for the derivative to exist. Since −2 and 3 differ, the function is not differentiable at a.',
    skill: 'Compare one-sided derivatives at a corner',
    options: {
      'a': 'Yes, because it is continuous',
      'b': 'Yes, because both one-sided derivatives exist',
      'c': 'No, because the one-sided derivatives are different',
      'd': 'No, because the function must be polynomial',
    },
  ),
  'derivada-critico-nao-derivavel-1': _ExerciseTranslation(
    statement: 'Can a number c in the domain be a critical number even if f′(c) does not exist?',
    explanation: 'Yes. A critical number is typically a domain point where f′(c)=0 or where f′(c) does not exist. Corners and cusps can produce the second case.',
    skill: 'Recognize nondifferentiable critical numbers',
    options: {
      'a': 'No, never',
      'b': 'Yes, if c is in the domain and f′(c) does not exist',
      'c': 'Only if f(c)=0',
      'd': 'Only for polynomials',
    },
  ),
  'derivada-aplicacao-aceleracao-1': _ExerciseTranslation(
    statement: 'If s(t)=t³−3t² is position in meters, what is the acceleration a(t)?',
    explanation: 'Velocity is v(t)=s′(t)=3t²−6t. Acceleration is v′(t)=6t−6.',
    skill: 'Obtain acceleration from position',
  ),
  'derivada-aplicacao-custo-marginal-1': _ExerciseTranslation(
    statement: 'If C(q)=100+5q+0.02q² is a cost function, what is the marginal cost C′(q)?',
    explanation: 'Differentiate term by term: 100 disappears, 5q gives 5, and 0.02q² gives 0.04q. Therefore C′(q)=5+0.04q.',
    skill: 'Interpret the derivative as marginal cost',
  ),
  'derivada-aplicacao-crescimento-1': _ExerciseTranslation(
    statement: 'A population is modeled by P(t)=200e^(0.03t). What is P′(t)?',
    explanation: 'By the chain rule, the derivative of e^(0.03t) is 0.03e^(0.03t). Multiplying by 200 gives P′(t)=6e^(0.03t).',
    skill: 'Model instantaneous exponential growth rate',
  ),
  'derivada-aplicacao-area-1': _ExerciseTranslation(
    statement: 'The area of a circle is A(r)=πr². What is the rate of change of area with respect to radius?',
    explanation: 'Treat π as a constant and apply the power rule: dA/dr=2πr.',
    skill: 'Differentiate one geometric quantity with respect to another',
    options: {
      'a': 'πr',
    },
  ),
  'derivada-aplicacao-unidades-1': _ExerciseTranslation(
    statement: 'If V(t) is a volume measured in cm³ and t in seconds, what unit should V′(t) have?',
    explanation: 'The derivative is change in volume per unit time, so the unit is cubic centimeters per second, cm³/s.',
    skill: 'Interpret units of an instantaneous rate',
  ),
  'derivada-aplicacao-maximo-candidato-1': _ExerciseTranslation(
    statement: 'If f is differentiable and has an interior local maximum at x=c, what condition is expected when Fermat’s theorem applies?',
    explanation: 'At an interior local extremum where the function is differentiable, Fermat’s theorem gives f′(c)=0. This makes c a critical candidate but does not by itself prove a maximum.',
    skill: 'Relate local extrema to a zero derivative',
  ),

};