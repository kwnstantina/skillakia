---
name: security-review
description: Use when writing or reviewing security-sensitive code (auth, input handling, data access, secrets). Covers OWASP top issues for C#/.NET and React.
---

# Security Review

Apply when reviewing or writing code that handles input, auth, data, or external calls. Stack: C#/.NET backend, React/TypeScript frontend, Azure.

## Backend (.NET) checklist
- **SQL injection**: always use parameterized queries / EF Core / Dapper parameters. Never string-concatenate SQL.
- **Secrets**: no keys/connection strings in code or config committed to git. Use Azure Key Vault + Managed Identity.
- **Auth**: verify `[Authorize]` on sensitive endpoints; check role/claim checks; prevent broken object-level auth (IDOR) — validate the current user owns the requested resource.
- **Input validation**: validate and bound all inputs (length, type, range). Use DataAnnotations/FluentValidation.
- **Mass assignment**: never bind directly to entity models; use DTOs.
- **SSRF**: validate/allowlist any URL the server fetches.
- **Deserialization**: avoid unsafe deserialization of untrusted data.
- **Logging**: never log PII, passwords, or tokens.

## Frontend (React) checklist
- **XSS**: never use `dangerouslySetInnerHTML` with untrusted data; escape/sanitize user content.
- **Tokens**: don't store tokens in localStorage if avoidable (prefer httpOnly cookies).
- **Trust**: validate API responses; don't rely on client-side checks alone.
- **CORS**: it's a server concern; never "fix" CORS by disabling it.

## Output format
For each issue: `[Severity: Critical/High/Medium/Low] file:line — what + why + suggested fix`.
