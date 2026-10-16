# TRD — Cálculo Trivial

Última atualização: 2026-10-10  
Status: documento mestre técnico  
Escopo de referência: release 1.2.0+24 + arquitetura de evolução explicitamente identificada

## 1. Objetivo

Este TRD define como os requisitos do Cálculo Trivial devem ser sustentados tecnicamente.

Ele registra:

- arquitetura real da release atual;
- requisitos técnicos permanentes;
- limites de confiança;
- integrações externas;
- requisitos de segurança e privacidade;
- qualidade mínima;
- dívidas técnicas relevantes;
- arquitetura de funcionalidades em desenvolvimento.

Este documento não deve descrever uma funcionalidade futura como se já estivesse na release ativa.

## 2. Princípios técnicos

O projeto deve preservar os seguintes princípios:

1. cliente não é autoridade para decisões críticas;
2. segurança e privacidade são requisitos permanentes;
3. lógica pedagógica pura deve ficar separada da UI quando possível;
4. mudanças devem ser incrementais e compatíveis;
5. features futuras não devem contaminar uma release em validação;
6. falha de rede não deve apagar progresso local;
7. falha de serviço não deve ser apresentada como sucesso;
8. IA não deve controlar progresso canônico;
9. dados derivados não devem substituir fontes confiáveis;
10. testes devem acompanhar o risco da mudança.

## 3. Baseline tecnológico atual

### 3.1 Aplicativo

- Flutter;
- Dart;
- Material 3;
- Android como plataforma oficial de publicação atual;
- package interno Dart: `calcquest`;
- applicationId Android: `com.lucaszion01.calculotrivial`.

Baseline verificada:

- versão do app: `1.2.0+24`;
- Dart SDK: `^3.12.2`;
- Flutter do CI: `3.44.6`;
- Java/Kotlin target do Android: JVM 17.

### 3.2 Firebase

- Firebase Core;
- Firebase Authentication;
- Cloud Firestore;
- Cloud Functions;
- Firebase App Check;
- Play Integrity em Android não-debug;
- Firebase Hosting para páginas públicas.

### 3.3 Monetização

- RevenueCat;
- Google Play Billing via SDK RevenueCat;
- chave pública RevenueCat injetada em build por `--dart-define`.

### 3.4 IA

- Tutor Trivial executado por Cloud Functions;
- Gemini acessado no backend;
- `GEMINI_API_KEY` mantida em secret server-side;
- contratos e orquestração no backend.

### 3.5 Persistência local

- SharedPreferences para estado local apropriado;
- sincronização posterior com Firestore para progresso suportado.

### 3.6 Localização

A aplicação possui infraestrutura PT/EN por Flutter localization:

- `app_pt.arb`;
- `app_en.arb`;
- `AppLocalizations`;
- locales preferenciais `pt` e `en`.

Novas telas devem usar esse mecanismo.

## 4. Estrutura do cliente

Organização principal:

- `lib/features`: telas e fluxos orientados a funcionalidade;
- `lib/shared/data`: conteúdo e bancos de exercícios;
- `lib/shared/domain`: modelos e regras de domínio;
- `lib/shared/services`: integrações e serviços;
- `lib/shared/state`: estado e progresso compartilhado;
- `lib/shared/theme`: tokens visuais;
- `lib/shared/widgets`: componentes reutilizáveis;
- `lib/l10n`: localização.

### TRD-ARCH-01

Nova regra pedagógica complexa deve preferir implementação em camada de domínio independente de widgets.

### TRD-ARCH-02

UI não deve ser responsável pela autoridade de aprovação, recompensa ou entitlement.

### TRD-ARCH-03

Mudanças arquiteturais não devem exigir reconstrução ampla se uma evolução compatível resolver o problema.

## 5. Modelo de confiança

O dispositivo do usuário é considerado ambiente potencialmente modificável.

Portanto:

- IDs enviados pela UI não são confiáveis por si só;
- respostas declaradas pelo cliente devem ser validadas quando usadas em decisão crítica;
- XP, ouro e conclusão não devem depender somente de valores arbitrários enviados pelo cliente;
- Premium depende do entitlement do provedor;
- IA não é fonte de autoridade;
- dados de analytics, quando existirem, não são progresso oficial.

### TRD-SEC-01

Operações críticas devem ser validadas em componente confiável ou por regras que restrinjam adequadamente o cliente.

## 6. Autenticação

Implementação atual usa Firebase Authentication.

