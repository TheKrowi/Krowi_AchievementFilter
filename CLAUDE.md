# CLAUDE.md

@.github/copilot-instructions.md

The imported file is the canonical instruction file for this repository: project summary, build and validation, offline tooling, layout, load order, architecture, data formats, code style, git workflow and external references all live there. Do not duplicate any of it here; when it is wrong, fix it there. This file adds only what is specific to Claude Code.

## How Claude Code is wired to the tooling

- **Pre-tool guard hook**: `.claude/hooks/Guard-ToolUse.ps1` runs before every Bash, PowerShell, Edit, Write and MultiEdit call and denies the ones that have broken the repo before: `sed -i`/`perl -i`/`awk -i inplace` and Bash redirects or `tee` into a repo file (Git Bash writes LF), an inline `Invoke-WebRequest`/`curl` to `localhost:5000` (use the lookup scripts' parameters), and an `L[...]` string added above `AUTOGENTOKEN`. An edit under `Libs/` asks the user instead. The denial reason says what to do instead; scratch output goes to the scratchpad or `/tmp`, which it allows. It fails open.
- **Post-edit syntax hook**: `.claude/hooks/Check-LuaSyntax.ps1` runs after every Edit/Write of a `.lua` file (wired in `.claude/settings.json`) and feeds parse errors back. It fails open if the tooling is missing.
- **Stop hook**: `.claude/hooks/Check-RepoOnStop.ps1` runs `Check-Repo.ps1 -ChangedOnly` when a turn ends and hands errors back. Fix them, or add a deliberate exception to `.claude/tools/Check-Repo.ignore` with a comment.
- **Worktrees**: `.claude/settings.json` sets `worktree.baseRef` to `head`, so EnterWorktree with a name, `claude --worktree` and subagent `isolation: "worktree"` branch from the session's HEAD instead of `origin/main`, the months-old GitHub default branch. Those worktrees have no `Libs/` submodules, so the headless pipeline fails in them; for real work run `New-Worktree.ps1` and switch with EnterWorktree and its `path`. After the switch the hooks still run from the checkout the session started in (`$CLAUDE_PROJECT_DIR` stays put); the Stop hook lints the checkout the session's `cwd` is in, and the guard maps worktree paths onto the checkout's own.
- **Extend the harness, do not add dependencies**: new checks go under `.claude/tools/` and reuse the vendored Lua 5.1.5; never ask for winget, pip or npm installs.

## Subagents (`.claude/agents/`)

- `data-verifier` checks achievement ids against both game builds through the designated lookup scripts and runs the headless pipeline. Delegate to it before calling any data line dead.
- `taint-reviewer` reviews a diff for taint and secret-value hazards using the changelog's dev notes and the work folders' root causes as case law. Delegate to it after GUI or Blizzard-API changes.
- `Explore` subagents cannot reach `localhost:5000`; do game-database lookups from the main agent.

## Skills (`.claude/skills/`)

`add-achievement-data`, `add-category-data`, `add-zone-data`, `verify-achievement-data`, `migrate-to-shared`, `sync-mapverifier` and `release` each carry a `SKILL.md` with the workflow and the designated scripts. Use them for data work instead of improvising; the release skill is the only way to cut a version.

`process-issue` runs the work-item lifecycle (`docs/sdlc-playbook.md`) and is invoked before any work on an issue, bug report or feature. Its gates use AskUserQuestion with the recommended option first, and `plan.md` is written in plan mode.