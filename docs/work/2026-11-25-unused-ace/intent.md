# Intent: Stop loading the Ace libraries nothing uses
Author: Krowi (maintainer). Source: idea, 2026-11-25. Status: draft

## Problem
KAF loads Ace3 libraries that do nothing for the player:
- **AceTimer:** no caller. `C_Timer` replaced its last uses, the event reminders' refresh, in 53bb49ab (2026-01-18).
- **AceSerializer:** no caller, ever. The Data Manager's character export has used LibSerialize with LibDeflate since it was built (358223a2 and 97347c57, 2023-11-16 to 18), the commit that added AceSerializer.
- **AceEvent:** its last messages went in 63c0b423 (2022-07-21). It is embedded in `addon.Event` (`Krowi_AchievementFilter.lua:5-6`), whose one caller is the test runner (`Tests/Tests.lua:527`). The addon's events all go through frames' `RegisterEvent`.
- **AceDBOptions:** `Options/Profiles.lua:11-18` builds its two profile tables, but nothing shows them. Since 105.0 the options window draws the Profiles section on AceDB's own API (`Options/Window/Source.lua`, `ProfileOptions`).

This is the first of several work items that take KAF off Ace (see `docs/backlog.md`, "Leaving Ace"); the AceGUI one comes next.

## Proposed outcome
KAF no longer loads these four libraries. Players see nothing change: the same settings, the same profiles section and the same options window, on every client.

## Affected users and systems
- Every player, on Retail, Mists and Titan.
- `Libs/Files.xml` and the four library folders.
- `Krowi_AchievementFilter.lua`, `Tests/Tests.lua` and `Options/Profiles.lua`, which also creates the filters database (`addon.Filters:Load()`, `:14`).
- The headless options environment's skip list.

## Constraints
- No player loses a setting: no saved key, default or saved variable changes, and the filters database is created at the same point of the boot.
- AceDB and CallbackHandler stay (AceDB and LibDBIcon need them).
- Krowi_Util is not edited.

## Open questions
- Does AceDBOptions belong here (built but never shown), or with the AceConfig work item later?