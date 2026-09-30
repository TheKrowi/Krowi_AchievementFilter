# Spec: Guild tab shows two sets of navigation buttons
Intent: [intent.md](intent.md). Status: done

## Requirements
1. On every tab of the achievement window, at most one set of navigation buttons is visible in the header strip, and it overlaps nothing.
2. The addon's own tabs keep the addon's browsing-history arrows and keep Blizzard's Back button hidden, as today.
3. The Guild tab, and Blizzard's Achievements tab when enabled, show exactly one navigation (which one is the decision below).
4. Classic, whose header has no `HeaderDetails` strip, looks and behaves as before.
5. Track Achievement Browser History still works: off means no arrows anywhere; on means arrows wherever requirement 3 puts them, including after the option is toggled at runtime.
6. ElvUI, GW2_UI and EllesmereUI still find and restyle the arrows by their global names.

## Root cause
- Retail 12.1 added `AchievementFrame.HeaderDetails`, the strip above the achievement list. It holds Blizzard's `Back` button (`UIPanelButtonTemplate`, text `BACK`, 100 x 22 at `TOPLEFT` 6, -10) and the `Filters` frame (Blizzard_AchievementUI/Mainline/Blizzard_AchievementUI.xml, live branch, the `HeaderDetails` frame). Blizzard shows Back on every tab but Statistics: `AchievementFrameBaseTab_OnClick` ends with `AchievementFrame_RefreshBackButton(tabIndex ~= StatisticsCategoryIndex)` (Blizzard_AchievementUI.lua, live, lines 441-473), and `AchievementFrame_SetComparisonMode(false)` shows it as well (line 3148 on).
- The addon's 12.1 support (changelog 100.x, "Support for WoW 12.1.0 PTR") parented the browsing-history arrows to that strip at `LEFT` +30 (`Gui/BrowsingHistory/BrowsingHistory.lua:93-98`), which is where Blizzard's Back button sits.
- On the addon's tabs this does not show: the addon's search box hides Back in its `OnShow` (`Gui/WindowFrames/Search/BoxFrame/BoxFrameMixin.lua:63-65`), so only the arrows are left. On a Blizzard tab the search box is hidden, because it is in `addon.Gui.SubFrames`, which the `AchievementFrame_ShowSubFrame` post-hook hides for every frame a tab does not list (`Gui/Gui.lua:62-79`). Blizzard shows Back, and the arrows are not sub frames, so they stay shown on top of it.
- Players see it on the Guild tab: Blizzard's Achievements tab is hidden by default (`Api/TabDataApi.lua:6`) and Statistics has no Back button. The same code is in 101.0.

## Design
Recommended (option A): on the 12.1 layout, the arrows become one of the addon's tab sub frames, the same mechanism that already swaps the addon's filter button, search box and category list with Blizzard's on every tab change.

- In the `HeaderDetails` branch of `browsingHistory:Load`, create a plain, unnamed container frame over the strip (`SetAllPoints` on `HeaderDetails`, no mouse, hidden until an addon tab shows it). It gets no name, so no new global is added: the skins address the two buttons, whose names do not change. Parent both arrows to it and keep their anchors exactly as they are, add the container to `addon.Gui.SubFrames`, and expose it as `addon.Gui.BrowsingHistory.Frame`.
- In `Gui/Gui.lua`, append that container to each addon tab's frames-to-show list when it exists.
- The existing hook then shows the container on the addon's tabs and hides it on every Blizzard tab. The option setter keeps showing and hiding the two buttons themselves, so while the container is hidden a toggle cannot bring them back on a Blizzard tab.
- The old `AchievementFrame.Header` branch (Classic, and Retail before 12.1) is left untouched.

On the Guild tab the player then sees Blizzard's Back button, and on Statistics no navigation, as Blizzard ships it. Blizzard's frames, functions and Back button are not touched.

