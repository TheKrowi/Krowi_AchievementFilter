# Intent: Leave the Ace libraries the options window no longer needs
Author: Krowi (maintainer). Source: idea, 2026-11-25. Status: draft

## Problem
Since 105.0 (docs/work/2026-10-25-options-revamp) the options window is drawn by Krowi_Options, not by AceConfig. KAF still ships most of Ace3 for it:
- **AceConfig** (with Registry, Dialog and Cmd) and **AceDBOptions** still hold every option as a table, but nothing draws them anymore. The window reads those tables directly (`Options/Window/Source.lua`), and the registry is only used to look a table up by name.
- **AceGUI** is loaded for AceConfigDialog and for two text boxes in the Data Manager.
- **AceTimer**, **AceSerializer** and **AceEvent** are loaded but unused. `C_Timer` replaced AceTimer (53bb49ab, 2026-01-18). The character export has always used LibSerialize with LibDeflate (97347c57, 2023-11-18), never AceSerializer. AceEvent's last messages went in 63c0b423 (2022-07-21), and its one caller is now the test runner (`Tests/Tests.lua:527`).

So every player loads six libraries (nine with AceConfig's parts) that do nothing visible, and the code keeps an AceConfig shape that no longer matches the window. The revamp spec planned a "stage 2" for this, written before Krowi_Options was a library and before the feature registry existed.

## Proposed outcome
- KAF no longer loads AceConfig, AceDBOptions, AceGUI, AceTimer, AceSerializer and AceEvent.
- Every player's settings, profiles, filters, search options and tabs read and work exactly as before, on every client. This holds after upgrading, and after downgrading to 106.0 again.
- The options window looks and works the same. The Data Manager's text boxes use the game's own look.

## Affected users and systems
- Every player on every client KAF loads on (Retail, Mists, Titan).
- Saved variables `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` (AceDB, which stays) and `KrowiAF_SavedData` (tabs). None may change.
- The options tables in `Options/`, `Api/TabDataApi.lua`, `Features/*/Options.lua`, `Plugins/`, `Data/SpecialCategories.lua` and `Gui/WindowFrames/AchievementFrameHeader.lua`.
- Public API `KrowiAF_GetOptions.GetTable`, `KrowiAF.UtilApi.InjectOptions` and `KrowiAF.PluginsApi`, used by the in-repo plugins and possibly by other addons.
- The Data Manager (character export and import, the log tab, the Map Verifier export) and its ElvUI and EllesmereUI skins.
- The `options` suite and the headless options environment, which fake the AceConfig family today.

## Constraints
- **No player loses a setting.** No saved key moves, no default changes, no migration runs, and no saved variable is added or removed.
- AceDB stays: it owns the saved layout and the profiles.
- Krowi_Util is not edited. Its `Options/Options.lua` names AceConfigDialog and AceDBOptions only on paths KAF does not take.
- The plugins keep their groups and notes.
- No taint. The work is independent of the feature split.

## Open questions
- Should the option definitions also leave the AceConfig shape (a native format), now or as a later work item?
- Should AceDB stay?
- What should replace the Data Manager's two AceGUI text boxes?