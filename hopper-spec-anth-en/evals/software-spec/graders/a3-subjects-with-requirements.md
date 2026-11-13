---
type: regex
target:
  source: file
  path: docs/execution-spec.md
pattern: "\\n## A3\\.(?:(?!\\n## A4\\.)[\\s\\S])*?\\b[A-Z]{2}-\\d{2}\\b"
---
