---
name: hopper-spec-anth
description: Escreve a spec de qualquer entrega, como software, documento, evento ou processo, para que outra sessão, pessoa ou equipe a execute do início ao fim sem voltar a perguntar. A skill fixa o que a spec garante, e o modelo em uso decide e registra como cumprir, pela prática mais atual. Use quando o usuário acionar esta skill para escrever uma spec.
compatibility: Requer Claude Code, na CLI ou no aplicativo.
disable-model-invocation: true
---

# hopper-spec-anth

Esta skill escreve uma **spec**, o documento que basta para executar uma entrega do início ao fim. Ela só escreve. A execução acontece depois, em outra sessão, por quem o proprietário escolher, lendo só a spec.

## O que é fixo e o que é seu

A skill fixa **o que** a spec garante. As garantias estão em `${CLAUDE_SKILL_DIR}/garantias.md`. Leia o arquivo inteiro antes do passo 1.

**Como** cumprir cada garantia e cada requisito é decisão sua, o modelo que está rodando a skill. Escolha a forma que cumpre o "o que" com o menor custo de manutenção, com recursos nativos e com suporte ativo. Sua memória tem data de corte. Por isso, antes de cada escolha, consulte a documentação oficial atual e o ambiente instalado.

Registre cada escolha na spec como uma **decisão de como**, com estes campos.

- Atende a: o requisito ou a garantia.
- Alternativas: as opções consideradas.
- Fontes: o que foi consultado, com data.
- Motivo: por que esta opção venceu.
- Prova: como mostrar que ela funciona.

Ferramentas, produtos, versões, formatos e números, como tentativas, repetições e tamanho das unidades, entram na spec como decisões de como. A skill não os fixa.

Se o modelo ou o esforço desta sessão estiverem abaixo dos mais altos disponíveis, avise o usuário 1 vez, no início, e siga a escolha dele.

## Participantes

| Quem | Papel |
| --- | --- |
| Proprietário | Quem acionou a skill, ou quem ele indicar. Decide a entrega e o que é caro de desfazer |
| Redator | Você. Lê as fontes, pergunta, decide o como e escreve a spec |
| Executor | Quem vai executar a spec, seja agente, pessoa ou equipe. Lê só a spec |
| Verificador | O que decide se um requisito está pronto, como um programa, uma medição ou a aprovação do proprietário. Nunca é o executor |

## Passos

### 1. Delimitar

Identifique a entrega, o proprietário, o executor previsto e o destino da spec, isto é, onde o arquivo fica. Use o pedido, o contexto e as instruções do projeto.

Se o pedido for explicar, revisar ou editar esta skill, atenda o pedido e encerre aqui, sem escrever spec.

Pronto quando os 4 itens estão definidos ou entraram na lista de perguntas do passo 3.

### 2. Ler as fontes

Leia tudo o que existe sobre a entrega, como arquivos, documentos do projeto, sistemas em funcionamento, decisões anteriores e fatos externos atuais. Buscar fatos é tarefa sua, e não do proprietário.

Pronto quando cada fato que a spec vai usar tem fonte anotada e o que as fontes não respondem está listado.

### 3. Perguntar ao proprietário

Pergunte só o que as fontes não respondem e que muda o trabalho do executor ou é caro de desfazer. Faça perguntas numeradas, em texto simples, cada uma com a resposta recomendada, redigida para que "sim" a aceite. Uma rodada nova só vem se uma resposta abrir dúvida nova. Registre cada resposta com as palavras do proprietário e a data.

Se o proprietário estiver indisponível ou pedir para não ser consultado, adote a resposta recomendada e marque cada uma como "pendente de confirmação" na spec.

Pronto quando toda dúvida que muda o trabalho do executor tem resposta ou está marcada como pendente.

### 4. Escrever

Escreva a spec no idioma do proprietário. A forma do documento é sua. O conteúdo abaixo é obrigatório.

1. Objetivo e o resultado observável que encerra o trabalho.
2. Participantes e o que cada um faz.
3. Requisitos numerados, na forma da garantia G02, com o comportamento esperado.
4. Casos de borda de cada requisito.
5. O que nunca pode acontecer.
6. O que fica fora.
7. Glossário com um único nome para cada coisa, usado igual em toda a spec.
8. Decisões do proprietário, com as palavras dele e a data.
9. Unidades de trabalho e ordem, com as dependências. A 1ª unidade prova o ambiente (G11).
10. Ações que passam pelo proprietário (G10).
11. As garantias de `garantias.md`, copiadas sem mudança, cada uma com a decisão de como que a cumpre.
12. As decisões de como.
13. Riscos e o tratamento de cada um.
14. Correções depois da entrega (G12).
15. Pendências para o proprietário, quando existirem.
16. O nome e a versão desta skill, lidos em `${CLAUDE_SKILL_DIR}/../../.claude-plugin/plugin.json`.

Ajuste o rigor ao custo de errar. Uma entrega pequena cumpre uma garantia com um mecanismo simples, por exemplo uma lista de aceite aprovada pelo proprietário. Uma garantia pode ficar como "não se aplica", com o motivo registrado. As garantias G01 a G05 valem sempre.

Pronto quando os 16 itens estão na spec.

### 5. Conferir

Confira a spec inteira contra estes critérios.

- Todo requisito tem identificador e verificador, sem termo vago.
- Toda garantia tem decisão de como e prova, ou o motivo de "não se aplica".
- Toda decisão de como tem fontes com data.
- Cada coisa tem um único nome.
- Nada depende da conversa da escrita.

Depois, peça a um leitor de contexto limpo, sem acesso a esta conversa, que leia só a spec e liste as dúvidas que teria para executá-la. Cada dúvida vira correção na spec ou pergunta ao proprietário.

Pronto quando todos os critérios passam e cada dúvida do leitor tem destino.

### 6. Entregar

Grave a spec no destino. Informe ao proprietário o caminho do arquivo, as pendências e o que ficou sem verificação. A execução começa depois, por decisão do proprietário, em sessão nova que lê só a spec.
