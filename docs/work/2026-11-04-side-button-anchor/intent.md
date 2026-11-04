# Intent: Side buttons error after their anchor changes
Author: Krowi, maintainer. Source: in-game error, from `docs/backlog.md` (options window work, 2026-10-25). Status: accepted

## Problem
When a player changes the event reminders' *Side Button Anchor* (achievement window or world map), the next time the newly chosen window opens, each side button that was showing an event gives a Lua error: `AlertFrameMixin.lua:59: attempt to index field 'Event' (a nil value)`. This was seen on Retail 12.1.5 on 2026-10-25, seven times in one session, after `/kaftest options` changed the setting and `/kaftest escape` opened the achievement window. 105.0 sends every player to the new options window, so more players will change this setting.

## Proposed outcome
Changing the side buttons' anchor gives no error, and the side buttons show the current events on the window they are anchored to.

## Affected users and systems
- Every client KAF runs on: Retail, and Mists, Cata and Wrath Classic. The side buttons load on all of them.
- The option *Event Reminders > Side Button Anchor* (`EventReminders.SideButtonsAnchor`, default 1, the achievement window).
- The achievement window and the world map, which hold the side buttons.
- The ElvUI, GW2_UI and EllesmereUI plugins, which skin the side buttons through hooks on the side button system.
- No saved variable changes.

## Constraints
- No new taint: hook Blizzard's frames only with `hooksecurefunc`, and add no field to them.
- The plugins' hooks on `Load` and `Refresh` keep working.
- The fix ships in 105.0, so it stays small.

## Open questions
- Fix only the error, or also the hooks that pile up with every anchor change? See the spec.