# Spec guarantees

Every spec copies this list unchanged. Each guarantee is a property that can be checked, not a mechanism. The mechanism that meets each one is a how decision, written in the spec. Guarantees G01 to G05 always apply. The others can be marked "does not apply", with the reason recorded.

Each guarantee states the reason behind it. A guarantee enters or leaves this list only on execution evidence.

## G01. The executor does not decide what is done

**Guarantee.** A requirement is done only when its verifier says so. The verifier is a program, a measurement, or the owner's approval, and the executor does not control it.

**Reason.** Without external verification, whoever does the work tends to miss their own mistakes and to declare it done without proof.

**Proof.** The spec names the verifier of each requirement and shows why the executor does not control it.

## G02. Verifiable requirement

**Guarantee.** Each requirement has a stable identifier, one sentence in the active voice, quantities with units, and its verifier. A vague term becomes a measure or is removed. A requirement without a verifier stays out of the spec.

**Reason.** A vague requirement accepts any delivery, and the executor fills the gap on their own.

**Proof.** The check of every requirement, done while writing the spec.

## G03. Frozen criteria

**Guarantee.** The executor does not change criteria, verifiers, or references. They may add verifiers, with a record. Changing or removing a verifier requires the owner. When a verifier fails, the executor fixes the deliverable, never the expectation.

**Reason.** Executors under pressure to finish have been known to change the very criterion that judges them.

**Proof.** The spec describes the protection mechanism and a change attempt that it blocks or detects.

## G04. Independent expectation

**Guarantee.** The expected result comes from a source other than the deliverable itself, for example the spec, an existing reference, or a separately computed example. Each new check fails without the change it covers.

**Reason.** A check that repeats the deliverable's own logic always passes and proves nothing.

**Proof.** Each verifier states the source of its expectation, and the failure without the change is recorded.

## G05. Proof recorded after the last change

**Guarantee.** What counts is the record of the verifiers' run, all run together after the last change, not the executor's report. What did not run is "blocked", never "passed". A check that checked nothing is a failure. A result that fluctuates is repeated until it shows stability.

**Reason.** Completion reports without a run and empty checks are the most common forms of false completion.

**Proof.** The spec says where the record is kept and how it shows how many checks ran.

## G06. Blocking and limits

**Guarantee.** Each requirement can be "blocked", with a reason, evidence, and a way to reproduce. Blocking is not a failure. Working around the verifier is. Attempts per failure, per unit, and per run have a finite limit, set in the spec. Review passes per stage also have a finite limit, set in the spec. Without progress, the executor stops that part and moves on to independent parts. A check that used to pass and now fails is a regression until proven otherwise.

**Reason.** Without an honest exit and without limits, the executor works around the verifier or retries endlessly.

**Proof.** The spec sets the limits and the format of the blocking record.

## G07. Questions become records

**Guarantee.** During execution, a question does not stop the work. If the spec has a rule for the case, the executor applies it and records it. If it does not, they block that part, move on to independent parts, and take the question to the owner at the point set in the spec.

**Reason.** Questions in the middle of execution stop the work, and unrecorded decisions get lost.

**Proof.** The spec defines where questions are kept and when the owner receives them.

## G08. Durable state and resumption

**Guarantee.** The plan, the status of each requirement, the attempt log, decisions, questions, and out-of-scope findings are kept in durable storage, outside the executor's memory. Any session resumes the work from them. On resuming, the executor rechecks the external state. Repeated operations produce no double effect. Each completed item has a restore point.

**Reason.** The executor's context runs out or is replaced, and the work cannot depend on it.

**Proof.** The spec states where each record is kept and how a new session resumes.

## G09. Independent review

**Guarantee.** At the end of each stage, reviewers without the executor's context receive only the criteria, the raw evidence, and the change, never the executor's summary. They report only requirement and correctness failures. Before the review, a single complete survey of the affected part gathers the defects into a single list. Each pass looks only at the change since the previous pass. A finding from before the stage, or outside its scope, becomes a recorded pending item and does not reopen the stage. Review is triage, and the verifier still decides what is done. A mechanical error that repeats becomes an automatic check.

**Reason.** Whoever did the work, and whoever read their summary, tends to see what they expect.

**Proof.** The spec defines who reviews, what they receive, and when.

## G10. Approval by cost to undo

**Guarantee.** Actions that are costly or impossible to undo go through the owner, for example publishing, spending, deleting, sending messages, or changing real data. Limits come from a mechanism, not only from text. Credentials stay out of the executor's reach.

**Reason.** A written instruction does not prevent an action. Only a mechanism does.

**Proof.** A table of actions and owners, with the mechanism behind each limit.

## G11. Environment proven first

**Guarantee.** Before the main work, a short unit proves, by running it, that each required path works, such as tools, access, and destinations. The versions in use are recorded.

**Reason.** An environment failure found mid-work costs more and is mistaken for a failure of the deliverable.

**Proof.** The first unit of the spec is this proof, with the recorded result.

## G12. Defects become verifiers

**Guarantee.** Every defect found after delivery first becomes a check that fails without the fix. Once reviewed, it joins the frozen criteria (G03). A defect that slipped past the verifiers produces a recorded prevention.

**Reason.** Without this, the same defect comes back.

**Proof.** The spec describes the path from a reported defect to the new verifier.

## G13. One owner per item

**Guarantee.** Each modifiable item has a single owner at a time. Parallel work happens only on independent fronts, integrated one at a time.

**Reason.** Two owners of the same item lose each other's work.

**Proof.** The division of units shows the owner of each item.

## G14. Extra mechanisms only on evidence

**Guarantee.** The spec starts with the minimum that meets these guarantees. An extra mechanism enters when execution records show the failure it prevents. Impossible goals stay out of the spec and become "blocked" or leave the scope.

**Reason.** Excess mechanism costs maintenance, and an impossible goal pushes the executor to work around the verifier.

**Proof.** Each mechanism in the spec points to the guarantee, requirement, or evidence that justifies it.

## G15. The how is fixed during execution

**Guarantee.** The spec's how decisions hold for the whole execution. They are reviewed only between stages, with a record. Changing a verification mechanism requires the owner.

**Reason.** Changing the mechanism mid-execution prevents comparing runs and can weaken a verifier without anyone noticing.

**Proof.** The spec states when the how decisions can be reviewed and by whom.
