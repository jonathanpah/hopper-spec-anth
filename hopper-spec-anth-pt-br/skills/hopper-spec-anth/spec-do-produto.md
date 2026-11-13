# Modelo da spec do produto

A spec do produto diz o que o produto faz. Como o trabalho é executado e provado fica na spec de execução. A estrutura abaixo é fixa, com as seções, os títulos e a ordem. O conteúdo vem do projeto e das respostas do proprietário. Os exemplos são do app fictício "Caderno de Receitas" e mostram só a forma.

## Conteúdo

1. Cabeçalho
2. Seção 1, Objetivo
3. Seção 2, Decisões do proprietário
4. Seção 3, Glossário
5. Seção 4, Requisitos
6. Seção 5, O que nunca pode acontecer
7. Seção 6, O que fica fora
8. Seção 7, Decisões de como do produto
9. Seção 8, Riscos do produto

## Cabeçalho

```markdown
# Spec do produto: <nome do produto>

Rascunho de <data>, escrito pela skill hopper-spec-anth <versão>, para a aprovação do proprietário. Passa a valer na data da aprovação, registrada em <caminho do registro de decisões>, sem prazo, até o proprietário mudar. Este documento diz o que o produto faz. Como o trabalho é executado e provado fica na [spec de execução](spec-de-execucao.md).
```

A versão da skill está no campo `version` de `${CLAUDE_SKILL_DIR}/../../.claude-plugin/plugin.json`.

## 1. Objetivo

1 parágrafo com o que o produto entrega, para quem, em que plataformas, e o resultado observável que encerra a 1ª versão.

## 2. Decisões do proprietário

| Data | Decisão | Palavras do proprietário |
| --- | --- | --- |
| 13/11/2026 | Só o proprietário usa a 1ª versão, sem loja | "sim" |
| 13/11/2026 | Pendente de confirmação. Versão de teste a cada parte pronta | Recomendação adotada sem resposta |

Entram as decisões do pedido e cada resposta do passo 3. A recomendação adotada sem resposta leva "Pendente de confirmação" no começo da decisão.

## 3. Glossário

| Nome | Significado |
| --- | --- |
| Receita | Texto com título, ingredientes e passos, guardado pelo app |

Cada coisa tem 1 nome só, usado igual nas 2 specs, nos textos à vista, nos testes e no código novo. Em produto sem tela, o glossário diz que função conta como tela, porque a spec de execução usa esse termo.

## 4. Requisitos

Abra a seção com estas regras, adaptadas ao projeto.

- Cada requisito tem identificador estável, com 2 letras da área e o número, como `RE-01`. Um identificador nunca é reusado.
- Os testes levam o identificador no nome, como `test_RE_01_criarReceita`.
- Cada requisito diz o que tem de ser verdade e como se confere.

Agrupe os requisitos por área, em subseções numeradas, com esta tabela.

### 4.1 Receitas

| ID | O que tem de ser verdade | Como se confere | Casos de borda |
| --- | --- | --- | --- |
| RE-01 | "Nova receita" grava a receita com título, ingredientes e passos, e ela aparece no topo da lista em até 1 s | Teste sem tela da gravação. Teste de tela que cria e confere a lista | Título vazio não grava. Título com 200 caracteres grava inteiro |

Regras de cada linha.

- **O que tem de ser verdade.** 1 comportamento, em voz ativa, que se observa de fora. Quantidade tem número e unidade. Termo vago, como "rápido", "fácil" ou "adequado", vira número ou sai.
- **Como se confere.** O tipo de teste e a condição. A lógica se confere por teste sem tela. Estado visual, como tela vazia, erro, tema escuro e letra maior, por comparação de imagem. Gesto, foco, navegação, leitura de tela, acessibilidade e o uso principal de ponta a ponta, por teste de tela. Requisito que depende de serviço de fora diz se o teste usa simulador ou conta de teste.
- **Casos de borda.** Os limites e as falhas que o teste também cobre.

Requisitos obrigatórios.

- O uso principal, de ponta a ponta, em requisitos que a 1ª fatia cobre.
- Gravação, leitura, sincronização e segurança dos dados, quando o produto guarda dados, em área própria. O código deles fica nos caminhos da classe D do anexo.
- Cada plataforma da seção 1, quando a regra muda por plataforma.

## 5. O que nunca pode acontecer

Lista numerada, com o que é proibido em qualquer versão. Inclua sempre estes itens, adaptados ao produto, e acrescente os do projeto.

1. Perder, duplicar ou corromper dado de quem usa.
2. Usar dado real do proprietário ou serviço pago real nos testes.
3. Gravar senha, chave ou dado real no repositório, em registro ou nos testes.
4. Distribuir a pessoas de fora, publicar ao público, gastar fora do plano ou apagar dado real sem o "sim" do proprietário.

## 6. O que fica fora

Lista do que não entra na 1ª versão, com as respostas do proprietário, por exemplo "Compartilhar receitas com outras pessoas."

## 7. Decisões de como do produto

Cada escolha técnica do passo 4 tem 1 bloco.

```markdown
**DC-01. Arquitetura.** Atende a RE-01 a RE-09. Escolha: <o que foi escolhido>. Alternativas: <as opções consideradas>. Fontes: <página oficial, consultada em <data>>. Motivo: <por que venceu>. Prova: <o requisito ou o teste que mostra que funciona>.
```

Decisões obrigatórias.

- Arquitetura e linguagem.
- Projeto e pastas. Os caminhos dela formam as classes do anexo A3.
- Testes de cada camada, com as ferramentas.
- Gravação dos dados e formato dos arquivos, quando o produto guarda dados.
- Entrega interna, com o caminho até o proprietário. Ela forma o anexo A5.
- Segredos, com onde cada chave fica e quem a lê. Ela forma o anexo A6.

Fonte sem acesso na hora da escrita fica como "memória do redator, sem confirmação", com 1 linha na seção 8.

## 8. Riscos do produto

| Risco | Tratamento |
| --- | --- |
| A loja muda a regra de revisão antes da 1ª publicação | Conferir a regra na documentação oficial antes de pedir o "sim" do proprietário |

Inclua os riscos técnicos das decisões de como e cada fonte sem confirmação.
