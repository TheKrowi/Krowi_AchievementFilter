# Plan: Event reminder pop-ups follow addons that place the game's alerts; placeholders preview with Hide (#188, #364)
Spec: [spec.md](spec.md). Status: accepted. Branch `fix/188-popup-holder`. Approved by Krowi 2026-10-26, with the setting applying without a reload (a departure from spec R1).

## Context
- **#188:** the pop-up position resets because KAF moves Blizzard's `AlertFrame` and addons that own the alert spot (Dominos Roll's Alerts bar, ElvUI, GW2_UI, EllesmereUI's mover) put it back on every alert. At every login KAF also replaces `AdjustAnchors` on all of Blizzard's toast systems: a taint path, and every toast stacks by KAF's settings, reminders on or off.
- **#364:** Show placeholders queues one pop-up per calendar event (24/12) for 60 s each, writes fake details into the live events, and nothing hides them.
- **Krowi's decisions (2026-10-26):**
  - Addons that place the alerts win and KAF follows them, detected for any addon.
  - Otherwise a setting "Position applies to": Every alert (stacking as today, default) or Only event reminders.
  - Placeholders as Show me.
  - Hide removes every KAF pop-up.

**One departure from the spec, for Krowi to confirm with this plan:** the new setting applies at once, without the reload R1 names. Leaving Every alert needs the same "give the alerts back" step as starting to follow another addon, so no extra mechanism is needed, and the tests can switch it without a reload.

## Files that change
| File | Change |
|---|---|
| `Gui/EventReminder/AlertSystem.lua` | holder container and its sub-system, `ApplyLocation`, `Restack` post-hook, `IsFollowing` detection, follow sub-system, `SetUpAlert`, `ShowPlaceholders`, `HideAlerts`, `EnumerateAlerts`; `UpdateGrowDirection` goes |
| `Gui/Gui.lua` | `AdjustQueuedAnchors`, `OverwriteAdjustAnchors` and their call in `LoadWithAddon` go |
| `Options/EventReminders.lua` | setters and `RefreshOptions` call `ApplyLocation` and never touch `AlertFrame`; new `AppliesTo` select; `disabled` on grow, spacing, X and Y while following; follow note (a `description` whose `name` is empty unless following); `HidePlaceholder` execute; `PopUpsShowPlaceholderFunc` calls `ShowPlaceholders` |
| `Options/Defaults.lua` | `EventReminders.PopUps.AppliesTo = 1` |
| `Options/Window/Source.lua`, `Options/Window/Map.lua` | an entry's `Buttons` map gives each execute its own text (`ShowPlaceholder` "Show", `HidePlaceholder` `HIDE`); a group entry's `Button` labels every execute in it today (`Source.lua:150-152`) |
| `Options/Window/Help/ShowMe.lua` | Show me's placeholder loop (`:298-321`) moves into the alert system and Show me calls it |
| `Plugins/ElvUI.lua`, `Plugins/GW2_UI/GW2_UI.lua`, `Plugins/EllesmereUI.lua` | skin through `hooksecurefunc(addon.Gui.EventReminderAlertSystem, "SetUpAlert", ...)`; the four location `disabled = true` lines and the `Alert System Overwrite Desc` note go |
| `Data/DataIntegrityManager.lua` | solution 2 clears `KrowiAF_SavedData.AlertSystem` |
| `Localization/<locale>.lua` (11) | below `Exported at`: Position applies to, its Desc, Every alert, Only event reminders, Hide placeholders, Hide placeholders Desc, the follow note; translated |
| `Tests/PopUps.lua` (new), `Tests/Files.xml`, `Tests/Pictures.lua`, `Tests/Options.lua` | the suite; Pictures walks `EnumerateAlerts`; `options-fingerprint` recorded again (+2 options) |
| `.claude/tools/headless/run-tests.lua`, `.claude/tools/headless/options-env.lua` | `suites.popups` with the alert model; `optionsEnv.New(root, client, {Prepare = fn})`, uncached, to install the model before the load |
| `Tests/README.md`, `.github/copilot-instructions.md` | suite row and suite list |
| `_Packaging/Changelog.md` | lines under 105.0 |

## Design details
**Holder** (`AlertSystem:Load`, reminders on, at `ADDON_LOADED` as now):
```lua
holder = CreateFrame("Frame", nil, UIParent)
holder:SetSize(10, 10)                          -- AlertFrame's size: pop-ups at the same offsets land where they do today
Mixin(holder, AlertContainerMixin)
holder:OnLoad()                                 -- login flags: Retail through EventUtil, Classic through events
if holder.OnEvent then holder:SetScript("OnEvent", holder.OnEvent) end
self.SubSystem = holder:AddQueuedAlertFrameSubSystem(template, SetUp, MaxAlerts, 100)
self.SubSystem.AdjustAnchors = AdjustAnchors    -- KAF's own table; reads grow direction and spacing from the profile
hooksecurefunc(AlertFrame, "SetAlertsEnabled", function(_, enabled, reason) holder:SetAlertsEnabled(enabled, reason) end)
hooksecurefunc(AlertFrame, "UpdateAnchors", Restack)
```
`SetUp` calls `eventReminderAlertSystem.SetUpAlert(frame, event, duration)` through the table field, so the plugins' hooks reach pop-ups in either sub-system. The `SetUp` it replaces is `AlertSystem.lua:5-8`.

