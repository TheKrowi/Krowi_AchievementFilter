# Plan: The addon's memory no longer climbs while the player does nothing with it
Spec: [spec.md](spec.md). Status: done

## Context
Krowi's System broker shows KAF's memory climbing during play. The in-game `memory` suite showed it is not a leak but garbage the game collects late. In the second run, 122 MB of 187 MB was garbage after about 55 minutes. Two background jobs make it:
- **The taint probe's sweep:** 3.9 KB a run, 454 KB a minute.
- **The event-reminder refresh:** 9.3 KB a run, 546 KB a minute at Krowi's 1 s interval. All of it comes from five inactive Theater Troupe events that read widget 6264 before checking their POI.

Decisions (Krowi, 2026-10-19):
- **Option A:** both jobs allocation-free when nothing changed, with polling kept.
- **No change a player can see, on any client.** Widget-timed events keep being re-read on every refresh, but only once their POI is confirmed. What that still allocates while one is active in its zone stays an open target until the widget rework with fixed timers (backlog).
- **Prevention:** the memory suite, an idle minute, and a `background-jobs` lint rule.

## Files that change
**Test first (reproduction and prevention):**
- `Tests/Tests.lua`:
  - `addon.Tests.Async[name] = true` marks a suite that takes `done(results, observations)`.
  - The reporting half of `tests.Run` becomes a local `Report(name, results, observations)`, used by both paths.
  - Synchronous suites are unchanged.
- `Tests/Memory.lua`:
  - **New scenarios:**
    - `event-refresh`: PerMinute, Job `EventRefresh`, Recorded "large", Target "none".
    - `event-refresh-kept`: Kept, Recorded "none", Target "none".
    - `event-refresh-widget-active`: Job `ActiveWidgetTimers`, Recorded "large", Target "none". It stays open after this item, the remainder for the widget rework.
  - **`EventRefresh` in game:** `GetActiveEvents(true)` plus `GetUpcomingCalendarEvents()`, the ticker's reads (`AlertSystem.lua:334-350`). Counted at 60 runs a minute, the option's minimum interval and so the worst case; the note records the player's interval.
  - **`ActiveWidgetTimers` in game:** the reads of the world events with a widget timer whose POI is there, plus the widget events whose widget is there. It SKIPs when none is active: the player is not in such a zone.
  - **The suite becomes async:**
    1. It ends with an idle minute: a full collection, then the addon's memory read again after 60 s, and the total heap checked for a collection in between, which makes the number a lower bound.
    2. During the minute, a test-only frame counts `AREA_POIS_UPDATED`, `PLAYER_ENTERING_WORLD`, `UPDATE_ALL_UI_WIDGETS`, `ZONE_CHANGED_NEW_AREA` and `CRITERIA_UPDATE`.
    3. The minute is compared with the jobs' measured rate at the player's settings.
    4. Chat asks the player to leave every window closed until the result prints.
- `.claude/tools/headless/run-tests.lua`, in `suites.memory`:
  - **What it loads:** also `Data/CustomWidgetEventTimers.lua`, `Data/CustomWorldEventTimers.lua` and `Data/EventData.lua`.
  - **The model:** `C_AreaPoiInfo` and `C_UIWidgetManager` readers return a fresh table of the real structure's size (20-odd fields) for anything present. `MINUTES_ABBR`/`SECONDS_ABBR`/`D_MINUTES`/`D_SECONDS`, `GetServerTime`, `KrowiAF.Enum.EventType` and the EventReminders option tables are set.
  - **The state for `event-refresh`**, what the game run found: five world events share a present widget with their POI absent, one normal world event has seconds left and its POI present, there are no calendar events, and the widget events' widgets are absent.
  - **The state for `event-refresh-widget-active`:** one widget-timed world event with its POI and widget present.
- `.claude/tools/Check-Repo.ps1`, a new `background-jobs` rule [Error], text-based like `settings-close`, added to `$alwaysOn`:
  - **What it finds** in `$ownLuaFiles` outside `Tests/`: `SetScript("OnUpdate", <not nil>)`, `HookScript("OnUpdate"`, `C_Timer.NewTicker(`, `RegisterEvent("X"` and `RegisterUnitEvent("X"`, after stripping block and line comments. In own XML files it finds `<OnUpdate`, with XML comments stripped as files-xml does, so the commented-out Collections frames do not count.
  - **Each finding** must match a line of `.claude/tools/Check-Repo.jobs`: `<path glob> <kind> <memory/scenario | ->  # reason`, where the kind is `OnUpdate`, `NewTicker` or `RegisterEvent:<EVENT>`.
  - **The rule also reports:** a scenario `Tests/Memory.lua` does not name, a `-` without a reason, and stale entries that match nothing.
  - **Docs:** the rule goes in the header's rule list, in `.claude/tools/README.md`'s rule table, and `Check-Repo.jobs` is named among its data files.
