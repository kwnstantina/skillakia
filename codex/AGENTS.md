# AGENTS.md — Skillakia Coding Rules

This file applies to all AI coding agents (Codex, Claude Code, etc.) working in this repository. It combines two packs: **team-ai-skills** (craft guardrails) and **spec-driven-pipeline** (spec → code workflow).

## Non-negotiable guardrails (always active)

- Never commit, log, or hardcode secrets, API keys, passwords, tokens, or connection strings. If you find one, flag it and suggest Azure Key Vault.
- Never invent APIs, package versions, or method signatures. Verify against official docs or existing code in the repo.
- Never modify files outside the scope of the task without asking first.
- Never run destructive commands (delete, drop, force-push, reset --hard) without explicit confirmation.
- State your plan before making changes: what, why, and which files are affected.
- Build and run the tests before claiming a task is done.
- Report what you changed, what you did NOT change, and any risks or follow-ups.
- Keep changes minimal and focused. No unrelated refactors or formatting churn.
- When unsure, ask. Do not guess on security, data, or production-impacting decisions.

## Getting oriented

Before making changes in this repo, read `skills/repo-onboarding.md`.

## Skill index — read the matching skill file before starting

### Craft skills

| When the task involves... | Read first |
|---|---|
| Security-sensitive code (auth, input, data, secrets) | `skills/security-review.md` |
| Reviewing a PR or diff | `skills/code-review.md` |
| Commits, PR titles, or PR descriptions | `skills/conventional-commits.md` |
| Writing or modifying tests | `skills/write-tests.md` |
| Debugging a bug or production issue | `skills/debug-systematic.md` |
| Framework/package upgrades | `skills/migration-upgrade.md` |
| An architectural decision | `skills/adr.md` |
| Changing an API consumed by clients | `skills/api-contract.md` |
| Customer data, payments, or regulated flows | `skills/compliance-checklist.md` |

### Spec-driven pipeline

When a user story arrives or a feature must be built, follow the pipeline below. Do not skip stages or gates.

| # | Stage | Read skill file | Output |
|---|---|---|---|
| 0 | Intake | `skills/story-intake.md` | draft story + ACs |
| 1 | Spec | `skills/spec-author.md` | `specs/STORY-{id}.md` (Gherkin ACs) |
| ⛔ | **GATE 1** — human approves spec | | |
| 2 | Analysis | `skills/ac-analysis.md` | `specs/STORY-{id}.analysis.md` |
| 3 | Plan | `skills/technical-plan.md` | `specs/STORY-{id}.plan.md` + `.tasks.json` |
| ⛔ | **GATE 2** — human approves plan | | |
| 4 | Code + Tests | `skills/code-gen.md` + `skills/test-gen.md` | code + tests (parallel for independent modules) |
| 5 | Verify | `skills/verify.md` | `specs/STORY-{id}.verification.md` |
| 6 | Report | `skills/risk-report.md` | `specs/STORY-{id}.report.md` |

For an overview of the full pipeline, read `skills/spec-flow.md`.

## Pipeline rules

- Each stage reads the previous stage's artifacts as input. Never skip a stage.
- Every AC has a unique ID (`AC-01`, ...) — the traceability key through the whole pipeline.
- Every task maps to at least one AC; every AC has at least one test that proves it.
- Write every artifact to the `specs/` folder.

## Artifacts (per story)

```
specs/STORY-{id}.md              # source of truth (Markdown + Gherkin ACs)
specs/STORY-{id}.analysis.md     # what exists, deps, blast radius
specs/STORY-{id}.plan.md         # implementation plan
specs/STORY-{id}.tasks.json      # machine-readable task list
specs/STORY-{id}.verification.md # AC → code → test traceability matrix
specs/STORY-{id}.report.md       # risks, conflicts, rollback, review guide
```

## Starting

When a new story arrives, begin at Stage 0 by reading `skills/story-intake.md`.
