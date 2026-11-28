# add-zone-data: reference

The detail behind Steps 1 to 3 of [SKILL.md](SKILL.md): the evaluators' output, batch edits with `_apply_zone_plan.ps1`, and the pitfalls of ad-hoc lookups.

## Evaluate-ZoneCriteria.ps1 and batch edits

`Evaluate-ZoneCriteria.ps1` is the Rule 2/3 fact-checker: its `[R2  ]` and `[R3  ]` lines are placement errors; `[D8  ]` (a criterion names a city, or an outdoor sub-map decided no, decision D8), `[D8? ]` (an outdoor sub-map not decided yet, one whose parent chain in `raw/MapVerifier.csv` reaches a map the id is on: ask the user, then add it to `$d8SubMaps` in the script) and `[R3+ ]` (meta on a map no child is on) are information. A missed map that is not inside a map the id is on is an `[R2  ]` error. For a batch of edits, write a plan file (`map,token,op` lines) and apply it with `_apply_zone_plan.ps1 -PlanFile <path>` (`-WhatIf` first): it inserts `N, -- Title` lines (titles from the cached export) or table references into the right `Zone()` block by primary map id, or removes them, and keeps CRLF. It inserts before the block's closing `})`, so in a raid block with 10- and 25-player lists every line lands in the 25-player list: place a 10-player or difficulty-neutral id there by hand. Quest-chain facts (Rule 5) come from `_lookup_quest_maps.ps1` (`questpoiblob`: quest id → UiMapID); a quest with no POI there needs Warcraft Wiki or Wowhead.

## Pitfalls

Pitfalls of ad-hoc lookups and plan scripts:
- Read the cached DBC export with `Import-Csv`, never `awk -F','`: a description with a comma splits its row, which once produced two false statements.
- A PowerShell function that returns a collection needs `return ,$x`, or a one-item result unrolls.
- `(?s)` with `.*` in a block regex swallows the rest of the file; match up to the block's own closing `})`.
- Hashtable keys must share a type: `[int]` 123 and `"123"` are two keys.

## Evaluate-ZoneDataDecisions.ps1 output

Both evaluators resolve the builds themselves. `Evaluate-ZoneDataDecisions.ps1` prints `[ERROR]`, `[WARN ]`, `[INFO ]` lines with a check id (S-* structure, L-* log vs ZoneData, D-* log vs DB) and exits 1 on any ERROR. Its offline subset also runs from `Check-Repo.ps1` (rule `zone-decisions`) whenever the log or a ZoneData file changed.