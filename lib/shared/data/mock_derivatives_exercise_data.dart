import 'package:calcquest/shared/data/mock_exercise_data.dart';

const List<ExerciseData> mockDerivativesExercises = [
  ExerciseData(
    id: 'derivada-significado',
    title: 'Questão 1 de 50',
    contentLessonId: 'derivadas-01-significado',
    skill: 'Interpretação geométrica da derivada',
    statement:
        'Qual é a principal interpretação geométrica da derivada f\'(a)?',
    correctOptionId: 'b',
    explanation:
        'A derivada f′(a) é o limite das inclinações das retas secantes quando o segundo ponto se aproxima de a. Geometricamente, esse limite fornece a inclinação da reta tangente ao gráfico em (a,f(a)); em aplicações, representa uma taxa instantânea.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'A área sob o gráfico'),
      ExerciseOptionData(id: 'b', text: 'A inclinação da reta tangente'),
      ExerciseOptionData(id: 'c', text: 'O valor máximo da função'),
      ExerciseOptionData(id: 'd', text: 'A distância até a origem'),
    ],
  ),
  ExerciseData(
    id: 'derivada-potencia-cubica',
    title: 'Questão 2 de 50',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Regra da potência',
    statement: 'Se f(x) = x³, qual é f\'(x)?',
    correctOptionId: 'c',
    explanation:
        'Pela regra da potência, a derivada de xⁿ é n·xⁿ⁻¹. Portanto, (x³)\' = 3x².',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'x²'),
      ExerciseOptionData(id: 'b', text: '3x'),
      ExerciseOptionData(id: 'c', text: '3x²'),
      ExerciseOptionData(id: 'd', text: 'x⁴/4'),
    ],
  ),
  ExerciseData(
    id: 'derivada-polinomio',
    title: 'Questão 3 de 50',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Derivação termo a termo',
    statement: 'Calcule a derivada de f(x) = 5x² - 3x + 4.',
    correctOptionId: 'a',
    explanation:
        'Use a linearidade e derive cada termo: (5x²)′=5·2x=10x; (−3x)′=−3; e a constante 4 tem derivada zero porque não varia. Somando as taxas, obtemos f′(x)=10x−3.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '10x - 3'),
      ExerciseOptionData(id: 'b', text: '5x - 3'),
      ExerciseOptionData(id: 'c', text: '10x + 4'),
      ExerciseOptionData(id: 'd', text: '10x² - 3'),
    ],
  ),
  ExerciseData(
    id: 'derivada-constante',
    title: 'Questão 4 de 50',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Derivada de constante',
    statement: 'Qual é a derivada da função constante f(x) = 12?',
    correctOptionId: 'd',
    explanation:
        'Uma função constante não varia. Por isso, sua taxa de variação e sua derivada são iguais a zero.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '12'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '12x'),
      ExerciseOptionData(id: 'd', text: '0'),
    ],
  ),
  ExerciseData(
    id: 'derivada-identidade',
    title: 'Questão 5 de 50',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Derivada da função identidade',
    statement: 'Se f(x) = x, qual é o valor de f\'(x)?',
    correctOptionId: 'b',
    explanation:
        'Na função f(x)=x, cada aumento Δx na entrada produz o mesmo aumento Δx na saída. A razão Δf/Δx é sempre 1; portanto, a reta possui inclinação constante e f′(x)=1 em todo ponto.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: 'x'),
      ExerciseOptionData(id: 'd', text: '2x'),
    ],
  ),
  ExerciseData(
    id: 'derivada-raiz',
    title: 'Questão 6 de 50',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Potência com expoente fracionário',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Para x > 0, qual é a derivada de f(x) = √x?',
    correctOptionId: 'c',
    explanation:
        'Reescreva √x como x¹ᐟ². Pela regra da potência, o expoente 1/2 desce multiplicando e diminui uma unidade: (1/2)x⁻¹ᐟ². Como x⁻¹ᐟ²=1/√x, resulta f′(x)=1/(2√x), válida para x>0.',
    options: [
      ExerciseOptionData(id: 'a', text: '√x/2'),
      ExerciseOptionData(id: 'b', text: '2√x'),
      ExerciseOptionData(id: 'c', text: '1/(2√x)'),
      ExerciseOptionData(id: 'd', text: '1/√x'),
    ],
  ),
  ExerciseData(
    id: 'derivada-inversa',
    title: 'Questão 7 de 50',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Potência com expoente negativo',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Para x ≠ 0, qual é a derivada de f(x) = 1/x?',
    correctOptionId: 'a',
    explanation:
        'Como 1/x=x⁻¹, use a regra da potência: o expoente −1 desce multiplicando e diminui uma unidade. Assim, (x⁻¹)\'=−x⁻²=−1/x². O sinal negativo mostra que 1/x decresce em cada intervalo do domínio.',
    options: [
      ExerciseOptionData(id: 'a', text: '-1/x²'),
      ExerciseOptionData(id: 'b', text: '1/x²'),
      ExerciseOptionData(id: 'c', text: '-1/x'),
      ExerciseOptionData(id: 'd', text: '0'),
    ],
  ),
  ExerciseData(
    id: 'derivada-produto',
    title: 'Questão 8 de 50',
    contentLessonId: 'derivadas-03-produto-quociente',
    skill: 'Produto ou expansão algébrica',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule a derivada de f(x) = x²(x + 1).',
    correctOptionId: 'd',
    explanation:
        'Você pode expandir antes: x²(x+1)=x³+x², então f′(x)=3x²+2x. Pela regra do produto, 2x(x+1)+x²·1 produz a mesma expressão. Essa conferência ajuda a detectar a alternativa que esqueceu uma parcela.',
    options: [
      ExerciseOptionData(id: 'a', text: '2x(x + 1)'),
      ExerciseOptionData(id: 'b', text: '3x² + 1'),
      ExerciseOptionData(id: 'c', text: 'x² + 2x'),
      ExerciseOptionData(id: 'd', text: '3x² + 2x'),
    ],
  ),
  ExerciseData(
    id: 'derivada-quociente-simplificado',
    title: 'Questão 9 de 50',
    contentLessonId: 'derivadas-03-produto-quociente',
    skill: 'Simplificação antes de derivar',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Para x ≠ 0, derive f(x) = (x² + 1)/x.',
    correctOptionId: 'b',
    explanation:
        'Separe o quociente preservando x≠0: (x²+1)/x=x+1/x=x+x⁻¹. Derive termo a termo: 1−x⁻². Portanto, f′(x)=1−1/x². Simplificar primeiro evita uma aplicação desnecessária da regra do quociente.',
    options: [
      ExerciseOptionData(id: 'a', text: '1 + 1/x²'),
      ExerciseOptionData(id: 'b', text: '1 - 1/x²'),
      ExerciseOptionData(id: 'c', text: '2x/x'),
      ExerciseOptionData(id: 'd', text: 'x² - 1'),
    ],
  ),
  ExerciseData(
    id: 'derivada-regra-cadeia',
    title: 'Questão 10 de 50',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Regra da cadeia',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Calcule a derivada de f(x) = (2x + 1)³.',
    correctOptionId: 'c',
    explanation:
        'Separe as camadas: a externa é u³ e a interna é u=2x+1. Derive a externa mantendo a interna, obtendo 3(2x+1)². Depois multiplique pela derivada interna 2. Logo, f′(x)=6(2x+1)².',
    options: [
      ExerciseOptionData(id: 'a', text: '3(2x + 1)²'),
      ExerciseOptionData(id: 'b', text: '6(2x + 1)'),
      ExerciseOptionData(id: 'c', text: '6(2x + 1)²'),
      ExerciseOptionData(id: 'd', text: '(2x + 1)²'),
    ],
  ),
  ExerciseData(
    id: 'derivada-seno',
    title: 'Questão 11 de 50',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivada do seno',
    statement: 'Qual é a derivada de f(x) = sen(x)?',
    correctOptionId: 'a',
    explanation:
        'A taxa instantânea de sen(x) segue cos(x): quando o seno cresce mais rapidamente, o cosseno é positivo; nos máximos e mínimos do seno, o cosseno vale zero. Assim, d/dx[sen(x)]=cos(x).',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'cos(x)'),
      ExerciseOptionData(id: 'b', text: '-cos(x)'),
      ExerciseOptionData(id: 'c', text: 'sen(x)'),
      ExerciseOptionData(id: 'd', text: '-sen(x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cosseno',
    title: 'Questão 12 de 50',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivada do cosseno',
    statement: 'Qual é a derivada de f(x) = cos(x)?',
    correctOptionId: 'd',
    explanation:
        'A derivada do cosseno é −sen(x). O sinal negativo registra que, partindo de x=0, o cosseno começa a diminuir enquanto o seno é positivo. Portanto, d/dx[cos(x)]=−sen(x).',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'sen(x)'),
      ExerciseOptionData(id: 'b', text: 'cos(x)'),
      ExerciseOptionData(id: 'c', text: '-cos(x)'),
      ExerciseOptionData(id: 'd', text: '-sen(x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-exponencial',
    title: 'Questão 13 de 50',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivada da exponencial natural',
    statement: 'Qual é a derivada de f(x) = eˣ?',
    correctOptionId: 'b',
    explanation:
        'A base e é definida de forma que a taxa instantânea de crescimento de eˣ seja igual ao próprio valor da função. Por isso, d/dx[eˣ]=eˣ, uma propriedade central em modelos de crescimento e decaimento.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'x·eˣ⁻¹'),
      ExerciseOptionData(id: 'b', text: 'eˣ'),
      ExerciseOptionData(id: 'c', text: '1/eˣ'),
      ExerciseOptionData(id: 'd', text: 'ln(x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-logaritmo',
    title: 'Questão 14 de 50',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivada do logaritmo natural',
    statement: 'Para x > 0, qual é a derivada de f(x) = ln(x)?',
    correctOptionId: 'c',
    explanation:
        'Para x>0, o logaritmo natural possui derivada 1/x. A taxa é positiva, mas diminui conforme x cresce, coerente com um gráfico que continua aumentando e fica progressivamente menos inclinado.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'ln(x)/x'),
      ExerciseOptionData(id: 'b', text: 'x'),
      ExerciseOptionData(id: 'c', text: '1/x'),
      ExerciseOptionData(id: 'd', text: 'eˣ'),
    ],
  ),
  ExerciseData(
    id: 'derivada-inclinacao-ponto',
    title: 'Questão 15 de 50',
    contentLessonId: 'derivadas-06-tangente',
    skill: 'Inclinação da tangente em um ponto',
    statement:
        'Qual é a inclinação da reta tangente a f(x) = x² no ponto em que x = 2?',
    correctOptionId: 'a',
    explanation:
        'Primeiro derive a função: f\'(x)=2x. A inclinação da tangente no ponto pedido é o valor da derivada em x=2. Portanto, f\'(2)=2·2=4; a parábola sobe quatro unidades verticalmente por unidade horizontal naquele instante.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '4'),
      ExerciseOptionData(id: 'b', text: '2'),
      ExerciseOptionData(id: 'c', text: '1'),
      ExerciseOptionData(id: 'd', text: '0'),
    ],
  ),
  ExerciseData(
    id: 'derivada-equacao-tangente',
    title: 'Questão 16 de 50',
    contentLessonId: 'derivadas-06-tangente',
    skill: 'Equação da reta tangente',
    difficulty: ExerciseDifficulty.challenge,
    statement: 'Qual é a reta tangente a f(x) = x² no ponto (1, 1)?',
    correctOptionId: 'c',
    explanation:
        'Derive f(x)=x² para obter f′(x)=2x. No ponto x=1, a inclinação é m=2 e o ponto dado é (1,1). Use a forma ponto-inclinação y−1=2(x−1) e simplifique: y=2x−1.',
    options: [
      ExerciseOptionData(id: 'a', text: 'y = x + 1'),
      ExerciseOptionData(id: 'b', text: 'y = x - 1'),
      ExerciseOptionData(id: 'c', text: 'y = 2x - 1'),
      ExerciseOptionData(id: 'd', text: 'y = 2x + 1'),
    ],
  ),
  ExerciseData(
    id: 'derivada-ponto-critico',
    title: 'Questão 17 de 50',
    contentLessonId: 'derivadas-07-derivabilidade',
    skill: 'Localização de ponto crítico',
    difficulty: ExerciseDifficulty.intermediate,
    statement:
        'Em qual valor de x a função f(x) = x² - 4x possui derivada igual a zero?',
    correctOptionId: 'd',
    explanation:
        'Derive termo a termo: f\'(x)=2x−4. Um ponto crítico com tangente horizontal satisfaz f\'(x)=0. Resolva 2x−4=0, obtendo 2x=4 e x=2. Esse valor é candidato a extremo e deve ser analisado no contexto da função.',
    options: [
      ExerciseOptionData(id: 'a', text: '-4'),
      ExerciseOptionData(id: 'b', text: '-2'),
      ExerciseOptionData(id: 'c', text: '0'),
      ExerciseOptionData(id: 'd', text: '2'),
    ],
  ),
  ExerciseData(
    id: 'derivabilidade-continuidade',
    title: 'Questão 18 de 50',
    contentLessonId: 'derivadas-07-derivabilidade',
    skill: 'Relação entre derivabilidade e continuidade',
    statement:
        'Se uma função é derivável em x = a, o que obrigatoriamente podemos afirmar?',
    correctOptionId: 'b',
    explanation:
        'Se a derivada existe em a, a função necessariamente é contínua nesse ponto. A recíproca é falsa: continuidade não garante uma inclinação única, como mostra |x| em zero. Portanto, derivabilidade é uma condição mais forte.',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'Ela possui máximo em a'),
      ExerciseOptionData(id: 'b', text: 'Ela é contínua em a'),
      ExerciseOptionData(id: 'c', text: 'Sua derivada é zero em a'),
      ExerciseOptionData(id: 'd', text: 'Ela é uma função polinomial'),
    ],
  ),
  ExerciseData(
    id: 'derivada-modulo-zero',
    title: 'Questão 19 de 50',
    contentLessonId: 'derivadas-07-derivabilidade',
    skill: 'Derivadas laterais em um canto',
    difficulty: ExerciseDifficulty.intermediate,
    statement: 'Por que f(x) = |x| não é derivável em x = 0?',
    correctOptionId: 'a',
    explanation:
        'Para x<0, |x|=−x e a inclinação é −1. Para x>0, |x|=x e a inclinação é 1. Como as derivadas laterais em zero são diferentes, não existe uma única reta tangente e f não é derivável nesse ponto, embora seja contínua.',
    options: [
      ExerciseOptionData(id: 'a', text: 'As derivadas laterais são diferentes'),
      ExerciseOptionData(id: 'b', text: 'A função não está definida em zero'),
      ExerciseOptionData(id: 'c', text: 'O limite da função é infinito'),
      ExerciseOptionData(id: 'd', text: 'A função não é contínua em zero'),
    ],
  ),
  ExerciseData(
    id: 'derivada-velocidade',
    title: 'Questão 20 de 50',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Velocidade instantânea',
    difficulty: ExerciseDifficulty.challenge,
    statement:
        'A posição de um móvel é s(t) = t² + 3t, em metros. Qual é sua velocidade instantânea em t = 2 s?',
    correctOptionId: 'c',
    explanation:
        'A velocidade instantânea é a derivada da posição. Derive s(t)=t²+3t para obter v(t)=2t+3. Avalie no instante pedido: v(2)=2·2+3=7. Como posição está em metros e tempo em segundos, a unidade é m/s.',
    options: [
      ExerciseOptionData(id: 'a', text: '4 m/s'),
      ExerciseOptionData(id: 'b', text: '5 m/s'),
      ExerciseOptionData(id: 'c', text: '7 m/s'),
      ExerciseOptionData(id: 'd', text: '10 m/s'),
    ],
  ),
  ExerciseData(
    id: 'derivada-taxa-media-limite-1',
    title: 'Questão 21 de 50',
    statement:
        'A derivada f′(a) pode ser definida como o limite de qual expressão, quando esse limite existe?',
    correctOptionId: 'b',
    explanation:
        'A derivada em a é o limite do quociente incremental [f(a+h)−f(a)]/h quando h tende a zero. Esse limite transforma a taxa média em taxa instantânea de variação.',
    contentLessonId: 'derivadas-01-significado',
    skill: 'Reconhecer a definição da derivada por limite',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '[f(a+h)+f(a)]/h'),
      ExerciseOptionData(id: 'b', text: '[f(a+h)−f(a)]/h'),
      ExerciseOptionData(id: 'c', text: 'f(a+h)·h'),
      ExerciseOptionData(id: 'd', text: 'f(a)/h'),
    ],
  ),
  ExerciseData(
    id: 'derivada-significado-unidade-1',
    title: 'Questão 22 de 50',
    statement:
        'Se s(t) é medida em metros e t em segundos, qual é a unidade de s′(t)?',
    correctOptionId: 'c',
    explanation:
        'A derivada mede a variação da grandeza de saída pela variação da entrada. Portanto, metros divididos por segundos produzem a unidade m/s.',
    contentLessonId: 'derivadas-01-significado',
    skill: 'Interpretar unidades de uma derivada',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'm²'),
      ExerciseOptionData(id: 'b', text: 's/m'),
      ExerciseOptionData(id: 'c', text: 'm/s'),
      ExerciseOptionData(id: 'd', text: 'm·s'),
    ],
  ),
  ExerciseData(
    id: 'derivada-crescente-sinal-1',
    title: 'Questão 23 de 50',
    statement:
        'Se f′(a) > 0, qual interpretação local é a mais adequada?',
    correctOptionId: 'a',
    explanation:
        'Uma derivada positiva indica inclinação positiva da reta tangente. Localmente, isso significa que a função está crescendo à medida que x aumenta próximo de a.',
    contentLessonId: 'derivadas-01-significado',
    skill: 'Interpretar o sinal da derivada',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'A função cresce localmente'),
      ExerciseOptionData(id: 'b', text: 'A função é constante'),
      ExerciseOptionData(id: 'c', text: 'A função tem necessariamente máximo'),
      ExerciseOptionData(id: 'd', text: 'A função é descontínua'),
    ],
  ),
  ExerciseData(
    id: 'derivada-secante-tangente-1',
    title: 'Questão 24 de 50',
    statement:
        'Na definição geométrica de derivada, o que acontece com as retas secantes quando o segundo ponto se aproxima do primeiro?',
    correctOptionId: 'd',
    explanation:
        'As inclinações das secantes tendem, quando o limite existe, à inclinação da reta tangente. Essa passagem ao limite é a base geométrica da derivada.',
    contentLessonId: 'derivadas-01-significado',
    skill: 'Relacionar secantes e reta tangente',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Tornam-se horizontais sempre'),
      ExerciseOptionData(id: 'b', text: 'Passam pela origem'),
      ExerciseOptionData(id: 'c', text: 'Ficam paralelas ao eixo y'),
      ExerciseOptionData(id: 'd', text: 'Suas inclinações tendem à inclinação da tangente'),
    ],
  ),
  ExerciseData(
    id: 'derivada-potencia-quinta-1',
    title: 'Questão 25 de 50',
    statement: 'Derive:\nf(x) = 4x⁵ − 2x² + 7',
    correctOptionId: 'b',
    explanation:
        'Aplicando a regra da potência termo a termo, obtemos 20x⁴ para 4x⁵, −4x para −2x² e zero para a constante 7. Logo, f′(x)=20x⁴−4x.',
    contentLessonId: 'derivadas-02-regras-basicas',
    skill: 'Aplicar regra da potência em polinômio',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '20x⁵ − 4x'),
      ExerciseOptionData(id: 'b', text: '20x⁴ − 4x'),
      ExerciseOptionData(id: 'c', text: '4x⁴ − 2x'),
      ExerciseOptionData(id: 'd', text: '20x⁴ − 4x + 7'),
    ],
  ),
  ExerciseData(
    id: 'derivada-produto-2',
    title: 'Questão 26 de 50',
    statement: 'Derive:\nf(x) = (x² + 1)(x − 3)',
    correctOptionId: 'c',
    explanation:
        'Pela regra do produto, f′(x)=2x(x−3)+(x²+1)·1. Simplificando, obtemos 2x²−6x+x²+1=3x²−6x+1.',
    contentLessonId: 'derivadas-03-produto-quociente',
    skill: 'Aplicar a regra do produto',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '2x(x − 3)'),
      ExerciseOptionData(id: 'b', text: '3x² − 3'),
      ExerciseOptionData(id: 'c', text: '3x² − 6x + 1'),
      ExerciseOptionData(id: 'd', text: 'x² − 6x + 1'),
    ],
  ),
  ExerciseData(
    id: 'derivada-produto-trig-1',
    title: 'Questão 27 de 50',
    statement: 'Derive:\nf(x) = x·sin(x)',
    correctOptionId: 'a',
    explanation:
        'Usando (uv)′=u′v+uv′, com u=x e v=sin(x), temos f′(x)=1·sin(x)+x·cos(x).',
    contentLessonId: 'derivadas-03-produto-quociente',
    skill: 'Aplicar produto com função trigonométrica',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'sin(x) + x cos(x)'),
      ExerciseOptionData(id: 'b', text: 'x cos(x)'),
      ExerciseOptionData(id: 'c', text: 'cos(x) + x sin(x)'),
      ExerciseOptionData(id: 'd', text: 'sin(x) − x cos(x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-quociente-1',
    title: 'Questão 28 de 50',
    statement: 'Derive:\nf(x) = x/(x + 1)',
    correctOptionId: 'd',
    explanation:
        'Pela regra do quociente, f′(x)=[1·(x+1)−x·1]/(x+1)². O numerador reduz a 1, então f′(x)=1/(x+1)².',
    contentLessonId: 'derivadas-03-produto-quociente',
    skill: 'Aplicar a regra do quociente',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '1/(x + 1)'),
      ExerciseOptionData(id: 'b', text: 'x/(x + 1)²'),
      ExerciseOptionData(id: 'c', text: '−1/(x + 1)²'),
      ExerciseOptionData(id: 'd', text: '1/(x + 1)²'),
    ],
  ),
  ExerciseData(
    id: 'derivada-quociente-trig-1',
    title: 'Questão 29 de 50',
    statement: 'Derive:\nf(x) = sin(x)/x, com x ≠ 0',
    correctOptionId: 'b',
    explanation:
        'Pela regra do quociente, f′(x)=[x cos(x)−sin(x)]/x². É importante manter a ordem u′v−uv′ corretamente no numerador.',
    contentLessonId: 'derivadas-03-produto-quociente',
    skill: 'Aplicar quociente com função trigonométrica',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: '[sin(x) − x cos(x)]/x²'),
      ExerciseOptionData(id: 'b', text: '[x cos(x) − sin(x)]/x²'),
      ExerciseOptionData(id: 'c', text: 'cos(x)/x'),
      ExerciseOptionData(id: 'd', text: '[x cos(x) + sin(x)]/x²'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cadeia-quadrado-1',
    title: 'Questão 30 de 50',
    statement: 'Derive:\nf(x) = (x² + 3)⁴',
    correctOptionId: 'c',
    explanation:
        'A função externa é u⁴, cuja derivada é 4u³, e a interna é u=x²+3, cuja derivada é 2x. Multiplicando, f′(x)=8x(x²+3)³.',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Aplicar cadeia em potência composta',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '4(x² + 3)³'),
      ExerciseOptionData(id: 'b', text: '8(x² + 3)³'),
      ExerciseOptionData(id: 'c', text: '8x(x² + 3)³'),
      ExerciseOptionData(id: 'd', text: '4x(x² + 3)⁴'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cadeia-raiz-1',
    title: 'Questão 31 de 50',
    statement: 'Derive, onde definida:\nf(x) = √(3x + 1)',
    correctOptionId: 'a',
    explanation:
        'Escreva f(x)=(3x+1)^(1/2). Pela cadeia, a derivada é (1/2)(3x+1)^(−1/2)·3 = 3/[2√(3x+1)].',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Aplicar cadeia em radical',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '3/[2√(3x + 1)]'),
      ExerciseOptionData(id: 'b', text: '1/[2√(3x + 1)]'),
      ExerciseOptionData(id: 'c', text: '3√(3x + 1)'),
      ExerciseOptionData(id: 'd', text: '1/√(3x + 1)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cadeia-seno-1',
    title: 'Questão 32 de 50',
    statement: 'Derive:\nf(x) = sin(4x)',
    correctOptionId: 'd',
    explanation:
        'A derivada externa de sin(u) é cos(u), e a derivada interna de u=4x é 4. Pela cadeia, f′(x)=4cos(4x).',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Aplicar cadeia em seno',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'cos(4x)'),
      ExerciseOptionData(id: 'b', text: '4sin(4x)'),
      ExerciseOptionData(id: 'c', text: '−4sin(4x)'),
      ExerciseOptionData(id: 'd', text: '4cos(4x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cadeia-exponencial-1',
    title: 'Questão 33 de 50',
    statement: 'Derive:\nf(x) = e^(2x²)',
    correctOptionId: 'b',
    explanation:
        'A derivada de e^u é e^u·u′. Aqui u=2x² e u′=4x. Portanto, f′(x)=4x·e^(2x²).',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Aplicar cadeia em exponencial natural',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '2x·e^(2x²)'),
      ExerciseOptionData(id: 'b', text: '4x·e^(2x²)'),
      ExerciseOptionData(id: 'c', text: 'e^(4x)'),
      ExerciseOptionData(id: 'd', text: '4x²·e^(2x²)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cadeia-log-1',
    title: 'Questão 34 de 50',
    statement: 'Derive, no domínio:\nf(x) = ln(x² + 1)',
    correctOptionId: 'c',
    explanation:
        'Para ln(u), a derivada é u′/u. Como u=x²+1 e u′=2x, obtemos f′(x)=2x/(x²+1).',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Aplicar cadeia em logaritmo natural',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '1/(x² + 1)'),
      ExerciseOptionData(id: 'b', text: '2/(x² + 1)'),
      ExerciseOptionData(id: 'c', text: '2x/(x² + 1)'),
      ExerciseOptionData(id: 'd', text: '2x·ln(x² + 1)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-cadeia-camadas-1',
    title: 'Questão 35 de 50',
    statement: 'Derive:\nf(x) = [1 + (2x − 1)²]³',
    correctOptionId: 'a',
    explanation:
        'Há três camadas: cubo, soma com quadrado e expressão linear. Derivando de fora para dentro: 3[1+(2x−1)²]²·2(2x−1)·2 = 12(2x−1)[1+(2x−1)²]².',
    contentLessonId: 'derivadas-04-cadeia',
    skill: 'Aplicar cadeia em múltiplas camadas',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: '12(2x − 1)[1 + (2x − 1)²]²'),
      ExerciseOptionData(id: 'b', text: '6(2x − 1)[1 + (2x − 1)²]²'),
      ExerciseOptionData(id: 'c', text: '3[1 + (2x − 1)²]²'),
      ExerciseOptionData(id: 'd', text: '12[1 + (2x − 1)²]³'),
    ],
  ),
  ExerciseData(
    id: 'derivada-tangente-trig-1',
    title: 'Questão 36 de 50',
    statement: 'Qual é a derivada de f(x) = tan(x), onde definida?',
    correctOptionId: 'd',
    explanation:
        'A derivada da tangente é sec²(x) em todos os pontos do domínio de tan(x). Essa fórmula pode ser obtida derivando sin(x)/cos(x) pela regra do quociente.',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivar função tangente',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'cos²(x)'),
      ExerciseOptionData(id: 'b', text: '−sec²(x)'),
      ExerciseOptionData(id: 'c', text: 'cot(x)'),
      ExerciseOptionData(id: 'd', text: 'sec²(x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-exponencial-base-a-1',
    title: 'Questão 37 de 50',
    statement: 'Para a > 0 e a ≠ 1, qual é a derivada de aˣ?',
    correctOptionId: 'a',
    explanation:
        'A derivada de aˣ é aˣ ln(a). O caso especial a=e simplifica porque ln(e)=1, produzindo novamente eˣ.',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivar exponencial de base geral',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'aˣ ln(a)'),
      ExerciseOptionData(id: 'b', text: 'x a^(x−1)'),
      ExerciseOptionData(id: 'c', text: 'aˣ/a'),
      ExerciseOptionData(id: 'd', text: 'ln(x)·a'),
    ],
  ),
  ExerciseData(
    id: 'derivada-log-base-a-1',
    title: 'Questão 38 de 50',
    statement: 'Para x > 0, qual é a derivada de logₐ(x), com a > 0 e a ≠ 1?',
    correctOptionId: 'b',
    explanation:
        'Usando logₐ(x)=ln(x)/ln(a), e como ln(a) é constante, a derivada é 1/[x ln(a)].',
    contentLessonId: 'derivadas-05-elementares',
    skill: 'Derivar logaritmo de base geral',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'ln(a)/x'),
      ExerciseOptionData(id: 'b', text: '1/[x ln(a)]'),
      ExerciseOptionData(id: 'c', text: 'a/x'),
      ExerciseOptionData(id: 'd', text: '1/ln(x)'),
    ],
  ),
  ExerciseData(
    id: 'derivada-tangente-polinomio-1',
    title: 'Questão 39 de 50',
    statement:
        'Para f(x) = x³ − x, qual é a inclinação da tangente em x = 1?',
    correctOptionId: 'c',
    explanation:
        'Derivando, f′(x)=3x²−1. Avaliando em x=1, obtemos f′(1)=3−1=2. Portanto, a inclinação da tangente é 2.',
    contentLessonId: 'derivadas-06-tangente',
    skill: 'Calcular inclinação da tangente em polinômio',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '2'),
      ExerciseOptionData(id: 'd', text: '3'),
    ],
  ),
  ExerciseData(
    id: 'derivada-tangente-equacao-2',
    title: 'Questão 40 de 50',
    statement:
        'Encontre a reta tangente a f(x)=x²+1 no ponto de abscissa x=2.',
    correctOptionId: 'b',
    explanation:
        'Temos f(2)=5 e f′(x)=2x, logo f′(2)=4. Pela forma ponto-inclinação, y−5=4(x−2), portanto y=4x−3.',
    contentLessonId: 'derivadas-06-tangente',
    skill: 'Encontrar equação da reta tangente',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'y = 2x + 1'),
      ExerciseOptionData(id: 'b', text: 'y = 4x − 3'),
      ExerciseOptionData(id: 'c', text: 'y = 4x + 5'),
      ExerciseOptionData(id: 'd', text: 'y = 2x − 3'),
    ],
  ),
  ExerciseData(
    id: 'derivada-normal-1',
    title: 'Questão 41 de 50',
    statement:
        'Se a reta tangente a uma curva tem inclinação 3 em certo ponto, qual é a inclinação da reta normal nesse ponto?',
    correctOptionId: 'd',
    explanation:
        'Tangente e normal são perpendiculares. Para inclinações finitas e não nulas, seus coeficientes angulares são recíprocos opostos. Assim, m_normal = −1/3.',
    contentLessonId: 'derivadas-06-tangente',
    skill: 'Relacionar reta tangente e reta normal',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '3'),
      ExerciseOptionData(id: 'b', text: '1/3'),
      ExerciseOptionData(id: 'c', text: '−3'),
      ExerciseOptionData(id: 'd', text: '−1/3'),
    ],
  ),
  ExerciseData(
    id: 'derivada-horizontal-1',
    title: 'Questão 42 de 50',
    statement:
        'Em um ponto onde f′(a)=0, qual é a inclinação da reta tangente?',
    correctOptionId: 'a',
    explanation:
        'Por definição, f′(a) é a inclinação da tangente. Se f′(a)=0, a tangente possui inclinação zero e é horizontal naquele ponto.',
    contentLessonId: 'derivadas-06-tangente',
    skill: 'Interpretar derivada nula geometricamente',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: '0'),
      ExerciseOptionData(id: 'b', text: '1'),
      ExerciseOptionData(id: 'c', text: '∞'),
      ExerciseOptionData(id: 'd', text: '−1'),
    ],
  ),
  ExerciseData(
    id: 'derivabilidade-canto-2',
    title: 'Questão 43 de 50',
    statement:
        'Uma função contínua apresenta um canto em x=a, com derivada lateral esquerda −2 e direita 3. Ela é derivável em a?',
    correctOptionId: 'c',
    explanation:
        'Para a derivada existir, as derivadas laterais devem existir e ser iguais. Como −2 e 3 são diferentes, a função não é derivável em a, apesar de poder ser contínua.',
    contentLessonId: 'derivadas-07-derivabilidade',
    skill: 'Comparar derivadas laterais em um canto',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Sim, porque é contínua'),
      ExerciseOptionData(id: 'b', text: 'Sim, porque ambas as derivadas laterais existem'),
      ExerciseOptionData(id: 'c', text: 'Não, porque as derivadas laterais são diferentes'),
      ExerciseOptionData(id: 'd', text: 'Não, porque a função precisa ser polinomial'),
    ],
  ),
  ExerciseData(
    id: 'derivada-critico-nao-derivavel-1',
    title: 'Questão 44 de 50',
    statement:
        'Um número c no domínio pode ser ponto crítico mesmo se f′(c) não existir?',
    correctOptionId: 'b',
    explanation:
        'Sim. Um número crítico é tipicamente um ponto do domínio em que f′(c)=0 ou em que f′(c) não existe. Cantos e cúspides podem produzir esse segundo caso.',
    contentLessonId: 'derivadas-07-derivabilidade',
    skill: 'Reconhecer pontos críticos não deriváveis',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'Não, nunca'),
      ExerciseOptionData(id: 'b', text: 'Sim, se c estiver no domínio e f′(c) não existir'),
      ExerciseOptionData(id: 'c', text: 'Somente se f(c)=0'),
      ExerciseOptionData(id: 'd', text: 'Somente em polinômios'),
    ],
  ),
  ExerciseData(
    id: 'derivada-aplicacao-aceleracao-1',
    title: 'Questão 45 de 50',
    statement:
        'Se s(t)=t³−3t² é a posição em metros, qual é a aceleração a(t)?',
    correctOptionId: 'a',
    explanation:
        'A velocidade é v(t)=s′(t)=3t²−6t. A aceleração é a derivada da velocidade: a(t)=v′(t)=6t−6.',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Obter aceleração a partir da posição',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: 'a(t) = 6t − 6'),
      ExerciseOptionData(id: 'b', text: 'a(t) = 3t² − 6t'),
      ExerciseOptionData(id: 'c', text: 'a(t) = 6t'),
      ExerciseOptionData(id: 'd', text: 'a(t) = t³ − 3t²'),
    ],
  ),
  ExerciseData(
    id: 'derivada-aplicacao-custo-marginal-1',
    title: 'Questão 46 de 50',
    statement:
        'Se C(q)=100+5q+0,02q² representa um custo em reais, qual é o custo marginal C′(q)?',
    correctOptionId: 'd',
    explanation:
        'Derivando termo a termo, a constante 100 desaparece, 5q gera 5 e 0,02q² gera 0,04q. Assim, C′(q)=5+0,04q.',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Interpretar derivada como custo marginal',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '100 + 5q'),
      ExerciseOptionData(id: 'b', text: '5 + 0,02q'),
      ExerciseOptionData(id: 'c', text: '0,04q'),
      ExerciseOptionData(id: 'd', text: '5 + 0,04q'),
    ],
  ),
  ExerciseData(
    id: 'derivada-aplicacao-crescimento-1',
    title: 'Questão 47 de 50',
    statement:
        'Uma população é modelada por P(t)=200e^(0,03t). Qual é P′(t)?',
    correctOptionId: 'c',
    explanation:
        'Aplicando a regra da cadeia, a derivada de e^(0,03t) é 0,03e^(0,03t). Multiplicando por 200, resulta P′(t)=6e^(0,03t).',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Modelar taxa instantânea de crescimento exponencial',
    difficulty: ExerciseDifficulty.intermediate,
    options: [
      ExerciseOptionData(id: 'a', text: '200e^(0,03t)'),
      ExerciseOptionData(id: 'b', text: '0,03e^(0,03t)'),
      ExerciseOptionData(id: 'c', text: '6e^(0,03t)'),
      ExerciseOptionData(id: 'd', text: '200·0,03t'),
    ],
  ),
  ExerciseData(
    id: 'derivada-aplicacao-area-1',
    title: 'Questão 48 de 50',
    statement:
        'A área de um círculo é A(r)=πr². Qual é a taxa de variação da área em relação ao raio?',
    correctOptionId: 'b',
    explanation:
        'Derivando A(r)=πr² em relação a r, tratamos π como constante. Pela regra da potência, dA/dr=2πr.',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Derivar uma grandeza geométrica em relação a outra',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'πr'),
      ExerciseOptionData(id: 'b', text: '2πr'),
      ExerciseOptionData(id: 'c', text: '2πr²'),
      ExerciseOptionData(id: 'd', text: 'π'),
    ],
  ),
  ExerciseData(
    id: 'derivada-aplicacao-unidades-1',
    title: 'Questão 49 de 50',
    statement:
        'Se V(t) é um volume medido em cm³ e t em segundos, qual unidade deve ter V′(t)?',
    correctOptionId: 'a',
    explanation:
        'A derivada representa variação de volume por unidade de tempo. Logo, a unidade é centímetros cúbicos por segundo, isto é, cm³/s.',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Interpretar unidades em taxa instantânea',
    difficulty: ExerciseDifficulty.foundation,
    options: [
      ExerciseOptionData(id: 'a', text: 'cm³/s'),
      ExerciseOptionData(id: 'b', text: 'cm/s³'),
      ExerciseOptionData(id: 'c', text: 'cm²/s'),
      ExerciseOptionData(id: 'd', text: 'cm³·s'),
    ],
  ),
  ExerciseData(
    id: 'derivada-aplicacao-maximo-candidato-1',
    title: 'Questão 50 de 50',
    statement:
        'Se f é derivável e possui um máximo local interior em x=c, qual condição é esperada quando o Teorema de Fermat se aplica?',
    correctOptionId: 'd',
    explanation:
        'Em um máximo ou mínimo local interior onde a função é derivável, o Teorema de Fermat fornece f′(c)=0. Isso torna c um candidato crítico, mas não garante sozinho que seja máximo.',
    contentLessonId: 'derivadas-08-aplicacoes',
    skill: 'Relacionar extremos locais e derivada nula',
    difficulty: ExerciseDifficulty.challenge,
    options: [
      ExerciseOptionData(id: 'a', text: 'f(c) = 0'),
      ExerciseOptionData(id: 'b', text: 'f′(c) > 0'),
      ExerciseOptionData(id: 'c', text: 'f′(c) < 0'),
      ExerciseOptionData(id: 'd', text: 'f′(c) = 0'),
    ],
  ),

];