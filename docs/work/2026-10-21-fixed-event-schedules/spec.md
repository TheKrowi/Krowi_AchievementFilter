# Spec: The older expansions' event reminders run on fixed schedules
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. **Fixed now** (Krowi's decision below): BfA Faction Assaults, the Maw covenant assaults, Siege on Dragonbane Keep, Time Rift, Superbloom, Azerothian Archives (the Big Dig) and the soup.
   - **How:** each family runs on a schedule KAF carries, with no POI or widget read for its reminders.
   - **The schedule:** a cycle; a start per region, or the weekly reset for the reset-tied ones; for each event, the window it is shown in, relative to the cycle's start; and for a rotating family, the order of its zones.
2. **Their reminders show wherever the player is,** with exact times. An Active phase that ends on a boss kill or the event's progress (Time Rift, Superbloom, the Big Dig) shows until an upper bound.
3. **Legion Assaults** become one "Legion Assaults" reminder without the zone, on a 52200 s cycle, if the in-game check of 2026-10-21 confirms that cycle; otherwise they stay as today.
4. **The families whose order is not known stay as today** until their rotation is confirmed in game: Theater Troupe, Grand Hunts, Researchers Under Fire, Dreamsurges, the N'Zoth assaults, Fyrakk Assaults and the Primal Storms. The Dreamsurges show nowhere today because their rows name the Dragon Isles' map, which their POIs are not on; the rows get their zones' maps (2022 to 2025), found by `/kaftest sources`. Researchers Under Fire works in its zone: its POI is on Zaralek Cavern's map while the player is there (checked in game, 2026-10-22).
9. **The Maw's covenant assaults** show only for characters who finished Chains of Domination chapter 2 (quest 64556), as their POIs do (Krowi, 2026-10-22).
10. **The watcher's log in game:** a second tab in the Data Manager lists, per family and region, what the watcher saw and learned (Krowi, 2026-10-22).
5. **The addon learns from what it sees, for every Retail player:**
   - **The watcher:** every 5 minutes it reads the time left of the POIs of the families above: a number, no table.
   - **What it records:** when each zone, show or storm started, per region, saved per account.
   - **What it learns:** a family's start for the player's region and its rotation, once seen twice the same way.
   - **What it does with that:** a fixed family uses the learned start where the addon ships none for the region (Korea, Taiwan), and the learned one where it disagrees with the shipped one (a schedule Blizzard moved).
   - **Debug mode:** each new finding and each disagreement prints in chat, and `/kaftest sources` lists what was learned.
6. **A refresh allocates nothing** on a run where nothing changed, with the fixed families going on, and **the watcher allocates nothing** on a run where nothing changed (`memory` suite, `background-jobs` lint rule).
7. **Covered by scenarios,** headlessly and in game:
   - each fixed family's windows at fixed times and per region;
   - the rotation;
   - the weekly anchor;
   - the watcher's learning through a model of the POI API: a start seen once, then twice; a disagreement; a late POI.
8. **Classic:** no change.

## Root cause
- **One path for every world event** (`Data/EventData.lua:236-281`): the POI's seconds left, then whether the POI is on the event's map (`IsPoiOnMap`, a new table on every refresh while it is up), or a widget's text for the widget-timed ones (`Data/CustomWorldEventTimers.lua`), and the widget events' widgets (`Data/CustomWidgetEventTimers.lua`).
- **The widgets exist only in their zone,** so Time Rift, Superbloom, Azerothian Archives, Researchers Under Fire, Dreamsurges and Theater Troupe show only there.
- **Two families never show:**
  - **The Dreamsurges:** `IsPoiOnMap` asks the POI on the event's `MapId`, the Dragon Isles' 1978, and the POI is on its zone's map (7602 on 2025, Thaldraszus; `/kaftest sources`, 2026-10-22). Researchers Under Fire's POI looked the same from Silvermoon (7461 not on 2133), but is on 2133 inside Zaralek Cavern, so it was never broken there.
  - **Primal Storms:** a storm's POI reports no seconds left (`EventData.lua:262-266` returns before anything else).
- **Superbloom: Active** returns 0 seconds, which reads as "No time data available" all the time (`CustomWidgetEventTimers.lua`, `timers[5323]`).
- **The POI-timed families** are read from anywhere today (the POI API answered in Silvermoon); only the map check's table costs anything.

## Design
**The schedules,** `DataAddons/Retail/<expansion>/EventSchedules.lua` (new data, read by a loader like the other data), one table per family:
- **`Interval`:** the cycle, in seconds.
- **`Anchors`:** a start per `GetCurrentRegion()`, as an epoch, or `Reset = "Weekly"` / `"HalfWeekly"` for the reset-tied families (anchored on `C_DateAndTime.GetSecondsUntilWeeklyReset()`).
- **`Windows`:** per event id, its `From` and `To` relative to the cycle's start. Siege: Gathering 7267 `{-3600, 0}`, Active 7104 `{0, 3600}`. The soup: Next `{-900, 0}`, Active `{0, 900}`. Time Rift: Next `{-300, 0}`, Active `{0, 900}`.
- **`Rotation`:** for a family whose zone moves one step per cycle, the ids in order, with the occurrence the anchor names.
  - **BfA:** Drustvar, Zuldazar, Tiragarde Sound, Nazmir, Stormsong Valley, Vol'dun; the anchors are Drustvar starts.
  - **The Maw:** Kyrian, Venthyr, Night Fae, Necrolord, Kyrian from EU's reset of 2026-10-21 by the probe; other regions learned.

The soup's `FeastTimes` moves into this form.

**The engine,** `Data/EventSchedules.lua` (new): arithmetic, no allocation, no POI read.
- `GetWindow(eventId, now)` gives the start and end of the window going on; for a rotating family, only for the event whose turn it is.
- `GetNextStart(eventId, now)` gives the next start, for upcoming reminders later.
- **Anchors:** the region's shipped one, or the learned one (requirement 5); without either, the family shows nothing in that region.

**`GetWorldEventDetails` and `GetWidgetEventDetails`:** an event whose row says `KrowiAF.Enum.EventSource.Schedule` takes its start and end from the engine and makes no other read. Rows keep their ids and toggles.
- **Legion:** if fixed, Legion's four rows become one, keeping 5175's id; its toggle is on if any of the four was. That is the one saved-data change, a `DataIntegrityManager` solution.

**The watcher,** `Data/EventObserver.lua` (new):
- **When it runs:** a `C_Timer.NewTicker` of 300 s, Retail only, while event reminders are on.
- **What it reads:** each watched POI's `GetAreaPOISecondsLeft`. The storms report no time, so they are watched in debug mode only, through `GetAreaPOIInfo`, a table each time.
- **When something changes:** a POI that was absent and now reports a time is a start: the start is now plus its seconds left, minus the family's duration, or now to within 300 s for a POI without a duration.
- **Saving:** it appends that start to `KrowiAF_SavedData.EventObservations[region][family]` (the last 64 per family).
- **Learning:** it derives:
  - the start modulo the interval, kept once two observations agree to within 120 s;
  - the order of the zones from consecutive occurrences.
- **Debug mode:** a chat line for each finding that is new or disagrees with the shipped schedule.
- **No change, no garbage:** a run where nothing appeared or disappeared allocates nothing.

**Unchanged:** the refresh ticker and its interval; the pop-up, chat and side-button code; calendar events; Midnight's scheduler events; the not-yet-fixed families' reads (apart from the map check fix).

## Options considered
- **A. Schedules say when, the POI confirms which, once per occurrence.** Every older event anywhere; a moved schedule shows nothing rather than the wrong zone.
- **B. The smallest change: keep the POI's own time where it reports one, and use schedules elsewhere.** It follows Blizzard's changes, but gives no next starts for the POI-timed families.
- **C. Fully fixed, no POI read for the reminders.** Chosen. Families with an unknown order cannot be named until their rotation is known, and a moved schedule shows the wrong zone, which the learning (requirement 5) corrects per player.

## Areas of concern
- **Taint and secret values:** only read-only `C_AreaPoiInfo` reads, from a ticker outside any Blizzard frame. Neither is flagged secret.
- **Clients:** Retail only. Classic has no world or widget events, and its options have no such toggles.
- **Blizzard API changes:** `GetSecondsUntilWeeklyReset` and `GetCurrentRegion` are long-standing. `GetCurrentRegion` returns 2 for both Korea and Taiwan (WindTools' note), so the two share their anchors, learned or shipped. Old content's clocks can still change: Legion Remix moved Legion's cycle in November 2025.
- **Other addons, plugins and skins:** the same frames; only the content changes.
- **Saved variables and migrations:**
  - `KrowiAF_SavedData.EventObservations` (new, inside an existing saved variable, capped);
  - Legion's toggles merged by a `DataIntegrityManager` solution, if Legion goes fixed.
- **Localization:** no new strings. "Legion Assaults" exists.
- **Embedded libraries:** none.
- **Data snapshots:** the Registries snapshot shows the rows' new source and the schedules; regenerated and reviewed.
- **Memory:** the watcher is a new background job, so it gets a `memory` scenario ("none") and a `Check-Repo.jobs` line. A refresh with the fixed families going on stays at "none", and `event-refresh-widget-active` moves to "none" for the widget events made fixed.
- **Player-facing text:** changelog lines for the events that now show anywhere, Superbloom's time, Legion's single reminder and the Maw's unlock.

## Verification
- **Before the change, as `Recorded` with `Target` set** (`events` suite, headless and in game):
  - each fixed family's windows at fixed times, with POIs and widgets absent as outside their zones, where today's answer is "not shown";
  - the rotation, the weekly anchor and a region without an anchor;
  - the watcher's learning stories through a model of the POI API.
- **Memory:** a refresh and the watcher at "none"; `event-refresh-widget-active` at "none".
- **In game, Retail (EU):**
  - `/kaftest sources` after 18:00 your time (BfA's Drustvar from 16:00 UTC) and after about 20:00 (Legion on the 52200 s cycle from about 18:00 UTC), which decides requirement 3;
  - the reminders outside their zones for a Faction Assault, the Siege, a Time Rift and the soup;
  - the watcher's first findings in chat in debug mode;
  - BugGrabber clean.
- **Classic:** suites green.
- **Reviews:** `krowi:taint-reviewer` and `/code-review`.

## Decision
Krowi, 2026-10-21:
- **Option C:** fully fixed, no POI read for the reminders. Chosen over A (the schedule says when, the POI confirms which) and B (the POI's own time where it reports one).
- **Families whose zone, show or storm order is not known** stay as today until a few days of logging in game confirm their rotation; then they go fixed with zone names, and the storms, if confirmed random, become one "Primal Storms" reminder: Theater Troupe, Grand Hunts, Researchers Under Fire, Dreamsurges, the N'Zoth assaults, Fyrakk Assaults, the Primal Storms.
- **Fixed now:** BfA Faction Assaults, the Maw covenant assaults, Siege on Dragonbane Keep, Time Rift, Superbloom, the Big Dig, the soup.
- **Legion Assaults:** one reminder without the zone on the 52200 s cycle if the in-game check confirms it, otherwise as today.
- **Learning for everyone** (Krowi asked whether the addon can learn from what it sees, with new findings reported in debug mode): every Retail player's addon learns its region's starts and rotations from the POIs, saved per account, and uses them once seen twice. Debug mode prints every finding.
- **Added by Claude, for Krowi to object to:** the not-yet-fixed families' map check is fixed in the meantime, so Researchers Under Fire and the Dreamsurges show in their zones again. **Withdrawn after the code review of 2026-10-22:** counting a POI that reports time without its map shows siblings that share a widget twice (the two Dreamsurge ids of a zone, the Theater Troupe shows). The map check stays; the rows get the maps their POIs are on, which `/kaftest sources` finds.

Krowi, 2026-10-22, after the code review:
- **The Maw's covenant assaults only for characters who unlocked them** (Chains of Domination chapter 2, quest 64556), as today; one quest check, no map read. Chosen over showing them to every character.
- **The watcher's log on a second tab of the Data Manager.** Chosen over a chat command, the `/kaftest sources` output, or a window of its own.