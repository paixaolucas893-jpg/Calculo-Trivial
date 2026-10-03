import 'package:calcquest/shared/data/mock_exercise_data.dart';

const List<ExerciseData> mockFunctionsExercises = [
  ExerciseData(
    id: 'funcoes-dominio',
    title: 'Questão 1 de 28',
    statement:
        'Considere a função:\n\nf(x) = √(x - 2)\n\nQual é o domínio de f?',
    correctOptionId: 'c',
    explanation:
        'Para que a raiz quadrada seja real, o radicando deve ser maior ou igual a zero. Assim, x - 2 ≥ 0, portanto x ≥ 2. Logo, o domínio é [2, ∞).',
    contentLessonId: 'funcoes-01-conceito-dominio-imagem',
    skill: 'Determinar domínio com raiz quadrada',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '(-∞, 2)'),
      ExerciseOptionData(id: 'b', text: '(-∞, 2]'),
      ExerciseOptionData(id: 'c', text: '[2, ∞)'),
      ExerciseOptionData(id: 'd', text: 'ℝ'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-composicao',
    title: 'Questão 2 de 28',
    statement: 'Sejam:\n\nf(x) = 2x + 1\ng(x) = x²\n\nDetermine (f ∘ g)(x).',
    correctOptionId: 'b',
    explanation:
        'Na composição (f ∘ g)(x), calculamos f(g(x)). Como g(x) = x², substituímos x por x² em f: f(x²) = 2x² + 1.',
    contentLessonId: 'funcoes-02-composicao-inversa',
    skill: 'Calcular composição de funções',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '4x² + 1'),
      ExerciseOptionData(id: 'b', text: '2x² + 1'),
      ExerciseOptionData(id: 'c', text: '(2x + 1)²'),
      ExerciseOptionData(id: 'd', text: '2x + x²'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-inversa',
    title: 'Questão 3 de 28',
    statement:
        'Considere a função:\n\nf(x) = 3x - 6\n\nQual é a função inversa f⁻¹(x)?',
    correctOptionId: 'a',
    explanation:
        'Escrevemos y = 3x - 6 e isolamos x: y + 6 = 3x, então x = (y + 6)/3. Trocando y por x, obtemos f⁻¹(x) = (x + 6)/3.',
    contentLessonId: 'funcoes-02-composicao-inversa',
    skill: 'Determinar função inversa',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'f⁻¹(x) = (x + 6) / 3'),
      ExerciseOptionData(id: 'b', text: 'f⁻¹(x) = (x - 6) / 3'),
      ExerciseOptionData(id: 'c', text: 'f⁻¹(x) = 3x + 6'),
      ExerciseOptionData(id: 'd', text: 'f⁻¹(x) = 1 / (3x - 6)'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-paridade',
    title: 'Questão 4 de 28',
    statement:
        'Considere a função:\n\nf(x) = x² + 4\n\nComo essa função pode ser classificada quanto à paridade?',
    correctOptionId: 'a',
    explanation:
        'Calculando f(-x), temos (-x)² + 4 = x² + 4 = f(x). Portanto, f(-x) = f(x), o que caracteriza uma função par.',
    contentLessonId: 'funcoes-03-transformacoes-graficos',
    skill: 'Reconhecer paridade de função',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Função par'),
      ExerciseOptionData(id: 'b', text: 'Função ímpar'),
      ExerciseOptionData(id: 'c', text: 'Nem par nem ímpar'),
      ExerciseOptionData(id: 'd', text: 'Função constante'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-imagem-quadratica',
    title: 'Questão 5 de 28',
    statement:
        'Considere a função:\n\nf(x) = x² - 4x + 3\n\nQual é o menor valor assumido por f(x)?',
    correctOptionId: 'd',
    explanation:
        'Completando o quadrado, temos f(x) = (x - 2)² - 1. Como (x - 2)² ≥ 0, o menor valor ocorre quando x = 2. Portanto, o valor mínimo da função é -1.',
    contentLessonId: 'funcoes-04-polinomiais',
    skill: 'Determinar valor mínimo de função quadrática',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '3'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: '-1'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-valor-numerico',
    title: 'Questão 6 de 28',
    statement:
        'Considere a função:\n\nf(x) = 2x² - x + 1\n\nQual é o valor de f(3)?',
    correctOptionId: 'b',
    explanation:
        'Substituímos x por 3: f(3) = 2(3²) - 3 + 1 = 18 - 3 + 1 = 16.',
    contentLessonId: 'funcoes-01-conceito-dominio-imagem',
    skill: 'Avaliar função em um ponto',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '14'),
      ExerciseOptionData(id: 'b', text: '16'),
      ExerciseOptionData(id: 'c', text: '18'),
      ExerciseOptionData(id: 'd', text: '20'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-raizes',
    title: 'Questão 7 de 28',
    statement:
        'Considere a função:\n\nf(x) = x² - 5x + 6\n\nQuais são os zeros de f?',
    correctOptionId: 'd',
    explanation:
        'Fatoramos o polinômio: x² - 5x + 6 = (x - 2)(x - 3). Portanto, os zeros são x = 2 e x = 3.',
    contentLessonId: 'funcoes-04-polinomiais',
    skill: 'Determinar zeros de polinômio quadrático',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'x = -2 e x = -3'),
      ExerciseOptionData(id: 'b', text: 'x = 1 e x = 6'),
      ExerciseOptionData(id: 'c', text: 'x = -1 e x = -6'),
      ExerciseOptionData(id: 'd', text: 'x = 2 e x = 3'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-coeficiente-angular',
    title: 'Questão 8 de 28',
    statement:
        'Considere a função afim:\n\nf(x) = -3x + 4\n\nQual é o coeficiente angular?',
    correctOptionId: 'a',
    explanation:
        'Na forma f(x) = ax + b, o coeficiente angular é a. Nesse caso, a = -3.',
    contentLessonId: 'funcoes-12-geometria-analitica',
    skill: 'Identificar coeficiente angular de reta',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '-3'),
      ExerciseOptionData(id: 'b', text: '3'),
      ExerciseOptionData(id: 'c', text: '4'),
      ExerciseOptionData(id: 'd', text: '-4'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-composicao-inversa',
    title: 'Questão 9 de 28',
    statement: 'Sejam:\n\nf(x) = x + 2\ng(x) = 3x\n\nDetermine (g ∘ f)(x).',
    correctOptionId: 'c',
    explanation:
        'Calculamos g(f(x)). Como f(x) = x + 2, substituímos em g: g(x + 2) = 3(x + 2) = 3x + 6.',
    contentLessonId: 'funcoes-02-composicao-inversa',
    skill: 'Calcular composição em ordem especificada',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '3x + 2'),
      ExerciseOptionData(id: 'b', text: 'x + 6'),
      ExerciseOptionData(id: 'c', text: '3x + 6'),
      ExerciseOptionData(id: 'd', text: '3x² + 6'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-imagem-modulo',
    title: 'Questão 10 de 28',
    statement: 'Considere a função:\n\nf(x) = |x|\n\nQual é a imagem de f?',
    correctOptionId: 'b',
    explanation:
        'O valor absoluto nunca é negativo. A função pode assumir zero e qualquer valor positivo, portanto sua imagem é [0, ∞).',
    contentLessonId: 'funcoes-03-transformacoes-graficos',
    skill: 'Determinar imagem da função módulo',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '(-∞, 0]'),
      ExerciseOptionData(id: 'b', text: '[0, ∞)'),
      ExerciseOptionData(id: 'c', text: '(0, ∞)'),
      ExerciseOptionData(id: 'd', text: 'ℝ'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-dominio-racional',
    title: 'Questão 11 de 28',
    statement:
        'Considere a função:\n\nf(x) = 1 / (x - 4)\n\nQual é o domínio de f?',
    correctOptionId: 'c',
    explanation:
        'O denominador não pode ser zero. Como x - 4 = 0 quando x = 4, o domínio contém todos os reais, exceto 4.',
    contentLessonId: 'funcoes-05-racionais',
    skill: 'Determinar domínio de função racional',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '[4, ∞)'),
      ExerciseOptionData(id: 'b', text: '(-∞, 4)'),
      ExerciseOptionData(id: 'c', text: 'ℝ - {4}'),
      ExerciseOptionData(id: 'd', text: 'ℝ'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-valor-numerico-2',
    title: 'Questão 12 de 28',
    statement:
        'Considere a função:\n\nf(x) = -x² + 4x\n\nQual é o valor de f(2)?',
    correctOptionId: 'a',
    explanation: 'Substituindo x por 2: f(2) = -(2²) + 4 · 2 = -4 + 8 = 4.',
    contentLessonId: 'funcoes-04-polinomiais',
    skill: 'Avaliar função quadrática',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '4'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: '8'),
      ExerciseOptionData(id: 'd', text: '12'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-vertice',
    title: 'Questão 13 de 28',
    statement:
        'Considere a função:\n\nf(x) = x² - 6x + 5\n\nQual é o valor mínimo de f?',
    correctOptionId: 'd',
    explanation:
        'Completando o quadrado: f(x) = (x - 3)² - 4. O menor valor ocorre em x = 3 e é -4.',
    contentLessonId: 'funcoes-04-polinomiais',
    skill: 'Determinar mínimo por forma canônica',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '5'),
      ExerciseOptionData(id: 'b', text: '3'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: '-4'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-crescimento-afim',
    title: 'Questão 14 de 28',
    statement:
        'Considere a função:\n\nf(x) = 2x + 1\n\nComo ela é classificada quanto ao crescimento?',
    correctOptionId: 'b',
    explanation:
        'O coeficiente angular é 2, que é positivo. Portanto, a função é crescente.',
    contentLessonId: 'funcoes-12-geometria-analitica',
    skill: 'Relacionar inclinação e crescimento de reta',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Decrescente'),
      ExerciseOptionData(id: 'b', text: 'Crescente'),
      ExerciseOptionData(id: 'c', text: 'Constante'),
      ExerciseOptionData(id: 'd', text: 'Periódica'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-intersecao-eixo-y',
    title: 'Questão 15 de 28',
    statement:
        'Considere a função:\n\nf(x) = -3x + 6\n\nEm qual valor o gráfico intercepta o eixo y?',
    correctOptionId: 'c',
    explanation:
        'A interseção com o eixo y ocorre quando x = 0. Assim, f(0) = 6.',
    contentLessonId: 'funcoes-12-geometria-analitica',
    skill: 'Determinar intercepto no eixo y',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '-3'),
      ExerciseOptionData(id: 'b', text: '0'),
      ExerciseOptionData(id: 'c', text: '6'),
      ExerciseOptionData(id: 'd', text: '3'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-inversa-2',
    title: 'Questão 16 de 28',
    statement:
        'Considere a função:\n\nf(x) = 2x + 4\n\nQual é a função inversa?',
    correctOptionId: 'a',
    explanation:
        'Escrevemos y = 2x + 4 e isolamos x: x = (y - 4)/2. Logo, f⁻¹(x) = (x - 4)/2.',
    contentLessonId: 'funcoes-02-composicao-inversa',
    skill: 'Determinar inversa de função afim',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'f⁻¹(x) = (x - 4) / 2'),
      ExerciseOptionData(id: 'b', text: 'f⁻¹(x) = (x + 4) / 2'),
      ExerciseOptionData(id: 'c', text: 'f⁻¹(x) = 2x - 4'),
      ExerciseOptionData(id: 'd', text: 'f⁻¹(x) = 1 / (2x + 4)'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-composicao-3',
    title: 'Questão 17 de 28',
    statement: 'Sejam:\n\nf(x) = x²\ng(x) = x + 1\n\nDetermine (f ∘ g)(x).',
    correctOptionId: 'd',
    explanation:
        'Calculamos f(g(x)). Substituindo g(x) = x + 1 em f, obtemos (x + 1)².',
    contentLessonId: 'funcoes-02-composicao-inversa',
    skill: 'Compor funções algébricas',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'x² + 1'),
      ExerciseOptionData(id: 'b', text: 'x³ + 1'),
      ExerciseOptionData(id: 'c', text: '2x + 1'),
      ExerciseOptionData(id: 'd', text: '(x + 1)²'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-impar',
    title: 'Questão 18 de 28',
    statement:
        'Considere a função:\n\nf(x) = x³ - x\n\nComo ela é classificada quanto à paridade?',
    correctOptionId: 'b',
    explanation:
        'Calculando f(-x), obtemos -x³ + x = -(x³ - x) = -f(x). Portanto, a função é ímpar.',
    contentLessonId: 'funcoes-03-transformacoes-graficos',
    skill: 'Reconhecer função ímpar',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Função par'),
      ExerciseOptionData(id: 'b', text: 'Função ímpar'),
      ExerciseOptionData(id: 'c', text: 'Nem par nem ímpar'),
      ExerciseOptionData(id: 'd', text: 'Função constante'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-exponencial',
    title: 'Questão 19 de 28',
    statement: 'Considere a função:\n\nf(x) = 2ˣ\n\nQual é o valor de f(3)?',
    correctOptionId: 'c',
    explanation: 'Substituindo x por 3, temos f(3) = 2³ = 8.',
    contentLessonId: 'funcoes-06-exponenciais',
    skill: 'Avaliar função exponencial',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '5'),
      ExerciseOptionData(id: 'b', text: '6'),
      ExerciseOptionData(id: 'c', text: '8'),
      ExerciseOptionData(id: 'd', text: '9'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-imagem-quadratica-2',
    title: 'Questão 20 de 28',
    statement:
        'Considere a função:\n\nf(x) = -(x - 1)² + 4\n\nQual é a imagem de f?',
    correctOptionId: 'a',
    explanation:
        'A parábola tem concavidade para baixo e valor máximo 4. Portanto, assume todos os valores menores ou iguais a 4.',
    contentLessonId: 'funcoes-04-polinomiais',
    skill: 'Determinar imagem de parábola',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '(-∞, 4]'),
      ExerciseOptionData(id: 'b', text: '[4, ∞)'),
      ExerciseOptionData(id: 'c', text: '(-∞, 1]'),
      ExerciseOptionData(id: 'd', text: 'ℝ'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-logaritmo-1',
    title: 'Questão 21 de 28',
    statement: 'Resolva:\nlog₂(x) = 3',
    correctOptionId: 'c',
    explanation:
        'Pela definição de logaritmo, log₂(x) = 3 equivale a 2³ = x. Como 2³ = 8, obtemos x = 8.',
    contentLessonId: 'funcoes-07-logaritmos',
    skill: 'Converter forma logarítmica em exponencial',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'x = 3'),
      ExerciseOptionData(id: 'b', text: 'x = 6'),
      ExerciseOptionData(id: 'c', text: 'x = 8'),
      ExerciseOptionData(id: 'd', text: 'x = 9'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-radianos-1',
    title: 'Questão 22 de 28',
    statement: 'Converta 150° para radianos.',
    correctOptionId: 'b',
    explanation:
        'Multiplicamos 150° por π/180°. Assim, 150π/180 = 5π/6.',
    contentLessonId: 'funcoes-08-radianos-circulo',
    skill: 'Converter graus em radianos',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '3π/4'),
      ExerciseOptionData(id: 'b', text: '5π/6'),
      ExerciseOptionData(id: 'c', text: '2π/3'),
      ExerciseOptionData(id: 'd', text: '5π/4'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-circulo-unitario-1',
    title: 'Questão 23 de 28',
    statement: 'No círculo unitário, qual é o valor de sen(π/6)?',
    correctOptionId: 'a',
    explanation:
        'O ângulo π/6 corresponde a 30°. No círculo unitário, a coordenada y desse ponto é 1/2, portanto sen(π/6) = 1/2.',
    contentLessonId: 'funcoes-08-radianos-circulo',
    skill: 'Ler seno no círculo unitário',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '1/2'),
      ExerciseOptionData(id: 'b', text: '√2/2'),
      ExerciseOptionData(id: 'c', text: '√3/2'),
      ExerciseOptionData(id: 'd', text: '1'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-trig-grafico-1',
    title: 'Questão 24 de 28',
    statement: 'Para f(x) = 3 sen(x), qual é a amplitude do gráfico?',
    correctOptionId: 'd',
    explanation:
        'Na forma A·sen(x), a amplitude é |A|. Como A = 3, a amplitude é 3.',
    contentLessonId: 'funcoes-09-trigonometricas-graficos',
    skill: 'Identificar amplitude de função trigonométrica',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '1/3'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: '3'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-identidade-trig-1',
    title: 'Questão 25 de 28',
    statement: 'Qual expressão é identicamente igual a 1?',
    correctOptionId: 'b',
    explanation:
        'A identidade pitagórica fundamental é sen²(x) + cos²(x) = 1 para todo x real.',
    contentLessonId: 'funcoes-10-identidades-equacoes-trig',
    skill: 'Reconhecer identidade trigonométrica fundamental',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'sen(x) + cos(x)'),
      ExerciseOptionData(id: 'b', text: 'sen²(x) + cos²(x)'),
      ExerciseOptionData(id: 'c', text: 'tan(x) + 1'),
      ExerciseOptionData(id: 'd', text: 'sen²(x) - cos²(x)'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-inversa-trig-1',
    title: 'Questão 26 de 28',
    statement: 'Qual é o valor principal de arcsen(1/2)?',
    correctOptionId: 'c',
    explanation:
        'A função arcsen retorna o ângulo principal no intervalo [-π/2, π/2]. Como sen(π/6) = 1/2, arcsen(1/2) = π/6.',
    contentLessonId: 'funcoes-11-inversas-trig',
    skill: 'Avaliar função trigonométrica inversa',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: 'π/4'),
      ExerciseOptionData(id: 'c', text: 'π/6'),
      ExerciseOptionData(id: 'd', text: 'π/2'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-conica-1',
    title: 'Questão 27 de 28',
    statement: 'Qual cônica é representada por x²/9 + y²/4 = 1?',
    correctOptionId: 'a',
    explanation:
        'Uma equação da forma x²/a² + y²/b² = 1, com a e b positivos e diferentes, representa uma elipse centrada na origem.',
    contentLessonId: 'funcoes-13-conicas',
    skill: 'Reconhecer cônica pela equação padrão',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Elipse'),
      ExerciseOptionData(id: 'b', text: 'Hipérbole'),
      ExerciseOptionData(id: 'c', text: 'Parábola'),
      ExerciseOptionData(id: 'd', text: 'Reta'),
    ],
  ),
  ExerciseData(
    id: 'funcoes-taxa-media-1',
    title: 'Questão 28 de 28',
    statement:
        'Considere f(x) = x². Qual é a taxa média de variação de f no intervalo [1, 3]?',
    correctOptionId: 'd',
    explanation:
        'A taxa média é [f(3) - f(1)] / (3 - 1). Como f(3) = 9 e f(1) = 1, temos (9 - 1)/2 = 4.',
    contentLessonId: 'funcoes-14-taxa-media-sintese',
    skill: 'Calcular taxa média de variação',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '2'),
      ExerciseOptionData(id: 'b', text: '3'),
      ExerciseOptionData(id: 'c', text: '5'),
      ExerciseOptionData(id: 'd', text: '4'),
    ],
  ),

];
