# hopper-spec-anth

[English](../hopper-spec-anth-en/README.md) | **Português (Brasil)**

Uma skill do Claude Code que escreve as 2 specs de um produto de software que agentes de IA constroem e provam com testes automáticos, como app, site, serviço ou ferramenta de linha de comando.

## Os 2 documentos

- **Spec do produto.** O que o produto faz. Traz o objetivo, as decisões do proprietário, o glossário, os requisitos numerados, cada um com o que tem de ser verdade e como se confere, o que nunca pode acontecer, o que fica fora, as decisões de como e os riscos.
- **Spec de execução.** Como o trabalho é executado e provado. Traz o corpo geral, com as seções 0 a 14, sem mudança, e o anexo do projeto, com as seções A1 a A10.

O corpo geral vale para qualquer projeto. Ele define as classes de mudança e a prova de cada uma, quando cada prova roda, o que fazer com cada falha, como é uma missão, a revisão, os papéis e as medidas. Ele entra em cada spec inteiro e igual, montado por script, e a skill confere a cópia antes de entregar.

O anexo é escrito para cada projeto. Ele cobre os documentos, as plataformas e as telas, as classes por caminho, as máquinas e os tetos, a entrega, as contas e os segredos, os modelos de IA de cada papel, os arquivos com soma conferida, as medidas de partida e o que falta construir. O que a skill não sabe vira pergunta ou fica marcado "a medir", "a construir" ou "pendente de confirmação".

## Alcance

A skill serve a produto de software novo e a projeto de software que ainda não tem as 2 specs. Ela não escreve spec de documento, evento, processo ou outra entrega que não seja software. Em projeto que já tem as 2 specs, a função nova entra pela seção 6 do corpo, e a mudança de regra, pela seção 14.

## Os passos

1. **Delimitar** o produto, o proprietário, as plataformas e o destino.
2. **Ler** o projeto, o ambiente, o corpo e a documentação oficial atual.
3. **Perguntar** ao proprietário só o essencial, em 1 mensagem, com as opções explicadas em linguagem comum e a recomendação de cada uma.
4. **Decidir o como**, com fontes datadas.
5. **Escrever** os 2 documentos, com o corpo inserido pelo script.
6. **Conferir** os 2 documentos pela lista de conferência e por um leitor sem contexto.
7. **Entregar** os caminhos, as pendências e o que ficou sem verificação.

A skill só escreve. As 2 specs nascem como rascunho e passam a valer com a aprovação do proprietário. A construção começa depois, por decisão dele.

## Arquivos

- [SKILL.md](skills/hopper-spec-anth/SKILL.md): os 7 passos e as regras que valem em todos eles.
- [corpo-da-execucao.md](skills/hopper-spec-anth/corpo-da-execucao.md): o corpo geral da spec de execução.
- [spec-do-produto.md](skills/hopper-spec-anth/spec-do-produto.md) e [anexo.md](skills/hopper-spec-anth/anexo.md): os modelos dos 2 documentos.
- [perguntas.md](skills/hopper-spec-anth/perguntas.md): o que perguntar e como.
- [conferencia.md](skills/hopper-spec-anth/conferencia.md): a lista de conferência.
- [scripts/corpo.sh](skills/hopper-spec-anth/scripts/corpo.sh): insere e confere o corpo.

Consulte o [índice documental](index.md) ou veja [como contribuir](CONTRIBUTING.md).

## Compatibilidade e limites

A skill é feita para o Claude Code, na CLI e no aplicativo, em macOS e Linux. O script usa só `sh`, `awk` e `grep` e não grava arquivo temporário. Os 2 documentos saem no idioma do pacote instalado.

