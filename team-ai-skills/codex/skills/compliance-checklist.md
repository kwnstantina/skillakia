# Compliance Checklist (banking / insurance)

Apply when working on anything touching customer data, payments, or regulated flows. Default to caution.

## Data protection
- PII (names, IDs, addresses, DOB, account numbers): minimize collection; mask in logs and screens.
- Never log PII, passwords, tokens, or full card/account numbers.
- Encrypt sensitive data at rest and in transit (TLS everywhere).

## Access & audit
- Least privilege: scopes/roles limited to what's needed.
- Every sensitive action must be attributable (audit log with user + timestamp + correlation ID).
- Secrets via Azure Key Vault + Managed Identity, never in code or config.

## Retention & deletion
- Know the retention policy for the data you touch; don't keep data longer than required.
- Support the right to erasure (GDPR) — implement real deletion paths, not just "hide".

## Output
When uncertain about compliance impact, stop and ask; do not guess.
