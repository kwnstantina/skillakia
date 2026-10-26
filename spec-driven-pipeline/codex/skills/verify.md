# Verification

Goal: prove the change satisfies every AC, and nothing broke.

## Steps
1. Run the build (backend and frontend if applicable).
2. Run the full test suite. Collect failures.
3. Build the traceability matrix: for each AC, list the code file(s) and test(s) that prove it, plus pass/fail.

## Output
`specs/STORY-{id}.verification.md`:

```markdown
# STORY-{id} — Verification

## Build
- backend: ✅ / ❌
- frontend: ✅ / ❌

## Test results
- total / passed / failed

## Traceability matrix
| AC | Requirement | Code | Test(s) | Status |
|---|---|---|---|---|
| AC-01 | Reject overdraft | src/Services/WithdrawalService.cs | AC-01_RejectOverdraft | ✅ |

## Unmet ACs
- list any AC with no test or failing test
```

## Rules
- Report honestly. Do not mark an AC verified unless a test passes.
- Flag any AC with no test as **UNMET**.
- If tests fail, do NOT "fix" them here — report them and hand to `risk-report`.
