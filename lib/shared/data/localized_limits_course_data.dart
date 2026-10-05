import 'package:flutter/widgets.dart';

import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

List<CourseLessonData> localizedLimitsCourseLessons(Locale locale) {
  if (locale.languageCode != 'en') return limitsCourseLessons;

  return const [
    CourseLessonData(
      id: 'limites-01-intuicao',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 1',
      eyebrow: 'Lesson 1 of 8 • Core idea',
      title: 'Approach before calculating',
      description: 'Build intuition for limits and learn how to read each part of the notation.',
      duration: '≈ 38 min',
      objective: 'explain in your own words what a limit describes',
      symbol: 'lim',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Observe the behavior',
          subtitle: 'The point of interest guides the approach.',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.route,
              title: 'The road and the altitude',
              content: 'Imagine that x marks a car’s position and f(x) gives its altitude. As the car approaches kilometer 2, we observe which altitude the values of f(x) approach. That prediction is the limit.',
              emphasis: 'The car does not need to stop at kilometer 2: the limit studies behavior near the point.',
            ),
            ConceptBlockData(
              visual: LessonVisual.engineering,
              title: 'Why do engineers use limits?',
              content: 'Sensors record measurements at separate instants, but we often want to estimate instantaneous behavior. Limits connect successive approximations to the ideal value used in velocity, deformation, flow, and control.',
              tone: LearningCardTone.information,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Read the notation as a sentence',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.notation,
              title: 'lim x→a f(x) = L',
              content: 'We read: “the limit of f(x), as x approaches a, is L.” The expression x→a tells us the point of approach; f(x) is the observed quantity; L is the predicted value of the outputs.',
              emphasis: 'x approaches a does not necessarily mean x = a.',
            ),
            WorkedExampleBlockData(
              title: 'A first approximation',
              problem: 'f(x) = 2x + 1, as x→3',
              steps: [
                'Use values close to 3: 2.9, 2.99, 3.01, 3.1.',
                'Calculate the outputs: 6.8, 6.98, 7.02, 7.2.',
                'Notice that as x gets closer to 3, f(x) gets closer to 7.',
              ],
              result: 'Conclusion: lim x→3 (2x + 1) = 7.',
              interpretation: 'The numerical table supports the prediction that the output approaches 7.',
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'The limit and the function value are different ideas', blocks: [
          ConceptBlockData(visual: LessonVisual.compare, title: 'Behavior near a point can survive a hole', content: 'A function may be undefined at x=a and still have a limit as x approaches a. It may also have f(a) defined at a value different from the nearby trend.', emphasis: 'A limit describes a neighborhood; f(a) describes the point itself.'),
          WorkedExampleBlockData(title: 'A removable hole', problem: 'Let f(x)=(x²−1)/(x−1), for x≠1. What happens as x→1?', steps: ['Factor x²−1=(x−1)(x+1).','For x≠1, the expression equals x+1.','Values near 1 therefore produce outputs near 2.'], result: 'lim x→1 f(x)=2.', interpretation: 'This anticipates removable discontinuities.'),
        ]),
        LessonSectionData(number: '4', title: 'Three representations, one idea', blocks: [ConceptBlockData(visual: LessonVisual.table, title: 'Table, graph, and formula', content: 'Tables suggest numerical trends, graphs show geometry, and algebra provides justification and generalization. Strong limit reasoning moves among all three.', emphasis: 'Numerical evidence is useful but is not the same as an algebraic proof.')]),
        LessonSectionData(number: '5', title: 'How approach can fail', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Jump, blow-up, or oscillation', content: 'A finite limit may fail because the two sides approach different values, because outputs grow without bound, or because they oscillate without settling.', tone: LearningCardTone.warning)]),
        LessonSectionData(number: '6', title: 'Precision of approximation', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Closer inputs control closer outputs', content: 'The rigorous definition of limit makes precise the idea that f(x) can be forced close to L by taking x sufficiently close to a. Here the goal is to understand that relationship before a formal ε–δ treatment.', emphasis: 'Good intuition prepares for rigor.')]),
        LessonSectionData(number: '7', title: 'Conceptual reading', blocks: [WorkedExampleBlockData(title: 'Interpret before calculating', problem: 'If lim x→4 g(x)=10, what does that say?', steps: ['Take inputs increasingly close to 4 without requiring x=4.','Observe the corresponding outputs.','They can be made as close to 10 as desired by choosing inputs sufficiently close to 4.'], result: 'The limit describes a local trend, not necessarily g(4).', interpretation: 'This avoids a common Calculus I misconception.')]),
  
      LessonSectionData(
        number: '8',
        title: 'Cumulative example: table, graph, and expression',
        blocks: [
          WorkedExampleBlockData(
            title: 'Approach without direct substitution',
            problem: 'Estimate lim x→2 (x²−4)/(x−2) using values near 2.',
            steps: [
              'Choose x=1.9 and x=1.99 from the left.',
              'Choose x=2.1 and x=2.01 from the right.',
              'Evaluate the quotient at each value.',
              'Observe that the results approach 4.',
            ],
            result: 'The limit is 4 even though the original expression is undefined at x=2.',
            interpretation:
                'A limit describes behavior near a point; the function need not be defined exactly at that point.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'What a limit does not claim',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The limit and the function value are different information',
            content:
                'lim x→a f(x) may exist even if f(a) does not exist or has a different value. Equality between the limit and the function value is required only when discussing continuity.',
            emphasis:
                'Do not substitute x=a automatically before analyzing the structure of the function.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The organization emphasizes numerical, graphical, and algebraic interpretations before formal ε–δ rigor.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'To study lim x→4 f(x), which information matters most?',
        choices: [
          'Only the exact value of f(4).',
          'The behavior of f(x) for values near 4.',
          'The number of terms in the expression.',
        ],
        correctIndex: 1,
        explanation: 'The limit is determined by behavior around the point; f(4) may even be undefined.',
      ),
      takeaways: [
        'A limit describes a trend in the outputs of a function.',
        'The value at the point and the limit are related but different concepts.',
        'The notation identifies the observed function, the point of approach, and the predicted value.',

        'A limit may exist even when the function is undefined at the point.',
        'Tables, graphs, and algebra provide complementary evidence.',
        'Approach can fail through jumps, unbounded behavior, or oscillation.',
        'The rigorous definition formalizes control of input and output closeness.',
      ],
      closing: 'In the next lesson, you will compare approaches from the left and from the right.',
    ),
    CourseLessonData(
      id: 'limites-02-laterais',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 1',
      eyebrow: 'Lesson 2 of 8 • Two directions',
      title: 'One-sided limits, tables, and graphs',
      description: 'Investigate a point from both sides and recognize when a limit does not exist.',
      duration: '≈ 40 min',
      objective: 'calculate one-sided limits and compare their results',
      symbol: '→',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Approach from the left and the right',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.compare,
              title: 'Two independent approaches',
              content: 'The left-hand limit uses values smaller than a, written x→a⁻. The right-hand limit uses values larger than a, written x→a⁺. The two-sided limit exists only when both results are equal.',
              emphasis: 'lim x→a f(x) exists ⇔ both one-sided limits exist and are equal.',
            ),
            ConceptBlockData(
              visual: LessonVisual.graph,
              title: 'Read the graph without mixing up the points',
              content: 'Follow the curve as x approaches the point. An open circle may indicate the approached value; a filled point gives the actual function value. They do not need to be at the same height.',
              tone: LearningCardTone.information,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Recognize a jump',
          blocks: [
            WorkedExampleBlockData(
              title: 'Piecewise function',
              problem: 'f(x)=1 if x<0; and f(x)=3 if x≥0',
              steps: [
                'From the left of 0, all function values are 1.',
                'From the right of 0, all function values are 3.',
                'Compare the one-sided limits: 1 ≠ 3.',
              ],
              result: 'Conclusion: lim x→0 f(x) does not exist.',
              interpretation: 'The graph jumps from one height to another. The fact that f(0)=3 does not remove the mismatch between the sides.',
            ),
            ConceptBlockData(
              visual: LessonVisual.table,
              title: 'Use tables carefully',
              content: 'Choose values progressively closer to the point from both sides. Tables suggest behavior, but oscillatory phenomena may require algebraic or theoretical analysis.',
              emphasis: 'Do not conclude from only one value on the left and one on the right.',
              tone: LearningCardTone.warning,
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'Piecewise functions', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Use the correct rule on each side', content: 'For a piecewise function, the left-hand limit uses the expression valid for x<a and the right-hand limit uses the expression valid for x>a. The value at a does not determine either side.'), WorkedExampleBlockData(title: 'Two sides, two rules', problem: 'f(x)=x+2 for x<1 and f(x)=x²+1 for x≥1. Analyze x→1.', steps: ['From the left, x+2→3.','From the right, x²+1→2.','Since 3≠2, the one-sided limits disagree.'], result: 'The two-sided limit does not exist.', interpretation: 'Even though f(1)=2, the mismatch between the sides prevents the limit.')]),
        LessonSectionData(number: '4', title: 'Infinite one-sided limits', blocks: [ConceptBlockData(visual: LessonVisual.infinity, title: 'One side can grow without bound', content: 'For 1/x near zero, x→0⁺ gives positive unbounded growth while x→0⁻ gives negative unbounded growth.', emphasis: '+∞ and −∞ describe unbounded behavior; they are not real numbers.')]),
        LessonSectionData(number: '5', title: 'A graph-reading protocol', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Follow the curve, not an isolated point', content: 'For each side, trace the graph toward x=a and record the height being approached. Only then compare that trend with the filled point representing f(a).')]),
        LessonSectionData(number: '6', title: 'Reliable two-sided tables', blocks: [ConceptBlockData(visual: LessonVisual.table, title: 'Approach on progressively smaller scales', content: 'Use values such as a−0.1, a−0.01, a−0.001 and a+0.1, a+0.01, a+0.001. Progressive scaling helps distinguish a genuine trend from a numerical coincidence.')]),
        LessonSectionData(number: '7', title: 'Existence criterion', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Necessary and sufficient condition', content: 'A finite two-sided limit lim x→a f(x)=L exists exactly when both one-sided limits exist and equal L.', emphasis: 'This equivalence is central in continuity and piecewise functions.')]),
  
      LessonSectionData(
        number: '8',
        title: 'Examples of one-sided limits',
        blocks: [
          WorkedExampleBlockData(
            title: 'Jump in a piecewise function',
            problem: 'f(x)=1 for x<0 and f(x)=3 for x≥0. Analyze the limits at x=0.',
            steps: [
              'From the left, use f(x)=1.',
              'Thus lim x→0⁻ f(x)=1.',
              'From the right, use f(x)=3.',
              'Thus lim x→0⁺ f(x)=3.',
            ],
            result: 'Because 1≠3, the two-sided limit does not exist.',
            interpretation:
                'A two-sided limit requires agreement between the left and right limits.',
          ),
          WorkedExampleBlockData(
            title: 'Vertical asymptote with opposite signs',
            problem: 'Analyze 1/(x−2) as x approaches 2.',
            steps: [
              'From the left, x−2 is negative and very small.',
              'Therefore 1/(x−2)→−∞.',
              'From the right, x−2 is positive and very small.',
              'Therefore 1/(x−2)→+∞.',
            ],
            result:
                'The one-sided limits have opposite signs, so the two-sided limit does not exist.',
            interpretation:
                'Infinite limits must also be analyzed from each side.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Routine for piecewise functions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Choose the correct rule on each side',
            content:
                '1) identify the switching point; 2) use the rule valid on the left; 3) use the rule valid on the right; 4) compare the results; 5) only then conclude about the two-sided limit.',
            emphasis:
                'The value assigned exactly at the point does not change the one-sided limits.',
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The treatment follows the standard progression through graphs, tables, and piecewise functions.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'If lim x→2⁻ f(x)=5 and lim x→2⁺ f(x)=5, what can we conclude?',
        choices: [
          'The two-sided limit is 5.',
          'f(2) must be 5.',
          'The function is not defined at 2.',
        ],
        correctIndex: 0,
        explanation: 'Equal one-sided limits guarantee the two-sided limit. They do not determine f(2) by themselves.',
      ),
      takeaways: [
        'The symbol ⁻ means approach from the left and ⁺ from the right.',
        'A two-sided limit requires the two sides to agree.',
        'A filled point represents f(a); the nearby curve shows the approach.',
        'A jump creates different one-sided limits.',

        'Piecewise functions require the rule valid on each side.',
        'One-sided limits may be infinite.',
        'A two-sided limit exists only when both sides agree.',
        'The value f(a) is independent of the limit-existence criterion.',
      ],
      closing: 'Now that you can test whether a limit exists, we will use properties that make calculations faster.',
    ),
    CourseLessonData(
      id: 'limites-03-propriedades',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 1',
      eyebrow: 'Lesson 3 of 8 • Rules',
      title: 'Limit properties and direct substitution',
      description: 'Learn when direct substitution works and how to combine known limits safely.',
      duration: '≈ 40 min',
      objective: 'use algebraic limit properties and recognize continuous functions',
      symbol: 'L',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Combine existing limits',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.calculate,
              title: 'Sum, product, and power',
              content: 'If lim f(x)=L and lim g(x)=M, then the limit of the sum is L+M, the product is L·M, and a positive integer power is Lⁿ. For a quotient, we also need M≠0.',
              emphasis: 'These properties can be used only when the required limits exist.',
            ),
            ConceptBlockData(
              visual: LessonVisual.idea,
              title: 'Direct substitution follows from continuity',
              content: 'Polynomials are continuous for every real number, so their limit at a is found by evaluating the function at a. Rational functions follow the same rule wherever the denominator is nonzero.',
              tone: LearningCardTone.success,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Organize larger expressions',
          blocks: [
            WorkedExampleBlockData(
              title: 'Applying the properties',
              problem: 'lim x→2 (3x² − 4x + 5)',
              steps: [
                'The expression is a polynomial, so it is continuous at x=2.',
                'Substitute x=2: 3·(2²) − 4·2 + 5.',
                'Evaluate in the correct order: 12 − 8 + 5.',
              ],
              result: 'Result: the limit is 9.',
              interpretation: 'The limit laws justify evaluating each polynomial term directly.',
            ),
            ConceptBlockData(
              visual: LessonVisual.warning,
              title: 'A zero denominator stops the shortcut',
              content: 'For a rational function, substitute first. If the denominator is nonzero, you are done. If 0/0 appears, the form is indeterminate; if a nonzero number is divided by zero, investigate one-sided limits or infinite behavior.',
              emphasis: 'Not every division by zero represents the same situation.',
              tone: LearningCardTone.warning,
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'Limit laws', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Sum, difference, product, and quotient', content: 'If lim f(x)=L and lim g(x)=M, then limits distribute across sums, differences, and products. For a quotient, the result is L/M provided M≠0.', emphasis: 'The quotient law requires a nonzero limiting denominator.')]),
        LessonSectionData(number: '4', title: 'Powers, roots, and composition', blocks: [ConceptBlockData(visual: LessonVisual.calculate, title: 'Pass limits through continuous operations', content: 'Integer powers and domain-compatible roots preserve limits. If an outer function is continuous at the limiting value, the limit can pass through the composition.')]),
        LessonSectionData(number: '5', title: 'Polynomials and rational functions', blocks: [WorkedExampleBlockData(title: 'Justified direct substitution', problem: 'Compute lim x→2 (3x²−x+4).', steps: ['Polynomials are continuous for every real x.','Substitute x=2.','3·4−2+4=14.'], result: 'The limit is 14.', interpretation: 'Direct substitution works because the limit laws establish polynomial continuity.')]),
        LessonSectionData(number: '6', title: 'When quotients need care', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Denominator approaching zero', content: 'If the denominator tends to zero, the quotient law cannot be applied directly. Inspect the resulting form and choose another technique.', tone: LearningCardTone.warning)]),
        LessonSectionData(number: '7', title: 'Squeeze theorem', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Trap a function between two others', content: 'If g(x)≤f(x)≤h(x) near a and both g and h tend to L, then f also tends to L. This theorem will justify the fundamental trigonometric limit.')]),
  
      LessonSectionData(
        number: '8',
        title: 'Combined use of limit laws',
        blocks: [
          WorkedExampleBlockData(
            title: 'Limit of an expression built from several operations',
            problem:
                'If lim x→a f(x)=2 and lim x→a g(x)=−1, find lim x→a [3f(x)²−2g(x)].',
            steps: [
              'Use the power law: f(x)²→4.',
              'Multiply by 3 to get 12.',
              'Since g(x)→−1, −2g(x)→2.',
              'Add the limits.',
            ],
            result: 'The limit is 14.',
            interpretation:
                'Limit laws break a complex expression into simpler operations.',
          ),
          WorkedExampleBlockData(
            title: 'When the quotient law cannot be used directly',
            problem:
                'If lim x→a f(x)=5 and lim x→a g(x)=0, can we immediately determine lim f(x)/g(x)?',
            steps: [
              'The quotient law requires a nonzero denominator limit.',
              'Here g(x)→0.',
              'We must investigate signs, relative growth, or one-sided limits.',
            ],
            result: 'There is no automatic conclusion from the quotient law.',
            interpretation:
                'Limit laws have hypotheses that must be checked.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Direct substitution and continuity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Why substitution works so often',
            content:
                'Polynomials and other elementary functions are continuous on their domains. At such points, the limit can be found by evaluating the function directly.',
            emphasis:
                'Direct substitution is a consequence of continuity, not an unconditional universal rule.',
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. Limit laws are treated as the operational foundation for continuity and derivatives.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'Which limit can be solved immediately by direct substitution?',
        choices: [
          'lim x→2 (x²−4)/(x−2)',
          'lim x→1 (x²+3x)/(x+2)',
          'lim x→0 1/x',
        ],
        correctIndex: 1,
        explanation: 'At x=1, the denominator x+2 is 3. The rational function is continuous there.',
      ),
      takeaways: [
        'Polynomials allow direct substitution at every real number.',
        'Rational functions allow direct substitution where the denominator is nonzero.',
        'Sum, product, and power preserve existing limits.',
        '0/0 is a signal to transform the expression.',

        'Limit laws combine limits that are already known.',
        'The quotient law requires a nonzero limiting denominator.',
        'Polynomials allow direct substitution at every real point.',
        'The squeeze theorem determines limits by comparison.',
      ],
      closing: 'The next lesson focuses on 0/0 cases resolved through factoring.',
    ),
    CourseLessonData(
      id: 'limites-04-fatoracao',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 2',
      eyebrow: 'Lesson 4 of 8 • Indeterminate form',
      title: 'Factoring reveals the hidden limit',
      description: 'Rewrite equivalent expressions to remove factors responsible for the 0/0 form.',
      duration: '≈ 40 min',
      objective: 'solve indeterminate limits using common factors and special products',
      symbol: '0/0',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Interpret 0/0 correctly',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.warning,
              title: 'Indeterminate is not an answer',
              content: 'When numerator and denominator both approach zero, different functions can have completely different limits. So 0/0 only tells us that the current form does not reveal the behavior.',
              emphasis: 'Never conclude “the limit is zero” just because you found 0/0.',
              tone: LearningCardTone.warning,
            ),
            ConceptBlockData(
              visual: LessonVisual.transform,
              title: 'Look for a common factor',
              content: 'Special products often create the same factor in numerator and denominator. After factoring, simplify that factor for x different from the target point. This is valid because a limit studies nearby values, not exact substitution.',
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Solve and justify each step',
          blocks: [
            WorkedExampleBlockData(
              title: 'Difference of squares',
              problem: 'lim x→2 (x² − 4)/(x − 2)',
              steps: [
                'Substitute x=2 and identify the 0/0 form.',
                'Factor x²−4 as (x−2)(x+2).',
                'For x≠2, simplify the factor x−2.',
                'Evaluate lim x→2 (x+2) by substitution.',
              ],
              result: 'Result: 4.',
              interpretation: 'The simplified expression has the same behavior at every point near 2.',
            ),
            WorkedExampleBlockData(
              title: 'Factorable trinomial',
              problem: 'lim x→3 (x² − 5x + 6)/(x − 3)',
              steps: [
                'Factor the numerator: x²−5x+6=(x−2)(x−3).',
                'Simplify x−3 for x≠3.',
                'Evaluate x−2 as x→3.',
              ],
              result: 'Result: 1.',
              interpretation: 'Recognizing the trinomial roots turns an indeterminate fraction into a linear function.',
            ),
          ],
        ),
        LessonSectionData(
          number: '3',
          title: 'Do not cancel terms',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.warning,
              title: 'Cancellation requires factors',
              content: 'You can cancel only quantities that multiply the entire numerator and denominator. Terms separated by addition or subtraction are not factors.',
              emphasis: 'Factor first; simplify second.',
              tone: LearningCardTone.warning,
            ),
          ],
        ),

        LessonSectionData(number: '4', title: '0/0 is an indeterminate form', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'It is not an answer', content: 'Getting 0/0 after substitution does not mean the limit is zero, infinite, or nonexistent. It only says the original expression has not yet revealed its behavior.', emphasis: 'An indeterminate form is a diagnosis, not a result.', tone: LearningCardTone.warning)]),
        LessonSectionData(number: '5', title: 'Equivalence on a punctured neighborhood', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Why cancellation is legitimate', content: 'When x→a, we care about values arbitrarily near a. If two expressions agree for x≠a near the point, they have the same limiting behavior there.', emphasis: 'This justifies canceling a common factor after factoring.')]),
        LessonSectionData(number: '6', title: 'Useful factoring patterns', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Recognize structure', content: 'Difference of squares, trinomials, common factors, and sums or differences of cubes occur frequently. The goal is to expose the factor causing numerator and denominator to vanish.'), WorkedExampleBlockData(title: 'Difference of cubes', problem: 'Compute lim x→2 (x³−8)/(x−2).', steps: ['Factor x³−8=(x−2)(x²+2x+4).','Cancel x−2 for x≠2.','Substitute x=2 in the remaining expression.'], result: 'The limit is 12.', interpretation: 'Factoring reveals the nearby behavior hidden by the original form.')]),
        LessonSectionData(number: '7', title: 'A hole and a redefined value', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Geometry of simplification', content: 'After a common factor is canceled, the original graph often matches the simplified graph except for a possible hole at the troublesome point. The limit is the height of that hole.')]),
  
      LessonSectionData(
        number: '8',
        title: 'Factoring different algebraic patterns',
        blocks: [
          WorkedExampleBlockData(
            title: 'Difference of cubes',
            problem: 'Evaluate lim x→2 (x³−8)/(x−2).',
            steps: [
              'Use x³−8=(x−2)(x²+2x+4).',
              'Cancel x−2 only for x≠2.',
              'Evaluate x²+2x+4 at x=2.',
            ],
            result: 'The limit is 12.',
            interpretation:
                'Factoring reveals the function that agrees with the original one near x=2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Choosing a factoring strategy',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Recognize the pattern before expanding',
            content:
                'A 0/0 indeterminate form involving polynomials often suggests a common factor, difference of squares, quadratic trinomial, or sum/difference of cubes. Expanding without a purpose can hide the factor that must be canceled.',
            emphasis:
                'The algebraic technique should respond to the structure of the indeterminate form.',
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. Factoring is presented as an algebraic technique justified by punctured-neighborhood reasoning.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'After factoring (x²−9)/(x−3), which expression describes the behavior for x≠3?',
        choices: ['x−3', 'x+3', '1'],
        correctIndex: 1,
        explanation: 'x²−9=(x−3)(x+3). Simplifying the factor x−3 leaves x+3.',
      ),
      takeaways: [
        '0/0 indicates an indeterminate form, not a result.',
        'Difference of squares: a²−b²=(a−b)(a+b).',
        'Trinomials may reveal the factor that makes the denominator zero.',
        'Cancellation happens only between factors.',

        '0/0 is an indeterminate form requiring further analysis.',
        'Equivalent expressions for x≠a share the same limit when they agree near a.',
        'Differences of squares and cubes are common limit patterns.',
        'Factoring often reveals a removable discontinuity geometrically.',
      ],
      closing: 'Not every indeterminate form is polynomial. Next, we will use conjugates with radicals.',
    ),
    CourseLessonData(
      id: 'limites-05-racionalizacao',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 2',
      eyebrow: 'Lesson 5 of 8 • Radicals',
      title: 'Rationalization with conjugates',
      description: 'Remove indeterminate forms involving radicals without changing the expression’s value.',
      duration: '≈ 40 min',
      objective: 'identify conjugates and rationalize numerators or denominators',
      symbol: '√',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Use the difference of squares',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.transform,
              title: 'The conjugate changes the sign',
              content: 'The conjugate of √A−√B is √A+√B. Multiplying them gives (√A−√B)(√A+√B)=A−B, removing the radicals from that part of the expression.',
              emphasis: 'Multiply numerator and denominator by the same conjugate to preserve equivalence.',
            ),
            ConceptBlockData(
              visual: LessonVisual.warning,
              title: 'Rationalize the side causing the indeterminate form',
              content: 'Sometimes the radical is in the numerator; other times it is in the denominator. Identify where subtraction of radicals produces zero and use the corresponding conjugate.',
              tone: LearningCardTone.information,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Follow the simplification',
          blocks: [
            WorkedExampleBlockData(
              title: 'Radical in the numerator',
              problem: 'lim x→0 (√(x+4) − 2)/x',
              steps: [
                'Substitution gives (2−2)/0=0/0.',
                'Multiply by (√(x+4)+2)/(√(x+4)+2).',
                'In the numerator, use the difference of squares: (x+4)−4=x.',
                'Simplify x and evaluate 1/(√(x+4)+2) at x=0.',
              ],
              result: 'Result: 1/4.',
              interpretation: 'The conjugate reveals an equivalent expression that is continuous near zero.',
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'Why the conjugate works', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: '(A−B)(A+B)=A²−B²', content: 'Multiplying by a conjugate converts a difference involving square roots into an algebraic difference. The fraction is preserved because numerator and denominator are multiplied by the same factor.')]),
        LessonSectionData(number: '4', title: 'Rationalize numerator or denominator', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'The location of the radical determines the move', content: 'Apply the conjugate to the part producing the indeterminate form. Sometimes that is the numerator, sometimes the denominator.', emphasis: 'There is no “always rationalize the denominator” rule for limits.')]),
        LessonSectionData(number: '5', title: 'Radical in the numerator', blocks: [WorkedExampleBlockData(title: 'The conjugate exposes the hidden factor', problem: 'Compute lim x→0 (√(1+x)−1)/x.', steps: ['Substitution gives 0/0.','Multiply by √(1+x)+1 over itself.','The numerator becomes x.','Cancel x for x≠0.'], result: 'The limit is 1/2.', interpretation: 'The conjugate produces a form where direct substitution works.')]),
        LessonSectionData(number: '6', title: 'Domain and approach', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Radicals restrict the domain', content: 'For real square roots, determine from which sides the point can be approached while remaining in the domain. At boundary points, only one one-sided limit may be meaningful.', tone: LearningCardTone.warning)]),
        LessonSectionData(number: '7', title: 'Factoring or conjugate?', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Structural diagnosis', content: 'If the indeterminacy comes from polynomial factors, try factoring. If it comes from a difference of square roots, the conjugate is usually natural. Some problems require both.')]),
  
      LessonSectionData(
        number: '8',
        title: 'Two rationalization examples',
        blocks: [
          WorkedExampleBlockData(
            title: 'Radical in the numerator',
            problem: 'Evaluate lim x→0 [√(4+x)−2]/x.',
            steps: [
              'Multiply by the conjugate √(4+x)+2.',
              'The numerator becomes x.',
              'Cancel x for x≠0.',
              'Evaluate 1/[√(4+x)+2] at x=0.',
            ],
            result: 'The limit is 1/4.',
            interpretation:
                'The conjugate turns a difference of radicals into a simpler algebraic expression.',
          ),
          WorkedExampleBlockData(
            title: 'Radical in the denominator',
            problem: 'Evaluate lim x→9 (x−9)/(√x−3).',
            steps: [
              'Multiply numerator and denominator by √x+3.',
              'Use (√x−3)(√x+3)=x−9.',
              'Cancel x−9.',
              'Evaluate √x+3 at x=9.',
            ],
            result: 'The limit is 6.',
            interpretation:
                'Rationalization can expose a simplification hidden in the original form.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'When to use the conjugate',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Look for differences involving radicals',
            content:
                'The conjugate is especially useful when substitution gives 0/0 and square roots appear in a sum or difference. After rationalizing, look for common factors that can be canceled.',
            emphasis:
                'Rationalization is an equivalent algebraic transformation on the allowed inputs.',
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. Rationalization is treated as an algebraic tool for removing indeterminate forms involving radicals.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'What is the conjugate of √(x+1) − 3?',
        choices: ['√(x+1) + 3', '−√(x+1) + 3', '√(x−1) + 3'],
        correctIndex: 0,
        explanation: 'Keep both terms and change only the sign between them.',
      ),
      takeaways: [
        'Conjugates turn products into differences of squares.',
        'Multiply the fraction by a ratio equal to 1.',
        'Simplify only after expanding the product.',
        'At the end, return to direct substitution.',

        'The conjugate uses the difference-of-squares identity.',
        'Rationalize the part responsible for the indeterminate form.',
        'Radical domains can make an approach one-sided.',
        'Factoring and rationalization may occur in the same problem.',
      ],
      closing: 'The final major technique examines behavior as x grows without bound.',
    ),
    CourseLessonData(
      id: 'limites-06-infinito',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 3',
      eyebrow: 'Lesson 6 of 8 • Long-term behavior',
      title: 'Limits at infinity and asymptotes',
      description: 'Compare dominant terms to predict the behavior of rational functions.',
      duration: '≈ 42 min',
      objective: 'calculate limits at infinity and interpret horizontal asymptotes',
      symbol: '∞',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Identify what dominates',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.infinity,
              title: 'Highest-degree terms control growth',
              content: 'When |x| becomes very large, x² dominates x and constants; x³ dominates x². For rational functions, compare the highest degrees of numerator and denominator.',
              emphasis: 'Dividing every term by the highest power in the denominator makes the comparison explicit.',
            ),
            ConceptBlockData(
              visual: LessonVisual.graph,
              title: 'Three fundamental cases',
              content: 'If the numerator degree is smaller, the limit is 0. If the degrees are equal, the limit is the ratio of leading coefficients. If the numerator degree is larger, the function does not approach a finite value.',
              tone: LearningCardTone.information,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Calculate without huge numbers',
          blocks: [
            WorkedExampleBlockData(
              title: 'Equal degrees',
              problem: 'lim x→∞ (3x² − x + 4)/(2x² + 5)',
              steps: [
                'The highest degree in the denominator is 2. Divide every term by x².',
                'Obtain (3 − 1/x + 4/x²)/(2 + 5/x²).',
                'As x→∞, 1/x and 1/x² approach zero.',
                'The ratio 3/2 remains.',
              ],
              result: 'Result: 3/2.',
              interpretation: 'The line y=3/2 is a horizontal asymptote: the graph approaches it in the long run.',
            ),
            ConceptBlockData(
              visual: LessonVisual.engineering,
              title: 'Steady-state interpretation',
              content: 'In control and circuit models, a limit at infinity can represent the stabilized value of a response over time. The asymptote describes that steady state.',
              tone: LearningCardTone.success,
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'A limit at infinity is not an infinite limit', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Two different questions', content: 'In lim x→∞ f(x), the input grows without bound. In lim x→a f(x)=∞, the input approaches a finite number while the output grows without bound. These behaviors must not be confused.')]),
        LessonSectionData(number: '4', title: 'Rational functions and degree', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Compare leading terms', content: 'For P(x)/Q(x): if deg P<deg Q, the limit is 0; if the degrees are equal, the limit is the ratio of leading coefficients; if deg P>deg Q, there is no finite horizontal asymptote determined by degree comparison alone.'), WorkedExampleBlockData(title: 'Equal degrees', problem: 'Compute lim x→∞ (3x²−1)/(2x²+5x).', steps: ['Divide numerator and denominator by x².','Terms containing 1/x and 1/x² go to zero.','The leading coefficients 3 and 2 remain.'], result: 'The limit is 3/2.', interpretation: 'Thus y=3/2 is a horizontal asymptote as x→∞.')]),
        LessonSectionData(number: '5', title: 'Horizontal asymptotes', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Far-field behavior', content: 'If f(x)→L as x→∞ or x→−∞, then y=L is a horizontal asymptote in that direction. A graph may cross a horizontal asymptote and still approach it in the long run.')]),
        LessonSectionData(number: '6', title: 'Vertical asymptotes', blocks: [ConceptBlockData(visual: LessonVisual.infinity, title: 'Unbounded growth near a finite point', content: 'If at least one one-sided limit grows to +∞ or −∞ as x→a, then x=a is a vertical asymptote in the corresponding direction.')]),
        LessonSectionData(number: '7', title: 'Signs at infinity', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Track parity and sign', content: 'When dividing by powers of x or comparing dominant terms, keep track of signs as x→−∞. Even and odd powers behave differently.', tone: LearningCardTone.warning)]),
  
      LessonSectionData(
        number: '8',
        title: 'Comparing growth rates',
        blocks: [
          WorkedExampleBlockData(
            title: 'Different polynomial degrees',
            problem: 'Evaluate lim x→∞ (3x²−1)/(2x³+x).',
            steps: [
              'Divide numerator and denominator by x³.',
              'The numerator becomes 3/x−1/x³.',
              'The denominator approaches 2.',
              'The numerator approaches 0.',
            ],
            result: 'The limit is 0.',
            interpretation:
                'When the denominator has larger degree, its growth dominates.',
          ),
          WorkedExampleBlockData(
            title: 'Horizontal asymptote',
            problem: 'Evaluate lim x→∞ (5x²+1)/(2x²−3).',
            steps: [
              'Divide every term by x².',
              'The terms 1/x² and 3/x² approach zero.',
              'The ratio of leading coefficients remains.',
            ],
            result: 'The limit is 5/2.',
            interpretation:
                'Equal degrees produce a horizontal asymptote given by the ratio of leading coefficients.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Infinity is not a real number',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Interpret the notation correctly',
            content:
                'Writing f(x)→∞ describes unbounded growth; it does not mean the function reaches a real number called infinity. Algebraic shorthand involving ∞ represents limiting behavior.',
            emphasis:
                'Do not treat ∞ as an ordinary real value.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The focus is asymptotic behavior, degree comparison, and geometric interpretation.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'What is lim x→∞ (5x+1)/(x²+2)?',
        choices: ['0', '5', '∞'],
        correctIndex: 0,
        explanation: 'The denominator has degree 2 and grows faster than the degree-1 numerator.',
      ),
      takeaways: [
        'Compare degrees before doing algebra.',
        'A lower degree in the numerator gives limit zero.',
        'Equal degrees give the ratio of leading coefficients.',
        'Finite limits at infinity indicate horizontal asymptotes.',

        'Limits at infinity and infinite limits describe different phenomena.',
        'For rational functions, leading terms control far-field behavior.',
        'Finite limits at infinity identify horizontal asymptotes.',
        'Unbounded behavior near a finite point is tied to vertical asymptotes.',
      ],
      closing: 'In the next lesson, you will study the fundamental trigonometric limits.',
    ),
    CourseLessonData(
      id: 'limites-07-trigonometricos',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 3',
      eyebrow: 'Lesson 7 of 8 • Trigonometry',
      title: 'Fundamental trigonometric limits',
      description: 'Understand why sin(x)/x approaches 1 and learn how to adapt this pattern.',
      duration: '≈ 42 min',
      objective: 'recognize and apply trigonometric limits in radians',
      symbol: 'sin',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Angular units matter',
          subtitle: 'The fundamental limit requires angles measured in radians.',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.idea,
              title: 'The sin(u)/u pattern',
              content: 'As u approaches zero in radians, sin(u) and u become increasingly close. Therefore, the ratio sin(u)/u approaches 1 even though direct substitution gives 0/0.',
              emphasis: 'lim u→0 sin(u)/u = 1 only in the compatible form and with u measured in radians.',
            ),
            ConceptBlockData(
              visual: LessonVisual.graph,
              title: 'Why does the result make sense?',
              content: 'Near zero, the graph of y=sin(x) nearly coincides with the line y=x. This geometric approximation explains why the ratio of the two expressions approaches 1.',
              tone: LearningCardTone.information,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Build the fundamental form',
          blocks: [
            WorkedExampleBlockData(
              title: 'Adjusting the argument',
              problem: 'lim x→0 sin(3x)/x',
              steps: [
                'The sine argument is 3x, but the denominator is x.',
                'Multiply and divide by 3: sin(3x)/x = 3·sin(3x)/(3x).',
                'Let u=3x. As x→0, u→0 as well.',
                'Use lim u→0 sin(u)/u = 1.',
              ],
              result: 'Result: 3·1 = 3.',
              interpretation: 'The coefficient used to match the denominator remains outside the limit.',
            ),
            WorkedExampleBlockData(
              title: 'Cosine and conjugate',
              problem: 'lim x→0 (1−cos x)/x',
              steps: [
                'Substitution gives 0/0. Multiply by the conjugate 1+cos x.',
                'Use (1−cos x)(1+cos x)=1−cos²x=sin²x.',
                'Rewrite as [sin(x)/x]·[sin(x)/(1+cos x)].',
                'The first factor approaches 1 and the second approaches 0/2=0.',
              ],
              result: 'Result: 0.',
              interpretation: 'Trigonometric identities can reveal the hidden fundamental limit.',
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'Why radians are essential', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Degrees would change the constant', content: 'The limit lim x→0 sin(x)/x=1 assumes x is measured in radians. Radians connect arc length and angle without an artificial conversion factor.', emphasis: 'Calculus formulas for trigonometric limits and derivatives are naturally expressed in radians.')]),
        LessonSectionData(number: '4', title: 'Geometric idea of the fundamental limit', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Squeeze theorem', content: 'In the unit circle, comparisons among triangle and sector areas produce inequalities that trap sin(x)/x between expressions approaching 1. The squeeze theorem then gives the limit.')]),
        LessonSectionData(number: '5', title: 'Scaled versions', blocks: [WorkedExampleBlockData(title: 'Change of scale', problem: 'Compute lim x→0 sin(5x)/x.', steps: ['Write sin(5x)/x = 5·sin(5x)/(5x).','As x→0, 5x→0.','Use sin(u)/u→1.'], result: 'The limit is 5.', interpretation: 'The scale factor appears outside the fundamental limit.')]),
        LessonSectionData(number: '6', title: 'A cosine limit', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: '(1−cos x)/x', content: 'A conjugate-style manipulation shows lim x→0 (1−cos x)/x=0. This result appears in derivative proofs and local approximations.')]),
        LessonSectionData(number: '7', title: 'Simple substitutions', blocks: [ConceptBlockData(visual: LessonVisual.calculate, title: 'Transform to a known form', content: 'When sin(g(x))/g(x) appears and g(x)→0, set u=g(x) conceptually and apply the fundamental limit. Constant factors can be reorganized in the same way.')]),
  
      LessonSectionData(
        number: '8',
        title: 'Identities that reveal the limit',
        blocks: [
          WorkedExampleBlockData(
            title: 'Tangent divided by x',
            problem: 'Evaluate lim x→0 tan x/x.',
            steps: [
              'Write tan x=sin x/cos x.',
              'Rearrange as (sin x/x)·(1/cos x).',
              'Use lim sin x/x=1 and cos 0=1.',
            ],
            result: 'The limit is 1.',
            interpretation:
                'A new trigonometric limit can often be reduced to a known fundamental limit.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Angles must be measured in radians',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The fundamental limit depends on angular units',
            content:
                'The identity lim x→0 sin x/x=1 is valid when x is measured in radians. Degrees introduce a conversion factor.',
            emphasis:
                'Radians are the natural angular unit of trigonometric Calculus.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The sin(x)/x limit is motivated geometrically, justified with the squeeze theorem, and connected to later derivative formulas.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'What is lim x→0 sin(5x)/x?',
        choices: ['1', '5', '0'],
        correctIndex: 1,
        explanation: 'Write sin(5x)/x = 5·sin(5x)/(5x). The fundamental ratio approaches 1.',
      ),
      takeaways: [
        'The fundamental limit uses angles in radians.',
        'Try to build a ratio of the form sin(u)/u.',
        'Any denominator adjustment must be compensated outside the ratio.',
        'Identities and conjugates help with cosine expressions.',

        'The fundamental trigonometric limit assumes radians.',
        'The squeeze theorem provides a geometric justification for sin(x)/x→1.',
        'Scale factors can be reorganized to recover the fundamental form.',
        'Trigonometric limits are used directly in derivatives of sine and cosine.',
      ],
      closing: 'The final lesson combines algebraic techniques, one-sided limits, infinity, and trigonometry.',
    ),
    CourseLessonData(
      id: 'limites-08-sintese',
      topicId: 'limites',
      trailTitle: 'Limits • Unit 3',
      eyebrow: 'Lesson 8 of 8 • Synthesis',
      title: 'How to choose the right technique',
      description: 'Organize the module ideas into a reliable analysis method.',
      duration: '≈ 45 min',
      objective: 'diagnose a limit and justify the chosen technique',
      symbol: '?',
      sections: [
        LessonSectionData(
          number: '1',
          title: 'Follow a diagnostic sequence',
          blocks: [
            ConceptBlockData(
              visual: LessonVisual.checklist,
              title: 'A five-question roadmap',
              content: '1) Is it one-sided or two-sided? 2) Does direct substitution work? 3) Did 0/0 appear? 4) Are there polynomials to factor, radicals to rationalize, or a fundamental trigonometric form? 5) Does x approach infinity, requiring degree comparison?',
              emphasis: 'Choose the technique from the structure you find, not by random trial.',
            ),
            ConceptBlockData(
              visual: LessonVisual.warning,
              title: 'Review the meaning of the result',
              content: 'After calculating, ask whether the value agrees with the table, graph, or expected growth. An algebraic result without interpretation is harder to verify.',
              tone: LearningCardTone.warning,
            ),
          ],
        ),
        LessonSectionData(
          number: '2',
          title: 'Combine techniques when necessary',
          blocks: [
            WorkedExampleBlockData(
              title: 'Complete diagnosis',
              problem: 'lim x→1 (x²−1)/(√(x+3)−2)',
              steps: [
                'Substitution gives 0/0; the numerator can be factored and the denominator contains a radical.',
                'Factor x²−1=(x−1)(x+1).',
                'Rationalize the denominator using √(x+3)+2.',
                'The difference of squares turns the denominator into x−1.',
                'Simplify x−1 and substitute x=1 into the remaining expression.',
              ],
              result: 'Result: (1+1)(√4+2)=2·4=8.',
              interpretation: 'The problem requires recognizing two structures and combining them in the correct order.',
            ),
            ConceptBlockData(
              visual: LessonVisual.engineering,
              title: 'Limits as a modeling tool',
              content: 'In Engineering, limits evaluate stability, tolerances, numerical approximations, and model behavior near critical points. Algebra is the method; predicting the phenomenon is the goal.',
              tone: LearningCardTone.success,
            ),
          ],
        ),

        LessonSectionData(number: '3', title: 'Decision tree', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'From substitution to technique', content: 'Identify the kind of approach, then try direct substitution. If it produces a defined value, stop. If it gives 0/0, inspect factoring, conjugates, or a trigonometric limit. At infinity, analyze dominant terms and signs.', emphasis: 'Diagnosis reduces trial and error.')]),
        LessonSectionData(number: '4', title: 'Distinguish a form from a result', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: '0/0, ∞/∞, and zero denominators', content: 'Indeterminate forms are not answers. They signal that functions with the same initial form may have different limits, so the structure must be transformed or analyzed.', tone: LearningCardTone.warning)]),
        LessonSectionData(number: '5', title: 'Check multiple representations', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Validate the result', content: 'After the algebra, compare the answer with a graph, a table, or expected growth. In physical applications, also verify sign and units.')]),
        LessonSectionData(number: '6', title: 'Cumulative problem', blocks: [WorkedExampleBlockData(title: 'Technique selection without a hint', problem: 'Analyze lim x→0 (√(1+x)−1)/sin x.', steps: ['Direct substitution gives 0/0.','Rationalize the numerator to obtain x/(√(1+x)+1).','Rewrite x/sin x as the reciprocal of sin x/x.','Use √(1+x)+1→2 and sin x/x→1.'], result: 'The limit is 1/2.', interpretation: 'The problem combines rationalization and the fundamental trigonometric limit.')]),
        LessonSectionData(number: '7', title: 'Bridge to continuity and derivatives', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'Limits begin to organize Calculus', content: 'Continuity compares lim x→a f(x) with f(a). A derivative is born from the limit of a difference quotient. Limits are therefore not an isolated chapter but the language supporting the next concepts.', emphasis: 'Next step: turn limiting behavior into continuity.', tone: LearningCardTone.success)]),
  
      LessonSectionData(
        number: '8',
        title: 'Examples of choosing a technique',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diagnose before calculating',
            problem: 'Evaluate lim x→1 (x²−1)/(√x−1).',
            steps: [
              'Direct substitution gives 0/0.',
              'Factor x²−1=(x−1)(x+1).',
              'Rationalize √x−1 using √x+1.',
              'Use x−1=(√x−1)(√x+1) to cancel.',
            ],
            result: 'The limit is 4.',
            interpretation:
                'Some problems require combining techniques rather than choosing only one.',
          ),
          WorkedExampleBlockData(
            title: 'Two-sided limit from one-sided analysis',
            problem: 'Analyze lim x→0 |x|/x.',
            steps: [
              'For x<0, |x|=−x and the quotient is −1.',
              'For x>0, |x|=x and the quotient is 1.',
              'Compare the one-sided limits.',
            ],
            result: 'The two-sided limit does not exist.',
            interpretation:
                'Recognizing a piecewise structure can matter more than algebraic manipulation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Decision checklist',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'An efficient order of attack',
            content:
                '1) try direct substitution; 2) identify the indeterminate form; 3) consider factoring or rationalization; 4) inspect one-sided behavior when rules switch or denominators vanish; 5) compare growth at infinity; 6) look for fundamental trigonometric limits.',
            emphasis:
                'The method should match the structure of the problem, not a single keyword.',
          ),
        ],
      ),      LessonSectionData(number: '10', title: 'Academic basis and final synthesis', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'References', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; and Guidorizzi, Um Curso de Cálculo. The sequence follows the common international progression: interpretation → laws → algebraic techniques → infinity → trigonometry → continuity and derivative.', tone: LearningCardTone.information)]),
      ],
      check: LessonCheckData(
        question: 'A substitution gives 0/0 and the numerator is x²−a². Which first transformation is most promising?',
        choices: [
          'Factor as (x−a)(x+a).',
          'Declare that the limit is zero.',
          'Compare only the degrees.',
        ],
        correctIndex: 0,
        explanation: 'The difference of squares may reveal the factor responsible for the indeterminate form.',
      ),
      takeaways: [
        'Always begin by identifying the type of approach and trying direct substitution.',
        'Use factoring for polynomial structures and conjugates for radicals.',
        'At infinity, compare dominant terms.',
        'Interpret the result algebraically, graphically, or physically.',

        'The right technique follows from diagnosing the form of the limit.',
        'Indeterminate forms signal a need for transformation, not a final answer.',
        'Results should be checked algebraically, graphically, or numerically.',
        'Limits provide the foundation for continuity and derivatives.',
      ],
      closing: 'You completed the essential theory of Limits. Practice will now consolidate the decision process.',
    ),
  ];
}