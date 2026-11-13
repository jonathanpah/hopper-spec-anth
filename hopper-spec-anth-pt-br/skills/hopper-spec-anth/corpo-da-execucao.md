## 0. O que é este documento

Ele diz como o trabalho é executado e provado. O corpo, das seções 1 a 14, serve para qualquer projeto. O anexo, no fim, traz o que é só do {{PROJETO}}.

Ele não diz o que o produto faz. Isso fica na spec do produto de cada projeto.

Em outro projeto, o corpo é copiado sem mexer. Escrevem-se de novo a spec do produto e o anexo.

Este documento traz só as regras que valem hoje. Quando uma regra muda, o ponto é reescrito. O histórico e o porquê ficam no registro de decisões do projeto.

Ele é a única fonte das regras de execução e de prova. Ele vale sozinho, e nenhum modelo de spec, skill ou regra anterior vale acima dele. O registro de decisões guarda de onde cada regra veio e não é citado como regra. Quem aplica ou explica uma regra cita a seção deste documento. Regra que faz falta aqui entra aqui, pela seção 14, e não fica só no registro de decisões.

**Termos**

- **Missão.** A tarefa dada a 1 agente executor.
- **Prova.** O teste, ou o conjunto de testes, que mostra que a mudança funciona.
- **Tronco.** O código já aceito, de onde toda missão parte.
- **Árvore final.** O código exatamente como vai entrar, depois da última mudança.
- **Tela.** A unidade de uso do produto. Em produto sem tela, é a função que a pessoa usa, e o anexo diz qual.
- **Produto inteiro.** Todos os testes do produto, em todas as plataformas dele.
- **Entrega interna.** A versão de teste que vai só ao proprietário.
- **Junção.** A entrada de correções provadas no tronco. Pode acontecer várias vezes entre 2 entregas internas.
- **Grupo de casos.** Os casos de teste que rodam juntos em 1 chamada da máquina de teste.
- **Trilha.** Uma fila de missões que roda ao lado de outras, sem disputar a mesma máquina de teste.
- **Ferramenta de prova.** O mapa das classes, a barreira, os scripts que rodam e leem os testes e a configuração do executor de testes.

## 1. Regra central

**A prova é proporcional à mudança.** Nenhuma etapa roda se o resultado dela não puder mudar uma decisão.

O método tem 3 passos. Corrigir tudo o que está mapeado. Provar só o que foi corrigido. Testar o produto inteiro 1 vez, no fim.

Corrigir uma parte pequena e testar o produto inteiro é o exemplo do que este documento proíbe.

## 2. Classes de mudança e a prova de cada uma

Toda mudança tem 1 classe. A classe sai dos arquivos mexidos, por um mapa gravado no repositório e lido por script. Quem executa não escolhe a classe.

- **Classe A. Só teste ou documentação.** Prova: os testes mexidos, 1 vez. Nenhuma prova do produto se repete. Arquivo de apoio usado por vários testes, como classe base, ajudante, semente e simulador, leva os testes mexidos e 1 caso de cada grupo de testes que usa o apoio.
- **Classe B. 1 tela.** Prova: os casos do que mudou, nas plataformas em que mudou.
- **Classe C. Parte usada por várias telas**, como campo, botão ou navegação. Prova: os casos do que mudou e 1 caso de cada tela que usa a parte. A amostra de 1 caso por tela é fixa, fica no anexo e roda 1 vez por junção, e não em cada missão.
- **Classe D. Dados e segurança.** O anexo lista os caminhos. Prova, em 3 partes. O pacote inteiro de testes de dados, quando o pacote mudou. Os casos de tela dos requisitos de dados tocados, quando o código de dados mexido fica fora do pacote. O teste contra o serviço real, com conta de teste, quando o produto depende de serviço externo.
- **Classe E. Versão**, ou troca de ferramenta de build, de biblioteca ou de sistema. Prova: o produto inteiro, 1 vez, no código final.

**Regras do mapa**

- Mudança que toca mais de 1 classe leva a prova de cada classe tocada, sem repetir caso. A revisão é a da classe mais alta.
- Em arquivo que mistura tela e dados, o mapa lista as funções de dados. A mudança que toca uma delas é classe D.
- Arquivo que o mapa não conhece recebe a classe da orquestradora, na hora, antes da prova. Ela acerta o mapa depois, em missão própria.
- A classe e a prova usam o mapa e os scripts do tronco, e nunca os da entrega.
- A lista de casos de cada prova vem escrita na missão. Quem executa pode acrescentar caso, e não pode tirar.
- Os casos da missão têm um teto de tempo de máquina, fixado no anexo. Lista que estoura o teto mostra missão grande demais.

