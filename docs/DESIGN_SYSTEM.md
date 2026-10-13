# Design System — Cálculo Trivial

Última atualização: 2026-10-13  
Status: documento mestre de UI/UX  
Baseline visual: release 1.2.0+24

## 1. Objetivo

Este documento define a linguagem visual, os padrões de interação e os requisitos de acessibilidade do Cálculo Trivial.

Ele diferencia:

- **ATUAL** — já existe na release 1.2.0+24;
- **DIRETRIZ** — regra obrigatória para novas interfaces;
- **FUTURO** — ainda depende de implementação.

O design deve apoiar aprendizagem, legibilidade e foco. Elementos visuais não devem competir com o raciocínio matemático.

## 2. Identidade

### 2.1 Nome

Nome público oficial:

`Cálculo Trivial`.

O nome deve ser consistente em:

- aplicativo;
- Google Play;
- materiais promocionais;
- documentação pública;
- suporte.

O package Dart interno `calcquest` e a classe `CalcQuestApp` são nomes técnicos e não constituem marca pública.

### 2.2 Tagline existente

A localização atual contém:

PT-BR: `Domine o cálculo. Evolua além.`  
EN: `Master calculus. Go further.`

Essa frase existe no aplicativo atual, mas qualquer mudança de slogan/tagline deve ser decisão explícita de produto.

### 2.3 Símbolos matemáticos

Símbolos matemáticos podem aparecer no conteúdo ou como decoração contextual da interface.

Eles **não devem ser promovidos automaticamente a logotipo, slogan, assinatura de marca ou motivo promocional principal**.

Em particular:

- não usar símbolo de integral como slogan;
- não usar expressão matemática isolada como assinatura promocional;
- não inventar nova marca visual a partir de símbolos presentes em telas;
- materiais de loja devem priorizar o nome Cálculo Trivial e a experiência real.

A Splash atual contém símbolos matemáticos flutuantes como decoração de interface. Isso não define identidade promocional.

## 3. Fundação de cores — ATUAL

Tokens oficiais de `AppColors`.

### Marca

- Primary: `#2563EB`
- Primary Dark: `#1D4ED8`
- Primary Light: `#BFDBFE`
- Secondary: `#06B6D4`
- Secondary Dark: `#0891B2`
- Secondary Light: `#CFFAFE`
- Navy: `#07111F`
- Navy Light: `#0D1B2A`

### Superfícies

- Background: `#F7F9FC`
- Surface: `#FFFFFF`
- Surface Secondary: `#F1F5F9`

### Texto

- Text Primary: `#101828`
- Text Secondary: `#667085`
- Text Muted: `#98A2B3`
- Text Disabled: `#B8C0CC`
- Text on Primary: `#FFFFFF`

### Bordas e inputs

- Border: `#E4E7EC`
- Border Strong: `#D0D5DD`
- Input Border: `#D0D5DD`
- Input Background: `#FFFFFF`
- Input Focused Border: Primary
- Input Error Border: Error

### Estados semânticos

Success:
- `#16A34A`
- light `#DCFCE7`
- dark `#15803D`

Error:
- `#DC2626`
- light `#FEE2E2`
- dark `#B91C1C`

Warning:
- `#F59E0B`
- light `#FEF3C7`
- dark `#D97706`

Info:
- `#0284C7`
- light `#E0F2FE`
- dark `#0369A1`

### Gamificação

- XP: `#7C3AED`
- XP Light: `#EDE9FE`
- Gold: `#F59E0B`
- Gold Light: `#FEF3C7`
- Achievement: `#8B5CF6`
- Achievement Light: `#F3E8FF`

### Outros estados

- Selected Background: `#EFF6FF`
- Hover: `#F8FAFC`
- Pressed: `#E2E8F0`
- Disabled: `#E5E7EB`
- Disabled Foreground: `#9CA3AF`
- Locked: `#94A3B8`
- Locked Background: `#F1F5F9`
- Progress Track: `#E2E8F0`
- Offline: `#475467`
- Offline Background: `#F2F4F7`
- Overlay: `#66000000`
- Shadow: `#1A000000`

