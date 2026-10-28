# Plan: The "Active events:" chat line repeats with no event under it
Spec: [spec.md](spec.md). Status: accepted

Context: in a raid on Retail (2026-10-28) chat showed "Krowi's Achievement Filter - Active events:" 33 times in a minute with no event under it. The header prints before the code knows a line follows; the event's line is skipped because its end is behind the PC's clock while its source (realm clock) still lists it; the record is pruned on the same tick, so it repeats every refresh (Krowi's interval: 1 s). Krowi chose option B at the design gate: the header only with a line, plus one clock (`GetServerTime()`) for the reminders, plus negative POI seconds counting as not active.

## Files that change
- `Gui/EventReminder/AlertSystem.lua`
  - Seam (test commit, no behaviour change): `eventReminderAlertSystem.Print = print`, read on every call by the active and upcoming chat lines (`:458`, `:463`, `:517`, `:526`), as `LocalizeDateNames` is read for the date names. The "Help Events Off" print (`:270`) stays a plain `print`.
  - Refactor (test commit, no behaviour change): the pruning loop of `Refresh` (`:619-628`) becomes `function eventReminderAlertSystem:ForgetEndedReminders(currentTime)`, which `Refresh` calls.
  - Fix: in `ShowActiveEventChatMessage` (`:446-466`) the header print moves inside the `>= currentTime` branch, right before the first line of the pass.
  - Fix: `time()` becomes `GetServerTime()` at `:615` (Refresh), `:682` (`ShowActiveEventsOnPlayerEnteringWorld`) and `:712` (`ShowUpcomingCalendarEventsOnPlayerEnteringWorld`).
- `Data/EventData.lua`
  - Fix: `time()` becomes `GetServerTime()` at `:136` (`GetUpcomingCalendarEvents`) and `:160` (`GetActiveCalendarEvents`).
  - Fix: `GetWorldEventDetails` (`:255-302`), after both branches have a `secondsLeft`: below 0 means not active (`event.EventDetails = nil`, return), as no seconds left does; 0 keeps "active, no time data".
- `Tests/Events.lua`
  - Kind `ChatPasses`: a test event `{Id = "kaftest-chat", ...}` whose `EventDetails.EndTime` is `now + EndIn`, with `now = GetServerTime()`, run through `Passes` refresh passes: `ShowActiveEvents({Show = false}, {Show = true, ShowInInstances = true, ShowOnlyWhenTimeDataIsAvailable = true}, now + i - 1, {event})`, then `ForgetEndedReminders(now + i - 1)`. `Print` is swapped for a counter (first argument `"    -"` is an event line, anything else a header) and put back; `KrowiAF_SavedData.ActiveEventChatMessagesShown`/`ActiveEventPopUpsShown` are created when absent and the test key removed after, the tables put back as they were. Result "headers <n>, lines <n>".
  - Kind `PoiSeconds` (RetailOnly): a world event that is not registered, `{Id = 999999, MapId = 1}`, read through `GetWorldEventDetails(event, now)` with a POI model reporting `SecondsLeft`; result "not active", "no time data", or "ends in <n>" / "ended <n> s ago". It needs `env.SetPoi(id, mapId, secondsLeft)`, which only the headless runner has: in game it is SKIP ("needs a model of C_AreaPoiInfo, which the game's own cannot be swapped for"), as the soup scenarios SKIP outside Europe, before anything is read. Headlessly every toggle is on.
  - Scenarios: `chat-ended-event` (EndIn -10, Passes 3): Recorded "headers 3, lines 0", Target "headers 0, lines 0". `chat-active-event` (EndIn 600, Passes 3): Recorded and Target "headers 1, lines 1". `poi-negative-seconds` (SecondsLeft -20): Recorded "ended 20 s ago", Target "not active". `poi-seconds-left` (SecondsLeft 600): Recorded and Target "ends in 600".
  - The header comment's Kind list gets both kinds and the 2026-10-28 history line, in the file's style.
- `.claude/tools/headless/run-tests.lua`, `suites.events`
  - `env.GetInstanceInfo` (open world: difficulty 0), `env.KrowiAF_SavedData = {}` (else the `^KrowiAF_` stub answers every index with a truthy stub).
  - A POI model: `C_AreaPoiInfo.GetAreaPOIInfo(mapId, id)` also answers for a POI set on that map, `GetAreaPOISecondsLeft(id)` returns its seconds; `headless.SetPoi(id, mapId, secondsLeft)` sets it, `nil` clears it. `CheckAreaPoiArgs` stays.
- `.claude/tools/Check-Repo.ps1`, `.claude/tools/README.md`: a rule `event-clock` [Error]: no `time()` call (with no argument; `time{...}` converts a date and stays allowed) in `Gui/EventReminder/**/*.lua`, `Data/Event*.lua` and `Data/Custom*EventTimers.lua`, comments stripped, in the shape of `settings-close` (`Check-Repo.ps1:503-519`); a help-block line and a README row.
- `_Packaging/Changelog.md`, `## 105.0`, `### Fixed`: `- The "Active events" chat message no longer repeats every refresh without an event under it`.
- `docs/work/2026-10-28-active-events-chat-repeat/plan.md`: this plan; the backlog items from the spec's "Found on the way" go into `docs/backlog.md`.

## Order of work
1. Commit `plan.md` (`docs(work): plan for 2026-10-28-active-events-chat-repeat`).
2. Test first: the seam and the pruning function in `AlertSystem.lua`, the two kinds and four scenarios, the headless model. `run-tests.lua <root> events` for Retail and Classic: every scenario PASS against Recorded, the two bug scenarios open against Target. `Check-Repo.ps1 -ChangedOnly` clean. Commit `test: reproduce the repeating Active events chat line in the events suite`.
3. Optional in-game before-run on Retail (Krowi's call, out of combat): deploy, `/kaftest events`, `/reload`, `Read-GameTests.ps1`: `chat-ended-event` shows "headers 3, lines 0" there too, the POI scenarios SKIP.
4. The lint rule first, run on the unfixed code: it reports the five `time()` calls (AlertSystem `:615 :682 :712`, EventData `:136 :160`); record that in Results.
5. The fix: header move, the five clocks, negative seconds. Set Recorded to Target in the two bug scenarios. Changelog line, backlog items.
6. Headless suites `events`, `memory`, `popups`, `options` and the full `Check-Repo.ps1` (the alert system file is loaded by those suites too). Commit `fix: the Active events chat line no longer repeats without an event under it`.
7. In-game after-run (stage 4): Retail and Mists.

## Risks
- **Calendar reminders shift by the PC clock's error** for a player whose clock is off: intended (spec, areas of concern). With an accurate clock nothing moves.
- **The pop-ups' check and pruning change clocks too**: a pop-up of an event in its last seconds, where the two clocks differ, now shows where it did not; the pruning drops a record by the realm's clock. Both follow requirement 5.
- **The seam captures `print` at load**: an addon that replaces the global `print` after KAF loads would not see the reminders' lines. Chat addons hook the print handler (`setprinthandler`), not the global, so nothing changes for them.
- **The test touches the player's saved records**: only the `kaftest-chat` key, removed after; the tables are created only when absent and put back. `ForgetEndedReminders` also drops the player's records that have ended, which the next refresh would do anyway.
- **A background job**: `Refresh` (memory/event-refresh) gains a method call and reads `GetServerTime()` in place of `time()`; nothing new is allocated. The memory suite runs in step 6.
- **The lint rule's pattern**: `GetServerTime()` and `date(...)` must not match: the pattern needs no word character, `.` or `:` before `time`, and nothing between the parentheses.

## Proof
- `& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" events`, for both clients: before the fix the four scenarios PASS with the bug scenarios open; after it all PASS and met.
- The same for `memory`, `popups`, `options`: unchanged results.
- `Check-Repo.ps1` (full): no errors; `event-clock` reported the five sites before the fix and none after.
- In game, Retail and Mists Classic: `Deploy.ps1 -WhatIf`, deploy (naming anything another checkout had put there), `/reload`, `/kaftest events` out of combat, `/reload`, `Read-GameTests.ps1` (chat scenarios as headless, POI scenarios SKIP), `Read-GameErrors.ps1` (no new row).
- By hand, Retail: with chat reminders "On event start" on and the refresh interval at 1 s, a session through an event's end prints no lone "Active events:" line; `/run print(time() - GetServerTime())` noted once, for the record.
- `/code-review` on the diff; `krowi:taint-reviewer` is not needed (no Blizzard frame, hook or protected API).

## Results and departures
- Before the fix, headless (2026-10-28): `chat-ended-event` "headers 3, lines 0" and `poi-negative-seconds` "ended 20 s ago" on Retail, the first also on Classic: the bug reproduced (commit 3ec149c6).
- `event-clock` on the unfixed code reported exactly the five sites: `Data/EventData.lua:136, 160`, `Gui/EventReminder/AlertSystem.lua:634, 691, 721` (the last three shifted by the test commit); none after the fix.
- After the fix, headless: `events` 29/29 on Retail and 10/10 on Classic, nothing open; `memory`, `popups`, `options` unchanged (memory's two open targets, `event-refresh-poi-on-map` and `event-refresh-widget-active`, are open on `main` too). `Check-Repo.ps1`: 0 errors, 0 warnings.
- Departures: the events suite's headless environment also needed `mod` and `DAYS_ABBR`/`HOURS_ABBR` for the chat line's time left. Of the spec's two backlog items only the upcoming header was new; the upcoming list built once per session was already in `docs/backlog.md`. `Options/Window/Changelog.lua` is left to the release, which regenerates it.
- The optional in-game before-run (step 3) was not done; Krowi was in a raid.