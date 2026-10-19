# Spec: The addon's memory no longer climbs while the player does nothing with it
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. **Principle:** a background job, code that runs on its own with every addon window closed, allocates nothing on a run where nothing it reports has changed. It allocates only when something changed: a new insecure key, an event starting or ending.
2. **Taint probe:** a sweep that finds no new insecure key allocates nothing (`memory/taint-sweep` "none"). An error that is not about secrets or taint allocates nothing in its error handler. The probe records what it recorded before: same baseline, detections, errors, caps, 0.5 s interval and export, and it stays on by default while issue #300 is open. It still never hooks, scripts or writes a Blizzard frame.
3. **Event-reminder refresh:** a refresh in which no event starts or ends allocates nothing, at any interval the option allows (`memory/event-refresh` "none"). Reminders, pop-ups, chat messages, side buttons and time left show what they show today, except that a widget-timed event's countdown runs from its first reading (see Decision). The Refresh interval option keeps its meaning.
4. **Nothing kept:** neither job keeps memory beyond one entry per event or insecure key (the `-kept` scenarios "none").
5. **Prevention:** the `memory` suite holds a scenario for every background job. A new OnUpdate, ticker or load-time event registration in addon code fails the lint until it is listed with its memory scenario, or with the reason it is not a background job.
6. **Proof:** an idle minute measured in game shows what the addon allocates with all windows closed, before and after.

## Root cause
**No leak: garbage the game collects late.**
- The `memory` suite (Retail 12.1.5, 2026-10-19, two in-game runs, `Read-GameTests.ps1`, lines identical to headless) measured with `C_AddOnProfiler.MeasureCall`:
  - **taint probe sweep:** 3872 bytes and 0.09 ms a run, twice a second: 454 KB a minute;
  - **event-reminder refresh:** 9320 bytes and 0.11 ms a run, every 1 s on the maintainer's profile (the option's minimum; default 60 s): 546 KB a minute;
  - **nothing kept:** after 600 sweeps and a full collection, none of it remains.
- **What the broker counts:** `GetAddOnMemoryUsage`, which the System broker reads (`Krowi_Brokers_System/System.lua:111-127`), counts what the addon allocated that the collector has not freed yet. In game the collector freed nothing for about 55 minutes: the second run found 186894 KB held, of which 121745 KB was garbage, against 65149 KB live. So every byte a job allocates shows as a climb until a collection, which can be an hour away.
- **Where the rest of the 122 MB comes from:** the two jobs explain about 55 MB of it. The rest is most likely the login data load's one-off garbage, `BuildCacheAsync` building a few tables per id for about 70,000 ids (`Data/AchievementCache.lua:104-125`), plus whatever was done in game. The idle minute of requirement 6 settles the idle part.

**The sweep** (`TaintDiagnostics.lua`, 99.3, on by default at `Options/Defaults.lua:13`) runs from an OnUpdate twice a second (174-180, 193). On every run:
- `GetTableWatch` builds three tables and a closure (28-35);
- each watched table gets a closure and a new `list` of every string key, about 140 on GameTooltip (79-87);
- every key is checked again, also the ones it already reported.

Its error handler copies every Lua error message of every addon to lower case (105). On the maintainer's account it records CanIMogIt writing `CIMI_tooltipOnCleared` and `CIMI_tooltipWritten` into GameTooltip, so it works and must keep working; #300 is still collecting exports (2026-10-19).

**The refresh** (`Gui/EventReminder/AlertSystem.lua:313-369`) reads all 140 events again on every run (`Data/EventData.lua:248-265`), whether anything changed or not. The per-event breakdown from the second run:
- **Where the bytes go:** all 9320 bytes come from five Theater Troupe world events (7943, 8076-8079), 1864 bytes a read each.
  - They share one custom timer, which reads widget 6264 (`Data/CustomWorldEventTimers.lua:77-88`) before the POI is checked (`EventData.lua:217-226`).
  - The POI is not on its map, so all five are inactive and their reads are thrown away.
- **The other events:** the other 80 world events and the 9 widget events allocated nothing. `GetAreaPOISecondsLeft` returns a number, and an absent widget or POI returns nothing.
- **When an event is active:** `GetAreaPOIInfo` returns a new table on every refresh, only to confirm the POI is on its map (223-226). The same goes for a present widget, on every refresh for every event that reads it.

Neither API is flagged as returning secrets (`Blizzard_APIDocumentationGenerated/AreaPoiInfoDocumentation.lua`, `UIWidgetManagerDocumentation.lua`: `SecretArguments = "AllowedWhenUntainted"` only). Blizzard's own POI map providers refresh on `AREA_POIS_UPDATED`, a payload-free event (`Blizzard_SharedMapDataProviders/AreaPOIDataProvider.lua:36-44`).

