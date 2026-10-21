# Garantias da spec

Toda spec copia esta lista sem mudança. Cada garantia é uma propriedade que se verifica, e não um mecanismo. O mecanismo que cumpre cada uma é uma decisão de como, escrita na spec. As garantias G01 a G05 valem sempre. As demais podem ficar como "não se aplica", com o motivo registrado.

Cada garantia traz o motivo que a sustenta. Uma garantia entra ou sai desta lista só com evidência de execução.

## G01. Quem executa não decide o pronto

**Garantia.** Um requisito está pronto só quando o seu verificador diz que está. O verificador é um programa, uma medição ou a aprovação do proprietário, e o executor não o controla.

**Motivo.** Sem verificação externa, quem executa tende a não achar os próprios erros e a declarar pronto sem prova.

**Prova.** A spec nomeia o verificador de cada requisito e mostra por que o executor não o controla.

## G02. Requisito verificável

**Garantia.** Cada requisito tem identificador estável, 1 frase em voz ativa, quantidades com unidade e o verificador. Termo vago vira medida ou sai. Requisito sem verificador fica fora da spec.

**Motivo.** Requisito vago aceita qualquer entrega, e o executor preenche a lacuna por conta própria.

**Prova.** A conferência de todos os requisitos, feita na escrita da spec.

## G03. Critérios congelados

**Garantia.** O executor não altera critérios, verificadores nem referências. Ele pode acrescentar verificadores, com registro. Mudar ou remover um verificador exige o proprietário. Diante de um verificador que reprova, o executor corrige a entrega, e nunca a expectativa.

**Motivo.** Executores pressionados para terminar chegam a alterar o próprio critério de aprovação.

**Prova.** A spec descreve o mecanismo de proteção e uma tentativa de alteração que ele barra ou detecta.

## G04. Expectativa independente

**Garantia.** O resultado esperado vem de uma fonte que não é a própria entrega, por exemplo a spec, uma referência existente ou um cálculo feito à parte. Cada verificação nova falha sem a mudança que ela cobre.

**Motivo.** Uma verificação que repete a lógica da entrega passa sempre e não prova nada.

**Prova.** Cada verificador indica a fonte da expectativa, e a falha sem a mudança fica registrada.

## G05. Prova registrada antes e depois de integrar

**Garantia.** Vale o registro da execução dos verificadores, e não o relato do executor. Antes de integrar uma mudança, rodam os verificadores que ela pode afetar, escolhidos por um mapa definido na spec. Sem mapa, rodam todos. Depois de integrar, todos os verificadores rodam juntos, e o executor segue o trabalho enquanto eles rodam. Uma falha nessa rodada completa suspende novas integrações até a mudança culpada ser corrigida ou desfeita. Uma falha que o mapa não previu atualiza o mapa, com registro. A entrega e as ações caras ou impossíveis de desfazer (G10), como publicar, só partem de uma versão em que todos os verificadores passaram juntos depois da última mudança. O que não rodou é "bloqueado", e nunca "passou". Uma verificação que não verificou nada é falha. Um resultado que oscila é repetido até mostrar estabilidade.

**Motivo.** Relatos de conclusão sem execução e verificações vazias são as formas mais comuns de falso pronto. Rodar todos os verificadores antes de cada integração deixa o executor parado à espera. A escolha pelo mapa antes e a rodada completa depois mantêm o trabalho andando e acham a falha antes de qualquer ação sem volta.

**Prova.** A spec diz onde fica o registro, como ele mostra quantas verificações rodaram, qual mapa escolhe os verificadores antes de integrar e como uma falha da rodada completa suspende as integrações seguintes.

## G06. Bloqueio e limites

**Garantia.** Cada requisito pode ficar "bloqueado", com motivo, evidência e o modo de reproduzir. Bloquear não é falha. Contornar o verificador é. As tentativas por falha, por unidade e por execução têm limite finito, definido na spec. As passadas de revisão por etapa também têm limite finito, definido na spec. Sem progresso, o executor para aquela parte e segue nas partes independentes. Uma verificação que passava e agora falha é regressão até prova em contrário.

**Motivo.** Sem saída honesta e sem limite, o executor contorna o verificador ou repete tentativas sem fim.

**Prova.** A spec fixa os limites e o formato do registro de bloqueio.

## G07. Dúvida vira registro

