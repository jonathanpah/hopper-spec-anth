# Modelo da spec de execução e do anexo

A spec de execução tem 3 partes, nesta ordem. O cabeçalho, o corpo geral e o anexo do projeto. O corpo vem do script. O cabeçalho e o anexo são escritos por você. Os exemplos são do app fictício "Caderno de Receitas" e mostram só a forma.

## Conteúdo

1. O arquivo antes do script
2. O que o corpo deixa para o anexo
3. As seções do anexo, de A1 a A9

## 1. O arquivo antes do script

Grave o arquivo assim e depois rode `corpo.sh inserir`, como manda o passo 5 do SKILL.md.

```markdown
# Spec de execução

Rascunho de <data>, escrito pela skill hopper-spec-anth <versão>, com o corpo geral sem mudança, para a aprovação do proprietário. Vale para o <nome do produto> na data da aprovação, registrada em <caminho do registro de decisões>, até o proprietário mudar.

{{CORPO}}

# Anexo do <nome do produto>

## A1. Documentos do projeto
...
## A9. Conferências fora dos testes
...
```

O título do anexo começa sempre por `# Anexo`, porque o script de conferência para nele.

## 2. O que o corpo deixa para o anexo

O anexo responde a cada item abaixo. A conferência lê esta lista.

| Seção do corpo | O que o anexo traz | Onde |
| --- | --- | --- |
| 0 e 11, aprovação e mudança | O registro de decisões do projeto | A1 |
| 2, assuntos | 1 assunto por função da spec do produto, e o que o proprietário tirou | A8 |
| 2, conferências | As conferências que saíram dos testes e as que ficaram em versão barata | A9 |
| 3, plataformas | As plataformas, a máquina de testes e as vagas dela | A2 |
| 3, script da vistoria | O script que lança a vistoria e as rodadas que só medem e espera a vaga e a memória livres | A2 |
| 3, alvo de 30 minutos | O número de assuntos e de casos e a duração da vistoria | A6 |
| 4, lista de problemas | A lista de problemas de cada vistoria, com a seção "Falha do teste, e não do produto" | A1 |
| 4, falha da ferramenta | As causas conhecidas de falha da ferramenta de teste e a conferência que separa cada uma de um problema do produto | A8 |
| 5, compilar e pacote de dados | Os comandos de compilar em cada plataforma e de rodar o pacote de testes de dados | A8 |
| 5, serviço real | O teste contra cada serviço externo real, com a conta de teste | A8 |
| 5, missão | A pasta da rodada e o script que lança a missão e para o executor aos 60 minutos | A2 |
| 7, entrega | O caminho da versão interna, o que já está liberado e o que espera o sim | A3 |
| 7, publicação | Os passos de cada publicação | A7 |
| 8, modelos | O padrão de modelo de IA de cada papel e onde fica o da orquestradora | A5 |
| 8, sessões | A regra de troca de sessão, quando o projeto tem uma, e o modo de permissão das sessões | A6 |
| 10, segredos | Onde cada segredo fica, quem o lê, que é o script oficial ou a operadora no passo que cita a chave, e a conferência depois da missão | A4 |

## 3. As seções do anexo

Os títulos e a ordem são fixos. Cada seção usa as 3 marcas do SKILL.md, que são "a medir", "a construir" e "pendente de confirmação". Uma seção sem conteúdo no projeto diz "Nenhum" e o motivo, por exemplo "Nenhum serviço externo".

Cada seção traz só fatos do projeto, em lista curta, de 1 a 8 linhas. O porquê das regras e as regras do corpo ficam fora do anexo.

### A1. Documentos do projeto

O caminho de cada documento, com a marca "a construir" quando ele ainda não existe.

- A spec do produto e a spec de execução.
- O registro de decisões.
- As instruções do projeto para os agentes, como `AGENTS.md` ou `CLAUDE.md`.
- A lista de problemas de cada vistoria, com a seção "Falha do teste, e não do produto", da seção 4 do corpo.
- Os registros das sessões.

### A2. Plataformas e máquinas

- Cada plataforma do produto, como web, iPhone ou Android.
- A máquina de testes de cada plataforma, as vagas dela e em que horários ela fica livre.
- O que fazer quando uma máquina sai do ar, com o trabalho que continua nas outras.
- O script que lança a vistoria, as rodadas que só medem e as missões, que espera a vaga e a memória livres e para o executor aos 60 minutos. Enquanto ele não existe, fica "a construir".
- A pasta de cada rodada, da seção 5 do corpo.

