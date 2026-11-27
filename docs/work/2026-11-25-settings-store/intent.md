# Intent: One settings store of the addon's own, and one migration runner for every saved variable
Author: Krowi (maintainer). Source: idea, 2026-11-25; design answers 2026-11-27 ([gates.md](gates.md)). Status: draft

## Problem
The last step of leaving Ace3 (`docs/backlog.md`, "Leaving Ace"). In Krowi's words: "i also want to explore a data migration at the same time to re-organize setting and move user settings", as "One migration, with the AceDB swap" (gates of docs/work/2026-11-25-leave-aceconfig).

Today the settings live in three AceDB databases, each with profiles of its own ([inventory.md](inventory.md) has every option and its saved path):
- **`KrowiAF_Options`**: the options.
  - 31 top-level keys per profile on Retail, many of them single flags (`CenterHeader`, `ShowMinimapIcon`, `EnableDebugInfo`).
  - Grouped by the old option pages, not by what the options window shows. The Tooltips section writes under `AchievementPoints`, `Achievements` and `Tooltip`. The Window section writes under eight top-level keys. A feature's switch, its settings and its modifier sit in different places (Pop Out: `Features.PopOut`, `Popout.*`, `Achievements.Modifiers.PopOut`). Two settings are both named `CenterHeader`.
  - Lists of toggles are one option each: 213 event reminder options on Retail, 62 on Classic; 40 adjustable category options.
  - Debug and diagnostics switches follow the profile.
- **`KrowiAF_Filters`**: the achievement window's filters per tab, with profiles of their own and a profile section of their own in the options window.
- **`KrowiAF_SearchOptions`**: the five search toggles, with profiles of their own and no profile UI, so in practice every character uses `Default`.

The code reaches the settings directly: about 715 reads of `db.profile` in 88 files (2026-11-27). Getters, setters and limits are built by hand per option row, against the old paths.

Schema changes go through `Data/DataIntegrityManager.lua`. It compares the saved build and version, runs numbered solutions on every update (each guarding itself with a flag in `KrowiAF_SavedData.Fixes`) and verifications on every load. Today it holds four steps: the Legion Assaults merge (settings, 104.0), clearing the pop-ups' old position copy (`KrowiAF_SavedData.AlertSystem`, 105.0), filling a character's name and realm from its GUID (`KrowiAF_SavedData.CharacterList`), and dropping account-wide achievements from per-character records once (`KrowiAF_Achievements`). Krowi removed its 30 older solutions on 2026-04-19.

## Proposed outcome
Settings are built the way most applications build them (overview page: https://claude.ai/artifact/66JkVF9vXn5abLaMoSwobj):
- **Declared once.** Each setting has one declaration: key, type, default, limits, scope. Option rows name the key; the options window takes the getter, setter, limits and default text from the declaration.
- **Flat keys, the common standard** (Krowi: "Key naming industry standard"): dotted lower camelCase named by the owning feature or core area, as VS Code does (`popOut.closeOnEarn`, `window.centerHeader`, `eventReminders.events`). Moving a row to another section changes no saved data.
- **Only changed values are saved.** A missing key always means the default; reset deletes the key.
- **Lists of toggles are one map setting** with one default for every entry; only the entries that differ are saved.
- **Scopes** (Krowi: "look fine"): account (the Advanced section's debug and diagnostics switches), profile (almost every option, the feature switches), character.
- **Two profile systems, as today** (Krowi: "filters should keep their own profiles separate from options"): options profiles, and filter profiles that also hold the five search toggles (Krowi: "search toggles go to filters"). Each character keeps its choice of each.
- **Code reads through one interface**: `Get`, `Set`, `Reset` and change events per key. A profile switch fires the events for every key that differs, replacing AceDB's profile callbacks.
- **One migration runner for every saved variable** (Krowi: "DataIntegrityManager ok"). Each saved variable gets a version number; numbered migrations run once each, in order, building the new layout aside and putting it in place only when all succeeded. Migration 1 moves AceDB's three databases into the new layout and carries over the DataIntegrityManager's four steps. The DataIntegrityManager, its build and version comparison and its `Fixes` and `Verifications` flags retire.
- **The store lives in KAF** (Krowi: "KAF first like we did with the options rework"); KAF stops using Krowi_Util's options and AceDB leaves `Libs/`. Other Krowi addons are unaffected.
- **All of it in the next release**, the option rows rewritten to keys included (Krowi: "everything inn106.1, probably making it a 107.0").

## Affected users and systems
- Every player, on Retail, Mists and Titan.
- The saved variables `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` (read once, then left untouched) and their replacements; `KrowiAF_SavedData` and `KrowiAF_Achievements` (now under the runner).
- Every option definition (`Options/*.lua`, `Features/*/Options.lua`, `Plugins/`), the feature registry's switches and defaults (`Features.lua`), `Filters.lua`, `SearchOptions.lua`, and the readers across the addon.
- The options window's Profiles section (options and filter profiles).
- `Data/DataIntegrityManager.lua` and `Tests/Schedules.lua`, which tests its Legion Assaults step.
- The plugins and `KrowiAF_GetOptions`, which reach into the option tables.
- The headless saved-settings proof (docs/work/2026-11-25-leave-aceconfig), which grows from "every key unchanged" to "every old value found at its new key".

## Constraints
- **No player loses a setting, a filter or a search toggle**, in any profile, and each character keeps its choice of options profile and filter profile.
- Nothing the DataIntegrityManager does today is lost: its four steps carry over.
- The migration is safe to run again: an interrupted one leaves the old data as it was, and the next login tries again.
- **The old saved variables stay declared in the `.toc` and untouched until Krowi says so**, probably until the expansion 13.0 (Krowi, 2026-11-27).
- No downgrade path (Krowi, 2026-11-25).
- Players see no difference except the debug and diagnostics switches no longer following the profile, and the search toggles following the filter profile.
- Krowi_Reminders is out of scope and may break (Krowi, 2026-11-27).

## Open questions (for the spec)
- The full rename table, old path to new key, generated from [inventory.md](inventory.md) and reviewed.
- Which lists become map settings and how their entries are keyed (one map for calendar, world and widget events, or three).
- The exact account-scope list (the minimap icon?).
- Whether a character list entry without a name errors today (the GUID step), and whether `KrowiAF_DebugTable` and `KrowiAF_MapVerifier` (debug and developer tools) join the runner.
- What `KrowiAF_GetOptions` and the plugins' settings look like once option rows name keys.