**Ferramenta de prova.** Mudança no mapa, na barreira, nos scripts de prova ou na configuração do executor de testes é missão própria, separada do código do produto, com 1 revisor, que lê a mudança antes de ela entrar. A prova dela mostra 2 coisas. A ferramenta aprova 1 caso certo e reprova 1 caso errado de propósito para cada regra que a mudança tocou. Barreira que não rodou conta como recusa.

## 3. Quando cada prova roda

- **Na missão.** Os casos do defeito, antes e depois da correção.
- **Na junção.** 1 compilação, em todas as plataformas do produto. A correção de classe B não repete a prova, salvo quando 2 entregas da mesma junção tocam a mesma tela. As correções das classes C e D repetem a prova na árvore da junção. A prova do pacote de dados não se repete quando as entradas dela, listadas no anexo, são iguais às da árvore em que ela rodou.
- **Antes de cada entrega interna.** O roteiro curto do uso principal, 1 vez por entrega, e não em cada junção. Ele passa pelo uso principal de ponta a ponta e 1 vez por cada tela principal. O anexo lista os casos.
- **No fim da versão.** O produto inteiro, 1 vez. Ele roda sobre a árvore do início dele. O que entrar depois segue a classe e não devolve caso à bateria.

A prova vale para a árvore em que rodou. **Prova vazia é falha.** Se algum caso da lista não rodou ou foi pulado, a prova falhou. Caso pulado só vale se estiver na lista de pulos previstos do tronco, com o motivo e quem autorizou.

Depois do produto inteiro, cada correção segue a classe dela. O produto inteiro só roda de novo por mudança de classe E.

Nenhum caso aprovado roda de novo sem mudança que o toque. As exceções são as provas desta seção.

## 4. O que fazer com cada falha

**4.1 Defeito grave.** Perda de dados, dado gravado errado, falha de segurança, produto que não compila ou não abre, e uso principal de uma tela quebrado. Só o defeito grave interrompe a fila. Ele é corrigido antes de qualquer outra coisa.

**4.2 Outros defeitos do produto.** Entram na fila por gravidade. A ordem é função, visual, acessibilidade e desempenho.

**4.3 Teste instável ou falha da máquina.** O script confere o ambiente e repete 1 vez, sozinho, o teste que falhou. Se ele passar, a operadora lê o registro da falha. Se o registro apontar o produto, a falha é defeito. Se não apontar, o teste vai para a quarentena, e a entrega segue.

- **Teste da classe D não entra na quarentena.** A falha de um teste de dados ou de segurança conta como defeito grave até o registro mostrar a causa, mesmo que passe na repetição.
- A quarentena é 1 lista, com o teste, a causa provável, quem conserta e o prazo de 7 dias.
- O teste em quarentena continua rodando, fora do bloqueio. Teste desligado esconde defeito.
- Ele sai da quarentena quando, depois do conserto, passar 3 vezes seguidas nas rodadas normais, na condição em que falhou.
- Quarentena vencida vira defeito na fila.

**4.4 Teste errado.** Se o produto está certo e o teste não, conserta-se o teste, com a prova na mão. A prova é o quadro da tela, a árvore de elementos ou o registro.

- Fica congelado o que a spec do produto exige, e não o arquivo do teste.
- O teste consertado continua conferindo o mesmo requisito. Consertar não é apagar a conferência.
- O valor esperado só muda para o que a spec do produto diz.
- A operadora confere a prova ao juntar. Quem conserta o teste não aprova o conserto.
- O conserto que tira conferência, pula caso ou aumenta limite de tempo vai a 1 revisor antes de entrar.

**4.5 Falha sem conclusão.** A operadora lê a falha de novo com a tela gravada, 1 vez. Se continuar sem conclusão, a falha entra na fila como defeito a medir. As outras correções não esperam por essa leitura.

**4.6 Defeito que escapou.** É o defeito achado depois da prova da classe, em parte que mudou na versão, pelo roteiro curto, pelo produto inteiro ou pelo proprietário. A tela ou a parte com 2 defeitos escapados na mesma versão passa a rodar todos os testes dela 1 vez por junção que a toque, até o fim da versão.

## 5. Como é uma missão

