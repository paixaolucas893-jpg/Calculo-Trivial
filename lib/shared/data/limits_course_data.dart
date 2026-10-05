import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> limitsCourseLessons = [
  CourseLessonData(
    id: 'limites-01-intuicao',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 1',
    eyebrow: 'Aula 1 de 8 • Ideia central',
    title: 'Aproximar antes de calcular',
    description:
        'Construa a intuição de limite e aprenda a ler cada parte da notação.',
    duration: '≈ 38 min',
    objective:
        'explicar com suas palavras o que um limite descreve',
    symbol: 'lim',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Observe o comportamento',
        subtitle: 'O ponto de interesse orienta a aproximação.',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'A estrada e a altitude',
            content:
                'Imagine que x marca a posição de um carro e f(x) informa sua altitude. Quando o carro se aproxima do quilômetro 2, observamos para qual altitude os valores de f(x) caminham. Essa previsão é o limite.',
            emphasis:
                'O carro não precisa estacionar no quilômetro 2: o limite estuda o comportamento nas proximidades.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Por que engenheiros usam limites?',
            content:
                'Sensores registram medidas em instantes separados, mas frequentemente queremos estimar um comportamento instantâneo. Limites conectam aproximações sucessivas ao valor ideal usado em velocidade, deformação, fluxo e controle.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Leia a notação como uma frase',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'lim x→a f(x) = L',
            content:
                'Lemos: “o limite de f(x), quando x tende a a, é L”. A expressão x→a informa de onde nos aproximamos; f(x) é a quantidade observada; L é o valor previsto para as saídas.',
            emphasis:
                'x tende a a não significa necessariamente x = a.',
          ),
          WorkedExampleBlockData(
            title: 'Uma primeira aproximação',
            problem: 'f(x) = 2x + 1, quando x→3',
            steps: [
              'Use valores próximos de 3: 2,9; 2,99; 3,01; 3,1.',
              'Calcule as saídas: 6,8; 6,98; 7,02; 7,2.',
              'Perceba que, quanto mais x se aproxima de 3, mais f(x) se aproxima de 7.',
            ],
            result: 'Conclusão: lim x→3 (2x + 1) = 7.',
            interpretation:
                'A tabela numérica sustenta a previsão de que a saída tende a 7.',
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Limite e valor da função não são a mesma coisa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O comportamento ao redor pode sobreviver a um furo',
            content:
                'Uma função pode não estar definida em x=a e ainda assim possuir limite quando x→a. Também pode acontecer de f(a) existir, mas ser diferente do valor para o qual a função se aproxima.',
            emphasis:
                'Limite descreve vizinhança; f(a) descreve o ponto.',
          ),
          WorkedExampleBlockData(
            title: 'Um furo removível',
            problem: 'Considere f(x)=(x²−1)/(x−1), para x≠1. O que ocorre quando x→1?',
            steps: [
              'Para x≠1, fatore x²−1=(x−1)(x+1).',
              'A expressão coincide com x+1 em todos os pontos próximos de 1, exceto no próprio 1.',
              'Valores próximos de 1 produzem saídas próximas de 2.',
            ],
            result: 'lim x→1 f(x)=2, mesmo sem usar f(1).',
            interpretation:
                'Esse exemplo antecipa a ideia de descontinuidade removível.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Três representações, uma mesma ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.table,
            title: 'Tabela, gráfico e expressão',
            content:
                'Uma tabela sugere tendências numéricas; o gráfico mostra o comportamento geométrico; a expressão algébrica permite justificar e generalizar. Em bons problemas de Cálculo, as três representações se complementam.',
            emphasis:
                'Não confunda evidência numérica com demonstração algébrica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Quando a aproximação falha',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Salto, explosão ou oscilação',
            content:
                'Um limite finito pode falhar quando os lados se aproximam de valores diferentes, quando a função cresce sem limite ou quando oscila sem se estabilizar. Essas situações serão tratadas separadamente nas próximas aulas.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Precisão da aproximação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Quanto mais perto na entrada, mais perto na saída',
            content:
                'A formulação rigorosa de limite torna precisa a ideia de controlar a distância entre f(x) e L escolhendo x suficientemente próximo de a. Neste nível, o foco é compreender essa relação antes de estudar a definição ε–δ formal.',
            emphasis:
                'A intuição correta prepara o terreno para a definição rigorosa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Leitura conceitual',
        blocks: [
          WorkedExampleBlockData(
            title: 'Interprete antes de calcular',
            problem: 'Se lim x→4 g(x)=10, o que isso realmente informa?',
            steps: [
              'Escolha entradas cada vez mais próximas de 4, sem exigir x=4.',
              'Observe as saídas correspondentes.',
              'Elas podem ser tornadas tão próximas de 10 quanto desejado, desde que a aproximação seja suficientemente boa.',
            ],
            result: 'O limite descreve tendência local, não necessariamente o valor g(4).',
            interpretation:
                'Essa leitura evita um dos erros conceituais mais comuns em Cálculo I.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Exemplo cumulativo: tabela, gráfico e expressão',
        blocks: [
          WorkedExampleBlockData(
            title: 'Aproxime sem substituir diretamente',
            problem: 'Estime lim x→2 (x²−4)/(x−2) usando valores próximos de 2.',
            steps: [
              'Escolha x=1,9 e x=1,99 pela esquerda.',
              'Escolha x=2,1 e x=2,01 pela direita.',
              'Calcule o quociente para cada valor.',
              'Observe que os resultados se aproximam de 4.',
            ],
            result: 'O limite é 4, embora a expressão original não esteja definida em x=2.',
            interpretation:
                'O limite descreve o comportamento próximo ao ponto, não exige que a função esteja definida exatamente nele.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'O que o limite não afirma',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Limite e valor da função são informações diferentes',
            content:
                'É possível existir lim x→a f(x) mesmo que f(a) não exista ou tenha valor diferente do limite. A igualdade entre limite e valor só é exigida quando discutimos continuidade.',
            emphasis:
                'Não substitua automaticamente x=a antes de analisar a estrutura da função.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Base conceitual: Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; Guidorizzi, Um Curso de Cálculo. A organização privilegia interpretação numérica, gráfica e algébrica antes do formalismo ε–δ.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Para estudar lim x→4 f(x), qual informação é mais importante?',
      choices: [
        'Somente o valor exato de f(4).',
        'O comportamento de f(x) para valores próximos de 4.',
        'A quantidade de termos na expressão.',
      ],
      correctIndex: 1,
      explanation:
          'O limite é determinado pela aproximação ao redor do ponto; f(4) pode até estar ausente.',
    ),
    takeaways: [
      'Limite descreve uma tendência das saídas da função.',
      'O valor no ponto e o limite são conceitos relacionados, mas diferentes.',
      'A notação informa função observada, ponto de aproximação e valor previsto.',

      'O limite pode existir mesmo quando a função não está definida no ponto.',
      'Tabelas, gráficos e álgebra oferecem evidências complementares.',
      'A aproximação pode falhar por salto, crescimento sem limite ou oscilação.',
      'A definição rigorosa formaliza a ideia de controlar a proximidade entre entrada e saída.',
    ],
    closing:
        'Na próxima aula, você aprenderá a comparar aproximações pela esquerda e pela direita.',
  ),
  CourseLessonData(
    id: 'limites-02-laterais',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 1',
    eyebrow: 'Aula 2 de 8 • Duas direções',
    title: 'Limites laterais, tabelas e gráficos',
    description:
        'Aprenda a investigar um ponto pelos dois lados e a reconhecer quando o limite não existe.',
    duration: '≈ 40 min',
    objective:
        'calcular limites laterais e comparar seus resultados',
    symbol: '→',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Chegue pela esquerda e pela direita',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Duas aproximações independentes',
            content:
                'O limite pela esquerda usa valores menores que a, indicado por x→a⁻. O limite pela direita usa valores maiores que a, indicado por x→a⁺. O limite bilateral existe somente quando os dois resultados coincidem.',
            emphasis:
                'lim x→a f(x) existe ⇔ os dois limites laterais existem e são iguais.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Leia o gráfico sem confundir os pontos',
            content:
                'Acompanhe a curva enquanto x se aproxima do ponto. Um círculo aberto pode indicar o valor de aproximação; um ponto fechado informa o valor assumido pela função. Eles não precisam estar na mesma altura.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Reconheça um salto',
        blocks: [
          WorkedExampleBlockData(
            title: 'Função definida por partes',
            problem: 'f(x)=1, se x<0; e f(x)=3, se x≥0',
            steps: [
              'Pela esquerda de 0, todos os valores da função são 1.',
              'Pela direita de 0, os valores da função são 3.',
              'Compare os limites laterais: 1 ≠ 3.',
            ],
            result: 'Conclusão: lim x→0 f(x) não existe.',
            interpretation:
                'O gráfico salta de uma altura para outra. O fato de f(0)=3 não corrige a diferença entre os lados.',
          ),
          ConceptBlockData(
            visual: LessonVisual.table,
            title: 'Use tabelas com critério',
            content:
                'Escolha valores progressivamente mais próximos do ponto em ambos os lados. Tabelas sugerem o comportamento, mas alguns fenômenos oscilatórios exigem uma análise algébrica ou teórica.',
            emphasis:
                'Não conclua usando apenas um valor à esquerda e um à direita.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Funções definidas por partes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Escolha a expressão correta em cada lado',
            content:
                'Em uma função por partes, o limite pela esquerda deve usar a fórmula válida para x<a e o limite pela direita deve usar a fórmula válida para x>a. O valor definido exatamente em a não decide os limites laterais.',
          ),
          WorkedExampleBlockData(
            title: 'Dois lados, duas fórmulas',
            problem: 'f(x)=x+2 se x<1 e f(x)=x²+1 se x≥1. Analise x→1.',
            steps: [
              'Pela esquerda: x+2 tende a 3.',
              'Pela direita: x²+1 tende a 2.',
              'Como 3≠2, os limites laterais discordam.',
            ],
            result: 'O limite bilateral em x=1 não existe.',
            interpretation:
                'Mesmo que f(1)=2, o desacordo entre os lados impede o limite bilateral.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Limites laterais infinitos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Um lado pode crescer sem limite',
            content:
                'Em expressões como 1/x perto de zero, o comportamento depende do lado: quando x→0⁺, 1/x cresce positivamente; quando x→0⁻, cresce negativamente em módulo.',
            emphasis:
                'Os símbolos +∞ e −∞ descrevem comportamento não limitado; não são números reais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Protocolo de leitura de gráfico',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Siga a curva, não o ponto isolado',
            content:
                'Para cada lado, percorra visualmente o gráfico em direção a x=a e registre a altura aproximada. Só depois compare com o ponto fechado que representa f(a).',
            emphasis:
                'Limite lateral é uma pergunta de movimento ao longo do gráfico.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Tabelas bilaterais confiáveis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.table,
            title: 'Aproxime com escala progressiva',
            content:
                'Use sequências como a−0,1; a−0,01; a−0,001 e a+0,1; a+0,01; a+0,001. A regularidade da aproximação ajuda a distinguir tendência real de coincidência numérica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Critério de existência',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Condição necessária e suficiente',
            content:
                'Para um limite bilateral finito, lim x→a f(x)=L exatamente quando os dois limites laterais existem e ambos valem L.',
            emphasis:
                'Esta equivalência será usada continuamente em continuidade e funções definidas por partes.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Exemplos de limites laterais',
        blocks: [
          WorkedExampleBlockData(
            title: 'Salto em função por partes',
            problem: 'f(x)=1 para x<0 e f(x)=3 para x≥0. Analise os limites em x=0.',
            steps: [
              'Pela esquerda, a regra usada é f(x)=1.',
              'Logo, lim x→0⁻ f(x)=1.',
              'Pela direita, a regra usada é f(x)=3.',
              'Logo, lim x→0⁺ f(x)=3.',
            ],
            result: 'Como 1≠3, o limite bilateral não existe.',
            interpretation:
                'O limite bilateral exige concordância entre os dois lados.',
          ),
          WorkedExampleBlockData(
            title: 'Assíntota com sinais diferentes',
            problem: 'Analise 1/(x−2) quando x se aproxima de 2.',
            steps: [
              'Pela esquerda, x−2 é negativo e muito pequeno.',
              'Então 1/(x−2)→−∞.',
              'Pela direita, x−2 é positivo e muito pequeno.',
              'Então 1/(x−2)→+∞.',
            ],
            result:
                'Os limites laterais têm sinais opostos; o limite bilateral não existe.',
            interpretation:
                'Limites infinitos também precisam ser analisados lateralmente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Roteiro para funções por partes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Escolha a regra correta em cada lado',
            content:
                '1) identifique o ponto de troca; 2) use a expressão válida à esquerda; 3) use a expressão válida à direita; 4) compare os resultados; 5) só então conclua sobre o limite bilateral.',
            emphasis:
                'O valor atribuído exatamente no ponto não altera os limites laterais.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Referências principais: Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; Guidorizzi. O tratamento segue a abordagem padrão de limites laterais por gráficos, tabelas e funções definidas por partes.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Se lim x→2⁻ f(x)=5 e lim x→2⁺ f(x)=5, o que podemos afirmar?',
      choices: [
        'O limite bilateral vale 5.',
        'f(2) obrigatoriamente vale 5.',
        'A função não está definida em 2.',
      ],
      correctIndex: 0,
      explanation:
          'A igualdade dos limites laterais garante o limite bilateral. Ela não determina sozinha o valor de f(2).',
    ),
    takeaways: [
      'O sinal ⁻ indica aproximação pela esquerda e ⁺ pela direita.',
      'O limite bilateral exige igualdade entre os dois lados.',
      'Ponto fechado representa f(a); aproximação é lida pela curva próxima.',
      'Um salto produz limites laterais diferentes.',

      'Em funções por partes, cada limite lateral usa a expressão válida naquele lado.',
      'Limites laterais podem ser infinitos.',
      'O limite bilateral existe somente quando os dois lados concordam.',
      'O valor f(a) é independente do critério de existência do limite.',
    ],
    closing:
        'Agora que você sabe verificar a existência do limite, vamos aprender as propriedades que tornam o cálculo mais rápido.',
  ),
  CourseLessonData(
    id: 'limites-03-propriedades',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 1',
    eyebrow: 'Aula 3 de 8 • Regras',
    title: 'Propriedades e substituição direta',
    description:
        'Descubra quando basta substituir e como combinar limites conhecidos com segurança.',
    duration: '≈ 40 min',
    objective:
        'usar as propriedades algébricas e reconhecer funções contínuas',
    symbol: 'L',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Combine limites existentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Soma, produto e potência',
            content:
                'Se lim f(x)=L e lim g(x)=M, então o limite da soma é L+M, o do produto é L·M e o de uma potência inteira positiva é Lⁿ. No quociente, também precisamos garantir M≠0.',
            emphasis:
                'As propriedades só podem ser usadas quando os limites envolvidos existem.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Substituição direta é uma consequência',
            content:
                'Polinômios são contínuos em todos os números reais. Por isso, seu limite em a é obtido calculando o próprio valor no ponto. Funções racionais seguem a mesma regra onde o denominador não zera.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Organize expressões maiores',
        blocks: [
          WorkedExampleBlockData(
            title: 'Aplicação das propriedades',
            problem: 'lim x→2 (3x² − 4x + 5)',
            steps: [
              'A expressão é um polinômio, portanto é contínua em x=2.',
              'Substitua x por 2: 3·(2²) − 4·2 + 5.',
              'Calcule na ordem correta: 12 − 8 + 5.',
            ],
            result: 'Resultado: o limite vale 9.',
            interpretation:
                'As propriedades justificam distribuir o limite por cada termo do polinômio.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Denominador zero interrompe o atalho',
            content:
                'Em uma função racional, substitua primeiro. Se o denominador for diferente de zero, conclua. Se surgir 0/0, há uma indeterminação; se surgir número não nulo dividido por zero, investigue limites laterais ou comportamento infinito.',
            emphasis:
                'Nem toda divisão por zero representa a mesma situação.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Leis dos limites',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Soma, diferença, produto e quociente',
            content:
                'Se lim f(x)=L e lim g(x)=M, então os limites de f±g e fg são L±M e LM. Para f/g, o resultado é L/M desde que M≠0.',
            emphasis:
                'As leis dependem da existência dos limites envolvidos e, no quociente, de denominador limite não nulo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Potências, raízes e composição',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Propague limites por operações contínuas',
            content:
                'Potências inteiras e raízes compatíveis com o domínio preservam o limite. Quando uma função externa é contínua no valor limite, é possível passar o limite para dentro da composição.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Polinômios e funções racionais',
        blocks: [
          WorkedExampleBlockData(
            title: 'Substituição direta justificada',
            problem: 'Calcule lim x→2 (3x²−x+4).',
            steps: [
              'Polinômios são contínuos em todos os números reais.',
              'Substitua x=2.',
              '3·4−2+4=14.',
            ],
            result: 'O limite vale 14.',
            interpretation:
                'A substituição direta funciona porque as leis dos limites sustentam a continuidade do polinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Quando o quociente exige cuidado',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Denominador tendendo a zero',
            content:
                'Se o denominador tende a zero, a lei do quociente não pode ser aplicada diretamente. É preciso investigar a forma obtida e escolher outra técnica.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Teorema do confronto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Aprisionar uma função entre duas outras',
            content:
                'Se g(x)≤f(x)≤h(x) perto de a e g e h têm o mesmo limite L, então f também tende a L. Esse princípio será essencial para compreender o limite trigonométrico fundamental.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Aplicação combinada das propriedades',
        blocks: [
          WorkedExampleBlockData(
            title: 'Limite de expressão composta por operações',
            problem:
                'Se lim x→a f(x)=2 e lim x→a g(x)=−1, calcule lim x→a [3f(x)²−2g(x)].',
            steps: [
              'Use a propriedade da potência: f(x)²→4.',
              'Multiplique por 3: 12.',
              'Como g(x)→−1, então −2g(x)→2.',
              'Some os limites.',
            ],
            result: 'O limite é 14.',
            interpretation:
                'As leis de limites permitem decompor expressões complexas em operações simples.',
          ),
          WorkedExampleBlockData(
            title: 'Quando o quociente exige cuidado',
            problem:
                'Se lim x→a f(x)=5 e lim x→a g(x)=0, podemos concluir diretamente o limite de f(x)/g(x)?',
            steps: [
              'A lei do quociente exige limite do denominador diferente de zero.',
              'Aqui g(x)→0.',
              'É preciso investigar sinal, ordem de crescimento ou limites laterais.',
            ],
            result: 'Não há conclusão automática pela lei do quociente.',
            interpretation:
                'As propriedades de limites possuem hipóteses que precisam ser verificadas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Substituição direta e continuidade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Por que substituir funciona em muitos casos',
            content:
                'Polinômios e outras funções elementares são contínuas em seus domínios. Nesses pontos, o limite pode ser calculado avaliando diretamente a função.',
            emphasis:
                'Substituição direta é consequência de continuidade, não uma regra universal sem condições.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Base: Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; Guidorizzi. As leis dos limites são tratadas como fundamento operacional para continuidade e derivadas.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual limite pode ser resolvido imediatamente por substituição?',
      choices: [
        'lim x→2 (x²−4)/(x−2)',
        'lim x→1 (x²+3x)/(x+2)',
        'lim x→0 1/x',
      ],
      correctIndex: 1,
      explanation:
          'Em x=1, o denominador x+2 vale 3. A função racional é contínua nesse ponto.',
    ),
    takeaways: [
      'Polinômios permitem substituição direta em qualquer número real.',
      'Funções racionais permitem substituição onde o denominador não zera.',
      'Soma, produto e potência preservam limites existentes.',
      '0/0 é um sinal para transformar a expressão.',

      'As leis dos limites permitem combinar limites já conhecidos.',
      'A lei do quociente exige limite não nulo no denominador.',
      'Polinômios admitem substituição direta em todo ponto real.',
      'O teorema do confronto permite determinar limites por comparação.',
    ],
    closing:
        'A próxima aula é dedicada justamente ao caso 0/0 resolvido por fatoração.',
  ),
  CourseLessonData(
    id: 'limites-04-fatoracao',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 2',
    eyebrow: 'Aula 4 de 8 • Indeterminação',
    title: 'Fatoração revela o limite escondido',
    description:
        'Transforme expressões equivalentes para remover fatores responsáveis pela forma 0/0.',
    duration: '≈ 40 min',
    objective:
        'resolver limites indeterminados usando fator comum e produtos notáveis',
    symbol: '0/0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Interprete 0/0 corretamente',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Indeterminação não é resposta',
            content:
                'Quando numerador e denominador tendem a zero, diferentes funções podem produzir limites completamente diferentes. Por isso, 0/0 apenas informa que a forma atual da expressão não revela o comportamento.',
            emphasis:
                'Nunca conclua “o limite é zero” apenas porque encontrou 0/0.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Procure um fator comum',
            content:
                'Produtos notáveis frequentemente criam o mesmo fator no numerador e no denominador. Depois de fatorar, simplificamos esse fator para x diferente do ponto. Isso é suficiente porque o limite observa valores próximos, não a substituição exata.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Resolva e justifique cada passo',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diferença de quadrados',
            problem: 'lim x→2 (x² − 4)/(x − 2)',
            steps: [
              'Substitua x=2 e identifique a forma 0/0.',
              'Fatore x²−4 como (x−2)(x+2).',
              'Para x≠2, simplifique o fator x−2.',
              'Calcule lim x→2 (x+2) por substituição.',
            ],
            result: 'Resultado: 4.',
            interpretation:
                'A expressão simplificada descreve o mesmo comportamento em todos os pontos próximos de 2.',
          ),
          WorkedExampleBlockData(
            title: 'Trinômio fatorável',
            problem: 'lim x→3 (x² − 5x + 6)/(x − 3)',
            steps: [
              'Fatore o numerador: x²−5x+6=(x−2)(x−3).',
              'Simplifique o fator x−3 para x≠3.',
              'Avalie x−2 quando x→3.',
            ],
            result: 'Resultado: 1.',
            interpretation:
                'Reconhecer raízes do trinômio transforma uma fração indeterminada em uma função linear.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Não cancele termos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelamento exige fatores',
            content:
                'Só podemos cancelar elementos que multiplicam o numerador e o denominador inteiros. Partes separadas por soma ou subtração não são fatores.',
            emphasis:
                'Fatore primeiro; simplifique depois.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),

      LessonSectionData(
        number: '4',
        title: '0/0 é uma forma indeterminada',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não é resposta',
            content:
                'Obter 0/0 por substituição não significa que o limite seja zero, infinito ou inexistente. Significa apenas que a expressão original não revelou o comportamento e precisa ser transformada.',
            emphasis:
                'Forma indeterminada é um diagnóstico, não um resultado.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Equivalência em uma vizinhança perfurada',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Podemos simplificar porque x não precisa ser igual a a',
            content:
                'Ao estudar x→a, interessam valores arbitrariamente próximos de a. Se duas expressões coincidem para x≠a numa vizinhança do ponto, elas possuem o mesmo comportamento limite.',
            emphasis:
                'Essa é a justificativa conceitual para cancelar um fator comum após fatorar.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Padrões de fatoração úteis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Reconheça a estrutura',
            content:
                'Diferença de quadrados, trinômios, fator comum e diferença ou soma de cubos aparecem com frequência. O objetivo é revelar o fator que zera numerador e denominador.',
          ),
          WorkedExampleBlockData(
            title: 'Diferença de cubos',
            problem: 'Calcule lim x→2 (x³−8)/(x−2).',
            steps: [
              'Fatore x³−8=(x−2)(x²+2x+4).',
              'Simplifique o fator x−2 para x≠2.',
              'Substitua x=2 na expressão restante.',
            ],
            result: '4+4+4=12.',
            interpretation:
                'O limite recupera o comportamento da expressão simplificada perto do ponto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Furo e valor redefinido',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Geometria da simplificação',
            content:
                'Quando um fator comum é cancelado, o gráfico original costuma coincidir com o gráfico simplificado, exceto por um possível furo no ponto problemático. O limite é a altura desse furo.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Fatoração em padrões diferentes',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diferença de cubos',
            problem: 'Calcule lim x→2 (x³−8)/(x−2).',
            steps: [
              'Use x³−8=(x−2)(x²+2x+4).',
              'Cancele x−2 apenas para x≠2.',
              'Avalie x²+2x+4 em x=2.',
            ],
            result: 'O limite é 12.',
            interpretation:
                'A fatoração revela a função que coincide com a original nos pontos próximos de 2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Escolha estratégica da fatoração',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Reconheça o padrão antes de expandir',
            content:
                'Indeterminações 0/0 com polinômios frequentemente pedem fator comum, diferença de quadrados, trinômio ou diferença/soma de cubos. Expandir sem objetivo pode esconder o fator que precisa ser cancelado.',
            emphasis:
                'A técnica algébrica é escolhida pela estrutura da indeterminação.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Referências: Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; Guidorizzi. A fatoração é apresentada como técnica algébrica sustentada pela ideia de vizinhança perfurada.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Depois de fatorar (x²−9)/(x−3), qual expressão descreve o comportamento para x≠3?',
      choices: ['x−3', 'x+3', '1'],
      correctIndex: 1,
      explanation:
          'x²−9=(x−3)(x+3). O fator x−3 é simplificado, restando x+3.',
    ),
    takeaways: [
      '0/0 indica indeterminação, não um resultado.',
      'Diferença de quadrados: a²−b²=(a−b)(a+b).',
      'Trinômios podem revelar o fator que zera o denominador.',
      'Cancelamento só ocorre entre fatores.',

      '0/0 é uma forma indeterminada e exige análise adicional.',
      'Expressões equivalentes para x≠a têm o mesmo limite em a quando coincidem perto do ponto.',
      'Diferenças de quadrados e cubos são padrões frequentes em limites.',
      'A fatoração frequentemente revela geometricamente uma descontinuidade removível.',
    ],
    closing:
        'Nem toda indeterminação é polinomial. Na próxima aula, usaremos conjugados para trabalhar com raízes.',
  ),
  CourseLessonData(
    id: 'limites-05-racionalizacao',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 2',
    eyebrow: 'Aula 5 de 8 • Raízes',
    title: 'Racionalização com expressões conjugadas',
    description:
        'Elimine indeterminações envolvendo raízes sem alterar o valor da expressão.',
    duration: '≈ 40 min',
    objective:
        'identificar conjugados e racionalizar numeradores ou denominadores',
    symbol: '√',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Use a diferença de quadrados',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'O conjugado troca o sinal',
            content:
                'O conjugado de √A−√B é √A+√B. Ao multiplicá-los, obtemos (√A−√B)(√A+√B)=A−B, eliminando as raízes dessa parte da expressão.',
            emphasis:
                'Multiplique numerador e denominador pelo mesmo conjugado para preservar a equivalência.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Racionalize o lado que causa a indeterminação',
            content:
                'Às vezes a raiz está no numerador; em outros casos, no denominador. Identifique onde a subtração de radicais produz zero e aplique o conjugado correspondente.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Acompanhe a simplificação',
        blocks: [
          WorkedExampleBlockData(
            title: 'Raiz no numerador',
            problem: 'lim x→0 (√(x+4) − 2)/x',
            steps: [
              'A substituição gera (2−2)/0=0/0.',
              'Multiplique por (√(x+4)+2)/(√(x+4)+2).',
              'No numerador, use a diferença de quadrados: (x+4)−4=x.',
              'Simplifique o fator x e avalie 1/(√(x+4)+2) em x=0.',
            ],
            result: 'Resultado: 1/4.',
            interpretation:
                'O conjugado revelou uma expressão equivalente e contínua perto de zero.',
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Por que o conjugado funciona',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: '(A−B)(A+B)=A²−B²',
            content:
                'Multiplicar pelo conjugado transforma uma diferença envolvendo raízes em uma diferença algébrica sem radical naquela parte da expressão. O valor da fração é preservado porque multiplicamos numerador e denominador pelo mesmo fator.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Racionalizar numerador ou denominador',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A posição da raiz decide a estratégia',
            content:
                'O conjugado deve ser aplicado à parte que produz a indeterminação. Em alguns exercícios a raiz está no numerador; em outros, no denominador.',
            emphasis:
                'Não existe regra de “racionalizar sempre o denominador” em limites.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Exemplo com raiz no numerador',
        blocks: [
          WorkedExampleBlockData(
            title: 'Conjugado revela o fator oculto',
            problem: 'Calcule lim x→0 (√(1+x)−1)/x.',
            steps: [
              'A substituição produz 0/0.',
              'Multiplique pelo conjugado √(1+x)+1.',
              'O numerador vira x.',
              'Simplifique x para x≠0.',
            ],
            result: 'O limite é 1/2.',
            interpretation:
                'O conjugado transforma a expressão numa forma adequada para substituição direta.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Domínio e aproximação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Raízes impõem restrições',
            content:
                'Ao trabalhar com raízes reais, confirme de quais lados o ponto pode ser aproximado dentro do domínio. Em pontos de fronteira, pode existir apenas um limite lateral relevante.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Escolha entre fatoração e conjugado',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Diagnóstico estrutural',
            content:
                'Se a indeterminação vem de fatores polinomiais, tente fatoração. Se envolve diferença de raízes quadradas, o conjugado costuma ser a ferramenta natural. Alguns problemas exigem ambas.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Dois exemplos de racionalização',
        blocks: [
          WorkedExampleBlockData(
            title: 'Raiz no numerador',
            problem: 'Calcule lim x→0 [√(4+x)−2]/x.',
            steps: [
              'Multiplique pelo conjugado √(4+x)+2.',
              'O numerador torna-se x.',
              'Cancele x para x≠0.',
              'Avalie 1/[√(4+x)+2] em x=0.',
            ],
            result: 'O limite é 1/4.',
            interpretation:
                'O conjugado transforma a diferença de raízes em uma expressão algébrica simples.',
          ),
          WorkedExampleBlockData(
            title: 'Raiz no denominador',
            problem: 'Calcule lim x→9 (x−9)/(√x−3).',
            steps: [
              'Multiplique numerador e denominador pelo conjugado √x+3.',
              'Use (√x−3)(√x+3)=x−9.',
              'Cancele x−9.',
              'Avalie √x+3 em x=9.',
            ],
            result: 'O limite é 6.',
            interpretation:
                'Racionalizar pode revelar uma simplificação que não era visível na forma original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Quando usar o conjugado',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Procure diferenças de radicais',
            content:
                'O conjugado é especialmente útil quando a substituição produz 0/0 e há soma ou diferença envolvendo raízes quadradas. Depois de racionalizar, procure fatores que possam ser cancelados.',
            emphasis:
                'Racionalização é uma transformação algébrica equivalente nos pontos permitidos.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Base: Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; Guidorizzi. A racionalização é tratada como manipulação algébrica para remover formas indeterminadas com radicais.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o conjugado de √(x+1) − 3?',
      choices: ['√(x+1) + 3', '−√(x+1) + 3', '√(x−1) + 3'],
      correctIndex: 0,
      explanation:
          'Mantemos os termos e trocamos apenas o sinal entre eles.',
    ),
    takeaways: [
      'Conjugados transformam produtos em diferenças de quadrados.',
      'Multiplique a fração por uma razão igual a 1.',
      'Simplifique somente depois de desenvolver o produto.',
      'Ao final, volte à substituição direta.',

      'O conjugado usa a identidade da diferença de quadrados.',
      'A parte racionalizada deve ser aquela responsável pela indeterminação.',
      'O domínio de radicais pode tornar a aproximação unilateral.',
      'Fatoração e racionalização podem aparecer no mesmo problema.',
    ],
    closing:
        'A última técnica principal examina o comportamento quando x cresce sem limite.',
  ),
  CourseLessonData(
    id: 'limites-06-infinito',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 3',
    eyebrow: 'Aula 6 de 8 • Longo prazo',
    title: 'Limites no infinito e assíntotas',
    description:
        'Compare termos dominantes para prever o comportamento de funções racionais.',
    duration: '≈ 42 min',
    objective:
        'calcular limites no infinito e interpretar assíntotas horizontais',
    symbol: '∞',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Identifique quem domina',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Termos de maior grau comandam o crescimento',
            content:
                'Quando |x| fica muito grande, x² domina x e constantes; x³ domina x². Em funções racionais, compare os maiores graus do numerador e do denominador.',
            emphasis:
                'Dividir todos os termos pela maior potência do denominador torna essa comparação explícita.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Três casos fundamentais',
            content:
                'Se o grau do numerador é menor, o limite é 0. Se os graus são iguais, o limite é a razão dos coeficientes líderes. Se o numerador possui grau maior, a função não tende a um valor finito.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Calcule sem usar números gigantes',
        blocks: [
          WorkedExampleBlockData(
            title: 'Graus iguais',
            problem: 'lim x→∞ (3x² − x + 4)/(2x² + 5)',
            steps: [
              'O maior grau do denominador é 2. Divida todos os termos por x².',
              'Obtenha (3 − 1/x + 4/x²)/(2 + 5/x²).',
              'Quando x→∞, 1/x e 1/x² tendem a zero.',
              'Resta a razão 3/2.',
            ],
            result: 'Resultado: 3/2.',
            interpretation:
                'A reta y=3/2 é uma assíntota horizontal: o gráfico se aproxima dela no longo prazo.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Interpretação de regime permanente',
            content:
                'Em modelos de controle e circuitos, o limite no infinito pode representar o valor de estabilização de uma resposta ao longo do tempo. A assíntota descreve esse regime permanente.',
            tone: LearningCardTone.success,
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Limite no infinito não é limite infinito',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Duas perguntas diferentes',
            content:
                'Em lim x→∞ f(x), a entrada cresce sem limite. Em lim x→a f(x)=∞, a entrada se aproxima de um número finito enquanto a saída cresce sem limite. Não confunda esses dois comportamentos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Funções racionais e graus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Compare os termos dominantes',
            content:
                'Para P(x)/Q(x): se grau(P)<grau(Q), o limite tende a 0; se os graus são iguais, tende à razão dos coeficientes líderes; se grau(P)>grau(Q), o comportamento não possui assíntota horizontal finita.',
          ),
          WorkedExampleBlockData(
            title: 'Mesmos graus',
            problem: 'Calcule lim x→∞ (3x²−1)/(2x²+5x).',
            steps: [
              'Divida numerador e denominador por x².',
              'Termos com 1/x e 1/x² tendem a zero.',
              'Restam os coeficientes líderes 3 e 2.',
            ],
            result: 'O limite é 3/2.',
            interpretation:
                'Logo y=3/2 é uma assíntota horizontal no sentido x→∞.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Assíntotas horizontais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Comportamento distante',
            content:
                'Se f(x)→L quando x→∞ ou x→−∞, então y=L é uma assíntota horizontal naquele sentido. Uma função pode cruzar sua assíntota horizontal e ainda assim aproximar-se dela a longo prazo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Assíntotas verticais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Crescimento sem limite perto de um ponto',
            content:
                'Se ao menos um limite lateral de f(x) cresce para +∞ ou −∞ quando x→a, a reta x=a funciona como assíntota vertical no sentido correspondente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Sinais e infinito',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Observe paridade e sinais',
            content:
                'Ao dividir por potências de x ou comparar termos dominantes, acompanhe o sinal quando x→−∞. Potências pares e ímpares têm comportamentos diferentes.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Comparação de crescimento',
        blocks: [
          WorkedExampleBlockData(
            title: 'Graus diferentes em função racional',
            problem: 'Calcule lim x→∞ (3x²−1)/(2x³+x).',
            steps: [
              'Divida numerador e denominador por x³.',
              'O numerador torna-se 3/x−1/x³.',
              'O denominador tende a 2.',
              'O numerador tende a 0.',
            ],
            result: 'O limite é 0.',
            interpretation:
                'Quando o denominador tem grau maior, ele domina o crescimento.',
          ),
          WorkedExampleBlockData(
            title: 'Assíntota horizontal',
            problem: 'Calcule lim x→∞ (5x²+1)/(2x²−3).',
            steps: [
              'Divida tudo por x².',
              'Os termos 1/x² e 3/x² tendem a zero.',
              'Resta a razão dos coeficientes líderes.',
            ],
            result: 'O limite é 5/2.',
            interpretation:
                'Graus iguais produzem uma assíntota horizontal dada pela razão dos coeficientes líderes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Infinito não é um número',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Interprete a notação corretamente',
            content:
                'Escrever f(x)→∞ descreve crescimento sem limite; não significa que a função atinge um número chamado infinito. As regras algébricas envolvendo ∞ são abreviações de comportamentos-limite.',
            emphasis:
                'Evite tratar ∞ como um valor real comum.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Referências: Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; Guidorizzi. O foco está em comportamento assintótico, comparação de graus e interpretação geométrica.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é lim x→∞ (5x+1)/(x²+2)?',
      choices: ['0', '5', '∞'],
      correctIndex: 0,
      explanation:
          'O denominador possui grau 2 e cresce mais rapidamente que o numerador de grau 1.',
    ),
    takeaways: [
      'Compare os graus antes de realizar operações.',
      'Grau menor no numerador produz limite zero.',
      'Graus iguais produzem a razão dos coeficientes líderes.',
      'Limites finitos no infinito indicam assíntotas horizontais.',

      'Limite no infinito e limite infinito descrevem fenômenos diferentes.',
      'Em funções racionais, os termos dominantes controlam o comportamento distante.',
      'Limites finitos no infinito identificam assíntotas horizontais.',
      'Crescimento ilimitado perto de um ponto está ligado a assíntotas verticais.',
    ],
    closing:
        'Na próxima aula, você conhecerá os limites trigonométricos fundamentais.',
  ),
  CourseLessonData(
    id: 'limites-07-trigonometricos',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 3',
    eyebrow: 'Aula 7 de 8 • Trigonometria',
    title: 'Limites trigonométricos fundamentais',
    description:
        'Entenda por que sen(x)/x tende a 1 e aprenda a adaptar esse padrão.',
    duration: '≈ 42 min',
    objective: 'reconhecer e aplicar limites trigonométricos em radianos',
    symbol: 'sen',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A unidade angular importa',
        subtitle: 'O limite fundamental exige ângulos medidos em radianos.',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'O padrão sen(u)/u',
            content:
                'Quando u se aproxima de zero em radianos, sen(u) e u ficam cada vez mais próximos. Por isso, a razão sen(u)/u se aproxima de 1, embora a substituição direta produza 0/0.',
            emphasis:
                'lim u→0 sen(u)/u = 1 somente nessa forma compatível e com u em radianos.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Por que o resultado faz sentido?',
            content:
                'Perto de zero, o gráfico de y=sen(x) quase coincide com a reta y=x. A aproximação geométrica explica por que o quociente entre as duas expressões tende a 1.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Construa a forma fundamental',
        blocks: [
          WorkedExampleBlockData(
            title: 'Ajuste de argumento',
            problem: 'lim x→0 sen(3x)/x',
            steps: [
              'O argumento do seno é 3x, mas o denominador é x.',
              'Multiplique e divida por 3: sen(3x)/x = 3·sen(3x)/(3x).',
              'Defina u=3x. Quando x→0, também u→0.',
              'Use lim u→0 sen(u)/u = 1.',
            ],
            result: 'Resultado: 3·1 = 3.',
            interpretation:
                'O coeficiente que ajusta o denominador permanece multiplicando o limite.',
          ),
          WorkedExampleBlockData(
            title: 'Cosseno e conjugado',
            problem: 'lim x→0 (1−cos x)/x',
            steps: [
              'A substituição gera 0/0. Multiplique pelo conjugado 1+cos x.',
              'Use (1−cos x)(1+cos x)=1−cos²x=sen²x.',
              'Reescreva como [sen(x)/x]·[sen(x)/(1+cos x)].',
              'O primeiro fator tende a 1 e o segundo tende a 0/2=0.',
            ],
            result: 'Resultado: 0.',
            interpretation:
                'Identidades trigonométricas podem revelar o limite fundamental escondido.',
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Por que radianos são essenciais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A constante seria diferente em graus',
            content:
                'O limite lim x→0 sin(x)/x=1 depende de x estar em radianos. Radianos conectam comprimento de arco e ângulo sem um fator artificial de conversão.',
            emphasis:
                'Em Cálculo, fórmulas de limites e derivadas trigonométricas são naturalmente expressas em radianos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Ideia geométrica do limite fundamental',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Teorema do confronto',
            content:
                'No círculo unitário, comparações entre áreas de triângulos e setores fornecem desigualdades que aprisionam sin(x)/x entre expressões que tendem a 1. Pelo teorema do confronto, o limite também vale 1.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Variações do limite fundamental',
        blocks: [
          WorkedExampleBlockData(
            title: 'Mudança de escala',
            problem: 'Calcule lim x→0 sin(5x)/x.',
            steps: [
              'Escreva sin(5x)/x = 5·sin(5x)/(5x).',
              'Quando x→0, também 5x→0.',
              'Use sin(u)/u→1.',
            ],
            result: 'O limite vale 5.',
            interpretation:
                'O fator de escala aparece fora do limite fundamental.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'O limite envolvendo cosseno',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: '(1−cos x)/x',
            content:
                'A racionalização trigonométrica mostra que lim x→0 (1−cos x)/x=0. Esse resultado aparece em demonstrações de derivadas e em aproximações locais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Substituições trigonométricas simples',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Transforme para a forma conhecida',
            content:
                'Quando surge sin(g(x))/g(x), identifique u=g(x). Se u→0, a estrutura fundamental pode ser aplicada. O mesmo raciocínio permite reorganizar fatores constantes.',
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Identidades que revelam o limite',
        blocks: [
          WorkedExampleBlockData(
            title: 'Tangente sobre x',
            problem: 'Calcule lim x→0 tan x/x.',
            steps: [
              'Escreva tan x=sin x/cos x.',
              'Reorganize como (sin x/x)·(1/cos x).',
              'Use lim sin x/x=1 e cos 0=1.',
            ],
            result: 'O limite é 1.',
            interpretation:
                'Um limite trigonométrico novo pode ser reduzido a um limite fundamental conhecido.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Ângulos precisam estar em radianos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'O limite fundamental depende da unidade angular',
            content:
                'A identidade lim x→0 sin x/x=1 é válida quando x é medido em radianos. Em graus, surge um fator de conversão.',
            emphasis:
                'Radianos são a unidade natural do Cálculo trigonométrico.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Base: Stewart; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards; Guidorizzi. O limite sin(x)/x é apresentado com motivação geométrica, teorema do confronto e aplicações posteriores em derivadas.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é lim x→0 sen(5x)/x?',
      choices: ['1', '5', '0'],
      correctIndex: 1,
      explanation:
          'Escreva sen(5x)/x = 5·sen(5x)/(5x). A razão fundamental tende a 1.',
    ),
    takeaways: [
      'O limite fundamental usa ângulos em radianos.',
      'Procure construir uma razão do tipo sen(u)/u.',
      'O ajuste feito no denominador deve ser compensado fora da razão.',
      'Identidades e conjugados ajudam em expressões com cosseno.',

      'O limite trigonométrico fundamental pressupõe ângulos em radianos.',
      'O teorema do confronto fornece uma justificativa geométrica para sin(x)/x→1.',
      'Fatores de escala podem ser reorganizados para produzir a forma fundamental.',
      'Limites trigonométricos serão usados diretamente nas derivadas de seno e cosseno.',
    ],
    closing:
        'A aula final reunirá técnicas algébricas, laterais, infinito e trigonometria.',
  ),
  CourseLessonData(
    id: 'limites-08-sintese',
    topicId: 'limites',
    trailTitle: 'Limites • Unidade 3',
    eyebrow: 'Aula 8 de 8 • Síntese',
    title: 'Como escolher a técnica certa',
    description:
        'Organize as ideias do módulo em um método de análise confiável.',
    duration: '≈ 45 min',
    objective:
        'diagnosticar um limite e justificar a técnica escolhida',
    symbol: '?',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Siga uma sequência de diagnóstico',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Um roteiro em cinco perguntas',
            content:
                '1) É limite lateral ou bilateral? 2) A substituição direta funciona? 3) Surgiu 0/0? 4) Há polinômios para fatorar, raízes para racionalizar ou uma forma trigonométrica fundamental? 5) x tende ao infinito, exigindo comparação de graus?',
            emphasis:
                'Escolha a técnica pela estrutura encontrada, não por tentativa aleatória.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Revise o significado do resultado',
            content:
                'Depois do cálculo, pergunte se o valor combina com a tabela, o gráfico ou o crescimento esperado. Um resultado algébrico sem interpretação é mais difícil de verificar.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Combine técnicas quando necessário',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diagnóstico completo',
            problem: 'lim x→1 (x²−1)/(√(x+3)−2)',
            steps: [
              'A substituição gera 0/0; há fatoração no numerador e radical no denominador.',
              'Fatore x²−1=(x−1)(x+1).',
              'Racionalize o denominador usando √(x+3)+2.',
              'A diferença de quadrados transforma o denominador em x−1.',
              'Simplifique x−1 e substitua x=1 na expressão restante.',
            ],
            result: 'Resultado: (1+1)(√4+2)=2·4=8.',
            interpretation:
                'O problema exige reconhecer duas estruturas e combiná-las na ordem correta.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Limite como ferramenta de modelagem',
            content:
                'Em Engenharia, limites avaliam estabilidade, tolerâncias, aproximações numéricas e comportamento de modelos perto de pontos críticos. A técnica algébrica é o meio; a previsão do fenômeno é o objetivo.',
            tone: LearningCardTone.success,
          ),
        ],
      ),

      LessonSectionData(
        number: '3',
        title: 'Árvore de decisão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Da substituição à técnica',
            content:
                'Comece por identificar o tipo de aproximação. Teste substituição direta. Se surgir valor definido, finalize. Se surgir 0/0, procure fatoração, conjugado ou limite trigonométrico. Se houver infinito, analise termos dominantes e sinais.',
            emphasis:
                'O diagnóstico reduz tentativa e erro.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Distinguir resultado de forma',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '0/0, ∞/∞ e denominador zero',
            content:
                'Formas indeterminadas não são respostas. Elas indicam que diferentes funções com a mesma aparência inicial podem ter limites distintos. A estrutura da expressão precisa ser analisada.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Análise em múltiplas representações',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Confirme o resultado',
            content:
                'Depois da álgebra, confronte a resposta com o gráfico, uma tabela ou o comportamento esperado. Em aplicações físicas, verifique também sinal e unidade.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Problema cumulativo',
        blocks: [
          WorkedExampleBlockData(
            title: 'Escolha de técnica sem pista',
            problem: 'Analise lim x→0 (√(1+x)−1)/sin x.',
            steps: [
              'A substituição produz 0/0.',
              'Racionalize o numerador: (√(1+x)−1)=x/(√(1+x)+1).',
              'Reescreva x/sin x como o inverso de sin x/x.',
              'Use √(1+x)+1→2 e sin x/x→1.',
            ],
            result: 'O limite vale 1/2.',
            interpretation:
                'O exercício combina racionalização e limite trigonométrico fundamental.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Ponte para Continuidade e Derivadas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'O limite passa a organizar o Cálculo',
            content:
                'Continuidade compara lim x→a f(x) com f(a). A derivada nasce do limite de um quociente incremental. Assim, Limites não é um capítulo isolado: é a linguagem que sustenta os próximos conceitos.',
            emphasis:
                'Próxima etapa: transformar comportamento limite em continuidade.',
            tone: LearningCardTone.success,
          ),
        ],
      ),

      LessonSectionData(
        number: '8',
        title: 'Exemplos de escolha de técnica',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diagnóstico antes do cálculo',
            problem: 'Calcule lim x→1 (x²−1)/(√x−1).',
            steps: [
              'A substituição produz 0/0.',
              'Fatore x²−1=(x−1)(x+1).',
              'Racionalize √x−1 usando √x+1.',
              'Use x−1=(√x−1)(√x+1) para cancelar.',
            ],
            result: 'O limite é 4.',
            interpretation:
                'Alguns problemas exigem combinar técnicas, não escolher apenas uma.',
          ),
          WorkedExampleBlockData(
            title: 'Limite bilateral por análise lateral',
            problem: 'Analise lim x→0 |x|/x.',
            steps: [
              'Para x<0, |x|=−x e o quociente vale −1.',
              'Para x>0, |x|=x e o quociente vale 1.',
              'Compare os limites laterais.',
            ],
            result: 'O limite bilateral não existe.',
            interpretation:
                'Reconhecer uma função por partes pode ser mais importante que manipular algebraicamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Checklist de decisão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Uma ordem eficiente de tentativa',
            content:
                '1) tente substituição direta; 2) identifique a indeterminação; 3) considere fatoração ou racionalização; 4) analise lados se houver troca de regra ou denominador zerando; 5) compare crescimento no infinito; 6) procure limites trigonométricos fundamentais.',
            emphasis:
                'A técnica deve responder à estrutura do problema, não a uma palavra-chave isolada.',
          ),
        ],
      ),      LessonSectionData(
        number: '10',
        title: 'Base acadêmica e síntese final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Referências',
            content:
                'Síntese baseada em Stewart, Thomas’ Calculus, OpenStax Calculus Volume 1, Larson & Edwards e Guidorizzi. A sequência segue a progressão internacional típica: interpretação → leis → técnicas algébricas → infinito → trigonometria → continuidade e derivada.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Uma substituição produz 0/0 e o numerador é x²−a². Qual é a primeira transformação mais promissora?',
      choices: [
        'Fatorar como (x−a)(x+a).',
        'Declarar que o limite é zero.',
        'Comparar apenas os graus.',
      ],
      correctIndex: 0,
      explanation:
          'A diferença de quadrados pode revelar o fator responsável pela indeterminação.',
    ),
    takeaways: [
      'Comece sempre analisando tipo de aproximação e substituição direta.',
      'Use fatoração para estruturas polinomiais e conjugados para radicais.',
      'No infinito, compare os termos dominantes.',
      'Interprete o resultado no contexto algébrico, gráfico ou físico.',

      'A técnica correta nasce do diagnóstico da forma do limite.',
      'Formas indeterminadas indicam necessidade de transformação, não um resultado.',
      'Resultados devem ser verificados algébrica, gráfica ou numericamente.',
      'Limites fornecem a base formal para continuidade e derivadas.',
    ],
    closing:
        'Você concluiu a teoria essencial de Limites. Agora a prática consolidará o roteiro de decisão.',
  ),
];