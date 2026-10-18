# Contributing to hopper-spec-anth

Contributions can improve the skill's clarity, identify failures in the specs it produces, verify behavior in Claude Code, or improve the documentation. English documentation is in `hopper-spec-anth-en/` and Brazilian Portuguese documentation is in `hopper-spec-anth-pt-br/`. Shared GitHub policies and templates remain at the repository root. Skill bodies are in `hopper-spec-anth-en/skills/hopper-spec-anth/` and `hopper-spec-anth-pt-br/skills/hopper-spec-anth/`. Each language folder is a complete plugin. Keep both versions equivalent; one release covers both languages.

## Start with the problem

For suspected vulnerabilities, follow the [Security Policy](SECURITY.md) and report privately. Keep security-sensitive details out of public issues, discussions, and pull requests until disclosure is coordinated.

Use a bug report for a reproducible failure and a proposal for a specific change. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) for questions or early ideas. Search existing issues before opening another report about the same behavior.

For changes to the steps or guarantees, explain the current rule, the problem it creates, the desired behavior, evidence, and tradeoffs. A proposal is not approval to change the skill. Small documentation corrections can go directly to a pull request.

## Preserve the design

- The skill states **what** the spec guarantees. **How** is decided by the model running the skill and recorded in each spec. Keep tool names, products, versions, formats, and numbers, such as attempts, repetitions, and unit size, out of the skill.
- Write each guarantee as a checkable property, with a reason and a proof. A mechanism is a how decision.
- A guarantee enters or leaves only on execution evidence, for example records that show the failure it prevents, or that show it no longer has an effect.
- Keep the skill independent of any project. Examples stay generic and short, so the model does not copy a ready-made solution.
- Preserve explicit invocation, writing without executing, questions with a recommended answer, and the clean-context reader check, unless the maintainer approves a change.
- Keep the plugin self-contained. `SKILL.md` and the guarantees must not depend on a separate `AGENTS.md` or this guide.
- Update both languages together. Specs copy the guarantees unchanged, so keep the identifiers G01 to G15 and their headings stable.
- Distinguish observed behavior from documentation claims, assumptions, and proposed behavior. Do not claim performance or cost improvements without comparable measurements.
- Use plain language in English and Portuguese. Put explanations in visible documentation, without hidden comments.

## Open a pull request

1. Fork the repository to your GitHub account. A fork is your own copy that you can edit.
2. Create a branch in your fork for one coherent change.
3. Edit the files and commit the change with a descriptive message.
4. Open a pull request from your branch to this repository's `main` branch. Link the relevant issue, if one exists.
5. Explain the problem, resulting behavior, verification, and limitations. Respond to review on the same branch.

A pull request proposes a change; it changes this repository only when the maintainer merges it. You can also contribute by reviewing proposals, reproducing reported failures, or supplying evidence without changing files.

## Verify proportionately

Check that the changed instructions remain coherent, links resolve, and YAML and JSON parse. Run `claude plugin validate --strict` on the changed language folder. For a translation or wording change, compare the meaning and obligations before and after.

For changes to the steps or guarantees, run the affected cases in `evals/` and record the observable result. Useful cases include a request for an explanation, which must not produce a spec, and specs from different domains, such as software and an event.

For a compatibility claim, identify the Claude Code version (CLI or app), the operating system, the model and effort, what you observed, and limitations. Proving that the skill is recognized does not prove the quality of the specs.

Use disposable resources for experiments. Share a concise, redacted reproduction or synthetic example. Never submit passwords, access tokens, private keys, personal data, private chat history, or unredacted production records.

## Review and releases

Jonathan Honorio maintains the project and decides whether a change is accepted. Reviews consider the stated problem, evidence, consistency with the design, and maintenance cost. Review does not imply a promised response time or acceptance.

Accepted changes are merged into `main`. A release identifies a selected repository version and describes its changes and known limitations. Installing or updating remains a user's decision.

By submitting a contribution, you agree that your contribution is provided under this repository's [MIT License](LICENSE). Follow the [Code of Conduct](CODE_OF_CONDUCT.md).
