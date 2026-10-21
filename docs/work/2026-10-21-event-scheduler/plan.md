# Plan: Event reminders come from Blizzard's event scheduler and fixed schedules, not from POI checks
Spec: [spec.md](spec.md). Status: accepted

## Context
KAF's event reminders find world events by asking every refresh whether a POI is on its map, and the widget events by parsing a widget that only exists in its zone. So the soup (Community Feast) only shows in the Azure Span, and no Midnight world event is reminded of at all.

The `scheduler` probe (2026-10-21) showed what Blizzard's `C_EventScheduler` gives instead:
- **Coverage:** 288 occurrences about three days ahead, with exact starts and ends, area POI ids and event keys.
- **Curse Surges:** POIs 8936-8940, each every 9000 s and lasting 1800 s.
- **Safety:** reading it fired no synchronous `EVENT_SCHEDULER_UPDATE`, and Blizzard's reminder manager stayed secure.

Krowi chose the proof of concept as normal reminders: the Curse Surges from the scheduler, and the soup on a fixed schedule.

## Files that change
**Data and API:**
- `Api/EventDataApi.lua`:
  - `KrowiAF.Enum.EventSource = EnumUtil.MakeEnum("Scheduler")`.
  - `AddEventData` and `RegisterEventDataOptions` take an optional 11th field, `source`, after `mapId`. `AddEventData` passes it to `Event:New`.
  - For a Scheduler row, the toggle's `name` becomes a function returning the game's POI name, `C_AreaPoiInfo.GetAreaPOIInfo(nil, id).name`, falling back to the row's name. Everything else is unchanged, so older rows and plugins work as before.
- `Objects/Event.lua`: `New(..., mapId, source)` stores `Source`.
- `DataAddons/Retail/12_Midnight/EventData.lua`: five World rows, 8936-8940, one per Curse Surge variant.
  - Category 2571.
  - Icon: Turn the Surge's (63390), file id looked up with `.claude/skills/add-achievement-data/_lookup_ids.ps1`.
  - Name `{addon.L["Curse Surges"], addon.L["Curse Surges"]}`, so the fallback reads "Curse Surges: Curse Surges" only if the game has no name. The tidier form is decided in the build: name = `addon.L["Curse Surges"]`, group = `addon.L["Curse Surges"]`.
  - Group order 1, expansion 11 (Midnight), not hidden, no `mapId`, source `EventSource.Scheduler`.
- `DataAddons/Retail/12_Midnight/CategoryData.lua:893`: the Curse Surges category gets `:WithId(2571)`, the next free plugin-contract id; 2570 is the highest in use.
- `Data/EventScheduler.lua` (new, in `Data/Files.xml` before `EventData.lua`), `addon.Data.EventScheduler`:
  - **What it watches:** the area POIs of every World event whose `Source` is Scheduler, gathered once when first needed, after the data load.
  - **The cache:** `starts[poi]` and `ends[poi]`, plain number arrays it reuses, plus `names[poi]` read once from `GetAreaPOIInfo(nil, poi)`.
  - **Pure functions,** which the tests call with fixtures:
    - `Fill(cache, scheduledEvents)`: skips POIs it does not watch and a key already seen, and keeps occurrences sorted by start (an insertion sort, no allocation).
    - `Find(cache, poi, now)`: the occurrence going on at `now`, through a per-POI cursor that only moves forward.
  - **When it reads**, through `EnsureData()`:
    - at `PLAYER_ENTERING_WORLD` after the login delay;
    - on `EVENT_SCHEDULER_UPDATE`, only while a request of its own is pending; any other update returns at once;
    - when a watched POI has less than 6 hours of occurrences left, at most every 300 s.
    - It reads `GetScheduledEvents` when `HasData()`, otherwise calls `RequestEvents` and marks the request pending.
    - It does nothing in combat or with `WorldMapFrame` shown. A read that combat deferred waits for `PLAYER_REGEN_ENABLED`, registered only while one is waiting.
  - **On Classic** (no Scheduler rows) nothing is watched, and every entry point returns at once.
  - **Public:** `GetOccurrence(poi, now)`, `GetName(poi)`, `EnsureData()`, and for tests `Fill`, `Find` and `Reset`.
