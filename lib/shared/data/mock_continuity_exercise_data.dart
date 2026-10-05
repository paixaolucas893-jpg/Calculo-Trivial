import 'package:calcquest/shared/data/mock_exercise_data.dart';

const List<ExerciseData> mockContinuityExercises = [
  ExerciseData(
    id: 'continuidade-tres-condicoes',
    title: 'Questão 1 de 45',
    contentLessonId: 'continuidade-01-significado',
    skill: 'Três condições de continuidade',
    statement:
        'Para uma função f ser contínua em x = a, quais condições devem ser satisfeitas?',
    correctOptionId: 'c',
    explanation:
        'Verifique na ordem: f(a) precisa estar definida; o limite bilateral lim x→a f(x) precisa existir; por fim, a tendência deve coincidir com o valor real, isto é, lim x→a f(x)=f(a). A falha de qualquer condição torna f descontínua em a.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Somente f(a) deve existir'),
      ExerciseOptionData(id: 'b', text: 'Somente o limite deve existir'),
      ExerciseOptionData(
        id: 'c',
        text: 'f(a) existe, o limite existe e lim x → a f(x) = f(a)',
      ),
      ExerciseOptionData(id: 'd', text: 'A derivada de f deve ser zero'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-polinomial',
    title: 'Questão 2 de 45',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Famílias de funções contínuas',
    statement: 'Em quais números reais f(x) = 3x² - 2x + 5 é contínua?',
    correctOptionId: 'a',
    explanation:
        'Polinômios são formados por somas e produtos de potências inteiras não negativas de x, operações que preservam continuidade. Como não há denominadores ou raízes que restrinjam o domínio, f é contínua em todo ℝ.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Em todos os números reais'),
      ExerciseOptionData(id: 'b', text: 'Somente para x > 0'),
      ExerciseOptionData(id: 'c', text: 'Somente para x ≠ 0'),
      ExerciseOptionData(id: 'd', text: 'Somente nos números inteiros'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-racional-dominio',
    title: 'Questão 3 de 45',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Domínio de função racional',
    statement: 'Onde a função f(x) = (x + 1) / (x - 2) não é contínua?',
    correctOptionId: 'b',
    explanation:
        'Uma função racional é contínua em todos os pontos de seu domínio. Resolva x−2=0 e obtenha x=2; nesse ponto, a divisão não está definida. Portanto, os intervalos de continuidade são (−∞,2) e (2,+∞).',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'x = -1'),
      ExerciseOptionData(id: 'b', text: 'x = 2'),
      ExerciseOptionData(id: 'c', text: 'x = 0'),
      ExerciseOptionData(id: 'd', text: 'Ela é contínua em todo ℝ'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-furo-corrigido',
    title: 'Questão 4 de 45',
    contentLessonId: 'continuidade-05-parametros',
    skill: 'Correção de descontinuidade removível',
    difficulty: ExerciseDifficulty.intermediate,
    statement:
        'Considere f(x) = (x² - 1)/(x - 1), se x ≠ 1, e f(1) = 2. A função é contínua em x = 1?',
    correctOptionId: 'a',
    explanation:
        'Fatore x²−1=(x−1)(x+1). Para x próximo de 1 e diferente de 1, a expressão equivale a x+1, cujo limite é 2. Como f(1) foi definido como 2, valor e limite coincidem; as três condições são satisfeitas.',
    options: [
      ExerciseOptionData(id: 'a', text: 'Sim, pois o limite e f(1) valem 2'),
      ExerciseOptionData(id: 'b', text: 'Não, pois o limite vale 0'),
      ExerciseOptionData(id: 'c', text: 'Não, pois f(1) não existe'),
      ExerciseOptionData(
        id: 'd',
        text: 'Sim, pois toda função racional é contínua',
      ),
    ],
  ),
  ExerciseData(
    id: 'continuidade-furo-nao-corrigido',
    title: 'Questão 5 de 45',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Classificação de furo removível',
    difficulty: ExerciseDifficulty.intermediate,
    statement:
        'Considere f(x) = (x² - 1)/(x - 1), se x ≠ 1, e f(1) = 3. Que tipo de descontinuidade ocorre em x = 1?',
    correctOptionId: 'd',
    explanation:
        'A expressão simplificada x+1 mostra que o limite em 1 existe e vale 2. Entretanto, o valor definido é f(1)=3. Como apenas o valor no ponto impede a igualdade, a descontinuidade é removível: redefinir f(1)=2 seria suficiente.',
    options: [
      ExerciseOptionData(id: 'a', text: 'Nenhuma; a função é contínua'),
      ExerciseOptionData(id: 'b', text: 'Descontinuidade infinita'),
      ExerciseOptionData(id: 'c', text: 'Descontinuidade de salto'),
      ExerciseOptionData(id: 'd', text: 'Descontinuidade removível'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-partes-simples',
    title: 'Questão 6 de 45',
    contentLessonId: 'continuidade-04-partes',
    skill: 'Encontro de funções por partes',
    difficulty: ExerciseDifficulty.intermediate,
    statement:
        'Se f(x) = x + 1 para x < 1 e f(x) = 2x para x ≥ 1, f é contínua em x = 1?',
    correctOptionId: 'b',
    explanation:
        'Use x+1 pela esquerda: o limite é 2. Use 2x pela direita: o limite também é 2. A segunda regra inclui x=1, então f(1)=2. Como limite esquerdo, limite direito e valor no ponto coincidem, f é contínua.',
    options: [
      ExerciseOptionData(
        id: 'a',
        text: 'Não, pois os limites laterais não existem',
      ),
      ExerciseOptionData(
        id: 'b',
        text: 'Sim, pois os dois limites e f(1) valem 2',
      ),
      ExerciseOptionData(id: 'c', text: 'Não, pois f(1) = 1'),
      ExerciseOptionData(id: 'd', text: 'Sim, pois f(1) = 0'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-salto',
    title: 'Questão 7 de 45',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Descontinuidade de salto',
    statement:
        'Se f(x) = -1 para x < 0 e f(x) = 1 para x ≥ 0, o que ocorre em x = 0?',
    correctOptionId: 'c',
    explanation:
        'Ao aproximar-se de zero pela esquerda, a função permanece em −1. Pela direita, permanece em 1. Como os limites laterais são finitos, mas diferentes, o limite bilateral não existe e a ruptura é classificada como salto.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'A função é contínua'),
      ExerciseOptionData(id: 'b', text: 'Há uma descontinuidade removível'),
      ExerciseOptionData(id: 'c', text: 'Há uma descontinuidade de salto'),
      ExerciseOptionData(id: 'd', text: 'Há uma descontinuidade infinita'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-infinita',
    title: 'Questão 8 de 45',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Descontinuidade infinita',
    statement: 'Qual tipo de descontinuidade f(x) = 1/(x - 2) possui em x = 2?',
    correctOptionId: 'a',
    explanation:
        'Próximo de x = 2, os valores da função crescem sem limite em módulo. Existe uma assíntota vertical e a descontinuidade é infinita.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Infinita'),
      ExerciseOptionData(id: 'b', text: 'Removível'),
      ExerciseOptionData(id: 'c', text: 'De salto finito'),
      ExerciseOptionData(id: 'd', text: 'Nenhuma'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-modulo',
    title: 'Questão 9 de 45',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Continuidade em ponto anguloso',
    statement: 'A função f(x) = |x| é contínua em x = 0?',
    correctOptionId: 'd',
    explanation:
        'Uma ponta no gráfico não significa descontinuidade. Pela esquerda, |x|=−x e o limite é 0; pela direita, |x|=x e o limite também é 0. Como f(0)=0, as três condições são satisfeitas.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(
        id: 'a',
        text: 'Não, porque existe uma ponta no gráfico',
      ),
      ExerciseOptionData(id: 'b', text: 'Não, porque o limite vale 1'),
      ExerciseOptionData(id: 'c', text: 'Somente pela direita'),
      ExerciseOptionData(id: 'd', text: 'Sim'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-parte-inteira',
    title: 'Questão 10 de 45',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Saltos da função parte inteira',
    statement:
        'A função parte inteira f(x) = ⌊x⌋ apresenta qual comportamento nos números inteiros?',
    correctOptionId: 'b',
    explanation:
        'Ao atravessar um inteiro n, os valores pela esquerda permanecem em n−1, enquanto pela direita e no ponto valem n. Os limites laterais são finitos, porém diferentes, caracterizando uma descontinuidade de salto.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'É contínua em todos eles'),
      ExerciseOptionData(id: 'b', text: 'Possui descontinuidades de salto'),
      ExerciseOptionData(id: 'c', text: 'Possui somente furos removíveis'),
      ExerciseOptionData(id: 'd', text: 'Tende sempre ao infinito'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-seno',
    title: 'Questão 11 de 45',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Continuidade de função trigonométrica',
    statement: 'Em qual conjunto a função f(x) = sen(x) é contínua?',
    correctOptionId: 'c',
    explanation:
        'A função seno está definida e é contínua para todo número real. Restringi-la a [0,2π] confundiria um período de repetição com seu domínio, que é ℝ.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Somente em [0, 2π]'),
      ExerciseOptionData(id: 'b', text: 'Somente para x ≠ 0'),
      ExerciseOptionData(id: 'c', text: 'Em todo ℝ'),
      ExerciseOptionData(id: 'd', text: 'Somente nos múltiplos de π'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-raiz',
    title: 'Questão 12 de 45',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Continuidade no domínio da raiz',
    statement: 'Em seu domínio real, onde f(x) = √x é contínua?',
    correctOptionId: 'a',
    explanation:
        'No conjunto real, √x exige x≥0. A função é contínua em todo esse domínio; no extremo x=0, a continuidade é verificada pela direita, pois valores negativos não pertencem ao domínio.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '[0, +∞)'),
      ExerciseOptionData(id: 'b', text: '(-∞, 0]'),
      ExerciseOptionData(id: 'c', text: 'ℝ exceto 0'),
      ExerciseOptionData(id: 'd', text: 'Somente em x = 0'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-composicao',
    title: 'Questão 13 de 45',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Composição de funções contínuas',
    difficulty: ExerciseDifficulty.intermediate,
    statement:
        'Se g é contínua em a e f é contínua em g(a), o que podemos afirmar sobre f(g(x)) em a?',
    correctOptionId: 'd',
    explanation:
        'Como g(x) se aproxima de g(a) quando x→a e f é contínua no valor g(a), podemos passar o limite pela função externa. Assim, lim x→a f(g(x))=f(g(a)), que é exatamente a condição de continuidade da composição.',
    options: [
      ExerciseOptionData(id: 'a', text: 'É sempre descontínua'),
      ExerciseOptionData(id: 'b', text: 'Seu limite é necessariamente zero'),
      ExerciseOptionData(id: 'c', text: 'Nada pode ser concluído'),
      ExerciseOptionData(id: 'd', text: 'É contínua em a'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-valor-intermediario',
    title: 'Questão 14 de 45',
    contentLessonId: 'continuidade-06-valor-intermediario',
    skill: 'Teorema do Valor Intermediário',
    difficulty: ExerciseDifficulty.intermediate,
    statement:
        'Uma função f é contínua em [1, 2], com f(1) = -3 e f(2) = 4. O que o Teorema do Valor Intermediário garante?',
    correctOptionId: 'b',
    explanation:
        'A função é contínua em todo [1,2] e zero está entre f(1)=−3 e f(2)=4. Pelo Teorema do Valor Intermediário, existe pelo menos um c em (1,2) com f(c)=0. O teorema não garante que a raiz seja única nem que c=1,5.',
    options: [
      ExerciseOptionData(id: 'a', text: 'f é uma função linear'),
      ExerciseOptionData(id: 'b', text: 'Existe c em (1, 2) com f(c) = 0'),
      ExerciseOptionData(id: 'c', text: 'f possui exatamente uma raiz'),
      ExerciseOptionData(id: 'd', text: 'f(1,5) = 0 obrigatoriamente'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-parametro-ponto',
    title: 'Questão 15 de 45',
    contentLessonId: 'continuidade-05-parametros',
    skill: 'Definição de valor para remover furo',
    statement:
        'Se f(x) = x² para x ≠ 2 e f(2) = k, qual valor de k torna f contínua em x = 2?',
    correctOptionId: 'c',
    explanation:
        'O limite de x² quando x tende a 2 é 4. Para haver continuidade, f(2) também precisa valer 4.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '2'),
      ExerciseOptionData(id: 'c', text: '4'),
      ExerciseOptionData(id: 'd', text: '8'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-parametro-partes',
    title: 'Questão 16 de 45',
    contentLessonId: 'continuidade-05-parametros',
    skill: 'Parâmetro em função por partes',
    difficulty: ExerciseDifficulty.challenge,
    statement:
        'Se f(x) = 2x + 1 para x < 1 e f(x) = x + k para x ≥ 1, qual valor de k torna f contínua em x = 1?',
    correctOptionId: 'a',
    explanation:
        'Calcule cada lado no ponto de troca. Pela esquerda, 2(1)+1=3. Pela direita e no ponto, a segunda regra fornece 1+k. Para os trechos se encontrarem, imponha 1+k=3 e resolva: k=2.',
    options: [
      ExerciseOptionData(id: 'a', text: '2'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '3'),
      ExerciseOptionData(id: 'd', text: '-2'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-valor-indefinido',
    title: 'Questão 17 de 45',
    contentLessonId: 'continuidade-05-parametros',
    skill: 'Identificação de valor ausente',
    statement:
        'O limite lim x → a f(x) existe e é finito, mas f(a) não está definida. f é contínua em a?',
    correctOptionId: 'c',
    explanation:
        'Não. A primeira condição de continuidade exige que f(a) esteja definida. Nesse caso, normalmente há uma descontinuidade removível.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Sim, pois basta o limite existir'),
      ExerciseOptionData(id: 'b', text: 'Sim, se a for positivo'),
      ExerciseOptionData(id: 'c', text: 'Não, pois f(a) precisa existir'),
      ExerciseOptionData(
        id: 'd',
        text: 'Não, pois o limite deveria ser infinito',
      ),
    ],
  ),
  ExerciseData(
    id: 'continuidade-extremo-intervalo',
    title: 'Questão 18 de 45',
    contentLessonId: 'continuidade-04-partes',
    skill: 'Continuidade unilateral em extremo',
    statement:
        'Para verificar a continuidade de f no extremo esquerdo a de um intervalo fechado [a, b], qual limite é usado?',
    correctOptionId: 'd',
    explanation:
        'No extremo esquerdo a, não existem pontos do domínio [a,b] menores que a. Portanto, a aproximação relevante usa valores maiores que a, isto é, o limite pela direita, que deve coincidir com f(a).',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Somente o limite pela esquerda'),
      ExerciseOptionData(id: 'b', text: 'Nenhum limite'),
      ExerciseOptionData(id: 'c', text: 'Sempre um limite no infinito'),
      ExerciseOptionData(id: 'd', text: 'O limite pela direita'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-removivel-conceito',
    title: 'Questão 19 de 45',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Reparação de descontinuidade removível',
    statement: 'Quando uma descontinuidade é chamada de removível?',
    correctOptionId: 'a',
    explanation:
        'Ela é removível quando o limite no ponto existe e é finito, permitindo corrigir a função apenas redefinindo seu valor naquele ponto.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(
        id: 'a',
        text: 'Quando redefinir o valor no ponto pode tornar a função contínua',
      ),
      ExerciseOptionData(
        id: 'b',
        text: 'Quando os limites laterais são diferentes',
      ),
      ExerciseOptionData(id: 'c', text: 'Quando existe uma assíntota vertical'),
      ExerciseOptionData(id: 'd', text: 'Quando a função não possui domínio'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-inversa-dominio',
    title: 'Questão 20 de 45',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Roteiro completo de domínio e continuidade',
    difficulty: ExerciseDifficulty.challenge,
    statement: 'Em quais intervalos f(x) = 1/x é contínua?',
    correctOptionId: 'b',
    explanation:
        'Comece pelo domínio: 1/x não está definida em x=0. Como funções racionais são contínuas onde o denominador não zera, separe o domínio nesse ponto. Assim, os intervalos máximos de continuidade são (−∞,0) e (0,+∞).',
    options: [
      ExerciseOptionData(id: 'a', text: 'Somente em (0, +∞)'),
      ExerciseOptionData(id: 'b', text: 'Em (-∞, 0) e (0, +∞)'),
      ExerciseOptionData(id: 'c', text: 'Em todo ℝ'),
      ExerciseOptionData(id: 'd', text: 'Somente em x = 1'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-condicoes-2',
    title: 'Questão 21 de 45',
    statement:
        'Suponha que lim x → 3 f(x) = 5, mas f(3) = 2. O que podemos concluir sobre a continuidade em x = 3?',
    correctOptionId: 'c',
    explanation:
        'Para haver continuidade em x = 3, o limite deve existir e ser igual ao valor da função no ponto. Aqui, o limite vale 5 e f(3) vale 2. Como são diferentes, f não é contínua em x = 3.',
    contentLessonId: 'continuidade-01-significado',
    skill: 'Aplicar a igualdade entre limite e valor da função',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'f é contínua porque o limite existe'),
      ExerciseOptionData(id: 'b', text: 'f é contínua porque f(3) está definido'),
      ExerciseOptionData(id: 'c', text: 'f não é contínua porque o limite difere de f(3)'),
      ExerciseOptionData(id: 'd', text: 'Nada pode ser concluído'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-condicoes-3',
    title: 'Questão 22 de 45',
    statement:
        'Se f(a) existe, mas os limites laterais em a são diferentes, f pode ser contínua em a?',
    correctOptionId: 'b',
    explanation:
        'Não. Limites laterais diferentes significam que o limite bilateral em a não existe. Sem limite bilateral, uma das três condições necessárias para continuidade falha.',
    contentLessonId: 'continuidade-01-significado',
    skill: 'Relacionar limites laterais e continuidade',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Sim, sempre que f(a) existir'),
      ExerciseOptionData(id: 'b', text: 'Não, porque o limite bilateral não existe'),
      ExerciseOptionData(id: 'c', text: 'Sim, se f(a) = 0'),
      ExerciseOptionData(id: 'd', text: 'Sim, se o limite pela direita existir'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-partes-2',
    title: 'Questão 23 de 45',
    statement:
        'Considere f(x) = x² para x < 2 e f(x) = 3x − 2 para x ≥ 2. A função é contínua em x = 2?',
    correctOptionId: 'a',
    explanation:
        'Pela esquerda, x² tende a 4. Pela direita, 3x − 2 tende a 4. Além disso, como a segunda regra inclui x = 2, f(2) = 4. Os três valores coincidem, então f é contínua em x = 2.',
    contentLessonId: 'continuidade-04-partes',
    skill: 'Verificar continuidade no ponto de junção',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Sim, pois os dois limites laterais e f(2) valem 4'),
      ExerciseOptionData(id: 'b', text: 'Não, pois f(2) = 2'),
      ExerciseOptionData(id: 'c', text: 'Não, pois o limite pela esquerda vale 2'),
      ExerciseOptionData(id: 'd', text: 'Não, pois funções por partes nunca são contínuas'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-partes-3',
    title: 'Questão 24 de 45',
    statement:
        'Considere f(x) = x + 4 para x < 1 e f(x) = 2x + 1 para x ≥ 1. Qual tipo de comportamento ocorre em x = 1?',
    correctOptionId: 'd',
    explanation:
        'O limite pela esquerda vale 1 + 4 = 5. Pela direita, 2·1 + 1 = 3. Como os limites laterais são finitos, mas diferentes, há uma descontinuidade de salto.',
    contentLessonId: 'continuidade-04-partes',
    skill: 'Classificar salto em função por partes',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Continuidade'),
      ExerciseOptionData(id: 'b', text: 'Descontinuidade removível'),
      ExerciseOptionData(id: 'c', text: 'Descontinuidade infinita'),
      ExerciseOptionData(id: 'd', text: 'Descontinuidade de salto'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-tvi-2',
    title: 'Questão 25 de 45',
    statement:
        'Se f é contínua em [0, 4], com f(0) = 2 e f(4) = 10, qual afirmação é garantida pelo Teorema do Valor Intermediário?',
    correctOptionId: 'c',
    explanation:
        'Como f é contínua no intervalo fechado e 7 está entre f(0)=2 e f(4)=10, o TVI garante pelo menos um c em (0,4) tal que f(c)=7.',
    contentLessonId: 'continuidade-06-valor-intermediario',
    skill: 'Aplicar o Teorema do Valor Intermediário a um valor intermediário',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'f(c) = 7 para todo c em (0,4)'),
      ExerciseOptionData(id: 'b', text: 'Existe exatamente um c com f(c) = 7'),
      ExerciseOptionData(id: 'c', text: 'Existe ao menos um c em (0,4) com f(c) = 7'),
      ExerciseOptionData(id: 'd', text: 'f(2) = 7 necessariamente'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-tvi-3',
    title: 'Questão 26 de 45',
    statement:
        'Uma função contínua em [1, 3] satisfaz f(1) = 5 e f(3) = 9. O TVI garante a existência de c em (1,3) com f(c) = 12?',
    correctOptionId: 'a',
    explanation:
        'Não. O TVI garante valores entre 5 e 9, porque esses são os valores de f nos extremos. Como 12 não está entre 5 e 9, o teorema não fornece essa garantia.',
    contentLessonId: 'continuidade-06-valor-intermediario',
    skill: 'Reconhecer os limites de aplicação do TVI',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Não, porque 12 não está entre 5 e 9'),
      ExerciseOptionData(id: 'b', text: 'Sim, porque f é contínua'),
      ExerciseOptionData(id: 'c', text: 'Sim, e c = 2'),
      ExerciseOptionData(id: 'd', text: 'Sim, desde que f seja crescente'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-tvi-raiz-1',
    title: 'Questão 27 de 45',
    statement:
        'Se f é contínua em [−2, 1], f(−2) < 0 e f(1) > 0, o que o TVI garante?',
    correctOptionId: 'b',
    explanation:
        'Como zero está entre um valor negativo e um valor positivo, e f é contínua no intervalo, o TVI garante pelo menos um c em (−2,1) tal que f(c)=0.',
    contentLessonId: 'continuidade-06-valor-intermediario',
    skill: 'Usar o TVI para garantir existência de raiz',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'f possui exatamente uma raiz'),
      ExerciseOptionData(id: 'b', text: 'Existe ao menos uma raiz em (−2,1)'),
      ExerciseOptionData(id: 'c', text: 'A raiz é necessariamente c = 0'),
      ExerciseOptionData(id: 'd', text: 'f não possui raízes'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-roteiro-1',
    title: 'Questão 28 de 45',
    statement:
        'Qual é a primeira verificação mais adequada ao analisar a continuidade de uma função em x = a?',
    correctOptionId: 'd',
    explanation:
        'O roteiro começa pelo domínio e pelo valor da função no ponto: é preciso saber se f(a) está definido. Depois verificamos o limite bilateral e, por fim, comparamos o limite com f(a).',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Organizar o roteiro de análise de continuidade',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Calcular a derivada em a'),
      ExerciseOptionData(id: 'b', text: 'Procurar uma assíntota horizontal'),
      ExerciseOptionData(id: 'c', text: 'Aplicar o TVI imediatamente'),
      ExerciseOptionData(id: 'd', text: 'Verificar se f(a) está definido'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-classificacao-1',
    title: 'Questão 29 de 45',
    statement:
        'Em x = a, o limite bilateral existe e vale L, mas f(a) não existe. Qual é a classificação mais provável?',
    correctOptionId: 'c',
    explanation:
        'Quando o limite bilateral existe e é finito, mas o valor da função está ausente, a ruptura normalmente é removível: basta definir f(a)=L para restaurar a continuidade.',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Classificar descontinuidade a partir de limite e valor',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Descontinuidade de salto'),
      ExerciseOptionData(id: 'b', text: 'Descontinuidade infinita'),
      ExerciseOptionData(id: 'c', text: 'Descontinuidade removível'),
      ExerciseOptionData(id: 'd', text: 'Continuidade automática'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-completa-1',
    title: 'Questão 30 de 45',
    statement:
        'Uma função racional tem denominador x(x − 2). Em quais intervalos ela pode ser contínua, assumindo que não haja cancelamentos?',
    correctOptionId: 'a',
    explanation:
        'As possíveis rupturas ocorrem onde o denominador zera: x=0 e x=2. Uma função racional é contínua em cada intervalo do seu domínio, portanto os intervalos máximos são (−∞,0), (0,2) e (2,+∞).',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Combinar domínio e intervalos de continuidade',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: '(−∞,0), (0,2) e (2,+∞)'),
      ExerciseOptionData(id: 'b', text: '(−∞,2) e (2,+∞)'),
      ExerciseOptionData(id: 'c', text: 'ℝ'),
      ExerciseOptionData(id: 'd', text: '[0,2]'),
    ],
  ),

  ExerciseData(
    id: 'continuidade-significado-vizinhos-1',
    title: 'Questão 31 de 45',
    statement:
        'Uma função pode ser contínua em x=a mesmo que seu gráfico tenha uma tangente vertical nesse ponto?',
    correctOptionId: 'b',
    explanation: 'Sim. Continuidade exige apenas valor definido, limite existente e igualdade entre limite e valor. A inclinação da tangente não faz parte dessas três condições.',
    contentLessonId: 'continuidade-01-significado',
    skill: 'Distinguir continuidade de derivabilidade',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: 'Não, nunca'),
      ExerciseOptionData(id: 'b', text: 'Sim, continuidade não exige derivada finita'),
      ExerciseOptionData(id: 'c', text: 'Somente se f(a)=0'),
      ExerciseOptionData(id: 'd', text: 'Somente para polinômios'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-dominio-log-1',
    title: 'Questão 32 de 45',
    statement:
        'Em qual intervalo f(x)=ln(x−2) é contínua?',
    correctOptionId: 'c',
    explanation: 'O logaritmo natural é contínuo em argumentos positivos. Precisamos x−2>0, isto é, x>2. Logo, f é contínua em (2,+∞).',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Determinar intervalo de continuidade de logaritmo',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '(−∞,2)'),
      ExerciseOptionData(id: 'b', text: '[2,+∞)'),
      ExerciseOptionData(id: 'c', text: '(2,+∞)'),
      ExerciseOptionData(id: 'd', text: 'ℝ'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-dominio-raiz-racional-1',
    title: 'Questão 33 de 45',
    statement:
        'Determine o domínio de continuidade de f(x)=√(x−1)/(x−3).',
    correctOptionId: 'd',
    explanation: 'A raiz exige x≥1 e o denominador exige x≠3. Portanto, a função é contínua em [1,3)∪(3,+∞).',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Combinar restrições de domínio para continuidade',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: '(1,3)'),
      ExerciseOptionData(id: 'b', text: '[1,+∞)'),
      ExerciseOptionData(id: 'c', text: '(−∞,3)∪(3,+∞)'),
      ExerciseOptionData(id: 'd', text: '[1,3)∪(3,+∞)'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-removivel-parametro-2',
    title: 'Questão 34 de 45',
    statement:
        'Defina f(x)=(x²−4)/(x−2) para x≠2 e f(2)=k. Qual k torna f contínua?',
    correctOptionId: 'a',
    explanation: 'Para x≠2, a expressão simplifica para x+2. O limite quando x→2 é 4. Portanto, devemos escolher k=4.',
    contentLessonId: 'continuidade-05-parametros',
    skill: 'Remover descontinuidade escolhendo parâmetro',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '4'),
      ExerciseOptionData(id: 'b', text: '2'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: '−4'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-partes-parametro-2',
    title: 'Questão 35 de 45',
    statement:
        'Se f(x)=2x+k para x<1 e f(x)=x²+2 para x≥1, qual k torna f contínua em 1?',
    correctOptionId: 'c',
    explanation: 'O lado direito e o valor da função em 1 valem 3. O limite esquerdo é 2+k. Igualando 2+k=3, obtemos k=1.',
    contentLessonId: 'continuidade-05-parametros',
    skill: 'Ajustar parâmetro em função por partes',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '−1'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: '1'),
      ExerciseOptionData(id: 'd', text: '3'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-salto-parametro-1',
    title: 'Questão 36 de 45',
    statement:
        'Uma função por partes tem limite esquerdo 2 e limite direito k em x=0. Para eliminar um salto, qual deve ser k?',
    correctOptionId: 'b',
    explanation: 'Para não haver salto, os limites laterais devem coincidir. Logo, k deve ser igual ao limite esquerdo, isto é, k=2.',
    contentLessonId: 'continuidade-04-partes',
    skill: 'Eliminar salto igualando limites laterais',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '2'),
      ExerciseOptionData(id: 'c', text: '−2'),
      ExerciseOptionData(id: 'd', text: '1'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-tvi-polinomio-1',
    title: 'Questão 37 de 45',
    statement:
        'Considere p(x)=x³−x−1. Sabendo que p(1)<0 e p(2)>0, o que podemos concluir?',
    correctOptionId: 'd',
    explanation: 'Polinômios são contínuos em ℝ. Como p muda de sinal entre 1 e 2, o TVI garante pelo menos uma raiz em (1,2).',
    contentLessonId: 'continuidade-06-valor-intermediario',
    skill: 'Aplicar TVI a polinômio com mudança de sinal',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'A raiz é exatamente 1,5'),
      ExerciseOptionData(id: 'b', text: 'Não existem raízes'),
      ExerciseOptionData(id: 'c', text: 'Existem exatamente três raízes'),
      ExerciseOptionData(id: 'd', text: 'Existe ao menos uma raiz em (1,2)'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-tvi-unicidade-1',
    title: 'Questão 38 de 45',
    statement:
        'O Teorema do Valor Intermediário, sozinho, garante unicidade de uma raiz?',
    correctOptionId: 'a',
    explanation: 'Não. O TVI garante existência de pelo menos um ponto que atinge um valor intermediário, mas não garante que esse ponto seja único.',
    contentLessonId: 'continuidade-06-valor-intermediario',
    skill: 'Distinguir existência de unicidade no TVI',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Não'),
      ExerciseOptionData(id: 'b', text: 'Sim, sempre'),
      ExerciseOptionData(id: 'c', text: 'Sim, se o intervalo for fechado'),
      ExerciseOptionData(id: 'd', text: 'Sim, se houver mudança de sinal'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-infinita-racional-2',
    title: 'Questão 39 de 45',
    statement:
        'Que tipo de descontinuidade possui f(x)=1/(x−4)² em x=4?',
    correctOptionId: 'c',
    explanation: 'Quando x se aproxima de 4 por qualquer lado, o denominador positivo tende a zero e f(x) cresce sem limite. Há uma descontinuidade infinita e assíntota vertical.',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Classificar descontinuidade infinita bilateral',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Removível'),
      ExerciseOptionData(id: 'b', text: 'Salto'),
      ExerciseOptionData(id: 'c', text: 'Infinita'),
      ExerciseOptionData(id: 'd', text: 'Nenhuma'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-oscilatoria-1',
    title: 'Questão 40 de 45',
    statement:
        'A função f(x)=sin(1/x), para x≠0, possui limite quando x→0?',
    correctOptionId: 'd',
    explanation: 'Não. À medida que x se aproxima de zero, 1/x cresce em magnitude e o seno oscila indefinidamente entre −1 e 1, sem se aproximar de um único valor.',
    contentLessonId: 'continuidade-03-descontinuidades',
    skill: 'Reconhecer descontinuidade oscilatória',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: 'Sim, vale 0'),
      ExerciseOptionData(id: 'b', text: 'Sim, vale 1'),
      ExerciseOptionData(id: 'c', text: 'Sim, vale −1'),
      ExerciseOptionData(id: 'd', text: 'Não existe'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-composicao-2',
    title: 'Questão 41 de 45',
    statement:
        'Se g é contínua em a e f é contínua em g(a), qual limite representa a continuidade da composição?',
    correctOptionId: 'b',
    explanation: 'A composição f∘g é contínua em a e satisfaz lim x→a f(g(x))=f(g(a)).',
    contentLessonId: 'continuidade-02-dominio',
    skill: 'Usar continuidade de composição',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'lim f(g(x)) = g(f(a))'),
      ExerciseOptionData(id: 'b', text: 'lim f(g(x)) = f(g(a))'),
      ExerciseOptionData(id: 'c', text: 'lim f(g(x)) = 0'),
      ExerciseOptionData(id: 'd', text: 'lim f(g(x)) = f(a)+g(a)'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-endpoint-1',
    title: 'Questão 42 de 45',
    statement:
        'Para continuidade em um extremo direito b de [a,b], qual condição lateral é usada?',
    correctOptionId: 'c',
    explanation: 'No extremo direito, aproximamo-nos por valores menores que b dentro do domínio. Portanto, usamos o limite pela esquerda e exigimos que ele seja igual a f(b).',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Analisar continuidade em extremo direito',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Somente limite pela direita'),
      ExerciseOptionData(id: 'b', text: 'Limite bilateral obrigatoriamente'),
      ExerciseOptionData(id: 'c', text: 'Limite pela esquerda igual a f(b)'),
      ExerciseOptionData(id: 'd', text: 'Nenhum limite'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-diferenciabilidade-1',
    title: 'Questão 43 de 45',
    statement:
        'Qual afirmação é verdadeira?',
    correctOptionId: 'a',
    explanation: 'Derivabilidade implica continuidade. Porém, continuidade não implica derivabilidade, como mostra |x| em x=0.',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Relacionar continuidade e derivabilidade',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: 'Derivabilidade implica continuidade'),
      ExerciseOptionData(id: 'b', text: 'Continuidade implica derivabilidade'),
      ExerciseOptionData(id: 'c', text: 'São propriedades equivalentes'),
      ExerciseOptionData(id: 'd', text: 'Nenhuma implica a outra'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-racional-furo-1',
    title: 'Questão 44 de 45',
    statement:
        'Para f(x)=(x²−1)/(x−1), qual afirmação é correta sobre x=1?',
    correctOptionId: 'b',
    explanation: 'A expressão simplifica para x+1 quando x≠1, então o limite é 2. A função original não está definida em 1, logo há uma descontinuidade removível.',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Diagnosticar furo em função racional',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Há salto'),
      ExerciseOptionData(id: 'b', text: 'Há descontinuidade removível'),
      ExerciseOptionData(id: 'c', text: 'Há assíntota vertical'),
      ExerciseOptionData(id: 'd', text: 'A função é contínua em 1'),
    ],
  ),
  ExerciseData(
    id: 'continuidade-sintese-tvi-necessario-1',
    title: 'Questão 45 de 45',
    statement:
        'Por que a hipótese de continuidade é essencial no Teorema do Valor Intermediário?',
    correctOptionId: 'd',
    explanation: 'Sem continuidade, a função pode “pular” um valor intermediário. A continuidade impede esses saltos no intervalo e sustenta a garantia de existência.',
    contentLessonId: 'continuidade-07-sintese',
    skill: 'Compreender a hipótese central do TVI',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: 'Porque toda função contínua é linear'),
      ExerciseOptionData(id: 'b', text: 'Porque continuidade garante unicidade'),
      ExerciseOptionData(id: 'c', text: 'Porque continuidade força derivada positiva'),
      ExerciseOptionData(id: 'd', text: 'Porque sem continuidade valores intermediários podem ser saltados'),
    ],
  ),

];