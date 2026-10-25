# Plan: Upcoming event reminders break on a non-English client whose date format names the day or month
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-25 in plan mode. It touches shared GUI code (the event reminder pop-ups and side buttons), so it waited for that gate. The in-game before-run is the second gate.

Results and departures:
- **Before-run, 2026-10-25, from a8ae9414 on Retail 12.1.5.** `/kaftest events`: 23 passed, 0 differences from headless. The new scenarios gave "end", "error" (`AlertSystem.lua` line 50, "attempt to index field 'EventDetails' (a nil value)") and "end names". BugGrabber held no KAF error.
- **Mists is checked headlessly only** (Krowi, 2026-10-25: "confident mists will get fixed alongside testing retail"). Krowi was in content on Retail that starting Mists would end. The code is shared, and the headless Classic run covers the three scenarios.
- **The headless model gained** `addon.MonthNames` and `addon.WeekdayNames` as English strings: the data load's localization stub gave tables, which made the active scenario fail on `gsub`. The scenarios also observe the error each one raised, in the "raised at <file> line <n>" form the `unit-tests` lint rule does not read as a failure.

## Context
`Gui/EventReminder/AlertSystem.lua` has two defects:
- **The error.** On a non-English client, `LocalizeDateFormat(event)` reads `event.EventDetails.EndTime` (`:49`) to put the day and month names into a custom date format. An upcoming reminder has no `EventDetails`, so its line raises an error every second.
- **#247.** `GetUpcomingText` prints the occurrence's end where the time display says "End Time" (`:131-133`, `:139-140`), behind "In", while the countdown runs to the start.

The decision (spec, option 1): an upcoming reminder shows the start there, with the start's day and month names. Times stay in the player's time zone. Active reminders and chat messages are unchanged.

## Files that change
- `Gui/EventReminder/AlertSystem.lua`
  - **Test seam (step 2):** the English-or-not choice moves from load time to a field read on every call: `eventReminderAlertSystem.LocalizeDateNames = gameLocale ~= "enUS"` (enGB is already folded into enUS at `:32-34`). `LocalizeDateFormat` becomes one function that returns the format unchanged when the field is false. It still reads `event.EventDetails.EndTime`, so nothing changes for players.
  - **Fix (step 4):** `LocalizeDateFormat(time)` takes the time it formats. `GetRuntimeText` passes `event.EventDetails.EndTime`. `GetUpcomingText` passes `event.UpcomingEventDetails.StartTime` and prints `StartTime` in both "End Time" slots (`:132`, `:140`).
- `Tests/Events.lua`: three scenarios of a new kind, `DateLine`, run the same in game and headlessly.
- `.claude/tools/headless/run-tests.lua`, `suites.events`: loads `Gui/EventReminder/AlertSystem.lua` before `Tests/Events.lua`, with `env.GetLocale` returning "enUS" and `env.date = os.date` (the stub is not a date). Nothing else in the file runs at load time.
- `Tests/README.md`: the `events` row.
- `_Packaging/Changelog.md`, under `## 104.1` `### Fixed`:
  - "Upcoming event reminders now show when the event starts, not when it ends"
  - "Upcoming event reminders no longer give an error on a non-English client with a date format that names the day or month"
- `docs/backlog.md`: the item leaves "From the fixed schedules work". The `%c` preset (English names on every client) goes into a new section for this work item.

## Scenarios (`Tests/Events.lua`, Kind `DateLine`)
- **The event:** a fake calendar event that is never registered: `{Id = 0, Name = "Test"}`. Its occurrence starts at T0 = 1800000000 (2027-01-15 08:00 UTC, the suite's own anchor) and ends T0 + 6 days. Upcoming scenarios set `UpcomingEventDetails`; the active one sets `EventDetails`.
- **The settings for the run:**
  - set: `DateTimeFormat.StartTimeAndEndTime` to the scenario's format, `TimeDisplay.Line1 = 1` (End Time), `Line2 = 1` (None), `Compact = false`, and `LocalizeDateNames` to the scenario's value;
  - kept and put back afterwards, outside the pcall, so an error cannot leave them changed.
- **What a scenario records:** the line from `GetUpcomingText` or `GetRuntimeText` under pcall.
  - "error" when it raises;
  - "start" or "end" when it equals `date(format, start or end)`;
  - "start names" or "end names" when it equals the expected text for `%A %d %B %Y`, built from `addon.WeekdayNames`, the day, `addon.MonthNames` and the year of that date;
  - otherwise "other".

| Name | Line | Format | Names | Recorded | Target |
|---|---|---|---|---|---|
| `upcoming-date-default-format` | upcoming | `%d/%m/%Y %R` | off | end | start |
| `upcoming-date-names` | upcoming | `%A %d %B %Y` | on | error | start names |
| `active-date-names` | active | `%A %d %B %Y` | on | end names | end names |

All three run on every client; calendar events exist on both.

## Order of work
1. **`docs(work): plan for 2026-10-25-upcoming-reminder-date`:** this file and the backlog move.
2. **`test: reproduce the upcoming reminder date line errors`:** the seam, the scenarios, the headless model and the README row. Headless, the three scenarios pass against Recorded, two targets are open, and the suite's other scenarios are unchanged. `Check-Repo.ps1 -ChangedOnly` is clean.
3. **In-game before-run (gate):** `Deploy.ps1 -WhatIf`, then deploy to Retail and Mists (check `ListAgents` first). Krowi runs `/kaftest events` and `/reload` on each; `Read-GameTests.ps1` shows no FAIL and no unexplained difference.
4. **`fix: upcoming event reminders show when the event starts, without an error on day or month names`:** the fix in `AlertSystem.lua`, Recorded set to Target, and the changelog lines.
5. **Test:**
   - Headless suites, `Check-Repo.ps1 -ChangedOnly -Luals`, `krowi:taint-reviewer` and `/code-review`.
   - The in-game after-run on both clients, with `Read-GameErrors.ps1`.
   - By hand on Mists, whose reminders use End Time: the Darkmoon Faire side button reads "In 01/11/2026 …", and the countdown on the second line points at the same moment. A screenshot.
6. **PR** against `main` with the work files set to `done`, saying `Closes #247`; the merge waits for Krowi.

## Risks
- **Options are changed during the test:** the profile's format, time display and Compact, and the seam field. They are restored in the same frame with the restore outside the pcall, and the side buttons redraw only on the next refresh.
- **`env.date = os.date` headlessly** could change other events scenarios that ran on the stub. Step 2 checks that the suite's other lines are unchanged.
- **The seam keeps English clients on the English path** (`LocalizeDateNames` false), as before: the C library's names are English.
- **Titan** has no local install. It runs the same code as Mists.

## Proof
- **Headless:** before the fix, "end", "error" and "end names" pass with two targets open; after it, every target is met.
- **In game** on Retail and Mists, before and after, with the `Read-GameTests.ps1` lines matching headless and no KAF error in BugGrabber.
- A screenshot of the Mists Darkmoon Faire side button showing the start date.
- The taint review and code review findings are fixed, or listed in the PR.