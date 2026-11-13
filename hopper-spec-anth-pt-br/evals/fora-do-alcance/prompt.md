---
description: Pedido de spec que não é de software não gera arquivo.
expected_outcome: Diz que a skill cobre só software feito por agentes de IA e não grava arquivo.
tags: [com-escrita]
runs: 2
max_turns: 10
timeout_seconds: 300
allowed_tools: [Skill, Read, Glob, Grep, Write]
---
/hopper-spec-anth:hopper-spec-anth Escreva a spec de um treinamento presencial de 1 dia sobre atendimento ao cliente, para 30 pessoas. Grave a spec em spec.md, na pasta atual. Eu não estou disponível para perguntas.
