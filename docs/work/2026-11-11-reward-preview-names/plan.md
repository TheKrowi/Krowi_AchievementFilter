# Plan: Reward preview's names and descriptions for their section
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `Localization/<lang>.lua`, all 11: the new phrases `Preview on Mouseover`, `Starting Width`, `Starting Height` and `Help Rewards Intro No Icon` below the "Exported at" line; the five changed descriptions in place, or below that line where a language had no translation yet (esES, esMX, itIT, koKR, ptBR, zhTW); `Show on Mouseover`, `Width` and `Height` removed.
- `Features/RewardPreview/Options.lua`: the three names by their new keys; the descriptions lose `:K_ReplaceVars(L["Reward Preview"])`, since no text keeps `{rewardPreview}`.
- `Features/RewardPreview/Help.lua`: the intro becomes a function of Show Icon on Achievements.
- `Options/Window/Help/Help.lua`: `Text` takes a function, Pop Out's hunk byte for byte.
- `_Packaging/Changelog.md`: the 106 Changed line, and a Fixed line for the help.

## Order of work
1. Locale files with one PowerShell pass from a JSON of the texts (UTF-8 without BOM, CRLF kept, no final newline).
2. The code's keys, the help intro.
3. The changelog.
4. The key greps, the `options`, `help` and `features` suites headless, `Check-Repo.ps1 -ChangedOnly`.
5. Commit, deploy to Retail, `/kaf rewards` for Krowi's look; the full suites only after Krowi approves it; then the PR and the CurseForge export.

## Risks
- A key renamed in the code but missing from a locale file shows the key: the greps count every key in all 11 files.
- `Help.lua`'s `Text` differs from Pop Out's by a byte: the second merge conflicts there. The hunk is copied from Pop Out's branch.
- Pop Out's branch adds `Starting Width` with the same translations below the same line: the second merge keeps both blocks and one `Starting Width`.

## Proof
- No `L["Show on Mouseover"]`, `L["Width"]` or `L["Height"]` left in any `.lua` file; each of the nine new or changed keys in all 11 locale files.
- `run-tests.lua options`, `help`, `features`: green on Retail and Classic.
- `Check-Repo.ps1 -ChangedOnly`: 0 errors, 0 warnings.
- In game: the names, the hover texts, and the help intro with the icon on and off.

## Departures from the plan
- This plan was written after the build: a `fix/logic` plan is routine, and the review page with Krowi's answers was the design.