O projeto possui suporte a fluxo de Google Sign-In e autenticação Firebase correspondente.

Requisitos:

### TRD-AUTH-01

Toda leitura/escrita privada deve estar associada ao UID autenticado.

### TRD-AUTH-02

Logout deve encerrar estado Firebase e estado do provedor aplicável.

### TRD-AUTH-03

Ações sensíveis devem exigir reautenticação quando o provedor/Firebase exigir.

### TRD-AUTH-04

Exclusão de conta deve possuir fluxo fim a fim, incluindo dados remotos e limpeza local.

### TRD-AUTH-05

Vínculo entre provedores com mesmo e-mail não deve ser improvisado sem estratégia explícita de merge de identidade e progresso.

## 7. App Check

Na inicialização:

- debug usa `AndroidDebugProvider`;
- release Android usa `AndroidPlayIntegrityProvider`.

A inicialização tem timeout e falha controlada para não impedir a abertura completa do app.

Callables sensíveis podem continuar rejeitando a ação quando App Check obrigatório não estiver válido.

### TRD-SEC-02

Falha de inicialização do App Check não pode transformar operação protegida em operação autorizada.

### TRD-SEC-03

App Check deve ser validado em build real distribuída pelo Google Play antes de produção ampla.

## 8. Firestore

O Firestore armazena dados privados e progresso por usuário.

Requisitos permanentes:

### TRD-DATA-01

Regras devem ser deny-by-default fora dos caminhos explicitamente autorizados.

### TRD-DATA-02

Acesso privado deve verificar UID do usuário.

### TRD-DATA-03

Payloads devem ter campos, tipos, tamanhos e valores limitados quando possível.

### TRD-DATA-04

IDs de conteúdo canônicos devem ser validados por allowlist quando isso for necessário para proteger integridade.

### TRD-DATA-05

Alterações de regras devem possuir testes no Firestore Emulator.

### TRD-DATA-06

Campos derivados não devem permitir alteração indireta de progresso canônico.

## 9. Estado e progresso da release 1.2.0+24

Na release atual, `AppProgress` mantém e sincroniza, entre outros:

- módulos concluídos;
- aulas/conteúdos concluídos;
- total de respostas;
- total de acertos;
- sequência;
- atividade diária;
- desempenho por questão;
- últimas sessões de questões;
- rotação recente de prática;
- últimas sessões de teste final;
- última sessão de revisão personalizada;
- desafio diário.

A FASE 9 adiciona `LearningHistory`, mas esse campo ainda não pertence à release 1.2.0+24.

### TRD-DATA-07

Documentação deve distinguir campos presentes na release de campos existentes apenas em branches de feature.

## 10. Persistência local e sincronização

O cliente grava progresso apropriado localmente e depois tenta persistir remotamente.

A fila de gravação serializa persistências.

Falha remota é tratada sem apagar o estado local.

### TRD-SYNC-01

Salvar localmente deve preceder ou sobreviver a falha de sincronização quando o dado puder ser mantido offline.

### TRD-SYNC-02

Falha de Firestore não deve zerar estado local válido.

### TRD-SYNC-03

Merge de dados entre fontes deve ser determinístico e testado.

### TRD-SYNC-04

Ações que exigem autoridade remota não devem fingir sucesso offline.

## 11. Cloud Functions

Backend atual é TypeScript/Node.js.

Baseline verificada:

- Node.js 20;
- TypeScript 5.1.6;
- Firebase Functions v2;
- Firebase Admin;
- Zod;
- `@google/genai`.

Responsabilidades existentes incluem:

- Tutor Trivial;
- exclusão de conta;
- início de teste final;
- submissão de teste final;
- conclusão confiável no caminho remoto;
- rate limiting;
- idempotência;
- sessões;
- contratos;
- conteúdo confiável.

### TRD-BE-01

Callable sensível deve validar autenticação.

### TRD-BE-02

Callable exposta a abuso/custo deve possuir limite proporcional.

### TRD-BE-03

Payload de entrada deve ser validado antes de uso.

### TRD-BE-04

Erro retornado ao cliente não deve expor secret, stack ou detalhe interno desnecessário.

### TRD-BE-05

Operação repetível com efeito colateral deve considerar idempotência.

## 12. Teste final — caminho confiável

No caminho remoto:

1. cliente solicita início;
2. backend autentica;
3. aplica rate limit;
4. cria sessão;
5. seleciona questões;
6. envia questão e alternativas sem `correctOptionId`;
7. cliente envia respostas;
8. backend valida sessão;
9. backend corrige;
10. backend processa conclusão/recompensa confiável;
11. cliente recebe resultado.