**Garantia.** Durante a execução, a dúvida não para o trabalho. Se a spec tem regra para o caso, o executor aplica a regra e registra. Se não tem, ele bloqueia a parte, segue nas independentes e leva a pergunta ao proprietário no momento definido na spec.

**Motivo.** Perguntas no meio da execução param o trabalho, e decisões sem registro se perdem.

**Prova.** A spec define onde ficam as perguntas e quando o proprietário as recebe.

## G08. Estado durável e retomada

**Garantia.** O plano, a situação de cada requisito, o registro de tentativas, as decisões, as perguntas e os achados fora do escopo ficam em meio durável, fora da memória do executor. Qualquer sessão retoma o trabalho a partir deles. Ao retomar, o executor confere de novo o estado externo. Operações repetidas não produzem efeito duplo. Cada item concluído tem um ponto de restauração.

**Motivo.** O contexto de quem executa acaba ou é trocado, e o trabalho não pode depender dele.

**Prova.** A spec indica onde fica cada registro e como uma sessão nova retoma.

## G09. Revisão independente

**Garantia.** No fim de cada etapa, revisores sem o contexto de quem executou recebem só os critérios, a evidência bruta e a mudança, e nunca o resumo do executor. Eles apontam só falhas de requisito e de correção. Antes da revisão, 1 levantamento completo da parte afetada junta os defeitos em 1 lista. Cada passada olha só a mudança desde a passada anterior. Um achado de antes da etapa, ou fora do escopo dela, vira pendência registrada e não reabre a etapa. A revisão é triagem, e o verificador continua sendo quem decide o pronto. Um erro mecânico que se repete vira verificação automática.

**Motivo.** Quem fez o trabalho, e quem leu o resumo dele, tende a ver o que espera.

**Prova.** A spec define quem revisa, o que recebe e quando.

## G10. Aprovação pelo custo de desfazer

**Garantia.** Ações caras ou impossíveis de desfazer passam pelo proprietário, por exemplo publicar, gastar, apagar, enviar mensagens ou mudar dados reais. Os limites vêm de mecanismo, e não só de texto. Credenciais ficam fora do alcance do executor.

**Motivo.** Uma instrução escrita não impede uma ação. Só um mecanismo impede.

**Prova.** Uma tabela de ações e responsáveis, com o mecanismo de cada limite.

## G11. Ambiente provado primeiro

**Garantia.** Antes do trabalho principal, uma unidade curta prova, executando, que cada caminho necessário funciona, como ferramentas, acessos e destinos. As versões em uso ficam registradas.

**Motivo.** Uma falha de ambiente descoberta no meio do trabalho custa mais e se confunde com uma falha da entrega.

**Prova.** A 1ª unidade da spec é essa prova, com o registro do resultado.

## G12. Defeito vira verificador

**Garantia.** Todo defeito encontrado depois da entrega vira primeiro uma verificação que falha sem a correção. Depois de revisada, ela entra nos critérios congelados (G03). Um defeito que escapou dos verificadores gera uma prevenção registrada.

**Motivo.** Sem isso, o mesmo defeito volta.

**Prova.** A spec descreve o caminho de um defeito relatado até o novo verificador.

## G13. Um responsável por item

**Garantia.** Cada item alterável tem um único responsável por vez. O trabalho em paralelo acontece só em frentes independentes, integradas uma de cada vez.

**Motivo.** 2 responsáveis pelo mesmo item perdem o trabalho um do outro.

**Prova.** A divisão das unidades mostra o responsável de cada item.

## G14. Mecanismo extra só com evidência

**Garantia.** A spec começa com o mínimo que cumpre estas garantias. Um mecanismo extra entra quando os registros da execução mostram a falha que ele evita. Metas impossíveis ficam fora da spec e viram "bloqueado" ou saem do escopo.

**Motivo.** Mecanismo em excesso custa manutenção, e uma meta impossível empurra o executor a contornar o verificador.

**Prova.** Cada mecanismo da spec aponta a garantia, o requisito ou a evidência que o justifica.

## G15. Como fixo durante a execução

**Garantia.** As decisões de como da spec valem durante toda a execução. Elas são revistas só entre etapas, com registro. Trocar um mecanismo de verificação exige o proprietário.

**Motivo.** Trocar o mecanismo no meio da execução impede comparar rodadas e pode enfraquecer um verificador sem ninguém perceber.

**Prova.** A spec indica quando as decisões de como podem ser revistas e por quem.
