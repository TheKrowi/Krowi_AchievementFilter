---
name: sync-mapverifier
description: Round-trips the in-game Map Verifier state (map verdicts, link groups, expansions, overrides, comments) through the single canonical file raw/MapVerifier.csv. Use when the user exported from the Map Verifier, wants the CSV validated or normalised, wants to know what changed in the map data since the last commit, or needs the file imported back into the game.
---

# Sync Map Verifier

`raw/MapVerifier.csv` is the **only** copy of the Map Verifier data in the repo. The in-game tool
(`Gui/DataManager/MapVerifier`, debug mode, Options → General → Map Verifier) edits it; everything
else reads it: `_zonedata_parser.ps1` (`Get-MapReference`), `_zone_search.ps1`, `_linkgroups_search.ps1`,
both `raw/Evaluate-Zone*.ps1` evaluators and `raw/Cleanup-ZoneData.ps1`. Retail/PTR only; Classic is not tracked.

## File

```
id,name,mapType,parentMapID,verdict,expansion,link,parentOverride,nameOverride,comment
```

- One row per map id the game or the saved variable knows, ascending. An unreviewed id has an empty verdict.
- `verdict`: Zone, StartingZone, City, Continent, Dungeon, Raid, Delve, ClassHall, Battleground, Scenario, Error, TaxiAndAdventure, Skip. Skip-like (Skip, TaxiAndAdventure, Error, StartingZone) never show on the world map; inactive-like (TaxiAndAdventure, Error, StartingZone) must not appear in ZoneData.
- `link`: the primary map id this sub-zone belongs to. A link group is the primary plus every row linking to it; a target may not itself be linked. Zone entries list whole groups (add-zone-data Rule 1).
- `name`, `mapType` (numeric `C_Map` type: 2 continent, 3 zone, 4 dungeon, 5 micro, 6 orphan) and `parentMapID` come from the game and are ignored on import.
- CRLF, no final newline, UTF-8 without BOM, quoting only where needed. `Sync-MapVerifier.ps1` produces exactly this form; `Check-Repo.ps1` (rule `mapverifier`) refuses anything else.

## Game → repo

1. In game: Map Verifier → **Export**, Ctrl+A, Ctrl+C in the text frame.
2. Paste over the whole content of `raw/MapVerifier.csv`.
3. Run:
   ```powershell
   & ".claude\skills\sync-mapverifier\Sync-MapVerifier.ps1"
   ```
   It validates (same rules as the in-game Import), patches `?` names and empty `mapType`/`parentMapID` from the committed version (exported from an older client), sorts, writes the canonical form and prints every verdict, link, expansion, override and comment change against `HEAD`. Exit 1 leaves the file untouched.
4. Read the summary, then run the zone evaluators, because link changes move sub-zones between entries:
   ```powershell
   & "raw\Evaluate-ZoneData.ps1" -SkipDbCheck
   & "raw\Evaluate-ZoneDataDecisions.ps1" -SkipDb
   ```
   Fix the ZoneData entries the evaluators flag (partial groups, inactive maps). When a link changed, the decisions log's Zone ID cells (link-group primaries) move too; rewrite them with:
   ```powershell
   & "raw\Evaluate-ZoneDataDecisions.ps1" -SkipDb -FixZoneCells
   ```

## Repo → game

1. Copy the whole content of `raw/MapVerifier.csv`.
2. In game: Map Verifier → **Import**, paste, click **Import (replace)**. The tool validates, prints a summary (rows, verdicts and links added/changed/removed) and asks for confirmation. It then replaces Maps, Links, Expansions, ParentOverrides, NameOverrides and Comments; Cursor and Range are kept. Errors abort with the line number and nothing is written.

## Other commands

```powershell
& ".claude\skills\sync-mapverifier\Sync-MapVerifier.ps1" -Validate   # content + order, never writes (what Check-Repo runs)
& ".claude\skills\sync-mapverifier\Sync-MapVerifier.ps1" -Verify     # round trip: committed bytes == canonical bytes
```

## Rules

- Never hand-edit verdicts or links in the CSV to "fix" a zone decision; change them in game and export, so the saved variable and the file never disagree. Hand edits are only for recovering a broken paste.
- Always export from the newest client you reviewed on (PTR when it is ahead). If an older client exported, the `?` patching keeps names, but new PTR-only rows are still lost; re-export from the PTR.
- `_mapverifier_io.ps1` holds the reader, writer and validator; extend it there, never inline.
