# PRD — Cálculo Trivial

Última atualização: 2026-10-10  
Status: documento mestre de produto  
Owner: produto Cálculo Trivial

## 1. Objetivo deste documento

Este PRD define o problema, o público, a proposta de valor, o escopo funcional, as prioridades e os critérios de sucesso do Cálculo Trivial.

Ele descreve **o que o produto deve fazer e por quê**.

Detalhes de implementação pertencem ao `TRD.md`, fluxos completos ao `PRODUCT_FLOWS.md`, regras visuais ao `DESIGN_SYSTEM.md`, backend ao `BACKEND_ARCHITECTURE.md` e sequência de execução ao `ROADMAP.md`.

Quando uma funcionalidade estiver descrita aqui como futura ou em desenvolvimento, isso não significa que ela já esteja presente na release publicada ou em Teste Fechado.

## 2. Problema

Muitos estudantes chegam a Pré-Cálculo e Cálculo com lacunas em fundamentos numéricos, álgebra, equações, funções e leitura matemática.

Essas lacunas dificultam a compreensão de conteúdos posteriores e tornam abordagens centradas apenas em fórmulas, resolução automática ou repetição de exercícios insuficientes.

O problema que o Cálculo Trivial busca resolver é:

> ajudar o estudante a construir e recuperar os pré-requisitos necessários, compreender novos conceitos, praticar com feedback adequado e avançar de forma progressiva até conteúdos de cálculo.

O produto não deve presumir que todo erro em Cálculo é causado pelo conteúdo de Cálculo em si. Sempre que houver evidência suficiente, a experiência deve permitir revisar habilidades anteriores.

## 3. Visão do produto

Cálculo Trivial é um aplicativo educacional Android-first para aprendizagem progressiva de matemática, Pré-Cálculo e Cálculo.

A experiência combina:

- trilhas organizadas;
- aulas;
- exemplos resolvidos;
- prática guiada;
- avaliações;
- revisão;
- acompanhamento de progresso;
- gamificação subordinada à aprendizagem;
- Tutor Trivial como apoio contextual;
- evolução futura para aprendizagem adaptativa explicável.

O produto não deve se tornar apenas um banco de questões, coleção de fórmulas, plataforma de vídeos, chatbot resolvedor ou sistema orientado por tempo de tela.

## 4. Objetivos do produto

### 4.1 Objetivos atuais

O produto deve:

1. fortalecer pré-requisitos matemáticos;
2. organizar o estudo em uma progressão clara;
3. reduzir repetição mecânica de questões;
4. oferecer feedback durante prática;
5. separar prática de avaliação;
6. registrar progresso e desempenho;
7. ajudar o estudante a reconhecer conteúdos que precisam de revisão;
8. manter uma experiência móvel utilizável e previsível;
9. proteger dados, conta e progresso;
10. permitir evolução do conteúdo sem reconstruir o produto.

### 4.2 Objetivos de evolução

O produto deve evoluir para:

- revisão por habilidade;
- diagnóstico pedagógico baseado em evidência acumulada;
- Tutor Trivial contextual;
- revisão espaçada;
- transferência entre questões diferentes;
- múltiplas trilhas reutilizando conteúdo;
- recursos futuros para professor e instituição com consentimento e isolamento adequados.

## 5. Não objetivos

Não é objetivo imediato:

- substituir professor;
- diagnosticar transtornos ou capacidade intelectual;
- usar IA como autoridade final de nota ou domínio;
- gerar respostas matemáticas oficiais sem validação;
- maximizar tempo de tela;
- criar infraestrutura B2B ampla antes de validar o produto B2C;
- reconstruir o aplicativo;
- expandir o banco de questões apenas por volume;
- transformar XP, ouro ou sequência em objetivo principal;
- oferecer desktop ou XR como plataforma principal;
- coletar telemetria invasiva.

## 6. Público

### 6.1 Público principal atual

B2C:

- estudantes de Engenharia;
- estudantes de Matemática;
- estudantes de Computação;
- estudantes de Física;
- estudantes de outras áreas de Ciências Exatas;
- estudantes que precisam reforçar fundamentos;
- estudantes preparando a base para Pré-Cálculo e Cálculo;
- estudantes que desejam estudar no próprio ritmo.

### 6.2 Públicos de expansão

O mesmo conteúdo poderá alimentar, quando houver justificativa:

- Ensino Médio;
- ENEM e vestibulares;
- reforço escolar;
- professor;
- turma;
- escola ou instituição.

A expansão de público deve acrescentar trilhas e experiências, não apagar o produto B2C atual.

