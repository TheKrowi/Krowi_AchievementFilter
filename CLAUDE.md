# CLAUDE.md

@.github/copilot-instructions.md

The imported file is the canonical instruction file for this repository: project summary, build and validation, offline tooling, layout, load order, architecture, data formats, code style, git workflow and external references all live there. Do not duplicate any of it here; when it is wrong, fix it there. This file adds only what is specific to Claude Code.

## How Claude Code is wired to the tooling

The tooling every Krowi repo shares lives once, in Krowi_ClaudeKit (`E:\World of Warcraft Addon Development\Krowi_ClaudeKit`, private). This repo enables its `krowi` plugin in `.claude/settings.json` and keeps only what is its own. The kit's `README.md` describes its parts.

- **From the plugin**:
  - the guard hook, before every Bash, PowerShell, Edit, Write and MultiEdit call. It denies `sed -i`/`perl -i`/`awk -i inplace` and Bash redirects or `tee` into a repo file (Git Bash writes LF), an inline `Invoke-WebRequest`/`curl` to `localhost:5000` (use the lookup scripts' parameters), and an `L[...]` string added above `AUTOGENTOKEN`. An edit under `Libs/` asks the user instead.
  - the post-edit Lua syntax hook;
  - `krowi:release`, `krowi:process-issue` and `krowi:taint-reviewer`.
  - Both hooks fail open. A fix to any of them is made in the kit; a guard fix gets a case in the kit's `tests\Test-GuardToolUse.ps1`.
- **Stop hook** (this repo's): `.claude/hooks/Check-RepoOnStop.ps1` runs `Check-Repo.ps1 -ChangedOnly` when a turn ends and hands errors back. Fix them, or add a deliberate exception to `.claude/tools/Check-Repo.ignore` with a comment.
- **Kit helpers**:
  - this repo's own scripts reach the kit's Lua 5.1.5, `Get-WowBuilds.ps1` and the deprecated-API classifier through `.claude/tools/KitPath.ps1`;
  - without the kit, the lint runs its other rules and a `kit` Warning names the ones that need Lua and did not run;
  - `$env:KROWI_CLAUDEKIT` points them at a kit worktree for testing.
- **Worktrees**:
  - `.claude/settings.json` sets `worktree.baseRef` to `head`, so EnterWorktree with a name, `claude --worktree` and subagent `isolation: "worktree"` branch from the session's HEAD instead of `origin/main`, which lags every commit not yet pushed.
  - Those worktrees have no `Libs/` submodules, so the headless pipeline fails in them. For real work, run the kit's `New-Worktree.ps1` and switch with EnterWorktree and its `path`.
  - After the switch, the Stop hook still runs from the checkout the session started in (`$CLAUDE_PROJECT_DIR` stays put) and lints the checkout the session's `cwd` is in. The guard maps worktree paths onto the checkout's own.
- **Extend the harness, do not add dependencies**: a check only this repo needs goes under `.claude/tools/`, anything another repo could use goes into the kit, and both use the kit's Lua 5.1.5. Never ask for winget, pip or npm installs.

## Subagents

- `data-verifier` (`.claude/agents/`) checks achievement ids against both game builds through the designated lookup scripts and runs the headless pipeline. Delegate to it before calling any data line dead.
- `krowi:taint-reviewer` (the kit's) reviews a diff for taint and secret-value hazards. It uses the changelog's dev notes and the work folders' root causes as case law. Delegate to it after GUI or Blizzard-API changes.
- `Explore` subagents cannot reach `localhost:5000`; do game-database lookups from the main agent.

## Skills

`add-achievement-data`, `add-category-data`, `add-zone-data`, `verify-achievement-data`, `migrate-to-shared` and `sync-mapverifier` (`.claude/skills/`) each carry a `SKILL.md` with the workflow and the designated scripts. Use them for data work instead of improvising.

`krowi:process-issue` (the kit's) runs the work-item lifecycle, with this repo's own steps from `docs/sdlc-playbook.md`. It is invoked before any work on an issue, bug report or feature. Its gates use AskUserQuestion with the recommended option first, and `plan.md` is written in plan mode.

## Releasing

`krowi:release` is the only way to cut a version. This repo's facts for it:
- the release branch is `main`;
- uploads are `--stability stable`;
- the addon manager's release commit includes `.vscode/settings.json`, which is accepted here.

Its preflight runs `.claude/release-gate.ps1`. The gate needs:
- `Options/Window/Changelog.lua` to list the changelog's top entry (`.claude/tools/Build-ChangelogLua.ps1` writes it);
- green in-game runs (`/kaftest <suite>`, then `/reload`) on the newest build of each client the TOC's `## Interface:` claims, newer than the last change to the suite's file: `escape` and `options` on Retail, `options` on Mists Classic.

When a run differs from the headless model, update the model in `.claude/tools/headless/run-tests.lua` before releasing.