### TRD-EVAL-01

Resposta correta de catálogo seguro não deve aparecer no payload público do teste remoto.

### TRD-EVAL-02

Sessão deve possuir validade e associação apropriada ao usuário.

### TRD-EVAL-03

Submissão deve validar quantidade, IDs e formato das respostas.

## 13. Teste final — fallback local atual

A release atual possui fallback local quando o início remoto falha com alguns códigos, incluindo:

- `not-found`;
- `unavailable`;
- `deadline-exceeded`.

Nesse fallback:

- o banco local contém as respostas corretas;
- a sessão é criada no dispositivo;
- a correção ocorre localmente;
- o módulo pode ser concluído localmente quando aprovado.

Isso fornece resiliência, mas **não possui o mesmo nível de confiança do fluxo remoto**.

### Situação arquitetural

Este comportamento deve ser tratado como exceção de compatibilidade/resiliência da versão atual, não como estado final de segurança.

### TRD-EVAL-04

Antes de considerar o backend autoridade exclusiva sobre conclusão em produção ampla, o fallback local que concede conclusão deve ser removido, restringido ou redesenhado.

### TRD-EVAL-05

Documentação e testes não podem afirmar que toda conclusão é server-authoritative enquanto esse fallback existir.

### TRD-EVAL-06

Se o fallback permanecer em alguma forma, ele não deve ser utilizado para conceder autoridade que o cliente não pode provar.

Esse é um item de dívida técnica explícita.

## 14. Tutor Trivial

Arquitetura existente inclui:

- secret Gemini;
- runtime config;
- content repository;
- contratos;
- idempotência;
- rate limit;
- session store;
- orchestrator;
- callable handler.

Fluxo:

cliente  
→ callable autenticada  
→ App Check  
→ validação  
→ rate limit  
→ idempotência  
→ contexto permitido  
→ Gemini  
→ resposta estruturada  
→ cliente.

### TRD-AI-01

Secret de IA deve existir apenas no backend.

### TRD-AI-02

Conteúdo enviado pelo usuário deve ser tratado como dado não confiável, não como instrução de sistema.

### TRD-AI-03

Tutor não pode conceder:

- XP;
- ouro;
- Premium;
- aprovação;
- conclusão;
- alteração de progresso canônico.

### TRD-AI-04

O app educacional deve continuar utilizável mesmo se Tutor/IA estiver indisponível.

### TRD-AI-05

Não persistir conversa privada sem finalidade explícita e revisão de privacidade.

## 15. RevenueCat e Premium

Implementação atual:

- chave lida por `String.fromEnvironment('REVENUECAT_API_KEY')`;
- configuração opcional;
- vínculo com Firebase UID quando autenticado;
- atualização por listener de `CustomerInfo`;
- restauração de compras;
- logout RevenueCat;
- entitlement `Cálculo Trivial Premium`.

O workflow de AAB valida que a chave usada em release possui prefixo público esperado `goog_` e rejeita padrão de secret `sk_`.

### TRD-PREM-01

Nenhuma RevenueCat secret key pode entrar no bundle.

### TRD-PREM-02

Entitlement deve ser a fonte de acesso Premium, não flag arbitrária da UI.

### TRD-PREM-03

Falha de RevenueCat não deve apagar progresso acadêmico.

### TRD-PREM-04

Restauração de compras deve permanecer suportada.

### TRD-PREM-05

Troca/logout de identidade deve manter comportamento previsível entre Firebase e RevenueCat.

## 16. Smart Review — arquitetura em desenvolvimento

Smart Review **não pertence à release 1.2.0+24**.

Em branch de feature já existem:

- `SkillReviewSummary`;
- `SkillReviewAggregator`;
- `SmartReviewPlanItem`;
- `SmartReviewReason`;
- `SmartReviewPlanner`.

A arquitetura usa:

`skill → subtopicId → questionId` como fallback de agrupamento.

### TRD-SR-01

Planejamento deve ser determinístico.

### TRD-SR-02

O resultado deve ser explicável.

### TRD-SR-03

Conteúdo futuro não deve ser introduzido apenas para completar sessão.

### TRD-SR-04

Smart Review não pode alterar progresso canônico.

### TRD-SR-05

O seletor atual deve permanecer como fallback até integração e regressão completas.

### TRD-SR-06

Dados derivados do Smart Review não devem ser gravados como rótulo permanente de capacidade.