## 7. Proposta de valor

O estudante deve conseguir:

1. entender onde está na jornada;
2. estudar conteúdos em ordem coerente;
3. aprender antes de ser cobrado;
4. praticar com variedade;
5. receber feedback adequado;
6. revisar erros e habilidades frágeis;
7. fazer avaliações sem exposição imediata da resposta;
8. acompanhar progresso;
9. receber recomendações compreensíveis;
10. pedir apoio ao Tutor Trivial;
11. avançar para conteúdos mais complexos com uma base mais sólida.

## 8. Princípios pedagógicos permanentes

O produto deve preservar:

- aprendizagem acima de engajamento;
- progressão sem pular pré-requisitos essenciais;
- recuperação ativa quando apropriada;
- exemplos resolvidos antes de exigir transferência complexa;
- erro como evidência para revisão, não como punição;
- um único acerto não significa domínio;
- um único erro não identifica a causa da dificuldade;
- ajuda não deve ser tratada como fracasso;
- conteúdo futuro não deve ser usado apenas para preencher uma sessão;
- dificuldade não deve virar rótulo de capacidade;
- IA deve auxiliar, não decidir sozinha;
- desempenho, retenção e transferência devem ser diferenciados.

## 9. Estrutura do produto

Estrutura-alvo:

Área/Trilha  
→ Conteúdo  
→ Módulo  
→ Aula  
→ Explicação  
→ Exemplos  
→ Prática  
→ Revisão  
→ Avaliação  
→ Resultado/Progresso.

O conteúdo deve poder ser reutilizado em diferentes trilhas sem duplicação desnecessária e sem destruir IDs ou progresso existente.

## 10. Conteúdo

### 10.1 Conteúdo já presente na experiência atual

A experiência atual possui conteúdo relacionado a:

- Fundamentos Matemáticos;
- Álgebra;
- Equações e Inequações;
- Funções;
- Limites;
- Continuidade;
- Derivadas.

### 10.2 Direção curricular

A sequência deve evoluir de:

Fundamentos  
→ Ensino Médio quando aplicável  
→ Pré-Cálculo  
→ Cálculo  
→ conteúdos avançados futuros.

O currículo canônico de Pré-Cálculo está detalhado em `precalculus_curriculum_v1.md`.

## 11. Estado das funcionalidades

### 11.1 Release de Teste Fechado

A versão `1.2.0+24` é a referência atual do Teste Fechado.

Ela deve permanecer isolada de funcionalidades futuras enquanto estiver em validação.

### 11.2 Implementado ou operacional no produto atual

O produto possui, em diferentes níveis de maturidade:

- autenticação;
- dashboard;
- trilhas;
- módulos e aulas;
- prática;
- avaliação final;
- progresso;
- estatísticas;
- XP e ouro;
- desafios;
- revisão personalizada;
- Premium com RevenueCat;
- persistência local e remota;
- exclusão de conta;
- infraestrutura de Tutor Trivial no backend;
- segurança e CI automatizado.

### 11.3 Em desenvolvimento isolado

Ainda não faz parte da release `1.2.0+24`:

- FASE 9 — Histórico de Aprendizagem;
- FASE 10 — Smart Review.

Essas funcionalidades permanecem em branches/PRs separados até a estratégia de release autorizar integração.

### 11.4 Futuro

Entre os itens futuros estão:

- revisão espaçada avançada;
- diagnóstico pedagógico;
- testes por aula mais amplos;
- dark mode global;
- área do professor;
- licenciamento por turma/escola;
- expansão curricular;
- telemetria mínima, somente após avaliação explícita.

## 12. Requisitos funcionais

### PRD-FR-01 — Jornada progressiva

O usuário deve conseguir navegar por trilhas, módulos e aulas em uma ordem pedagógica definida.

### PRD-FR-02 — Aula

Cada aula deve poder apresentar objetivo, explicação, exemplos e ligação com prática.

Conteúdo novo deve seguir progressivamente o padrão curricular oficial.

### PRD-FR-03 — Prática guiada

O usuário deve conseguir responder questões associadas ao conteúdo estudado e receber feedback apropriado.

A prática deve reduzir repetição quando houver banco suficiente.

### PRD-FR-04 — Avaliação

Avaliações devem ser distintas da prática.

Quando o teste for usado para conclusão canônica, respostas corretas críticas não devem depender exclusivamente do cliente.

### PRD-FR-05 — Progresso

O usuário deve conseguir acompanhar avanço por aulas, módulos e estatísticas relevantes.

### PRD-FR-06 — Revisão