## Options considered
- **A. The addon's arrows only on the addon's tabs (recommended).** Guild and Blizzard's Achievements tab show Blizzard's Back, Statistics shows nothing, the addon's tabs show the arrows. Each tab shows the history of the list it displays: the addon's arrows only ever record selections on the addon's tabs (`Gui/WindowFrames/AchievementsFrame/AchievementsFrameMixin.lua:70-72`), and on a Blizzard tab they would jump back to an addon tab. No new hook, and no Blizzard frame touched. The cost is that the arrows no longer show on Statistics, where they did before 12.1.
- **B. Both, side by side.** Keep the arrows on every tab and move them to the right of Back whenever Back is shown. This needs Back's visibility tracked through `HookScript` on a Blizzard button plus a resync on every tab change and window show. The Guild tab would then show two navigations with different histories, which is what the reporter reads as two sets.
- **C. The addon's arrows everywhere, Blizzard's Back hidden.** Hide Back on the Guild tab too, as the addon already does on its own tabs. The Guild tab would lose Blizzard's back navigation after a meta-achievement jump, and the arrows cannot replace it because they do not record Guild-tab selections.

## Areas of concern
- Taint and secret values: option A adds no hook, no override and no write to a Blizzard frame or global. The container is an addon frame parented to `HeaderDetails`, the parent the arrows already have. The `taint-reviewer` runs on the diff regardless.
- Retail and Classic: only the `HeaderDetails` branch changes. Classic keeps the arrows in `AchievementFrame.Header`, with no Back button next to them.
- Plugins and skins: ElvUI (`Plugins/ElvUI.lua:429-434`), GW2_UI (`Plugins/GW2_UI/GW2_UI.lua:902-907`) and EllesmereUI (`Plugins/EllesmereUI.lua:652-653`) restyle and re-anchor the arrows by global name. A new parent keeps the names, and their anchors are relative to other frames, which works across parents. Under those skins the arrows also stop showing on Blizzard tabs, which is consistent.
- Saved variables and migrations: none.
- Localization: none, no new strings.
- Data snapshots: none, no data touched.
- Classic plugin paths: `Plugins/EllesmereUI.lua:665` and `Plugins/GW2_UI/GW2_UI.lua:895` branch on `HeaderDetails` for the filter dropdown only, not the arrows, so they are unaffected.
- Comparison view (added after the taint review, 2026-09-30): the addon's comparison override shows Blizzard's comparison frames through `AchievementFrame_ShowSubFrame` (`Gui/BlizzardOverrides.lua:48-50`). The sub-frame hook therefore hides the arrows there as well, as it already hides the addon's search box, filter button and category list. Blizzard hides Back in comparison mode (`AchievementFrame_SetComparisonMode`), so the comparison view shows no navigation; before the fix the arrows stayed shown over it. This follows the decision: the arrows belong to the addon's tabs.

## Verification
- A new suite `navigation` (`Tests/Navigation.lua`, run by `/kaftest navigation` and by `run-tests.lua`) selects tabs and records which navigation is visible: `Back` for Blizzard's button, `Arrows` for the addon's. Recorded before the fix, Retail:

  | Scenario | Recorded before | Target |
  |----------|-----------------|--------|
  | addon tab | Arrows | Arrows |
  | Guild tab | Back, Arrows | Back |
  | Statistics tab | Arrows | none |
  | addon tab, then Guild | Back, Arrows | Back |
  | Guild, then addon tab | Arrows | Arrows |

  Classic records Arrows on every tab, with Target equal, as the guard for requirement 4.
- In-game before-run on Retail must be green before the fix starts; after the fix, Recorded = Target, and the in-game after-run on Retail and Classic, with `Read-GameErrors.ps1` clean.
- `Check-Repo.ps1` clean; `taint-reviewer` on the diff.

## Decision
Option A, chosen by the maintainer on 2026-09-30: the arrows show on the addon's tabs only, and Blizzard's tabs keep Blizzard's own navigation.
