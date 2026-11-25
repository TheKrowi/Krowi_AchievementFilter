# Intent: One settings store of the addon's own, in a layout that follows the features
Author: Krowi (maintainer). Source: idea, 2026-11-25. Status: draft

## Problem
The last step of leaving Ace3 (`docs/backlog.md`, "Leaving Ace"). In Krowi's words: "i also want to explore a data migration at the same time to re-organize setting and move user settings", as "One migration, with the AceDB swap", with AceDB "Replace it later" (gates of docs/work/2026-11-25-leave-aceconfig).

Today the settings live in three AceDB databases, each with profiles of its own ([inventory.md](inventory.md) has every option and its saved path):
- **`KrowiAF_Options`**: the options.
  - 31 top-level keys per profile on Retail, many of them single flags (`CenterHeader`, `ShowMinimapIcon`, `EnableDebugInfo`).
  - Grouped by the old option pages, not by what the options window shows. The Tooltips section writes under `AchievementPoints`, `Achievements` and `Tooltip`. The Window section writes under eight top-level keys. The features' settings sit partly under `Features`, partly under their old keys (`Popout`, `RightClickMenu`, `EventReminders`, `Achievements.*`).
- **`KrowiAF_Filters`**: the achievement window's filters per tab, with profiles of their own and a profile section of their own in the options window.
- **`KrowiAF_SearchOptions`**: the five search toggles, with profiles of their own and no profile UI at all.

Behaviour the store gives today, which the addon relies on:
- AceDB's profiles, with a per-character choice of profile.
- AceDB's rule of not saving a value equal to its default. `Data/DataIntegrityManager.lua:73-88` and the feature switches rely on it.
- Its profile callbacks, and its defaults filled in on demand.

## Proposed outcome
- **One store of the addon's own replaces AceDB.** Every player's settings move into it once, in a new layout that follows the features and the options window's sections.
- **Nothing is lost:** every player's value of every setting, filter and search option ends up at its new place, in every profile, with each character's choice of profile kept.
- **The options window, the filters and the search work as before.** Players see no difference except where Krowi decides one (for instance one profile for settings and filters).
- **No way back is needed:** no downgrade to the old layout (Krowi, 2026-11-25).

## Affected users and systems
- Every player, on Retail, Mists and Titan.
- The saved variables `KrowiAF_Options`, `KrowiAF_Filters` and `KrowiAF_SearchOptions`, and whatever replaces them.
- Every option's get and set (about 200 definitions, 359 options on Retail and 255 on Classic), the filters (`Filters.lua`), the search options, and the feature registry's switches and defaults (`Features.lua`).
- `Data/DataIntegrityManager.lua` and its numbered solutions.
- The options window's Profiles section.
- The plugins and `KrowiAF_GetOptions`, which reach into the option tables.
- Krowi_Util's `Options/Options.lua`, which makes the AceDB database for KAF and other Krowi addons.
- The saved-settings proof (docs/work/2026-11-25-leave-aceconfig), which this item extends: every old value found at its new place.

## Constraints
- **No player loses a setting**, in any profile.
- One migration, run once per account, and safe to run again: an interrupted migration must not leave half the settings moved and the rest lost.
- No downgrade path.
- Krowi_Util is shared with other Krowi addons. A change to it goes through `Krowi_Libraries` and its own release, or KAF stops using that part of it.

## Open questions
- What should the new layout follow: the options window's sections, the features, or one key per option?
- Do settings, filters and search options share one profile system, or keep their own?
- Does the store keep AceDB's rule of not saving a value equal to its default (so a later default change reaches players who never changed it), or save every value?
- Where does the store live: in KAF, or in Krowi_Util as AceDB's replacement for every Krowi addon?
- Does the option definitions' native format (`docs/backlog.md`) come in the same release, since it rewrites the same paths?