# Spec: The "Active events:" chat line repeats with no event under it
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. The "Active events:" chat line prints only in the same pass as at least one event line under it.
2. An event the reminders judge ended prints nothing to chat, however often the refresh runs.
3. Chat reminders for events that are going on keep their text: the header once, then one line per event with its time left.
4. Pop-up reminders behave as before, apart from requirement 5.
5. The reminders judge an event's start and end by the realm's clock, `GetServerTime()`, the clock the sources use: the refresh, the login and reload passes and the calendar events' checks. No event reminder code reads the PC's clock, `time()`. After the code review (Decision): the calendar's and obtainability's dates are true UTC seconds also on a PC whose clock is wrong, and obtainability's Past/Future checks use the realm's clock too.
6. A world event whose POI reports negative seconds left counts as not active.
7. The fixed bug leaves a scenario behind (Verification).

## Root cause
**The header is printed before the code knows whether a line follows, and an event whose line is skipped is forgotten on the same tick.**
- The refresh ticker runs every `RefreshInterval` seconds (`Gui/EventReminder/AlertSystem.lua:580-591`; Krowi's is 1, the default 60) and calls `ShowActiveEvents` with `currentTime = time()`, the PC's clock (`:615-616`).
- `ShowActiveEventChatMessage` (`:446-466`), for an event with no record yet and with time data, prints the header (`:457-460`), records the event's end (`:461`) and prints the event's line only when that end is not before `currentTime` (`:462-464`).
- The same refresh then drops every record whose end is before `currentTime` (`:624-628`). On the next tick the event has no record again, so the header prints again with no line, every tick, for as long as the event's source still lists it as active.
- The sources list an event as active by the realm's clock, `GetServerTime()`: fixed schedules (`Data/EventData.lua:180-191`, `Data/EventSchedules.lua:132-151`), Blizzard's event scheduler (`Data/EventData.lua:240-252`, `Data/EventScheduler.lua:216-243`), widget and world-map POI timers (`Data/EventData.lua:194-219`, `:255-302`). Every one of them returns an end after `GetServerTime()`, except a POI read whose seconds left are negative, which `:293-296` accepts.
- So the header repeats when an event is active by `GetServerTime()` but its end is already behind `time()`.

**What happened in Krowi's raid on 2026-10-28.**
- 33 headers at 20:01, no event line, then it stopped. Chat timestamps are `time()` (wow-ui-source live, `Blizzard_ChatFrameBase/Mainline/ChatFrameOverrides.lua:425`), so this was one header a second for about 33 seconds.
- The PC's clock was right: −0.016 s against time.windows.com at 20:05 (`w32tm /stripchart`).
- So an enabled event stayed active for about 33 seconds past its end by the real clock: either `GetServerTime()` ran about 33 seconds behind in that instance, or a stale map POI reported negative seconds left. `/run print(time() - GetServerTime())` in an instance tells the two apart; the fix below does not depend on which it was.
- Krowi's saved options (`WTF\Account\133658957#1\SavedVariables\Krowi_AchievementFilter.lua`): `RefreshInterval = 1`, ChatMessages `OnEventStart`/`OnLogin`/`OnReload` with `Show` and `ShowInInstances` on, `ShowOnlyWhenTimeDataIsAvailable` at its default (on).
- BugGrabber's file was last written on 2026-10-26, so it says nothing about this session; no error is expected, since nothing raised.

**Reproduction.** The new `events` scenario below, recorded before the fix.

## Design
- **The header with its first line.** `ShowActiveEventChatMessage` prints the header right before the first event line of the pass. After the code review: an event whose end has passed returns before it is recorded (no record that the same refresh drops again), the line's text is built before the header, so an error cannot leave a header without a line, and `ShowActiveEvents` clears the header flag at the start of every pass.
- **One clock.** `GetServerTime()` replaces `time()` in `AlertSystem.lua` (the refresh `:615`, the login and reload passes `:682` and `:712`) and in `Data/EventData.lua` (upcoming calendar events `:136`, active calendar events `:160`). The date lines (`GetRuntimeText`, `GetUpcomingText`) already count with `GetServerTime()`.
- **The calendar's and obtainability's dates (after the code review).** They are the realm's wall-clock time through `time{...}` minus `KrowiAF_GetUtcOffsetSeconds` (`Data/EventData.lua:11-25`, `:49-50`; `Data/TemporaryObtainable.lua:36-39`). That offset compared the realm's local time with `date("!*t")`, the PC's clock, so each date carried the PC clock's error in whole hours, which a comparison with `time()` cancelled. The offset now reads both sides at `GetServerTime()`, so the dates are true UTC seconds, and every `time()` in `Data/TemporaryObtainable.lua` (13 checks: seasons, resets, dates, calendar events) becomes `GetServerTime()`.
- **Negative seconds left.** `GetWorldEventDetails` (`Data/EventData.lua:293-296`) treats seconds left below 0 as not active, as it treats none. 0 keeps its meaning: active with no time data.
- The pruning of ended records (`AlertSystem.lua:619-628`) moves into a function of the alert system that `Refresh` calls, so the scenario runs the same step the ticker runs instead of a copy of it.
- **A test seam:** the chat lines go through a field, `eventReminderAlertSystem.Print` (a function that calls the global `print` when called), read on every call, so the `events` suite can count the lines and put the field back, as it already does with `LocalizeDateNames`.

## Options considered
What the player sees, on Retail (world, widget and calendar events) and Classic (calendar events only):
- **A. The header only with a line (recommended at the gate).** "Active events:" never shows on its own. An event the game still lists for a few seconds after its end prints nothing. Chat reminders that work today print exactly what they print now. A few lines in one function plus the test seam.
- **B. A, plus one clock (chosen).** The reminders also judge "ended" by the realm's clock like the sources do, and a POI with negative seconds left counts as not active. Such an event then gets its line in its last seconds ("<event> (12 sec)") instead of nothing. It touches the pruning and the pop-ups' check too, and the calendar events' checks, which then compare with the realm's clock. More change than A, for a line about an event that is about to end; it also removes the mismatch at its source.

## Areas of concern
- **Taint and secret values:** none. Chat output from the addon's own ticker; no Blizzard frame, hook or protected API is touched. The values compared are the addon's own numbers.
- **Clients:** `## Interface: 120105, 50504, 38002`. The alert code is shared. On Classic only calendar events exist, whose source and reminder both used `time()`, so the repeat could not happen there in practice; there the change is the clock of the calendar checks, which `GetServerTime()` serves on every client.
- **The PC's clock:** with a correct PC clock nothing moves. A player whose PC clock is wrong by whole hours saw calendar countdowns off by that much (they already counted with `GetServerTime()`); now calendar reminders, their countdowns and obtainability's Past/Future states all follow the realm. Chat timestamps stay on the PC's clock (Blizzard's).
- **Obtainability (after the code review):** `Data/TemporaryObtainable.lua` decides what the achievement tooltips and the obtainable filter call Past, Current and Future. Its 13 checks change clock together with the offset its dates use, so the two cannot disagree; the `obtainable` suite runs on both clients.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** none; chat text only.
- **Saved variables and migrations:** none. `ActiveEventChatMessagesShown` keeps its shape and meaning.
- **Localization:** no new or changed strings.
- **Embedded libraries:** none.
- **Data snapshots:** none.
- **Player-facing text:** two changelog lines under the next version, `### Fixed`: the chat message, and the realm's clock.

