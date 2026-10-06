import 'package:flutter/widgets.dart';

import 'equations_course_data.dart';
import '../domain/course_lesson_data.dart';

List<CourseLessonData> localizedEquationsCourseLessons(Locale locale) {
  if (locale.languageCode == 'en') {
    return _englishEquationsCourseLessons;
  }
  return equationsCourseLessons;
}

const List<CourseLessonData> _englishEquationsCourseLessons = [
  CourseLessonData(
    id: 'equations-01-equilibrio',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and inequalities',
    eyebrow: 'Equations',
    title: 'Equations, equality, and equivalence',
    description:
        'meaning of equality, solution sets, equivalent transformations, and verification',
    duration: '≈ 25 min',
    objective:
        'interpret an equation as a statement of equality, distinguish expressions from equations, understand solution sets, and apply equivalent transformations while preserving solutions',
    symbol: '=',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'An equation is a statement, not merely a calculation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Two members connected by equality',
            content:
                'An equation states that two expressions have the same value for particular values of the variables. In 2x+3=11, 2x+3 is the left-hand side and 11 is the right-hand side.',
            emphasis:
                'Solving means determining every value that makes the equality true.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Expression, identity, and equation',
            content:
                '2x+3 is an expression. 2(x+1)=2x+2 is an identity because it holds for every real x. 2x+3=11 is an equation because it holds only for particular x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Solution set',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Solutions belong to a specified universe',
            content:
                'The solution set contains all values in the chosen domain that make the equation true. The universe may be ℝ, ℤ, or another specified set.',
            emphasis:
                'A complete answer depends on the number system being used.',
          ),
          WorkedExampleBlockData(
            title: 'Checking a solution',
            problem: 'Check whether x=4 solves 3x−5=7.',
            steps: [
              'Substitute x=4: 3·4−5=12−5=7.',
              'The right-hand side is also 7.',
            ],
            result: 'x=4 is a solution.',
            interpretation:
                'Verification returns to the original equation rather than relying only on intermediate algebra.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Equivalent equations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Preserving the same solution set',
            content:
                'Two equations are equivalent when they have the same solution set in the chosen universe. Adding or subtracting the same expression from both sides preserves equivalence. Multiplying or dividing both sides by the same nonzero number also preserves equivalence.',
            emphasis:
                'Dividing by an expression that may be zero requires care because valid solutions can be lost.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'The balance principle',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Perform the same valid operation on both sides',
            content:
                'The balance metaphor is useful: when two sides are equal, applying the same valid transformation to both preserves equality.',
          ),
          WorkedExampleBlockData(
            title: 'Isolating the variable',
            problem: 'Solve 2x+5=17.',
            steps: [
              'Subtract 5 from both sides: 2x=12.',
              'Divide both sides by 2: x=6.',
              'Check: 2·6+5=17.',
            ],
            result: 'S={6}.',
            interpretation:
                'Every step produced an equation equivalent to the previous one.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Reversible and nonreversible operations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Not every transformation preserves equivalence in both directions',
            content:
                'Squaring both sides can introduce solutions. For example, x=−2 implies x²=4, but x²=4 also allows x=2. Such transformations require a final check.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'A transformation that creates an extra solution',
            problem:
                'Compare the solution sets of x=−2 and the equation obtained by squaring both sides.',
            steps: [
              'The original equation x=−2 has solution set S={−2}.',
              'Squaring both sides gives x²=4.',
              'The new equation has solutions x=−2 and x=2.',
              'Therefore the transformation produced an equation with an additional solution.',
            ],
            result:
                'x=−2 implies x²=4, but the two equations are not equivalent.',
            interpretation:
                'Nonreversible transformations require checking solutions in the original equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Modeling with equations',
        blocks: [
          WorkedExampleBlockData(
            title: 'Translating a situation',
            problem: 'A number increased by 7 equals 19. Find the number.',
            steps: [
              'Let x represent the unknown number.',
              'Translate: x+7=19.',
              'Subtract 7: x=12.',
              'Check: 12+7=19.',
            ],
            result: 'The number is 12.',
            interpretation:
                'An equation connects verbal language to a verifiable mathematical relation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent conceptual errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '“Move it across and change the sign” is only a shortcut',
            content:
                'The underlying rule is to add or subtract the same quantity on both sides. Understanding the operation prevents sign mistakes.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Never divide by zero',
            content:
                'Division by zero is undefined. Before dividing by a variable expression, check whether it can equal zero.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Justify each transformation',
            content:
                '1. Decide whether 3x+1 is an expression or an equation.\n'
                '2. Check whether x=2 solves 4x−1=7.\n'
                '3. Solve x+9=14.\n'
                '4. Solve 5x=30.\n'
                '5. Solve 3x−4=11.\n'
                '6. Explain why adding 6 to both sides preserves solutions.\n'
                '7. Explain why division by zero is forbidden.\n'
                '8. Find the solution set of 2x+3=2x+3.\n'
                '9. Find the solution set of 2x+3=2x+5.\n'
                '10. Give an example of an identity.\n'
                '11. Give an example of an equation with one real solution.\n'
                '12. Check the solution of 7−2x=1.\n'
                '13. Explain why squaring can introduce solutions.\n'
                '14. Model: “twice a number minus 3 is 9.”\n'
                '15. Distinguish an obtained solution from a verified solution.',
            emphasis:
                'For conceptual questions, answer with a complete mathematical statement.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Solving equations means finding intersections and zeros',
            content:
                'The equation f(x)=g(x) asks where two functions have equal values. The equation f(x)=0 asks for zeros. These ideas reappear in graphs, limits, derivatives, and optimization.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for zeros and intersections.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which operation always preserves equivalence in an equation?',
      choices: [
        'Add the same number to both sides',
        'Divide both sides by zero',
        'Square both sides without checking',
      ],
      correctIndex: 0,
      explanation:
          'Adding the same quantity to both sides preserves equality and the solution set.',
    ),
    takeaways: [
      'An equation is a statement of equality.',
      'Solutions make the equation true in the chosen universe.',
      'Equivalent equations have the same solution set.',
      'Operations on both sides must preserve equivalence.',
      'Some transformations require final verification.',
      'Solving equations connects algebra to functions and zeros.',
    ],
    closing:
        'Solving an equation means preserving equality logically until its solutions become explicit.',
  ),
  CourseLessonData(
    id: 'equations-02-primeiro-grau',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and inequalities',
    eyebrow: 'Linear equations',
    title: 'First-degree equations',
    description:
        'the form ax+b=c, isolating the unknown, coefficients, and interpretation',
    duration: '≈ 28 min',
    objective:
        'solve linear equations in one variable, interpret coefficients, organize terms, verify solutions, and model simple problems',
    symbol: 'ax+b=0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Linear form',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'The variable appears to the first power',
            content:
                'A linear equation in x can be written as ax+b=0 with real a and b and a ≠ 0. It then has exactly one real solution: x=−b/a.',
            emphasis:
                'The case a=0 must be handled separately because it is no longer a genuine linear equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Isolation step by step',
        blocks: [
          WorkedExampleBlockData(
            title: 'Positive coefficient',
            problem: 'Solve 4x−7=13.',
            steps: [
              'Add 7 to both sides: 4x=20.',
              'Divide both sides by 4: x=5.',
              'Check: 4·5−7=13.',
            ],
            result: 'S={5}.',
            interpretation:
                'The solution is the unique value that makes the equality true.',
          ),
          WorkedExampleBlockData(
            title: 'Negative coefficient',
            problem: 'Solve −3x+8=20.',
            steps: [
              'Subtract 8: −3x=12.',
              'Divide by −3: x=−4.',
              'Check: −3(−4)+8=20.',
            ],
            result: 'S={−4}.',
            interpretation:
                'Dividing an equation by a negative number preserves equality, unlike the inequality case.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Variable on both sides',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Collect variable terms and constants',
            content:
                'When x appears on both sides, use equivalent operations to collect variable terms on one side and constants on the other.',
          ),
          WorkedExampleBlockData(
            title: 'Variable on both sides',
            problem: 'Solve 5x−2=2x+10.',
            steps: [
              'Subtract 2x: 3x−2=10.',
              'Add 2: 3x=12.',
              'Divide by 3: x=4.',
            ],
            result: 'S={4}.',
            interpretation:
                'There is no need to “move” terms; equal operations are applied to both sides.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Equations with decimals',
        blocks: [
          WorkedExampleBlockData(
            title: 'Working with decimal coefficients',
            problem: 'Solve 0.2x+1.5=2.3.',
            steps: [
              'Subtract 1.5: 0.2x=0.8.',
              'Divide by 0.2: x=4.',
            ],
            result: 'S={4}.',
            interpretation:
                'Multiplying the entire equation by 10 first would also remove the decimals.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Linear modeling',
        blocks: [
          WorkedExampleBlockData(
            title: 'Fixed cost plus variable cost',
            problem: 'A ride costs R\$ 6 plus R\$ 2.50 per kilometer. If the total is R\$ 26, how many kilometers were traveled?',
            steps: [
              'Let x be the distance in kilometers.',
              'Model: 6+2.5x=26.',
              'Subtract 6: 2.5x=20.',
              'Divide by 2.5: x=8.',
            ],
            result: 'The ride covered 8 km.',
            interpretation:
                'The coefficient of x represents the price rate per kilometer.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Graphical interpretation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'A linear equation can represent an intersection',
            content:
                'Solving ax+b=c is equivalent to finding the x-coordinate where the line y=ax+b meets the horizontal line y=c.',
            emphasis:
                'The algebraic solution corresponds to an intersection coordinate on the graph.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Changing only one side',
            content:
                'Adding, subtracting, multiplying, or dividing only one side usually destroys equivalence.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Losing the sign of the coefficient',
            content:
                'In −4x=12, the solution is x=−3. The negative sign belongs to the coefficient and must remain in the division.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1',
            problem: 'Solve 7x+5=3x+21.',
            steps: [
              'Subtract 3x: 4x+5=21.',
              'Subtract 5: 4x=16.',
              'Divide by 4.',
            ],
            result: 'x=4.',
            interpretation:
                'Each step reduces complexity while preserving equivalence.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Solve 2.4x−1.2=6.',
            steps: [
              'Add 1.2: 2.4x=7.2.',
              'Divide by 2.4.',
            ],
            result: 'x=3.',
            interpretation:
                'Decimal coefficients do not change the algebraic logic.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and verify',
            content:
                '1. x+8=15.\n'
                '2. 3x=27.\n'
                '3. 4x−5=19.\n'
                '4. −2x+7=15.\n'
                '5. 5x+1=2x+16.\n'
                '6. 9−3x=18.\n'
                '7. 0.5x+2=7.\n'
                '8. 1.2x−0.6=3.\n'
                '9. 7x−4=7x+1.\n'
                '10. 6x+3=6x+3.\n'
                '11. Model: three times a number plus 2 equals 20.\n'
                '12. Model a fixed cost of 10 plus 4 per unit totaling 42.\n'
                '13. Explain the graphical meaning of ax+b=c.\n'
                '14. Check x=−3 in −4x=12.\n'
                '15. Explain why a ≠ 0 in ax+b=0.',
            emphasis:
                'In questions 9 and 10, determine whether there is one solution, no solution, or infinitely many solutions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Linearity is the first constant-rate model',
            content:
                'The function y=ax+b describes a constant rate. In Calculus, derivatives measure local rates and tangent lines provide linear approximations. Linear equations are basic language for those ideas.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for linear functions and approximation.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the solution of 3x−4=11?',
      choices: ['3', '5', '7'],
      correctIndex: 1,
      explanation:
          'Add 4 to both sides to get 3x=15, then divide by 3 to obtain x=5.',
    ),
    takeaways: [
      'A genuine linear equation has the form ax+b=0 with a ≠ 0.',
      'Isolating the variable requires equivalent operations.',
      'Variable terms may appear on both sides.',
      'Decimals do not change the algebraic logic.',
      'Linear models represent constant rates.',
      'The solution can be interpreted as a line intersection.',
    ],
    closing:
        'Solving a linear equation means transforming a relation until its unique compatible value is explicit.',
  ),
  CourseLessonData(
    id: 'equations-03-parenteses-fracoes',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Linear equations',
    title: 'Equations with parentheses and fractions',
    description:
        'distribution, denominators, least common multiples, and domain preservation',
    duration: '≈ 32 min',
    objective:
        'solve linear equations with parentheses and fractions, clear denominators safely, preserve restrictions, and organize the expression before isolating the unknown',
    symbol: 'x/3',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Prepare the structure before isolating x',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Simplify first to reduce errors',
            content:
                'When an equation contains parentheses, fractions, or several terms, organize the structure before isolating the variable. This may require distribution, combining like terms, or clearing denominators.',
            emphasis:
                'A visually complicated equation can often become an ordinary linear equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Parentheses and distribution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Distribute to every term',
            content:
                'In a(b+c)=ab+ac, the outside factor multiplies every inside term. A negative sign before parentheses means multiplication of the entire group by −1.',
            emphasis:
                'Removing parentheses incorrectly changes the equation.',
          ),
          WorkedExampleBlockData(
            title: 'Parentheses on both sides',
            problem: 'Solve 3(x+1)=2x+7.',
            steps: [
              'Distribute: 3x+3=2x+7.',
              'Subtract 2x from both sides: x+3=7.',
              'Subtract 3: x=4.',
              'Check in the original equation.',
            ],
            result: 'S={4}.',
            interpretation:
                'Distribution revealed a simple linear equation.',
          ),
          WorkedExampleBlockData(
            title: 'Negative sign before parentheses',
            problem: 'Solve 5−2(x−3)=9.',
            steps: [
              'Distribute −2: 5−2x+6=9.',
              'Combine constants: 11−2x=9.',
              'Subtract 11: −2x=−2.',
              'Divide by −2: x=1.',
            ],
            result: 'S={1}.',
            interpretation:
                'The sign inside the parentheses changes because of the negative outside factor.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Simple fractions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Multiplying by a denominator can simplify the equation',
            content:
                'If an equation contains a fraction such as x/5, multiplying every term on both sides by 5 removes that denominator without changing the solution set.',
            emphasis:
                'The multiplication must apply to every term on both sides.',
          ),
          WorkedExampleBlockData(
            title: 'One fraction',
            problem: 'Solve x/5+2=6.',
            steps: [
              'Subtract 2: x/5=4.',
              'Multiply both sides by 5.',
            ],
            result: 'x=20.',
            interpretation:
                'The fraction is removed through an equivalent operation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Several denominators and the LCM',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Use the least common multiple',
            content:
                'When several numerical denominators appear, multiplying the entire equation by their least common multiple clears all fractions at once.',
            emphasis:
                'The LCM reduces arithmetic clutter and helps prevent mistakes.',
          ),
          WorkedExampleBlockData(
            title: 'Clearing two denominators',
            problem: 'Solve x/3+x/4=7.',
            steps: [
              'LCM(3,4)=12.',
              'Multiply the entire equation by 12.',
              'Obtain 4x+3x=84.',
              'Thus 7x=84 and x=12.',
            ],
            result: 'S={12}.',
            interpretation:
                'The fractional equation was converted into an equivalent integer-coefficient equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Fractions with expressions in the numerator',
        blocks: [
          WorkedExampleBlockData(
            title: 'Grouped numerator',
            problem: 'Solve (x+2)/3=(2x−1)/5.',
            steps: [
              'LCM(3,5)=15.',
              'Multiply both sides by 15.',
              'Obtain 5(x+2)=3(2x−1).',
              'Distribute: 5x+10=6x−3.',
              'Solve to get x=13.',
            ],
            result: 'S={13}.',
            interpretation:
                'Clearing denominators can create parentheses that must then be distributed.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Variable denominators',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Determine the domain before multiplying',
            content:
                'When the variable appears in a denominator, values that make the denominator zero are forbidden and must be recorded before any simplification.',
            emphasis:
                'Multiplying by the denominator does not restore excluded values.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Domain restriction',
            problem: 'Solve 2/(x−1)=1, with x ≠ 1.',
            steps: [
              'Record x ≠ 1.',
              'Multiply both sides by x−1.',
              'Obtain 2=x−1.',
              'Add 1: x=3.',
              'Check the restriction.',
            ],
            result: 'S={3}.',
            interpretation:
                'The restriction belongs to the original equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'A general strategy',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Recommended order',
            content:
                '1) determine domain restrictions; 2) distribute when needed; 3) clear denominators; 4) combine like terms; 5) collect variable terms; 6) isolate the variable; 7) verify in the original equation.',
            emphasis:
                'The order may vary, but domain analysis and final verification should not be skipped.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplying only part of the equation by the LCM',
            content:
                'When clearing denominators, the chosen factor must multiply every term on both sides, not only the fractions.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelling terms inside a sum',
            content:
                'In (x+2)/x, x cannot be cancelled with only one term of the numerator. Cancellation requires common factors.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting domain restrictions',
            content:
                'If x=1 makes an original denominator zero, it remains forbidden even if the denominator disappears later.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — parentheses',
            problem: 'Solve 2(3x−1)+4=x+15.',
            steps: [
              'Distribute: 6x−2+4=x+15.',
              'Reduce: 6x+2=x+15.',
              'Subtract x: 5x+2=15.',
              'Subtract 2: 5x=13.',
            ],
            result: 'x=13/5.',
            interpretation:
                'A linear equation does not need to have an integer solution.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — fractions',
            problem: 'Solve (x−1)/2+(x+3)/4=5.',
            steps: [
              'LCM(2,4)=4.',
              'Multiply by 4: 2(x−1)+(x+3)=20.',
              'Distribute and combine: 3x+1=20.',
              'Thus 3x=19.',
            ],
            result: 'x=19/3.',
            interpretation:
                'Using the LCM keeps the calculation exact.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and verify',
            content:
                '1. 2(x+4)=18.\n'
                '2. 3(x−2)+5=14.\n'
                '3. 5−(x+1)=2.\n'
                '4. 4−2(3x−1)=10.\n'
                '5. x/3+2=7.\n'
                '6. x/4+x/2=9.\n'
                '7. (x+1)/2=5.\n'
                '8. (2x−3)/5=(x+1)/2.\n'
                '9. x/6−x/4=1.\n'
                '10. 2/(x−3)=1, with the proper domain.\n'
                '11. State the restriction for 1/(x+2)=3.\n'
                '12. Explain why the LCM must multiply every term.\n'
                '13. Solve 2(x−1)/3+x/2=5.\n'
                '14. Check the solution of (x+2)/3=(2x−1)/5.\n'
                '15. Explain why domain analysis comes before simplification.',
            emphasis:
                'For variable denominators, write the forbidden values first.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Fractions and restrictions appear throughout Calculus',
            content:
                'Rational functions, limits, and difference quotients require safe denominator manipulation. Recording the domain before simplifying directly prepares those topics.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for rational functions, domains, and limits.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the solution of x/5+2=6?',
      choices: ['4', '8', '20'],
      correctIndex: 2,
      explanation:
          'Subtract 2 to obtain x/5=4. Multiply both sides by 5 to get x=20.',
    ),
    takeaways: [
      'Parentheses require correct distribution before reduction.',
      'Fractions can be removed by multiplying the entire equation by a common denominator.',
      'The LCM is useful with several numerical denominators.',
      'Variable denominators create domain restrictions.',
      'Cancellation requires factors rather than terms in a sum.',
      'Solutions should be checked in the original equation.',
    ],
    closing:
        'Equations with parentheses and fractions become manageable when their structure is prepared before isolating the variable.',
  ),
  CourseLessonData(
    id: 'equations-04-casos-especiais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Linear equations',
    title: 'Special cases in linear equations',
    description:
        'one solution, no solution, infinitely many solutions, and algebraic and graphical interpretation',
    duration: '≈ 26 min',
    objective:
        'classify linear equations as having one solution, no solution, or infinitely many solutions, recognize identities and contradictions, and interpret each case graphically',
    symbol: '0=0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Not every linear equation ends with x = number',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Three possible outcomes',
            content:
                'After simplifying a linear equation, we may obtain a statement that determines x, a statement true for every allowed x, or an impossible statement.',
            emphasis:
                'The final simplified statement reveals the solution set.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Exactly one solution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'The variable coefficient remains nonzero',
            content:
                'When simplification leads to ax=b with a ≠ 0, there is exactly one solution: x=b/a.',
          ),
          WorkedExampleBlockData(
            title: 'The usual case',
            problem: 'Solve 3x+5=17.',
            steps: [
              'Subtract 5: 3x=12.',
              'Divide by 3: x=4.',
            ],
            result: 'S={4}.',
            interpretation:
                'The variable retained a nonzero coefficient, so the solution is unique.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Infinitely many solutions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The equation becomes an identity',
            content:
                'If all variable terms cancel and the remaining statement is always true, such as 0=0 or 5=5, then every allowed input satisfies the equation.',
            emphasis:
                'The two sides represent equivalent expressions.',
          ),
          WorkedExampleBlockData(
            title: 'A hidden identity',
            problem: 'Solve 2(x+3)=2x+6.',
            steps: [
              'Distribute: 2x+6=2x+6.',
              'Subtract 2x: 6=6.',
              'The statement is true regardless of x.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'The two expressions are equivalent for every real number.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'No solution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The equation becomes a contradiction',
            content:
                'If the variable disappears and a false statement remains, such as 0=4 or 3=−2, then no value can satisfy the equation.',
            emphasis:
                'The disappearance of x does not automatically mean infinitely many solutions; the remaining statement must be checked.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Contradiction',
            problem: 'Solve 4x+1=4x+7.',
            steps: [
              'Subtract 4x from both sides.',
              'Obtain 1=7.',
              'This statement is false.',
            ],
            result: 'S=∅.',
            interpretation:
                'No real number can make a contradiction true.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'General form ax+b=cx+d',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Compare coefficients',
            content:
                'From ax+b=cx+d we obtain (a−c)x=d−b. If a−c ≠ 0, there is one solution. If a−c=0, compare d−b with zero.',
            emphasis:
                'If a=c and b=d, there are infinitely many solutions. If a=c and b≠d, there is no solution.',
          ),
          WorkedExampleBlockData(
            title: 'Classify without fully solving',
            problem: 'Classify 7x−2=7x−2 and 7x−2=7x+4.',
            steps: [
              'In the first, both variable coefficients and constants match.',
              'In the second, variable coefficients match but constants do not.',
            ],
            result: 'First: infinitely many solutions. Second: no solution.',
            interpretation:
                'Structural comparison can predict the result before finishing the algebra.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Graphical interpretation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Intersections of lines',
            content:
                'Solving ax+b=cx+d means finding intersections of y=ax+b and y=cx+d. One intersection gives one solution; coincident lines give infinitely many solutions; distinct parallel lines give no solution.',
            emphasis:
                'Algebra and geometry describe the same three cases.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Domain still matters',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Identity on the domain, not necessarily on all reals',
            content:
                'If the original equation contains denominators or other restrictions, an identity obtained after simplification holds only on the original domain.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Identity with an excluded point',
            problem: 'Consider (x−1)/(x−1)=1.',
            steps: [
              'The original expression requires x ≠ 1.',
              'For every x ≠ 1, the left side simplifies to 1.',
            ],
            result: 'S=ℝ\\{1}.',
            interpretation:
                'The identity holds throughout the original domain, but the excluded point does not return.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reading 0=0 as x=0',
            content:
                '0=0 does not determine x. It means the equation is true for every allowed value.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reading 0=5 as x=5',
            content:
                '0=5 is a contradiction, so the solution set is empty.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring the domain in an identity',
            content:
                'Simplifying to 1=1 does not authorize values that were already forbidden by the original equation.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — identity',
            problem: 'Solve 3(x+2)=3x+6.',
            steps: [
              'Distribute: 3x+6=3x+6.',
              'Subtract 3x: 6=6.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'The equality is true for every real x.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — contradiction',
            problem: 'Solve 5(x−1)=5x+2.',
            steps: [
              'Distribute: 5x−5=5x+2.',
              'Subtract 5x: −5=2.',
            ],
            result: 'S=∅.',
            interpretation:
                'The final statement is impossible.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve or classify',
            content:
                '1. 2x+3=11.\n'
                '2. 4x−7=4x−7.\n'
                '3. 5x+2=5x−1.\n'
                '4. 3(x+4)=3x+12.\n'
                '5. 2(x−1)=2x+5.\n'
                '6. 7x−3=4x+9.\n'
                '7. 6x+1=6x+1.\n'
                '8. 8x−2=8x+10.\n'
                '9. Classify ax+b=ax+b.\n'
                '10. Classify ax+b=ax+d with b≠d.\n'
                '11. Interpret graphically an equation with no solution.\n'
                '12. Interpret graphically an equation with infinitely many solutions.\n'
                '13. Explain why 0=0 does not mean x=0.\n'
                '14. Solve (x−2)/(x−2)=1 while respecting the domain.\n'
                '15. Create one linear equation with one solution, one with no solution, and one with infinitely many solutions.',
            emphasis:
                'Always state the solution set explicitly.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Number of solutions means number of intersections',
            content:
                'Classifying equations prepares systems, function zeros, and graph intersections. In Calculus, the same logic appears when interpreting tangent equations, extrema, and critical points.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for graphical interpretation of equations and functions.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the solution set of 2(x+3)=2x+6?',
      choices: ['{0}', '∅', 'ℝ'],
      correctIndex: 2,
      explanation:
          'Distributing gives 2x+6=2x+6, an identity true for every real x.',
    ),
    takeaways: [
      'Linear equations may have one solution, no solution, or infinitely many solutions.',
      'A true statement after cancellation indicates an identity.',
      'A false statement after cancellation indicates a contradiction.',
      'The form ax+b=cx+d can be classified by comparing coefficients.',
      'Graphically, solutions correspond to intersections of lines.',
      'Original domain restrictions remain valid even for identities.',
    ],
    closing:
        'Special cases show that solving an equation also means deciding how many solutions exist and why.',
  ),
  CourseLessonData(
    id: 'equations-05-sistemas-lineares',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Linear systems',
    title: 'Systems of two linear equations',
    description:
        'solution as intersection, substitution, elimination, classification, and modeling',
    duration: '≈ 34 min',
    objective:
        'solve systems of two linear equations by substitution and elimination, interpret the solution as an intersection of lines, and classify systems as determined, inconsistent, or dependent',
    symbol: '{x+y',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'What is a linear system',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Two conditions must hold at the same time',
            content:
                'A linear system in two variables contains two equations that must be true simultaneously. A solution is an ordered pair (x,y) satisfying both.',
            emphasis:
                'Solving the system means finding the intersection of the two solution sets.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Graphical interpretation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Each linear equation represents a line',
            content:
                'In two variables, ax+by=c represents a line. The solution of the system is the point where the two lines intersect, when such an intersection exists.',
            emphasis:
                'One intersection: one solution. Distinct parallel lines: no solution. Coincident lines: infinitely many solutions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Substitution method',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Isolate one variable and substitute',
            content:
                'In substitution, solve one equation for one variable and insert that expression into the other equation. The system becomes a one-variable equation.',
          ),
          WorkedExampleBlockData(
            title: 'Substitution step by step',
            problem: 'Solve x+y=7 and x−y=1.',
            steps: [
              'From the first equation, x=7−y.',
              'Substitute into the second: (7−y)−y=1.',
              'Simplify: 7−2y=1.',
              'Then y=3.',
              'Substitute back: x=4.',
            ],
            result: '(x,y)=(4,3).',
            interpretation:
                'The ordered pair satisfies both equations simultaneously.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Elimination method',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Make one variable disappear',
            content:
                'In elimination, combine the equations so one variable has opposite coefficients. Adding the equations then removes that variable.',
          ),
          WorkedExampleBlockData(
            title: 'Direct elimination',
            problem: 'Solve 2x+y=8 and 3x−y=7.',
            steps: [
              'Add the equations: 5x=15.',
              'Thus x=3.',
              'Substitute into 2x+y=8.',
              'Then y=2.',
            ],
            result: '(x,y)=(3,2).',
            interpretation:
                'The coefficients +1 and −1 of y allowed immediate elimination.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'When an equation must be multiplied',
        blocks: [
          WorkedExampleBlockData(
            title: 'Preparing elimination',
            problem: 'Solve x+2y=7 and 3x+y=8.',
            steps: [
              'Multiply the second equation by −2: −6x−2y=−16.',
              'Add the first equation: −5x=−9.',
              'So x=9/5.',
              'Substitute into x+2y=7.',
              'Then y=13/5.',
            ],
            result: '(x,y)=(9/5,13/5).',
            interpretation:
                'A system does not need to have integer coordinates.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Classifying systems',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'One, none, or infinitely many solutions',
            content:
                'A determined system has one solution. An inconsistent system has no solution. A dependent system has infinitely many solutions.',
            emphasis:
                'Graphically: intersecting lines, distinct parallel lines, or coincident lines.',
          ),
          WorkedExampleBlockData(
            title: 'Inconsistent system',
            problem: 'Classify x+y=4 and 2x+2y=10.',
            steps: [
              'Double the first equation: 2x+2y=8.',
              'The second equation says 2x+2y=10.',
              'The two conditions are incompatible.',
            ],
            result: 'No solution.',
            interpretation:
                'The lines have the same slope and different intercepts.',
          ),
          WorkedExampleBlockData(
            title: 'Dependent system',
            problem: 'Classify x−2y=3 and 2x−4y=6.',
            steps: [
              'The second equation is exactly twice the first.',
              'They represent the same line.',
            ],
            result: 'Infinitely many solutions.',
            interpretation:
                'Every point on the line satisfies both equations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Modeling with systems',
        blocks: [
          WorkedExampleBlockData(
            title: 'Quantity problem',
            problem: 'Thirty tickets were sold as full-price or half-price. Full price is R\$ 20, half price is R\$ 10, and revenue was R\$ 450. How many of each were sold?',
            steps: [
              'Let x be full-price tickets and y be half-price tickets.',
              'Total count: x+y=30.',
              'Revenue: 20x+10y=450.',
              'Divide the second by 10: 2x+y=45.',
              'Subtract the first equation: x=15.',
              'Then y=15.',
            ],
            result: '15 full-price tickets and 15 half-price tickets.',
            interpretation:
                'The two equations encode two independent conditions from the same situation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Solving only one equation',
            content:
                'A value satisfying one equation is not automatically a system solution. The ordered pair must satisfy both.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Adding equations without preparing coefficients',
            content:
                'In elimination, the chosen variable must have cancelling coefficients. Arbitrary addition may not simplify the system.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Skipping verification',
            content:
                'Substitute the final pair into both original equations to confirm the solution.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — substitution',
            problem: 'Solve y=2x+1 and x+y=10.',
            steps: [
              'Substitute y: x+(2x+1)=10.',
              '3x+1=10.',
              'x=3.',
              'Then y=7.',
            ],
            result: '(3,7).',
            interpretation:
                'When one variable is already isolated, substitution is often efficient.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — elimination',
            problem: 'Solve 4x+3y=18 and 2x−3y=0.',
            steps: [
              'Add the equations: 6x=18.',
              'x=3.',
              'Substitute into 2x−3y=0.',
              'y=2.',
            ],
            result: '(3,2).',
            interpretation:
                'The y coefficients were already opposites.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve, classify, and interpret',
            content:
                '1. x+y=8 and x−y=2.\n'
                '2. 2x+y=9 and x−y=0.\n'
                '3. y=3x−2 and x+y=10.\n'
                '4. 3x+2y=12 and x−2y=4.\n'
                '5. x+2y=5 and 2x+4y=10.\n'
                '6. x+y=3 and 2x+2y=8.\n'
                '7. Classify two distinct parallel lines.\n'
                '8. Classify two coincident lines.\n'
                '9. Create a system with solution (2,1).\n'
                '10. Check whether (3,2) solves 2x+y=8 and x−y=1.\n'
                '11. Solve 5x−y=11 and 2x+y=7.\n'
                '12. Solve 2x+3y=13 and 4x−3y=5.\n'
                '13. Explain when substitution is more convenient.\n'
                '14. Explain when elimination is more convenient.\n'
                '15. Model a simple situation with two unknowns.',
            emphasis:
                'Always present the solution as an ordered pair and verify it in both equations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Connection to functions, geometry, and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Systems are intersection problems',
            content:
                'Linear systems connect algebra and analytic geometry. Later, intersections of curves, simultaneous conditions, and systems of equations appear in optimization, multivariable calculus, and modeling.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Thomas and Stewart for graphical interpretation and modeling.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the solution of x+y=7 and x−y=1?',
      choices: ['(3,4)', '(4,3)', '(7,1)'],
      correctIndex: 1,
      explanation:
          'Adding the equations gives 2x=8, so x=4. Substituting into x+y=7 gives y=3.',
    ),
    takeaways: [
      'A system solution satisfies every equation simultaneously.',
      'Substitution reduces the system using an isolated variable.',
      'Elimination removes a variable by combining equations.',
      'Systems may have one, no, or infinitely many solutions.',
      'Graphically, classification depends on how the lines intersect.',
      'Systems model situations with simultaneous conditions.',
    ],
    closing:
        'Solving a system means finding values that make several conditions true at the same time.',
  ),
  CourseLessonData(
    id: 'equations-06-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Quadratics',
    title: 'Quadratic equations',
    description:
        'general form, factoring, completing the square, quadratic formula, discriminant, and graph interpretation',
    duration: '≈ 40 min',
    objective:
        'solve quadratic equations by multiple methods, interpret the discriminant, relate roots to the parabola graph, recognize multiplicity, and select an appropriate strategy',
    symbol: 'ax²+bx+c',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definition and general form',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A quadratic equation in one variable',
            content:
                'A quadratic equation can be written as [[math:ax^2+bx+c=0]], with real a, b, and c and [[math:a\\ne0]]. If a=0, the quadratic term disappears and the equation is no longer second degree.',
            emphasis:
                'The degree is determined by the highest exponent after the expression is reduced.',
          ),
          WorkedExampleBlockData(
            title: 'Identifying coefficients',
            problem: 'In 3x²−7x+2=0, identify a, b, and c.',
            steps: [
              'Compare with ax²+bx+c=0.',
              'The coefficient of x² is 3.',
              'The coefficient of x is −7.',
              'The constant term is 2.',
            ],
            result: 'a=3, b=−7, c=2.',
            interpretation:
                'The sign belongs to the coefficient: b is −7, not 7.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'How many real solutions may exist',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Two, one, or no real roots',
            content:
                'A real quadratic equation may have two distinct real roots, one repeated real root, or no real roots. The discriminant determines which case occurs.',
            emphasis:
                'A root or zero is a value of x that makes the quadratic expression equal to zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Zero-product property and factoring',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'If AB=0, then A=0 or B=0',
            content:
                'The zero-product property turns a factored quadratic equation into simpler equations. This makes factoring efficient when the factors are recognizable.',
          ),
          WorkedExampleBlockData(
            title: 'Direct factoring',
            problem: 'Solve x²−5x+6=0.',
            steps: [
              'Find two numbers whose sum is −5 and product is 6: −2 and −3.',
              'Factor: (x−2)(x−3)=0.',
              'Apply the zero-product property.',
            ],
            result: 'S={2,3}.',
            interpretation:
                'Each root corresponds to a linear factor that becomes zero.',
          ),
          WorkedExampleBlockData(
            title: 'Common factor first',
            problem: 'Solve 2x²−8x=0.',
            steps: [
              'Factor the common factor: 2x(x−4)=0.',
              'Since 2 is nonzero, x=0 or x−4=0.',
            ],
            result: 'S={0,4}.',
            interpretation:
                'Check for a common factor before using more elaborate methods.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Equations of the form x²=k',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Taking square roots requires ±',
            content:
                'If x²=k with k>0, then [[math:x=\\pm\\sqrt{k}]]. If k=0, the only solution is x=0. If k<0, there is no real solution.',
            emphasis:
                '√k denotes the principal nonnegative root; ± appears because we are solving an equation.',
          ),
          WorkedExampleBlockData(
            title: 'Two symmetric roots',
            problem: 'Solve 4x²=36.',
            steps: [
              'Divide by 4: x²=9.',
              'Take square roots with both signs: x=±3.',
            ],
            result: 'S={−3,3}.',
            interpretation:
                'Both numbers have the same square.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Completing the square',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Create a perfect square',
            content:
                'Completing the square rewrites a quadratic into a form such as [[math:(x-h)^2=k]]. For x²+bx, add and subtract [[math:(b/2)^2]].',
            emphasis:
                'This method also leads directly to the vertex form of a parabola.',
          ),
          WorkedExampleBlockData(
            title: 'Completing the square step by step',
            problem: 'Solve x²+6x+5=0.',
            steps: [
              'Move 5: x²+6x=−5.',
              'Half of 6 is 3; its square is 9.',
              'Add 9 to both sides: x²+6x+9=4.',
              'Rewrite: (x+3)²=4.',
              'Take square roots: x+3=±2.',
            ],
            result: 'S={−5,−1}.',
            interpretation:
                'Completing the square reveals the hidden perfect-square structure.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Quadratic formula',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A general formula',
            content:
                'For [[math:ax^2+bx+c=0]], with [[math:a\\ne0]], the solutions are [[math:x=\\frac{-b\\pm\\sqrt{b^2-4ac}}{2a}]]. This formula is derived by completing the square in the general equation.',
            emphasis:
                'The formula does not replace algebraic understanding: coefficients must be identified with their correct signs.',
          ),
          WorkedExampleBlockData(
            title: 'Applying the formula',
            problem: 'Solve 2x²−3x−2=0.',
            steps: [
              'Identify a=2, b=−3, c=−2.',
              'Compute Δ=(−3)²−4·2·(−2)=25.',
              'Substitute: x=[3±5]/4.',
              'The two values are 2 and −1/2.',
            ],
            result: 'S={−1/2,2}.',
            interpretation:
                'A positive discriminant produced two distinct real roots.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Discriminant',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Δ=b²−4ac',
            content:
                'The quantity [[math:\\Delta=b^2-4ac]] determines the nature of the real roots. If Δ>0, there are two distinct real roots. If Δ=0, there is one repeated real root. If Δ<0, there are no real roots.',
            emphasis:
                'The discriminant tells us how many real roots exist before we calculate them.',
          ),
          WorkedExampleBlockData(
            title: 'Repeated root',
            problem: 'Analyze x²−6x+9=0.',
            steps: [
              'a=1, b=−6, c=9.',
              'Δ=36−36=0.',
              'Factor: (x−3)²=0.',
            ],
            result: 'x=3 with multiplicity 2.',
            interpretation:
                'The parabola touches the x-axis at one point.',
          ),
          WorkedExampleBlockData(
            title: 'No real roots',
            problem: 'Analyze x²+4x+8=0.',
            steps: [
              'a=1, b=4, c=8.',
              'Δ=16−32=−16.',
            ],
            result: 'There are no real roots.',
            interpretation:
                'The parabola does not intersect the x-axis over the reals.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Roots and the parabola graph',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Solving f(x)=0 means finding x-intercepts',
            content:
                'For f(x)=ax²+bx+c, the roots of f(x)=0 are exactly the x-coordinates where the parabola intersects the x-axis.',
            emphasis:
                'Two roots mean two intersections; a repeated root means tangency; no real root means no x-axis intersection.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Relations between roots and coefficients',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Sum and product of the roots',
            content:
                'If x₁ and x₂ are the roots of ax²+bx+c=0, then [[math:x_1+x_2=-\\frac{b}{a}]] and [[math:x_1x_2=\\frac{c}{a}]]. These relations follow from [[math:a(x-x_1)(x-x_2)]].',
            emphasis:
                'They are useful for checking solutions and reconstructing equations.',
          ),
          WorkedExampleBlockData(
            title: 'Checking with sum and product',
            problem: 'For x²−5x+6=0, verify the roots 2 and 3.',
            steps: [
              'Sum: 2+3=5=−b/a.',
              'Product: 2·3=6=c/a.',
            ],
            result: 'The relations confirm the roots.',
            interpretation:
                'This gives an independent structural check.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Choosing a method',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Not every quadratic needs the formula',
            content:
                'Use factoring when factors are clear, square-root extraction for forms like (x−h)²=k, completing the square to expose structure, and the quadratic formula when a general method is needed.',
            emphasis:
                'Method selection is part of algebraic competence.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting ±',
            content:
                'From x²=9 we get x=−3 and x=3, not only x=3.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Dropping the sign of b',
            content:
                'In 2x²−3x−2=0, b=−3. Using b=3 changes the discriminant and the formula.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Using zero product before setting the equation equal to zero',
            content:
                'The zero-product property applies only when a product equals zero.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — factoring',
            problem: 'Solve x²+x−12=0.',
            steps: [
              'Find numbers with sum 1 and product −12: 4 and −3.',
              'Factor: (x+4)(x−3)=0.',
            ],
            result: 'S={−4,3}.',
            interpretation:
                'Factoring is efficient when the integer pair is easy to recognize.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — quadratic formula',
            problem: 'Solve 3x²+x−1=0.',
            steps: [
              'a=3, b=1, c=−1.',
              'Δ=1−4·3·(−1)=13.',
              'Substitute into the formula.',
            ],
            result: '[[math:x=\\frac{-1\\pm\\sqrt{13}}{6}]].',
            interpretation:
                'When Δ is not a perfect square, exact radical form is usually preferable to decimals.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and justify the chosen method',
            content:
                '1. x²−9=0.\n'
                '2. x²−7x+12=0.\n'
                '3. x²+5x+6=0.\n'
                '4. 2x²−8x=0.\n'
                '5. (x−4)²=9.\n'
                '6. x²+4x+4=0.\n'
                '7. 2x²+3x−2=0.\n'
                '8. x²+2x+5=0 over the reals.\n'
                '9. Compute Δ for 3x²−6x+3=0.\n'
                '10. Classify the number of real roots of x²−2x+10=0.\n'
                '11. Solve x²+6x+5=0 by completing the square.\n'
                '12. Verify sum and product of the roots of x²−8x+15=0.\n'
                '13. Construct a quadratic equation with roots 2 and −5.\n'
                '14. Explain geometrically what Δ=0 means.\n'
                '15. Compare factoring and the quadratic formula for x²−5x+6=0.',
            emphasis:
                'Keep exact radical answers when there is no reason to approximate them.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Quadratics prepare optimization and graph analysis',
            content:
                'Parabolas appear in motion models, area problems, optimization, and approximation. In Calculus, derivatives of quadratic functions are linear, and the vertex is tied to the critical point where the derivative is zero.',
            emphasis:
                'The relationship among roots, vertex, and graph will return in functions and derivatives.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart, Thomas, and Guidorizzi for quadratic functions, graphs, and Calculus applications.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What are the solutions of x²−9=0?',
      choices: ['Only x=3', 'x=−3 or x=3', 'x=9'],
      correctIndex: 1,
      explanation:
          'x²−9=(x−3)(x+3). By the zero-product property, x−3=0 or x+3=0.',
    ),
    takeaways: [
      'A quadratic equation has the form ax²+bx+c=0 with a≠0.',
      'Factoring and the zero-product property can reveal roots directly.',
      'Completing the square exposes the structure of the parabola.',
      'The quadratic formula provides a general solution method.',
      'The discriminant determines the number of real roots.',
      'Roots are x-intercepts of the parabola.',
      'Sum and product of roots are related to coefficients.',
      'Choosing the most appropriate method is part of solving the equation.',
    ],
    closing:
        'Quadratic equations stop being a single formula when factoring, the discriminant, and geometry are understood as parts of one structure.',
  ),
  CourseLessonData(
    id: 'equations-07-inequacoes',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Inequalities',
    title: 'Linear inequalities and intervals',
    description:
        'order on the real line, equivalent transformations, reversing the sign, intervals, and graphical interpretation',
    duration: '≈ 32 min',
    objective:
        'solve linear inequalities, justify when inequality direction is preserved or reversed, represent solutions with intervals, and interpret solution sets on the real line',
    symbol: '≤',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'An inequality is an order relation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Compare instead of equate',
            content:
                'An inequality compares two expressions using <, >, ≤, or ≥. Solving means finding every value in the domain for which the order relation is true.',
            emphasis:
                'The answer is usually an interval or a union of intervals rather than a single number.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Reading on the real line',
            content:
                'x>4 represents every point to the right of 4. x≤−2 represents every point to the left of −2, including −2 itself.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Addition and subtraction preserve order',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Add the same quantity to both sides',
            content:
                'If a<b, then a+c<b+c for every real c. The same idea applies to >, ≤, and ≥.',
            emphasis:
                'Adding or subtracting the same amount never requires reversing the inequality sign.',
          ),
          WorkedExampleBlockData(
            title: 'Simple linear inequality',
            problem: 'Solve x+5<9.',
            steps: [
              'Subtract 5 from both sides.',
              'Obtain x<4.',
            ],
            result: 'S=(−∞,4).',
            interpretation:
                'The number 4 is excluded because the inequality is strict.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Multiplication by a positive number',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Order is preserved',
            content:
                'If a<b and c>0, then ac<bc. Multiplying or dividing both sides by a positive number preserves the inequality direction.',
          ),
          WorkedExampleBlockData(
            title: 'Positive coefficient',
            problem: 'Solve 3x≤15.',
            steps: [
              'Divide both sides by 3.',
              'Because 3>0, keep ≤.',
            ],
            result: 'x≤5, that is, (−∞,5].',
            interpretation:
                'The endpoint 5 is included because the relation is ≤.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Multiplication by a negative number',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The inequality direction reverses',
            content:
                'If a<b and c<0, then ac>bc. Multiplying or dividing by a negative number reverses < to >, > to <, ≤ to ≥, and ≥ to ≤.',
            emphasis:
                'This is not arbitrary: multiplying by −1 reflects points across zero on the number line.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Division by a negative number',
            problem: 'Solve −3x>12.',
            steps: [
              'Divide both sides by −3.',
              'Reverse > to < because the divisor is negative.',
            ],
            result: 'x<−4, that is, (−∞,−4).',
            interpretation:
                'Failing to reverse the sign gives the wrong solution set.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Variable on both sides',
        blocks: [
          WorkedExampleBlockData(
            title: 'Collecting terms',
            problem: 'Solve 5x−3≤2x+9.',
            steps: [
              'Subtract 2x: 3x−3≤9.',
              'Add 3: 3x≤12.',
              'Divide by 3.',
            ],
            result: 'x≤4, that is, (−∞,4].',
            interpretation:
                'The procedure resembles equations, but the inequality direction must be monitored.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Compound inequalities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Three members can be transformed together',
            content:
                'A statement such as 1<2x+3≤7 represents two simultaneous conditions. The same operation may be applied to all three parts.',
          ),
          WorkedExampleBlockData(
            title: 'Bounded interval',
            problem: 'Solve 1<2x+3≤7.',
            steps: [
              'Subtract 3 throughout: −2<2x≤4.',
              'Divide by 2: −1<x≤2.',
            ],
            result: 'S=(−1,2].',
            interpretation:
                'The left endpoint is open; the right endpoint is closed.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Union and intersection of conditions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: '“And” and “or” are set operations',
            content:
                'Simultaneous conditions linked by “and” correspond to intersection. Alternative conditions linked by “or” correspond to union.',
            emphasis:
                'x>1 and x≤5 gives (1,5]. x<−2 or x≥3 gives (−∞,−2)∪[3,+∞).',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Interval notation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Parentheses and brackets',
            content:
                'Parentheses indicate an excluded endpoint; brackets indicate an included endpoint. Infinity is never included and always uses a parenthesis.',
            emphasis:
                'x≥3 corresponds to [3,+∞), while x<3 corresponds to (−∞,3).',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Modeling with inequalities',
        blocks: [
          WorkedExampleBlockData(
            title: 'Budget restriction',
            problem: 'You have at most R\$ 80 to pay a fixed R\$ 20 fee plus tickets costing R\$ 12 each. How many tickets x can you buy?',
            steps: [
              'Model: 20+12x≤80.',
              'Subtract 20: 12x≤60.',
              'Divide by 12: x≤5.',
              'Because x counts tickets, x must be a nonnegative integer.',
            ],
            result: 'At most 5 tickets.',
            interpretation:
                'Context may impose extra restrictions beyond the algebraic inequality.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reversing the sign without multiplying by a negative',
            content:
                'Addition and subtraction do not reverse the inequality. Reversal occurs only when multiplying or dividing by a negative number.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting endpoint inclusion',
            content:
                'x<4 and x≤4 describe different sets. The interval notation must reflect whether 4 belongs to the set.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring the problem domain',
            content:
                'An inequality may have a continuous real solution set while the context restricts answers to integers, natural numbers, or nonnegative values.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — negative coefficient',
            problem: 'Solve 7−2x≥15.',
            steps: [
              'Subtract 7: −2x≥8.',
              'Divide by −2 and reverse the sign.',
            ],
            result: 'x≤−4.',
            interpretation:
                'The reversal occurs exactly at division by the negative number.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — compound inequality',
            problem: 'Solve −5≤3x+1<10.',
            steps: [
              'Subtract 1: −6≤3x<9.',
              'Divide by 3: −2≤x<3.',
            ],
            result: 'S=[−2,3).',
            interpretation:
                'The same transformation was applied to all three parts.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and represent with intervals',
            content:
                '1. x+4>9.\n'
                '2. 3x≤18.\n'
                '3. −2x<10.\n'
                '4. 5−x≥1.\n'
                '5. 4x−3>2x+5.\n'
                '6. 7x+2≤3x+14.\n'
                '7. −3≤x+1<6.\n'
                '8. 2<3x−1≤11.\n'
                '9. Write x≥−4 in interval notation.\n'
                '10. Write (−2,5] as an inequality.\n'
                '11. Find the intersection of x>1 and x≤6.\n'
                '12. Find the union of x<−3 or x≥2.\n'
                '13. Explain why multiplying by −1 reverses order.\n'
                '14. Model a budget situation using ≤.\n'
                '15. Compare the solution sets of −2x≤8 and 2x≤8.',
            emphasis:
                'For every problem, give both the final inequality and interval notation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Inequalities describe regions of function behavior',
            content:
                'Function analysis uses inequalities to determine where f(x)>0, where a derivative is positive or negative, intervals of increase and decrease, and domain restrictions.',
            emphasis:
                'Sign analysis in Calculus is a direct extension of interval reasoning.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for intervals, sign analysis, and function behavior.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the solution of −2x≤8?',
      choices: ['x≤−4', 'x≥−4', 'x≥4'],
      correctIndex: 1,
      explanation:
          'Dividing both sides by −2 reverses ≤ to ≥. Therefore x≥−4.',
    ),
    takeaways: [
      'Inequalities describe ordered sets of values.',
      'Addition and subtraction preserve inequality direction.',
      'Multiplying or dividing by a negative number reverses the sign.',
      'Solutions can be represented by intervals.',
      'Compound inequalities encode simultaneous conditions.',
      'Union and intersection organize “or” and “and” conditions.',
      'Context may restrict the domain of acceptable solutions.',
    ],
    closing:
        'Solving inequalities means reasoning about order and sets, not simply repeating equation-solving steps.',
  ),
  CourseLessonData(
    id: 'equations-08-modulo-revisao',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Absolute value',
    title: 'Absolute-value equations and inequalities',
    description:
        'distance, piecewise definition, equations, inequalities, domain, and strategy selection',
    duration: '≈ 34 min',
    objective:
        'solve absolute-value equations and inequalities by geometric interpretation and case analysis, recognize existence conditions, and integrate the strategies studied in the unit',
    symbol: '|x|',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Absolute value as distance',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Geometric interpretation comes first',
            content:
                'For real numbers, |x−a| is the distance between x and a. This lets us read absolute-value equations and inequalities as distance conditions on the real line.',
            emphasis:
                'Distance is never negative.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Piecewise definition',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Absolute value is a piecewise function',
            content:
                'Formally, [[math:|u|=\\begin{cases}u,&u\\ge0\\\\-u,&u<0\\end{cases}]]. Solving absolute-value problems ultimately means controlling these two behaviors.',
            emphasis:
                'The sign of the inside expression determines which branch is valid.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Equations of the form |u|=a',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The sign of a determines the case',
            content:
                'If a>0, then |u|=a is equivalent to u=a or u=−a. If a=0, then u=0. If a<0, there is no real solution.',
            emphasis:
                'Inspect the right-hand side before splitting into cases.',
          ),
          WorkedExampleBlockData(
            title: 'Two solutions',
            problem: 'Solve |2x−5|=7.',
            steps: [
              'First case: 2x−5=7, so x=6.',
              'Second case: 2x−5=−7, so x=−1.',
              'Check both values in the original equation.',
            ],
            result: 'S={−1,6}.',
            interpretation:
                'The expression 2x−5 can lie 7 units from zero on either side.',
          ),
          WorkedExampleBlockData(
            title: 'No solution',
            problem: 'Solve |3x+1|=−2.',
            steps: [
              'Every real absolute value is ≥0.',
              'The right-hand side is negative.',
            ],
            result: 'S=∅.',
            interpretation:
                'Existence analysis avoids unnecessary algebra.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Inequalities of the form |u|<a',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Inside region',
            content:
                'For a>0, [[math:|u|<a]] is equivalent to [[math:-a<u<a]], and [[math:|u|\\le a]] is equivalent to [[math:-a\\le u\\le a]].',
            emphasis:
                '“Less than” describes values inside a distance band.',
          ),
          WorkedExampleBlockData(
            title: 'Central interval',
            problem: 'Solve |x−3|≤2.',
            steps: [
              'Write −2≤x−3≤2.',
              'Add 3 throughout.',
            ],
            result: '1≤x≤5, that is, [1,5].',
            interpretation:
                'The solution contains every point at most 2 units from 3.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Inequalities of the form |u|>a',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Outside regions',
            content:
                'For a>0, [[math:|u|>a]] is equivalent to [[math:u<-a]] or [[math:u>a]]. With ≥, the boundary points are included.',
            emphasis:
                '“Greater than” describes two regions outside a central band.',
          ),
          WorkedExampleBlockData(
            title: 'Two outside regions',
            problem: 'Solve |2x+1|>5.',
            steps: [
              'First case: 2x+1<−5, so x<−3.',
              'Second case: 2x+1>5, so x>2.',
            ],
            result: 'S=(−∞,−3)∪(2,+∞).',
            interpretation:
                'The solution lies outside the central interval.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Special cases in absolute-value inequalities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The sign of a changes everything',
            content:
                'If a<0, then |u|<a and |u|≤a have no real solutions. In contrast, |u|>a may be true for every real value when a<0 because |u|≥0.',
            emphasis:
                'Do not apply interval formulas mechanically without inspecting the sign of a.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Solving through the piecewise definition',
        blocks: [
          WorkedExampleBlockData(
            title: 'When absolute value is part of a larger expression',
            problem: 'Solve |x−1|+2=5.',
            steps: [
              'Isolate the absolute value: |x−1|=3.',
              'Split into x−1=3 or x−1=−3.',
              'Solve: x=4 or x=−2.',
            ],
            result: 'S={−2,4}.',
            interpretation:
                'Whenever possible, isolate the absolute-value expression before opening cases.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Absolute values on both sides',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: '|u|=|v|',
            content:
                'For real numbers, |u|=|v| is equivalent to u=v or u=−v. Equal absolute values mean equal distances from zero.',
          ),
          WorkedExampleBlockData(
            title: 'Equal distances',
            problem: 'Solve |x−2|=|x+4|.',
            steps: [
              'Case 1: x−2=x+4, which is impossible.',
              'Case 2: x−2=−(x+4).',
              'Then x−2=−x−4, so 2x=−2 and x=−1.',
            ],
            result: 'S={−1}.',
            interpretation:
                '−1 is the midpoint between 2 and −4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Connection to distance between points',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Absolute-value equations can be geometric problems',
            content:
                '|x−a|=r describes two points at distance r from a when r>0. Likewise, |x−a|≤r describes a closed interval centered at a with radius r.',
            emphasis:
                'The geometric interpretation is often faster than symbolic manipulation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting one branch',
            content:
                '|u|=a with a>0 produces two cases. Solving only u=a loses a valid solution.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Treating |u| as if it were always u',
            content:
                '|u|=u only when u≥0. When u<0, |u|=−u.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing < with >',
            content:
                '|u|<a gives an inside interval, while |u|>a gives two outside regions.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — equation',
            problem: 'Solve |3x−6|=9.',
            steps: [
              '3x−6=9 or 3x−6=−9.',
              'First case: x=5.',
              'Second case: x=−1.',
            ],
            result: 'S={−1,5}.',
            interpretation:
                'The two solutions produce the same distance.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — inequality',
            problem: 'Solve |x+2|<5.',
            steps: [
              'Write −5<x+2<5.',
              'Subtract 2 throughout.',
            ],
            result: 'S=(−7,3).',
            interpretation:
                'The interval has center −2 and radius 5.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and interpret geometrically when possible',
            content:
                '1. |x|=6.\n'
                '2. |x|=0.\n'
                '3. |x|=−3.\n'
                '4. |2x−1|=5.\n'
                '5. |x+4|≤3.\n'
                '6. |x−2|<7.\n'
                '7. |3x+1|>4.\n'
                '8. |x|≥5.\n'
                '9. |x−1|+2=6.\n'
                '10. |2x+3|−1=4.\n'
                '11. |x−2|=|x+6|.\n'
                '12. Explain the geometric meaning of |x−5|≤2.\n'
                '13. Classify |x+1|<−2.\n'
                '14. Classify |x−3|>−1.\n'
                '15. Compare the solution sets of |x|<4 and |x|>4.',
            emphasis:
                'Use interval notation whenever the solution set is not discrete.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Strategic synthesis of the unit',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Recognize structure before choosing a technique',
            content:
                'Linear equation: isolate the variable. Fractions: preserve domain and clear denominators. System: substitution or elimination. Quadratic: factoring, square roots, completing the square, or formula. Inequality: monitor order. Absolute value: interpret distance and cases.',
            emphasis:
                'Correctly classifying the problem is part of the solution.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Absolute value returns in limits, continuity, and error',
            content:
                'The language [[math:|x-a|<\\delta]] and [[math:|f(x)-L|<\\varepsilon]] is central to the formal definition of limit. Absolute-value inequalities also express tolerances, error margins, and neighborhoods.',
            emphasis:
                'Understanding absolute value as distance directly prepares ε–δ reasoning.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for absolute value, distance, and the formal definition of limit.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which values solve |x|=3?',
      choices: ['Only x=3', 'x=−3 or x=3', 'x=0 or x=3'],
      correctIndex: 1,
      explanation:
          'Both −3 and 3 are three units away from zero.',
    ),
    takeaways: [
      'Absolute value represents distance.',
      'Equations |u|=a require checking the sign of a.',
      'Inequalities |u|<a describe inside regions.',
      'Inequalities |u|>a describe outside regions.',
      'The piecewise definition justifies the operational rules.',
      'Equal absolute values represent equal distances.',
      'Recognizing structure determines the appropriate strategy.',
      'Absolute value prepares the formal language of limits.',
    ],
    closing:
        'The unit comes together when equations, inequalities, and absolute value are seen as different ways of describing relations among values and sets.',
  )
];