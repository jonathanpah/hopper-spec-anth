# hopper-spec-anth

**English** | [Português (Brasil)](../hopper-spec-anth-pt-br/README.md)

A Claude Code skill that writes the spec for any deliverable, such as software, a document, an event, or a process. The spec is enough for another session, person, or team to carry out the deliverable from start to finish without coming back with questions.

## The central idea

The skill separates **what** to do from **how** to do it.

- **What** is fixed in the skill. There are 15 guarantees every spec meets, for example "the executor does not decide what is done" and "the executor does not change the criteria". Each guarantee is a checkable property and states the reason behind it.
- **How** belongs to the model running the skill. Tools, versions, formats, and numbers are chosen at writing time, using the most current practice, after checking the official documentation and the installed environment. Each choice is recorded in the spec, with alternatives, dated sources, reason, and proof.

As a result, a newer model or a new tool improves the specs without requiring a change to the skill. How decisions stay fixed during execution and are reviewed only between stages.

The plugin has 2 content files.

- The [SKILL.md](skills/hopper-spec-anth/SKILL.md), with the 6 writing steps.
- The [guarantees](skills/hopper-spec-anth/guarantees.md), which every spec copies unchanged.

See the [document index](index.md) or read [how to contribute](../CONTRIBUTING.md).

This folder contains the English version. The commands below install this version, with the same `hopper-spec-anth` name used in Portuguese.

## The steps

1. **Scope** the deliverable, the owner, the executor, and the spec's destination.
2. **Read the sources** that exist and the current external facts.
3. **Ask the owner** only what the sources do not answer, with numbered questions and a recommended answer for each.
4. **Write** the spec with the required content, including the guarantees and the how decisions.
5. **Check** the spec against fixed criteria and with a clean-context reader.
6. **Deliver** the spec at its destination, with the open items.

The skill only writes. Execution starts later, at the owner's decision, in a new session that reads only the spec.

## Compatibility and limits

The skill is made for Claude Code, in the CLI and the app, on macOS and Linux. It does not depend on a specific tool. The model uses whatever the session offers.

The SKILL.md follows the [Agent Skills format](https://agentskills.io/specification) and sets `disable-model-invocation: true`. Claude does not invoke the skill on its own.

The quality of the how decisions depends on the session's model and effort. When they are below the highest available, the skill tells the user once and follows their choice. The skill makes no claim of measured cost savings.

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

Check name, version, and content with `claude plugin list` and `claude plugin details hopper-spec-anth@hopper-spec-anth`. The [`evals/`](evals/) folder contains the official suite cases. To repeat them, run in this folder `claude plugin eval . --tag without-write` and `claude plugin eval . --tag with-write --judge-model sonnet --allow-tools Write Edit Bash WebFetch`. The spec cases use Sonnet as the judge, because the default judge is unreliable on long files.

## Use

Invoke `/hopper-spec-anth:hopper-spec-anth` and describe the deliverable. For example:

> Write the spec for the meeting-room booking app in this repository. Save it to docs/spec.md.

Claude reads the sources, asks the missing questions, writes the spec, and reports the path and the open items. Explaining, reviewing, or editing the skill does not start the writing.

## Updates

Check local changes and update the clone with `git pull --ff-only`. Then run `claude plugin marketplace update hopper-spec-anth` and `claude plugin update hopper-spec-anth@hopper-spec-anth`, and send `/reload-plugins` in open sessions. If you used upload in the app, update the account package too.

Specs already written do not change with an update. Each spec records the skill version that produced it and carries the guarantees that applied in that version.

To remove, use `claude plugin uninstall hopper-spec-anth@hopper-spec-anth` and remove the account installation in the app, if one exists.

## Contributing

For suspected vulnerabilities, follow the [Security Policy](../SECURITY.md) and report privately before sharing details publicly.

Use [Issues](https://github.com/jonathanpah/hopper-spec-anth/issues) for reproducible problems and concrete proposals. Use [Discussions](https://github.com/jonathanpah/hopper-spec-anth/discussions) for questions, experiences, and ideas that are not yet change proposals.

To propose an edit, fork the repository, create a branch, and open a pull request. The maintainer decides what is merged. See [CONTRIBUTING.md](../CONTRIBUTING.md) and the [Code of Conduct](../CODE_OF_CONDUCT.md).

## License and maintainer

Copyright (c) 2026 Jonathan Honorio. Released under the [MIT License](../LICENSE).

Maintained by [Jonathan Honorio (@jonathanpah)](https://github.com/jonathanpah). This is an independent project, with no claim of affiliation with or endorsement by Anthropic.
