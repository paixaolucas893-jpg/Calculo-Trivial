import 'package:calcquest/shared/domain/course_lesson_data.dart';

const List<CourseLessonData> equationsCourseLessons = [
  CourseLessonData(
    id: 'equations-01-equilibrio',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e inequações',
    eyebrow: 'Equações',
    title: 'Equações, igualdade e equivalência',
    description:
        'sentido de igualdade, conjunto solução, transformações equivalentes e verificação',
    duration: '≈ 25 min',
    objective:
        'interpretar uma equação como uma afirmação de igualdade, distinguir expressão de equação, compreender conjunto solução e aplicar transformações equivalentes preservando as soluções',
    symbol: '=',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Equação é uma afirmação, não apenas uma conta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Dois membros ligados por igualdade',
            content:
                'Uma equação afirma que duas expressões possuem o mesmo valor para determinados valores das variáveis. Em 2x+3=11, 2x+3 é o primeiro membro e 11 é o segundo.',
            emphasis:
                'Resolver a equação significa determinar todos os valores que tornam a igualdade verdadeira.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Expressão, identidade e equação',
            content:
                '2x+3 é uma expressão. 2(x+1)=2x+2 é uma identidade, pois vale para todo x real. 2x+3=11 é uma equação, pois vale apenas para valores específicos de x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Conjunto solução',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A solução pertence a um universo',
            content:
                'O conjunto solução reúne todos os valores do domínio considerado que tornam a equação verdadeira. O universo pode ser ℝ, ℤ ou outro conjunto especificado.',
            emphasis:
                'Uma resposta completa depende do conjunto numérico em que estamos trabalhando.',
          ),
          WorkedExampleBlockData(
            title: 'Testando uma solução',
            problem: 'Verifique se x=4 resolve 3x−5=7.',
            steps: [
              'Substitua x por 4 no primeiro membro: 3·4−5=12−5=7.',
              'O segundo membro também vale 7.',
            ],
            result: 'x=4 é solução.',
            interpretation:
                'Verificar significa voltar à equação original, não apenas confiar nas manipulações feitas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Equações equivalentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Preservar o mesmo conjunto solução',
            content:
                'Duas equações são equivalentes quando possuem o mesmo conjunto solução no universo considerado. Somar ou subtrair a mesma expressão nos dois membros preserva equivalência. Multiplicar ou dividir ambos os membros pelo mesmo número não nulo também preserva equivalência.',
            emphasis:
                'Dividir por uma expressão que pode ser zero exige cuidado, porque pode eliminar soluções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Princípio do equilíbrio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Faça a mesma operação nos dois lados',
            content:
                'A metáfora da balança é útil: se dois membros são iguais, aplicar a mesma transformação válida aos dois mantém a igualdade.',
          ),
          WorkedExampleBlockData(
            title: 'Isolando a variável',
            problem: 'Resolva 2x+5=17.',
            steps: [
              'Subtraia 5 dos dois membros: 2x=12.',
              'Divida os dois membros por 2: x=6.',
              'Verifique: 2·6+5=17.',
            ],
            result: 'S={6}.',
            interpretation:
                'Cada passo gerou uma equação equivalente à anterior.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Operações reversíveis e não reversíveis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Nem toda transformação preserva equivalência nos dois sentidos',
            content:
                'Elevar ambos os membros ao quadrado pode introduzir soluções. Por exemplo, x=−2 implica x²=4, mas x²=4 também admite x=2. Por isso algumas transformações produzem apenas implicações e exigem verificação final.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Modelagem com equações',
        blocks: [
          WorkedExampleBlockData(
            title: 'Traduzindo uma situação',
            problem: 'Um número aumentado de 7 é igual a 19. Determine o número.',
            steps: [
              'Defina x como o número desconhecido.',
              'Traduza: x+7=19.',
              'Subtraia 7: x=12.',
              'Verifique: 12+7=19.',
            ],
            result: 'O número é 12.',
            interpretation:
                'Uma equação liga linguagem verbal a uma relação matemática verificável.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros conceituais frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Trocar termos de lado não é uma regra fundamental',
            content:
                'A frase “passa para o outro lado trocando o sinal” é um atalho. O fundamento real é somar ou subtrair a mesma quantidade nos dois membros.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não divida por zero',
            content:
                'Divisão por zero não está definida. Ao dividir por uma expressão variável, verifique antes se ela pode ser zero.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Justifique cada transformação',
            content:
                '1. Diga se 3x+1 é expressão ou equação.\n'
                '2. Verifique se x=2 resolve 4x−1=7.\n'
                '3. Resolva x+9=14.\n'
                '4. Resolva 5x=30.\n'
                '5. Resolva 3x−4=11.\n'
                '6. Explique por que somar 6 aos dois membros preserva soluções.\n'
                '7. Explique por que dividir por zero é proibido.\n'
                '8. Determine o conjunto solução de 2x+3=2x+3.\n'
                '9. Determine o conjunto solução de 2x+3=2x+5.\n'
                '10. Dê um exemplo de identidade.\n'
                '11. Dê um exemplo de equação com uma solução real.\n'
                '12. Verifique a solução de 7−2x=1.\n'
                '13. Explique por que elevar ao quadrado pode criar soluções.\n'
                '14. Modele: “o dobro de um número menos 3 é 9”.\n'
                '15. Diferencie solução obtida e solução verificada.',
            emphasis:
                'Nas questões conceituais, responda com uma frase matemática completa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Resolver equações é encontrar interseções e zeros',
            content:
                'A equação f(x)=g(x) procura pontos em que duas funções têm o mesmo valor. A equação f(x)=0 procura zeros. Essas ideias reaparecem em gráficos, limites, derivadas e otimização.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas para interpretação de zeros e interseções.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual operação sempre preserva equivalência em uma equação?',
      choices: [
        'Somar o mesmo número aos dois membros',
        'Dividir ambos os membros por zero',
        'Elevar ao quadrado sem verificar',
      ],
      correctIndex: 0,
      explanation:
          'Somar a mesma quantidade aos dois membros preserva a igualdade e o conjunto solução.',
    ),
    takeaways: [
      'Uma equação é uma afirmação de igualdade.',
      'Soluções tornam a equação verdadeira no universo considerado.',
      'Equações equivalentes possuem o mesmo conjunto solução.',
      'Operações feitas nos dois membros devem preservar equivalência.',
      'Algumas transformações exigem verificação final.',
      'Resolver equações conecta álgebra, funções e zeros.',
    ],
    closing:
        'Resolver uma equação é preservar logicamente uma igualdade até que suas soluções fiquem explícitas.',
  ),
  CourseLessonData(
    id: 'equations-02-primeiro-grau',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e inequações',
    eyebrow: 'Equações lineares',
    title: 'Equações do primeiro grau',
    description:
        'forma ax+b=c, isolamento da incógnita, coeficientes e interpretação',
    duration: '≈ 28 min',
    objective:
        'resolver equações lineares em uma variável, interpretar coeficientes, organizar termos, verificar soluções e modelar problemas simples',
    symbol: 'ax+b=0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Forma linear',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A variável aparece com expoente 1',
            content:
                'Uma equação linear em x pode ser organizada na forma ax+b=0, com a e b reais e a ≠ 0. Nessa situação existe exatamente uma solução real: x=−b/a.',
            emphasis:
                'O caso a=0 precisa ser analisado separadamente, pois deixa de ser uma equação linear genuína.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Isolamento passo a passo',
        blocks: [
          WorkedExampleBlockData(
            title: 'Coeficiente positivo',
            problem: 'Resolva 4x−7=13.',
            steps: [
              'Some 7 aos dois membros: 4x=20.',
              'Divida ambos os membros por 4: x=5.',
              'Verifique: 4·5−7=13.',
            ],
            result: 'S={5}.',
            interpretation:
                'A solução é o único valor que torna a igualdade verdadeira.',
          ),
          WorkedExampleBlockData(
            title: 'Coeficiente negativo',
            problem: 'Resolva −3x+8=20.',
            steps: [
              'Subtraia 8: −3x=12.',
              'Divida por −3: x=−4.',
              'Verifique: −3(−4)+8=20.',
            ],
            result: 'S={−4}.',
            interpretation:
                'Dividir por número negativo não altera uma igualdade, ao contrário do que acontece com inequações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Variável nos dois membros',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Agrupe variáveis e constantes',
            content:
                'Quando x aparece nos dois membros, use operações equivalentes para reunir os termos com x em um lado e as constantes no outro.',
          ),
          WorkedExampleBlockData(
            title: 'Variável dos dois lados',
            problem: 'Resolva 5x−2=2x+10.',
            steps: [
              'Subtraia 2x dos dois membros: 3x−2=10.',
              'Some 2: 3x=12.',
              'Divida por 3: x=4.',
            ],
            result: 'S={4}.',
            interpretation:
                'Não é necessário “mover” termos; usamos operações iguais nos dois lados.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Equações com decimais',
        blocks: [
          WorkedExampleBlockData(
            title: 'Eliminando decimais',
            problem: 'Resolva 0,2x+1,5=2,3.',
            steps: [
              'Subtraia 1,5: 0,2x=0,8.',
              'Divida por 0,2: x=4.',
            ],
            result: 'S={4}.',
            interpretation:
                'Também seria possível multiplicar toda a equação por 10 antes de começar.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Modelagem linear',
        blocks: [
          WorkedExampleBlockData(
            title: 'Preço fixo mais custo variável',
            problem: 'Uma corrida custa R$ 6 de taxa fixa mais R$ 2,50 por quilômetro. Se o total foi R$ 26, quantos quilômetros foram percorridos?',
            steps: [
              'Defina x como a distância em quilômetros.',
              'Modele: 6+2,5x=26.',
              'Subtraia 6: 2,5x=20.',
              'Divida por 2,5: x=8.',
            ],
            result: 'Foram percorridos 8 km.',
            interpretation:
                'O coeficiente de x representa a taxa de variação do preço por quilômetro.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Interpretação gráfica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Uma equação linear pode representar uma interseção',
            content:
                'Resolver ax+b=c equivale a encontrar o x em que a reta y=ax+b encontra a reta horizontal y=c.',
            emphasis:
                'A solução algébrica corresponde a uma coordenada de interseção no gráfico.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Alterar apenas um membro',
            content:
                'Somar, subtrair, multiplicar ou dividir apenas um lado da equação geralmente destrói a equivalência.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Perder o sinal do coeficiente',
            content:
                'Em −4x=12, a solução é x=−3. O sinal negativo pertence ao coeficiente e deve acompanhar a divisão.',
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
            problem: 'Resolva 7x+5=3x+21.',
            steps: [
              'Subtraia 3x: 4x+5=21.',
              'Subtraia 5: 4x=16.',
              'Divida por 4.',
            ],
            result: 'x=4.',
            interpretation:
                'Cada etapa reduz a complexidade mantendo equivalência.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Resolva 2,4x−1,2=6.',
            steps: [
              'Some 1,2: 2,4x=7,2.',
              'Divida por 2,4.',
            ],
            result: 'x=3.',
            interpretation:
                'Decimais não mudam a lógica da resolução.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e verifique',
            content:
                '1. x+8=15.\n'
                '2. 3x=27.\n'
                '3. 4x−5=19.\n'
                '4. −2x+7=15.\n'
                '5. 5x+1=2x+16.\n'
                '6. 9−3x=18.\n'
                '7. 0,5x+2=7.\n'
                '8. 1,2x−0,6=3.\n'
                '9. 7x−4=7x+1.\n'
                '10. 6x+3=6x+3.\n'
                '11. Modele: o triplo de um número mais 2 é 20.\n'
                '12. Modele um custo fixo de 10 mais 4 por unidade totalizando 42.\n'
                '13. Explique o significado gráfico de ax+b=c.\n'
                '14. Verifique x=−3 em −4x=12.\n'
                '15. Explique por que a ≠ 0 na forma ax+b=0.',
            emphasis:
                'Nas questões 9 e 10, observe se a equação possui uma, nenhuma ou infinitas soluções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Linearidade é o primeiro modelo de taxa constante',
            content:
                'A função y=ax+b descreve taxa constante. No Cálculo, a derivada mede taxas locais e a reta tangente fornece uma aproximação linear. Equações lineares são a linguagem básica dessas ideias.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas para funções lineares e aproximação.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a solução de 3x−4=11?',
      choices: ['3', '5', '7'],
      correctIndex: 1,
      explanation:
          'Somando 4 aos dois membros, 3x=15. Dividindo por 3, x=5.',
    ),
    takeaways: [
      'Equações lineares genuínas têm a forma ax+b=0 com a ≠ 0.',
      'Isolar a variável exige operações equivalentes.',
      'Termos com variável podem aparecer nos dois membros.',
      'Decimais não alteram a lógica algébrica.',
      'Modelos lineares representam taxas constantes.',
      'A solução pode ser interpretada como interseção de retas.',
    ],
    closing:
        'Resolver uma equação linear é transformar uma relação até tornar explícito o único valor compatível com ela.',
  ),
  CourseLessonData(
    id: 'equations-03-parenteses-fracoes',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Equações lineares',
    title: 'Parênteses e frações',
    description: 'distributiva e denominadores',
    duration: '≈ 5 min',
    objective:
        'resolver equações com parênteses e frações preparando a expressão antes de isolar a incógnita',
    symbol: 'x/3',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Prepare antes de isolar',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Simplifique a estrutura',
            content:
                'Quando aparecem parênteses ou frações, simplifique a expressão '
                'antes de tentar deixar x sozinho. Use distributiva, reduza termos '
                'semelhantes ou elimine denominadores.',
            emphasis:
                'Uma equação complicada pode se transformar em uma equação linear simples.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Parênteses nos dois membros',
            problem: 'Resolva 3(x + 1) = 2x + 7.',
            steps: [
              'Aplique a distributiva: 3x + 3 = 2x + 7.',
              'Subtraia 2x dos dois lados: x + 3 = 7.',
              'Subtraia 3 dos dois lados: x = 4.',
            ],
            result: 'x = 4.',
            interpretation: 'A distributiva revelou uma equação linear comum.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Se x/5 + 2 = 6, qual é o valor de x?',
      choices: ['4', '8', '20'],
      correctIndex: 2,
      explanation:
          'Subtraindo 2, x/5 = 4. Multiplicando por 5, obtemos x = 20.',
    ),
    takeaways: [
      'Resolva parênteses com distributiva.',
      'Reduza termos semelhantes.',
      'Elimine denominadores quando isso facilitar.',
      'Preserve a equivalência em cada transformação.',
    ],
    closing:
        'Antes de atacar a incógnita, deixe a equação trabalhar a seu favor.',
  ),
  CourseLessonData(
    id: 'equations-04-casos-especiais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Interpretação',
    title: 'Uma, nenhuma ou infinitas soluções',
    description: 'identidades e contradições',
    duration: '≈ 5 min',
    objective:
        'distinguir equações com solução única, nenhuma solução ou infinitas soluções',
    symbol: '∅',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Nem toda equação termina em x = número',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Observe o que sobra',
            content:
                'Durante a simplificação, a incógnita pode desaparecer. '
                'Uma afirmação falsa representa contradição; uma afirmação '
                'sempre verdadeira representa identidade.',
            emphasis:
                '2 = 5 significa nenhuma solução. 2 = 2 significa infinitas soluções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Interprete o resultado',
        blocks: [
          WorkedExampleBlockData(
            title: 'Contradição',
            problem: 'Resolva 2(x + 1) = 2x + 5.',
            steps: [
              'Distribua: 2x + 2 = 2x + 5.',
              'Subtraia 2x dos dois lados: 2 = 5.',
              'A afirmação obtida é falsa.',
            ],
            result: 'A equação não possui solução.',
            interpretation:
                'Não existe valor de x capaz de tornar 2 = 5 verdadeiro.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'O que significa terminar uma equação com 7 = 7?',
      choices: ['Nenhuma solução', 'Apenas x = 7', 'Infinitas soluções'],
      correctIndex: 2,
      explanation:
          'Como a igualdade é sempre verdadeira, todos os valores permitidos satisfazem a equação.',
    ),
    takeaways: [
      'Uma solução produz x = número.',
      'Contradição significa nenhuma solução.',
      'Identidade significa infinitas soluções.',
      'O conjunto solução precisa ser interpretado.',
    ],
    closing:
        'Resolver também significa reconhecer quando não existe uma única resposta.',
  ),
  CourseLessonData(
    id: 'equations-05-sistemas-lineares',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Duas incógnitas',
    title: 'Sistemas de equações',
    description: 'substituição e eliminação',
    duration: '≈ 5 min',
    objective:
        'resolver sistemas lineares simples e interpretar a solução como um par ordenado',
    symbol: '{x,y}',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Duas condições ao mesmo tempo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A solução precisa satisfazer as duas equações',
            content:
                'Um sistema reúne duas ou mais equações. Em um sistema com x e y, '
                'buscamos um par de valores que torne todas as equações verdadeiras simultaneamente.',
            emphasis: 'Resolver apenas uma das equações não resolve o sistema.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Elimine uma incógnita',
        blocks: [
          WorkedExampleBlockData(
            title: 'Método da adição',
            problem: 'x + y = 7\nx − y = 1',
            steps: [
              'Some as duas equações.',
              'y e −y se cancelam: 2x = 8.',
              'Divida por 2: x = 4.',
              'Substitua em x + y = 7: y = 3.',
            ],
            result: 'A solução é (4, 3).',
            interpretation:
                'O par x = 4 e y = 3 satisfaz simultaneamente as duas equações.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Se x + y = 10 e x − y = 2, quanto vale x?',
      choices: ['4', '6', '8'],
      correctIndex: 1,
      explanation: 'Somando as equações, obtemos 2x = 12. Portanto, x = 6.',
    ),
    takeaways: [
      'Um sistema impõe várias condições simultâneas.',
      'Substituição troca uma incógnita por expressão equivalente.',
      'Eliminação cancela uma incógnita.',
      'A resposta pode ser representada por um par ordenado.',
    ],
    closing:
        'Sistemas transformam várias informações em uma solução compatível.',
  ),
  CourseLessonData(
    id: 'equations-06-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Segundo grau',
    title: 'Equações quadráticas',
    description: 'raízes, fatoração e produto nulo',
    duration: '≈ 5 min',
    objective:
        'resolver equações quadráticas simples usando fatoração e produto nulo',
    symbol: 'x²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Agora podem existir duas raízes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'O grau muda o comportamento',
            content:
                'Uma equação quadrática possui termo com x². Ela pode possuir '
                'duas raízes reais, uma raiz repetida ou nenhuma raiz real.',
            emphasis: 'Se AB = 0, então A = 0 ou B = 0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Transforme em produto',
        blocks: [
          WorkedExampleBlockData(
            title: 'Fatoração e produto nulo',
            problem: 'Resolva x² − 5x + 6 = 0.',
            steps: [
              'Fatore: (x − 2)(x − 3) = 0.',
              'Então x − 2 = 0 ou x − 3 = 0.',
              'Resolva cada equação.',
            ],
            result: 'x = 2 ou x = 3.',
            interpretation: 'Cada fator pode tornar o produto igual a zero.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Quais são as soluções de x² − 9 = 0?',
      choices: ['Somente x = 3', 'x = −3 ou x = 3', 'x = 9'],
      correctIndex: 1,
      explanation: 'x² − 9 = (x − 3)(x + 3), então x = 3 ou x = −3.',
    ),
    takeaways: [
      'Equações quadráticas possuem termo x².',
      'Fatoração pode revelar as raízes.',
      'Produto nulo permite separar fatores.',
      'Uma equação quadrática pode ter mais de uma solução.',
    ],
    closing:
        'A fatoração conecta diretamente a Álgebra à resolução de equações quadráticas.',
  ),
  CourseLessonData(
    id: 'equations-07-inequacoes',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Desigualdades',
    title: 'Inequações',
    description: 'intervalos e inversão do sinal',
    duration: '≈ 5 min',
    objective:
        'resolver inequações lineares e interpretar a solução como conjunto de valores',
    symbol: '≤',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A resposta agora é uma região',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Não buscamos apenas um número',
            content:
                'Uma inequação compara valores usando <, >, ≤ ou ≥. '
                'A solução costuma ser um conjunto de números.',
            emphasis: 'x > 4 representa todos os números reais maiores que 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'O cuidado mais importante',
        blocks: [
          WorkedExampleBlockData(
            title: 'Divisão por número negativo',
            problem: 'Resolva −3x > 12.',
            steps: [
              'Divida os dois lados por −3.',
              'Como a divisão é por número negativo, inverta > para <.',
              'Obtenha x < −4.',
            ],
            result: 'A solução é x < −4.',
            interpretation:
                'Sem inverter o sinal, o conjunto solução seria incorreto.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a solução de −2x ≤ 8?',
      choices: ['x ≤ −4', 'x ≥ −4', 'x ≥ 4'],
      correctIndex: 1,
      explanation: 'Dividindo por −2, invertemos ≤ para ≥. Portanto, x ≥ −4.',
    ),
    takeaways: [
      'Inequações descrevem conjuntos de valores.',
      'Soma e subtração preservam a desigualdade.',
      'Multiplicar ou dividir por negativo inverte o sinal.',
      'A solução pode ser representada na reta numérica.',
    ],
    closing:
        'Nas inequações, preservar a ordem é tão importante quanto isolar a incógnita.',
  ),
  CourseLessonData(
    id: 'equations-08-modulo-revisao',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Consolidação',
    title: 'Módulo e estratégia final',
    description: 'distância, duas possibilidades e revisão',
    duration: '≈ 5 min',
    objective:
        'interpretar equações modulares simples e escolher estratégias adequadas para diferentes problemas',
    symbol: '|x|',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Módulo representa distância',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Distância nunca é negativa',
            content:
                'O valor absoluto |x| representa a distância entre x e zero. '
                'Por isso, |x| = 5 possui duas soluções: 5 e −5.',
            emphasis: '|x| = a, com a > 0, normalmente produz x = a ou x = −a.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Escolha a ferramenta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Antes de calcular, classifique',
            content:
                'Observe se existem parênteses, frações, x², duas incógnitas, '
                'desigualdade ou valor absoluto. A estrutura indica a estratégia.',
            emphasis:
                'Reconhecer o tipo do problema reduz erros e evita fórmulas desnecessárias.',
          ),
          WorkedExampleBlockData(
            title: 'Equação modular',
            problem: 'Resolva |x| = 7.',
            steps: [
              'Interprete |x| como distância até zero.',
              'Existem dois pontos a sete unidades do zero.',
              'Esses pontos são 7 e −7.',
            ],
            result: 'x = −7 ou x = 7.',
            interpretation: 'As duas soluções possuem o mesmo valor absoluto.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Quais valores resolvem |x| = 3?',
      choices: ['Somente x = 3', 'x = −3 ou x = 3', 'x = 0 ou x = 3'],
      correctIndex: 1,
      explanation:
          'Tanto −3 quanto 3 estão a três unidades de distância do zero.',
    ),
    takeaways: [
      'Valor absoluto representa distância.',
      'Equações modulares podem produzir duas soluções.',
      'A estrutura indica a estratégia adequada.',
      'Verificar a solução continua sendo fundamental.',
    ],
    closing:
        'Você agora possui uma base sólida para enfrentar diferentes equações e inequações.',
  ),
];
