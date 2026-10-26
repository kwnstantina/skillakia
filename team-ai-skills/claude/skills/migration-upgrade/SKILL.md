---
name: migration-upgrade
description: Use when upgrading frameworks, packages, or language versions (e.g. .NET or React major upgrades). Plan-first approach.
---

# Migration / Upgrade

Apply when upgrading frameworks, packages, or language versions (e.g. .NET upgrade, React major version).

## Mandatory: plan first
1. State current version → target version.
2. List breaking changes from the official migration guide/release notes. Read them; don't guess.
3. Identify affected files by searching the repo.
4. Propose a step order (smallest verifiable steps first).
5. Present the plan and get approval BEFORE changing code.

## During
- Update config/build files first, then code.
- Keep each change minimal and commit atomically.
- Run build + full test suite after every step; stop and report at first failure.
- Update docs, lockfiles, and CI config consistently.

## Output
After: summary of what changed, what was deprecated/removed, and any remaining warnings.
