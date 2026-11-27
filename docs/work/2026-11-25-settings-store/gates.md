# Gates: 2026-11-25-settings-store
Class: saved-data

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-25 | scope | What's next: release 106.1, start the migration design, or the kit fixes? | Release 106.1 first | "Start the migration design" | other |
| 2026-11-27 | scope | Release 106.1 before the migration? | Release 106.1 first | "there is no push to release so we keep going in this version"; Krowi_Reminders "is an out of scope addon and can break, we do not maintain it right now" | other |
| 2026-11-27 | design | Scopes: account, profile, character (overview page, Example 6) | First guess as drawn | "scope, account profile, charater look fine" | accept |
| 2026-11-27 | design | Filters: in the main profile or per-character state? | (none, two options shown) | "filters should keep their own profiles separate from options" | other |
| 2026-11-27 | design | How long the old saved variables stay | "a release or two" | "stay declared in the .toc and untouched until I say so, probably until the new expansion 13.0" | other |
| 2026-11-27 | scope | DataIntegrityManager | Settings migrations leave it; it keeps the saved data | "needs to be studied in more detail and should fully migrate to the new system too ... maybe we can retire it and accept some old returning users will lose their settings" | other |
| 2026-11-27 | design | Key naming: flat by owner or nested per owner | Flat, PascalCase | "Key naming industry standard" | other |
| 2026-11-27 | scope | How far in this release | (none, two options shown) | "everything inn106.1, probably making it a 107.0" | other |
| 2026-11-27 | design | Store home: KAF or Krowi_Util | KAF first | "KAF first like we did with the options rework" | accept |
| 2026-11-27 | design | Where the five search toggles go | With the filters' profiles | "search toggles go to filters" | accept |
| 2026-11-27 | scope | Retire the DataIntegrityManager into one migration runner for every saved variable, carrying its four steps over, no loss accepted | Carry them over | "DataIntegrityManager ok" | accept |