# skillakia

A personal "super skill set" for software development and tech leadership — a collection of modular agent skills that load only when needed.

## Quick start

```bash
git clone https://github.com/kwnstantina/skillakia.git
cd skillakia

# Claude Code — all skills (all projects)
./install.sh claude          # or .\install.ps1 claude on Windows

# Claude Code — one project only
./install.sh claude /path/to/project

# Codex — merged AGENTS.md + skills/ into a repo
./install.sh codex /path/to/repo
```

After a Claude Code install, restart and run `/skills` to verify all 20 skills are discovered. Codex reads `AGENTS.md` automatically at the repo root.

## Structure

| Path | Contents |
|------|----------|
| `team-ai-skills/` | 11 craft skills (Claude + Codex flavors) |
| `spec-driven-pipeline/` | 9 spec → code pipeline skills (Claude + Codex flavors) |
| `codex/` | Merged, ready-to-copy `AGENTS.md` + combined `skills/` for Codex |
| `install.sh` / `install.ps1` | One-command installers (bash / PowerShell) |

Each pack ships two flavors:

- `claude/skills/<name>/SKILL.md` — Claude Code skills (auto-discovered)
- `codex/skills/<name>.md` — Codex skills (referenced by `AGENTS.md`)

## Skills

### team-ai-skills

`adr`, `api-contract`, `code-review`, `compliance-checklist`, `conventional-commits`, `debug-systematic`, `guardrails`, `migration-upgrade`, `repo-onboarding`, `security-review`, `write-tests`

### spec-driven-pipeline

`ac-analysis`, `code-gen`, `risk-report`, `spec-author`, `spec-flow`, `story-intake`, `technical-plan`, `test-gen`, `verify`

See each pack's README for the full pipeline diagram and customization notes.
