# Roadmap Mestre — Cálculo Trivial

Última atualização: 2026-10-13  
Status: documento mestre de evolução  
Baseline de release: 1.2.0+24

## 1. Objetivo

Este roadmap define a ordem de evolução do Cálculo Trivial.

Ele não substitui:

- PRD;
- TRD;
- Product Flows;
- Design System;
- Backend Architecture;
- currículo;
- backlog pedagógico especializado.

O roadmap responde principalmente:

- onde o produto está;
- qual é o próximo gate;
- quais itens bloqueiam avanço;
- o que pode ser desenvolvido em paralelo;
- quando uma feature pode entrar em release.

## 2. Regra de governança

As decisões são cumulativas.

Uma fase nova não apaga:

- segurança;
- privacidade;
- LGPD;
- pedagogia;
- acessibilidade;
- localização;
- compatibilidade;
- regressão;
- Tutor Trivial;
- requisitos das Partes 1–22.

O roadmap deve refletir o estado real do produto, não apenas intenção futura.

## 3. Estados oficiais

Cada frente deve usar um destes estados:

### CONCLUÍDO

Implementado, validado no escopo previsto e sem bloqueador conhecido para aquele escopo.

### EM DESENVOLVIMENTO

Existe código/documentação em branch ou PR, mas ainda não pertence à release oficial.

### EM VALIDAÇÃO

Implementado e integrado ao artefato sob teste, aguardando validação real.

### BLOQUEADO

Não deve avançar até uma dependência explícita ser resolvida.

### PLANEJADO

Escopo definido, implementação ainda não iniciada.

### FUTURO

Direção de produto reconhecida, mas sem autorização para execução imediata.

### PERMANENTE

Regra transversal que nunca é considerada “encerrada”.

## 4. Baseline atual

Release de Teste Fechado:

`1.2.0+24`.

Essa release deve permanecer isolada de funcionalidades novas enquanto sua validação real não estiver encerrada.

Estado conhecido:

- bundle 24 foi gerado e aceito no fluxo de Teste Fechado;
- validação real de todos os cenários críticos ainda não deve ser presumida como concluída;
- FASE 9 e FASE 10 não pertencem à 1.2.0+24.

## 5. Grafo atual de desenvolvimento

### Release

`release/p1-precalculus-v1`
→ baseline 1.2.0+24.

### Documentação

PR #93  
`docs/product-architecture-baseline`
→ documentação apenas  
→ independente funcionalmente da FASE 9/10.

### FASE 9

PR #88  
`feat: add bounded learning history`
→ Draft  
→ CI validado  
→ não mergear na release enquanto o gate de Teste Fechado não autorizar.

### FASE 10

PR #92  
`feat: add Smart Review skill aggregation and planner`
→ Draft  
→ depende logicamente da FASE 9  
→ FASE 10.2 e 10.3 implementadas  
→ CI validado  
→ não mergear diretamente na release antes da FASE 9.

## 6. GATE D0 — Baseline documental

Status: EM DESENVOLVIMENTO.

Objetivo:

formalizar a referência oficial do projeto antes de ampliar novas features.

Documentos:

- PRD;
- TRD;
- Product Flows;
- Design System;
- Backend Architecture;
- Roadmap;
- índice de documentação.

Critério de saída:

1. documentos refletem a release real;
2. estados atual/futuro estão separados;
3. dívidas técnicas estão explícitas;
4. nenhum documento promete feature inexistente;
5. PR #93 contém somente documentação;
6. revisão final do Roadmap concluída.

Após isso, PR #93 pode sair de Draft para revisão/merge, sem depender da FASE 9/10.

## 7. GATE R1 — Validação do Teste Fechado 1.2.0+24

Status: EM VALIDAÇÃO.

Objetivo:

provar que a baseline atual é estável antes de incorporar aprendizagem adaptativa.

Validar em build distribuída pela Google Play:

- atualização sobre versão anterior;
- login por e-mail;
- login Google;
- logout;
- recuperação de senha;
- progresso existente após atualização;
- sincronização;
- prática;
- Revisão Personalizada;
- Desafio Diário;
- teste final;
- App Check/Play Integrity;
- Premium;
- restauração de compra;
- gerenciamento de assinatura;
- exclusão de conta;
- PT/EN;
- layouts críticos em dispositivo real;
- comportamento offline/reconexão dentro do escopo suportado.

Critério de saída:

- nenhum bug bloqueador de conta, progresso, compra ou avaliação;
- nenhum reset indevido de progresso;
- App Check funcional em distribuição real;
- exclusão de conta executada fim a fim;
- Premium validado nos cenários críticos;
- regressões críticas resolvidas em nova build, se necessário;
- requisitos atuais do Play Console para progressão de track atendidos.

