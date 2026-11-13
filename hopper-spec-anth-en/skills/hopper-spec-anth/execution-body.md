## 0. What this is

This is the only source of the rules for how {{PROJECT}} is tested and fixed. It holds by the owner's decision, from the approval recorded in the header. What the product does is in the product spec. What belongs only to this project is in the annex, at the end.
The orchestrator is the AI session that leads the work. The executor is the session that writes each fix.
A subject is a product function, with its test cases. A round is each set of fixes that follows a sweep.

## 1. The model, in 8 steps

1. Choose what makes sense to test, by section 2.
2. Run the sweep of the whole product.
3. Separate test failures from product problems. Classify the problems as big or blocking, medium, and small.
4. Fix the big ones, 1 at a time. Test only that fix and move to the next.
5. Fix the medium ones, the same way.
6. Run a new sweep. If a big one appears, go back to step 4. If a medium one appears, go back to step 5 and repeat the sweep.
7. With no big or medium ones, fix the small ones, 1 at a time.
8. Close.

In every step, once 1 problem is fixed, only that fix is tested, by section 5. Exhaustive, giant testing, never.

## 2. What the tests cover

Every product function is covered, even when the owner's data does not show it in use yet. Only the owner removes or adds a subject.
What the owner removed is in annex A3, with the date and the owner's words.

## 3. The sweep

The sweep is broad and shallow. It tests up to 3 cases of each subject on each platform, along the main path. It runs on all the platforms in annex A2 at the same time.
The data test package runs alongside it, without opening a screen.
The target is up to 2 hours. The orchestrator chooses the cases and cuts whatever goes past the target, without asking the owner.

## 4. Classification

A test failure with the product right is not a product problem. The test leaves the sweep and goes to a list. It is fixed only when the sweep needs it.

- **Big or blocking.** It prevents the use of a function, loses data or saves it wrong, presents a security flaw, or the product does not build or does not open.
- **Medium.** It gets in the way of use, but there is a way around it.
- **Small.** It is a detail.

The orchestrator classifies. The owner can reclassify.

## 5. The test of each fix

The cases that showed the problem run, plus all the other cases of the same subject, up to 15 minutes of machine time.
Plus 2 cheap checks. Build on all platforms, always. Run the data test package when the fix touches data code.
The test against a real external service, with the test account in annex A5, runs only when the fix changes the calls to that service.
Passed, next fix. Not passed in 2 attempts, the problem goes to the end of the round, with the measurement.

## 6. Review

Only a fix that touches data has 1 independent reviewer, from another AI model. The reviewer reads the change without the summary from whoever wrote it. The review runs in parallel. A serious finding becomes a big problem.

## 7. Delivery

At the end of each round, an internal version ships by the path in annex A4, without asking permission. A version for outside people and publication to the public only with the owner's yes, except what annex A4 records as already released by the owner.
The full battery, with all the product's tests, and the battery against a real external service run 1 time per version.

## 8. Who decides

The owner decides what is external, irreversible, costs money, or changes what the product does. The owner also decides the list of tested subjects.
The orchestrator decides everything else and reports afterward. It chooses the cases and the size of the sweep, the classification, the order of fixes, the sessions, and the models within the standard in annex A6. It does not take execution decisions to the owner.

## 9. Messages to the owner

Conclusion first. Only what is essential. Short sentences and paragraphs, 1 idea at a time, without jargon and without recapping.
Real open items go at the end, numbered. Each one states what is open, the recommendation, and what is needed from the owner.

## 10. What never changes

- A change to data always gets the tests of section 5.
- Passwords, keys, and real data stay out of the repository and the tests.
- The tests do not use the owner's real data or real paid services.
- The executor has no reason to read secrets. Only the official scripts in annex A5 read them. A key read outside them is replaced.
- Nothing private goes into a public repository.
- Whoever executes does not decide that the work is done.

## 11. How this document changes

It changes only by the owner's decision, recorded. The change rewrites the point.
