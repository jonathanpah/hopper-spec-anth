---
name: hopper-spec-anth
description: Writes the spec for any deliverable, such as software, a document, an event, or a process, so that another session, person, or team can carry it out from start to finish without coming back with questions. The skill fixes what the spec guarantees, and the running model decides and records how to meet it, using the most current practice. Use when the user invokes this skill to write a spec.
compatibility: Requires Claude Code, in the CLI or the app.
disable-model-invocation: true
---

# hopper-spec-anth

This skill writes a **spec**, the document that is enough to carry out a deliverable from start to finish. It only writes. Execution happens later, in another session, by whoever the owner chooses, reading only the spec.

## What is fixed and what is yours

The skill fixes **what** the spec guarantees. The guarantees are in `${CLAUDE_SKILL_DIR}/guarantees.md`. Read the whole file before step 1.

**How** to meet each guarantee and each requirement is your decision, as the model running the skill. Choose the option that meets the "what" at the lowest maintenance cost, using native resources with active support. Your memory has a training cutoff. So, before each choice, check the current official documentation and the installed environment.

Record each choice in the spec as a **how decision**, with these fields.

- Serves: the requirement or guarantee.
- Alternatives: the options considered.
- Sources: what was consulted, with dates.
- Reason: why this option won.
- Proof: how to show that it works.

Tools, products, versions, formats, and numbers, such as attempts, repetitions, and unit size, go into the spec as how decisions. The skill does not fix them.

If this session's model or effort is below the highest available, tell the user once, at the start, and follow their choice.

## Participants

| Who | Role |
| --- | --- |
| Owner | Whoever invoked the skill, or whoever they name. Decides the deliverable and anything costly to undo |
| Writer | You. Reads the sources, asks, decides the how, and writes the spec |
| Executor | Whoever will carry out the spec: an agent, a person, or a team. Reads only the spec |
| Verifier | What decides whether a requirement is done, such as a program, a measurement, or the owner's approval. Never the executor |

## Steps

### 1. Scope

Identify the deliverable, the owner, the expected executor, and the spec's destination, that is, where the file goes. Use the request, the context, and the project's instructions.

If the request is to explain, review, or edit this skill, answer it and stop here, without writing a spec.

Done when all 4 items are defined or are on the question list for step 3.

### 2. Read the sources

Read everything that exists about the deliverable, such as files, project documents, running systems, earlier decisions, and current external facts. Finding facts is your job, not the owner's.

Done when every fact the spec will use has a noted source and what the sources do not answer is listed.

### 3. Ask the owner

Ask only what the sources do not answer and that changes the executor's work or is costly to undo. Ask numbered questions, in plain text, each with a recommended answer, worded so that "yes" accepts it. A new round comes only if an answer opens a new question. Record each answer in the owner's words, with the date.

If the owner is unavailable or asks not to be consulted, adopt the recommended answer and mark each one as "pending confirmation" in the spec.

Done when every question that changes the executor's work has an answer or is marked pending.

### 4. Write

Write the spec in the owner's language. The document's form is yours. The content below is required.

1. Goal and the observable result that ends the work.
2. Participants and what each one does.
3. Numbered requirements, in the form of guarantee G02, with the expected behavior.
4. Edge cases for each requirement.
5. What must never happen.
6. What is out of scope.
7. A glossary with one name for each thing, used the same way throughout the spec.
8. The owner's decisions, in their words, with the date.
9. Work units and order, with dependencies. The first unit proves the environment (G11).
10. Actions that go through the owner (G10).
11. The guarantees from `guarantees.md`, copied unchanged, each with the how decision that meets it.
12. The how decisions.
13. Risks and how each is handled.
14. Fixes after delivery (G12).
15. Open items for the owner, when there are any.
16. The name and version of this skill, read from `${CLAUDE_SKILL_DIR}/../../.claude-plugin/plugin.json`.

Match the rigor to the cost of being wrong. A small deliverable meets a guarantee with a simple mechanism, for example an acceptance checklist approved by the owner. A guarantee can be marked "does not apply", with the reason recorded. Guarantees G01 to G05 always apply.

Done when all 16 items are in the spec.

### 5. Check

Check the whole spec against these criteria.

- Every requirement has an identifier and a verifier, with no vague terms.
- Every guarantee has a how decision and proof, or the reason for "does not apply".
- Every how decision has dated sources.
- Each thing has a single name.
- Nothing depends on the writing conversation.

Then ask a clean-context reader, with no access to this conversation, to read only the spec and list the questions they would have before carrying it out. Each question becomes a fix to the spec or a question for the owner.

Done when all criteria pass and every reader question has a destination.

### 6. Deliver

Save the spec at its destination. Tell the owner the file path, the open items, and what was not verified. Execution starts later, at the owner's decision, in a new session that reads only the spec.
