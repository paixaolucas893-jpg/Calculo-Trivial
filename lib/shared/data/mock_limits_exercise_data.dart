import 'package:calcquest/shared/data/mock_exercise_data.dart';

const List<ExerciseData> mockLimitsExercises = [
  ExerciseData(
    id: 'limite-substituicao-direta',
    title: 'Questão 1 de 10',
    contentLessonId: 'limites-03-propriedades',
    skill: 'Substituição direta em polinômios',
    statement: 'Calcule o limite:\n\nlim x → 3  (2x² - x + 1)',
    correctOptionId: 'd',
    explanation:
        'Como a função polinomial é contínua, podemos substituir x por 3 diretamente: 2(3²) - 3 + 1 = 18 - 3 + 1 = 16.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '10'),
      ExerciseOptionData(id: 'b', text: '12'),
      ExerciseOptionData(id: 'c', text: '15'),
      ExerciseOptionData(id: 'd', text: '16'),
    ],
  ),
  ExerciseData(
    id: 'limite-fatoracao',
    title: 'Questão 2 de 10',
    contentLessonId: 'limites-04-fatoracao',
    skill: 'Diferença de quadrados',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → 2  (x² - 4) / (x - 2)',
    correctOptionId: 'c',
    explanation:
        'Substituindo diretamente, aparece 0/0. Fatoramos x² - 4 = (x - 2)(x + 2). Cancelando x - 2, sobra x + 2. Então, no limite, temos 2 + 2 = 4.',
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '2'),
      ExerciseOptionData(id: 'c', text: '4'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'limite-racionalizacao',
    title: 'Questão 3 de 10',
    contentLessonId: 'limites-05-racionalizacao',
    skill: 'Racionalização com conjugado',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → 0  (√(x + 9) - 3) / x',
    correctOptionId: 'b',
    explanation:
        'Substituindo diretamente, aparece 0/0. Multiplicamos pelo conjugado: (√(x + 9) + 3). O numerador vira x, que cancela com o x do denominador. Sobra 1 / (√(x + 9) + 3). Substituindo x = 0, temos 1/(3 + 3) = 1/6.',
    options: [
      ExerciseOptionData(id: 'a', text: '1/3'),
      ExerciseOptionData(id: 'b', text: '1/6'),
      ExerciseOptionData(id: 'c', text: '6'),
      ExerciseOptionData(id: 'd', text: '0'),
    ],
  ),
  ExerciseData(
    id: 'limite-trigonometrico-fundamental',
    title: 'Questão 4 de 10',
    contentLessonId: 'limites-07-trigonometricos',
    skill: 'Limite trigonométrico fundamental',
    statement: 'Calcule o limite:\n\nlim x → 0  sen(x) / x',
    correctOptionId: 'a',
    explanation:
        'A substituição gera 0/0, mas isso é uma indeterminação, não a resposta. Em radianos, sen(x) e x ficam equivalentes perto de zero. Portanto, a razão sen(x)/x tende a 1. Esse resultado é o padrão fundamental usado para transformar limites trigonométricos mais complexos.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '1'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: '∞'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'limite-no-infinito',
    title: 'Questão 5 de 10',
    contentLessonId: 'limites-06-infinito',
    skill: 'Termos dominantes com graus iguais',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → ∞  (3x² - 2x + 1) / (x² + 5)',
    correctOptionId: 'c',
    explanation:
        'Divida numerador e denominador por x², a maior potência presente: (3 - 2/x + 1/x²)/(1 + 5/x²). Quando x cresce, os termos com 1/x e 1/x² tendem a zero. Restam os coeficientes líderes 3/1, logo o limite é 3.',
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '3'),
      ExerciseOptionData(id: 'd', text: '∞'),
    ],
  ),
  ExerciseData(
    id: 'limite-racional-direto',
    title: 'Questão 6 de 10',
    contentLessonId: 'limites-01-intuicao',
    skill: 'Leitura de tendência em tabela',
    statement:
        'A tabela mostra valores de f(x) perto de x = 2:\n\nx: 1,9 | 1,99 | 2,01 | 2,1\nf(x): 4,8 | 4,98 | 5,02 | 5,2\n\nQual é a melhor previsão para lim x → 2 f(x)?',
    correctOptionId: 'b',
    explanation:
        'Pelos dois lados de 2, as saídas se aproximam de 5: 4,98 pela esquerda e 5,02 pela direita. O limite descreve essa tendência, portanto vale 5. Não precisamos conhecer o valor exato de f(2) para fazer essa previsão.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '2'),
      ExerciseOptionData(id: 'b', text: '5'),
      ExerciseOptionData(id: 'c', text: '4,98'),
      ExerciseOptionData(id: 'd', text: 'Não é possível prever'),
    ],
  ),
  ExerciseData(
    id: 'limite-fatoracao-segundo',
    title: 'Questão 7 de 10',
    contentLessonId: 'limites-04-fatoracao',
    skill: 'Cancelamento de fator responsável por 0/0',
    statement: 'Calcule o limite:\n\nlim x → 1  (x² - 1) / (x - 1)',
    correctOptionId: 'c',
    explanation:
        'Fatoramos x² - 1 = (x - 1)(x + 1). Cancelando x - 1, resta x + 1. Quando x tende a 1, o limite é 2.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'limite-infinito-grau-menor',
    title: 'Questão 8 de 10',
    contentLessonId: 'limites-06-infinito',
    skill: 'Comparação de graus',
    statement: 'Calcule o limite:\n\nlim x → ∞  (2x + 1) / (x² + 3)',
    correctOptionId: 'a',
    explanation:
        'Dividindo tudo por x², obtemos (2/x + 1/x²)/(1 + 3/x²). Todos os termos com x no denominador tendem a zero, enquanto o denominador tende a 1. Assim, o quociente tende a 0. Isso confirma que o denominador cresce mais rapidamente.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: '∞'),
    ],
  ),
  ExerciseData(
    id: 'limite-lateral-modulo',
    title: 'Questão 9 de 10',
    contentLessonId: 'limites-02-laterais',
    skill: 'Limite lateral pela direita',
    statement: 'Calcule o limite lateral:\n\nlim x → 0⁺  |x| / x',
    correctOptionId: 'd',
    explanation:
        'Quando x se aproxima de zero pela direita, x é positivo e |x| = x. Portanto, |x|/x = 1.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '-1'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: 'Não existe'),
      ExerciseOptionData(id: 'd', text: '1'),
    ],
  ),
  ExerciseData(
    id: 'limite-bilateral-modulo',
    title: 'Questão 10 de 10',
    contentLessonId: 'limites-02-laterais',
    skill: 'Comparação de limites laterais',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → 0  |x| / x',
    correctOptionId: 'c',
    explanation:
        'Pela direita, |x|/x tende a 1; pela esquerda, tende a -1. Como os limites laterais são diferentes, o limite bilateral não existe.',
    options: [
      ExerciseOptionData(id: 'a', text: '-1'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: 'Não existe'),
      ExerciseOptionData(id: 'd', text: '1'),
    ],
  ),
  ExerciseData(
    id: 'limite-polinomial-negativo',
    title: 'Questão 11 de 30',
    contentLessonId: 'limites-03-propriedades',
    skill: 'Substituição com número negativo',
    statement: 'Calcule o limite:\n\nlim x → -1  (x³ + 2x)',
    correctOptionId: 'b',
    explanation:
        'A função é polinomial e contínua. Substituindo x = -1: (-1)³ + 2(-1) = -1 - 2 = -3.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '3'),
      ExerciseOptionData(id: 'b', text: '-3'),
      ExerciseOptionData(id: 'c', text: '-1'),
      ExerciseOptionData(id: 'd', text: '1'),
    ],
  ),
  ExerciseData(
    id: 'limite-fatoracao-terceiro',
    title: 'Questão 12 de 30',
    contentLessonId: 'limites-04-fatoracao',
    skill: 'Diferença de quadrados',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → 3  (x² - 9) / (x - 3)',
    correctOptionId: 'd',
    explanation:
        'A substituição inicial produz 0/0, indicando que precisamos transformar a expressão. Como x² - 9 é uma diferença de quadrados, escrevemos (x - 3)(x + 3). Para x próximo de 3 e diferente de 3, cancelamos x - 3. Resta x + 3, que tende a 6.',
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '3'),
      ExerciseOptionData(id: 'c', text: '9'),
      ExerciseOptionData(id: 'd', text: '6'),
    ],
  ),
  ExerciseData(
    id: 'limite-racionalizacao-2',
    title: 'Questão 13 de 30',
    contentLessonId: 'limites-05-racionalizacao',
    skill: 'Racionalização de diferença com raiz',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → 4  (√x - 2) / (x - 4)',
    correctOptionId: 'c',
    explanation:
        'A substituição produz 0/0. Multiplique numerador e denominador pelo conjugado √x + 2. O produto (√x - 2)(√x + 2) vira x - 4 e cancela o denominador original. Resta 1/(√x + 2), cujo limite em x = 4 é 1/4.',
    options: [
      ExerciseOptionData(id: 'a', text: '1/2'),
      ExerciseOptionData(id: 'b', text: '2'),
      ExerciseOptionData(id: 'c', text: '1/4'),
      ExerciseOptionData(id: 'd', text: '4'),
    ],
  ),
  ExerciseData(
    id: 'limite-trigonometrico-2',
    title: 'Questão 14 de 30',
    contentLessonId: 'limites-07-trigonometricos',
    skill: 'Ajuste para a forma sen(u)/u',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → 0  sen(2x) / x',
    correctOptionId: 'a',
    explanation:
        'Precisamos fazer o argumento 2x aparecer também no denominador. Escrevemos sen(2x)/x = 2·sen(2x)/(2x). Quando x tende a zero, 2x também tende a zero e a razão fundamental tende a 1. Logo, o resultado é 2·1 = 2.',
    options: [
      ExerciseOptionData(id: 'a', text: '2'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'limite-cosseno',
    title: 'Questão 15 de 30',
    contentLessonId: 'limites-07-trigonometricos',
    skill: 'Identidade trigonométrica e conjugado',
    difficulty: ExerciseDifficulty.challenge,
    statement: 'Calcule o limite:\n\nlim x → 0  (1 - cos x) / x',
    correctOptionId: 'b',
    explanation:
        'Racionalizando, (1 - cos x)/x = sen²(x) / [x(1 + cos x)]. '
        'Reescrevendo como [sen(x)/x] · [sen(x)/(1 + cos x)], os fatores '
        'tendem a 1 e 0, respectivamente. Portanto, o limite é 0.',
    options: [
      ExerciseOptionData(id: 'a', text: '1'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: '1/2'),
      ExerciseOptionData(id: 'd', text: '∞'),
    ],
  ),
  ExerciseData(
    id: 'limite-infinito-cubico',
    title: 'Questão 16 de 30',
    contentLessonId: 'limites-06-infinito',
    skill: 'Termos dominantes de grau cúbico',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → ∞  (5x³ + x) / (2x³ - 1)',
    correctOptionId: 'c',
    explanation:
        'Divida todos os termos por x³: (5 + 1/x²)/(2 - 1/x³). Quando x tende ao infinito, 1/x² e 1/x³ tendem a zero. A expressão se aproxima de 5/2, a razão entre os coeficientes dos termos dominantes.',
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '2/5'),
      ExerciseOptionData(id: 'c', text: '5/2'),
      ExerciseOptionData(id: 'd', text: '∞'),
    ],
  ),
  ExerciseData(
    id: 'limite-infinito-grau-maior',
    title: 'Questão 17 de 30',
    contentLessonId: 'limites-06-infinito',
    skill: 'Crescimento sem limite',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule o limite:\n\nlim x → ∞  x² / (x + 1)',
    correctOptionId: 'd',
    explanation:
        'Dividindo numerador e denominador por x, obtemos x/(1 + 1/x). O denominador tende a 1 e o numerador cresce positivamente sem limite. Portanto, a razão tende a +∞; não existe assíntota horizontal nesse sentido.',
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '-∞'),
      ExerciseOptionData(id: 'd', text: '+∞'),
    ],
  ),
  ExerciseData(
    id: 'limite-lateral-reciproco-direita',
    title: 'Questão 18 de 30',
    contentLessonId: 'limites-02-laterais',
    skill: 'Comportamento infinito pela direita',
    statement: 'Calcule o limite lateral:\n\nlim x → 0⁺  1/x',
    correctOptionId: 'a',
    explanation:
        'Pela direita, x assume valores positivos cada vez menores. Assim, 1/x cresce sem limite e tende a +∞.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '+∞'),
      ExerciseOptionData(id: 'b', text: '-∞'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: '1'),
    ],
  ),
  ExerciseData(
    id: 'limite-lateral-reciproco-esquerda',
    title: 'Questão 19 de 30',
    contentLessonId: 'limites-02-laterais',
    skill: 'Comportamento infinito pela esquerda',
    statement: 'Calcule o limite lateral:\n\nlim x → 0⁻  1/x',
    correctOptionId: 'b',
    explanation:
        'Pela esquerda, x assume valores negativos cada vez mais próximos de zero. Assim, 1/x tende a -∞.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '+∞'),
      ExerciseOptionData(id: 'b', text: '-∞'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: '-1'),
    ],
  ),
  ExerciseData(
    id: 'limite-bilateral-reciproco',
    title: 'Questão 20 de 30',
    contentLessonId: 'limites-08-sintese',
    skill: 'Diagnóstico de existência do limite bilateral',
    difficulty: ExerciseDifficulty.challenge,
    statement: 'Calcule o limite:\n\nlim x → 0  1/x',
    correctOptionId: 'c',
    explanation:
        'Use o roteiro de diagnóstico: primeiro compare os lados. Para x positivo e muito próximo de zero, 1/x cresce para +∞. Para x negativo e muito próximo de zero, 1/x decresce para -∞. Como os comportamentos laterais não coincidem, o limite bilateral não existe.',
    options: [
      ExerciseOptionData(id: 'a', text: '+∞'),
      ExerciseOptionData(id: 'b', text: '-∞'),
      ExerciseOptionData(id: 'c', text: 'Não existe'),
      ExerciseOptionData(id: 'd', text: '0'),
    ],
  ),
  ExerciseData(
    id: 'limite-intuicao-grafico-1',
    title: 'Questão 21 de 30',
    statement:
        'Um gráfico mostra que, quando x se aproxima de 2 por ambos os lados, f(x) se aproxima de 7, mas f(2) = 10. Qual é o valor de lim x → 2 f(x)?',
    correctOptionId: 'b',
    explanation:
        'O limite depende do comportamento de f(x) quando x se aproxima de 2, e não necessariamente do valor exato de f(2). Como os valores se aproximam de 7 pelos dois lados, o limite é 7.',
    contentLessonId: 'limites-01-intuicao',
    skill: 'Distinguir valor da função e valor do limite',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '10'),
      ExerciseOptionData(id: 'b', text: '7'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'limite-intuicao-buraco-1',
    title: 'Questão 22 de 30',
    statement:
        'Se f(x) = (x² − 1)/(x − 1) para x ≠ 1 e f(1) = 8, qual é lim x → 1 f(x)?',
    correctOptionId: 'c',
    explanation:
        'Para x ≠ 1, fatoramos x² − 1 = (x − 1)(x + 1), então f(x) = x + 1. Quando x se aproxima de 1, x + 1 se aproxima de 2. O valor isolado f(1) = 8 não altera o limite.',
    contentLessonId: 'limites-01-intuicao',
    skill: 'Interpretar limite em descontinuidade removível',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '8'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'limite-propriedade-quociente-1',
    title: 'Questão 23 de 30',
    statement:
        'Se lim x → a f(x) = 6 e lim x → a g(x) = 2, qual é lim x → a [f(x)/g(x)]?',
    correctOptionId: 'a',
    explanation:
        'Pela propriedade do quociente, se o limite do denominador é diferente de zero, o limite do quociente é o quociente dos limites. Assim, 6/2 = 3.',
    contentLessonId: 'limites-03-propriedades',
    skill: 'Aplicar propriedade do quociente de limites',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '3'),
      ExerciseOptionData(id: 'b', text: '4'),
      ExerciseOptionData(id: 'c', text: '8'),
      ExerciseOptionData(id: 'd', text: '12'),
    ],
  ),
  ExerciseData(
    id: 'limite-racionalizacao-3',
    title: 'Questão 24 de 30',
    statement:
        'Calcule:\nlim x → 0  (√(1 + x) − 1)/x',
    correctOptionId: 'd',
    explanation:
        'A substituição direta produz 0/0. Multiplicando pelo conjugado, obtemos 1/[√(1 + x) + 1]. Quando x → 0, o denominador tende a 2, então o limite é 1/2.',
    contentLessonId: 'limites-05-racionalizacao',
    skill: 'Racionalizar expressão com raiz próxima de 1',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: '1/2'),
    ],
  ),
  ExerciseData(
    id: 'limite-infinito-assintota-horizontal-1',
    title: 'Questão 25 de 30',
    statement:
        'Para f(x) = (4x² + 1)/(2x² − 3), qual é a assíntota horizontal?',
    correctOptionId: 'b',
    explanation:
        'No infinito, quando numerador e denominador têm o mesmo grau, o limite é a razão dos coeficientes líderes: 4/2 = 2. Portanto, a assíntota horizontal é y = 2.',
    contentLessonId: 'limites-06-infinito',
    skill: 'Relacionar limite no infinito e assíntota horizontal',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'y = 0'),
      ExerciseOptionData(id: 'b', text: 'y = 2'),
      ExerciseOptionData(id: 'c', text: 'x = 2'),
      ExerciseOptionData(id: 'd', text: 'y = 4'),
    ],
  ),
  ExerciseData(
    id: 'limite-trigonometrico-3',
    title: 'Questão 26 de 30',
    statement:
        'Calcule:\nlim x → 0  sin(5x)/(2x)',
    correctOptionId: 'c',
    explanation:
        'Reescrevemos sin(5x)/(2x) como (5/2)·[sin(5x)/(5x)]. O termo entre colchetes tende a 1 pelo limite trigonométrico fundamental. Logo, o resultado é 5/2.',
    contentLessonId: 'limites-07-trigonometricos',
    skill: 'Ajustar constante no limite trigonométrico fundamental',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '2/5'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '5/2'),
      ExerciseOptionData(id: 'd', text: '5'),
    ],
  ),
  ExerciseData(
    id: 'limite-sintese-tecnica-1',
    title: 'Questão 27 de 30',
    statement:
        'Ao substituir diretamente x = 3 em (x² − 9)/(x − 3), aparece 0/0. Qual técnica deve ser tentada primeiro?',
    correctOptionId: 'a',
    explanation:
        'A expressão envolve um polinômio fatorável no numerador. Como x² − 9 é uma diferença de quadrados, a fatoração permite cancelar o fator x − 3 e revelar o limite.',
    contentLessonId: 'limites-08-sintese',
    skill: 'Selecionar fatoração a partir da forma indeterminada',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Fatoração'),
      ExerciseOptionData(id: 'b', text: 'Racionalização'),
      ExerciseOptionData(id: 'c', text: 'Tabela de sinais'),
      ExerciseOptionData(id: 'd', text: 'Derivação'),
    ],
  ),
  ExerciseData(
    id: 'limite-sintese-tecnica-2',
    title: 'Questão 28 de 30',
    statement:
        'Ao substituir diretamente em (√(x + 4) − 2)/x quando x → 0, aparece 0/0. Qual técnica é mais natural?',
    correctOptionId: 'c',
    explanation:
        'A presença de uma diferença envolvendo raiz quadrada indica que multiplicar pelo conjugado é a técnica mais direta. Isso elimina a raiz do numerador e permite simplificar.',
    contentLessonId: 'limites-08-sintese',
    skill: 'Selecionar racionalização para limite com radical',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Divisão polinomial'),
      ExerciseOptionData(id: 'b', text: 'Fatoração por agrupamento'),
      ExerciseOptionData(id: 'c', text: 'Racionalização pelo conjugado'),
      ExerciseOptionData(id: 'd', text: 'Tabela de valores apenas'),
    ],
  ),
  ExerciseData(
    id: 'limite-sintese-laterais-1',
    title: 'Questão 29 de 30',
    statement:
        'Para decidir se lim x → a f(x) existe, qual condição é necessária?',
    correctOptionId: 'd',
    explanation:
        'Um limite bilateral existe apenas quando o limite pela esquerda e o limite pela direita existem e são iguais. Se os valores laterais diferem, o limite bilateral não existe.',
    contentLessonId: 'limites-08-sintese',
    skill: 'Diagnosticar existência de limite bilateral',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'f(a) precisa existir'),
      ExerciseOptionData(id: 'b', text: 'f(a) precisa ser igual a zero'),
      ExerciseOptionData(id: 'c', text: 'O limite pela direita precisa ser positivo'),
      ExerciseOptionData(id: 'd', text: 'Os limites laterais precisam existir e ser iguais'),
    ],
  ),
  ExerciseData(
    id: 'limite-sintese-ordem-1',
    title: 'Questão 30 de 30',
    statement:
        'Qual sequência de diagnóstico é mais adequada ao resolver um limite algébrico elementar?',
    correctOptionId: 'b',
    explanation:
        'Uma estratégia eficiente é começar pela substituição direta. Se surgir uma forma indeterminada, analisamos a estrutura da expressão para escolher fatoração, racionalização, identidade trigonométrica ou comparação de graus.',
    contentLessonId: 'limites-08-sintese',
    skill: 'Organizar estratégia de resolução de limites',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: 'Sempre fatorar antes de substituir'),
      ExerciseOptionData(id: 'b', text: 'Substituir; diagnosticar; escolher a técnica adequada'),
      ExerciseOptionData(id: 'c', text: 'Sempre racionalizar primeiro'),
      ExerciseOptionData(id: 'd', text: 'Calcular f(a) e encerrar'),
    ],
  ),

];