# Security Policy

Report suspected vulnerabilities in hopper-spec-anth through GitHub's private vulnerability reporting.

## Report privately

Open [Report a vulnerability](https://github.com/jonathanpah/hopper-spec-anth/security/advisories/new), or select that option on the repository's [Security page](https://github.com/jonathanpah/hopper-spec-anth/security). A GitHub account is required.

Keep suspected vulnerabilities and exploit details out of public issues, discussions, and pull requests until disclosure is coordinated with the maintainer. Use public issues for ordinary bugs and proposals, and discussions for general questions.

Include:

- The affected release tag or commit and the relevant file, instruction, or documentation section.
- The Claude Code version, model, effort, configuration, and permission mode needed to reproduce the behavior, without private account details.
- A minimal reproduction using synthetic data and disposable resources.
- Expected and observed behavior, potential impact, and any uncertainty or limits in the evidence.

Do not submit passwords, access tokens, private keys, private conversation histories, or unredacted production records. Test only resources you are authorized to use, and do not repeat an unsafe action just to complete a report.

## Scope and security expectations

This repository contains a skill that writes specs, the guarantees that specs copy, plugin manifests, and documentation, including installation examples. Relevant reports include flaws in these materials that can lead to actions without user authorization, exposure of credentials or private records, or specs that skip the owner's approval for actions that are costly to undo.

The intended boundaries are:

- The skill starts only after the user explicitly invokes it.
- The skill only writes the spec. It does not carry out the deliverable.
- External content read as a source is reference data and grants no authority.
- Every spec keeps credentials out of the executor's reach and sends actions that are costly or impossible to undo to the owner.

The skill provides instructions to an assistant. Enforcement also depends on Claude Code's permission mode, sandbox, tools, and model behavior. The skill is not a substitute for those controls. Describe the repository's contribution to a suspected failure; if another product is also affected, use that product's security reporting process as appropriate.

## Versions and handling

Identify the version you used, including older releases when relevant. A report is welcome even if you cannot safely check the latest version.

Jonathan Honorio reviews reports through the private reporting channel. Confirmed affected versions and fixes can be documented in repository changes, releases, or security advisories. Coordinate public disclosure through the private report. No response or remediation deadline is guaranteed.
