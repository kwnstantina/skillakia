#!/usr/bin/env bash
# skillakia installer — one-command setup for Claude Code and Codex skills.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  cat <<'EOF'
Usage:
  install.sh claude [project-dir]  Install all skills for Claude Code.
                                   (default: ~/.claude/skills — all projects)
  install.sh codex <repo-dir>      Install merged AGENTS.md + skills/ into a repo for Codex.
  install.sh --help                Show this message.

Examples:
  ./install.sh claude
  ./install.sh claude ~/my-project
  ./install.sh codex ~/my-repo
EOF
}

install_claude() {
  local dest="${1:-$HOME/.claude/skills}"
  mkdir -p "$dest"
  cp -R "$SCRIPT_DIR/team-ai-skills/claude/skills/." "$dest/"
  cp -R "$SCRIPT_DIR/spec-driven-pipeline/claude/skills/." "$dest/"
  local n
  n=$(find "$SCRIPT_DIR/team-ai-skills/claude/skills" "$SCRIPT_DIR/spec-driven-pipeline/claude/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
  echo "✔ Installed $n skills into $dest"
  echo "  Restart Claude Code, then run /skills to verify."
}

install_codex() {
  local repo="${1:-}"
  if [ -z "$repo" ]; then
    echo "error: install.sh codex requires a repo directory." >&2
    usage
    exit 1
  fi
  mkdir -p "$repo"
  if [ -e "$repo/AGENTS.md" ]; then
    echo "⚠  $repo/AGENTS.md already exists — left untouched."
    echo "   Review it and merge with $SCRIPT_DIR/codex/AGENTS.md if needed."
  else
    cp "$SCRIPT_DIR/codex/AGENTS.md" "$repo/AGENTS.md"
    echo "✔ Wrote $repo/AGENTS.md"
  fi
  mkdir -p "$repo/skills"
  cp -R "$SCRIPT_DIR/codex/skills/." "$repo/skills/"
  local n
  n=$(find "$SCRIPT_DIR/codex/skills" -mindepth 1 -maxdepth 1 -type f | wc -l | tr -d ' ')
  echo "✔ Installed $n skills into $repo/skills"
  echo "  Codex reads AGENTS.md automatically at the repo root."
}

case "${1:-}" in
  claude) install_claude "${2:-}" ;;
  codex)  install_codex "${2:-}" ;;
  --help|-h|help) usage ;;
  *) usage; exit 1 ;;
esac
