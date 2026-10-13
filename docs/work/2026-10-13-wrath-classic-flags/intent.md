# Intent: The Wrath Classic client gets its Classic behaviour back
Author: Krowi (maintainer). Source: the taint review of 2026-10-11-latent-bugs, 2026-10-13. Status: done

## Problem
Since November 2025 the addon has treated the Wrath Classic client (interface 38002) as neither Wrath nor a Classic client with achievements.
- A Krowi_Util update removed `IsWrathClassic` and `IsCataClassic` and narrowed `IsClassicWithAchievements` to Mists (Krowi_Util `6ee1198`).
- The addon still reads those flags: 20 reads of `IsWrathClassic` (22 before 2026-10-11-latent-bugs removed two), 2 of `IsCataClassic` and 36 of `IsClassicWithAchievements`.
- So on 38002 every one of those branches takes its other side. That affects:
  - the achievement tabs and their indices, the Guild tab and the Statistics tab;
  - the header and the search box;
  - the objectives, the Wowhead link, the button textures and the floating tooltip;
  - the Data Manager and the event reminders;
  - the Wrath-only strings.

Nobody can test on that client, so the problem went unnoticed.

## Proposed outcome
The addon behaves on 38002 as it did before November 2025. Krowi supports that client and accepts releasing without an in-game check there (2026-10-13).

## Affected users and systems
- Players on the 38002 client. Retail and Mists Classic (50504) are unaffected: their flags keep their values.
- `Libs/Krowi_Util`, a separate repository embedded in this and other Krowi addons.

## Constraints
- The fix belongs upstream in Krowi_Util, not in the addon.
- Retail and Mists Classic must not change.

## Open questions
None. Krowi decided on 2026-10-13: 38002 stays supported; Claude commits and pushes the Krowi_Util change and Krowi releases Krowi_Util 2.7 later.