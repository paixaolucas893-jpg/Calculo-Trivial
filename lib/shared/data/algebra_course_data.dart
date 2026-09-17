import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> algebraCourseLessons = [
  CourseLessonData(
    id: 'algebra-01-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Linguagem algébrica',
    description: 'traduzindo palavras, relações e situações para a Álgebra',
    duration: '≈ 12 min',
    objective:
        'traduzir frases e situações para expressões algébricas e interpretar o significado de expressões escritas com símbolos',
    symbol: 'x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Pré-requisito',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'O que você já precisa saber',
            content:
                'Nas aulas anteriores, você conheceu variáveis, constantes, coeficientes, termos e expressões. Agora vamos usar esses elementos para representar relações descritas com palavras.',
            emphasis:
                'Aqui a pergunta deixa de ser apenas “o que significa x?” e passa a ser “como escrevo matematicamente uma situação?”.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Álgebra é uma linguagem',
            content:
                'Assim como uma frase comunica uma ideia usando palavras, uma expressão algébrica comunica uma relação usando números, letras e operações. A habilidade central desta aula é passar de uma linguagem para a outra sem mudar o significado.',
            emphasis:
                'Traduzir corretamente é mais importante do que decorar símbolos.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Uma quantidade desconhecida',
            content:
                'Quando um problema diz “um número” e não informa qual é esse número, podemos representá-lo por uma variável. Por exemplo, podemos chamar esse número de x.',
            emphasis:
                '“Um número” → x. A letra escolhida pode mudar; o importante é deixar claro o que ela representa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Palavras que indicam operações',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Adição e subtração',
            content:
                'Expressões como “a soma de x e 5” e “x aumentado em 5” representam x + 5. Já “x diminuído de 5” representa x − 5.',
            emphasis:
                'As palavras mudam, mas a relação matemática pode ser a mesma.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Multiplicação',
            content:
                'O dobro de x é 2x. O triplo de x é 3x. O quádruplo de x é 4x. Quando um número aparece junto de uma variável, a multiplicação geralmente é escrita sem o símbolo ×.',
            emphasis: '2x significa 2 · x.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Divisão',
            content:
                'A metade de x pode ser escrita como x/2. A terça parte de x é x/3. O quociente entre x e y pode ser representado por x/y, desde que y seja diferente de zero.',
            emphasis: 'A ordem importa: x/y geralmente não é igual a y/x.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Potências',
            content:
                'O quadrado de x é x². O cubo de x é x³. Já o quadrado da soma de x e y é (x + y)².',
            emphasis: 'x² + y² e (x + y)² representam expressões diferentes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Traduza frases',
        blocks: [
          WorkedExampleBlockData(
            title: 'Do português para a Álgebra',
            problem:
                'Escreva algebricamente: “o triplo de um número aumentado em 5”.',
            steps: [
              'Escolha uma variável para representar o número. Vamos usar x.',
              'O triplo do número é 3x.',
              'A expressão diz que esse resultado é aumentado em 5.',
              'Adicione 5: 3x + 5.',
            ],
            result: 'A expressão é 3x + 5.',
            interpretation:
                'Primeiro identificamos a quantidade desconhecida; depois traduzimos as operações na ordem descrita.',
          ),
          WorkedExampleBlockData(
            title: 'Metade de uma quantidade',
            problem:
                'Escreva algebricamente: “a metade da soma de um número com 8”.',
            steps: [
              'Represente o número por x.',
              'A soma do número com 8 é x + 8.',
              'Queremos a metade de toda essa soma.',
              'Use parênteses para manter a soma agrupada: (x + 8)/2.',
            ],
            result: 'A expressão é (x + 8)/2.',
            interpretation:
                'Os parênteses mostram que primeiro consideramos a soma completa e depois dividimos por 2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'A ordem das palavras importa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '“5 a menos que x” não é “5 menos x”',
            content:
                'A frase “5 a menos que x” significa retirar 5 de x, portanto x − 5. Já “5 menos x” significa começar em 5 e retirar x, portanto 5 − x.',
            emphasis:
                'x − 5 e 5 − x geralmente produzem resultados diferentes.',
          ),
          WorkedExampleBlockData(
            title: 'Compare as duas frases',
            problem: 'Traduza “7 a menos que um número” e “7 menos um número”.',
            steps: [
              'Represente o número por x.',
              '“7 a menos que um número” significa retirar 7 de x: x − 7.',
              '“7 menos um número” começa em 7 e retira x: 7 − x.',
              'Compare as expressões: a ordem foi invertida.',
            ],
            result: 'As expressões são x − 7 e 7 − x.',
            interpretation:
                'Na subtração, trocar a ordem dos termos muda o significado.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Parênteses mudam o significado',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '2x + 3 e 2(x + 3)',
            content:
                'Em 2x + 3, apenas x é multiplicado por 2. Em 2(x + 3), toda a soma x + 3 é multiplicada por 2.',
            emphasis: '2(x + 3) = 2x + 6, portanto não é igual a 2x + 3.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'x² + 4 e (x + 2)²',
            content:
                'x² + 4 significa somar 4 ao quadrado de x. Já (x + 2)² significa elevar toda a soma ao quadrado.',
            emphasis: '(x + 2)² = x² + 4x + 4, e não x² + 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Números consecutivos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Como representar números consecutivos',
            content:
                'Se x representa um número inteiro, o próximo inteiro é x + 1. O seguinte é x + 2. Assim, três números inteiros consecutivos podem ser representados por x, x + 1 e x + 2.',
            emphasis:
                'Não precisamos conhecer os números para representar a relação entre eles.',
          ),
          WorkedExampleBlockData(
            title: 'Soma de números consecutivos',
            problem: 'Represente a soma de dois números inteiros consecutivos.',
            steps: [
              'Represente o primeiro inteiro por x.',
              'O inteiro seguinte é x + 1.',
              'Some os dois números: x + (x + 1).',
              'Se desejar simplificar, combine os termos: 2x + 1.',
            ],
            result: 'A soma pode ser escrita como x + (x + 1) = 2x + 1.',
            interpretation:
                'A expressão mostra uma propriedade importante: a soma de dois inteiros consecutivos é sempre ímpar.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Modele uma situação real',
        blocks: [
          WorkedExampleBlockData(
            title: 'Corrida por aplicativo',
            problem:
                'Uma corrida cobra uma taxa fixa de R\$ 6,00 mais R\$ 2,50 por quilômetro percorrido. Escreva uma expressão para o custo da corrida.',
            steps: [
              'Defina x como a quantidade de quilômetros percorridos.',
              'O custo variável é R\$ 2,50 por quilômetro: 2,5x.',
              'Existe também uma taxa fixa de R\$ 6,00.',
              'Some as duas partes: 6 + 2,5x.',
            ],
            result: 'O custo pode ser representado por C = 6 + 2,5x.',
            interpretation:
                'O número 6 representa a parte fixa; 2,5x representa a parte que varia com a distância.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Uma expressão pode representar um modelo',
            content:
                'Quando relacionamos uma expressão a uma situação real, cada símbolo ganha significado. A variável representa uma grandeza e os números representam relações entre as grandezas.',
            emphasis:
                'Essa ideia será fundamental quando começarmos a estudar funções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Leia a Álgebra de volta',
        blocks: [
          WorkedExampleBlockData(
            title: 'Dos símbolos para as palavras',
            problem: 'Interprete a expressão 4x − 9.',
            steps: [
              'Identifique 4x como quatro vezes x.',
              'Isso pode ser dito como “o quádruplo de um número”.',
              'Depois aparece a subtração de 9.',
              'Junte as ideias em uma frase.',
            ],
            result:
                'Uma interpretação possível é: “o quádruplo de um número menos 9”.',
            interpretation:
                'Uma mesma expressão pode admitir diferentes frases equivalentes, desde que preservem exatamente as mesmas operações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Erros comuns',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Trocar soma por multiplicação',
            content:
                '“Um número aumentado em 4” é x + 4. Não é 4x. Já “quatro vezes um número” é 4x.',
            emphasis:
                'Procure identificar qual operação a frase realmente descreve.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar o agrupamento',
            content:
                '“O dobro da soma de x com 3” é 2(x + 3). Escrever 2x + 3 muda a situação.',
            emphasis:
                'Palavras como “da soma”, “da diferença” e “do produto” costumam indicar que uma expressão inteira precisa permanecer agrupada.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Inverter uma subtração',
            content:
                'A subtração não é comutativa. Portanto, interpretar corretamente expressões como “3 a menos que x” é essencial.',
            emphasis:
                'Sempre pergunte: de qual quantidade estou retirando a outra?',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Exercício guiado 1',
            problem: 'Represente “o dobro de um número somado com 7”.',
            steps: [
              'Represente o número por x.',
              'O dobro do número é 2x.',
              'Some 7.',
            ],
            result: '2x + 7.',
            interpretation:
                'A multiplicação está associada apenas ao número representado por x.',
          ),
          WorkedExampleBlockData(
            title: 'Exercício guiado 2',
            problem: 'Represente “o triplo da diferença entre um número e 4”.',
            steps: [
              'Represente o número por x.',
              'A diferença entre o número e 4 é x − 4.',
              'O triplo de toda a diferença exige agrupamento.',
              'Multiplique a expressão inteira por 3.',
            ],
            result: '3(x − 4).',
            interpretation:
                'Os parênteses preservam a diferença antes da multiplicação.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Pratique sozinho',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Tente antes de olhar qualquer solução',
            content:
                '1. Escreva “a terça parte de um número mais 5”.\n'
                '2. Escreva “o quadrado da diferença entre x e 3”.\n'
                '3. Represente três inteiros consecutivos.\n'
                '4. Interprete em palavras a expressão 5x + 2.\n'
                '5. Uma academia cobra R\$ 40 de matrícula e R\$ 65 por mês. Escreva uma expressão para o custo após x meses.',
            emphasis:
                'O objetivo é identificar a estrutura da situação antes de fazer qualquer cálculo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Conexão com o que vem depois',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Da expressão para a função',
            content:
                'Quando uma expressão descreve como uma quantidade depende de outra, estamos muito próximos da ideia de função. Por exemplo, C = 6 + 2,5x relaciona distância e custo.',
            emphasis:
                'Aprender a traduzir situações agora facilitará equações, funções, modelagem e problemas de Cálculo mais adiante.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Qual expressão representa “o dobro da soma de um número x com 5”?',
      choices: ['2x + 5', '2(x + 5)', 'x + 10'],
      correctIndex: 1,
      explanation:
          'A frase pede o dobro de toda a soma x + 5. Por isso, primeiro agrupamos x + 5 e depois multiplicamos por 2: 2(x + 5).',
    ),
    takeaways: [
      'A Álgebra é uma linguagem para representar relações.',
      'Uma variável pode representar uma quantidade desconhecida ou variável.',
      'Palavras diferentes podem indicar a mesma operação matemática.',
      'Na subtração e na divisão, a ordem das quantidades importa.',
      'Parênteses indicam que uma expressão inteira deve ser tratada como um grupo.',
      'Situações reais podem ser representadas por expressões algébricas.',
      'Traduzir entre palavras e símbolos prepara o caminho para equações e funções.',
    ],
    closing:
        'Você não está apenas manipulando letras: está aprendendo a transformar situações e relações em matemática.',
  ),
  CourseLessonData(
    id: 'algebra-02-termos-semelhantes',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Termos semelhantes',
    description: 'coeficientes, parte literal e redução de expressões',
    duration: '≈ 12 min',
    objective:
        'identificar termos semelhantes e simplificar expressões algébricas combinando corretamente seus coeficientes',
    symbol: '3x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Pré-requisito',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'O que você já precisa saber',
            content:
                'Antes de combinar termos, você precisa reconhecer variável, coeficiente, termo, constante e parte literal de uma expressão algébrica.',
            emphasis:
                'Nesta aula, não vamos mudar a parte literal: vamos aprender quando os coeficientes podem ser combinados.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Só podemos combinar termos da mesma espécie',
            content:
                'Termos semelhantes possuem exatamente a mesma parte literal, com as mesmas variáveis elevadas aos mesmos expoentes. Assim, 4x e −7x são semelhantes, porque ambos têm parte literal x.',
            emphasis:
                'Para decidir se dois termos são semelhantes, ignore temporariamente os coeficientes e compare apenas a parte literal.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Coeficiente e parte literal',
            content:
                'Em 5x², o coeficiente é 5 e a parte literal é x². Em −3xy, o coeficiente é −3 e a parte literal é xy.',
            emphasis:
                'Os coeficientes podem ser diferentes. O que precisa coincidir é a parte literal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Como reconhecer termos semelhantes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Compare as partes literais',
            content:
                'Os termos 3x² e −8x² são semelhantes. Os termos 5xy e 2xy também são semelhantes. Porém, x e x² não são semelhantes, assim como xy e x²y não são.',
            emphasis: 'Mesmas variáveis e mesmos expoentes: essa é a condição.',
          ),
          WorkedExampleBlockData(
            title: 'Classificando termos',
            problem:
                'Entre 4x², −3x, 7x², 5 e 2x, identifique os grupos de termos semelhantes.',
            steps: [
              'Compare as partes literais.',
              '4x² e 7x² possuem parte literal x².',
              '−3x e 2x possuem parte literal x.',
              'O número 5 é um termo constante.',
            ],
            result: 'Os grupos são {4x², 7x²}, {−3x, 2x} e {5}.',
            interpretation:
                'Cada grupo pode ser combinado internamente, mas não com os outros grupos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Reduza termos semelhantes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Some ou subtraia apenas os coeficientes',
            content:
                'Quando dois termos são semelhantes, mantemos a parte literal e operamos apenas os coeficientes.',
            emphasis:
                '3x + 5x = 8x porque 3 + 5 = 8 e a parte literal x permanece.',
          ),
          WorkedExampleBlockData(
            title: 'Redução passo a passo',
            problem: 'Simplifique 6x² − 3x + 5x² + 8x − 4.',
            steps: [
              'Agrupe os termos em x²: 6x² + 5x².',
              'Agrupe os termos em x: −3x + 8x.',
              'A constante −4 permanece separada.',
              'Some os coeficientes dos termos quadráticos: 6 + 5 = 11.',
              'Some os coeficientes dos termos lineares: −3 + 8 = 5.',
            ],
            result: 'A forma reduzida é 11x² + 5x − 4.',
            interpretation:
                'Nenhum expoente foi alterado. Apenas os coeficientes dos termos compatíveis foram combinados.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Sinais exigem atenção',
        blocks: [
          WorkedExampleBlockData(
            title: 'Coeficientes negativos',
            problem: 'Simplifique −7x + 4x − 2x.',
            steps: [
              'Todos os termos têm a mesma parte literal x.',
              'Combine os coeficientes: −7 + 4 − 2.',
              'Calcule: −7 + 4 = −3.',
              'Depois: −3 − 2 = −5.',
            ],
            result: 'A expressão simplificada é −5x.',
            interpretation:
                'O sinal pertence ao coeficiente e deve acompanhar o termo durante toda a operação.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Constantes também são termos semelhantes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Constantes combinam com constantes',
            content:
                'Números sem variável podem ser combinados entre si. Por exemplo, em 3x + 7 − 2 + 5x, os termos 7 e −2 são constantes e podem ser reduzidos para 5.',
            emphasis:
                'Uma constante não pode ser combinada com um termo que possui variável.',
          ),
          WorkedExampleBlockData(
            title: 'Variáveis e constantes',
            problem: 'Simplifique 2x + 5 + 3x − 8.',
            steps: [
              'Agrupe os termos em x: 2x + 3x.',
              'Agrupe as constantes: 5 − 8.',
              'Calcule: 5x e −3.',
            ],
            result: 'A expressão reduzida é 5x − 3.',
            interpretation:
                'Cada tipo de termo é tratado dentro de seu próprio grupo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Mais de uma variável',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A ordem escrita não muda o produto',
            content:
                'Os termos 3xy e 5yx são semelhantes, porque xy = yx. Já 3x²y e 5xy² não são semelhantes, pois os expoentes das variáveis são diferentes.',
            emphasis: 'Compare variável por variável e expoente por expoente.',
          ),
          WorkedExampleBlockData(
            title: 'Expressão com x e y',
            problem: 'Simplifique 4xy − 2x² + 3xy + 5x².',
            steps: [
              'Agrupe os termos xy: 4xy + 3xy.',
              'Agrupe os termos x²: −2x² + 5x².',
              'Combine os coeficientes de cada grupo.',
            ],
            result: 'A forma reduzida é 7xy + 3x².',
            interpretation:
                'Apesar de haver duas variáveis na expressão, a regra continua sendo comparar a parte literal completa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Erros comuns',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Somar termos com expoentes diferentes',
            content:
                'x e x² não são termos semelhantes. Portanto, x + x² não pode ser reduzido para 2x² nem para 2x³.',
            emphasis:
                'Expoentes diferentes significam partes literais diferentes.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Somar coeficiente com expoente',
            content:
                'Em 3x² + 5x², somamos 3 + 5. O expoente 2 não participa dessa soma.',
            emphasis: '3x² + 5x² = 8x², e não 8x⁴.',
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Perder o sinal do termo',
            content:
                'Em −4x + 7x, o primeiro coeficiente é −4. Ignorar esse sinal muda completamente o resultado.',
            emphasis: 'O sinal faz parte do coeficiente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Exercício guiado 1',
            problem: 'Simplifique 5a + 2a − 3.',
            steps: [
              '5a e 2a são semelhantes.',
              'Some os coeficientes: 5 + 2 = 7.',
              'A constante −3 permanece.',
            ],
            result: '7a − 3.',
            interpretation:
                'Só os termos com a mesma parte literal foram combinados.',
          ),
          WorkedExampleBlockData(
            title: 'Exercício guiado 2',
            problem: 'Simplifique 3x² + 4x − x² + 2x + 6.',
            steps: [
              'Agrupe x²: 3x² − x².',
              'Agrupe x: 4x + 2x.',
              'Mantenha a constante 6.',
              'Reduza cada grupo.',
            ],
            result: '2x² + 6x + 6.',
            interpretation:
                'Organizar a expressão por grupos reduz bastante a chance de erro.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Pratique sozinho',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Tente antes de consultar qualquer solução',
            content:
                '1. Simplifique 7x + 2x − 5.\n'
                '2. Simplifique 4a² − 3a + 6a² + a.\n'
                '3. Simplifique 5xy − 2xy + 3x².\n'
                '4. Explique por que 3x e 3x² não são termos semelhantes.\n'
                '5. Simplifique −8y + 3 + 5y − 10.',
            emphasis:
                'Antes de calcular, marque quais termos pertencem ao mesmo grupo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com o que vem depois',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Reduzir antes de avançar',
            content:
                'A capacidade de reconhecer e combinar termos semelhantes será usada constantemente na distributiva, em polinômios, equações, funções e expressões que aparecem em Cálculo.',
            emphasis:
                'Quanto mais cedo uma expressão é organizada corretamente, menor a chance de erro nas etapas seguintes.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a forma reduzida de 4x² − 3x + 2x² + 5x − 7?',
      choices: ['6x² + 2x − 7', '6x⁴ + 2x − 7', '6x² + 8x − 7'],
      correctIndex: 0,
      explanation:
          '4x² e 2x² são semelhantes, resultando em 6x². −3x e 5x também são semelhantes, resultando em 2x. A constante −7 permanece.',
    ),
    takeaways: [
      'Termos semelhantes têm exatamente a mesma parte literal.',
      'Os coeficientes podem ser diferentes.',
      'Para reduzir termos semelhantes, operamos apenas os coeficientes.',
      'A parte literal e seus expoentes permanecem inalterados.',
      'Constantes podem ser combinadas com constantes.',
      'Sinais fazem parte dos coeficientes.',
      'Termos com expoentes diferentes não podem ser combinados.',
    ],
    closing:
        'Reconhecer termos semelhantes transforma expressões aparentemente longas em estruturas muito mais simples e organizadas.',
  ),
  CourseLessonData(
    id: 'algebra-03-distributiva',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Distributiva e sinais',
    description: 'parênteses, produtos e sinais negativos',
    duration: '≈ 5 min',
    objective:
        'aplicar a propriedade distributiva sem perder sinais dentro dos parênteses',
    symbol: 'a(b+c)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Distribuir é atravessar o parêntese',
            content:
                'Na forma a(b + c), o fator a multiplica cada termo interno. Assim, a(b + c) = ab + ac. Se houver subtração, o sinal do termo também participa da multiplicação.',
            emphasis:
                'O erro clássico é multiplicar apenas o primeiro termo e esquecer o segundo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Parêntese com sinal negativo',
            problem: 'Simplifique −2(x − 5) + 3x.',
            steps: [
              'Distribua −2: −2x + 10.',
              'Some o termo restante: −2x + 10 + 3x.',
              'Combine termos semelhantes: x + 10.',
            ],
            result: 'A expressão simplificada é x + 10.',
            interpretation:
                'O termo −5 virou +10 porque negativo vezes negativo é positivo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a forma de 3(x − 4)?',
      choices: ['3x − 4', '3x − 12', 'x − 12'],
      correctIndex: 1,
      explanation: 'O 3 multiplica x e também −4, então 3(x − 4) = 3x − 12.',
    ),
    takeaways: [
      'Distributiva conecta multiplicação e soma.',
      'Todos os termos internos devem ser multiplicados.',
      'Sinais negativos precisam ser carregados com atenção.',
      'Depois da distributiva, reduza termos semelhantes.',
    ],
    closing:
        'A distributiva é uma das ferramentas mais usadas para preparar expressões antes do Cálculo.',
  ),
  CourseLessonData(
    id: 'algebra-04-potencias',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Potências e expoentes',
    description: 'regras de multiplicação e divisão',
    duration: '≈ 5 min',
    objective:
        'usar propriedades de potências para simplificar monômios e expressões algébricas',
    symbol: 'x²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Mesma base, regra certa',
            content:
                'Em produtos de potências de mesma base, somamos expoentes: x²·x³ = x⁵. Em quocientes, subtraímos expoentes, desde que a base não seja zero: x⁵/x² = x³.',
            emphasis: 'Não some bases. O que muda é o expoente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Coeficiente e variável',
            problem: 'Simplifique (−2x³)².',
            steps: [
              'Eleve o coeficiente: (−2)² = 4.',
              'Multiplique o expoente da variável: (x³)² = x⁶.',
              'Junte as partes: 4x⁶.',
            ],
            result: 'A forma simplificada é 4x⁶.',
            interpretation:
                'O quadrado torna o coeficiente positivo e dobra o expoente da variável.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o resultado de x⁴·x²?',
      choices: ['x⁶', 'x⁸', '2x⁶'],
      correctIndex: 0,
      explanation:
          'As bases são iguais, então somamos os expoentes: 4 + 2 = 6.',
    ),
    takeaways: [
      'Produto de mesma base soma expoentes.',
      'Quociente de mesma base subtrai expoentes.',
      'Potência de potência multiplica expoentes.',
      'Coeficientes também seguem as regras de sinais.',
    ],
    closing:
        'Potências bem dominadas simplificam polinômios, funções e limites.',
  ),
  CourseLessonData(
    id: 'algebra-09-monomios-polinomios',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Monômios e polinômios',
    description: 'termos, coeficientes, grau e classificação',
    duration: '≈ 10 min',
    objective:
        'reconhecer monômios e polinômios, identificar seus elementos, classificá-los e determinar seus graus',
    symbol: 'P(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a estrutura',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Um polinômio é formado por termos',
            content:
                'Expressões como 4x³ − 2x + 7 são formadas por termos separados por adição ou subtração. Cada termo pode conter um coeficiente numérico e uma parte literal formada por variáveis elevadas a expoentes inteiros não negativos.',
            emphasis:
                'Antes de operar com polinômios, é preciso saber reconhecer exatamente quais são seus termos e como cada termo é construído.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Coeficiente e parte literal',
            content:
                'No monômio −5x²y, o coeficiente é −5 e a parte literal é x²y. Se não aparece número escrito antes da parte literal, o coeficiente pode ser 1 ou −1, dependendo do sinal.',
            emphasis: 'Em x³, o coeficiente é 1. Em −x², o coeficiente é −1.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Classifique corretamente',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Monômio, binômio, trinômio e polinômio',
            content:
                'Uma expressão com um único termo é um monômio. Com dois termos, é um binômio. Com três termos, é um trinômio. A palavra polinômio é usada de forma geral para expressões formadas por um ou mais termos polinomiais.',
            emphasis: '3x² é monômio; x + 4 é binômio; x² − 3x + 2 é trinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Determine o grau',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Grau de um monômio',
            content:
                'O grau de um monômio é a soma dos expoentes de suas variáveis. Em 4x³y², o grau é 3 + 2 = 5.',
            emphasis: 'Uma constante não nula, como 7, tem grau 0.',
          ),
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Grau de um polinômio',
            content:
                'O grau de um polinômio é o maior grau entre seus termos depois que termos semelhantes já foram combinados.',
            emphasis:
                'Em 2x⁴ − 3x² + x − 9, o maior expoente de x é 4; portanto, o polinômio tem grau 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Analisando um polinômio completo',
            problem: 'Analise 3x³ − 5x² + 2x − 8.',
            steps: [
              'Identifique os termos: 3x³, −5x², 2x e −8.',
              'Identifique os coeficientes: 3, −5, 2 e −8.',
              'Conte os termos: existem quatro termos.',
              'Compare os graus: 3, 2, 1 e 0.',
              'O maior grau é 3.',
            ],
            result: 'É um polinômio de grau 3 com quatro termos.',
            interpretation:
                'Reconhecer essa estrutura será essencial para somar, multiplicar, fatorar e estudar funções polinomiais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Forma reduzida e ordenada',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Primeiro reduza, depois organize',
            content:
                'Um polinômio está na forma reduzida quando não há termos semelhantes que ainda possam ser combinados. Ele costuma ser escrito em ordem decrescente de grau para facilitar leitura e operações.',
            emphasis:
                '2x + 3x² − x + 4 pode ser reduzido e ordenado como 3x² + x + 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Nem toda expressão algébrica é um polinômio',
            content:
                'Expressões com variável no denominador, expoente negativo ou variável dentro de uma raiz não são polinômios na variável considerada.',
            emphasis: '1/x, x⁻² e √x não são polinômios em x.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o grau do polinômio 5x⁴ − 2x² + 7x − 3?',
      choices: ['2', '3', '4'],
      correctIndex: 2,
      explanation:
          'O grau do polinômio é o maior expoente presente após a expressão estar reduzida. O maior expoente é 4.',
    ),
    takeaways: [
      'Monômios possuem um único termo.',
      'Coeficiente é a parte numérica do termo.',
      'O grau de um monômio é a soma dos expoentes de suas variáveis.',
      'O grau de um polinômio é o maior grau entre seus termos.',
      'Polinômios devem ser reduzidos e podem ser organizados por grau.',
      'Nem toda expressão algébrica é um polinômio.',
    ],
    closing:
        'Agora que você reconhece a estrutura dos polinômios, o próximo passo é aprender a operar com eles.',
  ),
  CourseLessonData(
    id: 'algebra-10-operacoes-polinomios',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Operações com polinômios',
    description: 'soma, subtração e multiplicação',
    duration: '≈ 12 min',
    objective:
        'somar, subtrair e multiplicar polinômios usando termos semelhantes, distributiva e propriedades de potências',
    symbol: 'P(x)+Q(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Somar e subtrair polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Combine apenas termos semelhantes',
            content:
                'Na soma ou subtração de polinômios, agrupamos apenas termos que possuem a mesma parte literal e os mesmos expoentes. Os coeficientes são somados ou subtraídos, enquanto a parte literal permanece.',
            emphasis:
                '3x² + 5x² = 8x², mas 3x² + 5x não pode ser reduzido a um único termo.',
          ),
          WorkedExampleBlockData(
            title: 'Somando dois polinômios',
            problem: 'Calcule (3x² + 2x − 4) + (x² − 5x + 7).',
            steps: [
              'Agrupe os termos de mesmo grau.',
              'Some os termos quadráticos: 3x² + x² = 4x².',
              'Some os termos lineares: 2x − 5x = −3x.',
              'Some as constantes: −4 + 7 = 3.',
            ],
            result: 'O resultado é 4x² − 3x + 3.',
            interpretation:
                'A soma de polinômios depende diretamente do reconhecimento de termos semelhantes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Cuidado com a subtração',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'O sinal negativo afeta todo o segundo polinômio',
            content:
                'Ao subtrair um polinômio, o sinal negativo deve ser distribuído para todos os seus termos antes de combinar termos semelhantes.',
            emphasis: '(2x² + 3x) − (x² − 4x + 1) = 2x² + 3x − x² + 4x − 1.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Multiplicação por monômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Distribua e use as propriedades das potências',
            content:
                'Quando um monômio multiplica um polinômio, ele deve multiplicar cada termo. Multiplicamos os coeficientes e, para bases iguais, somamos os expoentes.',
            emphasis: '2x(3x² − 4x + 5) = 6x³ − 8x² + 10x.',
          ),
          WorkedExampleBlockData(
            title: 'Multiplicando monômios',
            problem: 'Calcule (−3x²)(2x).',
            steps: [
              'Multiplique os coeficientes: −3·2 = −6.',
              'Multiplique as potências de mesma base: x²·x = x³.',
              'Junte coeficiente e parte literal.',
            ],
            result: 'O produto é −6x³.',
            interpretation:
                'Essa operação combina regra de sinais com propriedade de potências.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Multiplicação de polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Cada termo multiplica cada termo',
            content:
                'Na multiplicação de dois polinômios, aplicamos a propriedade distributiva repetidamente. Depois, reduzimos os termos semelhantes.',
            emphasis: '(x + 2)(x + 3) = x² + 3x + 2x + 6 = x² + 5x + 6.',
          ),
          WorkedExampleBlockData(
            title: 'Binômio vezes binômio',
            problem: 'Multiplique (2x − 1)(x + 4).',
            steps: [
              'Multiplique 2x por x: 2x².',
              'Multiplique 2x por 4: 8x.',
              'Multiplique −1 por x: −x.',
              'Multiplique −1 por 4: −4.',
              'Combine os termos semelhantes: 8x − x = 7x.',
            ],
            result: 'O produto é 2x² + 7x − 4.',
            interpretation:
                'A distributiva organiza a multiplicação antes da redução dos termos semelhantes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Divisão de monômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Divida coeficientes e subtraia expoentes',
            content:
                'Quando dividimos monômios, dividimos os coeficientes e usamos a regra do quociente para bases iguais, sempre respeitando a condição de que o denominador não seja zero.',
            emphasis: '(12x³y²)/(3xy) = 4x²y, com x ≠ 0 e y ≠ 0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não combine termos diferentes',
            content:
                'Depois de uma multiplicação, só podemos reduzir termos realmente semelhantes. Expoentes diferentes representam termos diferentes.',
            emphasis: 'x² + 3x não é 4x² nem 4x³.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o resultado de (x + 2)(x + 5)?',
      choices: ['x² + 7x + 10', 'x² + 10x + 7', 'x² + 7'],
      correctIndex: 0,
      explanation:
          'Aplicando a distributiva: x² + 5x + 2x + 10 = x² + 7x + 10.',
    ),
    takeaways: [
      'Soma e subtração exigem termos semelhantes.',
      'Na subtração, distribua corretamente o sinal negativo.',
      'Um monômio deve multiplicar todos os termos do polinômio.',
      'Na multiplicação de polinômios, cada termo multiplica cada termo.',
      'Depois da multiplicação, reduza os termos semelhantes.',
      'Na divisão de monômios, divida coeficientes e subtraia expoentes de bases iguais.',
    ],
    closing:
        'Com as operações dominadas, produtos notáveis deixam de parecer fórmulas isoladas e passam a ser padrões da própria multiplicação algébrica.',
  ),
  CourseLessonData(
    id: 'algebra-05-produtos-notaveis',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Produtos notáveis',
    description: 'padrões que aceleram cálculos',
    duration: '≈ 5 min',
    objective:
        'reconhecer quadrados, diferença de quadrados e produtos binomiais comuns',
    symbol: '(a+b)²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Produto notável é distributiva memorizada com sentido',
            content:
                'Produtos notáveis não são truques soltos. Eles nascem da distributiva e aparecem tantas vezes que vale reconhecer o padrão rapidamente.',
            emphasis: '(a + b)² = a² + 2ab + b², não apenas a² + b².',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Expandindo com padrão',
            problem: 'Desenvolva (x − 5)².',
            steps: [
              'Use (a − b)² = a² − 2ab + b².',
              'Aqui, a = x e b = 5.',
              'Substitua: x² − 2·x·5 + 25.',
            ],
            result: 'O resultado é x² − 10x + 25.',
            interpretation:
                'O termo do meio aparece porque o binômio foi multiplicado por ele mesmo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o desenvolvimento de (x + 3)²?',
      choices: ['x² + 9', 'x² + 6x + 9', 'x² + 3x + 9'],
      correctIndex: 1,
      explanation:
          'O termo do meio é 2·x·3 = 6x. Por isso, (x + 3)² = x² + 6x + 9.',
    ),
    takeaways: [
      'Produtos notáveis vêm da distributiva.',
      'Quadrado da soma possui termo do meio.',
      'Diferença de quadrados fatora como (a − b)(a + b).',
      'Reconhecer padrões acelera simplificações.',
    ],
    closing:
        'Produtos notáveis são atalhos seguros quando você sabe de onde eles vieram.',
  ),
  CourseLessonData(
    id: 'algebra-06-fatoracao',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Fatoração',
    description: 'colocar expressões em forma de produto',
    duration: '≈ 5 min',
    objective:
        'fatorar expressões por fator comum, agrupamento e padrões notáveis',
    symbol: '(x−a)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Da soma para o produto',
            content:
                'Fatorar significa escrever uma expressão como multiplicação de fatores. Isso revela raízes, cancela frações algébricas e resolve limites com indeterminação.',
            emphasis:
                'Em Cálculo, fatorar muitas vezes transforma um problema travado em uma conta simples.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Fator comum em evidência',
            problem: 'Fatore 8x² − 12x.',
            steps: [
              'Encontre o maior fator comum: 4x.',
              'Divida cada termo por 4x: 8x²/(4x) = 2x e −12x/(4x) = −3.',
              'Escreva o produto: 4x(2x − 3).',
            ],
            result: 'A fatoração é 4x(2x − 3).',
            interpretation:
                'Se distribuir 4x de volta, recuperamos a expressão original.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a fatoração de x² − 16?',
      choices: ['(x − 4)(x + 4)', '(x − 8)(x + 8)', '(x − 4)²'],
      correctIndex: 0,
      explanation: 'É uma diferença de quadrados: x² − 4² = (x − 4)(x + 4).',
    ),
    takeaways: [
      'Fatorar reescreve somas como produtos.',
      'Fator comum é o primeiro padrão a procurar.',
      'Diferença de quadrados é muito frequente.',
      'Sempre confira distribuindo de volta.',
    ],
    closing:
        'A fatoração é uma ponte direta entre Álgebra, equações, funções e limites.',
  ),
  CourseLessonData(
    id: 'algebra-07-fracoes-algebricas',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Frações algébricas',
    description: 'restrições, simplificação e denominadores',
    duration: '≈ 5 min',
    objective:
        'simplificar frações algébricas preservando restrições de domínio',
    symbol: 'x/y',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Nem todo cancelamento é permitido',
            content:
                'Só podemos cancelar fatores multiplicativos comuns. Não se cancela termo dentro de soma como se fosse fator. Além disso, denominadores nunca podem ser zero.',
            emphasis:
                'Em (x + 2)/x, o x não cancela com parte do numerador, porque x + 2 é uma soma.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Cancelamento correto',
            problem: 'Simplifique (x² − 9)/(x − 3), com x ≠ 3.',
            steps: [
              'Fatore o numerador: x² − 9 = (x − 3)(x + 3).',
              'Reescreva a fração: [(x − 3)(x + 3)]/(x − 3).',
              'Cancele o fator comum x − 3, mantendo a restrição x ≠ 3.',
            ],
            result: 'A forma simplificada é x + 3, com x ≠ 3.',
            interpretation:
                'A expressão simplificada parece livre, mas a restrição original continua valendo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Em qual expressão o cancelamento de x é correto?',
      choices: ['(x + 5)/x', '(3x)/(x)', '(x − 2)/x'],
      correctIndex: 1,
      explanation:
          'Em 3x/x, o x é fator comum no numerador e no denominador. Nas outras, x aparece dentro de soma ou diferença.',
    ),
    takeaways: [
      'Denominador zero é proibido.',
      'Cancele apenas fatores, não parcelas.',
      'Fatorar antes de cancelar evita erro.',
      'Restrições originais continuam importantes.',
    ],
    closing:
        'Frações algébricas explicam muitos detalhes de domínio, continuidade e limites.',
  ),
  CourseLessonData(
    id: 'algebra-08-sintese',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Síntese algébrica',
    description: 'escolher a ferramenta certa',
    duration: '≈ 5 min',
    objective:
        'decidir quando simplificar, expandir, fatorar ou substituir valores',
    symbol: '✓',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Entenda a ideia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Não existe uma forma sempre melhor',
            content:
                'Expandir ajuda a combinar termos. Fatorar ajuda a enxergar produtos, raízes e cancelamentos. Substituir valores ajuda a conferir resultados e interpretar expressões.',
            emphasis:
                'O bom aluno de Cálculo não decora só contas; ele escolhe a forma que revela a ideia.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Do caos à forma útil',
            problem: 'Simplifique 2(x + 1) + (x − 3)(x + 3).',
            steps: [
              'Distribua o primeiro termo: 2x + 2.',
              'Use diferença de quadrados: (x − 3)(x + 3) = x² − 9.',
              'Combine: x² + 2x − 7.',
            ],
            result: 'A expressão simplificada é x² + 2x − 7.',
            interpretation:
                'Usamos distributiva e produto notável na mesma expressão.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Para simplificar (x² − 25)/(x − 5), qual ferramenta vem primeiro?',
      choices: [
        'Fatorar x² − 25',
        'Substituir x = 5',
        'Somar 25 ao denominador',
      ],
      correctIndex: 0,
      explanation:
          'A diferença de quadrados permite escrever x² − 25 como (x − 5)(x + 5), revelando o fator comum.',
    ),
    takeaways: [
      'Expandir, fatorar e substituir têm objetivos diferentes.',
      'A forma fatorada revela cancelamentos e raízes.',
      'A forma expandida facilita combinação de termos.',
      'Conferir o caminho reduz erros invisíveis.',
    ],
    closing:
        'Com essa caixa de ferramentas pronta, as próximas aulas deixam de parecer mágica e começam a parecer estratégia.',
  ),
];
