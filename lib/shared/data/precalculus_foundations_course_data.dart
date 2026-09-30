import 'package:flutter/widgets.dart';

import 'package:calcquest/shared/domain/course_lesson_data.dart';

List<CourseLessonData> localizedPrecalculusFoundationsCourseLessons(
  Locale locale,
) {
  if (locale.languageCode == 'en') {
    return _englishPrecalculusFoundationsCourseLessons;
  }

  return precalculusFoundationsCourseLessons;
}

const List<CourseLessonData> precalculusFoundationsCourseLessons = [
  CourseLessonData(
    id: 'precalculo-00-01-reais',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Números reais e reta real',
    description: 'conjuntos numéricos, ordem, intervalos e representação na reta',
    duration: '≈ 25 min',
    objective:
        'classificar números reais, justificar relações de inclusão entre conjuntos, comparar números, interpretar desigualdades e representar conjuntos por intervalos e na reta real',
    symbol: 'ℝ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Estrutura dos números reais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'De contagens ao contínuo real',
            content:
                'Os números naturais ℕ modelam contagens. Os inteiros ℤ incluem os naturais, o zero e os inteiros negativos. Os racionais ℚ são os números que podem ser escritos na forma p/q, com p e q inteiros e q ≠ 0. Os irracionais são reais que não admitem essa representação. Racionais e irracionais formam o conjunto dos números reais ℝ.',
            emphasis:
                'Uma cadeia de inclusão útil é ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ. Pertencer a um conjunto menor não impede pertencer aos conjuntos maiores que o contêm.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Racional ou irracional?',
            content:
                'Todo racional possui expansão decimal finita ou periódica. Todo irracional possui expansão decimal infinita e não periódica. Assim, 3/8, −7 e 0,125 são racionais; √2 e π são irracionais.',
            emphasis:
                'A definição formal de racional é poder escrevê-lo como razão de dois inteiros com denominador não nulo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Ordem e reta real',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Cada real corresponde a um ponto',
            content:
                'A reta real organiza os números segundo a relação de ordem. Se a < b, então o ponto que representa a está à esquerda do ponto que representa b. Essa representação permite interpretar comparação, distância, intervalos e posteriormente domínio de funções e vizinhanças usadas em limites.',
            emphasis:
                'Na reta real, mover-se para a direita significa aumentar o valor; mover-se para a esquerda significa diminuí-lo.',
          ),
          WorkedExampleBlockData(
            title: 'Comparando números de naturezas diferentes',
            problem: 'Coloque −3/2, √2, 0 e 1,4 em ordem crescente.',
            steps: [
              'Converta apenas o necessário: −3/2 = −1,5.',
              'Use √2 ≈ 1,4142.',
              'Compare: −1,5 < 0 < 1,4 < 1,4142.',
              'Retorne às formas exatas quando apropriado.',
            ],
            result: '−3/2 < 0 < 1,4 < √2.',
            interpretation:
                'Aproximações podem ajudar a comparar, mas a forma exata continua sendo preferível quando disponível.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Intervalos e desigualdades',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Intervalos são conjuntos de números reais',
            content:
                'O intervalo (a, b) contém os reais x tais que a < x < b. O intervalo [a, b] contém os reais x tais que a ≤ x ≤ b. As formas [a, b) e (a, b] incluem apenas uma das extremidades.',
            emphasis:
                'Parêntese indica extremidade excluída; colchete indica extremidade incluída.',
          ),
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Intervalos ilimitados',
            content:
                'Condições como x ≥ 2 e x < −1 descrevem intervalos ilimitados: [2, +∞) e (−∞, −1). Os símbolos ±∞ indicam ausência de extremidade finita e não são números reais.',
            emphasis:
                'Por isso, ±∞ aparecem sempre com parênteses.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exemplos resolvidos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Da desigualdade para o intervalo',
            problem: 'Represente −3 ≤ x < 4 em notação de intervalo.',
            steps: [
              '−3 está incluído porque a relação é ≤.',
              '4 está excluído porque a relação é <.',
              'Escreva as extremidades em ordem crescente.',
            ],
            result: '[−3, 4).',
            interpretation:
                'Na reta real, −3 é marcado com ponto fechado, 4 com ponto aberto e todos os valores entre eles pertencem ao conjunto.',
          ),
          WorkedExampleBlockData(
            title: 'Do intervalo para a desigualdade',
            problem: 'Escreva (−∞, 5] como desigualdade.',
            steps: [
              'O intervalo se estende indefinidamente para a esquerda.',
              'A extremidade finita é 5.',
              'O colchete em 5 indica que 5 pertence ao conjunto.',
            ],
            result: 'x ≤ 5.',
            interpretation:
                'Notação de intervalo e desigualdade podem representar exatamente o mesmo conjunto.',
          ),
          WorkedExampleBlockData(
            title: 'União de intervalos',
            problem: 'Represente x < −2 ou x ≥ 3 em notação de intervalos.',
            steps: [
              'x < −2 corresponde a (−∞, −2).',
              'x ≥ 3 corresponde a [3, +∞).',
              'A palavra “ou” indica união.',
            ],
            result: '(−∞, −2) ∪ [3, +∞).',
            interpretation:
                'A união reúne os valores que satisfazem pelo menos uma das condições.',
          ),
          WorkedExampleBlockData(
            title: 'Interseção de condições',
            problem: 'Determine os x que satisfazem x > −1 e x ≤ 4.',
            steps: [
              'x > −1 exige valores à direita de −1.',
              'x ≤ 4 permite valores até 4, incluindo 4.',
              'A palavra “e” exige as duas condições simultaneamente.',
            ],
            result: '−1 < x ≤ 4, isto é, (−1, 4].',
            interpretation:
                'A interseção mantém somente a região comum às duas condições.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Precisão conceitual',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Um intervalo não é um par de números',
            content:
                'O intervalo [1, 3] contém infinitos números reais. As extremidades apenas delimitam o conjunto. Entre 1 e 3 estão, por exemplo, 1,2, √2, 2, 5/2 e infinitos outros valores.',
            emphasis:
                'Confundir um intervalo com suas extremidades prejudica o estudo posterior de domínio, continuidade e limites.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '√4 e x² = 4 são afirmações diferentes',
            content:
                'A expressão √4 representa a raiz quadrada principal e vale 2. Já a equação x² = 4 possui duas soluções reais: x = −2 e x = 2.',
            emphasis:
                'Uma expressão possui um valor; uma equação pede os valores que tornam uma igualdade verdadeira.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Classificação completa',
            problem: 'Classifique −12, 7/3 e √9 nos conjuntos numéricos usuais.',
            steps: [
              '−12 é inteiro; portanto também é racional e real.',
              '7/3 é razão de inteiros com denominador não nulo; portanto é racional e real.',
              '√9 = 3 é natural; logo também é inteiro, racional e real.',
            ],
            result:
                '−12 ∈ ℤ, ℚ, ℝ; 7/3 ∈ ℚ, ℝ; √9 = 3 ∈ ℕ, ℤ, ℚ, ℝ.',
            interpretation:
                'Uma classificação completa registra todas as pertinências verdadeiras.',
          ),
          WorkedExampleBlockData(
            title: 'Construindo um intervalo com duas condições',
            problem: 'Represente x ≥ −4 e x < 2.',
            steps: [
              'x ≥ −4 inclui −4.',
              'x < 2 exclui 2.',
              'As duas condições devem valer ao mesmo tempo.',
            ],
            result: '[−4, 2).',
            interpretation:
                'Esse raciocínio reaparece ao determinar domínios de funções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e justifique',
            content:
                '1. Classifique −5 nos conjuntos ℕ, ℤ, ℚ e ℝ.\n'
                '2. Classifique 0,75 e justifique por que é racional.\n'
                '3. Explique por que √2 não é racional.\n'
                '4. Coloque −2, −1/2, 0, √3 e 2 em ordem crescente.\n'
                '5. Escreva x > 3 em notação de intervalo.\n'
                '6. Escreva x ≤ −1 em notação de intervalo.\n'
                '7. Converta [−2, 5) em desigualdade.\n'
                '8. Converta (0, +∞) em desigualdade.\n'
                '9. Represente x < −3 ou x ≥ 1 como união de intervalos.\n'
                '10. Represente simultaneamente x ≥ −2 e x < 6.\n'
                '11. Decida se 2 pertence a (2, 7] e justifique.\n'
                '12. Explique por que +∞ nunca pode aparecer com colchete.',
            emphasis:
                'Em nível universitário, a justificativa e a notação fazem parte da resposta.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Domínio, vizinhança e limite vivem na reta real',
            content:
                'Em Cálculo, intervalos descrevem domínios, regiões onde funções crescem ou decrescem e conjuntos nos quais uma propriedade é válida. Desigualdades da forma a < x < b também fundamentam a linguagem de vizinhanças e, mais adiante, a definição formal de limite.',
            emphasis:
                'Dominar a reta real agora reduz dificuldades posteriores em funções, limites, continuidade e derivadas.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax, Algebra and Trigonometry 2e, seção 1.1, Real Numbers: Algebra Essentials; OpenStax, Precalculus; James Stewart, Calculus, revisão de Álgebra e Pré-Cálculo; Thomas’ Calculus, revisão de pré-requisitos algébricos; e Gelson Iezzi e colaboradores, Fundamentos de Matemática Elementar.',
            emphasis:
                'Os exemplos e exercícios do Cálculo Trivial são autorais ou adaptados pedagogicamente, sem reprodução literal de listas protegidas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Qual alternativa representa corretamente o conjunto dos reais que satisfazem −2 < x ≤ 5?',
      choices: ['[−2, 5]', '(−2, 5]', '(−∞, −2) ∪ [5, +∞)'],
      correctIndex: 1,
      explanation:
          '−2 é excluído porque a desigualdade é estrita; 5 é incluído porque aparece ≤. Portanto, o intervalo é (−2, 5].',
    ),
    takeaways: [
      'ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ.',
      'Racionais são razões de inteiros com denominador não nulo; irracionais são reais não racionais.',
      'A reta real representa simultaneamente posição e ordem.',
      'Desigualdades e intervalos descrevem conjuntos de números reais.',
      'União corresponde ao “ou”; interseção corresponde ao “e” entre condições.',
      '±∞ não são números reais e nunca são extremidades incluídas.',
      'Intervalos serão essenciais para domínio, limites, continuidade e análise de funções.',
    ],
    closing:
        'A reta real não é apenas uma figura: ela é a estrutura sobre a qual grande parte do Cálculo de uma variável é formulada.',
  ),
  CourseLessonData(
    id: 'precalculo-00-02-operacoes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Operações, sinais e prioridade',
    description: 'estrutura de expressões, sinais, agrupamentos e propriedades',
    duration: '≈ 25 min',
    objective:
        'avaliar expressões numéricas e algébricas com segurança, respeitando agrupamentos, prioridade operacional, sinais e propriedades fundamentais dos números reais',
    symbol: '()÷×',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A estrutura vem antes da conta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Hierarquia operacional',
            content:
                'Uma expressão deve ser lida por níveis. Primeiro resolvemos agrupamentos; depois potências e raízes; em seguida multiplicações e divisões; por fim adições e subtrações. Operações de mesma prioridade são executadas da esquerda para a direita.',
            emphasis:
                'A prioridade não é uma convenção opcional: ela garante que uma expressão tenha interpretação inequívoca.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O sinal pode estar dentro ou fora da potência',
            content:
                'Em (−3)², a base é −3 e o resultado é 9. Em −3², a base da potência é 3; calculamos 3² = 9 e depois aplicamos o sinal negativo, obtendo −9.',
            emphasis:
                'Parênteses alteram qual objeto está sendo elevado à potência.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Propriedades dos números reais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Comutativa e associativa',
            content:
                'Para números reais a, b e c, a + b = b + a e ab = ba. Também vale (a + b) + c = a + (b + c) e (ab)c = a(bc). Essas propriedades permitem reordenar e reagrupar somas e produtos sem alterar o resultado.',
            emphasis:
                'Subtração e divisão não são comutativas nem associativas em geral.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Distributiva, identidades e inversos',
            content:
                'A distributiva conecta multiplicação e adição: a(b + c) = ab + ac. O zero é a identidade aditiva e 1 é a identidade multiplicativa. Todo real a possui oposto −a; todo real não nulo possui recíproco 1/a.',
            emphasis:
                'O recíproco de 0 não existe, porque divisão por zero não está definida.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Sinais e subtração',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Subtrair é somar o oposto',
            content:
                'A expressão a − b pode ser interpretada como a + (−b). Essa leitura ajuda a controlar sinais e explica por que subtrair um número negativo equivale a somar seu oposto positivo.',
            emphasis:
                'Por exemplo, 7 − (−4) = 7 + 4 = 11.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Produto e quociente de números com sinal',
            content:
                'Produtos e quocientes de números com sinais iguais são positivos; com sinais diferentes, são negativos. Essa regra decorre da consistência das propriedades algébricas dos números reais.',
            emphasis:
                'Não aplique regras de sinais mecanicamente sem identificar primeiro qual operação está sendo feita.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exemplos resolvidos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Vários níveis de prioridade',
            problem: 'Calcule 18 ÷ 3·2 − (5 − 8).',
            steps: [
              'Resolva o agrupamento: 5 − 8 = −3.',
              'Divisão e multiplicação têm a mesma prioridade: 18 ÷ 3 = 6 e 6·2 = 12.',
              'Subtraia o número negativo: 12 − (−3) = 15.',
            ],
            result: '15.',
            interpretation:
                'A leitura da estrutura evita o erro comum de executar a multiplicação antes da divisão apenas por ela aparecer como “multiplicação”.',
          ),
          WorkedExampleBlockData(
            title: 'Potência e sinal',
            problem: 'Compare −2⁴ e (−2)⁴.',
            steps: [
              'Em −2⁴, calcule 2⁴ = 16.',
              'Aplique o sinal externo: −16.',
              'Em (−2)⁴, a base é −2.',
              'Como o expoente é par, (−2)⁴ = 16.',
            ],
            result: '−2⁴ = −16 e (−2)⁴ = 16.',
            interpretation:
                'A diferença não está na regra de sinais, mas na identificação correta da base.',
          ),
          WorkedExampleBlockData(
            title: 'Usando propriedades para simplificar',
            problem: 'Calcule 25·17 + 25·3 sem efetuar dois produtos separados.',
            steps: [
              'Identifique o fator comum 25.',
              'Use a distributiva ao contrário: 25·17 + 25·3 = 25(17 + 3).',
              'Some dentro do parêntese: 17 + 3 = 20.',
              'Calcule 25·20 = 500.',
            ],
            result: '500.',
            interpretation:
                'Propriedades algébricas não são apenas teóricas; elas podem reduzir o custo de um cálculo.',
          ),
          WorkedExampleBlockData(
            title: 'Fração complexa simples',
            problem: 'Calcule (3/4 − 1/6) ÷ (5/8).',
            steps: [
              'Use denominador comum 12: 3/4 = 9/12 e 1/6 = 2/12.',
              'Subtraia: 9/12 − 2/12 = 7/12.',
              'Dividir por 5/8 equivale a multiplicar por 8/5.',
              'Simplifique: (7/12)(8/5) = 14/15.',
            ],
            result: '14/15.',
            interpretation:
                'A troca por multiplicação pelo recíproco é válida apenas porque o divisor 5/8 é não nulo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Erros que se propagam',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplicação não tem prioridade sobre divisão',
            content:
                'Multiplicação e divisão pertencem ao mesmo nível de prioridade. Em 24 ÷ 6·2, calculamos da esquerda para a direita: 24 ÷ 6 = 4 e 4·2 = 8.',
            emphasis:
                'Aplicar uma prioridade inexistente altera o valor da expressão.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Distribuir sobre soma exige multiplicar todos os termos',
            content:
                'Em −3(x − 4), o fator −3 multiplica x e também −4: −3x + 12. Multiplicar apenas o primeiro termo quebra a igualdade.',
            emphasis:
                'Depois de distribuir, verifique se cada termo interno recebeu o fator externo.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — prioridade',
            problem: 'Calcule 4 + 2(3² − 5).',
            steps: [
              'Calcule a potência: 3² = 9.',
              'Resolva o parêntese: 9 − 5 = 4.',
              'Multiplique: 2·4 = 8.',
              'Some: 4 + 8 = 12.',
            ],
            result: '12.',
            interpretation:
                'Cada etapa resolve apenas o nível de maior prioridade disponível.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — distributiva e sinais',
            problem: 'Simplifique −2(3 − x) + 5.',
            steps: [
              'Distribua −2: −2·3 + (−2)(−x).',
              'Obtenha −6 + 2x.',
              'Some o termo restante: −6 + 2x + 5.',
              'Combine constantes: 2x − 1.',
            ],
            result: '2x − 1.',
            interpretation:
                'O sinal negativo externo participa de cada multiplicação.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva mostrando as etapas',
            content:
                '1. Calcule 7 + 3·5.\n'
                '2. Calcule (7 + 3)·5.\n'
                '3. Calcule −3² e (−3)².\n'
                '4. Calcule 36 ÷ 6·3.\n'
                '5. Calcule 10 − (4 − 9).\n'
                '6. Simplifique 4(2x − 3).\n'
                '7. Simplifique −5(a + 2).\n'
                '8. Use a distributiva para calcular 19·7 + 19·3.\n'
                '9. Explique por que 8 − 3 ≠ 3 − 8.\n'
                '10. Explique por que 12 ÷ 4 ≠ 4 ÷ 12.\n'
                '11. Calcule (5/6 + 1/3) ÷ 2.\n'
                '12. Identifique a propriedade usada em 6(x + 4) = 6x + 24.',
            emphasis:
                'Não escreva somente o resultado: registre a propriedade ou a prioridade usada nas etapas decisivas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Erros aritméticos viram erros de Cálculo',
            content:
                'Simplificação algébrica aparece antes de limites, derivadas e integrais. Uma troca de sinal ou prioridade incorreta pode produzir uma função diferente da original e invalidar todo o desenvolvimento posterior.',
            emphasis:
                'Precisão algébrica é uma condição de entrada para Cálculo, não uma habilidade separada dele.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax, Algebra and Trigonometry 2e, seção 1.1, incluindo ordem das operações e propriedades dos números reais; OpenStax, Precalculus; James Stewart, Calculus, revisão de Álgebra; Thomas’ Calculus, materiais de pré-requisitos; e MIT OpenCourseWare 18.01/18.01SC, que explicita Álgebra e Trigonometria como pré-requisitos para Cálculo universitário.',
            emphasis:
                'Os exercícios do Cálculo Trivial são autorais ou adaptados pedagogicamente a partir dos conceitos, sem copiar listas protegidas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o valor de −2² + (−2)²?',
      choices: ['−8', '0', '8'],
      correctIndex: 1,
      explanation:
          '−2² = −(2²) = −4, enquanto (−2)² = 4. Portanto, −4 + 4 = 0.',
    ),
    takeaways: [
      'Agrupamentos antecedem potências, produtos e somas.',
      'Multiplicação e divisão têm a mesma prioridade e seguem da esquerda para a direita.',
      'Parênteses determinam se um sinal pertence à base de uma potência.',
      'Comutatividade e associatividade valem para soma e produto, não para subtração e divisão.',
      'A distributiva conecta multiplicação e adição.',
      'Divisão por zero não está definida.',
      'Precisão operacional evita erros que se propagam em Álgebra e Cálculo.',
    ],
    closing:
        'Calcular corretamente não é executar regras depressa; é preservar a estrutura matemática da expressão em cada etapa.',
  ),
  CourseLessonData(
    id: 'precalculo-00-03-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Variáveis, constantes e expressões',
    description: 'estrutura algébrica, termos, coeficientes, substituição e interpretação',
    duration: '≈ 25 min',
    objective:
        'interpretar expressões algébricas com precisão, identificar termos, coeficientes, constantes e variáveis, distinguir expressão de equação e avaliar expressões por substituição',
    symbol: '3x+2',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A linguagem algébrica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Símbolos representam relações',
            content:
                'Uma expressão algébrica combina números, variáveis e operações para representar uma quantidade. A variável pode representar um número desconhecido, um parâmetro ou uma grandeza que muda. Uma constante mantém valor fixo no contexto considerado.',
            emphasis:
                'A Álgebra não trata letras como objetos misteriosos: elas representam quantidades e relações entre quantidades.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Expressão, equação e identidade',
            content:
                'Uma expressão, como 3x + 5, representa uma quantidade. Uma equação, como 3x + 5 = 11, afirma que duas expressões têm o mesmo valor para determinados valores de x. Uma identidade, como 2(x + 1) = 2x + 2, é verdadeira para todos os valores do domínio.',
            emphasis:
                'Distinguir esses objetos evita confundir “calcular”, “resolver” e “demonstrar equivalência”.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Termos, coeficientes e constantes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Como decompor uma expressão',
            content:
                'Na expressão 4x² − 3x + 7, os termos são 4x², −3x e 7. Os coeficientes dos termos com variável são 4 e −3. O termo 7 é constante. Em x, o coeficiente é 1; em −x, o coeficiente é −1.',
            emphasis:
                'O sinal faz parte do termo quando identificamos os termos de uma soma algébrica.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Parte literal e grau de um termo',
            content:
                'Em 5x³y², o coeficiente é 5 e a parte literal é x³y². Em um monômio, o grau é a soma dos expoentes das variáveis; portanto, 5x³y² tem grau 5.',
            emphasis:
                'Coeficiente e expoente exercem papéis diferentes: 3x² significa 3·x·x, não (3x)².',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Avaliação por substituição',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Substituir é preservar a estrutura',
            content:
                'Avaliar uma expressão significa substituir as variáveis por valores e executar as operações respeitando a estrutura original. Quando o valor substituído é negativo, o uso de parênteses é essencial para preservar corretamente sinais e potências.',
            emphasis:
                'Se x = −2, então x² deve ser escrito como (−2)² durante a substituição.',
          ),
          WorkedExampleBlockData(
            title: 'Substituição com sinal negativo',
            problem: 'Calcule 2x² − 5x + 1 para x = −2.',
            steps: [
              'Substitua x por −2 usando parênteses: 2(−2)² − 5(−2) + 1.',
              'Calcule a potência: (−2)² = 4.',
              'Efetue os produtos: 2·4 = 8 e −5(−2) = +10.',
              'Some os termos: 8 + 10 + 1 = 19.',
            ],
            result: '19.',
            interpretation:
                'Os parênteses impedem que o sinal negativo seja perdido ou aplicado à operação errada.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Modelagem e interpretação',
        blocks: [
          WorkedExampleBlockData(
            title: 'Traduzindo uma situação',
            problem:
                'Uma empresa cobra R\$ 12 de taxa fixa mais R\$ 4 por unidade produzida. Escreva uma expressão para o custo total de x unidades.',
            steps: [
              'Defina x como o número de unidades produzidas.',
              'A parcela variável é 4x.',
              'A taxa fixa é 12.',
              'Some as parcelas: C = 12 + 4x.',
            ],
            result: 'C = 12 + 4x.',
            interpretation:
                'O coeficiente 4 representa a taxa por unidade; a constante 12 representa a parcela independente de x.',
          ),
          WorkedExampleBlockData(
            title: 'Interpretando uma expressão',
            problem: 'Interprete P = 1500 − 20t em um contexto de estoque.',
            steps: [
              'P representa uma quantidade dependente de t.',
              'A constante 1500 representa o valor inicial quando t = 0.',
              'O coeficiente −20 indica redução de 20 unidades para cada aumento de uma unidade em t.',
            ],
            result:
                'O modelo descreve um estoque inicial de 1500 unidades que diminui 20 unidades por unidade de tempo.',
            interpretation:
                'Ler coeficientes e constantes como informações do modelo prepara o estudo de funções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Precisão conceitual',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'x² e 2x não são equivalentes',
            content:
                'x² significa x·x. Já 2x significa 2·x. Por exemplo, se x = 3, então x² = 9 e 2x = 6.',
            emphasis:
                'Expoente e coeficiente não são intercambiáveis.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '3(x + 2) não é 3x + 2',
            content:
                'O fator 3 multiplica toda a expressão x + 2. Pela distributiva, 3(x + 2) = 3x + 6.',
            emphasis:
                'Ignorar agrupamentos muda a expressão original.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Uma expressão não é “resolvida” sem uma condição',
            content:
                'A expressão 2x + 5 pode ser simplificada ou avaliada para um valor de x, mas não possui uma solução por si só. Resolver é uma tarefa associada a equações, inequações ou outros enunciados que impõem uma condição.',
            emphasis:
                'Use vocabulário matemático preciso: avaliar, simplificar, expandir, fatorar e resolver são ações diferentes.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Exemplos resolvidos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Identificação estrutural',
            problem: 'Analise a expressão −7a³b + 4ab² − 9.',
            steps: [
              'Os termos são −7a³b, 4ab² e −9.',
              'Os coeficientes dos termos com variáveis são −7 e 4.',
              'O termo constante é −9.',
              'As partes literais são a³b e ab².',
            ],
            result:
                'A expressão possui três termos, dois termos variáveis e um termo constante.',
            interpretation:
                'Separar a estrutura corretamente é pré-requisito para combinar termos, fatorar e trabalhar com polinômios.',
          ),
          WorkedExampleBlockData(
            title: 'Avaliação com duas variáveis',
            problem: 'Avalie 3x²y − 2xy + 4 para x = −1 e y = 2.',
            steps: [
              'Substitua: 3(−1)²(2) − 2(−1)(2) + 4.',
              'Calcule (−1)² = 1.',
              'Efetue os produtos: 3·1·2 = 6 e −2(−1)(2) = +4.',
              'Some: 6 + 4 + 4 = 14.',
            ],
            result: '14.',
            interpretation:
                'Com várias variáveis, cada substituição deve preservar sua própria posição e agrupamento.',
          ),
          WorkedExampleBlockData(
            title: 'Equivalência por distributiva',
            problem: 'Mostre que 5(x − 2) + 3x e 8x − 10 são equivalentes.',
            steps: [
              'Distribua 5: 5x − 10 + 3x.',
              'Combine termos semelhantes: 8x − 10.',
              'A expressão obtida coincide com a segunda.',
            ],
            result: '5(x − 2) + 3x = 8x − 10.',
            interpretation:
                'Expressões diferentes na aparência podem representar a mesma quantidade para todos os valores permitidos de x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — leitura da expressão',
            problem: 'Na expressão 6x² − x + 5, identifique termos e coeficientes.',
            steps: [
              'Separe pelos sinais de adição ou subtração no nível principal.',
              'Os termos são 6x², −x e 5.',
              'Os coeficientes dos termos com x são 6 e −1.',
              'O termo constante é 5.',
            ],
            result: 'Termos: 6x², −x, 5; coeficientes: 6 e −1; constante: 5.',
            interpretation:
                'O coeficiente implícito de −x é −1.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — substituição',
            problem: 'Calcule a² − 2ab + b² para a = 3 e b = −1.',
            steps: [
              'Substitua: 3² − 2(3)(−1) + (−1)².',
              'Calcule as potências: 9 e 1.',
              'Calcule o produto: −2(3)(−1) = +6.',
              'Some: 9 + 6 + 1 = 16.',
            ],
            result: '16.',
            interpretation:
                'Parênteses são indispensáveis quando o valor substituído é negativo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e explique',
            content:
                '1. Identifique os termos de 5x² − 3x + 8.\n'
                '2. Determine o coeficiente de −x³.\n'
                '3. Na expressão 4ab² − 7, identifique coeficiente, parte literal e constante.\n'
                '4. Explique a diferença entre expressão e equação.\n'
                '5. Avalie 3x − 4 para x = −2.\n'
                '6. Avalie x² + 2x + 1 para x = −3.\n'
                '7. Avalie 2ab − b² para a = 4 e b = −2.\n'
                '8. Escreva uma expressão para “cinco a mais que o dobro de x”.\n'
                '9. Escreva uma expressão para “a metade da soma de x e 6”.\n'
                '10. Interprete o coeficiente e a constante em C = 9 + 2,5x.\n'
                '11. Verifique se 3(x + 4) e 3x + 12 são equivalentes.\n'
                '12. Explique por que x² e 2x não podem ser tratados como a mesma expressão.',
            emphasis:
                'As respostas devem usar linguagem matemática precisa e mostrar a estrutura da expressão.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Expressões se tornam funções',
            content:
                'Em Cálculo, uma função associa valores de entrada a valores de saída por meio de uma regra. A capacidade de interpretar uma expressão como relação entre grandezas é indispensável para domínio, composição, limites, derivadas e modelagem.',
            emphasis:
                'Antes de estudar como uma função varia, é preciso saber ler corretamente a expressão que a define.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax, Intermediate Algebra 2e, seção 1.1, Use the Language of Algebra; OpenStax, Algebra and Trigonometry 2e, seção 1.4, Polynomials, para termos, coeficientes e constantes; James Stewart, Calculus, Algebra Review; Thomas’ Calculus, revisão algébrica; e MIT OpenCourseWare 18.01SC, que assume domínio de Álgebra como pré-requisito para o Cálculo universitário.',
            emphasis:
                'Os exemplos e exercícios do Cálculo Trivial são autorais ou adaptados pedagogicamente e não reproduzem listas protegidas literalmente.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Na expressão −6a³ + 4, qual é o coeficiente do termo que contém a³?',
      choices: ['−6', '3', '4'],
      correctIndex: 0,
      explanation:
          'O coeficiente é o fator numérico que multiplica a parte literal. Em −6a³, esse fator é −6.',
    ),
    takeaways: [
      'Expressões combinam números, variáveis e operações para representar quantidades.',
      'Termos são separados por adições e subtrações no nível principal da expressão.',
      'Coeficiente multiplica a parte literal; constante independe das variáveis.',
      'Expressão, equação e identidade são objetos matemáticos diferentes.',
      'Substituições devem preservar sinais, parênteses e potências.',
      'Expressões equivalentes podem ter formas diferentes e representar a mesma quantidade.',
      'A leitura algébrica correta prepara o estudo formal de funções e Cálculo.',
    ],
    closing:
        'Ler Álgebra com precisão é aprender a enxergar estrutura, e não apenas símbolos.',
  ),
  CourseLessonData(
    id: 'precalculo-00-04-potencias-raizes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Potências, raízes e expoentes',
    description: 'leis de expoentes, radicais, expoentes racionais e domínio real',
    duration: '≈ 30 min',
    objective:
        'aplicar leis de expoentes com suas condições de validade, interpretar raízes e expoentes racionais no conjunto dos reais, determinar restrições de domínio e evitar simplificações algébricas inválidas',
    symbol: 'xᵃ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Potência como estrutura',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Base e expoente têm papéis distintos',
            content:
                'Em aⁿ, a é a base e n é o expoente. Para n inteiro positivo, aⁿ representa o produto de n fatores iguais a a. Assim, a³ = a·a·a. Essa definição é o ponto de partida para as leis de expoentes.',
            emphasis:
                'O expoente não multiplica a base: a³ não significa 3a.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Sinal e agrupamento',
            content:
                'As expressões −2⁴ e (−2)⁴ não são iguais. Na primeira, a potência atua sobre 2 e o sinal negativo permanece fora: −2⁴ = −16. Na segunda, a base é −2: (−2)⁴ = 16.',
            emphasis:
                'Sempre identifique a base antes de aplicar uma lei de expoentes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Leis dos expoentes inteiros',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Produto, quociente e potência de potência',
            content:
                'Para a mesma base, aᵐ·aⁿ = aᵐ⁺ⁿ. Para a ≠ 0, aᵐ/aⁿ = aᵐ⁻ⁿ. Também vale (aᵐ)ⁿ = aᵐⁿ. Em produtos e quocientes, (ab)ⁿ = aⁿbⁿ e, para b ≠ 0, (a/b)ⁿ = aⁿ/bⁿ.',
            emphasis:
                'Cada lei possui uma estrutura específica. Não transfira uma regra de produto para uma soma.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Expoente não se distribui sobre soma',
            content:
                'Em geral, (a + b)² ≠ a² + b². Pela distributiva, (a + b)² = a² + 2ab + b².',
            emphasis:
                'Com a = 2 e b = 3: (2 + 3)² = 25, enquanto 2² + 3² = 13.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Expoente zero e expoente negativo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Por que a⁰ = 1',
            content:
                'Para a ≠ 0, podemos usar a lei do quociente: aᵐ/aᵐ = aᵐ⁻ᵐ = a⁰. Como qualquer número não nulo dividido por ele mesmo vale 1, concluímos que a⁰ = 1.',
            emphasis:
                'A condição a ≠ 0 é essencial. No contexto elementar, 0⁰ não é tratado como uma potência real definida.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Expoente negativo indica recíproco',
            content:
                'Para a ≠ 0 e n inteiro positivo, a⁻ⁿ = 1/aⁿ. O sinal negativo no expoente não torna a potência negativa; ele inverte a base em relação à multiplicação.',
            emphasis:
                '2⁻³ = 1/2³ = 1/8, enquanto −2³ = −8.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Raízes n-ésimas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Raiz principal',
            content:
                'Para n inteiro positivo, √[n]{a} representa um número real b tal que bⁿ = a, quando essa raiz real existe. Para índice par, a raiz principal é definida como não negativa. Para índice ímpar, raízes reais existem também para radicandos negativos.',
            emphasis:
                '√9 = 3, não ±3. Já a equação x² = 9 possui as soluções x = ±3.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Índice par e índice ímpar',
            content:
                '√16 = 4 e √[4]{16} = 2 são reais e não negativos. Em contraste, √[3]{−8} = −2, porque (−2)³ = −8. A expressão √(−8) não representa um número real.',
            emphasis:
                'No conjunto dos reais, radicais de índice par exigem radicando não negativo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Expoentes racionais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A fração no expoente codifica raiz e potência',
            content:
                'Se m/n está na forma irredutível, com n > 0, então a^(m/n) é interpretado por meio da raiz n-ésima e da potência m, quando a expressão está definida nos reais. Podemos escrever a^(m/n) = (√[n]{a})ᵐ.',
            emphasis:
                'O denominador n determina o índice da raiz; o numerador m determina a potência.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'As condições de domínio dependem do denominador',
            content:
                'Se n é par, a deve ser não negativo para a^(m/n) ser real. Se m também for negativo, então a deve ser estritamente positivo, porque a expressão envolve um recíproco. Se n é ímpar, bases negativas são permitidas; com expoente negativo, a base ainda não pode ser zero.',
            emphasis:
                'Antes de simplificar um expoente racional, reduza a fração do expoente e verifique o domínio real.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Exemplos resolvidos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Expoente racional positivo',
            problem: 'Calcule 16^(3/2).',
            steps: [
              'O denominador 2 indica raiz quadrada.',
              'Calcule √16 = 4.',
              'Eleve ao numerador 3: 4³ = 64.',
            ],
            result: '16^(3/2) = 64.',
            interpretation:
                'A raiz foi calculada antes da potência porque isso simplifica o cálculo.',
          ),
          WorkedExampleBlockData(
            title: 'Base negativa com denominador ímpar',
            problem: 'Calcule (−27)^(2/3).',
            steps: [
              'O denominador 3 indica raiz cúbica.',
              '√[3]{−27} = −3.',
              'Eleve ao quadrado: (−3)² = 9.',
            ],
            result: '(−27)^(2/3) = 9.',
            interpretation:
                'A base negativa é permitida porque a raiz envolvida tem índice ímpar.',
          ),
          WorkedExampleBlockData(
            title: 'Quando a expressão não é real',
            problem: 'Analise (−16)^(1/2) no conjunto dos números reais.',
            steps: [
              'O denominador 2 indica raiz quadrada.',
              'Raiz quadrada real exige radicando não negativo.',
              'Como −16 < 0, não há valor real.',
            ],
            result: '(−16)^(1/2) não é real.',
            interpretation:
                'O domínio deve ser verificado antes da manipulação algébrica.',
          ),
          WorkedExampleBlockData(
            title: 'Expoente racional negativo',
            problem: 'Calcule 81^(−3/4).',
            steps: [
              'O expoente negativo indica recíproco: 81^(−3/4) = 1/81^(3/4).',
              '√[4]{81} = 3.',
              'Então 81^(3/4) = 3³ = 27.',
              'Tome o recíproco.',
            ],
            result: '81^(−3/4) = 1/27.',
            interpretation:
                'Expoente negativo altera a posição multiplicativa da potência, não o sinal do resultado.',
          ),
          WorkedExampleBlockData(
            title: 'Expoente racional com raiz quarta',
            problem: 'Calcule 81^(3/4).',
            steps: [
              'O denominador 4 indica raiz quarta.',
              'Calcule √[4]{81} = 3.',
              'Eleve ao numerador 3: 3³ = 27.',
            ],
            result: '81^(3/4) = 27.',
            interpretation:
                'O denominador do expoente determina a raiz e o numerador determina a potência.',
          ),
          WorkedExampleBlockData(
            title: 'Raiz cúbica de base negativa',
            problem: 'Calcule (−27)^(1/3).',
            steps: [
              'O denominador 3 indica raiz cúbica.',
              'Como o índice é ímpar, uma base negativa é permitida nos reais.',
              '√[3]{−27} = −3.',
            ],
            result: '(−27)^(1/3) = −3.',
            interpretation:
                'Raízes de índice ímpar preservam o sinal de radicandos negativos.',
          ),
          WorkedExampleBlockData(
            title: 'Reduza o expoente antes de analisar o domínio',
            problem: 'Interprete (−8)^(2/6) no conjunto dos reais.',
            steps: [
              'Reduza primeiro a fração do expoente: 2/6 = 1/3.',
              'O denominador relevante é, portanto, 3, que é ímpar.',
              'Assim, (−8)^(2/6) = (−8)^(1/3) = √[3]{−8} = −2.',
            ],
            result: '(−8)^(2/6) = −2.',
            interpretation:
                'Analisar o denominador 6 antes de reduzir a fração levaria a uma restrição de domínio incorreta.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Radicais e simplificação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Extração de fatores perfeitos',
            content:
                'Uma raiz pode ser simplificada separando fatores que são potências perfeitas do índice. Por exemplo, √72 = √(36·2) = 6√2.',
            emphasis:
                'Simplificar um radical não significa aproximá-lo decimalmente.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '√(x²) = |x|',
            content:
                'A raiz quadrada principal é sempre não negativa. Portanto, √(x²) = |x| para todo x real. Escrever simplesmente x seria incorreto quando x < 0.',
            emphasis:
                'Se x = −5, então √(x²) = √25 = 5 = |−5|, e não −5.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Domínio de expressões com raízes',
        blocks: [
          WorkedExampleBlockData(
            title: 'Raiz quadrada de uma expressão',
            problem: 'Determine o domínio real de f(x) = √(x − 5).',
            steps: [
              'A raiz tem índice par.',
              'O radicando deve satisfazer x − 5 ≥ 0.',
              'Resolva: x ≥ 5.',
            ],
            result: 'Domínio: [5, +∞).',
            interpretation:
                'A condição vem da existência da raiz no conjunto dos reais.',
          ),
          WorkedExampleBlockData(
            title: 'Raiz no denominador',
            problem: 'Determine o domínio real de g(x) = 1/√(x + 2).',
            steps: [
              'Por ser raiz quadrada, precisamos x + 2 ≥ 0.',
              'Como a raiz está no denominador, ela também não pode ser zero.',
              'Portanto, x + 2 > 0.',
            ],
            result: 'Domínio: (−2, +∞).',
            interpretation:
                'Uma mesma expressão pode reunir restrição de radical e restrição de denominador.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Erros conceituais frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Somar expoentes só vale em produtos de mesma base',
            content:
                'x²·x³ = x⁵, mas x² + x³ não pode ser reduzido a x⁵. Soma e produto são operações diferentes.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Raiz de soma não se separa',
            content:
                'Em geral, √(a + b) ≠ √a + √b. Por exemplo, √(9 + 16) = 5, enquanto √9 + √16 = 7.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Leis de expoentes exigem domínio compatível',
            content:
                'Ao trabalhar com expoentes racionais sobre os reais, manipulações formais precisam respeitar a existência das expressões envolvidas. Uma transformação algébrica não pode criar valores reais onde a expressão original não estava definida.',
            emphasis:
                'Primeiro determine o domínio; depois simplifique.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — leis de expoentes',
            problem: 'Simplifique (2x³)²·x⁻¹, com x ≠ 0.',
            steps: [
              '(2x³)² = 4x⁶.',
              'Multiplique por x⁻¹: 4x⁶·x⁻¹.',
              'Some os expoentes da mesma base: 6 + (−1) = 5.',
            ],
            result: '4x⁵.',
            interpretation:
                'A condição x ≠ 0 vem da presença original de x⁻¹.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — domínio',
            problem: 'Determine o domínio de h(x) = (x − 1)^(1/2).',
            steps: [
              'O denominador do expoente racional é 2.',
              'Isso corresponde a uma raiz quadrada.',
              'Exija x − 1 ≥ 0.',
            ],
            result: 'x ≥ 1, isto é, [1, +∞).',
            interpretation:
                'Expoentes racionais também carregam restrições de domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva mostrando domínio e justificativa quando necessário',
            content:
                '1. Simplifique x⁴·x⁷.\n'
                '2. Simplifique x⁹/x³, indicando a condição sobre x.\n'
                '3. Simplifique (a³)⁴.\n'
                '4. Escreva 5⁻³ sem expoente negativo.\n'
                '5. Calcule 64^(1/3).\n'
                '6. Calcule 16^(3/2).\n'
                '7. Calcule (−8)^(1/3).\n'
                '8. Decida se (−16)^(1/2) é real.\n'
                '9. Calcule 81^(−1/2).\n'
                '10. Simplifique √50.\n'
                '11. Explique por que √(x²) = |x|.\n'
                '12. Determine o domínio de √(x + 4).\n'
                '13. Determine o domínio de 1/√(x − 2).\n'
                '14. Mostre numericamente que (a + b)² ≠ a² + b² em geral.\n'
                '15. Explique por que √(a + b) não pode, em geral, ser separado em √a + √b.',
            emphasis:
                'Em questões de domínio, uma resposta sem a condição de existência é incompleta.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Expoentes controlam funções e derivadas',
            content:
                'Funções potência, radicais e expressões com expoentes racionais aparecem continuamente em Cálculo. A regra da potência para derivadas, a análise de domínio, limites com radicais e modelos de crescimento dependem diretamente dessas estruturas algébricas.',
            emphasis:
                'Erros em expoentes e domínio costumam reaparecer mais adiante como erros de limite ou derivada.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax, Algebra and Trigonometry 2e, seções 1.2, Exponents and Scientific Notation, e 1.3, Radicals and Rational Exponents; OpenStax, College Algebra 2e, seções 1.2 e 1.3; James Stewart, Calculus, revisão de Álgebra e funções potência; Thomas’ Calculus, revisão algébrica e funções; e MIT OpenCourseWare 18.01SC, cujo curso de Cálculo de uma variável exige domínio prévio de Álgebra e Trigonometria.',
            emphasis:
                'A organização, os exemplos e os exercícios do Cálculo Trivial são autorais ou adaptados pedagogicamente, sem reprodução literal de listas protegidas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Qual é o domínio real de f(x) = (x − 3)^(1/2)?',
      choices: ['x > 3', 'x ≥ 3', 'todos os números reais'],
      correctIndex: 1,
      explanation:
          'O expoente 1/2 representa uma raiz quadrada. Para que a expressão seja real, x − 3 deve ser não negativo: x − 3 ≥ 0, portanto x ≥ 3.',
    ),
    takeaways: [
      'Leis de expoentes dependem da estrutura da expressão e de condições de domínio.',
      'Expoente zero exige base não nula; expoente negativo também exclui base zero.',
      'Raízes de índice par exigem radicando não negativo nos reais.',
      'Raízes de índice ímpar admitem radicandos negativos.',
      'Em a^(m/n), o denominador determina a raiz e o numerador determina a potência.',
      '√(x²) = |x|, e não x em geral.',
      'Expoentes não se distribuem sobre soma, e raízes de soma não se separam.',
      'Domínio deve ser analisado antes da simplificação algébrica.',
    ],
    closing:
        'Potências e raízes deixam de ser um conjunto de regras quando cada manipulação é ligada à estrutura da expressão e ao domínio em que ela faz sentido.',
  ),
  CourseLessonData(
    id: 'precalculo-00-05-modulo',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Valor absoluto, distância e inequações',
    description:
        'definição por casos, propriedades, distância na reta real, equações, inequações e desigualdade triangular',
    duration: '≈ 30 min',
    objective:
        'interpretar valor absoluto como magnitude e distância, aplicar sua definição por casos, resolver equações e inequações com módulo, justificar propriedades fundamentais e conectar a linguagem de distância à formulação de limites',
    symbol: '|x|',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição formal de valor absoluto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Uma função definida por casos',
            content:
                'Para x real, o valor absoluto de x é definido por [[math:|x|=\\begin{cases}x,&x\\ge 0\\\\-x,&x<0\\end{cases}]]. A definição não “apaga” um sinal: ela escolhe, em cada caso, a expressão que produz a magnitude não negativa de x.',
            emphasis:
                'Se x ≥ 0, então |x| = x. Se x < 0, então |x| = −x, que é positivo porque x já é negativo.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Interpretação geométrica',
            content:
                'Na reta real, |x| representa a distância entre x e 0. Por isso |5| = 5 e |−5| = 5: os pontos 5 e −5 estão à mesma distância da origem.',
            emphasis:
                'Valor absoluto mede magnitude ou distância; distância nunca é negativa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Propriedades fundamentais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Propriedades básicas',
            content:
                'Para x e y reais: |x| ≥ 0; |x| = 0 se, e somente se, x = 0; |−x| = |x|; |xy| = |x||y|; e, para y ≠ 0, |x/y| = |x|/|y|. Além disso, |x|² = x² e [[math:|x|=\\sqrt{x^2}]].',
            emphasis:
                'As condições de validade importam: a propriedade do quociente exige y ≠ 0.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Valor absoluto não se distribui sobre soma',
            content:
                'Em geral, |x + y| ≠ |x| + |y|. Por exemplo, com x = 3 e y = −2, temos |3 + (−2)| = 1, enquanto |3| + |−2| = 5.',
            emphasis:
                'O que sempre vale é a desigualdade triangular: |x + y| ≤ |x| + |y|.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Distância entre dois números reais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'A fórmula da distância na reta',
            content:
                'A distância entre dois números reais a e b é [[math:d(a,b)=|a-b|]]. Como |a − b| = |b − a|, a ordem dos pontos não altera a distância.',
            emphasis:
                'A expressão |x − a| mede exatamente quão distante x está do ponto a.',
          ),
          WorkedExampleBlockData(
            title: 'Distância entre dois pontos',
            problem: 'Calcule a distância entre −4 e 7.',
            steps: [
              'Use d(a,b) = |a − b|.',
              'd(−4,7) = |−4 − 7|.',
              'd(−4,7) = |−11| = 11.',
            ],
            result: 'A distância é 11.',
            interpretation:
                'Se invertermos a ordem, |7 − (−4)| = |11| = 11. A distância é simétrica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Equações com valor absoluto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O modelo |u| = a',
            content:
                'Se a > 0, a equação |u| = a equivale a u = a ou u = −a. Se a = 0, então u = 0. Se a < 0, não há solução real, pois valor absoluto nunca é negativo.',
            emphasis:
                'Antes de abrir dois casos, observe o número do lado direito.',
          ),
          WorkedExampleBlockData(
            title: 'Equação com duas soluções',
            problem: 'Resolva |2x − 5| = 7.',
            steps: [
              'Considere os dois casos: 2x − 5 = 7 ou 2x − 5 = −7.',
              'No primeiro caso, 2x = 12 e x = 6.',
              'No segundo caso, 2x = −2 e x = −1.',
              'Verifique na expressão original: ambos produzem valor absoluto 7.',
            ],
            result: 'Solução: {−1, 6}.',
            interpretation:
                'Geometricamente, 2x − 5 pode estar a 7 unidades de zero em qualquer um dos dois lados.',
          ),
          WorkedExampleBlockData(
            title: 'Equação sem solução real',
            problem: 'Resolva |3x + 1| = −4.',
            steps: [
              'Para todo número real u, |u| ≥ 0.',
              'O lado direito é −4, que é negativo.',
            ],
            result: 'Não existe solução real.',
            interpretation:
                'A análise da imagem da função módulo evita manipulações desnecessárias.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Inequações e intervalos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Menor que: pontos dentro de um intervalo',
            content:
                'Para a > 0, |x| < a equivale a −a < x < a, e |x| ≤ a equivale a −a ≤ x ≤ a. A condição descreve pontos cuja distância até 0 é menor que — ou no máximo igual a — a.',
            emphasis:
                'Com centro c, |x − c| < r descreve o intervalo (c − r, c + r).',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Maior que: pontos fora de um intervalo',
            content:
                'Para a > 0, |x| > a equivale a x < −a ou x > a. Analogamente, |x| ≥ a equivale a x ≤ −a ou x ≥ a.',
            emphasis:
                '“Menor que” produz uma região interna; “maior que” produz duas regiões externas.',
          ),
          WorkedExampleBlockData(
            title: 'Inequação como vizinhança',
            problem: 'Resolva |x − 4| ≤ 3.',
            steps: [
              'Interprete como distância: x está a no máximo 3 unidades de 4.',
              'Escreva −3 ≤ x − 4 ≤ 3.',
              'Some 4 aos três membros: 1 ≤ x ≤ 7.',
            ],
            result: 'Solução: [1, 7].',
            interpretation:
                'O intervalo tem centro 4 e raio 3.',
          ),
          WorkedExampleBlockData(
            title: 'Região externa',
            problem: 'Resolva |2x + 1| > 5.',
            steps: [
              'Separe em dois casos: 2x + 1 < −5 ou 2x + 1 > 5.',
              'Primeiro caso: 2x < −6, então x < −3.',
              'Segundo caso: 2x > 4, então x > 2.',
            ],
            result: 'Solução: (−∞, −3) ∪ (2, +∞).',
            interpretation:
                'A solução fica fora do intervalo em que |2x + 1| seria menor ou igual a 5.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Centro, raio e vizinhanças',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'A expressão |x − a| < r',
            content:
                'Para r > 0, a condição |x − a| < r significa que x está a menos de r unidades de a. Algebraicamente, a − r < x < a + r. Em linguagem de Cálculo, esse intervalo é uma vizinhança aberta de a.',
            emphasis:
                'Valor absoluto transforma uma afirmação geométrica de proximidade em uma desigualdade algébrica.',
          ),
          WorkedExampleBlockData(
            title: 'Da distância para o intervalo',
            problem: 'Descreva |x − 2| < 0,1 como intervalo.',
            steps: [
              'O centro é 2 e o raio é 0,1.',
              'Extremidade esquerda: 2 − 0,1 = 1,9.',
              'Extremidade direita: 2 + 0,1 = 2,1.',
              'A desigualdade é estrita, então as extremidades não pertencem ao conjunto.',
            ],
            result: 'x ∈ (1,9, 2,1).',
            interpretation:
                'Essa é exatamente a linguagem usada para dizer que x está “próximo” de 2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Desigualdade triangular',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Uma propriedade central de distância',
            content:
                'Para quaisquer x e y reais, [[math:|x+y|\\le |x|+|y|]]. Essa é a desigualdade triangular. Ela expressa a ideia de que o caminho direto entre dois pontos não é maior do que um caminho que passa por uma etapa intermediária.',
            emphasis:
                'A igualdade pode ocorrer, mas não é obrigatória. Por isso não podemos substituir ≤ por =.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Desigualdade triangular reversa',
            content:
                'Também vale [[math:\\bigl||x|-|y|\\bigr|\\le |x-y|]]. Ela compara a diferença entre magnitudes com a distância entre os próprios números.',
            emphasis:
                'Essas desigualdades serão úteis em estimativas de erro, limites e continuidade.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Erros conceituais frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '−|x| não é o mesmo que |−x|',
            content:
                '|−x| = |x| é sempre não negativo. Já −|x| é sempre não positivo. Por exemplo, se x = 3, então |−3| = 3, enquanto −|3| = −3.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '|x| = a não significa x = a',
            content:
                'Quando a > 0, existem em geral duas possibilidades: x = a ou x = −a. Ignorar uma delas elimina uma solução válida.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não transforme |x + y| em |x| + |y|',
            content:
                'Valor absoluto é multiplicativo em produtos, mas não aditivo em somas. Para somas, a relação geral disponível é uma desigualdade, não uma igualdade.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — equação',
            problem: 'Resolva |3x − 6| = 9.',
            steps: [
              'Escreva 3x − 6 = 9 ou 3x − 6 = −9.',
              'Primeiro caso: 3x = 15, então x = 5.',
              'Segundo caso: 3x = −3, então x = −1.',
              'Substitua os dois valores para conferir.',
            ],
            result: 'Solução: {−1, 5}.',
            interpretation:
                'As duas soluções correspondem às duas posições possíveis a uma mesma distância.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — inequação',
            problem: 'Resolva |x + 2| < 5.',
            steps: [
              'Escreva −5 < x + 2 < 5.',
              'Subtraia 2 dos três membros.',
              'Obtenha −7 < x < 3.',
            ],
            result: 'Solução: (−7, 3).',
            interpretation:
                'O intervalo tem centro −2 e raio 5.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva justificando cada transformação',
            content:
                '1. Calcule |−12|.\n'
                '2. Compare |−7| e |7|.\n'
                '3. Calcule a distância entre −3 e 8.\n'
                '4. Mostre, por casos, que |x| ≥ 0 para todo x real.\n'
                '5. Resolva |x| = 6.\n'
                '6. Resolva |2x − 1| = 5.\n'
                '7. Decida se |x + 4| = −2 possui solução real.\n'
                '8. Resolva |x| < 4.\n'
                '9. Resolva |x| ≥ 3.\n'
                '10. Resolva |x − 5| ≤ 2.\n'
                '11. Resolva |2x + 3| > 7.\n'
                '12. Escreva (−2, 6) na forma |x − c| < r.\n'
                '13. Explique por que |x + y| = |x| + |y| não vale em geral.\n'
                '14. Verifique a desigualdade triangular para x = 4 e y = −7.\n'
                '15. Explique geometricamente o significado de |x − a| < ε.',
            emphasis:
                'Nas inequações, apresente tanto a forma algébrica quanto a notação de intervalo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Valor absoluto é a linguagem da proximidade',
            content:
                'Na definição formal de limite, |x − a| mede a distância entre x e a, enquanto |f(x) − L| mede a distância entre f(x) e L. A expressão [[math:0<|x-a|<\\delta]] descreve x próximo de a, e [[math:|f(x)-L|<\\varepsilon]] expressa que f(x) está próximo de L.',
            emphasis:
                'Dominar valor absoluto como distância prepara diretamente a linguagem ε–δ de limites e continuidade.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax, Algebra and Trigonometry 2e, tópicos de valor absoluto, equações e inequações; OpenStax, Precalculus 2e, relações de distância e funções; Sullivan, Precalculus; Blitzer, Precalculus; James Stewart, Calculus, revisão de inequações e linguagem de distância; Thomas’ Calculus, revisão algébrica e definição de limite; e MIT OpenCourseWare 18.01SC para a conexão entre distância e limites.',
            emphasis:
                'Os exemplos e exercícios foram organizados e adaptados pedagogicamente para o Cálculo Trivial, sem reprodução literal de listas protegidas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual conjunto resolve |x − 3| < 2?',
      choices: ['(1, 5)', '[1, 5]', '(−1, 5)'],
      correctIndex: 0,
      explanation:
          '|x − 3| < 2 significa que a distância entre x e 3 é menor que 2. Portanto, −2 < x − 3 < 2 e, somando 3, obtemos 1 < x < 5.',
    ),
    takeaways: [
      'Valor absoluto é uma função definida por casos e produz sempre um valor não negativo.',
      '|x| representa a distância de x até 0; |x − a| representa a distância de x até a.',
      'Equações |u| = a exigem análise do sinal de a e, quando a > 0, geram dois casos.',
      'Inequações com módulo descrevem regiões internas ou externas em torno de um centro.',
      'A desigualdade triangular controla a magnitude de uma soma.',
      'Valor absoluto não se distribui sobre soma.',
      'A linguagem |x − a| < r descreve uma vizinhança e prepara a definição formal de limite.',
    ],
    closing:
        'Valor absoluto deixa de ser uma regra de sinais quando é entendido como a linguagem algébrica da distância e da proximidade.',
  )];