The two read-only sweeps of the code and libraries (2026-10-18) found no other code that runs on its own with the windows closed. The frames' 1 s OnUpdate for time left runs only while an alert or side button shows (`Gui/EventReminder/AlertFrame/AlertFrameMixin.lua:5-11`).

## Design
**Taint probe, `TaintDiagnostics.lua`:**
- **The sweep:** each watched table is walked in place: `for key in next, t`, then `pcall(issecurevariable, t, key)`.
  - The walk runs as `pcall(SweepTable, label, t)`, a file-level function with arguments, so an error in one table still lets the other be swept, without a closure.
  - The watched tables are `GameTooltip` and `rawget(GameTooltip, "widgetContainer")`; `GetTableWatch` goes.
  - `knownInsecure` becomes one table per label: a key already reported is skipped before `issecurevariable`, which also saves the CPU of checking it again.
- **The error handler:** it tests the message with `strfind` patterns that ignore case, `[Ss]ecret` and `[Tt]ainted`, instead of `lower()`.
- **Unchanged:** `Report`, the snapshot, the caps, the session data and the export.

**Event-reminder refresh, `Data/EventData.lua`, `Data/CustomWorldEventTimers.lua`, `Data/CustomWidgetEventTimers.lua`:**
- **The POI before the widget:** for a world event with a custom (widget) timer, the POI is checked first. A POI that is not on its map returns nothing, so an inactive event allocates nothing; the widget is read only for an event whose POI is there.
- **An occurrence is read once:**
  - When an event is found active, the details it reports are kept with the event (`event._EventDetails` already exists for this): its end time and that its POI was there.
  - A later refresh reuses them without reading the widget or the POI info again. `GetAreaPOISecondsLeft` is still asked every refresh: it returns a number, allocates nothing and ends a normal POI the moment it goes.
  - A kept occurrence is dropped when its end time passes, or when the client says something changed: `AREA_POIS_UPDATED` for world events; `UPDATE_ALL_UI_WIDGETS` and zone changes for widget events, whose widgets belong to zones. A dropped occurrence is read again at the next refresh.
  - An occurrence without an end time (a timer that reports 0) is kept until such a change event.
- **Unchanged:** the refresh still runs at the option's interval (detection latency stays what the player chose), and the alert system, side buttons and their texts.