### A3. Entrega

- **Versão interna.** Como a versão do fim de cada leva chega ao proprietário em cada plataforma, pela decisão de como da entrega.
- **Liberado sem pergunta.** O que o proprietário liberou para fora, com a data e as palavras dele. Sem liberação, "Nenhum".
- **O que espera o sim.** Cada canal para pessoas de fora e para o público, pelo nome, como a loja de apps.
- **Número de versão.** Onde ele fica e como muda.
- **Prazos de fora.** Validade de versões de teste, renovação de contas e outros prazos dos serviços, com a fonte.

### A4. Contas e segredos

Para cada serviço de fora, 1 item.

- Quem é o dono da conta e quem paga.
- A conta de teste usada pelos testes.
- Onde a chave fica, fora do repositório, com a permissão do arquivo.
- Quem a lê, sem imprimir, que é o script oficial ou a operadora no passo do anexo que cita a chave, e o script que confere a leitura depois de cada missão.
- O que fica só com o proprietário, como senha, códigos de confirmação e pagamento.

### A5. Modelos de IA de cada papel

O padrão, com a fonte, que é a resposta do proprietário ou a recomendação "pendente de confirmação".

- Orquestração. O proprietário define sempre o modelo e o esforço, pela seção 8 do corpo. Diga onde fica o último que ele definiu.
- Operação dos testes e da publicação.
- Escrita de código, com as correções, as funções novas e o conserto de teste. Diga o isolamento em que o executor roda, como o sandbox da ferramenta, e a autorização do proprietário quando ele roda sem esse isolamento. Diga também o modelo que pode receber o problema que não passou em 2 tentativas (seção 5 do corpo), quando o proprietário define um, e quem decide cada caso.
- Revisão das correções que mexem em dados, por um modelo diferente do que escreveu, pela seção 6 do corpo.
- Triagem de falhas e pesquisa.

Cada papel leva o nome exato do modelo e o esforço, como o ambiente mostra. Diga também quando o padrão é perguntado de novo. O limite de uso das assinaturas é decisão do proprietário, pela seção 8 do corpo, e o anexo não traz modelo reserva para ele.

### A6. Sessões e números de partida

- A regra de troca de sessão, com o que se mede, a ferramenta que grava o registro da conversa e como o que a sessão lançou continua rodando depois da troca. Sem regra no projeto, "Nenhuma. A orquestradora decide, pela seção 8 do corpo".
- O modo de permissão em que as sessões abrem, com a autorização do proprietário quando ele dispensa os pedidos de permissão.
- O número de assuntos, o número de casos e a duração da vistoria.
- O número de testes e a duração do pacote de testes de dados.

Em projeto novo, os números ficam "a medir na 1ª vistoria".

### A7. Publicação

- Os passos de cada publicação, em ordem, com o comando de cada um. Sem publicação na 1ª versão, "Nenhuma" e o motivo.
- O que o proprietário liberou para publicar sem pergunta, com a data e as palavras dele, quando existe.
- A conferência do endereço ou do canal publicado.
- O limite de cada versão, quando o proprietário define um, e a versão em que entra o defeito antigo achado no caminho.

### A8. Testes: onde e como rodar

- 1 assunto por função da spec do produto, com os identificadores dos requisitos. Toda função entra, mesmo sem uso nos dados do proprietário.
- O que o proprietário tirou, com a data e as palavras dele. Sem saída, "Nenhum".
- O arquivo com os casos de cada assunto, quando ele existe.
- Os comandos de compilar em cada plataforma, de rodar o pacote de testes de dados e a bateria completa. Enquanto eles não existem, ficam "a construir".
- O teste contra cada serviço externo real, com a conta de teste do A4. Sem serviço, "Nenhum".
- As causas conhecidas de falha da ferramenta de teste em cada máquina, com a conferência que separa cada uma de um problema do produto. Em projeto novo, "Nenhuma conhecida".

Exemplo de forma.

```markdown
## A8. Testes: onde e como rodar

- Receitas, de RE-01 a RE-06. Busca, de BU-01 a BU-03. Lista de compras, de LC-01 a LC-04.
- O proprietário não tirou nenhum assunto.
- Os casos ficam em `testes/assuntos.json`, a construir.
```

### A9. Conferências fora dos testes

- As conferências que não são função do produto e saíram dos testes, como leitor de tela ou comparação da tela com imagens de referência, pela resposta do proprietário.
- As que ficaram em versão barata e como cada uma roda. Sem nenhuma, "Nenhuma".