**`ApplyLocation`** is called from `Load`, the five setters (`AppliesTo` among them) and `RefreshOptions`. It returns at once without a holder or while following.
- **Every alert:** `AlertFrame` goes to `BOTTOM` of `UIParent` at the offsets, as now. KAF remembers that placement and reads it back, since EllesmereUI re-applies its own inside `SetPoint`. Then KAF's `Restack` runs directly; the setters' `AlertFrame:UpdateAnchors()`, which runs Blizzard's whole pass from addon code, goes.
- **Only event reminders:** the holder goes to `BOTTOM` of `UIParent` at the offsets, and `holder:UpdateAnchors()` runs. If KAF had moved `AlertFrame`, it gives the alerts back first (below).

**`Restack`** (the post-hook; also called directly):
- Returns unless the setting is Every alert and KAF is not following; a detection check comes first.
- Walks `AlertFrame.alertFrameSubSystems` the way `AlertContainerMixin:UpdateAnchors` does, from `AlertFrame.baseAnchorFrame`:
  - a queued system's active frames get `ClearAllPoints` and `SetPoint(point, relative, relativePoint, 0, ±spacing)`, but only when the grow direction or spacing differ from Blizzard's (up, 10);
  - an externally or auto anchored system passes on its `anchorFrame` while shown;
  - Blizzard's `IsInDefaultPosition` rule applies;
  - an unknown kind passes the relative frame through.
- Then anchors the holder at the chain's end, `TOP` to `TOP` when growing up and `BOTTOM` to `BOTTOM` when growing down, so the first pop-up sits where Blizzard's next toast would.
- Allocates nothing (`EnumerateActive` is `pairs`).
- Reads Blizzard's tables, writes none; only `SetPoint` on toast frames, which are not protected.

**Detection (`IsFollowing`):**
- `true` once `AlertFrame` has more than one point, or a point other than the expected one: Blizzard's `BOTTOM, UIParent, BOTTOM, 0, 128`, or KAF's own last placement under Every alert (offsets rounded).
- Checked before `Load` places `AlertFrame` (an addon that moved it first wins at once), after every placement, in `Restack`, in `AddAlert`, and from the options' `disabled` and note functions.
- Sticky for the session.

**Giving the alerts back** happens on the switch to following, and when leaving Every alert:
- The toasts still showing are re-anchored Blizzard's way once (`ClearAllPoints`, then `BOTTOM` to `TOP` + 10), so no toast keeps KAF's `TOP` point next to Blizzard's `BOTTOM`.
- When leaving Every alert, `AlertFrame` also goes back to its XML spot.
- While following, new pop-ups go to `self.FollowSubSystem = AlertFrame:AddQueuedAlertFrameSubSystem(template, SetUp, MaxAlerts, 100)`, created once.

**Placeholders:**
- `ShowPlaceholders(order, duration)` holds Show me's loop: copies with `setmetatable({EventDetails = {...}}, {__index = event})` of the enabled events.
- The free places come from the active sub-system's `maxAlerts` minus its active frames; the profile value can differ from it until a reload.
- Without a holder it prints `L["Help Events Off"]` and returns.
- The Location button passes the calendar events first and 60 s; Show me passes its own order and the fade delay.

**`HideAlerts`** sets `queuedAlerts = nil` on both of KAF's sub-systems, collects their active frames into a reused table, then hides each. `OnHide` releases them through Blizzard's pool.

**Saved data.** `AdjustAnchors` reads `addon.Options.db.profile.EventReminders.PopUps` directly. Solution 2 in `LoadSolutions` sets `KrowiAF_SavedData.AlertSystem = nil`.

## The `popups` suite
- **Shape:** `Tests/PopUps.lua`, `addon.Tests.PopUps = { Scenarios = {...} }`, written `Name = "<name>"` literally.
  - `Run(env, observations)` is shared with the headless runner.
  - In game: `Async.popups`, the shared scenarios, then game-only steps in the `Options.lua`/`Tracking.lua` way: banner, screenshot, settle.
  - The game-only steps: `placeholders-shown`, then `hidden` after `HideAlerts`, then the BugGrabber step.
