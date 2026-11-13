---
type: regex
target:
  source: file
  path: docs/execution-spec.md
pattern: "[Qq]uarantine|\\b[Mm]issions?\\b|\\b[Cc]lass [A-E]\\b|[Ss]hort walkthrough|\\b[Ll]anes?\\b"
match: not_contains
---
