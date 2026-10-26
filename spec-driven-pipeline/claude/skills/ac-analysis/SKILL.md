---
name: ac-analysis
description: Use to analyze the codebase against acceptance criteria: what already exists, dependencies, blast radius, and reuse opportunities.
---

# AC Analysis

Goal: before planning, understand what already exists and what will be affected.

## Input
`specs/STORY-{id}.md` (approved spec).

## For EACH AC, determine
1. **Already implemented?** Search the codebase for existing logic/tests that satisfy it. Cite file paths.
2. **Reuse opportunity**: can existing services/functions be reused instead of writing new code?
3. **Gap**: what's missing to satisfy this AC?

## Dependencies
- Which files, APIs, services, DB tables, or configs does each AC touch?
- Cross-cutting concerns (auth, logging, validation).

## Blast radius
- What breaks if we change the affected code? (callers, tests, consumers, API contracts)
- Note conflicts with likely in-flight work.

## Output
`specs/STORY-{id}.analysis.md`:

```markdown
# STORY-{id} — Analysis

## AC coverage
| AC | Exists? | Evidence | Gap |
|---|---|---|---|
| AC-01 | Partial | src/Foo.cs:42 | Missing validation |

## Dependencies
- ...

## Blast radius / risks
- ...

## Reuse recommendations
- ...
```

## Rules
- You MUST read the real codebase (search/read files) and cite exact paths. Do not assume.
- If an AC is already fully covered, say so — that's a win (no code needed for that AC).
