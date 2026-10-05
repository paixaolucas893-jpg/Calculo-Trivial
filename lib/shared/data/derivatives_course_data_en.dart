import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> derivativesCourseLessonsEn = [
  CourseLessonData(
    id: 'derivadas-01-significado',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 1',
    eyebrow: 'Lesson 1 of 8 • Core idea',
    title: 'Rate of change and tangent line',
    description: 'Understand the derivative as instantaneous velocity and local slope.',
    duration: '≈ 42 min',
    objective: 'interpret the derivative geometrically and in real situations',
    symbol: "f'",
    sections: [
      LessonSectionData(
        number: '1',
        title: 'From average to instant',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Average rate of change',
            content: 'Between x=a and x=b, the average rate is [f(b)−f(a)]/(b−a). It measures how much the output changes, on average, for each unit added to the input.',
            emphasis: 'For position versus time, this ratio represents average velocity.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Approaching the secant line',
            content: 'As b approaches a, the line crossing the graph at two points approaches the tangent line. The limit of the secant slopes is the derivative f′(a).',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Read the limit definition',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'f′(a)=lim h→0 [f(a+h)−f(a)]/h',
            content: 'The increment h separates two points. The numerator measures the change in the function and the denominator measures the change in the input. Letting h→0 produces an instantaneous rate.',
          ),
          WorkedExampleBlockData(
            title: 'Derivative of x² at a point a',
            problem: 'f(x)=x²',
            steps: [
              'Substitute into the definition: [(a+h)²−a²]/h.',
              'Expand: [a²+2ah+h²−a²]/h.',
              'Simplify h: 2a+h.',
              'Let h→0 and obtain 2a.',
            ],
            result: 'f′(a)=2a.',
            interpretation: 'The slope changes with the point: the larger a is, the steeper the parabola becomes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Two interpretations of the derivative',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Slope and instantaneous rate',
            content: 'Geometrically, f′(a) is the tangent slope. In applications, it is the instantaneous rate of output change with respect to input.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'From secant to tangent',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A limit of slopes',
            content: 'A secant uses two points. As the second point approaches the first, its slope may converge to the tangent slope.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Derivative notation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'f′(x), y′, and dy/dx',
            content: 'Lagrange and Leibniz notation express the same derivative while emphasizing different viewpoints.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'The derivative as a function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Local slope at every point',
            content: 'For f(x)=x², the limit definition gives f′(x)=2x, assigning a slope to each x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Units and physical meaning',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Output units per input unit',
            content: 'If position is measured in meters and time in seconds, the derivative has units m/s.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Cumulative example: average rate becoming instantaneous',
        blocks: [
          WorkedExampleBlockData(
            title: 'Velocity from the definition',
            problem: 's(t)=t²+2t. Find the instantaneous velocity at t=3 using the derivative definition.',
            steps: [
              'Compute [s(3+h)−s(3)]/h.',
              'Expand s(3+h)=(3+h)²+2(3+h).',
              'Simplify the numerator to 8h+h².',
              'Divide by h to get 8+h.',
              'Let h→0.',
            ],
            result: 'v(3)=8.',
            interpretation:
                'Instantaneous rate appears as the limit of average velocities over smaller and smaller intervals.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Geometric check and interpretation',
        blocks: [
          WorkedExampleBlockData(
            title: 'Tangent slope',
            problem: 'For f(x)=x²−1, find the tangent slope at x=2 and interpret its sign.',
            steps: [
              'From the definition or known rule, f′(x)=2x.',
              'Evaluate at x=2: f′(2)=4.',
              'Because the slope is positive, the function is locally increasing there.',
            ],
            result: 'The slope is 4.',
            interpretation:
                'The derivative gives both the magnitude and direction of local change.',
          ),
          WorkedExampleBlockData(
            title: 'Average rate versus instantaneous rate',
            problem: 'For f(x)=x², compare the average rate from x=2 to x=2.1 with f′(2).',
            steps: [
              'Average rate: [2.1²−2²]/0.1.',
              'Compute 4.41−4=0.41.',
              'Divide by 0.1 to get 4.1.',
              'Since f′(x)=2x, f′(2)=4.',
            ],
            result: 'The average rate 4.1 is already close to the instantaneous rate 4.',
            interpretation:
                'Shrinking the interval drives the secant slope toward the tangent slope.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; and Guidorizzi. The derivative is developed from the difference quotient and its geometric and applied meanings.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Geometrically, what does f′(a) represent?',
      choices: ['The slope of the tangent at a', 'The area up to a', 'The maximum value of f'],
      correctIndex: 0,
      explanation: 'The derivative is the limit of the slopes of secant lines as the points approach each other.',
    ),
    takeaways: [
      'Average rate compares two points; the derivative describes an instant.',
      'The derivative is defined by a limit.',
      'Geometrically, f′(a) is the slope of the tangent line.',
    ],
    closing: 'In the next lesson, differentiation rules will make these calculations faster.',
  ),
  CourseLessonData(
    id: 'derivadas-02-regras-basicas',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 1',
    eyebrow: 'Lesson 2 of 8 • Basic rules',
    title: 'Constants, powers, and polynomials',
    description: 'Differentiate term by term and work with integer and fractional exponents.',
    duration: '≈ 42 min',
    objective: 'apply linearity and the power rule safely',
    symbol: 'xⁿ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Build the essential toolkit',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Three fundamental rules',
            content: 'The derivative of a constant is 0. The derivative of x is 1. For any admissible power, d/dx(xⁿ)=n·xⁿ⁻¹: the exponent comes down as a multiplier and decreases by one.',
            emphasis: 'A constant does not vary, so its rate of change is zero.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Rewrite before differentiating',
            content: 'Roots and fractions can be written as powers: √x=x¹ᐟ² and 1/x=x⁻¹. This transformation lets you use the same power rule.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Differentiate term by term',
        blocks: [
          WorkedExampleBlockData(
            title: 'Complete polynomial',
            problem: 'f(x)=5x³−2x²+7x−4',
            steps: ['d/dx(5x³)=15x².', 'd/dx(−2x²)=−4x.', 'd/dx(7x)=7.', 'd/dx(−4)=0.'],
            result: 'f′(x)=15x²−4x+7.',
            interpretation: 'The sum of the rates of each term gives the rate of the whole function.',
          ),
          WorkedExampleBlockData(
            title: 'Fractional exponent',
            problem: 'f(x)=√x=x¹ᐟ², with x>0',
            steps: ['Bring the exponent 1/2 down.', 'Subtract 1: 1/2−1=−1/2.', 'Write (1/2)x⁻¹ᐟ².'],
            result: 'f′(x)=1/(2√x).',
            interpretation: 'The domain of the derivative may be smaller than the domain of the original function.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Linearity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Differentiate sums term by term',
            content: 'Differentiation is linear: constants factor out and derivatives distribute over sums and differences.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Power rule beyond positive integers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Negative and fractional exponents',
            content: 'After rewriting roots and reciprocals as powers, the power rule applies wherever the expressions are defined.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Domain of the derivative',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'The derivative can have a smaller domain',
            content: 'For f(x)=√x, f′(x)=1/(2√x), so the derivative is defined only for x>0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Higher-order derivatives',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Differentiate again',
            content: 'If f′ is differentiable, f″ describes the rate of change of the first derivative; in motion it is acceleration.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent mistakes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Track coefficients and exponents',
            content: 'Common errors include retaining additive constants or forgetting the multiplier from the exponent.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Cumulative example with mixed exponents',
        blocks: [
          WorkedExampleBlockData(
            title: 'Polynomial with a negative power',
            problem: 'f(x)=3x⁴−2x⁻¹+5√x, with x>0.',
            steps: [
              'Differentiate 3x⁴ to get 12x³.',
              'Differentiate −2x⁻¹ to get 2x⁻².',
              'Rewrite 5√x as 5x¹ᐟ² and differentiate.',
            ],
            result: 'f′(x)=12x³+2/x²+5/(2√x).',
            interpretation:
                'One power rule covers many forms after suitable rewriting.',
          ),
          WorkedExampleBlockData(
            title: 'Second derivative of a polynomial',
            problem: 'If f(x)=x⁴−3x², find f″(x).',
            steps: [
              'First derivative: f′(x)=4x³−6x.',
              'Differentiate again.',
              'Use the power rule term by term.',
            ],
            result: 'f″(x)=12x²−6.',
            interpretation:
                'Higher derivatives describe how a rate of change itself changes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Consistency check',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Before accepting a derivative',
            content:
                'Check coefficients, exponents, domain restrictions, and whether constants disappeared correctly. For polynomials, the leading degree should drop by one.',
            emphasis:
                'A quick check catches many algebra errors before they propagate.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi organize the basic rules as efficient consequences of the limit definition.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the derivative of 3x⁴−5?',
      choices: ['12x³', '12x³−5', '3x³'],
      correctIndex: 0,
      explanation: 'The power rule gives 3·4x³=12x³ and the constant disappears.',
    ),
    takeaways: [
      'Constants have derivative zero and d/dx(x)=1.',
      'In the power rule, multiply by the exponent and reduce it by one.',
      'Rewrite roots and reciprocals as powers.',
    ],
    closing: 'Now you will learn to differentiate products and quotients without expanding everything.',
  ),
  CourseLessonData(
    id: 'derivadas-03-produto-quociente',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 2',
    eyebrow: 'Lesson 3 of 8 • Combinations',
    title: 'Product and quotient rules',
    description: 'Combine functions while preserving every required term.',
    duration: '≈ 42 min',
    objective: 'apply and check the product and quotient rules',
    symbol: 'u·v',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Do not differentiate factors independently',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Product: (uv)′=u′v+uv′',
            content: 'Differentiate the first factor and keep the second; then keep the first and differentiate the second. Add the two results.',
            emphasis: 'In general, the derivative of a product is not u′v′.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Quotient: (u/v)′=(u′v−uv′)/v²',
            content: 'Multiply the derivative of the numerator by the denominator, subtract the numerator times the derivative of the denominator, and divide by the square of the denominator.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Choose between simplifying and applying the rule',
        blocks: [
          WorkedExampleBlockData(
            title: 'Product rule',
            problem: 'f(x)=x²(x+1)',
            steps: ['Let u=x² and v=x+1.', 'Compute u′=2x and v′=1.', 'Apply u′v+uv′=2x(x+1)+x².', 'Simplify: 3x²+2x.'],
            result: 'f′(x)=3x²+2x.',
            interpretation: 'Expanding first would also work; both strategies must agree.',
          ),
          WorkedExampleBlockData(
            title: 'Simplify a quotient',
            problem: 'f(x)=(x²+1)/x, x≠0',
            steps: ['Split the terms: f(x)=x+1/x.', 'Rewrite 1/x=x⁻¹.', 'Differentiate: 1−x⁻².'],
            result: 'f′(x)=1−1/x².',
            interpretation: 'Simplifying first can reduce errors, as long as the domain is preserved.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Why a product needs two terms',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Both factors vary',
            content: 'Because both factors change, (fg)′=f′g+fg′ rather than f′g′.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Quotient rule',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Order matters',
            content: 'For f/g, the derivative is (f′g−fg′)/g² where g is nonzero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Simplify first or use the rule',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Choose the efficient route',
            content: 'Algebraic simplification before differentiation can reduce work while preserving the original domain restrictions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Products with several factors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Extend the pattern',
            content: 'For several factors, each term differentiates one factor while preserving the others.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent mistakes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Sign and denominator',
            content: 'Reversing the quotient-rule numerator changes the sign, and forgetting g² changes the formula.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Cumulative example: product and quotient',
        blocks: [
          WorkedExampleBlockData(
            title: 'Quotient with a product in the numerator',
            problem: 'f(x)=x²(x+1)/(x−1), with x≠1.',
            steps: [
              'Let u=x²(x+1) and v=x−1.',
              'Use the product rule in u: u′=2x(x+1)+x².',
              'Use the quotient rule: f′=(u′v−uv′)/v².',
              'Substitute v′=1 and simplify only at the end.',
            ],
            result:
                'f′(x)=[(3x²+2x)(x−1)−x²(x+1)]/(x−1)².',
            interpretation:
                'In combined expressions, organizing by layers reduces sign errors.',
          ),
          WorkedExampleBlockData(
            title: 'Direct product-rule check',
            problem: 'Differentiate f(x)=x² sin x.',
            steps: [
              'Let u=x² and v=sin x.',
              'Then u′=2x and v′=cos x.',
              'Apply u′v+uv′.',
            ],
            result: 'f′(x)=2x sin x+x² cos x.',
            interpretation:
                'Both factors contribute because both vary with x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'How to verify the result',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Compare two strategies when possible',
            content:
                'If a product or quotient can be simplified first, differentiate the simplified form too and compare. The derivative expressions should agree on their common domain.',
            emphasis:
                'Different valid strategies can be used as a verification tool.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi motivate product and quotient rules structurally.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which structure starts the derivative of u(x)v(x)?',
      choices: ['u′v+uv′', 'u′v′', 'u′/v′'],
      correctIndex: 0,
      explanation: 'Each term differentiates one factor and keeps the other.',
    ),
    takeaways: ['The product rule produces two terms.', 'Order and the subtraction sign matter in the quotient rule.', 'Simplify first when it reduces complexity.'],
    closing: 'The next lesson deals with functions placed inside other functions.',
  ),
  CourseLessonData(
    id: 'derivadas-04-cadeia',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 2',
    eyebrow: 'Lesson 4 of 8 • Composition',
    title: 'The chain rule in layers',
    description: 'Differentiate composite functions from the outer layer to the inner one.',
    duration: '≈ 42 min',
    objective: 'identify outer and inner functions and apply the chain rule',
    symbol: 'f∘g',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'See the layers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'The outer function receives the inner one',
            content: 'For y=[g(x)]ⁿ, the power is the outer layer and g(x) is the inner layer. Differentiate the outer layer while keeping the inner expression and multiply by g′(x).',
            emphasis: 'Chain rule: d/dx f(g(x))=f′(g(x))·g′(x).',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The factor that is often forgotten',
            content: 'Differentiating only the outer layer gives an incomplete answer. Always ask: “what is taking the place of x?” and differentiate that expression too.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Differentiate from the outside in',
        blocks: [
          WorkedExampleBlockData(
            title: 'Power of a linear function',
            problem: 'f(x)=(2x+1)³',
            steps: ['Outer layer: u³. Its derivative is 3u².', 'Keep u=2x+1: 3(2x+1)².', 'Differentiate the inner layer: d/dx(2x+1)=2.', 'Multiply the factors.'],
            result: 'f′(x)=6(2x+1)².',
            interpretation: 'The factor 2 records how fast the inner expression changes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Formal composition rule',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: '(f∘g)′=f′(g(x))g′(x)',
            content: 'Differentiate the outer function at the inner expression, then multiply by the inner derivative.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Identify the inner function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Work by layers',
            content: 'For (3x²+1)^5, the chain rule gives 30x(3x²+1)^4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Three-layer chains',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Repeat the process',
            content: 'Expressions such as sin((x²+1)^3) require one derivative factor from every nested layer.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Leibniz notation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'dy/dx=(dy/du)(du/dx)',
            content: 'Leibniz notation makes variable dependence visible and helps organize the chain rule.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent mistake',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Do not forget the inner derivative',
            content: 'Differentiating only the outer layer gives an incomplete result.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Example with three layers',
        blocks: [
          WorkedExampleBlockData(
            title: 'Composition cascade',
            problem: 'f(x)=√(1+(2x−1)²).',
            steps: [
              'Outer layer: √u=u¹ᐟ².',
              'Middle layer: u=1+v².',
              'Inner layer: v=2x−1.',
              'Differentiate from outside inward and multiply the factors.',
            ],
            result:
                'f′(x)=2(2x−1)/√(1+(2x−1)²).',
            interpretation:
                'Each layer contributes one factor to the final derivative.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Chain rule with elementary functions',
        blocks: [
          WorkedExampleBlockData(
            title: 'Composite exponential',
            problem: 'f(x)=e^(3x²−1).',
            steps: [
              'The outer function is e^u.',
              'The inner function is u=3x²−1.',
              'The outer derivative keeps e^u.',
              'Multiply by u′=6x.',
            ],
            result: 'f′(x)=6x e^(3x²−1).',
            interpretation:
                'The chain rule appears whenever a function is applied to another variable expression.',
          ),
          WorkedExampleBlockData(
            title: 'Logarithmic composition',
            problem: 'Differentiate f(x)=ln(x²+1).',
            steps: [
              'Outer derivative of ln u is 1/u.',
              'Keep u=x²+1.',
              'Multiply by u′=2x.',
            ],
            result: 'f′(x)=2x/(x²+1).',
            interpretation:
                'The inner derivative is essential even when the outer formula is familiar.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi treat the chain rule as central for composite functions.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the derivative of (3x−2)⁴?',
      choices: ['12(3x−2)³', '4(3x−2)³', '12(3x−2)⁴'],
      correctIndex: 0,
      explanation: 'The outer layer gives 4(3x−2)³ and the inner layer gives the factor 3.',
    ),
    takeaways: ['Explicitly identify the outer and inner functions.', 'Differentiate the outer function while keeping the inner expression.', 'Multiply by the derivative of each inner layer.'],
    closing: 'Next, you will expand your toolkit with trigonometric, exponential, and logarithmic functions.',
  ),
  CourseLessonData(
    id: 'derivadas-05-elementares',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 2',
    eyebrow: 'Lesson 5 of 8 • Elementary functions',
    title: 'Sine, cosine, exponential, and logarithm',
    description: 'Learn the most common elementary derivatives with meaning.',
    duration: '≈ 42 min',
    objective: 'differentiate trigonometric, exponential, and logarithmic functions',
    symbol: 'eˣ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Organize the toolkit',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Four fundamental pairs',
            content: 'd/dx[sin(x)]=cos(x); d/dx[cos(x)]=−sin(x); d/dx[eˣ]=eˣ; d/dx[ln(x)]=1/x for x>0.',
            emphasis: 'The negative sign belongs to the derivative of cosine, not sine.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Why is eˣ special?',
            content: 'The base e is chosen so that the instantaneous growth rate of eˣ equals the value of the function itself. This simplifies growth and decay models.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Combine with the chain rule',
        blocks: [
          WorkedExampleBlockData(
            title: 'Sine of a function',
            problem: 'f(x)=sin(2x)',
            steps: ['The outer derivative of sin(u) is cos(u).', 'Keep u=2x: cos(2x).', 'Multiply by the inner derivative, which is 2.'],
            result: 'f′(x)=2cos(2x).',
            interpretation: 'An inner oscillation that is twice as fast produces a factor 2 in the rate.',
          ),
          WorkedExampleBlockData(
            title: 'Composite logarithm',
            problem: 'g(x)=ln(x²+1)',
            steps: ['The outer derivative of ln(u) is 1/u.', 'Use u=x²+1 in the denominator.', 'Multiply by u′=2x.'],
            result: 'g′(x)=2x/(x²+1).',
            interpretation: 'The chain rule connects the logarithm rate to the rate of the inner expression.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Basic trigonometric derivatives',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Radians matter',
            content: 'd/dx(sin x)=cos x, d/dx(cos x)=−sin x, and d/dx(tan x)=sec²x, with angles in radians.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exponentials',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'The special role of e',
            content: 'd/dx(e^x)=e^x, while d/dx(a^x)=a^x ln(a).',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Logarithms',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Natural logarithm',
            content: 'd/dx(ln x)=1/x for x>0; compositions require the chain rule.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Combine formulas with chain rule',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Composite elementary functions',
            content: 'For f(x)=e^(x²), f′(x)=2x e^(x²).',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Domain and hypotheses',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Formulas have conditions',
            content: 'Logarithms, trigonometric quotients, and other elementary functions retain domain restrictions after differentiation.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Cumulative example with elementary functions',
        blocks: [
          WorkedExampleBlockData(
            title: 'Sum of elementary terms',
            problem: 'f(x)=2sin x−3eˣ+ln x, with x>0.',
            steps: [
              'd/dx[2sin x]=2cos x.',
              'd/dx[−3eˣ]=−3eˣ.',
              'd/dx[ln x]=1/x.',
            ],
            result: 'f′(x)=2cos x−3eˣ+1/x.',
            interpretation:
                'Linearity lets you combine the standard derivative repertoire directly.',
          ),
          WorkedExampleBlockData(
            title: 'Trigonometric and exponential composition',
            problem: 'Differentiate f(x)=sin(2x)+e^(−x).',
            steps: [
              'Use the chain rule on sin(2x): 2cos(2x).',
              'Use the chain rule on e^(−x): −e^(−x).',
              'Add the derivatives.',
            ],
            result: 'f′(x)=2cos(2x)−e^(−x).',
            interpretation:
                'Standard elementary derivatives often appear together with the chain rule.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Domain and interpretation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A correct formula still has a domain',
            content:
                'Derivatives of logarithms, trigonometric expressions, and quotients inherit domain restrictions. A formula is meaningful only where the original function and derivative are defined.',
            emphasis:
                'Record the relevant domain before evaluating the derivative.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi organize elementary derivatives for combination with the main rules.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is d/dx[cos(x)]?',
      choices: ['−sin(x)', 'sin(x)', '−cos(x)'],
      correctIndex: 0,
      explanation: 'The rate of cosine follows sine with a negative sign.',
    ),
    takeaways: ['The derivative of sin(x) is cos(x).', 'The derivative of cos(x) is −sin(x).', 'eˣ remains unchanged and ln(x) gives 1/x.', 'For composite arguments, also apply the chain rule.'],
    closing: 'In the next lesson, the derivative will be converted into an equation of the tangent line.',
  ),
  CourseLessonData(
    id: 'derivadas-06-tangente',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 3',
    eyebrow: 'Lesson 6 of 8 • Local geometry',
    title: 'Slope and tangent-line equation',
    description: 'Use f′(a) to build the line that best approximates the graph locally.',
    duration: '≈ 42 min',
    objective: 'calculate the slope and equation of a tangent line',
    symbol: 'y=mx+b',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Find the point and slope',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Point-slope form',
            content: 'At x=a, the slope is m=f′(a) and the point on the graph is (a,f(a)). Substitute into y−f(a)=f′(a)(x−a).',
            emphasis: 'Computing only f′(a) gives the slope, not the complete line equation.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Linear approximation',
            content: 'Near a, the function can be approximated by L(x)=f(a)+f′(a)(x−a). This linearization simplifies estimates and the analysis of small errors.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Build the line',
        blocks: [
          WorkedExampleBlockData(
            title: 'Tangent to a parabola',
            problem: 'f(x)=x² at the point (1,1)',
            steps: ['Differentiate: f′(x)=2x.', 'Evaluate the slope: f′(1)=2.', 'Use y−1=2(x−1).', 'Simplify the equation.'],
            result: 'y=2x−1.',
            interpretation: 'The line and the parabola share the point and the instantaneous direction at x=1.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Point-slope equation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'y−f(a)=f′(a)(x−a)',
            content: 'Once the point and derivative are known, the tangent line follows from point-slope form.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Normal line',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Perpendicular slope',
            content: 'When f′(a) is nonzero, the normal slope is −1/f′(a).',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Horizontal tangents',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'When f′(a)=0',
            content: 'A zero derivative gives a horizontal tangent but does not by itself prove a maximum or minimum.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Linear approximation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'The tangent as a local model',
            content: 'Near a, L(x)=f(a)+f′(a)(x−a) approximates a differentiable function.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Complete example',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Tangent to x² at x=2',
            content: 'Since f(2)=4 and f′(2)=4, the tangent is y=4x−4.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Tangent and normal at the same point',
        blocks: [
          WorkedExampleBlockData(
            title: 'Two lines associated with the curve',
            problem: 'For f(x)=x³ at x=1, find the tangent and normal lines.',
            steps: [
              'f(1)=1.',
              'f′(x)=3x², so f′(1)=3.',
              'Tangent: y−1=3(x−1).',
              'The normal slope is −1/3.',
              'Normal: y−1=−(1/3)(x−1).',
            ],
            result:
                'Tangent: y=3x−2; normal: y−1=−(x−1)/3.',
            interpretation:
                'Tangent and normal share the contact point and have perpendicular directions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Numerical linearization',
        blocks: [
          WorkedExampleBlockData(
            title: 'Approximate a square root',
            problem: 'Use the tangent to f(x)=√x at a=4 to estimate √4.1.',
            steps: [
              'f(4)=2.',
              'f′(x)=1/(2√x), so f′(4)=1/4.',
              'L(x)=2+(1/4)(x−4).',
              'Evaluate L(4.1).',
            ],
            result: '√4.1 ≈ 2.025.',
            interpretation:
                'Linearization replaces a nonlinear calculation with a simple local estimate.',
          ),
          WorkedExampleBlockData(
            title: 'Horizontal tangent',
            problem: 'Find the points where f(x)=x³−3x has a horizontal tangent.',
            steps: [
              'Differentiate: f′(x)=3x²−3.',
              'Set f′(x)=0.',
              'Solve x²=1.',
              'Evaluate f at x=−1 and x=1.',
            ],
            result: 'Horizontal tangents occur at (−1,2) and (1,−2).',
            interpretation:
                'A zero derivative identifies where the tangent line is horizontal.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi connect tangent lines with local linearization.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'For f(x)=x², what is the slope at x=3?',
      choices: ['6', '3', '9'],
      correctIndex: 0,
      explanation: 'Since f′(x)=2x, we have f′(3)=6.',
    ),
    takeaways: ['f′(a) gives the slope of the tangent.', 'The point of tangency is (a,f(a)).', 'Use y−f(a)=f′(a)(x−a).', 'The tangent line approximates the function locally.'],
    closing: 'Next, you will study when a derivative exists and what its zeros reveal.',
  ),
  CourseLessonData(
    id: 'derivadas-07-derivabilidade',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 3',
    eyebrow: 'Lesson 7 of 8 • Existence and analysis',
    title: 'Differentiability and critical points',
    description: 'Recognize corners, one-sided derivatives, and candidates for extrema.',
    duration: '≈ 42 min',
    objective: 'analyze existence of the derivative and locate critical points',
    symbol: 'f′=0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Differentiable implies continuous',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The converse is false',
            content: 'If f is differentiable at a, then it is continuous at a. However, a function may be continuous and not differentiable: corners, cusps, and vertical tangents prevent a unique finite slope.',
            emphasis: 'Continuity is necessary for differentiability, but it is not sufficient.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'One-sided derivatives',
            content: 'The derivative exists only when the rates from the left and right exist and agree. For |x| at zero, they are −1 and 1, so there is a corner.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Find critical points',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Candidates for change',
            content: 'A number c in the domain is critical when f′(c)=0 or when f′(c) does not exist. Critical points are candidates for maxima and minima, but they still need analysis.',
            emphasis: 'A zero derivative does not automatically guarantee a maximum or minimum.',
          ),
          WorkedExampleBlockData(
            title: 'Derivative equal to zero',
            problem: 'f(x)=x²−4x',
            steps: ['Differentiate: f′(x)=2x−4.', 'Set f′(x)=0.', 'Solve 2x−4=0.'],
            result: 'x=2 is a critical point.',
            interpretation: 'A horizontal tangent indicates a candidate for a change in increasing/decreasing behavior.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Differentiability implies continuity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'One-way implication',
            content: 'Differentiable implies continuous, but a continuous function need not be differentiable.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Corners and cusps',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'One-sided slopes may disagree',
            content: 'For |x| at zero, the one-sided derivatives are −1 and 1, so the function is continuous but not differentiable.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Vertical tangents and discontinuities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Other failures',
            content: 'Derivatives may fail at vertical tangents, cusps, corners, and discontinuities.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Critical points',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'f′(c)=0 or undefined',
            content: 'Critical points are candidates for extrema but are not automatically maxima or minima.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Sign of the derivative',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Increasing and decreasing',
            content: 'Positive derivative indicates increasing behavior and negative derivative indicates decreasing behavior on an interval.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Examples of nondifferentiability',
        blocks: [
          WorkedExampleBlockData(
            title: 'Corner in absolute value',
            problem: 'Analyze f(x)=|x−2| at x=2.',
            steps: [
              'To the left of 2, the slope is −1.',
              'To the right of 2, the slope is 1.',
              'Because the one-sided derivatives differ, f′(2) does not exist.',
            ],
            result: 'f is continuous at 2 but not differentiable there.',
            interpretation:
                'Continuity does not guarantee a unique tangent direction.',
          ),
          WorkedExampleBlockData(
            title: 'Vertical tangent',
            problem: 'Consider f(x)=x^(1/3) at x=0.',
            steps: [
              'For x≠0, f′(x)=1/[3x^(2/3)].',
              'As x→0, the derivative magnitude grows without bound.',
              'There is no finite slope at x=0.',
            ],
            result: 'There is a vertical tangent at x=0.',
            interpretation:
                'The function is continuous, but no finite derivative exists at the point.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Classification using the sign of the derivative',
        blocks: [
          WorkedExampleBlockData(
            title: 'Critical point and sign change',
            problem: 'For f(x)=x³−3x, classify the critical points.',
            steps: [
              'f′(x)=3x²−3=3(x−1)(x+1).',
              'The critical points are x=−1 and x=1.',
              'Analyze the sign of f′ on the intervals separated by −1 and 1.',
              'f′ changes from positive to negative at −1 and from negative to positive at 1.',
            ],
            result:
                'x=−1 is a local maximum and x=1 is a local minimum.',
            interpretation:
                'A sign change in the derivative classifies local behavior.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi connect differentiability, continuity, and sign analysis.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Is a continuous function always differentiable?',
      choices: ['No', 'Yes', 'Only if f′=0'],
      correctIndex: 0,
      explanation: '|x| is continuous at zero, but its one-sided derivatives are different.',
    ),
    takeaways: ['Differentiability guarantees continuity at the point.', 'Continuity alone does not guarantee differentiability.', 'Corners can be detected by different one-sided derivatives.', 'Critical points occur when f′=0 or does not exist.'],
    closing: 'The final lesson applies derivatives to motion and interpretation of units.',
  ),
  CourseLessonData(
    id: 'derivadas-08-aplicacoes',
    topicId: 'derivadas',
    trailTitle: 'Derivatives • Unit 3',
    eyebrow: 'Lesson 8 of 8 • Applications',
    title: 'Motion, units, and modeling',
    description: 'Interpret derivatives in physical problems and organize the complete method.',
    duration: '≈ 45 min',
    objective: 'model instantaneous rates and interpret their results',
    symbol: 'v(t)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'The derivative carries units',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Position, velocity, and acceleration',
            content: 'If s(t) measures position in meters and t is in seconds, v(t)=s′(t) is measured in m/s. Differentiating again gives a(t)=v′(t)=s″(t), in m/s².',
            emphasis: 'Units help verify whether the answer represents the quantity being asked for.',
            tone: LearningCardTone.success,
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Modeling workflow',
            content: '1) Identify input, output, and units. 2) Differentiate the model. 3) Evaluate at the requested instant. 4) Include the unit. 5) Interpret sign and magnitude in context.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Calculate and interpret',
        blocks: [
          WorkedExampleBlockData(
            title: 'Instantaneous velocity',
            problem: 's(t)=t²+3t meters; find v(2)',
            steps: ['Differentiate position: v(t)=s′(t)=2t+3.', 'Substitute t=2: v(2)=2·2+3.', 'Calculate and attach the velocity unit.'],
            result: 'v(2)=7 m/s.',
            interpretation: 'At 2 seconds, the position is increasing at a rate of 7 meters per second.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Derivative beyond motion',
            content: 'In Engineering, derivatives describe current as rate of charge, flow as rate of volume, deformation along a component, and sensitivity of an output to input changes.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Rectilinear motion',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Position, velocity, acceleration',
            content: 'If s(t) is position, then v(t)=s′(t) and a(t)=s″(t). Units and signs carry physical meaning.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Related rates',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Variables change together',
            content: 'Differentiate relationships with respect to time and use the chain rule to connect changing quantities.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Optimization',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Use critical points in a model',
            content: 'Optimization translates a situation into an objective function, identifies its domain, and evaluates critical candidates.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Marginal interpretation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Economics and production',
            content: 'A derivative can approximate the effect of one additional unit in cost, revenue, or production models.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Cumulative motion example',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Successive derivatives',
            content: 'For s(t)=t³−6t²+9t, velocity is 3t²−12t+9 and acceleration is 6t−12.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Application to related rates',
        blocks: [
          WorkedExampleBlockData(
            title: 'Growing circle area',
            problem:
                'The radius grows at 2 cm/s. How fast is the area changing when r=5 cm?',
            steps: [
              'Use A=πr².',
              'Differentiate with respect to time: dA/dt=2πr·dr/dt.',
              'Substitute r=5 and dr/dt=2.',
            ],
            result: 'dA/dt=20π cm²/s.',
            interpretation:
                'The chain rule connects the rate of the radius to the rate of the area.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Application to optimization',
        blocks: [
          WorkedExampleBlockData(
            title: 'Maximum of a quadratic model',
            problem: 'Revenue is R(q)=40q−q². For which q is revenue maximized?',
            steps: [
              'Differentiate: R′(q)=40−2q.',
              'Set R′(q)=0.',
              'Solve q=20.',
              'Because the parabola opens downward, the critical point is a maximum.',
            ],
            result: 'Revenue is maximized at q=20.',
            interpretation:
                'A critical point becomes meaningful when combined with the structure of the model.',
          ),
          WorkedExampleBlockData(
            title: 'Marginal cost',
            problem: 'If C(q)=100+5q+0.02q², find the marginal cost at q=50.',
            steps: [
              'Differentiate: C′(q)=5+0.04q.',
              'Evaluate at q=50.',
              'Interpret the result as approximate added cost per extra unit.',
            ],
            result: 'C′(50)=7.',
            interpretation:
                'Near 50 units, producing one additional unit changes cost by about 7 currency units.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Academic basis and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'References',
            content: 'Stewart; Thomas’ Calculus; OpenStax; Larson & Edwards; and Guidorizzi support motion, related rates, optimization, and marginal applications.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'If s is measured in meters and t in seconds, what is the unit of s′(t)?',
      choices: ['m/s', 'm·s', 'm/s²'],
      correctIndex: 0,
      explanation: 'The derivative divides the change in position by the change in time.',
    ),
    takeaways: ['A derivative must be interpreted together with its units.', 'Velocity is the derivative of position; acceleration is the derivative of velocity.', 'Evaluating the derivative at a point gives an instantaneous rate.', 'The method ends with interpretation, not just algebra.'],
    closing: 'You completed the foundations of Derivatives. Now practice recognition, calculation, and interpretation.',
  ),
];