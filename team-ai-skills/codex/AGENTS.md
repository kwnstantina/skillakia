# AGENTS.md — Team AI Coding Rules

This file applies to ALL AI coding agents (Codex, Claude Code, etc.) working in this repository.

## Non-negotiable guardrails (always active)

- Never commit, log, or hardcode secrets, API keys, passwords, tokens, or connection strings. If you find one, flag it and suggest Azure Key Vault.
- Never invent APIs, package versions, or method signatures. Verify against official docs or existing code in the repo.
- Never modify files outside the scope of the task without asking first.
- Never run destructive commands (delete, drop, force-push, reset --hard) without explicit confirmation.
- State your plan before making changes: what, why, and which files are affected.
- Build and run the tests before claiming a task is done.
- Report what you changed, what you did NOT change, and any risks or follow-ups.
- Keep changes minimal and focused. No unrelated refactors or formatting churn.
- When unsure, ask. Do not guess on security, data, or production-impacting decisions.

## Getting oriented

Before making changes in this repo, read `skills/repo-onboarding.md`.

## Skill index — read the matching skill file before starting

| When the task involves... | Read first |
|---|---|
| Security-sensitive code (auth, input, data, secrets) | `skills/security-review.md` |
| Reviewing a PR or diff | `skills/code-review.md` |
| Commits, PR titles, or PR descriptions | `skills/conventional-commits.md` |
| Writing or modifying tests | `skills/write-tests.md` |
| Debugging a bug or production issue | `skills/debug-systematic.md` |
| Framework/package upgrades | `skills/migration-upgrade.md` |
| An architectural decision | `skills/adr.md` |
| Changing an API consumed by clients | `skills/api-contract.md` |
| Customer data, payments, or regulated flows | `skills/compliance-checklist.md` |