- **Restoring:** each scenario sets its options through the option setters and puts them back. Hiding and dequeueing the pop-ups it made touches only KAF's own sub-systems. A real event's `EventDetails` is saved before and restored after.
- **Headless only:** scenarios that need another addon, Blizzard holding its alerts, a profile switch, a load with reminders off or a game toast go through an env capability. It returns a blocker in game, so they SKIP there.
- **Scenarios** (Recorded = today, set to Target after the fix):

| Name | Where | Recorded | Target |
|---|---|---|---|
| `toast-anchoring`: whose `AdjustAnchors` Blizzard's queued systems carry (`issecurevariable` in game) | both | KAF's | Blizzard's |
| `reminders-off`: the same after a load with reminders off | headless | KAF's | Blizzard's |
| `offset-change`: what an offset change moves, Every alert | both | Blizzard's alert frame | Blizzard's alert frame |
| `only-reminders`: what an offset change moves, Only event reminders | both | no such setting | the holder |
| `every-alert-grow-down`: a game toast with grow Down | headless | below the alert frame | below the alert frame |
| `every-alert-chain`: the first pop-up's anchor while a game toast shows | headless | on the toast | on the toast |
| `other-addon`: another addon re-pins `AlertFrame` on every alert; an offset change, then a pop-up | headless | alert frame moved, options open, pop-up with the other addon | nothing moved, options greyed, pop-up with the other addon |
| `profile-switch`: a profile with other offsets | headless | stays | moves |
| `game-holds-alerts`: a pop-up while Blizzard holds its alerts | headless | waits | waits |
| `placeholders`: one press, max 2 | both | shown 2, queued 22 (Classic 10) | shown 2, queued 0 |
| `placeholder-details`: a real calendar event's details after a press | both | changed | unchanged |
| `hide`: placeholders plus a real reminder showing and waiting, then Hide | both | no Hide | 0 showing, 0 waiting |

- **Headless model** (`suites.popups`, on `optionsEnv.New(root, client, {Prepare = InstallAlertModel})`), from both clients' `AlertFrames.lua`:
  - `AlertContainerMixin` (flags, `UpdateAnchors`, `AddAlertFrame`, sub-system priorities), `AlertFrameQueueMixin` (pool, queue, `AdjustAnchors`), `CreateFramePool`, `AlertFrame_ShowNewAlert`;
  - frames with real points, a table-method `hooksecurefunc` (`run-tests.lua:738-751`), `issecurevariable` that tracks addon writes;
  - `AlertFrame` with two Blizzard queued systems, plus `GroupLootContainer` externally anchored on Retail;
  - Retail's `EventUtil` login wait and Classic's events, both fired by the model;
  - `addon.Gui:LoadWithAddon()` run for real, with `WorldMapButton`, `EventReminderSideButtonSystem` and `FloatingAchievementTooltip` stubbed.
- **Registration:** `Tests/Files.xml` (after `Earned.lua`), `run-tests.lua` (`suites.popups` and its header line), the README table, the suite list in `copilot-instructions.md`. The `unit-tests` rule then runs it on every turn. It stays out of the release gate.

## Order of work
1. Suite and model with Recorded = today. Headless on both clients: PASS, targets open. `options` still green.
2. **In-game before-run (maintainer gate for GUI work):**
   - message `krowi-achievementfilter-c1` before deploying;
   - `Deploy.ps1 -WhatIf`, then deploy to Retail and Classic, naming what it replaces;
   - Krowi runs `/kaftest popups` and then `/reload` on each;
   - `Read-GameTests.ps1` matches headless.
   - Commit `test: reproduce #188 and #364 in the popups suite`.
3. **Fix, in this order:** `AlertSystem.lua`, `Gui.lua`, the options and defaults, the window button text, Show me and Pictures, the three plugins, `DataIntegrityManager`, the locale strings. Then set Recorded to Target and record `options-fingerprint` again (406→408 Retail, 302→304 Classic, new hashes). Commit `fix: ...` in steps.
4. **Changelog under 105.0:**
   - Fixed: event reminder pop-ups no longer jump back when an addon such as Dominos, ElvUI, GW2 UI or EllesmereUI places the game's alerts, and go with them instead.
   - Fixed: pop-ups move to their spot after a profile switch.
   - Fixed: Show placeholders shows a short preview and no longer keeps adding pop-ups for minutes.
   - Added: a setting for whether the pop-up position moves every alert or only the event reminders.
   - Added: a Hide placeholders button.
5. Update `plan.md` where the build departs.

