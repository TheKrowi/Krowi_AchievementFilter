# Spec: Upcoming event reminders break on a non-English client whose date format names the day or month
Intent: [intent.md](intent.md). Status: done

## Requirements
1. On a non-English client, an upcoming reminder (pop-up and side button) shows its date line without a Lua error with every date format, including a custom one with `%a`, `%A`, `%b` or `%B`, on Retail and Classic.
2. The day and month names in that line are those of the date the line shows, in the client's language (`addon.WeekdayNames`, `addon.MonthNames`).
3. Where the Time display option says "End Time" (line 1 by default), an upcoming reminder shows when the event **starts**, so "In <date>" matches the countdown, which already counts to the start (#247).
4. Times stay in the player's own time zone, as the active reminders show them.
5. Active reminders and the chat messages keep their text.
6. Each fixed bug leaves a scenario behind (Verification).

## Root cause
**A. The day and month names are taken from the end time of the active occurrence, which an upcoming event does not have.**
- `Gui/EventReminder/AlertSystem.lua:31-64` picks `LocalizeDateFormat` once, when the file loads. On an English client (`enUS`, with `enGB` folded into it) it returns the format unchanged.
- On every other client it replaces `%a %A %b %B` with the addon's own names, read from `date("*t", event.EventDetails.EndTime)` at `:49`. The C library's `date` gives English names, which is why the replacement exists.
- An upcoming reminder is drawn through `GetUpcomingText` (`:121-143`), which calls `LocalizeDateFormat(event)` at `:129`. The alert frame calls `GetUpcomingText` only when the event has no `EventDetails` (`Gui/EventReminder/AlertFrame/AlertFrameMixin.lua:57-63`).
- So with a name in the format, `:49` raises "attempt to index field 'EventDetails' (a nil value)".
- The frame redraws that line every second (`AlertFrameMixin.lua:5-9`).
- None of the preset formats names a day or month (`Options/EventReminders.lua:61-69`). Only a custom format reaches the error.

**B. The upcoming line shows when the event ends (#247).**
- `GetUpcomingText` writes `UpcomingEventDetails.EndTime` where the option is "End Time": line 1 at `:131-133`, line 2 at `:139-140`. The default is line 1 "End Time" and line 2 "Time Left" (`Options/Defaults.lua:262-265`).
- The frame puts "In" in front (`AlertFrameMixin.lua:62`), while the time left counts to `StartTime` (`:125`).
- The occurrence comes from the game's calendar (`Data/EventData.lua:28-56`, `GetNextEventOccurance` at `:110`). Its times are true UTC seconds: the realm's wall-clock time through `addon.GetSecondsSince`, corrected by the realm-to-player offset `KrowiAF_GetUtcOffsetSeconds` (`:11-25`). `date()` then prints them in the player's own time zone.
- #247's "13/07/2025 04:59" is the faire's end, Saturday 23:59 realm time, shown five hours later in the player's zone.
- The maintainer's Mists side button on 2026-10-25 read "Upcoming: Darkmoon Faire, In 07/11/2026 23:59", with 6 days 14 hours left to the start on 1 November.

**Reproduction.** No logged error exists, and the maintainer's clients are English, so neither bug can be reproduced by playing. The reproduction is the new `events` scenarios below, recorded before the fix.

## Design
- `LocalizeDateFormat` takes the time it formats instead of the event. Each line passes the time it shows, so the names always belong to the date shown. An upcoming event no longer reads `EventDetails`.
- In `GetUpcomingText`, an "End Time" slot shows `UpcomingEventDetails.StartTime`. `GetRuntimeText` (active events) is unchanged apart from passing `EventDetails.EndTime` to `LocalizeDateFormat`.
- Times stay in the player's time zone (requirement 4). The active reminders and the countdown already work that way, and the game's own calendar is the place for realm time.
- **A test seam:** the choice between the English and the non-English path moves from load time to a field read on every call (`eventReminderAlertSystem.LocalizeDateNames`, set from the client's language). The `events` suite can then run the non-English path on an English client and put the field back.

## Options considered
For what the upcoming line shows (#247), on Retail and Classic alike, with the default settings:
- **1. The start, where the option says "End Time" (recommended, chosen).** "Upcoming: Darkmoon Faire / In 01/11/2026 00:01 / 6 Days 14 Hr". The date and the countdown point at the same moment. No new strings. The option's label stays "End Time", which for an upcoming reminder now means "the date next to In".
- **2. Start and end.** "In 01/11/2026 00:01 - 07/11/2026 23:59". The side buttons already cut the event names off ("Upcoming: Day of the De..."), so the line would not fit there. Not recommended.
- **3. Keep the end, and say so.** "Until 07/11/2026 23:59" in place of "In". That needs a new string for the CurseForge translators, and the player still has to work out the start from the countdown. Not recommended.
- **4. Always the countdown.** Every upcoming reminder reads "In 6 Days 14 Hr 9 Min", whatever the time display options say; this is what the maintainer's Retail client shows (Compact, line 1 "Time Left"). It is the simplest code, and the date format would never reach an upcoming reminder. But players on the default settings would lose the date of upcoming events.

## Areas of concern
- **Taint and secret values:** none new. `C_Calendar.GetDayEvent` can return secret values; the calendar cache already checks them (`Data/EventData.lua:34-38`) before storing plain numbers. This change only formats those numbers. No Blizzard frame or API is touched; the pop-ups are the addon's own alert subsystem.
- **Clients:** `## Interface: 120105, 50504, 38002`. The alert code is shared and calendar events exist on every client. Titan is checked through Mists.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** the alert frames and side buttons keep their size and layout; only the text of one line changes.
- **Saved variables and migrations:** none. The date format and time display options keep their values and meaning for active reminders.
- **Localization:** no new strings. The names come from `addon.MonthNames` and `addon.WeekdayNames` (`Globals.lua:382-405`), which every locale already translates.
- **Embedded libraries:** none.
- **Data snapshots:** none.
- **Player-facing text:** changelog lines under `## 104.1`, `### Fixed`, worded in the plan.

## Found on the way
- **The `%c` preset prints English day and month names on every client.** `%c` is the C library's own date, and `LocalizeDateFormat` only replaces the four name directives. Proposed for `docs/backlog.md`.

## Verification
- **Scenarios in the `events` suite** (`Tests/Events.lua`, its model in `.claude/tools/headless/run-tests.lua`), on a fake calendar event with a fixed start and end in the future. The time display options are set for the run and restored after.
  - `upcoming-date-default-format`: the upcoming line with the default format and time display. Recorded "end", Target "start".
  - `upcoming-date-names`: a custom format with `%A %d %B`, with the non-English path forced. Recorded "error", Target "start names" (the line holds the start's weekday and month from the addon's own names).
  - `active-date-names`: the same format on an active occurrence. Recorded and Target "end names", as the guard for requirement 5.
- Headlessly: the `events` suite and `Check-Repo.ps1 -ChangedOnly`. In game on Retail and Mists: `/kaftest events` before the fix matches Recorded, after it Target; then `/reload`, `Read-GameTests.ps1` and `Read-GameErrors.ps1`.
- By hand on Retail and Mists while Darkmoon Faire is upcoming (it starts on 1 November 2026): the side button reads "In 01/11/2026 …" with the countdown to the same moment; a screenshot of each.
- `krowi:taint-reviewer` and `/code-review` on the diff.

## Decision
Krowi, 2026-10-25, at the design gate:
- **Option 1:** where the time display option says "End Time", an upcoming reminder shows the start, with the day and month names of the start. The player's time display settings keep their meaning; with "Time Left" the line stays a countdown, as on the maintainer's Retail client.
- **Scope:** both the error and #247, decided at the intent gate the same day.
- **Line 2, after the code review (2026-10-25):** only line 1, which has "In" before it, shows the start; line 2 "End Time" shows the end (plan, Results and departures).