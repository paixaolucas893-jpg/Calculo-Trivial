import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> englishContinuityCourseLessons = [
  CourseLessonData(
    id: 'continuidade-01-significado',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 1',
    eyebrow: 'Lesson 1 of 7 • Core idea',
    title: 'When is a function continuous?',
    description:
        'Connect the function value, the limit, and the graph behavior at a point.',
    duration: '≈ 28 min',
    objective: 'check the three conditions for continuity at a point',
    symbol: 'C',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Think of no break in the graph',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'A path without interruption',
            content:
                'A function is continuous at x=a when the value predicted by approaching a matches the value actually assigned to the function at that point. On the graph, there is no hole, jump, or blow-up to infinity at a.',
            emphasis:
                'The idea of “drawing without lifting the pencil” helps, but the mathematical definition is more precise.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'The three conditions',
            content:
                '1) f(a) must exist. 2) lim x→a f(x) must exist. 3) The limit must equal f(a). If even one condition fails, the function is not continuous at a.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Apply the definition in the right order',
        blocks: [
          WorkedExampleBlockData(
            title: 'Complete check',
            problem: 'f(x)=x²+1. Is the function continuous at x=2?',
            steps: [
              'Calculate f(2)=2²+1=5.',
              'Because polynomials allow direct substitution, lim x→2 (x²+1)=5.',
              'Compare: the limit exists and equals f(2).',
            ],
            result: 'f is continuous at x=2.',
            interpretation:
                'The function value, left-hand tendency, and right-hand tendency all meet at 5.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Continuity and one-sided limits', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Both sides must agree', content: 'For f to be continuous at a, the left-hand and right-hand limits must exist, agree with each other, and equal f(a).', emphasis: 'Continuity combines left behavior, right behavior, and the function value.')]),
      LessonSectionData(number: '4', title: 'A hole can be repaired', blocks: [WorkedExampleBlockData(title: 'Removable discontinuity', problem: 'f(x)=(x²−1)/(x−1), x≠1. How can f be made continuous at x=1?', steps: ['Factor x²−1=(x−1)(x+1).','For x≠1, f(x)=x+1.','Therefore lim x→1 f(x)=2.','Define f(1)=2.'], result: 'With f(1)=2, continuity is restored.', interpretation: 'The limit tells us exactly which value fills the hole.')]),
      LessonSectionData(number: '5', title: 'One-sided continuity', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'Endpoints of intervals', content: 'At an endpoint of the domain, continuity is checked from the side that belongs to the domain. On [a,b], continuity at a is right-sided and at b is left-sided.')]),
      LessonSectionData(number: '6', title: 'Rigorous graph reading', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'No local break', content: 'Graphically, continuity at a means the curve approaches the same height from both sides and the actual function point lies at that height.', emphasis: '“Draw without lifting the pencil” is a metaphor; limit=value is the mathematical criterion.')]),
      LessonSectionData(number: '7', title: 'Frequent mistakes', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Having f(a) is not enough', content: 'A function may be defined at a and still be discontinuous there. It may also have a limit at a while being undefined at the point.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '8', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The three-condition definition is treated as a direct consequence of limit theory.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'If lim x→a f(x)=4, but f(a)=7, is the function continuous at a?',
      choices: ['Yes', 'No', 'Only from the right'],
      correctIndex: 1,
      explanation:
          'The third condition fails: the limit must match the function value.',
    ),
    takeaways: [
      'Continuity is a property analyzed at a point or on an interval.',
      'The function value and the limit must both exist.',
      'The equality lim x→a f(x)=f(a) completes the check.',

      'Continuity at a requires f(a), the limit, and equality between them.',
      'The one-sided limits must agree.',
      'A removable discontinuity can be repaired by redefining the point value.',
      'At interval endpoints, continuity is one-sided.',
    ],
    closing:
        'In the next lesson, you will recognize continuous families without repeating the full definition.',
  ),
  CourseLessonData(
    id: 'continuidade-02-dominio',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 1',
    eyebrow: 'Lesson 2 of 7 • Families and domain',
    title: 'Continuity on the domain',
    description:
        'Use properties of polynomials, rational functions, roots, and trigonometric functions.',
    duration: '≈ 30 min',
    objective: 'determine intervals of continuity from the domain',
    symbol: 'D',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Recognize familiar functions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Continuous families',
            content:
                'Polynomials, sine, cosine, and exponential functions are continuous for all real numbers. Rational functions are continuous where the denominator is nonzero. Even-index roots are continuous where the radicand is nonnegative.',
            emphasis:
                'Saying “continuous on its domain” does not include points where the expression is not defined at all.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Operations preserve continuity',
            content:
                'Sums, products, and compositions of continuous functions remain continuous where the operations are defined. Quotients do as well, provided the denominator is nonzero.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Find the intervals',
        blocks: [
          WorkedExampleBlockData(
            title: 'A rational function',
            problem: 'f(x)=(x+1)/(x−2)',
            steps: [
              'The numerator and denominator are polynomials.',
              'Find where the denominator is zero: x−2=0, so x=2.',
              'Exclude that point and split the domain into intervals.',
            ],
            result: 'f is continuous on (−∞,2) and (2,+∞).',
            interpretation:
                'The expression has a break at x=2 because the division is undefined there.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Composition of continuous functions', blocks: [ConceptBlockData(visual: LessonVisual.transform, title: 'Continuity passes through composition', content: 'If g is continuous at a and f is continuous at g(a), then f∘g is continuous at a. This lets us analyze complicated expressions layer by layer.')]),
      LessonSectionData(number: '4', title: 'Exponentials and logarithms', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Fundamental families', content: 'Exponential functions are continuous on ℝ. Logarithms are continuous where their arguments are positive. Domain comes first.')]),
      LessonSectionData(number: '5', title: 'Trigonometric functions', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Sine, cosine, and quotients', content: 'Sine and cosine are continuous on ℝ. Tangent and other quotient-based trigonometric functions are continuous where their denominators are nonzero.')]),
      LessonSectionData(number: '6', title: 'Roots and domain boundaries', blocks: [WorkedExampleBlockData(title: 'Composite radical', problem: 'Determine where f(x)=√(5−x) is continuous.', steps: ['Require 5−x≥0.','Thus x≤5.','The square-root function is continuous on its domain.'], result: 'f is continuous on (−∞,5].', interpretation: 'At x=5, continuity is checked from the left.')]),
      LessonSectionData(number: '7', title: 'Maximal intervals of continuity', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Break the domain at problematic points', content: 'Denominator zeros, radical boundaries, and invalid logarithm arguments divide the domain into maximal intervals on which the expression remains continuous.')]),
      LessonSectionData(number: '8', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The approach follows the standard classification of continuous families and continuity-preserving operations.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question: 'Where is √(x−3) continuous over the real numbers?',
      choices: ['[3,+∞)', 'All ℝ', '(−∞,3]'],
      correctIndex: 0,
      explanation:
          'The square root requires x−3≥0. The function is continuous throughout the resulting domain.',
    ),
    takeaways: [
      'Start by finding the domain of the expression.',
      'Rational functions exclude zeros of the denominator.',
      'Operations and compositions preserve continuity where defined.',

      'Compositions preserve continuity under the appropriate hypotheses.',
      'Exponentials are continuous on ℝ and logarithms on their positive domains.',
      'Quotient-based trigonometric functions require attention to denominator zeros.',
      'Maximal continuity intervals follow from domain restrictions.',
    ],
    closing:
        'Now you will classify what happens at points where continuity fails.',
  ),
  CourseLessonData(
    id: 'continuidade-03-descontinuidades',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 2',
    eyebrow: 'Lesson 3 of 7 • Classification',
    title: 'Holes, jumps, and asymptotes',
    description:
        'Distinguish removable, jump, and infinite discontinuities.',
    duration: '≈ 32 min',
    objective: 'classify a discontinuity from the behavior of its limits',
    symbol: '!',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Observe how the approach fails',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Three main types',
            content:
                'Removable: the limit exists and is finite, but the value is missing or different. Jump: the one-sided limits are finite and different. Infinite: the magnitude of the function grows without bound near the point.',
            emphasis:
                'The classification depends on the limits, not only on the appearance of the graph.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'The greatest-integer function',
            content:
                'At every integer, the function ⌊x⌋ changes level abruptly. The value approached from the left differs from the value approached from the right, producing jumps.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Classify with evidence',
        blocks: [
          WorkedExampleBlockData(
            title: 'Vertical asymptote',
            problem: 'f(x)=1/(x−2), near x=2',
            steps: [
              'From the right, x−2 is positive and very small: f(x)→+∞.',
              'From the left, x−2 is negative and very small: f(x)→−∞.',
              'The values grow without bound in magnitude.',
            ],
            result: 'There is an infinite discontinuity at x=2.',
            interpretation: 'The line x=2 acts as a vertical asymptote.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Removable discontinuity', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'The limit exists but the point fails', content: 'If lim x→a f(x)=L exists but f(a) is missing or f(a)≠L, the discontinuity is removable. Defining f(a)=L repairs the function.')]),
      LessonSectionData(number: '4', title: 'Jump discontinuity', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'The sides approach different heights', content: 'When the one-sided limits are finite but unequal, the two-sided limit does not exist. Changing only f(a) cannot repair this break.')]),
      LessonSectionData(number: '5', title: 'Infinite discontinuity', blocks: [ConceptBlockData(visual: LessonVisual.infinity, title: 'Vertical asymptote', content: 'If at least one one-sided limit grows without bound in magnitude, the point has an infinite discontinuity and vertical asymptotic behavior.')]),
      LessonSectionData(number: '6', title: 'Oscillation', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Not every failure is a jump or infinity', content: 'A function may oscillate indefinitely near a point without approaching one value. Then the limit does not exist.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '7', title: 'Evidence-based diagnosis', blocks: [WorkedExampleBlockData(title: 'Classify the break', problem: 'If lim x→2⁻ f(x)=3, lim x→2⁺ f(x)=3, and f(2)=7, what type is it?', steps: ['The one-sided limits agree.','The two-sided limit is 3.','The function value is 7.'], result: 'Removable discontinuity.', interpretation: 'Redefining f(2)=3 restores continuity.')]),
      LessonSectionData(number: '8', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The classification distinguishes removable breaks, jumps, infinite behavior, and oscillation.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'The limit at a exists and equals 3, but f(a) does not exist. What type is it?',
      choices: ['Removable', 'Jump', 'Infinite'],
      correctIndex: 0,
      explanation:
          'Defining f(a)=3 is enough to restore continuity at that point.',
    ),
    takeaways: [
      'Holes correspond to removable discontinuities.',
      'Different one-sided limits characterize jumps.',
      'Unbounded growth near the point indicates an infinite discontinuity.',

      'Removable discontinuities preserve an existing finite limit.',
      'Jumps occur when finite one-sided limits differ.',
      'Infinite discontinuities are associated with unbounded behavior.',
      'Oscillation can prevent limit existence without a jump or asymptote.',
    ],
    closing:
        'In the next lesson, one-sided limits will be used with piecewise-defined functions.',
  ),
  CourseLessonData(
    id: 'continuidade-04-partes',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 2',
    eyebrow: 'Lesson 4 of 7 • Piecewise functions',
    title: 'Where two rules meet',
    description:
        'Check continuity at switching points and at interval endpoints.',
    duration: '≈ 32 min',
    objective: 'compare one-sided limits in piecewise-defined functions',
    symbol: '{',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Each side uses its own rule',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The switching point',
            content:
                'For x<a, use the first expression when calculating the left-hand limit. For x>a, use the second expression for the right-hand limit. Then check which rule includes the equality sign and determines f(a).',
            emphasis:
                'All three quantities must agree: left-hand limit, right-hand limit, and the value at the point.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Endpoints of an interval',
            content:
                'At the left endpoint of [a,b], it only makes sense to approach through values in the domain, that is, from the right. At the right endpoint, use the left-hand limit.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Make the rules meet',
        blocks: [
          WorkedExampleBlockData(
            title: 'Two expressions',
            problem: 'f(x)=x+1 if x<1; f(x)=2x if x≥1',
            steps: [
              'From the left, x+1 approaches 2.',
              'From the right, 2x approaches 2.',
              'Because the second rule includes x=1, f(1)=2.',
            ],
            result: 'The function is continuous at x=1.',
            interpretation:
                'The two pieces meet at the same point without creating a jump.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'The junction is where the analysis concentrates', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'Away from the junction each rule is usually simple', content: 'In piecewise functions, each individual expression is often continuous on its own domain. The main work is at points where the rule changes.')]),
      LessonSectionData(number: '4', title: 'Complete procedure', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Left, right, and value', content: 'At a switching point a, compute lim x→a⁻ f(x), lim x→a⁺ f(x), and f(a). Continuity requires all three to agree.')]),
      LessonSectionData(number: '5', title: 'Example with two formulas', blocks: [WorkedExampleBlockData(title: 'The rules must meet', problem: 'f(x)=2x+1 for x<2 and x²−1 for x≥2. Is it continuous at 2?', steps: ['From the left: 2·2+1=5.','From the right: 2²−1=3.','f(2)=3.'], result: 'It is not continuous at 2.', interpretation: 'The one-sided mismatch blocks continuity.')]),
      LessonSectionData(number: '6', title: 'More than one switching point', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Analyze each junction separately', content: 'A function with three or more pieces can have several continuity checkpoints. Each switching point needs its own one-sided comparison.')]),
      LessonSectionData(number: '7', title: 'Piecewise modeling', blocks: [ConceptBlockData(visual: LessonVisual.engineering, title: 'Rates, control, and physical regimes', content: 'Piecewise models appear when a rule changes after a threshold. Continuity tells us whether the transition between regimes occurs without a jump in the modeled quantity.', tone: LearningCardTone.information)]),
      LessonSectionData(number: '8', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. Piecewise functions consolidate one-sided limits and local continuity conditions.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'On [0,4], which side is used to check continuity at the endpoint x=4?',
      choices: ['Left', 'Right', 'Both are always required'],
      correctIndex: 0,
      explanation:
          'We approach 4 using smaller values that belong to the interval.',
    ),
    takeaways: [
      'Use the rule corresponding to each side of the switching point.',
      'Check the value defined at the point separately.',
      'At domain endpoints, use one-sided continuity.',

      'For piecewise functions, focus on the points where the rule changes.',
      'Continuity at a junction requires equality of left limit, right limit, and function value.',
      'Each switching point must be checked separately.',
      'Piecewise models represent regime changes in applications.',
    ],
    closing:
        'The next lesson turns continuity into an equation for finding parameters.',
  ),
  CourseLessonData(
    id: 'continuidade-05-parametros',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 3',
    eyebrow: 'Lesson 5 of 7 • Repair',
    title: 'Choose values that remove breaks',
    description:
        'Determine parameters and redefine points to make functions continuous.',
    duration: '≈ 34 min',
    objective: 'set up and solve continuity conditions involving parameters',
    symbol: 'k',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Turn the definition into an equation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Repair a removable discontinuity',
            content:
                'If the limit at a exists and equals L, defining f(a)=L fills the hole. For piecewise functions, set the one-sided expressions equal at the switching point and solve the resulting equation for the parameter.',
            emphasis:
                'Only removable discontinuities can be repaired by changing a single function value.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Solve for the parameter',
        blocks: [
          WorkedExampleBlockData(
            title: 'Matching two pieces',
            problem: 'f(x)=2x+1 if x<1; f(x)=x+k if x≥1',
            steps: [
              'The left-hand limit at 1 is 2(1)+1=3.',
              'The right-hand limit and f(1) are 1+k.',
              'Impose continuity: 1+k=3.',
              'Solve the equation: k=2.',
            ],
            result: 'k=2 makes the function continuous.',
            interpretation:
                'The parameter shifts the second piece until it meets the first.',
          ),
          WorkedExampleBlockData(
            title: 'Filling a hole',
            problem: 'f(x)=(x²−1)/(x−1), x≠1. Define f(1).',
            steps: [
              'Factor x²−1=(x−1)(x+1).',
              'Near 1, simplify to x+1.',
              'Calculate the limit: 1+1=2.',
            ],
            result: 'Define f(1)=2.',
            interpretation:
                'The new definition changes only the missing point and preserves the rest of the function.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Parameters as compatibility conditions', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Continuity chooses the parameter', content: 'When a piecewise function contains an unknown constant, continuity turns the problem into an equation forcing the pieces to agree at the junction.')]),
      LessonSectionData(number: '4', title: 'Parameter in the function value', blocks: [WorkedExampleBlockData(title: 'Fill the correct point', problem: 'f(x)=(x²−4)/(x−2) for x≠2 and f(2)=k. Find k.', steps: ['Simplify to x+2.','Compute lim x→2 f(x)=4.','Require k=4.'], result: 'k=4.', interpretation: 'The parameter fills the removable discontinuity.')]),
      LessonSectionData(number: '5', title: 'Parameter in one branch', blocks: [WorkedExampleBlockData(title: 'Make the pieces agree', problem: 'f(x)=kx+1 for x<2 and x² for x≥2. Find k.', steps: ['Left limit: 2k+1.','Right limit and f(2): 4.','Solve 2k+1=4.'], result: 'k=3/2.', interpretation: 'One-sided equality determines the parameter.')]),
      LessonSectionData(number: '6', title: 'More than one parameter', blocks: [ConceptBlockData(visual: LessonVisual.calculate, title: 'A system may appear', content: 'With two unknown constants and two independent junction conditions, continuity can produce a system of equations. Later, continuity and differentiability together may provide additional conditions.')]),
      LessonSectionData(number: '7', title: 'Verify after solving', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Substitute back', content: 'After finding the parameter, recompute the one-sided limits and the function value. This catches algebraic errors before the final conclusion.')]),
      LessonSectionData(number: '8', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. Parametric problems turn the definition of continuity into explicit algebraic conditions.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'If lim x→3 f(x)=8, what value should be assigned to f(3) to guarantee continuity?',
      choices: ['3', '8', '0'],
      correctIndex: 1,
      explanation:
          'Continuity requires the value at the point to equal the limit.',
    ),
    takeaways: [
      'First calculate the value required by the approaching behavior.',
      'Set one-sided limits equal to adjust piecewise functions.',
      'Redefining one point repairs only removable discontinuities.',

      'Continuity can determine unknown parameters.',
      'The parameter value comes from matching behavior at a junction.',
      'Multiple parameters may lead to systems of equations.',
      'Always verify the result in the original definition.',
    ],
    closing:
        'In the next lesson, continuity will guarantee the existence of values between two measurements.',
  ),
  CourseLessonData(
    id: 'continuidade-06-valor-intermediario',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 3',
    eyebrow: 'Lesson 6 of 7 • Existence',
    title: 'Intermediate Value Theorem',
    description:
        'Use continuity to guarantee values and locate roots on intervals.',
    duration: '≈ 36 min',
    objective: 'apply the Intermediate Value Theorem correctly',
    symbol: '∃',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A continuous function does not skip values',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'What the theorem guarantees',
            content:
                'If f is continuous on [a,b], then it takes every value N between f(a) and f(b). There is at least one c in [a,b] such that f(c)=N.',
            emphasis:
                'The theorem guarantees existence, but does not necessarily tell us where the point is or whether it is unique.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Detecting a sign change',
            content:
                'If a continuous system response changes from negative to positive, it crosses zero at some instant. Numerical methods use this guarantee to locate roots and equilibrium points.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Check the hypotheses',
        blocks: [
          WorkedExampleBlockData(
            title: 'Existence of a root',
            problem: 'f continuous on [1,2], f(1)=−3 and f(2)=4',
            steps: [
              'Confirm continuity on the entire closed interval.',
              'Notice that 0 lies between −3 and 4.',
              'Apply the Intermediate Value Theorem.',
            ],
            result: 'There is at least one c in (1,2) with f(c)=0.',
            interpretation:
                'We cannot claim that c=1.5 or that there is only one root.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Mathematical statement', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Values between f(a) and f(b)', content: 'If f is continuous on [a,b] and N lies between f(a) and f(b), then at least one c in [a,b] exists such that f(c)=N.', emphasis: 'The theorem guarantees existence, not uniqueness or the exact value of c.')]),
      LessonSectionData(number: '4', title: 'Bolzano as a special case', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'A sign change forces a root', content: 'If f is continuous on [a,b] and f(a) and f(b) have opposite signs, then at least one c in (a,b) satisfies f(c)=0.')]),
      LessonSectionData(number: '5', title: 'Existence of a root', blocks: [WorkedExampleBlockData(title: 'Without solving the equation', problem: 'Show that x³+x−1=0 has a root in (0,1).', steps: ['The polynomial is continuous.','f(0)=−1.','f(1)=1.','There is a sign change.'], result: 'At least one root exists in (0,1).', interpretation: 'The theorem proves existence without giving a closed formula for the root.')]),
      LessonSectionData(number: '6', title: 'What the theorem does not say', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Existence is not uniqueness', content: 'The IVT does not say there is only one c and does not locate c exactly. It also cannot be used without verifying continuity on the interval.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '7', title: 'Connection to numerical methods', blocks: [ConceptBlockData(visual: LessonVisual.engineering, title: 'Foundation for root finding', content: 'A sign change in a continuous function supports methods such as bisection, which repeatedly narrows an interval while preserving a root guaranteed by the theorem.', tone: LearningCardTone.information)]),
      LessonSectionData(number: '8', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The Intermediate Value Theorem is presented as a central consequence of continuity and a foundation for existence arguments.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'Does the IVT guarantee exactly one root when there is a sign change?',
      choices: ['Yes', 'No, it guarantees at least one', 'Only for polynomials'],
      correctIndex: 1,
      explanation:
          'The function may cross the axis several times; the theorem guarantees existence, not uniqueness.',
    ),
    takeaways: [
      'Continuity must hold on the whole closed interval.',
      'Every value between f(a) and f(b) is attained.',
      'A sign change guarantees at least one root.',
      'The theorem does not provide an exact location or uniqueness.',

      'The IVT guarantees that continuous functions attain every intermediate value.',
      'A sign change on a continuous interval guarantees at least one root.',
      'The theorem proves existence, not uniqueness.',
      'Numerical methods such as bisection exploit this guarantee.',
    ],
    closing:
        'The final lesson will combine the definition, domain, classification, and applications.',
  ),
  CourseLessonData(
    id: 'continuidade-07-sintese',
    topicId: 'continuidade',
    trailTitle: 'Continuity • Unit 3',
    eyebrow: 'Lesson 7 of 7 • Synthesis',
    title: 'A roadmap for analyzing continuity',
    description:
        'Choose a reliable strategy for points, intervals, and piecewise functions.',
    duration: '≈ 38 min',
    objective: 'diagnose and justify continuity problems',
    symbol: '✓',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Start with the type of problem',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Decision roadmap',
            content:
                '1) Find the domain. 2) If it is a familiar family, identify its continuous intervals. 3) At a special point, check the value and one-sided limits. 4) Classify the failure. 5) If there is a parameter, turn equality of the limits into an equation.',
            emphasis:
                'Write the justification: answering only “yes” or “no” is not enough.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Continuity in real models',
            content:
                'Continuous models represent quantities that vary without instantaneous jumps, such as idealized position, temperature, and deformation. Jumps may represent commands, impacts, or regime changes and must be handled deliberately.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Run a final check',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diagnosis at a point',
            problem: 'lim x→a f(x)=5 and f(a)=5',
            steps: [
              'The value f(a) exists.',
              'The two-sided limit exists and is finite.',
              'The limit matches the function value.',
            ],
            result: 'f is continuous at a.',
            interpretation:
                'The conclusion follows explicitly from the three conditions, not from a visual assumption.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Decision tree for continuity', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Ask in the right order', content: '1) Is the point in the domain? 2) Do the one-sided limits exist? 3) Do they agree? 4) Does the limit equal f(a)? 5) Is there a parameter or junction to adjust?')]),
      LessonSectionData(number: '4', title: 'Classify the failure', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Removable, jump, infinite, or oscillatory', content: 'After detecting a discontinuity, classify it. The classification indicates whether a simple redefinition can repair the function or whether the break is structural.')]),
      LessonSectionData(number: '5', title: 'Cumulative problem', blocks: [WorkedExampleBlockData(title: 'From definition to parameter', problem: 'f(x)=(x²−1)/(x−1) for x<1 and kx+1 for x≥1. Find k for continuity at 1.', steps: ['From the left, simplify to x+1 and get 2.','From the right and at the point, get k+1.','Require k+1=2.'], result: 'k=1.', interpretation: 'This combines a removable limit, a piecewise function, and a parameter.')]),
      LessonSectionData(number: '6', title: 'Continuity does not imply differentiability', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'A corner may still be continuous', content: 'The function |x| is continuous at x=0 but not differentiable there because the one-sided slopes disagree. Continuity is necessary for differentiability, but not sufficient.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '7', title: 'Bridge to derivatives', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'From stable values to instantaneous rate', content: 'A derivative is defined through a limit of difference quotients. Before studying instantaneous rates, it is essential to recognize stable and continuous behavior near the point.', emphasis: 'Next unit: differentiability and instantaneous rate.', tone: LearningCardTone.success)]),
      LessonSectionData(number: '8', title: 'Academic basis and final synthesis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The unit closes the progression limits → continuity → differentiability used in standard Calculus I courses.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'What is the first check when looking for intervals of continuity?',
      choices: ['The domain', 'The derivative', 'The largest coefficient'],
      correctIndex: 0,
      explanation:
          'A function can only be continuous at points where it is defined.',
    ),
    takeaways: [
      'The domain and function family guide the global analysis.',
      'At special points, apply the three conditions.',
      'One-sided limits classify jumps and infinite breaks.',
      'Continuity allows us to guarantee intermediate values.',

      'Continuity analysis starts with the domain and ends by comparing the limit with the function value.',
      'Classifying a discontinuity helps determine whether it can be repaired.',
      'The IVT turns continuity into an existence guarantee.',
      'Every differentiable function is continuous, but a continuous function need not be differentiable.',
    ],
    closing:
        'You completed the essential theory of Continuity. Now consolidate each decision through practice.',
  ),
];
