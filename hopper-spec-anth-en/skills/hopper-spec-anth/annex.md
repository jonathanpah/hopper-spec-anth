# Execution spec and annex template

The execution spec has 3 parts, in this order. The header, the general body, and the project annex. The body comes from the script. You write the header and the annex. The examples come from the fictional app "Recipe Notebook" and show only the form.

## Contents

1. The file before the script
2. What the body leaves to the annex
3. The annex sections, A1 to A9

## 1. The file before the script

Write the file like this and then run `body.sh insert`, as step 5 of SKILL.md says.

```markdown
# Execution spec

Draft of <date>, written by the hopper-spec-anth <version> skill, with the general body unchanged, for the owner's approval. It applies to <product name> on the date of approval, recorded in <path of the decision record>, until the owner changes it.

{{BODY}}

# Annex of <product name>

## A1. Project documents
...
## A9. Checks outside the tests
...
```

The annex heading always starts with `# Annex`, because the check script stops there.

## 2. What the body leaves to the annex

The annex answers each item below. The checklist reads this list.

| Body section | What the annex holds | Where |
| --- | --- | --- |
| 0 and 11, approval and change | The project's decision record | A1 |
| 2, subjects | 1 subject per product spec function, and what the owner removed | A8 |
| 2, checks | The checks that left the tests and the ones kept in a cheap version | A9 |
| 3, platforms | The platforms, the test machine, and its slots | A2 |
| 3, sweep script | The script that launches the sweep and the runs that only measure and waits for a free slot and free memory | A2 |
| 3, 30-minute target | The number of subjects and cases and the duration of the sweep | A6 |
| 4, problem list | The problem list of each sweep, with the "Test failure, not a product failure" section | A1 |
| 4, tool failure | The known causes of test-tool failure and the check that tells each one apart from a product problem | A8 |
| 5, build and data package | The commands to build on each platform and to run the data test package | A8 |
| 5, real service | The test against each real external service, with the test account | A8 |
| 5, mission | The run folder and the script that launches the mission and stops the executor at 60 minutes | A2 |
| 7, delivery | The path of the internal version, what is already released, and what waits for the yes | A3 |
| 7, publication | The steps of each publication | A7 |
| 8, models | The standard AI model for each role and where the orchestrator's is | A5 |
| 8, sessions | The session handover rule, when the project has one, and the sessions' permission mode | A6 |
| 10, secrets | Where each secret lives, who reads it, which is the official script or the operator in the step that names the key, and the check after the mission | A4 |

## 3. The annex sections

The headings and the order are fixed. Each section uses the 3 marks from SKILL.md, which are "to be measured", "to be built", and "pending confirmation". A section with no content in the project says "None" and the reason, for example "No external service".

Each section carries only project facts, in a short list, of 1 to 8 lines. The reasons behind the rules and the body's rules stay out of the annex.

### A1. Project documents

The path of each document, with the "to be built" mark when it does not exist yet.

- The product spec and the execution spec.
- The decision record.
- The project instructions for agents, such as `AGENTS.md` or `CLAUDE.md`.
- The problem list of each sweep, with the "Test failure, not a product failure" section, from section 4 of the body.
- The session records.

### A2. Platforms and machines

- Each platform of the product, such as web, iPhone, or Android.
- The test machine of each platform, its slots, and at what hours it is free.
- What to do when a machine goes offline, with the work that continues on the others.
- The script that launches the sweep, the runs that only measure, and the missions, which waits for a free slot and free memory and stops the executor at 60 minutes. While it does not exist, it stays "to be built".
- The folder of each run, from section 5 of the body.

### A3. Delivery

- **Internal version.** How the version from the end of each round reaches the owner on each platform, by the delivery how decision.
- **Released without asking.** What the owner released to the outside, with the date and the owner's words. With no release, "None".
- **What waits for the yes.** Each channel to outside people and to the public, by name, such as the app store.
- **Version number.** Where it lives and how it changes.
- **Outside deadlines.** Expiry of test versions, account renewals, and other service deadlines, with the source.

### A4. Accounts and secrets

For each outside service, 1 item.

- Who owns the account and who pays.
- The test account used by the tests.
- Where the key lives, outside the repository, with the file permission.
- Who reads it, without printing, which is the official script or the operator in the annex step that names the key, and the script that checks the reading after each mission.
- What stays only with the owner, such as the password, confirmation codes, and payment.

### A5. AI models for each role

The standard, with the source, which is the owner's answer or the recommendation "pending confirmation".

- Orchestration. The owner always sets the model and the effort, by section 8 of the body. Say where the last one the owner set is.
- Operation of the tests and the publication.
- Code writing, with the fixes, the new functions, and the test repairs. Say the isolation the executor runs in, such as the tool's sandbox, and the owner's authorization when it runs without that isolation.
- Review of the fixes that touch data, by a different model from the one that wrote them, by section 6 of the body.
- Failure triage and research.

Each role carries the exact model name and the effort, as the environment shows. Also say when the standard is asked again. The usage limit of the subscriptions is the owner's decision, by section 8 of the body, and the annex carries no fallback model for it.

### A6. Sessions and starting numbers

- The session handover rule, with what is measured, the tool that writes the conversation record, and how what the session launched keeps running after the handover. With no rule in the project, "None. The orchestrator decides, by section 8 of the body".
- The permission mode the sessions open in, with the owner's authorization when it skips the permission prompts.
- The number of subjects, the number of cases, and the duration of the sweep.
- The number of tests and the duration of the data test package.

In a new project, the numbers stay "to be measured in the 1st sweep".

### A7. Publication

- The steps of each publication, in order, with the command for each one. With no publication in the 1st version, "None" and the reason.
- What the owner released for publication without asking, with the date and the owner's words, when it exists.
- The check of the published address or channel.
- The limit of each version, when the owner sets one, and the version that takes an old defect found along the way.

### A8. Tests: where and how to run them

- 1 subject per product spec function, with the requirement identifiers. Every function is covered, even without use in the owner's data.
- What the owner removed, with the date and the owner's words. With no removal, "None".
- The file with each subject's cases, when it exists.
- The commands to build on each platform, to run the data test package, and the full battery. While they do not exist, they stay "to be built".
- The test against each real external service, with the test account from A4. With no service, "None".
- The known causes of test-tool failure on each machine, with the check that tells each one apart from a product problem. In a new project, "None known".

Example of form.

```markdown
## A8. Tests: where and how to run them

- Recipes, RE-01 to RE-06. Search, SE-01 to SE-03. Shopping list, SL-01 to SL-04.
- The owner removed no subject.
- The cases live in `tests/subjects.json`, to be built.
```

### A9. Checks outside the tests

- The checks that are not product functions and left the tests, such as the screen reader or comparing the screen with reference images, by the owner's answer.
- The ones kept in a cheap version and how each one runs. With none, "None".
