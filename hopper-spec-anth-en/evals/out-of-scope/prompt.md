---
description: A spec request that is not for software produces no file.
expected_outcome: Says the skill covers only software built by AI agents and writes no file.
tags: [with-write]
runs: 2
max_turns: 10
timeout_seconds: 300
allowed_tools: [Skill, Read, Glob, Grep, Write]
---
/hopper-spec-anth:hopper-spec-anth Write the spec for a 1-day in-person customer service training for 30 people. Save the spec in spec.md, in the current folder. I am not available for questions.
