# Backend Architecture — Cálculo Trivial

Última atualização: 2026-10-13  
Status: arquitetura oficial de backend  
Baseline funcional: release 1.2.0+24

## 1. Objetivo

Este documento descreve a arquitetura real de backend do Cálculo Trivial, suas fronteiras de confiança, fontes de verdade, coleções, serviços e requisitos de evolução.

Ele deve distinguir:

- **ATUAL** — já existe na arquitetura/release atual;
- **EM DESENVOLVIMENTO** — existe em branch, mas ainda não pertence à release;
- **FUTURO** — arquitetura planejada.

## 2. Visão geral

Arquitetura atual:

Flutter Android  
→ Firebase Authentication  
→ Cloud Firestore  
→ Cloud Functions v2  
→ serviços confiáveis do backend  
→ Gemini quando o Tutor é chamado.

RevenueCat e Google Play são integrações externas do cliente e não fazem parte do banco de progresso canônico.

## 3. Modelo de confiança

O cliente Flutter é tratado como ambiente potencialmente modificável.

O cliente pode:

- apresentar interface;
- armazenar dados locais;
- registrar estatísticas permitidas;
- solicitar operações;
- enviar respostas a avaliações.

O cliente não deve ser autoridade exclusiva para:

- identidade;
- Premium;
- correção segura de prova;
- recompensa crítica;
- conclusão canônica;
- dados privados de outro usuário;
- decisão gerada por IA.

Cloud Functions usa Firebase Admin SDK e, portanto, não depende das Firestore Security Rules para autorização interna. Cada serviço backend deve validar explicitamente identidade, contrato e estado antes de escrever.

## 4. Firebase Authentication — ATUAL

Firebase Authentication é a fonte de verdade de identidade.

O UID autenticado é usado para:

- isolar progresso;
- criar sessões de prova;
- criar sessões do Tutor;
- rate limiting;
- idempotência;
- exclusão de conta;
- identificação RevenueCat no cliente.

### BA-AUTH-01

UID nunca deve ser aceito de campo arbitrário enviado pelo cliente quando Firebase já fornece a identidade autenticada.

### BA-AUTH-02

Operação sensível deve rejeitar usuário não autenticado.

### BA-AUTH-03

Exclusão de conta exige autenticação recente.

## 5. Firestore Security Rules — ATUAL

As regras expõem ao cliente autenticado somente os caminhos explicitamente permitidos.

### Caminhos principais visíveis ao cliente

`/users/{userId}`

- owner pode ler/deletar o documento.

`/users/{userId}/progress/current`

- owner pode ler/deletar;
- create permitido somente em estado canônico inicial válido;
- update permitido somente quando:
  - progresso canônico permanece inalterado e estatísticas evoluem de forma plausível; ou
  - o documento representa reset canônico permitido.

### Coleções internas não expostas diretamente

Não há `allow` público para, entre outras:

- `tutorSessions`;
- `tutorIdempotency`;
- `tutorRateLimits`;
- `finalTestStartRateLimits`;
- `finalTestSubmitRateLimits`;
- `users/{uid}/final_test_sessions`;
- `users/{uid}/progress_events`.

Na ausência de regra permissiva, o acesso direto do SDK cliente é negado.

### BA-RULES-01

Nova coleção backend-owned deve permanecer inacessível ao cliente por padrão.

### BA-RULES-02

Mudança de regra deve possuir teste no Firestore Emulator.

## 6. Documento de progresso — ATUAL

`users/{uid}/progress/current` contém o estado educacional sincronizado.

A release atual valida, entre outros:

- módulos concluídos;
- aulas de conteúdo concluídas;
- flags de módulos;
- XP;
- ouro;
- tentativas;
- acertos/erros;
- accuracy;
- streak;
- atividade diária;
- sessões recentes;
- rotação de prática;
- `questionPerformance`;
- revisão personalizada;
- desafio diário.

A FASE 9 adiciona histórico de aprendizagem em branch própria e não pertence à 1.2.0+24.

## 7. Proteção do progresso canônico — ATUAL

As Security Rules impedem o cliente de simplesmente elevar:

- `completedLessonIds`;
- flags de módulo;
- `totalXp`;
- `totalGold`.

Após criação inicial, alterações normais do cliente devem manter esses campos canônicos inalterados.

O cliente pode evoluir estatísticas dentro das restrições das regras.

