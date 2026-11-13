# Modelo da spec de execução e do anexo

A spec de execução tem 3 partes, nesta ordem. O cabeçalho, o corpo geral e o anexo do projeto. O corpo vem do script. O cabeçalho e o anexo são escritos por você. Os exemplos são do app fictício "Caderno de Receitas" e mostram só a forma.

## Conteúdo

1. O arquivo antes do script
2. O que o corpo deixa para o anexo
3. As seções do anexo, de A1 a A7

## 1. O arquivo antes do script

Grave o arquivo assim e depois rode `corpo.sh inserir`, como manda o passo 5 do SKILL.md.

```markdown
# Spec de execução

Rascunho de <data>, escrito pela skill hopper-spec-anth <versão>, com o corpo geral sem mudança, para a aprovação do proprietário. Vale para o <nome do produto> na data da aprovação, registrada em <caminho do registro de decisões>, até o proprietário mudar.

{{CORPO}}

# Anexo do <nome do produto>

## A1. Documentos do projeto
...
## A7. Sessões e números de partida
...
```

O título do anexo começa sempre por `# Anexo`, porque o script de conferência para nele.

## 2. O que o corpo deixa para o anexo

O anexo responde a cada item abaixo. A conferência lê esta lista.

| Seção do corpo | O que o anexo traz | Onde |
| --- | --- | --- |
| 0 e 11, aprovação e mudança | O registro de decisões do projeto | A1 |
| 2, assuntos | 1 assunto por função da spec do produto, e o que o proprietário tirou | A3 |
| 3, plataformas | As plataformas e as máquinas que rodam os testes | A2 |
| 3, pacote de dados | O comando do pacote de testes de dados | A2 |
| 3, alvo de 2 horas | O tamanho e a duração da vistoria | A7 |
| 4, lista dos testes | A lista dos testes com falha e a lista dos problemas classificados | A1 |
| 5, compilar | O comando de compilar em cada plataforma | A2 |
| 5, serviço real | A conta de teste de cada serviço externo real | A5 |
| 7, entrega | O caminho da versão interna, o que já está liberado e o que espera o sim | A4 |
| 8, modelos | O padrão de modelo de IA de cada papel | A6 |
| 8, sessões | A regra de troca de sessão, quando o projeto tem uma | A7 |
| 10, segredos | Onde cada segredo fica e o script oficial que o lê | A5 |

## 3. As seções do anexo

Os títulos e a ordem são fixos. Cada seção usa as 3 marcas do SKILL.md, que são "a medir", "a construir" e "pendente de confirmação". Uma seção sem conteúdo no projeto diz "Nenhum" e o motivo, por exemplo "Nenhum serviço externo".

Cada seção traz só fatos do projeto, em lista curta, de 1 a 8 linhas. O porquê das regras e as regras do corpo ficam fora do anexo.

### A1. Documentos do projeto

O caminho de cada documento, com a marca "a construir" quando ele ainda não existe.

- A spec do produto e a spec de execução.
- O registro de decisões.
- As instruções do projeto para os agentes, como `AGENTS.md` ou `CLAUDE.md`.
- A lista dos problemas classificados e a lista dos testes com falha, da seção 4 do corpo.
- Os registros das sessões.

### A2. Plataformas e máquinas

- Cada plataforma do produto, como web, iPhone ou Android.
- Onde rodam os testes de cada plataforma, em que horários a máquina fica livre e quantas compilações rodam ao mesmo tempo.
- O que fazer quando uma máquina sai do ar.
- Os comandos de compilar em cada plataforma, de rodar a vistoria e de rodar o pacote de testes de dados. Enquanto eles não existem, ficam "a construir".

### A3. Assuntos testados

- 1 assunto por função da spec do produto, com os identificadores dos requisitos. Toda função entra, mesmo sem uso nos dados do proprietário.
- O que o proprietário tirou, com a data e as palavras dele. Sem saída, "Nenhum".
- O arquivo com os casos de cada assunto, quando ele existe.

Exemplo de forma.

```markdown
## A3. Assuntos testados

- Receitas, de RE-01 a RE-06. Busca, de BU-01 a BU-03. Lista de compras, de LC-01 a LC-04.
- O proprietário não tirou nenhum assunto.
- Os casos ficam em `testes/assuntos.json`, a construir.
```

### A4. Entrega

- **Versão interna.** Como a versão do fim de cada leva chega ao proprietário em cada plataforma, pela decisão de como da entrega.
- **Liberado sem pergunta.** O que o proprietário liberou para fora, com a data e as palavras dele. Sem liberação, "Nenhum".
- **O que espera o sim.** Cada canal para pessoas de fora e para o público, pelo nome, como a loja de apps.
- **Número de versão.** Onde ele fica e como muda.
- **Prazos de fora.** Validade de versões de teste, renovação de contas e outros prazos dos serviços, com a fonte.

### A5. Contas e segredos

Para cada serviço de fora, 1 item.

- Quem é o dono da conta e quem paga.
- A conta de teste usada pelos testes.
- Onde a chave fica, fora do repositório, com a permissão do arquivo.
- O script oficial que a lê, sem imprimir.
- O que fica só com o proprietário, como senha, códigos de confirmação e pagamento.

### A6. Modelos de IA de cada papel

O padrão, com a fonte, que é a resposta do proprietário ou a recomendação "pendente de confirmação".

- Orquestração.
- Operação dos testes e da entrega.
- Correções, com o conserto de teste.
- Revisão das correções que mexem em dados, por um modelo diferente do que escreveu, pela seção 6 do corpo.
- Triagem de falhas e pesquisa.

Cada papel leva o nome exato do modelo e o esforço, como o ambiente mostra. Diga também quando o padrão é perguntado de novo e qual modelo assume quando o limite de uso de outro acaba.

### A7. Sessões e números de partida

- A regra de troca de sessão, com o que se mede e a ferramenta que grava o registro da conversa. Sem regra no projeto, "Nenhuma. A orquestradora decide, pela seção 8 do corpo".
- O número de assuntos, o número de casos e a duração da vistoria.
- O número de testes e a duração do pacote de testes de dados.

Em projeto novo, os números ficam "a medir na 1ª vistoria".
