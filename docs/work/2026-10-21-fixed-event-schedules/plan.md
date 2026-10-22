# Plan: The older expansions' event reminders run on fixed schedules
Spec: [spec.md](spec.md). Approved by Krowi on 2026-10-21. Status: accepted

Worktree `.claude/worktrees/feature-2026-10-21-fixed-event-schedules`, branch `feature/2026-10-21-fixed-event-schedules`. Copied to `docs/work/2026-10-21-fixed-event-schedules/plan.md` once approved. **Non-routine** (new saved data `KrowiAF_SavedData.EventObservations`, a new background job): waits for Krowi.

## Context
KAF finds the older expansions' world events by reading their POI (and the POI's map, a table on every refresh), and widget events by parsing a widget that only exists in its zone. Researchers Under Fire, the Dreamsurges and the Primal Storms never show, and Superbloom's Active has no time (spec, Root cause). Krowi's policy: older expansions run on schedules KAF carries, the current expansion on Blizzard's event scheduler. The research (intent) and `/kaftest sources` (14:53 UTC, EU) give the schedules; for regions and rotations nobody has confirmed, every player's addon learns them from what it sees.

## Files that change
**Schedules (data), `DataAddons/Retail/<expansion>/EventSchedules.lua` (new, in each expansion's `Files.xml`):** `KrowiAF.EventSchedules.<Key> = {...}`, bare tables (`Api/EventDataApi.lua` creates `KrowiAF.EventSchedules = {}`).
- **Fields:**
  - `Interval`;
  - `Anchors = {[region] = epoch}` (`GetCurrentRegion()`: 1 US, 2 KR and TW, 3 EU, 5 CN) or `Reset = "Weekly" | "HalfWeekly"`;
  - `Windows = {[eventId] = {From, To}}` relative to a cycle's start, or `Window` with `Rotation = {ids}` and `RotationAnchors = {[region] = epoch}` for the occurrence of `Rotation[1]`;
  - `Fixed = true` for families whose reminders run on it;
  - `Observe = true` for those the watcher learns.
- **08 BfA:** `FactionAssaults`: 68400 s, `Window {0, 25200}`, Rotation 5964 Drustvar, 5973 Zuldazar, 5896 Tiragarde, 5969 Nazmir, 5966 Stormsong, 5970 Vol'dun; Drustvar starts US 1548032400, EU 1548000000, CN 1546743600. Fixed, Observe. Also `NzothAssaults` (Observe only).
- **09 SL:** `CovenantAssaults`: HalfWeekly, Rotation 6991 Kyrian, 6990 Venthyr, 6992 Night Fae, 6989 Necrolord; EU 1792555200 (Kyrian, the probe). Fixed, Observe.
- **10 DF, fixed with no POI:**
  - `CommunityFeast`, moved from `Data/CustomWidgetEventTimers.lua`: 5400 s; Next `{-900, 0}`, Active `{0, 900}`; US 0, EU 3600, KR/TW/CN 1800.
  - `TimeRift`: 3600 s at :00; Next `{-300, 0}`, Active `{0, 900}`.
  - `Superbloom`: :00; Next `{-900, 0}`, Active `{0, 1200}`.
  - `BigDig` (Azerothian Archives): :30; Next `{-900, -300}`, Soon `{-300, 0}`, Active `{0, 900}`.
  - The Next windows follow Krowi's soup choice: only shortly before a start. Time Rift's 5 minutes is the game's own map countdown. The Active ends are upper bounds.
- **10 DF, `SiegeOnDragonbaneKeep`:** 7200 s; Gathering 7267 `{-3600, 0}`, Active 7104 `{0, 3600}`; EU even hours (anchor 0), US/KR/TW/CN odd hours (3600). Fixed, Observe.
- **10 DF, Observe only:** `GrandHunts`, `ResearchersUnderFire`, `Dreamsurges`, `FyrakkAssaults`, `PrimalStorms` (debug mode only; see the watcher).
- **11 TWW:** `TheaterTroupe` (Observe only).
- **07 Legion:** `LegionAssaults`: 52200 s, `{0, 21600}`, US 1762421400, EU 1762434000, CN 1762450200. Observe; Fixed only if tonight's probe confirms (then the four rows become one, see below).

**Engine, `Data/EventSchedules.lua` (new, `Data/Files.xml` before `EventData.lua`):** arithmetic, no allocation, no POI read.
- **Lookups:**
  - `GetWindow(eventId, now)`: the window going on, or nothing; for a rotation, only the id whose turn it is.
  - `GetNextStart(eventId, now)`, for later.
- **Anchors:** shipped for the region, else learned (confirmed); a learned one that disagrees with the shipped one wins and is reported.
- **Reset:** `C_DateAndTime.GetSecondsUntilWeeklyReset()`, as `Data/TemporaryObtainable.lua:45` uses it.
- **A swappable source** (`Region`, `Now`, `SecondsUntilWeeklyReset`), as `Data/EventScheduler.lua`'s `UseSourceForTest`, so the suites' fixed times and regions reach it in game.

**The watcher, `Data/EventObserver.lua` (new):**
- **When it runs:** a `C_Timer.NewTicker(300)` started with the event reminders (`Gui/EventReminder/AlertSystem.lua` `Load`), Retail only, while they are on.
- **What it reads:** for each `Observe` family's POIs, `GetAreaPOISecondsLeft`, against a reused `present[id]` state table.
- **When a POI appears:** start = now + seconds left - window length; it appends `{start, id}` to `KrowiAF_SavedData.EventObservations[region][key]`, a ring of 64.
- **Learning:**
  - a start whose phase (start mod Interval) matches an earlier one to within 120 s confirms the region's anchor;
  - for a rotation, the id with it confirms the phase;
  - for an Observe-only family, consecutive ids give the order, reported only.
- **Debug mode:**
  - a chat line for each new or disagreeing finding (`addon.Diagnostics.Debug(..., true)`);
  - the storms' POIs, which report no time, are read through `GetAreaPOIInfo` in debug mode only.
- **Allocation:** nothing on a run where no POI appeared or went.
- **A swappable source,** for the stories.

**Readers:**
- `Data/EventData.lua`: `GetWorldEventDetails` and `GetWidgetEventDetails` branch on `KrowiAF.Enum.EventSource.FixedSchedule` (appended to `EventSource` in `Api/EventDataApi.lua`) to `EventSchedules.GetWindow`, with no POI, map or widget read.
- **`IsPoiOnMap` becomes `IsPoiPresent`:** seconds left ~= nil, or the POI on its map. Researchers Under Fire and the Dreamsurges show in their zones again.
- **Rows:** the fixed families' rows in `DataAddons/Retail/07..10/EventData.lua` get `source.FixedSchedule` as their 11th field, with `false` for skipped fields. Their ids, names and toggles stay the same.
- **Superbloom Active** gets the window instead of `return 0`.
- `Data/CustomWidgetEventTimers.lua`: the soup's code goes; `FeastTimes` becomes a thin wrapper over the engine for the existing feast-times scenarios, or those scenarios move to the engine.

**Legion, only if confirmed tonight:**
- 5175 becomes "Legion Assaults", and the other three rows go.
- The first `DataIntegrityManager` solution sets 5175's toggle on in every profile where any of the four was on.

**Tests (written first):**
- **`Tests/Events.lua`, scenarios at fixed times and regions through the engine's source:**
  - faction-assault active, next in rotation, between windows, US, KR (no anchor);
  - covenant-assault EU, and the next half-week;
  - siege gathering and active;
  - time-rift next and active; superbloom next and active; big-dig next, soon and active;
  - legion, conditional.
  - **Recorded:** today's answer with POIs and widgets absent, "not shown" (Superbloom Active "no time"). Researchers Under Fire with its POI reporting time but not on its map: Recorded "not shown", Target "shown" in its zone.
  - **In game:** a scenario SKIPs while its family's real POI is up, since today's code reads it live.
- **Learning stories, through the watcher's source:**
  - a start seen once (not used);
  - seen twice (used);
  - a disagreement with the shipped anchor (reported, learned wins);
  - a late POI (the start comes from its seconds left);
  - a KR player learning the Faction Assaults;
  - a rotation's phase learned for the US Maw.
- **`Tests/Memory.lua`, `run-tests.lua`:**
  - `event-refresh` with fixed families going on: "none";
  - a new `observer-run` (nothing appeared): "none";
  - `event-refresh-widget-active` moves to "none" for the widget events made fixed;
  - the headless models get `GetSecondsUntilWeeklyReset`.
- **`Tests/EventSources.lua`:** per family, the schedule's answer next to the POI's, and the learned anchors and orders.
- `.claude/tools/Check-Repo.jobs`: `Data/EventObserver.lua NewTicker memory/observer-run`.
- **Snapshots:** the Registries snapshot shows the rows' source and a SCHEDULE line per family (`.claude/tools/headless/snapshot-data.lua`).

**Docs:**
- `.github/copilot-instructions.md`: the policy, under Architecture. The current expansion comes from `C_EventScheduler`; older expansions run on `EventSchedules`; at an expansion's end its events move over, from the times recorded while the scheduler still lists them.
- `docs/how-to/add-event.md`: a fixed-schedule family.
- `Tests/README.md`; `docs/backlog.md` (the Observe-only families, upcoming reminders).
- `_Packaging/Changelog.md`.

## Order of work
1. Copy this plan to the work folder.
2. **Tonight:** `/kaftest sources` after 18:05 (Drustvar) and after 20:05 (Legion) decides the Legion step.
3. **Test first:** the scenarios and stories, with `Recorded` = today; headless; deploy; `/kaftest events`, `/kaftest memory`, `/reload`; `Read-GameTests.ps1` matches; commit `test: ...`.
4. **Build:**
   1. the enum, the schedules data, the engine, and the readers' branch;
   2. `IsPoiPresent` and Superbloom;
   3. the watcher and its start;
   4. the soup's move;
   5. Legion, if confirmed.
5. `Recorded` = `Target`; the jobs line; the snapshots, reviewed; `Check-Repo.ps1` clean; every suite passes.
6. **Feedback loop:**
   1. `krowi:taint-reviewer` and `/code-review`.
   2. **In game, Retail:**
      - `/kaftest events`, `/kaftest memory`, `/kaftest sources`;
      - a Faction Assault, the Siege and a Time Rift reminder in Silvermoon;
      - the watcher's first findings in chat;
      - BugGrabber clean.
   3. **Classic:** `/kaftest events`, `/kaftest memory`.
7. Docs, changelog, status done, PR.

## Departures from the plan (build and reviews, 2026-10-21 and 22)
- **The soup stays in `Data/CustomWidgetEventTimers.lua`** for now: moving it would churn the events suite PR #352 had just merged. It is a backlog item.
- **`memory/event-refresh-widget-active` stays open:** the watched families (Researchers Under Fire, the Dreamsurges, Theater Troupe) still read their widgets in their zones. It closes when they go fixed.
- **`IsPoiPresent` side effect:** a POI that reports its time no longer needs the map read, so `event-refresh-poi-on-map` dropped from 2978 to 1500 bytes a refresh in the headless model. Still "large", still open.
- **A separate `schedules` suite,** not more scenarios in `events`, which is about Blizzard's scheduler.
- **The run before the change, in game (2026-10-21, 23:38):**
  - the POI families SKIPped as designed, their POIs being up;
  - `superbloom-next` FAILed because Superbloom's Next widget can be read from anywhere, not only in the Emerald Dream (21:39 to 22:00 UTC, the schedule's start). A before-run only; the built code reads no widget.
