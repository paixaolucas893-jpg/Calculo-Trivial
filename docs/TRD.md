# TRD — Cálculo Trivial

Última atualização: 2026-10-10
Status: documento mestre técnico

## 1. Objetivo

Este documento define os requisitos técnicos permanentes do Cálculo Trivial e serve como referência para novas funcionalidades, releases e revisões arquiteturais.

## 2. Stack principal

Aplicativo:

- Flutter;
- Dart;
- Material 3;
- Android como plataforma oficial de publicação atual.

Backend:

- Firebase Authentication;
- Cloud Firestore;
- Cloud Functions;
- Firebase App Check;
- Play Integrity em Android release;
- Firebase Hosting para páginas públicas.

Monetização:

- RevenueCat;
- Google Play Billing.

IA:

- Tutor Trivial no backend;
- Gemini por secret server-side;
- respostas estruturadas e controladas pelo backend.

Persistência local:

- SharedPreferences para estado compatível com uso offline e sincronização posterior.

CI/CD:

- GitHub Actions;
- flutter analyze;
- flutter test;
- Functions lint/build/test;
- Firestore Emulator;
- build AAB assinado por workflow dedicado.

## 3. Estrutura do cliente

Organização principal:

- lib/features: telas e fluxos orientados a funcionalidade;
- lib/shared/data: conteúdo e bancos de exercícios;
- lib/shared/domain: regras de domínio e seletores;
- lib/shared/services: integrações;
- lib/shared/state: progresso e estado compartilhado;
- lib/shared/theme: cores, tipografia, espaçamento e motion;
- lib/shared/widgets: componentes reutilizáveis.

Novas funcionalidades devem preferir lógica pura em shared/domain antes de acoplar regras à interface.

## 4. Arquitetura de dados

O progresso deve ser separado entre:

- progresso canônico;
- estatísticas;
- desempenho por questão;
- histórico de aprendizagem;
- sessões recentes;
- dados de desafio;
- dados derivados para recomendação.

Dados derivados não devem substituir a fonte canônica de aprovação ou conclusão.

## 5. Autenticação

Requisitos:

- Firebase Auth;
- suporte aos provedores oficialmente habilitados;
- sessão encerrada corretamente no logout;
- reautenticação quando necessária para ações sensíveis;
- exclusão de conta fim a fim;
- isolamento de dados por UID;
- nenhum fluxo deve confiar apenas em identidade apresentada pela UI.

## 6. Firestore

Requisitos:

- acesso privado por usuário;
- regras deny-by-default;
- allowlists para IDs de conteúdo quando aplicável;
- limites de tamanho;
- validação de tipos;
- validação de campos permitidos;
- proteção contra alteração indevida de progresso canônico;
- testes com Firestore Emulator.

O cliente não deve ser tratado como autoridade perfeita para recompensas ou aprovação.

## 7. Cloud Functions

Responsabilidades atuais incluem:

- Tutor Trivial;
- exclusão de conta;
- teste final seguro;
- conclusão confiável;
- rate limiting;
- idempotência;
- sessões;
- validação de contratos.

Funções sensíveis devem:

- exigir autenticação;
- usar App Check quando aplicável;
- validar payload;
- aplicar limites;
- retornar erros controlados;
- não expor secrets;
- evitar confiar em valores críticos enviados pelo cliente.

## 8. Teste final

A avaliação final deve usar catálogo seguro no backend quando o conteúdo for crítico.

O cliente recebe somente o necessário para apresentar a questão.

A resposta correta não deve ser exposta no payload público de uma prova segura.

O backend deve validar submissão e conclusão antes de conceder progresso canônico.

## 9. Tutor Trivial

Requisitos técnicos:

- chave de IA somente em secret server-side;
- autenticação;
- App Check;
- rate limiting;
- idempotência;
- controle de sessão;
- contratos estruturados;
- contexto mínimo;
- separação entre instruções confiáveis e conteúdo não confiável;
- IA não pode conceder progresso, Premium, XP ou conclusão;
- logs não devem armazenar conversa privada desnecessariamente.

## 10. Smart Review

Camada de domínio:

- SkillReviewSummary;
- SkillReviewAggregator;
- SmartReviewPlanItem;
- SmartReviewReason;
- SmartReviewPlanner.

Requisitos:

- determinismo;
- explicabilidade;
- compatibilidade com conteúdo sem skill completa;
- fallback skill → subtopicId → questionId;
- nenhuma persistência obrigatória adicional na primeira versão;
- não alterar progresso canônico;
- não introduzir conteúdo futuro;
- manter seletor antigo como fallback até integração completa.

## 11. Offline e sincronização

O app deve continuar útil quando a conectividade falhar dentro do escopo suportado.

Requisitos:

- persistência local para dados apropriados;
- fila de gravação;
- sincronização tolerante a falhas;
- falha remota não deve apagar progresso local;
- merge deve ser previsível;
- dados duplicados devem ser tratados quando necessário;
- ações que exigem backend confiável devem indicar indisponibilidade em vez de simular sucesso.

## 12. Segurança de secrets e build

Nunca versionar:

- service accounts;
- chaves secretas;
- keystores;
- senhas de assinatura;
- tokens administrativos;
- secrets de IA.

Chaves públicas de SDK podem existir no cliente apenas quando o provedor as classifica explicitamente como públicas.

Build release deve usar CI limpo e assinatura segura.

## 13. Dependências

Toda nova dependência deve ser avaliada por:

- necessidade;
- manutenção;
- licença;
- reputação;
- risco de typosquatting;
- superfície de ataque;
- impacto no tamanho do app;
- impacto em privacidade;
- compatibilidade com Flutter atual.

## 14. Logs e observabilidade

Não registrar:

- senhas;
- tokens;
- secrets;
- conteúdo privado de Tutor;
- PII desnecessária;
- respostas de avaliação quando não houver necessidade operacional.

Erros de produção devem ser úteis sem expor detalhes internos sensíveis.

## 15. Privacidade

Requisitos:

- minimização;
- finalidade explícita;
- exclusão de conta;
- retenção proporcional;
- política de privacidade consistente com o comportamento real;
- Data Safety do Play Console consistente com SDKs e dados efetivamente coletados.

## 16. Versionamento e release

Regras:

- versionCode nunca pode ser reutilizado no Google Play;
- package Android não deve mudar após publicação;
- release em teste deve permanecer isolada de desenvolvimento futuro;
- branch de feature não deve alterar AAB em validação;
- mudanças devem passar CI antes de merge;
- builds para Play devem ser reproduzíveis pelo workflow oficial.

## 17. Qualidade mínima antes de merge

Obrigatório, conforme o risco:

- dart format;
- flutter analyze;
- flutter test;
- Functions lint;
- Functions build;
- testes Functions;
- Firestore Emulator;
- testes de regressão do domínio;
- revisão de segurança;
- revisão de privacidade;
- validação de migração/compatibilidade.

## 18. Requisitos não funcionais

O produto deve buscar:

- estabilidade;
- previsibilidade;
- responsividade;
- acessibilidade;
- baixo acoplamento;
- tolerância a falhas;
- comportamento offline razoável;
- segurança por padrão;
- compatibilidade com dispositivos Android suportados;
- manutenção evolutiva sem reconstruções desnecessárias.

## 19. Governança técnica

Novas fases devem:

1. revisar arquitetura;
2. definir contratos;
3. implementar domínio;
4. escrever testes;
5. integrar UI;
6. validar segurança;
7. validar privacidade;
8. validar regressão;
9. somente então entrar em release.

Documentos de fase complementam este TRD, mas não substituem estes requisitos permanentes.
