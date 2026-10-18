# Plan: Paste-to-chat calls a deprecated global
Spec: [spec.md](spec.md). Status: done

## Files that change
- `Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua` line 119: `ChatEdit_InsertLink(achievementLink)` becomes `ChatFrameUtil.InsertLink(achievementLink)`.

Routine plan: a one-to-one replacement by the function the alias points to, in a click handler; no Blizzard hook, frame, saved variable or data change.

## Order of work
1. Reproduction: `Find-DeprecatedApi.ps1` for `live`, `classic` and `classic_titan`, recorded in `spec.md`. No scenario: the behaviour does not change, and the suites have no paste-to-chat case to pin it.
2. The edit; the post-edit syntax hook.
3. `Find-DeprecatedApi.ps1` for the three branches: clean. `Check-Repo.ps1 -ChangedOnly`.
4. `taint-reviewer` is not needed (no GUI structure, hook or protected-API change); `/code-review` per `REVIEW.md`.
5. In game, Retail and Mists Classic: `Deploy.ps1 -WhatIf`, deploy with Krowi's approval (two other AchievementFilter sessions are open), `/reload`, paste-to-chat check, second `/reload`, `Read-GameErrors.ps1`.
6. Work files to `done`, push, PR against `dev`.

## Risks
- A wrong name turns a working click into an error: the scan after step 2 and the in-game paste check catch it.
- The main checkout has uncommitted TOC and backlog changes: the worktree is off `dev` and touches none of them.

## Proof
- `Find-DeprecatedApi.ps1 -Branch <b>` prints `No uses found.` for `live`, `classic` and `classic_titan`.
- The link lands in the chat edit box on both clients; `Read-GameErrors.ps1` shows no new AchievementFilter row.

## How it went (2026-10-14, finished by another session after this one ended)
- The branch was rebased onto `dev` at `6fcd11ba` (#342 and the locale export) before the in-game run, so the deploy matched the `dev` it merges into.
- `Find-DeprecatedApi.ps1` on the rebased branch: `No uses found.` for live, classic and classic_titan. `Check-Repo.ps1`: 0 errors.
- In game, Retail and Mists Classic: the link was pasted (Krowi); `Read-GameErrors.ps1` showed no AchievementFilter error on either client.
- `/code-review` (low) found that the change is player-visible after all: with the `loadDeprecationFallbacks` CVar off the alias is never defined, so the click errors today. Hence a changelog line under 104.0, Fixed, and the corrected intent and spec. It also found that hooks on `ChatFrameUtil.InsertLink` now run on this call, which matches Blizzard's own achievement list (spec, Areas of concern).
- Departures:
  - Step 1 had no scenario. The reproduction stays the deprecated-API scan, before and after. The guard against this class of bug is a lint rule, which this repo does not have yet: row 32 of `docs/codebase-analysis.md`.
  - Step 4 skipped the `taint-reviewer`, but REVIEW.md asks for it on any GUI change, so it ran on the diff. It found no new taint or secret-value hazard: the same Blizzard function ran tainted through the alias. The hooks that now run keep the return value and touch only their own edit boxes. The tainted writes `InsertLink` makes (Retail chat-focus globals, edit box tab-complete fields, the macro window's `textChanged` in combat) predate this change. They are the same ones Blizzard's own achievement list and `Gui/BlizzardOverrides.lua:87` make.
- Declined review findings:
  - A guard for a missing `ChatFrameUtil`: every client the `.toc` lists has it (spec, option 2).
  - Sharing the insert with `Gui/BlizzardOverrides.lua:79-88`, and removing the dead social-post fallback after it: out of scope.