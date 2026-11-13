---
type: regex
target:
  source: file
  path: docs/spec-de-execucao.md
pattern: "\\n## A3\\.(?:(?!\\n## A4\\.)[\\s\\S])*?\\n### A3\\.\\d+[^\\n]*web"
flags: i
---
