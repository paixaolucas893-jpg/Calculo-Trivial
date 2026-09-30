import 'package:flutter/widgets.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

List<CourseLessonData> localizedAlgebraCourseLessons(Locale locale) {
  if (locale.languageCode != 'en') {
    return algebraCourseLessons;
  }

  return _englishAlgebraCourseLessons;
}

const List<CourseLessonData> _englishAlgebraCourseLessons = [
  CourseLessonData(
    id: 'algebra-01-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Algebraic language',
    description:
        'translating words, relationships, and situations into Algebra',
    duration: '≈ 25 min',
    objective:
        'translate sentences and situations into algebraic expressions and interpret the meaning of expressions written with symbols',
    symbol: 'x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Prerequisite',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'What you should already know',
            content:
                'In previous lessons, you learned about variables, constants, coefficients, terms, and expressions. Now we will use these elements to represent relationships described with words.',
            emphasis:
                'The question is no longer only “what does x mean?” but also “how can I write this situation mathematically?”.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Algebra is a language',
            content:
                'Just as a sentence communicates an idea using words, an algebraic expression communicates a relationship using numbers, letters, and operations. The central skill in this lesson is moving from one language to the other without changing the meaning.',
            emphasis:
                'Correct translation matters more than memorizing symbols.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'An unknown quantity',
            content:
                'When a problem says “a number” without telling us which number it is, we can represent it with a variable. For example, we may call that number x.',
            emphasis:
                '“A number” → x. The chosen letter may change; what matters is clearly defining what it represents.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Words that indicate operations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Addition and subtraction',
            content:
                'Phrases such as “the sum of x and 5” and “x increased by 5” represent x + 5. The phrase “x decreased by 5” represents x − 5.',
            emphasis:
                'The wording may change while the mathematical relationship remains the same.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Multiplication',
            content:
                'Twice x is 2x. Three times x is 3x. Four times x is 4x. When a number appears next to a variable, multiplication is usually written without the × symbol.',
            emphasis: '2x means 2 · x.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Division',
            content:
                'Half of x can be written as x/2. One third of x is x/3. The quotient of x and y can be represented by x/y, provided y is not zero.',
            emphasis: 'Order matters: x/y is generally not equal to y/x.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Powers',
            content:
                'The square of x is x². The cube of x is x³. The square of the sum of x and y is (x + y)².',
            emphasis: 'x² + y² and (x + y)² are different expressions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Translate sentences',
        blocks: [
          WorkedExampleBlockData(
            title: 'From words to Algebra',
            problem:
                'Write algebraically: “three times a number, increased by 5”.',
            steps: [
              'Choose a variable to represent the number. Let us use x.',
              'Three times the number is 3x.',
              'The statement says that this result is increased by 5.',
              'Add 5: 3x + 5.',
            ],
            result: 'The expression is 3x + 5.',
            interpretation:
                'First identify the unknown quantity; then translate the operations in the order described.',
          ),
          WorkedExampleBlockData(
            title: 'Half of a quantity',
            problem: 'Write algebraically: “half the sum of a number and 8”.',
            steps: [
              'Represent the number by x.',
              'The sum of the number and 8 is x + 8.',
              'We want half of that entire sum.',
              'Use parentheses to keep the sum grouped: (x + 8)/2.',
            ],
            result: 'The expression is (x + 8)/2.',
            interpretation:
                'The parentheses show that the whole sum is considered before dividing by 2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Word order matters',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '“5 less than x” is not “5 minus x”',
            content:
                'The phrase “5 less than x” means subtract 5 from x, so x − 5. The phrase “5 minus x” means begin with 5 and subtract x, so 5 − x.',
            emphasis: 'x − 5 and 5 − x generally produce different values.',
          ),
          WorkedExampleBlockData(
            title: 'Compare the two phrases',
            problem: 'Translate “7 less than a number” and “7 minus a number”.',
            steps: [
              'Represent the number by x.',
              '“7 less than a number” means subtract 7 from x: x − 7.',
              '“7 minus a number” begins with 7 and subtracts x: 7 − x.',
              'Compare the expressions: the order has been reversed.',
            ],
            result: 'The expressions are x − 7 and 7 − x.',
            interpretation:
                'In subtraction, changing the order changes the meaning.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Parentheses change the meaning',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '2x + 3 versus 2(x + 3)',
            content:
                'In 2x + 3, only x is multiplied by 2. In 2(x + 3), the entire sum x + 3 is multiplied by 2.',
            emphasis: '2(x + 3) = 2x + 6, so it is not equal to 2x + 3.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'x² + 4 versus (x + 2)²',
            content:
                'x² + 4 means add 4 to the square of x. In contrast, (x + 2)² means square the entire sum.',
            emphasis: '(x + 2)² = x² + 4x + 4, not x² + 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Consecutive numbers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Representing consecutive integers',
            content:
                'If x represents an integer, the next integer is x + 1 and the following one is x + 2. Therefore, three consecutive integers can be represented by x, x + 1, and x + 2.',
            emphasis:
                'We do not need to know the actual numbers to represent the relationship between them.',
          ),
          WorkedExampleBlockData(
            title: 'Sum of consecutive integers',
            problem: 'Represent the sum of two consecutive integers.',
            steps: [
              'Represent the first integer by x.',
              'The next integer is x + 1.',
              'Add the two numbers: x + (x + 1).',
              'If desired, simplify by combining terms: 2x + 1.',
            ],
            result: 'The sum can be written as x + (x + 1) = 2x + 1.',
            interpretation:
                'The expression reveals an important property: the sum of two consecutive integers is always odd.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Model a real-world situation',
        blocks: [
          WorkedExampleBlockData(
            title: 'Ride-share fare',
            problem:
                'A ride-share service charges a fixed fee of \$6.00 plus \$2.50 per mile traveled. Write an expression for the total cost.',
            steps: [
              'Let x represent the number of miles traveled.',
              'The variable cost is \$2.50 per mile: 2.5x.',
              'There is also a fixed fee of \$6.00.',
              'Add the two parts: 6 + 2.5x.',
            ],
            result: 'The cost can be represented by C = 6 + 2.5x.',
            interpretation:
                'The number 6 represents the fixed part; 2.5x represents the part that changes with distance.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'An expression can represent a model',
            content:
                'When we connect an expression to a real-world situation, every symbol gains meaning. The variable represents a quantity, while the numbers describe relationships between quantities.',
            emphasis:
                'This idea will become essential when we begin studying functions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Read Algebra back into words',
        blocks: [
          WorkedExampleBlockData(
            title: 'From symbols to words',
            problem: 'Interpret the expression 4x − 9.',
            steps: [
              'Identify 4x as four times x.',
              'This can be described as “four times a number”.',
              'Then the expression subtracts 9.',
              'Combine the ideas into a sentence.',
            ],
            result:
                'One possible interpretation is: “four times a number minus 9”.',
            interpretation:
                'The same expression may have different equivalent verbal descriptions as long as they preserve exactly the same operations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Common mistakes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing addition with multiplication',
            content:
                '“A number increased by 4” is x + 4, not 4x. “Four times a number” is 4x.',
            emphasis:
                'Identify the operation actually described by the wording.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring grouping',
            content:
                '“Twice the sum of x and 3” is 2(x + 3). Writing 2x + 3 changes the situation.',
            emphasis:
                'Phrases such as “the sum of”, “the difference of”, and “the product of” often indicate that an entire expression must stay grouped.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reversing a subtraction',
            content:
                'Subtraction is not commutative. Correctly interpreting expressions such as “3 less than x” is therefore essential.',
            emphasis:
                'Always ask: which quantity is being subtracted from which?',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Guided practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided exercise 1',
            problem: 'Represent “twice a number plus 7”.',
            steps: [
              'Represent the number by x.',
              'Twice the number is 2x.',
              'Add 7.',
            ],
            result: '2x + 7.',
            interpretation:
                'The multiplication applies only to the number represented by x.',
          ),
          WorkedExampleBlockData(
            title: 'Guided exercise 2',
            problem:
                'Represent “three times the difference between a number and 4”.',
            steps: [
              'Represent the number by x.',
              'The difference between the number and 4 is x − 4.',
              'Three times the entire difference requires grouping.',
              'Multiply the whole expression by 3.',
            ],
            result: '3(x − 4).',
            interpretation:
                'Parentheses preserve the difference before multiplication.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Practice on your own',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Try before looking at any solution',
            content:
                '1. Write “one third of a number plus 5”.\n'
                '2. Write “the square of the difference between x and 3”.\n'
                '3. Represent three consecutive integers.\n'
                '4. Interpret the expression 5x + 2 in words.\n'
                '5. A gym charges a \$40 enrollment fee and \$65 per month. Write an expression for the total cost after x months.',
            emphasis:
                'The goal is to identify the structure of the situation before performing any calculation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Connection to what comes next',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'From expressions to functions',
            content:
                'When an expression describes how one quantity depends on another, we are very close to the idea of a function. For example, C = 6 + 2.5x relates distance and cost.',
            emphasis:
                'Learning to translate situations now will make equations, functions, modeling, and later Calculus problems much easier.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Which expression represents “twice the sum of a number x and 5”?',
      choices: ['2x + 5', '2(x + 5)', 'x + 10'],
      correctIndex: 1,
      explanation:
          'The statement asks for twice the entire sum x + 5. We therefore group x + 5 first and multiply it by 2: 2(x + 5).',
    ),
    takeaways: [
      'Algebra is a language used to represent relationships.',
      'A variable can represent an unknown or changing quantity.',
      'Different words may describe the same mathematical operation.',
      'In subtraction and division, the order of quantities matters.',
      'Parentheses show that an entire expression must be treated as a group.',
      'Real-world situations can be represented by algebraic expressions.',
      'Translating between words and symbols prepares you for equations and functions.',
    ],
    closing:
        'You are not merely manipulating letters: you are learning to turn situations and relationships into mathematics.',
  ),
  CourseLessonData(
    id: 'algebra-02-termos-semelhantes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Like terms',
    description:
        'identifying algebraic structure, combining coefficients, signs, and multivariable terms',
    duration: '≈ 25 min',
    objective:
        'identify like terms, distinguish coefficients from literal parts, combine terms correctly, and recognize when algebraic terms cannot be combined',
    symbol: '3x+2x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Terms must have the same literal part',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'What makes terms like terms',
            content:
                'Two terms are like terms when they have exactly the same variables raised to exactly the same powers. Only their coefficients may differ.',
            emphasis:
                '3x²y and −5x²y are like terms; 3xy² and 3x²y are not.',
          ),
          WorkedExampleBlockData(
            title: 'Classifying terms',
            problem: 'Group 4x², −3x, 7x², 5, 2x, and −1 into families.',
            steps: [
              'Quadratic terms: 4x² and 7x².',
              'Linear terms: −3x and 2x.',
              'Constants: 5 and −1.',
            ],
            result: 'Three families of like terms.',
            interpretation:
                'The coefficient does not determine the family; the literal part does.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Coefficient and literal part',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Separate number from structure',
            content:
                'In −6x³y², the coefficient is −6 and the literal part is x³y². Combining like terms changes only the coefficients.',
            emphasis:
                'The exponents stay unchanged when like terms are combined.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Combining like terms',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Add or subtract coefficients',
            content:
                'Because ax+bx=(a+b)x, combining like terms is an application of the distributive property in reverse.',
          ),
          WorkedExampleBlockData(
            title: 'Reduction step by step',
            problem: 'Simplify 7x²−3x+4−2x²+5x−9.',
            steps: [
              'Quadratic terms: 7x²−2x²=5x².',
              'Linear terms: −3x+5x=2x.',
              'Constants: 4−9=−5.',
            ],
            result: '5x²+2x−5.',
            interpretation:
                'Organizing terms by family makes the reduction transparent.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Signs belong to the term',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Do not detach the sign from its coefficient',
            content:
                'In an expression such as 4x−7x+2x, the coefficient of the middle term is −7, not 7.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Negative coefficients',
            problem: 'Simplify −8a+3a−5a.',
            steps: [
              'Add the coefficients: −8+3−5=−10.',
              'Keep the literal part a.',
            ],
            result: '−10a.',
            interpretation:
                'The arithmetic of signed coefficients controls the result.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Constants are like terms',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A constant is a term with no variable factor',
            content:
                'All constants combine with other constants. They do not combine with variable terms unless the variable part has already been evaluated.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'More than one variable',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Order does not change a product',
            content:
                'Because multiplication is commutative, xy and yx represent the same literal part. Thus 3xy and −5yx are like terms.',
          ),
          WorkedExampleBlockData(
            title: 'Multivariable reduction',
            problem: 'Simplify 4xy−2x²y+3yx+5x²y.',
            steps: [
              'Recognize 4xy and 3yx as like terms: 7xy.',
              'Recognize −2x²y and 5x²y as like terms: 3x²y.',
            ],
            result: '3x²y+7xy.',
            interpretation:
                'Same variables are not enough; the exponents must also match.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Combining different exponents',
            content:
                'x²+x³ cannot be reduced to 2x⁵ or 2x³. The terms are not like terms.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Adding a coefficient to an exponent',
            content:
                '3x²+4x²=7x², not 7x⁴. Combining terms acts on coefficients only.',
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
            problem: 'Simplify 5x²+2x−3−8x²+7x+1.',
            steps: [
              'Quadratic terms: 5x²−8x²=−3x².',
              'Linear terms: 2x+7x=9x.',
              'Constants: −3+1=−2.',
            ],
            result: '−3x²+9x−2.',
            interpretation:
                'Reduce one family at a time.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Simplify 6ab²−4a²b+3ab²+a²b.',
            steps: [
              'ab² terms: 6ab²+3ab²=9ab².',
              'a²b terms: −4a²b+a²b=−3a²b.',
            ],
            result: '9ab²−3a²b.',
            interpretation:
                'The variable set is the same, but the exponent pattern separates the families.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Combine only compatible terms',
            content:
                '1. Simplify 3x+5x.\n'
                '2. Simplify 7a−2a+4a.\n'
                '3. Simplify 4x²+3x−x².\n'
                '4. Simplify 2y³−5y³+y.\n'
                '5. Simplify 6+3x−2+5x.\n'
                '6. Identify the coefficient of −9x⁴.\n'
                '7. Decide whether 3xy and −2yx are like terms.\n'
                '8. Decide whether x²y and xy² are like terms.\n'
                '9. Simplify 5ab−2ba+7ab.\n'
                '10. Simplify 3x²−4x+2−x²+x−8.\n'
                '11. Explain why x²+x³ cannot be combined.\n'
                '12. Give two terms like −4a²b³.\n'
                '13. Simplify −2m+7−5m−3.\n'
                '14. Put 4−x³+2x−3x³ into reduced standard form.\n'
                '15. Explain how the distributive property justifies combining like terms.',
            emphasis:
                'Write the coefficient arithmetic explicitly whenever signs are involved.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Connection to what comes next',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Reduction keeps later algebra readable',
            content:
                'Combining like terms appears after expansion, during polynomial operations, in equations, and in Calculus manipulations. It is a normalization step that makes structure visible.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which expression is equivalent to 4x²−3x+2x²+5x?',
      choices: ['6x²+2x', '6x⁴+2x', '4x²+4x'],
      correctIndex: 0,
      explanation:
          'Combine quadratic terms: 4x²+2x²=6x². Combine linear terms: −3x+5x=2x.',
    ),
    takeaways: [
      'Like terms have identical literal parts and exponents.',
      'Only coefficients are combined.',
      'Signs belong to coefficients.',
      'Constants combine with constants.',
      'Multivariable terms require matching exponent patterns.',
      'Combining like terms is the distributive property in reverse.',
    ],
    closing:
        'Recognizing like terms is recognizing algebraic structure before doing arithmetic.',
  )
  CourseLessonData(
    id: 'algebra-03-distributiva',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Distributive property and signs',
    description:
        'expanding products, removing parentheses, controlling negative signs, and preserving equivalence',
    duration: '≈ 25 min',
    objective:
        'apply the distributive property to one or more grouped expressions, control signs, recognize equivalent forms, and avoid invalid expansions',
    symbol: 'a(b+c)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Distribution connects multiplication and addition',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Algebraic definition',
            content:
                'For real numbers or compatible algebraic expressions, a(b+c)=ab+ac and a(b−c)=ab−ac. The outside factor multiplies every term inside the grouping.',
            emphasis:
                'Distributing is not merely “removing parentheses”; every internal term must be multiplied.',
          ),
          WorkedExampleBlockData(
            title: 'Simple distribution',
            problem: 'Expand 4(2x−3).',
            steps: [
              '4·2x=8x.',
              '4·(−3)=−12.',
            ],
            result: '8x−12.',
            interpretation:
                'Both terms inside the parentheses received the outside factor.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'A negative sign before parentheses',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A leading minus means multiplication by −1',
            content:
                '−(a+b)=−a−b and −(a−b)=−a+b. Every sign inside the grouping is affected.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Controlling signs',
            problem: 'Simplify 5x−(2x−7).',
            steps: [
              'Distribute −1: 5x−2x+7.',
              'Combine like terms.',
            ],
            result: '3x+7.',
            interpretation:
                'The −7 became +7 because it was multiplied by −1.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Literal coefficients distribute too',
        blocks: [
          WorkedExampleBlockData(
            title: 'Algebraic outside factor',
            problem: 'Expand 3x(2x²−x+4).',
            steps: [
              '3x·2x²=6x³.',
              '3x·(−x)=−3x².',
              '3x·4=12x.',
            ],
            result: '6x³−3x²+12x.',
            interpretation:
                'Distribution and exponent laws work together.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Double distribution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Every term multiplies every term',
            content:
                '(a+b)(c+d)=ac+ad+bc+bd. This is the foundation of polynomial multiplication and special products.',
          ),
          WorkedExampleBlockData(
            title: 'Binomial times binomial',
            problem: 'Expand (x+3)(x−5).',
            steps: [
              'x·x=x².',
              'x·(−5)=−5x.',
              '3·x=3x.',
              '3·(−5)=−15.',
              'Combine −5x+3x.',
            ],
            result: 'x²−2x−15.',
            interpretation:
                'Like-term reduction comes after expansion.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Distribution in reverse',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Expanding and factoring are inverse perspectives',
            content:
                'Because ab+ac=a(b+c), a common factor can be extracted from a sum. For example, 6x+9=3(2x+3).',
            emphasis:
                'This reverse view prepares factoring.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Algebraic equivalence',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Different forms can represent the same expression',
            content:
                '2(x+4) and 2x+8 have the same value for every real x. A valid algebraic transformation must preserve this identity.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Distributing to only one term',
            content:
                '3(x+2)=3x+2 is false. The correct expansion is 3x+6.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing a square with distribution',
            content:
                '(a+b)² is not a²+b². It equals a²+2ab+b².',
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
            problem: 'Simplify −2(3x−4)+5x.',
            steps: [
              'Distribute −2: −6x+8.',
              'Add 5x and combine.',
            ],
            result: '−x+8.',
            interpretation:
                'The negative outside factor affects every product.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Expand (2x−1)(x+4).',
            steps: [
              '2x·x=2x².',
              '2x·4=8x.',
              '−1·x=−x.',
              '−1·4=−4.',
              'Combine 8x−x.',
            ],
            result: '2x²+7x−4.',
            interpretation:
                'Double distribution produces four products before reduction.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Expand or simplify and justify the signs',
            content:
                '1. 5(x+2).\n'
                '2. −3(x−4).\n'
                '3. 2a(3a+5).\n'
                '4. 7−(2x+1).\n'
                '5. 4x−2(x−3).\n'
                '6. 3(2x+1)−5x.\n'
                '7. (x+2)(x+5).\n'
                '8. (x−4)(x+3).\n'
                '9. (2x+1)(x−2).\n'
                '10. −(a−b+c).\n'
                '11. Decide whether 4(x+1) and 4x+1 are equivalent.\n'
                '12. Factor 8x+12 by reversing distribution.\n'
                '13. Explain why (x+2)² is not x²+4.\n'
                '14. Simplify 2(x+3)−3(x−1).\n'
                '15. Expand (3x−2)(2x+5).',
            emphasis:
                'For products of polynomials, record every product before combining like terms.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Expanding and factoring reveal different structures',
            content:
                'Limits and derivatives often require changing between expanded and factored forms. The distributive property is the bridge between them.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the expanded form of −2(x−5)?',
      choices: ['−2x−10', '−2x+10', '2x−10'],
      correctIndex: 1,
      explanation:
          '−2 multiplies both terms: −2·x=−2x and −2·(−5)=+10.',
    ),
    takeaways: [
      'Distribution multiplies the outside factor by every inside term.',
      'A negative sign before parentheses is multiplication by −1.',
      'Double distribution multiplies every term by every term.',
      'Expanding and factoring are opposite uses of the same property.',
      'Valid transformations preserve algebraic equivalence.',
      'Sign errors become especially dangerous in long expressions.',
    ],
    closing:
        'Mastering distribution means controlling expression structure rather than merely removing parentheses.',
  )
  CourseLessonData(
    id: 'algebra-04-potencias',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Powers in algebraic expressions',
    description:
        'exponent laws applied to monomials, coefficients, and algebraic simplification',
    duration: '≈ 25 min',
    objective:
        'apply exponent laws to algebraic expressions, distinguish valid from invalid operations, and simplify products, quotients, and powers of monomials with proper domain restrictions',
    symbol: 'xⁿ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Structural review',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Base, exponent, and coefficient',
            content:
                'In 3x⁴, the coefficient is 3 and the literal part is x⁴. The exponent 4 applies to x, not to the coefficient. In (3x)⁴, the whole product 3x is the base.',
            emphasis:
                'Parentheses determine exactly what is raised to a power.',
          ),
          WorkedExampleBlockData(
            title: 'Compare two expressions',
            problem: 'Compare 3x² and (3x)².',
            steps: [
              '3x² means 3·x².',
              '(3x)²=3²x²=9x².',
            ],
            result: 'They are not equivalent.',
            interpretation:
                'Grouping changes the base of the power.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Product of powers with the same base',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Add exponents only in products',
            content:
                'For the same base, xᵐ·xⁿ=xᵐ⁺ⁿ. This follows from concatenating equal factors.',
            emphasis:
                'x²·x³=x⁵, but x²+x³ is not x⁵.',
          ),
          WorkedExampleBlockData(
            title: 'Product of monomials',
            problem: 'Simplify (4x³)(−2x⁵).',
            steps: [
              'Multiply coefficients: 4·(−2)=−8.',
              'Add exponents of x: 3+5=8.',
            ],
            result: '−8x⁸.',
            interpretation:
                'Coefficients and literal parts are handled separately.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Quotient of powers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Subtract exponents for a nonzero base',
            content:
                'For x ≠ 0, xᵐ/xⁿ=xᵐ⁻ⁿ. The restriction comes from the denominator of the original expression.',
          ),
          WorkedExampleBlockData(
            title: 'Quotient of monomials',
            problem: 'Simplify 12x⁷/(3x²), with x ≠ 0.',
            steps: [
              '12/3=4.',
              '7−2=5.',
            ],
            result: '4x⁵, with x ≠ 0.',
            interpretation:
                'Simplification does not restore a value excluded by the original denominator.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Power of a power and power of a product',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Multiply exponents in a power of a power',
            content:
                '(xᵐ)ⁿ=xᵐⁿ and (ab)ⁿ=aⁿbⁿ. These rules describe different structures and should not be confused with exponent addition.',
          ),
          WorkedExampleBlockData(
            title: 'Power of a monomial',
            problem: 'Simplify (−2x³y²)³.',
            steps: [
              '(−2)³=−8.',
              '(x³)³=x⁹.',
              '(y²)³=y⁶.',
            ],
            result: '−8x⁹y⁶.',
            interpretation:
                'The outside exponent acts on every factor in the base.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Zero and negative exponents in Algebra',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Zero and negative exponents carry restrictions',
            content:
                'For x ≠ 0, x⁰=1 and x⁻ⁿ=1/xⁿ. Domain restrictions remain part of the original algebraic expression.',
          ),
          WorkedExampleBlockData(
            title: 'Removing a negative exponent',
            problem: 'Rewrite 6x⁻²y³ without negative exponents.',
            steps: [
              'x⁻²=1/x², with x ≠ 0.',
              'Keep the other factors in the numerator.',
            ],
            result: '6y³/x², with x ≠ 0.',
            interpretation:
                'A negative exponent changes multiplicative position, not the sign of the term.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'More than one variable',
        blocks: [
          WorkedExampleBlockData(
            title: 'Multivariable product',
            problem: 'Simplify (3x²y)(−4xy³).',
            steps: [
              'Coefficients: 3·(−4)=−12.',
              'x powers: x²·x=x³.',
              'y powers: y·y³=y⁴.',
            ],
            result: '−12x³y⁴.',
            interpretation:
                'Each base is treated independently.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Do not add exponents in a sum',
            content:
                'x²+x³ cannot be reduced to x⁵ because exponent addition requires multiplication.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '(x+y)² is not x²+y²',
            content:
                'The power applies to the entire binomial: (x+y)²=x²+2xy+y².',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Do not lose original restrictions',
            content:
                'x³/x simplifies to x², but the original expression required x ≠ 0.',
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
            problem: 'Simplify (2x²)³·x⁻¹.',
            steps: [
              '(2x²)³=8x⁶.',
              'Multiply by x⁻¹.',
              'Add exponents: 6+(−1)=5.',
            ],
            result: '8x⁵, with x ≠ 0.',
            interpretation:
                'The restriction comes from the original x⁻¹ factor.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Simplify (6a⁵b²)/(3a²b).',
            steps: [
              '6/3=2.',
              'a⁵/a²=a³.',
              'b²/b=b.',
            ],
            result: '2a³b, with a,b ≠ 0 in the original quotient.',
            interpretation:
                'Equal bases are simplified independently.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Simplify and state restrictions when needed',
            content:
                '1. x³·x⁵.\n'
                '2. a⁷/a².\n'
                '3. (y⁴)³.\n'
                '4. (2x)⁴.\n'
                '5. (−3a²)².\n'
                '6. (4x³)(−2x²).\n'
                '7. (12m⁶)/(4m²).\n'
                '8. x⁻⁴.\n'
                '9. 5a²b·3ab³.\n'
                '10. (−2x²y³)².\n'
                '11. Explain why x²+x⁴ is not x⁶.\n'
                '12. Compare 2x³ and (2x)³.\n'
                '13. Rewrite x⁵/x⁷ without negative exponents.\n'
                '14. State the original restriction of (x²−x)/x.\n'
                '15. Simplify (3a²b⁻¹)².',
            emphasis:
                'Separate coefficient arithmetic from exponent work on each literal base.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Powers appear throughout functions, limits, and derivatives',
            content:
                'Power functions and polynomials are built from these structures. Accurate exponent manipulation is essential for difference quotients, derivatives, and growth analysis.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the simplification of (3x²)²?',
      choices: ['6x⁴', '9x⁴', '9x²'],
      correctIndex: 1,
      explanation:
          'The exponent 2 acts on both 3 and x²: 3²=9 and (x²)²=x⁴.',
    ),
    takeaways: [
      'Products with the same base add exponents; quotients subtract them.',
      'A power of a power multiplies exponents.',
      'A power of a product acts on every factor.',
      'Zero and negative exponents require domain awareness.',
      'Coefficients and literal bases should be handled separately.',
      'Exponent laws do not apply directly to sums.',
    ],
    closing:
        'Exponent laws are structural rules: they work only when the operation and the base are identified correctly.',
  )
  CourseLessonData(
    id: 'algebra-09-monomios-polinomios',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Monomials and polynomials',
    description:
        'structure, terms, coefficients, degree, standard form, and recognizing polynomial expressions',
    duration: '≈ 28 min',
    objective:
        'recognize monomials and polynomials, identify coefficients and terms, determine degree, write polynomials in standard form, and distinguish polynomial from non-polynomial expressions',
    symbol: 'P(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'What is a monomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A coefficient times powers of variables',
            content:
                'A monomial has the form ax₁ⁿ¹x₂ⁿ²…xₖⁿᵏ, where a is real and the variable exponents are nonnegative integers. Examples include 5x³, −2ab², and 7.',
            emphasis:
                'Negative exponents, variables in denominators, and roots of variables fall outside polynomial monomials.',
          ),
          WorkedExampleBlockData(
            title: 'Classifying expressions',
            problem: 'Which are monomials: 4x², 3/x, −5xy³, √x, and 8?',
            steps: [
              '4x² has a nonnegative integer exponent: monomial.',
              '3/x=3x⁻¹: not a polynomial monomial.',
              '−5xy³ has exponents 1 and 3: monomial.',
              '√x=x^(1/2): not a polynomial monomial.',
              '8 is a constant and a degree-zero monomial.',
            ],
            result: 'Monomials: 4x², −5xy³, and 8.',
            interpretation:
                'Classification depends on exponent structure rather than visual complexity.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Degree of a monomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Add variable exponents',
            content:
                'In one variable, the degree of axⁿ with a ≠ 0 is n. In several variables, total degree is the sum of exponents. Thus 3x²y⁴ has total degree 6.',
            emphasis:
                'A nonzero constant has degree 0. The zero monomial is usually left without a degree in elementary treatment.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'What is a polynomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A finite sum of monomials',
            content:
                'A polynomial is a finite sum of monomials. In one variable, P(x)=aₙxⁿ+aₙ₋₁xⁿ⁻¹+…+a₁x+a₀ with nonnegative integer exponents.',
            emphasis:
                'The numbers a₀,a₁,…,aₙ are coefficients. If aₙ ≠ 0, it is the leading coefficient.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Monomial, binomial, trinomial',
            content:
                'A reduced polynomial with one term is a monomial, with two terms a binomial, and with three a trinomial. “Polynomial” remains the general name.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Reduced form and standard form',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Reduce first, then order',
            content:
                'To write a polynomial in standard form, combine like terms and order them from highest to lowest degree.',
          ),
          WorkedExampleBlockData(
            title: 'Organizing a polynomial',
            problem: 'Write 3x−2x³+5+4x³−x in standard form.',
            steps: [
              'Cubic terms: −2x³+4x³=2x³.',
              'Linear terms: 3x−x=2x.',
              'Keep the constant 5.',
            ],
            result: '2x³+2x+5.',
            interpretation:
                'The missing x² term has coefficient zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Degree and leading coefficient',
        blocks: [
          WorkedExampleBlockData(
            title: 'Reading the structure',
            problem: 'Analyze P(x)=−4x⁵+2x³−7x+9.',
            steps: [
              'The largest exponent is 5.',
              'The degree is 5.',
              'The leading coefficient is −4.',
              'The constant term is 9.',
            ],
            result: 'Degree 5, leading coefficient −4, constant term 9.',
            interpretation:
                'These features help predict global graph behavior.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Polynomials in several variables',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Total degree',
            content:
                'In P(x,y)=3x²y+5xy³−2, the terms have total degrees 3, 4, and 0. Therefore the polynomial has total degree 4.',
            emphasis:
                'For multivariable polynomials, distinguish degree in one variable from total degree.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Expressions that are not polynomials',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Recognize the structural restrictions',
            content:
                '1/x, x⁻², √x, x^(3/2), sin x, and 2ˣ are not polynomials in x because they are not finite sums of nonnegative integer powers of x.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Zeros and polynomial evaluation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Substitution produces P(a)',
            content:
                'Evaluating a polynomial means substituting a value for its variable. A number r is a zero or root when P(r)=0.',
          ),
          WorkedExampleBlockData(
            title: 'Evaluating a polynomial',
            problem: 'For P(x)=x³−4x+1, find P(2).',
            steps: [
              'P(2)=2³−4·2+1.',
              '2³=8.',
              '8−8+1=1.',
            ],
            result: 'P(2)=1.',
            interpretation:
                'Since P(2) ≠ 0, 2 is not a root.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing number of terms with degree',
            content:
                'x⁷+2 has two terms but degree 7. “Binomial” counts terms; degree concerns exponents.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Determining degree before reduction',
            content:
                'In 3x⁴−3x⁴+x², the degree-four terms cancel. The reduced polynomial is x² and has degree 2.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Classify, reduce, and interpret',
            content:
                '1. Classify 7x³ and state its degree.\n'
                '2. Find the total degree of −4x²y⁵.\n'
                '3. Decide whether 3/x is a polynomial monomial.\n'
                '4. Decide whether √x+1 is a polynomial.\n'
                '5. Reduce 2x²+3x−x²+5x.\n'
                '6. Put 4−x³+2x in standard form.\n'
                '7. Find the degree of 5x⁶−x²+1.\n'
                '8. Identify the leading coefficient of −2x⁴+7x−3.\n'
                '9. Identify the constant term of x⁵−9.\n'
                '10. Find the total degree of 3x²y⁴.\n'
                '11. Find the total degree of P(x,y)=x³y+xy²+1.\n'
                '12. Evaluate P(−1) for P(x)=2x³−x+4.\n'
                '13. Check whether x=2 is a root of x²−5x+6.\n'
                '14. Explain why 2ˣ is not a polynomial in x.\n'
                '15. Reduce 3x⁴−3x⁴+2x² and state the final degree.',
            emphasis:
                'Always reduce a polynomial before declaring its degree.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Polynomials are central functions in Calculus',
            content:
                'Polynomial functions are continuous for every real input, differentiate term by term, and serve as fundamental models. Degree, leading coefficient, and zeros anticipate graph and end-behavior information.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas’ Calculus for connections between polynomials, functions, and Calculus.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the degree of P(x)=4x⁵−2x³+x−7?',
      choices: ['3', '4', '5'],
      correctIndex: 2,
      explanation:
          'The largest exponent of x with nonzero coefficient is 5.',
    ),
    takeaways: [
      'Polynomial monomials use nonnegative integer exponents.',
      'A polynomial is a finite sum of monomials.',
      'Standard form orders terms by descending degree.',
      'Degree is determined after combining like terms.',
      'Leading coefficient and constant term are key structural features.',
      'Zeros are values r for which P(r)=0.',
    ],
    closing:
        'Recognizing polynomial structure is the first step toward operating on, factoring, and interpreting polynomial functions.',
  )
  CourseLessonData(
    id: 'algebra-10-operacoes-polinomios',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Polynomial operations',
    description:
        'addition, subtraction, multiplication, division by a monomial, and structural evaluation',
    duration: '≈ 30 min',
    objective:
        'add, subtract, and multiply polynomials, divide by monomials when valid, write results in standard form, and justify each operation',
    symbol: 'P±Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Polynomial addition',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Combine only like terms',
            content:
                'Adding polynomials means collecting terms with the same literal part and exponent. Terms of different degrees cannot be merged into one term.',
          ),
          WorkedExampleBlockData(
            title: 'Adding two polynomials',
            problem: 'Add P(x)=3x²−2x+5 and Q(x)=−x²+4x−7.',
            steps: [
              'Quadratic terms: 3x²−x²=2x².',
              'Linear terms: −2x+4x=2x.',
              'Constants: 5−7=−2.',
            ],
            result: 'P(x)+Q(x)=2x²+2x−2.',
            interpretation:
                'Organizing terms by degree reduces incompatible combinations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Polynomial subtraction',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The minus sign affects the entire second polynomial',
            content:
                'P(x)−Q(x)=P(x)+[−Q(x)]. Distribute −1 through every term of Q before combining like terms.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Subtracting safely',
            problem: 'Compute (2x²+3x−1)−(x²−5x+4).',
            steps: [
              'Distribute the minus: 2x²+3x−1−x²+5x−4.',
              'Combine quadratic, linear, and constant terms.',
            ],
            result: 'x²+8x−5.',
            interpretation:
                'Changing only the first sign of the second polynomial is a common error.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Multiplication by a monomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Use distribution and exponent laws',
            content:
                'A monomial multiplying a polynomial must distribute to every term. Coefficients and literal powers are then simplified.',
          ),
          WorkedExampleBlockData(
            title: 'Monomial times polynomial',
            problem: 'Compute −3x²(2x³−x+4).',
            steps: [
              '−3x²·2x³=−6x⁵.',
              '−3x²·(−x)=3x³.',
              '−3x²·4=−12x².',
            ],
            result: '−6x⁵+3x³−12x².',
            interpretation:
                'The outside factor acts on coefficient and literal part of each term.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Polynomial multiplication',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Every term multiplies every term',
            content:
                'Multiply polynomials by repeated distribution, then combine like terms and order the result.',
          ),
          WorkedExampleBlockData(
            title: 'Binomial times trinomial',
            problem: 'Expand (x−2)(x²+3x+4).',
            steps: [
              'x(x²+3x+4)=x³+3x²+4x.',
              '−2(x²+3x+4)=−2x²−6x−8.',
              'Combine like terms.',
            ],
            result: 'x³+x²−2x−8.',
            interpretation:
                'The product degree is the sum of degrees when leading coefficients do not cancel.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Degree under operations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Sums and products behave differently',
            content:
                'For nonzero polynomials, degree(PQ)=degree(P)+degree(Q). In a sum, the degree can drop if leading terms cancel.',
          ),
          WorkedExampleBlockData(
            title: 'Leading-term cancellation',
            problem: 'Find the degree of (3x⁴+x)+(−3x⁴+2x²).',
            steps: [
              'The degree-four terms cancel.',
              'The result is 2x²+x.',
            ],
            result: 'The sum has degree 2.',
            interpretation:
                'The degree of a sum is not always the larger original degree.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Division by a monomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Divide term by term',
            content:
                'When a polynomial is divided by a nonzero monomial, each term may be divided separately where the expression is defined.',
          ),
          WorkedExampleBlockData(
            title: 'Term-by-term division',
            problem: 'Simplify (12x⁵−6x³+3x²)/(3x²), with x ≠ 0.',
            steps: [
              '12x⁵/(3x²)=4x³.',
              '−6x³/(3x²)=−2x.',
              '3x²/(3x²)=1.',
            ],
            result: '4x³−2x+1, with x ≠ 0.',
            interpretation:
                'The original domain restriction must be retained.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Evaluation after operations',
        blocks: [
          WorkedExampleBlockData(
            title: 'Operate first or evaluate first',
            problem: 'If P(x)=x²+1 and Q(x)=2x−3, find (P+Q)(2).',
            steps: [
              '(P+Q)(x)=x²+2x−2.',
              'At x=2: 4+4−2=6.',
              'Alternatively, P(2)=5 and Q(2)=1.',
            ],
            result: '(P+Q)(2)=6.',
            interpretation:
                'Both routes agree because evaluation is compatible with polynomial addition.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Adding exponents in a sum',
            content:
                'x²+x³ is not x⁵. Exponents are added only in products of equal bases.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting cross products',
            content:
                '(x+2)(x+3) is not x²+6. The cross terms produce 5x.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — addition and subtraction',
            problem: 'Compute (4x²−x+2)−(x²+3x−5).',
            steps: [
              'Distribute the negative sign.',
              'Combine like terms.',
            ],
            result: '3x²−4x+7.',
            interpretation:
                'Organizing by degree makes each combination visible.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — product',
            problem: 'Expand (2x+1)(x²−x+3).',
            steps: [
              '2x(x²−x+3)=2x³−2x²+6x.',
              '1(x²−x+3)=x²−x+3.',
              'Combine.',
            ],
            result: '2x³−x²+5x+3.',
            interpretation:
                'The final result is reduced and written in standard form.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Operate and write every result in standard form',
            content:
                '1. (2x+3)+(5x−1).\n'
                '2. (3x²−2x+4)+(−x²+x−6).\n'
                '3. (x²+5x)−(2x²−x+1).\n'
                '4. 4x(x²−3x+2).\n'
                '5. −2a²(3a−4).\n'
                '6. (x+4)(x−1).\n'
                '7. (2x−3)(x+5).\n'
                '8. (x−2)(x²+x+1).\n'
                '9. (3x+1)(2x²−x+4).\n'
                '10. (15x⁴−10x³+5x²)/(5x²).\n'
                '11. Find the degree of (x³+1)(2x²−x).\n'
                '12. Give an example where degree(P+Q) is lower than both original degrees.\n'
                '13. Find (P+Q)(1) for P(x)=x² and Q(x)=3x−2.\n'
                '14. Explain why (x+1)(x+1) is not x²+1.\n'
                '15. Verify question 7 by substituting x=1 before and after expansion.',
            emphasis:
                'Use numerical substitution as a checking strategy when appropriate.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Polynomial algebra appears throughout Calculus',
            content:
                'Difference quotients, limits, derivatives, and polynomial approximations rely on expansion, reduction, and factoring. These operations are part of Calculus reasoning, not separate from it.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax Algebra and Trigonometry 2e and College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas’ Calculus for polynomial manipulation in limits and derivatives.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is (x+2)(x−3)?',
      choices: ['x²−x−6', 'x²−6', 'x²+x−6'],
      correctIndex: 0,
      explanation:
          'By distribution: x²−3x+2x−6=x²−x−6.',
    ),
    takeaways: [
      'Addition and subtraction combine only like terms.',
      'In subtraction, the minus sign affects the entire second polynomial.',
      'Multiplication distributes every term across every term.',
      'The degree of a product adds the degrees of nonzero factors.',
      'The degree of a sum can drop through cancellation.',
      'Division by a monomial requires preserving domain restrictions.',
    ],
    closing:
        'Reliable polynomial operations begin with organizing structure before carrying out arithmetic.',
  )
  CourseLessonData(
    id: 'algebra-05-produtos-notaveis',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Special products',
    description:
        'expansion patterns derived from distribution and structural recognition',
    duration: '≈ 28 min',
    objective:
        'derive and apply special-product identities, recognize their patterns, and avoid using memorized formulas without structural justification',
    symbol: '(a+b)²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Special products come from distribution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Patterns, not magic formulas',
            content:
                'Special products are recurring multiplication patterns. Every identity in this lesson can be reconstructed from the distributive property.',
            emphasis:
                'If you forget a pattern, distribution remains a reliable method.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Square of a sum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: '(a+b)²',
            content:
                '(a+b)²=(a+b)(a+b)=a²+2ab+b².',
            emphasis:
                'The middle term 2ab comes from the two cross products ab and ba.',
          ),
          WorkedExampleBlockData(
            title: 'Using the square-of-a-sum pattern',
            problem: 'Expand (2x+3)².',
            steps: [
              '(2x)²=4x².',
              '2·(2x)·3=12x.',
              '3²=9.',
            ],
            result: '4x²+12x+9.',
            interpretation:
                'The middle term captures the interaction between the two binomial terms.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Square of a difference',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: '(a−b)²',
            content:
                '(a−b)²=a²−2ab+b². Only the middle term changes sign relative to the square of a sum.',
          ),
          WorkedExampleBlockData(
            title: 'Sign of the middle term',
            problem: 'Expand (3x−4)².',
            steps: [
              '(3x)²=9x².',
              '−2·(3x)·4=−24x.',
              '4²=16.',
            ],
            result: '9x²−24x+16.',
            interpretation:
                'The final term is positive because it comes from a square.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Product of a sum and a difference',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '(a+b)(a−b)',
            content:
                '(a+b)(a−b)=a²−b² because the cross terms cancel.',
            emphasis:
                'This identity is the expansion associated with a difference of squares.',
          ),
          WorkedExampleBlockData(
            title: 'Conjugate binomials',
            problem: 'Compute (5x+2)(5x−2).',
            steps: [
              'Identify a=5x and b=2.',
              'Use a²−b².',
            ],
            result: '25x²−4.',
            interpretation:
                'The linear term disappears because the cross terms cancel.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Cube of a binomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Cubic patterns',
            content:
                '(a+b)³=a³+3a²b+3ab²+b³ and (a−b)³=a³−3a²b+3ab²−b³.',
            emphasis:
                'The coefficients 1,3,3,1 arise from expanding three equal binomial factors.',
          ),
          WorkedExampleBlockData(
            title: 'Cube of a sum',
            problem: 'Expand (x+2)³.',
            steps: [
              'x³.',
              '3x²·2=6x².',
              '3x·2²=12x.',
              '2³=8.',
            ],
            result: 'x³+6x²+12x+8.',
            interpretation:
                'The pattern can always be checked by multiplying (x+2)² by (x+2).',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Recognizing patterns in reverse',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'From expanded form back to factors',
            content:
                'Recognizing x²+6x+9 as (x+3)² or 25x²−16 as (5x−4)(5x+4) is the bridge from special products to factoring.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '(a+b)² is not a²+b²',
            content:
                'The cross term 2ab cannot be omitted.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '(a−b)² does not end in −b²',
            content:
                'The final term is +b² because (−b)(−b)=+b².',
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
            problem: 'Expand (x−5)².',
            steps: [
              'x².',
              '−2·x·5=−10x.',
              '5²=25.',
            ],
            result: 'x²−10x+25.',
            interpretation:
                'First square, double product, second square.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Recognize 4x²−12x+9.',
            steps: [
              '4x²=(2x)² and 9=3².',
              'The middle term is −2·(2x)·3.',
            ],
            result: '(2x−3)².',
            interpretation:
                'The middle term confirms the perfect-square trinomial.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Expand or recognize the pattern',
            content:
                '1. (x+4)².\n'
                '2. (x−7)².\n'
                '3. (2x+5)².\n'
                '4. (3a−2)².\n'
                '5. (x+6)(x−6).\n'
                '6. (4y+1)(4y−1).\n'
                '7. (x+3)³.\n'
                '8. (2x−1)³.\n'
                '9. Recognize x²+10x+25.\n'
                '10. Recognize 9x²−24x+16.\n'
                '11. Factor x²−49 using a special product.\n'
                '12. Explain why (a+b)² is not a²+b².\n'
                '13. Compare (x−2)² and x²−4.\n'
                '14. Verify (2x+3)(2x−3) by distribution.\n'
                '15. Expand (a+b)³ by distribution and compare with the pattern.',
            emphasis:
                'When using a pattern, explicitly identify what plays the roles of a and b.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Patterns accelerate later simplifications',
            content:
                'Differences of squares and perfect-square trinomials appear in limit factorizations, rationalization, and difference-quotient algebra.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas’ Calculus for algebraic applications in limits.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the correct expansion of (x−3)²?',
      choices: ['x²−9', 'x²−6x+9', 'x²+6x+9'],
      correctIndex: 1,
      explanation:
          '(x−3)²=x²−2·x·3+3²=x²−6x+9.',
    ),
    takeaways: [
      'Special products follow from distribution.',
      '(a+b)²=a²+2ab+b².',
      '(a−b)²=a²−2ab+b².',
      '(a+b)(a−b)=a²−b².',
      'Recognizing patterns in reverse prepares factoring.',
      'Cross terms cannot be ignored.',
    ],
    closing:
        'Special products are safe shortcuts only when the underlying pattern is understood.',
  )
  CourseLessonData(
    id: 'algebra-06-fatoracao',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Factoring',
    description:
        'common factors, grouping, difference of squares, trinomials, and strategic selection',
    duration: '≈ 35 min',
    objective:
        'rewrite polynomials as products using several factoring techniques, verify results by expansion, and select a suitable technique from expression structure',
    symbol: 'ab+ac',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Factoring rewrites a sum as a product',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Distribution in reverse',
            content:
                'Factoring means rewriting an expression as a product of factors. The basic pattern is ab+ac=a(b+c).',
            emphasis:
                'A factorization can be checked by expanding the product.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Greatest common factor',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Find the largest common numerical and literal factor',
            content:
                'Use the greatest common divisor of coefficients and, for every common variable, the smallest exponent present.',
          ),
          WorkedExampleBlockData(
            title: 'Numerical and literal common factor',
            problem: 'Factor 12x³y−18x²y².',
            steps: [
              'GCD of 12 and 18 is 6.',
              'Smallest x power is x².',
              'Smallest y power is y.',
            ],
            result: '6x²y(2x−3y).',
            interpretation:
                'Expanding the result recovers the original expression.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Factoring by grouping',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Create a common factor in two stages',
            content:
                'Grouping terms can reveal partial common factors that then produce a common binomial factor.',
          ),
          WorkedExampleBlockData(
            title: 'Strategic grouping',
            problem: 'Factor x³+3x²+2x+6.',
            steps: [
              'Group: (x³+3x²)+(2x+6).',
              'Factor: x²(x+3)+2(x+3).',
              'Factor the common binomial.',
            ],
            result: '(x+3)(x²+2).',
            interpretation:
                'The grouping was chosen to produce the same binomial in both groups.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Difference of squares',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'a²−b²=(a−b)(a+b)',
            content:
                'A difference of two perfect squares factors into conjugate binomials.',
          ),
          WorkedExampleBlockData(
            title: 'Applying the pattern',
            problem: 'Factor 25x²−49.',
            steps: [
              '25x²=(5x)².',
              '49=7².',
            ],
            result: '(5x−7)(5x+7).',
            interpretation:
                'A sum of squares does not have the same real factorization pattern.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Perfect-square trinomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Recognize a²±2ab+b²',
            content:
                'If the first and last terms are perfect squares and the middle term is ±2ab, the trinomial is a perfect square.',
          ),
          WorkedExampleBlockData(
            title: 'Structural recognition',
            problem: 'Factor 9x²−24x+16.',
            steps: [
              '9x²=(3x)².',
              '16=4².',
              '−24x=−2·(3x)·4.',
            ],
            result: '(3x−4)².',
            interpretation:
                'All three terms must confirm the pattern.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Trinomials x²+bx+c',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Find two numbers',
            content:
                'For x²+bx+c, find p and q such that p+q=b and pq=c. Then x²+bx+c=(x+p)(x+q).',
          ),
          WorkedExampleBlockData(
            title: 'Monic quadratic trinomial',
            problem: 'Factor x²−5x+6.',
            steps: [
              'Need p+q=−5 and pq=6.',
              'Choose −2 and −3.',
            ],
            result: '(x−2)(x−3).',
            interpretation:
                'The corresponding roots are 2 and 3.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Trinomials ax²+bx+c',
        blocks: [
          WorkedExampleBlockData(
            title: 'Leading coefficient different from 1',
            problem: 'Factor 6x²+11x+3.',
            steps: [
              'Compute ac=18.',
              'Find two numbers with product 18 and sum 11: 9 and 2.',
              'Rewrite 11x as 9x+2x.',
              'Group and factor.',
            ],
            result: '(3x+1)(2x+3).',
            interpretation:
                'Splitting the middle term turns the problem into grouping.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Complete factorization',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Continue until no factor can be reduced further',
            content:
                'A polynomial may require more than one technique. Always check for a common factor first, then inspect the remaining factors.',
          ),
          WorkedExampleBlockData(
            title: 'Two stages',
            problem: 'Factor completely 2x³−18x.',
            steps: [
              'Factor 2x: 2x(x²−9).',
              'Use difference of squares.',
            ],
            result: '2x(x−3)(x+3).',
            interpretation:
                'Stopping at 2x(x²−9) is correct but not fully factored.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Choosing a strategy',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'A practical decision order',
            content:
                '1) common factor; 2) count terms; 3) with two terms, test square patterns; 4) with three terms, test perfect-square or quadratic trinomial patterns; 5) with four terms, try grouping; 6) verify by expansion.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelling terms instead of factors',
            content:
                'Factoring works with products. In x²+x, first write x(x+1); do not “cancel x” inside a sum.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Skipping the common factor',
            content:
                'In 3x²−12, first factor 3 to get 3(x²−4), then use difference of squares.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Factor completely',
            content:
                '1. 6x+12.\n'
                '2. 15x³−10x².\n'
                '3. x²−16.\n'
                '4. 9a²−25b².\n'
                '5. x²+8x+16.\n'
                '6. 4x²−12x+9.\n'
                '7. x²+7x+12.\n'
                '8. x²−x−12.\n'
                '9. 2x²+7x+3.\n'
                '10. 6x²+13x+6.\n'
                '11. x³+2x²+3x+6.\n'
                '12. 3x³−27x.\n'
                '13. 4x³+8x²−x−2.\n'
                '14. Explain how to verify a factorization.\n'
                '15. Choose the first technique for 10x³−40x and justify it.',
            emphasis:
                'After factoring, expand mentally or on paper to verify.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Factoring reveals cancellations and zeros',
            content:
                'In limits, factoring can remove an apparent indeterminate form after a common factor is cancelled. In functions, factored form reveals zeros and multiplicities.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart, Thomas, and Guidorizzi for applications of factoring to functions and limits.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the complete factorization of x²−9?',
      choices: ['(x−3)²', '(x−3)(x+3)', 'x(x−9)'],
      correctIndex: 1,
      explanation:
          'x²−9=x²−3² is a difference of squares.',
    ),
    takeaways: [
      'Factoring rewrites a sum as a product.',
      'Check for a common factor before specialized methods.',
      'Grouping creates common factors in stages.',
      'Difference of squares and perfect-square trinomials are structural patterns.',
      'Quadratic trinomials can be factored through sum-and-product relationships.',
      'Verify a factorization by expansion.',
    ],
    closing:
        'Factoring is a change of representation that reveals structure hidden in an expanded expression.',
  )
  CourseLessonData(
    id: 'algebra-07-fracoes-algebricas',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Algebra and factoring',
    title: 'Algebraic fractions',
    description:
        'domain, factoring, simplification, and operations with rational expressions',
    duration: '≈ 32 min',
    objective:
        'determine domain restrictions, simplify algebraic fractions by factors, and perform basic operations while preserving equivalence and excluded values',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'An algebraic fraction has a domain',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A denominator can never be zero',
            content:
                'In P(x)/Q(x), every value that makes Q(x)=0 must be excluded, even if a factor is later cancelled.',
            emphasis:
                'Find restrictions before simplifying.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Simple restriction',
            problem: 'Find the domain of (x+2)/(x−5).',
            steps: [
              'Require x−5 ≠ 0.',
              'Therefore x ≠ 5.',
            ],
            result: 'Domain: ℝ\{5}.',
            interpretation:
                'A numerator may be zero; a denominator may not.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Simplifying by factors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Only common factors may be cancelled',
            content:
                'Cancelling means dividing numerator and denominator by the same nonzero factor. Terms separated by addition or subtraction cannot be cancelled directly.',
          ),
          WorkedExampleBlockData(
            title: 'Factor before cancelling',
            problem: 'Simplify (x²−9)/(x²−3x).',
            steps: [
              'Original restrictions: x ≠ 0 and x ≠ 3.',
              'Factor numerator: (x−3)(x+3).',
              'Factor denominator: x(x−3).',
              'Cancel x−3 while retaining x ≠ 3.',
            ],
            result: '(x+3)/x, with x ≠ 0,3.',
            interpretation:
                'The simplified form does not restore x=3 to the original domain.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Multiplication',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Factor and simplify before multiplying',
            content:
                'Multiply numerators and denominators, but factoring first can reveal cancellations and reduce the work.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Division',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Multiply by the reciprocal',
            content:
                'Dividing by an algebraic fraction means multiplying by its reciprocal, provided the divisor is defined and nonzero.',
            emphasis:
                'The divisor numerator also cannot be zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Addition and subtraction',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Use a common denominator',
            content:
                'Fractions with different denominators must be rewritten over a common denominator before numerators are combined.',
          ),
          WorkedExampleBlockData(
            title: 'Adding algebraic fractions',
            problem: 'Simplify 2/x + 3/(x+1).',
            steps: [
              'Restrictions: x ≠ 0,−1.',
              'Common denominator: x(x+1).',
              'Numerator: 2(x+1)+3x=5x+2.',
            ],
            result: '(5x+2)/[x(x+1)], with x ≠ 0,−1.',
            interpretation:
                'Numerators are combined only after denominators agree.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Complex fractions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Fractions may contain other fractions',
            content:
                'Complex fractions can be simplified by clearing internal denominators while preserving all restrictions.',
          ),
          WorkedExampleBlockData(
            title: 'Clearing inner denominators',
            problem: 'Simplify (1/x+1/y)/(1/x), with x,y ≠ 0.',
            steps: [
              '1/x+1/y=(x+y)/(xy).',
              'Divide by 1/x by multiplying by x.',
            ],
            result: '(x+y)/y, with x,y ≠ 0.',
            interpretation:
                'The restriction x ≠ 0 remains even after x disappears from the final form.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelling terms in a sum',
            content:
                '(x+2)/x does not simplify by cancelling x because x is not a factor of the entire numerator.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting excluded values',
            content:
                '(x²−1)/(x−1) simplifies to x+1, but x=1 remains excluded from the original expression.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — simplification',
            problem: 'Simplify (x²−4x)/(x²−16).',
            steps: [
              'Factor numerator: x(x−4).',
              'Factor denominator: (x−4)(x+4).',
              'Restrictions: x ≠ ±4.',
              'Cancel x−4.',
            ],
            result: 'x/(x+4), with x ≠ ±4.',
            interpretation:
                'x=4 remains excluded.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — addition',
            problem: 'Simplify 1/(x−1)+1/(x+1).',
            steps: [
              'Restrictions: x ≠ ±1.',
              'Common denominator: (x−1)(x+1).',
              'Numerator: (x+1)+(x−1)=2x.',
            ],
            result: '2x/(x²−1), with x ≠ ±1.',
            interpretation:
                'Factoring also makes restrictions visible.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Find the domain and simplify where possible',
            content:
                '1. (x+1)/(x−2).\n'
                '2. (x²−4)/(x−2).\n'
                '3. (x²−9)/(x²−6x+9).\n'
                '4. (2x²+4x)/(2x).\n'
                '5. [(x²−1)/(x²+x)]·[x/(x−1)].\n'
                '6. [(x+2)/(x−3)]÷[(x+2)/(x+1)].\n'
                '7. 1/x+2/x.\n'
                '8. 1/x+1/(x+2).\n'
                '9. 3/(x−1)−2/(x+1).\n'
                '10. Explain why (x+3)/x does not allow x to be cancelled.\n'
                '11. Simplify (x²−25)/(x²−10x+25).\n'
                '12. List excluded values before simplifying (x²−4)/(x²−x−2).\n'
                '13. Give an example of a removable hole created by cancellation.\n'
                '14. Simplify (1/x+1)/(1/x).\n'
                '15. Explain why simplification does not change the original domain.',
            emphasis:
                'Write all restrictions before cancelling anything.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Rational expressions appear directly in limits',
            content:
                'Many algebraic limits require factoring and simplifying a rational function near an excluded point. Preserving domain information is essential for distinguishing function value from limit.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart, Thomas, and Guidorizzi for rational functions and limits.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'When simplifying (x²−4)/(x−2), which condition must remain?',
      choices: ['x ≠ −2', 'x ≠ 0', 'x ≠ 2'],
      correctIndex: 2,
      explanation:
          'The original denominator x−2 is zero at x=2, so that value remains excluded.',
    ),
    takeaways: [
      'Denominators determine domain restrictions.',
      'Only common factors may be cancelled.',
      'Restrictions should be recorded before simplification.',
      'Addition and subtraction require a common denominator.',
      'Division by a fraction uses the reciprocal and adds nonzero conditions.',
      'Simplification does not restore excluded points.',
    ],
    closing:
        'Algebraic fractions require two simultaneous habits: manipulate factors and preserve the domain.',
  )
  CourseLessonData(
    id: 'algebra-08-sintese',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Synthesis',
    title: 'Algebra synthesis',
    description:
        'strategy selection, integration of techniques, and preparation for equations, functions, and limits',
    duration: '≈ 30 min',
    objective:
        'select and combine algebraic techniques according to the goal, justify transformations, preserve domain restrictions, and choose useful equivalent forms',
    symbol: '⇄',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'There is no universally best form',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The useful form depends on the question',
            content:
                'Expanded form helps combine terms. Factored form reveals zeros and cancellations. Simplified rational form reveals behavior. The best form is the one that exposes the needed structure.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'A decision routine',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Before calculating, decide what you need to see',
            content:
                'Ask: Are there parentheses to expand? Like terms to combine? A common factor? A special-product pattern? Denominators and restrictions? Would factored form be more informative?',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Integrated example: expand and reduce',
        blocks: [
          WorkedExampleBlockData(
            title: 'Several techniques in sequence',
            problem: 'Simplify 2(x+3)−(x−1)(x+2).',
            steps: [
              'Expand 2(x+3)=2x+6.',
              'Expand (x−1)(x+2)=x²+x−2.',
              'Subtract the entire second expression.',
              'Combine like terms.',
            ],
            result: '−x²+x+8.',
            interpretation:
                'Distribution, sign control, and reduction appear in one problem.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Integrated example: factor before simplifying',
        blocks: [
          WorkedExampleBlockData(
            title: 'Domain and cancellation',
            problem: 'Simplify (x²−9)/(x²−x−6).',
            steps: [
              'Factor denominator: (x−3)(x+2), so x ≠ 3,−2.',
              'Factor numerator: (x−3)(x+3).',
              'Cancel x−3.',
            ],
            result: '(x+3)/(x+2), with x ≠ 3,−2.',
            interpretation:
                'Factored form revealed the cancellation while the original domain remained.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Integrated example: choose a representation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Equivalent forms reveal different information',
            content:
                'x²−5x+6 and (x−2)(x−3) are equivalent. Expanded form shows coefficients; factored form shows zeros. Equivalent does not mean equally useful for every question.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Verification as a mathematical habit',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Three ways to check',
            content:
                'Check an expansion by reapplying distribution, check a factorization by expanding it, and test equivalent forms at allowed numerical values. Checking supports, but does not replace, general justification.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Strategic errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Expanding when factoring is more useful',
            content:
                'In a limit containing x²−9 over x−3, factoring reveals the common factor while expansion does not.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Simplifying without recording domain restrictions',
            content:
                'A rational expression may visually lose a restriction after cancellation. The domain must be determined first.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Guided challenge',
        blocks: [
          WorkedExampleBlockData(
            title: 'Combine the tools',
            problem: 'Simplify [(x²−4)/(x²−4x+4)]·[(x−2)/(x+2)].',
            steps: [
              'Original restrictions: x ≠ 2,−2.',
              'Factor x²−4=(x−2)(x+2).',
              'Factor x²−4x+4=(x−2)².',
              'Cancel common factors only.',
            ],
            result: '1, with x ≠ 2 and x ≠ −2.',
            interpretation:
                'The expression becomes simple but is not identical to the constant function 1 at the excluded points.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Integrative practice',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Choose a technique before calculating',
            content:
                '1. Simplify 3(x−2)+2(x+5).\n'
                '2. Expand (2x−3)².\n'
                '3. Factor 6x²−24.\n'
                '4. Factor x²+9x+20.\n'
                '5. Simplify (x²−16)/(x−4), recording domain.\n'
                '6. Add 1/x+1/(x+1).\n'
                '7. Find the degree of 4x⁵−x³+2.\n'
                '8. Multiply (x−2)(x²+2x+4).\n'
                '9. Explain when factored form is preferable.\n'
                '10. Explain when expanded form is preferable.\n'
                '11. Give a counterexample to (a+b)²=a²+b².\n'
                '12. Check whether 3 is a root of x²−5x+6.\n'
                '13. Simplify (x²−1)/(x²+x), recording restrictions.\n'
                '14. Factor completely 2x³−8x.\n'
                '15. Explain why cancelling factors does not restore domain values.',
            emphasis:
                'Before each problem, name your chosen strategy: expand, reduce, factor, operate, or analyze domain.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Bridge to equations and functions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Algebra is infrastructure for the rest of the course',
            content:
                'Equations use equivalence and factoring; functions use domain and evaluation; limits use factoring and simplification; derivatives depend on all of these skills again.',
            emphasis:
                'The goal is not mechanical speed but conscious control of transformations.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for the unit',
            content:
                'Consolidated references: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; James Stewart, Thomas’ Calculus, and Guidorizzi for the bridge from algebra to functions and Calculus.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'To simplify (x²−25)/(x−5), which structural action should come first?',
      choices: [
        'Factor x²−25',
        'Substitute x=5',
        'Add 25 to the denominator',
      ],
      correctIndex: 0,
      explanation:
          'x²−25=(x−5)(x+5), revealing the common factor while x=5 remains excluded.',
    ),
    takeaways: [
      'The most useful form depends on the goal.',
      'Expanding, reducing, and factoring are complementary tools.',
      'Domain restrictions must survive rational simplification.',
      'Special products connect expansion and factoring.',
      'Checking reduces errors but should accompany algebraic justification.',
      'Organized algebra prepares equations, functions, limits, and derivatives.',
    ],
    closing:
        'Algebraic maturity begins when the question changes from “How do I calculate this?” to “Which form reveals the structure I need?”.',
  )
];
