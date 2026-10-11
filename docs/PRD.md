# PRD — Cálculo Trivial

Última atualização: 2026-10-10
Status: documento mestre de produto

## 1. Visão do produto

Cálculo Trivial é um aplicativo educacional Android-first para aprendizagem progressiva de matemática, pré-cálculo e cálculo.

O produto foi desenhado para estudantes que chegam ao cálculo com lacunas em fundamentos, álgebra, equações, funções e outros pré-requisitos. A proposta é organizar o estudo em uma sequência guiada, com conteúdo, exemplos, prática, revisão, avaliação e acompanhamento de progresso.

O objetivo não é ser apenas um banco de questões, coleção de fórmulas ou chatbot resolvedor. O produto deve ajudar o estudante a compreender, praticar, revisar erros, consolidar habilidades e avançar sem pular etapas importantes.

## 2. Público principal

Público B2C inicial:

- estudantes do ensino superior em Engenharia, Matemática, Computação, Física e áreas de Ciências Exatas;
- estudantes que precisam reforçar fundamentos matemáticos;
- estudantes em preparação para Pré-Cálculo e Cálculo;
- estudantes que desejam estudar no próprio ritmo.

Expansões futuras podem reutilizar o mesmo conteúdo em trilhas para Ensino Médio, ENEM/Vestibulares, reforço, professor, turma e instituição.

A expansão para B2B não deve substituir nem interromper o produto B2C atual.

## 3. Proposta de valor

O Cálculo Trivial deve permitir que o estudante:

1. identifique onde está na jornada;
2. estude conteúdos em sequência progressiva;
3. veja exemplos antes da prática;
4. pratique com questões variadas;
5. receba feedback adequado ao tipo de atividade;
6. revise erros e habilidades frágeis;
7. faça avaliações sem exposição imediata da resposta;
8. acompanhe progresso e evolução;
9. use o Tutor Trivial como apoio contextual;
10. avance para conteúdos mais complexos com uma base mais sólida.

## 4. Estrutura pedagógica

Estrutura principal:

Área/Trilha → Conteúdo → Módulo → Aula → Exemplos → Prática → Revisão → Teste final → Resultado/Progresso.

O conteúdo deve ser reutilizável entre diferentes trilhas quando necessário, preservando IDs e progresso existentes.

## 5. Conteúdo atual

A experiência atual inclui conteúdos em:

- Fundamentos Matemáticos;
- Álgebra;
- Equações e Inequações;
- Funções;
- Limites;
- Continuidade;
- Derivadas.

O currículo deve continuar evoluindo para Pré-Cálculo e posteriormente Cálculo, sem abandonar ou reconstruir o que já está funcionando.

## 6. Experiência de aprendizagem

O produto deve preservar os seguintes princípios:

- aprendizagem acima de tempo de tela;
- progressão sem pular etapas;
- questões variadas sempre que o banco permitir;
- erro como evidência para revisão, não como punição;
- um único acerto não significa domínio;
- dificuldade não deve ser interpretada como incapacidade;
- IA não deve ser autoridade final sobre aprovação, progresso ou recompensas;
- conteúdo futuro não deve ser introduzido apenas para preencher uma sessão;
- explicações e exemplos devem preceder cobranças incompatíveis com o que foi ensinado.

## 7. Avaliações

Prática guiada:

- pode oferecer feedback imediato;
- registra acertos e erros;
- alimenta revisão;
- não deve liberar conteúdo crítico apenas por tentativa.

Teste final:

- deve apresentar questões diferentes da prática sempre que o banco permitir;
- não deve revelar correção imediata durante a avaliação;
- aprovação e conclusão devem usar regras verificáveis;
- respostas corretas críticas não devem depender exclusivamente do cliente.

## 8. Smart Review

O Smart Review é a evolução da Revisão Personalizada.

Objetivo:

