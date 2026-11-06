# Plan: KAF's options suite keeps what KAF can see
Spec: [spec.md](spec.md). Status: done

Intent and spec accepted (Krowi, 2026-11-06). Class `harness`; every gate asks. KAF worktree `...\Krowi_AchievementFilter\.claude\worktrees\feature-2026-11-06-options-tests-move`, branch `feature/2026-11-06-options-tests-move` from `main` (`c96f4387`).

## Context
`Tests/Options.lua` (2077 lines) carries about 45 steps that test the Krowi_Options library. The library's own test addon now has equals for them, green on Retail (60/0) and Mists (60/0) beside KAF's own run (96 passed; only `window-tabs` and `window-second-tab` fail, and only because the test addon adds tabs). KAF keeps its own steps plus a public smoke.

## Files that change
- **`Tests/Options.lua`** (edited by deletion, plus a small public smoke): scenario list near lines 246-611 and the generated live steps (`live-*`, `section-*`, the step tables near 1100-1850, `smokeSteps` and `behaviour` near 1995, `Remember`/`Restore` near 1800-1850).
  - delete the scenarios and live steps listed in the spec's requirement 2, and any helper only they use;
  - rewrite `window-tabs`: KAF's tab is registered as "Achievement Filter" (no whole-list assertion); drop `window-second-tab`;
  - keep the A scenarios of requirement 1 untouched;
  - new live steps through the public surface only: `open` (`Controller:Open()`, shown via `GetFrame():IsShown()`), `close` (`Toggle()` or a second `Open` path, hidden), `lua-errors` (kept as is), `restore` (snapshot and put back KAF's saved `Window` block through `Controller:GetSaved()`, not `lib.Shared`/`lib.Tabs`);
  - `smokeSteps` = `open`, `close`, `lua-errors`; `behaviour` goes; `SelectSteps` still resolves `smoke`.
- **`Tests/README.md`** (options section): the suite is KAF's own; the library's tests are `Krowi_Libraries\Krowi_Options` `Tests/` (`/kotest`, `Tests/headless`).
- **`.claude/tools/headless/run-tests.lua`**: only where it names a removed step (the `options` lines near 1623-1642 run `Run()`/`Observations()`; the `escape` stand-in at 394-411 stays).
- **`Check-Repo.ps1`/ignore/jobs lists**: only if a rule names a removed step or the scenario count (run the lint to see).
- **new `docs/work/2026-11-06-options-tests-move/plan.md`** (this plan) and `gates.md` rows.
- No file under `Gui/`, `Options/`, `Data/`, `Libs/`.

## Order of work
1. Baseline: headless `run-tests.lua options` and `escape` and `Check-Repo.ps1 -ChangedOnly` before any edit (recorded in the plan's Proof).
2. The edit of `Tests/Options.lua` is large and mostly deletion, so an Opus agent does it from this plan with the spec's two lists, in this worktree only; I review the diff (every deleted step has an equal in `Krowi_Libraries\Krowi_Options\Tests`, checked by name against the test addon's `Steps.lua`/`Scenarios.lua`).
3. `Tests/README.md`, then headless `options` and `escape` green, then `Check-Repo.ps1` 0 errors.
4. Deploy this worktree to Retail and Mists (`Deploy.ps1 -WhatIf` first), `Run-GameTests.ps1 options, escape -Client Retail` and `options -Client Classic`; BugGrabber clean. The library's test addon stays installed: the KAF run must pass with its extra tabs present (the rewritten `window-tabs` is the guard). Afterwards deploy KAF's `main` back so the game holds `main`'s build, and say so.
5. Gate rows (plan, merge later), `Get-ChangeClass.ps1` (expect `harness`), `/code-review`, push, PR against `main`, `Status: done` on the work files.

## Risks
- A deleted step with no real equal: the by-name check and the side-by-side runs are the guard; a step with no equal is kept or its equal is added to the test addon first.
- `Remember`/`Restore` of the public smoke touches the player's saved window block: it must put it back exactly (the old restore step is the model).
- KAF's release gate (`.claude/release-gate.ps1`) asks for green `options`/`escape` runs newer than the suite's last change; this change makes the old runs stale, so the new runs in step 4 count.
- The two-copy gate's smoke names `options smoke` + `escape`; it still exists (3 steps), and the kit's `TwoCopy.psd1` is updated in its own PR.

## Proof
Headless: `& "...\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" options` and `escape`; `& ".claude\tools\Check-Repo.ps1" -ChangedOnly`; in game as in step 4; `Get-ChangeClass.ps1`; the side-by-side evidence from 2026-11-06 (KAF 96/2 with the two tab failures explained; test addon 60/0 on both clients).

## Where the build departed from the plan
- An Opus agent made the cut. What it was not allowed to touch, I fixed: two stale `diagnostics.globals` entries in `.luarc.json` (`RESET_TO_DEFAULT`, `SETTINGS_TITLE`, read only by deleted steps), and stale usage text in `.claude/tools/Run-GameTests.ps1` and `Tests/Tests.lua`.
- `smokeSteps` is `open` and `close`: `lua-errors` and `restore` run at the end of every run, so they are not entries of the set.
- `open` runs `/kaf` (KAF's slash command, which calls the tab's `Open`), so the command stays tested; it also checks that `GetSaved().LastSection` is the landing section.
- `restore` deep-copies the whole `GetSaved()` table, not only `.Window`, since `/kaf` also writes `LastSection` and `Seen`.
- `RunStep`'s mouse branch, `WaitForMouse`, `mouseWait` and `pollEvery` went with `toggle-reset-clipped`, the only step that used them.

## Results (2026-11-06)
- Headless: `options` 27 passed (39 before) on Retail and Classic, `escape` 34 on both; lint 0 errors, one changelog warning (tests only, nothing player-facing).
- In game with the library's test addon installed: Retail `options` 30 passed, 0 failed, 1 skipped (`y-on-new-install`, headless only) and `escape` 34 of 34; Mists `options` 30, 0, 1; BugGrabber clean on both. Before the cut, the same install gave 96 passed and 2 failed on both clients: `window-tabs` and `window-second-tab`, which assumed KAF is the only tab.
- The library's equals, by name: every deleted step is in `Krowi_Options` `Tests/Krowi_OptionsTests` (60 passed, 0 failed on Retail and on Mists, 2026-11-06).
- Coverage given up on purpose, said in the pull request: no step draws KAF's own 22 sections in game any more (a KAF label running into its control, or a control not showing its value, goes unseen), and the KAF half of `search-all-none` (KAF's holiday list count) is not kept.
- Still reading library internals in kept steps: `window-tabs` (`lib.Tabs`, `Config.TabName`), `library-strings` (`Controller.Config.Strings`), `overview-cards` (`Config.GetElements`, `lib.CardColumns`); the library's structure phase changes them in a paired KAF pull request.