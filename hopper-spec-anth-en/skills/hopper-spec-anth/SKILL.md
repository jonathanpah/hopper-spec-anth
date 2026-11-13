---
name: hopper-spec-anth
description: Writes the 2 specs for a software product that AI agents build and prove with automated tests, such as an app, a site, a service, or a tool. The product spec says what it does. The execution spec carries the general body unchanged and the project annex. It serves a new product and a software project that does not have the 2 specs yet. It does not cover a document, an event, a process, or any other deliverable that is not software. Use when the user invokes this skill.
compatibility: Requires Claude Code, in the CLI or the app, and a POSIX shell for the body script.
disable-model-invocation: true
---

# hopper-spec-anth

This skill writes 2 documents for a software product that AI agents will build and prove with automated tests. It only writes. Building starts later, by the owner's decision.

- **Product spec.** What the product does. Follow [product-spec.md](product-spec.md).
- **Execution spec.** How the work is carried out and proven. It is the general body from [execution-body.md](execution-body.md), unchanged, followed by the project annex, which you write by [annex.md](annex.md).

The 2 documents come out in English, the language of this package. If the owner writes in another language, say that a Portuguese package exists and follow the owner's choice.

## Rules for every step

- **Untouchable body.** The body goes in whole and identical, assembled by the `body.sh` script, never retyped. The only slot is `{{PROJECT}}`, in section 0, which receives the product name. Summaries, reordering, corrections, and "improvements" of the body stay out. The body only changes by an express decision of the owner, recorded in section 2 of the product spec with the owner's words and the date.
- **Nothing invented.** Every fact has a source, which is the project, an answer from the owner, or an official page consulted, with the date. What is missing becomes a question or gets one of these 3 marks.
  - **to be measured.** A number or time that only execution shows. Say when it is measured.
  - **to be built.** A file, script, or list that does not exist yet. It goes into item A10 of the annex.
  - **pending confirmation.** A recommended answer the owner has not confirmed yet.
- **Documents that stand alone.** The 2 specs cite as a source only the project, the owner, and the pages consulted. The skill appears only in the header, with its name and version.
- **Fictional examples.** The templates carry examples from a fictional app only to show the form. The content comes from the project.

## Steps

### 1. Scope

Identify the product, the owner, the platforms, and the destination folder. The default destination is `docs/`, at the project root, with `docs/product-spec.md` and `docs/execution-spec.md`. Before writing over a file that already exists, read the file and confirm with the owner.

Stop at this step, without writing a file, in 3 cases.

- The request is to explain, review, or edit this skill. Answer the request.
- The deliverable is not software, such as a document, an event, or a process. Say that the skill covers only software built by AI agents and proven by tests.
- The project already has a product spec and an execution spec. Say that a new function enters through section 6 of its body, and a rule change through section 14.

Done when the product, the owner, the platforms, and the destination are defined or became questions for step 3.

### 2. Read

Read what exists. Start with the request and the project, with code, tests, scripts, build configuration, project instructions such as `AGENTS.md` or `CLAUDE.md`, and documents. In the environment, check only what the product will use, such as the system, the installed tools, and the machines that can run the tests. Other projects and personal folders stay out of the reading. Read [execution-body.md](execution-body.md) in full, because the annex answers the body. Your memory has a cutoff date. So consult the current official documentation before each technical choice.

Done when each fact the documents will use has a noted source and what the sources do not answer is listed.

### 3. Ask

Follow [questions.md](questions.md). Send 1 message only, with numbered questions, the options explained in plain language, and a recommendation for each. Before it, research only what changes a recommendation. The rest of the research waits for step 4.

After the message, stop and wait for the answer. Steps 4 to 7 start only after it. This also holds in a session without interaction, such as `claude -p`, where the answer arrives when the session is resumed. Record each answer with the owner's words and the date.

The owner is unavailable only when the request or the owner says so. In that case, or when the owner asks not to be consulted, adopt the recommendations without sending the message and mark each one as "pending confirmation".

Done when the owner has answered and each answer is recorded, or when the request says the owner is unavailable and each adopted recommendation is marked as pending.

### 4. Decide the how

The technical choices are yours, such as architecture, language, folders, test tools, and the path of the internal delivery. Prefer the native resource, with active support and fewer dependencies. Each choice becomes a how decision in section 7 of the product spec, with dated sources. The folder decision defines the class paths in the annex.

Done when each requirement and each annex section that depends on technique has the how decision that supports it.

### 5. Write

1. Write the product spec by [product-spec.md](product-spec.md).
2. Write the execution spec by [annex.md](annex.md), with the header, 1 line with only `{{BODY}}` in place of the body, and the annex.
3. Replace the `{{BODY}}` line with the body, using the command below with the product name and the file path.

```sh
sh "${CLAUDE_SKILL_DIR}/scripts/body.sh" insert "<product name>" docs/execution-spec.md
```

If the shell can only read, replace the `{{BODY}}` line with the content of [execution-body.md](execution-body.md) using the edit tool, with the name in place of `{{PROJECT}}` and no other change. The `check` of step 6 only reads and works in that case. After that, edit only the header and the annex.

Done when the 2 files are written and the body was inserted by the script.

### 6. Check

Run the 2 documents through the whole [checklist](checklist.md). Fix each item that fails and check again, until all pass.

Done when all items pass and each doubt of the reader without context has a destination.

### 7. Deliver

Tell the owner, in plain language, the paths of the 2 files, the items pending confirmation, the "to be measured" and "to be built" items that need the owner's attention, and what was left unverified. The 2 specs are born as drafts and take effect with the owner's approval. Building starts later, by the owner's decision.