O produto deve oferecer mecanismo de revisão com base em evidências reais de desempenho.

### PRD-FR-07 — Smart Review

Quando integrado, o Smart Review deve:

- trabalhar por habilidade;
- priorizar evidência de dificuldade;
- preferir questão equivalente à repetição literal quando possível;
- evitar conteúdo não estudado;
- produzir decisão explicável;
- não alterar progresso canônico.

### PRD-FR-08 — Tutor Trivial

O Tutor deve apoiar compreensão sem substituir conteúdo oficial ou avaliação.

Ele deve funcionar com contexto mínimo e não possuir autoridade sobre nota, conclusão, XP, ouro ou Premium.

### PRD-FR-09 — Conta

O usuário deve poder criar conta, entrar, sair, recuperar acesso quando suportado e excluir a própria conta.

### PRD-FR-10 — Sincronização

O progresso adequado deve sobreviver a reinício e permitir sincronização entre sessões/dispositivos dentro do modelo suportado.

### PRD-FR-11 — Uso offline

Conteúdos e estados que não exigem autoridade de backend devem continuar disponíveis dentro do escopo offline suportado.

Operações que exigem backend não devem simular sucesso offline.

### PRD-FR-12 — Premium

Recursos Premium devem depender de entitlement válido.

Restauração deve ser suportada e falha de monetização não deve corromper progresso educacional.

### PRD-FR-13 — Idiomas

A arquitetura de conteúdo e interface deve suportar Português e Inglês.

Uma funcionalidade nova não deve introduzir strings permanentes fora do sistema de localização sem justificativa.

### PRD-FR-14 — Exclusão de dados

Exclusão de conta deve remover os dados do usuário abrangidos pelo fluxo definido e limpar estado local correspondente.

### PRD-FR-15 — Privacidade pedagógica

Conversas do Tutor e histórico privado de estudo não devem ser automaticamente expostos a professor ou instituição.

## 13. Revisão Personalizada e Smart Review

### 13.1 Revisão atual

A Revisão Personalizada existente trabalha principalmente no nível da questão.

Ela deve permanecer disponível como fallback durante a evolução.

### 13.2 Smart Review

Objetivo:

Histórico + desempenho por questão + metadados  
→ desempenho por habilidade  
→ prioridade de revisão  
→ seleção de questões  
→ sessão explicável.

Regras:

- erros não resolvidos têm alta prioridade;
- reincidência na mesma habilidade aumenta prioridade;
- baixa precisão pode justificar reforço;
- outra questão da mesma habilidade deve ser preferida quando apropriado;
- a sessão deve buscar diversidade;
- `foundation` e `intermediate` devem preceder excesso de `challenge` em remediação;
- sessões não devem ser preenchidas artificialmente;
- nenhuma inferência deve virar rótulo permanente do estudante.

## 14. Tutor Trivial

O Tutor Trivial é um componente central da evolução do produto.

Deve:

- explicar conceitos;
- apoiar raciocínio;
- oferecer ajuda contextual;
- respeitar a aula e habilidade atual;
- poder ser recomendado após dificuldade;
- usar o mínimo de dados necessário;
- permanecer separado de decisões canônicas;
- preservar privacidade de conversas.

O produto principal deve continuar funcionando mesmo se a IA estiver indisponível.

## 15. Gamificação

O produto pode utilizar:

- XP;
- ouro;
- sequência;
- desafios;
- conquistas;
- progresso visual.

Esses mecanismos devem:

- incentivar continuidade saudável;
- nunca substituir evidência pedagógica;
- não punir ajuda;
- não recompensar comportamento que prejudique aprendizagem;
- permanecer separados de inferências do Smart Review.

## 16. Premium e modelo de negócio

O produto B2C pode combinar experiência gratuita e Premium.

A experiência gratuita deve permanecer útil.

Premium pode ser usado para ampliar:

- conteúdo;
- caminhos;
- prática;
- estatísticas;
- recursos avançados;
- experiências futuras de aprendizagem adaptativa.

A definição comercial específica de cada benefício pode evoluir sem alterar os princípios pedagógicos ou de segurança.

## 17. Privacidade, segurança e LGPD

São requisitos permanentes:

- minimização de dados;
- finalidade clara;
- autenticação real;
- isolamento por usuário;
- autorização server-side;
- App Check quando aplicável;
- secrets fora do cliente;
- proteção contra abuso;
- rate limiting;
- exclusão de conta;
- logs mínimos;
- nenhuma coleta desnecessária de texto livre;
- nenhum perfil psicológico;
- nenhuma classificação permanente de capacidade;
- revisão da política de privacidade e Data Safety quando o comportamento mudar.

