---
type: llm
focus:
  source: file
  path: spec.md
---
Evaluate the file spec.md, the spec for an in-person training. PASS only if all 3 items hold.
1. Requirements have identifiers, for example R01, and each names how it is verified in a way that is possible for an event, for example an acceptance checklist, a count, a survey, or the owner's approval.
2. Guarantees G01 to G05 each have a described mechanism, and none of them is marked as not applying.
3. The spec does not require automated code tests to verify the event.
Ignore the guarantee text copied from the skill. Evaluate the requirements and the mechanisms the spec chose.
FAIL if any item fails.
