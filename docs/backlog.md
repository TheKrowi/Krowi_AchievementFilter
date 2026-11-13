# Backlog

Follow-ups that are not a work item yet. When one is taken up, it gets its own work folder under `docs/work/` (`docs/sdlc-playbook.md`) and leaves this list.

## From the reload-then-Y fix (2026-11-13, docs/work/2026-11-13-window-before-data)

- **Other special categories read before the data load made them** (scope B, noted by Krowi, 2026-11-13). The fix guards only Current Zone. Three more player actions read a special category list that exists only once `addon.SpecialCategories:Load` runs at the end of the login data load (`Data/Data.lua` `PostLoadOnPlayerLogin`), so each would raise "attempt to get length of field ... (a nil value)" when used in the first seconds after a login or reload. None is in a log yet.
  - the world map button's click: Selected Zone (`Gui/WorldMapButton/WorldMapButtonMixin.lua:25-33`);
  - the search's "show all results": Search Results (`Gui/WindowFrames/Search/PreviewContainer/PreviewContainerMixin.lua:6-14`);
  - watch, exclude and track from the right-click menu: Watch List, Excluded, Tracking (`Data/SpecialCategoryAchievements.lua:152-237`).

  Creating every list empty at load would cover all three, but `Options/Layout.lua:67`, `:178` and `Data/SavedData/AchievementData.lua:290` read a missing list as "the window is not loaded yet" (spec, option 3).

## Moved from session memory (2026-11-09)

- **Agent-made translations** of "Aqir Invasions" and "The Promise of Tomorrow" (12.1.5): swap for Blizzard's own names (Krowi deferred, 2026-10-14).
- **About 40 translations write a word where enUS has a `{placeholder}`** (2026-10-24 check): they lose only a colour or value. Before calling one wrong, check what the code passes to `ReplaceVars` (case-sensitive, unknown names stay as text); the fix route is the localization skill's.
- **"Alert System Overwrite Desc"** is still in the Plugins locale files though no code uses it since #373: delete it on CurseForge (Krowi's click), and the next import removes it.
- **Krowi_Reminders** still uses the old `AlertFrame` pattern #373 removed here; it needs its own work item in that repo.

## From the Right-click menu split (2026-11-09, docs/work/2026-11-09-right-click-menu)

- **Transmog set data loads while the right-click menu is off.** Only the menu's Transmog Sets entry reads it (`addon.GetUsableSets`, `Globals.lua:313`), so by the split's rule it is the menu's own data. It is a registry of its own (`KrowiAF.TransmogSetData`, `Api/TransmogSetDataApi.lua`, `Data/Data.lua:96-101`, `DataAddons/Loaders/TransmogSetData.lua`), and moving it needs a data-registry slot. Achievement guides needs the same slot for its guide data, so the slot is built in that feature's PR and transmog set data moves into the menu then (Krowi, 2026-11-09).
- **The chat-link tooltip reads `tooltipData.id` without a secret-value probe** (`Gui/FloatingAchievementTooltip/FloatingAchievementTooltipMixin.lua:40-47`, the taint review of that work item). The generated API docs flag no secret return for the hyperlink tooltip today; probe it only if chat-link tooltips are reported failing under a communication lockdown.
- **Settings that act only through the menu stay editable while it is off** (the code review of that work item): Achievement guides' "Show Guide in Right Click Menu" (`Achievements.Guide.RightClickMenu`) and the Instance Achievement Tracker plugin's "Add To Right Click Menu" do nothing while the menu is off, yet they are not greyed. Greying them needs the registry to grey a row by another feature's switch; take it up with the Achievement guides split.

## From moving the library's tests out of KAF (2026-11-06, docs/work/2026-11-06-options-tests-move)

