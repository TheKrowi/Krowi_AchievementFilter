# Spec: Event reminder pop-ups follow addons that place the game's alerts, keep their own position otherwise, and get a Hide button
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. A new setting under Pop up position, "Position applies to", with **Every alert** (the default, today's look) and **Only event reminders**; switching needs a reload.
2. **Every alert:** the X and Y offset move the game's alert stack (achievement, criteria, loot won and the other toasts), the pop-ups continue that stack, and the grow direction and spacing stack the toasts as today. Loot rolls stay where Blizzard puts them, as today.
3. **Only event reminders:** the offsets, grow direction and spacing move only KAF's pop-ups; the game's toasts stay at Blizzard's spot and stack Blizzard's way.
4. **Another addon places the game's alerts** (any addon; seen when Blizzard's alert anchor is no longer where Blizzard or KAF put it): KAF stops moving and restacking anything, its pop-ups go with the game's alerts wherever that addon puts them, in either setting, and the offsets, grow direction and spacing are greyed out with a note saying another addon places the alerts. KAF never fights over the spot, so the position never "resets".
5. KAF never replaces Blizzard's stacking code and never writes into `AlertFrame` or its sub-systems, except, only while it follows another addon, adding its own pop-up system to `AlertFrame` through Blizzard's own call for that. With event reminders off at login it does nothing to the game's alerts.
6. Changing an offset, the grow direction or the spacing applies at once. Switching or resetting the profile applies that profile's position (today it does not).
7. The pop-ups still wait at login until the game shows its own alerts, and while the game holds its alerts back (Retail's What's New splash, the Runeforge craft).
8. The ElvUI, GW2_UI and EllesmereUI skins still apply to every pop-up, wherever it lives; the options window's Show me and the `pictures` suite still find the pop-ups.
9. Show placeholders shows what Show me shows: the player's enabled events with their real names and a made-up time, built on copies, never writing into the real events (also while Blizzard's calendar is open). As many as fit at once (Max number of alerts, minus the pop-ups already showing), each for 60 seconds, none queued; pressing it again only fills the free places.
10. A Hide placeholders button next to Show placeholders removes every KAF pop-up, showing and waiting, real reminders included. It never touches the game's own toasts.
11. Show placeholders with event reminders off at login says so in chat, as Show me does, instead of doing nothing.
12. Retail and Classic (Mists, Titan) behave the same.

## Root cause
**#188: KAF moves Blizzard's frame, and so do the UI addons.** The pop-ups are a queued sub-system of Blizzard's `AlertFrame` (`Gui/EventReminder/AlertSystem.lua:16`), so they are stacked in its anchoring pass, starting from `AlertFrame` itself (`AlertContainerMixin:UpdateAnchors`, `wow-ui-source/live/.../Mainline/AlertFrames.lua:410-418`). The offsets move `AlertFrame` (`AlertSystem.lua:17-18` at load, `Options/EventReminders.lua:102-114` on change). Blizzard places `AlertFrame` once in XML (`BOTTOM`, 0, 128 on both clients) and never again, so without another addon KAF's position already sticks. Addons that own the alert position put it back on every alert:
- Dominos Roll's **Alerts** bar re-pins `AlertFrame` in a post-hook of `AlertFrame:UpdateAnchors` (`Dominos_Roll/alertsBar.lua`, `rollBar.lua:94` in the 2024 version); its **Roll** bar does the same for the loot rolls. Both are moved in Dominos' unlock mode, not in its options, which is why NoShotz did not find them. It does not restack the toasts.
- ElvUI's "Loot / Alert Frames" mover re-pins `AlertFrame` and the loot rolls on every pass and replaces every sub-system's `AdjustAnchors`, KAF's included (`ElvUI/Game/Shared/Modules/Blizzard/AlertFrame.lua:35-41, 117-156`).
- GW2_UI, with its notifications on, re-pins and restacks every sub-system in its own post-hook (`GW2_UI/Games/Shared/Immersive/alertPosition.lua:61-84`).
- EllesmereUI's "Alert Toasts" mover, once unlocked and placed, puts `AlertFrame` back whenever anything calls `SetPoint` on it (`EllesmereUIQoL_Shifter.lua:825-834`).

