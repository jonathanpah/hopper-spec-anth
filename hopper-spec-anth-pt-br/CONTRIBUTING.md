# Contribuindo com hopper-spec-anth

Contribuições podem melhorar a clareza da skill, identificar falhas nas specs produzidas, verificar o comportamento no Claude Code ou melhorar a documentação. A documentação fica em inglês em `hopper-spec-anth-en/` e em português brasileiro em `hopper-spec-anth-pt-br/`. As políticas e os modelos compartilhados do GitHub permanecem na raiz do repositório. Os textos da skill ficam em `hopper-spec-anth-en/skills/hopper-spec-anth/` e `hopper-spec-anth-pt-br/skills/hopper-spec-anth/`. Cada pasta de idioma é um plugin completo. Mantenha as 2 versões equivalentes. Cada release inclui os 2 idiomas.

## Comece pelo problema

Para suspeitas de vulnerabilidade, siga a [Política de Segurança](SECURITY.md) e relate de forma privada. Mantenha detalhes sensíveis de segurança fora de issues, discussões e pull requests públicos até coordenar a divulgação.

Use um relato de bug para uma falha reproduzível e uma proposta para uma alteração específica. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) para dúvidas ou ideias iniciais. Pesquise as issues existentes antes de abrir outro relato sobre o mesmo comportamento.

Para mudanças nos passos, nos modelos ou no corpo, explique a regra atual, o problema que ela causa, o comportamento desejado, as evidências e as consequências das alternativas. Uma proposta não é aprovação para alterar a skill. Pequenas correções documentais podem ir diretamente para um pull request.

## Preserve o desenho da skill

- O corpo da spec de execução, em `corpo-da-execucao.md` e `execution-body.md`, entra em toda spec sem mudança. Ele muda só por decisão do mantenedor, nos 2 idiomas juntos, com a mesma estrutura de linhas. Depois de mudar o corpo, rode de novo o gerador do avaliador do corpo em `evals/`.
- O corpo tem 1 lacuna só, o nome do projeto, na seção 0. O script `corpo.sh` ou `body.sh` insere e confere o corpo. A skill nunca redigita o corpo.
- Os modelos fixam a estrutura dos 2 documentos. O conteúdo vem de cada projeto. Ferramentas, versões e números de um projeto ficam fora da skill.
- O que a skill não sabe vira pergunta ou fica marcado "a medir", "a construir" ou "pendente de confirmação". Mantenha essa regra.
- Mantenha a skill independente de projetos. Os exemplos são de apps fictícios, curtos, para que o modelo não copie uma solução pronta.
- Preserve o acionamento explícito, a escrita sem execução, as perguntas em 1 mensagem com as opções em linguagem comum, a lista de conferência e o leitor sem contexto, salvo aprovação de mudança pelo mantenedor.
- Mantenha o plugin completo por si só. O `SKILL.md` e os arquivos de referência não devem depender de um `AGENTS.md` separado nem deste guia.
- Atualize os 2 idiomas juntos.
- Diferencie comportamento observado de afirmações da documentação, suposições e comportamentos propostos. Não alegue melhorias de desempenho ou custo sem medições comparáveis.
- Use linguagem clara em português e em inglês. Coloque as explicações na documentação visível, sem comentários ocultos.

## Abra um pull request

1. Crie um fork do repositório na sua conta do GitHub. Um fork é uma cópia sua, que você pode editar.
2. Crie uma branch no seu fork para uma alteração coerente.
3. Edite os arquivos e registre a alteração em um commit com mensagem descritiva.
4. Abra um pull request da sua branch para a branch `main` deste repositório. Vincule a issue pertinente, se existir.
5. Explique o problema, o comportamento resultante, as verificações e as limitações. Responda à revisão na mesma branch.

Um pull request propõe uma mudança. Ele altera este repositório só quando o mantenedor o integra. Você também pode contribuir revisando propostas, reproduzindo falhas relatadas ou fornecendo evidências sem alterar arquivos.

## Verifique de forma proporcional

Confira se as instruções alteradas continuam coerentes, se os links funcionam e se o YAML e o JSON têm sintaxe válida. Execute `claude plugin validate --strict` na pasta de idioma alterada. Para uma tradução ou mudança de redação, compare o significado e as obrigações antes e depois.

Para mudanças nos passos, nos modelos ou no corpo, rode os casos de `evals/` afetados e registre o resultado observável. Os casos incluem um pedido de explicação e um pedido fora do alcance, que não devem gerar arquivo, e as 2 specs de um app fictício, com o corpo conferido por inteiro.

Para alegar compatibilidade, identifique a versão do Claude Code (CLI ou aplicativo), o sistema operacional, o modelo e o esforço, o que você observou e as limitações. Comprovar o reconhecimento da skill não comprova a qualidade das specs.

Use recursos descartáveis nos experimentos. Compartilhe uma reprodução concisa, com informações sensíveis removidas, ou um exemplo sintético. Nunca envie senhas, tokens de acesso, chaves privadas, dados pessoais, histórico privado de conversas ou registros de produção sem remoção de informações sensíveis.

## Revisão e releases

Jonathan Honorio mantém o projeto e decide se uma alteração será aceita. As revisões consideram o problema descrito, as evidências, a consistência com o desenho da skill e o custo de manutenção. A revisão não implica promessa de prazo de resposta ou de aceite.

As alterações aceitas são integradas à `main`. Uma release identifica uma versão selecionada do repositório e descreve suas mudanças e limitações conhecidas. Instalar ou atualizar continua sendo uma decisão do usuário.

Ao enviar uma contribuição, você concorda em fornecê-la sob a [Licença MIT](LICENSE) deste repositório. Siga o [Código de Conduta](CODE_OF_CONDUCT.md).
