# Spec-Driven Development Pipeline

A 9-skill, agent-powered pipeline that turns a user story into **spec → code → tests → verification**, with human approval gates and full traceability.

Two formats included:

```
spec-driven-pipeline/
├── claude/skills/<name>/SKILL.md   # Claude Code skills (9)
└── codex/
    ├── AGENTS.md                   # conductor + index (Codex)
    └── skills/<name>.md            # same 9 skills, Codex format
```

## The pipeline

```
STAGE 0  story-intake    → draft story + ACs
STAGE 1  spec-author     → specs/STORY-{id}.md  (Markdown + Gherkin ACs)
       ⛔ GATE 1: human approves spec
STAGE 2  ac-analysis     → specs/STORY-{id}.analysis.md
STAGE 3  technical-plan  → specs/STORY-{id}.plan.md + .tasks.json
       ⛔ GATE 2: human approves plan
STAGE 4  code-gen + test-gen  → code + tests (parallel for independent modules)
STAGE 5  verify          → specs/STORY-{id}.verification.md (traceability matrix)
STAGE 6  risk-report     → specs/STORY-{id}.report.md
```

## Key design decisions

- **Markdown as source of truth** (human-reviewable, diffable, AI-friendly), not JSON.
- **Gherkin Given/When/Then ACs** — each AC maps 1:1 to an automated test.
- **Unique AC IDs** (`AC-01`, ...) are the traceability key through every stage.
- **Two human gates** (spec, plan) — agents never run wild.
- **Traceability matrix** — every AC → code → test → pass/fail, provable coverage.
- **Grounded in the real codebase** — analysis and code-gen must read real files and cite paths.

## Artifacts per story

```
specs/STORY-{id}.md              # source of truth
specs/STORY-{id}.analysis.md     # exists? deps? blast radius? reuse?
specs/STORY-{id}.plan.md         # implementation plan
specs/STORY-{id}.tasks.json      # machine-readable tasks (mapped to ACs)
specs/STORY-{id}.verification.md # AC → code → test matrix
specs/STORY-{id}.report.md       # risks, conflicts, rollback, review guide
```

## Install

**Claude Code**
```bash
cp -r claude/skills/* ~/.claude/skills/
```

**Codex** (per repo, or commit so the team gets it)
```bash
cp codex/AGENTS.md /path/to/repo/AGENTS.md
cp -r codex/skills /path/to/repo/skills
```

## How to use

Say to the agent: *"I have a new user story"* (Claude Code auto-loads `spec-flow` by description), or in Codex just start describing the story — `AGENTS.md` routes it to Stage 0.

## Pair with

This pipeline pairs with the `team-ai-skills` pack (guardrails, code-review, write-tests, etc.). The pipeline skills reference those conventions.

## Customize

- Fill team-specific conventions into `code-gen` and `test-gen` (DI, logging, test framework).
- Adjust the spec template in `spec-author` if your org has a different template.
