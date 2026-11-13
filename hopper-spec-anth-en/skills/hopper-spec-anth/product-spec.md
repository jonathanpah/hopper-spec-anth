# Product spec template

The product spec says what the product does. How the work is carried out and proven goes in the execution spec. The structure below is fixed, with the sections, the headings, and the order. The content comes from the project and from the owner's answers. The examples come from the fictional app "Recipe Notebook" and show only the form.

## Contents

1. Header
2. Section 1, Objective
3. Section 2, Owner decisions
4. Section 3, Glossary
5. Section 4, Requirements
6. Section 5, What must never happen
7. Section 6, What stays out
8. Section 7, Product how decisions
9. Section 8, Product risks

## Header

```markdown
# Product spec: <product name>

Draft of <date>, written by the hopper-spec-anth <version> skill, for the owner's approval. It takes effect on the date of approval, recorded in <path of the decision record>, with no end date, until the owner changes it. This document says what the product does. How the work is carried out and proven goes in the [execution spec](execution-spec.md).
```

The skill version is in the `version` field of `${CLAUDE_SKILL_DIR}/../../.claude-plugin/plugin.json`.

## 1. Objective

1 paragraph with what the product delivers, for whom, on which platforms, and the observable result that closes the 1st version.

## 2. Owner decisions

| Date | Decision | Owner's words |
| --- | --- | --- |
| 11/13/2026 | Only the owner uses the 1st version, without a store | "yes" |
| 11/13/2026 | Pending confirmation. Test version at each finished part | Recommendation adopted without an answer |

The decisions in the request and each answer from step 3 go here. A recommendation adopted without an answer carries "Pending confirmation" at the start of the decision.

## 3. Glossary

| Name | Meaning |
| --- | --- |
| Recipe | Text with a title, ingredients, and steps, stored by the app |

Each thing has 1 name only, used the same way in the 2 specs, in the visible texts, in the tests, and in new code. In a product without screens, the glossary says which function counts as a screen, because the execution spec uses that term.

## 4. Requirements

Open the section with these rules, adapted to the project.

- Each requirement has a stable identifier, with 2 letters for the area and the number, such as `RE-01`. An identifier is never reused.
- The tests carry the identifier in the name, such as `test_RE_01_createRecipe`.
- Each requirement says what has to be true and how it is checked.

Group the requirements by area, in numbered subsections, with this table.

### 4.1 Recipes

| ID | What has to be true | How it is checked | Edge cases |
| --- | --- | --- | --- |
| RE-01 | "New recipe" saves the recipe with title, ingredients, and steps, and it appears at the top of the list within 1 s | Test without a screen for saving. Screen test that creates and checks the list | An empty title does not save. A 200-character title saves whole |

Rules for each row.

- **What has to be true.** 1 behavior, in active voice, observable from outside. A quantity has a number and a unit. A vague term, such as "fast", "easy", or "adequate", becomes a number or leaves.
- **How it is checked.** The kind of test and the condition. Logic is checked by a test without a screen. A visual state, such as an empty screen, an error, the dark theme, and larger text, by image comparison. Gesture, focus, navigation, screen reading, accessibility, and the main use end to end, by a screen test. A requirement that depends on an outside service says whether the test uses a simulator or a test account.
- **Edge cases.** The limits and failures the test also covers.

Mandatory requirements.

- The main use, end to end, in requirements that the 1st slice covers.
- Saving, reading, syncing, and security of data, when the product stores data, in an area of their own. Their code goes in the class D paths of the annex.
- Each platform of section 1, when the rule changes by platform.

## 5. What must never happen

A numbered list with what is forbidden in any version. Always include these items, adapted to the product, and add the project's own.

1. Losing, duplicating, or corrupting a user's data.
2. Using the owner's real data or a real paid service in the tests.
3. Writing a password, key, or real data into the repository, a log, or the tests.
4. Distributing to outside people, publishing to the public, spending outside the plan, or deleting real data without the owner's "yes".

## 6. What stays out

A list of what does not enter the 1st version, with the owner's answers, for example "Sharing recipes with other people."

## 7. Product how decisions

Each technical choice from step 4 has 1 block.

```markdown
**DC-01. Architecture.** Serves RE-01 to RE-09. Choice: <what was chosen>. Alternatives: <the options considered>. Sources: <official page, consulted on <date>>. Reason: <why it won>. Proof: <the requirement or test that shows it works>.
```

Mandatory decisions.

- Architecture and language.
- Project and folders. Its paths form the classes in annex A3.
- Tests for each layer, with the tools.
- Data storage and file format, when the product stores data.
- Internal delivery, with the path to the owner. It forms annex A5.
- Secrets, with where each key lives and who reads it. It forms annex A6.

A source without access at writing time stays as "writer's memory, unconfirmed", with 1 row in section 8.

## 8. Product risks

| Risk | Treatment |
| --- | --- |
| The store changes its review rule before the 1st publication | Check the rule in the official documentation before asking for the owner's "yes" |

Include the technical risks of the how decisions and each unconfirmed source.
