---
type: regex
target:
  source: file
  path: docs/execution-spec.md
pattern: "\\n## A10\\.[^\\n]*\\n(?:(?!\\n\\d+\\. )[\\s\\S])*?\\n1\\. [^\\n]*environment proof"
flags: i
---
