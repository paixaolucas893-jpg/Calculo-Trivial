import 'package:flutter/widgets.dart';

import 'package:calcquest/shared/domain/course_lesson_data.dart';

List<CourseLessonData> localizedPrecalculusEquationsSupplementLessons(
  Locale locale,
) {
  if (locale.languageCode == 'en') {
    return _englishLessons;
  }
  return precalculusEquationsSupplementLessons;
}

const List<CourseLessonData> precalculusEquationsSupplementLessons = [
  CourseLessonData(
    id: 'equations-09-radicais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Pré-Cálculo',
    title: 'Equações com radicais',
    description:
        'domínio, isolamento, potenciação, soluções estranhas e verificação',
    duration: '≈ 32 min',
    objective:
        'resolver equações com radicais preservando restrições de domínio, identificar quando a potenciação pode introduzir soluções estranhas e verificar sistematicamente cada candidato na equação original',
    symbol: '√x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Equações radicais exigem domínio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A existência da raiz vem antes da álgebra',
            content:
                'Em uma equação com raiz de índice par, o radicando deve ser não negativo. Se a raiz estiver no denominador, o radicando deve ser estritamente positivo.',
            emphasis:
                'A análise de domínio pode eliminar candidatos antes mesmo da resolução algébrica.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Isole o radical primeiro',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Potenciar depois de organizar',
            content:
                'A estratégia mais segura é isolar a expressão radical e só então elevar ambos os membros a uma potência compatível com o índice da raiz.',
            emphasis:
                'Elevar ao quadrado preserva toda solução original, mas pode introduzir candidatos extras.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Por que aparecem soluções estranhas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A implicação não é reversível em geral',
            content:
                'Se a=b, então a²=b². Porém, a²=b² não implica necessariamente a=b, pois também pode ocorrer a=−b. Por isso, elevar ao quadrado pode ampliar o conjunto de candidatos.',
            emphasis:
                'A equação transformada pode ter mais soluções do que a equação original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exemplo completo com uma raiz',
        blocks: [
          WorkedExampleBlockData(
            title: 'Resolver e verificar',
            problem: 'Resolva √(x+1)=x−1.',
            steps: [
              'A raiz é não negativa, então x−1≥0 e, portanto, x≥1.',
              'Eleve ao quadrado: x+1=(x−1)².',
              'Expanda: x+1=x²−2x+1.',
              'Reorganize: x²−3x=0.',
              'Fatore: x(x−3)=0.',
              'Candidatos: x=0 e x=3.',
              'A restrição x≥1 elimina x=0.',
              'Verifique x=3 na equação original: √4=2 e 3−1=2.',
            ],
            result: 'S={3}.',
            interpretation:
                'A verificação final remove candidatos incompatíveis com a equação original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Radical em apenas um membro',
        blocks: [
          WorkedExampleBlockData(
            title: 'Isolamento simples',
            problem: 'Resolva √(2x+3)=5.',
            steps: [
              'Condição de domínio: 2x+3≥0.',
              'Eleve ao quadrado: 2x+3=25.',
              'Então 2x=22 e x=11.',
              'Verifique: √25=5.',
            ],
            result: 'S={11}.',
            interpretation:
                'Quando um lado já é uma constante não negativa, o processo é direto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Radicais nos dois membros',
        blocks: [
          WorkedExampleBlockData(
            title: 'Duas raízes quadradas',
            problem: 'Resolva √(x+6)=√(2x−1).',
            steps: [
              'Domínio: x+6≥0 e 2x−1≥0, então x≥1/2.',
              'Eleve ao quadrado: x+6=2x−1.',
              'Resolva: x=7.',
              'Verifique no domínio e na equação original.',
            ],
            result: 'S={7}.',
            interpretation:
                'Com raízes quadradas principais nos dois lados, a igualdade dos radicais permite comparar os radicandos dentro do domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Mais de um radical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Pode ser necessário repetir o processo',
            content:
                'Quando há dois radicais e não é possível compará-los diretamente, isole um deles, eleve à potência adequada, reorganize e, se ainda restar radical, repita o procedimento.',
            emphasis:
                'Cada potenciação aumenta a necessidade de verificação final.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Raízes de índice ímpar',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O comportamento é diferente',
            content:
                'Raízes de índice ímpar admitem radicandos negativos. Além disso, elevar ambos os lados a uma potência ímpar é uma transformação reversível nos reais.',
            emphasis:
                'O risco clássico de soluções estranhas é especialmente associado a potências pares.',
          ),
          WorkedExampleBlockData(
            title: 'Raiz cúbica',
            problem: 'Resolva ∛(2x−1)=3.',
            steps: [
              'Eleve ambos os membros ao cubo.',
              '2x−1=27.',
              '2x=28.',
            ],
            result: 'x=14.',
            interpretation:
                'Não há restrição de sinal para a raiz cúbica real.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Elevar antes de isolar',
            content:
                'Quadrar uma soma contendo radical pode criar expressões desnecessariamente complexas. Isole o radical sempre que possível.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar o domínio',
            content:
                'Um candidato obtido algebricamente pode violar a condição de existência da raiz.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não verificar candidatos',
            content:
                'Soluções da equação transformada não são automaticamente soluções da equação original.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Resolva √(x+4)=x−2.',
            steps: [
              'Como a raiz é não negativa, x−2≥0, então x≥2.',
              'Eleve ao quadrado: x+4=(x−2)².',
              'Obtenha x²−5x=0.',
              'Candidatos: x=0 e x=5.',
              'A restrição elimina x=0.',
            ],
            result: 'S={5}.',
            interpretation:
                'A condição de sinal do segundo membro já antecipava parte da verificação.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Resolva √(3x−2)=4.',
            steps: [
              'Eleve ao quadrado: 3x−2=16.',
              '3x=18.',
            ],
            result: 'x=6.',
            interpretation:
                'A verificação confirma √16=4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e verifique cada candidato',
            content:
                '1. √x=4.\n'
                '2. √(x+5)=3.\n'
                '3. √(2x−1)=5.\n'
                '4. √(x+2)=x.\n'
                '5. √(x+6)=x−2.\n'
                '6. √(x+3)=√(2x−4).\n'
                '7. ∛(x−1)=2.\n'
                '8. Determine o domínio de √(3−x).\n'
                '9. Explique por que elevar ao quadrado pode criar soluções estranhas.\n'
                '10. Dê um exemplo de candidato estranho.\n'
                '11. Resolva √(x−1)+1=4.\n'
                '12. Resolva √(2x+7)=x+1.\n'
                '13. Compare o comportamento de raízes pares e ímpares.\n'
                '14. Explique por que a verificação deve ser feita na equação original.\n'
                '15. Crie uma equação radical cuja solução seja x=5.',
            emphasis:
                'Escreva primeiro as restrições de domínio e só depois inicie a manipulação algébrica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Domínio e equivalência continuam centrais',
            content:
                'Funções radicais aparecem em limites, derivadas e modelagem. Saber preservar domínio e distinguir equivalência de mera implicação evita erros em manipulações posteriores.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas e Guidorizzi para funções radicais, domínio e transformações algébricas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Por que devemos testar as respostas ao final de uma equação com radical?',
      choices: [
        'Porque elevar ao quadrado pode introduzir soluções estranhas',
        'Porque raízes nunca admitem soluções positivas',
        'Porque toda equação radical tem duas soluções',
      ],
      correctIndex: 0,
      explanation:
          'Elevar ao quadrado não é reversível em todos os casos. A equação transformada pode ter candidatos que não satisfazem a equação original.',
    ),
    takeaways: [
      'Domínio deve ser analisado antes da resolução.',
      'Isole o radical antes de elevar a uma potência.',
      'Potências pares podem introduzir soluções estranhas.',
      'Raízes de índice ímpar têm comportamento diferente.',
      'Candidatos devem ser verificados na equação original.',
      'Mais de um radical pode exigir potenciações sucessivas.',
    ],
    closing:
        'Equações radicais exigem disciplina lógica: domínio, transformação, candidatos e verificação formam um único processo.',
  )
  CourseLessonData(
    id: 'equations-10-inequacoes-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Pré-Cálculo',
    title: 'Inequações quadráticas',
    description: 'raízes críticas, sinal e intervalos',
    duration: '≈ 15 min',
    objective:
        'resolver inequações quadráticas por fatoração e estudo de sinal em intervalos',
    symbol: 'x²≥0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'As raízes dividem a reta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Pontos críticos organizam o sinal',
            content:
                'Depois de levar todos os termos para um lado, fatoramos a expressão quando possível. Os zeros dos fatores dividem a reta em intervalos. Em cada intervalo, o sinal do produto permanece constante até atravessarmos uma raiz.',
            emphasis:
                'A inequação pede intervalos, não apenas as raízes da equação associada.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Produto positivo',
            problem: 'Resolva x² − 5x + 6 > 0.',
            steps: [
              'Fatore: x² − 5x + 6 = (x − 2)(x − 3).',
              'Os pontos críticos são x = 2 e x = 3.',
              'Para x < 2, os dois fatores são negativos e o produto é positivo.',
              'Para 2 < x < 3, os fatores têm sinais opostos e o produto é negativo.',
              'Para x > 3, os dois fatores são positivos.',
              'Como a desigualdade é estrita, 2 e 3 não entram.',
            ],
            result: 'A solução é (−∞, 2) ∪ (3, +∞).',
            interpretation:
                'A solução reúne os intervalos onde o gráfico da quadrática está acima do eixo x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Conexão com gráficos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Sinal é posição vertical',
            content:
                'Quando f(x) > 0, o gráfico está acima do eixo x. Quando f(x) < 0, está abaixo. O estudo de sinal antecipa a análise de crescimento e comportamento usada no Cálculo.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Se (x − 1)(x + 4) ≤ 0, qual intervalo resolve a inequação?',
      choices: ['[−4, 1]', '(−∞, −4] ∪ [1, +∞)', '(−4, 1)'],
      correctIndex: 0,
      explanation:
          'O produto é não positivo entre as raízes. Como ≤ inclui os zeros, entram −4 e 1.',
    ),
    takeaways: [
      'Leve a inequação para a forma expressão comparada com zero.',
      'As raízes são pontos críticos do estudo de sinal.',
      'Teste o sinal em cada intervalo.',
      'Use colchetes quando a igualdade também for aceita.',
    ],
    closing:
        'Resolver uma inequação quadrática é descobrir em quais regiões uma função é positiva ou negativa.',
  ),
  CourseLessonData(
    id: 'equations-11-inequacoes-racionais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Pré-Cálculo',
    title: 'Inequações racionais',
    description: 'zeros, pontos proibidos e tabela de sinais',
    duration: '≈ 18 min',
    objective:
        'resolver inequações racionais distinguindo zeros do numerador de valores proibidos do denominador',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Nem todo ponto crítico pode entrar',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Denominador zero é sempre proibido',
            content:
                'Em uma inequação racional, zeros do numerador podem pertencer à solução quando a desigualdade inclui igualdade. Zeros do denominador nunca pertencem ao domínio e devem permanecer excluídos.',
            emphasis:
                'Marque separadamente zeros e pontos proibidos antes de montar a tabela de sinais.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Zero permitido, denominador proibido',
            problem: 'Resolva (x − 2)/(x + 1) ≥ 0.',
            steps: [
              'O numerador zera em x = 2.',
              'O denominador zera em x = −1; esse valor é proibido.',
              'Os pontos −1 e 2 dividem a reta em três intervalos.',
              'Em (−∞, −1), numerador e denominador são negativos: quociente positivo.',
              'Em (−1, 2), os sinais são opostos: quociente negativo.',
              'Em (2, +∞), ambos são positivos.',
              'Como ≥ aceita zero, x = 2 entra; x = −1 nunca entra.',
            ],
            result: 'A solução é (−∞, −1) ∪ [2, +∞).',
            interpretation:
                'A exclusão de −1 vem do domínio, não do sinal da inequação.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Pontos proibidos antecipam assíntotas',
            content:
                'Em funções racionais, zeros do denominador são candidatos a descontinuidades e assíntotas verticais. Reconhecê-los já no Pré-Cálculo prepara a análise de limites.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Em (x + 3)/(x − 5) < 0, qual valor jamais pode pertencer à solução?',
      choices: ['−3', '0', '5'],
      correctIndex: 2,
      explanation:
          'x = 5 zera o denominador, então a expressão não está definida nesse ponto.',
    ),
    takeaways: [
      'Zeros do numerador e do denominador têm papéis diferentes.',
      'Denominador zero é sempre excluído.',
      'Pontos críticos dividem a reta para o estudo de sinal.',
      'Inequações racionais preparam domínio e assíntotas.',
    ],
    closing:
        'O estudo de sinal de quocientes conecta álgebra, domínio e comportamento de funções.',
  ),
];

const List<CourseLessonData> _englishLessons = [
  CourseLessonData(
    id: 'equations-09-radicais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Precalculus',
    title: 'Radical equations',
    description:
        'domain, isolation, powers, extraneous solutions, and verification',
    duration: '≈ 32 min',
    objective:
        'solve radical equations while preserving domain restrictions, identify when powers may introduce extraneous solutions, and verify every candidate in the original equation',
    symbol: '√x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Radical equations require domain analysis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Existence comes before algebra',
            content:
                'For an even-index root, the radicand must be nonnegative. If the root appears in a denominator, the radicand must be strictly positive.',
            emphasis:
                'Domain analysis can eliminate candidates before algebraic solving begins.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Isolate the radical first',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Raise powers only after organizing',
            content:
                'The safest strategy is to isolate the radical expression and only then raise both sides to a power compatible with the radical index.',
            emphasis:
                'Squaring preserves every original solution but may introduce extra candidates.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Why extraneous solutions appear',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'The implication is not reversible in general',
            content:
                'If a=b, then a²=b². But a²=b² does not imply only a=b, because a=−b is also possible. Squaring can therefore enlarge the candidate set.',
            emphasis:
                'The transformed equation may have more solutions than the original equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Complete example with one radical',
        blocks: [
          WorkedExampleBlockData(
            title: 'Solve and verify',
            problem: 'Solve √(x+1)=x−1.',
            steps: [
              'The square root is nonnegative, so x−1≥0 and x≥1.',
              'Square both sides: x+1=(x−1)².',
              'Expand and rearrange: x²−3x=0.',
              'Factor: x(x−3)=0.',
              'Candidates: x=0 and x=3.',
              'The restriction eliminates x=0.',
              'Check x=3 in the original equation.',
            ],
            result: 'S={3}.',
            interpretation:
                'Final verification removes candidates that do not satisfy the original equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'A radical on one side',
        blocks: [
          WorkedExampleBlockData(
            title: 'Simple isolation',
            problem: 'Solve √(2x+3)=5.',
            steps: [
              'Domain condition: 2x+3≥0.',
              'Square: 2x+3=25.',
              'Then x=11.',
              'Check √25=5.',
            ],
            result: 'S={11}.',
            interpretation:
                'When the other side is already a nonnegative constant, the process is direct.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Radicals on both sides',
        blocks: [
          WorkedExampleBlockData(
            title: 'Two square roots',
            problem: 'Solve √(x+6)=√(2x−1).',
            steps: [
              'Domain: x≥1/2.',
              'Square both sides: x+6=2x−1.',
              'Solve: x=7.',
              'Verify in the original equation.',
            ],
            result: 'S={7}.',
            interpretation:
                'Within the domain, equality of principal square roots allows comparison of radicands.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'More than one radical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'The process may need to be repeated',
            content:
                'With multiple radicals, isolate one radical, raise both sides to a suitable power, reorganize, and repeat if another radical remains.',
            emphasis:
                'Each power operation increases the importance of final verification.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Odd-index roots',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Their behavior is different',
            content:
                'Odd-index roots allow negative radicands. Raising both sides to the corresponding odd power is reversible over the real numbers.',
            emphasis:
                'The classic extraneous-solution problem is especially associated with even powers.',
          ),
          WorkedExampleBlockData(
            title: 'Cube root',
            problem: 'Solve ∛(2x−1)=3.',
            steps: [
              'Cube both sides.',
              '2x−1=27.',
              'Then x=14.',
            ],
            result: 'S={14}.',
            interpretation:
                'Real cube roots have no sign restriction on the radicand.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Raising powers before isolating',
            content:
                'Squaring a sum containing a radical can create unnecessary complexity. Isolate the radical first whenever possible.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring the domain',
            content:
                'An algebraic candidate may violate the existence condition of the radical.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Skipping verification',
            content:
                'Solutions of the transformed equation are not automatically solutions of the original equation.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1',
            problem: 'Solve √(x+4)=x−2.',
            steps: [
              'Because the root is nonnegative, x≥2.',
              'Square: x+4=(x−2)².',
              'Obtain x²−5x=0.',
              'Candidates are 0 and 5.',
              'The restriction removes 0.',
            ],
            result: 'S={5}.',
            interpretation:
                'The sign condition already predicted part of the verification.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Solve √(3x−2)=4.',
            steps: [
              'Square: 3x−2=16.',
              'Then x=6.',
            ],
            result: 'S={6}.',
            interpretation:
                'Checking confirms √16=4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and verify every candidate',
            content:
                '1. √x=4.\n'
                '2. √(x+5)=3.\n'
                '3. √(2x−1)=5.\n'
                '4. √(x+2)=x.\n'
                '5. √(x+6)=x−2.\n'
                '6. √(x+3)=√(2x−4).\n'
                '7. ∛(x−1)=2.\n'
                '8. Find the domain of √(3−x).\n'
                '9. Explain why squaring can introduce extraneous solutions.\n'
                '10. Give an example of an extraneous candidate.\n'
                '11. Solve √(x−1)+1=4.\n'
                '12. Solve √(2x+7)=x+1.\n'
                '13. Compare even- and odd-index roots.\n'
                '14. Explain why verification must use the original equation.\n'
                '15. Create a radical equation whose solution is x=5.',
            emphasis:
                'Write domain restrictions before beginning algebraic manipulation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Domain and equivalence remain central',
            content:
                'Radical functions appear in limits, derivatives, and modeling. Preserving domain and distinguishing equivalence from one-way implication prevents later algebraic errors.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas, and Guidorizzi for radical functions, domain, and algebraic transformations.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Why must answers be checked after solving a radical equation?',
      choices: [
        'Squaring can introduce extraneous solutions',
        'Square roots never allow positive solutions',
        'Every radical equation has two solutions',
      ],
      correctIndex: 0,
      explanation:
          'Squaring is not reversible in every case. The transformed equation may contain candidates that fail the original equation.',
    ),
    takeaways: [
      'Analyze the domain before solving.',
      'Isolate the radical before raising powers.',
      'Even powers can introduce extraneous solutions.',
      'Odd-index roots behave differently.',
      'Candidates must be checked in the original equation.',
      'Multiple radicals may require repeated power operations.',
    ],
    closing:
        'Radical equations require logical discipline: domain, transformation, candidates, and verification form one process.',
  )
  CourseLessonData(
    id: 'equations-10-inequacoes-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Precalculus',
    title: 'Quadratic inequalities',
    description: 'critical roots, signs, and intervals',
    duration: '≈ 15 min',
    objective:
        'solve quadratic inequalities by factoring and analyzing signs across intervals',
    symbol: 'x²≥0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Roots split the real line',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Critical points organize signs',
            content:
                'Move all terms to one side and factor when possible. The zeros split the real line into intervals, and the sign remains constant inside each interval until a root is crossed.',
            emphasis: 'An inequality asks for intervals, not only roots.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Positive product',
            problem: 'Solve x² − 5x + 6 > 0.',
            steps: [
              'Factor: (x − 2)(x − 3).',
              'Critical points are 2 and 3.',
              'The product is positive for x < 2, negative for 2 < x < 3, and positive for x > 3.',
              'Because the inequality is strict, exclude both roots.',
            ],
            result: 'The solution is (−∞, 2) ∪ (3, +∞).',
            interpretation:
                'These are the intervals where the quadratic graph lies above the x-axis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Graph connection',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Sign is vertical position',
            content:
                'f(x) > 0 means the graph is above the x-axis; f(x) < 0 means it is below. Sign analysis prepares later function analysis in Calculus.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'If (x − 1)(x + 4) ≤ 0, which interval is the solution?',
      choices: ['[−4, 1]', '(−∞, −4] ∪ [1, +∞)', '(−4, 1)'],
      correctIndex: 0,
      explanation:
          'The product is nonpositive between the roots, and ≤ includes both roots.',
    ),
    takeaways: [
      'Compare a single expression with zero.',
      'Roots are critical points.',
      'Analyze the sign in every interval.',
      'Include roots when equality is allowed.',
    ],
    closing:
        'A quadratic inequality identifies where a function is positive or negative.',
  ),
  CourseLessonData(
    id: 'equations-11-inequacoes-racionais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Precalculus',
    title: 'Rational inequalities',
    description: 'zeros, forbidden points, and sign charts',
    duration: '≈ 18 min',
    objective:
        'solve rational inequalities while distinguishing numerator zeros from forbidden denominator values',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Not every critical point can be included',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A zero denominator is always forbidden',
            content:
                'Numerator zeros may belong to the solution when equality is allowed. Denominator zeros never belong to the domain and must always remain excluded.',
            emphasis: 'Mark zeros and forbidden points separately before building a sign chart.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Allowed zero, forbidden denominator',
            problem: 'Solve (x − 2)/(x + 1) ≥ 0.',
            steps: [
              'The numerator is zero at x = 2.',
              'The denominator is zero at x = −1, which is forbidden.',
              'These points split the line into three intervals.',
              'The quotient is positive on (−∞, −1), negative on (−1, 2), and positive on (2, +∞).',
              'Include x = 2 because ≥ allows zero; never include x = −1.',
            ],
            result: 'The solution is (−∞, −1) ∪ [2, +∞).',
            interpretation: 'The exclusion of −1 comes from the domain, not from the inequality sign.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Forbidden points anticipate asymptotes',
            content:
                'In rational functions, denominator zeros are candidates for discontinuities and vertical asymptotes. Recognizing them now prepares limit analysis.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'In (x + 3)/(x − 5) < 0, which value can never belong to the solution?',
      choices: ['−3', '0', '5'],
      correctIndex: 2,
      explanation: 'x = 5 makes the denominator zero, so the expression is undefined there.',
    ),
    takeaways: [
      'Numerator and denominator zeros play different roles.',
      'A zero denominator is always excluded.',
      'Critical points split the line for sign analysis.',
      'Rational inequalities prepare domains and asymptotes.',
    ],
    closing:
        'Sign analysis of quotients connects algebra, domain, and function behavior.',
  ),
];
