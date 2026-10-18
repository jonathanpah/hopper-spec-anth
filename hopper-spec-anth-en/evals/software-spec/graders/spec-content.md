---
type: llm
focus:
  source: file
  path: spec.md
---
Evaluate the file spec.md, a software spec. PASS only if all 3 items hold.
1. Requirements have identifiers, for example R01, and each names how it is verified, for example a test case or a command.
2. Guarantees G01 to G05 each have a described mechanism, and none of them is marked as not applying.
3. There is a section of how decisions, and the decisions cite dated sources.
Ignore the guarantee text copied from the skill. Evaluate the requirements and the mechanisms the spec chose.
FAIL if any item fails.
