# Backend Architecture — Cálculo Trivial

Última atualização: 2026-10-10
Status: arquitetura oficial de backend

## 1. Visão

O backend do Cálculo Trivial usa Firebase como infraestrutura principal e Cloud Functions para operações que exigem confiança maior que o cliente.

Arquitetura simplificada:

Flutter
→ Firebase Authentication
→ Cloud Firestore
→ Cloud Functions
→ serviços confiáveis
→ Gemini / RevenueCat / Google Play quando aplicável.

## 2. Princípio de confiança

O dispositivo do usuário é considerado ambiente não confiável para decisões críticas.

O cliente pode apresentar interface, armazenar estado local e enviar intenções.

O backend deve validar operações como:

- avaliação segura;
- conclusão confiável;
- ações sensíveis de conta;
- chamadas de IA;
- limites de abuso.

## 3. Firebase Authentication

Responsabilidades:

- identidade;
- login;
- cadastro;
- recuperação;
- logout;
- reautenticação;
- exclusão.

UID é a chave principal para isolamento de dados.

## 4. Firestore

Dados de usuário são isolados no espaço do próprio UID.

Regras atuais validam:

- ownership;
- campos permitidos;
- tipos;
- limites;
- IDs de conteúdo;
- valores numéricos;
- progresso plausível.

Coleções ou documentos futuros devem nascer fechados por padrão.

## 5. Persistência de progresso

O estado educacional inclui:

- aulas/módulos concluídos;
- conteúdo concluído;
- estatísticas;
- desempenho por questão;
- histórico de aprendizagem;
- rotação de questões;
- desafio diário;
- sessões de revisão.

Parte desse estado possui cópia local para tolerância offline.

## 6. Progresso canônico

XP, ouro, desbloqueios e conclusão não devem depender de dados derivados do Smart Review ou de texto gerado por IA.

O backend deve ser progressivamente a autoridade para recompensas e conclusões críticas.

## 7. Teste final seguro

Fluxo:

Cliente
→ startFinalTest
→ backend valida usuário e rate limit
→ cria sessão
→ seleciona catálogo seguro
→ devolve questões sem resposta correta
→ usuário responde
→ submitFinalTest
→ backend valida sessão e respostas
→ calcula resultado
→ aplica conclusão confiável.

Objetivo: reduzir fraude trivial por inspeção do cliente.

## 8. Tutor Trivial

Componentes existentes incluem:

- configuração;
- contratos;
- content repository;
- idempotência;
- rate limit;
- session store;
- orchestrator;
- callable handler;
- cliente Gemini.

Fluxo:

Cliente
→ callable tutor
→ autenticação
→ App Check
→ validação
→ rate limiting
→ idempotência
→ recuperar contexto autorizado
→ Gemini
→ resposta estruturada
→ cliente.

## 9. Secrets

GEMINI_API_KEY deve permanecer em secret server-side.

Nenhum secret administrativo deve entrar no bundle Flutter.

Assinatura Android permanece fora do repositório.

## 10. App Check

Produção Android deve usar Play Integrity.

Emuladores e desenvolvimento podem usar mecanismos de debug controlados.

Callables sensíveis devem usar enforceAppCheck quando apropriado.

## 11. Rate limiting

Rate limiting deve proteger endpoints sujeitos a:

- custo;
- abuso;
- spam;
- processamento intensivo;
- IA;
- avaliações seguras.

Limites devem retornar erro controlado e, quando possível, retryAfter.

## 12. Idempotência

Operações que possam ser reenviadas devem evitar efeitos duplicados.

Especialmente importante em:

- chamadas com custo;
- conclusão;
- processamento de sessão;
- operações repetíveis por falha de rede.

## 13. Contratos

Entradas e saídas devem ser validadas.

Requisitos:

- tipos explícitos;
- tamanho limitado;
- enums/IDs conhecidos;
- rejeição de campos inesperados quando segurança justificar;
- respostas estruturadas;
- mensagens de erro sem detalhes sensíveis.

## 14. Exclusão de conta

Fluxo backend deve:

- exigir usuário autenticado;
- exigir reautenticação quando necessário;
- apagar dados relacionados;
- apagar conta Auth;
- evitar deixar dados privados órfãos sem justificativa;
- permitir limpeza local depois do sucesso.

## 15. Smart Review

Smart Review é inicialmente client/domain-derived e não cria autoridade nova.

Dados utilizados:

- QuestionPerformance;
- LearningHistory;
- metadados de conteúdo.

Resultado:

- recomendação de revisão.

Não pode:

- concluir módulo;
- dar nota;
- conceder recompensa;
- criar classificação permanente de capacidade.

## 16. RevenueCat

RevenueCat gerencia entitlement Premium.

Requisitos:

- somente Public SDK Key no cliente;
- secrets administrativos fora do cliente;
- restauração suportada;
- falhas do serviço não devem corromper progresso educacional;
- Premium e progresso devem permanecer conceitos separados.

## 17. Segurança

Princípios permanentes:

- deny-by-default;
- least privilege;
- validação server-side;
- App Check;
- autenticação;
- rate limiting;
- idempotência;
- secrets isolados;
- logs mínimos;
- dependências auditadas;
- proteção contra abuso;
- teste de regras.

## 18. Privacidade

Não persistir sem necessidade:

- conversa completa do Tutor;
- texto livre de estudo;
- perfil psicológico;
- rótulos de capacidade;
- PII duplicada.

Relatórios futuros de professor devem ter modelo próprio de autorização e consentimento.

## 19. Observabilidade

Logs devem permitir diagnóstico técnico sem expor conteúdo sensível.

Separar ambientes de:

- desenvolvimento;
- testes;
- produção.

## 20. Backups e recuperação

À medida que o produto escalar, formalizar:

- política de backup;
- retenção;
- restauração testada;
- migrations;
- rollback;
- recuperação de incidente.

## 21. Testes

Backend deve manter:

- unit tests;
- integration tests quando necessário;
- Firestore Emulator;
- testes de regras;
- testes de autenticação/autorização;
- testes de limites;
- testes de payload malformado;
- testes de regressão de avaliação segura.

## 22. Evolução

Novas funções devem ser adicionadas somente quando houver necessidade de confiança, segurança, custo ou orquestração.

Não mover lógica para backend apenas por preferência arquitetural se isso aumentar complexidade sem benefício real.
