# Product Flows — Cálculo Trivial

Última atualização: 2026-10-13  
Status: mapa oficial de fluxos  
Baseline funcional: release 1.2.0+24

## 1. Convenções

Este documento diferencia explicitamente:

- **ATUAL** — existe na release 1.2.0+24;
- **EM DESENVOLVIMENTO** — existe apenas em branch/PR de feature;
- **FUTURO** — ainda não é fluxo funcional de usuário.

Um fluxo futuro não deve ser apresentado em loja, documentação pública ou teste como funcionalidade já disponível.

## 2. Inicialização do aplicativo — ATUAL

Abrir aplicativo  
→ inicializar Firebase  
→ ativar App Check  
→ inicializar notificações de atualização quando possível  
→ carregar preferência de idioma  
→ abrir Splash  
→ iniciar consulta de atualização  
→ em paralelo:
  - carregar progresso;
  - inicializar RevenueCat;
  - aguardar tempo mínimo da Splash  
→ receber resultado da consulta de atualização  
→ se houver atualização:
  - exibir diálogo;
  - usuário pode atualizar agora ou continuar  
→ consultar sessão Firebase  
→ se não autenticado: Login  
→ se autenticado: Dashboard.

### Comportamento de falha

Se progresso ou RevenueCat demorarem além do timeout de inicialização, o app registra a falha e continua.

Se a consulta à Play Store falhar, o app continua sem bloquear entrada.

Falha de App Check na inicialização não autoriza operações protegidas; callables com App Check obrigatório podem continuar recusando a ação.

## 3. Autenticação por e-mail e senha — ATUAL

Login  
→ usuário informa e-mail e senha  
→ validação básica local  
→ Firebase Authentication  
→ se autenticado:
  - carregar progresso;
  - identificar usuário no RevenueCat quando configurado;
  - abrir Dashboard  
→ se falhar:
  - mapear erro;
  - informar usuário;
  - permanecer no Login.

## 4. Login com Google — ATUAL

Login  
→ usuário escolhe Google  
→ inicializar Google Sign-In  
→ autenticar conta Google  
→ obter ID token  
→ criar credencial Firebase  
→ autenticar no Firebase  
→ carregar progresso  
→ identificar usuário no RevenueCat quando configurado  
→ abrir Dashboard.

### Caso de conflito de identidade

Se o Firebase informar que o e-mail já possui conta com outro provedor, o app orienta a entrada pelo método já existente.

O vínculo/merge automático entre provedores não deve ser presumido.

## 5. Cadastro por e-mail e senha — ATUAL

Login  
→ abrir Cadastro  
→ informar nome, e-mail, senha e confirmação  
→ validar campos  
→ Firebase cria usuário  
→ atualizar display name  
→ inicializar/resetar progresso da nova conta  
→ identificar usuário no RevenueCat quando configurado  
→ abrir Dashboard como primeiro acesso.

O cadastro direto via botão Google não é um fluxo separado na tela de cadastro atual.

## 6. Recuperação de senha — ATUAL

Login  
→ informar e-mail  
→ escolher recuperação  
→ Firebase envia e-mail de redefinição  
→ aplicativo informa resultado.

Falha de rede, e-mail inválido ou erro do Firebase deve gerar mensagem controlada.

## 7. Dashboard — ATUAL

Dashboard reúne:

- continuação da jornada;
- resumo de progresso;
- aulas concluídas;
- questões respondidas;
- taxa de acerto;
- sequência;
- desafio diário quando aplicável;
- revisão personalizada quando houver questões elegíveis;
- resumo da Jornada de Cálculo;
- card informativo do Tutor Trivial.

O card do Tutor informa **Em desenvolvimento** e não representa um chat funcional na release atual.

## 8. Jornada principal de aprendizagem — ATUAL

