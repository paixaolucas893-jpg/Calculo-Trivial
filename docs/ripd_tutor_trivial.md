# Relatório de Impacto à Proteção de Dados Pessoais — Tutor Trivial

Última revisão: 2026-10-02  
Status: avaliação interna pré-produção  
Projeto/processo: Tutor Trivial com IA generativa

## 1. Objetivo e justificativa

Este RIPD documenta os tratamentos de dados pessoais relacionados ao Tutor Trivial antes de sua disponibilização ampla. A avaliação é preventiva e considera que o recurso combina dados educacionais, tratamento automatizado e tecnologia de IA generativa. O produto é educacional e pode alcançar adolescentes; por isso, o tratamento deve considerar salvaguardas reforçadas e o melhor interesse quando houver titulares crianças ou adolescentes.

Este documento não substitui revisão jurídica antes da operação comercial ampla.

## 2. Escopo do tratamento

O Tutor recebe apenas o contexto pedagógico necessário para responder à solicitação autenticada do usuário. O backend controla a sessão, a questão/aula autorizada, o nível de pista, idempotência, rate limits e a resposta estruturada do modelo.

O modelo de IA não possui autoridade para:
- conceder XP, moedas ou recompensas;
- alterar progresso já registrado;
- aprovar teste final;
- desbloquear conteúdo Premium;
- acessar senha ou dados de pagamento.

## 3. Categorias de dados

### Dados diretamente associados ao usuário
- UID do Firebase no backend;
- aula, questão ou tentativa autorizada;
- mensagem enviada ao Tutor;
- nível de pista e estado da sessão;
- progresso mínimo necessário quando uma ação depender de contexto confiável.

### Dados técnicos
- identificadores de sessão e request;
- registros de idempotência;
- contadores de rate limit;
- timestamps de criação, interação e expiração;
- sinais de App Check e integridade tratados pela infraestrutura aplicável.

### Dados que não devem ser enviados ao modelo
- senha;
- dados de cartão ou pagamento;
- secrets e credenciais;
- documentos de identidade;
- dados fora do contexto pedagógico necessário.

## 4. Fluxo de dados

1. O aplicativo autentica o usuário com Firebase Authentication.
2. O cliente chama uma Cloud Function protegida por autenticação e App Check.
3. O backend valida payload, contexto permitido, rate limit e idempotência.
4. O backend recupera apenas o conteúdo pedagógico confiável necessário.
5. O prompt é construído pelo backend e enviado ao Google Gemini.
6. A resposta estruturada é validada por schema e filtros de segurança.
7. O backend devolve apenas o conteúdo público permitido ao aplicativo.
8. Sessões e registros técnicos efêmeros expiram segundo os campos `expiresAt` e as políticas TTL versionadas.

## 5. Finalidades

- fornecer pistas graduais;
- explicar erros e conceitos;
- apresentar passos quando solicitado;
- criar exercício similar ancorado em conteúdo confiável;
- recomendar revisão quando houver base confiável para isso;
- impedir abuso, repetição indevida e manipulação do backend.

Não faz parte da finalidade:
- publicidade comportamental;
- perfilamento comercial;
- venda de dados;
- decisões acadêmicas formais;
- inferência de saúde, emoção, religião, raça, orientação política ou outras características não necessárias ao ensino de matemática.

## 6. Necessidade e proporcionalidade

A arquitetura adota minimização por design:
- o cliente não escolhe livremente o contexto interno enviado ao modelo;
- referências bibliográficas são controladas pelo backend;
- sessões do Tutor expiram após 30 minutos de inatividade;
- idempotência tem validade operacional de 24 horas;
- rate limits possuem prazo técnico;
- registros efêmeros possuem configuração TTL;
- o modelo não escreve diretamente em progresso, recompensas ou compras.

O armazenamento persistente de conversas completas do Tutor não é necessário para o funcionamento atual e não deve ser habilitado sem nova avaliação.

## 7. Titulares e idade

O produto é voltado principalmente a estudantes de matemática, incluindo adolescentes e adultos. A política pública não deve tratar 13 anos como um limiar jurídico geral da LGPD.

Quando houver tratamento de dados de crianças ou adolescentes:
- o melhor interesse deve orientar a operação;
- a linguagem de privacidade deve ser adequada à compreensão do público;
- devem ser evitados usos secundários incompatíveis;
- qualquer base legal deve ser avaliada no caso concreto;
- quando consentimento for a base aplicável, devem ser observados os requisitos específicos pertinentes;
- recursos de IA que ampliem coleta, perfilamento ou retenção exigem nova avaliação antes do lançamento.

### Decisão pendente antes da produção ampla do Tutor

Definir e documentar uma estratégia de idade adequada ao produto, escolhendo entre:
1. restringir efetivamente o recurso a uma faixa etária definida, com mecanismo proporcional de aferição; ou
2. suportar menores de idade com salvaguardas, transparência e bases legais adequadas ao caso.

