# Intent: Stop loading the Ace libraries nothing uses
Author: Krowi (maintainer). Source: idea, 2026-11-25. Status: accepted

## Problem
KAF loads Ace3 libraries that nothing calls:
- **AceTimer:** no caller. `C_Timer` replaced its last uses, the event reminders' refresh, in 53bb49ab (2026-01-18).
- **AceSerializer:** no caller, ever. The Data Manager's character export has used LibSerialize with LibDeflate since it was built (358223a2 and 97347c57, 2023-11-16 to 18), the commit that added AceSerializer.
- **AceEvent:** its last messages went in 63c0b423 (2022-07-21). It is embedded in `addon.Event` (`Krowi_AchievementFilter.lua:5-6`), whose one caller is the test runner (`Tests/Tests.lua:527`). The addon's events all go through frames' `RegisterEvent`.

This is the first of several work items that take KAF off Ace (`docs/backlog.md`, "Leaving Ace"); the AceGUI one comes next. AceDBOptions, built but never shown, waits for the AceConfig item (Krowi, 2026-11-25).

## Proposed outcome
KAF no longer loads these three libraries. Players see nothing change, on every client.

## Affected users and systems
- Every player, on Retail, Mists and Titan.
- `Libs/Files.xml` and the three library folders.
- `Krowi_AchievementFilter.lua` and `Tests/Tests.lua`.
- The headless options environment's skip list.
- No options file, saved variable or default.

## Constraints
- No player loses a setting: no options code, saved key, default or saved variable changes.
- AceDB and CallbackHandler stay (AceDB and LibDBIcon need them).
- Krowi_Util is not edited.

## Open questions
None.