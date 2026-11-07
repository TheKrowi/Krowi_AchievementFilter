# Intent: KAF's options leave Blizzard's Settings window to Blizzard
Author: Krowi (maintainer). Source: the whole-library taint review of Krowi_Options 2.0 (Krowi_Options `docs/work/2026-11-07-release-hardening/review.md`, findings 1 and 3; Krowi, 2026-11-07: "Fix it in KAF 105.0", both). Status: done

## Problem
1. **Open options in Blizzard's Settings.** Settings > AddOns > Krowi's Achievement Filter has an "Open options" button (`Options/Window/Stub.lua:30-33`). It first closes Blizzard's Settings window through `options.CloseSettingsPanel()` (`Options/Options.lua:9-14`, `SettingsPanel:Close(true)`), then opens KAF's window. Closing it that way runs Blizzard's commit from KAF's code: it saves the key bindings (`SaveBindings`, which fires `UPDATE_BINDINGS`) and commits that visit's game settings, then runs the panel's `OnHide` (a second save, the micro buttons' update), all under KAF's taint. The player sees nothing at once, but the binding displays (action-button hotkeys, micro-button tooltips) are refreshed under KAF's name for the session, the same side effect Krowi accepted for the Y binding (#197). Debug mode's screenshot mode (`Options/General.lua:66`) calls the same close.
2. **Show me for the map over Blizzard's windows.** With KAF's options window on the Maps help, an invisible secure button lies over Show me (`Options/Window/Help/ShowMe.lua`, strata DIALOG, so a click into KAF's window cannot lift Show me over it). When the player then opens Blizzard's Options window (HIGH) or the game menu, that invisible button stays above them at the Show me spot: a click there opens the world map and closes KAF's window instead of reaching Blizzard's window.

Clients: Retail and Mists (KAF's clients; the Settings stub and the map route exist on both).

## Proposed outcome
1. "Open options" opens KAF's window on top of Blizzard's Settings window and leaves that window to the player: closing KAF's window shows Settings again. Screenshot mode no longer closes it either.
2. When Blizzard's Options window or the game menu opens, the invisible map button goes away; hovering Show me again later lays it back, as it does today after the window moves.

## Affected users and systems
- Players who open KAF's options from Blizzard's Settings (AddOns) or use Show me for the map, on Retail and Mists.
- `Options/Options.lua`, `Options/Window/Stub.lua`, `Options/General.lua` (debug screenshot mode), `Options/Window/Help/ShowMe.lua`.
- No saved variables, no localization, no data.

## Constraints
- No Blizzard function is replaced and no field written on Blizzard frames; a hook on a Blizzard frame is a script post-hook (`HookScript`) only.
- Test code never opens Blizzard's Settings window or the game menu itself: that would run their code under addon taint; a real key press or click does it.
- Nothing changes in combat behaviour (the overlay's release in combat is deferred as today).

## Open questions
- How the second fix notices Blizzard's windows (a script post-hook on their `OnShow`, or something else).
- How each fix is tested first (a scenario, a lint rule, an in-game check with real input).