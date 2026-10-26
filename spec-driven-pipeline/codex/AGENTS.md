# AGENTS.md — Spec-Driven Development Pipeline

This file is the conductor for spec-driven development. When a developer brings a user story or asks to build a feature, follow this pipeline. Do not skip stages or gates.

## Always-active guardrails

- Never invent APIs, package versions, or method signatures — verify against the codebase and official docs.
- Never commit secrets. Flag them and suggest Azure Key Vault.
- Ground every stage in the real codebase: read files, cite exact paths.
- Keep changes minimal; no unrelated refactors or gold-plating.
- Stop at every GATE and ask the human before proceeding.

## Pipeline

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

## Artifacts (per story)

```
specs/STORY-{id}.md              # source of truth (Markdown + Gherkin ACs)
specs/STORY-{id}.analysis.md     # what exists, deps, blast radius
specs/STORY-{id}.plan.md         # implementation plan
specs/STORY-{id}.tasks.json      # machine-readable task list
specs/STORY-{id}.verification.md # AC → code → test traceability matrix
specs/STORY-{id}.report.md       # risks, conflicts, rollback, review guide
```

## Rules

- Each stage reads the previous stage's artifacts as input. Never skip a stage.
- Every AC has a unique ID (`AC-01`, ...) — it is the traceability key through the whole pipeline.
- Every task maps to at least one AC; every AC has at least one test that proves it.
- Write every artifact to the `specs/` folder.

## Starting

When a new story arrives, begin at Stage 0 by reading `skills/story-intake.md`.
