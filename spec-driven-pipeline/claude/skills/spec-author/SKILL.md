---
name: spec-author
description: Use to write the source-of-truth spec file (specs/STORY-{id}.md) with Gherkin acceptance criteria from an intake draft.
---

# Spec Author

Goal: turn the intake draft into the source-of-truth spec file.

## Output file
`specs/STORY-{id}.md` — use the story/ticket number; if none, a short slug.

## Template (use exactly)

```markdown
# STORY-{id}: <title>

## Metadata
| Field | Value |
|---|---|
| Story ID | STORY-{id} |
| Status | Draft |
| Author | <dev> |
| Date | <date> |
| Priority | <P1-P4> |

## User Story
As a <role>, I want <capability>, so that <benefit>.

## Acceptance Criteria

### AC-01: <short descriptive name>
```gherkin
Given <precondition>
When <action>
Then <expected outcome>
And <additional expected outcome>
```

### AC-02: <short descriptive name>
```gherkin
Given <precondition>
When <action>
Then <expected outcome>
```

## Business Logic / Rules
- <rule>

## Non-Functional Requirements
- <perf/security/logging/compliance>

## Out of Scope
- <...>

## Dependencies
- <...>

## Open Questions
- <...>
```

## Rules
- Every AC must be testable and have at least one scenario with Given/When/Then.
- Give each AC a unique ID (`AC-01`, `AC-02`, ...) — these are the traceability keys used by every later stage.
- Use concrete values, not vague words.
- Status starts as `Draft`; update as the pipeline progresses: `Draft → Approved → Planned → In Progress → Verified`.

## GATE
After writing, present the spec and **STOP for human approval**. Do not proceed to analysis.
