---
name: code-review
description: Use when reviewing a pull request or diff. Provides a C#/.NET and React/TypeScript review checklist with a consistent output format.
---

# Code Review

Apply when reviewing a PR or diff. Provide specific, actionable feedback.

## C#/.NET
- **Null handling**: null-conditional operators, nullable reference types enabled, no obvious NRE risk.
- **Async**: async/await used correctly; no `.Result`/`.Wait()`; no `async void` (except event handlers); cancellation tokens for long-running work.
- **Exceptions**: don't swallow exceptions; don't use exceptions for control flow.
- **Disposal**: `IDisposable`/`IAsyncDisposable` disposed (via `using`).
- **LINQ**: no multiple enumeration of deferred queries; avoid O(n²) patterns.
- **DI**: services registered with correct lifetimes (transient/scoped/singleton).

## React/TypeScript
- **Hooks rules**: no conditional hooks; correct dependency arrays; no stale closures.
- **Keys**: stable, unique keys in lists.
- **State**: minimal state; don't store derived values redundantly.
- **Effects**: cleanup functions; no infinite loops.
- **Types**: avoid `any`; use proper interfaces.

## General
- Naming is clear and intention-revealing.
- Single responsibility; methods not too long.
- Tests cover the changed behavior (happy + edge + error).
- No dead code, commented-out blocks, or `console.log`.

## Output format
For each issue: `[severity] file:line — issue + why it matters + concrete fix`. End with a 1-2 sentence summary and an overall verdict.