Reset explícito possui caminho validado separado.

### Consequência

A arquitetura já separa parcialmente:

- dados canônicos;
- estatísticas client-side plausíveis.

Essa separação deve ser preservada e fortalecida.

## 8. Conclusão confiável de módulo — ATUAL

`ModuleCompletionService` não é callable pública.

Ela só é chamada por serviço backend após aprovação confiável no teste final remoto.

Fluxo:

aprovação verificada  
→ `awardAfterVerifiedPass(uid, moduleId, sessionId)`  
→ transação Firestore  
→ verificar `progress_events/{sessionId}`  
→ se evento já existe:
  - não duplicar recompensa  
→ se módulo já estava concluído:
  - registrar evento;
  - não duplicar XP/ouro  
→ caso novo:
  - adicionar módulo concluído;
  - marcar flag;
  - recalcular XP total;
  - recalcular ouro total;
  - criar evento idempotente.

### BA-PROGRESS-01

Recompensa canônica não deve aceitar XP/ouro calculado pelo cliente.

### BA-PROGRESS-02

Request ID de recompensa deve vir de operação backend confiável.

## 9. Cloud Functions públicas — ATUAL

Exports atuais:

- `tutor`;
- `deleteAccount`;
- `startFinalTest`;
- `submitFinalTest`.

Todas usam Cloud Functions v2 `onCall`.

Todas estão configuradas com `enforceAppCheck: true`.

## 10. App Check — ATUAL

No cliente Android release:

`AndroidPlayIntegrityProvider`.

Em debug:

`AndroidDebugProvider`.

No backend, as quatro callables públicas atuais exigem App Check.

### BA-SEC-01

Falha de App Check deve resultar em recusa da operação protegida, não em bypass.

### BA-SEC-02

Play Integrity deve continuar sendo validado em AAB instalado pela distribuição real da Google Play.

## 11. Teste final remoto — criação de sessão — ATUAL

`startFinalTest`:

1. exige App Check;
2. exige UID autenticado;
3. exige objeto de payload válido;
4. rejeita campos inesperados;
5. aceita somente `moduleId` allowlisted;
6. aplica rate limit;
7. seleciona catálogo backend-owned;
8. seleciona 10 questões usando RNG criptográfico do Node;
9. cria UUID v4 de sessão;
10. persiste em:
   `users/{uid}/final_test_sessions/{sessionId}`;
11. define expiração de 30 minutos;
12. retorna questões públicas sem resposta correta.

Módulos permitidos:

- algebra-fundamental;
- equacoes-inequacoes;
- funcoes;
- limites;
- continuidade;
- derivadas.

## 12. Catálogos seguros de prova — ATUAL

Os catálogos backend possuem a chave correta internamente.

A conversão para representação pública remove a resposta correta antes de retornar ao cliente.

### BA-EVAL-01

`correctOptionId` do catálogo confiável não pode ser incluído no payload público do teste remoto.

### BA-EVAL-02

O módulo da submissão deve ser derivado da sessão backend, não informado novamente pelo cliente.

## 13. Teste final remoto — submissão — ATUAL

`submitFinalTest`:

1. exige App Check;
2. exige autenticação;
3. rejeita campos extras;
4. exige:
   - `sessionId`;
   - exatamente 10 respostas;
5. valida formato UUID v4 do sessionId;
6. limita tamanhos de IDs;
7. aplica rate limit;
8. carrega sessão no caminho do UID autenticado;
9. verifica ownership;
10. determina módulo pela sessão;
11. valida identidade/módulo;
12. verifica expiração;
13. verifica se já foi consumida;
14. valida que respostas correspondem às questões da sessão;
15. corrige apenas contra catálogo backend;
16. calcula accuracy;
17. aprova com mínimo de 80%;
18. marca sessão como consumida;
19. aplica recompensa canônica se aprovada.

Submissão repetida de sessão já consumida retorna o resultado confiável armazenado em vez de recalcular a nota.

## 14. Idempotência da recompensa final — ATUAL

A submissão e a recompensa usam duas camadas de proteção:

- sessão possui `consumed`;
- conclusão usa `progress_events/{sessionId}`.

Após recompensa bem-sucedida, a sessão é marcada com `rewardApplied: true`.

Essa separação permite recuperar corretamente cenários em que a correção foi persistida antes da recompensa.

### BA-EVAL-03

