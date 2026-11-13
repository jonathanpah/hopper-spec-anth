# Execution spec and annex template

The execution spec has 3 parts, in this order. The header, the general body, and the project annex. The body comes from the script. You write the header and the annex. The examples come from the fictional app "Recipe Notebook" and show only the form.

## Contents

1. The file before the script
2. What the body leaves to the annex
3. The annex sections, A1 to A10

## 1. The file before the script

Write the file like this and then run `body.sh insert`, as step 5 of SKILL.md says.

```markdown
# Execution spec

Draft of <date>, written by the hopper-spec-anth <version> skill, with the general body unchanged, for the owner's approval. It applies to <product name> on the date of approval, recorded in <path of the decision record>, with no end date, until the owner changes it.

{{BODY}}

# Annex of <product name>

Everything from here down applies only to <product name>. In another project, this part is written anew.

## A1. Project documents
...
## A10. What is left to build
...
```

The annex heading always starts with `# Annex`, because the check script stops there.

## 2. What the body leaves to the annex

The annex answers each item below. The checklist reads this list.

| Body section | What the annex holds | Where |
| --- | --- | --- |
| 0, term "Screen" | What counts as a screen, and in a product without screens, the function that counts | A2 |
| 0, term "Whole product" | The product's platforms | A2 |
| 2, classes | The paths of each class, on each platform, and the map read by a script | A3 |
| 2, class A | The test support files | A3 |
| 2, class C | The fixed sample of 1 case per screen | A2 |
| 2, class D | The data and security paths, the mixed files, and the real service with a test account | A3 and A6 |
| 2, map rules | The machine time ceiling for a mission's cases | A4 |
| 2, proof tooling | The paths of the map, the gate, the proof scripts, and the test runner configuration | A3 |
| 3, merge | The inputs of the data package proof | A3 |
| 3, internal delivery | The cases of the short walkthrough | A2 |
| 3, empty proof | The trunk's list of planned skips | A1 and A2 |
| 4.3, quarantine | The quarantine list | A1 |
| 5, short time | The work limit of a mission | A4 |
| 5, attempt limit | The owner's list | A1 |
| 7, lanes | The number of lanes, measured | A4 |
| 7, queue | The single queue file | A1 |
| 9, roles | The AI model for each role, and when it is asked again | A7 |
| 9, who decides | The publication the owner has already released by rule | A5 |
| 9, session swap | How context use is measured and with which tool the conversation record is written | A1 |
| 10, delivery | The pace of the internal delivery | A5 |
| 12, measures | The starting numbers and the targets | A9 |
| 13, secrets | Where each secret lives and the official script that reads it | A6 |
| 0 and 14, decisions | The project's decision record | A1 |

## 3. The annex sections

The headings and the order are fixed. Each section uses the 3 marks from SKILL.md, which are "to be measured", "to be built", and "pending confirmation". A section with no content in the project says "None" and the reason, for example "No outside service".

### A1. Project documents

The path of each document, with the mark "to be built" when it does not exist yet.

- The product spec and the execution spec.
- The project's decision record.
- The queue, in 1 file only.
- The quarantine list.
- The owner's list, with the items that did not close and what is left for the next version.
- The list of planned skips.
- The project's instructions for the agents, such as `AGENTS.md` or `CLAUDE.md`.
- The session records and the session swap, with the records folder, the tool that writes the record and the handoff, and how the times the context filled up and its use are measured.
- Other documents the project already has and that the execution consults.

### A2. Platforms, screens, and fixed cases

- **Platforms.** Each platform of the product, such as web, iPhone, or Android.
- **Screens.** Each screen, with the glossary name, or the function that counts as a screen.
- **Main use.** The product spec requirements that form it, by their identifiers.
- **Class C sample.** 1 case per screen, with the test name. While the tests do not exist, it stays "to be built", with the slice that creates each one.
- **Short walkthrough.** The cases that go through the main use end to end and 1 time through each main screen, on each platform. While they do not exist, it stays "to be built".
- **Planned skips.** Each case skipped on purpose, with the reason and who authorized it. At the start, "None".

### A3. Classes by path

Start with the map and the script that reads it. The map is the repository file that links each path to a class. While the 2 do not exist, they stay "to be built", and the orchestrator gives the class by reading this section.

Then, 1 block per platform, with the code folder and these items.

