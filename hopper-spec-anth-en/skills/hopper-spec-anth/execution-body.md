## 0. What this document is

It says how the work is carried out and proven. The body, sections 1 to 14, serves any project. The annex, at the end, holds what belongs only to {{PROJECT}}.

It does not say what the product does. That goes in each project's product spec.

In another project, the body is copied untouched. The product spec and the annex are written anew.

This document holds only the rules in force today. When a rule changes, the point is rewritten. The history and the reasons go in the project's decision record.

It is the only source of the rules for execution and proof. It stands alone, and no earlier spec template, skill, or rule ranks above it. The decision record keeps where each rule came from and is not cited as a rule. Whoever applies or explains a rule cites the section of this document. A rule missing here enters here, through section 14, and does not stay only in the decision record.

**Terms**

- **Mission.** The task given to 1 executor agent.
- **Proof.** The test, or the set of tests, that shows the change works.
- **Trunk.** The code already accepted, from which every mission starts.
- **Final tree.** The code exactly as it will go in, after the last change.
- **Screen.** The unit of use of the product. In a product without screens, it is the function the person uses, and the annex says which.
- **Whole product.** All the product's tests, on all its platforms.
- **Internal delivery.** The test version that goes only to the owner.
- **Merge.** The entry of proven fixes into the trunk. It can happen several times between 2 internal deliveries.
- **Case group.** The test cases that run together in 1 call to the test machine.
- **Lane.** A queue of missions that runs alongside others, without competing for the same test machine.
- **Proof tooling.** The class map, the gate, the scripts that run and read the tests, and the test runner configuration.

## 1. Central rule

**Proof is proportional to the change.** No step runs if its result cannot change a decision.

The method has 3 steps. Fix everything that is mapped. Prove only what was fixed. Test the whole product 1 time, at the end.

Fixing a small part and testing the whole product is the example of what this document forbids.

## 2. Change classes and the proof for each

Every change has 1 class. The class comes from the files touched, through a map recorded in the repository and read by a script. The executor does not choose the class.

- **Class A. Test or documentation only.** Proof: the touched tests, 1 time. No product proof is repeated. A support file used by several tests, such as a base class, helper, seed, or simulator, takes the touched tests and 1 case from each test group that uses the support.
- **Class B. 1 screen.** Proof: the cases of what changed, on the platforms where it changed.
- **Class C. A part used by several screens**, such as a field, button, or navigation. Proof: the cases of what changed and 1 case from each screen that uses the part. The sample of 1 case per screen is fixed, lives in the annex, and runs 1 time per merge, not in each mission.
- **Class D. Data and security.** The annex lists the paths. Proof, in 3 parts. The whole data test package, when the package changed. The screen cases of the data requirements touched, when the touched data code is outside the package. The test against the real service, with a test account, when the product depends on an external service.
- **Class E. Version**, or a change of build tool, library, or system. Proof: the whole product, 1 time, on the final code.

**Map rules**

- A change that touches more than 1 class takes the proof of each class touched, without repeating a case. The review is that of the highest class.
- In a file that mixes screen and data, the map lists the data functions. A change that touches one of them is class D.
- A file the map does not know gets its class from the orchestrator, on the spot, before the proof. The orchestrator fixes the map later, in a mission of its own.
- The class and the proof use the map and the scripts of the trunk, never those of the delivery.
- The list of cases for each proof comes written in the mission. The executor may add a case and may not remove one.
- The mission's cases have a ceiling of machine time, set in the annex. A list that exceeds the ceiling shows a mission that is too big.

**Proof tooling.** A change to the map, the gate, the proof scripts, or the test runner configuration is a mission of its own, separate from the product code, with 1 reviewer, who reads the change before it goes in. Its proof shows 2 things. The tooling passes 1 correct case and fails 1 deliberately wrong case for each rule the change touched. A gate that did not run counts as a rejection.

## 3. When each proof runs

- **In the mission.** The defect's cases, before and after the fix.
- **At the merge.** 1 build, on all the product's platforms. A class B fix does not repeat the proof, unless 2 deliveries in the same merge touch the same screen. Class C and D fixes repeat the proof on the merge tree. The data package proof is not repeated when its inputs, listed in the annex, are the same as those of the tree it ran on.
- **Before each internal delivery.** The short walkthrough of the main use, 1 time per delivery, not at each merge. It goes through the main use end to end and 1 time through each main screen. The annex lists the cases.
- **At the end of the version.** The whole product, 1 time. It runs on the tree from its start. What enters afterwards follows its class and does not send cases back to the battery.

A proof holds for the tree it ran on. **An empty proof is a failure.** If any case on the list did not run or was skipped, the proof failed. A skipped case only counts if it is on the trunk's list of planned skips, with the reason and who authorized it.