- `.claude/tools/Check-Repo.jobs` (new): the current inventory, about 30 lines. Representative entries:
  - `TaintDiagnostics.lua OnUpdate memory/taint-sweep`;
  - `Gui/EventReminder/AlertSystem.lua NewTicker memory/event-refresh`;
  - `Gui/Guide/Panel.lua OnUpdate - # only while the guide panel is shown`;
  - `Gui/WindowFrames/AchievementsObjectives/AchievementsObjectivesMixin.lua RegisterEvent:CRITERIA_UPDATE - # a shown objectives frame redraws; popouts deferred (docs/work/2026-10-18-memory-growth)`;
  - `Benchmark.lua OnUpdate - # not loaded`;
  - the ADDON_LOADED/PLAYER_LOGIN/ACHIEVEMENT_EARNED registrations, as "once" or "rare".

**Fix:**
- `TaintDiagnostics.lua`:
  - **Removed:** `GetTableWatch`.
  - **New:** a file-level `SweepTable(label, t)` runs `for key in next, t`, skips a string key already in `knownInsecure[label]`, then `pcall(issecurevariable, t, key)` and `Report`.
  - **`Sweep`:** keeps the globals loop, then `pcall(SweepTable, "GameTooltip", GameTooltip)` and the same for `rawget(GameTooltip, "widgetContainer")` when it is a table.
  - **`Report`:** keyed by `knownInsecure[label][key]` instead of building `label .. "||" .. key`.
  - **`RecordError`:** `strfind(msg, "[Ss]ecret")` / `"[Tt]ainted"` instead of `msg:lower()`.
  - **Unchanged:** the baseline/detections/errors shape, caps, export, `SweepOnce` and `SweepsPerMinute`.
