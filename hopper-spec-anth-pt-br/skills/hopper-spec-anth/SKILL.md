---
name: hopper-spec-anth
description: Escreve as 2 specs de um produto de software que agentes de IA constroem e provam com testes automáticos, como app, site, serviço ou ferramenta. A spec do produto diz o que ele faz. A spec de execução leva o corpo geral sem mudança e o anexo do projeto. Serve a produto novo e a projeto de software que ainda não tem as 2 specs. Não cobre documento, evento, processo nem outra entrega que não seja software. Use quando o usuário acionar esta skill.
compatibility: Requer Claude Code, na CLI ou no aplicativo, e um shell POSIX para o script do corpo.
disable-model-invocation: true
---

# hopper-spec-anth

Esta skill escreve 2 documentos para um produto de software que agentes de IA vão construir e provar com testes automáticos. Ela só escreve. A construção começa depois, por decisão do proprietário.

- **Spec do produto.** O que o produto faz. Siga [spec-do-produto.md](spec-do-produto.md).
- **Spec de execução.** Como o trabalho é executado e provado. É o corpo geral de [corpo-da-execucao.md](corpo-da-execucao.md), sem mudança, seguido do anexo do projeto, que você escreve por [anexo.md](anexo.md).

Os 2 documentos saem em português, o idioma deste pacote. Se o proprietário escrever em outro idioma, avise que existe o pacote em inglês e siga a escolha dele.

## Regras que valem em todos os passos

- **Corpo intocável.** O corpo entra inteiro e igual, montado pelo script `corpo.sh`, nunca redigitado. A única lacuna é `{{PROJETO}}`, na seção 0, que recebe o nome do produto. Resumo, reordenação, correção e "melhoria" do corpo ficam de fora. O corpo só muda por decisão expressa do proprietário, registrada na seção 2 da spec do produto com as palavras dele e a data.
- **Nada inventado.** Todo fato tem fonte, que é o projeto, uma resposta do proprietário ou uma página oficial consultada, com a data. O que falta vira pergunta ou recebe uma destas 3 marcas.
  - **a medir.** Número ou tempo que só a execução mostra. Diga quando ele é medido.
  - **a construir.** Arquivo, script ou lista que ainda não existe. Ele entra no item A10 do anexo.
  - **pendente de confirmação.** Resposta recomendada que o proprietário ainda não confirmou.
- **Documentos que valem sozinhos.** As 2 specs citam como fonte só o projeto, o proprietário e as páginas consultadas. A skill aparece só no cabeçalho, com o nome e a versão.
- **Exemplos fictícios.** Os modelos trazem exemplos de um app fictício só para mostrar a forma. O conteúdo vem do projeto.

## Passos

### 1. Delimitar

Identifique o produto, o proprietário, as plataformas e a pasta de destino. O destino padrão é `docs/`, na raiz do projeto, com `docs/spec-do-produto.md` e `docs/spec-de-execucao.md`. Antes de gravar sobre um arquivo que já existe, leia o arquivo e confirme com o proprietário.

Pare neste passo, sem gravar arquivo, em 3 casos.

- O pedido é explicar, revisar ou editar esta skill. Atenda o pedido.
- A entrega não é software, como documento, evento ou processo. Diga que a skill cobre só software feito por agentes de IA e provado por testes.
- O projeto já tem spec do produto e spec de execução. Diga que a função nova entra pela seção 6 do corpo dele, e a mudança de regra, pela seção 14.

Pronto quando o produto, o proprietário, as plataformas e o destino estão definidos ou viraram pergunta do passo 3.

### 2. Ler

Leia o que existe. Comece pelo pedido e pelo projeto, com código, testes, scripts, configuração de build, instruções do projeto, como `AGENTS.md` ou `CLAUDE.md`, e documentos. No ambiente, confira só o que o produto vai usar, como o sistema, as ferramentas instaladas e as máquinas que podem rodar os testes. Outros projetos e pastas pessoais ficam fora da leitura. Leia [corpo-da-execucao.md](corpo-da-execucao.md) inteiro, porque o anexo responde ao corpo. Sua memória tem data de corte. Por isso, consulte a documentação oficial atual antes de cada escolha técnica.

Pronto quando cada fato que os documentos vão usar tem fonte anotada e o que as fontes não respondem está listado.

### 3. Perguntar

Siga [perguntas.md](perguntas.md). Faça 1 mensagem só, com as perguntas numeradas, as opções explicadas em linguagem comum e a recomendação de cada uma. Antes dela, pesquise só o que muda uma recomendação. O resto da pesquisa fica para o passo 4.

Depois da mensagem, pare e espere a resposta. Os passos 4 a 7 começam só depois dela. Isso vale também em sessão sem interação, como `claude -p`, em que a resposta chega quando a sessão é retomada. Registre cada resposta com as palavras do proprietário e a data.

O proprietário está indisponível só quando o pedido ou ele mesmo diz isso. Nesse caso, ou quando ele pedir para não ser consultado, adote as recomendações sem mandar a mensagem e marque cada uma como "pendente de confirmação".

Pronto quando o proprietário respondeu e cada resposta está registrada, ou quando o pedido diz que ele está indisponível e cada recomendação adotada está marcada como pendente.

### 4. Decidir o como

As escolhas técnicas são suas, como arquitetura, linguagem, pastas, ferramentas de teste e o caminho da entrega interna. Prefira o recurso nativo, com suporte ativo e com menos dependências. Cada escolha vira uma decisão de como na seção 7 da spec do produto, com fontes datadas. A decisão das pastas define os caminhos das classes no anexo.

Pronto quando cada requisito e cada seção do anexo que depende de técnica têm a decisão de como que os sustenta.

### 5. Escrever

1. Escreva a spec do produto por [spec-do-produto.md](spec-do-produto.md).
2. Escreva a spec de execução por [anexo.md](anexo.md), com o cabeçalho, 1 linha só com `{{CORPO}}` no lugar do corpo e o anexo.
3. Troque a linha `{{CORPO}}` pelo corpo, com o comando abaixo, usando o nome do produto e o caminho do arquivo.

```sh
sh "${CLAUDE_SKILL_DIR}/scripts/corpo.sh" inserir "<nome do produto>" docs/spec-de-execucao.md
```

Se o shell só puder ler, troque a linha `{{CORPO}}` pelo conteúdo de [corpo-da-execucao.md](corpo-da-execucao.md) com a ferramenta de edição, com o nome no lugar de `{{PROJETO}}` e nenhuma outra mudança. O `conferir` do passo 6 só lê e funciona nesse caso. Depois disso, edite só o cabeçalho e o anexo.

Pronto quando os 2 arquivos estão gravados e o corpo foi inserido pelo script.

### 6. Conferir

Passe os 2 documentos por toda a [lista de conferência](conferencia.md). Corrija cada item que falhar e confira de novo, até todos passarem.

Pronto quando todos os itens passam e cada dúvida do leitor sem contexto tem destino.

### 7. Entregar

Informe ao proprietário, em linguagem comum, os caminhos dos 2 arquivos, as pendências de confirmação, os itens "a medir" e "a construir" que pedem atenção dele e o que ficou sem verificação. As 2 specs nascem como rascunho e passam a valer com a aprovação do proprietário. A construção começa depois, por decisão dele.
