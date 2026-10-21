# Spec: Event reminders come from Blizzard's event scheduler and fixed schedules, not from POI checks
Intent: [intent.md](intent.md). Status: done

## Requirements
1. **Curse Surges (Retail):** when a Curse Surge starts, wherever the player is and with the world map closed, the reminders treat it like any other world event:
   - a pop-up on start, following the Pop-ups options;
   - a chat line, when chat messages are on;
   - a side button with its time left.
   - **Names:** each variant shows its name from the game ("Curse Surge: The Broodmother's Nest").
   - **Click:** a click opens the Curse Surges achievement category (Turn the Surge, Cursebreaker).
2. **Options:** Options > Event Reminders > World Events > Midnight gets a Curse Surges group with one toggle per variant, on by default, with Select All and Deselect All. The labels are the game's names; no new CurseForge strings.
3. **The soup (Retail):** Community Feast: Next and Community Feast: Active show on the soup's fixed schedule wherever the player is, not only in the Azure Span, with exact countdowns.
4. **No POI or widget reads** for these events:
   - The scheduler is read once after login, and again only when the times KAF keeps for them run low. It is never read on a refresh.
   - The soup reads nothing; it is arithmetic.
   - A refresh with these events going on allocates nothing (`memory` suite).
5. **No taint:**
   - KAF reads the scheduler and asks it for fresh data only out of combat and with the world map closed.
   - It touches no Blizzard frame and never Blizzard's Events tab.
   - Blizzard's reminder manager stays secure (`scheduler` probe).
6. **Prevention:** the new event registration is listed in `Check-Repo.jobs` with its memory scenario. The occurrence logic, the soup schedule and the scheduler cache are covered by scenarios headlessly and in game.
7. **Classic:** no change.

## Root cause
Why the reminders miss these events today:
- **World events** are found by asking every refresh whether the POI is on its map and how long it has left (`Data/EventData.lua:211-258`).
- **Widget-timed events** parse a widget's text (`Data/CustomWorldEventTimers.lua`, `Data/CustomWidgetEventTimers.lua`), and the widget only exists in its zone.
- **Midnight's world events** are not in the data at all: `DataAddons/Retail/12_Midnight/EventData.lua` holds only the Winds of Mysterious Fortune holiday.

**What Blizzard offers instead.** `C_EventScheduler` (12.x, `Blizzard_APIDocumentationGenerated/EventSchedulerUIDocumentation.lua`) is what the world map's Events tab is built on. The `scheduler` probe (`Tests/Scheduler.lua`, Retail 12.1.5, 2026-10-21 14:24) found:
- **Scheduled events:** `GetScheduledEvents` returns 288 occurrences, about three days ahead. Each has `areaPoiID`, `eventID`, `eventKey`, `startTime`, `endTime` and `duration`.
  - The Curse Surges are area POIs 8936-8940 (event ids 42-46). Each variant comes every 9000 s and lasts 1800 s, so a new surge starts every 30 minutes, rotating through the five.
  - Others: Aqir Invasion (POI 9045, every hour, 900 s, each occurrence listed twice under one key), three Abundance sites (8 h windows) and Void Assaults (weekly).
- **Ongoing events:** `GetOngoingEvents` lists four with no time left: Saltheril's Soiree, Stormarion Assault, Legends of the Haranir, Vaults of Atal'Utek.
- **Names and zones** come from `C_AreaPoiInfo.GetAreaPOIInfo(nil, areaPoiID)` and `C_EventScheduler.GetEventZoneName`, also for occurrences still to come.
- **Taint:**
  - Neither read, nor `RequestEvents`, fired `EVENT_SCHEDULER_UPDATE` inside KAF's call (0 times each). The answer came once, a few seconds later, outside it.
  - Blizzard's `EventSchedulerReminderManager`, which handles that event at all times (`Blizzard_UIPanels_Game/Mainline/EventScheduler.lua:849`), stayed secure. No Blizzard reminder was set at the time, so its handler returned early; the reads themselves never ran it.
- **Cost:** each `GetScheduledEvents` call returns a new array of 288 tables. Reading it on every refresh would bring back the garbage the memory work removed.

**The soup** has run every 90 minutes since 2023-02-06 (blue post).
- Its clock times come from maintained addons' data (WindTools, GW2_UI, Events Tracker), not from Blizzard: on the UTC clock, EU starts at 01:00, 02:30, 04:00 and so on, NA on the hour, 00:00, 01:30, KR/TW/CN at 00:30, 02:00.
- The cooking phase lasts 15 minutes, and the cycle does not move with daylight saving. To check in game.

## Design
**Scheduled world events.** The Curse Surges come in as ordinary World event rows in `DataAddons/Retail/12_Midnight/EventData.lua`, keyed by their area POI. So the per-event toggles, their defaults, Stop Tracking and the category all work as they do for every other world event: the rows exist at load, and only the times come from the scheduler.
- **The category:** the Curse Surges category gets a fixed id, `:WithId(2571)` (`DataAddons/Retail/12_Midnight/CategoryData.lua:893`), for the rows' category. It is a new plugin-contract id and shows in the category snapshot.
- **Names:**
  - The option labels and the reminders' names are read from the game (`GetAreaPOIInfo(nil, id).name`), falling back to "Curse Surges".
  - The rows carry the existing `addon.L["Curse Surges"]` as group and fallback.
