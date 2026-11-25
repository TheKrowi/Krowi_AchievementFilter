# Intent: Stop loading AceGUI and AceConfigDialog
Author: Krowi (maintainer). Source: idea, 2026-11-25. Status: draft

## Problem
The second item of leaving Ace (`docs/backlog.md`, "Leaving Ace"; the first was docs/work/2026-11-25-unused-ace). KAF loads AceGUI, Ace3's widget library (23 Lua files), for two things:
- **Two text boxes in the Data Manager**, both AceGUI `MultiLineEditBox` widgets:
  - the text window (`KrowiAF_TextFrame`): character export and import, the Map Verifier's CSV export and import, and the debug exports in Advanced (missing and removed achievements, taint diagnostics, CSV);
  - the read-only log tab, Retail only, in debug mode.
- **AceConfigDialog**, which draws AceConfig tables as Blizzard Settings pages and requires AceGUI when it loads (`AceConfigDialog-3.0.lua:7`). KAF stopped adding such pages in 105.0, when the options window replaced them, so nothing calls it but a test.

## Proposed outcome
- KAF no longer loads AceGUI or AceConfigDialog.
- The Data Manager's text boxes are the game's own scrolling text box, with the game's scroll bar, on every client.
- Every export, import and the log work as before: the text shows, scrolls, can be selected and copied, a pasted import goes in whole, and the log can't be edited.

## Affected users and systems
- Players who export or import characters in the Data Manager (Retail, Mists, Titan).
- Debug-mode users of the log tab (Retail) and of the Advanced exports and the Map Verifier (Krowi).
- The ElvUI and EllesmereUI skins of the text window.
- `Libs/Files.xml`, `Libs/AceGUI-3.0/` and `Libs/AceConfig-3.0/AceConfigDialog-3.0/`. The AceConfig registry stays until the AceConfig item.
- The `options` test that counts Settings pages, which asks AceConfigDialog.

## Constraints
- No player loses data. The character import writes `KrowiAF_SavedData.CharacterList` and the achievement data, so the text the import reads must be exactly the text pasted.
- No settings, options or saved-variable code changes.
- No taint: the boxes are addon frames.
- Krowi_Util is not edited. Its `options:Open` names AceConfigDialog, but KAF replaces that function.

## Open questions
- How should the Data Manager's boxes look: the game's plain look, or with a border like today's?
- Where does the in-game check of the text window live?