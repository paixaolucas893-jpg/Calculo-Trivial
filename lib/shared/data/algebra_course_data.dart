import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> algebraCourseLessons = [
  CourseLessonData(
    id: 'algebra-01-linguagem',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Fundamentos',
    title: 'Linguagem algébrica',
    description: 'traduzindo palavras, relações e situações para a Álgebra',
    duration: '≈ 25 min',
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
    duration: '≈ 25 min',
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
    eyebrow: 'Álgebra e fatoração',
    title: 'Propriedade distributiva e sinais',
    description:
        'expansão de produtos, remoção de parênteses, sinais negativos e equivalência algébrica',
    duration: '≈ 25 min',
    objective:
        'aplicar a propriedade distributiva em expressões com um ou mais agrupamentos, controlar sinais, reconhecer equivalências e evitar expansões inválidas',
    symbol: 'a(b+c)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A distributiva conecta produto e soma',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Definição algébrica',
            content:
                'Para números reais ou expressões algébricas compatíveis, a(b + c) = ab + ac. De modo análogo, a(b − c) = ab − ac. O fator externo multiplica cada termo do agrupamento.',
            emphasis:
                'Distribuir não é “tirar parênteses”: é preservar uma igualdade por meio da multiplicação de todos os termos internos.',
          ),
          WorkedExampleBlockData(
            title: 'Distribuição simples',
            problem: 'Expanda 4(2x − 3).',
            steps: [
              'Multiplique 4 por 2x: 4·2x = 8x.',
              'Multiplique 4 por −3: 4·(−3) = −12.',
              'Reúna os termos obtidos.',
            ],
            result: '4(2x − 3) = 8x − 12.',
            interpretation:
                'Cada termo dentro do parêntese recebe o mesmo fator externo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Sinal negativo antes do parêntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'O sinal − equivale a multiplicar por −1',
            content:
                'A expressão −(a + b) significa (−1)(a + b). Portanto, −(a + b) = −a − b. Da mesma forma, −(a − b) = −a + b.',
            emphasis:
                'Ao remover um parêntese precedido de sinal negativo, todos os sinais internos são afetados.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Controlando sinais',
            problem: 'Simplifique 5x − (2x − 7).',
            steps: [
              'Interprete o sinal externo como −1: 5x + (−1)(2x − 7).',
              'Distribua: 5x − 2x + 7.',
              'Combine termos semelhantes: 3x + 7.',
            ],
            result: '5x − (2x − 7) = 3x + 7.',
            interpretation:
                'O termo −7 tornou-se +7 porque foi multiplicado por −1.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Coeficientes literais também distribuem',
        blocks: [
          WorkedExampleBlockData(
            title: 'Fator algébrico',
            problem: 'Expanda 3x(2x² − x + 4).',
            steps: [
              '3x·2x² = 6x³.',
              '3x·(−x) = −3x².',
              '3x·4 = 12x.',
            ],
            result: '6x³ − 3x² + 12x.',
            interpretation:
                'Além da distributiva, usamos a lei xᵐ·xⁿ = xᵐ⁺ⁿ.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Dupla distributiva',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Cada termo de um fator multiplica cada termo do outro',
            content:
                'No produto (a + b)(c + d), cada termo do primeiro binômio multiplica cada termo do segundo: ac + ad + bc + bd. Essa estrutura é a base da multiplicação de polinômios e dos produtos notáveis.',
          ),
          WorkedExampleBlockData(
            title: 'Binômio vezes binômio',
            problem: 'Expanda (x + 3)(x − 5).',
            steps: [
              'x·x = x².',
              'x·(−5) = −5x.',
              '3·x = 3x.',
              '3·(−5) = −15.',
              'Combine −5x + 3x = −2x.',
            ],
            result: 'x² − 2x − 15.',
            interpretation:
                'A redução de termos semelhantes ocorre depois da expansão.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Distributiva no sentido inverso',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Expandir e fatorar são operações inversas',
            content:
                'Se ab + ac = a(b + c), então reconhecer um fator comum permite voltar da soma para o produto. Por exemplo, 6x + 9 = 3(2x + 3).',
            emphasis:
                'Essa leitura reversa prepara diretamente o estudo de fatoração.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Equivalência algébrica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Formas diferentes podem representar a mesma expressão',
            content:
                'As expressões 2(x + 4) e 2x + 8 têm o mesmo valor para todo x real. Dizemos que são identicamente equivalentes. Uma transformação algébrica válida deve preservar essa equivalência.',
          ),
          WorkedExampleBlockData(
            title: 'Verificando por substituição',
            problem: 'Compare 3(x − 2) + x e 4x − 6 em x = 5.',
            steps: [
              'Primeira expressão: 3(5 − 2) + 5 = 9 + 5 = 14.',
              'Segunda expressão: 4·5 − 6 = 20 − 6 = 14.',
              'A igualdade em um valor é uma verificação útil; a distributiva mostra que a equivalência vale para todo x.',
            ],
            result: 'Ambas produzem 14 em x = 5.',
            interpretation:
                'Testar valores ajuda a detectar erros, mas não substitui uma justificativa algébrica geral.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Distribuir apenas no primeiro termo',
            content:
                'A igualdade 3(x + 2) = 3x + 2 é falsa. O fator 3 deve multiplicar também o termo 2: 3x + 6.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir potência de soma com distributiva',
            content:
                '(a + b)² não é a² + b². O quadrado representa (a + b)(a + b), cuja expansão contém o termo 2ab.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Simplifique −2(3x − 4) + 5x.',
            steps: [
              'Distribua −2: −6x + 8.',
              'Some o termo 5x.',
              'Combine −6x + 5x = −x.',
            ],
            result: '−x + 8.',
            interpretation:
                'O sinal negativo do fator externo participa de cada produto.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Expanda (2x − 1)(x + 4).',
            steps: [
              '2x·x = 2x².',
              '2x·4 = 8x.',
              '−1·x = −x.',
              '−1·4 = −4.',
              'Combine 8x − x = 7x.',
            ],
            result: '2x² + 7x − 4.',
            interpretation:
                'A dupla distributiva gera quatro produtos antes da redução.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Expanda ou simplifique, justificando os sinais',
            content:
                '1. 5(x + 2).\n'
                '2. −3(x − 4).\n'
                '3. 2a(3a + 5).\n'
                '4. 7 − (2x + 1).\n'
                '5. 4x − 2(x − 3).\n'
                '6. 3(2x + 1) − 5x.\n'
                '7. (x + 2)(x + 5).\n'
                '8. (x − 4)(x + 3).\n'
                '9. (2x + 1)(x − 2).\n'
                '10. −(a − b + c).\n'
                '11. Verifique se 4(x + 1) e 4x + 1 são equivalentes.\n'
                '12. Fatore 8x + 12 usando a distributiva ao contrário.\n'
                '13. Explique por que (x + 2)² não é x² + 4.\n'
                '14. Simplifique 2(x + 3) − 3(x − 1).\n'
                '15. Expanda (3x − 2)(2x + 5).',
            emphasis:
                'Em produtos de dois polinômios, registre todos os produtos antes de combinar termos semelhantes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Expandir ou fatorar muda o que conseguimos enxergar',
            content:
                'Em limites e derivadas, uma expressão pode precisar ser expandida para combinar termos ou fatorada para revelar cancelamentos. A distributiva é a ponte entre essas duas formas.',
            emphasis:
                'Manipulação algébrica correta evita que um erro de sinal contamine uma solução inteira de Cálculo.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a forma expandida de −2(x − 5)?',
      choices: ['−2x − 10', '−2x + 10', '2x − 10'],
      correctIndex: 1,
      explanation:
          '−2 multiplica os dois termos: −2·x = −2x e −2·(−5) = +10.',
    ),
    takeaways: [
      'A distributiva multiplica o fator externo por todos os termos internos.',
      'Um sinal negativo diante de parênteses equivale a multiplicar por −1.',
      'Dupla distributiva multiplica cada termo de um fator por cada termo do outro.',
      'Expandir e fatorar são leituras opostas da mesma propriedade.',
      'Transformações válidas preservam equivalência algébrica.',
      'Erros de sinal são especialmente perigosos em expressões longas.',
    ],
    closing:
        'Dominar a distributiva significa controlar a estrutura da expressão, não apenas remover parênteses.',
  )
  CourseLessonData(
    id: 'algebra-04-potencias',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Álgebra e fatoração',
    title: 'Potências em expressões algébricas',
    description:
        'leis de expoentes aplicadas a monômios, coeficientes e simplificação algébrica',
    duration: '≈ 25 min',
    objective:
        'aplicar leis de expoentes a expressões algébricas, distinguir operações válidas e inválidas e simplificar produtos, quocientes e potências de monômios com domínio apropriado',
    symbol: 'xⁿ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Revisão estrutural',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Base, expoente e coeficiente',
            content:
                'Em 3x⁴, o coeficiente é 3 e a parte literal é x⁴. O expoente 4 atua sobre x, não sobre o coeficiente 3. Já em (3x)⁴, toda a base 3x está elevada à quarta potência.',
            emphasis:
                'Parênteses determinam exatamente qual objeto recebe o expoente.',
          ),
          WorkedExampleBlockData(
            title: 'Compare duas expressões',
            problem: 'Compare 3x² e (3x)².',
            steps: [
              '3x² significa 3·x².',
              '(3x)² = 3²x² = 9x².',
            ],
            result: '3x² e 9x² não são equivalentes.',
            interpretation:
                'O agrupamento muda a base da potência.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Produto de potências de mesma base',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Some expoentes apenas em produtos',
            content:
                'Para a mesma base, xᵐ·xⁿ = xᵐ⁺ⁿ. A regra vale porque estamos concatenando fatores iguais.',
            emphasis:
                'x²·x³ = x⁵, mas x² + x³ não é x⁵.',
          ),
          WorkedExampleBlockData(
            title: 'Produto de monômios',
            problem: 'Simplifique (4x³)(−2x⁵).',
            steps: [
              'Multiplique os coeficientes: 4·(−2) = −8.',
              'Some os expoentes de x: 3 + 5 = 8.',
            ],
            result: '−8x⁸.',
            interpretation:
                'Coeficientes e partes literais são tratados separadamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Quociente de potências',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Subtraia expoentes com base não nula',
            content:
                'Para x ≠ 0, xᵐ/xⁿ = xᵐ⁻ⁿ. A condição x ≠ 0 vem do denominador da expressão original.',
          ),
          WorkedExampleBlockData(
            title: 'Quociente de monômios',
            problem: 'Simplifique 12x⁷/(3x²), com x ≠ 0.',
            steps: [
              'Divida os coeficientes: 12/3 = 4.',
              'Subtraia os expoentes: 7 − 2 = 5.',
            ],
            result: '4x⁵, com x ≠ 0.',
            interpretation:
                'Mesmo que a forma simplificada seja definida em x = 0, a expressão original não era.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Potência de potência e potência de produto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Multiplique expoentes em potência de potência',
            content:
                '(xᵐ)ⁿ = xᵐⁿ. Para produtos, (ab)ⁿ = aⁿbⁿ. Essas regras têm justificativas diferentes e não devem ser confundidas com soma de expoentes.',
          ),
          WorkedExampleBlockData(
            title: 'Potência de monômio',
            problem: 'Simplifique (−2x³y²)³.',
            steps: [
              '(−2)³ = −8.',
              '(x³)³ = x⁹.',
              '(y²)³ = y⁶.',
            ],
            result: '−8x⁹y⁶.',
            interpretation:
                'O expoente externo atua em cada fator da base.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Expoentes zero e negativos em Álgebra',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Zero e negativo carregam condições',
            content:
                'Para x ≠ 0, x⁰ = 1 e x⁻ⁿ = 1/xⁿ. Em uma expressão algébrica, essas condições fazem parte do domínio e não desaparecem durante a simplificação.',
          ),
          WorkedExampleBlockData(
            title: 'Reescrevendo sem expoente negativo',
            problem: 'Simplifique 6x⁻²y³.',
            steps: [
              'x⁻² = 1/x², com x ≠ 0.',
              'Mantenha os demais fatores no numerador.',
            ],
            result: '6y³/x², com x ≠ 0.',
            interpretation:
                'Expoente negativo indica posição multiplicativa, não sinal negativo do termo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Mais de uma variável',
        blocks: [
          WorkedExampleBlockData(
            title: 'Produto multivariável',
            problem: 'Simplifique (3x²y)(−4xy³).',
            steps: [
              'Coeficientes: 3·(−4) = −12.',
              'Potências de x: x²·x = x³.',
              'Potências de y: y·y³ = y⁴.',
            ],
            result: '−12x³y⁴.',
            interpretation:
                'Cada base é tratada independentemente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não some expoentes em uma soma',
            content:
                'x² + x³ não pode ser reduzido a x⁵ porque a lei de soma de expoentes exige multiplicação.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '(x + y)² não é x² + y²',
            content:
                'A potência atua sobre o binômio inteiro: (x + y)² = x² + 2xy + y².',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não esqueça as restrições originais',
            content:
                'Ao simplificar x³/x, obtemos x², mas a expressão original exigia x ≠ 0. Simplificar não altera retroativamente o domínio original.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Simplifique (2x²)³·x⁻¹.',
            steps: [
              '(2x²)³ = 8x⁶.',
              'Multiplique por x⁻¹: 8x⁶·x⁻¹.',
              'Some expoentes: 6 + (−1) = 5.',
            ],
            result: '8x⁵, com x ≠ 0.',
            interpretation:
                'A restrição vem do fator x⁻¹ da expressão original.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Simplifique (6a⁵b²)/(3a²b), com a ≠ 0 e b ≠ 0.',
            steps: [
              '6/3 = 2.',
              'a⁵/a² = a³.',
              'b²/b = b.',
            ],
            result: '2a³b.',
            interpretation:
                'Quocientes de bases iguais são simplificados separadamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Simplifique e indique restrições quando existirem',
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
                '11. Explique por que x² + x⁴ não é x⁶.\n'
                '12. Compare 2x³ e (2x)³.\n'
                '13. Simplifique x⁵/x⁷ sem expoentes negativos.\n'
                '14. Determine a restrição original de (x² − x)/x.\n'
                '15. Simplifique (3a²b⁻¹)².',
            emphasis:
                'Separe sempre o trabalho com coeficientes do trabalho com cada base literal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Potências aparecem em funções, limites e derivadas',
            content:
                'Funções potência e polinomiais são construídas com essas estruturas. Simplificar corretamente expoentes será essencial para quocientes incrementais, derivadas e análise de crescimento.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a simplificação de (3x²)²?',
      choices: ['6x⁴', '9x⁴', '9x²'],
      correctIndex: 1,
      explanation:
          'O expoente 2 atua em 3 e em x²: 3² = 9 e (x²)² = x⁴.',
    ),
    takeaways: [
      'Produto de mesma base soma expoentes; quociente subtrai expoentes.',
      'Potência de potência multiplica expoentes.',
      'Potência de um produto atua sobre todos os fatores.',
      'Expoentes zero e negativos exigem atenção ao domínio.',
      'Coeficientes e bases literais devem ser tratados separadamente.',
      'Leis de expoentes não se aplicam diretamente a somas.',
    ],
    closing:
        'Leis de expoentes são regras de estrutura: funcionam quando reconhecemos exatamente qual operação e qual base estão presentes.',
  )
  CourseLessonData(
    id: 'algebra-09-monomios-polinomios',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Álgebra e fatoração',
    title: 'Monômios e polinômios',
    description:
        'estrutura, termos, coeficientes, grau, forma padrão e reconhecimento de expressões polinomiais',
    duration: '≈ 28 min',
    objective:
        'reconhecer monômios e polinômios, identificar coeficientes e termos, determinar graus, escrever polinômios em forma padrão e distinguir expressões polinomiais de expressões não polinomiais',
    symbol: 'P(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'O que é um monômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Coeficiente vezes potências de variáveis',
            content:
                'Um monômio é uma expressão do tipo ax₁ⁿ¹x₂ⁿ²…xₖⁿᵏ, em que a é um número real e os expoentes das variáveis são inteiros não negativos. Exemplos: 5x³, −2ab² e 7.',
            emphasis:
                'Expoentes negativos, variáveis em denominadores e raízes de variáveis retiram a expressão da classe dos monômios polinomiais.',
          ),
          WorkedExampleBlockData(
            title: 'Classificando expressões',
            problem: 'Quais são monômios: 4x², 3/x, −5xy³, √x e 8?',
            steps: [
              '4x² tem expoente inteiro não negativo: é monômio.',
              '3/x = 3x⁻¹: não é monômio polinomial.',
              '−5xy³ tem expoentes 1 e 3: é monômio.',
              '√x = x^(1/2): não é monômio polinomial.',
              '8 é uma constante e também é um monômio de grau 0.',
            ],
            result: 'Monômios: 4x², −5xy³ e 8.',
            interpretation:
                'A classificação depende da estrutura dos expoentes, não do número de símbolos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Grau de um monômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Some os expoentes das variáveis',
            content:
                'Em uma variável, o grau de axⁿ com a ≠ 0 é n. Em várias variáveis, o grau total de um monômio é a soma dos expoentes. Assim, 3x²y⁴ tem grau total 6.',
            emphasis:
                'Uma constante não nula tem grau 0. O grau do monômio zero normalmente não é definido no tratamento elementar.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'O que é um polinômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Soma finita de monômios',
            content:
                'Um polinômio é uma soma finita de monômios. Em uma variável, escrevemos P(x) = aₙxⁿ + aₙ₋₁xⁿ⁻¹ + … + a₁x + a₀, com expoentes inteiros não negativos.',
            emphasis:
                'Os números a₀, a₁, …, aₙ são coeficientes. Quando aₙ ≠ 0, ele é o coeficiente líder.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Binômio, trinômio e polinômio',
            content:
                'Um polinômio reduzido com um termo é um monômio; com dois termos, binômio; com três, trinômio. Com mais termos, continuamos usando o nome geral polinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Forma reduzida e forma padrão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Primeiro reduza, depois ordene',
            content:
                'Para escrever um polinômio em forma padrão, combine termos semelhantes e organize os termos em ordem decrescente de grau.',
          ),
          WorkedExampleBlockData(
            title: 'Organizando um polinômio',
            problem: 'Escreva 3x − 2x³ + 5 + 4x³ − x em forma padrão.',
            steps: [
              'Combine termos cúbicos: −2x³ + 4x³ = 2x³.',
              'Combine termos lineares: 3x − x = 2x.',
              'Mantenha a constante 5.',
              'Ordene por grau decrescente.',
            ],
            result: '2x³ + 2x + 5.',
            interpretation:
                'O termo x² está ausente, o que equivale a ter coeficiente zero para esse grau.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Grau e coeficiente líder',
        blocks: [
          WorkedExampleBlockData(
            title: 'Leitura estrutural completa',
            problem: 'Analise P(x) = −4x⁵ + 2x³ − 7x + 9.',
            steps: [
              'O maior expoente presente é 5.',
              'Portanto, o grau do polinômio é 5.',
              'O coeficiente do termo de maior grau é −4.',
              'Logo, o coeficiente líder é −4.',
              'O termo constante é 9.',
            ],
            result: 'Grau 5, coeficiente líder −4 e termo constante 9.',
            interpretation:
                'Essas informações ajudam a prever o comportamento global do gráfico de P.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Polinômios em várias variáveis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Grau total',
            content:
                'Em P(x,y) = 3x²y + 5xy³ − 2, os termos têm graus totais 3, 4 e 0. O grau total do polinômio é o maior deles: 4.',
            emphasis:
                'Em várias variáveis, é importante distinguir grau em uma variável específica e grau total.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Expressões que não são polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reconheça as restrições estruturais',
            content:
                '1/x, x⁻², √x, x^(3/2), sen x e 2ˣ não são polinômios em x. O problema não é “ser complicado”; é não obedecer à forma de soma finita de potências inteiras não negativas da variável.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Zeros e avaliação de polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Substituir um valor produz P(a)',
            content:
                'Avaliar um polinômio significa substituir a variável por um número. Um número r é zero ou raiz de P quando P(r) = 0.',
          ),
          WorkedExampleBlockData(
            title: 'Avaliando um polinômio',
            problem: 'Para P(x)=x³−4x+1, calcule P(2).',
            steps: [
              'Substitua x por 2: P(2)=2³−4·2+1.',
              'Calcule 2³ = 8.',
              'Obtenha 8−8+1 = 1.',
            ],
            result: 'P(2)=1.',
            interpretation:
                'Como P(2) ≠ 0, o número 2 não é uma raiz desse polinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir número de termos com grau',
            content:
                'O polinômio x⁷ + 2 tem apenas dois termos, mas grau 7. “Binômio” descreve quantidade de termos; “grau” descreve expoentes.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Determinar o grau antes de reduzir',
            content:
                'Em 3x⁴ − 3x⁴ + x², os termos de grau 4 se cancelam. O polinômio reduzido é x² e seu grau é 2.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Classifique, reduza e interprete',
            content:
                '1. Classifique 7x³ como monômio e determine seu grau.\n'
                '2. Determine o grau de −4x²y⁵.\n'
                '3. Decida se 3/x é monômio polinomial.\n'
                '4. Decida se √x + 1 é polinômio.\n'
                '5. Reduza 2x² + 3x − x² + 5x.\n'
                '6. Coloque 4 − x³ + 2x em forma padrão.\n'
                '7. Determine o grau de 5x⁶ − x² + 1.\n'
                '8. Identifique o coeficiente líder de −2x⁴ + 7x − 3.\n'
                '9. Identifique o termo constante de x⁵ − 9.\n'
                '10. Determine o grau total de 3x²y⁴.\n'
                '11. Determine o grau de P(x,y)=x³y + xy² + 1.\n'
                '12. Calcule P(−1) para P(x)=2x³−x+4.\n'
                '13. Verifique se x=2 é raiz de x²−5x+6.\n'
                '14. Explique por que 2ˣ não é polinômio em x.\n'
                '15. Simplifique 3x⁴−3x⁴+2x² e determine o grau final.',
            emphasis:
                'Sempre reduza o polinômio antes de declarar seu grau.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Polinômios são funções centrais no Cálculo',
            content:
                'Funções polinomiais são contínuas em todos os números reais, têm derivadas obtidas termo a termo e servem como modelos locais e globais. Grau, coeficiente líder e zeros antecipam informações importantes sobre gráficos e limites no infinito.',
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
                'Referências: OpenStax, Algebra and Trigonometry 2e, capítulos de polinômios; OpenStax, College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores, Fundamentos de Matemática Elementar; Stewart e Thomas’ Calculus para a conexão entre polinômios, funções e Cálculo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o grau de P(x)=4x⁵−2x³+x−7?',
      choices: ['3', '4', '5'],
      correctIndex: 2,
      explanation:
          'O maior expoente de x com coeficiente não nulo é 5, portanto o grau é 5.',
    ),
    takeaways: [
      'Monômios polinomiais usam expoentes inteiros não negativos.',
      'Um polinômio é uma soma finita de monômios.',
      'A forma padrão organiza termos em ordem decrescente de grau.',
      'O grau deve ser determinado depois da redução de termos semelhantes.',
      'Coeficiente líder e termo constante são informações estruturais importantes.',
      'Zeros de um polinômio são valores r para os quais P(r)=0.',
    ],
    closing:
        'Reconhecer a estrutura de um polinômio é o primeiro passo para operar, fatorar e interpretar sua função.',
  )
  CourseLessonData(
    id: 'algebra-10-operacoes-polinomios',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Álgebra e fatoração',
    title: 'Operações com polinômios',
    description:
        'adição, subtração, multiplicação, divisão por monômio e avaliação estrutural',
    duration: '≈ 30 min',
    objective:
        'somar, subtrair e multiplicar polinômios, dividir polinômios por monômios quando permitido, organizar resultados em forma padrão e justificar cada operação',
    symbol: 'P±Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Adição de polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Combine apenas termos semelhantes',
            content:
                'Somar polinômios significa reunir termos de mesma parte literal e mesmo expoente. Termos de graus diferentes não podem ser fundidos em um único termo.',
          ),
          WorkedExampleBlockData(
            title: 'Somando dois polinômios',
            problem: 'Some P(x)=3x²−2x+5 e Q(x)=−x²+4x−7.',
            steps: [
              'Termos quadráticos: 3x²−x² = 2x².',
              'Termos lineares: −2x+4x = 2x.',
              'Constantes: 5−7 = −2.',
            ],
            result: 'P(x)+Q(x)=2x²+2x−2.',
            interpretation:
                'Organizar por grau reduz o risco de combinar termos incompatíveis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Subtração de polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'O sinal negativo afeta todo o segundo polinômio',
            content:
                'P(x) − Q(x) significa P(x) + [−Q(x)]. Antes de combinar termos, distribua o fator −1 por todos os termos de Q.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Subtraindo com segurança',
            problem: 'Calcule (2x²+3x−1) − (x²−5x+4).',
            steps: [
              'Distribua o sinal negativo: 2x²+3x−1−x²+5x−4.',
              'Quadráticos: 2x²−x² = x².',
              'Lineares: 3x+5x = 8x.',
              'Constantes: −1−4 = −5.',
            ],
            result: 'x²+8x−5.',
            interpretation:
                'A maior fonte de erro é trocar apenas o primeiro sinal do segundo polinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Multiplicação por monômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Use distributiva e leis de expoentes',
            content:
                'Ao multiplicar um polinômio por um monômio, distribua o monômio para todos os termos e use as leis de expoentes nas partes literais.',
          ),
          WorkedExampleBlockData(
            title: 'Monômio vezes polinômio',
            problem: 'Calcule −3x²(2x³−x+4).',
            steps: [
              '−3x²·2x³ = −6x⁵.',
              '−3x²·(−x) = 3x³.',
              '−3x²·4 = −12x².',
            ],
            result: '−6x⁵+3x³−12x².',
            interpretation:
                'O fator externo multiplica coeficiente e parte literal de cada termo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Multiplicação de polinômios',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Cada termo multiplica cada termo',
            content:
                'Para multiplicar dois polinômios, aplique distributiva repetidamente. Depois, reduza termos semelhantes e ordene o resultado.',
          ),
          WorkedExampleBlockData(
            title: 'Binômio vezes trinômio',
            problem: 'Expanda (x−2)(x²+3x+4).',
            steps: [
              'Multiplique x: x³+3x²+4x.',
              'Multiplique −2: −2x²−6x−8.',
              'Combine termos semelhantes: 3x²−2x² = x² e 4x−6x = −2x.',
            ],
            result: 'x³+x²−2x−8.',
            interpretation:
                'O grau do produto é a soma dos graus quando os coeficientes líderes não se anulam.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Grau nas operações',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Soma e produto se comportam de modos diferentes',
            content:
                'Em geral, grau(PQ)=grau(P)+grau(Q) para polinômios não nulos. Já na soma, o grau pode diminuir se os termos líderes se cancelarem.',
          ),
          WorkedExampleBlockData(
            title: 'Cancelamento do termo líder',
            problem: 'Determine o grau de (3x⁴+x) + (−3x⁴+2x²).',
            steps: [
              'Os termos 3x⁴ e −3x⁴ se cancelam.',
              'Resta 2x²+x.',
            ],
            result: 'O grau da soma é 2.',
            interpretation:
                'Não podemos afirmar que o grau da soma é sempre o maior dos graus originais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Divisão por monômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Divida termo a termo',
            content:
                'Quando um polinômio é dividido por um monômio não nulo, podemos dividir cada termo separadamente, desde que a divisão esteja definida.',
          ),
          WorkedExampleBlockData(
            title: 'Divisão termo a termo',
            problem: 'Simplifique (12x⁵−6x³+3x²)/(3x²), com x ≠ 0.',
            steps: [
              '12x⁵/(3x²)=4x³.',
              '−6x³/(3x²)=−2x.',
              '3x²/(3x²)=1.',
            ],
            result: '4x³−2x+1, com x ≠ 0.',
            interpretation:
                'A restrição x ≠ 0 pertence à expressão original e deve ser preservada.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Avaliação após operações',
        blocks: [
          WorkedExampleBlockData(
            title: 'Operar antes ou avaliar antes',
            problem: 'Se P(x)=x²+1 e Q(x)=2x−3, calcule (P+Q)(2).',
            steps: [
              'Some as funções polinomiais: (P+Q)(x)=x²+2x−2.',
              'Substitua x=2: 4+4−2=6.',
              'Alternativamente, P(2)=5 e Q(2)=1; então 5+1=6.',
            ],
            result: '(P+Q)(2)=6.',
            interpretation:
                'As duas rotas concordam porque avaliação e adição são compatíveis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Somar expoentes em uma soma',
            content:
                'x²+x³ não é x⁵. Expoentes são somados apenas ao multiplicar potências de mesma base.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer produtos cruzados',
            content:
                '(x+2)(x+3) não é x²+6. Os produtos cruzados 3x e 2x também aparecem, produzindo x²+5x+6.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — soma e subtração',
            problem: 'Calcule (4x²−x+2) − (x²+3x−5).',
            steps: [
              'Distribua o sinal negativo no segundo polinômio.',
              'Obtenha 4x²−x+2−x²−3x+5.',
              'Combine: 3x²−4x+7.',
            ],
            result: '3x²−4x+7.',
            interpretation:
                'A organização por grau ajuda a conferir cada combinação.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — produto',
            problem: 'Expanda (2x+1)(x²−x+3).',
            steps: [
              '2x(x²−x+3)=2x³−2x²+6x.',
              '1(x²−x+3)=x²−x+3.',
              'Combine: −2x²+x²=−x² e 6x−x=5x.',
            ],
            result: '2x³−x²+5x+3.',
            interpretation:
                'O produto final foi reduzido e escrito em forma padrão.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Opere e escreva cada resultado em forma padrão',
            content:
                '1. (2x+3)+(5x−1).\n'
                '2. (3x²−2x+4)+(−x²+x−6).\n'
                '3. (x²+5x)−(2x²−x+1).\n'
                '4. 4x(x²−3x+2).\n'
                '5. −2a²(3a−4).\n'
                '6. (x+4)(x−1).\n'
                '7. (2x−3)(x+5).\n'
                '8. (x−2)(x²+x+1).\n'
                '9. (3x+1)(2x²−x+4).\n'
                '10. (15x⁴−10x³+5x²)/(5x²).\n'
                '11. Determine o grau de (x³+1)(2x²−x).\n'
                '12. Dê um exemplo em que o grau de P+Q seja menor que os graus de P e Q.\n'
                '13. Calcule (P+Q)(1) para P(x)=x² e Q(x)=3x−2.\n'
                '14. Explique por que (x+1)(x+1) não é x²+1.\n'
                '15. Verifique sua resposta da questão 7 substituindo x=1 antes e depois da expansão.',
            emphasis:
                'Use substituição numérica como estratégia de verificação quando possível.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Álgebra polinomial aparece em todo o Cálculo',
            content:
                'Quocientes incrementais, limites, derivadas e aproximações polinomiais exigem expansão, redução e fatoração de polinômios. A precisão dessas operações é parte do raciocínio de Cálculo.',
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
                'Referências: OpenStax, Algebra and Trigonometry 2e e College Algebra 2e, operações com polinômios; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas’ Calculus para aplicações de manipulação polinomial em limites e derivadas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o produto (x+2)(x−3)?',
      choices: ['x²−x−6', 'x²−6', 'x²+x−6'],
      correctIndex: 0,
      explanation:
          'Pela distributiva: x²−3x+2x−6 = x²−x−6.',
    ),
    takeaways: [
      'Adição e subtração combinam apenas termos semelhantes.',
      'Na subtração, o sinal negativo deve atingir todo o segundo polinômio.',
      'Multiplicação exige distribuir cada termo por todos os termos do outro fator.',
      'O grau do produto soma os graus dos fatores não nulos.',
      'O grau da soma pode diminuir por cancelamento.',
      'Divisão por monômio exige preservar restrições de domínio.',
    ],
    closing:
        'Operar polinômios com segurança é organizar a estrutura antes de executar as contas.',
  )
  CourseLessonData(
    id: 'algebra-05-produtos-notaveis',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Álgebra e fatoração',
    title: 'Produtos notáveis',
    description:
        'padrões de expansão derivados da distributiva e reconhecimento estrutural',
    duration: '≈ 28 min',
    objective:
        'derivar e aplicar produtos notáveis, reconhecer seus padrões em expressões algébricas e evitar memorizações sem justificativa',
    symbol: '(a+b)²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Produtos notáveis vêm da distributiva',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Padrões, não fórmulas mágicas',
            content:
                'Produtos notáveis são multiplicações que aparecem com frequência e podem ser reconhecidas por padrão. Todas as fórmulas desta aula podem ser reconstruídas pela propriedade distributiva.',
            emphasis:
                'Se uma fórmula for esquecida, a distributiva continua sendo um caminho seguro.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Quadrado da soma',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: '(a+b)²',
            content:
                '(a+b)² = (a+b)(a+b) = a² + 2ab + b².',
            emphasis:
                'O termo 2ab surge de dois produtos cruzados: ab + ba.',
          ),
          WorkedExampleBlockData(
            title: 'Aplicando o quadrado da soma',
            problem: 'Expanda (2x+3)².',
            steps: [
              'Quadrado do primeiro termo: (2x)² = 4x².',
              'Duas vezes o produto: 2·(2x)·3 = 12x.',
              'Quadrado do segundo termo: 3² = 9.',
            ],
            result: '4x²+12x+9.',
            interpretation:
                'O termo central registra a interação entre os dois termos do binômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Quadrado da diferença',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: '(a−b)²',
            content:
                '(a−b)² = a² − 2ab + b². Apenas o termo central muda de sinal em relação ao quadrado da soma.',
          ),
          WorkedExampleBlockData(
            title: 'Sinal do termo central',
            problem: 'Expanda (3x−4)².',
            steps: [
              '(3x)² = 9x².',
              '−2·(3x)·4 = −24x.',
              '4² = 16.',
            ],
            result: '9x²−24x+16.',
            interpretation:
                'O último termo é positivo porque resulta de um quadrado.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Produto da soma pela diferença',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '(a+b)(a−b)',
            content:
                '(a+b)(a−b) = a²−b². Os termos cruzados −ab e +ab se cancelam.',
            emphasis:
                'Esse padrão é a expansão associada à diferença de quadrados.',
          ),
          WorkedExampleBlockData(
            title: 'Conjugados algébricos',
            problem: 'Calcule (5x+2)(5x−2).',
            steps: [
              'Identifique a=5x e b=2.',
              'Use a²−b².',
              '(5x)²−2² = 25x²−4.',
            ],
            result: '25x²−4.',
            interpretation:
                'A ausência do termo linear é consequência do cancelamento dos produtos cruzados.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Cubo de binômio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Padrões cúbicos',
            content:
                '(a+b)³ = a³+3a²b+3ab²+b³ e (a−b)³ = a³−3a²b+3ab²−b³.',
            emphasis:
                'Os coeficientes 1, 3, 3, 1 correspondem à expansão completa do produto de três binômios iguais.',
          ),
          WorkedExampleBlockData(
            title: 'Cubo da soma',
            problem: 'Expanda (x+2)³.',
            steps: [
              'x³.',
              '3·x²·2 = 6x².',
              '3·x·2² = 12x.',
              '2³ = 8.',
            ],
            result: 'x³+6x²+12x+8.',
            interpretation:
                'O padrão cúbico pode sempre ser verificado multiplicando (x+2)² por (x+2).',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Reconhecer o padrão ao contrário',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Da expansão para a forma fatorada',
            content:
                'Reconhecer x²+6x+9 como (x+3)² ou 25x²−16 como (5x−4)(5x+4) será essencial na fatoração.',
            emphasis:
                'Produtos notáveis servem tanto para expandir quanto para reconhecer fatores.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '(a+b)² ≠ a²+b²',
            content:
                'O termo 2ab não pode ser omitido. Com a=1 e b=1, o lado esquerdo vale 4 e a²+b² vale 2.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: '(a−b)² não termina em −b²',
            content:
                'O último termo é +b², porque (−b)(−b)=+b².',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Expanda (x−5)².',
            steps: [
              'x².',
              '−2·x·5 = −10x.',
              '5² = 25.',
            ],
            result: 'x²−10x+25.',
            interpretation:
                'A estrutura é quadrado do primeiro, dobro do produto, quadrado do segundo.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Reconheça 4x²−12x+9.',
            steps: [
              '4x²=(2x)² e 9=3².',
              'O termo central é −2·(2x)·3 = −12x.',
            ],
            result: '(2x−3)².',
            interpretation:
                'O termo central confirma o trinômio quadrado perfeito.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Expanda ou reconheça o padrão',
            content:
                '1. (x+4)².\n'
                '2. (x−7)².\n'
                '3. (2x+5)².\n'
                '4. (3a−2)².\n'
                '5. (x+6)(x−6).\n'
                '6. (4y+1)(4y−1).\n'
                '7. (x+3)³.\n'
                '8. (2x−1)³.\n'
                '9. Reconheça x²+10x+25.\n'
                '10. Reconheça 9x²−24x+16.\n'
                '11. Fatore x²−49 usando um produto notável.\n'
                '12. Explique por que (a+b)² ≠ a²+b².\n'
                '13. Compare (x−2)² e x²−4.\n'
                '14. Verifique (2x+3)(2x−3) por distributiva.\n'
                '15. Expanda (a+b)³ pela distributiva e compare com o padrão.',
            emphasis:
                'Quando reconhecer um padrão, identifique explicitamente quem representa a e quem representa b.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Padrões aceleram simplificações',
            content:
                'Diferença de quadrados e trinômios quadrados perfeitos aparecem em fatorações de limites, racionalizações e manipulação de quocientes incrementais.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas’ Calculus para aplicações algébricas em limites.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a expansão correta de (x−3)²?',
      choices: ['x²−9', 'x²−6x+9', 'x²+6x+9'],
      correctIndex: 1,
      explanation:
          '(x−3)² = x² − 2·x·3 + 3² = x²−6x+9.',
    ),
    takeaways: [
      'Produtos notáveis são consequências da distributiva.',
      '(a+b)² = a²+2ab+b².',
      '(a−b)² = a²−2ab+b².',
      '(a+b)(a−b)=a²−b².',
      'Reconhecer padrões ao contrário prepara fatoração.',
      'O termo cruzado não pode ser omitido.',
    ],
    closing:
        'Produtos notáveis são atalhos seguros apenas quando o padrão é reconhecido e compreendido.',
  )
  CourseLessonData(
    id: 'algebra-06-fatoracao',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Álgebra e fatoração',
    title: 'Fatoração',
    description:
        'fator comum, agrupamento, diferença de quadrados, trinômios e escolha estratégica',
    duration: '≈ 35 min',
    objective:
        'reescrever polinômios como produtos por diferentes técnicas de fatoração, verificar resultados por expansão e selecionar a técnica adequada a partir da estrutura da expressão',
    symbol: 'ab+ac',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Fatorar é reescrever como produto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'A distributiva ao contrário',
            content:
                'Fatorar uma expressão significa escrevê-la como produto de fatores. O caso mais básico é ab+ac = a(b+c).',
            emphasis:
                'Uma fatoração correta pode ser verificada expandindo o produto obtido.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Fator comum em evidência',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Procure o maior fator comum',
            content:
                'Compare coeficientes e partes literais de todos os termos. O fator comum usa o máximo divisor comum dos coeficientes e, para cada variável comum, o menor expoente presente.',
          ),
          WorkedExampleBlockData(
            title: 'Fator comum numérico e literal',
            problem: 'Fatore 12x³y − 18x²y².',
            steps: [
              'MDC de 12 e 18: 6.',
              'Para x, menor expoente comum: x².',
              'Para y, menor expoente comum: y.',
              'Divida cada termo por 6x²y.',
            ],
            result: '6x²y(2x−3y).',
            interpretation:
                'Expandir o resultado recupera a expressão original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Fatoração por agrupamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Crie um fator comum em duas etapas',
            content:
                'Em expressões com quatro ou mais termos, agrupar termos pode revelar fatores comuns parciais que depois geram um fator binomial comum.',
          ),
          WorkedExampleBlockData(
            title: 'Agrupamento estratégico',
            problem: 'Fatore x³+3x²+2x+6.',
            steps: [
              'Agrupe: (x³+3x²)+(2x+6).',
              'Fatore cada grupo: x²(x+3)+2(x+3).',
              'Agora x+3 é fator comum.',
            ],
            result: '(x+3)(x²+2).',
            interpretation:
                'O agrupamento foi escolhido para produzir o mesmo binômio em ambos os grupos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Diferença de quadrados',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'a²−b²=(a−b)(a+b)',
            content:
                'Uma diferença entre dois quadrados perfeitos fatora como produto de conjugados.',
          ),
          WorkedExampleBlockData(
            title: 'Aplicando o padrão',
            problem: 'Fatore 25x²−49.',
            steps: [
              '25x²=(5x)².',
              '49=7².',
              'Use a²−b².',
            ],
            result: '(5x−7)(5x+7).',
            interpretation:
                'Uma soma de quadrados não possui fatoração real análoga.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Trinômio quadrado perfeito',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Reconheça a²±2ab+b²',
            content:
                'Se o primeiro e o último termos são quadrados perfeitos e o termo central é ±2ab, o trinômio é um quadrado perfeito.',
          ),
          WorkedExampleBlockData(
            title: 'Reconhecimento estrutural',
            problem: 'Fatore 9x²−24x+16.',
            steps: [
              '9x²=(3x)².',
              '16=4².',
              '−24x = −2·(3x)·4.',
            ],
            result: '(3x−4)².',
            interpretation:
                'Os três termos devem confirmar o padrão; dois quadrados nas extremidades não bastam.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Trinômios x²+bx+c',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Procure dois números',
            content:
                'Para fatorar x²+bx+c, procure números p e q tais que p+q=b e pq=c. Então x²+bx+c=(x+p)(x+q).',
          ),
          WorkedExampleBlockData(
            title: 'Trinômio monômio',
            problem: 'Fatore x²−5x+6.',
            steps: [
              'Precisamos de p+q=−5.',
              'Também precisamos de pq=6.',
              'Os números são −2 e −3.',
            ],
            result: '(x−2)(x−3).',
            interpretation:
                'As raízes correspondentes serão 2 e 3.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Trinômios ax²+bx+c',
        blocks: [
          WorkedExampleBlockData(
            title: 'Coeficiente líder diferente de 1',
            problem: 'Fatore 6x²+11x+3.',
            steps: [
              'Multiplique a·c: 6·3=18.',
              'Procure dois números com produto 18 e soma 11: 9 e 2.',
              'Reescreva 11x como 9x+2x.',
              'Agrupe: (6x²+9x)+(2x+3).',
              'Fatore: 3x(2x+3)+1(2x+3).',
            ],
            result: '(3x+1)(2x+3).',
            interpretation:
                'A decomposição do termo central transforma o problema em agrupamento.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Fatoração completa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Continue até não haver mais fatores possíveis',
            content:
                'Uma expressão pode exigir mais de uma técnica. Sempre retire fator comum primeiro e depois examine os fatores restantes.',
          ),
          WorkedExampleBlockData(
            title: 'Duas etapas',
            problem: 'Fatore completamente 2x³−18x.',
            steps: [
              'Retire 2x: 2x(x²−9).',
              'Reconheça diferença de quadrados: x²−9=(x−3)(x+3).',
            ],
            result: '2x(x−3)(x+3).',
            interpretation:
                'Parar em 2x(x²−9) produziria uma fatoração correta, mas não completa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Estratégia de escolha',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Uma ordem prática',
            content:
                '1) procure fator comum; 2) conte os termos; 3) com dois termos, teste diferença de quadrados ou outros padrões; 4) com três termos, teste quadrado perfeito ou trinômio quadrático; 5) com quatro termos, tente agrupamento; 6) verifique expandindo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelar termos em vez de fatores',
            content:
                'Fatoração trabalha com produtos. Em uma soma como x²+x, não se “cancela x”; primeiro fatoramos x(x+1).',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer o fator comum antes do padrão',
            content:
                'Em 3x²−12, primeiro retire 3: 3(x²−4), depois use diferença de quadrados.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Fatore completamente',
            content:
                '1. 6x+12.\n'
                '2. 15x³−10x².\n'
                '3. x²−16.\n'
                '4. 9a²−25b².\n'
                '5. x²+8x+16.\n'
                '6. 4x²−12x+9.\n'
                '7. x²+7x+12.\n'
                '8. x²−x−12.\n'
                '9. 2x²+7x+3.\n'
                '10. 6x²+13x+6.\n'
                '11. x³+2x²+3x+6.\n'
                '12. 3x³−27x.\n'
                '13. 4x³+8x²−x−2.\n'
                '14. Explique como verificar uma fatoração.\n'
                '15. Escolha a primeira técnica para 10x³−40x e justifique.',
            emphasis:
                'Depois de fatorar, expanda mentalmente ou por escrito para verificar.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Fatoração revela cancelamentos e zeros',
            content:
                'Em limites, fatorar pode remover uma indeterminação aparente após o cancelamento de um fator comum. Em funções, a forma fatorada revela zeros e multiplicidades.',
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
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart, Thomas e Guidorizzi para aplicações de fatoração em funções e limites.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a fatoração completa de x²−9?',
      choices: ['(x−3)²', '(x−3)(x+3)', 'x(x−9)'],
      correctIndex: 1,
      explanation:
          'x²−9=x²−3² é uma diferença de quadrados, portanto (x−3)(x+3).',
    ),
    takeaways: [
      'Fatorar é reescrever uma soma como produto.',
      'Fator comum deve ser verificado antes de técnicas mais específicas.',
      'Agrupamento cria um fator comum em etapas.',
      'Diferença de quadrados e trinômios quadrados perfeitos são padrões estruturais.',
      'Trinômios quadráticos podem ser fatorados por relações entre soma e produto.',
      'Uma fatoração deve ser verificada pela expansão.',
    ],
    closing:
        'Fatoração é uma mudança de representação que revela estrutura escondida em uma expressão.',
  )
  CourseLessonData(
    id: 'algebra-07-fracoes-algebricas',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Álgebra e fatoração',
    title: 'Frações algébricas',
    description:
        'domínio, fatoração, simplificação e operações com expressões racionais',
    duration: '≈ 32 min',
    objective:
        'determinar restrições de domínio, simplificar frações algébricas por fatores e realizar operações básicas preservando equivalência e valores excluídos',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Uma fração algébrica tem domínio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Denominador nunca pode ser zero',
            content:
                'Em P(x)/Q(x), todo valor que zera Q(x) deve ser excluído do domínio, mesmo que um fator venha a ser cancelado depois.',
            emphasis:
                'Determine as restrições antes de simplificar.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Restrição simples',
            problem: 'Determine o domínio de (x+2)/(x−5).',
            steps: [
              'O denominador é x−5.',
              'Exija x−5 ≠ 0.',
              'Logo, x ≠ 5.',
            ],
            result: 'Domínio: ℝ\{5}.',
            interpretation:
                'O numerador pode ser zero; o denominador não.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Simplificação por fatores',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Só fatores podem ser cancelados',
            content:
                'Cancelar significa dividir numerador e denominador pelo mesmo fator não nulo. Termos separados por soma ou subtração não podem ser cancelados diretamente.',
          ),
          WorkedExampleBlockData(
            title: 'Fatore antes de cancelar',
            problem: 'Simplifique (x²−9)/(x²−3x).',
            steps: [
              'Restrições originais: x²−3x=x(x−3), então x ≠ 0 e x ≠ 3.',
              'Fatore o numerador: x²−9=(x−3)(x+3).',
              'Fatore o denominador: x(x−3).',
              'Cancele o fator x−3, preservando x ≠ 3.',
            ],
            result: '(x+3)/x, com x ≠ 0 e x ≠ 3.',
            interpretation:
                'A forma simplificada não devolve o ponto x=3 ao domínio original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Multiplicação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Fatore e simplifique antes de multiplicar',
            content:
                'Para multiplicar frações algébricas, multiplique numeradores e denominadores. Fatorar antes pode revelar cancelamentos e reduzir o trabalho.',
          ),
          WorkedExampleBlockData(
            title: 'Multiplicação com cancelamento',
            problem: 'Simplifique [(x²−4)/(x²−x−2)]·[(x−2)/(x+2)].',
            steps: [
              'Fatore: x²−4=(x−2)(x+2).',
              'Fatore: x²−x−2=(x−2)(x+1).',
              'Registre restrições originais antes dos cancelamentos.',
              'Cancele fatores comuns permitidos.',
            ],
            result: '(x−2)/(x+1), preservando as restrições originais.',
            interpretation:
                'O domínio pertence à expressão inicial, não apenas à forma final.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Divisão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Multiplique pelo recíproco',
            content:
                'Dividir por uma fração algébrica equivale a multiplicar pelo seu recíproco, desde que a fração divisora esteja definida e não seja zero.',
            emphasis:
                'Além de denominadores não nulos, o numerador da fração divisora também não pode ser zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Adição e subtração',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Use denominador comum',
            content:
                'Frações com denominadores diferentes só podem ser somadas depois de serem reescritas com denominador comum, normalmente obtido pela fatoração dos denominadores.',
          ),
          WorkedExampleBlockData(
            title: 'Somando frações simples',
            problem: 'Simplifique 2/x + 3/(x+1).',
            steps: [
              'Restrições: x ≠ 0 e x ≠ −1.',
              'Denominador comum: x(x+1).',
              'Reescreva: 2(x+1)/[x(x+1)] + 3x/[x(x+1)].',
              'Some os numeradores: 2x+2+3x=5x+2.',
            ],
            result: '(5x+2)/[x(x+1)], com x ≠ 0,−1.',
            interpretation:
                'Somamos numeradores apenas depois de igualar os denominadores.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Frações complexas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Uma fração pode conter outras frações',
            content:
                'Frações complexas podem ser simplificadas multiplicando numerador e denominador por um denominador comum interno, desde que todas as restrições sejam registradas.',
          ),
          WorkedExampleBlockData(
            title: 'Eliminando denominadores internos',
            problem: 'Simplifique (1/x + 1/y)/(1/x), com x,y ≠ 0.',
            steps: [
              'No numerador, 1/x+1/y=(x+y)/(xy).',
              'Divida por 1/x multiplicando por x.',
              '[(x+y)/(xy)]·x = (x+y)/y.',
            ],
            result: '(x+y)/y, com x ≠ 0 e y ≠ 0.',
            interpretation:
                'A restrição x ≠ 0 permanece mesmo após x desaparecer da forma final.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelar termos de uma soma',
            content:
                '(x+2)/x não pode virar 2. O x do numerador não é fator de toda a soma x+2.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer valores excluídos',
            content:
                '(x²−1)/(x−1) simplifica para x+1, mas a expressão original continua exigindo x ≠ 1.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — simplificação',
            problem: 'Simplifique (x²−4x)/(x²−16).',
            steps: [
              'Fatore numerador: x(x−4).',
              'Fatore denominador: (x−4)(x+4).',
              'Restrições: x ≠ 4 e x ≠ −4.',
              'Cancele x−4.',
            ],
            result: 'x/(x+4), com x ≠ ±4.',
            interpretation:
                'O ponto x=4 permanece excluído.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — soma',
            problem: 'Simplifique 1/(x−1) + 1/(x+1).',
            steps: [
              'Restrições: x ≠ ±1.',
              'Denominador comum: (x−1)(x+1).',
              'Numerador: (x+1)+(x−1)=2x.',
            ],
            result: '2x/(x²−1), com x ≠ ±1.',
            interpretation:
                'A fatoração do denominador comum também ajuda a visualizar as restrições.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Determine domínio e simplifique quando possível',
            content:
                '1. (x+1)/(x−2).\n'
                '2. (x²−4)/(x−2).\n'
                '3. (x²−9)/(x²−6x+9).\n'
                '4. (2x²+4x)/(2x).\n'
                '5. [(x²−1)/(x²+x)]·[x/(x−1)].\n'
                '6. [(x+2)/(x−3)]÷[(x+2)/(x+1)].\n'
                '7. 1/x + 2/x.\n'
                '8. 1/x + 1/(x+2).\n'
                '9. 3/(x−1) − 2/(x+1).\n'
                '10. Explique por que (x+3)/x não permite cancelar x.\n'
                '11. Simplifique (x²−25)/(x²−10x+25).\n'
                '12. Liste os valores excluídos antes de simplificar (x²−4)/(x²−x−2).\n'
                '13. Dê um exemplo de ponto removível criado por cancelamento.\n'
                '14. Simplifique (1/x+1)/(1/x).\n'
                '15. Explique por que simplificação não altera o domínio original.',
            emphasis:
                'Escreva as restrições antes de qualquer cancelamento.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Conexão com o Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Frações algébricas aparecem diretamente em limites',
            content:
                'Muitos limites algébricos exigem fatorar e simplificar uma função racional para analisar seu comportamento perto de um ponto excluído. Preservar o domínio é essencial para distinguir valor da função e limite.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica desta aula',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart, Thomas e Guidorizzi para funções racionais e limites.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Ao simplificar (x²−4)/(x−2), qual condição deve ser mantida?',
      choices: ['x ≠ −2', 'x ≠ 0', 'x ≠ 2'],
      correctIndex: 2,
      explanation:
          'O denominador original x−2 zera em x=2. Mesmo após cancelar o fator x−2, esse valor permanece excluído.',
    ),
    takeaways: [
      'Denominadores determinam restrições de domínio.',
      'Somente fatores comuns podem ser cancelados.',
      'Restrições devem ser registradas antes da simplificação.',
      'Adição e subtração exigem denominador comum.',
      'Divisão por fração exige recíproco e novas condições de não nulidade.',
      'A forma simplificada não restaura pontos excluídos da expressão original.',
    ],
    closing:
        'Frações algébricas exigem duas leituras simultâneas: manipular fatores e preservar o domínio.',
  )
  CourseLessonData(
    id: 'algebra-08-sintese',
    topicId: 'algebra-fundamental',
    trailTitle: 'Álgebra Fundamental',
    eyebrow: 'Síntese',
    title: 'Síntese algébrica',
    description:
        'seleção de estratégias, integração de técnicas e preparação para equações, funções e limites',
    duration: '≈ 30 min',
    objective:
        'selecionar e combinar técnicas algébricas de acordo com o objetivo, justificar transformações, preservar domínio e avaliar a forma mais útil de uma expressão',
    symbol: '⇄',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Não existe uma forma universalmente melhor',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A forma útil depende da pergunta',
            content:
                'Expandir facilita combinar termos. Fatorar revela zeros e cancelamentos. Uma fração simplificada evidencia comportamento. A melhor forma é a que torna o objetivo matemático mais visível.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Um roteiro de decisão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Antes de calcular, pergunte o que precisa enxergar',
            content:
                '1) Há parênteses que precisam ser expandidos? 2) Existem termos semelhantes? 3) Existe fator comum? 4) Há um padrão notável? 5) Existem denominadores e restrições? 6) A forma fatorada ajudaria mais do que a expandida?',
            emphasis:
                'Estratégia algébrica começa pela leitura da estrutura.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Exemplo integrado: expandir e reduzir',
        blocks: [
          WorkedExampleBlockData(
            title: 'Várias técnicas em sequência',
            problem: 'Simplifique 2(x+3) − (x−1)(x+2).',
            steps: [
              'Expanda 2(x+3)=2x+6.',
              'Expanda (x−1)(x+2)=x²+x−2.',
              'Subtraia o segundo resultado inteiro: 2x+6−x²−x+2.',
              'Combine termos semelhantes.',
            ],
            result: '−x²+x+8.',
            interpretation:
                'Distribuição, controle de sinal e redução aparecem no mesmo problema.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exemplo integrado: fatorar antes de simplificar',
        blocks: [
          WorkedExampleBlockData(
            title: 'Domínio e cancelamento',
            problem: 'Simplifique (x²−9)/(x²−x−6).',
            steps: [
              'Restrições: x²−x−6=(x−3)(x+2), então x ≠ 3 e x ≠ −2.',
              'Fatore o numerador: (x−3)(x+3).',
              'Cancele x−3.',
            ],
            result: '(x+3)/(x+2), com x ≠ 3,−2.',
            interpretation:
                'A forma fatorada revelou o cancelamento, mas o domínio original permaneceu.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Exemplo integrado: escolher uma forma',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A mesma expressão pode contar histórias diferentes',
            content:
                'x²−5x+6, (x−2)(x−3) e (x−5/2)²−1/4 são formas equivalentes. A forma expandida mostra coeficientes; a fatorada mostra zeros; a forma de quadrado completado mostra centro da parábola.',
            emphasis:
                'Equivalência não significa utilidade idêntica para toda pergunta.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Verificação como hábito matemático',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Três formas de conferir',
            content:
                'Você pode verificar uma expansão refazendo a distributiva, verificar uma fatoração expandindo o resultado e testar equivalência substituindo valores permitidos. Nenhuma verificação isolada substitui uma justificativa, mas todas ajudam a detectar erros.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros de estratégia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Expandir quando fatorar seria melhor',
            content:
                'Em um limite com x²−9 no numerador e x−3 no denominador, expandir não revela o fator comum. A forma fatorada é estruturalmente mais útil.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Simplificar sem registrar domínio',
            content:
                'Uma expressão racional pode perder visualmente uma restrição após cancelamento. O domínio precisa ser determinado antes.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Desafio guiado',
        blocks: [
          WorkedExampleBlockData(
            title: 'Combine as ferramentas',
            problem: 'Simplifique [(x²−4)/(x²−4x+4)]·[(x−2)/(x+2)].',
            steps: [
              'Restrições originais: x ≠ 2 e x ≠ −2.',
              'Fatore x²−4=(x−2)(x+2).',
              'Fatore x²−4x+4=(x−2)².',
              'Substitua os fatores e cancele apenas fatores comuns.',
            ],
            result: '1, com x ≠ 2 e x ≠ −2.',
            interpretation:
                'A expressão simplifica drasticamente, mas continua diferente da função constante 1 nos pontos excluídos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Prática integradora',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Escolha a técnica antes de executar',
            content:
                '1. Simplifique 3(x−2)+2(x+5).\n'
                '2. Expanda (2x−3)².\n'
                '3. Fatore 6x²−24.\n'
                '4. Fatore x²+9x+20.\n'
                '5. Simplifique (x²−16)/(x−4), registrando domínio.\n'
                '6. Some 1/x + 1/(x+1).\n'
                '7. Determine o grau de 4x⁵−x³+2.\n'
                '8. Multiplique (x−2)(x²+2x+4).\n'
                '9. Explique quando a forma fatorada é preferível.\n'
                '10. Explique quando a forma expandida é preferível.\n'
                '11. Dê um contraexemplo para (a+b)²=a²+b².\n'
                '12. Verifique se 3 é raiz de x²−5x+6.\n'
                '13. Simplifique (x²−1)/(x²+x), registrando restrições.\n'
                '14. Fatore completamente 2x³−8x.\n'
                '15. Explique por que cancelar fatores não devolve valores ao domínio.',
            emphasis:
                'Antes de cada questão, escreva em uma palavra a estratégia escolhida: expandir, reduzir, fatorar, operar ou analisar domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Ponte para equações e funções',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Álgebra é infraestrutura para o restante do curso',
            content:
                'Equações usam equivalência e fatoração; funções usam domínio e avaliação; limites usam fatoração, racionalização e simplificação; derivadas usam todas essas técnicas novamente.',
            emphasis:
                'A meta desta unidade não é velocidade mecânica, mas controle consciente das transformações.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Referências e aprofundamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica da unidade',
            content:
                'Referências consolidadas: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; James Stewart, Thomas’ Calculus e Guidorizzi para a ponte entre manipulação algébrica, funções e Cálculo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question:
          'Para simplificar (x²−25)/(x−5), qual ação estrutural deve vir primeiro?',
      choices: [
        'Fatorar x²−25',
        'Substituir x=5',
        'Somar 25 ao denominador',
      ],
      correctIndex: 0,
      explanation:
          'x²−25 é uma diferença de quadrados: (x−5)(x+5). Isso revela o fator comum, mantendo a restrição x ≠ 5.',
    ),
    takeaways: [
      'A forma mais útil de uma expressão depende do objetivo.',
      'Expandir, reduzir e fatorar são ferramentas complementares.',
      'Domínio deve ser preservado durante simplificações racionais.',
      'Produtos notáveis conectam expansão e fatoração.',
      'Verificação reduz erros, mas deve acompanhar justificativas algébricas.',
      'Álgebra bem organizada prepara equações, funções, limites e derivadas.',
    ],
    closing:
        'A maturidade algébrica começa quando você deixa de perguntar apenas “como calcular?” e passa a perguntar “qual forma revela melhor a estrutura?”.',
  )
];
