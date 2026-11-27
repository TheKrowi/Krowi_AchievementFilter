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
| 2026-11-27 | design | (unprompted correction) How long the old saved variables stay | Untouched until Krowi says so (Krowi's earlier answer) | "can be cleared once the migration is succesful after a check. migrate, check, if ok, clear the tables so the user has no "polluted" files. this should only run once offcourse" | other |
| 2026-11-27 | intent | Accept the intent so the spec can start? | Accept | "Accept (Recommended)" | accept |
| 2026-11-27 | design | Approve the spec and the key names (filters and search as objects, inner shape unchanged)? | Approve | "how sure the spec is not forgetting anything, was it checked with an advisor, other explorer agents or will this happen during implementation? either way, go ahead" | accept |
| 2026-11-27 | design | A failing in-game check | Retry failed values only | "Retry failed values only (Recommended)" | accept |
| 2026-11-27 | design | Which profile's Advanced switches become the account's | First character's profile | "First character's profile (Recommended)" | accept |
| 2026-11-27 | scope | Remove the KrowiAF_SavedData keys no code reads | Remove them | "Remove them (Recommended)" | accept |
| 2026-11-27 | plan | Approve the plan so step 1 starts? | Approve | "compact before approval", then after the compact: "start implementing" | accept |
| 2026-11-27 | plan | (decision taken without asking, with the advisor) Build order: rows and readers before the switch, against an AceDB-backed mode of the store, so every step stays green and `saved-keys-unchanged` keeps proving each row's key; the switch to the real store comes after them. Behaviour unchanged. | Reorder | (not asked; told to Krowi in the next message) | other |
| 2026-11-27 | plan | Turn clearing on now (step 12)? | Turn it on, run step 12 | "KrowiAF_Options, KrowiAF_Filters and KrowiAF_SearchOptions should remain in the toc, just set to nil. this way in x months, returning players still can get their old stuff migrated. removing them from the toc would break migration" (the code already does this: the `.toc` keeps all three and the clear sets them to nil; the go for step 12 asked again) | other |
| 2026-11-27 | design | Keep the option rows' limits on the rows instead of in the declarations (requirement 10)? | Keep them on the rows | "show me what you hit on" (examples shown; asked again) | other |
| 2026-11-27 | design | A retry after a failed check may move a failed filter value again over a change the player made since | Accept it | "Accept it (Recommended)" | accept |
| 2026-11-27 | plan | Turn clearing on and run step 12 (the old variables stay on the .toc, set to nil)? | Go | "Go: clearing on, step 12 (Recommended)" | accept |
| 2026-11-27 | design | The option rows' limits: keep on the rows, move min/max/step, or move all with the choices as numbers | Keep them on the rows | "pose each topic in a chat message i can reply to and not a pop up like this one." (asked again in chat) | other |
| 2026-11-27 | design | The option rows' limits (asked again in chat) | Keep them on the rows | "sliders can go in declaration, this is a no brainer it seems. dropdowns got string names in the past cause it made sense, I want to dig deeper on this one, how does blizz manage this and how do they manage translations? do not do anything to this one related yet" | other |