# Lista de conferência

Confira os 2 documentos contra cada item, na ordem. O item que falha é corrigido, e a lista roda de novo até todos passarem. Anote o resultado de cada item para o relatório do passo 7.

## Corpo

1. O comando abaixo responde "corpo igual". A única diferença aceita é uma mudança decidida pelo proprietário e registrada na seção 2 da spec do produto, com as palavras dele e a data.

   ```sh
   sh "${CLAUDE_SKILL_DIR}/scripts/corpo.sh" conferir "<nome do produto>" docs/spec-de-execucao.md
   ```

2. A spec de execução tem o cabeçalho, o corpo 1 vez só, e o anexo depois do corpo, com o título começando por `# Anexo`.

## Anexo

3. As seções A1 a A7 estão presentes, com os títulos e a ordem de [anexo.md](anexo.md).
4. Cada linha da tabela "O que o corpo deixa para o anexo", de [anexo.md](anexo.md), tem resposta na seção indicada.
5. O A3 tem 1 assunto para cada área de requisitos da spec do produto, com os identificadores. Nenhum assunto saiu sem a palavra do proprietário, registrada na seção 2 da spec do produto.
6. Todo número do anexo tem fonte, que é medida, resposta do proprietário ou página oficial com data, ou está marcado "a medir" com o momento da medida.
7. Todo caminho e todo comando do anexo existem no projeto ou estão marcados "a construir".
8. O A6 traz o modelo e o esforço de cada papel, com a fonte, e quando o padrão é perguntado de novo. O revisor de dados é de modelo diferente do que escreve as correções de dados.

## Spec do produto

9. As seções 1 a 8 estão presentes, com os títulos e a ordem de [spec-do-produto.md](spec-do-produto.md).
10. Cada requisito tem identificador único, o que tem de ser verdade, como se confere e casos de borda. Quantidade tem número e unidade, e nenhum termo vago sobra sem número.
11. O uso principal está coberto de ponta a ponta pelos requisitos.
12. Quando o produto guarda dados, existem requisitos de dados e de segurança em área própria.
13. A seção 5 tem os 4 itens obrigatórios do modelo.
14. Cada decisão de como tem "Atende a", "Escolha", "Alternativas", "Fontes" com data, "Motivo" e "Prova". As 6 decisões obrigatórias do modelo estão presentes.

## Os 2 documentos

15. A spec de execução tem até 150 linhas. Nenhuma linha do anexo ou da spec do produto repete regra do corpo, explica o porquê de uma regra ou recapitula outra seção.
16. Cada decisão do proprietário está na seção 2 da spec do produto, com a data e as palavras dele. Cada recomendação adotada sem resposta está marcada "pendente de confirmação".
17. Cada coisa tem 1 nome só, o mesmo nas 2 specs e no glossário.
18. As fontes citadas são só o projeto, o proprietário e as páginas consultadas. A skill aparece só nos 2 cabeçalhos, com o nome e a versão.
19. Nenhum texto dos exemplos fictícios dos modelos aparece nos documentos, como "Caderno de Receitas".
20. Os 2 documentos estão em português, e os 2 cabeçalhos dizem que são rascunho para a aprovação do proprietário.

## Leitor sem contexto

21. Por último, 1 subagente sem acesso a esta conversa lê só os 2 documentos e o projeto e lista o que o impediria de começar a execução. Cada dúvida vira correção nos documentos ou pergunta ao proprietário, e a lista roda de novo nos itens afetados. Dúvida sobre o corpo vira nota no relatório, porque o corpo não muda.