Retry de submissão não pode gerar XP/ouro duplicado.

## 15. Rate limiting do teste final — ATUAL

Implementação:

`FirestoreRateLimitStore`

Características:

- transação Firestore;
- documento por hash SHA-256 do UID;
- janelas fixas;
- burst;
- minuto;
- dia;
- retorno de `retryAfterMs` quando bloqueado.

### Iniciar teste

- 2 requisições / 5 s;
- 6 / minuto;
- 30 / dia.

### Enviar teste

- 4 requisições / 5 s;
- 12 / minuto;
- 60 / dia.

### BA-RATE-01

Mudança desses limites deve ser tratada como configuração de segurança/custo e testada.

## 16. Fallback local do teste final — ATUAL / EXCEÇÃO

O backend remoto possui arquitetura confiável, mas o cliente 1.2.0+24 ainda contém fallback local para determinados erros remotos.

Nesse caminho, correção e conclusão podem ocorrer localmente.

Portanto, a arquitetura geral do produto **ainda não é 100% server-authoritative em todos os cenários**.

### BA-DEBT-01

Remover, restringir ou redesenhar o fallback local antes de declarar autoridade remota exclusiva para conclusão em produção ampla.

## 17. Exclusão de conta — ATUAL

Callable `deleteAccount`:

- exige App Check;
- exige UID autenticado;
- exige `auth_time` válido;
- autenticação deve ter no máximo 5 minutos;
- rejeita qualquer campo de payload inesperado.

Backend calcula:

`ownerHash = SHA-256(uid)`.

Antes de remover Auth:

1. busca e remove `tutorSessions` do UID;
2. busca e remove `tutorIdempotency` pelo ownerHash;
3. executa `recursiveDelete(users/{uid})`;
4. remove `tutorRateLimits/{ownerHash}`;
5. remove `finalTestStartRateLimits/{ownerHash}`;
6. remove `finalTestSubmitRateLimits/{ownerHash}`;
7. somente então remove Firebase Authentication.

O `recursiveDelete(users/{uid})` cobre subcoleções como:

- progress;
- final_test_sessions;
- progress_events.

### Propriedade de recuperação

Auth é apagado por último. Se uma falha Firestore acontecer antes, a identidade permanece disponível para nova tentativa.

### BA-ACCOUNT-01

Novo armazenamento backend associado ao usuário deve ser incorporado ao fluxo de exclusão antes da release correspondente.

## 18. Tutor Trivial — estado atual

O backend do Tutor existe, mas a experiência de chat ainda não está ativa para o usuário na release 1.2.0+24.

A callable `tutor` já possui arquitetura operacional e protegida.

## 19. Tutor — boundary pública — ATUAL

`tutor`:

- exige App Check;
- exige autenticação;
- valida payload com Zod;
- usa union discriminada por `actionType`;
- rejeita campos extras por schemas strict;
- converte erros internos para códigos públicos controlados;
- não expõe stack, UID, prompt nem erro bruto do provedor.

Ações previstas no contrato:

- `request_hint`;
- `view_steps`;
- `create_similar`;
- `explain_error`;
- `recommend_review`.

Estado real:

- request_hint: implementado no backend;
- view_steps: implementado;
- create_similar: implementado;
- explain_error: retorna `FEATURE_NOT_READY`;
- recommend_review: retorna `FEATURE_NOT_READY`.

## 20. Tutor — conteúdo confiável — ATUAL

O Tutor não aceita do cliente a chave correta como contexto confiável.

O backend carrega pergunta/aula do `contentRepository`.

Antes de enviar contexto ao modelo, constrói uma whitelist com:

- lessonId;
- questionId;
- subject;
- statement;
- opções;
- contentVersion;
- referências permitidas.

São deliberadamente omitidos do payload do modelo:

- `correctOptionId`;
- explicação original completa.

### BA-AI-01

Contexto pedagógico confiável deve vir do catálogo backend, não de conteúdo arbitrário afirmado pelo cliente.

## 21. Tutor — sessões — ATUAL

Sessões usam IDs opacos:

`sess_` + 24 bytes aleatórios codificados em base64url.

Persistência:

`tutorSessions/{sessionId}`.

Campos incluem:

- uid;
- contexto;
- createdAt;
- lastInteractionAt;
- expiresAt;
- hintLevel.

Regras:

