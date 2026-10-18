---
description: Pedido de explicação não gera spec.
expected_outcome: Explica a separação entre o que e como sem gravar arquivos.
tags: [com-escrita]
runs: 3
max_turns: 10
timeout_seconds: 300
allowed_tools: [Skill, Read, Glob, Grep, Write]
---
/hopper-spec-anth:hopper-spec-anth Explique em até cinco linhas como esta skill funciona. Não escreva nenhuma spec.