- **The scheduler cache, `Data/EventScheduler.lua` (new):**
  - **What it keeps:** for each area POI the data marks as scheduled, the starts and ends of its occurrences, as plain numbers in tables it reuses.
  - **How it fills:** from one `GetScheduledEvents` read, dropping a key it has already seen (Aqir Invasion's double entries).
  - **When it reads:**
    - after login, once the scheduler has data;
    - on `EVENT_SCHEDULER_UPDATE` after KAF asked for data;
    - with `RequestEvents` when a watched POI has less than six hours of occurrences left.
    - Never in combat, never with the world map shown, and at most once per throttle window.
  - **The lookup:** gives the occurrence going on now from a cursor per POI that moves forward with time, so it allocates nothing.
- **`GetWorldEventDetails`:** an event the data marks as scheduled takes its details from the cache: start time, end time, the game's name. It makes no POI or widget read.
- **Fixed schedules, `Data/CustomWidgetEventTimers.lua`:** Community Feast: Next (4729) and Active (4731) get a schedule instead of a widget read:
  - every 5400 s;
  - active for 900 s;
  - an anchor per region from `GetCurrentRegion()`, on the server clock (`GetServerTime`).
  - "Next" reports the seconds until the next start; "Active" reports the seconds left while one is going on, and nothing otherwise.
- **Unchanged:** the refresh ticker and its interval, the pop-up, chat and side-button code, the calendar holidays, and every other world and widget event.

## Options considered
- **A. The Curse Surges from the scheduler and the soup on a fixed schedule, shipped as normal reminders (recommended).**
  - **What players get:** Midnight's Curse Surges anywhere, and a soup reminder that finally works outside its zone.
  - **The cost:** small data and code (one new file, rows, a category id, two timer bodies).
  - **What it proves:** both kinds of source, before the rest of Midnight and the older events move over as data.
- **B. The same, behind debug mode** until all of Midnight is in. Nothing changes for players yet; the proof stays out of their hands.
- **C. List every scheduler event at runtime, with no data rows.** Toggles and categories would have to be built after login from what Blizzard sends. That means option-table injection after AceDB, a rule for unknown ids, and a POI-to-category map anyway. More code for the same reminders.

## Areas of concern
- **Taint and secret values:**
  - The probe measured reads and `RequestEvents` as safe with the map closed. The extra guards (no combat, no open world map) cost nothing.
  - No Blizzard frame or table is written. The scheduler's and POI API's values are not flagged secret.
- **Clients:** Retail only. The rows are `DataAddons/Retail` data, and the scheduler code returns at once when no scheduled event is registered, so Classic never calls it.
- **Blizzard API changes:** `C_EventScheduler` is new in 12.x and Retail-only in practice; `GetCurrentRegion` is long-standing. The scheduler's 3-day horizon and throttle are undocumented, so the code expects either to change.
- **Other addons, plugins and skins:** the pop-ups and side buttons are the same frames. Blizzard's Events tab and its reminders are not touched.
- **Saved variables and migrations:** five new `WorldEvents` ids, default on through the existing default injection. No shape change.
- **Localization:** no new strings: "Curse Surges" exists in every locale, and the names come from the game.
- **Embedded libraries:** none.
- **Data snapshots:** the Registries snapshot gains five EVENT rows, and the category snapshot shows the new id. Both regenerated and reviewed.
- **Memory:** the refresh stays allocation-free. A cache rebuild allocates what `GetScheduledEvents` returns, a few times a session, which is measured.
- **Player-facing text:** changelog lines, "Curse Surge event reminders" under Added and the soup under Fixed.

## Verification
- **Before the change, as `Recorded` with `Target` set:** a new `events` suite (headless and in game), run on a model of the scheduler and on fixed times, so both runs give the same lines. It records:
  - the occurrence going on at a given time;
  - the Curse Surge variant active and its end;
  - the soup's next start and whether it is going on, per region;
  - the dropped duplicate key.
- **Memory:** `event-refresh` with a scheduled event going on is "none". The cache rebuild's bytes are observed, and `EVENT_SCHEDULER_UPDATE` is counted in the idle minute.
- **In game, Retail:**
  - at the next half hour, a Curse Surge pop-up and side button with its game name and time left;
  - the options show the five toggles with game names;
  - the soup's side button counts down anywhere, and its next start matches the feast timer on the Azure Span map;
  - `/kaftest scheduler` still shows the reminder manager secure;
  - `Read-GameErrors.ps1` is clean.
- **Classic:** suites green, nothing new in the options.
- **Reviews:** `krowi:taint-reviewer` and `/code-review`.

## Decision
Krowi, 2026-10-21:
- **Option A:** the Curse Surges from the scheduler and the soup on a fixed schedule, shipped as normal reminders.
- **Scope:** the Curse Surges and the soup only. Aqir Invasion, Abundance, Void Assaults and the older widget events follow as data in a next item, once this model has run in game.

Krowi, 2026-10-21, after the code review found that the schedule makes Community Feast: Next active everywhere at all times (a pop-up and chat line on every login and reload, a new pop-up every 90 minutes, for every Retail player):
- **The soup's Next shows only in the 15 minutes of preparation before each cooking**, then Active for the 15 minutes of cooking; nothing between feasts. Chosen over keeping Next all the time and over limiting the soup to the Dragon Isles.
- **Checked in game** on the Azure Span map the same day: the eating phase (60 minutes) ended 60 minutes after the cooking the schedule counts, within a minute, so Europe's offset holds.