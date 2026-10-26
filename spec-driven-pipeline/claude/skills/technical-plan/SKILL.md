---
name: technical-plan
description: Use to turn an approved spec and analysis into an implementation plan, task list (tasks.json), and an ADR if the change is architectural.
---

# Technical Plan

Goal: turn the analysis into an implementation plan.

## Input
`specs/STORY-{id}.md` + `specs/STORY-{id}.analysis.md`.

## Produce
1. Files to CREATE (with purpose).
2. Files to MODIFY (with what changes).
3. Design decisions (with brief rationale).
4. An ADR at `docs/adr/NNNN-title.md` if the change is architectural.
5. Task list at `specs/STORY-{id}.tasks.json`.

## tasks.json shape
```json
{
  "storyId": "STORY-{id}",
  "tasks": [
    {
      "id": "T1",
      "title": "Add validation to withdrawal service",
      "file": "src/Services/WithdrawalService.cs",
      "type": "backend | frontend | test | config",
      "dependsOn": [],
      "acIds": ["AC-01"]
    }
  ]
}
```

## Rules
- Map every task to at least one AC (`acIds`) — this preserves traceability.
- Order tasks by dependency; mark which can run in parallel.
- Prefer reusing existing code (from analysis) over new code.
- State the conventions you'll follow (naming, DI, logging, error handling).
- Keep changes minimal; no unrelated refactors.

## GATE
Present the plan and **STOP for human approval**.
