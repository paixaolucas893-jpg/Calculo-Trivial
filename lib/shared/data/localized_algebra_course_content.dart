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
    id: 'algebra-05-produtos-notaveis',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Special products',
    description: 'patterns that speed up calculations',
    duration: '≈ 5 min',
    objective:
        'recognize squares, differences of squares, and common binomial products',
    symbol: '(a+b)²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title:
                'A special product is meaningful distributive work remembered',
            content:
                'Special products are not isolated tricks. They come from the distributive property and appear so often that recognizing the pattern quickly is useful.',
            emphasis: '(a + b)² = a² + 2ab + b², not just a² + b².',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Expanding with a pattern',
            problem: 'Expand (x − 5)².',
            steps: [
              'Use (a − b)² = a² − 2ab + b².',
              'Here, a = x and b = 5.',
              'Substitute: x² − 2·x·5 + 25.',
            ],
            result: 'The result is x² − 10x + 25.',
            interpretation:
                'The middle term appears because the binomial was multiplied by itself.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the expansion of (x + 3)²?',
      choices: ['x² + 9', 'x² + 6x + 9', 'x² + 3x + 9'],
      correctIndex: 1,
      explanation:
          'The middle term is 2·x·3 = 6x. Therefore, (x + 3)² = x² + 6x + 9.',
    ),
    takeaways: [
      'Special products come from the distributive property.',
      'The square of a sum includes a middle term.',
      'A difference of squares factors as (a − b)(a + b).',
      'Recognizing patterns speeds up simplification.',
    ],
    closing:
        'Special products are reliable shortcuts when you understand where they come from.',
  ),
  CourseLessonData(
    id: 'algebra-06-fatoracao',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Factoring',
    description: 'rewriting expressions as products',
    duration: '≈ 5 min',
    objective:
        'factor expressions using a common factor, grouping, and special patterns',
    symbol: '(x−a)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'From a sum to a product',
            content:
                'Factoring means rewriting an expression as a product of factors. This reveals roots, allows algebraic fractions to cancel, and resolves limits with indeterminate forms.',
            emphasis:
                'In Calculus, factoring often turns a stuck problem into a simple calculation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Factoring out a common factor',
            problem: 'Factor 8x² − 12x.',
            steps: [
              'Find the greatest common factor: 4x.',
              'Divide each term by 4x: 8x²/(4x) = 2x and −12x/(4x) = −3.',
              'Write the product: 4x(2x − 3).',
            ],
            result: 'The factorization is 4x(2x − 3).',
            interpretation:
                'If you distribute 4x again, you recover the original expression.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the factorization of x² − 16?',
      choices: ['(x − 4)(x + 4)', '(x − 8)(x + 8)', '(x − 4)²'],
      correctIndex: 0,
      explanation: 'It is a difference of squares: x² − 4² = (x − 4)(x + 4).',
    ),
    takeaways: [
      'Factoring rewrites sums as products.',
      'A common factor is the first pattern to look for.',
      'Difference of squares appears very often.',
      'Always check by distributing back.',
    ],
    closing:
        'Factoring is a direct bridge between Algebra, equations, functions, and limits.',
  ),
  CourseLessonData(
    id: 'algebra-07-fracoes-algebricas',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Algebraic fractions',
    description: 'restrictions, simplification, and denominators',
    duration: '≈ 5 min',
    objective:
        'simplify algebraic fractions while preserving domain restrictions',
    symbol: 'x/y',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Not every cancellation is allowed',
            content:
                'Only common multiplicative factors can be canceled. A term inside a sum cannot be canceled as if it were a factor. Also, denominators can never be zero.',
            emphasis:
                'In (x + 2)/x, x cannot cancel with part of the numerator because x + 2 is a sum.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Correct cancellation',
            problem: 'Simplify (x² − 9)/(x − 3), with x ≠ 3.',
            steps: [
              'Factor the numerator: x² − 9 = (x − 3)(x + 3).',
              'Rewrite the fraction: [(x − 3)(x + 3)]/(x − 3).',
              'Cancel the common factor x − 3 while keeping the restriction x ≠ 3.',
            ],
            result: 'The simplified form is x + 3, with x ≠ 3.',
            interpretation:
                'The simplified expression looks unrestricted, but the original restriction still applies.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'In which expression is canceling x valid?',
      choices: ['(x + 5)/x', '(3x)/(x)', '(x − 2)/x'],
      correctIndex: 1,
      explanation:
          'In 3x/x, x is a common factor in the numerator and denominator. In the others, x is inside a sum or difference.',
    ),
    takeaways: [
      'A zero denominator is not allowed.',
      'Cancel factors, not terms in a sum.',
      'Factoring before canceling prevents mistakes.',
      'Original restrictions remain important.',
    ],
    closing:
        'Algebraic fractions explain many details about domain, continuity, and limits.',
  ),
  CourseLessonData(
    id: 'algebra-08-sintese',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Algebra synthesis',
    description: 'choosing the right tool',
    duration: '≈ 5 min',
    objective: 'decide when to simplify, expand, factor, or substitute values',
    symbol: '✓',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'There is no single best form',
            content:
                'Expanding helps combine terms. Factoring helps reveal products, roots, and cancellations. Substituting values helps check results and interpret expressions.',
            emphasis:
                'A strong Calculus student does not just memorize calculations; they choose the form that reveals the idea.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'From clutter to a useful form',
            problem: 'Simplify 2(x + 1) + (x − 3)(x + 3).',
            steps: [
              'Distribute the first term: 2x + 2.',
              'Use the difference of squares: (x − 3)(x + 3) = x² − 9.',
              'Combine: x² + 2x − 7.',
            ],
            result: 'The simplified expression is x² + 2x − 7.',
            interpretation:
                'We used the distributive property and a special product in the same expression.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'To simplify (x² − 25)/(x − 5), which tool should come first?',
      choices: [
        'Factor x² − 25',
        'Substitute x = 5',
        'Add 25 to the denominator',
      ],
      correctIndex: 0,
      explanation:
          'The difference of squares lets us write x² − 25 as (x − 5)(x + 5), revealing the common factor.',
    ),
    takeaways: [
      'Expanding, factoring, and substituting serve different purposes.',
      'Factored form reveals cancellations and roots.',
      'Expanded form makes combining terms easier.',
      'Checking your path reduces hidden mistakes.',
    ],
    closing:
        'With this toolbox ready, the next lessons stop feeling like magic and start feeling like strategy.',
  ),
];
