## 0. O que é

Esta é a única fonte das regras de como testar e corrigir o {{PROJETO}}. Vale por decisão do proprietário, desde a aprovação registrada no cabeçalho. O que o produto faz fica na spec do produto.
As seções 0 a 12 trazem as regras gerais. O que é só deste projeto fica no anexo, no fim.
A orquestradora é a sessão de IA que conduz o trabalho. As operadoras são as sessões de IA que operam os testes e a publicação. O executor é a sessão de IA que escreve o código. Missão é cada tarefa entregue ao executor.
Assunto é uma função do produto, com os casos de teste dela. Leva é cada rodada de correções que vem depois de uma vistoria.

## 1. O modelo, em 8 passos

1. Escolher o que faz sentido testar, pela seção 2.
2. Fazer a vistoria do produto inteiro.
3. Separar falha do teste de problema do produto. Classificar os problemas em grande ou bloqueante, médio e pequeno.
4. Corrigir os grandes, 1 por vez. Testar só aquela correção e passar ao próximo.
5. Corrigir os médios, do mesmo jeito.
6. Fazer nova vistoria. Se aparecer grande, voltar ao passo 4. Médio novo é corrigido pelo passo 5, sem outra vistoria.
7. Sem grande nem médio, corrigir os pequenos, 1 por vez.
8. Encerrar.

Em todos os passos, corrigiu 1 problema, testa só aquela correção, pela seção 5. Teste exaustivo e gigante, nunca.

## 2. O que entra nos testes

Toda função do produto entra, mesmo quando os dados do proprietário ainda não mostram uso. Só o proprietário tira ou põe um assunto.
As conferências que saíram dos testes e as que ficaram em versão barata estão no anexo A9.

## 3. A vistoria

A vistoria é larga e rasa. Testa 1 caso de cada assunto em cada plataforma, pelo caminho principal. Roda em todas as plataformas do anexo A2 ao mesmo tempo.
Junto dela roda o pacote de testes de dados, sem abrir tela.
O alvo é até 30 minutos. A orquestradora escolhe os casos e corta o que passar do alvo, sem perguntar ao proprietário.
A vistoria e as rodadas que só medem são lançadas pelo script do anexo A2, sem missão de IA. A IA entra para corrigir.

## 4. Classificação

Falha do teste com o produto certo não é problema do produto. O teste sai da vistoria e vai para a seção "Falha do teste, e não do produto" da lista de problemas da vistoria (anexo A1). Só é consertado quando faz falta à vistoria.
Falha de causa desconhecida tem só a medida, com teto de 15 minutos de máquina, antes de corrigir. Sem causa nesse tempo, vai para o fim da leva e não é medida de novo na mesma leva.

- **Grande ou bloqueante.** Impede o uso de uma função, perde ou grava dado errado, apresenta falha de segurança, ou o produto não compila ou não abre.
- **Médio.** Atrapalha o uso, mas existe caminho.
- **Pequeno.** É detalhe.

As operadoras classificam por estas definições, sem levar a classificação à orquestradora. A orquestradora só entra quando as definições não resolvem o caso. O proprietário pode reclassificar.

## 5. O teste de cada correção

Rodam os casos que mostraram o problema e todos os demais casos do mesmo assunto, até 15 minutos de máquina.
Mais 2 conferências baratas. Compilar em todas as plataformas, sempre. Rodar o pacote de testes de dados quando a correção mexe em código de dados.
O teste contra o serviço externo real (anexo A8) roda só quando a correção muda as chamadas a esse serviço.
Passou, próxima correção. Não passou em 2 tentativas, o problema vai para o fim da leva, com a medida.
Só entra no tronco a árvore cuja soma é a da última compilação em todas as plataformas.
A missão termina quando entrega o trabalho ou depois da 2ª tentativa sem passar. Os testes que sobrarem dela são cancelados sem pergunta ao proprietário.
A missão tem 45 minutos de trabalho, contados do início, incluída a espera pela vaga na máquina de testes. Aos 45 minutos, ela para de começar mudança ou teste novo e faz o pouso suave, em até 15 minutos, nestes 4 passos.
1. Cancela os próprios testes que ainda estão na fila.
2. Guarda a árvore de trabalho como `parcial.patch` na pasta da rodada, com os arquivos novos.
3. Grava o `relatorio.md` na pasta da rodada, com 5 partes. São elas o que foi feito, o que passou (com a rodada), o que falhou (com a rodada e a mensagem), o que falta e o próximo passo.
4. Grava a entrega com "Situação: parcial" e volta a árvore ao commit de partida.

