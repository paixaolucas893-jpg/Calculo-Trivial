# Registro de Operações de Tratamento de Dados — Cálculo Trivial

Última revisão: 2026-10-02

Este documento é um registro interno das principais operações de tratamento de dados pessoais do Cálculo Trivial. Deve ser revisado sempre que um novo SDK, fornecedor, finalidade, categoria de dado ou recurso relevante for adicionado.

## Papéis

- Produto/controlador: Cálculo Trivial, conforme o enquadramento jurídico aplicável.
- Titulares principais: usuários do aplicativo, incluindo estudantes.
- Operadores/suboperadores relevantes: Google/Firebase, Google Play, RevenueCat e Google Gemini, conforme os serviços efetivamente utilizados.
- Canal de privacidade: suporte.calculotrivial@gmail.com.

## Inventário

| Processo | Dados tratados | Finalidade | Hipótese legal a validar/documentar | Sistemas/fornecedores | Retenção operacional |
| --- | --- | --- | --- | --- | --- |
| Cadastro e autenticação | nome, e-mail, UID, provedor de login | criar e autenticar conta | execução do serviço/contrato; outras bases conforme o caso | Firebase Authentication, Google Sign-In | enquanto a conta estiver ativa e conforme obrigações aplicáveis |
| Progresso educacional | aulas concluídas, respostas agregadas, acertos, erros, streak, XP, moedas, IDs de sessões | sincronizar progresso, personalizar experiência e calcular estatísticas | execução do serviço/contrato; legítimo interesse quando cabível e documentado | Cloud Firestore, armazenamento local | enquanto a conta estiver ativa; cópia local até exclusão/limpeza |
| Assinatura Premium | App User ID, entitlement, produto adquirido, status da compra | validar e restaurar acesso Premium | execução do contrato; obrigação legal quando aplicável | RevenueCat, Google Play | conforme necessidade operacional, obrigações legais e políticas dos fornecedores |
| Tutor Trivial | aula, questão, tentativa, pedidos de pista, sessão do tutor, contexto pedagógico necessário | fornecer ajuda, explicações e recomendações pedagógicas | execução do serviço; outras bases devem ser avaliadas conforme o recurso | Cloud Functions, Firestore, Google Gemini | sessões expiram após 30 minutos de inatividade e ficam elegíveis para exclusão automática por TTL; a remoção física pode ocorrer depois da expiração conforme o processamento gerenciado do Firestore |
| Segurança e antifraude | token App Check, sinais de integridade, UID/hash, rate limit, idempotência, logs técnicos | prevenir abuso, fraude e acesso não autorizado | legítimo interesse e/ou proteção do serviço, sujeito a avaliação/documentação | Firebase App Check, Play Integrity, Cloud Functions/Logs | idempotência: 24 horas; rate limits: conforme o campo expiresAt; ambos elegíveis para exclusão automática por TTL; Cloud Logging `_Default`: objetivo operacional de 30 dias ou menos, sujeito à configuração efetiva do projeto; `_Required`: 400 dias por regra do Google Cloud |
| Notificações | token FCM, inscrição em tópico, status de permissão | enviar avisos de atualização e futuros lembretes autorizados | consentimento/permissão e interesse do usuário conforme o tipo de mensagem | Firebase Cloud Messaging | enquanto a permissão/inscrição estiver ativa e tecnicamente necessária |
| Suporte e direitos LGPD | e-mail, conteúdo da solicitação, evidências mínimas de identidade | responder suporte e solicitações de titulares | cumprimento de obrigação legal/regulatória e exercício regular de direitos | e-mail e registros internos | prazo necessário para atendimento, auditoria e defesa de direitos |
| Exclusão de conta | UID e dados vinculados | apagar conta e dados associados sob controle do produto | cumprimento de solicitação do titular/obrigação legal | Firebase Auth, Firestore, armazenamento local | processamento imediato/operacional, ressalvadas retenções legalmente justificadas |

## Princípios operacionais

1. Coletar apenas o necessário para a finalidade declarada.
2. Não reutilizar dados educacionais para finalidade incompatível sem nova análise.
3. Não enviar ao Tutor senhas ou dados de pagamento.
4. Não conceder ao modelo de IA autoridade para aprovar aluno, alterar pontuação já registrada ou liberar Premium.
5. Manter separação entre dados de autenticação, progresso, compras e contexto do Tutor.
6. Revisar fornecedores e transferências internacionais antes de produção ampla.
7. Documentar mudanças de finalidade, base legal, prazo de retenção ou compartilhamento.

## Pendências

- [ ] Validar formalmente a hipótese legal de cada linha com assessoria jurídica quando o produto entrar em operação comercial ampla.
- [x] Definir prazo operacional e descarte automático para sessões do Tutor.
- [x] Definir descarte automático para idempotência e rate limits.
- [x] Definir política operacional para Cloud Logs: `_Default` em 30 dias ou menos quando configurável, sem conteúdo de prompt; `_Required` segue retenção imutável de 400 dias do Google Cloud.
- [ ] Verificar no console do projeto, antes do deploy, a retenção efetiva do bucket `_Default` e eventuais sinks/buckets adicionais.
- [ ] Documentar mecanismos de transferência internacional dos fornecedores.
- [ ] Confirmar no Google AI Studio/console do projeto que o logging opcional da Gemini API está desativado em produção e que nenhum dataset de conversas reais de alunos é compartilhado.
- [x] Implementar exportação estruturada dos dados do titular.
- [ ] Definir estratégia definitiva de idade e tratamento de menores antes da produção ampla do Tutor.
- [x] Elaborar RIPD interno do Tutor Trivial (`docs/ripd_tutor_trivial.md`).
- [ ] Atualizar este registro quando notificações de estudo, analytics ou novos SDKs forem adicionados.

## Referências normativas

- Lei nº 13.709/2018 — Lei Geral de Proteção de Dados Pessoais.
- Regulamentações e guias publicados pela Autoridade Nacional de Proteção de Dados (ANPD), conforme aplicáveis.
