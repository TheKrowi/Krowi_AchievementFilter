# Plan: Reward preview texts in Krowi's words
Spec: [spec.md](spec.md). Status: done

## Files that change
- `Localization/enUS.lua` and the ten translated files: lines 9-20 (the #405 block below the `Exported at` line): five keys renamed to Title Case, four values rewritten, the changed texts translated.
- `Features/RewardPreview/Options.lua`: the four row names and the icon's description by their new keys; `:K_ReplaceVars(L["Reward Preview"])` on the width and height descriptions.
- `_Packaging/Changelog.md`: the 106.0 Enable line.

## Order of work
1. The code's keys, then all 11 locale files in one pass, so no file references a key another file lacks.
2. The changelog line.
3. Lint, the `features`, `options` and `help` suites headless, the key greps, the localization report.
4. Commit, push, PR; CurseForge export from the branch (translators get the strings early); the delete of the five old keys from `main` after the merge, on Krowi's approval.

## Risks
- A key renamed in the code but not in a locale file shows the key itself: the greps in step 3 and the lint's locale checks guard it.
- A translation that leaves out `{previewReward}` would name the menu entry differently from the menu: every translation keeps it.

## Proof
- `Check-Repo.ps1`: 0 errors, 0 warnings.
- `run-tests.lua features`, `options`, `help`: green.
- No old key left in `Localization/` or `Features/`; each new key 11 times in `Localization/`.
- `Sync-Localization.ps1`: enUS 5 to add, 4 to change, 5 on CurseForge only; every translated file sends its changed lines.

## Departures from the plan
- ptBR and ruRU keep their `Feature Off Help`: it already read "disabled / enable" in those languages.
- The changelog line reads "An Enable check box at the top of the Reward preview settings, which fully turns off the reward preview after a reload": the gate's wording kept a colon joining two clauses, one of the tells the texts are rid of.
- The localization report calls the four retranslated texts a conflict in every language: they did not exist at the last import (2026-10-31), so a text this morning's export put on CurseForge and this branch changed again looks changed on both sides, and `-Export` holds it back. The five renamed keys go out normally. Krowi chose an import PR first (#408, order and stamp only, merged as 180c2d52); `main` was then merged into this branch, the nine lines per file applied again by key on the new order, and `-Export` sent the 5 new phrases, the 4 changed ones and 88 translations ("CurseForge has them all" in every language).