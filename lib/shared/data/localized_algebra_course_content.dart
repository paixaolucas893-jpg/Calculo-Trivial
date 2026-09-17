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
    duration: '≈ 12 min',
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
    eyebrow: 'Foundations',
    title: 'Like terms',
    description: 'coefficients, constants, and simplification',
    duration: '≈ 5 min',
    objective:
        'simplify sums and differences by combining only terms with the same literal part',
    symbol: '3x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Only terms from the same family combine',
            content:
                'Like terms have exactly the same literal part, with the same variables and the same exponents. That is why 4x and −7x can be combined, while 4x and 4x² cannot.',
            emphasis:
                'The rule is simple: add the coefficients and preserve the literal part.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Grouping carefully',
            problem: 'Simplify 6x² − 3x + 5x² + 8x − 4.',
            steps: [
              'Group the x² terms: 6x² + 5x² = 11x².',
              'Group the x terms: −3x + 8x = 5x.',
              'The constant −4 remains unchanged.',
            ],
            result: 'The simplified form is 11x² + 5x − 4.',
            interpretation:
                'No term changed its nature; we only combined compatible parts.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which expression is equivalent to 2x + 5x − 3?',
      choices: ['7x − 3', '10x − 3', '4x'],
      correctIndex: 0,
      explanation:
          'We add only 2x and 5x, obtaining 7x. The constant −3 remains.',
    ),
    takeaways: [
      'Like terms have the same literal part.',
      'Different exponents prevent terms from being combined.',
      'Constants combine only with constants.',
      'Grouping terms makes calculations safer.',
    ],
    closing:
        'Mastering like terms makes equations, functions, and derivatives much easier.',
  ),
  CourseLessonData(
    id: 'algebra-03-distributiva',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Distributive property and signs',
    description: 'parentheses, products, and negative signs',
    duration: '≈ 5 min',
    objective:
        'apply the distributive property without losing signs inside parentheses',
    symbol: 'a(b+c)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Distributing means crossing the parentheses',
            content:
                'In a(b + c), the factor a multiplies every term inside the parentheses. Thus, a(b + c) = ab + ac. If there is subtraction, the sign of the term also takes part in the multiplication.',
            emphasis:
                'A classic mistake is multiplying only the first term and forgetting the second.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Parentheses with a negative sign',
            problem: 'Simplify −2(x − 5) + 3x.',
            steps: [
              'Distribute −2: −2x + 10.',
              'Add the remaining term: −2x + 10 + 3x.',
              'Combine like terms: x + 10.',
            ],
            result: 'The simplified expression is x + 10.',
            interpretation:
                'The term −5 became +10 because a negative times a negative is positive.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the expanded form of 3(x − 4)?',
      choices: ['3x − 4', '3x − 12', 'x − 12'],
      correctIndex: 1,
      explanation: 'The 3 multiplies both x and −4, so 3(x − 4) = 3x − 12.',
    ),
    takeaways: [
      'The distributive property connects multiplication and addition.',
      'Every term inside the parentheses must be multiplied.',
      'Negative signs must be carried carefully.',
      'After distributing, combine like terms.',
    ],
    closing:
        'The distributive property is one of the most common tools for preparing expressions before Calculus.',
  ),
  CourseLessonData(
    id: 'algebra-04-potencias',
    topicId: 'algebra-fundamental',
    trailTitle: 'Fundamental Algebra',
    eyebrow: 'Foundations',
    title: 'Powers and exponents',
    description: 'multiplication and division rules',
    duration: '≈ 5 min',
    objective:
        'use exponent rules to simplify monomials and algebraic expressions',
    symbol: 'x²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Understand the idea',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Same base, correct rule',
            content:
                'When multiplying powers with the same base, add the exponents: x²·x³ = x⁵. When dividing, subtract the exponents, provided the base is not zero: x⁵/x² = x³.',
            emphasis: 'Do not add the bases. The exponent is what changes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Coefficient and variable',
            problem: 'Simplify (−2x³)².',
            steps: [
              'Square the coefficient: (−2)² = 4.',
              'Multiply the variable exponents: (x³)² = x⁶.',
              'Combine the parts: 4x⁶.',
            ],
            result: 'The simplified form is 4x⁶.',
            interpretation:
                'Squaring makes the coefficient positive and doubles the exponent of the variable.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the result of x⁴·x²?',
      choices: ['x⁶', 'x⁸', '2x⁶'],
      correctIndex: 0,
      explanation: 'The bases are equal, so add the exponents: 4 + 2 = 6.',
    ),
    takeaways: [
      'Multiplying powers with the same base adds exponents.',
      'Dividing powers with the same base subtracts exponents.',
      'A power of a power multiplies exponents.',
      'Coefficients also follow sign rules.',
    ],
    closing:
        'Strong exponent skills simplify polynomials, functions, and limits.',
  ),
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
