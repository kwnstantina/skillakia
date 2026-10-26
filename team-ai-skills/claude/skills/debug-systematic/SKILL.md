---
name: debug-systematic
description: Use when diagnosing a bug, failing test, or production issue. Structured debugging protocol plus Azure Application Insights guidance.
---

# Systematic Debugging

Apply when diagnosing a bug, failing test, or production issue.

## Protocol
1. **Reproduce**: get a reliable repro. State expected vs actual.
2. **Read the error**: read the full stack trace/message before guessing.
3. **Isolate**: narrow the cause. Change one variable at a time. Bisect commits if it's a regression.
4. **Hypothesize**: write down 2-3 possible causes, ordered by likelihood.
5. **Verify**: test each hypothesis; prove before "fixing".
6. **Fix the root cause**, not the symptom.
7. **Add a regression test**.

## Azure-specific
- Use correlation IDs / operation IDs to trace requests in Application Insights.
- Check in order: request logs, exceptions, dependency calls (SQL/HTTP), then traces.
- In .NET, use structured logging (`ILogger` with named placeholders), never string interpolation for logs.
- Don't log PII or secrets.

## Output
Report: root cause, evidence, fix, and the regression test you added.
