# skillakia installer — one-command setup for Claude Code and Codex skills.
param(
  [Parameter(Position = 0)][string]$Target = "",
  [Parameter(Position = 1)][string]$Path = ""
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Show-Usage {
  Write-Host @"
Usage:
  install.ps1 claude [project-dir]  Install all skills for Claude Code.
                                    (default: ~/.claude/skills — all projects)
  install.ps1 codex <repo-dir>      Install merged AGENTS.md + skills/ into a repo for Codex.
  install.ps1 help                  Show this message.

Examples:
  .\install.ps1 claude
  .\install.ps1 claude C:\path\to\project
  .\install.ps1 codex C:\path\to\repo
"@
}

function Install-Claude([string]$Dest) {
  if (-not $Dest) { $Dest = Join-Path $HOME ".claude\skills" }
  New-Item -ItemType Directory -Force -Path $Dest | Out-Null
  Copy-Item -Recurse -Force "$ScriptDir\team-ai-skills\claude\skills\*" -Destination $Dest
  Copy-Item -Recurse -Force "$ScriptDir\spec-driven-pipeline\claude\skills\*" -Destination $Dest
  $n = (Get-ChildItem "$ScriptDir\team-ai-skills\claude\skills", "$ScriptDir\spec-driven-pipeline\claude\skills" -Directory).Count
  Write-Host "✔ Installed $n skills into $Dest"
  Write-Host "  Restart Claude Code, then run /skills to verify."
}

function Install-Codex([string]$Repo) {
  if (-not $Repo) { throw "codex requires a repo directory." }
  New-Item -ItemType Directory -Force -Path $Repo | Out-Null
  $ag = Join-Path $Repo "AGENTS.md"
  if (Test-Path $ag) {
    Write-Host "⚠  $ag already exists — left untouched."
    Write-Host "   Review it and merge with $ScriptDir\codex\AGENTS.md if needed."
  } else {
    Copy-Item "$ScriptDir\codex\AGENTS.md" -Destination $ag
    Write-Host "✔ Wrote $ag"
  }
  $skillsDest = Join-Path $Repo "skills"
  New-Item -ItemType Directory -Force -Path $skillsDest | Out-Null
  Copy-Item -Recurse -Force "$ScriptDir\codex\skills\*" -Destination $skillsDest
  $n = (Get-ChildItem "$ScriptDir\codex\skills" -File).Count
  Write-Host "✔ Installed $n skills into $skillsDest"
  Write-Host "  Codex reads AGENTS.md automatically at the repo root."
}

switch ($Target.ToLower()) {
  "claude" { Install-Claude $Path }
  "codex"  { Install-Codex $Path }
  "help"   { Show-Usage }
  default  { Show-Usage; exit 1 }
}