- **Krowi_Options' tests on a new game build:** done in `docs/work/2026-11-07-release-gate-suites`. The release gate now requires one green full `/kotest` run per client family on the newest build or later (once per client version), and a green run of every in-game suite; Era, Anniversary and Forever join when KAF's TOC lists them.
- **The section-by-section live steps of KAF's own 22 sections went** (Krowi chose the public smoke): nothing draws KAF's sections in game any more, so a label running into its control, or a control not showing its value, goes unseen by the suite. A KAF-content smoke would need the library's public surface to open a section by id (a tab's `Open` takes one) and a way to read what the page drew without the library's frames.
- **The KAF half of `search-all-none`** (the count of KAF's holiday list through the library's search) is not kept; the count can be checked on KAF's own `Source.Elements` without the library.
## From the category tooltip taint fix (2026-10-23, issue #300, docs/work/300-category-tooltip-taint)

- **Blizzard's tab code still runs tainted** (spec option 3, left for later by Krowi). A click on a Blizzard tab reads two values KAF wrote: the global `AchievementFrameTab_OnClick` (`Gui/Gui.lua:206`) and `AchievementFrame.numTabs`, which KAF raised when it added its own tabs (`Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonFactory.lua:47-62`). So everything Blizzard's Achievements and Guild tabs build is tainted.
  - The fix for #300 only keeps that taint off `GameTooltip`.
  - Removing it means KAF's tabs leave Blizzard's tab strip and KAF stops writing the global. Other tainted writes into Blizzard's frame may remain (`Gui/BlizzardOverrides.lua`, the comment above the chat-link wrappers).
  - That work also drops #300's replacement of `AchievementFrameCategory_StatusBarTooltip`. Blizzard's list reads that global on every fill (`Blizzard_AchievementUI.lua:594`), so while KAF writes it, each fill runs tainted from that line on (the code review of the #300 fix).
  - A third route option 3 as written would not remove: `KrowiAF_CategoriesFrameMixin` shows Blizzard's category list again from KAF's own code when KAF's list hides (`Gui/WindowFrames/CategoriesFrame/CategoriesFrameMixin.lua:66, 75`). Blizzard's `AchievementFrameCategories_OnShow` then fills the list and creates its buttons in KAF's execution (the taint review of the #300 fix).
  - **What it may still risk:**
    - A Blizzard leave handler in that window that runs tainted hides `GameTooltip` tainted. If `GameTooltip` still shows another owner's widget tooltip (a map POI, a vignette) at that moment, #300's error can come back once. That is low likelihood, since that owner hides it on its own leave first.
    - The category buttons, Feat of Strength ones included, are not among them: their `OnLeave` was secure in game (`/kaftest tooltip`, 2026-10-24).
    - The achievement, summary and shield buttons are not measured.
- **`addon.TooltipData.Load` stays disabled** (`Krowi_AchievementFilter.lua:51`). It was turned off in 99.6 while #300 was investigated, and #300 turned out not to come from it. Turning it back on is its own work item: its `HookScript` calls on `GameTooltip` run addon code inside Blizzard's tooltip building, which needs a taint review first.

## From the event scheduler work (2026-10-21, docs/work/2026-10-21-event-scheduler)

- **The rest of Midnight from Blizzard's event scheduler, as data.** With `KrowiAF.Enum.EventSource.Scheduler` a scheduled world event is one row (`docs/how-to/add-event.md`).
  - **Next:** Aqir Invasion (POI 9045, listed twice per occurrence under one key, which the cache drops), the three Abundance sites (8525, 8527, 8528) and Void Assaults (8698). Their achievement categories exist and need `:WithId` like Curse Surges' 2571.
  - **Ongoing events:** Saltheril's Soiree, Stormarion Assault, Legends of the Haranir and Vaults of Atal'Utek have no times; the scheduler lists them under `GetOngoingEvents`.
- **Upcoming reminders for scheduled events.** The upcoming path is calendar-only (`Data/EventData.lua` `GetUpcomingCalendarEvents`, `GetNextEventOccurance`), while the scheduler and the fixed schedules (`Data/EventSchedules.lua`, whose arithmetic gives every next start as easily as the window going on) know them.

