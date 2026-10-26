# API Contract Sync

Apply when changing a backend API that a frontend (or other client) consumes.

## .NET backend
- Update controllers/DTOs.
- Keep OpenAPI/Swagger up to date (attributes for summaries and response types).
- Version the API if the change is breaking (e.g. `/api/v2/...`).
- Don't remove/rename fields without a deprecation plan.

## React/TypeScript client
- If using generated types (e.g. from OpenAPI): regenerate them; don't hand-edit.
- Update API client methods and all call sites.
- Handle new error/response shapes explicitly.

## Definition of done
- Build passes on both sides.
- Contract matches: field names, types, required/optional, status codes.
- Any breaking change is flagged in the PR description.