- **Pequena.** 1 defeito, ou 1 grupo de defeitos de mesma causa. Antes de corrigir, a parte afetada é levantada inteira, e tudo é corrigido de uma vez. Defeitos diferentes que o mesmo caso de teste cobre entram na mesma missão, porque o caso só passa com todos corrigidos.
- **Pronto que se executa.** A missão traz o comando que prova o pronto e os casos que têm de passar.
- **Conferida antes de sair.** A operadora só lança a missão que traz causa única, comando de prova, lista de casos, lugar marcado e máquina reservada. Se faltar item, ela devolve à orquestradora.
- **Reproduz antes de corrigir.** A operadora reproduz os casos da fila em grupo, por script, no tronco, antes de a missão existir, e guarda a falha. O item cujos casos passam fecha como "já passa". A missão parte da falha guardada. Defeito sem teste ganha primeiro o teste que falha, gravado antes da correção. O teste fica.
- **Lugar marcado.** A missão diz em que pastas pode mexer. Fora delas, nada muda.
- **Tempo curto.** O anexo fixa o limite de trabalho. A espera pela máquina de teste não conta.
- **Fecho na árvore final.** A prova final roda só os casos da missão, 1 vez, depois da última mudança.
- **Saída por item.** O item que não fechar sai da árvore, e a missão entrega o que provou.
- **Limite de tentativas.** Cada desenho de missão tem até 2 tentativas. Depois delas, a orquestradora lê a medida e faz 1 desenho novo. O item que não fechar em 2 desenhos vai para a lista do proprietário, com a medida. A fila não espera a resposta dele.
- **Saída honesta.** O executor pode responder "não consegui, falta isto" ou "o teste parece errado". Essa resposta vale mais do que uma entrega forçada.
- **Missão de triagem ou de medida.** Não muda código. O pronto dela é a causa com a evidência, ou "sem conclusão".
- **Barreira no lugar de pedido.** Um script recusa a entrega que muda ou apaga teste que já existe fora da lista da missão, que mexe em pasta fora do lugar marcado, em ferramenta de prova, em segredo, em dados sem ser de classe D, ou que traz comando de publicação. O pedido orienta o agente. A barreira recusa a entrega que descumpre.

## 6. Construção de produto ou de função nova

- **Spec do produto antes.** Cada requisito diz o que tem de ser verdade e como se confere.
- **Ambiente provado primeiro.** Antes da 1ª função, o projeto compila, roda 1 teste e gera 1 entrega interna vazia em cada plataforma do produto.
- **Fatias que se usam.** O trabalho é cortado em fatias. Cada fatia é 1 função ou 1 tela que o proprietário consegue usar. A 1ª fatia passa pelo uso principal de ponta a ponta.
- **Dados antes das telas, dentro de cada fatia.** Em cada fatia, a parte de dados vem primeiro, com teste que roda sem tela. A tela da fatia vem depois.
- **Fecho pela classe.** Cada fatia fecha com a prova da classe dela. Nenhuma fatia fecha com o produto inteiro.
- **Entrega interna a cada fatia pronta.** O uso do proprietário acha cedo o que o teste não acha.
- **Função nova em produto que já existe.** Antes da missão, a spec do produto ganha a função e o modo de conferir. Mudança de estrutura ganha também a decisão registrada.

## 7. Trabalho em paralelo

- Trilhas paralelas, com 1 missão por trilha. O número de trilhas é o que a máquina de teste aguenta, medido. Ele fica no anexo.
- A prova de uma correção tem a vez na frente de qualquer bateria. Durante o produto inteiro do fim da versão, ela entra entre 2 grupos de casos, 1 por trilha, e nunca interrompe um grupo em curso.
- 2 missões que devem mexer no mesmo arquivo não rodam ao mesmo tempo.
- Se 2 correções conflitarem ao juntar, a que chegou depois fica de fora. Ela volta como missão curta, que reaplica a correção sobre o tronco novo e roda só os casos dela. Ninguém resolve conflito à mão.
- A fila é 1 arquivo só, e cada item dela tem 1 responsável por vez.

## 8. Revisão

- **Classe D.** 2 revisores sem contexto, antes de juntar. Eles recebem a mudança, o requisito e o registro da prova, e leem a árvore. Não recebem o resumo do executor. As revisões começam junto com a prova.
- **Classe C.** 1 revisor, com o mesmo material. A revisão corre em paralelo e não segura a junção.
- **Ferramenta de prova.** 1 revisor, antes de a mudança entrar.
- **Classes A e B.** Sem revisão separada. A prova da classe basta. A exceção é o conserto de teste da seção 4.4.
- **Fim da versão.** 1 revisão lê tudo o que mudou na versão, contra a spec do produto. Ela não relê o que não mudou.

