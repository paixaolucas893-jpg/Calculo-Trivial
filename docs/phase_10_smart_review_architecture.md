# FASE 10.1 — Arquitetura do Smart Review

Status: revisão arquitetural concluída; implementação ainda não iniciada.

Dependência direta: FASE 9 — Histórico de Aprendizagem (PR #88).

Esta branch nasce da FASE 9 e não deve ser mergeada diretamente na release enquanto a validação do Teste Fechado da 1.2.0+24 não estiver concluída.

## 1. Objetivo

Evoluir a Revisão Personalizada existente para um Smart Review determinístico, explicável e orientado por habilidade.

O Smart Review deve usar dados pedagógicos já existentes para responder:

1. quais habilidades precisam de revisão;
2. quais questões representam melhor essas habilidades;
3. como reduzir repetição mecânica;
4. quando reforçar a base antes de aumentar a dificuldade;
5. como recomendar revisão sem alterar progresso canônico.

O Smart Review não será um mecanismo de nota, aprovação, XP ou conclusão de módulo.

## 2. Base existente que será reutilizada

O app já possui:

- QuestionPerformance por questão:
  - attempts;
  - correct;
  - incorrect;
  - lastAnswerCorrect;
  - accuracy;
  - errorRate;
  - needsReview.
- QuestionMetadata:
  - moduleId;
  - topicId;
  - subtopicId;
  - skill;
  - difficulty;
  - questionType.
- Revisão Personalizada:
  - prioriza questões com needsReview;
  - evita, quando possível, questões da sessão anterior;
  - ordena por erro não resolvido, taxa de erro, erros e tentativas.
- FASE 9:
  - histórico recente limitado a 100 eventos;
  - questionId;
  - contentLessonId;
  - acerto/erro;
  - origem;
  - horário.
- rotação de prática para reduzir repetição.

A FASE 10 não deve duplicar esses mecanismos.

## 3. Limitação atual

A Revisão Personalizada atual trabalha principalmente no nível da questão.

Isso pode fazer o sistema saber que uma questão foi difícil, mas não necessariamente reconhecer que várias questões diferentes pertencem à mesma habilidade.

O Smart Review deve elevar a decisão para:

Histórico + desempenho por questão + metadados
→ desempenho por habilidade
→ prioridade de revisão
→ seleção de questões
→ sessão explicável.

## 4. Unidade pedagógica de revisão

A chave principal será:

1. metadata.skill, quando preenchida;
2. metadata.subtopicId, como fallback;
3. questionId, somente como último fallback.

Isso evita bloquear módulos antigos que ainda não tenham skill completa e preserva compatibilidade.

Nenhum ID existente será migrado nesta fase.

## 5. Entradas do Smart Review

O mecanismo poderá ler, somente em memória:

- candidatos disponíveis;
- QuestionPerformance;
- LearningHistoryEntry;
- última sessão de revisão;
- metadados da questão;
- aulas/conteúdos já estudados.

Não será criado um novo perfil sensível do aluno.

## 6. Elegibilidade

Uma habilidade entra em revisão quando houver evidência pedagógica suficiente, por exemplo:

- erro não resolvido;
- accuracy abaixo do limiar atual de revisão;
- múltiplos erros recentes;
- reincidência do erro em questões diferentes da mesma habilidade.

Uma questão não deve introduzir conteúdo futuro apenas para preencher a sessão.

Questões já tentadas são elegíveis.

Questões novas da mesma habilidade podem ser usadas para verificar transferência, desde que o conteúdo correspondente já tenha sido estudado.

## 7. Priorização de habilidades

A primeira versão será determinística e baseada em regras, não em IA generativa.

Ordem conceitual de prioridade:

1. erro recente ainda não resolvido;
2. reincidência de erro na mesma habilidade;
3. baixa accuracy agregada da habilidade;
4. quantidade de erros;
5. necessidade de confirmação após melhora recente;
6. diversidade da sessão.

Não será usado um modelo opaco para decidir o que o aluno “domina”.

## 8. Seleção de questões dentro da habilidade

Para uma habilidade prioritária:

1. preferir uma questão válida que não esteve na sessão anterior;
2. quando houver alternativas, preferir uma questão diferente da que originou o erro;
3. usar repetição direta somente quando necessário;
4. evitar excesso de uma única habilidade;
5. começar por foundation/intermediate em remediação;
6. usar challenge sem deixar que ele domine uma sessão de recuperação.

Isso transforma a revisão em avaliação da habilidade, não em memorização da resposta de uma questão.

## 9. Composição inicial da sessão

Padrão inicial: até 10 questões.

Regras:

- nenhuma habilidade deve dominar toda a sessão quando houver outras fraquezas relevantes;
- tentar cobrir pelo menos duas habilidades quando houver evidência suficiente;
- evitar a sessão anterior sempre que o banco permitir;
- se houver poucos itens elegíveis, reduzir a sessão em vez de preencher com conteúdo irrelevante;
- não inventar questões nem usar conteúdo ainda não estudado.

Os percentuais exatos de distribuição serão definidos por testes, não por regra fixa antecipada.

## 10. Explicabilidade

Cada seleção futura deverá poder informar um motivo simples, como:

- erro recente;
- habilidade com baixa precisão;
- reforço recomendado;
- confirmação de aprendizagem.

Esses motivos são pedagógicos e não constituem diagnóstico clínico ou classificação definitiva do aluno.

## 11. Relação com Tutor Trivial

O Tutor Trivial continua central, mas não receberá automaticamente o histórico bruto.

Futuramente, o Smart Review poderá sugerir:

“Revisar este conceito com o Tutor Trivial”.

O contexto enviado deverá ser mínimo, por exemplo:

- módulo;
- aula;
- habilidade;
- tipo de dificuldade pedagógica.

Conversas privadas do Tutor não entram no Smart Review nesta fase.

## 12. Persistência e privacidade

Versão inicial: nenhum novo campo obrigatório no Firestore.

O estado de Smart Review será derivado dos dados já existentes.

Não persistir:

- rótulo permanente de “aluno fraco”;
- perfil psicológico;
- texto livre;
- conversa do Tutor;
- nome ou e-mail dentro do mecanismo;
- inferências destinadas a professor.

Professor/instituição não terá acesso ao histórico privado por esta funcionalidade.

Reset e exclusão de conta continuarão removendo os dados-fonte já definidos.

## 13. Segurança

O Smart Review não poderá:

- conceder XP;
- conceder ouro;
- concluir aula;
- concluir módulo;
- alterar aprovação em prova;
- substituir regras server-side;
- confiar em IDs fornecidos pela interface sem validação;
- transformar dados derivados em progresso canônico.

Dados do cliente continuam tratados como não confiáveis para recompensas e conclusão.

## 14. Compatibilidade

A implementação deverá preservar:

- Revisão Personalizada atual como fallback;
- prática guiada;
- rotação de questões;
- desafio diário;
- prova final;
- progresso existente;
- PT/EN;
- IDs de conteúdo já usados;
- segurança e exclusão de conta.

Não haverá migração destrutiva.

## 15. Estrutura proposta de domínio

Implementação futura poderá introduzir componentes equivalentes a:

- SkillReviewSummary
  - agrega evidências por habilidade;
- SmartReviewReason
  - motivo explicável da prioridade;
- SmartReviewPlanner
  - produz o plano da sessão;
- SmartReviewSelector
  - escolhe candidatos dentro de cada habilidade.

A nomenclatura final pode mudar durante implementação, mas as responsabilidades devem permanecer separadas.

## 16. Critérios de aprovação antes do merge

A FASE 10 somente poderá avançar se os testes demonstrarem:

- mesma entrada produz resultado determinístico;
- conteúdo futuro não é selecionado;
- erros não resolvidos recebem prioridade;
- alternativas da mesma habilidade são preferidas à repetição imediata;
- sessão anterior é evitada quando houver opções;
- diversidade de habilidades é respeitada;
- sessões pequenas não são preenchidas artificialmente;
- ausência de skill não quebra módulos antigos;
- histórico não altera XP ou conclusão;
- reset/exclusão continuam corretos;
- Firestore/security tests permanecem verdes;
- Flutter analyze/test permanece verde.

## 17. Fora de escopo da FASE 10 inicial

- IA generativa decidindo domínio;
- diagnóstico automático de transtornos ou dificuldades;
- notas escolares;
- dashboard de professor;
- compartilhamento de histórico com instituição;
- revisão espaçada avançada;
- notificações;
- expansão 300 → 600;
- testes por aula da Parte 4;
- mudança de UI 2.0;
- alteração da build 1.2.0+24 em Teste Fechado.

## 18. Sequência de implementação após aprovação

FASE 10.2 — agregador de desempenho por habilidade.

FASE 10.3 — planner/seletor determinístico do Smart Review.

FASE 10.4 — integração com a tela de Revisão Personalizada.

FASE 10.5 — explicabilidade e recomendações para Tutor Trivial.

FASE 10.6 — testes de regressão, segurança, privacidade e validação pedagógica.

Nenhuma dessas subfases deve avançar para a release enquanto a estratégia de validação da versão em Teste Fechado não permitir.
