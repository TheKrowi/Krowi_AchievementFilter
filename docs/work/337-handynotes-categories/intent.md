# Intent: Categories never load on Retail with HandyNotes: Dragonflight enabled
Author: Brirdy (player, Retail, deDE client), reported on Discord; written up by Krowi (maintainer) as the issue. Source: GitHub issue #337. Status: accepted

## Problem
On Retail, with HandyNotes: Dragonflight enabled, the achievement window never gets past "Categories not loaded":
- It shows "Krowi's Achievement Filter ist noch nicht vollständig geladen. Schließ das Erfolgsfenster und öffne es erneut, um die angezeigten Kategorien zu aktualisieren."
- The category list on the left stays empty, so no category can be selected and the addon cannot be used.
- Closing and reopening the window does not help, and changing the filters does not help either.
- No Lua errors are reported.

The player narrowed it down to HandyNotes: Dragonflight: with that addon disabled, everything works.

The trigger was never reproduced (enUS, 2026-10-13), and the reporter's details, asked for on Discord on 2026-10-17, have not come. What the code does show is that one failing step anywhere early in the login data load leaves every tab without categories for the whole session, with nothing the player can see. On 2026-11-27 Krowi chose to fix that weakness now, without waiting for the trigger.

## Proposed outcome
- A failure in one piece of the addon's data no longer makes the whole addon unusable. The rest loads, and the window works with what loaded.
- The failure is reported with its cause, so the next report like this one names what broke, instead of the player seeing a message that asks them to reopen the window.

## Affected users and systems
- Every client the addon loads on (Retail, Mists Classic, Wrath Titan): the login data load is shared code.
- The achievement window: every tab's category list, the special categories (Summary, Watch List, Current Zone, ...), and the steps that run at login after the load starts (the micro button, the Y binding move, the setup of Blizzard's achievement window when it is already loaded).
- Players with an error display (BugSack, or the game's Lua error setting) and players without one.
- Other addons: HandyNotes and HandyNotes: Dragonflight (v156 at the report; 173 now), which embeds `Krowi_WorldMapButtons-1.4` (minor 9), a library this addon also ships (minor 11).
- No saved variables or data files change.

## Constraints
- HandyNotes: Dragonflight is not ours to change.
- No new taint. The login load runs outside any Blizzard frame and must stay that way.
- A normal login stays as fast as today and allocates nothing more per data entry.
- Classic and the plugin integrations keep working unchanged.

## Open questions
- What makes the load fail with HandyNotes: Dragonflight on a deDE client stays unknown. This work does not answer it; it makes the answer visible.
- Whether the player should get a message of their own when part of the data failed, on top of the game's error display.