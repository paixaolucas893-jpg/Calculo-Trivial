import 'package:flutter/widgets.dart';

import 'package:calcquest/shared/domain/course_lesson_data.dart';

List<CourseLessonData> localizedPrecalculusEquationsSupplementLessons(
  Locale locale,
) {
  if (locale.languageCode == 'en') {
    return _englishLessons;
  }
  return precalculusEquationsSupplementLessons;
}

const List<CourseLessonData> precalculusEquationsSupplementLessons = [
  CourseLessonData(
    id: 'equations-09-radicais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Pré-Cálculo',
    title: 'Equações com radicais',
    description:
        'domínio, isolamento, potenciação, soluções estranhas e verificação',
    duration: '≈ 32 min',
    objective:
        'resolver equações com radicais preservando restrições de domínio, identificar quando a potenciação pode introduzir soluções estranhas e verificar sistematicamente cada candidato na equação original',
    symbol: '√x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Equações radicais exigem domínio',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A existência da raiz vem antes da álgebra',
            content:
                'Em uma equação com raiz de índice par, o radicando deve ser não negativo. Se a raiz estiver no denominador, o radicando deve ser estritamente positivo.',
            emphasis:
                'A análise de domínio pode eliminar candidatos antes mesmo da resolução algébrica.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Isole o radical primeiro',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Potenciar depois de organizar',
            content:
                'A estratégia mais segura é isolar a expressão radical e só então elevar ambos os membros a uma potência compatível com o índice da raiz.',
            emphasis:
                'Elevar ao quadrado preserva toda solução original, mas pode introduzir candidatos extras.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Por que aparecem soluções estranhas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A implicação não é reversível em geral',
            content:
                'Se a=b, então a²=b². Porém, a²=b² não implica necessariamente a=b, pois também pode ocorrer a=−b. Por isso, elevar ao quadrado pode ampliar o conjunto de candidatos.',
            emphasis:
                'A equação transformada pode ter mais soluções do que a equação original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exemplo completo com uma raiz',
        blocks: [
          WorkedExampleBlockData(
            title: 'Resolver e verificar',
            problem: 'Resolva √(x+1)=x−1.',
            steps: [
              'A raiz é não negativa, então x−1≥0 e, portanto, x≥1.',
              'Eleve ao quadrado: x+1=(x−1)².',
              'Expanda: x+1=x²−2x+1.',
              'Reorganize: x²−3x=0.',
              'Fatore: x(x−3)=0.',
              'Candidatos: x=0 e x=3.',
              'A restrição x≥1 elimina x=0.',
              'Verifique x=3 na equação original: √4=2 e 3−1=2.',
            ],
            result: 'S={3}.',
            interpretation:
                'A verificação final remove candidatos incompatíveis com a equação original.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Radical em apenas um membro',
        blocks: [
          WorkedExampleBlockData(
            title: 'Isolamento simples',
            problem: 'Resolva √(2x+3)=5.',
            steps: [
              'Condição de domínio: 2x+3≥0.',
              'Eleve ao quadrado: 2x+3=25.',
              'Então 2x=22 e x=11.',
              'Verifique: √25=5.',
            ],
            result: 'S={11}.',
            interpretation:
                'Quando um lado já é uma constante não negativa, o processo é direto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Radicais nos dois membros',
        blocks: [
          WorkedExampleBlockData(
            title: 'Duas raízes quadradas',
            problem: 'Resolva √(x+6)=√(2x−1).',
            steps: [
              'Domínio: x+6≥0 e 2x−1≥0, então x≥1/2.',
              'Eleve ao quadrado: x+6=2x−1.',
              'Resolva: x=7.',
              'Verifique no domínio e na equação original.',
            ],
            result: 'S={7}.',
            interpretation:
                'Com raízes quadradas principais nos dois lados, a igualdade dos radicais permite comparar os radicandos dentro do domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Mais de um radical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Pode ser necessário repetir o processo',
            content:
                'Quando há dois radicais e não é possível compará-los diretamente, isole um deles, eleve à potência adequada, reorganize e, se ainda restar radical, repita o procedimento.',
            emphasis:
                'Cada potenciação aumenta a necessidade de verificação final.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Raízes de índice ímpar',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O comportamento é diferente',
            content:
                'Raízes de índice ímpar admitem radicandos negativos. Além disso, elevar ambos os lados a uma potência ímpar é uma transformação reversível nos reais.',
            emphasis:
                'O risco clássico de soluções estranhas é especialmente associado a potências pares.',
          ),
          WorkedExampleBlockData(
            title: 'Raiz cúbica',
            problem: 'Resolva ∛(2x−1)=3.',
            steps: [
              'Eleve ambos os membros ao cubo.',
              '2x−1=27.',
              '2x=28.',
            ],
            result: 'x=14.',
            interpretation:
                'Não há restrição de sinal para a raiz cúbica real.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Elevar antes de isolar',
            content:
                'Quadrar uma soma contendo radical pode criar expressões desnecessariamente complexas. Isole o radical sempre que possível.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar o domínio',
            content:
                'Um candidato obtido algebricamente pode violar a condição de existência da raiz.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Não verificar candidatos',
            content:
                'Soluções da equação transformada não são automaticamente soluções da equação original.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Resolva √(x+4)=x−2.',
            steps: [
              'Como a raiz é não negativa, x−2≥0, então x≥2.',
              'Eleve ao quadrado: x+4=(x−2)².',
              'Obtenha x²−5x=0.',
              'Candidatos: x=0 e x=5.',
              'A restrição elimina x=0.',
            ],
            result: 'S={5}.',
            interpretation:
                'A condição de sinal do segundo membro já antecipava parte da verificação.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Resolva √(3x−2)=4.',
            steps: [
              'Eleve ao quadrado: 3x−2=16.',
              '3x=18.',
            ],
            result: 'x=6.',
            interpretation:
                'A verificação confirma √16=4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva e verifique cada candidato',
            content:
                '1. √x=4.\n'
                '2. √(x+5)=3.\n'
                '3. √(2x−1)=5.\n'
                '4. √(x+2)=x.\n'
                '5. √(x+6)=x−2.\n'
                '6. √(x+3)=√(2x−4).\n'
                '7. ∛(x−1)=2.\n'
                '8. Determine o domínio de √(3−x).\n'
                '9. Explique por que elevar ao quadrado pode criar soluções estranhas.\n'
                '10. Dê um exemplo de candidato estranho.\n'
                '11. Resolva √(x−1)+1=4.\n'
                '12. Resolva √(2x+7)=x+1.\n'
                '13. Compare o comportamento de raízes pares e ímpares.\n'
                '14. Explique por que a verificação deve ser feita na equação original.\n'
                '15. Crie uma equação radical cuja solução seja x=5.',
            emphasis:
                'Escreva primeiro as restrições de domínio e só depois inicie a manipulação algébrica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com funções e Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Domínio e equivalência continuam centrais',
            content:
                'Funções radicais aparecem em limites, derivadas e modelagem. Saber preservar domínio e distinguir equivalência de mera implicação evita erros em manipulações posteriores.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas e Guidorizzi para funções radicais, domínio e transformações algébricas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Por que devemos testar as respostas ao final de uma equação com radical?',
      choices: [
        'Porque elevar ao quadrado pode introduzir soluções estranhas',
        'Porque raízes nunca admitem soluções positivas',
        'Porque toda equação radical tem duas soluções',
      ],
      correctIndex: 0,
      explanation:
          'Elevar ao quadrado não é reversível em todos os casos. A equação transformada pode ter candidatos que não satisfazem a equação original.',
    ),
    takeaways: [
      'Domínio deve ser analisado antes da resolução.',
      'Isole o radical antes de elevar a uma potência.',
      'Potências pares podem introduzir soluções estranhas.',
      'Raízes de índice ímpar têm comportamento diferente.',
      'Candidatos devem ser verificados na equação original.',
      'Mais de um radical pode exigir potenciações sucessivas.',
    ],
    closing:
        'Equações radicais exigem disciplina lógica: domínio, transformação, candidatos e verificação formam um único processo.',
  ),
  CourseLessonData(
    id: 'equations-10-inequacoes-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Pré-Cálculo',
    title: 'Inequações quadráticas',
    description:
        'raízes críticas, fatoração, estudo de sinal, multiplicidade e interpretação gráfica',
    duration: '≈ 32 min',
    objective:
        'resolver inequações quadráticas por fatoração e estudo de sinal, interpretar o papel das raízes e da multiplicidade e relacionar o conjunto solução ao gráfico da parábola',
    symbol: 'ax²+bx+c',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Uma inequação quadrática pergunta pelo sinal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Positivo, negativo ou zero',
            content:
                'Resolver f(x)>0, f(x)<0, f(x)≥0 ou f(x)≤0 para uma função quadrática significa identificar em quais regiões da reta o valor da expressão é positivo, negativo ou nulo.',
            emphasis:
                'As raízes da equação f(x)=0 são fronteiras naturais do estudo de sinal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Leve tudo para um lado',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Compare uma única expressão com zero',
            content:
                'Antes de estudar o sinal, reorganize a inequação para a forma ax²+bx+c comparada com zero. Isso permite fatorar ou usar as raízes da quadrática.',
            emphasis:
                'A estrutura de sinal fica mais clara quando um dos membros é zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'As raízes dividem a reta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Pontos críticos organizam intervalos',
            content:
                'Se uma quadrática possui raízes reais r₁ e r₂, elas dividem a reta em intervalos. O sinal da expressão permanece constante dentro de cada intervalo enquanto nenhuma raiz é atravessada.',
            emphasis:
                'A inequação pede intervalos, não apenas as raízes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Estudo de sinal por fatores',
        blocks: [
          WorkedExampleBlockData(
            title: 'Produto positivo',
            problem: 'Resolva x²−5x+6>0.',
            steps: [
              'Fatore: (x−2)(x−3)>0.',
              'Pontos críticos: 2 e 3.',
              'Para x<2, os dois fatores são negativos: produto positivo.',
              'Para 2<x<3, os fatores têm sinais opostos: produto negativo.',
              'Para x>3, os dois fatores são positivos.',
            ],
            result: 'S=(−∞,2)∪(3,+∞).',
            interpretation:
                'A solução reúne os intervalos onde a parábola está acima do eixo x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Inequação não estrita',
        blocks: [
          WorkedExampleBlockData(
            title: 'Incluindo as raízes',
            problem: 'Resolva x²−5x+6≤0.',
            steps: [
              'Fatore: (x−2)(x−3)≤0.',
              'Entre as raízes, o produto é negativo.',
              'Nas raízes, o produto vale zero.',
            ],
            result: 'S=[2,3].',
            interpretation:
                'O símbolo ≤ inclui os pontos onde a quadrática zera.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'O papel do coeficiente líder',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'A orientação da parábola antecipa o sinal',
            content:
                'Se a>0, a parábola abre para cima; com duas raízes reais distintas, ela tende a ser positiva fora das raízes e negativa entre elas. Se a<0, o padrão se inverte.',
            emphasis:
                'Essa leitura gráfica é uma verificação poderosa do estudo de sinais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Raiz dupla e multiplicidade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'O sinal pode não mudar ao atravessar uma raiz',
            content:
                'Em (x−r)², a raiz r tem multiplicidade par. O fator é não negativo dos dois lados de r, então o sinal não muda ao atravessar essa raiz.',
            emphasis:
                'Raízes de multiplicidade ímpar trocam o sinal; raízes de multiplicidade par preservam o sinal.',
          ),
          WorkedExampleBlockData(
            title: 'Quadrado perfeito',
            problem: 'Resolva (x−2)²≥0.',
            steps: [
              'Todo quadrado real é não negativo.',
              'Em x=2, a expressão vale zero.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'A raiz dupla não cria uma região negativa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Quando não há raízes reais',
        blocks: [
          WorkedExampleBlockData(
            title: 'Sinal constante',
            problem: 'Resolva x²+4x+5>0.',
            steps: [
              'Calcule Δ=16−20=−4<0.',
              'Como a=1>0 e não há raízes reais, a parábola permanece acima do eixo x.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'Sem raízes reais, uma quadrática não troca de sinal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Método gráfico e método algébrico',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Duas leituras do mesmo problema',
            content:
                'Algebricamente, usamos fatores e sinais. Graficamente, observamos onde a parábola fica acima ou abaixo do eixo x. Os dois métodos devem produzir o mesmo conjunto solução.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Responder apenas com as raízes',
            content:
                'As raízes são fronteiras do estudo de sinal, mas a solução da inequação é formada por intervalos.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar se a desigualdade inclui igualdade',
            content:
                'Em > e <, as raízes não entram. Em ≥ e ≤, entram quando pertencem ao domínio.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Assumir alternância de sinal em raiz dupla',
            content:
                'Uma raiz de multiplicidade par não provoca troca de sinal.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Resolva x²−x−6≥0.',
            steps: [
              'Fatore: (x−3)(x+2)≥0.',
              'Pontos críticos: −2 e 3.',
              'O produto é não negativo fora do intervalo entre as raízes.',
            ],
            result: 'S=(−∞,−2]∪[3,+∞).',
            interpretation:
                'As raízes entram por causa do símbolo ≥.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Resolva −x²+4x−3>0.',
            steps: [
              'Fatore: −(x−1)(x−3)>0.',
              'A parábola abre para baixo.',
              'O sinal positivo ocorre entre as raízes.',
            ],
            result: 'S=(1,3).',
            interpretation:
                'O coeficiente líder negativo inverte o padrão externo/interno.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Resolva por estudo de sinal',
            content:
                '1. x²−9>0.\n'
                '2. x²−9≤0.\n'
                '3. x²−5x+6≥0.\n'
                '4. x²+x−6<0.\n'
                '5. −x²+5x−6>0.\n'
                '6. (x−4)²≤0.\n'
                '7. (x+1)²>0.\n'
                '8. x²+4x+5>0.\n'
                '9. x²+4x+5<0.\n'
                '10. 2x²−8x+6≤0.\n'
                '11. Explique o efeito de uma raiz dupla no sinal.\n'
                '12. Determine onde f(x)=x²−2x−3 é positiva.\n'
                '13. Determine onde f(x)=−x²+4 é não negativa.\n'
                '14. Compare o método gráfico e o método por fatores.\n'
                '15. Crie uma inequação quadrática cuja solução seja [−1,2].',
            emphasis:
                'Registre os pontos críticos, os sinais em cada intervalo e a notação final.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Estudo de sinal prepara crescimento e concavidade',
            content:
                'No Cálculo, tabelas de sinal são usadas para determinar onde derivadas são positivas ou negativas e, portanto, onde funções crescem, decrescem ou mudam de concavidade.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas para estudo de sinais e análise de funções.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Se (x−1)(x+4)≤0, qual intervalo resolve a inequação?',
      choices: ['[−4,1]', '(−∞,−4]∪[1,+∞)', '(−4,1)'],
      correctIndex: 0,
      explanation:
          'O produto é não positivo entre as raízes. Como ≤ inclui zero, os extremos −4 e 1 pertencem à solução.',
    ),
    takeaways: [
      'Leve a inequação para uma expressão comparada com zero.',
      'Raízes são pontos críticos do estudo de sinal.',
      'A multiplicidade determina se o sinal muda em uma raiz.',
      'O coeficiente líder ajuda a prever o padrão de sinais.',
      'A solução é formada por intervalos.',
      'A interpretação gráfica confirma o estudo algébrico.',
    ],
    closing:
        'Resolver uma inequação quadrática é localizar, na reta real, onde a parábola assume o sinal pedido.',
  ),
  CourseLessonData(
    id: 'equations-11-inequacoes-racionais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equações e Inequações',
    eyebrow: 'Pré-Cálculo',
    title: 'Inequações racionais',
    description:
        'domínio, zeros, pontos proibidos, multiplicidade e tabela de sinais',
    duration: '≈ 34 min',
    objective:
        'resolver inequações racionais por estudo de sinal, distinguindo zeros do numerador de valores proibidos do denominador, preservando o domínio e analisando multiplicidades',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Domínio vem antes do sinal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Denominador zero é sempre proibido',
            content:
                'Em P(x)/Q(x), todo zero de Q(x) deve ser excluído antes do estudo de sinal. Esse ponto nunca pertence à solução, mesmo quando a inequação inclui igualdade.',
            emphasis:
                'Zeros do numerador e zeros do denominador têm papéis diferentes.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Zeros do numerador',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Podem entrar quando a igualdade é aceita',
            content:
                'Se P(r)=0 e Q(r)≠0, então a fração vale zero em r. Assim, r pode pertencer à solução de ≥0 ou ≤0, mas não de >0 ou <0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Pontos críticos dividem a reta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Junte zeros e pontos proibidos',
            content:
                'Os zeros do numerador e do denominador dividem a reta em intervalos. Dentro de cada intervalo, o sinal de cada fator e do quociente permanece constante.',
            emphasis:
                'Monte a tabela de sinais somente depois de fatorar e marcar todos os pontos críticos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exemplo fundamental',
        blocks: [
          WorkedExampleBlockData(
            title: 'Zero permitido, denominador proibido',
            problem: 'Resolva (x−2)/(x+1)≥0.',
            steps: [
              'Zero do numerador: x=2.',
              'Zero do denominador: x=−1, valor proibido.',
              'Os intervalos são (−∞,−1), (−1,2) e (2,+∞).',
              'No primeiro, quociente positivo.',
              'No segundo, quociente negativo.',
              'No terceiro, quociente positivo.',
              'Como ≥ inclui zero, x=2 entra; x=−1 nunca entra.',
            ],
            result: 'S=(−∞,−1)∪[2,+∞).',
            interpretation:
                'A exclusão de −1 é consequência do domínio, não apenas da desigualdade.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Fatoração antes da tabela',
        blocks: [
          WorkedExampleBlockData(
            title: 'Numerador quadrático',
            problem: 'Resolva (x²−9)/(x−1)<0.',
            steps: [
              'Fatore x²−9=(x−3)(x+3).',
              'Pontos críticos: −3, 1 e 3.',
              'x=1 é proibido; ±3 zeram o numerador.',
              'Analise os sinais fator a fator em cada intervalo.',
            ],
            result: 'S=(−∞,−3)∪(1,3).',
            interpretation:
                'A fatoração torna visível a contribuição de cada fator para o sinal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Multiplicidade também importa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Fator de expoente par não troca sinal',
            content:
                'Se um fator aparece com multiplicidade par, como (x−2)², seu sinal não muda ao atravessar x=2. O mesmo princípio usado em inequações polinomiais vale em numeradores e denominadores fatorados.',
            emphasis:
                'Multiplicidade ímpar troca o sinal; multiplicidade par preserva.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Cancelamento e domínio original',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Um fator cancelado pode deixar um ponto removido',
            content:
                'Em uma expressão como (x−2)(x+1)/(x−2), o fator x−2 pode ser cancelado para estudar o sinal, mas x=2 continua fora do domínio original.',
            emphasis:
                'Simplificação não restaura pontos proibidos.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Inequações com produto de frações',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Transforme tudo em fatores',
            content:
                'Produtos e quocientes de expressões racionais podem ser tratados em uma única tabela de sinais, desde que todos os fatores do numerador e do denominador sejam identificados e o domínio seja preservado.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Incluir zero do denominador',
            content:
                'Nenhum símbolo de igualdade permite incluir um valor em que a expressão não existe.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplicar pela variável sem saber seu sinal',
            content:
                'Multiplicar uma inequação racional por um denominador variável pode exigir inversão do sinal dependendo do valor de x. A tabela de sinais evita esse problema.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelar e esquecer o domínio',
            content:
                'Fatores cancelados continuam determinando pontos excluídos da expressão original.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1',
            problem: 'Resolva (x+3)/(x−5)<0.',
            steps: [
              'Zero do numerador: −3.',
              'Ponto proibido: 5.',
              'O quociente é negativo quando numerador e denominador têm sinais opostos.',
            ],
            result: 'S=(−3,5).',
            interpretation:
                'Os extremos não entram: −3 produz zero e 5 não pertence ao domínio.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2',
            problem: 'Resolva (x−1)(x+2)/(x−4)≥0.',
            steps: [
              'Pontos críticos: −2, 1 e 4.',
              '−2 e 1 zeram o numerador; 4 é proibido.',
              'Analise o sinal nos quatro intervalos.',
            ],
            result: 'S=[−2,1]∪(4,+∞).',
            interpretation:
                'Os zeros entram por causa de ≥; o ponto 4 permanece excluído.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Fatore, marque pontos críticos e estude o sinal',
            content:
                '1. (x−1)/(x+2)>0.\n'
                '2. (x+4)/(x−3)≤0.\n'
                '3. (x²−4)/(x−1)>0.\n'
                '4. (x−2)/(x²−9)≥0.\n'
                '5. (x−1)(x+3)/(x−5)<0.\n'
                '6. (x−2)²/(x+1)>0.\n'
                '7. (x+1)/(x−4)²≤0.\n'
                '8. Determine o domínio de (x²−1)/(x²−4).\n'
                '9. Explique a diferença entre zero do numerador e zero do denominador.\n'
                '10. Explique por que não devemos multiplicar diretamente por x−3 sem conhecer seu sinal.\n'
                '11. Simplifique (x−2)(x+1)/(x−2) e preserve o domínio.\n'
                '12. Resolva (x²−9)/(x²−1)≥0.\n'
                '13. Analise o efeito de uma multiplicidade par no denominador.\n'
                '14. Relacione pontos proibidos com descontinuidades.\n'
                '15. Crie uma inequação racional cuja solução tenha dois intervalos.',
            emphasis:
                'Separe claramente: zeros permitidos, pontos proibidos e intervalos de sinal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Domínio, descontinuidades e sinais',
            content:
                'Zeros do denominador são candidatos a descontinuidades e assíntotas verticais. Tabelas de sinal de expressões racionais reaparecem na análise de derivadas, crescimento e comportamento de funções.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi e colaboradores; Stewart e Thomas para funções racionais, domínio, sinais e assíntotas.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Em (x+3)/(x−5)<0, qual valor jamais pode pertencer à solução?',
      choices: ['−3', '0', '5'],
      correctIndex: 2,
      explanation:
          'x=5 zera o denominador. A expressão não está definida nesse ponto, independentemente do símbolo da inequação.',
    ),
    takeaways: [
      'Domínio deve ser determinado antes do estudo de sinal.',
      'Zeros do numerador podem entrar em desigualdades não estritas.',
      'Zeros do denominador nunca entram.',
      'Fatoração revela pontos críticos e multiplicidades.',
      'Cancelamento não restaura pontos excluídos.',
      'Tabelas de sinal evitam multiplicações inseguras por expressões de sinal desconhecido.',
    ],
    closing:
        'Inequações racionais unem domínio e sinal: resolver corretamente exige controlar ambos ao mesmo tempo.',
  ),
];

const List<CourseLessonData> _englishLessons = [
  CourseLessonData(
    id: 'equations-09-radicais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Precalculus',
    title: 'Radical equations',
    description:
        'domain, isolation, powers, extraneous solutions, and verification',
    duration: '≈ 32 min',
    objective:
        'solve radical equations while preserving domain restrictions, identify when powers may introduce extraneous solutions, and verify every candidate in the original equation',
    symbol: '√x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Radical equations require domain analysis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Existence comes before algebra',
            content:
                'For an even-index root, the radicand must be nonnegative. If the root appears in a denominator, the radicand must be strictly positive.',
            emphasis:
                'Domain analysis can eliminate candidates before algebraic solving begins.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Isolate the radical first',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Raise powers only after organizing',
            content:
                'The safest strategy is to isolate the radical expression and only then raise both sides to a power compatible with the radical index.',
            emphasis:
                'Squaring preserves every original solution but may introduce extra candidates.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Why extraneous solutions appear',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'The implication is not reversible in general',
            content:
                'If a=b, then a²=b². But a²=b² does not imply only a=b, because a=−b is also possible. Squaring can therefore enlarge the candidate set.',
            emphasis:
                'The transformed equation may have more solutions than the original equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Complete example with one radical',
        blocks: [
          WorkedExampleBlockData(
            title: 'Solve and verify',
            problem: 'Solve √(x+1)=x−1.',
            steps: [
              'The square root is nonnegative, so x−1≥0 and x≥1.',
              'Square both sides: x+1=(x−1)².',
              'Expand and rearrange: x²−3x=0.',
              'Factor: x(x−3)=0.',
              'Candidates: x=0 and x=3.',
              'The restriction eliminates x=0.',
              'Check x=3 in the original equation.',
            ],
            result: 'S={3}.',
            interpretation:
                'Final verification removes candidates that do not satisfy the original equation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'A radical on one side',
        blocks: [
          WorkedExampleBlockData(
            title: 'Simple isolation',
            problem: 'Solve √(2x+3)=5.',
            steps: [
              'Domain condition: 2x+3≥0.',
              'Square: 2x+3=25.',
              'Then x=11.',
              'Check √25=5.',
            ],
            result: 'S={11}.',
            interpretation:
                'When the other side is already a nonnegative constant, the process is direct.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Radicals on both sides',
        blocks: [
          WorkedExampleBlockData(
            title: 'Two square roots',
            problem: 'Solve √(x+6)=√(2x−1).',
            steps: [
              'Domain: x≥1/2.',
              'Square both sides: x+6=2x−1.',
              'Solve: x=7.',
              'Verify in the original equation.',
            ],
            result: 'S={7}.',
            interpretation:
                'Within the domain, equality of principal square roots allows comparison of radicands.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'More than one radical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'The process may need to be repeated',
            content:
                'With multiple radicals, isolate one radical, raise both sides to a suitable power, reorganize, and repeat if another radical remains.',
            emphasis:
                'Each power operation increases the importance of final verification.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Odd-index roots',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Their behavior is different',
            content:
                'Odd-index roots allow negative radicands. Raising both sides to the corresponding odd power is reversible over the real numbers.',
            emphasis:
                'The classic extraneous-solution problem is especially associated with even powers.',
          ),
          WorkedExampleBlockData(
            title: 'Cube root',
            problem: 'Solve ∛(2x−1)=3.',
            steps: [
              'Cube both sides.',
              '2x−1=27.',
              'Then x=14.',
            ],
            result: 'S={14}.',
            interpretation:
                'Real cube roots have no sign restriction on the radicand.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Raising powers before isolating',
            content:
                'Squaring a sum containing a radical can create unnecessary complexity. Isolate the radical first whenever possible.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring the domain',
            content:
                'An algebraic candidate may violate the existence condition of the radical.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Skipping verification',
            content:
                'Solutions of the transformed equation are not automatically solutions of the original equation.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1',
            problem: 'Solve √(x+4)=x−2.',
            steps: [
              'Because the root is nonnegative, x≥2.',
              'Square: x+4=(x−2)².',
              'Obtain x²−5x=0.',
              'Candidates are 0 and 5.',
              'The restriction removes 0.',
            ],
            result: 'S={5}.',
            interpretation:
                'The sign condition already predicted part of the verification.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Solve √(3x−2)=4.',
            steps: [
              'Square: 3x−2=16.',
              'Then x=6.',
            ],
            result: 'S={6}.',
            interpretation:
                'Checking confirms √16=4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve and verify every candidate',
            content:
                '1. √x=4.\n'
                '2. √(x+5)=3.\n'
                '3. √(2x−1)=5.\n'
                '4. √(x+2)=x.\n'
                '5. √(x+6)=x−2.\n'
                '6. √(x+3)=√(2x−4).\n'
                '7. ∛(x−1)=2.\n'
                '8. Find the domain of √(3−x).\n'
                '9. Explain why squaring can introduce extraneous solutions.\n'
                '10. Give an example of an extraneous candidate.\n'
                '11. Solve √(x−1)+1=4.\n'
                '12. Solve √(2x+7)=x+1.\n'
                '13. Compare even- and odd-index roots.\n'
                '14. Explain why verification must use the original equation.\n'
                '15. Create a radical equation whose solution is x=5.',
            emphasis:
                'Write domain restrictions before beginning algebraic manipulation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to functions and Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Domain and equivalence remain central',
            content:
                'Radical functions appear in limits, derivatives, and modeling. Preserving domain and distinguishing equivalence from one-way implication prevents later algebraic errors.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas, and Guidorizzi for radical functions, domain, and algebraic transformations.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Why must answers be checked after solving a radical equation?',
      choices: [
        'Squaring can introduce extraneous solutions',
        'Square roots never allow positive solutions',
        'Every radical equation has two solutions',
      ],
      correctIndex: 0,
      explanation:
          'Squaring is not reversible in every case. The transformed equation may contain candidates that fail the original equation.',
    ),
    takeaways: [
      'Analyze the domain before solving.',
      'Isolate the radical before raising powers.',
      'Even powers can introduce extraneous solutions.',
      'Odd-index roots behave differently.',
      'Candidates must be checked in the original equation.',
      'Multiple radicals may require repeated power operations.',
    ],
    closing:
        'Radical equations require logical discipline: domain, transformation, candidates, and verification form one process.',
  ),
  CourseLessonData(
    id: 'equations-10-inequacoes-quadraticas',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Precalculus',
    title: 'Quadratic inequalities',
    description:
        'critical roots, factoring, sign analysis, multiplicity, and graph interpretation',
    duration: '≈ 32 min',
    objective:
        'solve quadratic inequalities by factoring and sign analysis, interpret the role of roots and multiplicity, and connect the solution set to the graph of a parabola',
    symbol: 'ax²+bx+c',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A quadratic inequality asks about sign',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Positive, negative, or zero',
            content:
                'Solving f(x)>0, f(x)<0, f(x)≥0, or f(x)≤0 for a quadratic means identifying where the expression is positive, negative, or zero.',
            emphasis:
                'The roots of f(x)=0 are natural boundaries for sign analysis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Move everything to one side',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Compare one expression with zero',
            content:
                'Before studying the sign, rewrite the inequality so a single quadratic expression is compared with zero. Then factor it or determine its roots.',
            emphasis:
                'Sign structure is clearest when one side is zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Roots divide the real line',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Critical points organize intervals',
            content:
                'If a quadratic has real roots r₁ and r₂, they split the real line into intervals. The sign remains constant within each interval until a root is crossed.',
            emphasis:
                'The inequality asks for intervals, not merely the roots.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Sign analysis by factors',
        blocks: [
          WorkedExampleBlockData(
            title: 'Positive product',
            problem: 'Solve x²−5x+6>0.',
            steps: [
              'Factor: (x−2)(x−3)>0.',
              'Critical points: 2 and 3.',
              'For x<2, both factors are negative: product positive.',
              'For 2<x<3, the factors have opposite signs: product negative.',
              'For x>3, both factors are positive.',
            ],
            result: 'S=(−∞,2)∪(3,+∞).',
            interpretation:
                'The solution is where the parabola lies above the x-axis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Non-strict inequalities',
        blocks: [
          WorkedExampleBlockData(
            title: 'Including roots',
            problem: 'Solve x²−5x+6≤0.',
            steps: [
              'Factor: (x−2)(x−3)≤0.',
              'Between the roots, the product is negative.',
              'At the roots, the product is zero.',
            ],
            result: 'S=[2,3].',
            interpretation:
                'The symbol ≤ includes the zeros of the quadratic.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'The role of the leading coefficient',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Parabola orientation predicts the sign pattern',
            content:
                'If a>0, the parabola opens upward. With two distinct real roots, it is typically positive outside the roots and negative between them. If a<0, the pattern reverses.',
            emphasis:
                'This graphical reading is a strong check on the sign table.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Repeated roots and multiplicity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The sign may not change across a root',
            content:
                'For a factor such as (x−r)², the root r has even multiplicity. The factor is nonnegative on both sides, so the sign does not change when crossing r.',
            emphasis:
                'Odd multiplicity changes sign; even multiplicity preserves it.',
          ),
          WorkedExampleBlockData(
            title: 'Perfect square',
            problem: 'Solve (x−2)²≥0.',
            steps: [
              'Every real square is nonnegative.',
              'At x=2, the expression equals zero.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'A repeated root does not create a negative interval.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'When there are no real roots',
        blocks: [
          WorkedExampleBlockData(
            title: 'Constant sign',
            problem: 'Solve x²+4x+5>0.',
            steps: [
              'Compute Δ=16−20=−4<0.',
              'Since a=1>0 and there are no real roots, the parabola remains above the x-axis.',
            ],
            result: 'S=ℝ.',
            interpretation:
                'Without real roots, a quadratic cannot switch sign.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Graphical and algebraic methods',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Two readings of the same problem',
            content:
                'Algebraically, use factors and signs. Graphically, identify where the parabola is above or below the x-axis. Both approaches must agree.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Giving only the roots',
            content:
                'The roots are boundaries for sign analysis, but the solution to the inequality consists of intervals.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring whether equality is included',
            content:
                'With > and <, roots are excluded. With ≥ and ≤, roots are included when they belong to the domain.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Assuming sign alternation at a repeated root',
            content:
                'A root of even multiplicity does not change the sign.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1',
            problem: 'Solve x²−x−6≥0.',
            steps: [
              'Factor: (x−3)(x+2)≥0.',
              'Critical points: −2 and 3.',
              'The product is nonnegative outside the interval between the roots.',
            ],
            result: 'S=(−∞,−2]∪[3,+∞).',
            interpretation:
                'The roots are included because of ≥.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Solve −x²+4x−3>0.',
            steps: [
              'Factor: −(x−1)(x−3)>0.',
              'The parabola opens downward.',
              'The expression is positive between the roots.',
            ],
            result: 'S=(1,3).',
            interpretation:
                'A negative leading coefficient reverses the outside/inside pattern.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Solve by sign analysis',
            content:
                '1. x²−9>0.\n'
                '2. x²−9≤0.\n'
                '3. x²−5x+6≥0.\n'
                '4. x²+x−6<0.\n'
                '5. −x²+5x−6>0.\n'
                '6. (x−4)²≤0.\n'
                '7. (x+1)²>0.\n'
                '8. x²+4x+5>0.\n'
                '9. x²+4x+5<0.\n'
                '10. 2x²−8x+6≤0.\n'
                '11. Explain the effect of a repeated root on sign.\n'
                '12. Determine where f(x)=x²−2x−3 is positive.\n'
                '13. Determine where f(x)=−x²+4 is nonnegative.\n'
                '14. Compare the graphical method with factor sign analysis.\n'
                '15. Create a quadratic inequality whose solution is [−1,2].',
            emphasis:
                'Record critical points, interval signs, and the final interval notation.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Sign analysis prepares increasing/decreasing and concavity tests',
            content:
                'In Calculus, sign charts determine where derivatives are positive or negative and therefore where functions increase, decrease, or change concavity.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for sign analysis and function behavior.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'If (x−1)(x+4)≤0, which interval solves the inequality?',
      choices: ['[−4,1]', '(−∞,−4]∪[1,+∞)', '(−4,1)'],
      correctIndex: 0,
      explanation:
          'The product is nonpositive between the roots. Because ≤ includes zero, −4 and 1 are included.',
    ),
    takeaways: [
      'Rewrite the inequality as one expression compared with zero.',
      'Roots are critical points in sign analysis.',
      'Multiplicity determines whether the sign changes at a root.',
      'The leading coefficient helps predict the sign pattern.',
      'The solution consists of intervals.',
      'The graph confirms the algebraic sign analysis.',
    ],
    closing:
        'Solving a quadratic inequality means locating where the parabola has the requested sign.',
  ),
  CourseLessonData(
    id: 'equations-11-inequacoes-racionais',
    topicId: 'equacoes-inequacoes',
    trailTitle: 'Equations and Inequalities',
    eyebrow: 'Precalculus',
    title: 'Rational inequalities',
    description:
        'domain, zeros, excluded points, multiplicity, and sign charts',
    duration: '≈ 34 min',
    objective:
        'solve rational inequalities by sign analysis, distinguish numerator zeros from forbidden denominator values, preserve the domain, and analyze multiplicities',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Domain comes before sign',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A zero denominator is always forbidden',
            content:
                'In P(x)/Q(x), every zero of Q(x) must be excluded before sign analysis. It can never belong to the solution, even in a non-strict inequality.',
            emphasis:
                'Zeros of the numerator and zeros of the denominator play different roles.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Zeros of the numerator',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'They may be included when equality is allowed',
            content:
                'If P(r)=0 and Q(r)≠0, then the rational expression equals zero at r. Thus r may belong to ≥0 or ≤0 solutions, but not to >0 or <0 solutions.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Critical points divide the real line',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Combine zeros and excluded points',
            content:
                'Zeros of the numerator and denominator divide the real line into intervals. Within each interval, the sign of every factor and of the quotient is constant.',
            emphasis:
                'Build the sign chart only after factoring and marking all critical points.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Core example',
        blocks: [
          WorkedExampleBlockData(
            title: 'Allowed zero, forbidden denominator',
            problem: 'Solve (x−2)/(x+1)≥0.',
            steps: [
              'Numerator zero: x=2.',
              'Denominator zero: x=−1, which is forbidden.',
              'Intervals: (−∞,−1), (−1,2), and (2,+∞).',
              'The quotient is positive on the first interval.',
              'Negative on the second.',
              'Positive on the third.',
              'Because ≥ allows zero, x=2 is included; x=−1 never is.',
            ],
            result: 'S=(−∞,−1)∪[2,+∞).',
            interpretation:
                'The exclusion of −1 comes from domain, not merely from the inequality sign.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Factor before building the sign chart',
        blocks: [
          WorkedExampleBlockData(
            title: 'Quadratic numerator',
            problem: 'Solve (x²−9)/(x−1)<0.',
            steps: [
              'Factor x²−9=(x−3)(x+3).',
              'Critical points: −3, 1, and 3.',
              'x=1 is forbidden; ±3 are numerator zeros.',
              'Analyze the sign of each factor on each interval.',
            ],
            result: 'S=(−∞,−3)∪(1,3).',
            interpretation:
                'Factoring makes each contribution to the sign visible.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Multiplicity matters here too',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'An even-power factor does not change sign',
            content:
                'If a factor appears with even multiplicity, such as (x−2)², its sign does not change when x crosses 2. The same multiplicity principle applies in numerators and denominators.',
            emphasis:
                'Odd multiplicity changes sign; even multiplicity preserves it.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Cancellation and the original domain',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'A cancelled factor can leave a hole',
            content:
                'In (x−2)(x+1)/(x−2), the factor x−2 may be cancelled for sign analysis, but x=2 remains excluded from the original domain.',
            emphasis:
                'Simplification never restores forbidden values.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Products of rational factors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Reduce the problem to factors',
            content:
                'Products and quotients of rational expressions can be handled in one sign chart once every numerator and denominator factor is identified and the domain is preserved.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Including a denominator zero',
            content:
                'No equality symbol can include a point where the expression does not exist.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Multiplying by a variable expression of unknown sign',
            content:
                'Multiplying a rational inequality by a variable denominator can require reversing the sign depending on x. A sign chart avoids this ambiguity.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelling and forgetting the domain',
            content:
                'Cancelled factors still determine excluded points of the original expression.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1',
            problem: 'Solve (x+3)/(x−5)<0.',
            steps: [
              'Numerator zero: −3.',
              'Forbidden point: 5.',
              'The quotient is negative when numerator and denominator have opposite signs.',
            ],
            result: 'S=(−3,5).',
            interpretation:
                'Neither endpoint is included: −3 gives zero and 5 is outside the domain.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2',
            problem: 'Solve (x−1)(x+2)/(x−4)≥0.',
            steps: [
              'Critical points: −2, 1, and 4.',
              '−2 and 1 are numerator zeros; 4 is forbidden.',
              'Analyze the four intervals.',
            ],
            result: 'S=[−2,1]∪(4,+∞).',
            interpretation:
                'Zeros are included because of ≥; x=4 remains excluded.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Factor, mark critical points, and analyze signs',
            content:
                '1. (x−1)/(x+2)>0.\n'
                '2. (x+4)/(x−3)≤0.\n'
                '3. (x²−4)/(x−1)>0.\n'
                '4. (x−2)/(x²−9)≥0.\n'
                '5. (x−1)(x+3)/(x−5)<0.\n'
                '6. (x−2)²/(x+1)>0.\n'
                '7. (x+1)/(x−4)²≤0.\n'
                '8. Find the domain of (x²−1)/(x²−4).\n'
                '9. Explain the difference between a numerator zero and a denominator zero.\n'
                '10. Explain why multiplying directly by x−3 can be unsafe without knowing its sign.\n'
                '11. Simplify (x−2)(x+1)/(x−2) while preserving domain.\n'
                '12. Solve (x²−9)/(x²−1)≥0.\n'
                '13. Analyze the effect of even multiplicity in the denominator.\n'
                '14. Relate excluded points to discontinuities.\n'
                '15. Create a rational inequality whose solution has two intervals.',
            emphasis:
                'Clearly separate allowed zeros, forbidden points, and sign intervals.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Domain, discontinuities, and signs',
            content:
                'Denominator zeros are candidates for discontinuities and vertical asymptotes. Sign charts of rational expressions reappear in derivative analysis, monotonicity, and function behavior.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Algebra and Trigonometry 2e; OpenStax College Algebra 2e; Sullivan, Precalculus; Blitzer, Precalculus; Iezzi and collaborators; Stewart and Thomas for rational functions, domain, sign analysis, and asymptotes.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'In (x+3)/(x−5)<0, which value can never belong to the solution?',
      choices: ['−3', '0', '5'],
      correctIndex: 2,
      explanation:
          'x=5 makes the denominator zero. The expression is undefined there regardless of the inequality symbol.',
    ),
    takeaways: [
      'Determine the domain before sign analysis.',
      'Numerator zeros may be included in non-strict inequalities.',
      'Denominator zeros are never included.',
      'Factoring reveals critical points and multiplicities.',
      'Cancellation does not restore excluded points.',
      'Sign charts avoid unsafe multiplication by expressions of unknown sign.',
    ],
    closing:
        'Rational inequalities combine domain and sign: correct solutions require control of both.',
  )
];