Não coletar data de nascimento apenas para “resolver” a pendência sem avaliar necessidade, proporcionalidade e impacto da nova coleta.

## 8. Critérios de risco

Escala usada neste documento:
- Probabilidade: baixa, média, alta.
- Impacto: baixo, médio, alto.
- Risco residual: avaliação após controles existentes.

| Risco | Probabilidade inicial | Impacto | Controles atuais | Risco residual |
| --- | --- | --- | --- | --- |
| Envio excessivo de dados ao modelo | média | alto | prompt backend-owned, schema estrito, contexto whitelisted, proibição de senha/pagamento | médio |
| Usuário inserir dado pessoal desnecessário na mensagem | média | médio | finalidade educacional, limites de payload, retenção curta de sessão | médio |
| Exposição cruzada entre usuários | baixa | alto | Auth, App Check, UID autenticado, isolamento de sessão, testes de ownership | baixo |
| Modelo produzir conteúdo não autorizado ou links | média | médio | schema, filtros de HTML/SVG/data URL/links/base64, referências autorizadas | baixo |
| Modelo alterar progresso ou recompensas | baixa | alto | separação de autoridade; backend canônico; modelo sem acesso de escrita | baixo |
| Reidentificação por logs/contexto | baixa | médio | minimização, owner hash em controles técnicos, retenção limitada | baixo/médio |
| Retenção excessiva de sessão | baixa | médio | expiração de 30 min e TTL versionado | baixo |
| Uso indevido de dados de menor | média enquanto idade não estiver definida | alto | finalidade educacional, minimização; estratégia de idade ainda pendente | **alto** |
| Perfilamento educacional excessivo | baixa/média | alto | progresso limitado ao necessário; sem perfilamento comercial; IA sem decisão acadêmica formal | médio |
| Dependência indevida de recomendação automática | média | médio | Tutor como apoio, sem aprovação/desbloqueio/nota; usuário pode continuar sem aceitar recomendação | baixo/médio |
| Indisponibilidade/erro do provedor de IA | média | baixo/médio | resposta controlada de indisponibilidade, timeout e tratamento de erro | baixo |
| Abuso automatizado/custo excessivo | média | médio | rate limit, idempotência, App Check | baixo/médio |

## 9. Salvaguardas implementadas

- Firebase Authentication.
- App Check obrigatório nas callables do Tutor.
- Rate limiting transacional.
- Idempotência de 24 horas.
- Sessões opacas e imprevisíveis.
- Expiração de sessão após 30 minutos de inatividade.
- Firestore TTL versionado para dados efêmeros.
- Contexto pedagógico controlado pelo backend.
- Resposta estruturada validada.
- Limite de tamanho da resposta do provedor.
- Bloqueio de HTML, SVG, data URLs, JavaScript URLs, Markdown images e links gerados pelo modelo.
- Testes de isolamento entre usuários.
- Exportação de dados pessoais.
- Exclusão de conta.
- Plano de resposta a incidentes.
- Teste automatizado que proíbe logging nos pontos críticos do Tutor/Gemini.
- Registro de operações de tratamento.

## 10. Pendências obrigatórias antes de produção ampla do Tutor

- [ ] Definir e implementar estratégia de idade.
- [ ] Revisar a hipótese legal aplicável a cada tratamento do Tutor, inclusive para menores, com apoio jurídico.
- [ ] Revisar termos/DPA e mecanismos de transferência internacional do Google/Firebase/Gemini e RevenueCat.
- [ ] Definir retenção dos Cloud Logs e confirmar ausência de conteúdo desnecessário do prompt nos logs.
- [ ] Verificar se o provedor/modelo usa os dados enviados para treinamento na configuração contratada e documentar a configuração efetiva.
- [x] Criar teste/inspeção para impedir logging acidental de mensagens completas do Tutor.
- [ ] Revisar linguagem de privacidade em formato adequado ao público mais jovem.
- [ ] Revisar este RIPD após qualquer mudança em memória de longo prazo, analytics, recomendação adaptativa ou novos provedores.

## 11. Decisão provisória

A arquitetura atual apresenta controles técnicos fortes para autenticação, autorização, integridade pedagógica e minimização. O risco residual relacionado a menores permanece alto enquanto a estratégia de idade não estiver definida e implementada.

Portanto, a liberação ampla do Tutor para produção deve permanecer condicionada à resolução da estratégia de idade e das pendências jurídicas/contratuais acima.

## 12. Referências normativas e orientativas

- Lei nº 13.709/2018 — LGPD, especialmente arts. 5º, XVII; 6º; 7º; 10; 14; 18; 20; 38 e 50.
- ANPD — Perguntas e Respostas sobre Relatório de Impacto à Proteção de Dados Pessoais (RIPD).
- Resolução CD/ANPD nº 2/2022, especialmente critérios de tratamento de alto risco.
- ANPD — Enunciado sobre tratamento de dados pessoais de crianças e adolescentes.
