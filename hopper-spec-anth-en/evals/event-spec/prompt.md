---
description: Writes the spec for a deliverable that is not software.
expected_outcome: spec.md with verifiers suited to an event, without imposing software mechanisms.
tags: [with-write]
runs: 2
max_turns: 60
timeout_seconds: 1200
allowed_tools: [Skill, Read, Glob, Grep, Write, Edit, Bash, Agent, WebSearch, WebFetch]
---
/hopper-spec-anth:hopper-spec-anth Write the spec for a one-day in-person customer service training for 30 people, to be organized by an events team. Save the spec to spec.md in the current folder. I am not available for questions. Adopt the recommended answers and mark each one as pending confirmation.