- `Data/EventData.lua`, `GetWorldEventDetails(event, now)` (`now` defaults to `GetServerTime()`): a Scheduler event takes start, end and name from `EventScheduler`, and makes no POI or widget call. Other events are unchanged.
- `Data/CustomWidgetEventTimers.lua`:
  - **The schedule:** Community Feast 4729 (Next) and 4731 (Active) replace their widget reads with a pure `FeastTimes(now, region)`: an interval of 5400 s, active for 900 s, starting at a UTC offset per `GetCurrentRegion()` (NA 0, EU 3600, KR/TW/CN 1800). This holds because 86400 is a multiple of 5400.
  - **What each reports:** "Next" gives the seconds to the next start; "Active" gives the seconds left inside the window, and nothing otherwise.
  - **Other regions:** an unknown region gives nothing, as today outside the zone.
  - **The clock:** `GetSecondsLeft(id, now)` passes `now` on.
- `Krowi_AchievementFilter.lua`: at `PLAYER_ENTERING_WORLD` (login or reload), call `EventScheduler.EnsureData()` with the existing delay, before the active-events reminder.

**Tests (written first):**
- `Tests/Events.lua` (new, in `Tests/Files.xml`, `events` in `run-tests.lua`):
  - **The scenarios**, on fixed times and a fixture of the probe's shape (five variants rotating every 1800 s, one duplicate key):
    - `curse-surge-active`: `GetWorldEventDetails` of 8938 at T0+100. Recorded "no event" (no row today); Target "8938 until T0+1800".
    - `curse-surge-rotation`: at T0+1805. Target "8936".
    - `curse-surge-duplicate-key`: occurrences kept for the duplicated key. Target "1".
    - `soup-next-eu` / `soup-active-eu` / `soup-next-na`: `GetWidgetEventDetails` of 4729/4731 at fixed UTC times with the widget absent. Recorded "not shown"; Targets the exact seconds.
  - **Headless** it runs on the real data load (`client-env.lua`, as `obtainable` does), with a `C_EventScheduler` model, a fixed `GetServerTime` and `GetCurrentRegion` = 3.
  - **In game** it fills the real cache with the same fixture through `Fill`, then `Reset` and `EnsureData` restore it.
  - **Live observations, game only, not scenarios:**
    - the Curse Surge going on now and its end;
    - the soup's next start;
    - when standing in the Azure Span, widget 4729's own reading next to the computed one, which is the check on the region offsets.
- `Tests/Memory.lua` and `run-tests.lua`:
  - `event-refresh` also has a Scheduler event going on (in the headless model a filled cache); Target and Recorded "none".
  - New `scheduler-update-ignored`: an `EVENT_SCHEDULER_UPDATE` KAF did not ask for allocates nothing. Its handler is exposed as `EventScheduler.OnSchedulerUpdate`.
  - Game observation: the bytes of one rebuild (`GetScheduledEvents` plus `Fill`).
  - `EVENT_SCHEDULER_UPDATE` is added to the idle minute's counted events.
- `.claude/tools/Check-Repo.jobs`:
  - `Data/EventScheduler.lua RegisterEvent:EVENT_SCHEDULER_UPDATE memory/scheduler-update-ignored`;
  - `RegisterEvent:PLAYER_ENTERING_WORLD - # loading screens`;
  - `RegisterEvent:PLAYER_REGEN_ENABLED - # only while a read waits for combat to end`.

**Docs:**
- `docs/how-to/add-event.md`: a scheduler-sourced world event row.
- `Api/ApiDocumentation.lua`: the `source` field.
- `Tests/README.md`: the `events` row.
- `.github/copilot-instructions.md`: the suite list.
- `_Packaging/Changelog.md` (104.0):
  - Added: "Curse Surge event reminders".
  - Fixed: "Community Feast reminders now show outside the Azure Span".
- `docs/backlog.md`: the next item, Aqir Invasion, Abundance, Void Assaults and the older widget events as data.
- **Snapshots:** `snapshot-categories.lua -write` and `snapshot-data.lua -write`, with the diff reviewed.

