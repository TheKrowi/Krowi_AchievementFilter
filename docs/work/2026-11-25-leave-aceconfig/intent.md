# Intent: Stop loading AceConfig and AceDBOptions, with proof that no setting moves
Author: Krowi (maintainer). Source: idea, 2026-11-25. Status: draft

## Problem
The third item of leaving Ace (`docs/backlog.md`, "Leaving Ace"). The first two took out AceTimer, AceSerializer and AceEvent (docs/work/2026-11-25-unused-ace), then AceGUI and AceConfigDialog (docs/work/2026-11-25-leave-acegui). What KAF still loads besides AceDB:
- **AceConfig** (its registry, its cmd part and `AceConfig-3.0.lua`). It serves only as a name lookup for the option tables. The options window reads the tables itself (`Options/Window/Source.lua`).
  - Six registrations: `Options/General.lua:12`, `Options/Layout.lua:12`, `Options/Profiles.lua:20`, `Options/Plugins.lua:9`, `Options/Credits.lua:11`, `Features.lua:111`.
  - Four reads: `Api/API.lua:164` (`KrowiAF_GetOptions`), `Data/Data.lua:134`, `Options/General.lua:17`, `Options/Layout.lua:1522`.
  - The `options-registered` test (`Tests/Options.lua:200`).
- **AceDBOptions**: `Options/Profiles.lua:11-18` builds two profile tables that nothing shows. The window draws the Profiles section on AceDB's own API (`Source.lua`, `ProfileOptions`). Krowi kept it for this item (docs/work/2026-11-25-unused-ace, design gate).

Krowi's condition for the whole move: "users CAN'T lose their settings". This item touches the options code for the first time: `Profiles.lua` also creates the filters database (`addon.Filters:Load()`, `:15`), and the registry sits in the options boot. So it builds the proof first, on the code as it is.

## Proposed outcome
- KAF loads no AceConfig and no AceDBOptions. AceDB is the only Ace library left.
- Every player's settings, profiles, filters, search options and tabs read and work exactly as before, on every client. That holds after the upgrade, and after a downgrade to 106.0.
- The options window, `KrowiAF_GetOptions` and the plugin API work as before.
- A set of saved-settings tests guards this item, and any later change to the option definitions, against moved keys, changed defaults and lost profiles.

## Affected users and systems
- Every player, on Retail, Mists and Titan.
- Saved variables `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` (AceDB) and `KrowiAF_SavedData` (tabs). None may change.
- The options boot: `Options/*.lua`, `Features.lua`, `Api/API.lua`, `Data/Data.lua`.
- The public `KrowiAF_GetOptions.GetTable` (used by the EllesmereUI and ElvUI plugins, and possibly by other addons), `KrowiAF.UtilApi.InjectOptions` and `KrowiAF.PluginsApi`.
- The `options` suite and the headless options environment, which fakes the AceConfig family today.

## Constraints
- No player loses a setting: no saved key, default, saved variable, profile or migration changes.
- AceDB stays (see the open question).
- Krowi_Util is not edited.
- The option tables keep their shape. Rewriting them is the separate, optional "native format" item.

## Open questions
- How much of the saved-settings proof does this item build: all of it, or only what its own change needs?
- Does AceDB stay for good? It was recommended in the first draft but never decided.