# Modelo da spec de execução e do anexo

A spec de execução tem 3 partes, nesta ordem. O cabeçalho, o corpo geral e o anexo do projeto. O corpo vem do script. O cabeçalho e o anexo são escritos por você. Os exemplos são do app fictício "Caderno de Receitas" e mostram só a forma.

## Conteúdo

1. O arquivo antes do script
2. O que o corpo deixa para o anexo
3. As seções do anexo, de A1 a A10

## 1. O arquivo antes do script

Grave o arquivo assim e depois rode `corpo.sh inserir`, como manda o passo 5 do SKILL.md.

```markdown
# Spec de execução

Rascunho de <data>, escrito pela skill hopper-spec-anth <versão>, com o corpo geral sem mudança, para a aprovação do proprietário. Vale para o <nome do produto> na data da aprovação, registrada em <caminho do registro de decisões>, sem prazo, até o proprietário mudar.

{{CORPO}}

# Anexo do <nome do produto>

Tudo daqui para baixo vale só para o <nome do produto>. Em outro projeto, esta parte é escrita de novo.

## A1. Documentos do projeto
...
## A10. O que falta construir
...
```

O título do anexo começa sempre por `# Anexo`, porque o script de conferência para nele.

## 2. O que o corpo deixa para o anexo

O anexo responde a cada item abaixo. A conferência lê esta lista.

| Seção do corpo | O que o anexo traz | Onde |
| --- | --- | --- |
| 0, termo "Tela" | O que conta como tela, e em produto sem tela, a função que conta | A2 |
| 0, termo "Produto inteiro" | As plataformas do produto | A2 |
| 2, classes | Os caminhos de cada classe, em cada plataforma, e o mapa lido por script | A3 |
| 2, classe A | Os arquivos de apoio dos testes | A3 |
| 2, classe C | A amostra fixa de 1 caso por tela | A2 |
| 2, classe D | Os caminhos de dados e segurança, os arquivos mistos e o serviço real com conta de teste | A3 e A6 |
| 2, regras do mapa | O teto de tempo de máquina dos casos de uma missão | A4 |
| 2, ferramenta de prova | Os caminhos do mapa, da barreira, dos scripts de prova e da configuração do executor de testes | A3 |
| 3, junção | As entradas da prova do pacote de dados | A3 |
| 3, entrega interna | Os casos do roteiro curto | A2 |
| 3, prova vazia | A lista de pulos previstos do tronco | A1 e A2 |
| 4.3, quarentena | A lista da quarentena | A1 |
| 5, tempo curto | O limite de trabalho de uma missão | A4 |
| 5, limite de tentativas | A lista do proprietário | A1 |
| 7, trilhas | O número de trilhas, medido | A4 |
| 7, fila | O arquivo único da fila | A1 |
| 9, papéis | O modelo de IA de cada papel, e quando ele é perguntado de novo | A7 |
| 9, quem decide | A publicação que o proprietário já liberou por regra | A5 |
| 9, troca de sessão | Como se mede o uso do contexto e com que ferramenta se grava o registro da conversa | A1 |
| 10, entrega | O ritmo da entrega interna | A5 |
| 12, medidas | Os números de partida e as metas | A9 |
| 13, segredos | Onde cada segredo fica e o script oficial que o lê | A6 |
| 0 e 14, decisões | O registro de decisões do projeto | A1 |

## 3. As seções do anexo

Os títulos e a ordem são fixos. Cada seção usa as 3 marcas do SKILL.md, que são "a medir", "a construir" e "pendente de confirmação". Uma seção sem conteúdo no projeto diz "Nenhum" e o motivo, por exemplo "Nenhum serviço externo".

### A1. Documentos do projeto

O caminho de cada documento, com a marca "a construir" quando ele ainda não existe.

- A spec do produto e a spec de execução.
- O registro de decisões do projeto.
- A fila, em 1 arquivo só.
- A lista da quarentena.
- A lista do proprietário, com os itens que não fecharam e o que fica para a versão seguinte.
- A lista de pulos previstos.
- As instruções do projeto para os agentes, como `AGENTS.md` ou `CLAUDE.md`.
- Os registros das sessões e a troca de sessão, com a pasta dos registros, a ferramenta que grava o registro e a passagem, e como se medem as vezes em que o contexto encheu e o uso dele.
- Outros documentos que o projeto já tem e que a execução consulta.

### A2. Plataformas, telas e casos fixos

- **Plataformas.** Cada plataforma do produto, como web, iPhone ou Android.
- **Telas.** Cada tela, com o nome do glossário, ou a função que conta como tela.
- **Uso principal.** Os requisitos da spec do produto que o formam, pelos identificadores.
- **Amostra da classe C.** 1 caso por tela, com o nome do teste. Enquanto os testes não existem, fica "a construir", com a fatia que cria cada um.
- **Roteiro curto.** Os casos que passam pelo uso principal de ponta a ponta e 1 vez por tela principal, em cada plataforma. Enquanto não existem, fica "a construir".
- **Pulos previstos.** Cada caso pulado de propósito, com o motivo e quem autorizou. No início, "Nenhum".

### A3. Classes por caminho

Comece pelo mapa e pelo script que o lê. O mapa é o arquivo do repositório que liga cada caminho a uma classe. Enquanto os 2 não existem, ficam "a construir", e a orquestradora dá a classe pela leitura desta seção.

Depois, 1 bloco por plataforma, com a pasta do código e estes itens.

