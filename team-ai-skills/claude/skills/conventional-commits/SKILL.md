---
name: conventional-commits
description: Use when creating git commits, PR titles, or PR descriptions. Enforces Conventional Commits style.
---

# Conventional Commits

Apply when creating commits, PR titles, or PR descriptions.

## Format
```
<type>(<scope>): <short imperative summary>
```

## Types
- `feat`: new feature
- `fix`: bug fix
- `refactor`: no behavior change
- `test`: adding/fixing tests
- `docs`: documentation only
- `chore`: build/tooling/deps
- `perf`: performance
- `style`: formatting only
- `ci`: CI/CD changes

## Rules
- Summary is imperative mood ("Add", not "Added"/"Adds"), ≤ 72 chars, no trailing period.
- Scope is optional and short (e.g. `auth`, `api`, `ui`).
- Body explains WHY and WHAT, not how (code shows how).

## PR title
Use `<type>(<scope>): <summary>` exactly.

## PR description template
```
## What
## Why
## Testing
## Risks / follow-ups
```
