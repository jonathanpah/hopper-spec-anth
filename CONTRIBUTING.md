# Contributing to hopper-spec-anth

Contributions can improve the skill's clarity, identify failures in the specs it produces, verify behavior in Claude Code, or improve the documentation. English documentation is in `hopper-spec-anth-en/` and Brazilian Portuguese documentation is in `hopper-spec-anth-pt-br/`. Shared GitHub policies and templates remain at the repository root. Skill bodies are in `hopper-spec-anth-en/skills/hopper-spec-anth/` and `hopper-spec-anth-pt-br/skills/hopper-spec-anth/`. Each language folder is a complete plugin. Keep both versions equivalent; one release covers both languages.

## Start with the problem

For suspected vulnerabilities, follow the [Security Policy](SECURITY.md) and report privately. Keep security-sensitive details out of public issues, discussions, and pull requests until disclosure is coordinated.

Use a bug report for a reproducible failure and a proposal for a specific change. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) for questions or early ideas. Search existing issues before opening another report about the same behavior.

For changes to the steps, the templates, or the body, explain the current rule, the problem it creates, the desired behavior, evidence, and tradeoffs. A proposal is not approval to change the skill. Small documentation corrections can go directly to a pull request.

## Preserve the design

- The execution spec body, in `execution-body.md` and `corpo-da-execucao.md`, goes into every spec unchanged. It changes only by the maintainer's decision, in both languages together, with the same line structure. After changing the body, run the body grader generator in `evals/` again.
- The body has only 1 slot, the project name, in section 0. The `body.sh` or `corpo.sh` script inserts and checks the body. The skill never retypes the body.
- The templates fix the structure of the 2 documents. The content comes from each project. A project's tools, versions, and numbers stay out of the skill.
- What the skill does not know becomes a question or is marked "to be measured", "to be built", or "pending confirmation". Keep this rule.
- Keep the skill independent of any project. Examples come from fictional apps and stay short, so the model does not copy a ready-made solution.
- Preserve explicit invocation, writing without executing, questions in 1 message with the options in plain language, the checklist, and the reader without context, unless the maintainer approves a change.
- Keep the plugin self-contained. `SKILL.md` and the reference files must not depend on a separate `AGENTS.md` or this guide.
- Update both languages together.
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

For changes to the steps, the templates, or the body, run the affected cases in `evals/` and record the observable result. The cases include a request for an explanation and a request outside the scope, which must not produce a file, and the 2 specs of a fictional app, with the whole body checked.

For a compatibility claim, identify the Claude Code version (CLI or app), the operating system, the model and effort, what you observed, and limitations. Proving that the skill is recognized does not prove the quality of the specs.

Use disposable resources for experiments. Share a concise, redacted reproduction or synthetic example. Never submit passwords, access tokens, private keys, personal data, private chat history, or unredacted production records.

## Review and releases

Jonathan Honorio maintains the project and decides whether a change is accepted. Reviews consider the stated problem, evidence, consistency with the design, and maintenance cost. Review does not imply a promised response time or acceptance.

Accepted changes are merged into `main`. A release identifies a selected repository version and describes its changes and known limitations. Installing or updating remains a user's decision.

By submitting a contribution, you agree that your contribution is provided under this repository's [MIT License](LICENSE). Follow the [Code of Conduct](CODE_OF_CONDUCT.md).