Detalhes técnicos pertencem ao TRD e à arquitetura de backend.

## 18. Design e acessibilidade

O produto deve:

- priorizar leitura e resolução matemática;
- manter hierarquia visual consistente;
- evitar carga visual desnecessária;
- não depender apenas de cor;
- suportar escala de texto dentro do possível;
- possuir alvos de toque adequados;
- usar semântica de acessibilidade;
- considerar dark mode em novos componentes;
- validar tablet antes de promover experiência de tablet.

As regras visuais oficiais estão em `DESIGN_SYSTEM.md`.

## 19. Plataformas

Prioridade atual:

1. Android;
2. telefone;
3. tablet após validação real;
4. demais plataformas somente quando se tornarem alvo oficial.

Package Android oficial:

`com.lucaszion01.calculotrivial`.

Esse identificador não deve ser alterado após publicação.

## 20. Requisitos de qualidade

Uma funcionalidade não deve ser considerada pronta apenas porque compila.

Conforme o risco, deve:

- preservar fluxos existentes;
- possuir testes;
- passar análise estática;
- preservar compatibilidade;
- tratar falhas;
- ter fallback apropriado;
- respeitar privacidade;
- passar revisão de segurança;
- ser validada em dispositivo real quando depender de Play Store, compras, App Check ou layout físico;
- não alterar progresso canônico de forma indireta.

## 21. Métricas de sucesso

Métricas devem ser interpretadas em conjunto.

Indicadores úteis:

- início e conclusão de sessões;
- conclusão de aulas e módulos;
- evolução de precisão por habilidade;
- redução de erros recorrentes;
- sucesso em questões diferentes da questão originalmente errada;
- retenção em revisão posterior;
- retorno voluntário ao produto;
- uso de revisão;
- feedback qualitativo;
- estabilidade e taxa de erro técnico.

Tempo de tela, cliques, XP ou frequência isoladamente não constituem prova de aprendizagem.

## 22. Critérios de aceite do produto

Uma evolução significativa deve ser aceita somente quando:

1. resolve um problema compatível com a visão;
2. não contradiz o currículo;
3. não quebra progressão atual;
4. não expõe dados indevidos;
5. não cria autoridade indevida no cliente ou IA;
6. possui comportamento claro em falha;
7. mantém compatibilidade com usuários existentes;
8. possui teste proporcional ao risco;
9. respeita a release em validação;
10. atualiza a documentação mestre correspondente.

## 23. Dependências externas relevantes

O produto depende atualmente, em diferentes partes, de:

- Google Play;
- Firebase;
- RevenueCat;
- provedor de IA usado pelo Tutor.

Falha de uma dependência externa não deve apagar progresso local nem transformar uma operação falha em sucesso aparente.

## 24. Riscos principais

### Risco pedagógico

Transformar métricas simples em “domínio”.

Mitigação: evidência acumulada, revisão por habilidade e validação pedagógica.

### Risco de conteúdo

Banco de questões crescer mais rápido que a revisão de qualidade.

Mitigação: expansão incremental e testes de cobertura/integridade.

### Risco de segurança

Cliente modificado tentar alterar progresso ou recompensas.

Mitigação: regras, validação e migração gradual de decisões críticas para backend confiável.

### Risco de privacidade

Expansão para Tutor, professor ou analytics aumentar coleta.

Mitigação: minimização, consentimento quando aplicável, separação de dados e revisão LGPD.

### Risco de produto

Adicionar recursos demais antes de validar experiência principal.

Mitigação: roadmap cumulativo, implementação por fases e Teste Fechado.

### Risco de monetização

Premium ou dependências comerciais bloquearem o aprendizado básico.

Mitigação: experiência gratuita útil e separação entre entitlement e progresso educacional.

## 25. Restrições atuais

- Android é o alvo principal;
- Teste Fechado ainda faz parte da estratégia de validação;
- FASE 9 e FASE 10 ainda não pertencem à release 1.2.0+24;
- conteúdo deve crescer de forma incremental;
- professor/instituição permanecem futuros;
- telemetria adicional não está autorizada por padrão.

## 26. Governança de mudanças

Mudanças relevantes no produto devem atualizar este PRD quando alterarem:

- público;
- proposta de valor;
- fluxo principal;
- regras pedagógicas;
- monetização;
- privacidade;
- plataformas;
- critérios de sucesso;
- escopo de uma funcionalidade central.

Mudanças técnicas sem impacto de produto devem atualizar o TRD ou documentação técnica correspondente, sem inflar este PRD.
