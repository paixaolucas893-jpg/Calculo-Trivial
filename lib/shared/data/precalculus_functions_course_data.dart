import 'package:flutter/widgets.dart';

import 'package:calcquest/shared/domain/course_lesson_data.dart';

List<CourseLessonData> localizedPrecalculusFunctionsCourseLessons(Locale locale) {
  if (locale.languageCode == 'en') return _englishLessons;
  return precalculusFunctionsCourseLessons;
}

const List<CourseLessonData> precalculusFunctionsCourseLessons = [
  CourseLessonData(
    id: 'funcoes-01-conceito-dominio-imagem',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Fundamentos',
    title: 'Função, domínio, contradomínio e imagem',
    description:
        'definição formal, notação, avaliação, domínio, contradomínio, imagem, zeros e leitura gráfica',
    duration: '≈ 38 min',
    objective:
        'compreender função como relação unívoca entre conjuntos, distinguir domínio, contradomínio e imagem, avaliar funções, determinar restrições algébricas e interpretar zeros e gráficos',
    symbol: 'f:A→B',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição formal de função',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Cada entrada possui exatamente uma saída',
            content:
                'Uma função [[math:f:A\\to B]] associa a cada elemento [[math:x\\in A]] exatamente um elemento [[math:f(x)\\in B]]. O conjunto A é o domínio e B é o contradomínio.',
            emphasis:
                'Entradas diferentes podem produzir a mesma saída; uma mesma entrada não pode produzir duas saídas diferentes na mesma função.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Relação versus função',
            content:
                'Toda função é uma relação, mas nem toda relação é função. O critério decisivo é a unicidade da saída para cada entrada do domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Domínio, contradomínio e imagem',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Três conjuntos diferentes',
            content:
                'Domínio é o conjunto de entradas permitidas. Contradomínio é o conjunto de chegada declarado. Imagem é o subconjunto do contradomínio formado pelas saídas que realmente ocorrem.',
            emphasis:
                'Sempre vale Im(f)⊆B, mas a imagem não precisa ser igual ao contradomínio.',
          ),
          WorkedExampleBlockData(
            title: 'Contradomínio maior que a imagem',
            problem: 'Considere f:ℝ→ℝ dada por f(x)=x². Qual é a imagem?',
            steps: [
              'Todo real pode ser usado como entrada.',
              'Para todo x real, x²≥0.',
              'Todo y≥0 pode ser produzido escolhendo x=√y ou x=−√y.',
            ],
            result: 'Domínio=ℝ, contradomínio=ℝ e imagem=[0,+∞).',
            interpretation:
                'A imagem é apenas parte do contradomínio declarado.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Notação f(x)',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'f(x) é o valor da função',
            content:
                'A expressão f(x) indica a saída associada à entrada x. Não significa f multiplicado por x.',
            emphasis:
                'A letra x é uma variável de entrada; podemos avaliar f em números, expressões ou outras funções.',
          ),
          WorkedExampleBlockData(
            title: 'Avaliação direta',
            problem: 'Se f(x)=2x²−3x+1, calcule f(−2).',
            steps: [
              'Substitua x por −2 em toda a expressão.',
              'f(−2)=2(−2)²−3(−2)+1.',
              'Calcule: 8+6+1=15.',
            ],
            result: 'f(−2)=15.',
            interpretation:
                'Parênteses ajudam a preservar corretamente o sinal da entrada.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Domínio natural de uma fórmula',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Procure operações que impõem restrições',
            content:
                'Em funções reais definidas por fórmula, o domínio natural contém todos os reais para os quais a expressão está definida. Denominadores não podem ser zero; radicandos de raízes pares devem ser não negativos; argumentos de logaritmos devem ser positivos.',
            emphasis:
                'Quando várias restrições aparecem, o domínio é a interseção de todas elas.',
          ),
          WorkedExampleBlockData(
            title: 'Duas restrições simultâneas',
            problem: 'Determine o domínio de f(x)=√(x−1)/(x−4).',
            steps: [
              'A raiz exige x−1≥0, então x≥1.',
              'O denominador exige x−4≠0, então x≠4.',
              'Interseccione as condições.',
            ],
            result: 'D_f=[1,4)∪(4,+∞).',
            interpretation:
                'O valor 4 satisfaz a raiz, mas é excluído pelo denominador.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Imagem a partir da expressão',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'A imagem depende dos valores que realmente saem',
            content:
                'Determinar imagem pode exigir desigualdades, completar quadrados, análise de monotonicidade ou leitura gráfica. Não existe uma única técnica universal.',
          ),
          WorkedExampleBlockData(
            title: 'Imagem de uma quadrática',
            problem: 'Determine a imagem de f(x)=x²−4x+3.',
            steps: [
              'Complete o quadrado: f(x)=(x−2)²−1.',
              'Como (x−2)²≥0, temos f(x)≥−1.',
              'O valor −1 ocorre em x=2.',
            ],
            result: 'Im(f)=[−1,+∞).',
            interpretation:
                'A forma de quadrado completado revela imediatamente o valor mínimo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Zeros de uma função',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Resolver f(x)=0',
            content:
                'Um zero ou raiz da função é um valor a do domínio tal que f(a)=0. Graficamente, os zeros correspondem às abscissas dos pontos onde o gráfico intercepta o eixo x.',
          ),
          WorkedExampleBlockData(
            title: 'Zeros de um polinômio',
            problem: 'Encontre os zeros de f(x)=x²−5x+6.',
            steps: [
              'Resolva x²−5x+6=0.',
              'Fatore: (x−2)(x−3)=0.',
            ],
            result: 'Zeros: x=2 e x=3.',
            interpretation:
                'Resolver uma equação f(x)=0 é localizar interceptos horizontais do gráfico.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Gráfico de uma função',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'O gráfico é um conjunto de pares ordenados',
            content:
                'O gráfico de f é o conjunto [[math:\\{(x,f(x)):x\\in D_f\\}]]. Cada ponto registra uma entrada e sua saída correspondente.',
            emphasis:
                'O gráfico não é a função inteira por si só, mas uma representação geométrica da relação entrada–saída.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Teste da reta vertical',
            content:
                'Um gráfico no plano representa y como função de x se nenhuma reta vertical intersecta o gráfico em mais de um ponto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Funções definidas por partes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Uma função pode usar regras diferentes',
            content:
                'Uma função por partes escolhe fórmulas distintas em regiões diferentes do domínio, mas ainda deve fornecer uma única saída para cada entrada.',
          ),
          WorkedExampleBlockData(
            title: 'Avaliação por partes',
            problem: 'Se f(x)=x² para x<0 e f(x)=2x+1 para x≥0, calcule f(−2) e f(3).',
            steps: [
              'Como −2<0, use x²: f(−2)=4.',
              'Como 3≥0, use 2x+1: f(3)=7.',
            ],
            result: 'f(−2)=4 e f(3)=7.',
            interpretation:
                'A condição decide qual regra deve ser aplicada.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir imagem com contradomínio',
            content:
                'O contradomínio é declarado na definição; a imagem é produzida efetivamente pela função.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar restrições algébricas',
            content:
                'Uma fórmula não define automaticamente uma função em todos os reais. Divisões, raízes e logaritmos podem restringir o domínio.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir f(x) com produto',
            content:
                'f(x) é uma notação funcional. Não significa f·x.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — domínio',
            problem: 'Determine o domínio de g(x)=1/√(x−2).',
            steps: [
              'A raiz exige x−2≥0.',
              'Como está no denominador, √(x−2) também não pode ser zero.',
              'Portanto x−2>0.',
            ],
            result: 'D_g=(2,+∞).',
            interpretation:
                'Raiz no denominador transforma ≥ em >.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — imagem',
            problem: 'Determine a imagem de h(x)=−(x−1)²+4.',
            steps: [
              '(x−1)²≥0.',
              'Logo −(x−1)²≤0.',
              'Somando 4: h(x)≤4.',
              'O valor 4 ocorre em x=1.',
            ],
            result: 'Im(h)=(−∞,4].',
            interpretation:
                'A função possui máximo igual a 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Analise estrutura, domínio e imagem',
            content:
                '1. Calcule f(3) para f(x)=2x−5.\n'
                '2. Calcule f(−2) para f(x)=x²+x.\n'
                '3. Determine o domínio de 1/(x−7).\n'
                '4. Determine o domínio de √(2x+6).\n'
                '5. Determine o domínio de √(x+1)/(x−2).\n'
                '6. Determine a imagem de x².\n'
                '7. Determine a imagem de (x−3)²+2.\n'
                '8. Encontre os zeros de x²−4.\n'
                '9. Explique a diferença entre contradomínio e imagem.\n'
                '10. Dê um exemplo de relação que não é função.\n'
                '11. Aplique o teste da reta vertical a um círculo.\n'
                '12. Avalie uma função por partes em dois pontos distintos.\n'
                '13. Explique por que f(x) não significa f·x.\n'
                '14. Determine o domínio de ln(x−1).\n'
                '15. Crie uma função com domínio ℝ e imagem [2,+∞).',
            emphasis:
                'Em domínio, justifique cada restrição em vez de apenas escrever o intervalo final.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Toda análise posterior começa pelo domínio',
            content:
                'Limites, continuidade, derivadas e integrais sempre dependem de onde a função está definida. Zeros, imagem e comportamento gráfico também reaparecem em otimização e estudo de sinais.',
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
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas e Guidorizzi para funções, domínio, imagem e interpretação gráfica.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual valor deve ser excluído do domínio de g(x)=1/(x+2)?',
      choices: ['−2', '0', '2'],
      correctIndex: 0,
      explanation:
          'x=−2 zera o denominador. Como divisão por zero não está definida, esse valor deve ser excluído.',
    ),
    takeaways: [
      'Uma função associa cada entrada do domínio a exatamente uma saída.',
      'Domínio, contradomínio e imagem são conjuntos distintos.',
      'f(x) representa a saída correspondente à entrada x.',
      'O domínio natural depende das operações presentes na fórmula.',
      'Zeros satisfazem f(x)=0.',
      'O gráfico reúne os pares (x,f(x)).',
      'O teste da reta vertical verifica unicidade da saída.',
    ],
    closing:
        'Compreender domínio, imagem e notação funcional é pré-requisito para toda a análise de funções que vem depois.',
  ),
  CourseLessonData(
    id: 'funcoes-02-composicao-inversa',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Estrutura',
    title: 'Composição, injetividade e função inversa',
    description:
        'encadeamento de funções, domínio da composta, injetividade, bijetividade, inversa e restrição de domínio',
    duration: '≈ 38 min',
    objective:
        'compor funções com controle de domínio, distinguir composição de produto, analisar injetividade e bijetividade, determinar funções inversas e verificar resultados por composição',
    symbol: 'f∘g',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Composição é aplicação sucessiva',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Primeiro g, depois f',
            content:
                'A composição [[math:(f\\circ g)(x)=f(g(x))]] aplica primeiro g à entrada x e depois usa g(x) como entrada de f.',
            emphasis:
                'A ordem é parte da definição: em geral, f∘g≠g∘f.',
          ),
          WorkedExampleBlockData(
            title: 'Composição algébrica',
            problem: 'Se f(x)=2x+1 e g(x)=x²−3, determine (f∘g)(x).',
            steps: [
              'Comece pela função interna: g(x)=x²−3.',
              'Substitua g(x) no lugar de x em f.',
              'f(g(x))=2(x²−3)+1.',
              'Simplifique.',
            ],
            result: '(f∘g)(x)=2x²−5.',
            interpretation:
                'Compor é substituir uma saída dentro da regra da outra função.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Composição não é comutativa',
        blocks: [
          WorkedExampleBlockData(
            title: 'Compare as duas ordens',
            problem: 'Para f(x)=2x+1 e g(x)=x², compare f∘g e g∘f.',
            steps: [
              '(f∘g)(x)=f(x²)=2x²+1.',
              '(g∘f)(x)=g(2x+1)=(2x+1)².',
              'Expanda: (g∘f)(x)=4x²+4x+1.',
            ],
            result: 'f∘g≠g∘f.',
            interpretation:
                'Trocar a ordem muda o processo e, normalmente, muda a função resultante.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Domínio da função composta',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Duas condições simultâneas',
            content:
                'Para x pertencer ao domínio de f∘g, primeiro x deve pertencer ao domínio de g e, além disso, g(x) deve pertencer ao domínio de f.',
            emphasis:
                'Não basta verificar apenas o domínio da função interna.',
          ),
          WorkedExampleBlockData(
            title: 'Composição com raiz',
            problem: 'Se f(u)=√u e g(x)=x−3, determine o domínio de f∘g.',
            steps: [
              'g está definida para todo x real.',
              'A entrada de f deve ser não negativa.',
              'Portanto g(x)=x−3≥0.',
            ],
            result: 'D_{f∘g}=[3,+∞).',
            interpretation:
                'A restrição surge quando a saída de g entra na raiz de f.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Injetividade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Saídas iguais exigem entradas iguais',
            content:
                'Uma função f é injetiva quando [[math:f(x_1)=f(x_2)\\Rightarrow x_1=x_2]]. Equivalentemente, entradas diferentes produzem saídas diferentes.',
            emphasis:
                'Injetividade é a condição essencial para que a função possa ser desfeita sem ambiguidade.',
          ),
          WorkedExampleBlockData(
            title: 'Função afim injetiva',
            problem: 'Mostre que f(x)=3x−2 é injetiva em ℝ.',
            steps: [
              'Suponha f(x₁)=f(x₂).',
              'Então 3x₁−2=3x₂−2.',
              'Some 2 aos dois membros e divida por 3.',
            ],
            result: 'x₁=x₂; portanto f é injetiva.',
            interpretation:
                'A demonstração usa diretamente a definição de injetividade.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Teste da reta horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Injetividade vista no gráfico',
            content:
                'Uma função real é injetiva em seu domínio se nenhuma reta horizontal intersecta seu gráfico em mais de um ponto.',
            emphasis:
                'Esse teste é diferente do teste da reta vertical, que verifica se uma relação é função.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Sobrejetividade e bijetividade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A inversa completa exige correspondência entre domínio e contradomínio',
            content:
                'Uma função f:A→B é sobrejetiva quando sua imagem é todo B. Ela é bijetiva quando é simultaneamente injetiva e sobrejetiva.',
            emphasis:
                'Uma bijeção possui inversa f⁻¹:B→A.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Definição de função inversa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A inversa desfaz a função',
            content:
                'Se f é bijetiva, sua inversa satisfaz [[math:f^{-1}(f(x))=x]] para todo x do domínio de f e [[math:f(f^{-1}(y))=y]] para todo y no domínio da inversa.',
            emphasis:
                'f⁻¹(x) não significa 1/f(x).',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Encontrando uma inversa',
        blocks: [
          WorkedExampleBlockData(
            title: 'Inversa de uma função afim',
            problem: 'Encontre a inversa de f(x)=2x+3.',
            steps: [
              'Escreva y=2x+3.',
              'Isole x: x=(y−3)/2.',
              'Troque os nomes das variáveis.',
            ],
            result: 'f⁻¹(x)=(x−3)/2.',
            interpretation:
                'A inversa recupera a entrada original a partir da saída.',
          ),
          WorkedExampleBlockData(
            title: 'Verificação por composição',
            problem: 'Verifique a inversa anterior.',
            steps: [
              'Calcule f(f⁻¹(x))=2[(x−3)/2]+3.',
              'Simplifique para x.',
              'Calcule também f⁻¹(f(x))=[(2x+3)−3]/2.',
            ],
            result: 'Ambas as composições resultam em x.',
            interpretation:
                'A identidade confirma que as funções se desfazem mutuamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Restrição de domínio para obter inversa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'x² não é injetiva em ℝ',
            content:
                'A função f(x)=x² satisfaz f(2)=f(−2)=4, portanto não possui inversa global em ℝ. Podemos restringir o domínio a [0,+∞) ou a (−∞,0] para torná-la injetiva.',
            emphasis:
                'A escolha do domínio faz parte da definição da função.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Inversa após restrição',
            problem: 'Considere f(x)=x² com domínio [0,+∞). Encontre f⁻¹.',
            steps: [
              'Escreva y=x² com x≥0.',
              'Resolva para x: x=√y.',
              'Troque as variáveis.',
            ],
            result: 'f⁻¹(x)=√x, com domínio [0,+∞).',
            interpretation:
                'A restrição escolhe a raiz não negativa e remove a ambiguidade ±.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Gráficos de funções inversas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Simetria em relação a y=x',
            content:
                'Os pares (a,b) do gráfico de f tornam-se (b,a) no gráfico de f⁻¹. Por isso os dois gráficos são reflexos em relação à reta y=x.',
            emphasis:
                'Domínio e imagem trocam de papéis entre uma função e sua inversa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir f⁻¹ com recíproco',
            content:
                'f⁻¹(x) representa função inversa. O recíproco é 1/f(x); são objetos diferentes.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar o domínio da composta',
            content:
                'Uma expressão algébrica obtida por substituição pode existir apenas em parte do domínio da função interna.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Tentar inverter função não injetiva sem restringir domínio',
            content:
                'Se duas entradas compartilham a mesma saída, a relação inversa atribuiria duas saídas à mesma entrada e deixaria de ser função.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Exercícios guiados e prática',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado — composição com domínio',
            problem: 'Se f(x)=1/x e g(x)=x−2, determine f∘g e seu domínio.',
            steps: [
              '(f∘g)(x)=1/(x−2).',
              'O denominador exige x−2≠0.',
            ],
            result: '(f∘g)(x)=1/(x−2), com x≠2.',
            interpretation:
                'A restrição aparece na entrada que chega a f.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Prática antes da atividade final',
            content:
                '1. Calcule (f∘g)(x) para f(x)=x+1 e g(x)=2x.\n'
                '2. Calcule (g∘f)(x) para as mesmas funções.\n'
                '3. Compare os resultados das questões 1 e 2.\n'
                '4. Determine o domínio de √(x−4) como composição.\n'
                '5. Determine o domínio de 1/(x²−1).\n'
                '6. Teste se f(x)=5x+2 é injetiva.\n'
                '7. Explique por que x² não é injetiva em ℝ.\n'
                '8. Aplique o teste da reta horizontal à parábola y=x².\n'
                '9. Encontre a inversa de f(x)=3x−6.\n'
                '10. Verifique a resposta por composição.\n'
                '11. Encontre a inversa de f(x)=(x+4)/2.\n'
                '12. Diferencie f⁻¹(x) de 1/f(x).\n'
                '13. Explique como domínio e imagem trocam de papel na inversa.\n'
                '14. Restrinja x² para obter uma inversa e encontre-a.\n'
                '15. Crie duas funções para as quais f∘g≠g∘f.',
            emphasis:
                'Nas inversas, faça pelo menos uma verificação por composição.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Composição e inversa reaparecem diretamente em derivadas',
            content:
                'A regra da cadeia deriva composições. Derivadas de funções inversas relacionam f e f⁻¹. Exponenciais, logaritmos e funções trigonométricas inversas dependem dessa estrutura.',
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
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para composição, funções inversas e regra da cadeia.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Em (f∘g)(x), qual função é aplicada primeiro?',
      choices: ['f', 'g', 'As duas ao mesmo tempo'],
      correctIndex: 1,
      explanation:
          '(f∘g)(x)=f(g(x)); portanto g recebe a entrada primeiro e sua saída é enviada para f.',
    ),
    takeaways: [
      'Composição aplica funções em sequência e depende da ordem.',
      'O domínio da composta exige x∈D_g e g(x)∈D_f.',
      'Injetividade impede duas entradas distintas de terem a mesma saída.',
      'Bijetividade garante uma inversa entre os conjuntos declarados.',
      'f⁻¹ não significa 1/f.',
      'Domínio e imagem trocam de papéis na função inversa.',
      'Restringir domínio pode tornar uma função invertível.',
    ],
    closing:
        'Composição descreve processos encadeados; inversão descreve quando e como esses processos podem ser desfeitos sem ambiguidade.',
  ),
  CourseLessonData(
    id: 'funcoes-03-transformacoes-graficos',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Gráficos',
    title: 'Transformações de gráficos',
    description:
        'translações, reflexões, escalas, ordem das transformações e efeitos sobre domínio e imagem',
    duration: '≈ 34 min',
    objective:
        'prever e justificar transformações de gráficos a partir de alterações algébricas, distinguir mudanças internas e externas e acompanhar seus efeitos sobre pontos, domínio e imagem',
    symbol: 'a·f(b(x−h))+k',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Uma função de referência',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Transformar é reaproveitar um gráfico conhecido',
            content:
                'Partimos de uma função base y=f(x) e produzimos novas funções alterando entradas e saídas. A forma geral [[math:y=a\,f(b(x-h))+k]] concentra translações, reflexões e escalas.',
            emphasis:
                'Transformações permitem prever geometria sem reconstruir o gráfico ponto a ponto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Translação vertical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'f(x)+k',
            content:
                'Somar k fora da função altera todas as saídas: k>0 desloca o gráfico para cima e k<0 desloca para baixo.',
            emphasis:
                'O domínio permanece o mesmo; a imagem é deslocada verticalmente.',
          ),
          WorkedExampleBlockData(
            title: 'Deslocamento vertical',
            problem: 'Compare y=x² e y=x²−3.',
            steps: [
              'Cada saída de x² é reduzida em 3.',
              'O vértice passa de (0,0) para (0,−3).',
            ],
            result: 'O gráfico desloca 3 unidades para baixo.',
            interpretation:
                'Uma transformação externa age diretamente sobre os valores de y.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Translação horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'f(x−h)',
            content:
                'Substituir x por x−h desloca o gráfico h unidades para a direita; x+h desloca h unidades para a esquerda.',
            emphasis:
                'O sinal horizontal parece invertido porque estamos alterando a entrada necessária para obter a mesma saída.',
          ),
          WorkedExampleBlockData(
            title: 'Por que x−3 move para a direita',
            problem: 'Compare f(x)=x² e g(x)=(x−3)².',
            steps: [
              'Em f, o valor mínimo ocorre quando x=0.',
              'Em g, o mesmo mínimo ocorre quando x−3=0.',
              'Logo x=3.',
            ],
            result: 'O vértice se desloca para (3,0).',
            interpretation:
                'A equação interna mostra onde cada característica do gráfico reaparece.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Reflexões',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '−f(x) e f(−x) são diferentes',
            content:
                '−f(x) troca cada saída y por −y e reflete no eixo x. Já f(−x) troca cada entrada x por −x e reflete no eixo y.',
            emphasis:
                'Transformação externa afeta saídas; transformação interna afeta entradas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Escala vertical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'a·f(x)',
            content:
                'Multiplicar a função por a multiplica todas as ordenadas por a. Se |a|>1 há alongamento vertical; se 0<|a|<1 há compressão vertical; se a<0 há também reflexão no eixo x.',
          ),
          WorkedExampleBlockData(
            title: 'Alongamento e reflexão',
            problem: 'Descreva y=−2x² a partir de y=x².',
            steps: [
              'O fator 2 duplica a distância vertical ao eixo x.',
              'O sinal negativo reflete o gráfico no eixo x.',
            ],
            result: 'Parábola mais estreita, voltada para baixo.',
            interpretation:
                'Escala e reflexão podem ocorrer simultaneamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Escala horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'f(bx)',
            content:
                'A transformação interna f(bx) altera a escala horizontal por fator 1/|b|. Se |b|>1, o gráfico é comprimido horizontalmente; se 0<|b|<1, é alongado. Se b<0, ocorre também reflexão no eixo y.',
            emphasis:
                'Escalas internas usam o fator recíproco.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Transformações combinadas',
        blocks: [
          WorkedExampleBlockData(
            title: 'Lendo uma forma completa',
            problem: 'Descreva y=−2(x−3)²+1 a partir de y=x².',
            steps: [
              'x−3: desloque 3 unidades para a direita.',
              '−2: reflita no eixo x e alongue verticalmente por 2.',
              '+1: desloque 1 unidade para cima.',
            ],
            result: 'Vértice (3,1), concavidade para baixo e alongamento vertical por 2.',
            interpretation:
                'A forma algébrica codifica posição, orientação e escala.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Transformando pontos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Acompanhe um ponto conhecido',
            content:
                'Se (u,v) pertence ao gráfico de y=f(x), então para y=a·f(b(x−h))+k o ponto correspondente satisfaz x=h+u/b e y=av+k.',
            emphasis:
                'Esse método permite construir gráficos transformados a partir de poucos pontos notáveis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Efeito sobre domínio e imagem',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Transformações também movem conjuntos',
            content:
                'Translações horizontais alteram o domínio pela mesma geometria aplicada às entradas. Transformações verticais alteram a imagem. Reflexões e escalas podem inverter ou redimensionar esses conjuntos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Trocar o sentido do deslocamento horizontal',
            content:
                'f(x−3) desloca para a direita, não para a esquerda.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir −f(x) e f(−x)',
            content:
                'A primeira reflete no eixo x; a segunda, no eixo y.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Usar b como fator horizontal direto',
            content:
                'Em f(2x), a escala horizontal é 1/2, não 2.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Exercícios guiados e prática',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado',
            problem: 'Descreva y=3√(x+2)−4 a partir de y=√x.',
            steps: [
              'x+2 desloca 2 para a esquerda.',
              '3 alonga verticalmente por 3.',
              '−4 desloca 4 para baixo.',
            ],
            result: 'O ponto inicial (0,0) passa para (−2,−4).',
            interpretation:
                'O domínio também passa de [0,+∞) para [−2,+∞).',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Prática antes da atividade final',
            content:
                '1. Descreva f(x)+5.\n'
                '2. Descreva f(x−4).\n'
                '3. Descreva f(x+2).\n'
                '4. Compare −f(x) e f(−x).\n'
                '5. Descreva 3f(x).\n'
                '6. Descreva f(2x).\n'
                '7. Descreva −f(−x).\n'
                '8. Transforme y=x² em y=(x+1)²−4.\n'
                '9. Descreva y=−(x−2)²+5.\n'
                '10. Determine o novo domínio de √(x−6).\n'
                '11. Determine a imagem de 2x²+3.\n'
                '12. Acompanhe o ponto (1,1) sob y=2f(x−3)+4.\n'
                '13. Explique por que f(3x) comprime horizontalmente.\n'
                '14. Dê um exemplo em que reflexão não altera o gráfico.\n'
                '15. Esboce uma sequência de transformações de |x|.',
            emphasis:
                'Sempre separe transformações internas das externas antes de descrever o gráfico.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Transformações preservam estruturas importantes',
            content:
                'Em Cálculo, gráficos transformados ajudam a prever limites, continuidade e derivadas sem recomeçar a análise. Translações e escalas também aparecem em famílias parametrizadas.',
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
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para transformações e leitura gráfica.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'O que f(x+4) faz com o gráfico de f(x)?',
      choices: ['Move 4 para a esquerda', 'Move 4 para a direita', 'Move 4 para cima'],
      correctIndex: 0,
      explanation:
          'Para reproduzir em x o valor que f produzia em x+4, o gráfico precisa aparecer 4 unidades à esquerda.',
    ),
    takeaways: [
      'Transformações externas alteram saídas.',
      'Transformações internas alteram entradas.',
      'Translações horizontais têm sinal aparente invertido.',
      'Reflexões em x e y correspondem a operações diferentes.',
      'Escalas internas usam fator recíproco.',
      'Domínio e imagem também se transformam.',
    ],
    closing:
        'Ler transformações diretamente da fórmula reduz o gráfico a uma sequência controlada de operações geométricas.',
  ),
  CourseLessonData(
    id: 'funcoes-04-polinomiais',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Funções polinomiais',
    description: 'grau, zeros, multiplicidade e comportamento',
    duration: '≈ 18 min',
    objective:
        'analisar zeros, grau, multiplicidade e comportamento nas extremidades de funções polinomiais',
    symbol: 'P(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'O grau controla o comportamento dominante',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Zeros ligam álgebra e gráfico',
            content:
                'Se P(a)=0, então x=a é um zero e, em condições usuais, (x−a) é fator do polinômio. A multiplicidade ajuda a prever se o gráfico cruza ou apenas toca o eixo x.',
            emphasis:
                'Para |x| muito grande, o termo de maior grau domina o comportamento do polinômio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Zeros e multiplicidade',
            problem: 'Analise P(x)=(x−2)²(x+1).',
            steps: [
              'Os zeros são x=2 e x=−1.',
              'x=2 possui multiplicidade 2, então o gráfico tende a tocar o eixo e retornar.',
              'x=−1 possui multiplicidade 1, então o gráfico cruza o eixo.',
              'O grau total é 3 e o coeficiente líder é positivo.',
            ],
            result: 'Polinômio cúbico com zeros −1 e 2, sendo 2 um zero duplo.',
            interpretation:
                'A forma fatorada fornece informações geométricas sem calcular muitos pontos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Termo dominante prepara limites no infinito',
            content:
                'A ideia de que o termo de maior grau domina será usada para limites no infinito e comparação de crescimento.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é um zero de P(x)=(x−5)(x+2)?',
      choices: ['5', '2', '−5'],
      correctIndex: 0,
      explanation: 'Quando x=5, o fator x−5 zera e portanto P(5)=0.',
    ),
    takeaways: [
      'Zeros de polinômios correspondem a fatores lineares.',
      'Multiplicidade afeta a forma do gráfico perto da raiz.',
      'O grau informa o termo dominante.',
      'A forma fatorada facilita leitura geométrica.',
    ],
    closing: 'Polinômios são modelos centrais para desenvolver intuição de comportamento de funções.',
  ),
  CourseLessonData(
    id: 'funcoes-05-racionais',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Funções racionais e assíntotas',
    description: 'domínio, zeros e comportamento assintótico',
    duration: '≈ 18 min',
    objective:
        'analisar domínio, zeros, descontinuidades e assíntotas de funções racionais simples',
    symbol: 'P/Q',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Denominador controla restrições',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Zeros do denominador merecem atenção',
            content:
                'Uma função racional tem a forma P(x)/Q(x), com Q(x)≠0. Zeros de Q são excluídos do domínio e podem gerar assíntotas verticais ou descontinuidades removíveis, dependendo de fatores comuns.',
            emphasis:
                'Cancelar um fator simplifica a fórmula, mas não devolve ao domínio o ponto originalmente proibido.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Assíntota vertical e horizontal',
            problem: 'Analise f(x)=(2x+1)/(x−3).',
            steps: [
              'O domínio exclui x=3.',
              'Como o denominador tende a zero perto de 3 e não há cancelamento, x=3 é candidato a assíntota vertical.',
              'Numerador e denominador têm o mesmo grau.',
              'A razão dos coeficientes líderes é 2/1=2.',
            ],
            result: 'Assíntota vertical x=3 e horizontal y=2.',
            interpretation:
                'As assíntotas descrevem tendências do gráfico perto de pontos críticos e no infinito.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ponto removível não volta ao domínio',
            content:
                'Se (x−2) cancela no numerador e denominador, a expressão simplificada pode ser definida em x=2, mas a função original continua sem valor nesse ponto.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual valor é excluído do domínio de (x+1)/(x−7)?',
      choices: ['−1', '1', '7'],
      correctIndex: 2,
      explanation: 'x=7 zera o denominador.',
    ),
    takeaways: [
      'Domínio exclui zeros do denominador.',
      'Fatores comuns podem criar descontinuidades removíveis.',
      'Assíntotas verticais aparecem perto de certas restrições.',
      'Graus ajudam a prever comportamento no infinito.',
    ],
    closing: 'Funções racionais formam uma ponte direta para limites e continuidade.',
  ),
  CourseLessonData(
    id: 'funcoes-06-exponenciais',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Funções exponenciais',
    description: 'crescimento, decaimento e número e',
    duration: '≈ 16 min',
    objective:
        'interpretar funções exponenciais e distinguir crescimento de decaimento a partir da base',
    symbol: 'aˣ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'A variável está no expoente',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Base determina crescimento',
            content:
                'Na função f(x)=aˣ, com a>0 e a≠1, se a>1 há crescimento exponencial; se 0<a<1 há decaimento. O domínio é ℝ e a imagem é (0,+∞).',
            emphasis: 'A função exponencial nunca assume valor zero.',
          ),
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A base e é natural no Cálculo',
            content:
                'O número e≈2,718 aparece naturalmente em crescimento contínuo. A função eˣ terá propriedades especialmente simples quando estudarmos derivadas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Modelo de crescimento',
            problem: 'Uma quantidade é modelada por P(t)=100·2ᵗ. Qual o valor em t=3?',
            steps: ['Substitua t por 3: P(3)=100·2³.', 'Calcule 2³=8.', 'Multiplique: 100·8=800.'],
            result: 'P(3)=800.',
            interpretation: 'A quantidade dobra a cada unidade de tempo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Comparação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Exponencial não é potência comum',
            content:
                'Em x², a variável está na base. Em 2ˣ, a variável está no expoente. Esses dois tipos de função têm comportamentos muito diferentes.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual função representa decaimento exponencial?',
      choices: ['2ˣ', '(1/2)ˣ', 'x²'],
      correctIndex: 1,
      explanation: 'Uma base entre 0 e 1 produz decaimento exponencial.',
    ),
    takeaways: [
      'Na exponencial, a variável está no expoente.',
      'Base maior que 1 produz crescimento.',
      'Base entre 0 e 1 produz decaimento.',
      'eˣ será central no Cálculo.',
    ],
    closing: 'Exponenciais modelam processos em que a taxa de mudança acompanha o próprio tamanho da quantidade.',
  ),
  CourseLessonData(
    id: 'funcoes-07-logaritmos',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Logaritmos',
    description: 'definição, propriedades e função inversa',
    duration: '≈ 18 min',
    objective:
        'interpretar logaritmos como expoentes, usar propriedades básicas e relacionar logaritmos a funções exponenciais',
    symbol: 'logₐx',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Logaritmo responde qual expoente',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Definição fundamental',
            content:
                'logₐ(b)=c significa exatamente aᶜ=b, com a>0, a≠1 e b>0. A função logarítmica é a inversa da função exponencial de mesma base.',
            emphasis: 'Argumento de logaritmo deve ser positivo.',
          ),
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Propriedades vêm das potências',
            content:
                'logₐ(xy)=logₐx+logₐy e logₐ(x/y)=logₐx−logₐy. Além disso, logₐ(xʳ)=r·logₐx quando as expressões estão definidas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Equação logarítmica simples',
            problem: 'Resolva log₂(x)=5.',
            steps: ['Converta para forma exponencial: 2⁵=x.', 'Calcule 2⁵=32.', 'Verifique que 32>0.'],
            result: 'x=32.',
            interpretation: 'Resolver o logaritmo foi equivalente a descobrir o resultado de uma potência.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Erro comum',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Logaritmo não distribui sobre soma',
            content: 'Em geral, log(x+y) não é igual a log x + log y.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'log₁₀(1000) vale:',
      choices: ['2', '3', '10'],
      correctIndex: 1,
      explanation: '10³=1000, então log₁₀(1000)=3.',
    ),
    takeaways: [
      'Logaritmo é um expoente.',
      'Exponencial e logaritmo são funções inversas.',
      'O argumento do logaritmo deve ser positivo.',
      'Propriedades logarítmicas refletem propriedades de potências.',
    ],
    closing: 'Logaritmos transformam multiplicações em somas e aparecem naturalmente em taxas e escalas.',
  ),
  CourseLessonData(
    id: 'funcoes-08-radianos-circulo',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Trigonometria',
    title: 'Radianos e círculo trigonométrico',
    description: 'ângulos, arco e coordenadas no círculo unitário',
    duration: '≈ 20 min',
    objective:
        'converter graus e radianos e interpretar seno e cosseno pelo círculo trigonométrico',
    symbol: 'π rad',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Radiano mede ângulo por arco',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'π rad = 180°',
            content:
                'Uma volta completa mede 2π radianos ou 360°. Assim, 90°=π/2, 180°=π e 270°=3π/2. Em Cálculo, radianos são a unidade natural para funções trigonométricas.',
            emphasis: 'As fórmulas de derivadas trigonométricas pressupõem ângulos em radianos.',
          ),
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Círculo unitário transforma ângulo em coordenadas',
            content:
                'No círculo de raio 1, o ponto associado ao ângulo θ tem coordenadas (cos θ, sen θ). Isso amplia seno e cosseno para qualquer ângulo real.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Converter e localizar',
            problem: 'Converta 150° para radianos.',
            steps: ['Multiplique por π/180: 150·π/180.', 'Simplifique 150/180=5/6.'],
            result: '150°=5π/6 rad.',
            interpretation: 'O ângulo fica no segundo quadrante, onde seno é positivo e cosseno negativo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Valores notáveis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.table,
            title: 'Reconheça 0, π/6, π/4, π/3 e π/2',
            content:
                'Os ângulos notáveis fornecem valores exatos de seno e cosseno e servem como referências para sinais e simetrias nos outros quadrantes.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Quanto vale 90° em radianos?',
      choices: ['π/4', 'π/2', 'π'],
      correctIndex: 1,
      explanation: '90° corresponde a um quarto de volta, isto é, π/2 radianos.',
    ),
    takeaways: [
      '2π rad correspondem a 360°.',
      'No círculo unitário, cos θ é a coordenada x.',
      'sen θ é a coordenada y.',
      'Radianos são a unidade natural da trigonometria no Cálculo.',
    ],
    closing: 'O círculo trigonométrico conecta geometria, gráficos e funções periódicas.',
  ),
  CourseLessonData(
    id: 'funcoes-09-trigonometricas-graficos',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Trigonometria',
    title: 'Funções trigonométricas e gráficos',
    description: 'seno, cosseno, tangente, período e amplitude',
    duration: '≈ 20 min',
    objective:
        'interpretar domínio, imagem, período, amplitude e gráficos de seno, cosseno e tangente',
    symbol: 'sen x',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Periodicidade repete comportamento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Seno e cosseno oscilam',
            content:
                'sen x e cos x têm período 2π e imagem [−1,1]. Em A·sen(Bx), |A| controla a amplitude e 2π/|B| controla o período.',
            emphasis: 'Tangente tem período π e não está definida onde cos x=0.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Amplitude e período',
            problem: 'Analise y=3sen(2x).',
            steps: ['Amplitude: |3|=3.', 'Período: 2π/2=π.', 'A imagem é [−3,3].'],
            result: 'Amplitude 3 e período π.',
            interpretation: 'O gráfico oscila mais alto e completa ciclos duas vezes mais rápido que sen x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Domínios diferentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Tangente possui assíntotas',
            content:
                'tan x=sen x/cos x, então pontos onde cos x=0 são excluídos e aparecem como assíntotas verticais.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o período de cos x?',
      choices: ['π/2', 'π', '2π'],
      correctIndex: 2,
      explanation: 'O cosseno repete seus valores a cada 2π radianos.',
    ),
    takeaways: [
      'Seno e cosseno têm período 2π.',
      'Tangente tem período π.',
      'Amplitude mede a oscilação vertical de seno e cosseno.',
      'Tangente não existe onde cosseno é zero.',
    ],
    closing: 'Gráficos trigonométricos são essenciais para limites, derivadas e modelos periódicos.',
  ),
  CourseLessonData(
    id: 'funcoes-10-identidades-equacoes-trig',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Trigonometria',
    title: 'Identidades e equações trigonométricas',
    description: 'relações fundamentais e resolução por ciclos',
    duration: '≈ 20 min',
    objective:
        'usar identidades trigonométricas fundamentais e resolver equações trigonométricas básicas',
    symbol: 'sen²+cos²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Identidades são igualdades sempre válidas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Identidade fundamental',
            content:
                'sen²x + cos²x = 1 é a identidade pitagórica básica. Também tan x = sen x/cos x quando cos x≠0. Fórmulas de soma, diferença e ângulo duplo permitem reescrever expressões.',
            emphasis: 'Uma identidade não é uma equação para descobrir x; ela vale em todo ponto onde ambos os lados estão definidos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Resolver em um intervalo',
            problem: 'Resolva sen x = 1/2 em 0 ≤ x < 2π.',
            steps: ['O ângulo de referência é π/6.', 'Seno é positivo nos quadrantes I e II.', 'As soluções são π/6 e 5π/6.'],
            result: 'x=π/6 ou x=5π/6.',
            interpretation: 'Periodicidade e quadrantes determinam todas as soluções do ciclo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Estratégia',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Simplifique antes de resolver',
            content:
                'Quando uma equação contém várias funções trigonométricas, procure reescrever tudo em seno e cosseno ou aplicar uma identidade adequada antes de isolar a variável.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual identidade é sempre verdadeira?',
      choices: ['sen x + cos x = 1', 'sen²x + cos²x = 1', 'tan x = cos x/sen x'],
      correctIndex: 1,
      explanation: 'sen²x + cos²x = 1 é a identidade pitagórica fundamental.',
    ),
    takeaways: [
      'Identidades valem para todos os valores do domínio.',
      'sen²x+cos²x=1 é a relação fundamental.',
      'Equações trigonométricas usam quadrantes e periodicidade.',
      'Simplificação estratégica reduz a dificuldade.',
    ],
    closing: 'Identidades permitem transformar expressões sem alterar seu valor.',
  ),
  CourseLessonData(
    id: 'funcoes-11-inversas-trig',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Trigonometria',
    title: 'Funções trigonométricas inversas',
    description: 'arco seno, arco cosseno e arco tangente',
    duration: '≈ 18 min',
    objective:
        'interpretar arcsen, arccos e arctan como funções inversas com domínios e imagens restritos',
    symbol: 'arctan',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'É preciso restringir para inverter',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Funções periódicas não são injetoras globalmente',
            content:
                'Seno e cosseno repetem valores, então restringimos seus domínios antes de definir inversas. arcsen x retorna um ângulo em [−π/2,π/2], arccos x em [0,π] e arctan x em (−π/2,π/2).',
            emphasis: 'sen⁻¹x significa arcsen x, não 1/sen x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Recuperar o ângulo principal',
            problem: 'Calcule arcsen(1/2).',
            steps: ['Procure o ângulo no intervalo principal [−π/2,π/2].', 'sen(π/6)=1/2.'],
            result: 'arcsen(1/2)=π/6.',
            interpretation: 'A função inversa devolve o representante escolhido no intervalo principal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Domínio e imagem',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.table,
            title: 'Memorize restrições com significado',
            content:
                'arcsen e arccos recebem apenas valores em [−1,1], pois seno e cosseno nunca saem desse intervalo. arctan aceita qualquer real.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é o domínio de arcsen x?',
      choices: ['ℝ', '[−1,1]', '(0,+∞)'],
      correctIndex: 1,
      explanation: 'Seno só produz valores entre −1 e 1, então sua inversa só pode receber valores nesse intervalo.',
    ),
    takeaways: [
      'Restringimos funções trigonométricas para torná-las invertíveis.',
      'arcsen e arccos têm domínio [−1,1].',
      'arctan tem domínio ℝ.',
      'Notação inversa não significa recíproco.',
    ],
    closing: 'Funções trigonométricas inversas aparecem em integrais, geometria e resolução de problemas.',
  ),
  CourseLessonData(
    id: 'funcoes-12-geometria-analitica',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Geometria analítica',
    title: 'Pontos, distância e retas',
    description: 'plano cartesiano, inclinação e equações da reta',
    duration: '≈ 18 min',
    objective:
        'usar distância, ponto médio e inclinação para interpretar retas no plano cartesiano',
    symbol: 'm=Δy/Δx',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Inclinação mede variação',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Reta como taxa constante',
            content:
                'Entre dois pontos (x₁,y₁) e (x₂,y₂), a inclinação é m=(y₂−y₁)/(x₂−x₁), se x₂≠x₁. A forma y=mx+b mostra inclinação m e intercepto vertical b.',
            emphasis: 'Inclinação é uma taxa média de variação constante para funções lineares.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Reta por dois pontos',
            problem: 'Encontre a reta que passa por (1,2) e (4,8).',
            steps: ['m=(8−2)/(4−1)=6/3=2.', 'Use y−2=2(x−1).', 'Expanda: y=2x.'],
            result: 'A reta é y=2x.',
            interpretation: 'A cada unidade acrescentada a x, y cresce 2 unidades.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Distância no plano',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Pitágoras em coordenadas',
            content:
                'A distância entre dois pontos é √[(x₂−x₁)²+(y₂−y₁)²]. O ponto médio é ((x₁+x₂)/2,(y₁+y₂)/2).',
            tone: LearningCardTone.information,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a inclinação entre (0,1) e (2,5)?',
      choices: ['1', '2', '4'],
      correctIndex: 1,
      explanation: 'm=(5−1)/(2−0)=4/2=2.',
    ),
    takeaways: [
      'Inclinação é Δy/Δx.',
      'Reta linear possui taxa de variação constante.',
      'Distância vem do teorema de Pitágoras.',
      'Geometria analítica conecta fórmulas e gráficos.',
    ],
    closing: 'A inclinação da reta prepara diretamente a interpretação geométrica da derivada.',
  ),
  CourseLessonData(
    id: 'funcoes-13-conicas',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Geometria analítica',
    title: 'Cônicas em duas dimensões',
    description: 'circunferência, parábola, elipse e hipérbole',
    duration: '≈ 20 min',
    objective:
        'reconhecer as formas padrão das principais cônicas e interpretar seus parâmetros geométricos',
    symbol: 'x²+y²',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Quatro famílias geométricas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A forma algébrica revela a curva',
            content:
                'Circunferência: (x−h)²+(y−k)²=r². Elipse: soma de dois termos quadráticos positivos normalizados por eixos distintos. Hipérbole: diferença entre termos quadráticos. Parábola: uma variável aparece ao quadrado e a outra, em forma padrão, aparece linearmente.',
            emphasis: 'Completar quadrados ajuda a transformar equações gerais em formas padrão.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Ler uma circunferência',
            problem: 'Interprete (x−2)²+(y+1)²=9.',
            steps: ['Compare com (x−h)²+(y−k)²=r².', 'h=2 e k=−1.', 'r²=9, então r=3.'],
            result: 'Centro (2,−1) e raio 3.',
            interpretation: 'A equação codifica diretamente posição e tamanho da circunferência.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Nem toda cônica é função y=f(x)',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Teste da reta vertical continua valendo',
            content:
                'Uma circunferência completa não é gráfico de uma única função y=f(x), pois algumas retas verticais cortam a curva em dois pontos.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Em x²+y²=25, qual é o raio?',
      choices: ['5', '25', '√50'],
      correctIndex: 0,
      explanation: 'r²=25, então r=5.',
    ),
    takeaways: [
      'Cônicas têm formas padrão reconhecíveis.',
      'Circunferência codifica centro e raio.',
      'Elipse e hipérbole usam dois termos quadráticos.',
      'Uma curva pode não ser função global de x.',
    ],
    closing: 'Cônicas ampliam a leitura geométrica antes de estudar curvas e superfícies mais avançadas.',
  ),
  CourseLessonData(
    id: 'funcoes-14-taxa-media-sintese',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Ponte para Cálculo',
    title: 'Taxa média de variação e síntese',
    description: 'secantes, comportamento e preparação para limites',
    duration: '≈ 20 min',
    objective:
        'calcular taxa média de variação e conectar álgebra, gráficos e funções à ideia que dará origem à derivada',
    symbol: 'Δy/Δx',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Variação de saída por variação de entrada',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Taxa média é inclinação de secante',
            content:
                'Entre x=a e x=b, a taxa média de variação de f é [f(b)−f(a)]/(b−a). Geometricamente, ela é a inclinação da reta secante que passa pelos pontos (a,f(a)) e (b,f(b)).',
            emphasis: 'A derivada nascerá quando fizermos b se aproximar de a.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Veja funcionando',
        blocks: [
          WorkedExampleBlockData(
            title: 'Taxa média em uma quadrática',
            problem: 'Para f(x)=x², calcule a taxa média de variação entre x=1 e x=3.',
            steps: ['f(1)=1 e f(3)=9.', 'Δy=9−1=8.', 'Δx=3−1=2.', 'Taxa média=8/2=4.'],
            result: 'A taxa média é 4.',
            interpretation: 'A secante entre (1,1) e (3,9) possui inclinação 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Mapa do que você construiu',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Pré-Cálculo vira linguagem para Cálculo',
            content:
                'Domínio diz onde a função existe; gráficos mostram comportamento; álgebra permite simplificar; trigonometria amplia modelos periódicos; exponenciais e logaritmos descrevem crescimento; taxa média prepara a ideia de taxa instantânea.',
            tone: LearningCardTone.success,
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'A taxa média [f(b)−f(a)]/(b−a) representa geometricamente:',
      choices: ['Inclinação da secante', 'Área sob o gráfico', 'Valor máximo da função'],
      correctIndex: 0,
      explanation: 'Ela é a inclinação da reta que une os dois pontos do gráfico.',
    ),
    takeaways: [
      'Taxa média mede Δsaída/Δentrada.',
      'Geometricamente, é a inclinação de uma secante.',
      'A derivada surge de um limite dessa taxa.',
      'Todo o Pré-Cálculo converge para interpretação de funções.',
    ],
    closing: 'Com esta base, Limites deixam de ser um assunto isolado e passam a ser a próxima etapa natural.',
  ),
];