KAF disables its location options for ElvUI, GW2_UI and EllesmereUI through its plugins, whenever they are loaded, not when they actually place the alerts; it has no plugin for Dominos, so it fights Dominos, as NoShotz's screenshots show (Y offset 1045, a placeholder at the top, the next one mid-screen).

The loot rolls (`GroupLootContainer`) were never moved by KAF: Blizzard places them through its bottom-of-screen layout and lists them in `AlertFrame` only as an externally anchored step that the toasts after it stack on (`Mainline/GroupLootFrame.lua:9`, `.xml:537`). Moving them means writing fields into Blizzard's frame (`ignoreFramePositionManager`, `ignoreInLayout`), which the taint rules forbid.

A profile switch does not move the pop-ups: `RefreshOptions` (`Options/EventReminders.lua:765-777`) calls the setters with the new profile's values, and each setter returns early because the profile already holds them.

**Every player's toasts run through KAF's code.** `gui:LoadWithAddon` (`Gui/Gui.lua:9-15`) calls `OverwriteAdjustAnchors` at every login, before `AlertSystem:Load` checks whether reminders are on. It replaces `AdjustAnchors` on every queued sub-system in `AlertFrame.alertFrameSubSystems`, and through a hook on every one added later (`Gui/Gui.lua:427-446`), with `AdjustQueuedAnchors` (`:418-425`), which stacks by KAF's grow direction and spacing (`AlertSystem.lua:159-166`). Blizzard's own (`Mainline/AlertFrames.lua:243-248`) stacks upward 10 apart, which KAF's defaults reproduce. With reminders off, `UpdateGrowDirection` never runs and the toasts read what an earlier session saved in `KrowiAF_SavedData.AlertSystem`; an account that had reminders off from its first login would get a Lua error on the first toast. The code came with the movable pop-ups in January 2023 (4a6852b), "credits to ElvUI".

**Taint.** These are addon functions stored in Blizzard's tables. `UpdateAnchors` calls them in every anchoring pass, so from the first replaced sub-system on, the pass and the rest of `AddAlertFrame` (`SetParent`, `SetFrameStrata`, `AlertFrame_ShowNewAlert`, `Mainline/AlertFrames.lua:454-461`) run tainted for every toast. Adding a sub-system from addon code also leaves addon-written values in `AlertFrame`'s own fields (`anchorPrioritiesDirty`, the list entry, `:351-357`), which the next pass reads. No reported error is traced to this yet; it is what the workspace rules forbid.

**#364: the placeholder button.** `PopUpsShowPlaceholderFunc` (`Options/EventReminders.lua:116-134`) calls `AddAlert` for every calendar event with 60 seconds, and the queue takes up to 100 (`AlertSystem.lua:16`), so one press queues 24 on Retail and 12 on Classic. It writes fake `EventDetails` onto the live calendar events; the next refresh resets them, except while Blizzard's calendar is open (`Data/EventData.lua:155-158`, `:314-316`). A pop-up draws its event when it shows, not when it is queued (`AlertFrameMixin.lua:43-55`), so queued placeholders show "Collecting data" or the real event after the refresh. Nothing placeholder-related reaches saved variables, and login and reload take the same path, so what Spekkio saw after a reload was most likely the real On Reload reminders.

**Reproduction.** Built test first in stage 3: the `popups` suite below records each of these as today's behaviour, headlessly and in game, before the fix.

## Design
**The holder.** KAF's pop-ups live in an alert container of KAF's own: `CreateFrame("Frame", nil, UIParent)`, mixed with Blizzard's `AlertContainerMixin` and its `OnLoad` run, with `OnEvent` set as its script where the mixin has one (Classic waits for its login events through it, `Classic/AlertFrames.lua:256-275`). Not `AlertContainerTemplate`: Classic's version has two `OnLoad` handlers and the second calls `OnEvent` (`Classic/AlertFrames.xml:12-17`). `AlertSystem:Load` creates it at KAF's `ADDON_LOADED`, as now, so before the `VARIABLES_LOADED`, `PLAYER_ENTERING_WORLD` and `FIRST_FRAME_RENDERED` the mixin waits for (`Mainline/AlertFrames.lua:259-283`). Its queued sub-system comes from `holder:AddQueuedAlertFrameSubSystem`, a Blizzard `AlertFrameQueueMixin` on KAF's own table, whose `AdjustAnchors` is KAF's and reads the grow direction and spacing from the profile.

