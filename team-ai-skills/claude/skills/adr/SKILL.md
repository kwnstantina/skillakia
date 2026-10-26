---
name: adr
description: Use when making or proposing an architectural decision (new pattern, library, service, or significant change). Writes an Architecture Decision Record.
---

# Architecture Decision Records (ADR)

Apply when making or proposing an architectural decision.

## When to write an ADR
- Choosing between 2+ meaningful options.
- Introducing a new dependency, framework, or service.
- Changing a cross-cutting concern (auth, data access, deployment).
- Reversing a previous decision.

## Template (create `docs/adr/NNNN-title.md`)
```
# NNNN. Title

## Status
Proposed | Accepted | Deprecated | Superseded by [NNNN]

## Context
What problem are we solving? Constraints?

## Decision
What we decided and why.

## Consequences
What gets easier, what gets harder, trade-offs.

## Alternatives considered
Option + why rejected.
```

## Output
Write the ADR file; link it from the ADR index.
