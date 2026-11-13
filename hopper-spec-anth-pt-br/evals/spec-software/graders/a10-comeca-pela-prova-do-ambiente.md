---
type: regex
target:
  source: file
  path: docs/spec-de-execucao.md
pattern: "\\n## A10\\.[^\\n]*\\n(?:(?!\\n\\d+\\. )[\\s\\S])*?\\n1\\. [^\\n]*prova do ambiente"
flags: i
---