Não fixar neste documento número de testadores ou duração exigida pelo Google Play sem verificar o requisito exibido para a conta no momento da submissão.

## 8. GATE S1 — Hardening pré-produção de confiança

Status: BLOQUEADO por R1 para decisão final de release; análise pode ocorrer em paralelo.

Objetivo:

eliminar ou reduzir as exceções que impedem declarar autoridade confiável.

### Bloqueador principal

Fallback local do teste final.

Na 1.2.0+24, indisponibilidade remota elegível pode levar a:

- correção local;
- aprovação local;
- conclusão local.

Isso conflita com a arquitetura-alvo server-authoritative.

Critério de saída:

- definir política final para indisponibilidade;
- remover, restringir ou redesenhar fallback;
- não conceder progresso canônico a partir de decisão não confiável;
- manter experiência de falha compreensível;
- atualizar testes, TRD, Product Flows e Backend Architecture.

### Outros itens S1

- validar App Check real;
- confirmar exclusão de todos os novos dados do usuário;
- revisar regras finais do Firestore;
- revisar identidade Google ↔ senha;
- revisar Premium em troca de conta e rede instável;
- verificar Data Safety contra comportamento real.

## 9. GATE P9 — Histórico de Aprendizagem

Status: EM DESENVOLVIMENTO.

PR: #88.

Objetivo:

registrar evidência recente limitada para permitir evolução adaptativa.

Escopo aprovado:

- máximo de 100 eventos;
- questionId;
- contentLessonId quando disponível;
- isCorrect;
- source;
- timestamp;
- persistência local + Firestore;
- deduplicação;
- atividade recente.

Privacidade:

- sem nome;
- sem e-mail;
- sem texto livre;
- sem conversa do Tutor;
- sem perfil psicológico.

Autoridade:

- não concede XP;
- não concede ouro;
- não conclui módulo;
- não aprova prova;
- não é relatório confiável de professor.

Critério de integração:

1. R1 encerrado ou estratégia de release explicitamente autorizada;
2. branch sincronizada com a release que receberá a feature;
3. CI verde após sincronização;
4. regras Firestore revisadas para o schema final;
5. migração compatível com usuários sem histórico;
6. reset e exclusão validados;
7. PT/EN e UI de atividade recente revisados;
8. regressão de progresso concluída.

## 10. GATE P10 — Smart Review

Status: EM DESENVOLVIMENTO.

PR: #92.

Dependência:

P9.

### 10.1 Arquitetura

Status: CONCLUÍDO.

### 10.2 Agregador por habilidade

Status: CONCLUÍDO em branch.

Implementado:

- SkillReviewSummary;
- SkillReviewAggregator;
- skill → subtopicId → questionId;
- evidência acumulada;
- sinais recentes;
- saída determinística.

### 10.3 Planner/seletor

Status: CONCLUÍDO em branch.

Implementado:

- SmartReviewPlanItem;
- SmartReviewReason;
- SmartReviewPlanner;
- priorização;
- diversidade;
- redução de repetição;
- proteção contra conteúdo futuro;
- preferência por questão equivalente;
- difficulty ordering em remediação.

CI da camada implementada: verde.

### 10.4 Integração com Revisão Personalizada

Status: PLANEJADO — próximo passo funcional após a consolidação documental.

Objetivo:

usar Smart Review na experiência existente sem remover o seletor atual até regressão completa.

Critérios:

- fallback para seletor atual;
- nenhuma alteração em XP/recompensa;
- nenhuma alteração em prova final;
- nenhuma introdução de conteúdo futuro;
- PT/EN;
- estados vazios/erro;
- testes widget/domain apropriados.

### 10.5 Explicabilidade e Tutor

Status: PLANEJADO.

Objetivo:

mostrar motivo pedagógico simples, por exemplo:

- erro recente;
- habilidade com baixa precisão;
- reforço;
- confirmação de aprendizagem.

Tutor poderá ser sugerido contextualmente.

Não enviar automaticamente histórico bruto nem conversa privada.

### 10.6 Validação completa

Status: PLANEJADO.

Exigir:

- regressão;
- segurança;
- privacidade;
- acessibilidade;
- determinismo;
- validação pedagógica;
- comportamento com bancos pequenos;
- comportamento sem skill;
- reset/exclusão;
- offline/sync;
- dispositivo real.

## 11. GATE T1 — Tutor Trivial na experiência do usuário

Status: PLANEJADO.

Backend:

parcialmente implementado e protegido.

UI:

ainda não ativa na release.

