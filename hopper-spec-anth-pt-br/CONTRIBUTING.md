# Contribuindo com hopper-spec-anth

Contribuições podem melhorar a clareza da skill, identificar falhas nas specs produzidas, verificar o comportamento no Claude Code ou melhorar a documentação. A documentação fica em inglês em `hopper-spec-anth-en/` e em português brasileiro em `hopper-spec-anth-pt-br/`. As políticas e os modelos compartilhados do GitHub permanecem na raiz do repositório. Os textos da skill ficam em `hopper-spec-anth-en/skills/hopper-spec-anth/` e `hopper-spec-anth-pt-br/skills/hopper-spec-anth/`. Cada pasta de idioma é um plugin completo. Mantenha as 2 versões equivalentes. Cada release inclui os 2 idiomas.

## Comece pelo problema

Para suspeitas de vulnerabilidade, siga a [Política de Segurança](SECURITY.md) e relate de forma privada. Mantenha detalhes sensíveis de segurança fora de issues, discussões e pull requests públicos até coordenar a divulgação.

Use um relato de bug para uma falha reproduzível e uma proposta para uma alteração específica. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) para dúvidas ou ideias iniciais. Pesquise as issues existentes antes de abrir outro relato sobre o mesmo comportamento.

Para mudanças nos passos ou nas garantias, explique a regra atual, o problema que ela causa, o comportamento desejado, as evidências e as consequências das alternativas. Uma proposta não é aprovação para alterar a skill. Pequenas correções documentais podem ir diretamente para um pull request.

## Preserve o desenho da skill

- A skill diz **o que** a spec garante. O **como** é decisão do modelo que roda a skill, registrada em cada spec. Mantenha fora da skill nomes de ferramentas, produtos, versões, formatos e números, como tentativas, repetições e tamanho das unidades.
- Escreva cada garantia como uma propriedade verificável, com motivo e prova. Um mecanismo é uma decisão de como.
- Uma garantia entra ou sai só com evidência de execução, por exemplo registros que mostram a falha que ela evita, ou que mostram que ela deixou de ter efeito.
- Mantenha a skill independente de projetos. Exemplos ficam genéricos e curtos, para que o modelo não copie uma solução pronta.
- Preserve o acionamento explícito, a escrita sem execução, as perguntas com resposta recomendada e a conferência por leitor de contexto limpo, salvo aprovação de mudança pelo mantenedor.
- Mantenha o plugin completo por si só. O `SKILL.md` e as garantias não devem depender de um `AGENTS.md` separado nem deste guia.
- Atualize os 2 idiomas juntos. As specs copiam as garantias sem mudança. Por isso, mantenha estáveis os identificadores G01 a G15 e os títulos.
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

Para mudanças nos passos ou nas garantias, rode os casos de `evals/` afetados e registre o resultado observável. Casos úteis incluem um pedido de explicação, que não deve gerar spec, e specs de domínios diferentes, como software e um evento.

Para alegar compatibilidade, identifique a versão do Claude Code (CLI ou aplicativo), o sistema operacional, o modelo e o esforço, o que você observou e as limitações. Comprovar o reconhecimento da skill não comprova a qualidade das specs.

Use recursos descartáveis nos experimentos. Compartilhe uma reprodução concisa, com informações sensíveis removidas, ou um exemplo sintético. Nunca envie senhas, tokens de acesso, chaves privadas, dados pessoais, histórico privado de conversas ou registros de produção sem remoção de informações sensíveis.

## Revisão e releases

Jonathan Honorio mantém o projeto e decide se uma alteração será aceita. As revisões consideram o problema descrito, as evidências, a consistência com o desenho da skill e o custo de manutenção. A revisão não implica promessa de prazo de resposta ou de aceite.

As alterações aceitas são integradas à `main`. Uma release identifica uma versão selecionada do repositório e descreve suas mudanças e limitações conhecidas. Instalar ou atualizar continua sendo uma decisão do usuário.

Ao enviar uma contribuição, você concorda em fornecê-la sob a [Licença MIT](LICENSE) deste repositório. Siga o [Código de Conduta](CODE_OF_CONDUCT.md).