Dashboard  
→ Trilha  
→ Módulo  
→ Aula  
→ conteúdo e exemplos  
→ prática  
→ revisão quando houver necessidade  
→ teste final  
→ resultado  
→ progresso  
→ próxima etapa conforme regras de desbloqueio.

Princípio:

> tentativa isolada não deve equivaler automaticamente a conclusão.

## 9. Aula — ATUAL

Abrir módulo  
→ escolher aula disponível  
→ visualizar conteúdo  
→ estudar explicação/conceitos  
→ acompanhar exemplos e recursos disponíveis  
→ acessar prática associada  
→ responder questões  
→ concluir atividades previstas  
→ retornar ao módulo/progresso.

A estrutura detalhada varia conforme a maturidade de cada conteúdo, mas novos conteúdos devem convergir para o padrão pedagógico definido no PRD.

## 10. Prática guiada — ATUAL

Abrir prática  
→ obter banco disponível da aula  
→ selecionar conjunto de questões  
→ evitar sessão anterior quando possível  
→ considerar histórico recente de rotação  
→ apresentar questão  
→ usuário escolhe resposta  
→ validar  
→ registrar tentativa em `QuestionPerformance`  
→ atualizar estatísticas  
→ mostrar feedback  
→ avançar  
→ concluir sessão.

### Rotação

O seletor atual prioriza:

1. questões ainda não usadas recentemente;
2. questões vistas há mais tempo;
3. questões da sessão anterior somente quando necessário.

### Limite da release atual

A release 1.2.0+24 ainda não possui `LearningHistory` da FASE 9.

## 11. Resposta incorreta na prática — ATUAL

Resposta incorreta  
→ registrar tentativa  
→ incrementar erro da questão  
→ atualizar `lastAnswerCorrect`  
→ mostrar feedback/explicação conforme tela  
→ continuar sessão  
→ questão passa a poder ficar elegível para Revisão Personalizada.

Erro isolado não deve gerar rótulo de capacidade.

## 12. Revisão Personalizada — ATUAL

Dashboard detecta questões elegíveis  
→ exibe card de Revisão Personalizada  
→ usuário abre revisão  
→ reunir candidatos dos módulos existentes  
→ verificar `QuestionPerformance.needsReview`  
→ priorizar:
  - último erro ainda não resolvido;
  - maior taxa de erro;
  - maior quantidade de erros;
  - tentativas;
  - dificuldade  
→ evitar questões da sessão de revisão anterior quando possível  
→ montar até 10 questões  
→ responder  
→ registrar novo desempenho  
→ voltar ao app.

### Critério atual de elegibilidade

Uma questão precisa ter erro anterior e:

- último resultado incorreto; ou
- precisão acumulada abaixo de 80%.

Essa lógica trabalha principalmente no nível da **questão**, não da habilidade.

## 13. Desafio diário — ATUAL

Dashboard  
→ usuário abre Desafio Diário  
→ selecionar até 5 questões baseadas em aulas já concluídas  
→ preservar o conjunto do mesmo dia quando disponível  
→ responder  
→ registrar tentativas  
→ guardar melhor resultado do dia  
→ permitir refazer.

O desafio diário não deve substituir avaliação formal de domínio.

## 14. Teste final — caminho remoto confiável — ATUAL

Usuário solicita teste final  
→ cliente chama `startFinalTest`  
→ Cloud Function:
  - valida autenticação;
  - exige App Check;
  - aplica rate limit;
  - valida módulo;
  - cria sessão segura;
  - seleciona questões  
→ cliente recebe:
  - sessionId;
  - moduleId;
  - expiração;
  - questões;
  - alternativas;
  - **sem resposta correta**  
→ usuário responde 10 questões  
→ sem feedback imediato de correção  
→ cliente chama `submitFinalTest`  
→ backend:
  - valida sessão;
  - valida respostas;
  - corrige;
  - calcula precisão;
  - decide aprovação;
  - aplica conclusão/recompensa no caminho confiável  
→ cliente recebe resultado  
→ apresentar resultado.

