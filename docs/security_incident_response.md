# Plano de Resposta a Incidentes de Segurança — Cálculo Trivial

Última revisão: 2026-10-01

## Objetivo

Definir um procedimento mínimo e repetível para detectar, conter, investigar, corrigir e documentar incidentes que possam comprometer dados pessoais, contas, credenciais, infraestrutura ou integridade pedagógica do Cálculo Trivial.

## Exemplos de incidentes

- acesso não autorizado a dados de usuários;
- regra de Firestore permissiva por erro;
- vazamento ou uso indevido de secret;
- comprometimento de conta administrativa;
- abuso automatizado do Tutor ou backend;
- exposição de logs contendo dados pessoais;
- envio indevido de dados ao modelo de IA;
- alteração indevida de progresso, XP, moedas ou desbloqueios;
- perda ou corrupção significativa de dados;
- dependência vulnerável explorada em produção.

## Severidade inicial

### S1 — Crítico
Exposição confirmada de dados pessoais em escala relevante, comprometimento de credenciais administrativas, execução remota, acesso transversal entre usuários ou incidente com risco relevante aos titulares.

### S2 — Alto
Acesso indevido limitado, vulnerabilidade explorável em produção, abuso material de backend, ou dados pessoais expostos a parte não autorizada com escopo reduzido.

### S3 — Médio
Falha de segurança sem evidência de exploração, configuração incorreta detectada preventivamente ou incidente restrito a dados não sensíveis e baixo impacto.

### S4 — Baixo
Evento operacional sem impacto real em confidencialidade, integridade ou disponibilidade.

## Fluxo de resposta

1. **Detectar**
   - registrar data/hora;
   - identificar origem do alerta;
   - preservar logs e evidências;
   - não apagar evidências antes da análise.

2. **Conter**
   - revogar ou rotacionar secrets comprometidos;
   - desabilitar endpoint/recurso quando necessário;
   - restringir regras de acesso;
   - bloquear credenciais ou sessões suspeitas;
   - limitar tráfego abusivo.

3. **Avaliar**
   - quais sistemas foram afetados;
   - quais categorias de dados;
   - quantos titulares potencialmente afetados;
   - duração do incidente;
   - possibilidade de cópia, alteração ou destruição;
   - risco ou dano relevante.

4. **Erradicar e corrigir**
   - corrigir vulnerabilidade;
   - atualizar regras/configurações;
   - aplicar patch;
   - remover persistência indevida;
   - validar que o vetor foi fechado.

5. **Recuperar**
   - restaurar serviços de modo controlado;
   - aumentar monitoramento;
   - confirmar integridade dos dados;
   - acompanhar reincidência.

6. **Comunicar**
   - avaliar obrigação de comunicação à ANPD e aos titulares;
   - preparar descrição objetiva do incidente, dados afetados, riscos e medidas tomadas;
   - utilizar os prazos regulatórios vigentes;
   - evitar minimizar ou especular sobre fatos não confirmados.

7. **Pós-incidente**
   - documentar causa-raiz;
   - registrar linha do tempo;
   - registrar decisões;
   - criar ações preventivas;
   - revisar este plano, ROPA e política de privacidade quando necessário.

## Contenção por sistema

### GitHub
- revogar tokens/secrets afetados;
- revisar commits e workflows;
- verificar alterações suspeitas;
- rotacionar credenciais usadas pelo CI.

### Firebase / Google Cloud
- revisar IAM;
- revogar sessões/chaves quando aplicável;
- restringir Firestore Rules;
- revisar App Check e Functions;
- revisar logs e orçamento/uso anômalo.

### RevenueCat
- rotacionar credenciais administrativas comprometidas;
- revisar App User IDs e eventos suspeitos;
- confirmar que apenas Public SDK Keys estão no app cliente.

### Tutor / Gemini
- desabilitar callable do Tutor se houver risco de exfiltração;
- rotacionar GEMINI_API_KEY;
- revisar prompts, payloads e logs;
- verificar se dados fora do contexto permitido foram enviados.

## Preservação de evidências

Registrar, quando disponível:
- timestamp;
- IDs de request/interação;
- UID ou identificador pseudonimizado;
- endpoint;
- versão/build;
- commit SHA;
- IP/logs quando legalmente e tecnicamente disponíveis;
- capturas e mensagens de erro;
- ações de contenção executadas.

Evitar coletar dados adicionais desnecessários durante a investigação.

## Contatos e responsabilidade

Enquanto o projeto for operado por equipe reduzida, a pessoa responsável pelo produto deve centralizar:
- triagem;
- contenção;
- registro;
- decisão de escalonamento;
- contato com fornecedores;
- comunicação regulatória quando aplicável.

Canal público de privacidade:
suporte.calculotrivial@gmail.com

## Revisão periódica

Revisar este plano:
- antes de produção ampla;
- quando o Tutor Trivial for ativado;
- após mudança relevante de infraestrutura;
- após qualquer incidente S1 ou S2;
- pelo menos uma vez por ano.
