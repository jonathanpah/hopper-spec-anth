---
description: Writes the spec for a small piece of software without the owner available.
expected_outcome: spec.md with verifiable requirements, guarantees, how decisions with dated sources, and pending items marked.
tags: [with-write]
runs: 2
max_turns: 60
timeout_seconds: 1200
allowed_tools: [Skill, Read, Glob, Grep, Write, Edit, Bash, Agent, WebSearch, WebFetch]
---
/hopper-spec-anth:hopper-spec-anth Write the spec for a command-line tool that converts a CSV file to JSON. Save the spec to spec.md in the current folder. I am not available for questions. Adopt the recommended answers and mark each one as pending confirmation.