### DS-COLOR-01

Novas telas devem preferir `AppColors` em vez de cores literais.

### Limite atual

Ainda existem cores literais em algumas telas e componentes, principalmente gradientes e detalhes específicos.

Isso é compatível com a release atual, mas deve ser reduzido durante a evolução para UI 2.0/dark mode.

## 4. Tipografia — ATUAL

`AppTypography` define:

- Display Large: 36 / 800 / line-height 1.15
- Heading Large: 28 / 700 / 1.20
- Heading Medium: 24 / 700 / 1.25
- Heading Small: 20 / 600 / 1.30
- Title Large: 18 / 600 / 1.35
- Title Medium: 16 / 600 / 1.40
- Body Large: 16 / 400 / 1.50
- Body Medium: 14 / 400 / 1.45
- Body Small: 12 / 400 / 1.40
- Label Large: 16 / 700 / 1.25
- Label Medium: 14 / 600 / 1.25
- Label Small: 12 / 500 / 1.25
- Caption: 12 / 400 / 1.35

O `ThemeData` atual usa `Roboto`.

### DS-TYPE-01

Textos matemáticos longos devem priorizar legibilidade, quebra de linha e área suficiente.

### DS-TYPE-02

Não reduzir texto para “caber” quando reorganizar layout resolver o problema.

### Limite atual

A escala tipográfica não está totalmente mapeada para `ThemeData.textTheme`; muitos componentes aplicam `AppTypography` diretamente.

Uma futura refatoração pode centralizar isso sem alterar aparência.

## 5. Espaçamento — ATUAL

`AppSpacing`:

- xxs: 4
- xs: 8
- sm: 12
- md: 16
- lg: 24
- xl: 32
- xxl: 40
- xxxl: 48

Tela:

- horizontal: 24
- top: 32
- bottom: 24

Componentes:

- card: 16
- card large: 20
- input horizontal: 16
- input vertical: 14

### DS-SPACE-01

Nova UI deve reutilizar essa escala antes de introduzir valor novo.

## 6. Raios — ATUAL

- Small: 8
- Medium: 12
- Large: 16
- XLarge: 20
- XXLarge: 24

### DS-RADIUS-01

Componentes da mesma família devem usar raios coerentes.

## 7. Ícones — ATUAL

`AppIcon` possui tamanhos:

- Small: 16
- Medium: 20
- Large: 24
- Extra Large: 32

Material Icons são usados amplamente.

### DS-ICON-01

Ícone sozinho que representa ação ou informação relevante deve possuir tooltip, label acessível ou contexto textual suficiente.

### DS-ICON-02

Não usar ícone matemático decorativo como substituto de texto de navegação.

## 8. Movimento — PARCIAL

Tokens atuais:

- Quick: 120 ms
- Standard: 180 ms
- Route: 500 ms
- Entrance: 1200 ms
- Ambient: 3600 ms

Curvas atuais incluem:

- easeOut
- easeOutCubic
- easeOutBack

A Splash e outras telas possuem animações de entrada/ambiente.

### DS-MOTION-01

Motion deve explicar estado ou hierarquia e não competir com resolução matemática.

### DS-MOTION-02

Telas de exercício devem evitar animação ambiental excessiva.

### Acessibilidade — dívida atual

Não há ainda uma política global comprovada de `Reduce Motion`.

Algumas animações usam `AnimationBehavior.preserve`, portanto não se deve afirmar que redução de movimento já está plenamente implementada.

### FUTURO

Adicionar uma estratégia global que respeite preferência de redução de movimento e validar em dispositivo.

## 9. Tema global — ATUAL

O app utiliza Material 3.

O `ThemeData` atual define principalmente:

- scaffold background;
- fontFamily Roboto;
- `useMaterial3: true`.

A maior parte da identidade é aplicada diretamente por tokens e componentes próprios.

### Limite atual

Não existe `darkTheme` nem `themeMode` global configurado na release 1.2.0+24.

Portanto, **dark mode ainda não está implementado**.

## 10. Dark Mode — FUTURO

