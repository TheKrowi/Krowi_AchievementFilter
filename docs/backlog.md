# Backlog

Follow-ups that are not a work item yet. When one is taken up, it gets its own work folder under `docs/work/` (`docs/sdlc-playbook.md`) and leaves this list.

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
- **The eleven sibling Legendary Research guides.** 60963 to 60973, one per class, as data only in `DataAddons/Retail/07_Legion/GuideData.lua`. Step 0 of `docs/work/2026-10-11-achievement-guides/plan.md` holds everything they need:
  - every class hall's research NPC with its id, map and spot;
  - the travel spell or entrance;
  - both factions' Dalaran portals as area POIs.

  The Paladin and Priest portals differ per faction, so their guides take one `:Poi(...):Faction(...)` step per faction. Each NPC is named in English only; the guide shows the player's client's own name (`docs/work/2026-10-14-guide-npc-names`).

## From the latent-bugs review (2026-10-13, PR #339)

- **A "go to" entry for an id the game does not know breaks the whole right-click menu.** `AchievementMenu:AddGoToAchievementLine` concatenates the name `addon.GetAchievmentName(id)` returns. That is nil when `GetAchievementInfo` does not know the id, so both `name .. " (Missing)"` and `name .. nameSuffix` raise "attempt to concatenate a nil value".
  - The callers pass ids from the data: `OtherFaction.lua`, `RequiredFor.lua`, `PartOfAChain.lua` and `FirstCategory.lua`. An id one client lacks, or a removed achievement still in the data, is enough.
  - The menu suite (`Tests/Menu.lua`) takes a third scenario for an id the game does not know, recorded "error". Its in-game before-run comes before the fix.