const List<CourseLessonData> _englishLessons = [
  CourseLessonData(
    id: 'funcoes-01-conceito-dominio-imagem',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Foundations',
    title: 'Function, domain, codomain, and range',
    description:
        'formal definition, notation, evaluation, domain, codomain, range, zeros, and graph reading',
    duration: '≈ 38 min',
    objective:
        'understand a function as a single-valued mapping between sets, distinguish domain, codomain, and range, evaluate functions, determine algebraic restrictions, and interpret zeros and graphs',
    symbol: 'f:A→B',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Formal definition of a function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Each input has exactly one output',
            content:
                'A function [[math:f:A\\to B]] assigns to every [[math:x\\in A]] exactly one element [[math:f(x)\\in B]]. A is the domain and B is the codomain.',
            emphasis:
                'Different inputs may share an output, but one input cannot have two outputs in the same function.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Relation versus function',
            content:
                'Every function is a relation, but not every relation is a function. The decisive condition is uniqueness of the output for each input.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Domain, codomain, and range',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Three different sets',
            content:
                'The domain is the set of allowed inputs. The codomain is the declared target set. The range is the subset of the codomain consisting of outputs actually produced.',
            emphasis:
                'The range is always contained in the codomain but need not equal it.',
          ),
          WorkedExampleBlockData(
            title: 'Codomain larger than the range',
            problem: 'Let f:ℝ→ℝ be defined by f(x)=x². What is the range?',
            steps: [
              'Every real number is an allowed input.',
              'For every real x, x²≥0.',
              'Every y≥0 is produced by x=√y or x=−√y.',
            ],
            result: 'Domain=ℝ, codomain=ℝ, range=[0,+∞).',
            interpretation:
                'The actual range occupies only part of the declared codomain.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Function notation f(x)',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'f(x) is the value of the function',
            content:
                'The expression f(x) denotes the output associated with input x. It does not mean f multiplied by x.',
            emphasis:
                'The input may be a number, an expression, or even another function.',
          ),
          WorkedExampleBlockData(
            title: 'Direct evaluation',
            problem: 'If f(x)=2x²−3x+1, compute f(−2).',
            steps: [
              'Substitute −2 everywhere x appears.',
              'f(−2)=2(−2)²−3(−2)+1.',
              'Compute: 8+6+1=15.',
            ],
            result: 'f(−2)=15.',
            interpretation:
                'Parentheses help preserve the sign of the input correctly.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Natural domain of a formula',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Look for operations that impose restrictions',
            content:
                'For real-valued formulas, denominators cannot be zero, even-index radicands must be nonnegative, and logarithm arguments must be positive.',
            emphasis:
                'With several restrictions, the domain is their intersection.',
          ),
          WorkedExampleBlockData(
            title: 'Two simultaneous restrictions',
            problem: 'Find the domain of f(x)=√(x−1)/(x−4).',
            steps: [
              'The square root requires x≥1.',
              'The denominator requires x≠4.',
              'Intersect the conditions.',
            ],
            result: 'D_f=[1,4)∪(4,+∞).',
            interpretation:
                'x=4 satisfies the square-root condition but fails the denominator condition.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Finding the range',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'The range depends on outputs actually produced',
            content:
                'Finding the range may require inequalities, completing the square, monotonicity, or graph analysis. There is no single universal technique.',
          ),
          WorkedExampleBlockData(
            title: 'Range of a quadratic',
            problem: 'Find the range of f(x)=x²−4x+3.',
            steps: [
              'Complete the square: f(x)=(x−2)²−1.',
              'Since (x−2)²≥0, f(x)≥−1.',
              'The value −1 occurs at x=2.',
            ],
            result: 'Range=[−1,+∞).',
            interpretation:
                'Completed-square form reveals the minimum immediately.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Zeros of a function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Solve f(x)=0',
            content:
                'A zero or root is a value a in the domain such that f(a)=0. Graphically, zeros are the x-coordinates where the graph meets the x-axis.',
          ),
          WorkedExampleBlockData(
            title: 'Zeros of a polynomial',
            problem: 'Find the zeros of f(x)=x²−5x+6.',
            steps: [
              'Solve x²−5x+6=0.',
              'Factor: (x−2)(x−3)=0.',
            ],
            result: 'Zeros: x=2 and x=3.',
            interpretation:
                'Solving f(x)=0 locates x-intercepts.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'The graph of a function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'A graph is a set of ordered pairs',
            content:
                'The graph of f is [[math:\\{(x,f(x)):x\\in D_f\\}]]. Each point records an input and its corresponding output.',
            emphasis:
                'The graph is a geometric representation of the input-output relation.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Vertical line test',
            content:
                'A plane graph represents y as a function of x if no vertical line intersects the graph at more than one point.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Piecewise-defined functions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A function may use different rules',
            content:
                'A piecewise function uses different formulas on different parts of the domain while still assigning exactly one output to each input.',
          ),
          WorkedExampleBlockData(
            title: 'Piecewise evaluation',
            problem: 'If f(x)=x² for x<0 and f(x)=2x+1 for x≥0, compute f(−2) and f(3).',
            steps: [
              'Since −2<0, use x²: f(−2)=4.',
              'Since 3≥0, use 2x+1: f(3)=7.',
            ],
            result: 'f(−2)=4 and f(3)=7.',
            interpretation:
                'The condition determines which rule applies.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing range and codomain',
            content:
                'The codomain is declared; the range is actually produced by the function.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring algebraic restrictions',
            content:
                'A formula does not automatically define a real function for every real input.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reading f(x) as multiplication',
            content:
                'f(x) is function notation, not a product f·x.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — domain',
            problem: 'Find the domain of g(x)=1/√(x−2).',
            steps: [
              'The square root requires x−2≥0.',
              'Because it is in the denominator, it cannot equal zero.',
              'Therefore x−2>0.',
            ],
            result: 'D_g=(2,+∞).',
            interpretation:
                'A square root in a denominator changes ≥ into >.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — range',
            problem: 'Find the range of h(x)=−(x−1)²+4.',
            steps: [
              '(x−1)²≥0.',
              'So −(x−1)²≤0.',
              'Adding 4 gives h(x)≤4.',
            ],
            result: 'Range=(−∞,4].',
            interpretation:
                'The function has maximum value 4.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Analyze structure, domain, and range',
            content:
                '1. Compute f(3) for f(x)=2x−5.\n'
                '2. Compute f(−2) for f(x)=x²+x.\n'
                '3. Find the domain of 1/(x−7).\n'
                '4. Find the domain of √(2x+6).\n'
                '5. Find the domain of √(x+1)/(x−2).\n'
                '6. Find the range of x².\n'
                '7. Find the range of (x−3)²+2.\n'
                '8. Find the zeros of x²−4.\n'
                '9. Explain the difference between codomain and range.\n'
                '10. Give an example of a relation that is not a function.\n'
                '11. Apply the vertical line test to a circle.\n'
                '12. Evaluate a piecewise function at two points.\n'
                '13. Explain why f(x) does not mean f·x.\n'
                '14. Find the domain of ln(x−1).\n'
                '15. Create a function with domain ℝ and range [2,+∞).',
            emphasis:
                'For domain questions, justify every restriction before stating the final interval.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Every later analysis starts with domain',
            content:
                'Limits, continuity, derivatives, and integrals all depend on where a function is defined. Zeros, range, and graph behavior also return in optimization and sign analysis.',
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
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas, and Guidorizzi for functions, domain, range, and graph interpretation.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which value must be excluded from the domain of g(x)=1/(x+2)?',
      choices: ['−2', '0', '2'],
      correctIndex: 0,
      explanation:
          'x=−2 makes the denominator zero, so the function is undefined there.',
    ),
    takeaways: [
      'A function assigns exactly one output to each domain input.',
      'Domain, codomain, and range are different sets.',
      'f(x) denotes the output associated with input x.',
      'Natural domain depends on the operations in the formula.',
      'Zeros satisfy f(x)=0.',
      'The graph consists of ordered pairs (x,f(x)).',
      'The vertical line test checks uniqueness of output.',
    ],
    closing:
        'Understanding domain, range, and function notation is prerequisite to every later function-analysis topic.',
  ),
  CourseLessonData(
    id: 'funcoes-02-composicao-inversa',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Structure',
    title: 'Composition, injectivity, and inverse functions',
    description:
        'function chaining, composite domains, injectivity, bijectivity, inverses, and domain restriction',
    duration: '≈ 38 min',
    objective:
        'compose functions while controlling domain, distinguish composition from multiplication, analyze injectivity and bijectivity, determine inverse functions, and verify them by composition',
    symbol: 'f∘g',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Composition is successive application',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'First g, then f',
            content:
                'The composition [[math:(f\\circ g)(x)=f(g(x))]] applies g to x first and then uses g(x) as the input of f.',
            emphasis:
                'Order is part of the definition: in general, f∘g≠g∘f.',
          ),
          WorkedExampleBlockData(
            title: 'Algebraic composition',
            problem: 'If f(x)=2x+1 and g(x)=x²−3, find (f∘g)(x).',
            steps: [
              'Start with the inside function g(x)=x²−3.',
              'Substitute g(x) for x in f.',
              'f(g(x))=2(x²−3)+1.',
              'Simplify.',
            ],
            result: '(f∘g)(x)=2x²−5.',
            interpretation:
                'Composition substitutes one output into another function rule.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Composition is not commutative',
        blocks: [
          WorkedExampleBlockData(
            title: 'Compare both orders',
            problem: 'For f(x)=2x+1 and g(x)=x², compare f∘g and g∘f.',
            steps: [
              '(f∘g)(x)=2x²+1.',
              '(g∘f)(x)=(2x+1)².',
              'Expand: 4x²+4x+1.',
            ],
            result: 'f∘g≠g∘f.',
            interpretation:
                'Changing order changes the process and usually changes the resulting function.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Domain of a composite function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Two simultaneous requirements',
            content:
                'For x to belong to the domain of f∘g, x must belong to the domain of g and g(x) must belong to the domain of f.',
            emphasis:
                'Checking only the inner function domain is not enough.',
          ),
          WorkedExampleBlockData(
            title: 'Composition with a square root',
            problem: 'If f(u)=√u and g(x)=x−3, find the domain of f∘g.',
            steps: [
              'g accepts every real x.',
              'The input of f must be nonnegative.',
              'Thus x−3≥0.',
            ],
            result: 'D_{f∘g}=[3,+∞).',
            interpretation:
                'The restriction appears when g(x) becomes the radicand for f.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Injectivity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Equal outputs require equal inputs',
            content:
                'A function f is injective when [[math:f(x_1)=f(x_2)\\Rightarrow x_1=x_2]]. Equivalently, different inputs produce different outputs.',
            emphasis:
                'Injectivity is the essential condition for reversing a function without ambiguity.',
          ),
          WorkedExampleBlockData(
            title: 'An injective affine function',
            problem: 'Show that f(x)=3x−2 is injective on ℝ.',
            steps: [
              'Assume f(x₁)=f(x₂).',
              'Then 3x₁−2=3x₂−2.',
              'Add 2 and divide by 3.',
            ],
            result: 'x₁=x₂, so f is injective.',
            interpretation:
                'The proof uses the definition directly.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Horizontal line test',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Injectivity visible on the graph',
            content:
                'A real-valued function is injective on its domain if no horizontal line intersects its graph more than once.',
            emphasis:
                'This differs from the vertical line test, which checks whether a relation is a function.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Surjectivity and bijectivity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A full inverse requires correspondence between domain and codomain',
            content:
                'A function f:A→B is surjective when its range is all of B. It is bijective when it is both injective and surjective.',
            emphasis:
                'A bijection has an inverse f⁻¹:B→A.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Definition of an inverse function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'The inverse undoes the function',
            content:
                'If f is bijective, then [[math:f^{-1}(f(x))=x]] for every x in the domain of f and [[math:f(f^{-1}(y))=y]] for every y in the inverse domain.',
            emphasis:
                'f⁻¹(x) does not mean 1/f(x).',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Finding an inverse',
        blocks: [
          WorkedExampleBlockData(
            title: 'Inverse of an affine function',
            problem: 'Find the inverse of f(x)=2x+3.',
            steps: [
              'Write y=2x+3.',
              'Solve for x: x=(y−3)/2.',
              'Rename the variables.',
            ],
            result: 'f⁻¹(x)=(x−3)/2.',
            interpretation:
                'The inverse recovers the original input from the output.',
          ),
          WorkedExampleBlockData(
            title: 'Verification by composition',
            problem: 'Verify the inverse above.',
            steps: [
              'Compute f(f⁻¹(x))=2[(x−3)/2]+3.',
              'Simplify to x.',
              'Compute f⁻¹(f(x))=[(2x+3)−3]/2.',
            ],
            result: 'Both compositions equal x.',
            interpretation:
                'The identity confirms that the functions undo each other.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Restricting domain to obtain an inverse',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'x² is not injective on ℝ',
            content:
                'For f(x)=x², f(2)=f(−2)=4, so there is no global inverse on ℝ. Restricting the domain to [0,+∞) or (−∞,0] makes it injective.',
            emphasis:
                'The domain is part of the function definition.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Inverse after restriction',
            problem: 'Let f(x)=x² on [0,+∞). Find f⁻¹.',
            steps: [
              'Write y=x² with x≥0.',
              'Solve for x: x=√y.',
              'Rename the variables.',
            ],
            result: 'f⁻¹(x)=√x, with domain [0,+∞).',
            interpretation:
                'The restriction selects the nonnegative square root and removes ± ambiguity.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Graphs of inverse functions',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Symmetry across y=x',
            content:
                'Every point (a,b) on the graph of f becomes (b,a) on the graph of f⁻¹. Therefore the two graphs are reflections across y=x.',
            emphasis:
                'Domain and range exchange roles between a function and its inverse.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing inverse and reciprocal',
            content:
                'f⁻¹(x) denotes an inverse function. The reciprocal is 1/f(x); they are different objects.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring the composite domain',
            content:
                'An algebraic expression obtained by substitution may be valid only on part of the inner function domain.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Inverting a non-injective function without restricting domain',
            content:
                'If two inputs share one output, the inverse relation would give one input two outputs and would fail to be a function.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Guided exercises and practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided — composition with domain',
            problem: 'If f(x)=1/x and g(x)=x−2, find f∘g and its domain.',
            steps: [
              '(f∘g)(x)=1/(x−2).',
              'The denominator requires x≠2.',
            ],
            result: '(f∘g)(x)=1/(x−2), x≠2.',
            interpretation:
                'The restriction appears at the value passed into f.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Practice before the final activity',
            content:
                '1. Compute (f∘g)(x) for f(x)=x+1 and g(x)=2x.\n'
                '2. Compute (g∘f)(x) for the same functions.\n'
                '3. Compare the answers to 1 and 2.\n'
                '4. Find the domain of √(x−4) as a composition.\n'
                '5. Find the domain of 1/(x²−1).\n'
                '6. Test whether f(x)=5x+2 is injective.\n'
                '7. Explain why x² is not injective on ℝ.\n'
                '8. Apply the horizontal line test to y=x².\n'
                '9. Find the inverse of f(x)=3x−6.\n'
                '10. Verify your answer by composition.\n'
                '11. Find the inverse of f(x)=(x+4)/2.\n'
                '12. Distinguish f⁻¹(x) from 1/f(x).\n'
                '13. Explain how domain and range exchange roles under inversion.\n'
                '14. Restrict x² to make it invertible and find the inverse.\n'
                '15. Create functions for which f∘g≠g∘f.',
            emphasis:
                'For inverse functions, perform at least one composition check.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Composition and inverses return directly in derivatives',
            content:
                'The chain rule differentiates compositions. Derivatives of inverse functions relate f and f⁻¹. Exponentials, logarithms, and inverse trigonometric functions all depend on this structure.',
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
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart and Thomas for composition, inverse functions, and the chain rule.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'In (f∘g)(x), which function is applied first?',
      choices: ['f', 'g', 'Both at the same time'],
      correctIndex: 1,
      explanation:
          '(f∘g)(x)=f(g(x)); therefore g receives the input first and its output is passed to f.',
    ),
    takeaways: [
      'Composition applies functions in sequence and depends on order.',
      'The composite domain requires x∈D_g and g(x)∈D_f.',
      'Injectivity prevents distinct inputs from sharing an output.',
      'Bijectivity guarantees an inverse between the declared sets.',
      'f⁻¹ does not mean 1/f.',
      'Domain and range exchange roles under inversion.',
      'Restricting the domain can make a function invertible.',
    ],
    closing:
        'Composition describes chained processes; inversion describes when and how those processes can be undone without ambiguity.',
  ),
  CourseLessonData(
    id: 'funcoes-03-transformacoes-graficos',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Graphs',
    title: 'Graph transformations',
    description:
        'translations, reflections, scaling, transformation order, and effects on domain and range',
    duration: '≈ 34 min',
    objective:
        'predict and justify graph transformations from algebraic changes, distinguish internal from external transformations, and track effects on points, domain, and range',
    symbol: 'a·f(b(x−h))+k',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Uma função de referência',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Transformar é reaproveitar um gráfico conhecido',
            content:
                'Partimos de uma função base y=f(x) e produzimos novas funções alterando entradas e saídas. A forma geral [[math:y=a\,f(b(x-h))+k]] concentra translações, reflexões e escalas.',
            emphasis:
                'Transformações permitem prever geometria sem reconstruir o gráfico ponto a ponto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Translation vertical',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'f(x)+k',
            content:
                'Somar k fora da função altera todas as saídas: k>0 desloca o gráfico para cima e k<0 desloca para baixo.',
            emphasis:
                'O domínio permanece o mesmo; a imagem é deslocada verticalmente.',
          ),
          WorkedExampleBlockData(
            title: 'Deslocamento vertical',
            problem: 'Compare y=x² e y=x²−3.',
            steps: [
              'Cada saída de x² é reduzida em 3.',
              'O vértice passa de (0,0) para (0,−3).',
            ],
            result: 'O gráfico desloca 3 unidades para baixo.',
            interpretation:
                'Uma transformação externa age diretamente sobre os valores de y.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Translation horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'f(x−h)',
            content:
                'Substituir x por x−h desloca o gráfico h unidades para a direita; x+h desloca h unidades para a esquerda.',
            emphasis:
                'O sinal horizontal parece invertido porque estamos alterando a entrada necessária para obter a mesma saída.',
          ),
          WorkedExampleBlockData(
            title: 'Por que x−3 move para a direita',
            problem: 'Compare f(x)=x² e g(x)=(x−3)².',
            steps: [
              'Em f, o valor mínimo ocorre quando x=0.',
              'Em g, o mesmo mínimo ocorre quando x−3=0.',
              'Logo x=3.',
            ],
            result: 'O vértice se desloca para (3,0).',
            interpretation:
                'A equação interna mostra onde cada característica do gráfico reaparece.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Reflections',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '−f(x) e f(−x) são diferentes',
            content:
                '−f(x) troca cada saída y por −y e reflete no eixo x. Já f(−x) troca cada entrada x por −x e reflete no eixo y.',
            emphasis:
                'Transformação externa afeta saídas; transformação interna afeta entradas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Vertical scaling',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'a·f(x)',
            content:
                'Multiplicar a função por a multiplica todas as ordenadas por a. Se |a|>1 há alongamento vertical; se 0<|a|<1 há compressão vertical; se a<0 há também reflexão no eixo x.',
          ),
          WorkedExampleBlockData(
            title: 'Alongamento e reflexão',
            problem: 'Descreva y=−2x² a partir de y=x².',
            steps: [
              'O fator 2 duplica a distância vertical ao eixo x.',
              'O sinal negativo reflete o gráfico no eixo x.',
            ],
            result: 'Parábola mais estreita, voltada para baixo.',
            interpretation:
                'Escala e reflexão podem ocorrer simultaneamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Horizontal scaling',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'f(bx)',
            content:
                'A transformação interna f(bx) altera a escala horizontal por fator 1/|b|. Se |b|>1, o gráfico é comprimido horizontalmente; se 0<|b|<1, é alongado. Se b<0, ocorre também reflexão no eixo y.',
            emphasis:
                'Escalas internas usam o fator recíproco.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Combined transformations',
        blocks: [
          WorkedExampleBlockData(
            title: 'Lendo uma forma completa',
            problem: 'Descreva y=−2(x−3)²+1 a partir de y=x².',
            steps: [
              'x−3: desloque 3 unidades para a direita.',
              '−2: reflita no eixo x e alongue verticalmente por 2.',
              '+1: desloque 1 unidade para cima.',
            ],
            result: 'Vértice (3,1), concavidade para baixo e alongamento vertical por 2.',
            interpretation:
                'A forma algébrica codifica posição, orientação e escala.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Transforming points',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Acompanhe um ponto conhecido',
            content:
                'Se (u,v) pertence ao gráfico de y=f(x), então para y=a·f(b(x−h))+k o ponto correspondente satisfaz x=h+u/b e y=av+k.',
            emphasis:
                'Esse método permite construir gráficos transformados a partir de poucos pontos notáveis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Effect on domain and range',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Transformações também movem conjuntos',
            content:
                'Translações horizontais alteram o domínio pela mesma geometria aplicada às entradas. Transformações verticais alteram a imagem. Reflections e escalas podem inverter ou redimensionar esses conjuntos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Trocar o sentido do deslocamento horizontal',
            content:
                'f(x−3) desloca para a direita, não para a esquerda.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir −f(x) e f(−x)',
            content:
                'A primeira reflete no eixo x; a segunda, no eixo y.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Usar b como fator horizontal direto',
            content:
                'Em f(2x), a escala horizontal é 1/2, não 2.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Guided exercises and practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado',
            problem: 'Descreva y=3√(x+2)−4 a partir de y=√x.',
            steps: [
              'x+2 desloca 2 para a esquerda.',
              '3 alonga verticalmente por 3.',
              '−4 desloca 4 para baixo.',
            ],
            result: 'O ponto inicial (0,0) passa para (−2,−4).',
            interpretation:
                'O domínio também passa de [0,+∞) para [−2,+∞).',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Prática antes da atividade final',
            content:
                '1. Descreva f(x)+5.\n'
                '2. Descreva f(x−4).\n'
                '3. Descreva f(x+2).\n'
                '4. Compare −f(x) e f(−x).\n'
                '5. Descreva 3f(x).\n'
                '6. Descreva f(2x).\n'
                '7. Descreva −f(−x).\n'
                '8. Transforme y=x² em y=(x+1)²−4.\n'
                '9. Descreva y=−(x−2)²+5.\n'
                '10. Determine o novo domínio de √(x−6).\n'
                '11. Determine a imagem de 2x²+3.\n'
                '12. Acompanhe o ponto (1,1) sob y=2f(x−3)+4.\n'
                '13. Explique por que f(3x) comprime horizontalmente.\n'
                '14. Dê um exemplo em que reflexão não altera o gráfico.\n'
                '15. Esboce uma sequência de transformações de |x|.',
            emphasis:
                'Sempre separe transformações internas das externas antes de descrever o gráfico.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Transformações preservam estruturas importantes',
            content:
                'Em Cálculo, gráficos transformados ajudam a prever limites, continuidade e derivadas sem recomeçar a análise. Translações e escalas também aparecem em famílias parametrizadas.',
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
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para transformações e leitura gráfica.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'O que f(x+4) faz com o gráfico de f(x)?',
      choices: ['Move 4 para a esquerda', 'Move 4 para a direita', 'Move 4 para cima'],
      correctIndex: 0,
      explanation:
          'Para reproduzir em x o valor que f produzia em x+4, o gráfico precisa aparecer 4 unidades à esquerda.',
    ),
    takeaways: [
      'Transformações externas alteram saídas.',
      'Transformações internas alteram entradas.',
      'Translações horizontais têm sinal aparente invertido.',
      'Reflections em x e y correspondem a operações diferentes.',
      'Escalas internas usam fator recíproco.',
      'Domínio e imagem também se transformam.',
    ],
    closing:
        'Ler transformações diretamente da fórmula reduz o gráfico a uma sequência controlada de operações geométricas.',
  ),
  CourseLessonData(
    id: 'funcoes-04-polinomiais', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Classical functions', title: 'Polynomial functions', description: 'degree, zeros, multiplicity, and end behavior', duration: '≈ 18 min', objective: 'analyze zeros, degree, multiplicity, and end behavior of polynomial functions', symbol: 'P(x)',
    sections: [
      LessonSectionData(number: '1', title: 'Degree controls dominant behavior', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Zeros connect algebra and graphs', content: 'If P(a)=0, then x=a is a zero and x−a is a factor. Multiplicity helps predict whether the graph crosses or only touches the x-axis.', emphasis: 'For large |x|, the leading term dominates.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Zeros and multiplicity', problem: 'Analyze P(x)=(x−2)²(x+1).', steps: ['Zeros are 2 and −1.', '2 has multiplicity 2, so the graph tends to touch.', '−1 has multiplicity 1, so the graph crosses.', 'Total degree is 3.'], result: 'Cubic with zeros −1 and 2, with 2 a double zero.', interpretation: 'Factored form exposes geometry quickly.')]),
      LessonSectionData(number: '3', title: 'Calculus connection', blocks: [ConceptBlockData(visual: LessonVisual.infinity, title: 'Leading terms prepare limits at infinity', content: 'Dominant-term reasoning will return in limits at infinity and growth comparison.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(question: 'Which is a zero of (x−5)(x+2)?', choices: ['5', '2', '−5'], correctIndex: 0, explanation: 'x=5 makes x−5 equal zero.'),
    takeaways: ['Zeros correspond to factors.', 'Multiplicity affects local graph shape.', 'Degree identifies dominant behavior.', 'Factored form supports graph reading.'],
    closing: 'Polynomials are core models for function behavior.',
  ),
  CourseLessonData(
    id: 'funcoes-05-racionais', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Classical functions', title: 'Rational functions and asymptotes', description: 'domain, zeros, and asymptotic behavior', duration: '≈ 18 min', objective: 'analyze domains, zeros, discontinuities, and simple asymptotes of rational functions', symbol: 'P/Q',
    sections: [
      LessonSectionData(number: '1', title: 'The denominator controls restrictions', blocks: [ConceptBlockData(visual: LessonVisual.infinity, title: 'Denominator zeros matter', content: 'A rational function is P(x)/Q(x) with Q(x)≠0. Zeros of Q are excluded and may create vertical asymptotes or removable discontinuities.', emphasis: 'Canceling a factor does not restore an originally forbidden point.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Vertical and horizontal asymptotes', problem: 'Analyze f(x)=(2x+1)/(x−3).', steps: ['Exclude x=3.', 'No cancellation occurs, so x=3 is a vertical-asymptote candidate.', 'Both polynomials have degree 1.', 'Leading-coefficient ratio is 2.'], result: 'Vertical asymptote x=3 and horizontal asymptote y=2.', interpretation: 'Asymptotes describe trends near restrictions and at infinity.')]),
      LessonSectionData(number: '3', title: 'Common mistake', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'A hole stays outside the original domain', content: 'A canceled factor may simplify the formula but not the original domain.', tone: LearningCardTone.warning)]),
    ],
    check: LessonCheckData(question: 'Which value is excluded from (x+1)/(x−7)?', choices: ['−1', '1', '7'], correctIndex: 2, explanation: 'x=7 makes the denominator zero.'),
    takeaways: ['Exclude denominator zeros.', 'Common factors can create holes.', 'Vertical asymptotes occur near some restrictions.', 'Degrees help predict end behavior.'],
    closing: 'Rational functions connect directly to limits and continuity.',
  ),
  CourseLessonData(
    id: 'funcoes-06-exponenciais', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Classical functions', title: 'Exponential functions', description: 'growth, decay, and the number e', duration: '≈ 16 min', objective: 'interpret exponential functions and distinguish growth from decay', symbol: 'aˣ',
    sections: [
      LessonSectionData(number: '1', title: 'The variable is in the exponent', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'The base controls growth', content: 'For f(x)=aˣ with a>0 and a≠1, a>1 gives growth and 0<a<1 gives decay. Domain is ℝ and range is (0,+∞).', emphasis: 'An exponential function never equals zero.'), ConceptBlockData(visual: LessonVisual.idea, title: 'e is natural in Calculus', content: 'The number e≈2.718 appears in continuous growth and gives especially simple derivative rules.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Growth model', problem: 'P(t)=100·2ᵗ. Find P(3).', steps: ['P(3)=100·2³.', '2³=8.', '100·8=800.'], result: 'P(3)=800.', interpretation: 'The quantity doubles each time unit.')]),
      LessonSectionData(number: '3', title: 'Compare', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Exponential versus power', content: 'x² has the variable in the base, while 2ˣ has it in the exponent.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(question: 'Which function represents exponential decay?', choices: ['2ˣ', '(1/2)ˣ', 'x²'], correctIndex: 1, explanation: 'A base between 0 and 1 produces decay.'),
    takeaways: ['The variable is in the exponent.', 'Base >1 gives growth.', '0<base<1 gives decay.', 'eˣ is central in Calculus.'],
    closing: 'Exponentials model processes whose change scales with current size.',
  ),
  CourseLessonData(
    id: 'funcoes-07-logaritmos', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Classical functions', title: 'Logarithms', description: 'definition, properties, and inverse relationship', duration: '≈ 18 min', objective: 'interpret logarithms as exponents and use basic logarithmic properties', symbol: 'logₐx',
    sections: [
      LessonSectionData(number: '1', title: 'A logarithm asks for an exponent', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Core definition', content: 'logₐ(b)=c means aᶜ=b, where a>0, a≠1, and b>0. The logarithm is the inverse of the exponential function.', emphasis: 'A logarithm argument must be positive.'), ConceptBlockData(visual: LessonVisual.calculate, title: 'Properties come from exponents', content: 'logₐ(xy)=logₐx+logₐy, logₐ(x/y)=logₐx−logₐy, and logₐ(xʳ)=r logₐx when defined.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Simple logarithmic equation', problem: 'Solve log₂x=5.', steps: ['Rewrite as 2⁵=x.', '2⁵=32.', 'Check x>0.'], result: 'x=32.', interpretation: 'The logarithm asks which exponent produces the argument.')]),
      LessonSectionData(number: '3', title: 'Common mistake', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Logs do not distribute over sums', content: 'In general log(x+y) ≠ log x + log y.', tone: LearningCardTone.warning)]),
    ],
    check: LessonCheckData(question: 'What is log₁₀(1000)?', choices: ['2', '3', '10'], correctIndex: 1, explanation: '10³=1000.'),
    takeaways: ['A logarithm is an exponent.', 'Logs and exponentials are inverses.', 'The argument must be positive.', 'Log properties mirror exponent rules.'],
    closing: 'Logarithms are natural tools for growth, rates, and scales.',
  ),
  CourseLessonData(
    id: 'funcoes-08-radianos-circulo', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Trigonometry', title: 'Radians and the unit circle', description: 'angles, arcs, and unit-circle coordinates', duration: '≈ 20 min', objective: 'convert degrees and radians and interpret sine and cosine on the unit circle', symbol: 'π rad',
    sections: [
      LessonSectionData(number: '1', title: 'Radians measure angle through arc length', blocks: [ConceptBlockData(visual: LessonVisual.route, title: 'π rad = 180°', content: 'A full turn is 2π radians or 360°. Thus 90°=π/2, 180°=π, and 270°=3π/2.', emphasis: 'Calculus trigonometric formulas assume radians.'), ConceptBlockData(visual: LessonVisual.graph, title: 'The unit circle converts angle to coordinates', content: 'At angle θ, the unit-circle point is (cos θ, sin θ).')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Convert and locate', problem: 'Convert 150° to radians.', steps: ['Multiply by π/180.', '150π/180 simplifies to 5π/6.'], result: '150°=5π/6.', interpretation: 'This angle lies in quadrant II.')]),
      LessonSectionData(number: '3', title: 'Reference values', blocks: [ConceptBlockData(visual: LessonVisual.table, title: 'Know the main angles', content: '0, π/6, π/4, π/3, and π/2 anchor exact sine and cosine values.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(question: '90° equals:', choices: ['π/4', 'π/2', 'π'], correctIndex: 1, explanation: '90° is one quarter turn, equal to π/2 radians.'),
    takeaways: ['2π rad=360°.', 'cos θ is the x-coordinate.', 'sin θ is the y-coordinate.', 'Radians are natural in Calculus.'],
    closing: 'The unit circle connects geometry, graphs, and periodic functions.',
  ),
  CourseLessonData(
    id: 'funcoes-09-trigonometricas-graficos', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Trigonometry', title: 'Trigonometric functions and graphs', description: 'sine, cosine, tangent, period, and amplitude', duration: '≈ 20 min', objective: 'interpret domains, ranges, periods, amplitudes, and graphs of sine, cosine, and tangent', symbol: 'sin x',
    sections: [
      LessonSectionData(number: '1', title: 'Periodicity repeats behavior', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Sine and cosine oscillate', content: 'sin x and cos x have period 2π and range [−1,1]. In A sin(Bx), |A| controls amplitude and 2π/|B| controls period.', emphasis: 'Tangent has period π and is undefined where cos x=0.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Amplitude and period', problem: 'Analyze y=3sin(2x).', steps: ['Amplitude is 3.', 'Period is 2π/2=π.', 'Range is [−3,3].'], result: 'Amplitude 3, period π.', interpretation: 'The graph oscillates higher and cycles twice as fast as sin x.')]),
      LessonSectionData(number: '3', title: 'Different domains', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'Tangent has asymptotes', content: 'tan x=sin x/cos x, so zeros of cosine are excluded.', tone: LearningCardTone.warning)]),
    ],
    check: LessonCheckData(question: 'What is the period of cos x?', choices: ['π/2', 'π', '2π'], correctIndex: 2, explanation: 'Cosine repeats every 2π radians.'),
    takeaways: ['Sine and cosine have period 2π.', 'Tangent has period π.', 'Amplitude controls vertical oscillation.', 'Tangent excludes cosine zeros.'],
    closing: 'Trigonometric graphs are essential for limits, derivatives, and periodic models.',
  ),
  CourseLessonData(
    id: 'funcoes-10-identidades-equacoes-trig', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Trigonometry', title: 'Trigonometric identities and equations', description: 'fundamental identities and periodic solutions', duration: '≈ 20 min', objective: 'use basic identities and solve elementary trigonometric equations', symbol: 'sin²+cos²',
    sections: [
      LessonSectionData(number: '1', title: 'Identities are always-valid equations', blocks: [ConceptBlockData(visual: LessonVisual.notation, title: 'Fundamental identity', content: 'sin²x+cos²x=1 and tan x=sin x/cos x when cos x≠0. Sum, difference, and double-angle formulas provide further rewrites.', emphasis: 'An identity is not an equation with isolated solution values.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Solve on one cycle', problem: 'Solve sin x=1/2 for 0≤x<2π.', steps: ['Reference angle is π/6.', 'Sine is positive in quadrants I and II.', 'Solutions are π/6 and 5π/6.'], result: 'x=π/6 or 5π/6.', interpretation: 'Quadrants and periodicity determine solutions.')]),
      LessonSectionData(number: '3', title: 'Strategy', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Simplify before solving', content: 'Rewrite in common functions or use an identity before isolating the variable.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(question: 'Which identity is always true?', choices: ['sin x+cos x=1', 'sin²x+cos²x=1', 'tan x=cos x/sin x'], correctIndex: 1, explanation: 'sin²x+cos²x=1 is the fundamental identity.'),
    takeaways: ['Identities hold throughout their domain.', 'sin²+cos²=1 is fundamental.', 'Equations use quadrants and periodicity.', 'Strategic rewriting simplifies problems.'],
    closing: 'Identities transform expressions without changing their value.',
  ),
  CourseLessonData(
    id: 'funcoes-11-inversas-trig', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Trigonometry', title: 'Inverse trigonometric functions', description: 'arcsine, arccosine, and arctangent', duration: '≈ 18 min', objective: 'interpret inverse trig functions with restricted domains and ranges', symbol: 'arctan',
    sections: [
      LessonSectionData(number: '1', title: 'Restriction makes inversion possible', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Periodic functions are not globally one-to-one', content: 'We restrict sine and cosine before defining inverses. arcsin returns values in [−π/2,π/2], arccos in [0,π], and arctan in (−π/2,π/2).', emphasis: 'sin⁻¹x means arcsin x, not 1/sin x.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Recover the principal angle', problem: 'Find arcsin(1/2).', steps: ['Use the principal interval.', 'sin(π/6)=1/2.'], result: 'arcsin(1/2)=π/6.', interpretation: 'The inverse returns the chosen principal representative.')]),
      LessonSectionData(number: '3', title: 'Domain and range', blocks: [ConceptBlockData(visual: LessonVisual.table, title: 'Restrictions have meaning', content: 'arcsin and arccos accept inputs only in [−1,1]; arctan accepts all real inputs.', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(question: 'What is the domain of arcsin x?', choices: ['ℝ', '[−1,1]', '(0,+∞)'], correctIndex: 1, explanation: 'Sine outputs only values from −1 to 1.'),
    takeaways: ['Trig functions need restrictions before inversion.', 'arcsin and arccos have domain [−1,1].', 'arctan has domain ℝ.', 'Inverse notation is not reciprocal notation.'],
    closing: 'Inverse trig functions appear in geometry, integration, and applied problems.',
  ),
  CourseLessonData(
    id: 'funcoes-12-geometria-analitica', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Analytic geometry', title: 'Points, distance, and lines', description: 'coordinate plane, slope, and line equations', duration: '≈ 18 min', objective: 'use distance, midpoint, and slope to interpret lines in the plane', symbol: 'm=Δy/Δx',
    sections: [
      LessonSectionData(number: '1', title: 'Slope measures change', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'A line has constant rate', content: 'Between (x₁,y₁) and (x₂,y₂), m=(y₂−y₁)/(x₂−x₁). The form y=mx+b displays slope and y-intercept.', emphasis: 'Slope is a constant average rate of change for linear functions.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Line through two points', problem: 'Find the line through (1,2) and (4,8).', steps: ['m=(8−2)/(4−1)=2.', 'Use y−2=2(x−1).', 'Expand to y=2x.'], result: 'y=2x.', interpretation: 'y increases 2 units for each unit of x.')]),
      LessonSectionData(number: '3', title: 'Distance in the plane', blocks: [ConceptBlockData(visual: LessonVisual.calculate, title: 'Pythagoras in coordinates', content: 'Distance is √[(x₂−x₁)²+(y₂−y₁)²], and midpoint is ((x₁+x₂)/2,(y₁+y₂)/2).', tone: LearningCardTone.information)]),
    ],
    check: LessonCheckData(question: 'Slope between (0,1) and (2,5)?', choices: ['1', '2', '4'], correctIndex: 1, explanation: '(5−1)/(2−0)=2.'),
    takeaways: ['Slope is Δy/Δx.', 'Lines have constant rate.', 'Distance comes from Pythagoras.', 'Analytic geometry connects formulas and graphs.'],
    closing: 'Slope prepares the geometric meaning of derivative.',
  ),
  CourseLessonData(
    id: 'funcoes-13-conicas', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Analytic geometry', title: 'Conic sections in 2D', description: 'circle, parabola, ellipse, and hyperbola', duration: '≈ 20 min', objective: 'recognize standard forms of major conics and interpret their geometric parameters', symbol: 'x²+y²',
    sections: [
      LessonSectionData(number: '1', title: 'Four geometric families', blocks: [ConceptBlockData(visual: LessonVisual.compare, title: 'Algebraic form reveals the curve', content: 'Circle: (x−h)²+(y−k)²=r². Ellipses use a sum of normalized squared terms; hyperbolas use a difference; parabolas have one squared variable in standard orientation.', emphasis: 'Completing the square helps recover standard forms.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Read a circle', problem: 'Interpret (x−2)²+(y+1)²=9.', steps: ['Compare with standard form.', 'Center is (2,−1).', 'Radius is 3.'], result: 'Center (2,−1), radius 3.', interpretation: 'The equation directly encodes position and size.')]),
      LessonSectionData(number: '3', title: 'Not every conic is y=f(x)', blocks: [ConceptBlockData(visual: LessonVisual.warning, title: 'The vertical-line test still applies', content: 'A complete circle is not the graph of a single function y=f(x).', tone: LearningCardTone.warning)]),
    ],
    check: LessonCheckData(question: 'What is the radius of x²+y²=25?', choices: ['5', '25', '√50'], correctIndex: 0, explanation: 'r²=25, so r=5.'),
    takeaways: ['Conics have recognizable standard forms.', 'A circle encodes center and radius.', 'Ellipses and hyperbolas use two squared terms.', 'A curve need not be a function of x globally.'],
    closing: 'Conics broaden geometric interpretation before more advanced curves.',
  ),
  CourseLessonData(
    id: 'funcoes-14-taxa-media-sintese', topicId: 'funcoes', trailTitle: 'Functions — Precalculus', eyebrow: 'Bridge to Calculus', title: 'Average rate of change and synthesis', description: 'secant lines, behavior, and preparation for limits', duration: '≈ 20 min', objective: 'compute average rate of change and connect Precalculus to the idea of derivative', symbol: 'Δy/Δx',
    sections: [
      LessonSectionData(number: '1', title: 'Output change per input change', blocks: [ConceptBlockData(visual: LessonVisual.graph, title: 'Average rate is secant slope', content: 'Between a and b, average rate is [f(b)−f(a)]/(b−a), the slope of the secant through (a,f(a)) and (b,f(b)).', emphasis: 'Derivative emerges as b approaches a.')]),
      LessonSectionData(number: '2', title: 'See it in action', blocks: [WorkedExampleBlockData(title: 'Average rate for a quadratic', problem: 'For f(x)=x², find the average rate from x=1 to x=3.', steps: ['f(1)=1 and f(3)=9.', 'Δy=8.', 'Δx=2.', 'Rate=4.'], result: 'Average rate=4.', interpretation: 'The secant through (1,1) and (3,9) has slope 4.')]),
      LessonSectionData(number: '3', title: 'Your Precalculus map', blocks: [ConceptBlockData(visual: LessonVisual.checklist, title: 'Everything now feeds Calculus', content: 'Domain tells where functions exist; algebra simplifies; graphs show behavior; trig models periodicity; exponentials and logs model growth; average rate prepares instantaneous rate.', tone: LearningCardTone.success)]),
    ],
    check: LessonCheckData(question: 'Geometrically, average rate of change is:', choices: ['Secant slope', 'Area under the graph', 'Maximum function value'], correctIndex: 0, explanation: 'It is the slope of the line through two graph points.'),
    takeaways: ['Average rate is Δoutput/Δinput.', 'It is secant slope.', 'Derivative is a limit of this rate.', 'Precalculus converges on function interpretation.'],
    closing: 'With this foundation, Limits become the natural next step.',
  ),
];
