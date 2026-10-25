# Intent: Upcoming event reminders break on a non-English client whose date format names the day or month
Author: Krowi (maintainer), captured by Claude. Source: `docs/backlog.md`, "From the fixed schedules work (2026-10-21)" (found while working on event reminders, not reported by a player); and GitHub issue #247 (in scope, decided at the intent gate). Status: done

## Problem
An upcoming event reminder ("Upcoming: Darkmoon Faire", shown as a pop-up and as a side button next to the achievement window) gives a Lua error instead of its date line when all of these hold:
- the client's language is not English;
- the player has set Event Reminders > Date and Time format to a custom format that names the weekday or the month (`%a`, `%A`, `%b` or `%B`, such as "%A %d %B %R");
- a calendar event is coming up within the reminder window (Upcoming Calendar Events is on by default, 14 days).

The line refreshes every second while the reminder is shown, so the error repeats for as long as it is on screen. None of the preset formats names a day or month, so a player on the default settings never sees it. No BugGrabber log here holds the error, and no player has reported it.

Related, on the same line: issue #247 (a Russian client, June 2025) reports that the upcoming Darkmoon Faire reminder showed "in 13/07/2025 04:59" while the faire ran from the 6th to the 12th. The maintainer's own Mists client showed the same on 2026-10-25: "Upcoming: Darkmoon Faire, In 07/11/2026 23:59", with the countdown running to 1 November. The upcoming reminder shows when the event ends, worded as if that were when it starts.

## Proposed outcome
- Upcoming reminders show their date line on every client language and with every date format, with the day and month names in the client's language, and without a Lua error.
- The date line of an upcoming reminder tells the player when the event starts, not only when it ends (#247).

## Affected users and systems
- Retail and Classic (Mists, Titan): the event reminders exist on both. Calendar events are the ones that get upcoming reminders.
- The reminder pop-ups and the side buttons, through `Gui/EventReminder/AlertSystem.lua` and the alert frame mixin.
- Options: Event Reminders > Date and Time format (Custom), Time display lines 1 and 2, Enable Upcoming Calendar Events.
- Clients in German, French, Spanish, Italian, Portuguese, Russian, Korean and Chinese. English clients take another path and are not affected.
- No saved variables or data files change.

## Constraints
- Active (not upcoming) reminders and chat messages keep their current text.
- The localized day and month names come from the addon's own `MonthNames`/`WeekdayNames`. No new strings for the CurseForge translators unless the design needs them.
- Built test first: a scenario records the error before the fix. The maintainer's clients are English, so the scenario has to reach the non-English path without switching the game's language.

## Open questions
- Scope: decided at the intent gate (2026-10-25): both the error and #247.
- What the upcoming line shows: the start, or the start and the end. And in which time zone: #247's 04:59 was the realm's 23:59 in the player's own.
- Which date's day and month names the format uses follows from that: the date it shows.