**Only event reminders.** The holder sits `BOTTOM` of `UIParent` at the offsets. `AlertFrame` is never touched.

**Every alert.** KAF places `AlertFrame` at the offsets, at load and on change, as now. A `hooksecurefunc` post-hook on `AlertFrame:UpdateAnchors` then walks Blizzard's sub-systems in their order, as `UpdateAnchors` does, re-anchors the active toasts of the queued ones by KAF's grow direction and spacing (only `SetPoint` on the toast frames; nothing written into Blizzard's tables), and anchors the holder at the end of that chain, so the pop-ups continue the stack as they do today. With the defaults (up, 10) the walk only finds the end of the chain. It allocates nothing (`EnumerateActive` is `pairs`) and runs once per alert. It is not in `.claude/tools/Check-Repo.jobs`: the `background-jobs` rule does not see `hooksecurefunc` hooks, and a line no code matches is an error there.

**Following another addon.** KAF expects `AlertFrame`'s anchor to be Blizzard's (`BOTTOM`, `UIParent`, `BOTTOM`, 0, 128) or, under Every alert, its own last placement. It reads the anchor (read only) right after placing it, in the post-hook, when the options draw the location group and before each pop-up. Once the anchor is anything else, another addon places the alerts, and for the rest of the session KAF:
- stops placing and restacking (the post-hook returns at once);
- adds a second queued sub-system to `AlertFrame` with `AddQueuedAlertFrameSubSystem`, the call Blizzard offers for this, once, and sends new pop-ups there, so the other addon stacks them with its toasts (ElvUI's and GW2_UI's restacking pick it up like any other system);
- greys out the offsets, grow direction and spacing (`disabled` functions) and shows a note saying another addon places the game's alerts, so the pop-ups go with them.

This replaces the three plugins' `DisableOptions` lines for the location group, which grey them out whenever the addon is loaded. A pop-up already showing in the holder stays until it fades.

**One setup for both systems.** Both sub-systems call `eventReminderAlertSystem.SetUpAlert`, and the ElvUI, GW2_UI and EllesmereUI plugins hook that function instead of `SubSystem.setUpFunction`, so their skin reaches pop-ups in either home. `eventReminderAlertSystem:EnumerateAlerts()` walks the active pop-ups of both, for Show me and the `pictures` suite.

**The game's pauses.** A `hooksecurefunc` on `AlertFrame.SetAlertsEnabled` passes Blizzard's reasons on to the holder, so the pop-ups keep waiting behind the What's New splash and the Runeforge craft as they do now; the login wait comes from the holder's own `OnLoad`. Not followed: `SetFullScreenFrame` and `BlockLeftClickingAlerts` (Trading Post, Shop), where the pop-ups stay on `UIParent`.

**Placing.** One function places everything for the current setting, called from `Load`, from the four setters and from `RefreshOptions`. Without a holder (reminders off at login) the setters only save.

**Removed.** `gui:OverwriteAdjustAnchors`, its call and its hook on `AddAlertFrameSubSystem`; `UpdateGrowDirection` and `KrowiAF_SavedData.AlertSystem`, cleared by a numbered solution in `Data/DataIntegrityManager.lua`; the plugins' location `DisableOptions` lines. "Alert System Overwrite Desc" names an ElvUI mover and fits no other addon, so the note gets a new string, and the old one can be deleted on CurseForge.

**Placeholders.** `eventReminderAlertSystem:ShowPlaceholders(order, duration)` holds what Show me does now (`Options/Window/Help/ShowMe.lua:289-329`): copies (`setmetatable({EventDetails = {...}}, {__index = event})`) of the player's enabled events, with their names and a made-up end time, only as many as fit. Show me calls it with its order and the fade delay, the Location button with the calendar events first and 60 seconds. `eventReminderAlertSystem:HideAlerts()` empties both sub-systems' queues, then collects their showing pop-ups and hides them, which releases them through Blizzard's pool. A Hide placeholders button sits next to Show placeholders.

**New strings, in every locale:** "Position applies to", its description, "Every alert", "Only event reminders", "Hide placeholders", its description, and the follow note.

## Options considered
First round (2026-10-26), what the settings move and where the pop-ups live:
1. Own holder for everyone, the game's toasts never moved. Not chosen as such: Krowi wants addons that place the alerts to win, and the choice between every alert and only the reminders.
2. Own holder plus a Position choice, with the pop-ups in `AlertFrame`'s stack by default. Not chosen: superseded by the second round.
3. Keep riding on `AlertFrame` and re-pin it after every alert. Not chosen: fights the UI addons.
4. Keep riding on `AlertFrame`, drop only the `AdjustAnchors` overwrite. Not chosen: does not fix #188.

Second round (2026-10-26), after the Dominos and loot roll analysis:
- **Without a UI addon:** a setting, Every alert (stacking as today) or Only event reminders. **Chosen.** Not chosen: only the reminders for everyone; every alert with Blizzard's stacking and no grow direction or spacing.
- **Knowing another addon places the alerts:** detect any addon from `AlertFrame`'s anchor. **Chosen.** Not chosen: the known list (ElvUI, GW2_UI, EllesmereUI) plus Dominos Roll, which leaves any other addon fighting KAF.
- **What a placeholder shows:** the player's events, as Show me. **Chosen.** Not chosen: pop-ups marked "Placeholder".
- **What Hide removes:** every KAF pop-up, real reminders included. **Chosen.** Not chosen: only placeholders.

## Areas of concern
- **Taint and secret values.**
  - Blizzard's anchoring pass no longer calls KAF code and reads nothing KAF wrote, under either setting.
  - Under Every alert, KAF still places `AlertFrame` and re-anchors the toasts with `SetPoint` from addon code, now in a post-hook after Blizzard's pass. Alert frames are not protected.
  - While following, KAF's own sub-system sits in `AlertFrame`'s list, so the pass reads it and a pop-up added or hidden from KAF's code runs Blizzard's pass from addon code, as every pop-up does today. That is the price of letting the other addon stack the pop-ups, and only for players who have such an addon.
  - The two `hooksecurefunc` post-hooks leave Blizzard's calls secure.
  - No secret values involved. `krowi:taint-reviewer` runs on the diff.
- **Clients.** `## Interface: 120105, 50504, 38002`.
  - `AlertContainerMixin`, `AlertFrameQueueMixin`, `AlertFrameTemplate` and `AlertFrame`'s XML anchor are the same on Retail, Mists and Titan (`classic_titan` matches `classic`), and Classic's event-driven `OnLoad` is handled.
  - Titan has no local install, so it is checked by source only. KAF does not load on Forever.
- **Blizzard API.** The mixins are FrameXML globals, not documented API, used today too. Detection relies on Blizzard never moving `AlertFrame` itself; if a patch starts to, KAF would follow by mistake and grey out its options, which the `popups` suite's in-game run would show. `Find-DeprecatedApi.ps1` runs in stage 4.
- **Other addons, plugins and skins.**
  - ElvUI, GW2_UI, EllesmereUI's mover and Dominos Roll are followed once they move `AlertFrame`, so EllesmereUI users without its mover now keep KAF's settings.
  - An addon that restacks the toasts without moving `AlertFrame` would not be seen; none is known.
  - The plugins' skins move to the shared setup hook. The holder has no global name.
- **Saved variables and migrations.** One new profile key (the setting, default Every alert). `KrowiAF_SavedData.AlertSystem` goes, through a numbered solution.
- **Localization.** Seven new strings in every locale. "Alert System Overwrite Desc" becomes unused, to delete on CurseForge.
- **Embedded libraries, data snapshots.** None.
- **Player-facing text.** Changelog lines:
  - Fixed: the pop-ups no longer jump back with Dominos Roll and other addons that place the alerts, and follow them instead; the position follows a profile switch; Show placeholders shows a short preview and no longer changes the events.
  - Added: Position applies to; Hide placeholders.

## Verification
A new `popups` suite (`Tests/PopUps.lua`), headlessly on the whole-addon load the `options` suite uses (`.claude/tools/headless/options-env.lua`) with a model of Blizzard's alert container, queue, frame pool and `AlertFrame` from both clients' `AlertFrames.lua`, and in game through `/kaftest popups`. Recorded is today's behaviour, Target the fix's:

| Scenario | Recorded | Target |
|---|---|---|
| `toast-anchoring`: whose `AdjustAnchors` Blizzard's queued sub-systems carry | KAF's | Blizzard's |
| `reminders-off`: the same with reminders off at load (headless only) | KAF's | Blizzard's |
| `every-alert-grow-down`: a game toast's place with grow direction Down under Every alert | below `AlertFrame` | below `AlertFrame` |
| `every-alert-chain`: the first pop-up's anchor with a game toast showing | on the toast | on the toast |
| `only-reminders`: what an offset change moves under Only event reminders | no such setting | the holder only |
| `other-addon`: another addon re-pins `AlertFrame` on every alert (headless only); an offset change, then a pop-up | `AlertFrame` moved, pop-up with the other addon | nothing moved, options greyed, pop-up with the other addon |
| `profile-switch`: the pop-ups after a profile switch to other offsets (headless only) | stay | move |
| `game-holds-alerts`: a pop-up while Blizzard holds its alerts (headless only) | waits | waits |
| `every-alert-grow-back` (added in the build): a toast after Down and back to Up (headless only) | n/a | 1 point, above `AlertFrame` |
| `placeholders`: one press with Max number of alerts 2 | shown 2, queued 39 (Classic 9) | shown 2, queued 0 |
| `placeholder-details`: a real calendar event's details after a press | changed | unchanged |
| `hide`: placeholders and a real reminder showing and waiting, then Hide | no Hide | 0 showing, 0 waiting |

Stage 3: the in-game before-run on Retail and Mists matches the headless one before the fix starts. Stage 4: the after-run on both clients; on Retail, screenshots under each setting, and with GW2_UI or EllesmereUI's mover on, the pop-ups with that addon's alerts and the options greyed; `Read-GameErrors.ps1` clean; `Check-Repo.ps1`, `krowi:taint-reviewer`, `/code-review`. Dominos Roll is not installed here, so it is covered by the headless `other-addon` scenario, modelled on its source.

## Decision
Krowi, 2026-10-26, in two rounds at the design gate:
- #188 and #364 are one work item (before the gate).
- Addons that place the game's alerts win and KAF follows them, detected for any addon rather than from a list; Dominos Roll is one of them.
- Without such an addon, a setting chooses whether the position moves every alert, stacking as today, or only the event reminders.
- Placeholders show the player's events, as Show me does; Hide placeholders removes every KAF pop-up, real reminders included.
- Defaults chosen by the agent, open to change at the plan gate: Every alert, so nothing changes on screen for players without such an addon; placeholders last 60 seconds.

Krowi, 2026-10-26, after the taint review (stage 5):
- **The review's finding.** While following, KAF's own system in `AlertFrame`'s list is read by more of Blizzard's loops than the anchoring pass:
  - `SetEnabledFlag` when the What's New splash closes, which then updates the objective tracker tainted (`SplashFrame.lua:25-26`);
  - `ReparentAlerts` when the Trading Post or the Shop opens or closes;
  - the priority sort before the next toast.
  
  Before this fix every reminders user had that path. Now only players have it whose alerts ElvUI, EllesmereUI's mover or Dominos Roll place (GW2_UI adds a system of its own already), and only once a pop-up showed while following.
- **The alternative offered:** hang the holder at the end of that addon's stack, reading the stack's direction, so that KAF writes nothing into Blizzard's alert system for anyone.
- **Decision:** kept as built. KAF writes no placement code of its own for another addon's alerts. It only greys out its options with a note and lets that addon stack the pop-ups as Blizzard's alert system offers. If an objective-tracker taint report comes from such a player, the alternative is the way out.
- **Taken from the review without a decision:** `IsAt` no longer compares `AlertFrame`'s anchor when `GetPoint` gives secret values (reads them as another addon's placement).
- **Left for its own work item:** Krowi_Reminders still adds a system to `AlertFrame` and moves it at load.