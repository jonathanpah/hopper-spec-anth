---
description: Without the skill command, Claude does not invoke the skill.
expected_outcome: No call to the hopper-spec-anth skill.
tags: [without-write]
runs: 3
max_turns: 10
timeout_seconds: 300
allowed_tools: [Skill, Read, Glob, Grep]
---
Write a short spec for a command-line tip calculator. Answer here, without saving files.
