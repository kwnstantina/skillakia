---
name: guardrails
description: Always-on safety and quality rules that apply to every coding session. Apply at the start of every task.
---

# Guardrails (always active)

These rules apply to EVERY task, no exceptions.

## Never do
- Never commit, log, or hardcode secrets, API keys, passwords, tokens, or connection strings. If you find one, flag it and suggest Azure Key Vault.
- Never invent APIs, package versions, or method signatures. Verify against official docs or existing code in the repo.
- Never modify files outside the scope of the task without asking first.
- Never run destructive commands (delete, drop, force-push, reset --hard) without explicit confirmation.

## Always do
- State your plan before making changes: what, why, and which files are affected.
- Build and run the tests before claiming a task is done.
- Report what you changed, what you did NOT change, and any risks or follow-ups.
- Keep changes minimal and focused. No unrelated refactors or formatting churn.

## When unsure
- Ask. Do not guess on security, data, or production-impacting decisions.
