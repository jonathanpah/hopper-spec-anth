# hopper-spec-anth

[English](../hopper-spec-anth-en/README.md) | **Português (Brasil)**

Uma skill do Claude Code que escreve a spec de qualquer entrega, como software, documento, evento ou processo. A spec basta para que outra sessão, pessoa ou equipe execute a entrega do início ao fim sem voltar a perguntar.

## A ideia central

A skill separa **o que** fazer de **como** fazer.

- **O que** fica fixo na skill. São 15 garantias que toda spec cumpre, por exemplo "quem executa não decide o pronto" e "o executor não altera os critérios". Cada garantia é uma propriedade verificável e traz o motivo que a sustenta.
- **Como** fica com o modelo que roda a skill. Ferramentas, versões, formatos e números são escolhidos na hora da escrita, pela prática mais atual, depois de consultar a documentação oficial e o ambiente instalado. Cada escolha fica registrada na spec, com alternativas, fontes datadas, motivo e prova.

Com isso, um modelo mais novo ou uma ferramenta nova melhoram as specs sem exigir mudança na skill. As decisões de como ficam fixas durante a execução e são revistas só entre etapas.

O plugin tem 2 arquivos de conteúdo.

- O [SKILL.md](skills/hopper-spec-anth/SKILL.md), com os 6 passos da escrita.
- As [garantias](skills/hopper-spec-anth/garantias.md), que toda spec copia sem mudança.

Consulte o [índice documental](index.md) ou veja [como contribuir](CONTRIBUTING.md).

Esta pasta contém a versão em português. Os comandos abaixo instalam esta versão, com o mesmo nome `hopper-spec-anth` usado em inglês.

## Os passos

1. **Delimitar** a entrega, o proprietário, o executor e o destino da spec.
2. **Ler as fontes** existentes e os fatos externos atuais.
3. **Perguntar ao proprietário** só o que as fontes não respondem, com perguntas numeradas e uma resposta recomendada para cada uma.
4. **Escrever** a spec com o conteúdo obrigatório, incluindo as garantias e as decisões de como.
5. **Conferir** a spec contra critérios fixos e com um leitor de contexto limpo.
6. **Entregar** a spec no destino, com as pendências.

A skill só escreve. A execução começa depois, por decisão do proprietário, em uma sessão nova que lê só a spec.

## Compatibilidade e limites

A skill é feita para o Claude Code, na CLI e no aplicativo, em macOS e Linux. Ela não depende de ferramenta específica. O modelo usa as que a sessão oferece.

O SKILL.md segue o [formato Agent Skills](https://agentskills.io/specification) e tem `disable-model-invocation: true`. O Claude não aciona a skill por conta própria.

A qualidade das decisões de como depende do modelo e do esforço da sessão. Quando eles estão abaixo dos mais altos disponíveis, a skill avisa o usuário 1 vez e segue a escolha dele. A skill não alega economia de custo medida.

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

Confira nome, versão e conteúdo com `claude plugin list` e `claude plugin details hopper-spec-anth@hopper-spec-anth`. A pasta [`evals/`](evals/) traz os casos da suíte oficial. Para repeti-los, rode nesta pasta `claude plugin eval . --tag sem-escrita` e `claude plugin eval . --tag com-escrita --judge-model sonnet --allow-tools Write Edit Bash WebFetch`. Os casos de spec usam o Sonnet como avaliador, porque o avaliador padrão oscila em arquivos longos.

## Uso

Acione `/hopper-spec-anth:hopper-spec-anth` e descreva a entrega. Por exemplo:

> Escreva a spec do app de reservas de salas de reunião deste repositório. Grave em docs/spec.md.

O Claude lê as fontes, faz as perguntas que faltam, escreve a spec e informa o caminho e as pendências. Explicar, revisar ou editar a skill não inicia a escrita.

## Atualizações

Confira as alterações locais e atualize o clone com `git pull --ff-only`. Depois, execute `claude plugin marketplace update hopper-spec-anth` e `claude plugin update hopper-spec-anth@hopper-spec-anth`, e envie `/reload-plugins` nas sessões abertas. Se usou upload no aplicativo, atualize também o pacote da conta.

Specs já escritas não mudam com a atualização. Cada spec registra a versão da skill que a gerou e carrega as garantias que valiam naquela versão.

Para remover, use `claude plugin uninstall hopper-spec-anth@hopper-spec-anth` e remova a instalação da conta no aplicativo, se existir.

## Contribuição

Para suspeitas de vulnerabilidade, siga a [Política de Segurança](SECURITY.md) e relate de forma privada antes de compartilhar detalhes publicamente.

Use [Issues](https://github.com/jonathanpah/hopper-spec-anth/issues) para problemas reproduzíveis e propostas concretas. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) para dúvidas, experiências e ideias que ainda não sejam propostas de alteração.

Para propor uma edição, crie um fork do repositório, uma branch e um pull request. O mantenedor decide o que será integrado. Consulte [CONTRIBUTING.md](CONTRIBUTING.md) e o [Código de Conduta](CODE_OF_CONDUCT.md).

## Licença e mantenedor

Copyright (c) 2026 Jonathan Honorio. Publicado sob a [Licença MIT](LICENSE).

Mantido por [Jonathan Honorio (@jonathanpah)](https://github.com/jonathanpah). Este é um projeto independente, sem alegação de vínculo ou endosso da Anthropic.