O SKILL.md segue o [formato Agent Skills](https://agentskills.io/specification) e tem `disable-model-invocation: true`. O Claude não aciona a skill por conta própria.

A qualidade dos requisitos e das decisões de como depende do modelo e do esforço da sessão. A skill não alega economia de custo medida.

## Instalação

O plugin e a skill se chamam `hopper-spec-anth` nos dois idiomas. Escolha um idioma só. A pasta `hopper-spec-anth-pt-br/` contém o plugin completo em português.

Clone o repositório uma vez.

```sh
mkdir -p "$HOME/.local/share"
git clone https://github.com/jonathanpah/hopper-spec-anth.git "$HOME/.local/share/hopper-spec-anth"
```

Se o destino já existir, confira a origem e as alterações locais antes de atualizá-lo.

### Claude Code

```sh
claude plugin marketplace add "$HOME/.local/share/hopper-spec-anth/hopper-spec-anth-pt-br"
claude plugin install hopper-spec-anth@hopper-spec-anth
```

Em uma sessão já aberta, envie `/reload-plugins` como mensagem separada para carregar a skill.

### Aplicativo e nomes

O identificador completo é `hopper-spec-anth:hopper-spec-anth`. O primeiro trecho identifica o plugin, e o segundo identifica a skill. Acione a skill com `/hopper-spec-anth:hopper-spec-anth`.

A instalação pela CLI não comprova presença no catálogo do aplicativo. No aplicativo do Claude, confira **Personalização → Plugins → Meus** e **Habilidades → Meus**. Quando o plugin não estiver no catálogo, adicione o pacote pela opção de upload de plugin e confira as 2 listas. O ZIP deve conter os arquivos da pasta do idioma escolhido, incluindo `.claude-plugin/plugin.json` e `skills/`.

### Verificação

Confira nome, versão e conteúdo com `claude plugin list` e `claude plugin details hopper-spec-anth@hopper-spec-anth`. A pasta [`evals/`](evals/) traz os casos da suíte oficial. Para repeti-los, rode nesta pasta `claude plugin eval . --tag sem-escrita` e `claude plugin eval . --tag com-escrita --judge-model sonnet --allow-tools Write Edit Bash WebFetch`. Os casos de explicação e de fora do alcance usam o Sonnet como avaliador. O caso das 2 specs confere os arquivos por padrões de texto, incluindo o corpo inteiro, porque o avaliador por modelo oscila em arquivos longos.

## Uso

Acione `/hopper-spec-anth:hopper-spec-anth` e descreva o produto, como neste pedido.

> Quero um app para o meu clube de corrida marcar os treinos da semana, no celular. Grave as specs em docs/.

O Claude lê o projeto, faz as perguntas que faltam, escreve os 2 documentos e informa os caminhos e as pendências. Explicar, revisar ou editar a skill não inicia a escrita.

## Atualizações

Confira as alterações locais e atualize o clone com `git pull --ff-only`. Depois, execute `claude plugin marketplace update hopper-spec-anth` e `claude plugin update hopper-spec-anth@hopper-spec-anth`, e envie `/reload-plugins` nas sessões abertas. Se usou upload no aplicativo, atualize também o pacote da conta.

Specs já escritas não mudam com a atualização. Cada spec registra no cabeçalho a versão da skill que a escreveu. A versão 1.0.0 é uma skill nova, com outro resultado, e não converte specs escritas antes dela.

Para remover, use `claude plugin uninstall hopper-spec-anth@hopper-spec-anth` e remova a instalação da conta no aplicativo, se existir.

## Contribuição

Para suspeitas de vulnerabilidade, siga a [Política de Segurança](SECURITY.md) e relate de forma privada antes de compartilhar detalhes publicamente.

Use [Issues](https://github.com/jonathanpah/hopper-spec-anth/issues) para problemas reproduzíveis e propostas concretas. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) para dúvidas, experiências e ideias que ainda não sejam propostas de alteração.

Para propor uma edição, crie um fork do repositório, uma branch e um pull request. O mantenedor decide o que será integrado. Consulte [CONTRIBUTING.md](CONTRIBUTING.md) e o [Código de Conduta](CODE_OF_CONDUCT.md).

## Licença e mantenedor

Copyright (c) 2026 Jonathan Honorio. Publicado sob a [Licença MIT](LICENSE).

Mantido por [Jonathan Honorio (@jonathanpah)](https://github.com/jonathanpah). Este é um projeto independente, sem alegação de vínculo ou endosso da Anthropic.