- **Class A.** The test and documentation folders, and the support files used by several tests, such as a base class, helper, seed, and simulator.
- **Class B.** The folder of each screen.
- **Class C.** The parts used by several screens, such as components, styles, navigation, and app configuration.
- **Class D.** The data and security paths. The mixed files, with the list of data functions in each one. The command of the data package proof and the inputs that decide whether it repeats at the merge. The test against the real service, with a test account, when it exists.
- **Class E.** The command of the whole product and the version, build, and library files.
- **Proof tooling.** The map, the gate, the proof scripts, and the test runner configuration.

Example of form, from a project without code yet.

```markdown
### A3.1 iPhone

Code in `app/ios/`, to be built, by DC-02 of the product spec.

- **Class A.** `app/ios/Tests/` and `docs/`. Support: `app/ios/Tests/Support/`.
- **Class B.** 1 folder per screen in `app/ios/Screens/`: `List`, `Recipe`, and `Search`.
```

### A4. Machines, lanes, and ceilings

- Where the tests of each platform run and at what hours the machine is free.
- What to do when a machine goes offline.
- The number of lanes per machine, measured. Until the 1st measurement, 1 lane per machine.
- The work limit of a mission.
- The machine time ceiling for a mission's cases.
- The size of a case group.
- The ceiling of the short walkthrough, per platform.
- The pace of cases per hour, per platform.

In a new project, the numbers stay "to be measured in the environment proof, section 6 of the body". The orchestrator records each number here before the 1st mission.

### A5. Delivery

- **Internal delivery.** How the test version reaches the owner, by the how decision for delivery, and the pace the owner chose.
- **Publications released by rule.** What goes out without asking, with the date and the owner's words. Without a release, "None".
- **What waits for the owner's "yes".** Each channel of distribution to outside people and of publication to the public, by name, such as the app store.
- **Version number.** Where it lives and how it changes.
- **Outside deadlines.** Expiry of test versions, account renewals, and other service deadlines, with the source.

### A6. Accounts and secrets

For each outside service, 1 item.

- Who owns the account and who pays.
- The test account the tests use.
- Where the key lives, outside the repository, with the file permission.
- The official script that reads it, without printing it.
- What stays only with the owner, such as the password, confirmation codes, and payment.

### A7. AI models for each role

The default, with its source, which is the owner's answer or the recommendation "pending confirmation".

- Orchestration.
- Operation of the tests, the merge, and the delivery.
- Execution, with code fixes, test fixes, and building.
- Code review and review against the spec.
- Failure triage and measurement.

Each role carries the exact model name and the effort, as the environment shows them. Also say when the default is asked again and what to do when a model's usage limit runs out.

### A8. Files with a checked sum

The reference data files that stay frozen, with the sum checked by a script, such as format examples, test vectors, and service simulators. Give the path of the sum list and the script that checks it. Changing a file on the list is a class D mission, and the sum is written again after the 2 reviewers.

In a new project, list the kinds that will enter, from the product spec, with the mark "to be built".

### A9. Starting measures and targets

The 8 measures of section 12 of the body, with the start, the target, and when each is measured.

| Measure | Start | Target | When it is measured |
| --- | --- | --- | --- |
| 1. Missions that enter the code, over those launched | to be measured | no target until the 1st measured version | at the end of the 1st version |
| 4. Times the whole product ran in the version | to be measured | 1, by section 3 of the body | at the end of the 1st version |

All 8 measures go in the table. Another project's target never serves as this project's target.

### A10. What is left to build

Open with the sentence "Until each item exists, the orchestrator and the operator do the step by hand, by sections A2 and A3." Then the numbered list, in order of need, with each "to be built" item from the other sections.

In a new project, the list starts like this.

1. The environment proof, by section 6 of the body. The project builds, runs 1 test, and generates 1 empty internal delivery on each platform. It records the numbers of A4.
2. The decision record, the queue, the quarantine list, the owner's list, and the list of planned skips.
3. The class map and the script that reads the trunk's map and returns the class and the proof of a change.
4. The comparison between the cases requested and the cases run, with the list of planned skips, so that an empty proof fails.
5. The merge gate.
6. The single repeat of the failing test and the quarantine, in the script that runs the case groups.
7. The short walkthrough and the class C sample, as the screens come to exist.
8. The collection of the 8 measures, 1 time per version.
9. The product slices, by section 6 of the body, each with the identifiers of its requirements. The 1st slice goes through the main use end to end.

Items 3 to 6 are proof tooling missions, by section 2 of the body. The orchestrator decides the order of the queue, by section 9 of the body.
