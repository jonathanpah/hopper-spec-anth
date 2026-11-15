---
type: regex
target:
  source: file
  path: docs/spec-de-execucao.md
pattern: "\\n# Anexo[^\\n]*\\n(?:[^\\n]*\\n){90}"
match: not_contains
---