## 17. Localização

### TRD-I18N-01

Strings permanentes de UI devem usar o mecanismo de localização.

### TRD-I18N-02

Novos fluxos devem possuir PT/EN ou permanecer explicitamente bloqueados até completar localização.

### TRD-I18N-03

Conteúdo matemático localizado deve preservar significado, notação e resposta correta.

## 18. Atualização do aplicativo

O projeto utiliza mecanismos para informar/acionar atualização no Android.

### TRD-UPD-01

Falha na consulta de atualização não deve impedir uso normal sem necessidade.

### TRD-UPD-02

Estado de atualização detectado deve ser reutilizado quando possível para evitar consultas redundantes.

### TRD-UPD-03

Fallback para Google Play deve existir quando o fluxo nativo não puder concluir a atualização apropriada.

## 19. Secrets e credenciais

Nunca versionar:

- service-account JSON;
- secret de Gemini;
- RevenueCat secret key;
- keystore;
- `key.properties`;
- senhas de assinatura;
- tokens administrativos;
- credenciais privadas.

### TRD-SEC-04

Segredo deve ser fornecido por secret manager, variável segura ou GitHub Secret conforme o ambiente.

### TRD-SEC-05

Chave pública só pode entrar no cliente quando o provedor documentar que é pública e apropriada para SDK cliente.

## 20. Build Android

O Gradle lê `key.properties` somente quando presente.

Release oficial para Play deve ser gerada pelo workflow controlado.

O workflow atual:

1. valida secrets;
2. rejeita RevenueCat secret key;
3. restaura keystore temporariamente;
4. verifica alias/keystore;
5. executa `flutter pub get`;
6. executa `flutter analyze`;
7. executa `flutter test`;
8. gera AAB release;
9. verifica assinatura com `jarsigner`;
10. publica o AAB apenas como artifact do GitHub;
11. remove arquivos de assinatura.

O workflow **não publica automaticamente no Google Play**.

### TRD-REL-01

Material de assinatura deve ser removido do runner após uso.

### TRD-REL-02

AAB só deve ser considerado candidato de release após analyze/test verdes.

### TRD-REL-03

Upload para Play deve continuar sendo etapa consciente enquanto não houver pipeline de publicação explicitamente aprovado.

## 21. Versionamento

A versão Flutter segue:

`versionName+versionCode`.

Baseline atual:

`1.2.0+24`.

### TRD-REL-04

`versionCode` não pode ser reutilizado no Google Play.

### TRD-REL-05

`applicationId` Android oficial não deve mudar após publicação.

### TRD-REL-06

Branch de release em validação não deve receber feature não relacionada.

### TRD-REL-07

Feature branches devem ser integradas somente após dependências e sequência de release estarem claras.

## 22. CI

Workflow Flutter CI executa:

- setup Flutter;
- dependências;
- geração de localização;
- `flutter analyze`;
- `flutter test`;
- Functions com Node;
- lint;
- build;
- Firestore Emulator;
- testes de Functions.

### Limite atual do workflow

O trigger automático de PR está configurado para bases específicas, atualmente incluindo:

- `main`;
- `release/p1-precalculus-v1`.

PRs encadeados contra branches intermediárias podem não disparar o CI automaticamente.

### TRD-CI-01

Feature crítica não deve ser considerada validada apenas porque o PR encadeado não disparou workflow.

### TRD-CI-02

Quando necessário, executar workflow manual ou estratégia de validação equivalente sem alterar a release final.

### TRD-CI-03

CI deve permanecer reproduzível e não depender de credencial local do desenvolvedor.

## 23. Dependências

Toda nova dependência deve ser avaliada por:

- necessidade;
- manutenção;
- licença;
- reputação;
- atividade do projeto;
- compatibilidade;
- risco de typosquatting;
- impacto no binário;
- impacto em privacidade;
- permissões;
- acesso à rede/dados;
- vulnerabilidades conhecidas.

### TRD-DEP-01

Não instalar pacote apenas porque uma solução gerada por IA citou seu nome.

### TRD-DEP-02

Pacote inexistente ou de origem duvidosa deve ser rejeitado.

## 24. Logs e erros

### TRD-LOG-01

Não registrar:

- senha;
- token;
- secret;
- keystore;
- conversa privada desnecessária;
- PII desnecessária.

### TRD-LOG-02

Mensagens para usuário não devem expor stack trace ou detalhe interno.

### TRD-LOG-03

