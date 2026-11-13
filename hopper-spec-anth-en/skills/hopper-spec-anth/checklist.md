# Checklist

Check the 2 documents against each item, in order. A failing item is fixed, and the list runs again until all pass. Note the result of each item for the report in step 7.

## Body

1. The command below answers "body identical". The only accepted difference is a change decided by the owner and recorded in section 2 of the product spec, with the owner's words and the date.

   ```sh
   sh "${CLAUDE_SKILL_DIR}/scripts/body.sh" check "<product name>" docs/execution-spec.md
   ```

2. The execution spec has the header, the body only 1 time, and the annex after the body, with the heading starting with `# Annex`.

## Annex

3. Sections A1 to A7 are present, with the headings and the order from [annex.md](annex.md).
4. Each row of the table "What the body leaves to the annex", in [annex.md](annex.md), has an answer in the indicated section.
5. A3 has 1 subject for each requirement area of the product spec, with the identifiers. No subject left without the owner's word, recorded in section 2 of the product spec.
6. Every number in the annex has a source, which is a measurement, an answer from the owner, or a dated official page, or is marked "to be measured" with the moment of measurement.
7. Every path and every command in the annex exists in the project or is marked "to be built".
8. A6 carries the model and effort of each role, with the source, and when the standard is asked again. The data reviewer comes from a different model than the one that writes the data fixes.

## Product spec

9. Sections 1 to 8 are present, with the headings and the order from [product-spec.md](product-spec.md).
10. Each requirement has a unique identifier, what has to be true, how it is checked, and edge cases. A quantity has a number and a unit, and no vague term remains without a number.
11. The main use is covered end to end by the requirements.
12. When the product stores data, there are data and security requirements in an area of their own.
13. Section 5 has the 4 mandatory items from the template.
14. Each how decision has "Serves", "Choice", "Alternatives", "Sources" with a date, "Reason", and "Proof". The 6 mandatory decisions from the template are present.

## The 2 documents

15. The execution spec has up to 150 lines. No line of the annex or the product spec repeats a body rule, explains why a rule exists, or recaps another section.
16. Each owner decision is in section 2 of the product spec, with the date and the owner's words. Each recommendation adopted without an answer is marked "pending confirmation".
17. Each thing has 1 name only, the same in the 2 specs and in the glossary.
18. The sources cited are only the project, the owner, and the pages consulted. The skill appears only in the 2 headers, with its name and version.
19. No text from the templates' fictional examples appears in the documents, such as "Recipe Notebook".
20. The 2 documents are in English, and the 2 headers say they are drafts for the owner's approval.

## Reader without context

21. Last, 1 subagent without access to this conversation reads only the 2 documents and the project and lists what would keep it from starting the execution. Each doubt becomes a fix in the documents or a question to the owner, and the list runs again on the affected items. A doubt about the body becomes a note in the report, because the body does not change.