Histórico + desempenho por questão + metadados → desempenho por habilidade → prioridade de revisão → seleção inteligente.

Regras:

- priorizar erros não resolvidos, reincidência e baixa precisão;
- preferir outra questão da mesma habilidade antes da repetição direta;
- evitar conteúdo ainda não estudado;
- distribuir a sessão entre habilidades relevantes;
- reduzir a sessão quando não houver itens pertinentes;
- ser determinístico e explicável;
- não conceder XP, ouro, aprovação ou conclusão.

## 9. Tutor Trivial

O Tutor Trivial é parte central da evolução do produto.

Deve:

- ajudar a compreender conceitos e procedimentos;
- receber apenas o contexto mínimo necessário;
- respeitar o estágio atual da aula;
- complementar, não substituir, conteúdo e avaliação;
- nunca alterar sozinho progresso, domínio, aprovação, XP, ouro ou Premium;
- não compartilhar automaticamente conversas privadas com professor ou instituição.

## 10. Progresso e engajamento

O produto pode usar:

- progresso por aulas e módulos;
- sequência de estudos;
- XP;
- ouro;
- desafios;
- revisão personalizada;
- atividade recente;
- estatísticas de desempenho.

Gamificação deve apoiar aprendizagem, não criar incentivo para respostas rápidas sem compreensão.

## 11. Premium

Premium pode oferecer expansão de experiência, conteúdo e recursos adicionais.

Requisitos:

- acesso controlado por entitlement;
- restauração de compra;
- comportamento seguro em falhas de rede;
- nenhuma chave secreta no cliente;
- experiência gratuita ainda útil;
- monetização não pode interferir com regras pedagógicas ou segurança.

## 12. Privacidade e segurança

Requisitos permanentes:

- LGPD e minimização de dados;
- isolamento por usuário;
- autenticação real;
- exclusão de conta;
- secrets somente no servidor;
- validação server-side;
- App Check;
- proteção contra abuso e rate limiting;
- logs sem secrets e sem conteúdo privado desnecessário;
- dados educacionais não devem virar rótulos permanentes de capacidade;
- professor/instituição não recebe automaticamente histórico privado ou conversas com Tutor.

## 13. Plataformas

Prioridade atual:

1. Android;
2. experiência móvel;
3. tablets após validação real de layout;
4. outras plataformas somente quando se tornarem alvo oficial.

O package Android oficial é com.lucaszion01.calculotrivial.

## 14. Idiomas

O produto deve suportar Português e Inglês de forma consistente.

Novos fluxos devem considerar localização desde a implementação.

## 15. Critérios gerais de qualidade

Uma funcionalidade só deve ser considerada pronta quando:

- não quebra fluxos existentes;
- possui testes proporcionais ao risco;
- respeita segurança e privacidade;
- funciona com dados existentes;
- preserva compatibilidade;
- possui fallback quando necessário;
- passa flutter analyze e testes automatizados;
- não altera progresso canônico sem regra explícita;
- foi validada em dispositivo real quando a experiência depender de hardware, Play Store, App Check ou compras.

## 16. Fora de escopo imediato

Não são prioridade imediata:

- reconstruir o produto;
- migrar toda a arquitetura sem necessidade;
- expandir banco de questões de forma massiva antes de validar a base;
- dashboard de professor completo;
- infraestrutura B2B ampla;
- IA decidindo nota ou domínio;
- XR;
- desktop como plataforma principal;
- telemetria invasiva.

## 17. Métrica de sucesso do produto

O sucesso deve ser medido por evidências de aprendizagem e continuidade saudável, não apenas por tempo de uso.

Indicadores úteis incluem:

- conclusão de sessões;
- evolução em habilidades;
- redução de erros recorrentes;
- transferência para questões diferentes;
- retorno voluntário ao estudo;
- conclusão de módulos;
- feedback qualitativo de estudantes.

Essas métricas não devem ser tratadas isoladamente como prova de aprendizagem.