**Prevention:**
- **`memory` suite:** an `event-refresh` scenario (PerMinute at the option's minimum interval, 1 s, the worst case) and `event-refresh-kept`.
  - Headlessly they run against a model of the POI and widget APIs that reproduces what the game run found: five events sharing a present widget with an absent POI, one active POI with an end time, the rest absent.
  - In game they run on the real events, and SKIP when no event read allocates in that session.
- **The idle minute:** the suite's game run ends with a minute of nothing. It collects first, then reads the addon's memory again after 60 s, and asks the player not to touch anything. The runner (`Tests/Tests.lua`) gets asynchronous suites for this.
- **A `background-jobs` lint rule** in `Check-Repo.ps1`, with an allowlist `.claude/tools/Check-Repo.jobs`, in the shape of `globals` and `Check-Repo.globals`.
  - **What it finds:** every `SetScript("OnUpdate"`, XML `<OnUpdate`, `C_Timer.NewTicker`, and every `RegisterEvent` outside a mixin's OnLoad/OnShow, in addon code outside `Libs/` and `Tests/`.
  - **What clears a finding:** a line naming the job's memory scenario, or why it is not a background job ("only while shown", "once at login", "one-off").

## Options considered
- **A. Allocation-free steady state for both jobs, polling kept (recommended).** Everything above.
  - Both jobs drop to 0 bytes a run when nothing changes, in every zone and at every interval.
  - The probe keeps all its data; the event reminders keep their behaviour and their option.
  - The occurrence cache adds a little state and two event registrations. It is guarded by the suite's scenarios on both clients.
- **B. Event-driven refresh, no polling.**
  - **How:** a refresh only on `AREA_POIS_UPDATED`, on a timer set to the next known calendar start or end, and on zone and widget changes. The Refresh interval option goes, with a migration.
  - **For:** no work at all between changes.
  - **Against:** it depends on the client firing `AREA_POIS_UPDATED` for every POI change, including on maps the player is not on. That is unverified and would need a logging session in game first. It also removes a visible option.
- **C. The narrow fixes.** The probe walks in place; each widget is read once per refresh instead of up to eight times.
  - Most of today's garbage goes: the refresh drops to 1864 bytes a run here.
  - An active event still allocates on every refresh, so the number keeps climbing slowly at short intervals. Without the lint rule, the next background job can bring it back.

## Areas of concern
- **Taint and secret values:**
  - **The probe** still only reads (`next`, `issecurevariable`, `rawget`, which cannot invoke a metamethod).
  - **The refresh** registers `AREA_POIS_UPDATED`, `UPDATE_ALL_UI_WIDGETS`, `ZONE_CHANGED_NEW_AREA` and `PLAYER_ENTERING_WORLD` on the addon's own frame, and only to drop its cache.
  - **The values it compares** are numbers and nil from APIs not flagged secret. `GetDayEvent` keeps its existing `canaccessvalue` guard.
- **Clients:**
  - **The probe** runs on every client.
  - **Event reminders:** Retail uses world and widget events; Classic has calendar events, so its world and widget lists are checked to be empty or guarded.
  - **The suite** runs on both, headlessly and in game.
- **Blizzard API changes:** none; `C_AddOnProfiler.MeasureCall` is on Retail and Classic, with a garbage-counter fallback.
- **Other addons, plugins and skins:**
  - The ElvUI, GW2_UI and EllesmereUI plugins hook the event-reminder systems' `Load`/`Refresh`/`setUpFunction`, not `EventData`, so they are not affected.
  - Memory a shared library charges to this addon is unchanged.
- **Saved variables:** no shape change; the cache and `knownInsecure` live only for the session.
- **Localization:** the time patterns stay as they are; no new strings.
- **Embedded libraries, data snapshots:** none.
- **Player-facing text:** a changelog line under 104.0's Fixed.

## Verification
- **Before the fix, the scenarios record the cost:** `taint-sweep` "large" and `event-refresh` "large", both with Target "none". The idle minute is observed in game, with an expected rate of about 1 MB a minute on the maintainer's profile.
- **After the fix:** both are "none" and met, headlessly (the `unit-tests` lint rule, every turn) and in game on Retail and Classic. The idle minute shows about 0 KB a minute, and `Read-GameErrors.ps1` is clean.
- **Event reminders in game:**
  - an active world event shows its pop-up and side button with its time left, as before;
  - a Theater Troupe group stays absent while its POI is not on the map;
  - the event's end still removes it.
- **Lint:** `Check-Repo.ps1` is clean with the `background-jobs` rule, and an unlisted OnUpdate added to a scratch file fails it. `krowi:taint-reviewer` runs on both changed areas.

## Deferred
Found during the search; none runs on its own or keeps much:
- **During play, outside this item:**
  - The world map button recounts the achievements of the shown map on every map change: about 100 KB for a zone, 1-3 MB for a continent, all garbage (`Gui/WorldMapButton/WorldMapButtonMixin.lua:95-119`, `Globals.lua:33-83`).
  - Every open popout redraws all its criteria on every `CRITERIA_UPDATE` (`Gui/WindowFrames/AchievementsObjectives/AchievementsObjectivesMixin.lua:48-64`); the suite measures it when a popout is open.
  - The login data load's garbage.
  These are the next candidates for the same principle, measured the same way.
- **Growth on player actions:**
  - `ACHIEVEMENT_EARNED` appends the meta criteria of the earned achievement to `criteriaCache` again (`Data/AchievementCache.lua:53, 188`).
  - `newAchievementsEarned` never shrinks (`Data/SavedData/AchievementData.lua:197-199`).
  - `SideButtonSystem:Load` adds two more Show/Hide hooks each time it runs again (`Gui/EventReminder/SideButtonSystem.lua:92-98`).
  - `KrowiAF_SavedData.PopoutHideDebug` stores a stack per achievement ever popped out (`Gui/AchievementPopout/AchievementPopout.lua:213-214`).
- **Saved data nothing reads any more:** `CalendarEventsCacheTest`, `VerifyHash`, `DFHashVerify` (about 1 MB on the maintainer's account).

## Decision
Krowi, 2026-10-19:
- **Option A:** an allocation-free steady state for both jobs, polling kept, with the `event-refresh` scenarios, the idle minute and the `background-jobs` lint rule.
- **Widget-timed events:** Community Feast, Time Rift, Superbloom, Azerothian Archives, Researchers Under Fire, Fyrakk Assaults and Theater Troupe, plus the widget events.
  - They are read once per occurrence, with no extra correction of their countdown.
  - They are broken anyway: they only appear while the player is in their zone. They need a rework with fixed timers, which goes to `docs/backlog.md`.
- **Answered at the gate:** what the player sees changes only for these events. The countdown is each frame's own once-a-second text, computed from the event's end time.