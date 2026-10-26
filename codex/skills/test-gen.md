# Test Generation

Goal: acceptance tests (one per AC) plus unit tests for the logic.

## Acceptance tests (one per AC)
Map Gherkin to code:
- `Given` → arrange (setup)
- `When` → act (call)
- `Then`/`And` → assert (verify)

- **.NET**: xUnit. Name tests `AC-01_<scenario>` so they trace back. Use SpecFlow only if the repo already uses it.
- **React**: Vitest/Jest + React Testing Library, named the same way.

## Unit tests
- Cover the new/changed logic: happy path + edge cases + error cases.
- Mock external dependencies (Moq/NSubstitute in .NET; `vi.mock`/MSW in React).
- Follow the team's write-tests conventions.

## Output
- Test files.
- Update `tasks.json` (test tasks marked done).

## Rules
- Every AC must have at least one test that proves it.
- Never leave failing tests.
- Cite which AC each test covers (comment `// AC-01` at the top of the test).
