## 0. O que é

Esta é a única fonte das regras de como testar e corrigir o {{PROJETO}}. Vale por decisão do proprietário, desde a aprovação registrada no cabeçalho. O que o produto faz fica na spec do produto. O que é só deste projeto fica no anexo, no fim.
A orquestradora é a sessão de IA que conduz o trabalho. O executor é a sessão que escreve cada correção.
Assunto é uma função do produto, com os casos de teste dela. Leva é cada rodada de correções que vem depois de uma vistoria.

## 1. O modelo, em 8 passos

1. Escolher o que faz sentido testar, pela seção 2.
2. Fazer a vistoria do produto inteiro.
3. Separar falha do teste de problema do produto. Classificar os problemas em grande ou bloqueante, médio e pequeno.
4. Corrigir os grandes, 1 por vez. Testar só aquela correção e passar ao próximo.
5. Corrigir os médios, do mesmo jeito.
6. Fazer nova vistoria. Se aparecer grande, voltar ao passo 4. Se aparecer médio, voltar ao passo 5 e repetir a vistoria.
7. Sem grande nem médio, corrigir os pequenos, 1 por vez.
8. Encerrar.

Em todos os passos, corrigiu 1 problema, testa só aquela correção, pela seção 5. Teste exaustivo e gigante, nunca.

## 2. O que entra nos testes

Toda função do produto entra, mesmo quando os dados do proprietário ainda não mostram uso. Só o proprietário tira ou põe um assunto.
O que ele tirou fica no anexo A3, com a data e as palavras dele.

## 3. A vistoria

A vistoria é larga e rasa. Testa até 3 casos de cada assunto em cada plataforma, pelo caminho principal. Roda em todas as plataformas do anexo A2 ao mesmo tempo.
Junto dela roda o pacote de testes de dados, sem abrir tela.
O alvo é até 2 horas. A orquestradora escolhe os casos e corta o que passar do alvo, sem perguntar ao proprietário.

## 4. Classificação

Falha do teste com o produto certo não é problema do produto. O teste sai da vistoria e vai para uma lista. Só é consertado quando faz falta à vistoria.

- **Grande ou bloqueante.** Impede o uso de uma função, perde ou grava dado errado, apresenta falha de segurança, ou o produto não compila ou não abre.
- **Médio.** Atrapalha o uso, mas existe caminho.
- **Pequeno.** É detalhe.

A orquestradora classifica. O proprietário pode reclassificar.

## 5. O teste de cada correção

Rodam os casos que mostraram o problema e todos os demais casos do mesmo assunto, até 15 minutos de máquina.
Mais 2 conferências baratas. Compilar em todas as plataformas, sempre. Rodar o pacote de testes de dados quando a correção mexe em código de dados.
O teste contra serviço externo real, com a conta de teste do anexo A5, roda só quando a correção muda as chamadas a esse serviço.
Passou, próxima correção. Não passou em 2 tentativas, o problema vai para o fim da leva, com a medida.

## 6. Revisão

Só a correção que mexe em dados tem 1 revisor independente, de outro modelo de IA. Ele lê a mudança sem o resumo de quem escreveu. A revisão corre em paralelo. Achado grave vira problema grande.

## 7. Entrega

No fim de cada leva, sai uma versão interna pelo caminho do anexo A4, sem pedir permissão. Versão para pessoas de fora e publicação ao público só com o sim do proprietário, salvo o que o anexo A4 registra como já liberado por ele.
A bateria completa, com todos os testes do produto, e a bateria contra serviço externo real rodam 1 vez por versão.

## 8. Quem decide

O proprietário decide o que é externo, irreversível, custa dinheiro ou muda o que o produto faz. Também decide a lista de assuntos testados.
A orquestradora decide todo o resto e avisa depois. Escolhe os casos e o tamanho da vistoria, a classificação, a ordem das correções, as sessões e os modelos dentro do padrão do anexo A6. Ela não leva ao proprietário decisão de execução.

## 9. Mensagens ao proprietário

Conclusão primeiro. Só o indispensável. Frases e parágrafos curtos, 1 ideia por vez, sem jargão e sem recapitular.
Pendências reais ficam no fim, numeradas. Cada uma informa o que está pendente, a recomendação e o que se precisa dele.

## 10. O que nunca muda

- Mudança em dados leva sempre os testes da seção 5.
- Senhas, chaves e dados reais ficam fora do repositório e dos testes.
- Os testes não usam os dados reais do proprietário nem serviços pagos reais.
- O executor não tem por que ler segredos. Só os scripts oficiais do anexo A5 leem. A chave lida fora deles é trocada.
- Nada privado entra em repositório público.
- Quem executa não decide que está pronto.

## 11. Como este documento muda

Só muda por decisão do proprietário, registrada. A mudança reescreve o ponto.
