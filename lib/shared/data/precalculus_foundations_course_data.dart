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
    description: 'conjuntos numéricos, inclusão e intervalos',
    duration: '≈ 25 min',
    objective:
        'classificar números reais, interpretar inclusões entre conjuntos e representar desigualdades por intervalos na reta real',
    symbol: 'ℝ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Organize os números antes de calcular',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Os reais reúnem diferentes tipos de números',
            content:
                'Os naturais ℕ aparecem em contagens. Os inteiros ℤ acrescentam os negativos e o zero. Os racionais ℚ são números que podem ser escritos como fração de inteiros, com denominador diferente de zero. Irracionais, como √2 e π, não podem ser escritos dessa forma. Racionais e irracionais formam o conjunto dos reais ℝ.',
            emphasis:
                'Uma inclusão útil é ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ. Um número pode pertencer a mais de um desses conjuntos.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Intervalos traduzem desigualdades',
            content:
                'A desigualdade 2 < x ≤ 5 descreve todos os reais maiores que 2 e menores ou iguais a 5. Em notação de intervalo, escrevemos (2, 5]. Parêntese indica extremidade excluída; colchete indica extremidade incluída.',
            emphasis:
                'Com ±∞ usamos sempre parênteses, porque infinito não é um número real que possa pertencer ao intervalo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Da desigualdade para o intervalo',
            problem: 'Represente −3 ≤ x < 4 em notação de intervalo.',
            steps: [
              'A extremidade −3 está incluída porque aparece ≤.',
              'A extremidade 4 está excluída porque aparece <.',
              'Escreva os valores em ordem crescente: [−3, 4).',
            ],
            result: 'O conjunto solução é [−3, 4).',
            interpretation:
                'Na reta real, o ponto −3 é fechado e o ponto 4 é aberto; todos os pontos entre eles pertencem ao conjunto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não confunda intervalo com dois números isolados',
            content:
                'O intervalo [1, 3] contém infinitos números reais: 1, 1,2, √2, 2,5, 3 e todos os demais reais entre 1 e 3.',
            emphasis:
                'Intervalo é um conjunto contínuo de valores, não apenas suas extremidades.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Densidade e ordem na reta real',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Entre dois reais existem infinitos outros',
            content:
                'A reta real é ordenada e densa: se a < b, sempre existe outro real entre eles, por exemplo (a + b)/2. O mesmo argumento pode ser repetido indefinidamente. Isso explica por que um intervalo contém infinitos pontos, mesmo quando suas extremidades estão muito próximas.',
            emphasis:
                'A ideia de “aproximar sem necessariamente atingir” será central em limites.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Racional e irracional não significam “simples” e “complicado”',
            content:
                'Um número racional possui representação p/q com p e q inteiros e q ≠ 0. Um irracional não admite essa forma. A classificação depende da estrutura do número, não da quantidade de casas decimais que enxergamos.',
            emphasis:
                '0,333… é racional porque vale 1/3; √2 é irracional apesar de poder ser aproximado decimalmente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Operações com intervalos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Interseção de duas restrições',
            problem:
                'Determine os reais que satisfazem simultaneamente x > −1 e x ≤ 4.',
            steps: [
              'A primeira condição corresponde a (−1, +∞).',
              'A segunda corresponde a (−∞, 4].',
              '“Simultaneamente” pede a interseção dos conjuntos.',
              'A parte comum é (−1, 4].',
            ],
            result: 'A solução é (−1, 4].',
            interpretation:
                'Interseção representa valores que atendem a todas as restrições ao mesmo tempo.',
          ),
          WorkedExampleBlockData(
            title: 'União de conjuntos solução',
            problem:
                'Represente x < −2 ou x ≥ 3 em notação de intervalos.',
            steps: [
              'x < −2 corresponde a (−∞, −2).',
              'x ≥ 3 corresponde a [3, +∞).',
              'A palavra “ou” indica união.',
            ],
            result: '(−∞, −2) ∪ [3, +∞).',
            interpretation:
                'A união permite que o número pertença a qualquer um dos dois conjuntos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Distância e valor absoluto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'A distância entre a e b é |a − b|',
            content:
                'A ordem dos pontos não altera a distância, porque |a − b| = |b − a|. Assim, a distância entre −3 e 5 é |−3 − 5| = 8.',
            emphasis:
                'Essa formulação conecta reta real, intervalos, valor absoluto e, mais tarde, a definição formal de limite.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Classifique e represente',
            problem:
                'Classifique −7/4 e √5 e escreva o conjunto {x ∈ ℝ : 1 ≤ x < 6} como intervalo.',
            steps: [
              '−7/4 é razão de inteiros, portanto racional.',
              '√5 é irracional porque 5 não é quadrado perfeito.',
              'A desigualdade inclui 1 e exclui 6.',
            ],
            result: '−7/4 ∈ ℚ, √5 ∈ ℝ∖ℚ e o intervalo é [1, 6).',
            interpretation:
                'Classificação numérica e notação de intervalos são linguagens diferentes para descrever propriedades dos reais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Base acadêmica e conexão com Pré-Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências centrais desta aula',
            content:
                'A organização dos sistemas numéricos, a reta real, intervalos, desigualdades e valor absoluto segue o tratamento introdutório de OpenStax Algebra and Trigonometry e College Algebra, além de Sullivan e Blitzer em Precalculus. A conexão com distância e aproximação prepara a linguagem usada por Stewart, Thomas e Larson em limites.',
            emphasis:
                'As referências orientam sequência, profundidade e terminologia; os exemplos do app são autorais.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual intervalo representa x > −2?',
      choices: ['[−2, +∞)', '(−2, +∞)', '(−∞, −2]'],
      correctIndex: 1,
      explanation:
          'Como −2 não está incluído, usamos parêntese. Todos os valores maiores seguem até +∞: (−2, +∞).',
    ),
    takeaways: [
      'ℕ, ℤ e ℚ estão contidos em ℝ.',
      'Racionais podem ser escritos como razão de inteiros; irracionais não.',
      'Parêntese exclui uma extremidade e colchete inclui.',
      'Intervalos serão usados para domínio, limites e análise de funções.',
    ],
    closing:
        'A reta real é o espaço básico onde o Pré-Cálculo descreve valores possíveis e restrições.',
  ),
  CourseLessonData(
    id: 'precalculo-00-02-operacoes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Operações, sinais e prioridade',
    description: 'ordem das operações, parênteses e frações',
    duration: '≈ 30 min',
    objective:
        'executar operações respeitando prioridade, sinais e agrupamentos, reduzindo erros que se propagam em álgebra e cálculo',
    symbol: '()÷×',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A ordem faz parte da expressão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Agrupamentos vêm antes',
            content:
                'Resolva primeiro parênteses e outros agrupamentos, depois potências e raízes, em seguida multiplicações e divisões, e por fim adições e subtrações. Operações de mesma prioridade são feitas da esquerda para a direita.',
            emphasis:
                'A expressão 2 + 3·4 vale 14, não 20, porque a multiplicação vem antes da adição.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O sinal pode pertencer ao número ou à operação',
            content:
                'Em (−3)², o número −3 inteiro é elevado ao quadrado e o resultado é 9. Em −3², a potência atua primeiro sobre 3 e depois aplicamos o sinal negativo: −9.',
            emphasis:
                'Parênteses mudam o objeto sobre o qual a potência atua.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Uma expressão com várias prioridades',
            problem: 'Calcule 18 ÷ 3·2 − (5 − 8).',
            steps: [
              'Resolva o parêntese: 5 − 8 = −3.',
              'Faça divisão e multiplicação da esquerda para a direita: 18 ÷ 3 = 6 e 6·2 = 12.',
              'Subtraia o número negativo: 12 − (−3) = 12 + 3 = 15.',
            ],
            result: 'O valor da expressão é 15.',
            interpretation:
                'Cada etapa preserva a expressão original e evita alterar sua estrutura por uma regra inexistente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não existe prioridade da multiplicação sobre a divisão',
            content:
                'Multiplicação e divisão têm a mesma prioridade. Quando aparecem no mesmo nível, calculamos da esquerda para a direita.',
            emphasis:
                'O mesmo vale para adição e subtração.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Estrutura antes do cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Uma expressão é uma árvore de operações',
            content:
                'Em 3 + 2(5 − 1)², a operação principal é a adição. Dentro do segundo termo existe uma multiplicação; dentro dela, uma potência; e dentro da potência, um agrupamento. Ler essa estrutura evita aplicar regras fora de ordem.',
            emphasis:
                'A prioridade não é uma lista arbitrária: ela informa como a expressão foi construída.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Frações funcionam como agrupadores',
            content:
                'Na expressão (a+b)/(c−d), todo o numerador e todo o denominador permanecem agrupados. Ignorar essa estrutura altera completamente o valor da expressão.',
            emphasis:
                'Uma barra de fração funciona como parênteses no numerador e no denominador.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Sinais e distributividade',
        blocks: [
          WorkedExampleBlockData(
            title: 'Sinal negativo diante de parênteses',
            problem: 'Simplifique 7 − (3x − 5).',
            steps: [
              'Interprete a subtração como adição do oposto.',
              'Troque o sinal de cada termo dentro do agrupamento: −(3x − 5)=−3x+5.',
              'Some com 7.',
            ],
            result: '7 − (3x − 5)=12 − 3x.',
            interpretation:
                'O sinal negativo afeta todo o agrupamento, não apenas o primeiro termo.',
          ),
          WorkedExampleBlockData(
            title: 'Distribuição com frações',
            problem: 'Calcule 3/4 · (8 − 4/3).',
            steps: [
              'Resolva o agrupamento usando denominador comum: 8 − 4/3 = 20/3.',
              'Multiplique: (3/4)(20/3).',
              'Simplifique fatores comuns.',
            ],
            result: 'O valor é 5.',
            interpretation:
                'Frações não mudam as regras de prioridade; apenas exigem controle algébrico adicional.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Erros que se propagam',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Potência não se distribui sobre soma',
            content:
                '(a+b)² = a² + 2ab + b², e não a²+b². O termo 2ab surge porque estamos multiplicando (a+b)(a+b).',
            emphasis:
                'Esse erro reaparece em fatoração, funções, limites e derivadas; corrigir agora evita uma cadeia de erros depois.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Divisão por zero nunca é permitida',
            content:
                'Uma expressão que produz denominador zero está indefinida naquele ponto. Antes de simplificar uma fração algébrica, é preciso preservar as restrições do denominador original.',
            emphasis:
                'Cancelar fatores não “recupera” pontos excluídos do domínio.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Múltiplos níveis de prioridade',
            problem: 'Calcule 2[3² − 4(1 − 5)] ÷ 5.',
            steps: [
              'Agrupamento interno: 1 − 5 = −4.',
              'Potência: 3² = 9.',
              'Produto: 4(−4)=−16.',
              'Dentro dos colchetes: 9 − (−16)=25.',
              'Então 2·25 ÷ 5 = 10.',
            ],
            result: 'O valor é 10.',
            interpretation:
                'Escrever uma etapa por linha reduz erros de sinal e torna a solução auditável.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Base acadêmica e conexão com Pré-Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências centrais desta aula',
            content:
                'A leitura estrutural de expressões, ordem de operações, propriedades dos reais, distributividade e restrições de denominadores segue OpenStax Algebra and Trigonometry e College Algebra, Sullivan e Blitzer. Stewart, Thomas e Larson retomam essas mesmas habilidades como pré-requisitos operacionais para limites e derivadas.',
            emphasis:
                'O objetivo não é memorizar PEMDAS, mas compreender a estrutura algébrica que sustenta o cálculo posterior.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o valor de −2² + (−2)²?',
      choices: ['−8', '0', '8'],
      correctIndex: 1,
      explanation:
          '−2² = −4, enquanto (−2)² = 4. Logo, −4 + 4 = 0.',
    ),
    takeaways: [
      'Agrupamentos antecedem potências, produtos e somas.',
      'Operações de mesma prioridade seguem da esquerda para a direita.',
      'Parênteses determinam se um sinal participa de uma potência.',
      'Erros de prioridade se propagam para equações, funções e limites.',
    ],
    closing:
        'Ler a estrutura antes de calcular é mais importante do que calcular rápido.',
  ),
  CourseLessonData(
    id: 'precalculo-00-03-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Pré-Cálculo — Fundamentos',
    eyebrow: 'Unidade 0',
    title: 'Variáveis, constantes e expressões',
    description: 'termos, coeficientes, símbolos e valor numérico',
    duration: '≈ 25 min',
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
      LessonSectionData(
        number: '4',
        title: 'Expressões, equações e identidades',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Três objetos diferentes',
            content:
                'Uma expressão, como 2x+3, representa um valor. Uma equação, como 2x+3=7, afirma uma igualdade que pode ser verdadeira apenas para certos valores. Uma identidade, como (a+b)²=a²+2ab+b², é verdadeira para todos os valores em que ambos os lados estão definidos.',
            emphasis:
                'Confundir esses objetos leva a manipulações sem justificativa.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Termo, fator e coeficiente não são sinônimos',
            content:
                'Em 6x²y, o número 6 é coeficiente e 6, x² e y são fatores do termo. Em 6x²y − 4x + 9, há três termos no nível principal.',
            emphasis:
                'A estrutura depende do nível da expressão: fatores formam termos; termos formam somas e diferenças.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Domínio já aparece nas expressões',
        blocks: [
          WorkedExampleBlockData(
            title: 'Descubra onde a expressão faz sentido',
            problem: 'Determine os valores reais permitidos em 1/(x−4).',
            steps: [
              'O denominador não pode ser zero.',
              'Imponha x−4 ≠ 0.',
              'Logo, x ≠ 4.',
            ],
            result: 'O domínio é ℝ∖{4}.',
            interpretation:
                'Mesmo antes de estudar funções formalmente, uma expressão pode impor restrições sobre os valores da variável.',
          ),
          WorkedExampleBlockData(
            title: 'Substituição em expressão racional',
            problem: 'Calcule (x²−1)/(x+1) em x=2.',
            steps: [
              'Verifique se x+1 é diferente de zero em x=2.',
              'Substitua: (4−1)/(3).',
              'Simplifique.',
            ],
            result: 'O valor é 1.',
            interpretation:
                'Substituir corretamente exige primeiro verificar se o valor pertence ao domínio da expressão.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Modelagem com unidades',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Símbolos precisam de significado e unidade',
            content:
                'Se d representa distância em quilômetros e t tempo em horas, então d/t possui unidade km/h. Uma expressão algébrica bem formada também deve ser coerente dimensionalmente quando representa grandezas físicas.',
            emphasis:
                'Unidades ajudam a detectar erros: não faz sentido somar uma distância a uma velocidade.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Leia uma expressão completa',
            problem:
                'Na expressão C(n)=25+3,5n, interprete variável, constante, coeficiente e significado do modelo.',
            steps: [
              'n é a variável e representa uma quantidade contável.',
              '25 é o termo constante: custo fixo.',
              '3,5 é o coeficiente de n: custo adicional por unidade.',
              'C(n) representa o custo total em função de n.',
            ],
            result:
                'O modelo combina uma parte fixa com uma parte proporcional à quantidade.',
            interpretation:
                'A linguagem algébrica permite traduzir estrutura matemática em significado real.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Base acadêmica e conexão com Pré-Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências centrais desta aula',
            content:
                'A terminologia de variáveis, expressões, equações, identidades, avaliação e domínio segue OpenStax College Algebra e Algebra and Trigonometry, Sullivan e Blitzer. A atenção a unidades e modelagem prepara o tratamento de funções e taxas em Stewart, Thomas e Larson.',
            emphasis:
                'A leitura simbólica precisa anteceder técnicas mais avançadas de manipulação.',
            tone: LearningCardTone.information,
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
    duration: '≈ 25 min',
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
      LessonSectionData(
        number: '4',
        title: 'Leis dos expoentes com condições',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'As regras têm hipóteses',
            content:
                'Para bases não nulas, aᵐ/aⁿ=aᵐ⁻ⁿ. Já a⁰=1 exige a≠0. Quando aparecem expoentes racionais, o conjunto dos reais impõe restrições adicionais dependendo do índice da raiz.',
            emphasis:
                'Uma regra algébrica sem suas condições pode produzir expressões inválidas.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '√(x²) é |x|, não x em geral',
            content:
                'A raiz quadrada principal é não negativa. Como x² perde a informação do sinal de x, ao extrair a raiz obtemos √(x²)=|x|.',
            emphasis:
                'Se x<0, então |x|=−x; por isso escrever simplesmente √(x²)=x está errado sem a hipótese x≥0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Radicais e racionalização',
        blocks: [
          WorkedExampleBlockData(
            title: 'Simplifique um radical',
            problem: 'Simplifique √72.',
            steps: [
              'Fatore 72=36·2.',
              'Use √(36·2)=√36·√2.',
              'Como √36=6, obtenha 6√2.',
            ],
            result: '√72 = 6√2.',
            interpretation:
                'Procurar fatores quadrados perfeitos reduz o radical sem alterar seu valor.',
          ),
          WorkedExampleBlockData(
            title: 'Racionalize um denominador simples',
            problem: 'Escreva 3/√5 com denominador racional.',
            steps: [
              'Multiplique numerador e denominador por √5.',
              'No denominador, √5·√5=5.',
            ],
            result: '3/√5 = 3√5/5.',
            interpretation:
                'A racionalização produz uma forma equivalente; não muda o número representado.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Crescimento e escalas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Expoentes mudam rapidamente a ordem de grandeza',
            content:
                'Em crescimento exponencial, aumentar o expoente em 1 multiplica o valor pela base. Essa característica distingue funções exponenciais de polinômios e será fundamental em modelos de população, juros e decaimento.',
            emphasis:
                'As propriedades estudadas aqui reaparecem diretamente em funções exponenciais e logarítmicas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Combine várias leis',
            problem: 'Simplifique (x³·x⁻¹)²/x² para x≠0.',
            steps: [
              'No produto interno, x³·x⁻¹=x².',
              'Eleve ao quadrado: (x²)²=x⁴.',
              'Divida por x²: x⁴/x²=x².',
            ],
            result: 'A expressão simplifica para x², com x≠0.',
            interpretation:
                'A restrição x≠0 vem da expressão original e deve ser mantida mesmo após simplificação.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Base acadêmica e conexão com Pré-Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências centrais desta aula',
            content:
                'As leis de expoentes, radicais, expoentes racionais e racionalização seguem OpenStax Algebra and Trigonometry e College Algebra, Sullivan e Blitzer. Stewart, Thomas e Larson utilizam essas técnicas repetidamente em limites, derivadas de potências e funções exponenciais.',
            emphasis:
                'A ênfase é preservar domínio e hipóteses enquanto simplificamos.',
            tone: LearningCardTone.information,
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
    duration: '≈ 25 min',
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
      LessonSectionData(
        number: '4',
        title: 'Equações com valor absoluto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '|u| = a descreve duas possibilidades',
            content:
                'Se a>0, então |u|=a equivale a u=a ou u=−a. Se a=0, a única possibilidade é u=0. Se a<0, não há solução real, pois valor absoluto nunca é negativo.',
            emphasis:
                'Essa regra vem diretamente da interpretação de distância.',
          ),
          WorkedExampleBlockData(
            title: 'Resolva uma equação modular',
            problem: 'Resolva |2x−1|=5.',
            steps: [
              'Considere 2x−1=5 ou 2x−1=−5.',
              'No primeiro caso, 2x=6 e x=3.',
              'No segundo, 2x=−4 e x=−2.',
            ],
            result: 'As soluções são x=3 e x=−2.',
            interpretation:
                'Ambos os valores deixam 2x−1 a exatamente 5 unidades de zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Inequações e intervalos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: '|x−a| < r descreve uma vizinhança',
            content:
                'Para r>0, |x−a|<r equivale a a−r<x<a+r. Já |x−a|>r descreve pontos que estão fora dessa vizinhança: x<a−r ou x>a+r.',
            emphasis:
                'A linguagem de distância transforma inequações modulares em intervalos na reta real.',
          ),
          WorkedExampleBlockData(
            title: 'Região externa',
            problem: 'Resolva |x+2| ≥ 4.',
            steps: [
              'Interprete como distância de x até −2 maior ou igual a 4.',
              'Os pontos limite são −2−4=−6 e −2+4=2.',
              'A solução fica fora do intervalo central.',
            ],
            result: 'x≤−6 ou x≥2.',
            interpretation:
                'O símbolo ≥ inclui os pontos cuja distância é exatamente 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Função módulo e gráfico',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'y=|x| é uma função definida por partes',
            content:
                'Para x≥0, |x|=x; para x<0, |x|=−x. O gráfico é formado por duas semirretas que se encontram na origem, produzindo um vértice.',
            emphasis:
                'Esse exemplo mostra que continuidade não implica necessariamente derivabilidade no ponto de encontro.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Distância entre duas variáveis',
            problem: 'Interprete |x−7|≤1,5.',
            steps: [
              'A expressão mede a distância de x até 7.',
              'A distância máxima permitida é 1,5.',
              'Subtraia e some 1,5 ao centro 7.',
            ],
            result: '5,5≤x≤8,5.',
            interpretation:
                'Essa forma aparece em tolerâncias de medição, margens de erro e aproximações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Base acadêmica e conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Referências centrais desta aula',
            content:
                'O tratamento de valor absoluto como distância, equações e inequações modulares segue OpenStax Algebra and Trigonometry e College Algebra, Sullivan e Blitzer. Stewart, Thomas e Larson usam |x−a| e |f(x)−L| para formalizar proximidade na definição de limite.',
            emphasis:
                'Dominar módulo como distância prepara diretamente a linguagem ε−δ do Cálculo.',
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
    description: 'number sets, inclusion, and intervals',
    duration: '≈ 25 min',
    objective:
        'classify real numbers, interpret set inclusions, and represent inequalities as intervals on the real line',
    symbol: 'ℝ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Organize numbers before calculating',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'The real numbers contain different number systems',
            content:
                'Natural numbers ℕ arise in counting. Integers ℤ add zero and negative numbers. Rational numbers ℚ can be written as a ratio of integers with nonzero denominator. Irrational numbers, such as √2 and π, cannot. Rational and irrational numbers together form the real numbers ℝ.',
            emphasis:
                'A useful inclusion is ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ. One number may belong to several of these sets.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Intervals translate inequalities',
            content:
                'The inequality 2 < x ≤ 5 describes every real number greater than 2 and less than or equal to 5. Interval notation writes this as (2, 5]. Parentheses exclude an endpoint; brackets include it.',
            emphasis:
                'We always use parentheses with ±∞ because infinity is not a real endpoint.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'From inequality to interval',
            problem: 'Write −3 ≤ x < 4 in interval notation.',
            steps: [
              'The endpoint −3 is included because the inequality uses ≤.',
              'The endpoint 4 is excluded because the inequality uses <.',
              'Write the endpoints in increasing order: [−3, 4).',
            ],
            result: 'The solution set is [−3, 4).',
            interpretation:
                'On the real line, −3 is closed, 4 is open, and every point between them belongs to the set.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Common mistake',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'An interval is not just two isolated numbers',
            content:
                'The interval [1, 3] contains infinitely many real numbers, including 1, 1.2, √2, 2.5, 3, and every other real number between 1 and 3.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Density and order on the real line',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Between two real numbers lie infinitely many others',
            content:
                'The real line is ordered and dense: if a < b, there is always another real number between them, such as (a + b)/2. Repeating the argument gives infinitely many intermediate values.',
            emphasis:
                'The idea of approaching a value without necessarily reaching it will become central in limits.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Rational and irrational describe structure',
            content:
                'A rational number can be written as p/q with integers p and q and q ≠ 0. An irrational number cannot. The classification depends on structure, not on how many decimal digits are displayed.',
            emphasis:
                '0.333… is rational because it equals 1/3; √2 is irrational even though it has decimal approximations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Operations with intervals',
        blocks: [
          WorkedExampleBlockData(
            title: 'Intersection of two restrictions',
            problem: 'Find all real numbers satisfying x > −1 and x ≤ 4.',
            steps: [
              'x > −1 corresponds to (−1, +∞).',
              'x ≤ 4 corresponds to (−∞, 4].',
              '“And” asks for the intersection.',
              'The common part is (−1, 4].',
            ],
            result: 'The solution is (−1, 4].',
            interpretation:
                'Intersection keeps values satisfying every restriction at once.',
          ),
          WorkedExampleBlockData(
            title: 'Union of solution sets',
            problem: 'Write x < −2 or x ≥ 3 using intervals.',
            steps: [
              'x < −2 gives (−∞, −2).',
              'x ≥ 3 gives [3, +∞).',
              '“Or” indicates union.',
            ],
            result: '(−∞, −2) ∪ [3, +∞).',
            interpretation:
                'A union allows membership in either set.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Distance and absolute value',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'The distance between a and b is |a − b|',
            content:
                'Order does not change distance because |a − b| = |b − a|. For example, the distance between −3 and 5 is 8.',
            emphasis:
                'This connects the real line, intervals, absolute value, and later the formal definition of a limit.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Classify and represent',
            problem:
                'Classify −7/4 and √5, and write {x ∈ ℝ : 1 ≤ x < 6} as an interval.',
            steps: [
              '−7/4 is a ratio of integers, so it is rational.',
              '√5 is irrational because 5 is not a perfect square.',
              'The inequality includes 1 and excludes 6.',
            ],
            result: '−7/4 ∈ ℚ, √5 ∈ ℝ∖ℚ, and the interval is [1, 6).',
            interpretation:
                'Number classification and interval notation describe different properties of real numbers.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Academic basis and Precalculus connection',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Core references for this lesson',
            content:
                'The treatment of number systems, the real line, intervals, inequalities, and absolute value follows OpenStax Algebra and Trigonometry and College Algebra, together with Sullivan and Blitzer Precalculus. The connection to distance and approximation prepares the language used by Stewart, Thomas, and Larson for limits.',
            emphasis:
                'The references guide sequence, depth, and terminology; the app examples are original.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which interval represents x > −2?',
      choices: ['[−2, +∞)', '(−2, +∞)', '(−∞, −2]'],
      correctIndex: 1,
      explanation:
          'Because −2 is excluded, use a parenthesis. All greater values continue toward +∞: (−2, +∞).',
    ),
    takeaways: [
      'ℕ, ℤ, and ℚ are contained in ℝ.',
      'Rational numbers are ratios of integers; irrational numbers are not.',
      'Parentheses exclude endpoints and brackets include them.',
      'Intervals will describe domains, limits, and function behavior.',
    ],
    closing:
        'The real line is the basic space where Precalculus describes possible values and restrictions.',
  ),
  CourseLessonData(
    id: 'precalculo-00-02-operacoes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Operations, signs, and precedence',
    description: 'order of operations, grouping, and fractions',
    duration: '≈ 30 min',
    objective:
        'perform operations while respecting precedence, signs, and grouping so errors do not propagate into algebra and calculus',
    symbol: '()÷×',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Order is part of the expression',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Grouping comes first',
            content:
                'Evaluate grouping symbols first, then powers and roots, then multiplication and division, and finally addition and subtraction. Operations with the same precedence are handled from left to right.',
            emphasis:
                'The expression 2 + 3·4 equals 14, not 20, because multiplication precedes addition.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A sign may belong to the number or the operation',
            content:
                'In (−3)², the entire number −3 is squared, giving 9. In −3², the power applies to 3 first and the negative sign is applied afterward, giving −9.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'See it in action',
        blocks: [
          WorkedExampleBlockData(
            title: 'Several precedence levels',
            problem: 'Evaluate 18 ÷ 3·2 − (5 − 8).',
            steps: [
              'Evaluate the parentheses: 5 − 8 = −3.',
              'Perform division and multiplication left to right: 18 ÷ 3 = 6, then 6·2 = 12.',
              'Subtract the negative number: 12 − (−3) = 15.',
            ],
            result: 'The expression equals 15.',
            interpretation:
                'Each step preserves the original structure instead of inventing a new precedence rule.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Common mistake',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplication does not outrank division',
            content:
                'Multiplication and division share the same precedence and are evaluated from left to right. The same is true for addition and subtraction.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Structure before computation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'An expression is a tree of operations',
            content:
                'In 3 + 2(5 − 1)², the top-level operation is addition. Inside the second term sits multiplication, then a power, then a grouped difference. Reading this structure prevents rules from being applied at the wrong level.',
            emphasis:
                'Precedence is not an arbitrary list; it tells us how the expression is built.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Fractions act as grouping symbols',
            content:
                'In (a+b)/(c−d), the entire numerator and denominator remain grouped. Ignoring that structure changes the expression completely.',
            emphasis:
                'A fraction bar groups its numerator and denominator just as parentheses do.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Signs and distributivity',
        blocks: [
          WorkedExampleBlockData(
            title: 'A negative sign before parentheses',
            problem: 'Simplify 7 − (3x − 5).',
            steps: [
              'Interpret subtraction as adding the opposite.',
              'Change the sign of each term in the group.',
              'Combine constants.',
            ],
            result: '7 − (3x − 5)=12 − 3x.',
            interpretation:
                'The negative sign affects the whole group, not just its first term.',
          ),
          WorkedExampleBlockData(
            title: 'Distribution with fractions',
            problem: 'Evaluate 3/4 · (8 − 4/3).',
            steps: [
              'Use a common denominator inside the grouping: 8 − 4/3 = 20/3.',
              'Multiply (3/4)(20/3).',
              'Cancel common factors.',
            ],
            result: 'The value is 5.',
            interpretation:
                'Fractions do not change precedence rules; they only require additional algebraic control.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Errors that propagate',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A power does not distribute over addition',
            content:
                '(a+b)² = a² + 2ab + b², not a²+b². The middle term appears because the expression means (a+b)(a+b).',
            emphasis:
                'This mistake reappears in factoring, functions, limits, and derivatives.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Division by zero is never allowed',
            content:
                'An expression with zero denominator is undefined at that input. Simplifying a rational expression never restores an input excluded by the original denominator.',
            emphasis:
                'Domain restrictions must survive simplification.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Several precedence levels',
            problem: 'Evaluate 2[3² − 4(1 − 5)] ÷ 5.',
            steps: [
              'Inside parentheses: 1 − 5 = −4.',
              'Power: 3² = 9.',
              'Product: 4(−4)=−16.',
              'Inside brackets: 9 − (−16)=25.',
              'Then 2·25 ÷ 5 = 10.',
            ],
            result: 'The value is 10.',
            interpretation:
                'Writing one step per line reduces sign errors and makes the solution auditable.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Academic basis and Precalculus connection',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Core references for this lesson',
            content:
                'Structural reading of expressions, order of operations, real-number properties, distributivity, and denominator restrictions follows OpenStax Algebra and Trigonometry and College Algebra, Sullivan, and Blitzer. Stewart, Thomas, and Larson use the same skills as operational prerequisites for limits and derivatives.',
            emphasis:
                'The goal is not to memorize a mnemonic but to understand the algebraic structure supporting later calculus.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is −2² + (−2)²?',
      choices: ['−8', '0', '8'],
      correctIndex: 1,
      explanation: '−2² = −4, while (−2)² = 4. Therefore the sum is 0.',
    ),
    takeaways: [
      'Grouping precedes powers, products, and sums.',
      'Equal-precedence operations are evaluated left to right.',
      'Parentheses determine whether a sign is part of a power.',
      'Precedence errors propagate into equations, functions, and limits.',
    ],
    closing:
        'Reading structure before calculating is more valuable than calculating quickly.',
  ),
  CourseLessonData(
    id: 'precalculo-00-03-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Precalculus — Foundations',
    eyebrow: 'Unit 0',
    title: 'Variables, constants, and expressions',
    description: 'terms, coefficients, symbols, and numerical value',
    duration: '≈ 25 min',
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
      LessonSectionData(
        number: '4',
        title: 'Expressions, equations, and identities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Three different mathematical objects',
            content:
                'An expression such as 2x+3 represents a value. An equation such as 2x+3=7 asserts an equality that may hold only for certain inputs. An identity such as (a+b)²=a²+2ab+b² holds for every input where both sides are defined.',
            emphasis:
                'Confusing these objects leads to unjustified algebraic manipulation.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Term, factor, and coefficient are not synonyms',
            content:
                'In 6x²y, 6 is the coefficient while 6, x², and y are factors. In 6x²y − 4x + 9, there are three top-level terms.',
            emphasis:
                'Structure depends on level: factors build terms, and terms build sums and differences.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Domain already appears in expressions',
        blocks: [
          WorkedExampleBlockData(
            title: 'Find where an expression makes sense',
            problem: 'Determine the allowed real inputs of 1/(x−4).',
            steps: [
              'The denominator cannot be zero.',
              'Require x−4 ≠ 0.',
              'Therefore x ≠ 4.',
            ],
            result: 'The domain is ℝ∖{4}.',
            interpretation:
                'Even before formal function study, an expression can restrict the variable.',
          ),
          WorkedExampleBlockData(
            title: 'Substitution in a rational expression',
            problem: 'Evaluate (x²−1)/(x+1) at x=2.',
            steps: [
              'Check that x+1 is nonzero at x=2.',
              'Substitute: (4−1)/3.',
              'Simplify.',
            ],
            result: 'The value is 1.',
            interpretation:
                'Correct substitution begins by checking whether the input belongs to the domain.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Modeling with units',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Symbols need meaning and units',
            content:
                'If d is distance in kilometers and t is time in hours, d/t has unit km/h. An algebraic model representing physical quantities should also be dimensionally coherent.',
            emphasis:
                'Units can expose mistakes: adding a distance to a speed is not meaningful.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Read a complete model',
            problem:
                'In C(n)=25+3.5n, interpret the variable, constant, coefficient, and model.',
            steps: [
              'n is the variable and represents a count.',
              '25 is the constant term: fixed cost.',
              '3.5 is the coefficient: added cost per unit.',
              'C(n) is total cost as a function of n.',
            ],
            result:
                'The model combines a fixed part with a part proportional to quantity.',
            interpretation:
                'Algebraic language translates mathematical structure into real meaning.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Academic basis and Precalculus connection',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Core references for this lesson',
            content:
                'Terminology for variables, expressions, equations, identities, evaluation, and domain follows OpenStax College Algebra and Algebra and Trigonometry, Sullivan, and Blitzer. Attention to units and modeling prepares the treatment of functions and rates in Stewart, Thomas, and Larson.',
            emphasis:
                'Accurate symbolic reading must come before more advanced manipulation.',
            tone: LearningCardTone.information,
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
    duration: '≈ 25 min',
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
      LessonSectionData(
        number: '4',
        title: 'Exponent laws with conditions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Rules have hypotheses',
            content:
                'For nonzero bases, aᵐ/aⁿ=aᵐ⁻ⁿ, and a⁰=1 requires a≠0. Rational exponents add further real-domain restrictions depending on the index of the root.',
            emphasis:
                'An algebraic rule without its conditions can produce invalid expressions.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '√(x²) is |x|, not always x',
            content:
                'The principal square root is nonnegative. Since squaring loses the sign of x, taking the principal square root gives √(x²)=|x|.',
            emphasis:
                'If x<0, then |x|=−x, so √(x²)=x is wrong without the hypothesis x≥0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Radicals and rationalization',
        blocks: [
          WorkedExampleBlockData(
            title: 'Simplify a radical',
            problem: 'Simplify √72.',
            steps: [
              'Factor 72=36·2.',
              'Use √(36·2)=√36·√2.',
              'Since √36=6, obtain 6√2.',
            ],
            result: '√72 = 6√2.',
            interpretation:
                'Perfect-square factors reduce a radical without changing its value.',
          ),
          WorkedExampleBlockData(
            title: 'Rationalize a simple denominator',
            problem: 'Write 3/√5 with a rational denominator.',
            steps: [
              'Multiply numerator and denominator by √5.',
              'The denominator becomes 5.',
            ],
            result: '3/√5 = 3√5/5.',
            interpretation:
                'Rationalization gives an equivalent form of the same number.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Growth and scales',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Exponents change orders of magnitude quickly',
            content:
                'In exponential growth, increasing the exponent by 1 multiplies the value by the base. This distinguishes exponential functions from polynomials and underlies population, interest, and decay models.',
            emphasis:
                'These properties return directly in exponential and logarithmic functions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Combine several laws',
            problem: 'Simplify (x³·x⁻¹)²/x² for x≠0.',
            steps: [
              'Inside the product, x³·x⁻¹=x².',
              'Square it: (x²)²=x⁴.',
              'Divide by x² to obtain x².',
            ],
            result: 'The expression simplifies to x², with x≠0.',
            interpretation:
                'The original restriction x≠0 must remain after simplification.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Academic basis and Precalculus connection',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Core references for this lesson',
            content:
                'Exponent laws, radicals, rational exponents, and rationalization follow OpenStax Algebra and Trigonometry and College Algebra, Sullivan, and Blitzer. Stewart, Thomas, and Larson repeatedly use these techniques in limits, derivatives of powers, and exponential functions.',
            emphasis:
                'The emphasis is on preserving domain and hypotheses while simplifying.',
            tone: LearningCardTone.information,
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
    duration: '≈ 25 min',
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
      LessonSectionData(
        number: '4',
        title: 'Absolute-value equations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '|u| = a creates two possibilities',
            content:
                'If a>0, |u|=a means u=a or u=−a. If a=0, only u=0 works. If a<0, there is no real solution because absolute value is never negative.',
            emphasis:
                'The rule follows directly from the distance interpretation.',
          ),
          WorkedExampleBlockData(
            title: 'Solve an absolute-value equation',
            problem: 'Solve |2x−1|=5.',
            steps: [
              'Use 2x−1=5 or 2x−1=−5.',
              'The first gives x=3.',
              'The second gives x=−2.',
            ],
            result: 'The solutions are x=3 and x=−2.',
            interpretation:
                'Both values place 2x−1 exactly 5 units from zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Inequalities and intervals',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: '|x−a| < r describes a neighborhood',
            content:
                'For r>0, |x−a|<r is equivalent to a−r<x<a+r. By contrast, |x−a|>r describes points outside that neighborhood.',
            emphasis:
                'Distance language turns absolute-value inequalities into intervals on the real line.',
          ),
          WorkedExampleBlockData(
            title: 'An exterior region',
            problem: 'Solve |x+2| ≥ 4.',
            steps: [
              'Interpret distance from x to −2 as at least 4.',
              'The boundary points are −6 and 2.',
              'Keep the points outside the central interval.',
            ],
            result: 'x≤−6 or x≥2.',
            interpretation:
                'The symbol ≥ includes points whose distance is exactly 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'The absolute-value function and its graph',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'y=|x| is a piecewise-defined function',
            content:
                'For x≥0, |x|=x; for x<0, |x|=−x. The graph consists of two rays meeting at the origin and forming a vertex.',
            emphasis:
                'This example shows that continuity does not necessarily imply differentiability at the joining point.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Distance around a target value',
            problem: 'Interpret |x−7|≤1.5.',
            steps: [
              'The expression measures distance from x to 7.',
              'The maximum allowed distance is 1.5.',
              'Subtract and add 1.5 to the center 7.',
            ],
            result: '5.5≤x≤8.5.',
            interpretation:
                'This form appears in measurement tolerances, error margins, and approximations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Academic basis and Calculus connection',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Core references for this lesson',
            content:
                'Absolute value as distance, equations, and inequalities follow OpenStax Algebra and Trigonometry and College Algebra, Sullivan, and Blitzer. Stewart, Thomas, and Larson use |x−a| and |f(x)−L| to formalize closeness in the definition of a limit.',
            emphasis:
                'Mastering absolute value as distance directly prepares the epsilon-delta language of Calculus.',
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