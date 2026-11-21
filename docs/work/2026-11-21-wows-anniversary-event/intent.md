# Intent: One WoW's Anniversary event with every anniversary's calendar id
Author: Krowi, maintainer. Source: idea. Status: done

## Problem
WoW's 22nd Anniversary (achievement 63714) is already in the data and has shipped since 102.0: Events > WoW's Anniversary (category 1173), Time Limited from 2026-11-17 to 2026-12-08, which the live calendar (holiday 1808 on 12.1.5.70961) confirms. Players get no event reminder for it, though: no pop-up, chat line or side button when the anniversary starts, as Hallow's End or Winter Veil give. The only anniversary row in the event data is the 10th's (holiday 514, `DataAddons/Retail/06_WarlordsOfDaenor/EventData.lua`), in the Other group, and every later anniversary was left out. Nothing reminds the maintainer either to look for the next anniversary's achievement and calendar id each year.

## Proposed outcome
In Krowi's words: "can we add all wow anniversary event id's under a single "WoW's Anniversary" event. that cleans it up and makes it a "recurring" thing even tough we need to keep adding id's each year. this is a good check/reminder to run around october each year to check for mew data".
- One event reminder, WoW's Anniversary, that shows while any year's anniversary is on the calendar and opens Events > WoW's Anniversary; it replaces the 10th Anniversary row.
- Each year's new calendar id is added to that one event.
- A check that around October each year says when the coming anniversary's data (its achievement, its calendar id) is not in yet.

## Affected users and systems
- Retail only: the anniversary is Retail's holiday; the Classic clients' event data has no anniversary row and stays as it is.
- Event reminders (the feature, `Features/EventReminders/`): pop-ups, chat lines, side buttons, and the per-event toggle in Event reminders > Reminder events.
- Data: `DataAddons/Retail/*/EventData.lua`, the event's category 1173 in `DataAddons/Retail/CategoryData_Events.lua`, the Registries snapshot's EVENT lines.
- Saved variables: the per-event toggles are keyed by calendar id (`EventReminders.CalendarEvents[id]`).
- The repo's tooling, for the yearly check.

## Constraints
- Every anniversary that is on the calendar gives one reminder, never two for the same anniversary.
- No saved-variable migration; a player's choice for the old 10th Anniversary toggle may reset, since that event ended in 2015.
- The check must not need the game or the game database to run in the Stop hook, or must say plainly what it needs.

## Open questions
- Which ids the live calendar returns while the 22nd is on: 1808 (WoW's 22nd Anniversary), the regional copies of WoW's Anniversary (590, 1587 to 1590), or both. Both at once would give two reminders from one row.
- The form of the yearly check: a lint warning from October, a lookup script against the game database, or both.
- Where the row lives: Midnight's EventData (the current expansion) or the 10th's own file.