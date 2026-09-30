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
    title: 'Equações com parênteses e frações',
    description:
        'distributiva, denominadores, mínimo múltiplo comum e preservação do domínio',
    duration: '≈ 32 min',
    objective:
        'resolver equações lineares com parênteses e frações, eliminar denominadores com segurança, preservar restrições e organizar a expressão antes de isolar a incógnita',
    symbol: 'x/3',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Prepare a estrutura antes de isolar x',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Simplificar primeiro reduz erros',
            content:
                'Quando uma equação contém parênteses, frações ou vários termos, a estratégia mais segura é organizar a estrutura antes de tentar isolar a variável. Isso pode exigir distributiva, redução de termos semelhantes ou eliminação de denominadores.',
            emphasis:
                'Uma equação visualmente complexa pode se reduzir a uma equação linear comum.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Parênteses e distributiva',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Distribua para todos os termos',
            content:
                'Em a(b+c)=ab+ac, o fator externo multiplica cada termo interno. Um sinal negativo antes do parêntese equivale a multiplicar todo o agrupamento por −1.',
            emphasis:
                'Remover parênteses sem distribuir corretamente altera a equação.',
          ),
          WorkedExampleBlockData(
            title: 'Parênteses nos dois membros',
            problem: 'Resolva 3(x+1)=2x+7.',
            steps: [
              'Aplique a distributiva: 3x+3=2x+7.',
              'Subtraia 2x dos dois membros: x+3=7.',
              'Subtraia 3: x=4.',
              'Verifique na equação original: 3(5)=15 e 2·4+7=15.',
            ],
            result: 'S={4}.',
            interpretation:
                'A distributiva revelou uma equação linear simples.',
          ),
          WorkedExampleBlockData(
            title: 'Sinal negativo antes do parêntese',
            problem: 'Resolva 5−2(x−3)=9.',
            steps: [
              'Distribua −2: 5−2x+6=9.',
              'Combine constantes: 11−2x=9.',
              'Subtraia 11: −2x=−2.',
              'Divida por −2: x=1.',
            ],
            result: 'S={1}.',
            interpretation:
                'O termo −3 mudou de efeito porque foi multiplicado por −2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Frações simples',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Multiplicar por um denominador pode simplificar a equação',
            content:
                'Se uma equação contém uma fração como x/5, multiplicar todos os membros por 5 elimina esse denominador sem alterar o conjunto solução.',
            emphasis:
                'A multiplicação deve atingir todos os termos dos dois membros.',
          ),
          WorkedExampleBlockData(
            title: 'Uma fração',
            problem: 'Resolva x/5+2=6.',
            steps: [
              'Subtraia 2: x/5=4.',
              'Multiplique ambos os membros por 5.',
            ],
            result: 'x=20.',
            interpretation:
                'A fração pode ser eliminada por uma operação equivalente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Múltiplos denominadores e MMC',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Use o mínimo múltiplo comum',
            content:
                'Quando aparecem denominadores numéricos diferentes, multiplicar toda a equação pelo MMC dos denominadores elimina todas as frações em uma única etapa.',
            emphasis:
                'O MMC reduz o número de operações e ajuda a evitar erros aritméticos.',
          ),
          WorkedExampleBlockData(
            title: 'Eliminando dois denominadores',
            problem: 'Resolva x/3+x/4=7.',
            steps: [
              'MMC(3,4)=12.',
              'Multiplique toda a equação por 12.',
              '12·x/3 + 12·x/4 = 12·7.',
              'Obtenha 4x+3x=84.',
              'Então 7x=84 e x=12.',
            ],
            result: 'S={12}.',
            interpretation:
                'A equação fracionária foi convertida em uma equação inteira equivalente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Frações com expressões no numerador',
        blocks: [
          WorkedExampleBlockData(
            title: 'Agrupamento no numerador',
            problem: 'Resolva (x+2)/3=(2x−1)/5.',
            steps: [
              'MMC(3,5)=15.',
              'Multiplique ambos os membros por 15.',
              'Obtenha 5(x+2)=3(2x−1).',
              'Distribua: 5x+10=6x−3.',
              'Subtraia 5x: 10=x−3.',
              'Some 3: x=13.',
            ],
            result: 'S={13}.',
            interpretation:
                'Eliminar denominadores pode produzir parênteses que precisam ser distribuídos em seguida.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Denominadores com variável',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Determine o domínio antes de multiplicar',
            content:
                'Se a variável aparece no denominador, valores que zeram o denominador são proibidos. Essas restrições devem ser registradas antes de qualquer simplificação.',
            emphasis:
                'Multiplicar pela expressão denominadora não restaura valores excluídos do domínio.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Restrição de domínio',
            problem: 'Resolva 2/(x−1)=1, com x ≠ 1.',
            steps: [
              'Registre a restrição x ≠ 1.',
              'Multiplique ambos os membros por x−1.',
              'Obtenha 2=x−1.',
              'Some 1: x=3.',
              'Verifique que 3 respeita a restrição.',
            ],
            result: 'S={3}.',
            interpretation:
                'A condição x ≠ 1 pertence à equação original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Uma estratégia geral',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Ordem recomendada',
            content:
                '1) determine restrições de domínio; 2) aplique distributiva quando necessário; 3) elimine denominadores; 4) reduza termos semelhantes; 5) reúna termos com variável; 6) isole a variável; 7) verifique a solução na equação original.',
            emphasis:
                'A ordem pode variar, mas domínio e verificação nunca devem ser ignorados.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplicar apenas parte da equação pelo MMC',
            content:
                'Ao eliminar denominadores, o fator escolhido deve multiplicar todos os termos dos dois membros, não apenas as frações.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelar termos dentro de uma soma',
            content:
                'Em (x+2)/x, não podemos cancelar x com apenas um termo do numerador. Cancelamento exige fatores comuns.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer restrições de domínio',
            content:
                'Se x=1 zera um denominador original, esse valor continua proibido mesmo que o denominador desapareça após uma transformação.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — parênteses',
            problem: 'Resolva 2(3x−1)+4=x+15.',
            steps: [
              'Distribua: 6x−2+4=x+15.',
              'Reduza: 6x+2=x+15.',
              'Subtraia x: 5x+2=15.',
              'Subtraia 2: 5x=13.',
            ],
            result: 'x=13/5.',
            interpretation:
                'Nem toda equação linear produz solução inteira.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — frações',
            problem: 'Resolva (x−1)/2+(x+3)/4=5.',
            steps: [
              'MMC(2,4)=4.',
              'Multiplique tudo por 4: 2(x−1)+(x+3)=20.',
              'Distribua e reduza: 2x−2+x+3=20.',
              '3x+1=20.',
              '3x=19.',
            ],
            result: 'x=19/3.',
            interpretation:
                'O MMC elimina as frações sem exigir cálculo decimal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e verifique',
            content:
                '1. 2(x+4)=18.\n'
                '2. 3(x−2)+5=14.\n'
                '3. 5−(x+1)=2.\n'
                '4. 4−2(3x−1)=10.\n'
                '5. x/3+2=7.\n'
                '6. x/4+x/2=9.\n'
                '7. (x+1)/2=5.\n'
                '8. (2x−3)/5=(x+1)/2.\n'
                '9. x/6−x/4=1.\n'
                '10. 2/(x−3)=1, com domínio adequado.\n'
                '11. Determine a restrição de 1/(x+2)=3.\n'
                '12. Explique por que o MMC deve multiplicar todos os termos.\n'
                '13. Resolva 2(x−1)/3 + x/2 = 5.\n'
                '14. Verifique a solução de (x+2)/3=(2x−1)/5.\n'
                '15. Explique por que domínio deve ser analisado antes da simplificação.',
            emphasis:
                'Nas equações com variável no denominador, escreva primeiro os valores proibidos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Frações e restrições aparecem continuamente no Cálculo',
            content:
                'Funções racionais, limites e quocientes incrementais exigem manipulação segura de denominadores. A prática de registrar domínio antes de simplificar prepara diretamente esses tópicos.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas para funções racionais, domínio e limites.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a solução de x/5+2=6?',
      choices: ['4', '8', '20'],
      correctIndex: 2,
      explanation:
          'Subtraindo 2, obtemos x/5=4. Multiplicando os dois membros por 5, x=20.',
    ),
    takeaways: [
      'Parênteses exigem distributiva correta antes da redução.',
      'Frações podem ser eliminadas multiplicando toda a equação por um denominador comum.',
      'O MMC é útil quando existem vários denominadores numéricos.',
      'Variáveis no denominador criam restrições de domínio.',
      'Cancelamentos exigem fatores, não termos de uma soma.',
      'A solução deve ser verificada na equação original.',
    ],
    closing:
        'Equações com parênteses e frações ficam controláveis quando a estrutura é preparada antes de isolar a variável.',
  ),
  CourseLessonData(
    id: 'equations-04-casos-especiais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Equações lineares',
    title: 'Casos especiais em equações lineares',
    description:
        'uma solução, nenhuma solução, infinitas soluções e interpretação algébrica e gráfica',
    duration: '≈ 26 min',
    objective:
        'classificar equações lineares em uma solução, nenhuma solução ou infinitas soluções, reconhecer identidades e contradições e interpretar cada caso graficamente',
    symbol: '0=0',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Nem toda equação linear termina em x = número',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Três comportamentos possíveis',
            content:
                'Ao simplificar uma equação linear, podemos chegar a três tipos de conclusão: uma igualdade que determina x, uma afirmação verdadeira para todo x permitido, ou uma afirmação impossível.',
            emphasis:
                'O resultado final da simplificação revela o conjunto solução.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Uma solução',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Coeficiente da variável permanece não nulo',
            content:
                'Quando a simplificação leva a ax=b com a ≠ 0, existe exatamente uma solução: x=b/a.',
          ),
          WorkedExampleBlockData(
            title: 'Caso usual',
            problem: 'Resolva 3x+5=17.',
            steps: [
              'Subtraia 5: 3x=12.',
              'Divida por 3: x=4.',
            ],
            result: 'S={4}.',
            interpretation:
                'A variável permaneceu com coeficiente não nulo, então a solução é única.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Infinitas soluções',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A equação se transforma em uma identidade',
            content:
                'Se todos os termos se cancelam e obtemos uma igualdade sempre verdadeira, como 0=0 ou 5=5, então toda entrada do domínio satisfaz a equação.',
            emphasis:
                'Nesse caso, os dois membros representam expressões equivalentes.',
          ),
          WorkedExampleBlockData(
            title: 'Identidade disfarçada',
            problem: 'Resolva 2(x+3)=2x+6.',
            steps: [
              'Distribua: 2x+6=2x+6.',
              'Subtraia 2x dos dois membros: 6=6.',
              'A igualdade é verdadeira independentemente de x.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'As duas expressões são equivalentes para todo número real.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Nenhuma solução',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A equação se transforma em uma contradição',
            content:
                'Se a variável desaparece e sobra uma afirmação falsa, como 0=4 ou 3=−2, então nenhum valor pode satisfazer a equação.',
            emphasis:
                'A ausência da variável não significa automaticamente infinitas soluções; é preciso verificar se a igualdade final é verdadeira ou falsa.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Contradição',
            problem: 'Resolva 4x+1=4x+7.',
            steps: [
              'Subtraia 4x dos dois membros.',
              'Obtenha 1=7.',
              'Essa afirmação é falsa.',
            ],
            result: 'S=∅.',
            interpretation:
                'Nenhum número real pode transformar uma contradição em verdade.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Forma geral ax+b=cx+d',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Compare os coeficientes',
            content:
                'Em ax+b=cx+d, reunimos os termos para obter (a−c)x=d−b. Se a−c ≠ 0, há uma solução. Se a−c=0, então resta comparar d−b com zero.',
            emphasis:
                'Se a=c e b=d, há infinitas soluções. Se a=c e b≠d, não há solução.',
          ),
          WorkedExampleBlockData(
            title: 'Classificação sem resolver tudo',
            problem: 'Classifique 7x−2=7x−2 e 7x−2=7x+4.',
            steps: [
              'Na primeira, coeficientes e constantes coincidem.',
              'Na segunda, os coeficientes de x coincidem, mas as constantes não.',
            ],
            result: 'Primeira: infinitas soluções. Segunda: nenhuma solução.',
            interpretation:
                'A comparação estrutural permite prever o resultado antes de concluir a álgebra.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Interpretação gráfica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Interseções entre retas',
            content:
                'Resolver ax+b=cx+d equivale a encontrar as interseções das retas y=ax+b e y=cx+d. Uma interseção corresponde a uma solução; retas coincidentes correspondem a infinitas soluções; retas paralelas distintas correspondem a nenhuma solução.',
            emphasis:
                'Álgebra e geometria descrevem os mesmos três casos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Domínio ainda importa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Identidade no domínio, não necessariamente em todos os reais',
            content:
                'Se a equação original possui denominadores ou outras restrições, uma identidade após simplificação vale apenas nos valores permitidos pelo domínio original.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Identidade com ponto excluído',
            problem: 'Considere (x−1)/(x−1)=1.',
            steps: [
              'A expressão original exige x ≠ 1.',
              'Para todo x ≠ 1, o lado esquerdo simplifica para 1.',
            ],
            result: 'S=ℝ\{1}.',
            interpretation:
                'A identidade vale em todo o domínio original, mas o ponto proibido não retorna.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Interpretar 0=0 como x=0',
            content:
                '0=0 não determina x. Significa que a equação é verdadeira para todo valor permitido.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Interpretar 0=5 como x=5',
            content:
                '0=5 é uma contradição, portanto o conjunto solução é vazio.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar domínio em uma identidade',
            content:
                'Uma simplificação para 1=1 não autoriza valores que já eram proibidos na equação original.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — identidade',
            problem: 'Resolva 3(x+2)=3x+6.',
            steps: [
              'Distribua: 3x+6=3x+6.',
              'Subtraia 3x: 6=6.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'A igualdade é verdadeira para todo real.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — contradição',
            problem: 'Resolva 5(x−1)=5x+2.',
            steps: [
              'Distribua: 5x−5=5x+2.',
              'Subtraia 5x: −5=2.',
            ],
            result: 'S=∅.',
            interpretation:
                'A afirmação final é impossível.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva ou classifique',
            content:
                '1. 2x+3=11.\n'
                '2. 4x−7=4x−7.\n'
                '3. 5x+2=5x−1.\n'
                '4. 3(x+4)=3x+12.\n'
                '5. 2(x−1)=2x+5.\n'
                '6. 7x−3=4x+9.\n'
                '7. 6x+1=6x+1.\n'
                '8. 8x−2=8x+10.\n'
                '9. Classifique ax+b=ax+b.\n'
                '10. Classifique ax+b=ax+d com b≠d.\n'
                '11. Interprete graficamente uma equação sem solução.\n'
                '12. Interprete graficamente uma equação com infinitas soluções.\n'
                '13. Explique por que 0=0 não significa x=0.\n'
                '14. Resolva (x−2)/(x−2)=1 considerando o domínio.\n'
                '15. Crie uma equação linear com exatamente uma solução, outra sem solução e outra com infinitas soluções.',
            emphasis:
                'Sempre escreva explicitamente o conjunto solução.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Número de soluções é número de interseções',
            content:
                'A classificação de equações prepara a leitura de sistemas, zeros de funções e interseções de gráficos. Em problemas de Cálculo, a mesma lógica ajuda a interpretar equações de tangentes, extremos e pontos críticos.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas para interpretação gráfica de equações e funções.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o conjunto solução de 2(x+3)=2x+6?',
      choices: ['{0}', '∅', 'ℝ'],
      correctIndex: 2,
      explanation:
          'Distribuindo, obtemos 2x+6=2x+6, uma identidade verdadeira para todo x real.',
    ),
    takeaways: [
      'Equações lineares podem ter uma, nenhuma ou infinitas soluções.',
      'Uma igualdade verdadeira após o cancelamento indica identidade.',
      'Uma igualdade falsa após o cancelamento indica contradição.',
      'A forma ax+b=cx+d permite classificar os casos pelos coeficientes.',
      'Graficamente, soluções correspondem a interseções de retas.',
      'Restrições do domínio continuam válidas mesmo em identidades.',
    ],
    closing:
        'Casos especiais deixam claro que resolver uma equação também significa decidir quantas soluções existem e por quê.',
  ),
  CourseLessonData(
    id: 'equations-05-sistemas-lineares',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Sistemas lineares',
    title: 'Sistemas lineares de duas equações',
    description:
        'solução como interseção, substituição, eliminação, classificação e modelagem',
    duration: '≈ 34 min',
    objective:
        'resolver sistemas lineares de duas equações por substituição e eliminação, interpretar a solução como interseção de retas e classificar sistemas como determinados, impossíveis ou indeterminados',
    symbol: '{x+y',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'O que é um sistema linear',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Duas condições devem ser satisfeitas ao mesmo tempo',
            content:
                'Um sistema linear em duas variáveis reúne duas equações que devem ser verdadeiras simultaneamente. Uma solução é um par ordenado (x,y) que satisfaz ambas.',
            emphasis:
                'Resolver o sistema significa encontrar a interseção dos conjuntos solução das duas equações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Interpretação gráfica',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Cada equação linear representa uma reta',
            content:
                'Em duas variáveis, ax+by=c representa uma reta. A solução do sistema é o ponto em que as duas retas se intersectam, quando essa interseção existe.',
            emphasis:
                'Uma interseção: solução única. Retas paralelas distintas: nenhuma solução. Retas coincidentes: infinitas soluções.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Método da substituição',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Isole uma variável e substitua',
            content:
                'Na substituição, resolvemos uma das equações para uma variável e inserimos essa expressão na outra equação. O sistema então se reduz a uma equação em uma variável.',
          ),
          WorkedExampleBlockData(
            title: 'Substituição passo a passo',
            problem: 'Resolva x+y=7 e x−y=1.',
            steps: [
              'Da primeira equação, isole x: x=7−y.',
              'Substitua na segunda: (7−y)−y=1.',
              'Simplifique: 7−2y=1.',
              'Então −2y=−6 e y=3.',
              'Substitua em x=7−y: x=4.',
            ],
            result: '(x,y)=(4,3).',
            interpretation:
                'O par encontrado satisfaz simultaneamente as duas equações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Método da eliminação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Faça uma variável desaparecer',
            content:
                'Na eliminação, combinamos as equações de modo que os coeficientes de uma variável sejam opostos. Ao somar as equações, essa variável é eliminada.',
          ),
          WorkedExampleBlockData(
            title: 'Eliminação direta',
            problem: 'Resolva 2x+y=8 e 3x−y=7.',
            steps: [
              'Some as equações: 5x=15.',
              'Logo, x=3.',
              'Substitua em 2x+y=8: 6+y=8.',
              'Então y=2.',
            ],
            result: '(x,y)=(3,2).',
            interpretation:
                'Os coeficientes +1 e −1 de y permitiram eliminação imediata.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Quando é preciso multiplicar uma equação',
        blocks: [
          WorkedExampleBlockData(
            title: 'Preparando a eliminação',
            problem: 'Resolva x+2y=7 e 3x+y=8.',
            steps: [
              'Multiplique a segunda equação por −2: −6x−2y=−16.',
              'Some com a primeira: −5x=−9.',
              'Então x=9/5.',
              'Substitua em x+2y=7.',
              'Obtenha 9/5+2y=7, então 2y=26/5 e y=13/5.',
            ],
            result: '(x,y)=(9/5,13/5).',
            interpretation:
                'Nem todo sistema possui solução inteira; o método continua válido.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Classificação dos sistemas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Determinado, impossível e indeterminado',
            content:
                'Um sistema possível e determinado possui uma única solução. Um sistema impossível não possui solução. Um sistema possível e indeterminado possui infinitas soluções.',
            emphasis:
                'Graficamente: retas concorrentes, paralelas distintas ou coincidentes.',
          ),
          WorkedExampleBlockData(
            title: 'Sistema impossível',
            problem: 'Classifique x+y=4 e 2x+2y=10.',
            steps: [
              'Multiplique a primeira equação por 2: 2x+2y=8.',
              'A segunda afirma 2x+2y=10.',
              'As duas condições são incompatíveis.',
            ],
            result: 'Sistema impossível: S=∅.',
            interpretation:
                'As retas têm a mesma inclinação e interceptos diferentes.',
          ),
          WorkedExampleBlockData(
            title: 'Sistema indeterminado',
            problem: 'Classifique x−2y=3 e 2x−4y=6.',
            steps: [
              'A segunda equação é exatamente o dobro da primeira.',
              'As duas representam a mesma reta.',
            ],
            result: 'Infinitas soluções.',
            interpretation:
                'Todo ponto da reta satisfaz as duas equações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Modelagem com sistemas',
        blocks: [
          WorkedExampleBlockData(
            title: 'Problema de quantidades',
            problem: 'Foram vendidos 30 ingressos entre inteiros e meia-entrada. Inteira custa R$ 20, meia R$ 10, e a arrecadação foi R$ 450. Quantos de cada foram vendidos?',
            steps: [
              'Defina x = número de inteiras e y = número de meias.',
              'Quantidade total: x+y=30.',
              'Arrecadação: 20x+10y=450.',
              'Divida a segunda por 10: 2x+y=45.',
              'Subtraia a primeira: x=15.',
              'Então y=15.',
            ],
            result: '15 ingressos inteiros e 15 meias.',
            interpretation:
                'As duas equações representam duas informações independentes do mesmo problema.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Resolver apenas uma equação',
            content:
                'Uma solução de uma equação isolada não é necessariamente solução do sistema. O par deve satisfazer ambas.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Somar equações sem preparar coeficientes',
            content:
                'Na eliminação, os coeficientes da variável escolhida precisam cancelar. Somar equações arbitrariamente pode não simplificar o sistema.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não verificar o par final',
            content:
                'Substitua o par encontrado nas duas equações originais para confirmar a solução.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — substituição',
            problem: 'Resolva y=2x+1 e x+y=10.',
            steps: [
              'Substitua y na segunda: x+(2x+1)=10.',
              '3x+1=10.',
              '3x=9 e x=3.',
              'Então y=7.',
            ],
            result: '(3,7).',
            interpretation:
                'Quando uma variável já está isolada, substituição tende a ser eficiente.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — eliminação',
            problem: 'Resolva 4x+3y=18 e 2x−3y=0.',
            steps: [
              'Some as equações: 6x=18.',
              'x=3.',
              'Substitua em 2x−3y=0: 6−3y=0.',
              'y=2.',
            ],
            result: '(3,2).',
            interpretation:
                'Os coeficientes de y já eram opostos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva, classifique e interprete',
            content:
                '1. x+y=8 e x−y=2.\n'
                '2. 2x+y=9 e x−y=0.\n'
                '3. y=3x−2 e x+y=10.\n'
                '4. 3x+2y=12 e x−2y=4.\n'
                '5. x+2y=5 e 2x+4y=10.\n'
                '6. x+y=3 e 2x+2y=8.\n'
                '7. Classifique graficamente duas retas paralelas distintas.\n'
                '8. Classifique graficamente duas retas coincidentes.\n'
                '9. Crie um sistema com solução (2,1).\n'
                '10. Verifique se (3,2) resolve 2x+y=8 e x−y=1.\n'
                '11. Resolva 5x−y=11 e 2x+y=7.\n'
                '12. Resolva 2x+3y=13 e 4x−3y=5.\n'
                '13. Explique quando substituição é mais conveniente.\n'
                '14. Explique quando eliminação é mais conveniente.\n'
                '15. Modele um problema simples usando duas incógnitas.',
            emphasis:
                'Sempre apresente a solução como par ordenado e verifique nas duas equações.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Conexão com funções, geometria e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Sistemas são problemas de interseção',
            content:
                'Sistemas lineares conectam álgebra e geometria analítica. Mais adiante, interseções de curvas, condições simultâneas e sistemas de equações aparecem em otimização, derivadas parciais e modelagem.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Thomas e Stewart para interpretação geométrica e modelagem.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a solução do sistema x+y=7 e x−y=1?',
      choices: ['(3,4)', '(4,3)', '(7,1)'],
      correctIndex: 1,
      explanation:
          'Somando as equações, 2x=8, então x=4. Substituindo em x+y=7, y=3.',
    ),
    takeaways: [
      'Uma solução de sistema satisfaz todas as equações simultaneamente.',
      'Substituição reduz o sistema usando uma variável isolada.',
      'Eliminação cancela uma variável pela combinação das equações.',
      'Sistemas podem ter uma, nenhuma ou infinitas soluções.',
      'Graficamente, a classificação depende das interseções das retas.',
      'Sistemas modelam situações com duas condições simultâneas.',
    ],
    closing:
        'Resolver um sistema é encontrar os valores que tornam várias condições verdadeiras ao mesmo tempo.',
  ),
  CourseLessonData(
    id: 'equations-06-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Segundo grau',
    title: 'Equações quadráticas',
    description:
        'forma geral, fatoração, completar quadrados, fórmula quadrática, discriminante e interpretação gráfica',
    duration: '≈ 40 min',
    objective:
        'resolver equações quadráticas por diferentes métodos, interpretar o discriminante, relacionar raízes e gráfico da parábola, reconhecer multiplicidade e escolher uma estratégia adequada',
    symbol: 'ax²+bx+c',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição e forma geral',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Equação quadrática em uma variável',
            content:
                'Uma equação quadrática pode ser escrita na forma [[math:ax^2+bx+c=0]], com a, b e c reais e [[math:a\\ne 0]]. O coeficiente a não pode ser zero, pois nesse caso o termo quadrático desaparece e a equação deixa de ser de segundo grau.',
            emphasis:
                'O grau é determinado pelo maior expoente da variável depois de a expressão ser reduzida.',
          ),
          WorkedExampleBlockData(
            title: 'Identificando coeficientes',
            problem: 'Na equação 3x²−7x+2=0, identifique a, b e c.',
            steps: [
              'Compare com ax²+bx+c=0.',
              'O coeficiente de x² é 3.',
              'O coeficiente de x é −7.',
              'O termo constante é 2.',
            ],
            result: 'a=3, b=−7 e c=2.',
            interpretation:
                'O sinal faz parte do coeficiente: b é −7, não 7.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Quantas soluções reais podem existir',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Duas, uma ou nenhuma raiz real',
            content:
                'Uma equação quadrática real pode ter duas raízes reais distintas, uma raiz real dupla ou nenhuma raiz real. A quantidade de raízes reais será determinada mais adiante pelo discriminante.',
            emphasis:
                'Raiz ou zero é um valor de x que torna a expressão quadrática igual a zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Produto nulo e fatoração',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Se AB=0, então A=0 ou B=0',
            content:
                'A propriedade do produto nulo permite transformar uma equação fatorada em equações mais simples. Por isso a fatoração é um dos métodos mais eficientes quando o trinômio admite fatores evidentes.',
          ),
          WorkedExampleBlockData(
            title: 'Fatoração direta',
            problem: 'Resolva x²−5x+6=0.',
            steps: [
              'Procure dois números com soma −5 e produto 6: −2 e −3.',
              'Fatore: (x−2)(x−3)=0.',
              'Pelo produto nulo: x−2=0 ou x−3=0.',
            ],
            result: 'S={2,3}.',
            interpretation:
                'Cada raiz corresponde a um fator linear que se anula.',
          ),
          WorkedExampleBlockData(
            title: 'Fator comum antes do produto nulo',
            problem: 'Resolva 2x²−8x=0.',
            steps: [
              'Fatore o fator comum: 2x(x−4)=0.',
              'Como 2 não é zero, resta x=0 ou x−4=0.',
            ],
            result: 'S={0,4}.',
            interpretation:
                'Fator comum deve ser procurado antes de técnicas mais complexas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Equações do tipo x²=k',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Extração de raiz exige ±',
            content:
                'Se x²=k com k>0, então [[math:x=\\pm\\sqrt{k}]]. Se k=0, a única solução é x=0. Se k<0, não existe solução real.',
            emphasis:
                'A notação √k representa a raiz principal não negativa; o ± aparece porque estamos resolvendo uma equação.',
          ),
          WorkedExampleBlockData(
            title: 'Duas raízes simétricas',
            problem: 'Resolva 4x²=36.',
            steps: [
              'Divida por 4: x²=9.',
              'Extraia a raiz considerando os dois sinais: x=±3.',
            ],
            result: 'S={−3,3}.',
            interpretation:
                'Os dois valores possuem o mesmo quadrado.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Completar quadrados',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Transforme em um quadrado perfeito',
            content:
                'Completar quadrados reescreve a expressão quadrática em uma forma como [[math:(x-h)^2=k]]. Para x²+bx, adicionamos e subtraímos [[math:(b/2)^2]].',
            emphasis:
                'Esse método não é apenas uma técnica de resolução; ele também conduz à forma de vértice da parábola.',
          ),
          WorkedExampleBlockData(
            title: 'Completar quadrados passo a passo',
            problem: 'Resolva x²+6x+5=0.',
            steps: [
              'Passe 5 para o outro membro: x²+6x=−5.',
              'Metade de 6 é 3; seu quadrado é 9.',
              'Some 9 aos dois membros: x²+6x+9=4.',
              'Reescreva: (x+3)²=4.',
              'Extraia a raiz: x+3=±2.',
            ],
            result: 'S={−5,−1}.',
            interpretation:
                'Completar quadrados revela a estrutura de quadrado perfeito escondida no trinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Fórmula quadrática',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Uma fórmula geral',
            content:
                'Para [[math:ax^2+bx+c=0]], com [[math:a\\ne0]], as soluções são dadas por [[math:x=\\frac{-b\\pm\\sqrt{b^2-4ac}}{2a}]]. A fórmula pode ser deduzida completando quadrados na equação geral.',
            emphasis:
                'A fórmula não substitui a compreensão algébrica: os coeficientes devem ser identificados com seus sinais corretos.',
          ),
          WorkedExampleBlockData(
            title: 'Aplicando a fórmula',
            problem: 'Resolva 2x²−3x−2=0.',
            steps: [
              'Identifique a=2, b=−3 e c=−2.',
              'Calcule o discriminante: Δ=(−3)²−4·2·(−2)=9+16=25.',
              'Substitua: x=[3±5]/4.',
              'Primeira raiz: x=8/4=2.',
              'Segunda raiz: x=−2/4=−1/2.',
            ],
            result: 'S={−1/2,2}.',
            interpretation:
                'O discriminante positivo produziu duas raízes reais distintas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Discriminante',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Δ=b²−4ac',
            content:
                'O número [[math:\\Delta=b^2-4ac]] determina a natureza das raízes reais. Se Δ>0, há duas raízes reais distintas. Se Δ=0, há uma raiz real dupla. Se Δ<0, não há raízes reais.',
            emphasis:
                'O discriminante responde quantas raízes reais existem antes mesmo de calculá-las.',
          ),
          WorkedExampleBlockData(
            title: 'Raiz dupla',
            problem: 'Analise x²−6x+9=0.',
            steps: [
              'a=1, b=−6, c=9.',
              'Δ=(−6)²−4·1·9=36−36=0.',
              'Logo existe uma raiz real dupla.',
              'Pela fatoração: (x−3)²=0.',
            ],
            result: 'x=3, com multiplicidade 2.',
            interpretation:
                'A parábola toca o eixo x em um único ponto.',
          ),
          WorkedExampleBlockData(
            title: 'Nenhuma raiz real',
            problem: 'Analise x²+4x+8=0.',
            steps: [
              'a=1, b=4, c=8.',
              'Δ=16−32=−16.',
            ],
            result: 'Não há raízes reais.',
            interpretation:
                'A parábola não intercepta o eixo x no conjunto dos reais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Raízes e gráfico da parábola',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Resolver f(x)=0 é procurar interceptos com o eixo x',
            content:
                'Para f(x)=ax²+bx+c, as raízes da equação f(x)=0 são exatamente as abscissas dos pontos em que o gráfico da parábola encontra o eixo x.',
            emphasis:
                'Duas raízes: duas interseções. Raiz dupla: tangência ao eixo x. Nenhuma raiz real: nenhuma interseção.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Relações entre raízes e coeficientes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Soma e produto das raízes',
            content:
                'Se x₁ e x₂ são as raízes de ax²+bx+c=0, então [[math:x_1+x_2=-\\frac{b}{a}]] e [[math:x_1x_2=\\frac{c}{a}]]. Essas relações seguem da fatoração [[math:a(x-x_1)(x-x_2)]].',
            emphasis:
                'Essas relações são úteis para verificar resultados e reconstruir equações.',
          ),
          WorkedExampleBlockData(
            title: 'Verificação pelas relações',
            problem: 'Para x²−5x+6=0, verifique as raízes 2 e 3.',
            steps: [
              'Soma: 2+3=5=−b/a.',
              'Produto: 2·3=6=c/a.',
            ],
            result: 'As relações confirmam as raízes.',
            interpretation:
                'Soma e produto fornecem uma verificação estrutural independente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Escolha do método',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Nem toda quadrática pede a fórmula',
            content:
                'Use fatoração quando os fatores forem reconhecíveis; extração de raiz quando a equação puder ser reduzida a (x−h)²=k; completar quadrados quando quiser revelar estrutura; fórmula quadrática quando precisar de um método geral.',
            emphasis:
                'Escolher o método adequado faz parte da competência algébrica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer o ±',
            content:
                'De x²=9 não segue apenas x=3. As duas soluções são x=−3 e x=3.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Usar b sem o sinal',
            content:
                'Em 2x²−3x−2=0, b=−3. Substituir b=3 altera o discriminante e a fórmula.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Aplicar produto nulo sem igualar a zero',
            content:
                'A propriedade AB=0 só pode ser usada quando um produto está igualado a zero.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — fatoração',
            problem: 'Resolva x²+x−12=0.',
            steps: [
              'Procure números com soma 1 e produto −12: 4 e −3.',
              'Fatore: (x+4)(x−3)=0.',
            ],
            result: 'S={−4,3}.',
            interpretation:
                'Fatoração é rápida quando o par de números é facilmente reconhecido.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — fórmula geral',
            problem: 'Resolva 3x²+x−1=0.',
            steps: [
              'a=3, b=1, c=−1.',
              'Δ=1²−4·3·(−1)=13.',
              'Substitua na fórmula.',
            ],
            result: '[[math:x=\\frac{-1\\pm\\sqrt{13}}{6}]].',
            interpretation:
                'Quando Δ não é quadrado perfeito, as raízes podem permanecer em forma radical exata.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e justifique o método escolhido',
            content:
                '1. x²−9=0.\n'
                '2. x²−7x+12=0.\n'
                '3. x²+5x+6=0.\n'
                '4. 2x²−8x=0.\n'
                '5. (x−4)²=9.\n'
                '6. x²+4x+4=0.\n'
                '7. 2x²+3x−2=0.\n'
                '8. x²+2x+5=0, no conjunto dos reais.\n'
                '9. Calcule Δ para 3x²−6x+3=0.\n'
                '10. Classifique o número de raízes de x²−2x+10=0.\n'
                '11. Resolva x²+6x+5=0 completando quadrados.\n'
                '12. Verifique soma e produto das raízes de x²−8x+15=0.\n'
                '13. Construa uma equação quadrática com raízes 2 e −5.\n'
                '14. Explique geometricamente o significado de Δ=0.\n'
                '15. Compare fatoração e fórmula quadrática para x²−5x+6=0.',
            emphasis:
                'Mantenha resultados exatos com radicais quando não houver razão para aproximar decimalmente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Quadráticas preparam otimização e análise de gráficos',
            content:
                'Parábolas aparecem em modelos de movimento, áreas, otimização e aproximações. No Cálculo, derivadas de funções quadráticas são lineares, e o vértice está ligado ao ponto crítico onde a derivada se anula.',
            emphasis:
                'A relação entre raízes, vértice e gráfico será usada novamente em funções e derivadas.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart, Thomas e Guidorizzi para funções quadráticas, gráficos e aplicações em Cálculo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Quais são as soluções de x²−9=0?',
      choices: ['Somente x=3', 'x=−3 ou x=3', 'x=9'],
      correctIndex: 1,
      explanation:
          'x²−9=(x−3)(x+3). Pelo produto nulo, x−3=0 ou x+3=0, portanto x=3 ou x=−3.',
    ),
    takeaways: [
      'Uma equação quadrática tem forma ax²+bx+c=0 com a≠0.',
      'Fatoração e produto nulo podem revelar raízes diretamente.',
      'Completar quadrados expõe a estrutura da parábola.',
      'A fórmula quadrática fornece um método geral de resolução.',
      'O discriminante determina a quantidade de raízes reais.',
      'Raízes são interceptos da parábola com o eixo x.',
      'Soma e produto das raízes se relacionam aos coeficientes.',
      'Escolher o método mais adequado é parte da resolução.',
    ],
    closing:
        'Equações quadráticas deixam de ser apenas uma fórmula quando fatoração, discriminante e geometria são compreendidos como partes da mesma estrutura.',
  )
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