Esse é o caminho arquitetural preferencial.

## 15. Teste final — fallback local — ATUAL / DÍVIDA TÉCNICA

Se o início remoto falhar com determinados códigos, atualmente:

- `not-found`;
- `unavailable`;
- `deadline-exceeded`;

o cliente pode iniciar fallback local.

Fluxo:

falha remota elegível  
→ construir sessão local  
→ selecionar 10 questões do banco local  
→ guardar respostas corretas em memória no dispositivo  
→ usuário responde  
→ validar sessão local  
→ corrigir localmente  
→ calcular aprovação  
→ registrar resultado  
→ se aprovado, concluir módulo localmente  
→ retornar resultado.

### Implicação

Esse caminho não possui o mesmo nível de confiança do backend.

Portanto:

- não afirmar que toda conclusão da 1.2.0+24 é server-authoritative;
- resolver/restringir esse fallback antes de produção ampla com autoridade exclusivamente remota.

## 16. Progresso — ATUAL

Atividade válida  
→ atualizar estado em memória  
→ registrar localmente em SharedPreferences  
→ enfileirar persistência  
→ tentar Firestore  
→ se sucesso:
  - estado remoto atualizado  
→ se falha:
  - estado local permanece;
  - erro é registrado;
  - app continua quando a funcionalidade permitir.

A fila de gravação reduz concorrência entre persistências sucessivas.

## 17. Carregamento e merge de progresso — ATUAL

Início/login  
→ identificar usuário  
→ ler estado local escopado ao usuário  
→ buscar estado remoto quando possível  
→ normalizar dados  
→ combinar conforme regras existentes  
→ aplicar estado em memória  
→ atualizar interface.

Merge não deve diminuir progresso válido por causa de falha transitória.

## 18. Logout — ATUAL

Configurações  
→ usuário solicita sair  
→ confirmação  
→ tentar logout RevenueCat quando configurado  
→ tentar logout Google  
→ Firebase signOut  
→ limpar sessão do `AppProgress` em memória  
→ remover rotas autenticadas  
→ abrir Login.

Falha secundária em RevenueCat/Google é registrada; a saída Firebase continua sendo tentada.

## 19. Exclusão de conta — ATUAL

Configurações  
→ usuário solicita excluir conta  
→ identificar provedor.

### Conta Google

confirmação  
→ reautenticar com Google  
→ renovar token Firebase.

### Conta por senha

solicitar senha  
→ reautenticar com `EmailAuthProvider`  
→ renovar token Firebase.

Depois:

→ chamar callable `deleteAccount` sem payload controlado pelo cliente  
→ backend verifica:
  - autenticação;
  - recência da autenticação;
  - App Check;
  - payload vazio  
→ backend remove:
  - sessões do Tutor associadas;
  - registros de idempotência;
  - árvore `users/{uid}`;
  - rate limits associados;
  - conta Firebase Auth, por último  
→ cliente tenta:
  - logout RevenueCat;
  - logout Google;
  - limpar estado de feedback Play;
  - Firebase signOut;
  - limpar sessão local  
→ voltar ao Login.

### Propriedade de segurança

A conta Auth é apagada por último no backend para permitir nova tentativa caso a limpeza de dados falhe antes.

### Falha

A UI informa erros como:

- autenticação antiga;
- sessão inválida;
- App Check/permission denied;
- serviço indisponível;
- erro interno.

Não simular sucesso de exclusão.

## 20. Premium — verificação de acesso — ATUAL

Usuário tenta acessar recurso Premium  
→ `PremiumAccessGuard` verifica estado local do entitlement  
→ se não configurado:
  - tentar inicializar RevenueCat com Firebase UID  
→ atualizar `CustomerInfo`  
→ se entitlement ativo:
  - liberar recurso  
→ se inativo:
  - apresentar paywall quando necessário  