Logs técnicos devem ser suficientes para diagnóstico sem se transformar em banco paralelo de dados pessoais.

## 25. Privacidade e retenção

### TRD-PRIV-01

Coletar somente dados necessários à funcionalidade.

### TRD-PRIV-02

Nova coleta exige revisar finalidade, retenção, exclusão e Data Safety.

### TRD-PRIV-03

Analytics futuro não pode receber automaticamente:

- nome;
- e-mail;
- senha;
- tokens;
- conversa do Tutor;
- texto livre;
- resposta sensível desnecessária.

### TRD-PRIV-04

Dados de professor/instituição exigirão modelo separado de acesso e consentimento antes de implementação.

## 26. Acessibilidade e responsividade

Embora detalhadas no Design System, existem requisitos técnicos:

### TRD-UX-01

Evitar overflow com text scaling razoável.

### TRD-UX-02

Componentes devem fornecer semântica quando necessário.

### TRD-UX-03

Não depender apenas de cor para estado.

### TRD-UX-04

Layout de tablet só deve ser declarado suportado/promovido após validação real.

### TRD-UX-05

Novos componentes devem usar tokens que permitam futura implementação global de dark mode.

## 27. Requisitos não funcionais

### TRD-NFR-01 — Estabilidade

Fluxos principais não devem falhar por indisponibilidade de recurso secundário.

### TRD-NFR-02 — Tolerância a falhas

Falhas de rede devem possuir comportamento previsível.

### TRD-NFR-03 — Segurança

Recursos privados devem nascer fechados por padrão.

### TRD-NFR-04 — Manutenibilidade

Evitar duplicação de regra crítica em múltiplas telas.

### TRD-NFR-05 — Testabilidade

Nova regra de domínio deve ser exercitável sem depender obrigatoriamente de widget ou rede.

### TRD-NFR-06 — Compatibilidade

Novas versões devem preservar dados existentes ou possuir migração explícita.

### TRD-NFR-07 — Desempenho

Operações comuns não devem depender de chamadas remotas desnecessárias.

### TRD-NFR-08 — Resiliência

Dependência externa indisponível deve degradar somente o recurso afetado, salvo quando segurança exigir bloqueio.

## 28. Testes mínimos por classe de mudança

### Domínio

- unit tests;
- casos de borda;
- determinismo quando requerido.

### Persistência

- serialização;
- merge;
- reset;
- exclusão;
- compatibilidade com estado antigo.

### Firestore

- owner access;
- cross-user denial;
- payload inválido;
- limites;
- campos extras;
- progresso canônico.

### Functions

- autenticação;
- App Check conforme escopo;
- validação;
- rate limit;
- idempotência;
- erro controlado.

### Premium

- configurado/não configurado;
- ativo/inativo;
- restauração;
- logout/troca de conta;
- falha de rede.

### Release

- analyze;
- tests;
- assinatura;
- versão;
- instalação/atualização real.

## 29. Dívidas técnicas e validações abertas

### 29.1 Fallback local do teste final

Alta relevância para modelo de confiança. Deve ser resolvido antes de declarar conclusão exclusivamente server-authoritative.

### 29.2 App Check em aparelho real

Precisa permanecer validado em build distribuída pela Play Store.

### 29.3 Premium

Restauração, troca de identidade e cenários de rede devem continuar sendo testados em ambiente real.

### 29.4 Conta

Continuidade entre provedores, quando aplicável, exige política explícita de vínculo/merge.

### 29.5 Tablet

Não declarar experiência otimizada apenas com screenshots simulados.

### 29.6 FASE 9/10

Ainda isoladas da release ativa.

## 30. Critérios técnicos de aceite

Uma feature de impacto relevante somente pode ser considerada pronta quando:

1. possui contrato de entrada/saída claro;
2. define fonte de verdade;
3. define comportamento offline/falha;
4. não amplia coleta sem revisão;
5. não expõe secret;
6. possui autorização adequada;
7. possui testes proporcionais;
8. passa CI aplicável;
9. não quebra versão em validação;
10. possui rollback ou isolamento razoável;
11. documentação correspondente foi atualizada;
12. dependências externas e fallback estão explícitos.

## 31. Governança técnica

Sequência preferencial:

Arquitetura  
→ contratos  
→ domínio  
→ testes  
→ integração  
→ segurança  
→ privacidade  
→ regressão  
→ validação real  
→ release.

Documentos específicos de fase complementam este TRD.

Nenhuma fase pode reduzir silenciosamente os requisitos permanentes deste documento.
