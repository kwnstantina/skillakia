# Team AI Skills

Shareable "skills" (instruction packs) for AI coding agents — **Claude Code** and **Codex**.

Two formats included:

```
team-ai-skills/
├── claude/skills/<name>/SKILL.md   # Claude Code skills
└── codex/
    ├── AGENTS.md                   # master instructions (Codex)
    └── skills/<name>.md            # same skills, Codex format
```

## Install — Claude Code

Copy each skill folder into `~/.claude/skills/`:

```bash
cp -r claude/skills/* ~/.claude/skills/
```

Claude Code auto-discovers skills by their `description` frontmatter and applies them when relevant.

## Install — Codex

Copy into each repository (or commit them so the whole team gets them automatically):

```bash
cp codex/AGENTS.md /path/to/your/repo/AGENTS.md
cp -r codex/skills /path/to/your/repo/skills
```

Codex reads `AGENTS.md` at the repo root and follows its instructions, including reading the `skills/*.md` files when a task matches.

## Skills included

| Skill | Purpose |
|---|---|
| `guardrails` | Always-on safety & quality rules (secrets, destructive cmds, planning) |
| `repo-onboarding` | Quickly learn a repo: build/test/run, structure, conventions |
| `security-review` | OWASP top issues for C#/.NET + React; secrets handling |
| `code-review` | PR review checklist (C#/.NET + React/TypeScript) |
| `conventional-commits` | Commit, PR title & description style |
| `write-tests` | xUnit/NUnit + React Testing Library patterns |
| `debug-systematic` | Debugging protocol + Azure Application Insights |
| `migration-upgrade` | Safe framework/package upgrades (plan-first) |
| `adr` | Architecture Decision Record template |
| `api-contract` | Keep backend ↔ frontend API contracts in sync |
| `compliance-checklist` | Banking/insurance data protection & audit rules |

## Customize

1. Fill in the team-specific blanks in `repo-onboarding` (build/test/run commands).
2. Adjust conventions in `code-review`, `write-tests`, and `conventional-commits` to match your actual repos.
3. Add repo-specific rules to `codex/AGENTS.md` (or a `CLAUDE.md` at each repo root for Claude Code).

## Share with the team

Commit this folder to a shared repo, or distribute via your docs/wiki, and tell the team to run the two install commands above.
