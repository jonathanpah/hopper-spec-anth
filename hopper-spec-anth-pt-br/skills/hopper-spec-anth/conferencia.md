# Lista de conferência

Confira os 2 documentos contra cada item, na ordem. O item que falha é corrigido, e a lista roda de novo até todos passarem. Anote o resultado de cada item para o relatório do passo 7.

## Corpo

1. O comando abaixo responde "corpo igual". A única diferença aceita é uma mudança decidida pelo proprietário e registrada na seção 2 da spec do produto, com as palavras dele e a data.

   ```sh
   sh "${CLAUDE_SKILL_DIR}/scripts/corpo.sh" conferir "<nome do produto>" docs/spec-de-execucao.md
   ```

2. A spec de execução tem o cabeçalho, o corpo 1 vez só, e o anexo depois do corpo, com o título começando por `# Anexo`.

## Anexo

3. As seções A1 a A10 estão presentes, com os títulos e a ordem de [anexo.md](anexo.md).
4. Cada linha da tabela "O que o corpo deixa para o anexo", de [anexo.md](anexo.md), tem resposta na seção indicada.
5. Todo número do anexo tem fonte, que é medida, resposta do proprietário ou página oficial com data, ou está marcado "a medir" com o momento da medida.
6. Todo caminho do anexo existe no projeto ou está marcado "a construir", com item no A10.
7. Cada plataforma do A2 tem 1 bloco no A3, com as classes A a E e a ferramenta de prova. Cada pasta da decisão de como das pastas cai em alguma classe.
8. O A7 traz o modelo e o esforço de cada papel, com a fonte, e quando o padrão é perguntado de novo.
9. O A10 começa pela prova do ambiente, e a 1ª fatia cita os requisitos do uso principal.

## Spec do produto

10. As seções 1 a 8 estão presentes, com os títulos e a ordem de [spec-do-produto.md](spec-do-produto.md).
11. Cada requisito tem identificador único, o que tem de ser verdade, como se confere e casos de borda. Quantidade tem número e unidade, e nenhum termo vago sobra sem número.
12. O uso principal está coberto de ponta a ponta pelos requisitos.
13. Quando o produto guarda dados, existem requisitos de dados e de segurança, e o código deles cai na classe D do A3.
14. A seção 5 tem os 4 itens obrigatórios do modelo.
15. Cada decisão de como tem "Atende a", "Escolha", "Alternativas", "Fontes" com data, "Motivo" e "Prova". As 6 decisões obrigatórias do modelo estão presentes.

## Os 2 documentos

16. Cada decisão do proprietário está na seção 2 da spec do produto, com a data e as palavras dele. Cada recomendação adotada sem resposta está marcada "pendente de confirmação".
17. Cada coisa tem 1 nome só, o mesmo nas 2 specs e no glossário.
18. As fontes citadas são só o projeto, o proprietário e as páginas consultadas. A skill aparece só nos 2 cabeçalhos, com o nome e a versão.
19. Nenhum texto dos exemplos fictícios dos modelos aparece nos documentos, como "Caderno de Receitas".
20. Os 2 documentos estão em português, e os 2 cabeçalhos dizem que são rascunho para a aprovação do proprietário.

## Leitor sem contexto

21. Por último, 1 subagente sem acesso a esta conversa lê só os 2 documentos e o projeto e lista o que o impediria de começar a execução. Cada dúvida vira correção nos documentos ou pergunta ao proprietário, e a lista roda de novo nos itens afetados. Dúvida sobre o corpo vira nota no relatório, porque o corpo não muda.
