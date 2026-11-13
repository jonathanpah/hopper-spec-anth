# Checklist

Check the 2 documents against each item, in order. An item that fails is fixed, and the list runs again until all pass. Note the result of each item for the report in step 7.

## Body

1. The command below answers "body identical". The only accepted difference is a change decided by the owner and recorded in section 2 of the product spec, with the owner's words and the date.

   ```sh
   sh "${CLAUDE_SKILL_DIR}/scripts/body.sh" check "<product name>" docs/execution-spec.md
   ```

2. The execution spec has the header, the body 1 time only, and the annex after the body, with its heading starting with `# Annex`.

## Annex

3. Sections A1 to A10 are present, with the headings and the order of [annex.md](annex.md).
4. Each row of the table "What the body leaves to the annex", in [annex.md](annex.md), has an answer in the section shown.
5. Every number in the annex has a source, which is a measurement, an owner's answer, or an official page with a date, or is marked "to be measured" with the moment of the measurement.
6. Every path in the annex exists in the project or is marked "to be built", with an item in A10.
7. Each platform in A2 has 1 block in A3, with classes A to E and the proof tooling. Each folder of the folder how decision falls in some class.
8. A7 gives the model and the effort for each role, with the source, and when the default is asked again.
9. A10 starts with the environment proof, and the 1st slice cites the requirements of the main use.

## Product spec

10. Sections 1 to 8 are present, with the headings and the order of [product-spec.md](product-spec.md).
11. Each requirement has a unique identifier, what has to be true, how it is checked, and edge cases. A quantity has a number and a unit, and no vague term remains without a number.
12. The main use is covered end to end by the requirements.
13. When the product stores data, there are data and security requirements, and their code falls in class D of A3.
14. Section 5 has the 4 mandatory items of the template.
15. Each how decision has "Serves", "Choice", "Alternatives", "Sources" with a date, "Reason", and "Proof". The 6 mandatory decisions of the template are present.

## The 2 documents

16. Each owner decision is in section 2 of the product spec, with the date and the owner's words. Each recommendation adopted without an answer is marked "pending confirmation".
17. Each thing has 1 name only, the same in the 2 specs and in the glossary.
18. The sources cited are only the project, the owner, and the pages consulted. The skill appears only in the 2 headers, with its name and version.
19. No text from the templates' fictional examples appears in the documents, such as "Recipe Notebook".
20. The 2 documents are in English, and the 2 headers say they are drafts for the owner's approval.

## Reader without context

21. Last, 1 subagent without access to this conversation reads only the 2 documents and the project and lists what would stop it from starting the execution. Each doubt becomes a fix in the documents or a question to the owner, and the list runs again on the affected items. A doubt about the body becomes a note in the report, because the body does not change.
