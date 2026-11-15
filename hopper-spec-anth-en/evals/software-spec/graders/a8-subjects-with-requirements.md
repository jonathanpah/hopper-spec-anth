---
type: regex
target:
  source: file
  path: docs/execution-spec.md
pattern: "\\n## A8\\.(?:(?!\\n## A9\\.)[\\s\\S])*?\\b[A-Z]{2}-\\d{2}\\b"
---
