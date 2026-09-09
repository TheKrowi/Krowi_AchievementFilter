# CLAUDE.md

@.github/copilot-instructions.md

The imported file is the canonical instruction file for this repository: project summary, build and validation, offline tooling, layout, load order, architecture, data formats, code style, git workflow and external references all live there. Do not duplicate any of it here; when it is wrong, fix it there. This file adds only what is specific to Claude Code.

## How Claude Code is wired to the tooling

- **Post-edit syntax hook**: `.claude/hooks/Check-LuaSyntax.ps1` runs after every Edit/Write of a `.lua` file (wired in `.claude/settings.json`) and feeds parse errors back. It fails open if the tooling is missing.
- **Stop hook**: `.claude/hooks/Check-RepoOnStop.ps1` runs `Check-Repo.ps1 -ChangedOnly` when a turn ends and hands errors back. Fix them, or add a deliberate exception to `.claude/tools/Check-Repo.ignore` with a comment.
- **Extend the harness, do not add dependencies**: new checks go under `.claude/tools/` and reuse the vendored Lua 5.1.5; never ask for winget, pip or npm installs.

## Subagents (`.claude/agents/`)

- `data-verifier` checks achievement ids against both game builds through the designated lookup scripts and runs the headless pipeline. Delegate to it before calling any data line dead.
- `taint-reviewer` reviews a diff for taint and secret-value hazards using the changelog's dev notes as case law. Delegate to it after GUI or Blizzard-API changes.
- `Explore` subagents cannot reach `localhost:5000`; do game-database lookups from the main agent.

## Skills (`.claude/skills/`)

`add-achievement-data`, `add-category-data`, `add-zone-data`, `verify-achievement-data`, `migrate-to-shared`, `sync-mapverifier` and `release` each carry a `SKILL.md` with the workflow and the designated scripts. Use them for data work instead of improvising; the release skill is the only way to cut a version.