- **Legion:** the 52200 s cycle was confirmed in game (the Stormheim assault ended at 00:00:33 UTC, the schedule's 00:00:00), so Legion became one reminder on 5175, keeping Azsuna's icon (1408998), with a `DataIntegrityManager` solution merging the four toggles.
- **The taint review** found no taint or secret-value problem, and three bugs, each reproduced by a scenario first:
  - the toggle merge ran on every update and on a first install, and wrote nil where AceDB's copied defaults made nil read as off; it now runs once (`KrowiAF_SavedData.Fixes`) and writes true;
  - the watcher's findings printed for every player; now in debug mode only;
  - a saved id no longer in a rotation made the watcher error; such observations are now skipped, and the watcher starts after the login reminders.

## Risks
- **Wrong anchors** show an event at the wrong time. For the families with POIs, the watcher reports a disagreement and corrects it per player once it has seen two. The widget families have no POI to learn from: their times rest on the research, and Krowi's in-game check covers EU.
- **`GetCurrentRegion` returns 2 for both Korea and Taiwan,** so they share learned anchors. If their clocks differ, the learning keeps disagreeing; that is reported in debug mode.
- **The watcher's 5-minute step** limits a learned start from a POI without seconds left to ±300 s. Only the debug-only storms are affected.
- **Account-wide saved data:** characters that cannot see a POI (the Maw before Chains chapter 2) just observe nothing.
- **Legion:** the Remix change may revert, which the watcher reports.

## Proof
- **Headless:** all suites pass; `events` targets met; `memory`: `event-refresh`, `observer-run` and `event-refresh-widget-active` at "none".
- **Lint:** `Check-Repo.ps1` clean; the snapshot diff shows only the sources, the schedules and, if fixed, Legion's single row.
- **In game, Retail EU:**
  - the events suite matches headless;
  - a Faction Assault and the Siege show in Silvermoon with times matching their POIs;
  - Time Rift's Next 5 minutes before :00;
  - the watcher reports its first findings;
  - no errors.
- **Classic:** green, no change.