- `Data/CustomWorldEventTimers.lua`: a new `HasCustomTimer(id)` (`timers[id] ~= nil`).
- `Data/EventData.lua`, `GetWorldEventDetails` only; widget events and calendar events stay as they are:
  - **Confirming a POI once:** a file-level `poiGeneration`, bumped by one file-level frame on `AREA_POIS_UPDATED` (what Blizzard's own POI map pins refresh on, `AreaPOIDataProvider.lua:36-44`) and `PLAYER_ENTERING_WORLD`. Both exist on Retail, Mists and Era. The handler is created once and allocates nothing.
    - A POI found on its map by `GetAreaPOIInfo` stamps `event._PoiGeneration`.
    - While the stamp matches, `GetAreaPOIInfo` is not asked again.
    - The confirmation is dropped when the generation moves on or the event stops reporting time.
  - **A normal event (seconds left from `GetAreaPOISecondsLeft`):** as today, it asks for seconds left every refresh (a number, no allocation) and sets `EndTime`. It asks `GetAreaPOIInfo` only when the POI is not confirmed. An event without seconds left drops its confirmation.
  - **A widget-timed event:** the POI is checked first, through the confirmation or `GetAreaPOIInfo`, which allocates nothing when the POI is absent. Only then is the widget read, every refresh, as today, so its countdown is unchanged.
  - **Unchanged:** the return values and the `event.EventDetails` assignments callers see (`AlertSystem.lua:84`, `GetActiveWorldEvents`).
- `Tests/Memory.lua`: `taint-sweep` and `event-refresh` Recorded "large" become "none". `event-refresh-widget-active` stays "large", open. `Check-Repo.jobs` gets `Data/EventData.lua RegisterEvent:AREA_POIS_UPDATED - # drops POI confirmations; the handler allocates nothing` and the same for `PLAYER_ENTERING_WORLD`.
- `docs/work/2026-10-18-memory-growth/spec.md`: Requirement 3, the refresh Design and the Decision are set to the no-visible-change variant, and the remainder is named as the open target.
- **Docs:**
  - `_Packaging/Changelog.md`, a line under 104.0 Fixed (player words, no dev note): addon memory displays no longer show the addon's memory climbing for as long as the game runs; its taint diagnostics and event reminders no longer keep creating garbage in the background.
  - `docs/backlog.md`: the widget-timed events rework with fixed timers, which also closes `event-refresh-widget-active`, and the spec's during-play deferred items.
  - `.github/copilot-instructions.md`, a background-jobs principle line under Architecture: allocation-free when nothing changed, a memory scenario each, listed in `Check-Repo.jobs`.
  - `Tests/README.md`: the memory row gains the refresh, the open widget scenario and the idle minute.

## Order of work
1. Copy this plan to `docs/work/2026-10-18-memory-growth/plan.md` and update the spec as above.
2. **Test first:**
   1. Write the `Tests.lua` async support, the `Memory.lua` scenarios and idle minute, and the headless model.
   2. Headless: `run-tests.lua memory` shows `event-refresh` and `event-refresh-widget-active` "large" (open) and `-kept` "none"; every other suite is unchanged.
   3. Add the `background-jobs` rule and `Check-Repo.jobs`; `Check-Repo.ps1` (full) is clean.
   4. Run a scratch check: an unlisted OnUpdate in a temp copy fails the rule, and is removed again.
3. **In-game before-run (Retail):**
   1. `Deploy.ps1 -WhatIf`, then Krowi's go.
   2. Krowi: `/reload`, `/kaftest memory`, an idle minute, `/reload`.
   3. `Read-GameTests.ps1`: no FAIL; lines equal to headless, except `event-refresh-widget-active` SKIP outside such a zone; idle minute about 1 MB/min; event counts noted.
   4. Commit `test: reproduce 2026-10-18-memory-growth in the memory suite`, then `chore(lint): background-jobs rule`, then the plan and spec update.
4. **Fix:**
   1. Change `TaintDiagnostics.lua`, `CustomWorldEventTimers.lua` and `EventData.lua`.
   2. Set Recorded to "none" and add the jobs lines.
   3. Headless: all suites pass, `taint-sweep` and `event-refresh` met, `event-refresh-widget-active` still open; `Check-Repo.ps1` clean.
5. **Docs:** changelog, backlog, instruction-file principle, README.
6. **Feedback loop:**
   1. `krowi:taint-reviewer` on the diff.
   2. `/code-review`.
   3. `Find-DeprecatedApi.ps1`.
   4. In-game after-run on Retail and Classic (Mists): `/kaftest memory` with the idle minute, `Read-GameTests.ps1`, `Read-GameErrors.ps1`.
   5. Retail event-reminder check: the side buttons on the world map or achievement window list the same active events with the same countdowns as before.
7. **Commits:** `fix: background jobs no longer create garbage while nothing changes`, then the docs commit. Set the work files to `Status: done`, push, open the PR against `main` (no issue), and wait for Krowi's merge.

## Risks
- **`AREA_POIS_UPDATED` firing often** would drop confirmations often and bring `GetAreaPOIInfo` tables back for active POIs. The idle minute counts it first; if it fires more than a few times a minute, the confirmation is kept until the event stops reporting time, plus `PLAYER_ENTERING_WORLD`.
- **A sweep error:** without the old per-table closure, an error could stop a sweep. Each table is swept under `pcall(SweepTable, ...)`, so the other one is still checked, as now.
- **The async runner change** touches every in-game suite. Only suites marked Async take the new path, `escape` gets one in-game run to confirm, and the headless runner does not use `tests.Run`.
- **Lint false positives** from strings or comments: comments are stripped, the rule is tuned until the full tree is clean, and a scratch positive proves it fires.
- **The idle minute needs Krowi to stay idle.** It is an observation, never a pass/fail line.
- **Classic:** both events exist there. The world and widget event lists are Retail-only data, so the confirmations never fill on Classic.

## Where the build departed from the plan
- **PerMinute warm-up:** PerMinute scenarios now skip their first run, as Kept ones do, so what a job fills once (a POI it confirms, a key it reports) does not count as a cost of every run. Without it, the fixed jobs showed 9 and 32 bytes a run headlessly.
- **POI confirmation dropped (2026-10-21):**
  - The taint review of 2026-10-19 had a widget-timed event keep its confirmation while its widget was absent.
  - The code review of 2026-10-21 then showed that keeping a confirmed POI until `AREA_POIS_UPDATED` can show a moved Dreamsurge or Theater Troupe show as still active. Krowi chose today's per-refresh POI check.
  - So `EventData.lua` registers no events and keeps no generation. Only the POI-before-widget order for widget-timed world events stays.
  - The suite splits the refresh into `event-refresh` ("none", nothing on the map) and the open target `event-refresh-poi-on-map`. In game, each SKIPs outside its state.
- **Code review of 2026-10-21, the other findings:**
  - The probe reports after its walk, from pending buffers it reuses, and its known-key tables exist from load.
  - The memory suite gets a Ready gate (`addon.Data.IsLoaded`, and no idle minute already running).
  - The event-refresh scenarios run on Classic too, and the headless model covers the calendar (a holiday going on, one in three days).
  - The `background-jobs` rule also finds `AddTooltipPostCall`, `OnTooltipSet*` hooks and `RegisterEvent:*`, and documents its blind spots.
  - The `Tests/README.md` table row is fixed, and the model's event names corrected (7553 is Dreamsurges: Thaldraszus).
- **Collector restart:** the garbage-counter fallback runs the measured calls under `pcall`, so an error cannot leave the collector stopped.
- **The idle minute's comparison** ("the jobs above account for") warms each job up first. Without the warm-up it showed 1866 KB a minute against a measured 990.

## Proof
- **Headless:**
  - `lua.exe .claude\tools\headless\run-tests.lua "$PWD"`: every suite PASS. Before the fix: `memory/taint-sweep` and `memory/event-refresh` "got=large target=none open". After: "got=none target=none met"; `event-refresh-widget-active` "got=large target=none open".
  - `.claude\tools\Check-Repo.ps1`: 0 errors.
- **In game, Retail:**
  - `Read-GameTests.ps1`: the same lines as headless.
  - Idle minute: before about 1 MB/min; after about 0 outside widget-event zones.
  - `Read-GameErrors.ps1`: 0 errors.
  - The broker's KAF number stays flat while idle; reminders and side buttons are unchanged.
- **In game, Classic:** the memory suite is green and `Read-GameErrors.ps1` is clean.