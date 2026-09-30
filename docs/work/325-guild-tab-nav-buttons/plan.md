# Plan: Guild tab shows two sets of navigation buttons
Spec: [spec.md](spec.md). Status: done

Approved by the maintainer on 2026-09-30 (plan mode).

## Context
Retail 12.1 added a Blizzard `Back` button to `AchievementFrame.HeaderDetails`. The addon parents its browsing-history arrows to the same strip at the same spot (`Gui/BrowsingHistory/BrowsingHistory.lua:93-98`). On the addon's tabs, the addon's search box hides Back (`Gui/WindowFrames/Search/BoxFrame/BoxFrameMixin.lua:63-65`). On Blizzard's tabs Back shows, and the arrows, which are not tab sub-frames, stay on top of it. Decision A: the arrows become an addon-tab sub-frame on the 12.1 layout, so Blizzard's tabs keep only Blizzard's Back and Statistics shows neither. Classic is unchanged.

## Files that change
- `.claude/tools/headless/run-tests.lua`
  - Frame model: `SetShown`, `SetPoint`/`ClearAllPoints`/`SetAllPoints`, size getters and setters, frame level, `SetID`/`GetID`, `SetText`/`GetText`, `SetTexture`, `SetMaxLetters`, `Enable`/`Disable`, `EnableMouse`.
  - `CreateFrame` applies a small template-to-mixin table (the tab template and the search box template: mixin methods, OnShow/OnHide wiring, `hidden="true"` start state, and the child frames their mixins touch).
  - `hooksecurefunc` also wraps an existing env function, so modelled Blizzard functions run their hooks the way the game does. Hooks are still recorded for the escape suite.
  - A new `suites.navigation` with a Blizzard model per client, described below.
- `Tests/Navigation.lua` (new) and `Tests/Files.xml`: the scenarios, the executor, the in-game environment, and `addon.Tests.Ready.navigation`.
- `Gui/BrowsingHistory/BrowsingHistory.lua`: in the `HeaderDetails` branch only, an unnamed container frame (`SetAllPoints` on `HeaderDetails`, no mouse) becomes the arrows' parent. It goes into `addon.Gui.SubFrames` and is stored as `browsingHistory.Frame`. The anchors and global names stay as they are.
- `Gui/Gui.lua:132`: each addon tab's frames-to-show list gets `self.BrowsingHistory.Frame` when it exists.
- `_Packaging/Changelog.md`: a `## 101.1` Fixed line with a dev note.
- `.github/copilot-instructions.md` (suites list) and the `run-tests.lua` header: name the `navigation` suite.
- `docs/work/325-guild-tab-nav-buttons/*.md`: this plan; `Status: done` in the last commit.

## Order of work
1. **Commit the plan.** Commit `plan.md` (`Status: accepted`).
2. **Model and scenarios, test first.**
   - Capture the output of the headless `escape` and `special` suites. Extend the frame model and `hooksecurefunc`. Check that both outputs are byte-identical.
   - Build `suites.navigation`, Retail 12.1 model:
     - `AchievementFrame`, with `Header.Title` and `HeaderDetails` holding `Back` (shown), `Filters.FilterDropdown` and `Filters.SearchBox`;
     - the frames `AchievementFrameAchievements`, `AchievementFrameSummary` and `AchievementFrameStats`, plus `AchievementFrameTab1`-`3`;
     - the functions `AchievementFrame_ShowSubFrame`, `AchievementFrame_UpdateTabs`, `AchievementFrame_RefreshView`, `PanelTemplates_SetNumTabs` and `AchievementFrame_SetTabs`;
     - `AchievementFrameBaseTab_OnClick`, the same as live: update the tabs, show the page, refresh the view on tabs 1 and 2, then `Back:SetShown(tab ~= 3)`.
   - Classic (Mists) model: `Header.PointBorder` and `Header.RightDDLInset`, `AchievementFrameFilterDropDown`, no `HeaderDetails` and no Back.
   - Load the real code:
     - `Globals.lua` (`addon.InGuildView`) and `KrowiAF_RegisterTabButton` from `Api/API.lua`;
     - `Gui/Gui.lua`, the tab factory and its mixin;
     - `Search.lua` with `BoxFrameMixin.lua`;
     - `BrowsingHistory.lua` and `Gui/BrowsingHistory/BrowsingHistory.lua`.
   - Fake only the unrelated loaders: header, objectives, categories, achievements and summary frames, filter button, calendar, data manager, frame closing and movable frames. Run the real `gui:LoadWithBlizzard_AchievementUI()` and select tabs through the real `gui:ToggleAchievementFrame(<addon>, <tab>, nil, true)`, the path the key bindings use.
   - Write `Tests/Navigation.lua`, where `Back` is Blizzard's button and `Arrows` the addon's pair.

     | Scenario | Retail Recorded | Retail Target | Classic |
     |----------|-----------------|---------------|---------|
     | addon-tab | Arrows | Arrows | Arrows |
     | guild-tab | Back, Arrows | Back | Arrows |
     | statistics-tab | Arrows | none | Arrows |
     | blizzard-achievements-tab | Back, Arrows | Back | Arrows |
     | addon-then-guild | Back, Arrows | Back | Arrows |
     | guild-then-addon | Arrows | Arrows | Arrows |
     | guild-tab-option-toggled | Back, Arrows | Back | Arrows |
     | addon-tab-option-toggled | Arrows | Arrows | Arrows |

     The option-toggled scenarios flip Track Achievement Browser History off and on through the real AceConfig setter in game (`Layout.args.Header.args.BrowserHistory.args.Track`), and through the same two `Hide`/`Show` calls headlessly.
   - The in-game env closes the window before each scenario, opens tabs with `KrowiAF_ToggleAchievementFrame`, and SKIPs with a reason in three cases: a tab is hidden in the options, the character is not in a guild, or the arrows do not exist (option off at login). It restores the option, the window and the selected tab at the end.