Dark mode permanece requisito planejado.

Até a implementação:

- novas telas devem usar tokens;
- evitar `Colors.white` e cores literais sem necessidade;
- não assumir fundo claro em lógica funcional;
- estados semânticos devem continuar distinguíveis em tema escuro;
- screenshots não devem anunciar dark mode antes de existir.

A implementação global deverá definir:

- tokens claros/escuros;
- ThemeData claro;
- ThemeData escuro;
- ThemeMode;
- persistência de preferência;
- contraste;
- assets;
- testes de regressão.

## 11. Botões — ATUAL

`PrimaryButton` suporta variantes:

- primary;
- secondary;
- destructive.

Características atuais:

- largura total;
- altura 52;
- raio 12;
- estado disabled;
- estado loading;
- ícone opcional;
- texto truncado em uma linha.

### DS-BUTTON-01

Uma tela deve possuir hierarquia clara de ação.

### DS-BUTTON-02

Ação destrutiva deve usar variante/semântica destrutiva e confirmação quando a consequência for relevante.

### DS-BUTTON-03

Loading deve impedir duplo envio.

### DS-BUTTON-04

Texto do botão deve descrever a ação.

### Limite atual

`PrimaryButton` não cobre todas as variações de botões presentes no app; `FilledButton`, `TextButton`, `IconButton` e controles Material também são usados diretamente.

## 12. Inputs — ATUAL

`AppTextField` oferece:

- label;
- hint;
- errorText;
- enabled/disabled;
- obscureText;
- prefix icon;
- suffix widget;
- teclado configurável;
- callbacks;
- borda de erro/foco.

### DS-INPUT-01

Erro deve possuir mensagem textual, não apenas mudança de cor.

### DS-INPUT-02

Senha deve poder usar obscure/visibility conforme o fluxo.

### DS-INPUT-03

Formulário deve manter informação válida quando uma submissão falha, salvo requisito de segurança.

### Limite atual

A altura mínima 52 é token do sistema, mas `AppTextField` não define explicitamente um `minHeight`; a altura resulta do conteúdo/padding do Material.

Não afirmar dimensão física exata sem teste de layout.

## 13. Cards — ATUAL

Cards são usados para:

- continuidade de estudo;
- módulos;
- aulas;
- métricas;
- desafio diário;
- revisão;
- Premium;
- perfil;
- conquistas;
- configurações.

### DS-CARD-01

Um card deve representar uma unidade conceitual clara.

### DS-CARD-02

Cards em tela de resolução devem ser visualmente mais contidos que cards de Dashboard/Profile.

### DS-CARD-03

Não adicionar gradiente, sombra ou badge apenas para aumentar “impacto” visual.

## 14. Navegação principal — ATUAL

A barra inferior possui quatro destinos:

1. Início;
2. Trilhas;
3. Progresso;
4. Perfil.

O terceiro destino é tecnicamente a tela de estatísticas e atualmente é protegido por Premium.

### DS-NAV-01

Ordem e significado da navegação principal não devem mudar sem decisão de produto.

### DS-NAV-02

Estado bloqueado/Premium deve ser comunicado antes ou no momento da tentativa de acesso.

### DS-NAV-03

Adicionar uma quinta área exige revisão de densidade e prioridade.

## 15. Estados visuais

Estados que o design deve suportar:

- normal;
- pressed;
- focused;
- selected;
- disabled;
- loading;
- success;
- error;
- warning;
- locked;
- offline;
- empty;
- não iniciado;
- em andamento;
- concluído;
- precisa de revisão.

### DS-STATE-01

Estado não pode depender exclusivamente de cor.

### DS-STATE-02

Vermelho representa erro/perigo atual, não identidade ou capacidade permanente do estudante.

### DS-STATE-03

Locked e Premium não são a mesma coisa e não devem ser comunicados de forma ambígua.

## 16. Tela de questão

Hierarquia recomendada:

1. contexto/progresso da sessão;
2. enunciado;
3. expressão ou conteúdo matemático;
4. alternativas/entrada;
5. confirmação;
6. feedback quando o tipo de atividade permitir.