Aos 60 minutos, o script que lançou a missão para o executor que ainda estiver rodando, com os testes que ele lançou. A missão parcial não recomeça sozinha. A orquestradora lê o relatório e decide se ela recomeça do que ficou guardado ou se o problema vai para o fim da leva.

## 6. Revisão

Só a correção que mexe em dados tem 1 revisor independente, de outro modelo de IA. Ele lê a mudança sem o resumo de quem escreveu. A revisão corre em paralelo. Achado grave vira problema grande.

## 7. Entrega

No fim de cada leva, sai uma versão interna, sem pedir permissão. Versão para pessoas de fora e publicação ao público só com o sim do proprietário, salvo o que o anexo A3 registra como liberado por ele. Os canais de cada caso ficam no anexo A3.
Cada publicação segue o anexo A7. Nela, a bateria completa roda 1 vez por versão, e a bateria contra o serviço externo real, quando a versão muda as chamadas a esse serviço.

## 8. Quem decide

O proprietário decide o que é externo, irreversível, custa dinheiro ou muda o que o produto faz. Só ele muda a forma de operar, que é o que esta spec e o anexo definem (seção 11). Ele define sempre o modelo e o esforço da orquestradora, e os 2 variam. Vale o último que ele definiu, também na sessão substituta aberta por contexto.
A orquestradora decide todo o resto, sem levar ao proprietário decisão de execução, e conta só o que muda o que ele vê ou usa.

## 9. Mensagens ao proprietário

A orquestradora manda mensagem ao proprietário só com decisão dele, bloqueio ou entrega. Sem isso, não manda nada, nem para dizer que não existe nada a decidir. Ela não narra o andamento nem repassa relatos das operadoras. As operadoras aplicam esta spec sem pedir ok à orquestradora, inclusive para juntar no tronco a correção que passou pelas seções 5 e 6, e só escrevem a ela com decisão que a spec não resolve ou bloqueio.

Mensagens ao proprietário em lista curta, sem tabela. Em decisão, cada opção diz em 1 linha o que é e o que muda.
O que só ele faz não vira pendência nossa, e ninguém pede que ele rode comando. Tudo que depende dele é pedido de uma vez. Instrução que mudou vai em 1 versão final completa.
O que o proprietário relata ver é fato a explicar; a causa ainda é conferida. O teto de uma tarefa nunca é dito a ele como prazo.

## 10. O que nunca muda

- Os testes não usam os dados reais do proprietário nem serviços pagos reais.
- O executor não lê os segredos do projeto (anexo A4). Só os scripts oficiais leem. A leitura é conferida depois da missão, e a chave lida é trocada.
- Quem executa entrega fato e medida e não decide que está pronto nem muda o rumo.
- Nenhuma execução passa de 45 minutos, seja processo, teste, lote, bateria, revisão, medida ou script. Ela para ao chegar aos 45 minutos, sem pouso. A única exceção é a missão do executor, com 45 minutos de trabalho e até 15 minutos de pouso suave (seção 5). Cada execução tem o teto no próprio script. O que precisa de mais tempo é dividido em partes de até 45 minutos.

## 11. Como este documento muda

Só muda por decisão do proprietário, registrada. A mudança reescreve o ponto.
A correção de um fato, como caminho, nome de script ou número, entra na hora. Regra nova ou mudada entra com o ok dele.

## 12. Erros e causas raiz

Cada erro é anotado com a causa raiz no relatório da missão (seção 5) ou na lista de problemas da vistoria (seção 4). A correção ataca a causa, e não o sintoma.
O custo da correção tem de ser menor que o custo causado pelo problema. Se for maior, a correção é revista até ficar mais barata que o problema.
O custo do teste também tem de ser menor que o custo do problema que ele evita. Teste que custa mais é tirado, simplificado ou trocado por uma verificação mais barata.
Uma falha não justifica processo novo nem teste gigante. Nenhuma correção de erro muda o modelo da seção 1.

Regras gerais tiradas de erros.

- **Paralelo dentro da capacidade.** O trabalho roda em paralelo até onde a máquina de testes comporta. O script que lança as rodadas espera a vaga e a memória livres (anexo A2).
- **Ferramenta de teste que falha.** Vale a regra do custo. Correção barata, de minutos, entra na 1ª falha. Correção cara espera. A rodada é repetida, e a ferramenta só é corrigida se a falha voltar pela mesma causa.
- **Fim de etapa conferido no arquivo.** Quando uma etapa tem resultado previsto em arquivo, a orquestradora espera por esse arquivo, e não só pelo aviso da outra sessão.

As regras tiradas dos erros do projeto entram depois destas, com a data, pela seção 11.
