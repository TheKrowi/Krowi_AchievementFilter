# Intent: Categories never load on Retail with HandyNotes: Dragonflight enabled
Author: Brirdy (player, Retail, deDE client), reported on Discord; written up by Krowi (maintainer) as the issue. Source: GitHub issue #337. Status: draft

## Problem
On Retail, with HandyNotes: Dragonflight enabled, the achievement window never gets past "Categories not loaded":
- It shows "Krowi's Achievement Filter ist noch nicht vollständig geladen. Schließ das Erfolgsfenster und öffne es erneut, um die angezeigten Kategorien zu aktualisieren."
- The category list on the left stays empty, so no category can be selected and the addon cannot be used.
- Closing and reopening the window does not help, and changing the filters does not help either.
- No Lua errors are reported.

The player narrowed it down to HandyNotes: Dragonflight: with that addon disabled, everything works. HandyNotes and its Dragonflight plugin are widely used, so any player with both is likely to hit this.

## Proposed outcome
- The categories load and the window works with HandyNotes: Dragonflight enabled, as it does without it.
- If the addon's data load ever fails, the player sees an error that names the cause, not a message that asks them to reopen the window. The message currently implies the load is only slow.

## Affected users and systems
- Retail; reported on a deDE client. Whether Classic is affected is unknown: HandyNotes: Dragonflight is Retail only.
- The achievement window: every tab's category list.
- The login data load (`PLAYER_LOGIN`), which builds the categories every tab and special category depends on.
- Other addons: HandyNotes and HandyNotes: Dragonflight (v156, the latest release, 2026-09-15). That plugin embeds `Krowi_WorldMapButtons-1.4` (minor 9), a library this addon also ships (minor 11).
- No saved variables, options or data files are known to be involved.

## Constraints
- HandyNotes: Dragonflight is not ours to change. The fix lives in this addon, or in the shared `Krowi_WorldMapButtons` library upstream if that turns out to be the cause.
- No new taint. The login load runs outside any Blizzard frame and must stay that way.
- Classic and the plugin integrations keep working unchanged.

## Open questions
- What stops the load? It has not been reproduced yet. The maintainer's install has the same HandyNotes: Dragonflight version, but on an enUS client.
- Is it tied to the deDE client or to a particular combination of HandyNotes plugins?
- Should a failed load surface its error to the player, and should the loading message say what to do when the load does not finish?