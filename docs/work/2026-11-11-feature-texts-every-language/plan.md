# Plan: Every feature's texts in every language
Spec: [spec.md](spec.md). Status: done

## Files that change
- `.claude/tools/Check-Repo.ps1`: the `feature-texts` rule (new lines only, also the one that makes it always-on, so no existing lint line changes).
- `Localization/` esES, esMX, itIT (32 lines each below "Exported at", 2 phrases reworded), koKR (29), ptBR (23, 2 reworded), zhTW (9); frFR and ruRU 2 phrases, deDE 1.
- `.claude/rules/localization.md` (the rule), `.claude/rules/features.md` (a feature PR proves it), `.claude/tools/README.md` (the rule's row).
- `_Packaging/Changelog.md`: one 106.0 Added line.
- Kit, after this repo's PR: one sentence in `WowAddons.md`, Localization, committed to the kit's `main` as its docs lines are.

## Order of work
1. The lint rule; run against `main`'s locale files, where it must fail (commit 48941027: 32 errors).
2. The translations, applied by key with one script (CRLF, no BOM, no final newline kept); Lua 5.1 syntax check of all 11 files.
3. The rules, the README row, the changelog line.
4. `Check-Repo.ps1 -ChangedOnly`, headless `features` and `help`, `Get-ChangeClass.ps1`, the localization report.
5. Commit, push, PR; `Sync-Localization.ps1 -Export` on Krowi's go; the kit sentence; merge on Krowi's go.

## Risks
- A translation reads wrong to a native player: CurseForge translators can correct it, and the next import brings their text back.
- The gendered phrases conflict on CurseForge: the report shows them "to send", not "in conflict".
- A key that differs only by case ("Reward preview", "Reward Preview") merged by a case-insensitive table would hide a missing text: the rule uses ordinal sets.

## Proof
- `feature-texts`: 32 errors on `main`'s files, 0 on the branch.
- `Check-Repo.ps1 -ChangedOnly`: 0 errors.
- `run-tests.lua features`: 44 passed on Retail and Classic; `help`: 6 passed.
- `Sync-Localization.ps1`: esES, esMX, itIT 34 to send, koKR 29, ptBR 25, zhTW 9, frFR and ruRU 2, deDE 1; nothing in conflict, enUS unchanged.

## Departures from the plan
- The plan was written after the build: the change class came out `harness` (locale files count as docs, so the lint rule beside them makes it harness), not `docs` as predicted, so the plan gate asks after the fact.
- The spec said no changelog line; Right-click menu and Pop Out were English in these languages before 106, so a line in the style of 105.0's "Additional ruRU and zhCN localization" was added.
- 32 texts, not 31: "Reward Preview" (the help page's title) differs from "Reward preview" only by case and was missing too.