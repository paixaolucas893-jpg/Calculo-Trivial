import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> derivativesCourseLessons = [
  CourseLessonData(
    id: 'derivadas-01-significado',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 1',
    eyebrow: 'Aula 1 de 8 • Ideia central',
    title: 'Taxa de variação e reta tangente',
    description:
        'Entenda a derivada como velocidade instantânea e inclinação local.',
    duration: '≈ 32 min',
    objective: 'interpretar a derivada geometricamente e em situações reais',
    symbol: "f'",
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Da média ao instante',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Taxa média de variação',
            content:
                'Entre x=a e x=b, a taxa média é [f(b)−f(a)]/(b−a). Ela mede quanto a saída varia, em média, para cada unidade acrescentada à entrada.',
            emphasis:
                'Em posição versus tempo, essa razão representa velocidade média.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Aproximando a reta secante',
            content:
                'Quando b se aproxima de a, a reta que corta o gráfico em dois pontos tende à reta tangente. O limite das inclinações das secantes é a derivada f′(a).',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Leia a definição por limite',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'f′(a)=lim h→0 [f(a+h)−f(a)]/h',
            content:
                'O incremento h separa dois pontos. O numerador mede a variação da função e o denominador mede a variação da entrada. Fazer h→0 produz uma taxa instantânea.',
          ),
          WorkedExampleBlockData(
            title: 'Derivada de x² no ponto a',
            problem: 'f(x)=x²',
            steps: [
              'Substitua na definição: [(a+h)²−a²]/h.',
              'Expanda: [a²+2ah+h²−a²]/h.',
              'Simplifique h: 2a+h.',
              'Faça h→0 e obtenha 2a.',
            ],
            result: 'f′(a)=2a.',
            interpretation:
                'A inclinação muda com o ponto: quanto maior a, mais inclinada é a parábola.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Duas interpretações da derivada', blocks: [
        ConceptBlockData(visual: LessonVisual.compare, title: 'Inclinação e taxa instantânea', content: 'Geometricamente, f′(a) é a inclinação da reta tangente ao gráfico em x=a. Em aplicações, é a taxa instantânea de variação da saída em relação à entrada.', emphasis: 'As duas interpretações descrevem o mesmo limite em linguagens diferentes.'),
      ]),
      LessonSectionData(number: '4', title: 'Da secante à tangente', blocks: [
        ConceptBlockData(visual: LessonVisual.graph, title: 'Um limite de inclinações', content: 'A reta secante usa dois pontos. Quando o segundo ponto se aproxima do primeiro, a inclinação da secante pode convergir para a inclinação da tangente. Esse processo é a definição geométrica da derivada.'),
      ]),
      LessonSectionData(number: '5', title: 'Notações da derivada', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'f′(x), y′ e dy/dx', content: 'As notações de Lagrange e Leibniz expressam a mesma ideia. f′(x) enfatiza a nova função; dy/dx enfatiza a razão infinitesimal que emerge do limite.', emphasis: 'A notação muda, o conceito não.'),
      ]),
      LessonSectionData(number: '6', title: 'Derivada como função', blocks: [
        WorkedExampleBlockData(title: 'De um ponto para todos os pontos', problem: 'Se f(x)=x², determine f′(x).', steps: ['Use [f(x+h)−f(x)]/h.','Expanda (x+h)²−x².','Simplifique para 2x+h.','Faça h→0.'], result: 'f′(x)=2x.', interpretation: 'A derivada associa a cada x a inclinação local da parábola nesse ponto.'),
      ]),
      LessonSectionData(number: '7', title: 'Unidades e significado físico', blocks: [
        ConceptBlockData(visual: LessonVisual.engineering, title: 'Unidade da saída por unidade da entrada', content: 'Se s(t) está em metros e t em segundos, s′(t) está em m/s. Se C(q) está em reais e q em unidades produzidas, C′(q) tem unidade R\$/unidade.', tone: LearningCardTone.information),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A derivada é apresentada como limite de quocientes incrementais, com leitura geométrica e aplicada.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Geometricamente, o que f′(a) representa?',
      choices: [
        'A inclinação da tangente em a',
        'A área até a',
        'O valor máximo de f',
      ],
      correctIndex: 0,
      explanation:
          'A derivada é o limite das inclinações de retas secantes quando os pontos se aproximam.',
    ),
    takeaways: [
      'Taxa média compara dois pontos; derivada descreve um instante.',
      'A derivada é definida por um limite.',
      'Geometricamente, f′(a) é a inclinação da reta tangente.',

      'A derivada é um limite de taxas médias em intervalos cada vez menores.',
      'Geometricamente, representa a inclinação da tangente.',
      'Fisicamente, representa uma taxa instantânea.',
      'f′(x) é uma nova função que descreve inclinações locais.',
    ],
    closing:
        'Na próxima aula, regras de derivação tornarão esses cálculos mais rápidos.',
  ),
  CourseLessonData(
    id: 'derivadas-02-regras-basicas',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 1',
    eyebrow: 'Aula 2 de 8 • Regras básicas',
    title: 'Constantes, potências e polinômios',
    description:
        'Derive termo a termo e trabalhe com expoentes inteiros e fracionários.',
    duration: '≈ 30 min',
    objective: 'aplicar linearidade e regra da potência com segurança',
    symbol: 'xⁿ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Construa o repertório essencial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Três regras fundamentais',
            content:
                'A derivada de uma constante é 0. A derivada de x é 1. Para qualquer potência admissível, d/dx(xⁿ)=n·xⁿ⁻¹: o expoente desce multiplicando e diminui uma unidade.',
            emphasis:
                'Uma constante não varia; por isso, sua taxa de variação é zero.',
          ),
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Reescreva antes de derivar',
            content:
                'Raízes e frações podem virar potências: √x=x¹ᐟ² e 1/x=x⁻¹. Essa transformação permite usar a mesma regra da potência.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Derive termo a termo',
        blocks: [
          WorkedExampleBlockData(
            title: 'Polinômio completo',
            problem: 'f(x)=5x³−2x²+7x−4',
            steps: [
              'd/dx(5x³)=15x².',
              'd/dx(−2x²)=−4x.',
              'd/dx(7x)=7.',
              'd/dx(−4)=0.',
            ],
            result: 'f′(x)=15x²−4x+7.',
            interpretation:
                'A soma das taxas de cada termo fornece a taxa da função inteira.',
          ),
          WorkedExampleBlockData(
            title: 'Expoente fracionário',
            problem: 'f(x)=√x=x¹ᐟ², com x>0',
            steps: [
              'Faça o expoente 1/2 descer.',
              'Subtraia 1: 1/2−1=−1/2.',
              'Escreva (1/2)x⁻¹ᐟ².',
            ],
            result: 'f′(x)=1/(2√x).',
            interpretation:
                'O domínio da derivada pode ser menor que o domínio original.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Linearidade', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'Constantes saem e somas se separam', content: 'A derivada satisfaz d/dx[c·f(x)]=c·f′(x) e d/dx[f(x)+g(x)]=f′(x)+g′(x). Isso explica por que polinômios podem ser derivados termo a termo.'),
      ]),
      LessonSectionData(number: '4', title: 'Regra da potência além de inteiros positivos', blocks: [
        ConceptBlockData(visual: LessonVisual.calculate, title: 'Expoentes negativos e fracionários', content: 'Depois de reescrever raízes e recíprocos como potências, a regra d/dx(xⁿ)=n xⁿ⁻¹ continua útil onde a função e a derivada fazem sentido.'),
      ]),
      LessonSectionData(number: '5', title: 'Domínio da derivada', blocks: [
        WorkedExampleBlockData(title: 'A derivada pode ter domínio menor', problem: 'f(x)=√x.', steps: ['Escreva x^(1/2).','Derive: (1/2)x^(−1/2).','Reescreva como 1/(2√x).'], result: 'f′(x)=1/(2√x), definida para x>0.', interpretation: 'f existe em x=0, mas a fórmula da derivada não é definida ali.'),
      ]),
      LessonSectionData(number: '6', title: 'Derivadas de ordem superior', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Derivar novamente', content: 'Se f′ também é derivável, obtemos f″. Em movimento, posição deriva para velocidade e velocidade deriva para aceleração.'),
      ]),
      LessonSectionData(number: '7', title: 'Erros frequentes', blocks: [
        ConceptBlockData(visual: LessonVisual.warning, title: 'Não esqueça coeficientes e expoentes', content: 'Erros comuns incluem manter a constante aditiva, reduzir o expoente sem multiplicá-lo e aplicar a regra da potência a uma composição sem usar cadeia.', tone: LearningCardTone.warning),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. As regras básicas são tratadas como consequências estruturais que substituem o uso repetido da definição por limite.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Qual é a derivada de 3x⁴−5?',
      choices: ['12x³', '12x³−5', '3x³'],
      correctIndex: 0,
      explanation:
          'A potência produz 3·4x³=12x³ e a constante desaparece.',
    ),
    takeaways: [
      'Constantes têm derivada zero e d/dx(x)=1.',
      'Na regra da potência, multiplique pelo expoente e reduza-o em um.',
      'Reescreva raízes e inversos como potências.',

      'A derivação é linear.',
      'A regra da potência cobre muitos expoentes após reescrita adequada.',
      'O domínio da derivada pode ser menor que o domínio da função.',
      'Derivadas de ordem superior descrevem novas taxas de variação.',
    ],
    closing:
        'Agora você aprenderá a derivar produtos e quocientes sem expandir tudo.',
  ),
  CourseLessonData(
    id: 'derivadas-03-produto-quociente',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 2',
    eyebrow: 'Aula 3 de 8 • Combinações',
    title: 'Regras do produto e do quociente',
    description:
        'Combine funções preservando todos os termos necessários.',
    duration: '≈ 32 min',
    objective: 'aplicar e conferir as regras do produto e do quociente',
    symbol: 'u·v',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Não derive fatores isoladamente',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Produto: (uv)′=u′v+uv′',
            content:
                'Derive o primeiro e conserve o segundo; depois conserve o primeiro e derive o segundo. Some os dois resultados.',
            emphasis:
                'Em geral, a derivada de um produto não é u′v′.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Quociente: (u/v)′=(u′v−uv′)/v²',
            content:
                'Multiplique a derivada de cima pela função de baixo, subtraia a função de cima vezes a derivada de baixo e divida pelo quadrado do denominador.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Escolha entre simplificar e aplicar a regra',
        blocks: [
          WorkedExampleBlockData(
            title: 'Regra do produto',
            problem: 'f(x)=x²(x+1)',
            steps: [
              'Defina u=x² e v=x+1.',
              'Calcule u′=2x e v′=1.',
              'Aplique u′v+uv′=2x(x+1)+x².',
              'Simplifique: 3x²+2x.',
            ],
            result: 'f′(x)=3x²+2x.',
            interpretation:
                'Expandir antes também funcionaria; as duas estratégias devem coincidir.',
          ),
          WorkedExampleBlockData(
            title: 'Simplifique um quociente',
            problem: 'f(x)=(x²+1)/x, x≠0',
            steps: [
              'Separe os termos: f(x)=x+1/x.',
              'Reescreva 1/x=x⁻¹.',
              'Derive: 1−x⁻².',
            ],
            result: 'f′(x)=1−1/x².',
            interpretation:
                'Simplificar primeiro pode reduzir erros, desde que o domínio seja preservado.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Por que (fg)′ não é f′g′', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Os dois fatores variam ao mesmo tempo', content: 'No produto, a mudança total envolve a variação de f mantendo g e a variação de g mantendo f. Por isso aparecem dois termos: (fg)′=f′g+fg′.'),
      ]),
      LessonSectionData(number: '4', title: 'Regra do quociente', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: '(f/g)′=(f′g−fg′)/g²', content: 'O denominador deve ser não nulo. A ordem do numerador importa: derivada do de cima vezes o de baixo menos o de cima vezes a derivada do de baixo.'),
      ]),
      LessonSectionData(number: '5', title: 'Simplificar antes ou derivar direto', blocks: [
        WorkedExampleBlockData(title: 'Escolha a rota mais curta', problem: 'f(x)=x²·x³.', steps: ['Você pode usar produto: 2x·x³+x²·3x².','Ou simplificar primeiro para x⁵.','Derive x⁵.'], result: 'f′(x)=5x⁴.', interpretation: 'Simplificar antes pode reduzir trabalho e risco de erro.'),
      ]),
      LessonSectionData(number: '6', title: 'Produtos com mais fatores', blocks: [
        ConceptBlockData(visual: LessonVisual.transform, title: 'A regra se estende', content: 'Para três fatores, cada termo deriva um fator por vez e mantém os outros. Em expressões grandes, organização algébrica é parte da solução.'),
      ]),
      LessonSectionData(number: '7', title: 'Erros frequentes', blocks: [
        ConceptBlockData(visual: LessonVisual.warning, title: 'Sinal e denominador', content: 'Na regra do quociente, trocar a ordem do numerador muda o sinal. Também é erro esquecer o quadrado no denominador.', tone: LearningCardTone.warning),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. Produto e quociente são apresentados com justificativa estrutural e comparação entre estratégias algébricas.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Qual estrutura inicia a derivada de u(x)v(x)?',
      choices: ['u′v+uv′', 'u′v′', 'u′/v′'],
      correctIndex: 0,
      explanation:
          'Cada parcela deriva um fator e conserva o outro.',
    ),
    takeaways: [
      'A regra do produto gera duas parcelas.',
      'A ordem e o sinal de subtração importam no quociente.',
      'Simplifique antes quando isso reduzir a complexidade.',

      'A derivada de um produto exige dois termos.',
      'A regra do quociente preserva uma ordem específica no numerador.',
      'Simplificar antes de derivar pode ser a melhor estratégia.',
      'Organização algébrica é essencial em expressões com vários fatores.',
    ],
    closing:
        'A próxima aula tratará de funções colocadas dentro de outras funções.',
  ),
  CourseLessonData(
    id: 'derivadas-04-cadeia',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 2',
    eyebrow: 'Aula 4 de 8 • Composição',
    title: 'Regra da cadeia por camadas',
    description:
        'Derive funções compostas da camada externa para a interna.',
    duration: '≈ 36 min',
    objective: 'identificar função externa, interna e aplicar a cadeia',
    symbol: 'f∘g',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Enxergue as camadas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'A função de fora recebe a de dentro',
            content:
                'Em y=[g(x)]ⁿ, a potência é a camada externa e g(x) é a interna. Derive a camada externa mantendo a interna e multiplique por g′(x).',
            emphasis:
                'Regra da cadeia: d/dx f(g(x))=f′(g(x))·g′(x).',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'O fator que costuma ser esquecido',
            content:
                'Derivar apenas a camada externa produz uma resposta incompleta. Sempre pergunte: “o que está ocupando o lugar de x?” e derive essa expressão também.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Derive de fora para dentro',
        blocks: [
          WorkedExampleBlockData(
            title: 'Potência de uma função linear',
            problem: 'f(x)=(2x+1)³',
            steps: [
              'Camada externa: u³. Sua derivada é 3u².',
              'Mantenha u=2x+1: 3(2x+1)².',
              'Derive a camada interna: d/dx(2x+1)=2.',
              'Multiplique os fatores.',
            ],
            result: 'f′(x)=6(2x+1)².',
            interpretation:
                'O fator 2 registra a velocidade com que a expressão interna varia.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Composição formal', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: '(f∘g)′(x)=f′(g(x))g′(x)', content: 'A regra da cadeia deriva a função externa avaliada na interna e multiplica pela derivada da interna.', emphasis: 'Derive por camadas, sem destruir a composição antes da hora.'),
      ]),
      LessonSectionData(number: '4', title: 'Reconheça a função interna', blocks: [
        WorkedExampleBlockData(title: 'Potência de uma expressão', problem: 'y=(3x²+1)^5.', steps: ['Externa: u^5.','Interna: u=3x²+1.','Derive externa: 5u⁴.','Multiplique por u′=6x.'], result: 'y′=30x(3x²+1)^4.', interpretation: 'O fator 6x é a contribuição da camada interna.'),
      ]),
      LessonSectionData(number: '5', title: 'Cadeias com três camadas', blocks: [
        ConceptBlockData(visual: LessonVisual.transform, title: 'Repita o processo', content: 'Em expressões como sin((x²+1)^3), derive seno, depois a potência e por fim a expressão interna. Cada camada contribui com um fator.'),
      ]),
      LessonSectionData(number: '6', title: 'Notação de Leibniz', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'dy/dx=(dy/du)(du/dx)', content: 'A notação de Leibniz torna a estrutura da cadeia visualmente clara. Embora não seja cancelamento comum de frações, ela ajuda a organizar dependências entre variáveis.'),
      ]),
      LessonSectionData(number: '7', title: 'Erro típico: esquecer a interna', blocks: [
        ConceptBlockData(visual: LessonVisual.warning, title: 'Derivar só a parte externa', content: 'Escrever d/dx[(g(x))^n]=n(g(x))^(n−1) está incompleto. É necessário multiplicar por g′(x).', tone: LearningCardTone.warning),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A cadeia é tratada como regra central para composições e ponte para diferenciação implícita e taxas relacionadas.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Qual é a derivada de (3x−2)⁴?',
      choices: ['12(3x−2)³', '4(3x−2)³', '12(3x−2)⁴'],
      correctIndex: 0,
      explanation:
          'A camada externa fornece 4(3x−2)³ e a interna fornece o fator 3.',
    ),
    takeaways: [
      'Identifique explicitamente a função externa e a interna.',
      'Derive a externa mantendo a expressão interna.',
      'Multiplique pela derivada de cada camada interna.',

      'A regra da cadeia deriva composições por camadas.',
      'Cada camada interna acrescenta um fator derivativo.',
      'A notação de Leibniz ajuda a visualizar dependências.',
      'Esquecer a derivada da função interna é um dos erros mais comuns.',
    ],
    closing:
        'A seguir, você ampliará o repertório com trigonometria, exponenciais e logaritmos.',
  ),
  CourseLessonData(
    id: 'derivadas-05-elementares',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 2',
    eyebrow: 'Aula 5 de 8 • Funções elementares',
    title: 'Seno, cosseno, exponencial e logaritmo',
    description:
        'Memorize com significado as derivadas elementares mais usadas.',
    duration: '≈ 38 min',
    objective: 'derivar funções trigonométricas, exponenciais e logarítmicas',
    symbol: 'eˣ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Organize o repertório',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Quatro pares fundamentais',
            content:
                'd/dx[sen(x)]=cos(x); d/dx[cos(x)]=−sen(x); d/dx[eˣ]=eˣ; d/dx[ln(x)]=1/x para x>0.',
            emphasis:
                'O sinal negativo pertence à derivada do cosseno, não à do seno.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Por que eˣ é especial?',
            content:
                'A base e é escolhida de modo que a taxa instantânea de crescimento de eˣ seja igual ao próprio valor da função. Isso simplifica modelos de crescimento e decaimento.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Combine com a cadeia',
        blocks: [
          WorkedExampleBlockData(
            title: 'Seno de uma função',
            problem: 'f(x)=sen(2x)',
            steps: [
              'A derivada externa de sen(u) é cos(u).',
              'Mantenha u=2x: cos(2x).',
              'Multiplique pela derivada interna, que é 2.',
            ],
            result: 'f′(x)=2cos(2x).',
            interpretation:
                'A oscilação interna duas vezes mais rápida produz um fator 2 na taxa.',
          ),
          WorkedExampleBlockData(
            title: 'Logaritmo composto',
            problem: 'g(x)=ln(x²+1)',
            steps: [
              'A derivada externa de ln(u) é 1/u.',
              'Use u=x²+1 no denominador.',
              'Multiplique por u′=2x.',
            ],
            result: 'g′(x)=2x/(x²+1).',
            interpretation:
                'A cadeia conecta a taxa do logaritmo à taxa da expressão interna.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Trigonométricas básicas', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'Derivadas fundamentais', content: 'd/dx(sin x)=cos x e d/dx(cos x)=−sin x. A derivada da tangente é sec²x onde a função está definida.', emphasis: 'Essas fórmulas pressupõem ângulos em radianos.'),
      ]),
      LessonSectionData(number: '4', title: 'Exponenciais', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'A função e^x é especial', content: 'A exponencial natural satisfaz d/dx(e^x)=e^x. Para a^x, a derivada é a^x ln(a), com a>0 e a≠1.'),
      ]),
      LessonSectionData(number: '5', title: 'Logaritmos', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'd/dx ln x=1/x', content: 'O logaritmo natural tem derivada 1/x para x>0. Em composições, a cadeia produz u′/u.'),
      ]),
      LessonSectionData(number: '6', title: 'Combine repertório e cadeia', blocks: [
        WorkedExampleBlockData(title: 'Exponencial composta', problem: 'f(x)=e^(x²).', steps: ['A externa é e^u.','A interna é u=x².','A derivada externa continua e^u.','Multiplique por 2x.'], result: 'f′(x)=2x e^(x²).', interpretation: 'A fórmula elementar e a cadeia trabalham juntas.'),
      ]),
      LessonSectionData(number: '7', title: 'Domínio e radianos', blocks: [
        ConceptBlockData(visual: LessonVisual.warning, title: 'As fórmulas têm hipóteses', content: 'Logaritmos exigem argumento positivo no domínio real. Derivadas trigonométricas padrão usam radianos. Quocientes trigonométricos exigem denominadores não nulos.', tone: LearningCardTone.warning),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. O repertório elementar é organizado para ser combinado com produto, quociente e cadeia.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Qual é d/dx[cos(x)]?',
      choices: ['−sen(x)', 'sen(x)', '−cos(x)'],
      correctIndex: 0,
      explanation:
          'A taxa do cosseno segue o seno com sinal negativo.',
    ),
    takeaways: [
      'A derivada de sen(x) é cos(x).',
      'A derivada de cos(x) é −sen(x).',
      'eˣ permanece igual e ln(x) produz 1/x.',
      'Em argumentos compostos, aplique também a cadeia.',

      'Seno, cosseno, exponenciais e logaritmos têm derivadas fundamentais próprias.',
      'Fórmulas trigonométricas de Cálculo usam radianos.',
      'Composições exigem regra da cadeia.',
      'Domínio e hipóteses continuam relevantes depois de derivar.',
    ],
    closing:
        'Na próxima aula, a derivada será convertida em uma equação de reta tangente.',
  ),
  CourseLessonData(
    id: 'derivadas-06-tangente',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 3',
    eyebrow: 'Aula 6 de 8 • Geometria local',
    title: 'Inclinação e equação da tangente',
    description:
        'Use f′(a) para construir a reta que melhor aproxima o gráfico.',
    duration: '≈ 32 min',
    objective: 'calcular inclinação e equação da reta tangente',
    symbol: 'y=mx+b',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Encontre ponto e inclinação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'A fórmula ponto-inclinação',
            content:
                'No ponto x=a, a inclinação é m=f′(a) e o ponto do gráfico é (a,f(a)). Substitua em y−f(a)=f′(a)(x−a).',
            emphasis:
                'Calcular somente f′(a) fornece a inclinação, não a equação completa da reta.',
          ),
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Aproximação linear',
            content:
                'Perto de a, a função pode ser aproximada por L(x)=f(a)+f′(a)(x−a). Essa linearização simplifica estimativas e análise de pequenos erros.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Monte a reta',
        blocks: [
          WorkedExampleBlockData(
            title: 'Tangente à parábola',
            problem: 'f(x)=x² no ponto (1,1)',
            steps: [
              'Derive: f′(x)=2x.',
              'Avalie a inclinação: f′(1)=2.',
              'Use y−1=2(x−1).',
              'Simplifique a equação.',
            ],
            result: 'y=2x−1.',
            interpretation:
                'A reta e a parábola compartilham o ponto e a direção instantânea em x=1.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Equação ponto-inclinação', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'y−f(a)=f′(a)(x−a)', content: 'Depois de encontrar o ponto (a,f(a)) e a inclinação f′(a), a reta tangente é escrita diretamente na forma ponto-inclinação.'),
      ]),
      LessonSectionData(number: '4', title: 'Reta normal', blocks: [
        ConceptBlockData(visual: LessonVisual.compare, title: 'Inclinação perpendicular', content: 'Quando f′(a)≠0, a reta normal tem inclinação −1/f′(a). Ela é perpendicular à tangente no ponto de contato.'),
      ]),
      LessonSectionData(number: '5', title: 'Tangente horizontal', blocks: [
        ConceptBlockData(visual: LessonVisual.graph, title: 'Quando f′(a)=0', content: 'Derivada zero produz tangente horizontal. Isso pode indicar máximo, mínimo ou apenas um ponto estacionário; é preciso analisar o comportamento ao redor.'),
      ]),
      LessonSectionData(number: '6', title: 'Aproximação linear', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'A tangente aproxima a função localmente', content: 'Perto de x=a, uma função diferenciável pode ser aproximada por L(x)=f(a)+f′(a)(x−a). Essa é a base da linearização.', emphasis: 'A reta tangente é um modelo local da função.'),
      ]),
      LessonSectionData(number: '7', title: 'Exemplo completo', blocks: [
        WorkedExampleBlockData(title: 'Tangente a uma parábola', problem: 'Ache a tangente a f(x)=x² em x=2.', steps: ['f(2)=4.','f′(x)=2x.','f′(2)=4.','Use y−4=4(x−2).'], result: 'y=4x−4.', interpretation: 'A reta compartilha ponto e inclinação com a curva em x=2.'),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A tangente é conectada à derivada, à normal e à aproximação linear local.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Para f(x)=x², qual é a inclinação em x=3?',
      choices: ['6', '3', '9'],
      correctIndex: 0,
      explanation:
          'Como f′(x)=2x, temos f′(3)=6.',
    ),
    takeaways: [
      'f′(a) fornece a inclinação da tangente.',
      'O ponto de tangência é (a,f(a)).',
      'Use y−f(a)=f′(a)(x−a).',
      'A reta tangente aproxima a função localmente.',

      'A tangente usa o ponto (a,f(a)) e a inclinação f′(a).',
      'A normal é perpendicular à tangente.',
      'f′(a)=0 produz tangente horizontal.',
      'A tangente fornece a aproximação linear da função perto do ponto.',
    ],
    closing:
        'A seguir, você estudará quando a derivada existe e o que seus zeros revelam.',
  ),
  CourseLessonData(
    id: 'derivadas-07-derivabilidade',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 3',
    eyebrow: 'Aula 7 de 8 • Existência e análise',
    title: 'Derivabilidade e pontos críticos',
    description:
        'Reconheça cantos, derivadas laterais e candidatos a extremos.',
    duration: '≈ 36 min',
    objective: 'analisar existência da derivada e localizar pontos críticos',
    symbol: 'f′=0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Derivável implica contínua',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A recíproca é falsa',
            content:
                'Se f é derivável em a, então é contínua em a. Porém, uma função pode ser contínua e não derivável: cantos, cúspides e tangentes verticais impedem uma inclinação finita única.',
            emphasis:
                'Continuidade é necessária para derivabilidade, mas não é suficiente.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Derivadas laterais',
            content:
                'A derivada existe somente quando as taxas pela esquerda e pela direita existem e coincidem. Para |x| em zero, elas são −1 e 1, por isso há um canto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Encontre pontos críticos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Candidatos a mudança',
            content:
                'Um número c no domínio é crítico quando f′(c)=0 ou quando f′(c) não existe. Pontos críticos são candidatos a máximos e mínimos, mas ainda precisam ser analisados.',
            emphasis:
                'Derivada zero não garante automaticamente um máximo ou mínimo.',
          ),
          WorkedExampleBlockData(
            title: 'Derivada igual a zero',
            problem: 'f(x)=x²−4x',
            steps: [
              'Derive: f′(x)=2x−4.',
              'Imponha f′(x)=0.',
              'Resolva 2x−4=0.',
            ],
            result: 'x=2 é um ponto crítico.',
            interpretation:
                'A tangente horizontal indica um candidato a mudança de crescimento.',
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Derivabilidade implica continuidade', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Uma implicação, não uma equivalência', content: 'Se f é derivável em a, então f é contínua em a. A recíproca é falsa: continuidade não garante derivabilidade.', emphasis: 'Derivável ⇒ contínua; contínua ⇏ derivável.'),
      ]),
      LessonSectionData(number: '4', title: 'Quinas e cúspides', blocks: [
        ConceptBlockData(visual: LessonVisual.graph, title: 'Inclinações laterais incompatíveis', content: 'Em f(x)=|x| no zero, as derivadas laterais são −1 e 1. A função é contínua, mas a derivada não existe porque as inclinações não coincidem.'),
      ]),
      LessonSectionData(number: '5', title: 'Tangentes verticais e descontinuidades', blocks: [
        ConceptBlockData(visual: LessonVisual.warning, title: 'Outras causas de não derivabilidade', content: 'A derivada pode falhar em tangentes verticais, cúspides, quinas e pontos de descontinuidade. Sempre examine continuidade e comportamento lateral.', tone: LearningCardTone.warning),
      ]),
      LessonSectionData(number: '6', title: 'Pontos críticos', blocks: [
        ConceptBlockData(visual: LessonVisual.notation, title: 'f′(c)=0 ou f′(c) não existe', content: 'Um ponto crítico do domínio ocorre quando a derivada é zero ou não existe. Pontos críticos são candidatos a extremos locais, mas não são automaticamente máximos ou mínimos.'),
      ]),
      LessonSectionData(number: '7', title: 'Sinal da derivada', blocks: [
        ConceptBlockData(visual: LessonVisual.compare, title: 'Crescimento e decrescimento', content: 'Quando f′>0 em um intervalo, f cresce; quando f′<0, f decresce. Mudanças de sinal da derivada ajudam a classificar pontos críticos.'),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. Derivabilidade é conectada a continuidade, derivadas laterais e análise qualitativa por sinal.', tone: LearningCardTone.information),
      ]),
    ],
    check: LessonCheckData(
      question: 'Uma função contínua é sempre derivável?',
      choices: ['Não', 'Sim', 'Somente se f′=0'],
      correctIndex: 0,
      explanation:
          '|x| é contínua em zero, mas suas derivadas laterais são diferentes.',
    ),
    takeaways: [
      'Derivabilidade garante continuidade no ponto.',
      'Continuidade sozinha não garante derivabilidade.',
      'Cantos podem ser detectados por derivadas laterais diferentes.',
      'Pontos críticos ocorrem quando f′=0 ou não existe.',

      'Toda função derivável é contínua no ponto.',
      'Quinas, cúspides e tangentes verticais podem impedir derivabilidade.',
      'Pontos críticos não são automaticamente extremos.',
      'O sinal de f′ descreve crescimento e decrescimento.',
    ],
    closing:
        'A aula final aplicará derivadas a movimento e interpretação de unidades.',
  ),
  CourseLessonData(
    id: 'derivadas-08-aplicacoes',
    topicId: 'derivadas',
    trailTitle: 'Derivadas • Unidade 3',
    eyebrow: 'Aula 8 de 8 • Aplicações',
    title: 'Movimento, unidades e modelagem',
    description:
        'Interprete derivadas em problemas físicos e organize o método completo.',
    duration: '≈ 40 min',
    objective: 'modelar taxas instantâneas e interpretar seus resultados',
    symbol: 'v(t)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A derivada carrega unidades',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.engineering,
            title: 'Posição, velocidade e aceleração',
            content:
                'Se s(t) mede posição em metros e t está em segundos, v(t)=s′(t) é medida em m/s. Derivar novamente produz a(t)=v′(t)=s″(t), em m/s².',
            emphasis:
                'As unidades ajudam a verificar se a resposta representa a grandeza pedida.',
            tone: LearningCardTone.success,
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Roteiro de modelagem',
            content:
                '1) Identifique entrada, saída e unidades. 2) Derive o modelo. 3) Avalie no instante solicitado. 4) Inclua a unidade. 5) Interprete sinal e magnitude no contexto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Calcule e interprete',
        blocks: [
          WorkedExampleBlockData(
            title: 'Velocidade instantânea',
            problem: 's(t)=t²+3t metros; encontre v(2)',
            steps: [
              'Derive a posição: v(t)=s′(t)=2t+3.',
              'Substitua t=2: v(2)=2·2+3.',
              'Calcule e anexe a unidade de velocidade.',
            ],
            result: 'v(2)=7 m/s.',
            interpretation:
                'No instante de 2 segundos, a posição aumenta a uma taxa de 7 metros por segundo.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Derivada além do movimento',
            content:
                'Em Engenharia, derivadas descrevem corrente como taxa de carga, vazão como taxa de volume, deformação ao longo de uma peça e sensibilidade de uma saída a mudanças de entrada.',
            tone: LearningCardTone.information,
          ),
        ],
      ),

      LessonSectionData(number: '3', title: 'Movimento retilíneo', blocks: [
        ConceptBlockData(visual: LessonVisual.engineering, title: 'Posição, velocidade e aceleração', content: 'Se s(t) é posição, então v(t)=s′(t) e a(t)=v′(t)=s″(t). Sinais e unidades são essenciais para interpretar direção e mudança de velocidade.', tone: LearningCardTone.information),
      ]),
      LessonSectionData(number: '4', title: 'Taxas relacionadas', blocks: [
        ConceptBlockData(visual: LessonVisual.transform, title: 'Variáveis mudam juntas', content: 'Quando grandezas ligadas por uma equação dependem do tempo, derivamos implicitamente em relação a t e usamos a cadeia para relacionar suas taxas.'),
      ]),
      LessonSectionData(number: '5', title: 'Otimização como leitura da derivada', blocks: [
        ConceptBlockData(visual: LessonVisual.graph, title: 'Candidatos a máximo e mínimo', content: 'Problemas de otimização transformam uma situação em uma função objetivo, determinam domínio relevante, encontram pontos críticos e comparam valores.'),
      ]),
      LessonSectionData(number: '6', title: 'Taxa marginal', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Economia e produção', content: 'Em modelos de custo, receita ou produção, a derivada aproxima a variação causada por uma unidade adicional. Essa interpretação marginal conecta Cálculo a Economia e Engenharia.'),
      ]),
      LessonSectionData(number: '7', title: 'Problema cumulativo', blocks: [
        WorkedExampleBlockData(title: 'Movimento completo', problem: 's(t)=t³−6t²+9t. Encontre velocidade e aceleração.', steps: ['Derive s: v(t)=3t²−12t+9.','Derive novamente: a(t)=6t−12.','Interprete zeros de v como instantes de repouso.'], result: 'v(t)=3t²−12t+9 e a(t)=6t−12.', interpretation: 'Derivadas sucessivas descrevem camadas diferentes do movimento.'),
      ]),
      LessonSectionData(number: '8', title: 'Base acadêmica e síntese', blocks: [
        ConceptBlockData(visual: LessonVisual.idea, title: 'Referências', content: 'Stewart, Calculus; Thomas’ Calculus; OpenStax Calculus Volume 1; Larson & Edwards, Calculus; e Guidorizzi, Um Curso de Cálculo. A unidade encerra com movimento, taxas relacionadas, otimização e interpretação marginal, consolidando a derivada como ferramenta de modelagem.', tone: LearningCardTone.success),
      ]),
    ],
    check: LessonCheckData(
      question:
          'Se s está em metros e t em segundos, qual é a unidade de s′(t)?',
      choices: ['m/s', 'm·s', 'm/s²'],
      correctIndex: 0,
      explanation:
          'A derivada divide a variação da posição pela variação do tempo.',
    ),
    takeaways: [
      'A derivada deve ser interpretada com suas unidades.',
      'Velocidade é a derivada da posição; aceleração deriva a velocidade.',
      'Avaliar a derivada em um ponto fornece uma taxa instantânea.',
      'O método termina com interpretação, não apenas com álgebra.',

      'Velocidade é derivada da posição e aceleração é derivada da velocidade.',
      'Taxas relacionadas usam cadeia e diferenciação implícita.',
      'Otimização usa pontos críticos dentro de um modelo com domínio.',
      'A derivada marginal mede aproximadamente o efeito de uma pequena mudança na entrada.',
    ],
    closing:
        'Você concluiu a base de Derivadas. Agora pratique reconhecimento, cálculo e interpretação.',
  ),
];
