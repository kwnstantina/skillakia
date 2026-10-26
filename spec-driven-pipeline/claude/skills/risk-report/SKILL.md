---
name: risk-report
description: Use after verification to produce the final risk, conflict, broken-test, rollback, and review report.
---

# Risk & Conflict Report

Goal: final honest assessment before human review.

## Input
All artifacts: spec, analysis, plan, code, verification.

## Produce `specs/STORY-{id}.report.md`
```markdown
# STORY-{id} — Report

## Summary
1-2 sentences on what changed and whether ACs are met.

## Risks
- [High/Med/Low] risk + mitigation

## Conflicts
- conflicts with existing code or in-flight work

## Broken tests
- list failing tests + likely cause (do NOT claim fixed unless verified)

## Rollback plan
- how to revert safely (revert commit? feature flag? DB migration down script?)

## Migration notes
- DB schema, config, or API changes that need deployment coordination

## What to review
- the 5 things a human should focus on in the PR
```

## Rules
- Be honest about what's unverified or risky. Never overstate confidence.
- Highlight any AC that is unmet or partially met.