const List<CourseLessonData> _englishPrecalculusFoundationsCourseLessons = [
  CourseLessonData(
    id: 'precalculo-00-01-reais',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Real numbers and the real line',
    description: 'number systems, order, intervals, and the real-line model',
    duration: '≈ 25 min',
    objective:
        'classify real numbers, justify set inclusions, compare numbers, interpret inequalities, and represent sets using intervals and the real line',
    symbol: 'ℝ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Structure of the real numbers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'From counting numbers to the real continuum',
            content:
                'Natural numbers ℕ model counting. Integers ℤ include the natural numbers, zero, and negative integers. Rational numbers ℚ can be written as p/q, where p and q are integers and q ≠ 0. Irrational numbers are real numbers that cannot be written in this form. Rational and irrational numbers together form ℝ.',
            emphasis:
                'A useful inclusion chain is ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ. Membership in a smaller set does not prevent membership in every larger set containing it.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Rational or irrational?',
            content:
                'Every rational number has a terminating or repeating decimal expansion. An irrational number has an infinite nonrepeating decimal expansion. Thus 3/8, −7, and 0.125 are rational, whereas √2 and π are irrational.',
            emphasis:
                'Formally, a rational number is one that can be written as a ratio of two integers with nonzero denominator.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Order and the real line',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Each real number corresponds to a point',
            content:
                'The real line arranges numbers according to order. If a < b, then the point representing a lies to the left of the point representing b. This model supports comparison, distance, intervals, domains of functions, and later the neighborhoods used in limits.',
            emphasis:
                'Moving right increases value; moving left decreases value.',
          ),
          WorkedExampleBlockData(
            title: 'Comparing numbers in different forms',
            problem: 'Arrange −3/2, √2, 0, and 1.4 in increasing order.',
            steps: [
              'Convert only what is useful: −3/2 = −1.5.',
              'Use √2 ≈ 1.4142.',
              'Compare: −1.5 < 0 < 1.4 < 1.4142.',
              'Return to exact forms where appropriate.',
            ],
            result: '−3/2 < 0 < 1.4 < √2.',
            interpretation:
                'Approximations can help compare values, but exact forms remain preferable when available.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Intervals and inequalities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Intervals are sets of real numbers',
            content:
                'The interval (a, b) contains all real x such that a < x < b. The interval [a, b] contains all real x such that a ≤ x ≤ b. The forms [a, b) and (a, b] include exactly one endpoint.',
            emphasis:
                'Parentheses exclude an endpoint; brackets include an endpoint.',
          ),
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Unbounded intervals',
            content:
                'Conditions such as x ≥ 2 and x < −1 describe unbounded intervals: [2, +∞) and (−∞, −1). The symbols ±∞ indicate the absence of a finite endpoint and are not real numbers.',
            emphasis:
                'Therefore ±∞ always appear with parentheses.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Worked examples',
        blocks: [
          WorkedExampleBlockData(
            title: 'From inequality to interval',
            problem: 'Write −3 ≤ x < 4 in interval notation.',
            steps: [
              '−3 is included because the relation is ≤.',
              '4 is excluded because the relation is <.',
              'Write the endpoints in increasing order.',
            ],
            result: '[−3, 4).',
            interpretation:
                'On the real line, −3 is closed, 4 is open, and every value between them belongs to the set.',
          ),
          WorkedExampleBlockData(
            title: 'From interval to inequality',
            problem: 'Write (−∞, 5] as an inequality.',
            steps: [
              'The interval extends without bound to the left.',
              'Its finite endpoint is 5.',
              'The bracket at 5 means 5 belongs to the set.',
            ],
            result: 'x ≤ 5.',
            interpretation:
                'Interval notation and inequality notation can describe exactly the same set.',
          ),
          WorkedExampleBlockData(
            title: 'Union of intervals',
            problem: 'Write x < −2 or x ≥ 3 in interval notation.',
            steps: [
              'x < −2 corresponds to (−∞, −2).',
              'x ≥ 3 corresponds to [3, +∞).',
              'The word “or” indicates union.',
            ],
            result: '(−∞, −2) ∪ [3, +∞).',
            interpretation:
                'A union contains values satisfying at least one condition.',
          ),
          WorkedExampleBlockData(
            title: 'Intersection of conditions',
            problem: 'Find the real x satisfying x > −1 and x ≤ 4.',
            steps: [
              'x > −1 requires values to the right of −1.',
              'x ≤ 4 allows values up to and including 4.',
              'The word “and” requires both conditions simultaneously.',
            ],
            result: '−1 < x ≤ 4, or (−1, 4].',
            interpretation:
                'An intersection keeps only the region common to both conditions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Conceptual precision',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'An interval is not a pair of numbers',
            content:
                'The interval [1, 3] contains infinitely many real numbers. Its endpoints only bound the set. Values such as 1.2, √2, 2, and 5/2 lie between them.',
            emphasis:
                'Confusing an interval with its endpoints causes later errors with domains, continuity, and limits.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '√4 and x² = 4 are different statements',
            content:
                'The expression √4 denotes the principal square root and equals 2. The equation x² = 4, however, has two real solutions: x = −2 and x = 2.',
            emphasis:
                'An expression has a value; an equation asks for values that make an equality true.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Complete classification',
            problem: 'Classify −12, 7/3, and √9 using the usual number systems.',
            steps: [
              '−12 is an integer, so it is also rational and real.',
              '7/3 is a ratio of integers with nonzero denominator, so it is rational and real.',
              '√9 = 3 is natural, hence also integer, rational, and real.',
            ],
            result:
                '−12 ∈ ℤ, ℚ, ℝ; 7/3 ∈ ℚ, ℝ; √9 = 3 ∈ ℕ, ℤ, ℚ, ℝ.',
            interpretation:
                'A complete classification records every valid set membership.',
          ),
          WorkedExampleBlockData(
            title: 'Building an interval from two conditions',
            problem: 'Represent x ≥ −4 and x < 2.',
            steps: [
              'x ≥ −4 includes −4.',
              'x < 2 excludes 2.',
              'Both conditions must hold simultaneously.',
            ],
            result: '[−4, 2).',
            interpretation:
                'This reasoning will reappear when determining domains of functions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and justify',
            content:
                '1. Classify −5 within ℕ, ℤ, ℚ, and ℝ.\n'
                '2. Classify 0.75 and justify why it is rational.\n'
                '3. Explain why √2 is not rational.\n'
                '4. Arrange −2, −1/2, 0, √3, and 2 in increasing order.\n'
                '5. Write x > 3 in interval notation.\n'
                '6. Write x ≤ −1 in interval notation.\n'
                '7. Convert [−2, 5) to an inequality.\n'
                '8. Convert (0, +∞) to an inequality.\n'
                '9. Represent x < −3 or x ≥ 1 as a union of intervals.\n'
                '10. Represent x ≥ −2 and x < 6 simultaneously.\n'
                '11. Decide whether 2 belongs to (2, 7] and justify.\n'
                '12. Explain why +∞ can never appear with a bracket.',
            emphasis:
                'At university level, justification and notation are part of the answer.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Domains, neighborhoods, and limits live on the real line',
            content:
                'In Calculus, intervals describe domains, regions where functions increase or decrease, and sets on which a property holds. Inequalities of the form a < x < b also underlie neighborhoods and later the formal definition of a limit.',
            emphasis:
                'Mastering the real line now reduces later difficulty with functions, limits, continuity, and derivatives.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax, Algebra and Trigonometry 2e, Section 1.1, Real Numbers: Algebra Essentials; OpenStax, Precalculus; James Stewart, Calculus, Algebra and Precalculus review; Thomas’ Calculus, algebraic prerequisites review; and Gelson Iezzi et al., Fundamentos de Matemática Elementar.',
            emphasis:
                'Cálculo Trivial uses original or pedagogically adapted examples and exercises rather than reproducing protected problem sets verbatim.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Which interval correctly represents the real numbers satisfying −2 < x ≤ 5?',
      choices: ['[−2, 5]', '(−2, 5]', '(−∞, −2) ∪ [5, +∞)'],
      correctIndex: 1,
      explanation:
          '−2 is excluded because the inequality is strict; 5 is included because the relation is ≤. Therefore the interval is (−2, 5].',
    ),
    takeaways: [
      'ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ.',
      'Rational numbers are ratios of integers with nonzero denominator; irrational numbers are real numbers that are not rational.',
      'The real line represents both position and order.',
      'Inequalities and intervals describe sets of real numbers.',
      'Union corresponds to “or”; intersection corresponds to “and” between conditions.',
      '±∞ are not real numbers and are never included endpoints.',
      'Intervals are essential for domains, limits, continuity, and function analysis.',
    ],
    closing:
        'The real line is not merely a diagram: it is the structure on which much of single-variable Calculus is formulated.',
  ),
  CourseLessonData(
    id: 'precalculo-00-02-operacoes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Operations, signs, and precedence',
    description: 'expression structure, signs, grouping, and real-number properties',
    duration: '≈ 25 min',
    objective:
        'evaluate numerical and algebraic expressions reliably by respecting grouping, operational precedence, signs, and the fundamental properties of real numbers',
    symbol: '()÷×',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Structure comes before computation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Operational hierarchy',
            content:
                'An expression is read in levels. Evaluate grouping symbols first, then powers and roots, then multiplication and division, and finally addition and subtraction. Operations with equal precedence are evaluated from left to right.',
            emphasis:
                'Precedence is not optional; it makes the interpretation of an expression unambiguous.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A sign may be inside or outside a power',
            content:
                'In (−3)², the base is −3 and the result is 9. In −3², the base of the power is 3; first compute 3² = 9 and then apply the external negative sign, giving −9.',
            emphasis:
                'Parentheses change the object being raised to a power.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Properties of real numbers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Commutative and associative properties',
            content:
                'For real numbers a, b, and c, a + b = b + a and ab = ba. Also, (a + b) + c = a + (b + c) and (ab)c = a(bc). These properties allow sums and products to be reordered and regrouped without changing their values.',
            emphasis:
                'Subtraction and division are generally neither commutative nor associative.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Distributive property, identities, and inverses',
            content:
                'The distributive property links multiplication and addition: a(b + c) = ab + ac. Zero is the additive identity and 1 is the multiplicative identity. Every real a has an additive inverse −a; every nonzero real has a reciprocal 1/a.',
            emphasis:
                'Zero has no reciprocal because division by zero is undefined.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Signs and subtraction',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Subtracting means adding the opposite',
            content:
                'The expression a − b can be read as a + (−b). This viewpoint helps control signs and explains why subtracting a negative number is equivalent to adding its positive opposite.',
            emphasis: 'For example, 7 − (−4) = 7 + 4 = 11.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Signed products and quotients',
            content:
                'Products and quotients of numbers with the same sign are positive; with different signs they are negative. These sign rules are consistent with the algebraic properties of the real numbers.',
            emphasis:
                'Do not apply sign rules mechanically before identifying which operation is actually present.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Worked examples',
        blocks: [
          WorkedExampleBlockData(
            title: 'Several precedence levels',
            problem: 'Evaluate 18 ÷ 3·2 − (5 − 8).',
            steps: [
              'Evaluate the grouping: 5 − 8 = −3.',
              'Division and multiplication have equal precedence: 18 ÷ 3 = 6 and 6·2 = 12.',
              'Subtract the negative number: 12 − (−3) = 15.',
            ],
            result: '15.',
            interpretation:
                'Reading the structure prevents the common error of treating multiplication as if it always outranked division.',
          ),
          WorkedExampleBlockData(
            title: 'Power and sign',
            problem: 'Compare −2⁴ and (−2)⁴.',
            steps: [
              'In −2⁴, compute 2⁴ = 16.',
              'Apply the external sign: −16.',
              'In (−2)⁴, the base is −2.',
              'Because the exponent is even, (−2)⁴ = 16.',
            ],
            result: '−2⁴ = −16 and (−2)⁴ = 16.',
            interpretation:
                'The difference comes from identifying the base correctly.',
          ),
          WorkedExampleBlockData(
            title: 'Using properties to simplify',
            problem: 'Evaluate 25·17 + 25·3 without computing two separate products.',
            steps: [
              'Identify the common factor 25.',
              'Use the distributive property in reverse: 25(17 + 3).',
              'Add inside the parentheses: 20.',
              'Compute 25·20 = 500.',
            ],
            result: '500.',
            interpretation:
                'Algebraic properties can make numerical computation more efficient.',
          ),
          WorkedExampleBlockData(
            title: 'A simple complex fraction',
            problem: 'Evaluate (3/4 − 1/6) ÷ (5/8).',
            steps: [
              'Use denominator 12: 3/4 = 9/12 and 1/6 = 2/12.',
              'Subtract: 7/12.',
              'Dividing by 5/8 means multiplying by 8/5.',
              'Simplify: (7/12)(8/5) = 14/15.',
            ],
            result: '14/15.',
            interpretation:
                'Replacing division by multiplication by the reciprocal is valid because the divisor 5/8 is nonzero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Errors that propagate',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplication does not outrank division',
            content:
                'Multiplication and division share a precedence level. In 24 ÷ 6·2, evaluate left to right: 24 ÷ 6 = 4 and 4·2 = 8.',
            emphasis:
                'Inventing a precedence rule changes the value of the expression.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Distributing over a sum means multiplying every term',
            content:
                'In −3(x − 4), the factor −3 multiplies both x and −4, producing −3x + 12. Multiplying only the first term breaks the equality.',
            emphasis:
                'After distributing, verify that every term inside the grouping received the external factor.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — precedence',
            problem: 'Evaluate 4 + 2(3² − 5).',
            steps: [
              'Compute the power: 3² = 9.',
              'Evaluate the grouping: 9 − 5 = 4.',
              'Multiply: 2·4 = 8.',
              'Add: 4 + 8 = 12.',
            ],
            result: '12.',
            interpretation:
                'Each step resolves only the highest-priority operation currently available.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — distribution and signs',
            problem: 'Simplify −2(3 − x) + 5.',
            steps: [
              'Distribute −2: −2·3 + (−2)(−x).',
              'Obtain −6 + 2x.',
              'Add the remaining term: −6 + 2x + 5.',
              'Combine constants: 2x − 1.',
            ],
            result: '2x − 1.',
            interpretation:
                'The external negative factor participates in every multiplication.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Show your steps',
            content:
                '1. Evaluate 7 + 3·5.\n'
                '2. Evaluate (7 + 3)·5.\n'
                '3. Evaluate −3² and (−3)².\n'
                '4. Evaluate 36 ÷ 6·3.\n'
                '5. Evaluate 10 − (4 − 9).\n'
                '6. Simplify 4(2x − 3).\n'
                '7. Simplify −5(a + 2).\n'
                '8. Use distribution to evaluate 19·7 + 19·3.\n'
                '9. Explain why 8 − 3 ≠ 3 − 8.\n'
                '10. Explain why 12 ÷ 4 ≠ 4 ÷ 12.\n'
                '11. Evaluate (5/6 + 1/3) ÷ 2.\n'
                '12. Identify the property used in 6(x + 4) = 6x + 24.',
            emphasis:
                'Do not record only the result: identify the property or precedence rule used at decisive steps.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Arithmetic errors become Calculus errors',
            content:
                'Algebraic simplification appears before limits, derivatives, and integrals. A sign or precedence error can create a different function from the original and invalidate everything that follows.',
            emphasis:
                'Algebraic precision is an entry requirement for Calculus, not a separate skill.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax, Algebra and Trigonometry 2e, Section 1.1, including order of operations and properties of real numbers; OpenStax, Precalculus; James Stewart, Calculus, Algebra review; Thomas’ Calculus, prerequisite materials; and MIT OpenCourseWare 18.01/18.01SC, which explicitly identifies algebra and trigonometry as prerequisites for university Calculus.',
            emphasis:
                'Cálculo Trivial uses original or pedagogically adapted exercises rather than reproducing protected problem sets verbatim.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is the value of −2² + (−2)²?',
      choices: ['−8', '0', '8'],
      correctIndex: 1,
      explanation:
          '−2² = −(2²) = −4, while (−2)² = 4. Therefore, −4 + 4 = 0.',
    ),
    takeaways: [
      'Grouping precedes powers, products, and sums.',
      'Multiplication and division have equal precedence and are evaluated left to right.',
      'Parentheses determine whether a sign belongs to the base of a power.',
      'Commutativity and associativity hold for addition and multiplication, not for subtraction and division.',
      'The distributive property connects multiplication and addition.',
      'Division by zero is undefined.',
      'Operational precision prevents errors from propagating into Algebra and Calculus.',
    ],
    closing:
        'Correct computation is not about executing rules quickly; it is about preserving the mathematical structure of the expression at every step.',
  ),
  CourseLessonData(
    id: 'precalculo-00-03-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Variables, constants, and expressions',
    description: 'algebraic structure, terms, coefficients, substitution, and interpretation',
    duration: '≈ 25 min',
    objective:
        'interpret algebraic expressions precisely, identify terms, coefficients, constants, and variables, distinguish expressions from equations, and evaluate expressions by substitution',
    symbol: '3x+2',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'The language of Algebra',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Symbols represent relationships',
            content:
                'An algebraic expression combines numbers, variables, and operations to represent a quantity. A variable may represent an unknown number, a parameter, or a changing quantity. A constant keeps a fixed value within the context being considered.',
            emphasis:
                'Algebra does not treat letters as mysterious objects; they represent quantities and relationships among quantities.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Expression, equation, and identity',
            content:
                'An expression such as 3x + 5 represents a quantity. An equation such as 3x + 5 = 11 states that two expressions have the same value for particular values of x. An identity such as 2(x + 1) = 2x + 2 is true for every value in its domain.',
            emphasis:
                'Distinguishing these objects prevents confusion among evaluating, solving, and proving equivalence.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Terms, coefficients, and constants',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'How to decompose an expression',
            content:
                'In 4x² − 3x + 7, the terms are 4x², −3x, and 7. The coefficients of the variable terms are 4 and −3. The term 7 is constant. In x the coefficient is 1; in −x the coefficient is −1.',
            emphasis:
                'The sign belongs to the term when identifying the terms of an algebraic sum.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Literal part and degree of a term',
            content:
                'In 5x³y², the coefficient is 5 and the literal part is x³y². For a monomial, the degree is the sum of the exponents of its variables, so 5x³y² has degree 5.',
            emphasis:
                'Coefficient and exponent play different roles: 3x² means 3·x·x, not (3x)².',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Evaluation by substitution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Substitution must preserve structure',
            content:
                'To evaluate an expression, replace variables by values and perform the operations while preserving the original structure. When the substituted value is negative, parentheses are essential for handling signs and powers correctly.',
            emphasis:
                'If x = −2, then x² should be written as (−2)² during substitution.',
          ),
          WorkedExampleBlockData(
            title: 'Substitution with a negative value',
            problem: 'Evaluate 2x² − 5x + 1 for x = −2.',
            steps: [
              'Substitute using parentheses: 2(−2)² − 5(−2) + 1.',
              'Evaluate the power: (−2)² = 4.',
              'Multiply: 2·4 = 8 and −5(−2) = +10.',
              'Add: 8 + 10 + 1 = 19.',
            ],
            result: '19.',
            interpretation:
                'Parentheses prevent the negative sign from being lost or attached to the wrong operation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Modeling and interpretation',
        blocks: [
          WorkedExampleBlockData(
            title: 'Translating a situation',
            problem:
                'A company charges a fixed fee of 12 dollars plus 4 dollars per unit produced. Write an expression for the total cost of x units.',
            steps: [
              'Let x be the number of units produced.',
              'The variable part is 4x.',
              'The fixed part is 12.',
              'Combine them: C = 12 + 4x.',
            ],
            result: 'C = 12 + 4x.',
            interpretation:
                'The coefficient 4 is the rate per unit, while the constant 12 is independent of x.',
          ),
          WorkedExampleBlockData(
            title: 'Interpreting an expression',
            problem: 'Interpret P = 1500 − 20t in an inventory context.',
            steps: [
              'P is a quantity depending on t.',
              'The constant 1500 is the initial value when t = 0.',
              'The coefficient −20 indicates a decrease of 20 units for each one-unit increase in t.',
            ],
            result:
                'The model describes an initial inventory of 1500 units decreasing by 20 units per unit of time.',
            interpretation:
                'Reading coefficients and constants as information in a model prepares the study of functions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Conceptual precision',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'x² and 2x are not equivalent',
            content:
                'x² means x·x, whereas 2x means 2·x. For example, if x = 3, then x² = 9 and 2x = 6.',
            emphasis:
                'Exponents and coefficients are not interchangeable.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '3(x + 2) is not 3x + 2',
            content:
                'The factor 3 multiplies the entire expression x + 2. By the distributive property, 3(x + 2) = 3x + 6.',
            emphasis:
                'Ignoring grouping changes the original expression.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'An expression is not “solved” without a condition',
            content:
                'The expression 2x + 5 may be simplified or evaluated for a chosen value of x, but it has no solution by itself. Solving is associated with equations, inequalities, or other conditions.',
            emphasis:
                'Use precise mathematical verbs: evaluate, simplify, expand, factor, and solve are different actions.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Worked examples',
        blocks: [
          WorkedExampleBlockData(
            title: 'Structural identification',
            problem: 'Analyze the expression −7a³b + 4ab² − 9.',
            steps: [
              'The terms are −7a³b, 4ab², and −9.',
              'The coefficients of the variable terms are −7 and 4.',
              'The constant term is −9.',
              'The literal parts are a³b and ab².',
            ],
            result:
                'The expression has three terms, two variable terms, and one constant term.',
            interpretation:
                'Correct structural decomposition is a prerequisite for combining terms, factoring, and working with polynomials.',
          ),
          WorkedExampleBlockData(
            title: 'Evaluation with two variables',
            problem: 'Evaluate 3x²y − 2xy + 4 for x = −1 and y = 2.',
            steps: [
              'Substitute: 3(−1)²(2) − 2(−1)(2) + 4.',
              'Evaluate (−1)² = 1.',
              'Multiply: 3·1·2 = 6 and −2(−1)(2) = +4.',
              'Add: 6 + 4 + 4 = 14.',
            ],
            result: '14.',
            interpretation:
                'With several variables, each substitution must preserve its own position and grouping.',
          ),
          WorkedExampleBlockData(
            title: 'Equivalence by distribution',
            problem: 'Show that 5(x − 2) + 3x and 8x − 10 are equivalent.',
            steps: [
              'Distribute 5: 5x − 10 + 3x.',
              'Combine like terms: 8x − 10.',
              'The resulting expression matches the second expression.',
            ],
            result: '5(x − 2) + 3x = 8x − 10.',
            interpretation:
                'Expressions that look different may represent the same quantity for every allowed value of x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — reading the expression',
            problem: 'In 6x² − x + 5, identify the terms and coefficients.',
            steps: [
              'Separate terms at top-level addition and subtraction.',
              'The terms are 6x², −x, and 5.',
              'The coefficients of the x-terms are 6 and −1.',
              'The constant term is 5.',
            ],
            result: 'Terms: 6x², −x, 5; coefficients: 6 and −1; constant: 5.',
            interpretation:
                'The implied coefficient of −x is −1.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — substitution',
            problem: 'Evaluate a² − 2ab + b² for a = 3 and b = −1.',
            steps: [
              'Substitute: 3² − 2(3)(−1) + (−1)².',
              'Evaluate the powers: 9 and 1.',
              'Compute the product: −2(3)(−1) = +6.',
              'Add: 9 + 6 + 1 = 16.',
            ],
            result: '16.',
            interpretation:
                'Parentheses are essential when a substituted value is negative.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and explain',
            content:
                '1. Identify the terms of 5x² − 3x + 8.\n'
                '2. Determine the coefficient of −x³.\n'
                '3. In 4ab² − 7, identify the coefficient, literal part, and constant.\n'
                '4. Explain the difference between an expression and an equation.\n'
                '5. Evaluate 3x − 4 for x = −2.\n'
                '6. Evaluate x² + 2x + 1 for x = −3.\n'
                '7. Evaluate 2ab − b² for a = 4 and b = −2.\n'
                '8. Write an expression for “five more than twice x.”\n'
                '9. Write an expression for “half the sum of x and 6.”\n'
                '10. Interpret the coefficient and constant in C = 9 + 2.5x.\n'
                '11. Verify that 3(x + 4) and 3x + 12 are equivalent.\n'
                '12. Explain why x² and 2x cannot be treated as the same expression.',
            emphasis:
                'Answers should use precise mathematical language and display the structure of the expression.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Expressions become functions',
            content:
                'In Calculus, a function associates input values with output values through a rule. The ability to interpret an expression as a relationship among quantities is essential for domains, composition, limits, derivatives, and modeling.',
            emphasis:
                'Before studying how a function changes, you must be able to read the expression defining it correctly.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'References and further study',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis for this lesson',
            content:
                'References: OpenStax, Intermediate Algebra 2e, Section 1.1, Use the Language of Algebra; OpenStax, Algebra and Trigonometry 2e, Section 1.4, Polynomials, for terms, coefficients, and constants; James Stewart, Calculus, Algebra Review; Thomas’ Calculus, algebra review; and MIT OpenCourseWare 18.01SC, which assumes algebra as a prerequisite for university Calculus.',
            emphasis:
                'Cálculo Trivial uses original or pedagogically adapted examples and exercises rather than reproducing protected problem sets verbatim.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'In −6a³ + 4, what is the coefficient of the term containing a³?',
      choices: ['−6', '3', '4'],
      correctIndex: 0,
      explanation:
          'The coefficient is the numerical factor multiplying the literal part. In −6a³, that factor is −6.',
    ),
    takeaways: [
      'Expressions combine numbers, variables, and operations to represent quantities.',
      'Terms are separated by top-level addition and subtraction.',
      'A coefficient multiplies the literal part; a constant is independent of the variables.',
      'Expressions, equations, and identities are different mathematical objects.',
      'Substitution must preserve signs, parentheses, and powers.',
      'Equivalent expressions may have different forms while representing the same quantity.',
      'Accurate algebraic reading prepares the formal study of functions and Calculus.',
    ],
    closing:
        'Reading Algebra precisely means learning to see structure rather than only symbols.',
  ),
  CourseLessonData(
    id: 'precalculo-00-04-potencias-raizes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Powers, roots, and exponents',
    description: 'exponent laws, radicals, rational exponents, and real domains',
    duration: '≈ 30 min',
    objective:
        'apply exponent laws with their validity conditions, interpret roots and rational exponents over the real numbers, determine domain restrictions, and avoid invalid algebraic simplifications',
    symbol: 'xᵃ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Powers as structure',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Base and exponent play different roles',
            content:
                'In aⁿ, a is the base and n is the exponent. For a positive integer n, aⁿ is the product of n factors equal to a. Thus a³ = a·a·a. This definition is the starting point for the exponent laws.',
            emphasis:
                'The exponent does not multiply the base: a³ does not mean 3a.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Sign and grouping',
            content:
                'The expressions −2⁴ and (−2)⁴ are not equal. In the first, the power acts on 2 and the negative sign remains outside: −2⁴ = −16. In the second, the base is −2: (−2)⁴ = 16.',
            emphasis:
                'Always identify the base before applying an exponent law.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Integer exponent laws',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Product, quotient, and power of a power',
            content:
                'For the same base, aᵐ·aⁿ = aᵐ⁺ⁿ. For a ≠ 0, aᵐ/aⁿ = aᵐ⁻ⁿ. Also, (aᵐ)ⁿ = aᵐⁿ. For products and quotients, (ab)ⁿ = aⁿbⁿ and, for b ≠ 0, (a/b)ⁿ = aⁿ/bⁿ.',
            emphasis:
                'Each law belongs to a specific structure. Do not transfer a product rule to a sum.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Exponents do not distribute over addition',
            content:
                'In general, (a + b)² ≠ a² + b². By distribution, (a + b)² = a² + 2ab + b².',
            emphasis:
                'With a = 2 and b = 3: (2 + 3)² = 25, whereas 2² + 3² = 13.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Zero and negative exponents',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Why a⁰ = 1',
            content:
                'For a ≠ 0, the quotient law gives aᵐ/aᵐ = aᵐ⁻ᵐ = a⁰. Since every nonzero number divided by itself is 1, a⁰ = 1.',
            emphasis:
                'The condition a ≠ 0 is essential. In elementary real-number algebra, 0⁰ is not treated as a defined power.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'A negative exponent means reciprocal',
            content:
                'For a ≠ 0 and positive integer n, a⁻ⁿ = 1/aⁿ. The negative sign in the exponent does not make the value negative; it changes the multiplicative position.',
            emphasis:
                '2⁻³ = 1/8, whereas −2³ = −8.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Nth roots',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Principal root',
            content:
                'For positive integer n, √[n]{a} denotes a real number b satisfying bⁿ = a whenever such a real root exists. For even index, the principal root is defined to be nonnegative. For odd index, real roots also exist for negative radicands.',
            emphasis:
                '√9 = 3, not ±3. The equation x² = 9, however, has solutions x = ±3.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Even index and odd index',
            content:
                '√16 = 4 and √[4]{16} = 2 are real and nonnegative. In contrast, √[3]{−8} = −2 because (−2)³ = −8. The expression √(−8) does not denote a real number.',
            emphasis:
                'Over the real numbers, even-index radicals require a nonnegative radicand.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Rational exponents',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A fractional exponent encodes a root and a power',
            content:
                'If m/n is in lowest terms with n > 0, then a^(m/n) is interpreted through an nth root and the mth power whenever the real expression is defined. We may write a^(m/n) = (√[n]{a})ᵐ.',
            emphasis:
                'The denominator n determines the root; the numerator m determines the power.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Domain conditions depend on the denominator',
            content:
                'If n is even, a must be nonnegative for a^(m/n) to be real. If m is also negative, then a must be strictly positive because a reciprocal is involved. If n is odd, negative bases are allowed; with a negative exponent, the base still cannot be zero.',
            emphasis:
                'Reduce the exponent fraction first and check the real domain before simplifying.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Worked examples',
        blocks: [
          WorkedExampleBlockData(
            title: 'Positive rational exponent',
            problem: 'Evaluate 16^(3/2).',
            steps: [
              'The denominator 2 indicates a square root.',
              'Compute √16 = 4.',
              'Raise to the numerator 3: 4³ = 64.',
            ],
            result: '16^(3/2) = 64.',
            interpretation:
                'Taking the root first makes the arithmetic simpler.',
          ),
          WorkedExampleBlockData(
            title: 'Negative base with odd denominator',
            problem: 'Evaluate (−27)^(2/3).',
            steps: [
              'The denominator 3 indicates a cube root.',
              '√[3]{−27} = −3.',
              'Square: (−3)² = 9.',
            ],
            result: '(−27)^(2/3) = 9.',
            interpretation:
                'The negative base is allowed because the root has odd index.',
          ),
          WorkedExampleBlockData(
            title: 'When the expression is not real',
            problem: 'Analyze (−16)^(1/2) over the real numbers.',
            steps: [
              'The denominator 2 indicates a square root.',
              'A real square root requires a nonnegative radicand.',
              'Since −16 < 0, no real value exists.',
            ],
            result: '(−16)^(1/2) is not real.',
            interpretation:
                'The domain must be checked before algebraic manipulation.',
          ),
          WorkedExampleBlockData(
            title: 'Negative rational exponent',
            problem: 'Evaluate 81^(−3/4).',
            steps: [
              'The negative exponent means reciprocal: 1/81^(3/4).',
              '√[4]{81} = 3.',
              'Thus 81^(3/4) = 3³ = 27.',
              'Take the reciprocal.',
            ],
            result: '81^(−3/4) = 1/27.',
            interpretation:
                'A negative exponent changes the multiplicative position, not the sign of the result.',
          ),
          WorkedExampleBlockData(
            title: 'Rational exponent with a fourth root',
            problem: 'Evaluate 81^(3/4).',
            steps: [
              'The denominator 4 indicates a fourth root.',
              'Compute √[4]{81} = 3.',
              'Raise to the numerator 3: 3³ = 27.',
            ],
            result: '81^(3/4) = 27.',
            interpretation:
                'The denominator determines the root and the numerator determines the power.',
          ),
          WorkedExampleBlockData(
            title: 'Cube root of a negative base',
            problem: 'Evaluate (−27)^(1/3).',
            steps: [
              'The denominator 3 indicates a cube root.',
              'Because the index is odd, a negative base is allowed over the reals.',
              '√[3]{−27} = −3.',
            ],
            result: '(−27)^(1/3) = −3.',
            interpretation:
                'Odd-index roots preserve the sign of negative radicands.',
          ),
          WorkedExampleBlockData(
            title: 'Reduce the exponent before analyzing the domain',
            problem: 'Interpret (−8)^(2/6) over the real numbers.',
            steps: [
              'First reduce the exponent fraction: 2/6 = 1/3.',
              'The relevant denominator is therefore 3, which is odd.',
              'Thus (−8)^(2/6) = (−8)^(1/3) = √[3]{−8} = −2.',
            ],
            result: '(−8)^(2/6) = −2.',
            interpretation:
                'Inspecting denominator 6 before reducing the fraction would impose an incorrect domain restriction.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Radicals and simplification',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Extracting perfect-power factors',
            content:
                'A radical can be simplified by separating factors that are perfect powers of the index. For example, √72 = √(36·2) = 6√2.',
            emphasis:
                'Simplifying a radical is not the same as replacing it with a decimal approximation.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '√(x²) = |x|',
            content:
                'The principal square root is always nonnegative. Therefore √(x²) = |x| for every real x. Writing x alone is incorrect when x < 0.',
            emphasis:
                'If x = −5, then √(x²) = √25 = 5 = |−5|, not −5.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Domains of expressions with roots',
        blocks: [
          WorkedExampleBlockData(
            title: 'Square root of an expression',
            problem: 'Find the real domain of f(x) = √(x − 5).',
            steps: [
              'The root has even index.',
              'Require x − 5 ≥ 0.',
              'Solve: x ≥ 5.',
            ],
            result: 'Domain: [5, +∞).',
            interpretation:
                'The restriction comes from the existence of the square root over the reals.',
          ),
          WorkedExampleBlockData(
            title: 'A root in the denominator',
            problem: 'Find the real domain of g(x) = 1/√(x + 2).',
            steps: [
              'Because this is a square root, require x + 2 ≥ 0.',
              'Because the root is in the denominator, it must also be nonzero.',
              'Therefore x + 2 > 0.',
            ],
            result: 'Domain: (−2, +∞).',
            interpretation:
                'A single expression can combine a radical restriction and a denominator restriction.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Frequent conceptual errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Add exponents only in products with the same base',
            content:
                'x²·x³ = x⁵, but x² + x³ cannot be reduced to x⁵. Addition and multiplication are different operations.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A root of a sum does not split',
            content:
                'In general, √(a + b) ≠ √a + √b. For example, √(9 + 16) = 5, whereas √9 + √16 = 7.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Exponent laws require compatible domains',
            content:
                'With rational exponents over the reals, formal manipulations must respect the existence of every expression involved. An algebraic transformation cannot create real values where the original expression was undefined.',
            emphasis:
                'Determine the domain first; simplify second.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — exponent laws',
            problem: 'Simplify (2x³)²·x⁻¹, with x ≠ 0.',
            steps: [
              '(2x³)² = 4x⁶.',
              'Multiply by x⁻¹: 4x⁶·x⁻¹.',
              'Add exponents of the same base: 6 + (−1) = 5.',
            ],
            result: '4x⁵.',
            interpretation:
                'The condition x ≠ 0 comes from the original factor x⁻¹.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — domain',
            problem: 'Find the domain of h(x) = (x − 1)^(1/2).',
            steps: [
              'The denominator of the rational exponent is 2.',
              'This corresponds to a square root.',
              'Require x − 1 ≥ 0.',
            ],
            result: 'x ≥ 1, or [1, +∞).',
            interpretation:
                'Rational exponents also carry domain restrictions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Show domain and justification when needed',
            content:
                '1. Simplify x⁴·x⁷.\n'
                '2. Simplify x⁹/x³, stating the condition on x.\n'
                '3. Simplify (a³)⁴.\n'
                '4. Rewrite 5⁻³ without a negative exponent.\n'
                '5. Evaluate 64^(1/3).\n'
                '6. Evaluate 16^(3/2).\n'
                '7. Evaluate (−8)^(1/3).\n'
                '8. Decide whether (−16)^(1/2) is real.\n'
                '9. Evaluate 81^(−1/2).\n'
                '10. Simplify √50.\n'
                '11. Explain why √(x²) = |x|.\n'
                '12. Find the domain of √(x + 4).\n'
                '13. Find the domain of 1/√(x − 2).\n'
                '14. Use numbers to show that (a + b)² ≠ a² + b² in general.\n'
                '15. Explain why √(a + b) cannot generally be split into √a + √b.',
            emphasis:
                'For domain questions, an answer without the existence condition is incomplete.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Exponents govern functions and derivatives',
            content:
                'Power functions, radicals, and rational exponents appear throughout Calculus. The power rule for derivatives, domain analysis, limits involving radicals, and growth models all depend directly on these algebraic structures.',
            emphasis:
                'Errors with exponents and domains often reappear later as errors in limits or derivatives.',
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
                'References: OpenStax, Algebra and Trigonometry 2e, Sections 1.2, Exponents and Scientific Notation, and 1.3, Radicals and Rational Exponents; OpenStax, College Algebra 2e, Sections 1.2 and 1.3; James Stewart, Calculus, Algebra review and power functions; Thomas’ Calculus, algebra review and functions; and MIT OpenCourseWare 18.01SC, whose single-variable Calculus course requires prior algebra and trigonometry.',
            emphasis:
                'Cálculo Trivial uses original or pedagogically adapted organization, examples, and exercises rather than reproducing protected problem sets verbatim.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'What is the real domain of f(x) = (x − 3)^(1/2)?',
      choices: ['x > 3', 'x ≥ 3', 'all real numbers'],
      correctIndex: 1,
      explanation:
          'The exponent 1/2 represents a square root. For a real value, x − 3 must be nonnegative: x − 3 ≥ 0, so x ≥ 3.',
    ),
    takeaways: [
      'Exponent laws depend on expression structure and domain conditions.',
      'A zero exponent requires a nonzero base; a negative exponent also excludes zero.',
      'Even-index roots require a nonnegative radicand over the reals.',
      'Odd-index roots allow negative radicands.',
      'In a^(m/n), the denominator determines the root and the numerator determines the power.',
      '√(x²) = |x|, not x in general.',
      'Exponents do not distribute over sums, and roots of sums do not split.',
      'Analyze the domain before simplifying.',
    ],
    closing:
        'Powers and roots stop being a list of rules when every manipulation is tied to the structure of the expression and to the domain in which it is valid.',
  ),
  CourseLessonData(
    id: 'precalculo-00-05-modulo',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Absolute value, distance, and inequalities',
    description:
        'piecewise definition, properties, distance on the real line, equations, inequalities, and the triangle inequality',
    duration: '≈ 30 min',
    objective:
        'interpret absolute value as magnitude and distance, apply its piecewise definition, solve absolute-value equations and inequalities, justify fundamental properties, and connect distance language to the formulation of limits',
    symbol: '|x|',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Formal definition of absolute value',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A piecewise-defined function',
            content:
                'For a real number x, absolute value is defined by [[math:|x|=\\begin{cases}x,&x\\ge 0\\\\-x,&x<0\\end{cases}]]. The definition does not merely “erase” a sign: in each case it selects the expression that produces the nonnegative magnitude of x.',
            emphasis:
                'If x ≥ 0, then |x| = x. If x < 0, then |x| = −x, which is positive because x is already negative.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Geometric interpretation',
            content:
                'On the real line, |x| is the distance between x and 0. Thus |5| = 5 and |−5| = 5 because 5 and −5 are equally far from the origin.',
            emphasis:
                'Absolute value measures magnitude or distance; distance is never negative.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Fundamental properties',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Basic properties',
            content:
                'For real x and y: |x| ≥ 0; |x| = 0 if and only if x = 0; |−x| = |x|; |xy| = |x||y|; and, for y ≠ 0, |x/y| = |x|/|y|. Also, |x|² = x² and [[math:|x|=\\sqrt{x^2}]].',
            emphasis:
                'Validity conditions matter: the quotient property requires y ≠ 0.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Absolute value does not distribute over addition',
            content:
                'In general, |x + y| ≠ |x| + |y|. For x = 3 and y = −2, |3 + (−2)| = 1 whereas |3| + |−2| = 5.',
            emphasis:
                'What always holds is the triangle inequality: |x + y| ≤ |x| + |y|.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Distance between real numbers',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'The distance formula on the real line',
            content:
                'The distance between real numbers a and b is [[math:d(a,b)=|a-b|]]. Since |a − b| = |b − a|, reversing the points does not change the distance.',
            emphasis:
                'The expression |x − a| measures exactly how far x is from a.',
          ),
          WorkedExampleBlockData(
            title: 'Distance between two points',
            problem: 'Find the distance between −4 and 7.',
            steps: [
              'Use d(a,b) = |a − b|.',
              'd(−4,7) = |−4 − 7|.',
              'd(−4,7) = |−11| = 11.',
            ],
            result: 'The distance is 11.',
            interpretation:
                'Reversing the order gives |7 − (−4)| = |11| = 11. Distance is symmetric.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Absolute-value equations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The model |u| = a',
            content:
                'If a > 0, |u| = a is equivalent to u = a or u = −a. If a = 0, then u = 0. If a < 0, there is no real solution because absolute value cannot be negative.',
            emphasis:
                'Inspect the number on the right before splitting into cases.',
          ),
          WorkedExampleBlockData(
            title: 'An equation with two solutions',
            problem: 'Solve |2x − 5| = 7.',
            steps: [
              'Use two cases: 2x − 5 = 7 or 2x − 5 = −7.',
              'First case: 2x = 12, so x = 6.',
              'Second case: 2x = −2, so x = −1.',
              'Check both values in the original equation.',
            ],
            result: 'Solution: {−1, 6}.',
            interpretation:
                'The inside expression can lie 7 units from zero on either side.',
          ),
          WorkedExampleBlockData(
            title: 'An equation with no real solution',
            problem: 'Solve |3x + 1| = −4.',
            steps: [
              'For every real u, |u| ≥ 0.',
              'The right-hand side is −4, which is negative.',
            ],
            result: 'There is no real solution.',
            interpretation:
                'Using the range of the absolute-value function avoids unnecessary algebra.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Inequalities and intervals',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Less than: points inside an interval',
            content:
                'For a > 0, |x| < a is equivalent to −a < x < a, and |x| ≤ a is equivalent to −a ≤ x ≤ a. These conditions describe points whose distance from 0 is less than, or at most, a.',
            emphasis:
                'With center c, |x − c| < r describes the interval (c − r, c + r).',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Greater than: points outside an interval',
            content:
                'For a > 0, |x| > a is equivalent to x < −a or x > a. Likewise, |x| ≥ a is equivalent to x ≤ −a or x ≥ a.',
            emphasis:
                '“Less than” gives an inside region; “greater than” gives two outside regions.',
          ),
          WorkedExampleBlockData(
            title: 'An inequality as a neighborhood',
            problem: 'Solve |x − 4| ≤ 3.',
            steps: [
              'Interpret distance: x is at most 3 units from 4.',
              'Write −3 ≤ x − 4 ≤ 3.',
              'Add 4 throughout: 1 ≤ x ≤ 7.',
            ],
            result: 'Solution: [1, 7].',
            interpretation:
                'The interval has center 4 and radius 3.',
          ),
          WorkedExampleBlockData(
            title: 'An outside region',
            problem: 'Solve |2x + 1| > 5.',
            steps: [
              'Split into 2x + 1 < −5 or 2x + 1 > 5.',
              'First case: 2x < −6, so x < −3.',
              'Second case: 2x > 4, so x > 2.',
            ],
            result: 'Solution: (−∞, −3) ∪ (2, +∞).',
            interpretation:
                'The solution lies outside the interval where |2x + 1| would be at most 5.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Centers, radii, and neighborhoods',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'The expression |x − a| < r',
            content:
                'For r > 0, |x − a| < r means that x lies less than r units from a. Algebraically, a − r < x < a + r. In Calculus, this interval is an open neighborhood of a.',
            emphasis:
                'Absolute value turns a geometric statement of proximity into an algebraic inequality.',
          ),
          WorkedExampleBlockData(
            title: 'From distance to interval notation',
            problem: 'Write |x − 2| < 0.1 as an interval.',
            steps: [
              'The center is 2 and the radius is 0.1.',
              'Left endpoint: 2 − 0.1 = 1.9.',
              'Right endpoint: 2 + 0.1 = 2.1.',
              'The inequality is strict, so the endpoints are excluded.',
            ],
            result: 'x ∈ (1.9, 2.1).',
            interpretation:
                'This is precisely the language used to say that x is “close” to 2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'The triangle inequality',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'A central property of distance',
            content:
                'For all real x and y, [[math:|x+y|\\le |x|+|y|]]. This is the triangle inequality. It states that a direct displacement cannot exceed a route broken into intermediate displacements.',
            emphasis:
                'Equality can occur, but it is not guaranteed. Therefore ≤ cannot be replaced by =.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Reverse triangle inequality',
            content:
                'We also have [[math:\\bigl||x|-|y|\\bigr|\\le |x-y|]]. It compares the difference between magnitudes with the distance between the numbers themselves.',
            emphasis:
                'These inequalities are useful in error estimates, limits, and continuity.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Frequent conceptual errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '−|x| is not the same as |−x|',
            content:
                '|−x| = |x| is always nonnegative. By contrast, −|x| is always nonpositive. If x = 3, then |−3| = 3 whereas −|3| = −3.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '|x| = a does not simply mean x = a',
            content:
                'When a > 0 there are generally two possibilities: x = a or x = −a. Ignoring one case removes a valid solution.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Do not replace |x + y| with |x| + |y|',
            content:
                'Absolute value is multiplicative over products, but it is not additive over sums. For sums, the general relation is an inequality rather than an equality.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — equation',
            problem: 'Solve |3x − 6| = 9.',
            steps: [
              'Write 3x − 6 = 9 or 3x − 6 = −9.',
              'First case: 3x = 15, so x = 5.',
              'Second case: 3x = −3, so x = −1.',
              'Substitute both values to verify.',
            ],
            result: 'Solution: {−1, 5}.',
            interpretation:
                'The two solutions correspond to two positions at the same distance.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — inequality',
            problem: 'Solve |x + 2| < 5.',
            steps: [
              'Write −5 < x + 2 < 5.',
              'Subtract 2 throughout.',
              'Obtain −7 < x < 3.',
            ],
            result: 'Solution: (−7, 3).',
            interpretation:
                'The interval has center −2 and radius 5.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Justify each transformation',
            content:
                '1. Evaluate |−12|.\n'
                '2. Compare |−7| and |7|.\n'
                '3. Find the distance between −3 and 8.\n'
                '4. Use cases to show that |x| ≥ 0 for every real x.\n'
                '5. Solve |x| = 6.\n'
                '6. Solve |2x − 1| = 5.\n'
                '7. Decide whether |x + 4| = −2 has a real solution.\n'
                '8. Solve |x| < 4.\n'
                '9. Solve |x| ≥ 3.\n'
                '10. Solve |x − 5| ≤ 2.\n'
                '11. Solve |2x + 3| > 7.\n'
                '12. Write (−2, 6) in the form |x − c| < r.\n'
                '13. Explain why |x + y| = |x| + |y| does not hold in general.\n'
                '14. Verify the triangle inequality for x = 4 and y = −7.\n'
                '15. Explain geometrically what |x − a| < ε means.',
            emphasis:
                'For inequalities, give both the algebraic form and interval notation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Absolute value is the language of proximity',
            content:
                'In the formal definition of a limit, |x − a| measures the distance between x and a, while |f(x) − L| measures the distance between f(x) and L. The condition [[math:0<|x-a|<\\delta]] says that x is close to a, and [[math:|f(x)-L|<\\varepsilon]] says that f(x) is close to L.',
            emphasis:
                'Understanding absolute value as distance directly prepares the ε–δ language of limits and continuity.',
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
                'References: OpenStax, Algebra and Trigonometry 2e, topics on absolute value, equations, and inequalities; OpenStax, Precalculus 2e, distance relations and functions; Sullivan, Precalculus; Blitzer, Precalculus; James Stewart, Calculus, review of inequalities and distance language; Thomas’ Calculus, algebra review and the definition of limit; and MIT OpenCourseWare 18.01SC for the connection between distance and limits.',
            emphasis:
                'The examples and exercises are organized and pedagogically adapted for Cálculo Trivial without reproducing protected problem sets verbatim.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which set solves |x − 3| < 2?',
      choices: ['(1, 5)', '[1, 5]', '(−1, 5)'],
      correctIndex: 0,
      explanation:
          '|x − 3| < 2 means that the distance between x and 3 is less than 2. Thus −2 < x − 3 < 2, and adding 3 gives 1 < x < 5.',
    ),
    takeaways: [
      'Absolute value is a piecewise-defined function and is always nonnegative.',
      '|x| is the distance from x to 0; |x − a| is the distance from x to a.',
      'Equations |u| = a require checking the sign of a and, when a > 0, splitting into two cases.',
      'Absolute-value inequalities describe inside or outside regions around a center.',
      'The triangle inequality controls the magnitude of a sum.',
      'Absolute value does not distribute over addition.',
      'The language |x − a| < r describes a neighborhood and prepares the formal definition of limit.',
    ],
    closing:
        'Absolute value stops being a sign rule when it is understood as the algebraic language of distance and proximity.',
  )];
