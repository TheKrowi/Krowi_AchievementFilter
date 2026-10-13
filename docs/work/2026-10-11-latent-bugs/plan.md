# Plan: Three latent bugs found while exploring achievement guides
Spec: [spec.md](spec.md). Status: done

Approved by Krowi (maintainer) on 2026-10-11 in plan mode. It touches shared GUI code (the right-click menu, the tooltip, the options), so it waited for that gate.

Results and departures:
- **Before-run, 2026-10-11, from bf0eb2f5 (Retail 12.1.0, Classic 5.5.4).** `/kaftest menu` matched the headless run with 0 differences on both clients. The missing entry linked to 49 and gave got=enabled. The Xu-Fu link raised "Cannot find a library instance of "Krowi_PopupDialog-1.0"" at `PetBattleLinks.lua:36` (Retail), and the Tutorial button raised it for "Krowi_MenuBuilder-1.0" at `General.lua:62` on both clients. `/kaftest tooltip` recorded no run, because its Ready check waits for the set items on a first manual run. Fixes A and B went ahead; C waits for that before-run.
- **A deploy from another worktree** (the guide feature's) replaced this branch's Retail deploy and deleted `Tests/Menu.lua` before the first in-game run. Deploys now wait for the maintainer's approval while other sessions are active.
- **The worktree first linked `Libs/` with junctions.** That made `git diff` fail, so `Check-Repo.ps1 -ChangedOnly` silently missed modified files. It was converted to offline clones of the submodules, the way `New-Worktree.ps1` makes them.
- **Fix C before its before-run, 2026-10-13, at Krowi's word** ("In game test we will run later today. This should not stop you for now."). C changes no behaviour: `tooltip/most-progress-transmog-set` is "shown" before and after. So one in-game tooltip run from the branch head shows the recorded behaviour, and it doubles as the after-run. On the same word, the branch is pushed and the PR opened before the after-run; the merge waits for it.
- **The changelog lines went under 103.0**, the next version once 102.0 had shipped, in A's and B's commits.
- **Rebased onto `dev` 01979513** on 2026-10-13, without conflicts.
- **`/code-review` (medium) on PR #339: 14 findings.**
  - **Fixed, `library-names`:**
    - it now also checks `Libs/Libs.lua`, the addon's own bootstrap, which asks for `Krowi_ProgressBar_2` and `Krowi_Tutorials_3`;
    - it skips silent lookups (`, true`) and calls in comments;
    - it warns and skips when a submodule has no Lua files, instead of failing every correct call site;
    - its advice no longer names libraries;
    - it reads `Libs/` from the lint's file cache and only splits files that mention a library. That took it from 780 ms to 111 ms per Stop hook.
  - **Fixed, tests:**
    - the tooltip suite's `string.SetColorRed` stub now lives only for its scenarios, so it no longer leaks into later suites;
    - `Ready.menu` finds its id by field, not by position;
    - the `Tests/Menu.lua` header reads as history.
  - **To the backlog:** `AddGoToAchievementLine` concatenates a nil name when the game does not know the linked id, so the whole menu errors. It predates this work and needs its own scenario and before-run.
  - **To the in-game run:** the Tutorial handler calls `SettingsPanel:Close()`, which a comment in the same file blames for a "blocked from an action" message. Fix A makes that handler reachable for every player. The after-run watches for the message.
  - **Not changed:**
    - `PetBattleLinks.lua` looks the dialog up after inserting its section, as `WowheadLink.lua` does; the lint now catches the rename that would break it.
    - `NewSubmodule` names are not collected, because no call site asks for one by name.
    - The tooltip suite's `Kind` branches follow the approved plan.
    - `most-progress-transmog-set` is not yet verified in game; this afternoon's run does that.
- **After-run, 2026-10-13, from 166ecebf** (Retail 12.1.0, Classic 5.5.4).
  - **Retail.**
    - `/kaftest escape`: 23 passed, 0 differences from headless.
    - `/kaftest menu`: the missing entry gave got=disabled.
    - `/kaftest tooltip`: `transmog-set-progress` done. `most-progress-transmog-set` gave got=**hidden** where the headless model said shown.
    - The Xu-Fu link and the Tutorial button raised no error.
  - **Classic.**
    - `/kaftest menu`: 2 passed, 0 differences from headless.
    - The Tutorial page raised `ADDON_ACTION_FORBIDDEN` for `SpellStopCasting()`: `General.lua:51` → `SettingsPanel:Close` → `ExitWithCommit` → `TransitionBackOpeningPanel` → `ToggleGameMenu` (`Blizzard_UIParent/Mists/UIParent.lua:1460`).
    - The `Krowi_MenuBuilder-1.0` error BugSack still listed dates from the before-run (2026-10-11 11:31); the deployed `General.lua` matched the branch.
  - **Reward preview on Classic:** Escape closes it together with the achievement window. It never registered for Escape (`Gui/FramesForClosing.lua`), unlike the guide panel since #338, on both clients. Put to Krowi as a separate question.
- **The tooltip scenario after the run.**
  - Recorded and Target are now "hidden", the verified behaviour; Krowi's C2 decision was to keep today's behaviour.
  - The headless model's criteria count went from 2 to 0, and the in-game run now records the count as an observation.
  - The spec's root cause C carries the correction.
- **Fix D, found by the after-run: the Tutorial and Screenshot Mode close the settings panel through the game menu.**
  - Cause: `SettingsPanel:Close()` without an argument goes back to the panel it was opened from through `ToggleGameMenu()` (`Blizzard_SettingsPanel.lua:250-268`, both clients).
  - On Mists Classic, `ToggleGameMenu()` calls the protected `SpellStopCasting` from the addon's tainted path. On Retail it runs the Escape handlers securely, then shows the game menu, so a click acted like an extra Escape press.
  - Fix A made the Tutorial reachable for every player, and `HandleScreenshotMode` already carried a comment about a "blocked" message.
  - The fix is `SettingsPanel:Close(true)`: it still commits and hides the panel, without the transition.
  - **The `taint-reviewer` confirmed it on both clients:** `Close(true)` runs a strict subset of the old path. It added two cases the old code also had wrong, now covered by one helper, `CloseSettingsPanel`:
    - with unapplied settings, `Close` shows Blizzard's discard popup from addon code, and its buttons would then take the forbidden way tainted;
    - in combat, `HideUIPanel` refuses addon code.

    In both cases the helper leaves the panel open for the player to close.
  - The reviewer also found that `addon.Util.IsWrathClassic` is never defined. The helper replaces the two dead `InterfaceOptionsFrame:Hide()` branches; the other 18 reads went to `docs/backlog.md`, and the instruction file no longer names the flag.
  - Guard: the `settings-close` lint rule, test first (it flagged `:51` and `:107`, held in the ignore file for one commit), on the same footing as A's `library-names`.
  - A changelog line was added under 103.0.

## Context
While exploring achievement guides, three bugs turned up, each left behind by a rework:
- **A.** Stale library names: Xu-Fu pet-guide links error, and the options Tutorial menu errors unless another Krowi addon is installed.
- **B.** "(Missing)" right-click entries are not greyed out, because of an inverted `isEnabled` argument.
- **C.** A dead transmog check in the "Most progress" tooltip section.

The maintainer decided:
- one work item and one PR;
- A is guarded by a new `library-names` lint rule;
- C keeps today's behaviour, and only the dead code goes;
- strict in-game order: the work stops after the guards commit until the maintainer's before-run.

All work happens in the worktree. Nothing touches the main checkout or the other sessions.

## Files that change
**Commit 1, the guards (`test: reproduce 2026-10-11-latent-bugs in the menu suite and the library-names rule`)**
- `.claude/tools/Check-Repo.ps1`: rule `library-names` [Error].
  - Header table entry.
  - A new section after `globals` (`:373`). It collects the names `Libs/` registers: every `NewLibrary(` call, either with a literal or with a local set to a literal in the same file; function definitions and unresolvable arguments are skipped. It uses `Get-ChildItem -Recurse -FollowSymlink` so a worktree with junctioned submodules works.
  - Then it scans every file in `$ownLuaFiles` for literals passed to `LibStub(`, `LibStub:GetLibrary(` and `KROWI_LIBMAN:GetLibrary(`.
  - Added to `$alwaysOn` (`:699`), like `removed-api`.
- `.claude/tools/Check-Repo.ignore`: `library-names Gui/RightClickMenu/AchievementMenu/PetBattleLinks.lua` and `library-names Options/General.lua`, each with a comment pointing to this work item. The fix removes them.
- `.claude/tools/README.md`: the rule in the rule table.
- New `Tests/Menu.lua`, registered in `Tests/Files.xml`. Suite `menu`, in the shape of `Tests/Tooltip.lua`:
  - Scenarios `missing-achievement-entry` (Recorded "enabled", Target "disabled") and `registered-achievement-entry` (id 6 "Level 10", Shared; Recorded and Target "enabled").
  - The game env:
    - Ready waits for `addon.Data.Achievements[6]`.
    - The missing id is the first id from 1 up that `GetAchievementInfo` knows and `addon.Data.Achievements` lacks (a statistic qualifies). It is reported as an observation.
    - The entry is built through `addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementLine` into a real root: `MenuUtil.CreateRootMenuDescription(MenuVariants.GetDefaultContextMenuMixin())` on Retail, read back through `EnumerateElementDescriptions()` and `IsEnabled()`; `KROWI_LIBMAN:GetLibrary('Krowi_Menu_2').MenuItem:New{...}` on Classic, read back through `.Children[1].Disabled`.
- `.claude/tools/headless/run-tests.lua`: `suites.menu`.
  - It loads the real `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua` against a model of `addon.MenuBuilder` that applies the builder's rule: an entry is disabled only when the fourth argument is `false` (`Krowi_MenuBuilder.lua:253,433`). It also supplies a fake missing id and a registered id 6.
  - Add the suite to the header comment.
- `Tests/Tooltip.lua` and `suites.tooltip`: scenario `most-progress-transmog-set` with `Kind = "most-progress"`, on 40469 seen as neither completed nor account-wide. Recorded and Target are both "shown" (the `addon.L["Most progress"]` line is present).
  - A per-kind Inspect and Setup: the existing transmog scenario keeps its GetItemInfo handling, and the new kind does not touch the global.
  - Headless also loads `Gui/AchievementTooltip/MostProgress.lua`, with stubs for `GetAchievementNumCriteria`, the MostProgress options, `KrowiAF_SavedData.CharacterList` and `KrowiAF_Achievements.NotCompleted` (both empty, giving "No characters found"), and `addon.Objects.CompareFunc` (`Objects/CompareFunc.lua` loaded for real if it stands alone).
- `Tests/README.md`: a row for `menu`, and the tooltip row extended. `.github/copilot-instructions.md:40`: add `menu` to the suite list.

**Commit 2 onwards, after the maintainer's before-run (one commit per fix)**
- A, `fix: ask for the pet guide popup and tutorial menu libraries by their current names (2026-10-11-latent-bugs)`:
  - `Gui/RightClickMenu/AchievementMenu/PetBattleLinks.lua`: add `local popupDialog = LibStub("Krowi_PopupDialog_2")` at the top (as `WowheadLink.lua:5`), and use `popupDialog.ShowExternalLink` at `:25,36,70`.
  - `Options/General.lua:62-63`: `tutorialMenuBuilder = addon.MenuBuilder:New({})`.
  - Remove the two ignore entries.
- B, `fix: grey out "(Missing)" entries in the right-click menu (2026-10-11-latent-bugs)`:
  - `AchievementMenu.lua:15-27`: `local isEnabled`, set to `false` for a missing achievement and passed in place of `disabled`.
  - `Tests/Menu.lua`: Recorded "disabled" for `missing-achievement-entry`.
- C, `refactor: remove the dead transmog check from Most progress (2026-10-11-latent-bugs)`:
  - `MostProgress.lua:7`: drop `or achievement.TransmogSets`.
  - Delete `achievement:AddTransmogSet` (`Objects/Achievement.lua:152-156`) and `data.TransmogSets = {}` (`Data/Data.lua:12`).
  - The scenario stays "shown"/"shown".
- `_Packaging/Changelog.md` 102.1 `### Fixed`: one line for A ("Xu-Fu's Pet Guides links in the right-click menu and the Tutorial button in the options work again") and one for B ("'(Missing)' entries in the right-click menu are greyed out again"). C has no player-visible change and gets no line.
- `plan.md` updated where the build departed; every work file set to `done` in the last commit.

## Order of work
1. Write the rule and ignore entries. Show the rule fires without the ignore entries (the four sites) and is quiet with them.
2. Write suite `menu` and the tooltip scenario. Run every suite headlessly: `menu/missing-achievement-entry` PASS with recorded=enabled, target open; `menu/registered-achievement-entry` PASS, met; `tooltip/most-progress-transmog-set` PASS, met; `tooltip/transmog-set-progress` unchanged. Then run the full `Check-Repo.ps1`.
3. Commit 1 (with `plan.md`). **Stop. Hand the in-game before-run to the maintainer** (instructions below), together with the guide feature's step-0 probe.
4. After a green before-run: fixes A, B and C as three commits, each followed by the suites and `Check-Repo`. Set B's Recorded to "disabled".
5. Changelog, plan updates, statuses set to `done`. **Stop. Hand the in-game after-run to the maintainer.**
6. After a green after-run: push the branch, open the PR against `dev`, run `/code-review`, and wait for the merge gate. The `taint-reviewer` is not needed: no hook, Blizzard frame or lockdown API is touched.

## In-game runs (maintainer)
- **Before-run, from the guards commit.** In the worktree, run `& ".claude\tools\Deploy.ps1" -WhatIf`, then `Deploy.ps1`, for Retail and again with `-Client Classic`. Don't save files in VS Code in between: its fsdeploy writes the main tree's files over the deploy.
  - In game, with debug on: `/reload`, `/kaftest menu`, `/kaftest tooltip`, `/reload`.
  - Then `Read-GameTests.ps1`, which must show recorded=got and no difference from headless.
  - Manual, to confirm A reproduces: right-click a Mists of Pandaria pet battle achievement → Xu-Fu's Pet Guides gives a Lua error. With `Krowi_Brokers_Template` disabled, General options → Tutorial gives a Lua error.
  - `Read-GameErrors.ps1` shows both errors.
- **After-run, from the branch head.** The same steps. `menu/missing-achievement-entry` now gives got=disabled. The Xu-Fu link opens the copy-link popup, Tutorial opens its menu, and `Read-GameErrors.ps1` has nothing new.

## Risks
- **The lint rule hides a real registration.** A library registered through a variable the rule cannot resolve would be flagged at a call site. That fails loudly, not silently, and today's prototype resolves every bundled library.
- **The ignore entries cover whole files until the fix.** `Options/General.lua` is exempt from `library-names` for one commit; the fix removes both entries.
- **The in-game menu root.** Creating a root description outside a real menu is unverified in game. If `IsEnabled` cannot be read that way, the scenario is a SKIP with the reason, and the before-run says so before any fix is written.
- **The tooltip suite's GetItemInfo handling.** It must stay limited to the transmog scenario, or the new scenario would taint the global for nothing. Per-kind Setup guards this.
- **Deploying from a worktree** writes the shared game folder. The maintainer runs it, and nothing else deploys meanwhile.

## Proof
- `Check-Repo.ps1` (full): 0 errors after commit 1, with the two ignore entries. Without them, exactly four `[library-names] Error` lines at `PetBattleLinks.lua:25,36,70` and `General.lua:62`. After fix A, 0 errors with the entries gone.
- `run-tests.lua "$PWD"` (all suites, both clients): every scenario PASS. After commit 1, `menu/missing-achievement-entry` is open. After fix B, nothing is open.
- In game: the before-run and after-run lines above match headless in `Read-GameTests.ps1`, and `Read-GameErrors.ps1` is clean after the after-run on both clients.