→ atualizar `CustomerInfo` novamente  
→ liberar apenas se Premium estiver ativo.

Falha de RevenueCat:

→ informar indisponibilidade  
→ não liberar artificialmente.

## 21. Premium — restauração — ATUAL

Configurações  
→ Restaurar compras  
→ garantir RevenueCat configurado  
→ `restorePurchases`  
→ atualizar entitlement  
→ informar:
  - Premium encontrado; ou
  - nenhuma compra restaurável; ou
  - erro.

## 22. Premium — gerenciamento — ATUAL

Configurações  
→ Gerenciar assinatura  
→ garantir RevenueCat configurado  
→ abrir RevenueCat Customer Center  
→ ao retornar, atualizar estado Premium.

## 23. Tutor Trivial — BACKEND EXISTENTE / UI FUTURA

Na release 1.2.0+24, o Dashboard mostra o Tutor como **Em desenvolvimento**.

Não há fluxo completo de chat acessível ao usuário nessa release.

A infraestrutura backend existente prevê:

cliente futuro  
→ callable `tutor`  
→ autenticação  
→ App Check  
→ validar contrato  
→ rate limit  
→ idempotência  
→ sessão  
→ conteúdo autorizado  
→ Gemini  
→ resposta estruturada  
→ UI futura.

Regras permanentes:

- Tutor não concede XP;
- Tutor não concede ouro;
- Tutor não aprova teste;
- Tutor não conclui módulo;
- Tutor não controla Premium;
- conversa privada não deve ser entregue automaticamente a professor/instituição.

## 24. FASE 9 — Histórico de Aprendizagem — EM DESENVOLVIMENTO

Não faz parte da 1.2.0+24.

Fluxo planejado/implementado em branch:

resposta em atividade suportada  
→ registrar:
  - questionId;
  - contentLessonId quando disponível;
  - acerto/erro;
  - origem;
  - timestamp  
→ manter no máximo 100 eventos  
→ persistir localmente  
→ sincronizar com Firestore  
→ deduplicar local/remoto  
→ exibir atividade recente no Progresso.

Não armazena texto livre, nome, e-mail ou conversa do Tutor.

Não concede progresso canônico.

## 25. FASE 10 — Smart Review — EM DESENVOLVIMENTO

Não faz parte da 1.2.0+24.

Fluxo de domínio já implementado em branch:

LearningHistory  
+ QuestionPerformance  
+ QuestionMetadata  
→ agrupar por:
  - skill;
  - subtopicId como fallback;
  - questionId como último fallback  
→ produzir resumo por habilidade  
→ identificar habilidades elegíveis  
→ priorizar:
  - erro não resolvido;
  - erro recente;
  - baixa precisão;
  - reincidência  
→ selecionar questões  
→ preferir alternativa da mesma habilidade antes de repetição direta  
→ evitar sessão anterior  
→ bloquear questão nova de conteúdo não estudado  
→ distribuir questões entre habilidades  
→ retornar plano determinístico.

### Próximo estágio

A integração desse planner com a tela de Revisão Personalizada pertence à FASE 10.4.

Até lá, a release continua usando o seletor atual.

## 26. Atualização via Google Play — ATUAL

Na Splash:

abrir app  
→ consultar `InAppUpdate.checkForUpdate` com timeout  
→ se não houver atualização ou consulta falhar:
  - continuar normalmente  
→ se houver:
  - exibir diálogo  
→ usuário escolhe:
  - Agora não → continuar;
  - Atualizar agora → tentar atualização imediata quando permitida  
→ se atualização imediata falhar/não for permitida:
  - abrir Google Play.

Ao abrir Play:

→ tentar URI `market://`  
→ se falhar:
  - abrir URL web da Play Store.

## 27. Notificações de atualização — ATUAL

Inicialização  
→ solicitar permissão de notificação  
→ se permitido:
  - inscrever em tópico FCM `app_updates`;
  - ouvir mensagens em foreground;
  - ouvir abertura por notificação  
