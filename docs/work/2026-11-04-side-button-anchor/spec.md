# Spec: Side buttons error after their anchor changes
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. Changing *Side Button Anchor* leaves no side button shown without an event, so opening either window afterwards gives no error.
2. Each anchor window gets its Show and Hide hooks once per session, however often the anchor changes. Opening the anchored window refreshes the side buttons once.
3. Closing the window the buttons are no longer anchored to does not stop the buttons' countdown on the window they are anchored to.
4. When the anchor changes to a window that is open at that moment, the buttons appear on it at once.
5. When the anchor changes to the achievement window before it was ever opened in the session, the buttons show on it the first time it opens.
6. The ElvUI, GW2_UI and EllesmereUI plugins still skin the buttons, and their hooks no longer pile up with each anchor change.

## Root cause
- The option's setter calls `Reload` (`Options/EventReminders.lua:87-91`). `Reload` calls `Load` again, then `ResetButtons` (`Gui/EventReminder/SideButtonSystem.lua:102-105`).
- `Reset` moves each button to the new anchor and clears its event, but leaves the button shown (`Gui/EventReminder/SideButton/SideButtonMixin.lua:29-32`).
- When the new anchor opens, the game runs each shown child's `OnShow` (`SideButton.xml`, `SideButtonMixin.lua:5-7`) before the post-hook on the anchor's `Show` refreshes the buttons (`SideButtonSystem.lua:92-95`). `UpdateEventRuntime` then reads the cleared event (`Gui/EventReminder/AlertFrame/AlertFrameMixin.lua:59`), which gives one error per button.
- Every `Load` hooks the current anchor's `Show` and `Hide` again (`SideButtonSystem.lua:92-98`), so each switch to an anchor adds another pair. After a switch back, one opening of the achievement window refreshes the buttons twice.
- The old anchor's `Hide` hook still runs and removes the refresh callback the new anchor registered under the same key (`Gui/EventReminder/AlertSystem.lua:679-689`). The buttons' countdown then stops until their window opens again.
- ElvUI (`Plugins/ElvUI.lua:795-802`) and GW2_UI (`Plugins/GW2_UI/GW2_UI.lua:1159-1163`) add a hook on `Refresh` inside their hook on `Load`. So each `Reload` also adds another skin pass to every refresh.
- `Gui/Gui.lua:12` and `:108-110` call `Load` again only when it failed at login. A switch to the achievement window before it was ever opened finds no frame to hook, and nothing hooks it later, so the buttons never show on it that session.
- **Reproduction:** BugGrabber, Retail 12.1.5, 2026-10-25 22:25 (session 127, x7): `AlertFrameMixin.lua:59: attempt to index field 'Event' (a nil value)`, from `SideButtonMixin.lua:6`, in `OnShow`.

## Design
Option A in `SideButtonSystem.lua`, plus one line in `Gui/Gui.lua`:
- A local `HookAnchor(frame)` hooks a frame's `Show` and `Hide` once, recorded in a file-local table keyed by the frame, never a field on it. The hooks act only while that frame is the current anchor (`frame == self:GetAnchor()`).
- `Load` hooks the current anchor through `HookAnchor` and returns as it does now. It records whether it found the anchor in `self.Loaded`, which replaces Gui.lua's local flag.
- `Reload` no longer calls `Load`, so the plugins' hooks on `Load` run only at load as before.
  - It hooks the new anchor through `HookAnchor` when that frame exists. When it does not (the achievement window not loaded yet), it sets `self.Loaded = false`, so `LoadWithBlizzard_AchievementUI` runs `Load` when the window loads.
  - It resets the buttons and hides them all.
  - When the new anchor is shown, it registers the refresh callback and refreshes, as the `Show` hook would.

## Options considered
- **A, recommended: fix the error and the hooks.**
  - In game, on every client, changing *Side Button Anchor* gives no error, and the buttons appear on the chosen window at once if it is open.
  - Opening that window refreshes them once, and closing the other window no longer freezes their countdown.
  - Changes: `SideButtonSystem.lua` (about 20 lines) and `Gui.lua` (one condition).
- **B, the smallest: only hide the buttons in `Reload`** (the backlog's fix).
  - The error goes.
  - The hooks still pile up: after switching away and back, every opening refreshes once more per switch. Closing the old window stops the countdown on the new one until it is reopened, and the plugins' skin pass repeats per switch.
  - A switch to the achievement window before its first opening still leaves it without buttons until `/reload`.

## Areas of concern
- **Taint and secret values:** the hooks stay `hooksecurefunc` post-hooks on `Show` and `Hide`, now fewer of them. The record of hooked frames is a file-local table, not a field on Blizzard's frames. The buttons stay addon frames parented to the anchor, as now. Refreshing while the new anchor is open runs the same `Refresh` its `Show` hook runs. No secret values are read. `krowi:taint-reviewer` reviews the diff.
- **Clients:** the side buttons load on every client (`Gui/EventReminder/Files.xml` from `FilesModern.xml` and `FilesClassic.xml`), and the code has no client branch. KAF does not load on Forever.
- **Blizzard API changes:** none used beyond `hooksecurefunc`, `Show`, `Hide` and `IsShown`.
- **Other addons, plugins and skins:**
  - ElvUI and GW2_UI hook `Load` and then `Refresh`, and EllesmereUI hooks both. `Load` and `Refresh` keep their names and calls.
  - `Reload` calling `Load` no more means fewer piled plugin hooks, not lost skinning: the plugins skin on every `Refresh`.
  - The buttons' global names (`KrowiAF_AchievementFrameSideButton<n>`) that the plugins read stay.
- **Saved variables and migrations:** none.
- **Localization:** none.
- **Embedded libraries:** none.
- **Data snapshots:** none.
- **Player-facing text:** a changelog line under 105.0's `### Fixed`.

## Verification
- **Permanent test:** scenarios in the `popups` suite (`Tests/PopUps.lua`). It already drives `Options/EventReminders.lua` through the option's own setter and has a frame model headlessly. Each scenario puts a test event on a side button while the achievement window is open, then uses the option's setter:
  - `side-buttons-anchor-switch`: after the switch to the world map, the buttons shown without an event. Recorded `1`, Target `0`.
  - `side-buttons-switch-back`: after a switch to the world map and back, the refreshes when the achievement window opens. Recorded `more than one`, Target `one`.
  - `side-buttons-old-anchor-closes`: headless only (SKIP in game, where the test would have to open the world map). After switching to the world map while it is open, whether closing the achievement window keeps the refresh callback. Recorded `removed`, Target `kept`.
  - Each scenario puts the anchor back.
- **Other checks:** `Check-Repo.ps1`, the headless `popups` and `events` suites, and `krowi:taint-reviewer`.
- **In game:**
  - Retail: `/kaftest popups` before the fix (the new scenarios at Recorded) and after (at Target).
  - Then by hand on Retail and Mists: change *Side Button Anchor* both ways and open each window. No error in `Read-GameErrors.ps1`, and the buttons show on the chosen window.

## Decision
Option A, the error and the rest (Krowi, 2026-11-04), for 105.0.