- idle timeout: 30 minutos;
- máximo de pistas: 3;
- owner deve coincidir;
- contexto da sessão deve coincidir;
- sessão expirada é recusada;
- avanço de pista ocorre transacionalmente.

## 22. Tutor — idempotência — ATUAL

Idempotência usa:

`uid + clientRequestId`

convertidos em SHA-256 para ID do documento.

Coleção:

`tutorIdempotency`.

Cada claim possui token aleatório de ownership.

Estados:

- processing;
- completed.

TTL lógico da claim:

24 horas.

Se uma resposta já foi concluída, a mesma chave retorna a resposta validada armazenada.

Se a chamada falha, o claim é abandonado de forma segura.

### Limite operacional

O código armazena `expiresAt`, mas este documento não presume que uma política automática de Firestore TTL esteja habilitada sem configuração verificada.

## 23. Tutor — rate limiting — ATUAL

Limites atuais:

- 3 requisições / 5 s;
- 10 / minuto;
- 100 / dia.

Armazenamento:

`tutorRateLimits/{SHA-256(uid)}`.

O rate limiter usa transação Firestore e tempo backend.

## 24. Tutor — runtime — ATUAL

Configuração atual da Function:

- minInstances: 0;
- maxInstances: 3;
- concurrency: 5;
- timeout: 30 s.

Gemini:

- modelo: `gemini-3.7-flash`;
- timeout provider: 15 s;
- resposta bruta máxima: 16 KiB;
- concorrência máxima por instance: 2;
- temperature: 0.3.

Esses valores são configuração operacional, não requisito pedagógico permanente.

## 25. Tutor — pipeline de resposta do modelo — ATUAL

A resposta bruta do Gemini passa por validação antes de chegar ao cliente.

Pipeline:

1. limitar tamanho bruto;
2. parse JSON;
3. validar schema Zod;
4. rejeitar conteúdo textual proibido;
5. validar referências contra a whitelist do contexto;
6. resolver referências no catálogo;
7. verificar que `responseType` corresponde à ação solicitada;
8. construir resposta pública final;
9. validar novamente a resposta pública.

Conteúdo bloqueado inclui padrões como:

- HTML;
- `data:`;
- `javascript:`;
- URLs HTTP/HTTPS;
- `www.`;
- imagens Markdown;
- blocos grandes com aparência de base64.

Se o provider retornar algo inválido, o backend devolve resposta controlada de Tutor indisponível.

### BA-AI-02

Saída do modelo deve ser tratada como não confiável até passar pelo pipeline de validação.

## 26. Secrets — ATUAL

`GEMINI_API_KEY` é definida via Firebase `defineSecret`.

O repositório contém apenas o nome do secret, não o valor.

A callable Tutor declara explicitamente o secret necessário.

RevenueCat no cliente usa Public SDK Key; secret administrativo não deve entrar no bundle.

Keystore Android e credenciais de assinatura ficam fora do Git.

## 27. RevenueCat — fronteira de backend

RevenueCat não é usado como fonte de verdade do progresso educacional.

Fonte de verdade de acesso Premium:

RevenueCat entitlement.

Fonte de verdade de progresso:

estado educacional/Firebase conforme regras correspondentes.

### BA-PREM-01

Premium e progresso devem permanecer desacoplados.

### BA-PREM-02

Falha RevenueCat não deve modificar progresso acadêmico.

## 28. Dados pseudonimizados em infraestrutura

Rate limits e idempotência usam hashes SHA-256 derivados do UID em vários documentos de infraestrutura.

Isso reduz exposição direta do UID em IDs de documento.

Tutor sessions ainda guardam UID internamente para checagem de ownership.

Hash estável de UID é pseudonimização, não anonimização.

## 29. Fronteiras de acesso do Admin SDK

Cloud Functions usando Admin SDK podem escrever caminhos bloqueados ao SDK do cliente.

Isso é necessário para:

- conclusão confiável;
- sessões;
- rate limiting;
- idempotência;
- exclusão.

### BA-SEC-03

Toda escrita Admin deve executar validações equivalentes à confiança exigida; Security Rules não protegem chamadas Admin contra bug de backend.

## 30. FASE 9 — EM DESENVOLVIMENTO

Learning History ainda não pertence à release 1.2.0+24.

Quando integrado:

- será limitado;
- privado por usuário;
- não será autoridade de conclusão;
- não conterá texto livre/Tutor;
- deve permanecer compatível com exclusão/reset.

