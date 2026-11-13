# Execution spec and annex template

The execution spec has 3 parts, in this order. The header, the general body, and the project annex. The body comes from the script. You write the header and the annex. The examples come from the fictional app "Recipe Notebook" and show only the form.

## Contents

1. The file before the script
2. What the body leaves to the annex
3. The annex sections, A1 to A7

## 1. The file before the script

Write the file like this and then run `body.sh insert`, as step 5 of SKILL.md says.

```markdown
# Execution spec

Draft of <date>, written by the hopper-spec-anth <version> skill, with the general body unchanged, for the owner's approval. It applies to <product name> on the date of approval, recorded in <path of the decision record>, until the owner changes it.

{{BODY}}

# Annex of <product name>

## A1. Project documents
...
## A7. Sessions and starting numbers
...
```

The annex heading always starts with `# Annex`, because the check script stops there.

## 2. What the body leaves to the annex

The annex answers each item below. The checklist reads this list.

| Body section | What the annex holds | Where |
| --- | --- | --- |
| 0 and 11, approval and change | The project's decision record | A1 |
| 2, subjects | 1 subject per product spec function, and what the owner removed | A3 |
| 3, platforms | The platforms and the machines that run the tests | A2 |
| 3, data package | The command of the data test package | A2 |
| 3, 2-hour target | The size and duration of the sweep | A7 |
| 4, test list | The list of failing tests and the list of classified problems | A1 |
| 5, build | The build command on each platform | A2 |
| 5, real service | The test account of each real external service | A5 |
| 7, delivery | The path of the internal version, what is already released, and what waits for the yes | A4 |
| 8, models | The standard AI model for each role | A6 |
| 8, sessions | The session handover rule, when the project has one | A7 |
| 10, secrets | Where each secret lives and the official script that reads it | A5 |

## 3. The annex sections

The headings and the order are fixed. Each section uses the 3 marks from SKILL.md, which are "to be measured", "to be built", and "pending confirmation". A section with no content in the project says "None" and the reason, for example "No external service".

Each section carries only project facts, in a short list, of 1 to 8 lines. The reasons behind the rules and the body's rules stay out of the annex.

### A1. Project documents

The path of each document, with the "to be built" mark when it does not exist yet.

- The product spec and the execution spec.
- The decision record.
- The project instructions for agents, such as `AGENTS.md` or `CLAUDE.md`.
- The list of classified problems and the list of failing tests, from section 4 of the body.
- The session records.

### A2. Platforms and machines

- Each platform of the product, such as web, iPhone, or Android.
- Where each platform's tests run, at what hours the machine is free, and how many builds run at the same time.
- What to do when a machine goes offline.
- The commands to build on each platform, to run the sweep, and to run the data test package. While they do not exist, they stay "to be built".

### A3. Tested subjects

- 1 subject per product spec function, with the requirement identifiers. Every function is covered, even without use in the owner's data.
- What the owner removed, with the date and the owner's words. With no removal, "None".
- The file with each subject's cases, when it exists.

Example of form.

```markdown
## A3. Tested subjects

- Recipes, RE-01 to RE-06. Search, SE-01 to SE-03. Shopping list, SL-01 to SL-04.
- The owner removed no subject.
- The cases live in `tests/subjects.json`, to be built.
```

### A4. Delivery

- **Internal version.** How the version from the end of each round reaches the owner on each platform, by the delivery how decision.
- **Released without asking.** What the owner released to the outside, with the date and the owner's words. With no release, "None".
- **What waits for the yes.** Each channel to outside people and to the public, by name, such as the app store.
- **Version number.** Where it lives and how it changes.
- **Outside deadlines.** Expiry of test versions, account renewals, and other service deadlines, with the source.

### A5. Accounts and secrets

For each outside service, 1 item.

- Who owns the account and who pays.
- The test account used by the tests.
- Where the key lives, outside the repository, with the file permission.
- The official script that reads it, without printing.
- What stays only with the owner, such as the password, confirmation codes, and payment.

### A6. AI models for each role

The standard, with the source, which is the owner's answer or the recommendation "pending confirmation".

- Orchestration.
- Operation of the tests and the delivery.
- Fixes, including test repairs.
- Review of the fixes that touch data, by a different model from the one that wrote them, by section 6 of the body.
- Failure triage and research.

Each role carries the exact model name and the effort, as the environment shows. Also say when the standard is asked again and which model takes over when another one's usage limit runs out.

### A7. Sessions and starting numbers

- The session handover rule, with what is measured and the tool that writes the conversation record. With no rule in the project, "None. The orchestrator decides, by section 8 of the body".
- The number of subjects, the number of cases, and the duration of the sweep.
- The number of tests and the duration of the data test package.

In a new project, the numbers stay "to be measured in the 1st sweep".