## From the fixed schedules work (2026-10-21, docs/work/2026-10-21-fixed-event-schedules)

- **The watched families go fixed once their rotation is confirmed** (Krowi, 2026-10-21): Theater Troupe, Grand Hunts, Researchers Under Fire, Dreamsurges, the N'Zoth assaults, Fyrakk Assaults, the Primal Storms (one "Primal Storms" reminder if confirmed random), and Legion Assaults (one reminder without the zone).
  - The watcher (`Data/EventObserver.lua`) prints the order it sees in debug mode, and keeps it per region in `KrowiAF_SavedData.EventObservations`.
  - `/kaftest sources` lists what it learned.
- **The soup moves into `KrowiAF.EventSchedules`,** out of `Data/CustomWidgetEventTimers.lua`, with the events suite's feast-times scenarios moved to the schedules suite.

## From the memory growth work (2026-10-19, docs/work/2026-10-18-memory-growth)

- **Event reminders on Blizzard's event scheduler and fixed schedules, without POI checks** (Krowi, 2026-10-21). Today world events need their POI on the map, asked on every refresh, and the widget-timed ones also need their widget's text.
  - **Which events:** the widget events (Community Feast, Time Rift, Superbloom, Azerothian Archives) and the widget-timed world events (Researchers Under Fire, Dreamsurges, Theater Troupe), in `Data/CustomWidgetEventTimers.lua` and `Data/CustomWorldEventTimers.lua`.
  - **What goes wrong today:** they only appear while the player is in their zone, and they cost about 1.3 KB of garbage per refresh while a POI is on its map or an event is going on.
  - **The direction:**
    - current content from `C_EventScheduler`, which has scheduled and ongoing events with start and end times and an `EVENT_SCHEDULER_UPDATE` event;
    - older content from KAF's own fixed schedules (anchor per region, interval, duration).
  - **First steps:**
    - a proof of concept with the Curse Surges (area POIs 8936-8940), which KAF does not remind of yet;
    - the soup, Community Feast, on a fixed schedule;
    - research whether the soup belongs in Blizzard's world-map Events tab (a taint question) or in a separate addon.
  - **It closes** the open targets `memory/event-refresh-poi-on-map` and `memory/event-refresh-widget-active`.
  - **Midnight is missing:** KAF reminds of no Midnight world event today. `DataAddons/Retail/12_Midnight/EventData.lua` has only Winds of Mysterious Fortune, while Blizzard's Events tab listed Saltheril's Soiree, Stormarion Assault, Legends of the Haranir, Vaults of Atal'Utek, Abundance, Aqir Invasion, Void Assaults and the Curse Surges (2026-10-21).
- **PvP Season 42 has no season data.** In debug mode the chat shows "No season data for PvP Season 42" (`Data/TemporaryObtainable.lua:62`): an achievement points at a season that `KrowiAF.AddSeasonData` never registers (seen 2026-10-21).
- **During-play garbage, measured the same way next:**
  - The world map button recounts the shown map's achievements on every map change: about 100 KB for a zone, 1-3 MB for a continent (`Gui/WorldMapButton/WorldMapButtonMixin.lua:95-119`).
  - Every open popout redraws all its criteria on every `CRITERIA_UPDATE` (`Gui/WindowFrames/AchievementsObjectives/AchievementsObjectivesMixin.lua:48-64`).
  - The login data load builds a few tables per achievement id (`Data/AchievementCache.lua:104-125`).
- **Small growth on player actions:**
  - `ACHIEVEMENT_EARNED` appends the earned achievement's meta criteria to `criteriaCache` again (`Data/AchievementCache.lua:53, 188`).
  - `newAchievementsEarned` never shrinks (`Data/SavedData/AchievementData.lua:197-199`).
  - `SideButtonSystem:Load` adds two more Show/Hide hooks each time it runs again (`Features/EventReminders/SideButtonSystem.lua:108-121`).
  - `KrowiAF_SavedData.PopoutHideDebug` keeps a stack per achievement ever popped out (`Features/PopOut/AchievementPopout.lua`, `OnPopoutHide`).
