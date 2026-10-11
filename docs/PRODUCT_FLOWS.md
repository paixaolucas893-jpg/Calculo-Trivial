# Product Flows — Cálculo Trivial

Última atualização: 2026-10-10
Status: mapa oficial de fluxos

## 1. Fluxo principal de aprendizagem

Entrada
→ Dashboard
→ Trilhas
→ Módulo
→ Aula
→ Conteúdo
→ Exemplos resolvidos
→ Prática guiada
→ Revisão
→ Teste final
→ Resultado
→ Progresso
→ Próxima etapa.

Princípio: não liberar etapas críticas por simples tentativa.

## 2. Fluxo de aula

Abrir aula
→ ler objetivo
→ estudar conceito
→ acompanhar exemplos
→ acessar prática
→ responder questões
→ receber feedback
→ concluir prática
→ revisar quando necessário
→ fazer avaliação correspondente.

## 3. Fluxo de prática

Selecionar questões
→ evitar repetição quando o banco permite
→ apresentar questão
→ estudante responde
→ registrar acerto/erro
→ mostrar feedback
→ seguir para próxima
→ atualizar estatísticas e histórico.

Prática pode fornecer feedback imediato.

## 4. Fluxo de teste final

Solicitar teste
→ backend cria sessão segura
→ cliente recebe questões sem resposta correta exposta
→ estudante responde
→ sem feedback imediato
→ enviar respostas
→ backend valida
→ calcular resultado
→ se aprovado, concluir módulo conforme regra
→ retornar resultado.

## 5. Fluxo de revisão personalizada atual

Abrir Revisão Personalizada
→ identificar questões que precisam de revisão
→ priorizar erros não resolvidos
→ reduzir repetição da sessão anterior
→ montar sessão
→ responder
→ registrar desempenho.

Esse fluxo permanece como fallback durante a introdução do Smart Review.

## 6. Fluxo Smart Review

Histórico de aprendizagem
+ desempenho por questão
+ metadados
→ agrupar por habilidade
→ identificar habilidades elegíveis
→ ordenar prioridades
→ selecionar questões da habilidade
→ evitar conteúdo futuro
→ evitar repetição direta quando houver alternativa
→ distribuir entre habilidades
→ gerar sessão explicável
→ responder
→ registrar novas evidências.

O Smart Review não altera diretamente XP, ouro ou conclusão.

## 7. Fluxo de erro

Resposta incorreta
→ registrar erro
→ fornecer feedback apropriado
→ continuar sessão
→ aumentar evidência de revisão
→ Smart Review/Revisão Personalizada pode selecionar habilidade posteriormente.

Erro isolado não deve gerar rótulo permanente.

## 8. Fluxo de progresso

Atividade válida
→ registrar estatística
→ persistir localmente
→ tentar sincronizar remotamente
→ atualizar tela de progresso.

Conclusão canônica e recompensas críticas devem respeitar regras confiáveis separadas.

## 9. Fluxo de autenticação

Abrir app
→ verificar sessão
→ se autenticado, carregar progresso
→ se não autenticado, entrar/cadastrar
→ autenticar via provedor permitido
→ estabelecer UID
→ carregar estado do usuário.

Logout:
solicitar logout
→ limpar sessão local
→ encerrar provedor
→ voltar à entrada.

## 10. Fluxo de exclusão de conta

Usuário solicita exclusão
→ confirmação
→ reautenticação quando necessária
→ callable autenticada
→ backend apaga dados associados
→ apagar Auth
→ limpar estado local
→ encerrar sessão
→ retornar à entrada.

Falha deve ser explicitada; não simular exclusão.

## 11. Fluxo Premium

Abrir recurso Premium
→ verificar entitlement
→ se ativo, liberar
→ se inativo, apresentar oferta
→ compra via Google Play/RevenueCat
→ verificar entitlement atualizado
→ liberar recurso.

Restauração:
usuário solicita restaurar
→ RevenueCat consulta compras
→ atualizar entitlement
→ informar resultado.

## 12. Fluxo Tutor Trivial

Usuário abre Tutor
→ app envia contexto mínimo permitido
→ callable autenticada
→ App Check
→ validar contrato
→ aplicar idempotência/rate limit
→ backend consulta conteúdo autorizado
→ IA gera apoio
→ backend estrutura resposta
→ cliente apresenta.

O Tutor não altera aprovação ou progresso canônico.

## 13. Fluxo de sincronização

Mudança local
→ gravar SharedPreferences
→ enfileirar persistência
→ tentar Firestore
→ sucesso: estado remoto atualizado
→ falha: manter estado local e registrar erro controlado
→ nova oportunidade de sincronização.

## 14. Fluxo de atualização via Google Play

Abrir app
→ verificar estado de atualização quando permitido
→ se atualização apropriada, informar usuário
→ tentar fluxo de atualização
→ se não disponível, fallback para Play Store.

A atualização não deve bloquear indevidamente o acesso ao estudo quando o cenário não exigir atualização obrigatória.

## 15. Fluxo de publicação

Feature branch
→ implementação
→ testes
→ PR
→ CI
→ revisão
→ merge em branch de release quando autorizado
→ gerar AAB por workflow seguro
→ enviar ao Play Console
→ teste fechado
→ validação real
→ somente depois avaliar produção.

## 16. Fluxo futuro professor/instituição

Não implementado.

Princípios já definidos:

- professor não recebe conversa privada do Tutor;
- acesso a dados deve ser explicitamente autorizado;
- separar dados pessoais, progresso acadêmico e relatórios;
- não confiar em histórico client-side como fonte oficial;
- consentimento, retenção e LGPD devem ser definidos antes da implementação.
