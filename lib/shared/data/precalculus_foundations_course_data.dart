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
    description: 'termos, coeficientes, símbolos e valor numérico',
    duration: '≈ 12 min',
    objective:
        'identificar a estrutura de expressões algébricas e interpretar corretamente variáveis, constantes, coeficientes e termos',
    symbol: '3x+2',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Leia uma expressão como linguagem',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Cada parte tem uma função',
            content:
                'Na expressão 4x² − 3x + 7, x é a variável; 4 e −3 são coeficientes dos termos com variável; 7 é termo constante. Os termos são separados por adições ou subtrações consideradas no nível principal da expressão.',
            emphasis:
                'Uma expressão descreve um valor; uma equação acrescenta uma igualdade a ser satisfeita.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A variável representa possibilidade',
            content:
                'Uma letra não é um objeto misterioso: ela representa um número ainda não fixado ou uma quantidade que pode variar. Quando atribuímos um valor à variável, podemos calcular o valor numérico da expressão.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Substituição com sinais',
            problem: 'Calcule 2x² − 5x + 1 para x = −2.',
            steps: [
              'Substitua x por −2 usando parênteses: 2(−2)² − 5(−2) + 1.',
              'Calcule a potência: (−2)² = 4.',
              'Efetue os produtos: 2·4 = 8 e −5(−2) = +10.',
              'Some: 8 + 10 + 1 = 19.',
            ],
            result: 'O valor numérico é 19.',
            interpretation:
                'Usar parênteses na substituição conserva o sinal do valor inserido.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'x² e 2x não significam a mesma coisa',
            content:
                'x² significa x·x. Já 2x significa 2·x. Expoente e coeficiente desempenham papéis diferentes.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Na expressão −6a³ + 4, qual é o coeficiente do termo com a³?',
      choices: ['−6', '3', '4'],
      correctIndex: 0,
      explanation:
          'O coeficiente é o fator numérico que multiplica a parte literal; portanto, é −6.',
    ),
    takeaways: [
      'Variável representa uma quantidade que pode assumir valores.',
      'Coeficiente multiplica a parte literal de um termo.',
      'Constantes não dependem da variável.',
      'Substituições com números negativos devem preservar parênteses.',
    ],
    closing:
        'Com a linguagem algébrica clara, as próximas técnicas deixam de parecer regras isoladas.',
  ),
  CourseLessonData(
    id: 'precalculo-00-04-potencias-raizes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Potências, raízes e expoentes',
    description: 'expoentes inteiros, racionais e restrições reais',
    duration: '≈ 15 min',
    objective:
        'usar propriedades de expoentes e interpretar raízes e expoentes racionais no conjunto dos números reais',
    symbol: 'xᵃ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Potências condensam multiplicações',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'As regras dependem da base',
            content:
                'Para a ≠ 0, valem a⁰ = 1 e a⁻ⁿ = 1/aⁿ. Em produtos de mesma base, somamos expoentes: aᵐaⁿ = aᵐ⁺ⁿ. Em quocientes, subtraímos: aᵐ/aⁿ = aᵐ⁻ⁿ. Em potência de potência, multiplicamos expoentes.',
            emphasis:
                'Essas regras não autorizam distribuir expoente sobre soma: (a + b)² geralmente não é a² + b².',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Expoente racional conecta potência e raiz',
            content:
                'Quando a expressão é real e está definida, a^(1/n) representa a raiz n-ésima de a e a^(m/n) pode ser interpretado como a raiz n-ésima de a elevada a m. Para índice par, o radicando precisa ser não negativo no conjunto dos reais.',
            emphasis:
                '√x é real apenas para x ≥ 0; já ∛x é real para qualquer x real.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Expoente negativo e racional',
            problem: 'Simplifique 16^(3/4) e escreva 2⁻³ como fração.',
            steps: [
              '16^(1/4) = 2, pois 2⁴ = 16.',
              'Então 16^(3/4) = (16^(1/4))³ = 2³ = 8.',
              'Para o expoente negativo, 2⁻³ = 1/2³ = 1/8.',
            ],
            result: '16^(3/4) = 8 e 2⁻³ = 1/8.',
            interpretation:
                'O expoente informa tanto a operação de potência quanto, em forma racional, uma operação de raiz.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A raiz principal é não negativa',
            content:
                'Embora x² = 9 tenha duas soluções, x = ±3, a expressão √9 representa especificamente a raiz principal 3.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual expressão é equivalente a x^(−2), para x ≠ 0?',
      choices: ['−x²', '1/x²', '1/(2x)'],
      correctIndex: 1,
      explanation:
          'Expoente negativo indica o inverso da potência correspondente: x^(−2) = 1/x².',
    ),
    takeaways: [
      'Produtos de mesma base somam expoentes.',
      'Expoente negativo representa inverso multiplicativo.',
      'Expoente racional relaciona potência e raiz.',
      'Raízes de índice par impõem restrições no conjunto dos reais.',
    ],
    closing:
        'Potências e raízes reaparecem em funções, limites, derivadas e modelos exponenciais.',
  ),
  CourseLessonData(
    id: 'precalculo-00-05-modulo',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Valor absoluto e distância',
    description: 'módulo, distância e inequações simples',
    duration: '≈ 15 min',
    objective:
        'interpretar valor absoluto como distância e resolver relações simples de igualdade e desigualdade envolvendo módulo',
    symbol: '|x|',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Módulo mede distância, não sinal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Distância até zero',
            content:
                '|x| representa a distância entre x e 0 na reta real. Por isso |5| = 5 e |−5| = 5. Em forma por casos, |x| = x quando x ≥ 0 e |x| = −x quando x < 0.',
            emphasis:
                'O valor absoluto nunca é negativo.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Distância entre dois números',
            content:
                'A distância entre x e a pode ser escrita como |x − a|. Assim, |x − 3| < 2 significa que x está a menos de 2 unidades do número 3.',
            emphasis:
                'Geometricamente, |x − 3| < 2 descreve o intervalo (1, 5).',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Uma inequação como distância',
            problem: 'Resolva |x − 4| ≤ 3.',
            steps: [
              'Leia como distância: x está a no máximo 3 unidades de 4.',
              'A extremidade esquerda é 4 − 3 = 1.',
              'A extremidade direita é 4 + 3 = 7.',
              'Como a distância pode ser exatamente 3, as extremidades são incluídas.',
            ],
            result: '1 ≤ x ≤ 7, ou [1, 7].',
            interpretation:
                'A solução é um intervalo centrado em 4 com raio 3.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Distâncias aparecem na definição de limite',
            content:
                'Mais adiante, expressões como |x − a| e |f(x) − L| permitirão medir quão perto x está de a e quão perto f(x) está de L. Entender módulo como distância prepara a linguagem formal de limites.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual intervalo resolve |x − 2| < 4?',
      choices: ['(−2, 6)', '[−2, 6]', '(−6, 2)'],
      correctIndex: 0,
      explanation:
          'A distância de x até 2 deve ser menor que 4. As extremidades são 2 − 4 = −2 e 2 + 4 = 6, sem inclusão.',
    ),
    takeaways: [
      'Valor absoluto representa distância até zero.',
      '|x − a| representa a distância entre x e a.',
      'Inequações com módulo podem ser interpretadas geometricamente.',
      'A linguagem de distância será essencial na definição de limite.',
    ],
    closing:
        'Quando módulo vira distância, muitas regras passam a ter significado geométrico.',
  ),
];

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
    description: 'terms, coefficients, symbols, and numerical value',
    duration: '≈ 12 min',
    objective:
        'identify the structure of algebraic expressions and correctly interpret variables, constants, coefficients, and terms',
    symbol: '3x+2',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Read an expression as language',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Each part has a role',
            content:
                'In 4x² − 3x + 7, x is the variable; 4 and −3 are coefficients; and 7 is a constant term. Terms are separated by top-level additions or subtractions.',
            emphasis:
                'An expression describes a value; an equation adds an equality that must be satisfied.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A variable represents possibility',
            content:
                'A letter represents a number that is not yet fixed or a quantity that may vary. Once a value is assigned, the expression can be evaluated numerically.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Substitution with signs',
            problem: 'Evaluate 2x² − 5x + 1 for x = −2.',
            steps: [
              'Substitute using parentheses: 2(−2)² − 5(−2) + 1.',
              'Evaluate the power: (−2)² = 4.',
              'Multiply: 2·4 = 8 and −5(−2) = +10.',
              'Add: 8 + 10 + 1 = 19.',
            ],
            result: 'The numerical value is 19.',
            interpretation:
                'Parentheses preserve the sign of a substituted negative value.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Common mistake',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'x² and 2x are different structures',
            content:
                'x² means x·x, while 2x means 2·x. Exponents and coefficients have different roles.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'In −6a³ + 4, what is the coefficient of a³?',
      choices: ['−6', '3', '4'],
      correctIndex: 0,
      explanation:
          'The coefficient is the numerical factor multiplying the literal part, so it is −6.',
    ),
    takeaways: [
      'A variable represents a quantity that may take values.',
      'A coefficient multiplies the literal part of a term.',
      'Constants do not depend on the variable.',
      'Negative substitutions should preserve parentheses.',
    ],
    closing:
        'Once algebraic language is clear, later techniques stop looking like isolated rules.',
  ),
  CourseLessonData(
    id: 'precalculo-00-04-potencias-raizes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Powers, roots, and exponents',
    description: 'integer and rational exponents and real restrictions',
    duration: '≈ 15 min',
    objective:
        'use exponent laws and interpret roots and rational exponents over the real numbers',
    symbol: 'xᵃ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Powers condense multiplication',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Rules depend on the base',
            content:
                'For a ≠ 0, a⁰ = 1 and a⁻ⁿ = 1/aⁿ. For products with the same base, add exponents: aᵐaⁿ = aᵐ⁺ⁿ. For quotients, subtract them. For a power of a power, multiply exponents.',
            emphasis:
                'These rules do not distribute an exponent over addition: (a + b)² is generally not a² + b².',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Rational exponents connect powers and roots',
            content:
                'When defined over the reals, a^(1/n) is the nth root of a, and a^(m/n) combines a root and a power. For even n, the radicand must be nonnegative.',
            emphasis:
                '√x is real only for x ≥ 0, while ∛x is real for every real x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Negative and rational exponents',
            problem: 'Simplify 16^(3/4) and write 2⁻³ as a fraction.',
            steps: [
              '16^(1/4) = 2 because 2⁴ = 16.',
              'Then 16^(3/4) = 2³ = 8.',
              'For the negative exponent, 2⁻³ = 1/2³ = 1/8.',
            ],
            result: '16^(3/4) = 8 and 2⁻³ = 1/8.',
            interpretation:
                'A rational exponent encodes both root and power operations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Common mistake',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'The principal square root is nonnegative',
            content:
                'Although x² = 9 has solutions x = ±3, the expression √9 specifically denotes the principal root 3.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which expression equals x^(−2), for x ≠ 0?',
      choices: ['−x²', '1/x²', '1/(2x)'],
      correctIndex: 1,
      explanation:
          'A negative exponent represents the reciprocal of the corresponding positive power.',
    ),
    takeaways: [
      'Products with the same base add exponents.',
      'Negative exponents represent reciprocals.',
      'Rational exponents connect powers and roots.',
      'Even-index roots impose restrictions over the reals.',
    ],
    closing:
        'Powers and roots return throughout functions, limits, derivatives, and exponential models.',
  ),
  CourseLessonData(
    id: 'precalculo-00-05-modulo',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Absolute value and distance',
    description: 'modulus, distance, and simple inequalities',
    duration: '≈ 15 min',
    objective:
        'interpret absolute value as distance and solve simple equalities and inequalities involving absolute value',
    symbol: '|x|',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Absolute value measures distance, not sign',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Distance from zero',
            content:
                '|x| is the distance between x and 0 on the real line. Thus |5| = 5 and |−5| = 5. Piecewise, |x| = x for x ≥ 0 and |x| = −x for x < 0.',
            emphasis: 'Absolute value is never negative.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Distance between two numbers',
            content:
                'The distance between x and a is |x − a|. Thus |x − 3| < 2 means x lies less than 2 units away from 3.',
            emphasis: 'Geometrically, |x − 3| < 2 describes (1, 5).',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'An inequality as distance',
            problem: 'Solve |x − 4| ≤ 3.',
            steps: [
              'Read it as distance: x is at most 3 units from 4.',
              'The left endpoint is 4 − 3 = 1.',
              'The right endpoint is 4 + 3 = 7.',
              'Because distance may equal 3, both endpoints are included.',
            ],
            result: '1 ≤ x ≤ 7, or [1, 7].',
            interpretation: 'The solution is an interval centered at 4 with radius 3.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Distances appear in the definition of limit',
            content:
                'Later, expressions such as |x − a| and |f(x) − L| measure how close x is to a and how close f(x) is to L. Absolute value as distance prepares the formal language of limits.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which interval solves |x − 2| < 4?',
      choices: ['(−2, 6)', '[−2, 6]', '(−6, 2)'],
      correctIndex: 0,
      explanation:
          'x must be less than 4 units from 2. The endpoints are −2 and 6, neither included.',
    ),
    takeaways: [
      'Absolute value represents distance from zero.',
      '|x − a| represents the distance between x and a.',
      'Absolute-value inequalities have a geometric interpretation.',
      'Distance language is essential in the formal definition of a limit.',
    ],
    closing:
        'Once absolute value becomes distance, many rules gain geometric meaning.',
  ),
];