→ ao tocar em aviso de atualização:
  - abrir página do app na Google Play.

A recusa de notificações não deve impedir o uso do app.

## 28. Idioma — ATUAL

Configurações  
→ escolher Português ou Inglês  
→ atualizar `AppLocaleController`  
→ persistir preferência  
→ reconstruir UI localizada.

Conteúdo/telas ainda devem ser revisados continuamente para evitar strings fora do mecanismo de localização.

## 29. Publicação — ATUAL

Feature branch  
→ implementação  
→ testes  
→ PR  
→ CI aplicável  
→ revisão  
→ merge somente quando autorizado  
→ branch de release  
→ atualizar versionCode/versionName quando necessário  
→ workflow de AAB:
  - validar secrets;
  - restaurar assinatura;
  - analyze;
  - tests;
  - build;
  - verificar assinatura;
  - publicar artifact no GitHub  
→ download do AAB  
→ envio manual ao Play Console  
→ Teste Fechado  
→ validação real  
→ somente depois avaliar produção.

O workflow atual não publica automaticamente na Google Play.

## 30. Fluxo de validação de release — ATUAL

Nova versão no Teste Fechado  
→ Google Play processa release  
→ disponibilizar aos testadores quando aprovada  
→ instalar/atualizar sobre versão anterior quando possível  
→ validar:
  - autenticação;
  - progresso existente;
  - atualização;
  - App Check;
  - teste final;
  - Premium;
  - restauração;
  - exclusão de conta;
  - layout;
  - regressões  
→ registrar problemas  
→ corrigir em nova versão com novo versionCode.

Não reutilizar versionCode.

## 31. Professor/instituição — FUTURO

Ainda não implementado.

Antes de existir fluxo de professor:

→ definir modelo de consentimento  
→ definir autorização  
→ definir quais dados são compartilháveis  
→ separar progresso confiável de histórico privado  
→ definir retenção  
→ definir exclusão  
→ revisar LGPD  
→ implementar backend isolado  
→ testar acesso entre usuários/tenants  
→ só então criar UI.

Regras já fixadas:

- professor não recebe automaticamente conversa privada do Tutor;
- histórico client-side não deve ser tratado como relatório oficial;
- IDs vindos da interface não bastam para autorização;
- acesso deve ser server-side e escopado.

## 32. Estados de erro transversais

Todo fluxo relevante deve considerar:

- sem internet;
- timeout;
- sessão expirada;
- usuário não autenticado;
- App Check inválido;
- serviço indisponível;
- resposta remota malformada;
- dado local antigo;
- dependência externa indisponível.

Princípio:

> falhar de forma explícita é preferível a registrar sucesso incorreto.

## 33. Fonte de verdade por fluxo

### Autenticação

Firebase Authentication.

### Premium

RevenueCat entitlement.

### Teste final remoto

Cloud Functions + sessão/catálogo seguro.

### Teste final fallback

Cliente local — temporário e de menor confiança.

### Progresso atual

Estado local + Firestore dentro das regras existentes, com diferenças entre dados canônicos e estatísticos.

### Revisão Personalizada atual

`QuestionPerformance`.

### Histórico de aprendizagem

FASE 9, ainda fora da release.

### Smart Review

FASE 10, ainda fora da release.

### Tutor

Backend existe; experiência de usuário ainda não está ativa.

## 34. Regra de atualização deste documento

Alterar este documento sempre que uma mudança modificar:

- entrada/saída de um fluxo;
- fonte de verdade;
- fallback;
- autoridade;
- persistência;
- autenticação;
- Premium;
- comportamento offline;
- exclusão;
- sequência pedagógica;
- status de uma funcionalidade entre FUTURO, EM DESENVOLVIMENTO e ATUAL.

Fluxos não devem ser atualizados apenas como desenho ideal; devem permanecer coerentes com o comportamento real do produto.
