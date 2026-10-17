# Intent: The kit is the one home of the addon tooling
Author: Krowi (maintainer). Source: idea, asked on 2026-10-16 after a look at what Krowi_ClaudeKit does. Status: done

## Problem
The Claude Code tooling for Krowi's addons exists twice, once in this repo's `.claude/` and once in the private Krowi_ClaudeKit:
- The kit was generalised from this repo on 2026-10-14 and serves the other repos as the `krowi` plugin (Krowi_Vendorer, Krowi_Brokers_Currency, and Krowi_ExtendedVendorUI once its PR #89 merges).
- This repo never opted in. It keeps its own guard hook, Lua syntax hook, `Deploy`, `Read-GameErrors`, `Read-GameScreenshot`, `Update-UiSource`, `New-/Remove-Worktree`, release skill, `process-issue`, `taint-reviewer` and vendored Lua 5.1.5.
- The only link between the copies is a rule to port each change to the other side by hand. Two days after the split, none of the 11 shared files is identical any more, and a fix in one place does not reach the other.

## Proposed outcome
The kit is the one place where every reusable piece of tooling for Krowi's addons and libraries lives. Every repo uses it, this one included, and no repo keeps a copy of a reusable piece. What only makes sense in one repo (here: the data skills, the repo lint, the headless pipeline, the scenario readers) stays in that repo. This repo is the main repo and the heaviest user, so where its version of a shared piece is better, that version is the one the kit keeps. A change to a reusable piece is made once, in the kit, and reaches every repo.

## Affected users and systems
- This repo's `.claude/` (hooks, tools, skills, agents, settings), `CLAUDE.md`, `.github/copilot-instructions.md`, `CONTRIBUTING.md`, `REVIEW.md`, `docs/sdlc-playbook.md` and `.claude/tools/README.md`, which describe the tooling by its current paths.
- Krowi_ClaudeKit: its plugin, tools, skills, agent, tests, `WowAddons.md` and README.
- The opted-in repos, which already use the kit and pick up its changes at their next session start.
- Contributors to this public repo: they lose the harness, because the kit is private. Krowi accepted this on 2026-10-16.
- No player-facing change: nothing under `.claude/` or `docs/` ships.

## Constraints
- Nothing this repo can do today is lost: every check, hook, skill, agent, suite reader and data workflow still works from this repo after the move, also in worktrees and headless runs.
- The other repos lose nothing, and do not get this repo's data skills as noise.
- Self-contained tooling: no installs, the vendored Lua 5.1.5 only.
- The release skill still runs only in the main session, and nothing weakens a release safeguard.
- Sessions running in the other repos during the work keep working tooling.

## Open questions
- Which pieces count as reusable, and which as specific to this repo.
- Which of this repo's fixes the kit's versions lack, and the reverse.
- How this repo's remaining tools reach the kit's shared helpers (the vendored Lua, the game-database build lookup).
- What stays of `docs/sdlc-playbook.md` and the contributor documents once the shared tooling they describe is private.