### DS-QUESTION-01

Durante resolução, navegação, gamificação e decoração devem ser subordinadas à questão.

### DS-QUESTION-02

Área tocável das alternativas deve ser confortável e a opção selecionada deve possuir mais de um sinal visual quando necessário.

### DS-QUESTION-03

Questão não deve revelar resposta correta antes do momento pedagógico apropriado.

## 17. Feedback pedagógico

### Prática — ATUAL

Pode apresentar:

- correto/incorreto;
- explicação;
- próxima ação.

### Teste final — ATUAL

Não deve apresentar correção de cada item antes da submissão/conclusão da prova.

### DS-FEEDBACK-01

Feedback deve explicar o estado sem linguagem punitiva ou rótulo pessoal.

### DS-FEEDBACK-02

Erro deve orientar próxima ação quando possível.

## 18. Progresso e métricas — ATUAL

A interface atual mostra, dependendo da tela:

- módulos concluídos;
- aulas concluídas;
- questões respondidas;
- taxa de acerto;
- sequência;
- XP;
- ouro;
- nível;
- desafios;
- progresso da jornada.

### DS-PROGRESS-01

Nenhuma métrica isolada deve ser apresentada como prova absoluta de domínio.

### DS-PROGRESS-02

Percentuais devem deixar claro o que representam: módulo, sessão, acerto ou trilha.

### DS-PROGRESS-03

Evitar inconsistência entre contadores que representam conceitos diferentes sem rótulo claro.

## 19. Gamificação — ATUAL / DIRETRIZ

Elementos atuais incluem:

- XP;
- ouro;
- sequência;
- conquistas;
- desafio diário.

### DS-GAME-01

Gamificação deve apoiar continuidade, não pressionar resolução rápida.

### DS-GAME-02

Recompensas não devem dominar visualmente telas de explicação ou exercício.

### DS-GAME-03

Não usar efeitos visuais para sugerir domínio que a pedagogia não confirmou.

## 20. Premium — ATUAL

Premium é comunicado em:

- navegação de Progresso/Estatísticas;
- cards;
- paywall RevenueCat;
- configurações;
- Customer Center.

### DS-PREM-01

Bloqueio Premium deve ser distinguível de erro técnico.

### DS-PREM-02

Se RevenueCat estiver indisponível, comunicar indisponibilidade em vez de simular acesso.

### DS-PREM-03

Visual Premium não deve parecer punição ao usuário gratuito.

## 21. Responsividade — PARCIAL

Prioridade atual:

1. telefone Android;
2. tablet somente após validação real.

Padrões existentes incluem:

- `SafeArea`;
- `SingleChildScrollView`;
- `LayoutBuilder` em algumas telas;
- `ConstrainedBox` com largura máxima em autenticação;
- uso de `Expanded`/`Flexible`.

### DS-RESP-01

Nova tela deve evitar overflow em largura reduzida.

### DS-RESP-02

Teclado não deve tornar formulário inutilizável.

### DS-RESP-03

Tablet não deve ser apenas telefone esticado.

### DS-RESP-04

Material promocional de tablet só deve ser usado após captura/validação do layout real.

### Limite atual

Não existe evidência suficiente para declarar o app inteiro como otimizado para tablet.

## 22. Acessibilidade — PARCIAL / OBRIGATÓRIA

Há sinais positivos no código atual:

- semantic labels em vários ícones/imagens;
- labels textuais na navegação;
- uso de Material controls;
- feedback textual em vários erros;
- alvos de toque padronizados em componentes principais.

Isso não equivale a uma auditoria completa.

### DS-A11Y-01

Não depender somente de cor.

### DS-A11Y-02

Ações somente por ícone devem possuir descrição acessível.

### DS-A11Y-03

Text scaling deve ser testado nas telas críticas.

### DS-A11Y-04

Contraste deve ser validado, especialmente em texto pequeno e estados disabled/muted.

### DS-A11Y-05

Fluxos completos devem ser testados com leitor de tela antes de declarar conformidade.

### DS-A11Y-06

Motion não essencial deve ser reduzível no futuro.