After the whole product, each fix follows its class. The whole product only runs again for a class E change.

No approved case runs again without a change that touches it. The exceptions are the proofs in this section.

## 4. What to do with each failure

**4.1 Severe defect.** Data loss, wrongly written data, a security flaw, a product that does not build or does not open, and the main use of a screen broken. Only a severe defect interrupts the queue. It is fixed before anything else.

**4.2 Other product defects.** They enter the queue by severity. The order is function, visual, accessibility, and performance.

**4.3 Flaky test or machine failure.** The script checks the environment and repeats the failed test 1 time, alone. If it passes, the operator reads the failure log. If the log points to the product, the failure is a defect. If it does not, the test goes to quarantine, and the delivery proceeds.

- **A class D test does not enter quarantine.** The failure of a data or security test counts as a severe defect until the log shows the cause, even if it passes on the repeat.
- The quarantine is 1 list, with the test, the probable cause, who fixes it, and the 7-day deadline.
- A quarantined test keeps running, outside the block. A disabled test hides defects.
- It leaves quarantine when, after the fix, it passes 3 times in a row in the normal runs, under the condition in which it failed.
- An expired quarantine becomes a defect in the queue.

**4.4 Wrong test.** If the product is right and the test is not, the test is fixed, with the proof in hand. The proof is the screen frame, the element tree, or the log.

- What the product spec requires is frozen, not the test file.
- The fixed test keeps checking the same requirement. Fixing is not deleting the check.
- The expected value only changes to what the product spec says.
- The operator checks the proof at the merge. Whoever fixes the test does not approve the fix.
- A fix that removes a check, skips a case, or raises a time limit goes to 1 reviewer before it goes in.

**4.5 Inconclusive failure.** The operator reads the failure again with the screen recorded, 1 time. If it remains inconclusive, the failure enters the queue as a defect to be measured. The other fixes do not wait for this reading.

**4.6 Escaped defect.** It is the defect found after the class proof, in a part that changed in the version, by the short walkthrough, by the whole product, or by the owner. A screen or part with 2 escaped defects in the same version starts running all its tests 1 time per merge that touches it, until the end of the version.

## 5. What a mission looks like

- **Small.** 1 defect, or 1 group of defects with the same cause. Before fixing, the affected part is surveyed whole, and everything is fixed at once. Different defects that the same test case covers go in the same mission, because the case only passes with all of them fixed.
- **Executable done.** The mission carries the command that proves done and the cases that must pass.
- **Checked before it leaves.** The operator only launches a mission that carries a single cause, a proof command, a case list, a marked area, and a reserved machine. If an item is missing, the operator returns it to the orchestrator.
- **Reproduces before fixing.** The operator reproduces the queue's cases in a group, by script, on the trunk, before the mission exists, and keeps the failure. An item whose cases pass closes as "already passes". The mission starts from the kept failure. A defect without a test first gets the failing test, recorded before the fix. The test stays.
- **Marked area.** The mission says which folders it may touch. Outside them, nothing changes.
- **Short time.** The annex sets the work limit. Waiting for the test machine does not count.
- **Close on the final tree.** The final proof runs only the mission's cases, 1 time, after the last change.
- **Exit per item.** An item that does not close leaves the tree, and the mission delivers what it proved.
- **Attempt limit.** Each mission design has up to 2 attempts. After them, the orchestrator reads the measurement and makes 1 new design. An item that does not close in 2 designs goes to the owner's list, with the measurement. The queue does not wait for the owner's answer.
- **Honest exit.** The executor can answer "I could not, this is missing" or "the test seems wrong". That answer is worth more than a forced delivery.
- **Triage or measurement mission.** It does not change code. Its done is the cause with the evidence, or "inconclusive".
- **A gate instead of a request.** A script rejects a delivery that changes or deletes an existing test outside the mission's list, that touches a folder outside the marked area, proof tooling, a secret, or data without being class D, or that carries a publish command. The request guides the agent. The gate rejects the delivery that does not comply.

## 6. Building a new product or function

- **Product spec first.** Each requirement says what has to be true and how it is checked.
- **Environment proven first.** Before the 1st function, the project builds, runs 1 test, and generates 1 empty internal delivery on each of the product's platforms.
- **Usable slices.** The work is cut into slices. Each slice is 1 function or 1 screen that the owner can use. The 1st slice goes through the main use end to end.
- **Data before screens, within each slice.** In each slice, the data part comes first, with a test that runs without a screen. The slice's screen comes after.
- **Close by class.** Each slice closes with its class proof. No slice closes with the whole product.
- **Internal delivery at each finished slice.** The owner's use finds early what the test does not find.
- **New function in an existing product.** Before the mission, the product spec gains the function and the way to check it. A structural change also gains a recorded decision.

## 7. Parallel work

