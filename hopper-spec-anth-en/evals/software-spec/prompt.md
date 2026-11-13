---
description: Writes the 2 specs of a fictional app without the owner available.
expected_outcome: docs/product-spec.md and docs/execution-spec.md, with the general body identical to the skill's, the annex from A1 to A7, 1 subject per requirement area, up to 150 lines, the "to be measured" marks, and the pending items marked.
tags: [with-write]
runs: 2
max_turns: 150
timeout_seconds: 3600
allowed_tools: [Skill, Read, Glob, Grep, Write, Edit, Bash, Agent, WebSearch, WebFetch]
---
/hopper-spec-anth:hopper-spec-anth Write the specs for House Chores, an app for the people who share a house to split the household chores, on iPhone and on the web. The project is new and has no code yet. Save the specs in docs/, in the current folder. I am not available for questions. Adopt the recommended answers and mark each one as pending confirmation.