## 31. FASE 10 — EM DESENVOLVIMENTO

Smart Review é inicialmente uma camada derivada no cliente/domínio.

Não cria nova autoridade backend.

Entrada:

- QuestionPerformance;
- LearningHistory;
- metadados.

Saída:

- recomendação/plano de revisão.

Não pode:

- conceder XP;
- conceder ouro;
- aprovar teste;
- concluir módulo;
- criar rótulo permanente de capacidade.

## 32. Logs e erros

Backend deve evitar registrar:

- senha;
- token;
- secret;
- prompt privado desnecessário;
- conversa completa do Tutor;
- resposta sensível de avaliação sem necessidade.

Erros públicos devem ser controlados.

Erros internos podem ser mais detalhados apenas em observabilidade protegida e proporcional.

## 33. Emuladores e testes — ATUAL

`firebase.json` define emuladores:

- Auth: 9099;
- Functions: 5001;
- Firestore: 8080;
- Emulator UI: 4000.

CI executa testes de Functions com Firestore Emulator.

Há testes específicos para:

- callable contracts;
- final test;
- module completion;
- rate limits;
- idempotência;
- sessões;
- Tutor orchestrator;
- integridade de conteúdo;
- bibliografia.

## 34. Ambientes

A configuração atual possui um Firebase project de aplicação e usa project IDs de demonstração/emulator no CI quando apropriado.

Não há evidência documental suficiente para declarar uma topologia completa e separada de:

- development;
- staging;
- production.

### BA-DEBT-02

Antes de escalar operação/produção, formalizar estratégia de ambientes e permissões.

## 35. Retenção e limpeza automática

Diversos documentos internos possuem `expiresAt`.

Isso permite política de retenção, mas não equivale por si só a TTL automático ativado no Firestore.

### BA-DEBT-03

Verificar/configurar TTL ou rotina de limpeza para dados temporários quando o volume justificar.

## 36. Backup e recuperação

Ainda deve ser formalizado para escala:

- backups;
- retenção;
- restore testado;
- migrations;
- rollback;
- runbook de incidente.

### BA-DEBT-04

Produção crescente exige plano explícito de recuperação de dados.

## 37. Coleções backend relevantes

Resumo atual:

`users/{uid}/progress/current`
- progresso sincronizado.

`users/{uid}/final_test_sessions/{sessionId}`
- sessões seguras de prova.

`users/{uid}/progress_events/{requestId}`
- idempotência de conclusão/recompensa.

`tutorSessions/{sessionId}`
- sessão pedagógica do Tutor.

`tutorIdempotency/{hash}`
- idempotência de requisições do Tutor.

`tutorRateLimits/{ownerHash}`
- rate limit Tutor.

`finalTestStartRateLimits/{ownerHash}`
- rate limit para iniciar prova.

`finalTestSubmitRateLimits/{ownerHash}`
- rate limit para submissão.

## 38. Critérios de aceite de nova função backend

Nova Function/serviço deve responder explicitamente:

1. quem pode chamar;
2. qual identidade é confiável;
3. qual payload é aceito;
4. quais campos são rejeitados;
5. qual estado é fonte de verdade;
6. qual rate limit é necessário;
7. idempotência é necessária?;
8. qual dado é persistido;
9. por quanto tempo;
10. como é apagado;
11. que erro público retorna;
12. como é testado;
13. qual impacto de custo;
14. qual impacto de privacidade;
15. qual comportamento ocorre em retry.

## 39. Dívidas técnicas principais

Prioridade alta:

1. fallback local do teste final com poder de conclusão;
2. validação real de App Check/Play Integrity em distribuição;
3. validação real dos fluxos Premium/identidade;
4. estratégia formal de ambientes.

Prioridade de escala:

5. TTL/limpeza de dados temporários;
6. backup/restore;
7. observabilidade formal;
8. política de retenção;
9. runbook de incidente.

## 40. Governança

Novas responsabilidades devem ir ao backend quando houver necessidade real de:

- autoridade;
- segurança;
- isolamento;
- segredo;
- custo controlado;
- idempotência;
- orquestração;
- validação confiável.

Não mover lógica pedagógica pura para servidor sem benefício técnico claro.

Mudança que altere fonte de verdade, coleção, callable, autorização, retenção, secret, rate limit ou exclusão deve atualizar este documento no mesmo ciclo.
