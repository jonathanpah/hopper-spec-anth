---
type: regex
target:
  source: file
  path: docs/spec-de-execucao.md
pattern: "\\n# Anexo[^\\n]*\\n(?:[^\\n]*\\n){70}"
match: not_contains
---
