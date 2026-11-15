---
type: regex
target:
  source: file
  path: docs/execution-spec.md
pattern: "\\n# Annex[^\\n]*\\n(?:[^\\n]*\\n){90}"
match: not_contains
---
