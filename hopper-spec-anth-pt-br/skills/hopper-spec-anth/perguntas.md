# Perguntas ao proprietário

O proprietário decide o produto e pode não ser técnico. Pergunte só o essencial que as fontes não respondem e que muda o trabalho. O resto você deduz, decide como redator ou marca como "a medir".

## Como perguntar

- **1 mensagem só.** Todas as perguntas vão juntas, numeradas. Uma rodada nova só vem quando uma resposta abre dúvida nova.
- **Linguagem comum.** Pergunte pelo resultado que o proprietário quer, como "Quem vai usar o app?", e nunca pela técnica. Termo técnico inevitável vem explicado na mesma frase.
- **Opções explicadas.** Cada pergunta traz de 2 a 4 opções. Cada opção diz, em 1 frase, o que muda para o proprietário. A recomendada vem primeiro, com "(recomendo)" e o motivo em poucas palavras.
- **Resposta curta.** A mensagem termina com "Responda 'sim' para aceitar todas as recomendações, ou diga o número da pergunta e a opção que você quer."
- **Registro.** Cada resposta entra na seção 2 da spec do produto, com a data e as palavras do proprietário.

## O que perguntar

Pule cada item que o pedido, o projeto ou uma resposta anterior já responde.

1. **Uso principal.** O que a pessoa faz no produto, do começo ao fim, na tarefa mais importante.
2. **Quem usa.** Só o proprietário, um grupo fechado ou o público. Isso define a distribuição, as contas e a revisão de loja.
3. **Onde funciona.** Celular, tablet, computador, navegador ou outro lugar. Cada um é uma plataforma da vistoria.
4. **Dados.** O que o produto guarda, de quem e onde. Se já existem dados reais, eles ficam fora dos testes, e a pergunta é só onde eles estão.
5. **Serviços de fora e gastos.** Login, pagamento, nuvem, envio de mensagens, IA ou outro serviço pago. Quem cria cada conta e quem paga.
6. **Versão interna.** Onde o proprietário quer receber a versão que sai no fim de cada leva, como no celular dele ou em um endereço só dele.
7. **Envios sem pergunta.** A distribuição a pessoas de fora e a publicação ao público passam sempre pelo proprietário. Pergunte se algum envio de rotina pode sair sem pergunta.
8. **Onde os testes rodam.** Quais computadores ou servidores existem para os testes, e em que horários cada um fica livre.
9. **Conferências que não são função do produto.** Como leitor de tela, contraste de cores, tamanho mínimo de toque e comparação da tela com imagens de referência. Pergunte quais entram nos testes. Toda função do produto entra sempre, e só o proprietário tira um assunto.
10. **Modelo de IA de cada papel.** Os papéis são orquestração, operação dos testes e da entrega, correções, revisão das correções de dados e triagem. O revisor de dados é de um modelo diferente do que escreveu a correção. Recomende pelos modelos que o ambiente oferece hoje, com o nome exato, e pergunte também quando o padrão é perguntado de novo.
11. **O que fica fora.** O que não entra na 1ª versão, para confirmar.

## O que nunca vira pergunta

- **Escolha técnica.** Linguagem, arquitetura, pastas e ferramentas são decisões de como, suas, registradas na seção 7 da spec do produto.
- **Decisão de execução.** Os casos da vistoria, a classificação dos problemas, a ordem das correções e as sessões são da orquestradora, pela seção 8 do corpo.
- **Número que só a execução mostra.** A duração da vistoria e do pacote de testes de dados ficam "a medir".
- **Fato que se busca.** Versões, preços e regras de lojas ou serviços se conferem na documentação oficial.

## Exemplo de forma

App fictício "Caderno de Receitas". Use só a forma.

> 1. Quem vai usar o app?
>    a) Só você, para testar (recomendo, porque a 1ª versão sai mais cedo e sem revisão de loja).
>    b) Sua família, em um grupo fechado. Cada pessoa precisa de convite.
>    c) Qualquer pessoa, pela loja. Exige revisão da loja e política de privacidade.
>
> 2. Os testes conferem também o leitor de tela, que lê a tela em voz alta para quem não enxerga?
>    a) Não, só as funções do app (recomendo, porque só você usa a 1ª versão e a vistoria fica mais curta).
>    b) Sim. A vistoria fica maior, e o app atende quem usa leitor de tela.
>
> Responda "sim" para aceitar todas as recomendações, ou diga o número da pergunta e a opção que você quer.