- **Saved data no code reads any more** stays in the file and in memory: `KrowiAF_SavedData.CalendarEventsCacheTest`, `VerifyHash` and `DFHashVerify` (about 1 MB on the maintainer's account). A `DataIntegrityManager` solution can drop them.

## From the 103.0 release (2026-10-14)

- **`Benchmark.lua` ships but nothing loads it.** The file is tracked and goes into every release zip, yet no `.toc` line or `Files.xml` names it; it has been so since 97.2. Remove it, or register it behind `addon.Diagnostics.DebugEnabled()` if it is still wanted.

## From the reward preview Escape review (2026-10-13, PR #340)

- **Blizzard's bulk closes leave the achievement window open.** Blizzard calls `CloseAllWindows` on death, on loss of control, at a loading screen and when the store opens.
  - Each call hides `KrowiAF_SpecialFrame` once, and its `OnHide` closes only the addon's topmost registered frame (`Gui/FramesForClosing.lua`). With a side panel, the calendar or the data manager open over the window, the window stays open.
  - That has been so for every registered frame since 101.0.
  - A fix tells a bulk close from an Escape press, for example by closing every registered frame when the call is not the Escape chain's. It gets a scenario in the escape suite.
- **Re-pinning a shown side panel keeps its old place in the Escape order.** `ShowUnpinned` on a panel that is already shown fires no `OnShow`, so moving the reward preview or the guide panel to another row leaves it where it was in `framesForClosing`. Escape may then close the other panel first. A fix raises the frame in the list when it is shown again, through `gui.RegisterSidePanel` or a new `gui:RaiseFrameForClosing`.

## From the achievement guides (2026-10-11, PR #338)

- **About 50 draft translations to review.** Every guide string in the ten non-English locale files is an agent draft:
  - the `Guide ...` and `Show Guide ...` keys;
  - `Map pin`, `Map pin and TomTom`, `Icons` and `Text links`.

  A native speaker checks them, with the game's own terms first: tier, class hall upgrade, Order Resources, waypoint, map pin.
- **The twelve Raise an Army guides.** 60981 to 60992, one per class hall: recruit 20 troops. The same class hall round in step 0 of `docs/work/2026-10-11-achievement-guides/plan.md` measured, in every hall:
  - both troop recruiters with their NPC id, map and spot;
  - the mission table (the Scouting Map, the Priest's Command Map, the Warrior's Eye of Odyn, the Warlock's Dreadscar Battle Plans), because missions wear troops out and free their slots.

  The way into each hall is the first step of its Legendary Research guide (`DataAddons/Retail/07_Legion/GuideData.lua`, `docs/work/2026-10-21-legendary-research-guides`). Unlike those guides this needs a short design look before the data. The builder's steps (`:Travel`, `:Npc`, `:Poi`, `:Area`, `:Criteria`, `:Tip`) have nothing for recruiting: `:Criteria` reads type-198 garrison talents, and these criteria are type 200 (`raw/ZoneDataDecisions.md`). Two things seen in game shape what the guide says: only recruitments since 11.2.7 count (the Paladin showed 1/20 on 60987 despite Legion-era troops), and progress is account-wide (the Paladin saw 7/20 on the Priest's 60988).
  - Saying either is free text, which only a translator can put into the other languages, and Krowi wants no new strings for the CurseForge translators (the analysis in that work item's `spec.md`).
  - The mission tables are server-side objects, so the game names them in no file.

## From the right-click menu fix (2026-10-25, docs/work/2026-10-24-menu-unknown-achievement)

- **7295 (Listen to the Drunk Fish) is in the Shared Mists file but not in the Classic 5.5.4 build** (`DataAddons/Shared/05_MistsOfPandaria/AchievementData.lua:333`; build 5.5.4.70579, looked up 2026-10-25). Shared holds only achievements identical on both clients, so it is a placeholder on Mists and may belong in the Retail file. Check the Classic client's hotfix cache first (`H:\World of Warcraft\_classic_\Cache\ADB\`), then let the `data-verifier` confirm before moving the line.
- **`Verify-AchievementData.ps1` cannot tell which client lacks an id.** For an id the first build lacks it falls back to other builds and products (wowt, wowxptr, wow_beta, every wow_classic*), and `-Build` does not turn that off. It also never reports a missing `:FactionSplit` counterpart, and has no `-Client`. The sweep in that work item's spec went through `.claude/skills/add-zone-data/_lookup_ids.ps1` in 500-id batches instead. A `-Client` switch that checks one client's live build only would answer "is anything in the data missing from this client" directly.
- **`KrowiAF_SelectAchievement` errors for a registered achievement with no category** (`Api/API.lua:54`, `category:GetTree()` with no nil check). Clicking a "go to" entry for one gets there. No current data has a placeholder without a category, and in game every other achievement has one from Blizzard's tree.
- **A Shared category has no name on Mists.** `DataAddons/Shared/CategoryData.lua:118` names "Cross-Expansion > Zones > Exile's Reach" through `addon.GetAchievmentName(14222)`. That is nil on Mists, which neither knows nor registers 14222, and the Classic category snapshot holds the category. Check whether Mists draws it or skips it as empty, then decide whether it belongs in the Retail tree.

## From the upcoming reminder date fix (2026-10-25, docs/work/2026-10-25-upcoming-reminder-date)

- **The `%c` date format preset prints English day and month names on every client.** `%c` is the C library's own date, and `LocalizeDateFormat` (`Features/EventReminders/AlertSystem.lua`) only replaces `%a %A %b %B` with the addon's translated names.
- **The upcoming chat message says "(In " in English** (`Features/EventReminders/AlertSystem.lua`, `ShowUpcomingCalendarEventChatMessage`). The pop-up already uses `addon.L["In"]`.
- **The upcoming calendar list is built once per session while it is not empty** (`Features/EventReminders/Data/EventData.lua`, `GetUpcomingCalendarEvents`). After an event ends in a long session, its side button can fall back to the upcoming line and show a start in the past behind "In", with an empty countdown.
- **`KrowiAF_GetUtcOffsetSeconds` drops minutes and compares `yday` without the year wrap** (`Data/EventData.lua:11-25`). A player at UTC+5:30 sees calendar times 30 minutes off. A UK player on a CET realm who logs in between 23:00 and 00:00 UTC on 31 December caches an offset of about a year for the session.
- **An escaped `%%A` in a custom date format is replaced too** (`LocalizeDateFormat`): "%%A %d" becomes "%Samstag %d", which `date` reads as `%S`. An edge case.

## From the options window work (2026-10-25, docs/work/2026-10-25-options-revamp)

- **A profile switch leaves most layout settings unapplied until a reload** (found 2026-10-26 while fixing the profile switch error). `RefreshOptions` (`Options/Layout.lua`) calls each setter with the new profile's own value, and most setters return early when `profile.X == value`, which is then always true: the new profile's widths, height, indentation, mouse wheel speeds, calendar button offsets and merge threshold are not applied to the window's frames by the switch (a `/reload` applies them). Only the header, the tabs and the special categories follow. Not verified in game yet. The fix: let `RefreshOptions` apply the frames directly instead of through the setters' change checks.
- **The ElvUI plugin's "Skin Tutorials" row reports on a frame that no longer exists** (`Plugins/ElvUI.lua:754`, `doSkin.Tutorials`). The plan kept it as ElvUI's own setting; it only told whether KAF skinned its tutorial. Removing it also deletes its string from CurseForge's Plugins namespace. Krowi's call.
- **Explore: give the options window the look of Blizzard's own Settings window** (Krowi, 2026-10-30, "something to explore later"; screenshots of Blizzard's window on Retail and Mists).
  - Blizzard's Options window looks the same on Retail and Mists. It has a gold title strip, Game/AddOns tabs and a search box on top. On the left is a category list under dark header bars (Gameplay, Accessibility, System), with the selected entry underlined in gold. The right side shows a white page title with a red Defaults button and a rule under it. Each row has a gold label and its control in one column: gold checkmarks, an arrow stepper, binding buttons, sliders with arrows and the value. The page has white subsection headers, a thin scroll bar and a red Close button at the bottom.
  - Krowi_Options draws the same on every client from `ButtonFrameTemplate`, `WowScrollBoxList`/`WowTrimScrollBar`, `SearchBoxTemplate` and `UIPanelButtonNoTooltipTemplate` (`Krowi_Options/Window.xml`), with no client branch.
  - Both clients ship the same `Blizzard_Settings_Shared` (`SettingsCategoryListTemplate`, `SettingsListTemplate`). Only `SettingsFrameTemplate` comes from a per-client folder (`Mainline/` or `Classic/`), so a window built on it would match each client by itself.
  - Taint review (2026-10-30, design stage, Retail 12.1.5 and Mists 5.5.4.70631):
    - **Never inherit `SettingsCategoryListTemplate`.** Its `OnLoad` overwrites a file-level `g_selectionBehavior` (`Blizzard_Settings_Shared/Blizzard_CategoryList.lua:4`, set at :243, Mists :210) that Blizzard's own category buttons read on every click. After that, every category click in Esc > Options runs tainted. Blizzard's controls on that page then set CVars and call `SetBinding` tainted. Its list highlight stops following clicks.
    - **Also never inherit** `SettingsCategoryListButtonTemplate`, `SettingsListTemplate`, `SettingsListSearchCategoryTemplate`, any `Settings*ControlTemplate`, `SettingsCheckboxTemplate` or `SettingsListSectionHeaderTemplate`. They touch `SettingsTooltip`, `SettingsCallbackRegistry` and `SettingsPanel`, and need Blizzard `Setting` objects.
    - **Also avoid** the `KeyBindingFrameBinding*` templates (Blizzard's global `KeybindListener`) and `UIPanelButtonTemplate`. On Retail its `OnLeave` hides GameTooltip on every mouse-leave, the #300 path.
    - **Safe:**
      - `SettingsFrameTemplate`, with its `ClosePanelButton` set to a plain `Hide`;
      - `NineSlicePanelTemplate` with layout `ButtonFrameTemplateNoPortrait`;
      - `FlatPanelBackgroundTemplate`;
      - `MinimalTabTemplate`;
      - `UIPanelButtonNoTooltipTemplate`, which has the same red art;
      - the `Options_*` atlases (`Options_CategoryHeader_1..3`, `Options_List_Active`, `Options_List_Hover`, `Options_HorizontalDivider`, `Options_InnerFrame`) in Krowi_Options' own row templates, as `Rows.xml` already does for the checkbox.
    - **Keep our own code:** `RowMixins.lua`, the key capture, `Krowi_Tooltip` and our own scroll lists.
    - **When built:** a lint rule against `inherits="Settings…"` other than `SettingsFrameTemplate`. Check in game: open KAF's window, then click several categories in Esc > Options; the highlight must follow each click.

## From the help picture margins (2026-10-30, docs/work/2026-10-26-help-picture-margins, PR #376)

- **A margin's size in UI units grows as a picture is scaled down** (code review of PR #376). `Make-HelpPictures.ps1` takes a picture's natural size from its whole output, the 50 px margins included, divided by the scale. So Window, scaled to about 0.84, has a margin of about 50 units in the enlarged view, against 42 for a tooltip at full size. Not visible in the pane so far. The fix: add the margins in UI units after the frame part is converted.
- **Rounding can push a picture taken in parts past `-MaxSide`** (same review). Each part's draw height is rounded on its own, so a picture whose scale was fitted to exactly 1024 px can come out at 1025 and be padded to a 2048 texture. No picture is near it now (Colors is 362 px high). The fix: floor the parts' sizes, or fit the scale after rounding.

## From the Y binding fix (2026-10-26, issue #197, docs/work/197-reopen-where-left-off)

- **Blizzard's toggle always opens Blizzard's own Achievements tab** (spec option 4, left for later by Krowi, 2026-10-26).
  - The addon's replacement of `AchievementFrame_ToggleAchievementFrame` (`Gui/BlizzardOverrides.lua:33-49`) calls `AchievementFrameTab_OnClick(1)` on every open.
  - Toasts, chat links and a Y still on Blizzard's Toggle Achievements go through it, so they never reopen the addon's tab and the achievement the player left.
  - The fix: open the addon's last tab and view instead while Blizzard's tab is hidden. It changes a replaced Blizzard global for every way into the window, so it needs a taint review.
- **Existing accounts keep Blizzard's Y** (spec option 1, not taken, 2026-10-26).
  - The move of Y took on no account: since 11.2.7 and 5.5.1 its API is gone, and before that it ran before the key bindings were loaded.
  - So every current player whose Y is still Blizzard's keeps seeing #197 until they press Bind to Y.
  - If reports continue, a `DataIntegrityManager` step can set `FirstTimeSetUp.YBindingPending` once for accounts that already have `AchievementTabsSwitched`.

## From the Active events chat fix (2026-10-28, docs/work/2026-10-28-active-events-chat-repeat)

- **The "Upcoming Calendar Events:" chat header can print with no line under it** (`Features/EventReminders/AlertSystem.lua`, `ShowUpcomingCalendarEventChatMessage`). It prints before the occurrence check and before the window check, the shape the active events' header had. It does not repeat in practice, because the record is set whenever an occurrence exists; the fix is the same move: print it with the first line.
- **An active event's reminder record keeps the first end it saw** (code review, 2026-10-28). `ShowActiveEventChatMessage` and `ShowActiveEventPopUp` update a record only while it holds the placeholder, and `ForgetEndedReminders` drops it once that end passes. A widget-timed world event read as "5 min" while up to 59 s more are left, or a realm clock that steps back on zoning, gets a second reminder (header, line, pop-up) for the same occurrence. Following the end on every pass instead would swallow the next occurrence of an event whose windows touch, so the fix needs the occurrence's start, which not every source gives.
- **An event whose end is the current second prints "Name ()"** (code review, 2026-10-28): the check is `>=`, and `GetSecondsLeftFormattedText(0)` is empty. Only when the second ticks between the read of the events and the read of the clock in `Refresh`.

## From the options markers (2026-11-01, docs/work/2026-10-31-options-markers)

Code review findings, deferred because none is Important and a fix would need the in-game runs again.
- **The options suite's `toggle-reset` step keeps the row it found before `Change`** (`Tests/Options.lua`, `ResetStep`). If the option starts at its default and changing it shows or hides rows, the page is rebuilt and the step works on another option's row. Neither happens today. The fix: `RowOf(option)` again after `Change`.
- **The `toggle-reset` screenshot does not show the arrow**: the step clicks it and leaves the row inside `Run`, before the capture. The fix: a separate step that enters the row and is captured with the arrow shown.

## From the options widths (2026-11-02, docs/work/2026-11-02-options-widths)

- **A field on Blizzard's achievement frame** (taint review, older than this work): `Gui/Gui.lua:117` sets `AchievementFrame.ResetPosition`, which the window's Reset position button calls (`Options/Layout.lua:697`). That breaks the rule against fields on Blizzard's frames. The fix: put `ResetAchievementWindowPosition` on `addon.Gui` and call it from the option, as its own work item.
- **The saved window width is written and never read** (code review): `lib.SetShared("Size", ...)` still stores the width, which the window now takes from the game's. Harmless; drop it with the next change to the saved shape. The removed `HeadingLines` and `ControlsFromCentre` keys were never released, so only test installs hold them.

## From the side button anchor fix (2026-11-04, docs/work/2026-11-04-side-button-anchor)

Older than the fix, found by its taint review and code review.
- **With ElvUI or GW2_UI skins, the side buttons stay beside the achievement window when their anchor is the world map** (`Plugins/ElvUI/EventReminders.lua`, `Plugins/GW2_UI/EventReminders.lua`, `SkinSideButton`). Each plugin's `SkinSideButton` places the first button at `AchievementFrame`'s top right on every `Refresh`, whatever Side Button Anchor says; EllesmereUI reads `GetAnchor()` and places them right. The fix: anchor to `addon.Gui.EventReminderSideButtonSystem:GetAnchor()`, with offsets checked on the world map in game, since 5 and 6 (13 on Classic) were set for the achievement window.

## From the Event reminders move (2026-11-12, docs/work/2026-11-12-event-reminders)

Older than the move, which changed no behaviour; found by its taint review and code review.
- **The pop-ups' follow mode registers with Blizzard's `AlertFrame`** (`Features/EventReminders/AlertSystem.lua:224`, `AlertFrame:AddQueuedAlertFrameSubSystem`), which the workspace rules forbid since #188: closing the What's New splash then updates the objective tracker tainted. Rebuilding it changes how the pop-ups sit under ElvUI, GW2_UI, EllesmereUI and Dominos Roll, so it needs those addons in game (spec, option 5).
- **A feature switched on without a reload runs its setters' code that never started** (the independent evaluation, 2026-11-12; the same for all four features). The registry greys rows by the profile's switch (`Features.lua`), not by whether the feature started, so after ticking Enable the rows are live until the reload. For Event reminders: a per-event toggle, a time line or the date format redraws side buttons on an open window (`EventOptions.lua`, `Options.lua` setters), and Side Buttons Beside hooks the new window, whose next show starts the refresh without an alert container; with no `KrowiAF_SavedData.ActiveEventPopUpsShown` yet, each tick then errors in `ForgetEnded` (`AlertSystem.lua`). The fix: grey the rows by `IsStarted` as well until the reload, in the registry, for every feature.
- **A switched-off feature's All/None buttons and grid row labels stay bright** (look gate, 2026-11-12, review-options.md row 29). Krowi_Options greys an option row while its option is disabled, but not a family row (`Sub`, `RowMixins.lua` `SubRowMixin`) whose members are all disabled, nor a grid row's label. All/None skip disabled members, so they change nothing. The fix belongs in Krowi_Options: grey a `Sub` row whose members are all disabled, and a grid row's label with its boxes.
- **A per-event toggle redraws the side buttons from the events cached at the last refresh** (`Features/EventReminders/EventOptions.lua`). Turning an event on shows its button only after the next refresh, up to Refresh interval seconds later.

## From the Overview cards (2026-11-02, docs/work/2026-11-02-overview-cards)

Code review findings, deferred because Krowi found the cards right in game (2026-11-03) and no hitch showed.
- **Card thumbnails:** Overview loads the 15 sections' full help pictures (11.5 MB of TGA) for crops 200 x 86, and Reward preview's `CardPart` (Y = 0.74, `Options/Window/Map.lua`) fits only today's `RewardPreview.tga`: a remade picture can put the zoom buttons or the title on the card, and no check notices. Small copies made for the cards by `Make-HelpPictures.ps1` fix both, and the `CardPart` with them.
- **The card's sizes stand twice** (the Krowi_Options library, `RowFrames.lua` and `RowMixins.lua`, in `Krowi_Libraries`): the picture area's 86, the line's offset and the NEW label's offsets in the builder, `pictureHeight`, `lineGap`, `cardTextInset` and `nameTop` in the mixin. A change to one side stretches the pictures or moves NEW off the name line. The fix: `CardMixin:Init` sets those sizes and anchors from the mixin's values.