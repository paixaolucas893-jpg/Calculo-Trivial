# Design System — Cálculo Trivial

Última atualização: 2026-10-10
Status: base oficial de UI/UX

## 1. Objetivo

Este documento consolida as regras visuais e de experiência do Cálculo Trivial.

O design deve apoiar aprendizagem, legibilidade e foco. Elementos decorativos não devem competir com a matemática.

## 2. Identidade

Nome público: Cálculo Trivial.

O nome deve ser usado de forma consistente em loja, interface, materiais oficiais e comunicação.

Não criar slogans, símbolos ou marcas paralelas sem decisão explícita de produto.

Símbolos matemáticos não devem ser tratados automaticamente como slogan ou identidade promocional.

## 3. Paleta principal

Brand:

- Primary: #2563EB
- Primary Dark: #1D4ED8
- Primary Light: #BFDBFE
- Secondary: #06B6D4
- Secondary Dark: #0891B2
- Secondary Light: #CFFAFE
- Navy: #07111F
- Navy Light: #0D1B2A

Superfícies:

- Background: #F7F9FC
- Surface: #FFFFFF
- Surface Secondary: #F1F5F9

Texto:

- Primary: #101828
- Secondary: #667085
- Muted: #98A2B3
- Disabled: #B8C0CC
- On Primary: #FFFFFF

Estados semânticos:

- Success: #16A34A
- Error: #DC2626
- Warning/Gold: #F59E0B
- Info: #0284C7
- XP: #7C3AED
- Achievement: #8B5CF6

Cores semânticas devem manter significado consistente.

## 4. Tipografia

Escala atual:

- Display Large: 36, weight 800
- Heading Large: 28, weight 700
- Heading Medium: 24, weight 700
- Heading Small: 20, weight 600
- Title Large: 18, weight 600
- Title Medium: 16, weight 600
- Body Large: 16, weight 400
- Body Medium: 14, weight 400
- Body Small: 12, weight 400
- Label Large: 16, weight 700
- Label Medium: 14, weight 600
- Label Small: 12, weight 500
- Caption: 12, weight 400

Textos matemáticos longos devem priorizar legibilidade e espaço suficiente.

## 5. Espaçamento

Escala base:

- 4
- 8
- 12
- 16
- 24
- 32
- 40
- 48

Padding padrão de tela:

- horizontal: 24
- topo: 32
- inferior: 24

Cards:

- padding normal: 16
- padding grande: 20

## 6. Bordas

Raios:

- small: 8
- medium: 12
- large: 16
- xlarge: 20
- xxlarge: 24

A interface deve manter consistência de raio entre cards, botões, inputs e containers relacionados.

## 7. Movimento

Durações atuais:

- quick: 120 ms
- standard: 180 ms
- route: 500 ms
- entrance: 1200 ms
- ambient: 3600 ms

Motion deve:

- explicar mudança de estado;
- orientar hierarquia;
- evitar distração;
- respeitar redução de movimento quando aplicável.

## 8. Botões

Altura padrão: 52.

Regras:

- ação principal deve ser visualmente dominante;
- não apresentar múltiplas ações primárias concorrentes;
- estados loading, disabled e error devem ser claros;
- confirmação destrutiva deve ser distinta;
- labels devem explicar a ação.

## 9. Inputs

Altura mínima: 52.

Regras:

- label clara;
- validação compreensível;
- erro próximo ao campo;
- nunca depender apenas de cor;
- dados sensíveis devem usar controles apropriados;
- formulário não deve perder dados desnecessariamente após erro.

## 10. Cards

Cards devem representar uma unidade clara:

- módulo;
- aula;
- progresso;
- estatística;
- desafio;
- revisão;
- explicação.

Evitar cards excessivamente decorativos em telas de resolução matemática.

## 11. Navegação

A navegação deve preservar previsibilidade.

Áreas principais podem incluir:

- Início;
- Trilhas;
- Progresso;
- Perfil.

Novas áreas não devem sobrecarregar a navegação principal.

## 12. Estados pedagógicos

Estados visuais esperados:

- não iniciado;
- em andamento;
- concluído;
- bloqueado;
- precisa de revisão;
- sucesso;
- erro;
- carregando;
- offline;
- vazio.

Não usar vermelho para representar permanentemente capacidade do estudante. Vermelho deve representar erro/estado atual, não identidade.

## 13. Questões

Tela de questão deve priorizar:

1. contexto mínimo;
2. enunciado;
3. expressão matemática;
4. alternativas;
5. ação de confirmação.

Evitar elementos competitivos enquanto o estudante resolve.

## 14. Feedback

Prática:

- pode mostrar correto/incorreto;
- deve explicar;
- deve manter linguagem não punitiva.

Teste final:

- não mostrar feedback imediato antes da conclusão;
- apresentar resultado somente após submissão conforme fluxo seguro.

## 15. Progresso

Progresso deve mostrar informação compreensível sem sugerir domínio absoluto baseado em uma única métrica.

Exemplos:

- aulas concluídas;
- questões respondidas;
- taxa de acerto;
- sequência;
- progresso do módulo.

## 16. Dark Mode

Dark mode é requisito planejado e deve ser considerado em novos componentes.

Até a implementação global:

- não espalhar cores literais desnecessárias;
- usar tokens;
- evitar componentes que dependam de fundo branco fixo;
- preservar contraste.

## 17. Responsividade

Prioridade atual: telefone Android.

Novas telas devem:

- funcionar em larguras menores;
- evitar overflow;
- respeitar teclado;
- suportar text scaling;
- considerar tablet sem simplesmente esticar layout;
- ser validadas em aparelho real antes de usar screenshots promocionais de tablet.

## 18. Acessibilidade

Requisitos:

- contraste adequado;
- alvos de toque confortáveis;
- semântica para leitores de tela;
- labels claras;
- não depender apenas de cor;
- suporte a escala de texto;
- alternativa textual para visualizações matemáticas quando necessário;
- motion não essencial deve ser reduzível.

## 19. Gamificação

XP, ouro, sequência e conquistas devem ficar visualmente subordinados à aprendizagem.

Não usar animação, brilho ou recompensa em excesso durante resolução.

## 20. Materiais promocionais

Materiais de loja devem:

- representar o app real;
- não inventar funcionalidades;
- não criar slogans não aprovados;
- não apresentar telas que não correspondam à experiência real;
- manter identidade azul/ciano/navy/branco;
- rotular recursos gerados/editados com IA quando exigido pela plataforma.

## 21. Componentização

Preferir componentes reutilizáveis para:

- botões;
- cards;
- estados vazios;
- feedback;
- blocos de progresso;
- questão;
- navegação;
- dialogs;
- loading.

Mudanças visuais devem preservar comportamento existente e acessibilidade.

## 22. Evolução

Este documento é a base atual. Uma futura UI 2.0 deve evoluir tokens e componentes sem quebrar o fluxo pedagógico nem exigir reconstrução completa do produto.
