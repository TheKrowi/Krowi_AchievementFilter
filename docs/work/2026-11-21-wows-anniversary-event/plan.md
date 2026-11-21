# Plan: One WoW's Anniversary event with every anniversary's calendar id
Spec: [spec.md](spec.md). Status: draft

## Files that change
- `DataAddons/Retail/06_WarlordsOfDaenor/EventData.lua`: the 10th's row becomes WoW's Anniversary, the ids of requirement 1 ascending with a comment per id (name, year), `L["WoW's Anniversary"]`, group `L["Holidays"]` order 1, on by default.
- `Localization/esES.lua`, `esMX.lua`, `itIT.lua`, `koKR.lua`: `L["WoW's Anniversary"]` below `AUTOGENTOKEN`, in sorted order, worded as the game's own holiday name in that language where the game database gives it. Every locale file: `L["WoW's 10th Anniversary"]` removed.
- `.claude/skills/add-achievement-data/_lookup_holidays.ps1`: a `-Locale` parameter (default enUS), for the game's holiday names in another language.
- `.claude/tools/Check-Anniversary.ps1` (new): offline, reads the event row's id comments and the Retail achievement data's comments; from 1 October to 31 December of year Y, exit 1 with a message when no id is commented with `(Y)` or no `WoW's <N>th Anniversary` achievement (N = Y - 2004) is registered; `-Date` to test another day. `.claude/tools/README.md` gets its row.
- `.claude/release-gate.ps1`: calls it, `Pass` or `Fail` with its message.
- `.claude/tools/headless/snapshots/`: the Registries snapshot regenerated.
- `_Packaging/Changelog.md`: a line under 106.0 Added.

## Order of work
1. The data row and the locale lines, then `load-data.lua Both`, `snapshot-data.lua Both -write` and the diff read as the review.
2. The check script, tried with today's date and with `-Date 2027-10-15`; the release-gate call; the README row.
3. The changelog line; `Check-Repo.ps1` (whole tree) and the `events` suite headless.
4. In game on Retail: `Deploy.ps1 -WhatIf`, deploy, `/reload` (Krowi's PC: ask first), one reminder and side button, the side button's category, the toggle under Holidays; `Read-GameErrors.ps1`.
5. Export the locale change with `krowi:localization`, once Krowi agrees.

## Risks
- A year with two anniversary ids on the calendar at once (2024 had 1500, 1509 and 1592 to 1595 for the 20th) would give two reminders; today's calendar shows one, and the 20th has ended.
- The check reads comments, so a row id without its `(year)` comment reads as missing: the message says to add the comment.

## Proof
Requirements 1, 2 and 6 by the snapshot diff; 3 in game; 4 by the locale diff and the `feature-texts`/locale rules of `Check-Repo.ps1`; 5 by the two script runs.