## Order of work
1. Copy this plan to `docs/work/2026-10-21-event-scheduler/plan.md`.
2. **Test first:**
   1. Add `Tests/Events.lua`, the headless suite and the memory additions, with Recorded set to today's behaviour.
   2. Headless: the scenarios PASS and are open.
   3. Deploy (Krowi's go), then Krowi runs `/kaftest events`, then `/reload`. `Read-GameTests.ps1` must match.
   4. Commit `test: reproduce 2026-10-21-event-scheduler in the events suite`.
3. **Build:** the enum and source field, the Event object, the category id, the rows, `EventScheduler.lua`, `GetWorldEventDetails`, the feast schedule, and the login call.
4. Set Recorded to Target and add the jobs lines. Regenerate the snapshots and review them. `Check-Repo.ps1` is clean and every suite passes.
5. **Feedback loop:**
   1. `krowi:taint-reviewer`, `/code-review`, `Find-DeprecatedApi.ps1`.
   2. In game on Retail: `/kaftest events`, `/kaftest memory`, `/kaftest scheduler`.
   3. Watch a Curse Surge start at the next half hour: the pop-up and side button show the game's name and the time left.
   4. The options show the five toggles with the game's names.
   5. The soup's side button counts down outside its zone, and its next start matches the Azure Span map timer.
   6. `Read-GameErrors.ps1` is clean.
   7. Classic: `/kaftest memory` and `/kaftest events` (the Curse Surge scenarios are Retail only) are green, and nothing new shows in the options.
6. **Docs, changelog, status done, PR.**

## Departures from the plan (build, reviews and in-game runs, 2026-10-21)
- **The cache is module state, not pure functions on a cache table:** `Fill(scheduledEvents)` and `GetOccurrence(poi, now)` replace `Fill(cache, ...)` and `Find(cache, ...)`. The tests reach it through `LoadForTest` (the fixture) and `UseSourceForTest`, which swaps the game for a model of it (C_EventScheduler, combat, the world map, the clock, POI names), so the scheduler stories run the same steps in game and headlessly.
- **Scenario values:** `curse-surge-duplicate-key` counts the occurrences kept for the POI whose key is listed twice: "2", its two occurrences, the duplicate dropped (the plan's "1" counted the key). `curse-surge-active` ends at T0+1828: the game's ends run 28 s past start plus 1800.
- **Not done, with the reason:** `Api/ApiDocumentation.lua` has no event-data section, so the `source` field is documented in `docs/how-to/add-event.md`. No `PLAYER_ENTERING_WORLD` jobs line: `Krowi_AchievementFilter.lua`'s existing one covers the new call.
- **After the taint review:** every call into the scheduler goes through `CallScheduler`, and an `EVENT_SCHEDULER_UPDATE` fired inside one stops the cache reading the scheduler for the session; a request's answer is waited for 300 s at most; the events suite's fixture blocks refills (`testing`).
- **After the first in-game memory run:** a data row's `false` map became `nil` in `Event:New` (the game rejects `false` as a map), and the headless `GetAreaPOIInfo` models check their arguments as the game does.
- **After the code review:**
  - the low-water refill runs before the cursor walk, so the lookup that refills finds the occurrence going on;
  - a POI the last read left short is not listed by the game, and asks for nothing more (was: every hour);
  - no scheduler call at login with event reminders off or every Curse Surge toggle off;
  - a POI name the game does not know yet is asked again next time, and the toggle's label comes from the same `GetName`;
  - the cache waits for `addon.Data.EventsLoaded` (set when every event object exists), not for the cache build;
  - the memory suite reads the scheduler through `ReadForTest`, under the cache's guards, and does not count the soup as a widget read (`IsComputed`);
  - the events suite turns on the toggles it reads and puts the player's own back, with the events' live details.
- **Krowi's decision after the code review:** the soup's Next shows only in the 15 minutes before each cooking (spec, Decision).
- **Declined:** a widget fallback for a region without an offset, since every live region is 1 to 5. The Korean, Taiwanese and Chinese offsets are not checked in game (`docs/backlog.md`).

## Risks
- **The soup's region offsets come from addons' data.** The in-zone observation and the map timer check them, and the offsets are constants in one place.
- **Which phase "Active" means** (cooking, 900 s) is from the same sources. The map check settles it; if it is wrong, only the constants change.
- **The scheduler's horizon or throttle may change.** The low-water refresh and the pending flag cope with a shorter horizon or a late answer.
- **The taint claim from Better Event Reminders.** Not reproduced; the reads stay guarded anyway (no combat, no open world map), and `/kaftest scheduler` is rerun at the end.
- **Plugins** skin the same frames. The pop-ups and side buttons are untouched, and only the content is new.
- **The category id 2571** is a new plugin contract: it is never changed afterwards.

## Proof
- **Headless:** `run-tests.lua` passes all suites; `events` has its targets met; `memory` has `event-refresh` and `scheduler-update-ignored` at "none".
- **Lint:** `Check-Repo.ps1` is clean, the snapshots are regenerated, and their diff shows only the five EVENT rows and category 2571.
- **In game, Retail:**
  - the events suite matches headless;
  - a live Curse Surge shows with its game name and an exact end;
  - the soup counts down anywhere, and matches the map in the Azure Span;
  - the memory and scheduler suites stay green and secure;
  - no errors.
- **Classic:** green, and no visible change.