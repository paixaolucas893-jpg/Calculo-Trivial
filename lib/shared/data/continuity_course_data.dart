import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> continuityCourseLessons = [
  CourseLessonData(
    id: 'continuidade-01-significado',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 1',
    eyebrow: 'Aula 1 de 7 • Ideia central',
    title: 'Quando uma função é contínua?',
    description:
        'Conecte valor da função, limite e comportamento do gráfico em um ponto.',
    duration: '≈ 28 min',
    objective: 'verificar as três condições de continuidade em um ponto',
    symbol: 'C',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Pense em ausência de ruptura',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Uma trajetória sem interrupção',
            content:
                'Uma função é contínua em x=a quando o valor previsto pela aproximação coincide com o valor realmente atribuído à função nesse ponto. No gráfico, não há furo, salto ou fuga para o infinito em a.',
            emphasis:
                'A ideia de “desenhar sem tirar o lápis” ajuda, mas a definição matemática é mais precisa.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'As três condições',
            content:
                '1) f(a) deve existir. 2) lim x→a f(x) deve existir. 3) O limite deve ser igual a f(a). Se apenas uma condição falhar, a função não é contínua em a.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Aplique a definição na ordem correta',
        blocks: [
          WorkedExampleBlockData(
            title: 'Verificação completa',
            problem: 'f(x)=x²+1. A função é contínua em x=2?',
            steps: [
              'Calcule f(2)=2²+1=5.',
              'Como polinômios aceitam substituição direta, lim x→2 (x²+1)=5.',
              'Compare: o limite existe e é igual a f(2).',
            ],
            result: 'f é contínua em x=2.',
            interpretation:
                'Valor, tendência pela esquerda e tendência pela direita encontram-se em 5.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Continuidade e limites laterais', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Os dois lados precisam concordar', content: 'Para que f seja contínua em a, os limites pela esquerda e pela direita devem existir, ser iguais entre si e coincidir com f(a).', emphasis: 'A continuidade reúne esquerda, direita e valor no ponto.')]),
      LessonSectionData(number: '4', title: 'Um furo pode ser reparado', blocks: [WorkedExampleBlockData(title: 'Descontinuidade removível', problem: 'f(x)=(x²−1)/(x−1), x≠1. Como tornar f contínua em x=1?', steps: ['Fatore x²−1=(x−1)(x+1).','Para x≠1, f(x)=x+1.','Logo lim x→1 f(x)=2.','Defina f(1)=2.'], result: 'Com f(1)=2, a continuidade é restaurada.', interpretation: 'O limite indica exatamente qual valor deve preencher o furo.')]),
      LessonSectionData(number: '5', title: 'Continuidade unilateral', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'Extremos de intervalos', content: 'Em uma extremidade do domínio, usa-se continuidade pela direita ou pela esquerda. Em [a,b], a continuidade em a é verificada pela direita e em b pela esquerda.')]),
      LessonSectionData(number: '6', title: 'Leitura gráfica rigorosa', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Sem ruptura local', content: 'No gráfico, continuidade em a significa que a curva se aproxima da mesma altura pelos dois lados e que o ponto da função está exatamente nessa altura.', emphasis: '“Desenhar sem tirar o lápis” é uma metáfora; limite=valor é o critério matemático.')]),
      LessonSectionData(number: '7', title: 'Erros frequentes', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Existir f(a) não basta', content: 'Uma função pode estar definida em a e ainda ser descontínua ali. Também pode ter limite em a sem estar definida no ponto.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A definição em três condições é tratada como consequência direta da teoria de limites.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'Se lim x→a f(x)=4, mas f(a)=7, a função é contínua em a?',
      choices: ['Sim', 'Não', 'Somente pela direita'],
      correctIndex: 1,
      explanation:
          'A terceira condição falha: o limite precisa coincidir com o valor da função.',
    ),
    takeaways: [
      'Continuidade é uma propriedade analisada em um ponto ou intervalo.',
      'O valor da função e o limite precisam existir.',
      'A igualdade lim x→a f(x)=f(a) completa a verificação.',

      'Continuidade em a exige existência de f(a), existência do limite e igualdade entre ambos.',
      'Os limites laterais precisam concordar.',
      'Uma descontinuidade removível pode ser corrigida redefinindo o valor no ponto.',
      'Em extremos de intervalos, a continuidade é unilateral.',
    ],
    closing:
        'Na próxima aula, você reconhecerá famílias contínuas sem refazer toda a definição.',
  ),
  CourseLessonData(
    id: 'continuidade-02-dominio',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 1',
    eyebrow: 'Aula 2 de 7 • Famílias e domínio',
    title: 'Continuidade no domínio',
    description:
        'Use propriedades de polinômios, racionais, raízes e trigonometria.',
    duration: '≈ 30 min',
    objective: 'determinar intervalos de continuidade a partir do domínio',
    symbol: 'D',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Reconheça funções conhecidas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Famílias contínuas',
            content:
                'Polinômios, seno, cosseno e exponenciais são contínuos em todos os reais. Funções racionais são contínuas onde o denominador não zera. Raízes de índice par são contínuas onde o radicando é não negativo.',
            emphasis:
                'Dizer “contínua em seu domínio” não inclui pontos onde a expressão nem sequer está definida.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Operações preservam continuidade',
            content:
                'Somas, produtos e composições de funções contínuas continuam contínuos onde as operações estão definidas. Quocientes também, desde que o denominador seja diferente de zero.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Encontre intervalos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Uma função racional',
            problem: 'f(x)=(x+1)/(x−2)',
            steps: [
              'O numerador e o denominador são polinômios.',
              'Encontre onde o denominador zera: x−2=0, então x=2.',
              'Exclua esse ponto e separe o domínio em intervalos.',
            ],
            result: 'f é contínua em (−∞,2) e (2,+∞).',
            interpretation:
                'A expressão possui uma ruptura em x=2 porque a divisão deixa de estar definida.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Composição de funções contínuas', blocks: [ConceptBlockData(visual: LessonVisual.transform, title: 'Continuidade atravessa a composição', content: 'Se g é contínua em a e f é contínua em g(a), então f∘g é contínua em a. Isso permite analisar expressões complexas por camadas.')]),
      LessonSectionData(number: '4', title: 'Exponenciais e logaritmos', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Famílias fundamentais', content: 'Funções exponenciais são contínuas em ℝ. Logaritmos são contínuos onde o argumento é positivo. O domínio continua sendo a primeira verificação.')]),
      LessonSectionData(number: '5', title: 'Trigonométricas', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Seno, cosseno e quocientes', content: 'Seno e cosseno são contínuos em ℝ. Tangente e outras funções obtidas por quocientes são contínuas onde seus denominadores não anulam.')]),
      LessonSectionData(number: '6', title: 'Raízes e fronteiras do domínio', blocks: [WorkedExampleBlockData(title: 'Raiz composta', problem: 'Determine onde f(x)=√(5−x) é contínua.', steps: ['Exija 5−x≥0.','Logo x≤5.','A raiz é contínua em seu domínio.'], result: 'f é contínua em (−∞,5].', interpretation: 'No extremo x=5, a continuidade é pela esquerda.')]),
      LessonSectionData(number: '7', title: 'Intervalos máximos de continuidade', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Quebre o domínio nos pontos problemáticos', content: 'Zeros de denominadores, fronteiras de radicais e argumentos inválidos de logaritmos dividem o domínio em intervalos máximos nos quais a expressão permanece contínua.')]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A abordagem segue a classificação padrão de famílias contínuas e operações que preservam continuidade.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question: 'Onde √(x−3) é contínua no conjunto dos reais?',
      choices: ['[3,+∞)', 'Todo ℝ', '(−∞,3]'],
      correctIndex: 0,
      explanation:
          'A raiz exige x−3≥0. A função é contínua em todo o domínio resultante.',
    ),
    takeaways: [
      'Comece encontrando o domínio da expressão.',
      'Funções racionais excluem zeros do denominador.',
      'Operações e composições preservam continuidade quando definidas.',

      'Composições preservam continuidade sob as hipóteses adequadas.',
      'Exponenciais são contínuas em ℝ e logaritmos em seus domínios positivos.',
      'Trigonométricas por quociente exigem atenção aos zeros do denominador.',
      'Intervalos máximos de continuidade são obtidos a partir das restrições do domínio.',
    ],
    closing:
        'Agora você classificará o que acontece nos pontos em que a continuidade falha.',
  ),
  CourseLessonData(
    id: 'continuidade-03-descontinuidades',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 2',
    eyebrow: 'Aula 3 de 7 • Classificação',
    title: 'Furos, saltos e assíntotas',
    description:
        'Diferencie descontinuidades removíveis, de salto e infinitas.',
    duration: '≈ 32 min',
    objective: 'classificar uma descontinuidade pelo comportamento dos limites',
    symbol: '!',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Observe como a aproximação falha',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Três tipos principais',
            content:
                'Removível: o limite existe e é finito, mas o valor está ausente ou diferente. Salto: os limites laterais são finitos e diferentes. Infinita: a função cresce em módulo sem limite perto do ponto.',
            emphasis:
                'A classificação depende dos limites, não apenas da aparência do gráfico.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'A função parte inteira',
            content:
                'Em cada número inteiro, a função ⌊x⌋ muda de nível abruptamente. O valor que chega pela esquerda difere do valor pela direita, formando saltos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Classifique com evidências',
        blocks: [
          WorkedExampleBlockData(
            title: 'Assíntota vertical',
            problem: 'f(x)=1/(x−2), perto de x=2',
            steps: [
              'Pela direita, x−2 é positivo e muito pequeno: f(x)→+∞.',
              'Pela esquerda, x−2 é negativo e muito pequeno: f(x)→−∞.',
              'Os valores crescem sem limite em módulo.',
            ],
            result: 'Há uma descontinuidade infinita em x=2.',
            interpretation:
                'A reta x=2 funciona como assíntota vertical.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Descontinuidade removível', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'O limite existe, mas o ponto falha', content: 'Se lim x→a f(x)=L existe, mas f(a) não existe ou f(a)≠L, a descontinuidade é removível. Definir f(a)=L repara a função.')]),
      LessonSectionData(number: '4', title: 'Descontinuidade de salto', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Os lados chegam a alturas diferentes', content: 'Quando os limites laterais são finitos mas diferentes, o limite bilateral não existe. Alterar apenas f(a) não resolve esse tipo de ruptura.')]),
      LessonSectionData(number: '5', title: 'Descontinuidade infinita', blocks: [ConceptBlockData(visual: LessonVisual.infinity, title: 'Assíntota vertical', content: 'Se ao menos um limite lateral cresce sem limite em módulo, ocorre descontinuidade infinita e comportamento assintótico vertical.')]),
      LessonSectionData(number: '6', title: 'Oscilação', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Nem toda falha é salto ou infinito', content: 'Uma função pode oscilar indefinidamente perto de um ponto sem se aproximar de um único valor. Nesse caso o limite não existe.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '7', title: 'Diagnóstico por evidências', blocks: [WorkedExampleBlockData(title: 'Classifique a ruptura', problem: 'Se lim x→2⁻ f(x)=3, lim x→2⁺ f(x)=3 e f(2)=7, qual é o tipo?', steps: ['Os limites laterais coincidem.','O limite bilateral vale 3.','O valor da função é 7.'], result: 'Descontinuidade removível.', interpretation: 'Redefinir f(2)=3 corrige a continuidade.')]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A classificação distingue falhas removíveis, saltos, comportamento infinito e oscilatório.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'O limite em a existe e vale 3, mas f(a) não existe. Qual é o tipo?',
      choices: ['Removível', 'Salto', 'Infinita'],
      correctIndex: 0,
      explanation:
          'Basta definir f(a)=3 para reparar a continuidade naquele ponto.',
    ),
    takeaways: [
      'Furos correspondem a descontinuidades removíveis.',
      'Limites laterais diferentes caracterizam saltos.',
      'Crescimento ilimitado perto do ponto indica descontinuidade infinita.',

      'Descontinuidades removíveis mantêm um limite finito existente.',
      'Saltos ocorrem quando os limites laterais finitos são diferentes.',
      'Descontinuidades infinitas estão associadas a crescimento ilimitado.',
      'Oscilação pode impedir a existência do limite sem salto ou assíntota.',
    ],
    closing:
        'Na próxima aula, os limites laterais serão usados em funções definidas por partes.',
  ),
  CourseLessonData(
    id: 'continuidade-04-partes',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 2',
    eyebrow: 'Aula 4 de 7 • Funções por partes',
    title: 'Encontro entre duas regras',
    description:
        'Verifique continuidade em pontos de troca e nos extremos de intervalos.',
    duration: '≈ 32 min',
    objective: 'comparar limites laterais em funções definidas por partes',
    symbol: '{',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Cada lado usa sua própria regra',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O ponto de troca',
            content:
                'Para x<a, use a primeira expressão ao calcular o limite pela esquerda. Para x>a, use a segunda no limite pela direita. Depois confira qual regra contém o sinal de igualdade e determina f(a).',
            emphasis:
                'As três quantidades precisam coincidir: limite esquerdo, limite direito e valor no ponto.',
          ),
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Extremos de um intervalo',
            content:
                'No extremo esquerdo [a,b], só faz sentido aproximar-se por valores do domínio, isto é, pela direita. No extremo direito, usamos o limite pela esquerda.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Faça as regras se encontrarem',
        blocks: [
          WorkedExampleBlockData(
            title: 'Duas expressões',
            problem: 'f(x)=x+1 se x<1; f(x)=2x se x≥1',
            steps: [
              'Pela esquerda, x+1 tende a 2.',
              'Pela direita, 2x tende a 2.',
              'Como a segunda regra inclui x=1, f(1)=2.',
            ],
            result: 'A função é contínua em x=1.',
            interpretation:
                'Os dois trechos encontram-se no mesmo ponto sem produzir salto.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'O ponto de junção concentra a análise', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'Fora da junção, cada regra costuma ser simples', content: 'Em funções por partes, as expressões individuais geralmente são contínuas em seus próprios domínios. O trabalho principal é verificar os pontos onde a regra muda.')]),
      LessonSectionData(number: '4', title: 'Procedimento completo', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Esquerda, direita e valor', content: 'No ponto de troca a: calcule lim x→a⁻ f(x), lim x→a⁺ f(x) e f(a). A continuidade exige que os três valores coincidam.')]),
      LessonSectionData(number: '5', title: 'Exemplo com duas expressões', blocks: [WorkedExampleBlockData(title: 'As regras precisam se encontrar', problem: 'f(x)=2x+1 se x<2 e x²−1 se x≥2. É contínua em 2?', steps: ['Pela esquerda: 2·2+1=5.','Pela direita: 2²−1=3.','f(2)=3.'], result: 'Não é contínua em 2.', interpretation: 'O desacordo lateral impede continuidade.')]),
      LessonSectionData(number: '6', title: 'Mais de um ponto de troca', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Analise cada junção separadamente', content: 'Uma função com três ou mais trechos pode ter vários pontos críticos de continuidade. Cada ponto de troca exige sua própria comparação lateral.')]),
      LessonSectionData(number: '7', title: 'Modelagem por partes', blocks: [ConceptBlockData(visual: LessonVisual.engineering, title: 'Tarifas, controle e regimes físicos', content: 'Modelos por partes aparecem quando uma regra muda após um limiar. Continuidade indica se a transição entre regimes ocorre sem salto no valor modelado.', tone: LearningCardTone.information)]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. Funções por partes consolidam limites laterais e condições locais de continuidade.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'Em [0,4], qual lado verifica a continuidade no extremo x=4?',
      choices: ['Esquerda', 'Direita', 'Os dois obrigatoriamente'],
      correctIndex: 0,
      explanation:
          'Aproximamo-nos de 4 usando valores menores que pertencem ao intervalo.',
    ),
    takeaways: [
      'Use a regra correspondente a cada lado do ponto de troca.',
      'Confira separadamente o valor definido no ponto.',
      'Nos extremos do domínio, use continuidade unilateral.',

      'Em funções por partes, o foco está nos pontos de mudança de regra.',
      'Continuidade na junção exige igualdade entre limite esquerdo, direito e valor da função.',
      'Cada ponto de troca deve ser analisado separadamente.',
      'Modelos por partes representam mudanças de regime em aplicações reais.',
    ],
    closing:
        'A próxima aula transformará a continuidade em uma equação para descobrir parâmetros.',
  ),
  CourseLessonData(
    id: 'continuidade-05-parametros',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 3',
    eyebrow: 'Aula 5 de 7 • Reparação',
    title: 'Escolha valores que eliminam rupturas',
    description:
        'Determine parâmetros e redefina pontos para tornar funções contínuas.',
    duration: '≈ 34 min',
    objective: 'montar e resolver condições de continuidade com parâmetros',
    symbol: 'k',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Transforme a definição em equação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Reparar uma descontinuidade removível',
            content:
                'Se o limite em a existe e é L, definir f(a)=L preenche o furo. Em funções por partes, igualamos as expressões laterais no ponto de troca e resolvemos a equação para o parâmetro.',
            emphasis:
                'Somente descontinuidades removíveis podem ser corrigidas alterando um único valor.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Resolva o parâmetro',
        blocks: [
          WorkedExampleBlockData(
            title: 'Ajuste entre duas partes',
            problem: 'f(x)=2x+1 se x<1; f(x)=x+k se x≥1',
            steps: [
              'O limite esquerdo em 1 vale 2(1)+1=3.',
              'O limite direito e f(1) valem 1+k.',
              'Imponha continuidade: 1+k=3.',
              'Resolva a equação: k=2.',
            ],
            result: 'k=2 torna a função contínua.',
            interpretation:
                'O parâmetro desloca o segundo trecho até ele encontrar o primeiro.',
          ),
          WorkedExampleBlockData(
            title: 'Preenchendo um furo',
            problem: 'f(x)=(x²−1)/(x−1), x≠1. Defina f(1).',
            steps: [
              'Fatore x²−1=(x−1)(x+1).',
              'Perto de 1, simplifique para x+1.',
              'Calcule o limite: 1+1=2.',
            ],
            result: 'Defina f(1)=2.',
            interpretation:
                'A nova definição muda apenas o ponto ausente, preservando o restante da função.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Parâmetros como condição de compatibilidade', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'A continuidade escolhe o parâmetro', content: 'Quando uma função por partes contém uma constante desconhecida, a condição de continuidade produz uma equação que força as regras a concordarem na junção.')]),
      LessonSectionData(number: '4', title: 'Parâmetro no valor da função', blocks: [WorkedExampleBlockData(title: 'Preencha o ponto correto', problem: 'f(x)=(x²−4)/(x−2) para x≠2 e f(2)=k. Encontre k.', steps: ['Simplifique para x+2.','Calcule lim x→2 f(x)=4.','Exija k=4.'], result: 'k=4.', interpretation: 'O parâmetro preenche a descontinuidade removível.')]),
      LessonSectionData(number: '5', title: 'Parâmetro em uma das regras', blocks: [WorkedExampleBlockData(title: 'Faça os trechos coincidir', problem: 'f(x)=kx+1 se x<2 e x² se x≥2. Determine k.', steps: ['Limite esquerdo: 2k+1.','Limite direito e f(2): 4.','Resolva 2k+1=4.'], result: 'k=3/2.', interpretation: 'A igualdade lateral determina o parâmetro.')]),
      LessonSectionData(number: '6', title: 'Mais de um parâmetro', blocks: [ConceptBlockData(visual: LessonVisual.calculate, title: 'Pode surgir um sistema', content: 'Com duas constantes desconhecidas e duas condições independentes de junção, a continuidade pode gerar um sistema. Em cursos posteriores, continuidade e derivabilidade juntas fornecem condições adicionais.')]),
      LessonSectionData(number: '7', title: 'Verificação após resolver', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Substitua de volta', content: 'Depois de encontrar o parâmetro, recalcule os limites laterais e o valor da função. Isso detecta erros algébricos antes de concluir.')]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. Problemas paramétricos transformam a definição de continuidade em condições algébricas explícitas.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'Se lim x→3 f(x)=8, qual valor deve ser atribuído a f(3) para garantir continuidade?',
      choices: ['3', '8', '0'],
      correctIndex: 1,
      explanation:
          'A continuidade exige que o valor no ponto seja igual ao limite.',
    ),
    takeaways: [
      'Calcule primeiro o valor que a aproximação exige.',
      'Iguale limites laterais para ajustar funções por partes.',
      'Redefinir um ponto corrige apenas descontinuidades removíveis.',

      'A continuidade pode determinar parâmetros desconhecidos.',
      'O valor do parâmetro nasce da igualdade entre os comportamentos na junção.',
      'Mais de um parâmetro pode produzir sistemas de equações.',
      'Sempre verifique o valor encontrado na definição original.',
    ],
    closing:
        'Na próxima aula, a continuidade garantirá a existência de valores entre duas medições.',
  ),
  CourseLessonData(
    id: 'continuidade-06-valor-intermediario',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 3',
    eyebrow: 'Aula 6 de 7 • Existência',
    title: 'Teorema do Valor Intermediário',
    description:
        'Use continuidade para garantir valores e localizar raízes em intervalos.',
    duration: '≈ 36 min',
    objective: 'aplicar o Teorema do Valor Intermediário corretamente',
    symbol: '∃',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Uma função contínua não pula valores',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'A garantia do teorema',
            content:
                'Se f é contínua em [a,b], então ela assume todo valor N entre f(a) e f(b). Existe pelo menos um c em [a,b] tal que f(c)=N.',
            emphasis:
                'O teorema garante existência, mas não informa necessariamente onde está o ponto nem se ele é único.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Detecção de mudança de sinal',
            content:
                'Se uma resposta contínua de um sistema passa de negativa para positiva, ela cruza zero em algum instante. Métodos numéricos usam essa garantia para localizar raízes e pontos de equilíbrio.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Verifique as hipóteses',
        blocks: [
          WorkedExampleBlockData(
            title: 'Existência de uma raiz',
            problem: 'f contínua em [1,2], f(1)=−3 e f(2)=4',
            steps: [
              'Confirme a continuidade em todo o intervalo fechado.',
              'Observe que 0 está entre −3 e 4.',
              'Aplique o Teorema do Valor Intermediário.',
            ],
            result: 'Existe pelo menos um c em (1,2) com f(c)=0.',
            interpretation:
                'Não podemos afirmar que c=1,5 nem que exista apenas uma raiz.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Enunciado matemático', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Valores entre f(a) e f(b)', content: 'Se f é contínua em [a,b] e N está entre f(a) e f(b), então existe pelo menos um c em [a,b] tal que f(c)=N.', emphasis: 'O teorema garante existência, não necessariamente unicidade nem o valor exato de c.')]),
      LessonSectionData(number: '4', title: 'Bolzano como caso especial', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Mudança de sinal implica raiz', content: 'Se f é contínua em [a,b] e f(a) e f(b) têm sinais opostos, então existe ao menos um c em (a,b) com f(c)=0.')]),
      LessonSectionData(number: '5', title: 'Exemplo de existência de raiz', blocks: [WorkedExampleBlockData(title: 'Sem resolver a equação', problem: 'Mostre que x³+x−1=0 possui uma raiz em (0,1).', steps: ['A função é polinomial, logo contínua.','f(0)=−1.','f(1)=1.','Há mudança de sinal.'], result: 'Existe pelo menos uma raiz em (0,1).', interpretation: 'O teorema prova existência sem fornecer fórmula para a raiz.')]),
      LessonSectionData(number: '6', title: 'O que o teorema não afirma', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Existência não é unicidade', content: 'O TVI não diz que existe apenas um c, nem localiza exatamente esse valor. Também não pode ser usado sem verificar continuidade no intervalo.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '7', title: 'Conexão com métodos numéricos', blocks: [ConceptBlockData(visual: LessonVisual.engineering, title: 'Base para busca de raízes', content: 'A mudança de sinal em uma função contínua fundamenta métodos como a bisseção, que reduz sucessivamente um intervalo preservando uma raiz garantida.', tone: LearningCardTone.information)]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. O Teorema do Valor Intermediário aparece como consequência central da continuidade e base para existência de soluções.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'O TVI garante exatamente uma raiz quando há mudança de sinal?',
      choices: ['Sim', 'Não, garante pelo menos uma', 'Somente para polinômios'],
      correctIndex: 1,
      explanation:
          'A função pode cruzar o eixo várias vezes; o teorema garante existência, não unicidade.',
    ),
    takeaways: [
      'A continuidade deve valer em todo o intervalo fechado.',
      'Todo valor entre f(a) e f(b) é atingido.',
      'Mudança de sinal garante ao menos uma raiz.',
      'O teorema não fornece localização exata nem unicidade.',

      'O TVI garante que funções contínuas percorrem todos os valores intermediários.',
      'Mudança de sinal em um intervalo contínuo garante pelo menos uma raiz.',
      'O teorema prova existência, não unicidade.',
      'Métodos numéricos como bisseção exploram essa garantia.',
    ],
    closing:
        'A aula final reunirá definição, domínio, classificação e aplicações.',
  ),
  CourseLessonData(
    id: 'continuidade-07-sintese',
    topicId: 'continuidade',
    trailTitle: 'Continuidade • Unidade 3',
    eyebrow: 'Aula 7 de 7 • Síntese',
    title: 'Um roteiro para analisar continuidade',
    description:
        'Escolha uma estratégia confiável para pontos, intervalos e funções por partes.',
    duration: '≈ 38 min',
    objective: 'diagnosticar e justificar problemas de continuidade',
    symbol: '✓',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Comece pelo tipo de problema',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Roteiro de decisão',
            content:
                '1) Encontre o domínio. 2) Se for uma família conhecida, identifique seus intervalos contínuos. 3) Em um ponto especial, verifique valor e limites laterais. 4) Classifique a falha. 5) Se houver parâmetro, transforme a igualdade dos limites em equação.',
            emphasis:
                'Escreva a justificativa: não basta responder apenas “sim” ou “não”.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Continuidade em modelos reais',
            content:
                'Modelos contínuos representam grandezas que variam sem saltos instantâneos, como posição idealizada, temperatura e deformação. Saltos podem representar comandos, impactos ou mudanças de regime e precisam ser tratados conscientemente.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Faça uma verificação final',
        blocks: [
          WorkedExampleBlockData(
            title: 'Diagnóstico em um ponto',
            problem: 'lim x→a f(x)=5 e f(a)=5',
            steps: [
              'O valor f(a) existe.',
              'O limite bilateral existe e é finito.',
              'O limite coincide com o valor da função.',
            ],
            result: 'f é contínua em a.',
            interpretation:
                'A conclusão decorre explicitamente das três condições, não de uma suposição visual.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Árvore de decisão para continuidade', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Pergunte na ordem certa', content: '1) O ponto pertence ao domínio? 2) Os limites laterais existem? 3) Eles coincidem? 4) O limite é igual a f(a)? 5) Há parâmetro ou junção a ajustar?')]),
      LessonSectionData(number: '4', title: 'Classifique a falha', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Removível, salto, infinita ou oscilatória', content: 'Depois de detectar uma descontinuidade, classifique-a. Isso indica se uma redefinição pode reparar a função ou se a ruptura é estrutural.')]),
      LessonSectionData(number: '5', title: 'Problema cumulativo', blocks: [WorkedExampleBlockData(title: 'Da definição ao parâmetro', problem: 'f(x)=(x²−1)/(x−1) para x<1 e kx+1 para x≥1. Ache k para continuidade em 1.', steps: ['Pela esquerda, simplifique para x+1 e obtenha 2.','Pela direita e no ponto, obtenha k+1.','Exija k+1=2.'], result: 'k=1.', interpretation: 'Combina limite removível, função por partes e parâmetro.')]),
      LessonSectionData(number: '6', title: 'Continuidade não implica derivabilidade', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Uma quina pode ser contínua', content: 'A função |x| é contínua em x=0, mas não é derivável ali porque as inclinações laterais não coincidem. Continuidade é necessária para derivabilidade, mas não suficiente.', tone: LearningCardTone.warning)]),
      LessonSectionData(number: '7', title: 'Ponte para Derivadas', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'Do valor contínuo à taxa instantânea', content: 'A derivada é definida por um limite de quocientes incrementais. Antes de estudar taxas instantâneas, é essencial reconhecer estabilidade e continuidade perto do ponto.', emphasis: 'Próxima unidade: derivabilidade e taxa instantânea.', tone: LearningCardTone.success)]),
      LessonSectionData(number: '8', title: 'Base acadêmica e síntese final', blocks: [ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A unidade fecha a progressão limites → continuidade → derivabilidade, comum em Cálculo I.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(
      question:
          'Qual é a primeira verificação ao procurar intervalos de continuidade?',
      choices: ['O domínio', 'A derivada', 'O maior coeficiente'],
      correctIndex: 0,
      explanation:
          'Uma função só pode ser contínua nos pontos em que está definida.',
    ),
    takeaways: [
      'Domínio e família da função orientam a análise global.',
      'Em pontos especiais, aplique as três condições.',
      'Limites laterais classificam saltos e rupturas infinitas.',
      'Continuidade permite garantir valores intermediários.',

      'A análise de continuidade começa pelo domínio e termina comparando limite e valor.',
      'Classificar a descontinuidade ajuda a entender se ela pode ser reparada.',
      'O TVI transforma continuidade em uma garantia de existência.',
      'Toda função derivável é contínua, mas uma função contínua pode não ser derivável.',
    ],
    closing:
        'Você concluiu a teoria essencial de Continuidade. Agora consolide cada decisão na prática.',
  ),
];