## Found on the way
- **The upcoming events' header has the same shape** (`AlertSystem.lua:509-528`): "Upcoming Calendar Events:" prints before the occurrence check and before the window check, so it can print once with no line under it. It does not repeat in practice: the record is set whenever an occurrence exists, and the list is built once with occurrences only. In `docs/backlog.md`.
- **`GetUpcomingCalendarEvents` never rebuilds its list after the first non-empty one** (`Data/EventData.lua:131-151`). Already in `docs/backlog.md` (from the upcoming reminder date fix).

## Verification
- **A scenario in the `events` suite** (`Tests/Events.lua`, its model in `.claude/tools/headless/run-tests.lua`): a test event listed active whose end is 10 seconds behind the reminders' clock, run through three refresh passes (`ShowActiveEvents` with chat on and pop-ups off, then the pruning), counting the chat lines. Recorded "headers 3, lines 0", Target "headers 0, lines 0".
- Guard scenarios: the same with the end 600 seconds ahead, "headers 1, lines 1" (requirement 3); after the code review, an ended event and two going on in one pass, "headers 1, lines 2" with the header before the first line.
- The clock (requirement 5) cannot be reproduced in game, where both clocks agree, and the suites cannot swap the game's clocks. Its permanent check is the `event-clock` lint rule: no `time()` in the event reminder and obtainability files.
- Negative seconds left (requirement 6): `poi-negative-seconds` and `poi-seconds-left`, headless only through a model of `C_AreaPoiInfo` (SKIP in game).
- Headlessly: the `events` suite and `Check-Repo.ps1 -ChangedOnly`. In game on Retail and Mists: `/kaftest events` before the fix matches Recorded, after it Target; then `/reload`, `Read-GameTests.ps1` and `Read-GameErrors.ps1`.
- `/code-review` on the diff; `krowi:taint-reviewer` is not needed (no Blizzard frame, hook or protected API), and is run anyway if the diff grows past `AlertSystem.lua`'s chat path.

## Decision
Krowi, 2026-10-28, at the design gate (the intent folded into it): **option B**, the header only with a line plus one clock: the reminders judge start and end by the realm's clock, and a POI with negative seconds left counts as not active.

Krowi, 2026-10-28, after the code review found that the calendar's dates still carried the PC clock's error: **finish one clock in this PR**, so `KrowiAF_GetUtcOffsetSeconds` reads the realm's clock and obtainability's checks use `GetServerTime()` too (not "reminders only, the rest later").