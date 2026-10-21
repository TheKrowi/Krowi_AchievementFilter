# Intent: The older expansions' event reminders run on fixed schedules
Author: Krowi (maintainer). Source: idea, 2026-10-21, after docs/work/2026-10-21-event-scheduler (PR #352). Accepted by Krowi on 2026-10-21 with the design question. Status: accepted

## Problem
KAF's world and widget event reminders for Legion to The War Within find their events the way they did when they were built:
- **POI reads:** a world event is found by asking, on every refresh, how long its POI has left and whether the POI is on its map.
- **Widget reads:** a widget-timed event parses a widget's text.

That costs players reminders and costs the addon garbage:
- **Widget-timed events only show in their own zone,** because the widget only exists there: Researchers Under Fire, Dreamsurges, Theater Troupe, Time Rift, Superbloom and Azerothian Archives.
- **POI-timed events already show outside their zone.** `/kaftest sources` (`Tests/EventSources.lua`), run in Silvermoon at 14:53 UTC on 2026-10-21, found the POI API answering from there:
  - **Maw assault:** Kyrian, 263213 s left, which ends Saturday 16:00 UTC, half a week after the weekly reset.
  - **Siege on Dragonbane Keep:** Active, 454 s left.
  - **Primal Storms:** a Thunderstorm at Nokhudon Hold on its map.
  - **Fyrakk Assault:** in Ohn'ahran Plains until the weekly reset.

  For these, a schedule does not add visibility. It removes the POI table a refresh reads while one is up, gives the next start ahead of time, and does not depend on the POI.
- **Researchers Under Fire and the Dreamsurges may not show even in their zone.** Their POIs report time from Silvermoon (7461: 109 s; 7602: until the weekly reset), but KAF's check that the POI is on the event's map fails (7461 is not on map 2133, 7602 not on 1978), so the reminders get nothing. To check in their zones.
- **The Primal Storms never show:** a storm's POI reports no time, and the refresh needs one (`Data/EventData.lua:262-266`). Superbloom's Active always reads "No time data available" (its timer returns 0).
- **The N'Zoth assaults** showed no POI from Silvermoon, though they reportedly still run. Their POIs may need quest progress, as the Maw assaults' do after Chains of Domination chapter 2.
- **Garbage:** every refresh makes a little while one of these events' POIs is on its map or a widget is read (the open targets `memory/event-refresh-poi-on-map` and `memory/event-refresh-widget-active`).
- **Event ids:**
  - **Dreamsurges:** the second id of each "Next" pair is not a next-zone marker; both POIs of a pair are the same Dreamsurge.
  - **Theater Troupe:** the rows hold the "next show" POIs (7943, 8076-8079); the shows themselves have their own POIs (7654, 7899-7902).

Blizzard's event scheduler (`C_EventScheduler`), used for the Curse Surges since PR #352, lists only current content, Midnight's events.

## Proposed outcome
Krowi's policy, 2026-10-21:
- **Older expansions** run on fixed schedules that KAF carries: a cycle, a duration, and a start per region. They show wherever the player is and make no POI or widget read on a refresh.
- **The current expansion** comes from Blizzard's event scheduler, which follows Blizzard's changes without an addon update.
- **When an expansion ends,** its scheduler events move to fixed schedules, from the times recorded while the scheduler still listed them.

## The events, sorted (research 2026-10-21)
From maintained addons that compute these timers (WindTools, GW2_UI, NDui, InvasionTimer, Funkydude's LegionInvasionTimer and BFAInvasionTimer, BtWTodo, MasterCollector, TomCats), Blizzard posts, Wowhead and warcraft.wiki.gg. The anchors are UTC, with no daylight-saving shift. US and EU are well confirmed; Korea and Taiwan mostly are not.

| Kind | Events | What the research found |
|---|---|---|
| **Fully fixed: time and zone** | Community Feast (done in PR #352) | Every 5400 s, 900 s of cooking; US 00:00, EU 01:00, KR/TW/CN 00:30 confirmed by three addons and the daily resets. |
| | BfA Faction Assaults (6 zones) | Every 68400 s, active 25200 s. The zone follows a fixed order: Drustvar, Zuldazar, Tiragarde Sound, Nazmir, Stormsong Valley, Vol'dun. The US and EU anchors held from 2019 to 2024. |
| | Siege on Dragonbane Keep (Gathering, Active) | Every 7200 s at one place; NA and Asia on odd UTC hours, EU on even ones. The Active phase's length needs one look in game. |
| **Fixed clock, the zone or variant not known** | Theater Troupe (5 shows) | A show every 3600 s from :00, lasting 600 s. Which show plays: random by one guide, a fixed 5-hour chain by commented-out code. |
| | Researchers Under Fire (2 variants) | Every 3600 s from :30, 1500 s; NA and EU sure, Asia conflicting. Which variant: unknown. |
| | Dreamsurges (4 zones) | A portal every 1800 s; the zone changes at the weekly reset, in an order only a forum post gives. |
| | Grand Hunts (4 zones) | A new hunt every 7200 s; no source computes the zone. |
| | N'Zoth assaults (Uldum, Vale) | N'Zoth itself weekly, the minor assaults every 302400 s, from the weekly reset (`C_DateAndTime.GetSecondsUntilWeeklyReset`). Which minor comes first and where the cycle stands now: to see in game. |
| | Maw covenant assaults (4) | Every 302400 s back to back from the weekly reset, in the fixed order Kyrian, Venthyr, Night Fae, Necrolord. Where the cycle stands now: to see in game. The POI only shows after Chains of Domination chapter 2. |
| | Fyrakk Assaults (2 zones) | The zone changes at the weekly reset; within the week the bosses come from player contribution. |
| **Fixed start, end set by players** | Time Rift, Superbloom, Azerothian Archives (the Big Dig) | Start every 3600 s: Time Rift and Superbloom at :00, the Big Dig at :30. They end on a boss kill or the event's progress, so a schedule gives the Next and Soon phases exactly and only an upper bound for Active. |
| **Fixed window, random content** | Primal Storms (44 rows: 4 storm types at 11 places) | A 7200 s window every 10800 s; the place and the element are chosen by the server. |
| **No reliable clock** | Legion Assaults (4 zones) | Blizzard changed the cycle in November 2025 (Legion Remix): 52200 s by one addon, 66600 s by older code, 18 h by the wiki. The zone looks random. |

None of these is in Blizzard's event scheduler.

**Checked against the game.** At the probe's time, 14:53 UTC on 2026-10-21 on an EU realm, the research's schedules agree with the POIs to within a minute:
- **Siege:** Active until 15:00:00 by the schedule, 15:00:57 by the POI.
- **Researchers Under Fire:** until 14:55:00 by the schedule, 14:55:12 by the POI.
- **Primal Storms:** the window was open, with a storm up.
- **Between windows, as the schedules say:** BfA Faction Assaults (next: Drustvar at 16:00 UTC) and Legion Assaults (next about 18:00 UTC on the 52200 s cycle). A probe after those times confirms them.

## Affected users and systems
- **Players:** Retail players with event reminders on, the default: pop-ups, chat messages and side buttons for the events above.
- **Options:** Options > Event Reminders > World Events and Widget Events, the per-event toggles, which keep their ids or migrate.
- **Code and data:** `Data/CustomWorldEventTimers.lua`, `Data/CustomWidgetEventTimers.lua` and `Data/EventData.lua`, and the event data rows of Legion to The War Within.
- **Tests:** the memory and events suites.
- **Not affected:** Classic, which has calendar events only. The ElvUI, GW2_UI and EllesmereUI plugins skin the frames and are not touched.

## Constraints
- **No reminder is lost** without Krowi deciding so per event: an event KAF cannot compute keeps the read it has today or is dropped by Krowi's choice.
- **The memory rules hold:** a refresh allocates nothing on a run where nothing changed (`memory` suite, `background-jobs` lint rule).
- **No taint;** the POI and widget APIs stay read-only.
- **Saved toggles survive** a change of an event's id.
- **No new CurseForge strings** where the game names the event.
- **Weekly events follow the game's reset** (`GetSecondsUntilWeeklyReset`), not a hard-coded weekday.

## Open questions
- **The events with a fixed clock but an unknown zone or variant:** time from the schedule and the name from a POI read, or log the rotation in game until it is confirmed and then go fully fixed?
- **The events that end on a kill:** show the upper bound, or keep a read for the end?
- **Legion Assaults and the Primal Storms:** keep their POI reads as they are, or drop them?
- **Korea and Taiwan:** without a player there, use the anchors the addons agree on, or leave those regions on the reads?
- **Upcoming reminders:** with every next start known, should older events also get "upcoming" reminders, or stay "going on" only?
- **The id corrections:** for Dreamsurges and Theater Troupe, keep the saved toggles of the ids that change.