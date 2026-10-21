# Intent: Event reminders come from Blizzard's event scheduler and fixed schedules, not from POI checks
Author: Krowi (maintainer). Source: idea, 2026-10-21, from the review of docs/work/2026-10-18-memory-growth. Accepted by Krowi on 2026-10-21. Status: done

## Problem
The event reminders (pop-ups, chat messages and side buttons for events that are going on or coming up) were built in Shadowlands, when timed world events were random. They find a world event by asking every refresh whether its POI is on its map and how long it has left, and some events by parsing a widget's text.
- **Widget events only show in their zone.** The events that take their time from a widget (Community Feast, Time Rift, Superbloom, Azerothian Archives, Researchers Under Fire, Dreamsurges, Theater Troupe) only appear while the player stands in their zone, because the widget only exists there.
- **Midnight is not covered at all.** KAF reminds of no Midnight world event. Blizzard's world-map Events tab lists Saltheril's Soiree, Stormarion Assault, Legends of the Haranir, Vaults of Atal'Utek, Abundance, Aqir Invasion, Void Assaults and the Curse Surges (2026-10-21), and KAF's Midnight event data has only the Winds of Mysterious Fortune holiday.
- **Every refresh still makes a little garbage** while a POI is on its map or a widget event is going on (the open targets of the memory work).

Blizzard has since added an event system, `C_EventScheduler`, that lists current content's events with their exact start and end times. Older repeating events run on fixed schedules (the soup every 90 minutes).

## Proposed outcome
- Current content's events come from Blizzard's scheduler, with their real start and end times, wherever the player is.
- Older repeating events come from schedules KAF carries itself (a start, an interval and a duration per region), also wherever the player is.
- The POI and widget checks go away, and with them the refresh's garbage.
- **First, a proof of concept for the first two:**
  - a Curse Surge reminder from the scheduler: The Coiled Isle, area POIs 8936-8940, which KAF does not remind of today;
  - the soup (Community Feast) on a fixed schedule.

## Affected users and systems
- Retail players with event reminders on, the default: the pop-ups, chat messages and side buttons (next to the achievement window or the world map).
- Options > Event Reminders: the per-event toggles and the Refresh interval; the event's achievement category, which a pop-up opens on click.
- Classic: only calendar holidays today, which this does not change.
- The ElvUI, GW2_UI and EllesmereUI plugins, which skin the pop-ups and side buttons.

## Constraints
- **No taint.** The scheduler belongs to the world map's Events tab, so how and when KAF reads it must not taint the map. Blizzard's own Events tab is not touched (researched 2026-10-21: adding rows there spreads taint to Blizzard's own rows).
- **Calendar holidays** keep working as they do.
- **Players lose no reminder they have today** without Krowi deciding so.
- **Event names come from the game** where it has them (the scheduler's POI names), rather than new CurseForge strings.
- **The memory rules hold:** a background job allocates nothing on a run where nothing changed, measured in the memory suite and listed for the `background-jobs` lint rule.

## Open questions
- What exactly does `C_EventScheduler` return in game for the Curse Surges: event ids, keys, how far ahead, the ongoing list? Can KAF read it with the world map closed, and outside combat only?
- Should the proof of concept ship to players, or stay behind debug mode until the model is settled?
- How do events that come from Blizzard at runtime get their per-event option and their achievement category?
- What happens to the existing world and widget events: all on fixed schedules, scheduler where Blizzard lists them, or kept on POI checks for the random ones?
- Does the Refresh interval option stay, now that start and end times are known in advance?