O revisor confere a mudança contra o requisito. Ele não opina sobre estilo. O que ele achar entra na fila pela gravidade, como qualquer defeito.

## 9. Papéis e quem decide

- **Proprietário.** Decide o que é externo, irreversível, custa dinheiro ou muda o que o produto faz.
- **Orquestradora.** Lê os fatos, decide e ordena. Não escreve código.
- **Operadora.** Confere e lança as missões, roda as provas e junta as entregas no código.
- **Executor.** Cumpre a missão. Não decide que está pronto.
- **Revisor.** Confere a mudança contra o requisito.

**O que passa pelo proprietário**

- Distribuição a pessoas de fora e publicação aberta ao público.
- Gasto fora do plano.
- Apagar dados ou mexer nos dados reais dele.
- Mudança do que o produto faz.
- A lista do que fica para a versão seguinte.
- O modelo de IA de cada papel. O anexo registra o padrão e quando ele é perguntado de novo.

A orquestradora decide o resto e avisa depois. Entram aí a entrega interna, a publicação que o proprietário já liberou por regra, a abertura e a troca de sessões, a ordem da fila e o desenho das missões.

**Troca de sessão.** A sessão de IA que encheu o contexto 2 vezes é trocada logo antes da 3ª vez. A orquestradora grava o registro da conversa, escreve a passagem e abre a substituta, sem perguntar. Vale para todas as sessões, inclusive a da própria orquestradora. O anexo diz como se mede e com que ferramenta se grava.

**Mensagens ao proprietário.** Só resultado, decisão nova ou falha que muda o que ele faz. A conclusão vem primeiro, em linguagem comum.

## 10. Entrega

- **Entrega interna** das correções provadas e juntadas, depois do roteiro curto, sem esperar o fim da versão. A orquestradora decide a hora, no ritmo fixado no anexo.
- **O que o proprietário acha no uso** entra na fila na frente do que os testes acharam, depois do defeito grave.

**Fecho da versão**

- Zero defeito grave.
- A lista mapeada corrigida, ou adiada por decisão do proprietário.
- O produto inteiro rodado 1 vez, com cada falha tratada pela seção 4 e provada pela classe.
- Quarentena vazia, ou adiada na mesma lista.
- 1 revisão do que mudou na versão.

## 11. Testes novos

Vale para o que for escrito daqui em diante. Os testes que já existem não são reescritos por causa desta seção.

- A lógica fica fora da tela, em código que se testa sem abrir a tela. Esse teste roda em segundos.
- Estados visuais, como tela vazia, erro, tema escuro e letra maior, vão para comparação de imagem.
- Teste de tela fica para o que só existe na tela, como gesto, foco, navegação, leitura de tela, auditoria de acessibilidade, integração com o sistema e o uso principal de ponta a ponta.
- Teste de tela espera por um estado, e nunca por tempo fixo.
- Teste novo entra com o tempo dele medido e com limite de tempo próprio.

## 12. Medidas

Medidas a cada versão. Os números de partida e as metas ficam no anexo.

1. Missões que entram no código, sobre as lançadas.
2. Tempo do defeito achado à entrega interna que leva a correção.
3. Falhas causadas pelo teste ou pela máquina, sobre as falhas lidas.
4. Vezes em que o produto inteiro rodou na versão.
5. Tempo da máquina de teste em caso novo ou em prova de correção.
6. Duração do produto inteiro.
7. Defeitos que escaparam, pela definição da seção 4.6, separados por quem achou, entre roteiro curto, produto inteiro e proprietário.
8. Testes em quarentena e quarentenas vencidas.

A regra deste documento que não melhorar a medida dela em 2 versões sai ou é trocada, pela seção 14. A seção 13 fica fora desta regra. Mecanismo novo só entra com medida que o justifique.

## 13. O que nunca muda

- Mudança em dados leva sempre a prova da classe D.
- Senhas, chaves e dados reais ficam fora do repositório e dos testes.
- Os testes não usam os dados reais do proprietário nem serviços pagos reais.
- O executor não tem por que ler segredos. Só os scripts oficiais leem. A barreira acusa a leitura depois da missão, e a chave lida é trocada.
- Nada privado entra em repositório público.
- Quem executa não decide que está pronto.

## 14. Como este documento muda

- Durante uma versão, ele só muda por decisão do proprietário, registrada.
- A mudança reescreve o ponto. Texto novo não é empilhado sobre o antigo.
- O anexo muda quando o projeto muda, como na troca de máquina, de pasta ou de script.
