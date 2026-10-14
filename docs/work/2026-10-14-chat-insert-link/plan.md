# Plan: Paste-to-chat calls a deprecated global
Spec: [spec.md](spec.md). Status: accepted

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