# Roadmap Mestre — Cálculo Trivial

Última atualização: 2026-10-10
Status: documento mestre de evolução

## 1. Regra de governança

As decisões abaixo são cumulativas.

Nova fase não apaga, substitui ou ignora requisitos anteriores.

Segurança, privacidade, Tutor Trivial, pedagogia, compatibilidade e regressão permanecem requisitos permanentes.

## 2. Estado atual

Release do Teste Fechado: 1.2.0+24.

A release de teste deve permanecer isolada enquanto funcionalidades futuras são desenvolvidas em branches separadas.

## 3. Partes 1–22

### Parte 1 — preservar desenvolvimento existente
Status: permanente.

Não reconstruir nem abandonar etapas já concluídas.

### Parte 2 — segurança e privacidade
Status: permanente.

LGPD, autenticação, regras, secrets, exclusão, permissões e proteção contra abuso devem acompanhar todas as fases.

### Parte 3 — menores de idade
Status: permanente.

Minimização de dados, consentimento quando necessário e proteção adicional em experiências futuras.

### Parte 4 — estrutura pedagógica por aula
Status: parcial.

Meta: conteúdo → exemplos → prática → teste da aula → avanço. Bancos maiores e validação progressiva permanecem em evolução.

### Parte 5 — prova final por módulo
Status: parcial/avançado.

Catálogos seguros e fluxo de avaliação final já existem. Continuar ampliando cobertura e validação.

### Parte 6 — banco de questões
Status: ativo.

Expandir em ciclos validados. Não aumentar volume apenas por quantidade.

### Parte 7 — referências confiáveis
Status: permanente.

Conteúdo deve usar referências educacionais confiáveis e questões autorais.

### Parte 8 — organização de conteúdos
Status: ativo.

Fundamentos → Ensino Médio → Pré-Cálculo → Cálculo, com crescimento progressivo.

### Parte 9 — não reescrever conteúdo sem necessidade
Status: permanente.

Preservar o que foi revisado e validado.

### Parte 10 — área do professor
Status: futuro.

Não implementar antes de definir dados, permissões, privacidade e valor pedagógico.

### Parte 11 — licenciamento
Status: futuro.

Professor/turma/escola são possibilidades de expansão.

### Parte 12 — evitar infraestrutura B2B precoce
Status: sendo respeitado.

B2C continua prioridade atual.

### Parte 13 — Funções como piloto pedagógico
Status: planejado/evolutivo.

Usar para validar melhorias antes de replicar indiscriminadamente.

### Parte 14 — segurança antes de novas features
Status: permanente.

Toda feature deve passar revisão proporcional de ameaça.

### Parte 15 — regressão
Status: permanente.

Não quebrar login, progresso, Premium, conteúdo, testes ou release ativa.

### Parte 16 — execução passo a passo
Status: permanente.

Mudanças pequenas, verificáveis e testadas.

### Parte 17 — preservar arquivos e funcionalidades
Status: permanente.

Mudanças de código devem considerar o arquivo completo e não remover funcionalidade sem decisão explícita.

### Parte 18 — Tutor Trivial
Status: central/em evolução.

Deve estar integrado à pedagogia, segurança, privacidade, avaliação e futuro licenciamento.

### Parte 19 — dark mode
Status: planejado.

Novos componentes devem ser preparados para tokens e temas.

### Parte 20 — diferenciação pedagógica
Status: ativo.

Diagnóstico → habilidades → revisão → recomendação → Tutor → domínio progressivo.

### Parte 21 — engajamento e gamificação
Status: parcial.

XP, ouro, sequência, desafio e progresso existem. Aprendizagem deve continuar acima de engajamento.

### Parte 22 — áreas e trilhas
Status: definido/futuro.

Estrutura: Área/Trilha → Conteúdo → Módulo → Aula → Prática/Avaliação.

Princípio: conteúdo único, múltiplas trilhas quando necessário.

## 4. FASE 9 — Histórico de Aprendizagem

Status: implementada em branch, PR draft.

Objetivo:

- registrar até 100 eventos recentes;
- questionId;
- contentLessonId quando disponível;
- acerto/erro;
- origem;
- timestamp;
- persistência local + Firestore;
- atividade recente na tela de progresso.

Restrições:

- sem nome/e-mail;
- sem conversa Tutor;
- sem texto livre;
- não concede XP;
- não conclui módulo;
- não é relatório confiável de professor.

CI validado.

## 5. FASE 10 — Smart Review

### 10.1 Arquitetura
Status: concluída.

### 10.2 Agregador por habilidade
Status: implementada em branch.

### 10.3 Planner/seletor
Status: implementada em branch e CI verde.

### 10.4 Integração com Revisão Personalizada
Status: próximo passo.

### 10.5 Explicabilidade e Tutor Trivial
Status: pendente.

### 10.6 Regressão, segurança, privacidade e validação pedagógica
Status: pendente.

## 6. Próximas prioridades de produto

Ordem recomendada:

1. concluir validação real do Teste Fechado 1.2.0+24;
2. integrar Smart Review sem alterar progresso canônico;
3. testar Smart Review;
4. validar Premium em cenários reais;
5. validar exclusão de conta e App Check em release;
6. revisar inconsistências visuais e de progresso;
7. evoluir Design System/dark mode;
8. pilotar testes por aula;
9. continuar expansão pedagógica validada;
10. só então ampliar recursos institucionais.

## 7. Currículo

Direção:

- Fundamentos Matemáticos;
- Ensino Médio;
- Pré-Cálculo;
- Cálculo;
- expansões futuras para tópicos avançados.

Conteúdo pode alimentar trilhas distintas sem duplicação desnecessária.

## 8. Avaliação pedagógica futura

Itens registrados:

- recuperação ativa;
- prática espaçada;
- exemplos resolvidos;
- fading;
- diagnóstico de dificuldades;
- análise de erros;
- comparação de estratégias;
- confiança;
- interleaving;
- transferência;
- múltiplas representações.

Implementar um piloto de cada vez.

## 9. Professor e instituição

Antes de implementação:

- definir modelo de dados;
- consentimento;
- autorização;
- retenção;
- relatórios;
- limites do que pode ser visto;
- separação de conversa Tutor;
- fonte confiável de progresso.

## 10. Métricas

Telemetria não deve virar fonte oficial de progresso.

PostHog ou outra solução só deve ser integrada após avaliação explícita.

Eventos devem ser mínimos e sem PII desnecessária.

## 11. Produção

Produção ampla somente após:

- teste fechado validado;
- conta e autenticação estáveis;
- Premium validado;
- App Check validado;
- Data Safety consistente;
- exclusão de conta validada;
- regressão em aparelho real;
- conteúdo e avaliação revisados;
- segurança crítica aprovada.

## 12. Pós-lançamento

Após produção:

- monitoramento;
- bugs;
- feedback;
- retenção saudável;
- desempenho;
- segurança;
- currículo;
- experimentos pedagógicos controlados.

Nenhuma métrica de engajamento isolada deve comandar o roadmap.