## Risks
- **The holder's timing.** It must exist before `VARIABLES_LOADED`, `PLAYER_ENTERING_WORLD` and `FIRST_FRAME_RENDERED`. In game, check that the login and reload pop-ups still show.
- **Hook order with other addons' `UpdateAnchors` hooks.** Detection makes it irrelevant: either way KAF sees a foreign anchor and stops.
- **A false follow** if a patch makes Blizzard move `AlertFrame`. The in-game `offset-change` scenario would show it.
- **The options window's shared `Source.lua`.** The `options` suite covers it.
- **Translations** for 10 locales are made by the agent, as the repo rule asks; Krowi may swap them on CurseForge.

## Proof
- **Headless:** `run-tests.lua popups` at Target on both clients; every other suite green through `Check-Repo.ps1` (the `unit-tests` rule); `load-data.lua Both`.
- **Checks:** `Check-Repo.ps1 -Luals` (the `HIDE` global string), `Find-DeprecatedApi.ps1`, `krowi:taint-reviewer` on the diff, `/code-review`.
- **In game, Retail and Classic:** the `/kaftest popups` after-run matches headless, and `Read-GameErrors.ps1` shows no new rows.
- **Krowi's checks, with screenshots:**
  - Every alert with grow Down and a moved Y: a toast and the pop-ups stacked together;
  - Only event reminders: the pop-ups at the offsets and a toast at Blizzard's spot;
  - on Retail with GW2_UI, or EllesmereUI's Alert Toasts mover, on: the pop-ups with that addon's alerts and the location options greyed with the note.

## As built
**Where the build departs from this plan:**
- The setting applies at once, without a reload: approved with the plan.
- Position applies to is greyed out too while the addon follows another addon, since it does nothing then.
- The Hide button's text is Krowi_Util's `L["Hide"]`, not the `HIDE` global string, so no global was added.
- `EnumerateAlerts` returns `ipairs` over a list of both systems' frames; `HideAlerts` builds its list on each click. Neither runs in the background.
- Found in self-review: under Every alert, a toast showing while the grow direction went from Down back to Up kept the addon's `TOP` point beside the `BOTTOM` point Blizzard's next pass gives it, so it stretched. `Restack` now re-anchors once on the way back to Blizzard's stacking. The `every-alert-grow-back` scenario guards it (5cf6921a).
- The headless model stubs only the alert template's own regions; any other field reads nil, as in the game. The lenient model had invented `AlertFrame.baseAnchorFrame` on Classic.
- `Restack` is a `hooksecurefunc` post-hook, which the `background-jobs` lint rule does not list, so `Check-Repo.jobs` is unchanged.
- The plugins' `DisableOptions` gave a fresh `local appName` to their calendar-button block. GW2_UI keeps its `ALERTFRAME_ENABLED` gate in front of that block, as before.

**Game runs (2026-10-26), all matching headless:**
- Before the fix: Retail at 17:57 and Mists at 18:04. Retail queued 39 placeholders and Mists 9, as recorded.
- After the fix: Retail at 18:20 and Mists at 18:21. Every scenario meets its target, the live Show and Hide steps pass, and BugGrabber shows no new errors.
- Krowi: "looks good in game".

**From the taint review and `/code-review` (2026-10-26), each reproduced first in the `popups` suite (25d5ba28):**
- **Grow Down loop.** Blizzard's pass anchors toast on toast without clearing, and its pools' `pairs()` order can change between passes. A toast the addon had hung on another could close a loop, which `SetPoint` refuses with an error inside that pass (`every-alert-reorder`). `WalkAlertFrame` now hangs each toast on the chain's last frame that is not a toast, as far from it as the toasts before it take, so no toast hangs on another. The model's `SetPoint` refuses loops as the game does, and its pools keep an order a scenario can flip.
- **Starting to follow.** Following no longer restacks the other addon's toasts Blizzard's way unless the addon had stacked them itself. The holder goes back to the options' spot instead of staying on a toast whose pool hands it out again (`follow-switch`).
- **Show placeholders while the game holds its alerts** no longer queues any: it adds only while `CanShowMore` (`placeholders-while-held`).
- **Trading Post and Shop.** `SetBaseAnchorFrame` and `ResetBaseAnchorFrame` (Retail) now run the restack too, so the holder leaves the Trading Post's or Shop's frame when it closes.
- **Smaller fixes.** `HideAlerts` walks `EnumerateAlerts`, the holder's edge comes from `GrowPoints`, and `GetPoint` is guarded for secret values.
- **Not changed:** Show me keeps its own reminders-off guard, since it must return `false` there. "Alert System Overwrite Desc" stays in the Plugins locale files until Krowi deletes it on CurseForge and the next import removes it.

**Noticed, not changed:**
- Show placeholders can show an event twice when it is listed under two kinds (Retail showed WoW Remix: Mists of Pandaria and Winds of Mysterious Fortune twice). Show me did the same before.
- An older Retail error from 2026-10-25 (x7), `AlertFrameMixin.lua:59 attempt to index field 'Event'`, predates this work.