3. **Gate: in-game before-run on Retail.** Run `Check-Repo.ps1 -ChangedOnly`, then `Deploy.ps1 -WhatIf`, then deploy. The maintainer runs `/kaftest navigation`, then `/reload`. Read the result with `Read-GameTests.ps1`: it must show 0 FAIL, the only SKIPs explained, and no line different from headless. Commit `test: reproduce #325 in the navigation suite`.
4. **Fix only the code.**
   - Add the container in `BrowsingHistory.lua` and the frames-to-show entry in `Gui.lua`.
   - Set `Recorded` to `Target` in `Tests/Navigation.lua`.
   - Add the changelog line with its dev note.
   - Update `plan.md` wherever the work departed from this plan.
5. **Feedback loop.**
   - Headless: both clients, 0 open.
   - `Check-Repo.ps1 -ChangedOnly`, and the `taint-reviewer` on the diff.
   - In-game after-run on Retail and Classic: deploy each, `/kaftest navigation`, `/reload`, `Read-GameTests.ps1` and `Read-GameErrors.ps1`.
6. **PR.**
   - Set the work files to `Status: done` and commit `fix(retail): show one set of navigation buttons on the Guild tab (#325)`.
   - Push the branch and open the PR against `dev`.
   - Run the `REVIEW.md` passes (`/code-review`) and address the findings.
   - The maintainer merges; after that, close #325 with the closing routine.

## Risks
- **Model fidelity.** A wrong Blizzard model gives a false green. Guarded by step 3: the game's lines must equal the headless lines before any fix.
- **Shared model changes.** They could shift the escape or special suites. Guarded by the byte-identical output check in step 2.
- **Plugin skins.** ElvUI, GW2_UI and EllesmereUI re-anchor the arrows by global name. The names and anchors are unchanged and only the parent differs; no plugin client is available, so this is checked by review, not in game.
- **Runtime toggle of the option on a Blizzard tab.** The setter shows the buttons again. Guarded by the container, since its hidden state wins, and by the option-toggled scenarios.
- **Taint.** No hook, override or write to a Blizzard frame is added; the `taint-reviewer` confirms.
- **The test's tab clicks in game.** They use the addon's own binding path, `KrowiAF_ToggleAchievementFrame`, and never run in combat (the runner refuses).

## Proof
- `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" navigation`:
  - before the fix: Retail 8 passed, 5 open; Classic 8 passed, 0 open;
  - after the fix: both clients 8 passed, 0 open.
- The `escape` and `special` headless output is byte-identical before and after the model change.
- `Check-Repo.ps1 -ChangedOnly` reports 0 errors, and the `taint-reviewer` finds nothing Important.
- In game:
  - the before-run on Retail matches the headless lines;
  - the after-run on Retail and Classic is all PASS, and `Read-GameErrors.ps1` shows nothing new;
  - on the Guild tab only Blizzard's Back shows, and the addon's tabs show the arrows.

## Departures and results
- **No guild check in the in-game test.** The in-game test skips a tab only when its button is hidden. There is no check for a character without a guild, because the Guild tab path runs either way and which buttons are visible does not depend on membership.
- **Before-run, Retail 12.1.0 (2026-09-30):** 7 PASS and 1 SKIP. The SKIP is Blizzard's Achievements tab, hidden by default. Every line matched headless and BugGrabber showed no addon errors. Committed as `12c9ee9`.
- **Fix:** headless Retail went from 5 open to 0 open, with the five changed scenarios exactly the open ones; Classic was unchanged. `Check-Repo` was clean.
- **Taint review:** nothing Important. It pointed out a consequence the spec had not named: the comparison view now hides the arrows too. That is recorded in the spec's areas of concern, and it is flagged in the PR.
- **After-run, Retail 12.1.0 (2026-09-30):** 7 PASS, the same SKIP, 0 open, every other line matching headless, and no addon errors.
- **Code review (`REVIEW.md` passes, 2026-09-30), fixed:**
  - the container now starts hidden, like the other sub frames;
  - the in-game teardown restores the tab through the same toggle the scenarios use, so the window reopens;
  - `IsVisible` guards a missing `Back`;
  - the option toggle always switches the option back on;
  - the spec now names the container as unnamed;
  - the two limits of the headless model are documented;
  - the lint help text is realigned.
- **Code review, declined:** keeping Back hidden on the addon's tabs stays with the search box's `OnShow`, as before the fix. No Blizzard path was found that shows Back on an addon tab without a tab switch.
- **Classic:** not run in game; its saved variables were last written 2026-09-23. Headless Classic is unchanged at 8 PASS and 0 open, and the fix only touches the `HeaderDetails` branch, which Classic never takes.