### DS-A11Y-07

Expressões matemáticas que não forem interpretáveis por tecnologia assistiva devem receber alternativa semântica apropriada.

## 23. Localização e UI — ATUAL

PT e EN são suportados pelo mecanismo de localização.

### DS-I18N-01

Layout deve suportar expansão de texto entre idiomas.

### DS-I18N-02

Não cortar informação essencial apenas porque a versão em inglês é maior.

### DS-I18N-03

Nova string permanente deve usar localização, salvo conteúdo técnico que tenha justificativa explícita.

### Limite atual

Ainda há textos PT/EN definidos diretamente em algumas telas por helpers locais. A direção futura é reduzir essa duplicação e centralizar strings permanentes nos ARBs.

## 24. Materiais promocionais

### DS-STORE-01

Material de loja deve representar a experiência real.

### DS-STORE-02

Não mostrar funcionalidade futura como disponível.

### DS-STORE-03

Não usar UI simulada de tablet como se fosse captura real sem validação.

### DS-STORE-04

Não inventar slogan, logo ou assinatura promocional.

### DS-STORE-05

Não transformar símbolo matemático isolado em identidade promocional.

### DS-STORE-06

Manter predominância visual compatível com a identidade atual:

- azul;
- ciano;
- navy;
- branco;
- cores semânticas somente quando fizerem sentido.

### DS-STORE-07

Recurso criado ou editado com IA deve seguir a declaração/rotulagem exigida pela plataforma de distribuição.

## 25. Componentização

Componentes compartilhados atuais incluem, entre outros:

- `PrimaryButton`;
- `AppTextField`;
- `AppBottomNavigationBar`;
- `AppIcon`.

### DS-COMP-01

Novo componente recorrente deve ser extraído quando isso reduzir inconsistência real.

### DS-COMP-02

Não criar abstração genérica apenas para reduzir linhas.

### DS-COMP-03

Componente compartilhado deve preservar acessibilidade, localização e estados.

## 26. Dívidas de design atuais

### 26.1 Dark mode

Não implementado.

### 26.2 Reduce Motion

Não validado globalmente.

### 26.3 ThemeData

Tokens não estão totalmente centralizados em `ThemeData`.

### 26.4 Cores literais

Ainda existem em algumas telas/componentes.

### 26.5 Localização

Algumas strings permanentes ainda são montadas diretamente em PT/EN fora dos ARBs.

### 26.6 Tablet

Ainda não validado como experiência otimizada.

### 26.7 Acessibilidade

Há implementação parcial, mas falta auditoria sistemática com text scaling, TalkBack e contraste.

## 27. UI 2.0 — FUTURO

UI 2.0 deve ser uma evolução incremental, não uma reconstrução.

Prioridades:

1. consolidar ThemeData;
2. preparar light/dark tokens;
3. reduzir cores literais;
4. consolidar componentes;
5. melhorar estados;
6. validar acessibilidade;
7. validar responsividade;
8. preservar comportamento pedagógico.

Não alterar fluxo funcional apenas para modernização visual sem justificativa.

## 28. Critérios de aceite visual

Uma nova tela/componente deve ser considerada pronta quando, conforme o risco:

1. usa tokens oficiais;
2. mantém hierarquia clara;
3. possui estados loading/disabled/error quando necessários;
4. não depende apenas de cor;
5. funciona em PT e EN;
6. não apresenta overflow nas larguras suportadas;
7. considera text scaling;
8. possui semântica adequada;
9. não cria novo padrão visual sem necessidade;
10. não contradiz fluxo pedagógico;
11. não anuncia feature inexistente;
12. foi validado em dispositivo real quando tamanho físico/layout importar.

## 29. Governança

Mudanças que alterem qualquer um destes itens devem atualizar este documento:

- identidade;
- tagline;
- paleta;
- tipografia;
- spacing;
- componentes;
- navegação;
- dark mode;
- acessibilidade;
- responsividade;
- padrões de questão;
- materiais promocionais.

O Design System descreve a experiência oficial, mas não deve esconder limitações atuais da implementação.
