# hopper-spec-anth

**English** | [Português (Brasil)](../hopper-spec-anth-pt-br/README.md)

A Claude Code skill that writes the 2 specs for a software product that AI agents build, test, and fix, such as an app, a site, a service, or a command-line tool.

## The 2 documents

- **Product spec.** What the product does. It holds the objective, the owner's decisions, the glossary, the numbered requirements, each with what has to be true and how it is checked, what must never happen, what stays out, the how decisions, and the risks.
- **Execution spec.** How the product is tested and fixed. It holds the general body, with sections 0 to 12, unchanged, and the project annex, with sections A1 to A7.

The general body applies to any project and carries the sweep-and-rounds model. A broad, shallow sweep goes through the whole product. The problems are classified as big, medium, and small and fixed in that order, 1 at a time, with only each fix tested, and a new sweep checks each round. The body also defines the review of data fixes, the delivery at the end of each round, who decides, the format of messages to the owner, and fixing each error at its root cause, at a cost lower than the problem. It goes into each spec whole and identical, assembled by a script, and the skill checks the copy before delivering.

The annex is written for each project. It covers the documents, the platforms and machines, the tested subjects, delivery, accounts and secrets, the AI models for each role, the sessions, and the starting numbers. Every product spec function becomes a test subject, and only the owner removes a subject. The annex has up to 70 lines. What the skill does not know becomes a question or is marked "to be measured", "to be built", or "pending confirmation".

## Scope

The skill serves a new software product and a software project that does not have the 2 specs yet or asks to rewrite them. It does not write a spec for a document, an event, a process, or any other deliverable that is not software. In a project that already has the 2 specs, a new function enters through the product spec, and a rule change through section 11 of the body. A lesson from an error enters through section 12. Before writing over a spec that already exists, the skill confirms with the owner.

## The steps

1. **Scope** the product, the owner, the platforms, and the destination.
2. **Read** the project, the environment, the body, and the current official documentation.
3. **Ask** the owner only the essentials, in 1 message, with the options explained in plain language and a recommendation for each.
4. **Decide the how**, with dated sources.
5. **Write** the 2 documents, with the body inserted by the script.
6. **Check** the 2 documents with the checklist and with a reader without context.
7. **Deliver** the paths, the pending items, and what was left unverified.

The skill only writes. The 2 specs are born as drafts and take effect with the owner's approval. The work starts later, by the owner's decision.

## Files

- [SKILL.md](skills/hopper-spec-anth/SKILL.md): the 7 steps and the rules for all of them.
- [execution-body.md](skills/hopper-spec-anth/execution-body.md): the general body of the execution spec.
- [product-spec.md](skills/hopper-spec-anth/product-spec.md) and [annex.md](skills/hopper-spec-anth/annex.md): the templates of the 2 documents.
- [questions.md](skills/hopper-spec-anth/questions.md): what to ask and how.
- [checklist.md](skills/hopper-spec-anth/checklist.md): the checklist.
- [scripts/body.sh](skills/hopper-spec-anth/scripts/body.sh): inserts and checks the body.

See the [document index](index.md) or read [how to contribute](../CONTRIBUTING.md).

## Compatibility and limits

The skill is made for Claude Code, in the CLI and the app, on macOS and Linux. The script uses only `sh`, `awk`, and `grep` and writes no temporary file. The 2 documents come out in the language of the installed package.

The SKILL.md follows the [Agent Skills format](https://agentskills.io/specification) and has `disable-model-invocation: true`. Claude does not invoke the skill on its own.

The quality of the requirements and how decisions depends on the session's model and effort. The skill does not claim measured cost savings.

## Installation

The plugin and the skill are named `hopper-spec-anth` in both languages. Choose one language only. The `hopper-spec-anth-en/` folder contains the complete English plugin.

Clone the repository once.

```sh
mkdir -p "$HOME/.local/share"
git clone https://github.com/jonathanpah/hopper-spec-anth.git "$HOME/.local/share/hopper-spec-anth"
```

If the destination already exists, check its origin and local changes before updating it.

### Claude Code

```sh
claude plugin marketplace add "$HOME/.local/share/hopper-spec-anth/hopper-spec-anth-en"
claude plugin install hopper-spec-anth@hopper-spec-anth
```

In a session that is already open, send `/reload-plugins` as a separate message to load the skill.

### App and names

The full identifier is `hopper-spec-anth:hopper-spec-anth`. The first part identifies the plugin, and the second identifies the skill. Invoke the skill with `/hopper-spec-anth:hopper-spec-anth`.

Installing through the CLI does not prove the plugin is in the app's catalog. In the Claude app, check **Customize → Plugins → Yours** and **Skills → Yours**. When the plugin is not in the catalog, add the package through the plugin upload option and check both lists. The ZIP must contain the files of the chosen language folder, including `.claude-plugin/plugin.json` and `skills/`.

### Verification

Check name, version, and content with `claude plugin list` and `claude plugin details hopper-spec-anth@hopper-spec-anth`. The [`evals/`](evals/) folder contains the official suite cases. To repeat them, run in this folder `claude plugin eval . --tag without-write` and `claude plugin eval . --tag with-write --judge-model sonnet --allow-tools Write Edit Bash WebFetch`. The explanation and out-of-scope cases use Sonnet as the judge. The case of the 2 specs checks the files with text patterns, including the whole body, because model judges are unreliable on long files.

## Use

Invoke `/hopper-spec-anth:hopper-spec-anth` and describe the product, as in this request.

> I want an app for my running club to schedule the week's training sessions, on the phone. Save the specs in docs/.

Claude reads the project, asks the missing questions, writes the 2 documents, and reports the paths and the pending items. Explaining, reviewing, or editing the skill does not start the writing.

## Updates

Check local changes and update the clone with `git pull --ff-only`. Then run `claude plugin marketplace update hopper-spec-anth` and `claude plugin update hopper-spec-anth@hopper-spec-anth`, and send `/reload-plugins` in open sessions. If you used the app upload, also update the account's package.

Specs already written do not change with the update. Each spec records in its header the version of the skill that wrote it. Version 2.0.0 replaced the execution spec model with the sweep-and-rounds model and does not convert specs written before it. Version 2.1.0 adds section 12, errors and root causes, to the body.

To remove it, use `claude plugin uninstall hopper-spec-anth@hopper-spec-anth` and remove the account installation in the app, if one exists.

## Contributing

For suspected vulnerabilities, follow the [Security Policy](../SECURITY.md) and report privately before sharing details publicly.

Use [Issues](https://github.com/jonathanpah/hopper-spec-anth/issues) for reproducible problems and concrete proposals. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) for questions, experiences, and ideas that are not yet change proposals.

To propose an edit, fork the repository, create a branch, and open a pull request. The maintainer decides what is merged. See [CONTRIBUTING.md](../CONTRIBUTING.md) and the [Code of Conduct](../CODE_OF_CONDUCT.md).

## License and maintainer

Copyright (c) 2026 Jonathan Honorio. Released under the [MIT License](../LICENSE).

Maintained by [Jonathan Honorio (@jonathanpah)](https://github.com/jonathanpah). This is an independent project, with no claim of affiliation with or endorsement by Anthropic.