Antes de liberar:

- definir primeiro conjunto de ações expostas na interface;
- não expor ações backend ainda marcadas FEATURE_NOT_READY;
- integrar request_hint/view_steps/create_similar de forma contextual;
- validar indisponibilidade;
- validar rate limit;
- validar sessão expirada;
- validar privacidade;
- manter conteúdo principal utilizável sem IA;
- impedir autoridade sobre nota/progresso/Premium.

`explain_error` e `recommend_review` só podem entrar quando backend e produto estiverem prontos.

## 12. GATE PED1 — Estrutura pedagógica por aula

Status: EM DESENVOLVIMENTO.

Direção:

Aula  
→ conceito  
→ exemplos  
→ prática  
→ avaliação da aula  
→ avanço.

Estado atual:

- aulas e prática existem;
- prova final por módulo existe;
- testes por aula amplos ainda são evolução futura;
- bancos de questões ainda devem crescer de forma validada.

Não implementar testes por aula em massa antes de validar um piloto.

## 13. GATE PED2 — Piloto pedagógico avançado

Status: PLANEJADO.

Tema prioritário registrado:

limites algébricos com fatoração.

Objetivo:

testar um fluxo controlado de:

erro  
→ investigação  
→ pré-requisito  
→ microexplicação  
→ exemplo resolvido  
→ exercício guiado  
→ exercício independente  
→ questão equivalente  
→ revisão futura.

Critérios:

- não diagnosticar por um erro;
- não punir ajuda;
- medir transferência separadamente de repetição;
- preservar progresso;
- usar poucas mudanças por experimento.

## 14. GATE C1 — Conteúdo e banco de questões

Status: PERMANENTE / incremental.

Regra:

qualidade antes de volume.

Estado:

- Álgebra possui cobertura expandida;
- módulos principais possuem prática e prova final;
- currículo de Pré-Cálculo está formalizado;
- expansão 300 → 600 não está autorizada como tarefa imediata.

Próximos ciclos devem:

- validar cobertura;
- validar dificuldade;
- validar alternativas;
- validar explicações;
- validar skill/subtopic;
- validar rastreabilidade de fonte;
- só então ampliar.

## 15. GATE UI1 — UI 2.0 e Dark Mode

Status: FUTURO.

Não é bloqueador da FASE 10.

Antes de iniciar:

- fechar Design System baseline;
- mapear cores literais;
- mapear strings fora dos ARBs;
- definir ThemeData light/dark;
- definir ThemeMode;
- persistir preferência;
- validar contraste;
- validar TalkBack;
- validar text scaling;
- validar Reduce Motion;
- testar telefone;
- testar tablet real/emulado adequadamente.

UI 2.0 deve evoluir, não reconstruir.

## 16. GATE MET1 — Telemetria mínima

Status: FUTURO / NÃO AUTORIZADO.

PostHog ou alternativa não deve ser instalada por este roadmap.

Somente iniciar quando houver comando/decisão explícita.

Antes:

- verificar analytics já existentes;
- definir pergunta de produto;
- definir eventos mínimos;
- evitar PII;
- definir retenção;
- definir exclusão;
- revisar política e Data Safety;
- separar dev/test/prod;
- desativar session replay/captura automática no escopo inicial.

Telemetria nunca é fonte de:

- progresso;
- aprovação;
- XP;
- ouro;
- Premium;
- domínio.

## 17. GATE B2B1 — Professor, turma e instituição

Status: FUTURO.

Não iniciar infraestrutura ampla antes de validar B2C.

Pré-requisitos:

- modelo de consentimento;
- autorização server-side;
- tenant isolation;
- modelo de dados;
- retenção;
- relatórios;
- fonte confiável de progresso;
- exclusão;
- LGPD;
- política de acesso ao histórico;
- separação das conversas privadas do Tutor.

Professor não recebe automaticamente conversa do Tutor.

## 18. Partes 1–22 — status consolidado

### Parte 1 — preservar desenvolvimento existente
Status: PERMANENTE.

### Parte 2 — segurança e privacidade
Status: PERMANENTE.

### Parte 3 — proteção de menores
Status: PERMANENTE.

### Parte 4 — estrutura pedagógica por aula
Status: EM DESENVOLVIMENTO.

### Parte 5 — prova final por módulo
Status: EM DESENVOLVIMENTO / avançado.

Fluxo remoto seguro existe; fallback local ainda impede considerar confiança encerrada.

### Parte 6 — banco de questões
Status: PERMANENTE / incremental.

### Parte 7 — referências confiáveis
Status: PERMANENTE.

