---
type: regex
target:
  source: file
  path: docs/execution-spec.md
pattern: "\\n# Annex[^\\n]*\\n(?:[^\\n]*\\n){70}"
match: not_contains
---
