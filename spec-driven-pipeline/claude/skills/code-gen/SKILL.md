---
name: code-gen
description: Use to implement an approved plan by writing code in C#/.NET and React, grounded in the real codebase.
---

# Code Generation

Goal: implement the approved plan, grounded in the real codebase.

## Input
`specs/STORY-{id}.plan.md` + `specs/STORY-{id}.tasks.json` + the spec.

## Rules
- Read existing code first; match its conventions (naming, DI, error handling, logging).
- **.NET**: services in the right layer (controllers → services → repositories), DTOs (never bind entities directly), async/await, cancellation tokens, structured `ILogger` logging.
- **React/TS**: functional components + hooks, typed interfaces (no `any`), call the API client layer, handle loading/error states.
- Never invent APIs or package versions — verify against the codebase and official docs.
- Implement ONLY the tasks in `tasks.json`. No gold-plating.
- Cite the file paths you touch.

## Parallelism
Independent tasks (different files, no `dependsOn`) may be implemented in parallel by separate agents.

## Output
- The code changes.
- Update `tasks.json` with `status: "done"` per completed task.
- Note any deviation from the plan for the verify/report stages.