- **Classe A.** As pastas de teste e de documentação, e os arquivos de apoio usados por vários testes, como classe base, ajudante, semente e simulador.
- **Classe B.** A pasta de cada tela.
- **Classe C.** As partes usadas por várias telas, como componentes, estilos, navegação e configuração do app.
- **Classe D.** Os caminhos de dados e segurança. Os arquivos mistos, com a lista das funções de dados de cada um. O comando da prova do pacote de dados e as entradas que decidem se ela se repete na junção. O teste contra o serviço real, com conta de teste, quando existir.
- **Classe E.** O comando do produto inteiro e os arquivos de versão, de build e de bibliotecas.
- **Ferramenta de prova.** O mapa, a barreira, os scripts de prova e a configuração do executor de testes.

Exemplo de forma, de projeto ainda sem código.

```markdown
### A3.1 iPhone

Código em `app/ios/`, a construir, pela DC-02 da spec do produto.

- **Classe A.** `app/ios/Testes/` e `docs/`. Apoio: `app/ios/Testes/Apoio/`.
- **Classe B.** 1 pasta por tela em `app/ios/Telas/`: `Lista`, `Receita` e `Busca`.
```

### A4. Máquinas, trilhas e tetos

- Onde rodam os testes de cada plataforma e em que horários a máquina fica livre.
- O que fazer quando uma máquina sai do ar.
- O número de trilhas por máquina, medido. Até a 1ª medida, 1 trilha por máquina.
- O limite de trabalho de uma missão.
- O teto de tempo de máquina dos casos de uma missão.
- O tamanho de um grupo de casos.
- O teto do roteiro curto, por plataforma.
- O ritmo de casos por hora, por plataforma.

Em projeto novo, os números ficam "a medir na prova do ambiente, seção 6 do corpo". A orquestradora grava cada número aqui antes da 1ª missão.

### A5. Entrega

- **Entrega interna.** Como a versão de teste chega ao proprietário, pela decisão de como da entrega, e o ritmo que ele escolheu.
- **Publicações liberadas por regra.** O que sai sem pergunta, com a data e as palavras do proprietário. Sem liberação, "Nenhuma".
- **O que espera o "sim" do proprietário.** Cada canal de distribuição a pessoas de fora e de publicação ao público, pelo nome, como a loja de apps.
- **Número de versão.** Onde ele fica e como muda.
- **Prazos de fora.** Validade de versões de teste, renovação de contas e outros prazos dos serviços, com a fonte.

### A6. Contas e segredos

Para cada serviço de fora, 1 item.

- Quem é o dono da conta e quem paga.
- A conta de teste usada pelos testes.
- Onde a chave fica, fora do repositório, com a permissão do arquivo.
- O script oficial que a lê, sem imprimir.
- O que fica só com o proprietário, como senha, códigos de confirmação e pagamento.

### A7. Modelos de IA de cada papel

O padrão, com a fonte, que é a resposta do proprietário ou a recomendação "pendente de confirmação".

- Orquestração.
- Operação dos testes, da junção e da entrega.
- Execução, com a correção de código, o conserto de teste e a construção.
- Revisão do código e revisão contra a spec.
- Triagem de falhas e medida.

Cada papel leva o nome exato do modelo e o esforço, como o ambiente mostra. Diga também quando o padrão é perguntado de novo e o que fazer quando o limite de uso de um modelo acaba.

### A8. Arquivos com soma conferida

Os arquivos de dados de referência que ficam congelados, com a soma conferida por script, como exemplos de formato, vetores de teste e simuladores de serviço. Diga o caminho da lista de somas e o script que confere. Mudar um arquivo da lista é missão de classe D, e a soma é gravada de novo depois dos 2 revisores.

Em projeto novo, liste os tipos que vão entrar, pela spec do produto, com a marca "a construir".

### A9. Medidas de partida e metas

As 8 medidas da seção 12 do corpo, com a partida, a meta e quando se mede.

| Medida | Partida | Meta | Quando se mede |
| --- | --- | --- | --- |
| 1. Missões que entram no código, sobre as lançadas | a medir | sem meta até a 1ª versão medida | no fim da 1ª versão |
| 4. Vezes em que o produto inteiro rodou na versão | a medir | 1, pela seção 3 do corpo | no fim da 1ª versão |

As 8 medidas entram na tabela. A meta de outro projeto nunca serve de meta deste.

### A10. O que falta construir

Abra com a frase "Até cada item existir, a orquestradora e a operadora fazem o passo à mão, pelas seções A2 e A3." Depois, a lista numerada, na ordem de necessidade, com cada item "a construir" das outras seções.

Em projeto novo, a lista começa assim.

1. A prova do ambiente, pela seção 6 do corpo. O projeto compila, roda 1 teste e gera 1 entrega interna vazia em cada plataforma. Ela grava os números do A4.
2. O registro de decisões, a fila, a lista da quarentena, a lista do proprietário e a lista de pulos previstos.
3. O mapa das classes e o script que lê o mapa do tronco e devolve a classe e a prova de uma mudança.
4. A comparação entre os casos pedidos e os casos rodados, com a lista de pulos previstos, para a prova vazia falhar.
5. A barreira da junção.
6. A repetição única do teste que falha e a quarentena, no script que roda os grupos de casos.
7. O roteiro curto e a amostra da classe C, à medida que as telas existem.
8. A coleta das 8 medidas, 1 vez por versão.
9. As fatias do produto, pela seção 6 do corpo, cada uma com os identificadores dos requisitos. A 1ª fatia passa pelo uso principal de ponta a ponta.

Os itens 3 a 6 são missões de ferramenta de prova, pela seção 2 do corpo. A orquestradora decide a ordem da fila, pela seção 9 do corpo.
