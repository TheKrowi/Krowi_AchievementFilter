# Plan: Side buttons error after their anchor changes
Spec: [spec.md](spec.md). Status: accepted

The plan is non-routine, because it changes hooks on Blizzard frames (AchievementFrame and WorldMapFrame). Krowi approved it on 2026-11-04.

## Files that change
- `Tests/PopUps.lua`: five side button scenarios and their helpers (`SideButtons`, `TestEvent`, `OpenWindow`/`CloseWindow`, `CountRefreshes`), and the header comment.
- `.claude/tools/headless/run-tests.lua`, `suites.popups`, replacing the side button system's stub with the real file:
  - the side button templates as the merged mixins (`AlertFrameMixin.lua`, `SideButtonMixin.lua`), with their `OnShow`;
  - a fresh `WorldMapFrame` and no `AchievementFrame` on each `headless.Reload`, and `SideButtonSystem.lua` run again;
  - `headless.OpenAnchor`, `CloseAnchor` and `LoadAchievementUI`. The last mirrors `Gui/Gui.lua:108-110`: it reads `system.Loaded` where the field exists, else the first `Load` result at `LoadWithAddon`, today's flag at `Gui.lua:12`.
  - It also records the refresh callback's register and unregister.
- `Tests/README.md`: the `popups` row.
- `Gui/EventReminder/SideButtonSystem.lua`:
  - a file-local `hooked` table, and `HookAnchor(system, frame)`, which hooks once per frame, with hooks gated on `frame == system:GetAnchor()`;
  - `Load` sets `self.Loaded`;
  - `Reload` no longer calls `Load`. It resets and hides every button, hooks the new anchor or sets `Loaded = false` when that anchor is missing, and refreshes at once when the new anchor is shown.
- `Gui/Gui.lua`: the local flag gives way to `self.EventReminderSideButtonSystem.Loaded` (`:8`, `:12`, `:108-110`).
- `_Packaging/Changelog.md`: a line under 105.0 `### Fixed`.

## Order of work
1. **The scenarios, test first,** in `Tests/PopUps.lua`. The option's path is `EventReminders.General.Other.SideButtonsAnchor`. Each scenario saves the anchor and puts it back, SKIPs when event reminders are off, and closes the achievement window first.

   | Scenario | Runs | Recorded | Target |
   |---|---|---|---|
   | `side-buttons-anchor-switch`: the buttons shown without an event after a switch to the world map | both | `1` | `0` |
   | `side-buttons-switch-back`: the refreshes on opening after a switch away and back | both | `more than one` | `one` |
   | `side-buttons-switch-while-open`: whether a switch to the open achievement window refreshes | both | `no` | `yes` |
   | `side-buttons-old-anchor-closes`: the refresh callback after the old anchor closes | headless only | `removed` | `kept` |
   | `side-buttons-before-achievement-ui`: the refreshes on the first opening after a switch before the achievement UI loaded | headless only | `none` | `one` |

2. **The headless model** in `suites.popups`, as listed above. The model leaves out what the game does when a parent shows: run the children's `OnShow`. That's why scenario 1 checks the state that leads to the error, not the error itself.
3. **Headless `popups` on both clients:** the new scenarios PASS at Recorded and are open against Target. `Check-Repo.ps1 -ChangedOnly`. Commit `test: reproduce the side button anchor error in the popups suite`.
4. **Before-run on Retail:** `Deploy.ps1 -WhatIf`, then deploy. Krowi runs `/kaftest popups`, then `/reload`, and `Read-GameTests.ps1` shows the three in-game scenarios at Recorded and no other difference.
5. **The fix** in `SideButtonSystem.lua` and `Gui.lua`.
6. Set each new scenario's Recorded to its Target, and run `popups` and `events` headless on both clients.
7. **Changelog:** "Changing where the event reminder side buttons show no longer gives an error the next time that window opens".
8. Commit `fix: side buttons after a Side Button Anchor change`.

## Risks
- **ElvUI, GW2_UI and EllesmereUI** skin on `Load` and on every `Refresh` (`Plugins/ElvUI.lua:795-802`, `Plugins/GW2_UI/GW2_UI.lua:1159-1166`, `Plugins/EllesmereUI.lua:960-961`).
  - `Reload` no longer calls `Load`, so a switch adds no skin hook. The `Refresh` skinning still covers the moved buttons.
  - The global button names stay.
- **Taint:**
  - the hooks stay `hooksecurefunc` post-hooks;
  - `hooked` is a file-local table, not a field on Blizzard's frames;
  - no Blizzard frame method is called from the fix;
  - `krowi:taint-reviewer` reviews the diff.
- **The in-game scenarios** open and close the achievement window through the addon's own path (`KrowiAF_ToggleAchievementFrame`, `AchievementFrame:Hide()`), as the escape and navigation suites do. They never open the world map.

## Proof
- Headless `run-tests.lua popups` and `events`, Retail and Classic: all PASS, with the five new scenarios met.
- `Check-Repo.ps1` clean, `krowi:taint-reviewer` and `/code-review` findings fixed or listed in the PR.
- In game, Retail: `/kaftest popups`, then `/reload`. `Read-GameTests.ps1` shows the three scenarios at Target, and `Read-GameErrors.ps1` shows no new row.
- By hand, Retail and Mists: change *Side Button Anchor* both ways with each window open and closed, then open each window. No error, and the buttons show on the chosen window.

## Departures from the plan
- **`side-buttons-old-anchor-closes` runs in game too.** It needs only the achievement window: open it, switch to the world map, close it. It watches the close remove the refresh callback rather than reading the callback list, so its values read `the close removes it` and `the close leaves it`. The before-run on Retail (2026-11-04 14:13) showed the four in-game scenarios at Recorded, and 14 times the reported error from `SideButtonMixin.lua:6`.
- **`Reload` removes the refresh callback**, and registers it again only when the new anchor is shown. Without that, a switch away from an open window would keep the alert system's ticker refreshing buttons that nothing shows, which is the allocation the background-jobs rule forbids.
- **`Reload` sets `Loaded` both ways:** true when it hooks the new anchor, false when that anchor is missing. A switch to the world map before the achievement window loads then saves `LoadWithBlizzard_AchievementUI` a second `Load`, and with it a second round of the skin plugins' `Load` hooks.
- `Load` and `Reload` share one local, `Attach`: it hooks the anchor and sets `Loaded`, false while event reminders are off or the anchor window does not exist yet.
- **From the code review:**
  - A profile change, copy or reset (`RefreshOptions`, `Options/EventReminders.lua`) passed the anchor setter the value the new profile already holds, so the setter returned early and `Reload` never ran. With the hooks now gated on the current anchor, closing the old window after the switch would have left the refresh ticker running with nothing to show. `RefreshOptions` now calls `Reload` in place of the setter and its own `Refresh`.
  - The scenario `side-buttons-profile-switch` (headless only) records it: `keeps running` on the first fix commit, `stops` now.
  - `Reload` hides the buttons before `ResetButtons` moves them, so none can show on a new anchor that is already open.
- `Options/Window/Changelog.lua` is not rebuilt here. It is rebuilt at release (`Build-ChangelogLua.ps1`), as the other 105.0 lines were.