### Parte 8 — organização de conteúdos
Status: EM DESENVOLVIMENTO.

### Parte 9 — não reescrever sem necessidade
Status: PERMANENTE.

### Parte 10 — área do professor
Status: FUTURO.

### Parte 11 — licenciamento
Status: FUTURO.

### Parte 12 — não antecipar B2B
Status: PERMANENTE.

### Parte 13 — Funções como piloto
Status: PLANEJADO / evolutivo.

### Parte 14 — segurança antes de features
Status: PERMANENTE.

### Parte 15 — regressão
Status: PERMANENTE.

### Parte 16 — passo a passo
Status: PERMANENTE.

### Parte 17 — preservar funcionalidades
Status: PERMANENTE.

### Parte 18 — Tutor Trivial
Status: EM DESENVOLVIMENTO / central.

### Parte 19 — dark mode
Status: FUTURO.

### Parte 20 — diferenciação pedagógica
Status: EM DESENVOLVIMENTO.

FASE 9/10 são as primeiras camadas concretas.

### Parte 21 — gamificação
Status: EM DESENVOLVIMENTO.

Base existe; balanceamento continua evolutivo.

### Parte 22 — áreas e trilhas
Status: PLANEJADO / arquitetura definida.

Princípio:

conteúdo único, múltiplas trilhas quando necessário.

## 19. Ordem executável recomendada

A ordem de execução atual é:

D0 — concluir documentação mestre  
→ R1 — concluir validação da 1.2.0+24  
→ decidir/corrigir bloqueadores S1  
→ P9 — integrar Histórico de Aprendizagem  
→ P10.4 — integrar Smart Review  
→ P10.5 — explicabilidade/Tutor contextual  
→ P10.6 — regressão e validação  
→ decidir nova release fechada  
→ T1/PED1 conforme resultado  
→ produção somente quando os gates de confiança estiverem encerrados.

Desenvolvimento isolado pode ocorrer em paralelo, mas integração na release deve respeitar essa ordem.

## 20. Critério para nova AAB

Gerar nova AAB de feature somente quando:

- branch de release definida;
- versionCode novo;
- dependências das features integradas na ordem correta;
- CI verde;
- migrations/compatibilidade revisadas;
- regras Firestore atualizadas;
- Functions compatíveis/deployadas quando necessário;
- documentação de release atualizada;
- teste local concluído;
- rollback/fallback compreendido.

Não gerar AAB apenas porque uma branch de feature compilou.

## 21. Gate de produção

Status: BLOQUEADO.

Produção ampla somente quando houver evidência suficiente de:

- Teste Fechado concluído conforme requisitos atuais do Play Console;
- autenticação estável;
- progresso sem regressão;
- App Check/Play Integrity validado;
- Premium validado;
- restauração validada;
- exclusão de conta validada;
- Data Safety consistente;
- política de privacidade consistente;
- teste final sem autoridade insegura incompatível com a promessa do produto;
- conteúdo principal revisado;
- regressão em aparelho real;
- nenhuma vulnerabilidade crítica conhecida;
- plano mínimo de monitoramento e resposta a incidente.

Dark mode, B2B, PostHog e currículo avançado não são requisitos obrigatórios para a primeira produção, salvo decisão posterior de produto.

## 22. Pós-produção

Status: FUTURO.

Após lançamento:

- monitorar estabilidade;
- corrigir crashes/bugs;
- acompanhar suporte;
- analisar feedback;
- validar retenção saudável;
- revisar aprendizagem;
- expandir currículo;
- executar pilotos pedagógicos controlados;
- revisar segurança periodicamente.

Não usar apenas:

- tempo de tela;
- quantidade de cliques;
- sequência;
- XP;

como prova de sucesso educacional.

## 23. Critérios para mudar prioridade

Uma frente só deve furar a ordem quando houver:

- bug crítico;
- vulnerabilidade;
- requisito obrigatório da Google Play;
- quebra de login;
- perda/corrupção de progresso;
- falha de compra/entitlement;
- exclusão de conta quebrada;
- erro pedagógico grave em conteúdo/avaliação.

Ideia nova, pedido visual ou oportunidade comercial não deve automaticamente interromper um gate crítico em andamento.

## 24. Governança do roadmap

Toda mudança significativa deve atualizar:

- status do gate;
- dependências;
- critério de saída;
- PR/branch associado quando existir;
- impacto sobre release;
- documentação relacionada.

Documentos históricos podem permanecer para rastreabilidade, mas este `ROADMAP.md` é a referência mestre para sequência atual.

O roadmap não deve declarar uma tarefa concluída apenas porque o código existe em uma branch; integração, validação e release são estados distintos.