- Parallel lanes, with 1 mission per lane. The number of lanes is what the test machine can bear, measured. It lives in the annex.
- The proof of a fix goes ahead of any battery. During the whole product at the end of the version, it enters between 2 case groups, 1 per lane, and never interrupts a group in progress.
- 2 missions that must touch the same file do not run at the same time.
- If 2 fixes conflict at the merge, the one that arrived later stays out. It comes back as a short mission, which reapplies the fix on the new trunk and runs only its cases. Nobody resolves a conflict by hand.
- The queue is 1 file only, and each item in it has 1 person in charge at a time.

## 8. Review

- **Class D.** 2 reviewers without context, before the merge. They receive the change, the requirement, and the proof log, and read the tree. They do not receive the executor's summary. The reviews start together with the proof.
- **Class C.** 1 reviewer, with the same material. The review runs in parallel and does not hold the merge.
- **Proof tooling.** 1 reviewer, before the change goes in.
- **Classes A and B.** No separate review. The class proof is enough. The exception is the test fix of section 4.4.
- **End of version.** 1 review reads everything that changed in the version, against the product spec. It does not reread what did not change.

The reviewer checks the change against the requirement. The reviewer does not give opinions on style. What the reviewer finds enters the queue by severity, like any defect.

## 9. Roles and who decides

- **Owner.** Decides what is external, irreversible, costs money, or changes what the product does.
- **Orchestrator.** Reads the facts, decides, and orders. Does not write code.
- **Operator.** Checks and launches the missions, runs the proofs, and merges the deliveries into the code.
- **Executor.** Carries out the mission. Does not decide that it is done.
- **Reviewer.** Checks the change against the requirement.

**What goes through the owner**

- Distribution to outside people and publication open to the public.
- Spending outside the plan.
- Deleting data or touching the owner's real data.
- A change in what the product does.
- The list of what is left for the next version.
- The AI model for each role. The annex records the default and when it is asked again.

The orchestrator decides the rest and reports afterwards. This includes the internal delivery, publication the owner has already released by rule, opening and swapping sessions, the order of the queue, and the design of the missions.

**Session swap.** An AI session that has filled its context 2 times is swapped right before the 3rd time. The orchestrator writes the conversation record, writes the handoff, and opens the replacement, without asking. This applies to all sessions, including the orchestrator's own. The annex says how it is measured and with which tool the record is written.

**Messages to the owner.** Only results, new decisions, or failures that change what the owner does. The conclusion comes first, in plain language.

## 10. Delivery

- **Internal delivery** of the proven and merged fixes, after the short walkthrough, without waiting for the end of the version. The orchestrator decides the time, at the pace set in the annex.
- **What the owner finds in use** enters the queue ahead of what the tests found, after severe defects.

**Version close**

- Zero severe defects.
- The mapped list fixed, or postponed by the owner's decision.
- The whole product run 1 time, with each failure handled by section 4 and proven by class.
- Quarantine empty, or postponed in the same list.
- 1 review of what changed in the version.

## 11. New tests

This applies to what is written from now on. Existing tests are not rewritten because of this section.

- Logic stays outside the screen, in code that is tested without opening the screen. That test runs in seconds.
- Visual states, such as empty screen, error, dark theme, and larger text, go to image comparison.
- Screen tests are kept for what exists only on the screen, such as gesture, focus, navigation, screen reading, accessibility audit, system integration, and the main use end to end.
- A screen test waits for a state, never for a fixed time.
- A new test enters with its time measured and with its own time limit.

## 12. Measures

Measures at each version. The starting numbers and the targets live in the annex.

1. Missions that enter the code, over those launched.
2. Time from a defect found to the internal delivery that carries the fix.
3. Failures caused by the test or the machine, over the failures read.
4. Times the whole product ran in the version.
5. Test machine time in new cases or in fix proofs.
6. Duration of the whole product.
7. Defects that escaped, by the definition in section 4.6, split by who found them, among short walkthrough, whole product, and owner.
8. Tests in quarantine and expired quarantines.

A rule in this document that does not improve its measure in 2 versions leaves or is replaced, through section 14. Section 13 is outside this rule. A new mechanism only enters with a measure that justifies it.

## 13. What never changes

- A change in data always takes the class D proof.
- Passwords, keys, and real data stay out of the repository and the tests.
- The tests do not use the owner's real data or real paid services.
- The executor has no reason to read secrets. Only the official scripts read them. The gate flags the reading after the mission, and the key that was read is replaced.
- Nothing private enters a public repository.
- The executor does not decide that it is done.

## 14. How this document changes

- During a version, it only changes by the owner's decision, recorded.
- The change rewrites the point. New text is not stacked on top of the old.
- The annex changes when the project changes, such as when the machine, the folder, or the script changes.
