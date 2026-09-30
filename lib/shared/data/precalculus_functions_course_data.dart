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
    description:
        'grau, coeficiente líder, zeros, multiplicidade, comportamento nas extremidades e leitura gráfica',
    duration: '≈ 36 min',
    objective:
        'analisar funções polinomiais a partir de grau, coeficiente líder, zeros e multiplicidades, relacionar formas algébricas ao gráfico e prever comportamento nas extremidades',
    symbol: 'P(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição de função polinomial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Soma finita de potências inteiras não negativas',
            content:
                'Uma função polinomial tem a forma [[math:P(x)=a_nx^n+a_{n-1}x^{n-1}+\cdots+a_1x+a_0]], com n inteiro não negativo, coeficientes reais e [[math:a_n\ne0]].',
            emphasis:
                'O domínio natural de todo polinômio real é ℝ.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Grau e coeficiente líder',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'O termo dominante',
            content:
                'O grau é o maior expoente com coeficiente não nulo. O coeficiente líder é o coeficiente desse termo. Para |x| muito grande, o termo líder controla o comportamento global.',
            emphasis:
                'Grau e sinal do coeficiente líder permitem prever as extremidades do gráfico.',
          ),
          WorkedExampleBlockData(
            title: 'Lendo a estrutura',
            problem: 'Analise P(x)=−2x⁵+3x²−7.',
            steps: [
              'O maior expoente é 5.',
              'Logo o grau é 5.',
              'O coeficiente líder é −2.',
            ],
            result: 'Grau 5 e coeficiente líder −2.',
            interpretation:
                'Por ser grau ímpar e coeficiente líder negativo, as extremidades apontam em sentidos opostos com queda à direita.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Comportamento nas extremidades',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Paridade do grau e sinal do líder',
            content:
                'Grau par produz extremidades no mesmo sentido; grau ímpar produz sentidos opostos. Coeficiente líder positivo aponta para cima à direita; negativo, para baixo à direita.',
            emphasis:
                'Essa leitura descreve comportamento quando x→±∞, não detalhes locais do gráfico.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Zeros e fatores',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Teorema do fator',
            content:
                'Se P(a)=0, então x−a é fator de P(x). Reciprocamente, se x−a é fator, então a é zero da função.',
            emphasis:
                'A forma fatorada conecta diretamente álgebra e interceptos no eixo x.',
          ),
          WorkedExampleBlockData(
            title: 'Forma fatorada',
            problem: 'Encontre os zeros de P(x)=(x−2)(x+1)(x−4).',
            steps: [
              'Iguale cada fator a zero.',
              'x−2=0, x+1=0 e x−4=0.',
            ],
            result: 'Zeros: −1, 2 e 4.',
            interpretation:
                'Cada zero fornece um intercepto potencial com o eixo x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Multiplicidade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Cruzar ou tocar o eixo',
            content:
                'Se um fator (x−a)^m aparece, m é a multiplicidade da raiz a. Multiplicidade ímpar tende a produzir cruzamento do eixo x; multiplicidade par tende a produzir contato sem troca de sinal.',
            emphasis:
                'Quanto maior a multiplicidade, mais achatado o gráfico tende a ficar perto da raiz.',
          ),
          WorkedExampleBlockData(
            title: 'Multiplicidades diferentes',
            problem: 'Analise P(x)=(x−2)²(x+1)³.',
            steps: [
              'x=2 tem multiplicidade 2.',
              'x=−1 tem multiplicidade 3.',
              'Em x=2 o sinal não muda.',
              'Em x=−1 o sinal muda.',
            ],
            result: 'O gráfico toca em x=2 e cruza em x=−1.',
            interpretation:
                'A multiplicidade fornece informação local sem necessidade de muitos pontos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Intercepto no eixo y',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Calcule P(0)',
            content:
                'O intercepto com o eixo y ocorre em x=0 e tem ordenada P(0)=a₀.',
            emphasis:
                'Na forma expandida, o termo constante já fornece diretamente esse intercepto.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Forma expandida e forma fatorada',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Cada forma revela informações diferentes',
            content:
                'A forma expandida mostra grau, coeficientes e intercepto em y. A forma fatorada mostra zeros e multiplicidades. Nenhuma forma é universalmente superior.',
            emphasis:
                'Escolher a representação adequada faz parte da análise.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Número possível de zeros reais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'No máximo n zeros reais distintos',
            content:
                'Um polinômio não nulo de grau n possui no máximo n zeros reais distintos. Pode ter menos, porque algumas raízes podem ser complexas ou repetidas.',
            emphasis:
                'Grau 4 não significa obrigatoriamente quatro interceptos reais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Simetria em casos especiais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Polinômios pares e ímpares',
            content:
                'Se P(−x)=P(x), a função é par e o gráfico é simétrico em relação ao eixo y. Se P(−x)=−P(x), é ímpar e possui simetria central em relação à origem.',
            emphasis:
                'Uma função polinomial pode não ser nem par nem ímpar.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Esboço estrutural de um polinômio',
        blocks: [
          WorkedExampleBlockData(
            title: 'Juntando as informações',
            problem: 'Esboce qualitativamente P(x)=(x−2)²(x+1).',
            steps: [
              'Grau total 3 e coeficiente líder positivo.',
              'Extremidade esquerda para baixo e direita para cima.',
              'Zero −1 de multiplicidade 1: cruza o eixo.',
              'Zero 2 de multiplicidade 2: toca e retorna.',
              'P(0)=4, então o gráfico passa por (0,4).',
            ],
            result: 'O comportamento essencial do gráfico fica determinado sem tabela extensa.',
            interpretation:
                'O esboço combina informação global e local.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir grau com número de termos',
            content:
                'x⁷+1 tem apenas dois termos, mas grau 7.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Assumir que toda raiz cruza o eixo',
            content:
                'Raízes de multiplicidade par podem apenas tocar o eixo x.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Concluir o gráfico inteiro só pelo termo dominante',
            content:
                'O termo líder controla as extremidades, mas não determina sozinho zeros, máximos locais ou outras características internas.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Exercícios guiados e prática',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado',
            problem: 'Analise P(x)=−(x−1)²(x+3).',
            steps: [
              'Grau 3 e coeficiente líder negativo.',
              'Zeros: 1 com multiplicidade 2 e −3 com multiplicidade 1.',
              'P(0)=−3.',
            ],
            result: 'Cruza em −3, toca em 1 e cai à direita.',
            interpretation:
                'As três informações bastam para um esboço qualitativo consistente.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Prática antes da atividade final',
            content:
                '1. Determine grau e coeficiente líder de 4x⁶−x+1.\n'
                '2. Descreva o comportamento nas extremidades de x⁵.\n'
                '3. Descreva o comportamento de −x⁴.\n'
                '4. Encontre os zeros de (x−3)(x+2).\n'
                '5. Determine as multiplicidades em (x−1)³(x+4)².\n'
                '6. Calcule o intercepto em y de 2x³−5x+7.\n'
                '7. Compare forma expandida e fatorada.\n'
                '8. Esboce qualitativamente (x+2)²(x−1).\n'
                '9. Diga se x⁴+2x²+1 é par.\n'
                '10. Diga se x³−x é ímpar.\n'
                '11. Dê um polinômio de grau 4 sem zeros reais.\n'
                '12. Explique por que um cúbico real possui pelo menos um zero real.\n'
                '13. Determine um polinômio com zeros 1 e −2, sendo 1 duplo.\n'
                '14. Explique a influência da multiplicidade no sinal.\n'
                '15. Construa um esboço usando apenas fatores e termo líder.',
            emphasis:
                'Em esboços, registre primeiro extremidades, zeros, multiplicidades e intercepto em y.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Polinômios são o laboratório básico do Cálculo',
            content:
                'Polinômios são contínuos e diferenciáveis em todo ℝ. Termo dominante aparece em limites no infinito, enquanto zeros e multiplicidades ajudam em estudo de sinais e análise de derivadas.',
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
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para funções polinomiais, zeros e comportamento assintótico.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é um zero de P(x)=(x−5)(x+2)?',
      choices: ['5', '2', '−5'],
      correctIndex: 0,
      explanation:
          'Quando x=5, o fator x−5 é zero e, portanto, P(5)=0.',
    ),
    takeaways: [
      'O domínio natural de um polinômio real é ℝ.',
      'Grau e coeficiente líder controlam o comportamento nas extremidades.',
      'Zeros correspondem a fatores lineares.',
      'Multiplicidade controla troca de sinal e contato com o eixo x.',
      'Forma expandida e fatorada revelam informações diferentes.',
      'O termo dominante descreve comportamento global, não toda a geometria local.',
    ],
    closing:
        'Funções polinomiais mostram como uma expressão algébrica pode ser lida geometricamente antes mesmo de calcular muitos pontos.',
  ),
  CourseLessonData(
    id: 'funcoes-05-racionais',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Funções racionais e assíntotas',
    description:
        'domínio, zeros, furos, assíntotas verticais, horizontais e oblíquas, sinais e comportamento no infinito',
    duration: '≈ 42 min',
    objective:
        'analisar funções racionais a partir de domínio, zeros, fatores, descontinuidades removíveis, assíntotas e comportamento lateral e no infinito, preservando a distinção entre a função original e sua expressão simplificada',
    symbol: 'P(x)/Q(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição de função racional',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Quociente de polinômios',
            content:
                'Uma função racional tem a forma [[math:R(x)=\\frac{P(x)}{Q(x)}]], em que P e Q são polinômios e Q não é o polinômio nulo.',
            emphasis:
                'O domínio natural exclui todos os valores que zeram Q(x).',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Racional não significa apenas “ter fração”',
            content:
                'A característica estrutural é ser quociente de polinômios. Expressões como √x/(x−1) não são funções racionais porque o numerador não é polinomial.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Domínio e pontos proibidos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Resolva Q(x)=0 antes de qualquer simplificação',
            content:
                'Os zeros do denominador original são excluídos do domínio. Essa informação deve ser registrada antes de cancelar fatores.',
            emphasis:
                'Simplificação algébrica não altera retroativamente o domínio da função originalmente dada.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Domínio com denominador fatorável',
            problem: 'Determine o domínio de f(x)=(x+1)/(x²−9).',
            steps: [
              'Fatore o denominador: x²−9=(x−3)(x+3).',
              'O denominador zera em x=3 e x=−3.',
            ],
            result: 'D_f=ℝ\{−3,3}.',
            interpretation:
                'Os dois pontos são removidos antes de qualquer análise gráfica.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Zeros da função',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'O numerador deve zerar sem zerar o denominador',
            content:
                'Um valor a é zero de R quando P(a)=0 e Q(a)≠0. Se numerador e denominador zeram ao mesmo tempo, é preciso analisar o fator comum e o domínio original.',
            emphasis:
                'Zero da função é intercepto no eixo x; ponto proibido não é intercepto.',
          ),
          WorkedExampleBlockData(
            title: 'Zero permitido',
            problem: 'Encontre os zeros de f(x)=(x−2)/(x+5).',
            steps: [
              'O numerador zera em x=2.',
              'O denominador em x=2 vale 7, portanto não zera.',
            ],
            result: 'O único zero é x=2.',
            interpretation:
                'O gráfico intercepta o eixo x no ponto (2,0).',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Fatores comuns e descontinuidades removíveis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelar fator não preenche o furo',
            content:
                'Se numerador e denominador possuem um fator comum, podemos simplificar a expressão para estudar o comportamento, mas o ponto que zerava o denominador original permanece fora do domínio.',
            emphasis:
                'A função simplificada e a função original coincidem no domínio original, mas não são necessariamente a mesma função.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Identificando um furo',
            problem: 'Analise f(x)=(x²−4)/(x−2).',
            steps: [
              'Fatore: x²−4=(x−2)(x+2).',
              'O domínio original exclui x=2.',
              'Para x≠2, simplifique para f(x)=x+2.',
              'O valor que a expressão simplificada teria em x=2 é 4.',
            ],
            result: 'O gráfico é a reta y=x+2 com um furo em (2,4).',
            interpretation:
                'A descontinuidade é removível porque o comportamento vizinho é finito, embora a função original não esteja definida em x=2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Assíntotas verticais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Denominador não cancelado tende a zero',
            content:
                'Depois de simplificar fatores comuns e preservar o domínio original, zeros restantes do denominador são candidatos a assíntotas verticais. O comportamento precisa crescer sem limite ao aproximar-se do ponto.',
            emphasis:
                'Nem todo zero do denominador original vira assíntota vertical; fatores cancelados geram furos.',
          ),
          WorkedExampleBlockData(
            title: 'Comportamento lateral diferente',
            problem: 'Analise f(x)=1/(x−3) perto de x=3.',
            steps: [
              'Quando x→3⁻, x−3 é negativo e muito pequeno.',
              'Logo f(x)→−∞.',
              'Quando x→3⁺, x−3 é positivo e muito pequeno.',
              'Logo f(x)→+∞.',
            ],
            result: 'x=3 é assíntota vertical.',
            interpretation:
                'A mesma assíntota pode ter comportamentos laterais com sinais opostos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Assíntotas horizontais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Compare os graus de P e Q',
            content:
                'Para R(x)=P(x)/Q(x): se grau(P)<grau(Q), a assíntota horizontal é y=0. Se os graus são iguais, a assíntota horizontal é a razão dos coeficientes líderes.',
            emphasis:
                'Essas regras descrevem comportamento quando |x| cresce sem limite.',
          ),
          WorkedExampleBlockData(
            title: 'Graus iguais',
            problem: 'Analise o comportamento no infinito de f(x)=(2x+1)/(x−3).',
            steps: [
              'Numerador e denominador têm grau 1.',
              'Os coeficientes líderes são 2 e 1.',
              'A razão é 2.',
            ],
            result: 'Assíntota horizontal y=2.',
            interpretation:
                'Para |x| muito grande, os termos líderes dominam o quociente.',
          ),
          WorkedExampleBlockData(
            title: 'Numerador de menor grau',
            problem: 'Encontre a assíntota horizontal de g(x)=(3x−1)/(x²+4).',
            steps: [
              'O numerador tem grau 1.',
              'O denominador tem grau 2.',
            ],
            result: 'Assíntota horizontal y=0.',
            interpretation:
                'O denominador cresce mais rapidamente que o numerador.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Quando não existe assíntota horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Numerador de grau maior',
            content:
                'Se grau(P)>grau(Q), não há assíntota horizontal. Nesse caso, divisão polinomial pode revelar uma assíntota oblíqua ou polinomial.',
            emphasis:
                '“Não há horizontal” não significa “não há comportamento assintótico”.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Assíntota oblíqua',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Diferença de graus igual a 1',
            content:
                'Quando grau(P)=grau(Q)+1, a divisão polinomial produz [[math:R(x)=mx+b+\\frac{r(x)}{Q(x)}]], e o termo fracionário tende a zero no infinito. Assim, y=mx+b é uma assíntota oblíqua.',
          ),
          WorkedExampleBlockData(
            title: 'Divisão polinomial',
            problem: 'Encontre a assíntota oblíqua de f(x)=(x²+1)/(x−1).',
            steps: [
              'Divida x²+1 por x−1.',
              'Obtenha x²+1=(x−1)(x+1)+2.',
              'Logo f(x)=x+1+2/(x−1).',
              'Quando |x|→∞, 2/(x−1)→0.',
            ],
            result: 'Assíntota oblíqua y=x+1.',
            interpretation:
                'O gráfico se aproxima de uma reta inclinada em vez de uma reta horizontal.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Interceptos e esboço global',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Combine informações independentes',
            content:
                'Para esboçar uma função racional, reúna domínio, zeros, intercepto em y, furos, assíntotas verticais, assíntotas no infinito e sinais em intervalos.',
            emphasis:
                'Uma única característica nunca descreve o gráfico completo.',
          ),
          WorkedExampleBlockData(
            title: 'Análise estrutural completa',
            problem: 'Analise f(x)=(2x+1)/(x−3).',
            steps: [
              'Domínio: x≠3.',
              'Zero: 2x+1=0, então x=−1/2.',
              'Intercepto em y: f(0)=−1/3.',
              'Assíntota vertical: x=3.',
              'Assíntota horizontal: y=2.',
            ],
            result: 'O esboço deve respeitar todos esses elementos simultaneamente.',
            interpretation:
                'A forma racional permite prever muita geometria antes de calcular pontos adicionais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'A função pode cruzar uma assíntota horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Assíntota não é uma parede',
            content:
                'Uma assíntota horizontal descreve comportamento quando x→±∞. O gráfico pode cruzar essa reta em valores finitos de x.',
            emphasis:
                'A proibição de cruzamento não faz parte da definição de assíntota.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Sinal de uma função racional',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Zeros e pontos proibidos dividem a reta',
            content:
                'Para determinar onde R(x)>0 ou R(x)<0, fature numerador e denominador, marque zeros e valores proibidos e analise o sinal em cada intervalo.',
            emphasis:
                'Essa é a mesma estrutura usada em inequações racionais e será reutilizada em derivadas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Transformar todo zero do denominador em assíntota',
            content:
                'Se o fator cancela, pode haver apenas um furo.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer o domínio após cancelamento',
            content:
                'O ponto removido pelo denominador original continua excluído.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Usar regra de assíntota horizontal quando o numerador tem grau maior',
            content:
                'Nesse caso é necessário examinar a divisão polinomial.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — furo e assíntota',
            problem: 'Analise f(x)=(x²−1)/(x²−x).',
            steps: [
              'Fatore: (x−1)(x+1)/[x(x−1)].',
              'Domínio original: x≠0 e x≠1.',
              'Para x≠0,1, simplifique para (x+1)/x.',
              'x=1 produz um furo.',
              'x=0 permanece zero não cancelado do denominador.',
            ],
            result: 'Furo em (1,2) e assíntota vertical x=0.',
            interpretation:
                'Dois zeros do denominador original podem produzir fenômenos diferentes.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — horizontal',
            problem: 'Encontre a assíntota horizontal de (5x²−1)/(2x²+3x).',
            steps: [
              'Os graus são iguais a 2.',
              'A razão dos coeficientes líderes é 5/2.',
            ],
            result: 'y=5/2.',
            interpretation:
                'Termos de menor grau não alteram o limite no infinito.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Analise antes de esboçar',
            content:
                '1. Determine o domínio de 1/(x−4).\n'
                '2. Determine o domínio de (x+1)/(x²−9).\n'
                '3. Encontre os zeros de (x−2)/(x+5).\n'
                '4. Analise (x²−4)/(x−2) e localize o furo.\n'
                '5. Encontre a assíntota vertical de 1/(x+3).\n'
                '6. Descreva os limites laterais de 1/(x−2).\n'
                '7. Encontre a assíntota horizontal de (3x+1)/(2x−5).\n'
                '8. Encontre a assíntota horizontal de x/(x²+1).\n'
                '9. Decida se (x²+1)/(x−1) possui assíntota horizontal.\n'
                '10. Encontre sua assíntota oblíqua.\n'
                '11. Explique por que um fator cancelado não restaura o domínio.\n'
                '12. Dê um exemplo de função racional com um furo e uma assíntota vertical.\n'
                '13. Determine onde (x−1)/(x+2)>0.\n'
                '14. Explique por que uma função pode cruzar a assíntota horizontal.\n'
                '15. Faça uma análise estrutural completa de (x+2)/(x−1).',
            emphasis:
                'Registre domínio, zeros, furos e assíntotas em linhas separadas antes de construir o esboço.',
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Conexão com limites e continuidade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Assíntotas são linguagem de limites',
            content:
                'Assíntotas verticais descrevem comportamento quando x se aproxima de um valor finito; assíntotas horizontais e oblíquas descrevem comportamento quando x→±∞. Furos antecipam a ideia de descontinuidade removível.',
            emphasis:
                'Esta aula é uma preparação direta para limites e continuidade.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '16',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas e Guidorizzi para funções racionais, assíntotas, limites e continuidade.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Na função (x²−4)/(x−2), o que ocorre em x=2?',
      choices: [
        'Há uma assíntota vertical',
        'Há uma descontinuidade removível',
        'A função possui zero em x=2',
      ],
      correctIndex: 1,
      explanation:
          'O fator x−2 cancela algebricamente, mas x=2 permanece fora do domínio original. O gráfico tem um furo no ponto correspondente.',
    ),
    takeaways: [
      'Funções racionais são quocientes de polinômios.',
      'Zeros do denominador original são excluídos do domínio.',
      'Fatores cancelados podem produzir descontinuidades removíveis.',
      'Fatores não cancelados do denominador podem gerar assíntotas verticais.',
      'Graus determinam grande parte do comportamento no infinito.',
      'Divisão polinomial pode revelar assíntotas oblíquas.',
      'Assíntotas descrevem tendências e não funcionam como barreiras.',
      'Domínio, zeros, sinais e assíntotas devem ser analisados em conjunto.',
    ],
    closing:
        'Funções racionais são o primeiro grande encontro entre álgebra, geometria e comportamento limite de uma função.',
  ),
  CourseLessonData(
    id: 'funcoes-06-exponenciais',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Funções exponenciais',
    description:
        'definição, domínio, imagem, crescimento, decaimento, transformações, modelos e número e',
    duration: '≈ 36 min',
    objective:
        'analisar funções exponenciais a partir da base, determinar domínio e imagem, interpretar crescimento e decaimento, resolver modelos simples e compreender o papel especial do número e',
    symbol: 'aˣ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição de função exponencial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A variável aparece no expoente',
            content:
                'Uma função exponencial básica tem a forma [[math:f(x)=a^x]], com [[math:a>0]] e [[math:a\\ne1]]. A base positiva garante valores reais para todo x real; a exclusão de a=1 evita a função constante.',
            emphasis:
                'Em x² a variável está na base; em 2ˣ a variável está no expoente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Domínio, imagem e intercepto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Estrutura básica do gráfico',
            content:
                'Para f(x)=aˣ com a>0 e a≠1, o domínio é ℝ, a imagem é (0,+∞) e f(0)=1. Portanto, todo gráfico exponencial básico passa por (0,1).',
            emphasis:
                'A função exponencial nunca assume valor zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Crescimento exponencial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Base maior que 1',
            content:
                'Se a>1, então f(x)=aˣ é crescente. Multiplicar x por incrementos iguais multiplica a saída por fatores constantes.',
            emphasis:
                'Em crescimento exponencial, razões sucessivas são constantes quando os incrementos de entrada são iguais.',
          ),
          WorkedExampleBlockData(
            title: 'Dobro por unidade',
            problem: 'Considere P(t)=100·2ᵗ. Calcule P(3).',
            steps: [
              'Substitua t=3.',
              'P(3)=100·2³.',
              '2³=8.',
            ],
            result: 'P(3)=800.',
            interpretation:
                'A quantidade dobra a cada unidade de tempo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Decaimento exponencial',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Base entre 0 e 1',
            content:
                'Se 0<a<1, então aˣ é decrescente. Como [[math:a^x=(1/b)^x=b^{-x}]] para b>1, decaimento pode ser visto como crescimento refletido no eixo y.',
            emphasis:
                'A função continua positiva para todo x real.',
          ),
          WorkedExampleBlockData(
            title: 'Metade por etapa',
            problem: 'Considere M(t)=80·(1/2)ᵗ. Calcule M(3).',
            steps: [
              'Substitua t=3.',
              '(1/2)³=1/8.',
              '80·1/8=10.',
            ],
            result: 'M(3)=10.',
            interpretation:
                'A quantidade é reduzida pela metade a cada unidade de tempo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Assíntota horizontal',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'y=0 na exponencial básica',
            content:
                'Para a>1, aˣ→0 quando x→−∞. Para 0<a<1, aˣ→0 quando x→+∞. Assim, y=0 é assíntota horizontal da função exponencial básica.',
            emphasis:
                'O gráfico se aproxima do eixo x, mas não o toca.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Transformações exponenciais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'A forma C·a^(x−h)+k',
            content:
                'Na forma [[math:f(x)=C\\,a^{x-h}+k]], h desloca horizontalmente, k desloca verticalmente e C escala ou reflete verticalmente.',
            emphasis:
                'A assíntota horizontal passa de y=0 para y=k.',
          ),
          WorkedExampleBlockData(
            title: 'Lendo a transformação',
            problem: 'Analise f(x)=3·2^(x−1)−4.',
            steps: [
              'x−1 desloca 1 unidade para a direita.',
              'O fator 3 alonga verticalmente.',
              '−4 desloca 4 unidades para baixo.',
            ],
            result: 'Assíntota horizontal y=−4.',
            interpretation:
                'As transformações alteram posição e escala sem mudar a natureza exponencial.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Equações exponenciais com mesma base',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Use a injetividade',
            content:
                'Para a>0 e a≠1, a função aˣ é injetiva. Portanto, se [[math:a^{u}=a^{v}]], então u=v.',
            emphasis:
                'Igualar expoentes só é válido quando as bases são iguais e admissíveis.',
          ),
          WorkedExampleBlockData(
            title: 'Igualando expoentes',
            problem: 'Resolva 2^(x+1)=8.',
            steps: [
              'Escreva 8 como 2³.',
              'Então 2^(x+1)=2³.',
              'Iguale os expoentes: x+1=3.',
            ],
            result: 'x=2.',
            interpretation:
                'A injetividade da exponencial justifica o passo central.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Quando as bases não coincidem',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Logaritmos resolvem o caso geral',
            content:
                'Equações como 3ˣ=7 não admitem reescrita simples com a mesma base. Nesse caso, logaritmos permitem isolar o expoente.',
            emphasis:
                'A aula seguinte desenvolverá essa ferramenta formalmente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Modelos do tipo P(t)=P₀aᵗ',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Valor inicial e fator multiplicativo',
            content:
                'Em [[math:P(t)=P_0a^t]], P₀ é o valor inicial porque P(0)=P₀. A base a representa o fator multiplicativo por unidade de tempo.',
            emphasis:
                'a=1+r modela crescimento percentual r; a=1−r modela decaimento percentual quando 0<r<1.',
          ),
          WorkedExampleBlockData(
            title: 'Crescimento percentual',
            problem: 'Uma população inicia em 500 e cresce 8% ao ano. Escreva o modelo.',
            steps: [
              'Valor inicial: P₀=500.',
              'Taxa: r=0,08.',
              'Fator anual: 1+r=1,08.',
            ],
            result: 'P(t)=500·1,08ᵗ.',
            interpretation:
                'A porcentagem vira um fator multiplicativo recorrente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'O número e',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'A base natural do Cálculo',
            content:
                'O número [[math:e\\approx2{,}71828]] surge naturalmente em processos de crescimento contínuo e na análise de limites. A função eˣ possui a propriedade especial de ter derivada igual a si mesma.',
            emphasis:
                'Essa propriedade será demonstrada formalmente em Cálculo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Crescimento contínuo',
        blocks: [
          WorkedExampleBlockData(
            title: 'Modelo com e',
            problem: 'Uma quantidade segue Q(t)=200e^(0,3t). Calcule Q(0).',
            steps: [
              'Substitua t=0.',
              'e^0=1.',
            ],
            result: 'Q(0)=200.',
            interpretation:
                'O coeficiente externo continua representando o valor inicial.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Sinal do expoente',
            content:
                'Em Ce^(kt), k>0 representa crescimento contínuo e k<0 representa decaimento contínuo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confundir exponencial com polinômio',
            content:
                '2ˣ não é x². A posição da variável altera completamente a estrutura da função.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Usar base negativa em uma função exponencial real global',
            content:
                'Uma expressão como (−2)ˣ não define uma função real para todo x real.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Somar porcentagem ao valor inicial em todas as etapas',
            content:
                'Crescimento exponencial multiplica pelo mesmo fator; não adiciona a mesma quantidade absoluta em cada período.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Exercícios guiados e prática',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado',
            problem: 'Resolva 5^(2x−1)=125.',
            steps: [
              'Escreva 125=5³.',
              'Iguale expoentes: 2x−1=3.',
              '2x=4.',
            ],
            result: 'x=2.',
            interpretation:
                'A mesma base transforma a equação exponencial em uma equação linear.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Prática antes da atividade final',
            content:
                '1. Classifique 3ˣ como crescimento ou decaimento.\n'
                '2. Classifique (1/4)ˣ.\n'
                '3. Determine domínio e imagem de 2ˣ.\n'
                '4. Calcule 2⁻³.\n'
                '5. Resolva 3^(x+1)=27.\n'
                '6. Resolva 4^(2x)=16.\n'
                '7. Determine a assíntota de 5ˣ−2.\n'
                '8. Descreva 2·3^(x−4)+1.\n'
                '9. Modele crescimento anual de 6% com valor inicial 1000.\n'
                '10. Modele decaimento anual de 12% com valor inicial 500.\n'
                '11. Explique por que aˣ nunca vale zero.\n'
                '12. Compare x³ e 3ˣ.\n'
                '13. Explique o papel de P₀ em P(t)=P₀aᵗ.\n'
                '14. Classifique e^(−0,5t).\n'
                '15. Explique por que e é especial no Cálculo.',
            emphasis:
                'Em modelos, identifique explicitamente valor inicial, taxa e fator multiplicativo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Exponenciais conectam crescimento e derivada',
            content:
                'A derivada mede taxa instantânea. Em eˣ, a taxa instantânea é proporcional ao próprio valor da função, tornando essa função central em equações diferenciais, juros contínuos e modelos naturais.',
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
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para funções exponenciais, modelos e número e.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual função representa decaimento exponencial?',
      choices: ['2ˣ', '(1/2)ˣ', 'x²'],
      correctIndex: 1,
      explanation:
          'Uma base estritamente entre 0 e 1 produz uma função exponencial decrescente.',
    ),
    takeaways: [
      'Na função exponencial, a variável está no expoente.',
      'A base deve ser positiva e diferente de 1.',
      'O domínio básico é ℝ e a imagem é (0,+∞).',
      'Base maior que 1 produz crescimento; base entre 0 e 1 produz decaimento.',
      'Transformações deslocam a assíntota horizontal.',
      'Modelos exponenciais usam fatores multiplicativos constantes.',
      'O número e é a base natural do Cálculo.',
    ],
    closing:
        'Funções exponenciais descrevem processos em que mudanças proporcionais se acumulam multiplicativamente.',
  ),
  CourseLessonData(
    id: 'funcoes-07-logaritmos',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Funções clássicas',
    title: 'Funções logarítmicas',
    description:
        'definição, domínio, propriedades, mudança de base, equações, inequações e logaritmo natural',
    duration: '≈ 38 min',
    objective:
        'interpretar logaritmos como expoentes, relacionar funções logarítmicas e exponenciais como inversas, usar propriedades com condições de validade e resolver equações e inequações logarítmicas com controle de domínio',
    symbol: 'logₐx',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definição fundamental',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Logaritmo responde “qual expoente?”',
            content:
                'Para [[math:a>0]], [[math:a\\ne1]] e [[math:b>0]], a afirmação [[math:\\log_a b=c]] é equivalente a [[math:a^c=b]].',
            emphasis:
                'A base deve ser positiva e diferente de 1; o argumento deve ser positivo.',
          ),
          WorkedExampleBlockData(
            title: 'Passando de logaritmo para potência',
            problem: 'Calcule log₂(32).',
            steps: [
              'Pergunte: 2 elevado a qual expoente produz 32?',
              'Como 2⁵=32, o expoente procurado é 5.',
            ],
            result: 'log₂(32)=5.',
            interpretation:
                'O logaritmo é o expoente necessário para produzir o argumento.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Função logarítmica como inversa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Exponencial e logaritmo desfazem uma à outra',
            content:
                'Se [[math:f(x)=a^x]], então sua inversa é [[math:f^{-1}(x)=\\log_a x]]. Assim, [[math:\\log_a(a^x)=x]] e [[math:a^{\\log_a x}=x]] para x no domínio adequado.',
            emphasis:
                'Os gráficos são simétricos em relação à reta y=x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Domínio, imagem e assíntota',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'O argumento precisa ser positivo',
            content:
                'Para f(x)=logₐx, o domínio é (0,+∞) e a imagem é ℝ. Como logₐ1=0, o gráfico passa por (1,0). A reta x=0 é assíntota vertical.',
            emphasis:
                'Nenhum logaritmo real de zero ou de número negativo está definido.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Crescimento e decaimento',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'A base controla a monotonicidade',
            content:
                'Se a>1, logₐx é crescente. Se 0<a<1, logₐx é decrescente.',
            emphasis:
                'A monotonicidade do logaritmo acompanha a monotonicidade de sua exponencial inversa.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Propriedade do produto',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Produto vira soma',
            content:
                'Quando x>0 e y>0, [[math:\\log_a(xy)=\\log_a x+\\log_a y]].',
            emphasis:
                'A propriedade exige argumentos positivos.',
          ),
          WorkedExampleBlockData(
            title: 'Expandindo um produto',
            problem: 'Expanda log₂(8x), supondo x>0.',
            steps: [
              'Separe o produto.',
              'log₂(8x)=log₂8+log₂x.',
              'Como log₂8=3, simplifique.',
            ],
            result: 'log₂(8x)=3+log₂x.',
            interpretation:
                'A propriedade transforma multiplicação em adição.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Propriedade do quociente',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Quociente vira diferença',
            content:
                'Para x>0 e y>0, [[math:\\log_a(x/y)=\\log_a x-\\log_a y]].',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Propriedade da potência',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Expoente vem para a frente',
            content:
                'Quando a expressão está definida, [[math:\\log_a(x^r)=r\\log_a x]]. Em aplicações reais, é preciso verificar que o argumento original e a forma transformada fazem sentido.',
            emphasis:
                'Propriedades logarítmicas são consequências das leis de expoentes.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'O que não é propriedade',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Logaritmo não distribui sobre soma',
            content:
                'Em geral, [[math:\\log_a(x+y)\\ne\\log_a x+\\log_a y]]. Também não existe regra análoga para diferença.',
            emphasis:
                'As propriedades básicas envolvem produto, quociente e potência, não soma.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Mudança de base',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Converta para uma base conveniente',
            content:
                'Para bases válidas, [[math:\\log_a x=\\frac{\\log_b x}{\\log_b a}]]. Em calculadoras, b costuma ser 10 ou e.',
            emphasis:
                'A fórmula permite calcular logaritmos em bases que a calculadora não oferece diretamente.',
          ),
          WorkedExampleBlockData(
            title: 'Mudando para logaritmo natural',
            problem: 'Escreva log₂7 usando ln.',
            steps: [
              'Use a fórmula de mudança de base.',
            ],
            result: '[[math:\\log_2 7=\\frac{\\ln7}{\\ln2}]].',
            interpretation:
                'Qualquer base válida pode ser convertida para outra.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Logaritmo natural',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'ln x = logₑx',
            content:
                'O logaritmo natural é [[math:\\ln x=\\log_e x]]. Como é inverso de eˣ, satisfaz [[math:\\ln(e^x)=x]] e [[math:e^{\\ln x}=x]] para x>0.',
            emphasis:
                'ln é a função logarítmica central no Cálculo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Equações logarítmicas',
        blocks: [
          WorkedExampleBlockData(
            title: 'Conversão direta',
            problem: 'Resolva log₂(x−1)=3.',
            steps: [
              'Condição de domínio: x−1>0, então x>1.',
              'Converta: x−1=2³.',
              'x−1=8.',
              'x=9.',
              'Verifique x>1.',
            ],
            result: 'S={9}.',
            interpretation:
                'O domínio deve ser controlado antes e depois da resolução.',
          ),
          WorkedExampleBlockData(
            title: 'Usando propriedades',
            problem: 'Resolva ln x+ln(x−3)=ln4.',
            steps: [
              'Domínio: x>3.',
              'Combine: ln[x(x−3)]=ln4.',
              'Pela injetividade de ln: x(x−3)=4.',
              'Resolva x²−3x−4=0.',
              'Candidatos: x=4 e x=−1.',
              'O domínio elimina x=−1.',
            ],
            result: 'S={4}.',
            interpretation:
                'Manipulações logarítmicas não substituem a verificação do domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Equações exponenciais com logaritmos',
        blocks: [
          WorkedExampleBlockData(
            title: 'Isolando um expoente',
            problem: 'Resolva 3ˣ=7.',
            steps: [
              'Aplique ln aos dois membros.',
              'ln(3ˣ)=ln7.',
              'Use a propriedade da potência: x·ln3=ln7.',
              'Divida por ln3.',
            ],
            result: '[[math:x=\\frac{\\ln7}{\\ln3}]].',
            interpretation:
                'Logaritmos transformam o expoente desconhecido em fator.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Inequações logarítmicas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Monotonicidade decide o sentido',
            content:
                'Se a>1, logₐ preserva a ordem. Se 0<a<1, logₐ inverte a ordem porque a função é decrescente.',
            emphasis:
                'Além da ordem, mantenha sempre a condição argumento>0.',
          ),
          WorkedExampleBlockData(
            title: 'Base maior que 1',
            problem: 'Resolva log₂(x−1)>3.',
            steps: [
              'Domínio: x>1.',
              'Como 2>1, preserve o sentido.',
              'x−1>2³.',
            ],
            result: 'x>9.',
            interpretation:
                'A monotonicidade crescente permite comparar argumentos diretamente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Aceitar argumento zero ou negativo',
            content:
                'No conjunto dos reais, logₐu exige u>0.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Inventar propriedade da soma',
            content:
                'log(x+y) não pode ser separado em log x+log y.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Esquecer que bases menores que 1 são decrescentes',
            content:
                'Ao resolver inequações, isso pode inverter o sentido da comparação.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Exercícios guiados e prática',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado',
            problem: 'Resolva log₃(2x−1)=2.',
            steps: [
              'Domínio: 2x−1>0.',
              'Converta: 2x−1=3².',
              '2x−1=9.',
            ],
            result: 'x=5.',
            interpretation:
                'A solução respeita o domínio x>1/2.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Prática antes da atividade final',
            content:
                '1. Calcule log₂8.\n'
                '2. Calcule log₁₀0,01.\n'
                '3. Converta log₃81=4 para forma exponencial.\n'
                '4. Determine domínio e imagem de ln x.\n'
                '5. Expanda log(xy).\n'
                '6. Expanda log(x/y).\n'
                '7. Expanda log(x³).\n'
                '8. Explique por que log(x+y) não separa.\n'
                '9. Escreva log₅7 usando ln.\n'
                '10. Resolva log₂(x+4)=5.\n'
                '11. Resolva ln x=2.\n'
                '12. Resolva 5ˣ=11 usando ln.\n'
                '13. Resolva log₂(x−1)>2.\n'
                '14. Resolva log_(1/2)(x)>1, considerando domínio e monotonicidade.\n'
                '15. Explique por que ln aparece naturalmente em derivadas.',
            emphasis:
                'Antes de resolver qualquer equação logarítmica, escreva explicitamente as condições de domínio.',
          ),
        ],
      ),
      LessonSectionData(
        number: '16',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'ln transforma multiplicação em adição e expoentes em fatores',
            content:
                'No Cálculo, ln simplifica diferenciação de produtos, quocientes e potências por meio da diferenciação logarítmica. Além disso, a derivada de ln x é 1/x para x>0.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '17',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para logaritmos, inversas, equações e aplicações em Cálculo.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'log₁₀(1000) vale:',
      choices: ['2', '3', '10'],
      correctIndex: 1,
      explanation:
          'Como 10³=1000, o expoente necessário é 3; portanto log₁₀(1000)=3.',
    ),
    takeaways: [
      'Logaritmo é o expoente necessário para produzir um número.',
      'A função logarítmica é inversa da exponencial de mesma base.',
      'O domínio logarítmico exige argumento positivo.',
      'Produto, quociente e potência geram propriedades específicas.',
      'Não existe propriedade logarítmica para soma.',
      'Mudança de base permite calcular qualquer base válida.',
      'ln é o logaritmo de base e e é central no Cálculo.',
      'Equações e inequações logarítmicas exigem controle de domínio.',
    ],
    closing:
        'Logaritmos transformam relações multiplicativas em relações aditivas e fornecem a linguagem inversa natural das funções exponenciais.',
  ),
  CourseLessonData(
    id: 'funcoes-08-radianos-circulo',
    topicId: 'funcoes',
    trailTitle: 'Funções — Pré-Cálculo',
    eyebrow: 'Trigonometria',
    title: 'Radianos e círculo trigonométrico',
    description:
        'medida angular, comprimento de arco, círculo unitário, quadrantes, ângulos notáveis e periodicidade',
    duration: '≈ 38 min',
    objective:
        'compreender radianos como razão entre arco e raio, converter medidas angulares, usar o círculo unitário para definir seno e cosseno, determinar sinais por quadrante e obter valores exatos em ângulos notáveis',
    symbol: 'θ=s/r',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'O que é um radiano',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Ângulo como razão entre arco e raio',
            content:
                'Se um arco de comprimento s é subtendido em uma circunferência de raio r, a medida do ângulo central em radianos é [[math:\\theta=\\frac{s}{r}]].',
            emphasis:
                'Radiano é uma medida adimensional: comprimento dividido por comprimento.',
          ),
          WorkedExampleBlockData(
            title: 'Um radiano',
            problem: 'Quando um ângulo mede exatamente 1 radiano?',
            steps: [
              'Use θ=s/r.',
              'Se s=r, então θ=r/r=1.',
            ],
            result: '1 rad corresponde ao ângulo que subtende um arco de comprimento igual ao raio.',
            interpretation:
                'A definição nasce diretamente da geometria da circunferência.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Uma volta completa',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: '2π rad = 360°',
            content:
                'Em uma circunferência completa, s=2πr. Portanto [[math:\\theta=\\frac{2\\pi r}{r}=2\\pi]]. Assim, uma volta mede 2π radianos.',
            emphasis:
                'Daí seguem π rad=180°, π/2=90° e π/4=45°.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Conversão entre graus e radianos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Use a equivalência π rad = 180°',
            content:
                'Para converter graus em radianos, multiplique por π/180. Para converter radianos em graus, multiplique por 180/π.',
          ),
          WorkedExampleBlockData(
            title: 'Graus para radianos',
            problem: 'Converta 150° para radianos.',
            steps: [
              '150·π/180.',
              'Simplifique 150/180=5/6.',
            ],
            result: '150°=5π/6.',
            interpretation:
                'A fração de π preserva a medida exata do ângulo.',
          ),
          WorkedExampleBlockData(
            title: 'Radianos para graus',
            problem: 'Converta 7π/4 para graus.',
            steps: [
              'Multiplique por 180/π.',
              '(7π/4)·(180/π)=7·45.',
            ],
            result: '7π/4=315°.',
            interpretation:
                'O fator π cancela naturalmente.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Comprimento de arco',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 's=rθ exige θ em radianos',
            content:
                'Da definição θ=s/r obtemos [[math:s=r\\theta]]. Esta forma simples só é válida quando θ está em radianos.',
            emphasis:
                'Usar graus diretamente em s=rθ produz resultado incorreto.',
          ),
          WorkedExampleBlockData(
            title: 'Arco em uma circunferência',
            problem: 'Encontre o comprimento do arco de raio 6 e ângulo π/3.',
            steps: [
              'Use s=rθ.',
              's=6·π/3.',
            ],
            result: 's=2π.',
            interpretation:
                'O resultado tem unidade de comprimento, não de ângulo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Círculo unitário',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Raio igual a 1',
            content:
                'O círculo unitário é a circunferência [[math:x^2+y^2=1]]. Um ângulo θ, medido a partir do eixo x positivo, determina um ponto P sobre o círculo.',
            emphasis:
                'O círculo unitário transforma ângulos em coordenadas.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Seno e cosseno como coordenadas',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'P(θ)=(cosθ,senθ)',
            content:
                'No círculo unitário, o ponto associado ao ângulo θ possui coordenadas [[math:P(\\theta)=(\\cos\\theta,\\sin\\theta)]].',
            emphasis:
                'Cosseno é a coordenada x; seno é a coordenada y.',
          ),
          WorkedExampleBlockData(
            title: 'Ângulo de π/2',
            problem: 'Determine seno e cosseno de π/2.',
            steps: [
              'π/2 corresponde ao topo do círculo unitário.',
              'O ponto é (0,1).',
            ],
            result: 'cos(π/2)=0 e sen(π/2)=1.',
            interpretation:
                'As coordenadas geométricas fornecem diretamente os valores trigonométricos.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Quadrantes e sinais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Os sinais vêm das coordenadas',
            content:
                'No quadrante I, seno e cosseno são positivos. No II, seno positivo e cosseno negativo. No III, ambos negativos. No IV, seno negativo e cosseno positivo.',
            emphasis:
                'Não é necessário decorar sinais isoladamente: leia x e y no plano cartesiano.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Ângulos de referência',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Reduza a um ângulo agudo conhecido',
            content:
                'O ângulo de referência é o menor ângulo positivo entre o lado terminal e o eixo x. Ele permite usar valores conhecidos do primeiro quadrante e depois ajustar apenas os sinais.',
          ),
          WorkedExampleBlockData(
            title: 'Segundo quadrante',
            problem: 'Determine sen(5π/6) e cos(5π/6).',
            steps: [
              '5π/6 está no quadrante II.',
              'O ângulo de referência é π/6.',
              'No quadrante II, seno é positivo e cosseno negativo.',
            ],
            result: 'sen(5π/6)=1/2 e cos(5π/6)=−√3/2.',
            interpretation:
                'Os valores absolutos vêm do ângulo de referência; os sinais vêm do quadrante.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Ângulos notáveis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.table,
            title: '0, π/6, π/4, π/3 e π/2',
            content:
                'No primeiro quadrante: cos0=1 e sen0=0; cos(π/6)=√3/2 e sen(π/6)=1/2; cos(π/4)=sen(π/4)=√2/2; cos(π/3)=1/2 e sen(π/3)=√3/2; cos(π/2)=0 e sen(π/2)=1.',
            emphasis:
                'Esses valores se estendem aos outros quadrantes por simetria e sinais.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'De onde vêm os valores exatos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Triângulos 45°–45°–90° e 30°–60°–90°',
            content:
                'Os valores √2/2, 1/2 e √3/2 não são arbitrários. Eles vêm das razões geométricas dos triângulos especiais inscritos ou associados ao círculo unitário.',
            emphasis:
                'Entender a origem é mais robusto que memorizar uma tabela sem estrutura.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Ângulos coterminais',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Mesmo ponto terminal',
            content:
                'Ângulos que diferem por múltiplos inteiros de 2π terminam no mesmo ponto do círculo: [[math:\\theta+2k\\pi]], com k inteiro.',
            emphasis:
                'Seno e cosseno têm período 2π.',
          ),
          WorkedExampleBlockData(
            title: 'Reduzindo uma volta extra',
            problem: 'Localize 13π/6 no círculo.',
            steps: [
              'Subtraia 2π=12π/6.',
              '13π/6−12π/6=π/6.',
            ],
            result: '13π/6 é coterminal com π/6.',
            interpretation:
                'Os dois ângulos possuem o mesmo seno e o mesmo cosseno.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Ângulos negativos',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Sentido horário',
            content:
                'Ângulos positivos são medidos no sentido anti-horário; ângulos negativos, no sentido horário.',
            emphasis:
                'O círculo trigonométrico representa naturalmente qualquer ângulo real.',
          ),
          WorkedExampleBlockData(
            title: 'Ângulo negativo',
            problem: 'Determine um ângulo positivo coterminal com −π/3.',
            steps: [
              'Some 2π.',
              '−π/3+2π=−π/3+6π/3.',
            ],
            result: '5π/3.',
            interpretation:
                '−π/3 e 5π/3 determinam o mesmo ponto no círculo.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Tangente no círculo unitário',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'tanθ=senθ/cosθ',
            content:
                'Sempre que cosθ≠0, [[math:\\tan\\theta=\\frac{\\sin\\theta}{\\cos\\theta}]]. Portanto, tangente não está definida nos pontos onde a coordenada x do círculo é zero.',
            emphasis:
                'Isso ocorre em π/2+kπ.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Erros frequentes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Usar graus em fórmulas próprias de radianos',
            content:
                's=rθ e os limites trigonométricos fundamentais pressupõem θ em radianos.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Trocar seno e cosseno',
            content:
                'No círculo unitário, cosseno corresponde à coordenada x e seno à coordenada y.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignorar o quadrante',
            content:
                'O ângulo de referência determina o valor absoluto, mas o quadrante determina o sinal.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Exercícios guiados',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guiado 1 — conversão',
            problem: 'Converta 225° para radianos.',
            steps: [
              '225·π/180.',
              'Simplifique por 45.',
            ],
            result: '225°=5π/4.',
            interpretation:
                'O ângulo está no quadrante III.',
          ),
          WorkedExampleBlockData(
            title: 'Guiado 2 — valores exatos',
            problem: 'Determine sen(7π/4) e cos(7π/4).',
            steps: [
              '7π/4 está no quadrante IV.',
              'Ângulo de referência: π/4.',
              'No IV, seno é negativo e cosseno positivo.',
            ],
            result: 'sen(7π/4)=−√2/2 e cos(7π/4)=√2/2.',
            interpretation:
                'A simetria evita memorizar uma tabela para cada quadrante.',
          ),
        ],
      ),
      LessonSectionData(
        number: '16',
        title: 'Prática antes da atividade final',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Converta, localize e calcule',
            content:
                '1. Converta 30° para radianos.\n'
                '2. Converta 300° para radianos.\n'
                '3. Converta 3π/4 para graus.\n'
                '4. Converta 11π/6 para graus.\n'
                '5. Calcule o arco para r=4 e θ=π/2.\n'
                '6. Determine sen0 e cos0.\n'
                '7. Determine sen(π/3) e cos(π/3).\n'
                '8. Determine sen(3π/4) e cos(3π/4).\n'
                '9. Determine sen(4π/3) e cos(4π/3).\n'
                '10. Encontre um ângulo coterminal com 17π/6 em [0,2π).\n'
                '11. Encontre um ângulo positivo coterminal com −5π/4.\n'
                '12. Determine tan(π/4).\n'
                '13. Explique por que tan(π/2) não existe.\n'
                '14. Explique geometricamente por que sen²θ+cos²θ=1.\n'
                '15. Explique por que radianos são mais naturais que graus em Cálculo.',
            emphasis:
                'Mantenha valores exatos com π e radicais; evite aproximações decimais desnecessárias.',
          ),
        ],
      ),
      LessonSectionData(
        number: '17',
        title: 'Conexão com Cálculo',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Radianos fazem os limites trigonométricos assumirem sua forma natural',
            content:
                'O limite fundamental [[math:\\lim_{x\\to0}\\frac{\\sin x}{x}=1]] é verdadeiro nessa forma quando x está em radianos. Essa escolha elimina fatores artificiais nas derivadas de seno e cosseno.',
            emphasis:
                'Por isso, fórmulas como d(sen x)/dx=cos x pressupõem radianos.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '18',
        title: 'Referências e síntese',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Base acadêmica',
            content:
                'Referências: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart e Thomas para radianos, círculo unitário e limites trigonométricos.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Qual é a medida em radianos de 90°?',
      choices: ['π/4', 'π/2', 'π'],
      correctIndex: 1,
      explanation:
          '90° é um quarto de uma volta completa. Como uma volta mede 2π, um quarto mede π/2.',
    ),
    takeaways: [
      'Radianos medem ângulos pela razão entre arco e raio.',
      'Uma volta completa mede 2π radianos.',
      'No círculo unitário, cosθ é x e senθ é y.',
      'Quadrantes determinam os sinais de seno e cosseno.',
      'Ângulos de referência reduzem cálculos a valores notáveis.',
      'Ângulos coterminais diferem por múltiplos de 2π.',
      'Tangente é senθ/cosθ quando cosθ≠0.',
      'Radianos são essenciais para a formulação natural do Cálculo.',
    ],
    closing:
        'O círculo trigonométrico transforma ângulos em coordenadas e cria a linguagem geométrica que sustentará todas as funções trigonométricas.',
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
        'predict and justify graph transformations from algebraic changes, distinguish internal from external transformations, and track their effects on points, domain, and range',
    symbol: 'a·f(b(x−h))+k',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Start from a reference function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Transforming reuses a known graph',
            content:
                'Start with y=f(x) and create new functions by changing inputs and outputs. The general form [[math:y=a\,f(b(x-h))+k]] combines translations, reflections, and scaling.',
            emphasis:
                'Transformations let you predict geometry without reconstructing every point from scratch.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Vertical translation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'f(x)+k',
            content:
                'Adding k outside the function changes every output: k>0 moves the graph upward and k<0 moves it downward.',
            emphasis:
                'The domain stays the same while the range is shifted vertically.',
          ),
          WorkedExampleBlockData(
            title: 'Vertical shift',
            problem: 'Compare y=x² and y=x²−3.',
            steps: [
              'Every output of x² is reduced by 3.',
              'The vertex moves from (0,0) to (0,−3).',
            ],
            result: 'The graph moves 3 units downward.',
            interpretation:
                'An external transformation acts directly on y-values.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Horizontal translation',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'f(x−h)',
            content:
                'Replacing x by x−h shifts the graph h units to the right; replacing x by x+h shifts it h units to the left.',
            emphasis:
                'The horizontal sign appears reversed because we change the input needed to reproduce the same output.',
          ),
          WorkedExampleBlockData(
            title: 'Why x−3 moves right',
            problem: 'Compare f(x)=x² and g(x)=(x−3)².',
            steps: [
              'For f, the minimum occurs at x=0.',
              'For g, the same minimum occurs when x−3=0.',
              'Therefore x=3.',
            ],
            result: 'The vertex moves to (3,0).',
            interpretation:
                'The inside equation shows where each feature of the original graph reappears.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Reflections',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: '−f(x) and f(−x) are different',
            content:
                '−f(x) sends every output y to −y and reflects the graph across the x-axis. f(−x) changes inputs and reflects the graph across the y-axis.',
            emphasis:
                'External changes affect outputs; internal changes affect inputs.',
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
                'Multiplying the function by a multiplies all y-coordinates by a. If |a|>1 there is vertical stretching; if 0<|a|<1 there is vertical compression; if a<0 there is also reflection across the x-axis.',
          ),
          WorkedExampleBlockData(
            title: 'Stretching and reflection',
            problem: 'Describe y=−2x² from y=x².',
            steps: [
              'The factor 2 doubles each vertical distance from the x-axis.',
              'The negative sign reflects the graph across the x-axis.',
            ],
            result: 'A narrower parabola opening downward.',
            interpretation:
                'Scaling and reflection can occur at the same time.',
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
                'The transformation f(bx) changes the horizontal scale by the factor 1/|b|. If |b|>1, the graph is horizontally compressed; if 0<|b|<1, it is stretched. If b<0, there is also reflection across the y-axis.',
            emphasis:
                'Internal scaling uses the reciprocal factor.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Combined transformations',
        blocks: [
          WorkedExampleBlockData(
            title: 'Reading a complete transformed form',
            problem: 'Describe y=−2(x−3)²+1 starting from y=x².',
            steps: [
              'x−3 shifts 3 units to the right.',
              '−2 reflects across the x-axis and stretches vertically by 2.',
              '+1 shifts the graph 1 unit upward.',
            ],
            result: 'Vertex (3,1), opening downward, with vertical stretch factor 2.',
            interpretation:
                'The algebraic form encodes position, orientation, and scale.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Transforming known points',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Track a reference point',
            content:
                'If (u,v) lies on y=f(x), then for y=a·f(b(x−h))+k the corresponding point satisfies x=h+u/b and y=av+k.',
            emphasis:
                'This method lets you reconstruct a transformed graph from a few notable points.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Effect on domain and range',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Transformations move sets too',
            content:
                'Horizontal translations transform the domain through the input geometry. Vertical transformations act on the range. Reflections and scaling can reverse or resize these sets.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Reversing horizontal direction',
            content:
                'f(x−3) shifts right, not left.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing −f(x) with f(−x)',
            content:
                'The first reflects across the x-axis; the second reflects across the y-axis.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Using b directly as a horizontal scale factor',
            content:
                'In f(2x), the horizontal scale factor is 1/2, not 2.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Guided exercises and practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided example',
            problem: 'Describe y=3√(x+2)−4 starting from y=√x.',
            steps: [
              'x+2 shifts 2 units left.',
              '3 stretches vertically by 3.',
              '−4 shifts 4 units downward.',
            ],
            result: 'The starting point (0,0) moves to (−2,−4).',
            interpretation:
                'The domain also changes from [0,+∞) to [−2,+∞).',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Practice before the final activity',
            content:
                '1. Describe f(x)+5.\n'
                '2. Describe f(x−4).\n'
                '3. Describe f(x+2).\n'
                '4. Compare −f(x) and f(−x).\n'
                '5. Describe 3f(x).\n'
                '6. Describe f(2x).\n'
                '7. Describe −f(−x).\n'
                '8. Transform y=x² into y=(x+1)²−4.\n'
                '9. Describe y=−(x−2)²+5.\n'
                '10. Find the new domain of √(x−6).\n'
                '11. Find the range of 2x²+3.\n'
                '12. Track the point (1,1) under y=2f(x−3)+4.\n'
                '13. Explain why f(3x) compresses horizontally.\n'
                '14. Give an example where a reflection leaves the graph unchanged.\n'
                '15. Sketch a sequence of transformations of |x|.',
            emphasis:
                'Separate internal transformations from external ones before describing the graph.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Transformations preserve important structures',
            content:
                'In Calculus, transformed graphs help predict limits, continuity, and derivative behavior without restarting the analysis. Translations and scaling also appear in parametrized families.',
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
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart and Thomas for transformations and graph interpretation.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What does f(x+4) do to the graph of f(x)?',
      choices: ['Moves it 4 units left', 'Moves it 4 units right', 'Moves it 4 units up'],
      correctIndex: 0,
      explanation:
          'Replacing x by x+4 shifts the graph 4 units to the left.',
    ),
    takeaways: [
      'External transformations affect outputs.',
      'Internal transformations affect inputs.',
      'Horizontal translations have an apparently reversed sign.',
      'Reflections across x and y come from different operations.',
      'Internal scaling uses a reciprocal factor.',
      'Domain and range transform along with the graph.',
    ],
    closing:
        'Reading transformations directly from the formula turns graphing into a controlled sequence of geometric operations.',
  ),
  CourseLessonData(
    id: 'funcoes-04-polinomiais',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Classical functions',
    title: 'Polynomial functions',
    description:
        'degree, leading coefficient, zeros, multiplicity, end behavior, and graph interpretation',
    duration: '≈ 36 min',
    objective:
        'analyze polynomial functions using degree, leading coefficient, zeros, and multiplicities, connect algebraic forms to the graph, and predict end behavior',
    symbol: 'P(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definition of a polynomial function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Finite sum of nonnegative integer powers',
            content:
                'A polynomial function has the form [[math:P(x)=a_nx^n+a_{n-1}x^{n-1}+\cdots+a_1x+a_0]], where n is a nonnegative integer, the coefficients are real, and [[math:a_n\ne0]].',
            emphasis:
                'The natural domain of every real polynomial is ℝ.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Degree and leading coefficient',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'The dominant term',
            content:
                'The degree is the largest exponent with nonzero coefficient. The leading coefficient belongs to that term. For large |x|, the leading term controls global behavior.',
            emphasis:
                'Degree parity and the sign of the leading coefficient predict the graph ends.',
          ),
          WorkedExampleBlockData(
            title: 'Reading structure',
            problem: 'Analyze P(x)=−2x⁵+3x²−7.',
            steps: [
              'The largest exponent is 5.',
              'So the degree is 5.',
              'The leading coefficient is −2.',
            ],
            result: 'Degree 5 with leading coefficient −2.',
            interpretation:
                'Odd degree and negative leading coefficient produce opposite end directions with the right end falling.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'End behavior',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Degree parity and leading sign',
            content:
                'Even degree gives ends in the same direction; odd degree gives opposite directions. A positive leading coefficient points upward on the right; a negative one points downward.',
            emphasis:
                'This describes behavior as x→±∞, not every local feature.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Zeros and factors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Factor theorem',
            content:
                'If P(a)=0, then x−a is a factor of P(x). Conversely, if x−a is a factor, then a is a zero of the function.',
            emphasis:
                'Factored form directly connects algebra to x-intercepts.',
          ),
          WorkedExampleBlockData(
            title: 'Factored form',
            problem: 'Find the zeros of P(x)=(x−2)(x+1)(x−4).',
            steps: [
              'Set each factor equal to zero.',
              'Solve x−2=0, x+1=0, and x−4=0.',
            ],
            result: 'Zeros: −1, 2, and 4.',
            interpretation:
                'Each zero gives a potential x-axis intercept.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Multiplicity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Crossing or touching the axis',
            content:
                'If (x−a)^m is a factor, m is the multiplicity of root a. Odd multiplicity tends to produce a crossing; even multiplicity tends to produce contact without sign change.',
            emphasis:
                'Higher multiplicity typically makes the graph flatter near the root.',
          ),
          WorkedExampleBlockData(
            title: 'Different multiplicities',
            problem: 'Analyze P(x)=(x−2)²(x+1)³.',
            steps: [
              'x=2 has multiplicity 2.',
              'x=−1 has multiplicity 3.',
              'The sign does not change at x=2.',
              'The sign changes at x=−1.',
            ],
            result: 'The graph touches at x=2 and crosses at x=−1.',
            interpretation:
                'Multiplicity gives local graph information without many plotted points.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Y-intercept',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Compute P(0)',
            content:
                'The y-intercept occurs at x=0 and has value P(0)=a₀.',
            emphasis:
                'In expanded form, the constant term gives this intercept immediately.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Expanded form and factored form',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Different forms reveal different information',
            content:
                'Expanded form shows degree, coefficients, and y-intercept. Factored form shows zeros and multiplicities. Neither form is always superior.',
            emphasis:
                'Choosing a representation is part of the analysis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Possible number of real zeros',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'At most n distinct real zeros',
            content:
                'A nonzero polynomial of degree n has at most n distinct real zeros. It may have fewer because some roots are complex or repeated.',
            emphasis:
                'Degree 4 does not guarantee four real x-intercepts.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Symmetry in special cases',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Even and odd polynomials',
            content:
                'If P(−x)=P(x), the function is even and symmetric about the y-axis. If P(−x)=−P(x), it is odd and has origin symmetry.',
            emphasis:
                'A polynomial function may be neither even nor odd.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Structural sketch of a polynomial',
        blocks: [
          WorkedExampleBlockData(
            title: 'Combining the information',
            problem: 'Sketch P(x)=(x−2)²(x+1) qualitatively.',
            steps: [
              'Total degree 3 with positive leading coefficient.',
              'Left end down and right end up.',
              'Root −1 has multiplicity 1: cross the axis.',
              'Root 2 has multiplicity 2: touch and turn.',
              'P(0)=4, so the graph passes through (0,4).',
            ],
            result: 'The essential graph behavior is determined without a long value table.',
            interpretation:
                'The sketch combines global and local information.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing degree with number of terms',
            content:
                'x⁷+1 has only two terms but degree 7.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Assuming every root crosses the axis',
            content:
                'Even-multiplicity roots may only touch the x-axis.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Inferring the whole graph from the leading term',
            content:
                'The leading term controls the ends but not all zeros, local extrema, or interior geometry.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Guided exercises and practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided example',
            problem: 'Analyze P(x)=−(x−1)²(x+3).',
            steps: [
              'Degree 3 with negative leading coefficient.',
              'Roots: 1 with multiplicity 2 and −3 with multiplicity 1.',
              'P(0)=−3.',
            ],
            result: 'Cross at −3, touch at 1, and fall to the right.',
            interpretation:
                'These pieces are enough for a consistent qualitative sketch.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Practice before the final activity',
            content:
                '1. Find degree and leading coefficient of 4x⁶−x+1.\n'
                '2. Describe the end behavior of x⁵.\n'
                '3. Describe the end behavior of −x⁴.\n'
                '4. Find the zeros of (x−3)(x+2).\n'
                '5. Find multiplicities in (x−1)³(x+4)².\n'
                '6. Find the y-intercept of 2x³−5x+7.\n'
                '7. Compare expanded and factored forms.\n'
                '8. Sketch (x+2)²(x−1) qualitatively.\n'
                '9. Decide whether x⁴+2x²+1 is even.\n'
                '10. Decide whether x³−x is odd.\n'
                '11. Give a degree-4 polynomial with no real zeros.\n'
                '12. Explain why a real cubic has at least one real zero.\n'
                '13. Build a polynomial with roots 1 and −2, with 1 double.\n'
                '14. Explain how multiplicity affects sign.\n'
                '15. Build a sketch using only factors and the leading term.',
            emphasis:
                'For sketches, record end behavior, zeros, multiplicities, and y-intercept first.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Polynomials are a basic Calculus laboratory',
            content:
                'Polynomial functions are continuous and differentiable on all ℝ. The leading term appears in limits at infinity, while zeros and multiplicities support sign analysis and derivative studies.',
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
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart and Thomas for polynomial functions, zeros, and end behavior.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which is a zero of P(x)=(x−5)(x+2)?',
      choices: ['5', '2', '−5'],
      correctIndex: 0,
      explanation:
          'At x=5, the factor x−5 is zero, so P(5)=0.',
    ),
    takeaways: [
      'The natural domain of a real polynomial is ℝ.',
      'Degree and leading coefficient control end behavior.',
      'Zeros correspond to linear factors.',
      'Multiplicity controls sign changes and axis contact.',
      'Expanded and factored forms reveal different information.',
      'The leading term describes global behavior, not all local geometry.',
    ],
    closing:
        'Polynomial functions show how an algebraic expression can be read geometrically before many points are computed.',
  ),
  CourseLessonData(
    id: 'funcoes-05-racionais',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Classical functions',
    title: 'Rational functions and asymptotes',
    description:
        'domain, zeros, holes, vertical, horizontal, and slant asymptotes, signs, and end behavior',
    duration: '≈ 42 min',
    objective:
        'analyze rational functions through domain, zeros, factors, removable discontinuities, asymptotes, one-sided behavior, and behavior at infinity while preserving the distinction between the original function and a simplified expression',
    symbol: 'P(x)/Q(x)',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definition of a rational function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A quotient of polynomials',
            content:
                'A rational function has the form [[math:R(x)=\\frac{P(x)}{Q(x)}]], where P and Q are polynomials and Q is not the zero polynomial.',
            emphasis:
                'The natural domain excludes every value that makes Q(x)=0.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Rational does not merely mean “contains a fraction”',
            content:
                'The structural requirement is a quotient of polynomials. An expression such as √x/(x−1) is not rational because its numerator is not polynomial.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Domain and forbidden points',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Solve Q(x)=0 before simplifying',
            content:
                'Zeros of the original denominator are excluded from the domain. Record them before cancelling any common factors.',
            emphasis:
                'Algebraic simplification does not retroactively change the domain of the originally defined function.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Domain with a factorable denominator',
            problem: 'Find the domain of f(x)=(x+1)/(x²−9).',
            steps: [
              'Factor x²−9=(x−3)(x+3).',
              'The denominator is zero at x=3 and x=−3.',
            ],
            result: 'D_f=ℝ\{−3,3}.',
            interpretation:
                'Both points are excluded before any graph analysis.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Zeros of a rational function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'The numerator must vanish while the denominator does not',
            content:
                'A value a is a zero of R when P(a)=0 and Q(a)≠0. If numerator and denominator both vanish, common factors and the original domain must be examined.',
            emphasis:
                'A zero is an x-intercept; an excluded point is not.',
          ),
          WorkedExampleBlockData(
            title: 'An allowed zero',
            problem: 'Find the zeros of f(x)=(x−2)/(x+5).',
            steps: [
              'The numerator is zero at x=2.',
              'The denominator at x=2 equals 7, so it is nonzero.',
            ],
            result: 'The only zero is x=2.',
            interpretation:
                'The graph crosses the x-axis at (2,0).',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Common factors and removable discontinuities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Cancelling a factor does not fill a hole',
            content:
                'If numerator and denominator share a factor, the expression may be simplified for analysis, but the value excluded by the original denominator remains outside the domain.',
            emphasis:
                'The simplified expression and original function agree on the original domain but need not be the same function.',
            tone: LearningCardTone.warning,
          ),
          WorkedExampleBlockData(
            title: 'Identifying a hole',
            problem: 'Analyze f(x)=(x²−4)/(x−2).',
            steps: [
              'Factor x²−4=(x−2)(x+2).',
              'The original domain excludes x=2.',
              'For x≠2, simplify to x+2.',
              'The simplified expression would equal 4 at x=2.',
            ],
            result: 'The graph is y=x+2 with a hole at (2,4).',
            interpretation:
                'The discontinuity is removable because nearby behavior is finite although the original function is undefined at x=2.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Vertical asymptotes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'An uncancelled denominator approaches zero',
            content:
                'After common factors are simplified while preserving the original domain, remaining denominator zeros are candidates for vertical asymptotes when the function grows without bound nearby.',
            emphasis:
                'Not every original denominator zero becomes a vertical asymptote; cancelled factors produce holes.',
          ),
          WorkedExampleBlockData(
            title: 'Different one-sided behavior',
            problem: 'Analyze f(x)=1/(x−3) near x=3.',
            steps: [
              'As x→3⁻, x−3 is negative and very small.',
              'Thus f(x)→−∞.',
              'As x→3⁺, x−3 is positive and very small.',
              'Thus f(x)→+∞.',
            ],
            result: 'x=3 is a vertical asymptote.',
            interpretation:
                'The same vertical asymptote may have opposite one-sided signs.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Horizontal asymptotes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Compare the degrees of P and Q',
            content:
                'For R(x)=P(x)/Q(x): if deg(P)<deg(Q), the horizontal asymptote is y=0. If the degrees are equal, the horizontal asymptote is the ratio of leading coefficients.',
            emphasis:
                'These rules describe behavior as |x| becomes large.',
          ),
          WorkedExampleBlockData(
            title: 'Equal degrees',
            problem: 'Analyze end behavior of f(x)=(2x+1)/(x−3).',
            steps: [
              'Both numerator and denominator have degree 1.',
              'Their leading coefficients are 2 and 1.',
              'The ratio is 2.',
            ],
            result: 'Horizontal asymptote y=2.',
            interpretation:
                'For large |x|, the leading terms dominate the quotient.',
          ),
          WorkedExampleBlockData(
            title: 'Lower numerator degree',
            problem: 'Find the horizontal asymptote of g(x)=(3x−1)/(x²+4).',
            steps: [
              'The numerator has degree 1.',
              'The denominator has degree 2.',
            ],
            result: 'Horizontal asymptote y=0.',
            interpretation:
                'The denominator grows faster than the numerator.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'When there is no horizontal asymptote',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Higher numerator degree',
            content:
                'If deg(P)>deg(Q), there is no horizontal asymptote. Polynomial division may instead reveal a slant or higher-degree polynomial asymptote.',
            emphasis:
                '“No horizontal asymptote” does not mean “no asymptotic behavior.”',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Slant asymptotes',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'Degree difference equal to 1',
            content:
                'When deg(P)=deg(Q)+1, polynomial division gives [[math:R(x)=mx+b+\\frac{r(x)}{Q(x)}]], and the fractional term tends to zero at infinity. Thus y=mx+b is a slant asymptote.',
          ),
          WorkedExampleBlockData(
            title: 'Polynomial division',
            problem: 'Find the slant asymptote of f(x)=(x²+1)/(x−1).',
            steps: [
              'Divide x²+1 by x−1.',
              'Obtain x²+1=(x−1)(x+1)+2.',
              'So f(x)=x+1+2/(x−1).',
              'As |x|→∞, 2/(x−1)→0.',
            ],
            result: 'Slant asymptote y=x+1.',
            interpretation:
                'The graph approaches a tilted line rather than a horizontal one.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Intercepts and global sketching',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Combine independent pieces of information',
            content:
                'To sketch a rational function, combine domain, zeros, y-intercept, holes, vertical asymptotes, asymptotes at infinity, and signs on intervals.',
            emphasis:
                'No single feature determines the full graph.',
          ),
          WorkedExampleBlockData(
            title: 'Complete structural analysis',
            problem: 'Analyze f(x)=(2x+1)/(x−3).',
            steps: [
              'Domain: x≠3.',
              'Zero: x=−1/2.',
              'Y-intercept: f(0)=−1/3.',
              'Vertical asymptote: x=3.',
              'Horizontal asymptote: y=2.',
            ],
            result: 'A consistent sketch must respect all of these features.',
            interpretation:
                'The rational form reveals substantial geometry before additional plotting.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'A function may cross a horizontal asymptote',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'An asymptote is not a wall',
            content:
                'A horizontal asymptote describes behavior as x→±∞. The graph may cross that line at finite x-values.',
            emphasis:
                'Non-crossing is not part of the definition of an asymptote.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Sign of a rational function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Zeros and excluded points split the real line',
            content:
                'To determine where R(x)>0 or R(x)<0, factor numerator and denominator, mark zeros and forbidden points, and analyze the sign on each interval.',
            emphasis:
                'This is the same structure used in rational inequalities and later in derivative sign charts.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Turning every denominator zero into an asymptote',
            content:
                'If the factor cancels, the result may be only a hole.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting the domain after cancellation',
            content:
                'The value excluded by the original denominator remains excluded.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Using horizontal-asymptote rules when numerator degree is larger',
            content:
                'In that case polynomial division must be examined.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — hole and asymptote',
            problem: 'Analyze f(x)=(x²−1)/(x²−x).',
            steps: [
              'Factor: (x−1)(x+1)/[x(x−1)].',
              'Original domain: x≠0 and x≠1.',
              'For x≠0,1, simplify to (x+1)/x.',
              'x=1 creates a hole.',
              'x=0 remains an uncancelled denominator zero.',
            ],
            result: 'Hole at (1,2) and vertical asymptote x=0.',
            interpretation:
                'Two original denominator zeros can produce different phenomena.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — horizontal asymptote',
            problem: 'Find the horizontal asymptote of (5x²−1)/(2x²+3x).',
            steps: [
              'Both degrees equal 2.',
              'The ratio of leading coefficients is 5/2.',
            ],
            result: 'y=5/2.',
            interpretation:
                'Lower-degree terms do not change the limit at infinity.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Analyze before sketching',
            content:
                '1. Find the domain of 1/(x−4).\n'
                '2. Find the domain of (x+1)/(x²−9).\n'
                '3. Find the zeros of (x−2)/(x+5).\n'
                '4. Analyze (x²−4)/(x−2) and locate the hole.\n'
                '5. Find the vertical asymptote of 1/(x+3).\n'
                '6. Describe the one-sided limits of 1/(x−2).\n'
                '7. Find the horizontal asymptote of (3x+1)/(2x−5).\n'
                '8. Find the horizontal asymptote of x/(x²+1).\n'
                '9. Decide whether (x²+1)/(x−1) has a horizontal asymptote.\n'
                '10. Find its slant asymptote.\n'
                '11. Explain why a cancelled factor does not restore the domain.\n'
                '12. Give an example with both a hole and a vertical asymptote.\n'
                '13. Determine where (x−1)/(x+2)>0.\n'
                '14. Explain why a function can cross its horizontal asymptote.\n'
                '15. Perform a complete structural analysis of (x+2)/(x−1).',
            emphasis:
                'Record domain, zeros, holes, and asymptotes separately before sketching.',
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Connection to limits and continuity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Asymptotes are limit language',
            content:
                'Vertical asymptotes describe behavior near finite inputs; horizontal and slant asymptotes describe behavior as x→±∞. Holes anticipate removable discontinuities.',
            emphasis:
                'This lesson is direct preparation for limits and continuity.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '16',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart, Thomas, and Guidorizzi for rational functions, asymptotes, limits, and continuity.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'For (x²−4)/(x−2), what occurs at x=2?',
      choices: [
        'There is a vertical asymptote',
        'There is a removable discontinuity',
        'The function has a zero at x=2',
      ],
      correctIndex: 1,
      explanation:
          'The factor x−2 cancels algebraically, but x=2 remains outside the original domain. The graph has a hole at the corresponding point.',
    ),
    takeaways: [
      'Rational functions are quotients of polynomials.',
      'Zeros of the original denominator are excluded from the domain.',
      'Cancelled factors may create removable discontinuities.',
      'Uncancelled denominator factors may produce vertical asymptotes.',
      'Degrees determine much of the behavior at infinity.',
      'Polynomial division may reveal slant asymptotes.',
      'Asymptotes describe trends rather than barriers.',
      'Domain, zeros, signs, and asymptotes should be analyzed together.',
    ],
    closing:
        'Rational functions are the first major meeting point of algebra, geometry, and limiting behavior.',
  ),
  CourseLessonData(
    id: 'funcoes-06-exponenciais',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Classical functions',
    title: 'Exponential functions',
    description:
        'definition, domain, range, growth, decay, transformations, models, and the number e',
    duration: '≈ 36 min',
    objective:
        'analyze exponential functions from their base, determine domain and range, interpret growth and decay, solve simple models, and understand the special role of e',
    symbol: 'aˣ',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Definition of an exponential function',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'The variable is in the exponent',
            content:
                'A basic exponential function has the form [[math:f(x)=a^x]], with [[math:a>0]] and [[math:a\\ne1]]. A positive base gives real values for every real x, while a=1 would produce a constant function.',
            emphasis:
                'In x² the variable is the base; in 2ˣ the variable is the exponent.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Domain, range, and intercept',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Basic graph structure',
            content:
                'For f(x)=aˣ with a>0 and a≠1, the domain is ℝ, the range is (0,+∞), and f(0)=1. Every basic exponential graph passes through (0,1).',
            emphasis:
                'An exponential function never equals zero.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Exponential growth',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Base greater than 1',
            content:
                'If a>1, then aˣ is increasing. Equal increments in x multiply outputs by constant ratios.',
            emphasis:
                'Exponential growth is characterized by constant multiplicative factors over equal input increments.',
          ),
          WorkedExampleBlockData(
            title: 'Doubling each unit',
            problem: 'Let P(t)=100·2ᵗ. Compute P(3).',
            steps: [
              'Substitute t=3.',
              'P(3)=100·2³.',
              '2³=8.',
            ],
            result: 'P(3)=800.',
            interpretation:
                'The quantity doubles every unit of time.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Exponential decay',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Base between 0 and 1',
            content:
                'If 0<a<1, then aˣ is decreasing. Because [[math:a^x=(1/b)^x=b^{-x}]] for b>1, decay can be viewed as growth reflected across the y-axis.',
            emphasis:
                'The function remains positive for all real x.',
          ),
          WorkedExampleBlockData(
            title: 'Halving each step',
            problem: 'Let M(t)=80·(1/2)ᵗ. Compute M(3).',
            steps: [
              'Substitute t=3.',
              '(1/2)³=1/8.',
              '80·1/8=10.',
            ],
            result: 'M(3)=10.',
            interpretation:
                'The quantity is halved every unit of time.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Horizontal asymptote',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'y=0 for the basic exponential',
            content:
                'For a>1, aˣ→0 as x→−∞. For 0<a<1, aˣ→0 as x→+∞. Thus y=0 is the horizontal asymptote of the basic exponential.',
            emphasis:
                'The graph approaches the x-axis without touching it.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Exponential transformations',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'The form C·a^(x−h)+k',
            content:
                'In [[math:f(x)=C\\,a^{x-h}+k]], h shifts horizontally, k shifts vertically, and C scales or reflects vertically.',
            emphasis:
                'The horizontal asymptote moves from y=0 to y=k.',
          ),
          WorkedExampleBlockData(
            title: 'Reading a transformation',
            problem: 'Analyze f(x)=3·2^(x−1)−4.',
            steps: [
              'x−1 shifts right by 1.',
              'The factor 3 stretches vertically.',
              '−4 shifts down by 4.',
            ],
            result: 'Horizontal asymptote y=−4.',
            interpretation:
                'Transformations change position and scale while preserving exponential structure.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Exponential equations with the same base',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Use injectivity',
            content:
                'For a>0 and a≠1, aˣ is injective. Therefore, if [[math:a^{u}=a^{v}]], then u=v.',
            emphasis:
                'Equating exponents requires matching valid bases.',
          ),
          WorkedExampleBlockData(
            title: 'Equating exponents',
            problem: 'Solve 2^(x+1)=8.',
            steps: [
              'Rewrite 8 as 2³.',
              'Then 2^(x+1)=2³.',
              'Set x+1=3.',
            ],
            result: 'x=2.',
            interpretation:
                'Injectivity justifies the central step.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'When the bases do not match',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Logarithms solve the general case',
            content:
                'Equations such as 3ˣ=7 cannot usually be rewritten with a common elementary base. Logarithms allow the exponent to be isolated.',
            emphasis:
                'The next lesson develops this tool formally.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Models of the form P(t)=P₀aᵗ',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Initial value and multiplicative factor',
            content:
                'In [[math:P(t)=P_0a^t]], P₀ is the initial value because P(0)=P₀. The base a is the multiplicative factor per unit time.',
            emphasis:
                'a=1+r models percentage growth r; a=1−r models percentage decay when 0<r<1.',
          ),
          WorkedExampleBlockData(
            title: 'Percentage growth',
            problem: 'A population starts at 500 and grows 8% per year. Write the model.',
            steps: [
              'Initial value: P₀=500.',
              'Rate: r=0.08.',
              'Annual factor: 1+r=1.08.',
            ],
            result: 'P(t)=500·1.08ᵗ.',
            interpretation:
                'A percentage rate becomes a recurring multiplicative factor.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'The number e',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'The natural base of Calculus',
            content:
                'The number [[math:e\\approx2.71828]] arises naturally in continuous growth and limit analysis. The function eˣ has the special property that its derivative equals itself.',
            emphasis:
                'That property will be established formally in Calculus.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Continuous growth',
        blocks: [
          WorkedExampleBlockData(
            title: 'A model with e',
            problem: 'A quantity follows Q(t)=200e^(0.3t). Compute Q(0).',
            steps: [
              'Substitute t=0.',
              'e^0=1.',
            ],
            result: 'Q(0)=200.',
            interpretation:
                'The outside coefficient still represents the initial value.',
          ),
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Sign of the exponent coefficient',
            content:
                'In Ce^(kt), k>0 represents continuous growth and k<0 represents continuous decay.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Confusing exponential and polynomial functions',
            content:
                '2ˣ is not x². The position of the variable changes the entire function structure.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Using a negative base for a global real exponential',
            content:
                'An expression such as (−2)ˣ does not define a real-valued function for every real x.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Adding a fixed amount instead of multiplying',
            content:
                'Exponential growth multiplies by a constant factor; it does not add the same absolute amount each period.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Guided exercises and practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided example',
            problem: 'Solve 5^(2x−1)=125.',
            steps: [
              'Rewrite 125=5³.',
              'Set 2x−1=3.',
              'Then 2x=4.',
            ],
            result: 'x=2.',
            interpretation:
                'A common base reduces the exponential equation to a linear equation.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Practice before the final activity',
            content:
                '1. Classify 3ˣ as growth or decay.\n'
                '2. Classify (1/4)ˣ.\n'
                '3. Find the domain and range of 2ˣ.\n'
                '4. Compute 2⁻³.\n'
                '5. Solve 3^(x+1)=27.\n'
                '6. Solve 4^(2x)=16.\n'
                '7. Find the asymptote of 5ˣ−2.\n'
                '8. Describe 2·3^(x−4)+1.\n'
                '9. Model 6% annual growth with initial value 1000.\n'
                '10. Model 12% annual decay with initial value 500.\n'
                '11. Explain why aˣ never equals zero.\n'
                '12. Compare x³ and 3ˣ.\n'
                '13. Explain the role of P₀ in P(t)=P₀aᵗ.\n'
                '14. Classify e^(−0.5t).\n'
                '15. Explain why e is special in Calculus.',
            emphasis:
                'In models, identify the initial value, rate, and multiplicative factor explicitly.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Exponentials connect growth and derivatives',
            content:
                'A derivative measures instantaneous rate. For eˣ, the instantaneous rate equals the function value, making it central in differential equations, continuous compounding, and natural growth models.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart and Thomas for exponential functions, modeling, and the number e.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'Which function represents exponential decay?',
      choices: ['2ˣ', '(1/2)ˣ', 'x²'],
      correctIndex: 1,
      explanation:
          'A base strictly between 0 and 1 produces a decreasing exponential function.',
    ),
    takeaways: [
      'In an exponential function, the variable is in the exponent.',
      'The base must be positive and different from 1.',
      'The basic domain is ℝ and the range is (0,+∞).',
      'A base greater than 1 gives growth; a base between 0 and 1 gives decay.',
      'Transformations shift the horizontal asymptote.',
      'Exponential models use constant multiplicative factors.',
      'The number e is the natural base of Calculus.',
    ],
    closing:
        'Exponential functions describe processes in which proportional changes accumulate multiplicatively.',
  ),
  CourseLessonData(
    id: 'funcoes-07-logaritmos',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Classical functions',
    title: 'Logarithmic functions',
    description:
        'definition, domain, properties, change of base, equations, inequalities, and natural logarithms',
    duration: '≈ 38 min',
    objective:
        'interpret logarithms as exponents, relate logarithmic and exponential functions as inverses, use logarithmic properties with validity conditions, and solve logarithmic equations and inequalities while controlling domain',
    symbol: 'logₐx',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'Fundamental definition',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'A logarithm answers “which exponent?”',
            content:
                'For [[math:a>0]], [[math:a\\ne1]], and [[math:b>0]], the statement [[math:\\log_a b=c]] is equivalent to [[math:a^c=b]].',
            emphasis:
                'The base must be positive and different from 1, and the argument must be positive.',
          ),
          WorkedExampleBlockData(
            title: 'From logarithm to power',
            problem: 'Compute log₂(32).',
            steps: [
              'Ask which exponent on 2 gives 32.',
              'Since 2⁵=32, the required exponent is 5.',
            ],
            result: 'log₂(32)=5.',
            interpretation:
                'A logarithm is the exponent needed to produce the argument.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'Logarithmic function as an inverse',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Exponentials and logarithms undo each other',
            content:
                'If [[math:f(x)=a^x]], then [[math:f^{-1}(x)=\\log_a x]]. Thus [[math:\\log_a(a^x)=x]] and [[math:a^{\\log_a x}=x]] on their valid domains.',
            emphasis:
                'Their graphs are reflections across y=x.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Domain, range, and asymptote',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'The argument must be positive',
            content:
                'For f(x)=logₐx, the domain is (0,+∞), the range is ℝ, and logₐ1=0. The line x=0 is a vertical asymptote.',
            emphasis:
                'A real logarithm of zero or a negative number is undefined.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Growth and decay',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'The base controls monotonicity',
            content:
                'If a>1, logₐx is increasing. If 0<a<1, logₐx is decreasing.',
            emphasis:
                'The logarithm inherits monotonic behavior from its inverse exponential.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'Product property',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Products become sums',
            content:
                'For x>0 and y>0, [[math:\\log_a(xy)=\\log_a x+\\log_a y]].',
            emphasis:
                'The property requires positive arguments.',
          ),
          WorkedExampleBlockData(
            title: 'Expanding a product',
            problem: 'Expand log₂(8x), assuming x>0.',
            steps: [
              'Separate the product.',
              'log₂(8x)=log₂8+log₂x.',
              'Since log₂8=3, simplify.',
            ],
            result: 'log₂(8x)=3+log₂x.',
            interpretation:
                'The property converts multiplication into addition.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Quotient property',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Quotients become differences',
            content:
                'For x>0 and y>0, [[math:\\log_a(x/y)=\\log_a x-\\log_a y]].',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Power property',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Bring the exponent forward',
            content:
                'Whenever the expressions are defined, [[math:\\log_a(x^r)=r\\log_a x]]. Validity of the original and transformed expressions must be respected.',
            emphasis:
                'Logarithm properties come directly from exponent laws.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'What is not a property',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Logarithms do not distribute over addition',
            content:
                'In general, [[math:\\log_a(x+y)\\ne\\log_a x+\\log_a y]]. There is no corresponding subtraction rule either.',
            emphasis:
                'The standard properties involve products, quotients, and powers.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Change of base',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Convert to a convenient base',
            content:
                'For valid bases, [[math:\\log_a x=\\frac{\\log_b x}{\\log_b a}]]. Calculators commonly use base 10 or e.',
            emphasis:
                'This formula evaluates logarithms in bases not directly available on a calculator.',
          ),
          WorkedExampleBlockData(
            title: 'Changing to natural logarithms',
            problem: 'Write log₂7 using ln.',
            steps: [
              'Apply the change-of-base formula.',
            ],
            result: '[[math:\\log_2 7=\\frac{\\ln7}{\\ln2}]].',
            interpretation:
                'Any valid base can be converted to another.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Natural logarithm',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'ln x = logₑx',
            content:
                'The natural logarithm is [[math:\\ln x=\\log_e x]]. As the inverse of eˣ, it satisfies [[math:\\ln(e^x)=x]] and [[math:e^{\\ln x}=x]] for x>0.',
            emphasis:
                'ln is the central logarithmic function in Calculus.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Logarithmic equations',
        blocks: [
          WorkedExampleBlockData(
            title: 'Direct conversion',
            problem: 'Solve log₂(x−1)=3.',
            steps: [
              'Domain: x−1>0, so x>1.',
              'Convert: x−1=2³.',
              'Thus x=9.',
              'Verify x>1.',
            ],
            result: 'S={9}.',
            interpretation:
                'Domain must be controlled before and after solving.',
          ),
          WorkedExampleBlockData(
            title: 'Using logarithm properties',
            problem: 'Solve ln x+ln(x−3)=ln4.',
            steps: [
              'Domain: x>3.',
              'Combine: ln[x(x−3)]=ln4.',
              'By injectivity: x(x−3)=4.',
              'Solve x²−3x−4=0.',
              'Candidates: x=4 and x=−1.',
              'The domain eliminates x=−1.',
            ],
            result: 'S={4}.',
            interpretation:
                'Logarithmic manipulation never replaces domain checking.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Exponential equations with logarithms',
        blocks: [
          WorkedExampleBlockData(
            title: 'Isolating an exponent',
            problem: 'Solve 3ˣ=7.',
            steps: [
              'Apply ln to both sides.',
              'ln(3ˣ)=ln7.',
              'Use the power property: x·ln3=ln7.',
              'Divide by ln3.',
            ],
            result: '[[math:x=\\frac{\\ln7}{\\ln3}]].',
            interpretation:
                'Logarithms turn an unknown exponent into a multiplicative factor.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Logarithmic inequalities',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Monotonicity determines direction',
            content:
                'If a>1, logₐ preserves order. If 0<a<1, logₐ reverses order because the function is decreasing.',
            emphasis:
                'Always keep the condition that every logarithm argument is positive.',
          ),
          WorkedExampleBlockData(
            title: 'Base greater than 1',
            problem: 'Solve log₂(x−1)>3.',
            steps: [
              'Domain: x>1.',
              'Since 2>1, preserve the inequality direction.',
              'x−1>2³.',
            ],
            result: 'x>9.',
            interpretation:
                'Increasing monotonicity allows direct comparison of arguments.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Allowing zero or negative arguments',
            content:
                'Over the reals, logₐu requires u>0.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Inventing an addition property',
            content:
                'log(x+y) cannot be split into log x+log y.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Forgetting that bases below 1 are decreasing',
            content:
                'This changes the inequality direction in comparison problems.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Guided exercises and practice',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided example',
            problem: 'Solve log₃(2x−1)=2.',
            steps: [
              'Domain: 2x−1>0.',
              'Convert: 2x−1=3².',
              'Then 2x−1=9.',
            ],
            result: 'x=5.',
            interpretation:
                'The answer satisfies x>1/2.',
          ),
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Practice before the final activity',
            content:
                '1. Compute log₂8.\n'
                '2. Compute log₁₀0.01.\n'
                '3. Convert log₃81=4 to exponential form.\n'
                '4. Find the domain and range of ln x.\n'
                '5. Expand log(xy).\n'
                '6. Expand log(x/y).\n'
                '7. Expand log(x³).\n'
                '8. Explain why log(x+y) cannot be separated.\n'
                '9. Write log₅7 using ln.\n'
                '10. Solve log₂(x+4)=5.\n'
                '11. Solve ln x=2.\n'
                '12. Solve 5ˣ=11 using ln.\n'
                '13. Solve log₂(x−1)>2.\n'
                '14. Solve log_(1/2)(x)>1, respecting domain and monotonicity.\n'
                '15. Explain why ln arises naturally in derivatives.',
            emphasis:
                'Before solving a logarithmic equation, explicitly state every domain condition.',
          ),
        ],
      ),
      LessonSectionData(
        number: '16',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'ln converts products to sums and exponents to factors',
            content:
                'In Calculus, ln simplifies derivatives of products, quotients, and powers through logarithmic differentiation. Also, the derivative of ln x is 1/x for x>0.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '17',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart and Thomas for logarithms, inverse functions, equations, and Calculus applications.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'log₁₀(1000) equals:',
      choices: ['2', '3', '10'],
      correctIndex: 1,
      explanation:
          'Since 10³=1000, the required exponent is 3, so log₁₀(1000)=3.',
    ),
    takeaways: [
      'A logarithm is the exponent needed to produce a number.',
      'The logarithmic function is the inverse of the exponential function with the same base.',
      'A logarithm requires a positive argument.',
      'Products, quotients, and powers generate specific logarithm properties.',
      'There is no logarithm property for addition.',
      'Change of base evaluates any valid base.',
      'ln is the base-e logarithm and is central in Calculus.',
      'Logarithmic equations and inequalities require domain control.',
    ],
    closing:
        'Logarithms convert multiplicative relationships into additive ones and provide the natural inverse language of exponential functions.',
  ),
  CourseLessonData(
    id: 'funcoes-08-radianos-circulo',
    topicId: 'funcoes',
    trailTitle: 'Functions — Precalculus',
    eyebrow: 'Trigonometry',
    title: 'Radians and the unit circle',
    description:
        'angle measure, arc length, the unit circle, quadrants, reference angles, and periodicity',
    duration: '≈ 38 min',
    objective:
        'understand radians as arc-length-to-radius ratio, convert angle measures, use the unit circle to define sine and cosine, determine signs by quadrant, and obtain exact values for reference angles',
    symbol: 'θ=s/r',
    sections: [
      LessonSectionData(
        number: '1',
        title: 'What is a radian',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'Angle as arc length divided by radius',
            content:
                'If an arc of length s is subtended in a circle of radius r, the central angle in radians is [[math:\\theta=\\frac{s}{r}]].',
            emphasis:
                'Radian measure is dimensionless: length divided by length.',
          ),
          WorkedExampleBlockData(
            title: 'One radian',
            problem: 'When does an angle measure exactly 1 radian?',
            steps: [
              'Use θ=s/r.',
              'If s=r, then θ=r/r=1.',
            ],
            result: '1 rad is the angle subtending an arc whose length equals the radius.',
            interpretation:
                'The definition comes directly from circle geometry.',
          ),
        ],
      ),
      LessonSectionData(
        number: '2',
        title: 'One complete revolution',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: '2π rad = 360°',
            content:
                'For a full circle, s=2πr. Hence [[math:\\theta=\\frac{2\\pi r}{r}=2\\pi]]. One full revolution therefore measures 2π radians.',
            emphasis:
                'Thus π rad=180°, π/2=90°, and π/4=45°.',
          ),
        ],
      ),
      LessonSectionData(
        number: '3',
        title: 'Converting degrees and radians',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'Use π rad = 180°',
            content:
                'To convert degrees to radians, multiply by π/180. To convert radians to degrees, multiply by 180/π.',
          ),
          WorkedExampleBlockData(
            title: 'Degrees to radians',
            problem: 'Convert 150° to radians.',
            steps: [
              'Compute 150·π/180.',
              'Simplify 150/180 to 5/6.',
            ],
            result: '150°=5π/6.',
            interpretation:
                'Keeping π gives an exact angle measure.',
          ),
          WorkedExampleBlockData(
            title: 'Radians to degrees',
            problem: 'Convert 7π/4 to degrees.',
            steps: [
              'Multiply by 180/π.',
              '(7π/4)(180/π)=7·45.',
            ],
            result: '7π/4=315°.',
            interpretation:
                'The factor π cancels naturally.',
          ),
        ],
      ),
      LessonSectionData(
        number: '4',
        title: 'Arc length',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 's=rθ requires radians',
            content:
                'From θ=s/r we obtain [[math:s=r\\theta]]. This simple form is valid only when θ is measured in radians.',
            emphasis:
                'Substituting degree values directly into s=rθ gives an incorrect result.',
          ),
          WorkedExampleBlockData(
            title: 'Arc in a circle',
            problem: 'Find the arc length for radius 6 and angle π/3.',
            steps: [
              'Use s=rθ.',
              's=6·π/3.',
            ],
            result: 's=2π.',
            interpretation:
                'The result has units of length, not angle.',
          ),
        ],
      ),
      LessonSectionData(
        number: '5',
        title: 'The unit circle',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.graph,
            title: 'Radius equal to 1',
            content:
                'The unit circle is [[math:x^2+y^2=1]]. An angle θ measured from the positive x-axis determines a point P on the circle.',
            emphasis:
                'The unit circle converts angles into coordinates.',
          ),
        ],
      ),
      LessonSectionData(
        number: '6',
        title: 'Sine and cosine as coordinates',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.notation,
            title: 'P(θ)=(cosθ,sinθ)',
            content:
                'On the unit circle, the point corresponding to θ has coordinates [[math:P(\\theta)=(\\cos\\theta,\\sin\\theta)]].',
            emphasis:
                'Cosine is the x-coordinate; sine is the y-coordinate.',
          ),
          WorkedExampleBlockData(
            title: 'Angle π/2',
            problem: 'Find sine and cosine of π/2.',
            steps: [
              'π/2 corresponds to the top of the unit circle.',
              'The point is (0,1).',
            ],
            result: 'cos(π/2)=0 and sin(π/2)=1.',
            interpretation:
                'The coordinates directly provide the trigonometric values.',
          ),
        ],
      ),
      LessonSectionData(
        number: '7',
        title: 'Quadrants and signs',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Signs come from coordinates',
            content:
                'In quadrant I, sine and cosine are positive. In II, sine is positive and cosine negative. In III, both are negative. In IV, sine is negative and cosine positive.',
            emphasis:
                'There is no need to memorize isolated sign rules if you read x and y coordinates.',
          ),
        ],
      ),
      LessonSectionData(
        number: '8',
        title: 'Reference angles',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.route,
            title: 'Reduce to a known acute angle',
            content:
                'A reference angle is the smallest positive angle between the terminal side and the x-axis. It lets us use first-quadrant exact values and then adjust only the signs.',
          ),
          WorkedExampleBlockData(
            title: 'Quadrant II',
            problem: 'Find sin(5π/6) and cos(5π/6).',
            steps: [
              '5π/6 lies in quadrant II.',
              'Its reference angle is π/6.',
              'In quadrant II, sine is positive and cosine negative.',
            ],
            result: 'sin(5π/6)=1/2 and cos(5π/6)=−√3/2.',
            interpretation:
                'Absolute values come from the reference angle; signs come from the quadrant.',
          ),
        ],
      ),
      LessonSectionData(
        number: '9',
        title: 'Special angles',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.table,
            title: '0, π/6, π/4, π/3, and π/2',
            content:
                'In quadrant I: cos0=1 and sin0=0; cos(π/6)=√3/2 and sin(π/6)=1/2; cos(π/4)=sin(π/4)=√2/2; cos(π/3)=1/2 and sin(π/3)=√3/2; cos(π/2)=0 and sin(π/2)=1.',
            emphasis:
                'These exact values extend to other quadrants through symmetry and sign.',
          ),
        ],
      ),
      LessonSectionData(
        number: '10',
        title: 'Where exact values come from',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: '45°–45°–90° and 30°–60°–90° triangles',
            content:
                'The values √2/2, 1/2, and √3/2 are not arbitrary. They come from the geometric ratios of special right triangles associated with the unit circle.',
            emphasis:
                'Understanding the origin is more reliable than memorizing an unstructured table.',
          ),
        ],
      ),
      LessonSectionData(
        number: '11',
        title: 'Coterminal angles',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.transform,
            title: 'The same terminal point',
            content:
                'Angles differing by integer multiples of 2π terminate at the same point: [[math:\\theta+2k\\pi]], where k is an integer.',
            emphasis:
                'Sine and cosine have period 2π.',
          ),
          WorkedExampleBlockData(
            title: 'Removing one extra revolution',
            problem: 'Locate 13π/6 on the unit circle.',
            steps: [
              'Subtract 2π=12π/6.',
              '13π/6−12π/6=π/6.',
            ],
            result: '13π/6 is coterminal with π/6.',
            interpretation:
                'The two angles have the same sine and cosine.',
          ),
        ],
      ),
      LessonSectionData(
        number: '12',
        title: 'Negative angles',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.compare,
            title: 'Clockwise direction',
            content:
                'Positive angles are measured counterclockwise; negative angles are measured clockwise.',
            emphasis:
                'The unit circle naturally represents every real angle.',
          ),
          WorkedExampleBlockData(
            title: 'A negative angle',
            problem: 'Find a positive angle coterminal with −π/3.',
            steps: [
              'Add 2π.',
              '−π/3+2π=5π/3.',
            ],
            result: '5π/3.',
            interpretation:
                '−π/3 and 5π/3 determine the same point.',
          ),
        ],
      ),
      LessonSectionData(
        number: '13',
        title: 'Tangent on the unit circle',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.calculate,
            title: 'tanθ=sinθ/cosθ',
            content:
                'Whenever cosθ≠0, [[math:\\tan\\theta=\\frac{\\sin\\theta}{\\cos\\theta}]]. Tangent is undefined where the x-coordinate of the unit-circle point is zero.',
            emphasis:
                'This occurs at π/2+kπ.',
          ),
        ],
      ),
      LessonSectionData(
        number: '14',
        title: 'Frequent errors',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Using degrees in formulas built for radians',
            content:
                's=rθ and the fundamental trigonometric limits assume θ is in radians.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Swapping sine and cosine',
            content:
                'On the unit circle, cosine is the x-coordinate and sine is the y-coordinate.',
            tone: LearningCardTone.warning,
          ),
          ConceptBlockData(
            visual: LessonVisual.warning,
            title: 'Ignoring the quadrant',
            content:
                'The reference angle gives the absolute value, but the quadrant determines the sign.',
            tone: LearningCardTone.warning,
          ),
        ],
      ),
      LessonSectionData(
        number: '15',
        title: 'Guided exercises',
        blocks: [
          WorkedExampleBlockData(
            title: 'Guided 1 — conversion',
            problem: 'Convert 225° to radians.',
            steps: [
              'Compute 225·π/180.',
              'Reduce by 45.',
            ],
            result: '225°=5π/4.',
            interpretation:
                'The angle lies in quadrant III.',
          ),
          WorkedExampleBlockData(
            title: 'Guided 2 — exact values',
            problem: 'Find sin(7π/4) and cos(7π/4).',
            steps: [
              '7π/4 lies in quadrant IV.',
              'Reference angle: π/4.',
              'In quadrant IV, sine is negative and cosine positive.',
            ],
            result: 'sin(7π/4)=−√2/2 and cos(7π/4)=√2/2.',
            interpretation:
                'Symmetry avoids memorizing a separate table for each quadrant.',
          ),
        ],
      ),
      LessonSectionData(
        number: '16',
        title: 'Practice before the final activity',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.checklist,
            title: 'Convert, locate, and calculate',
            content:
                '1. Convert 30° to radians.\n'
                '2. Convert 300° to radians.\n'
                '3. Convert 3π/4 to degrees.\n'
                '4. Convert 11π/6 to degrees.\n'
                '5. Find arc length for r=4 and θ=π/2.\n'
                '6. Find sin0 and cos0.\n'
                '7. Find sin(π/3) and cos(π/3).\n'
                '8. Find sin(3π/4) and cos(3π/4).\n'
                '9. Find sin(4π/3) and cos(4π/3).\n'
                '10. Find a coterminal angle for 17π/6 in [0,2π).\n'
                '11. Find a positive coterminal angle for −5π/4.\n'
                '12. Find tan(π/4).\n'
                '13. Explain why tan(π/2) is undefined.\n'
                '14. Explain geometrically why sin²θ+cos²θ=1.\n'
                '15. Explain why radians are more natural than degrees in Calculus.',
            emphasis:
                'Keep exact values involving π and radicals; avoid unnecessary decimal approximations.',
          ),
        ],
      ),
      LessonSectionData(
        number: '17',
        title: 'Connection to Calculus',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.infinity,
            title: 'Radians give trigonometric limits their natural form',
            content:
                'The fundamental limit [[math:\\lim_{x\\to0}\\frac{\\sin x}{x}=1]] holds in this form when x is measured in radians. This choice removes artificial scale factors from derivatives of sine and cosine.',
            emphasis:
                'That is why formulas such as d(sin x)/dx=cos x assume radians.',
            tone: LearningCardTone.information,
          ),
        ],
      ),
      LessonSectionData(
        number: '18',
        title: 'References and synthesis',
        blocks: [
          ConceptBlockData(
            visual: LessonVisual.idea,
            title: 'Academic basis',
            content:
                'References: OpenStax Precalculus 2e; OpenStax Algebra and Trigonometry 2e; Sullivan, Precalculus; Blitzer, Precalculus; Stewart and Thomas for radians, the unit circle, and trigonometric limits.',
          ),
        ],
      ),
    ],
    check: LessonCheckData(
      question: 'What is 90° in radians?',
      choices: ['π/4', 'π/2', 'π'],
      correctIndex: 1,
      explanation:
          '90° is one quarter of a complete revolution. Since a full revolution is 2π, one quarter is π/2.',
    ),
    takeaways: [
      'Radians measure angles through arc length divided by radius.',
      'One complete revolution is 2π radians.',
      'On the unit circle, cosθ is x and sinθ is y.',
      'Quadrants determine the signs of sine and cosine.',
      'Reference angles reduce calculations to special angles.',
      'Coterminal angles differ by multiples of 2π.',
      'Tangent is sinθ/cosθ when cosθ≠0.',
      'Radians are essential to the natural formulation of Calculus.',
    ],
    closing:
        'The unit circle turns angles into coordinates and creates the geometric language supporting all trigonometric functions.',
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
