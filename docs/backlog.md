# Backlog

Follow-ups that are not a work item yet. When one is taken up, it gets its own work folder under `docs/work/` (`docs/sdlc-playbook.md`) and leaves this list.

## From the event scheduler work (2026-10-21, docs/work/2026-10-21-event-scheduler)

- **The rest of Midnight from Blizzard's event scheduler, as data.** With `KrowiAF.Enum.EventSource.Scheduler` a scheduled world event is one row (`docs/how-to/add-event.md`).
  - **Next:** Aqir Invasion (POI 9045, listed twice per occurrence under one key, which the cache drops), the three Abundance sites (8525, 8527, 8528) and Void Assaults (8698). Their achievement categories exist and need `:WithId` like Curse Surges' 2571.
  - **Ongoing events:** Saltheril's Soiree, Stormarion Assault, Legends of the Haranir and Vaults of Atal'Utek have no times; the scheduler lists them under `GetOngoingEvents`.
- **Upcoming reminders for scheduled events.** The upcoming path is calendar-only (`Data/EventData.lua` `GetUpcomingCalendarEvents`, `GetNextEventOccurance`), while the scheduler knows every next start.
- **The older widget events on fixed schedules,** as the soup now is (`Data/CustomWidgetEventTimers.lua` `FeastTimes`): Time Rift, Superbloom, Azerothian Archives, Researchers Under Fire, Dreamsurges, Theater Troupe.
- **Superbloom: Active (5323) shows all the time while its toggle is on.** Its timer returns 0, which counts as going on with no time data (`Data/CustomWidgetEventTimers.lua`).
- **Upcoming reminders error on a non-English client whose date format names the day or month** (`%a`, `%A`, `%b`, `%B`). `LocalizeDateFormat` reads the end time an upcoming event does not have (`Gui/EventReminder/AlertSystem.lua:49`, from `:129`). The default format is not affected.

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
  - `SideButtonSystem:Load` adds two more Show/Hide hooks each time it runs again (`Gui/EventReminder/SideButtonSystem.lua:92-98`).
  - `KrowiAF_SavedData.PopoutHideDebug` keeps a stack per achievement ever popped out (`Gui/AchievementPopout/AchievementPopout.lua:213-214`).
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

## From the latent-bugs review (2026-10-13, PR #339)

- **A "go to" entry for an id the game does not know breaks the whole right-click menu.** `AchievementMenu:AddGoToAchievementLine` concatenates the name `addon.GetAchievmentName(id)` returns. That is nil when `GetAchievementInfo` does not know the id, so both `name .. " (Missing)"` and `name .. nameSuffix` raise "attempt to concatenate a nil value".
  - The callers pass ids from the data: `OtherFaction.lua`, `RequiredFor.lua`, `PartOfAChain.lua` and `FirstCategory.lua`. An id one client lacks, or a removed achievement still in the data, is enough.
  - The menu suite (`Tests/Menu.lua`) takes a third scenario for an id the game does not know, recorded "error". Its in-game before-run comes before the fix.