# Plan: The tab factory installs its hooks once, not once per tab
Spec: [spec.md](spec.md). Status: accepted

## Context
`AchievementFrameTabButtonFactory:GetNew` guards its hook installation with `#ourTabs == 0`, but `ourTabs` is keyed from 4 (3 on Wrath), so with KAF's five tabs every hook goes in four times and one tab change runs the factory's `AchievementFrame_UpdateTabs` four times (spec, Root cause). Krowi's decision (2026-11-13): option 1, a file-local flag. Branch `fix/2026-11-13-tab-hooks-once-b` in the agent worktree `.claude/worktrees/agent-a76d5e1157c553018` (the kit worktree `fix-2026-11-13-tab-hooks-once` was not writable for this session); intent and spec committed as 0c93443f.

## Files that change
- `Tests/Navigation.lua`: a third scenario list, `navigation.HookScenarios`, with one scenario:

  | Scenario | Steps | Counts | Recorded | Target |
  |---|---|---|---|---|
  | `tab-update-runs-once` | from a closed window, select KAF's Achievements tab, then Blizzard's Statistics tab | how often the factory's `AchievementFrame_UpdateTabs` runs during the Statistics selection | 4 | 1 |

  - **Counting:** `RunHookScenario` replaces the method `AchievementFrame_UpdateTabs` on `addon.Gui.AchievementFrameTabButtonFactory` (the addon's own table, not a Blizzard one) with a counting wrapper around whatever is there, selects the tab through `env.SelectTab` inside `pcall`, and puts the saved function back before it reads the count or raises. Each installed hook calls `self:AchievementFrame_UpdateTabs(...)` on the factory at call time, so the count is the number of installed `AchievementFrame_UpdateTabs` hooks that one Blizzard tab click reaches. Saving and restoring whatever is there keeps GW2_UI's `hooksecurefunc` wrapper on that method intact.
  - **Why Statistics after Achievements:** one Blizzard tab click is one call of `AchievementFrameBaseTab_OnClick`, which calls `AchievementFrame_UpdateTabs` once (`Blizzard_AchievementUI.lua:441`, Cata `:166`); the window is already open, so no OnShow runs in between, and the tab exists on every client and for every character (Guild needs a guild). Selecting a KAF tab again is no test: its `Select` does nothing on the selected tab.
  - The line follows the history scenario's form: `navigation/tab-update-runs-once: PASS recorded=4 got=4 target=1 open`.
  - `navigation.Run` runs the new list after the history scenarios; both environments already provide `Reset` and `SelectTab`, so the in-game environment needs nothing new and the scenario runs in `/kaftest navigation` as well. Teardown puts the window and its tab back as today.
- `.claude/tools/headless/run-tests.lua`, `suites.navigation`: the model's `addon.Tabs`/`addon.TabsOrder` get KAF's five tabs (Achievements, Expansions, Events, PvP, Specials, each `Categories = { {} }`, `Filters = {}`) instead of Achievements alone. A scratch copy of the runner with this change gave 4 runs on one Statistics click on Retail and Classic and left all nine existing navigation scenarios passing (2026-11-13). The header comment's navigation entry names the tab factory's hooks.
- `Tests/README.md`, the `navigation` row: a `<br>`**Tab hooks** paragraph (docs/work/2026-11-13-tab-hooks-once): how often one Blizzard tab click runs the tab factory's update, counted through the factory's own method; headlessly against the model with KAF's five tabs.
- `Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonFactory.lua`: `local hooksInstalled` below `local onClick`; `if #ourTabs == 0 then` becomes `if not hooksInstalled then` followed by `hooksInstalled = true`. Nothing else in the block moves.
- `_Packaging/Changelog.md`: unchanged; Krowi at the plan gate (2026-11-13): "no changelog".
- This folder: `plan.md`, `gates.md`, and `spec.md` if the in-game count differs from 4.

## Order of work
1. **Test first.** The scenario, the five-tab model, the README paragraph and the header line. Headless `navigation`: the new scenario PASSes with 4 and is open against 1, on Retail and Classic; the other nine unchanged. Commit `test: reproduce 2026-11-13-tab-hooks-once in the navigation suite`.
2. **In-game before-run (GUI rule).** `Deploy.ps1 -WhatIf`, deploy to Retail and Mists in turn, `Run-GameTests.ps1 navigation` (`-Client Classic` for Mists), `Read-GameTests.ps1`: no FAIL, no unexplained difference from headless. If the game's count is not 4 (its Lua may grow tables differently), `Recorded` becomes the game's number, the model gets a note, and the spec's table a line. Commit.
3. **Fix.** The flag in the factory file, nothing else. Headless with `Recorded` still 4: the scenario must FAIL with `got=1` on both clients, which proves it sees the fix. Then `Recorded` = 1 in the same commit as the fix (`fix(gui): the tab factory installs its hooks once`): PASS, target met.
4. No changelog line (Krowi); `plan.md` updated where the build departed from it.
5. **Feedback loop:** `Check-Repo.ps1 -ChangedOnly`; headless `navigation`, `earned`, `escape`, `plugins` on both clients; `krowi:taint-reviewer` on the diff; `/code-review`; fix what they find.
6. **In-game after-run:** deploy, `Run-GameTests.ps1 navigation` on Retail and Mists, `Read-GameTests.ps1` (`got=1`, no FAIL), `Read-GameErrors.ps1` (no new row, no bumped count).
7. **Deploy stage:** `Get-ChangeClass.ps1`, work files `Status: done`, commit by explicit path, push, PR against `main` with the "Decisions taken without asking" section.

## Risks
- **The game's count may differ from the headless 4.** Step 2 records what the game shows; the target is 1 either way.
- **The scenario selects Blizzard's Statistics tab from addon code**, which the existing navigation scenarios already do (`statistics-tab`); debug mode only, a `/reload` before combat as for every suite.
- **Replacing a method on the factory during the run:** only the addon's own table, restored inside the same scenario, also when `SelectTab` raises (`pcall`). A skin that hooked the method keeps its hook.
- **Five tabs in the model** could change other navigation scenarios; the scratch run showed none, step 1 re-runs them.
- **Wrath's `PanelTemplates_SetTab` branch** is in neither the headless model (it runs the Mists branch) nor a local client; the flag covers it by the code reading only.
- **The comparison hook** stays dead (one wrapper instead of four), out of scope (spec, Areas of concern).

## Proof
- Headless `navigation`: before the fix 10 passed, 1 open (`got=4 target=1`); with the fix and `Recorded` 4, one FAIL (`got=1`); after, 10 passed, 0 open. `earned`, `escape`, `plugins` unchanged. `Check-Repo.ps1 -ChangedOnly` clean.
- In game, Retail and Mists: before-run `got=4` (or the game's number, recorded), after-run `got=1`, no FAIL, no addon error.
- `krowi:taint-reviewer`: no new hazard. `/code-review`: findings fixed or listed in the PR.