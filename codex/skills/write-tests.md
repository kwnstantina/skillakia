# Write Tests

Apply when writing or extending tests. Follow existing repo patterns.

## Principles
- Arrange / Act / Assert structure.
- Cover: happy path, edge cases, and error cases.
- Tests are independent, deterministic, and fast; no network/DB if avoidable (use mocks/fakes).
- Name tests to describe behavior: `Method_Scenario_ExpectedResult`.

## .NET (xUnit/NUnit)
- Use the repo's framework; prefer xUnit if unspecified.
- Mock with Moq/NSubstitute; verify behavior, not implementation details.
- Use FluentAssertions for readability if the repo already uses it.
- Test async with `await`; never block (`.Result`/`.Wait()`).

## React (Vitest/Jest + React Testing Library)
- Test behavior (what the user sees/does), not internals.
- Prefer `getByRole`/`getByLabelText`/`getByText`; avoid test-ids unless necessary.
- Wrap async updates in `waitFor`/`findBy*`.
- Mock API calls; assert loading, success, and error states.

## Output
Never leave tests failing. State what you tested and what remains untested.
