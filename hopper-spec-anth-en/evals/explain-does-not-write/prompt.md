---
description: A request for an explanation does not produce a spec.
expected_outcome: Explains the split between what and how without saving files.
tags: [with-write]
runs: 3
max_turns: 10
timeout_seconds: 300
allowed_tools: [Skill, Read, Glob, Grep, Write]
---
/hopper-spec-anth:hopper-spec-anth Explain in at most five lines how this skill works. Do not write any spec.
