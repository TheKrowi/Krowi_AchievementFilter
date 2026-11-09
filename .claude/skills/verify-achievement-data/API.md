# Achievement Data API Reference

## Query a Single Achievement by ID

The designated scripts wrap these queries; this file documents their shape and the column maps. `$build` always comes from the server through the kit's `tools\Get-WowBuilds.ps1` (dot-source `.claude\tools\KitPath.ps1` and `$KitTools\Get-WowBuilds.ps1`, then `(Get-WowBuilds).Retail` or `.Classic`), never a typed string that goes stale with the next patch.

```powershell
$id    = 12345
$build = (Get-WowBuilds).Retail
$body  = "draw=1&start=0&length=1&columns[3][search][value]=^$id`$&columns[3][search][regex]=true"
$resp  = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
             -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$json  = $resp.Content | ConvertFrom-Json
# $json.recordsFiltered — 0 means ID not found in DB
# $json.data[0]         — array of column values (see map below)
```

## Column Index Map

| Index | DB Column | Verification use |
|-------|-----------|-----------------|
| 0 | `Description_lang` | Achievement description — context for ambiguous reward or category |
| 1 | `Title_lang` | `name` — compare to inline `-- comment` |
| 2 | `Reward_lang` | `title-reward` — non-empty means `:Title()` expected |
| 3 | `ID` | `id-exists` — record found check |
| 5 | `Faction` | `faction` — `-1`=both, `0`=Horde, `1`=Alliance |
| 13 | `RewardItemID` | `reward-item` — non-`"0"` means reward method expected |

## Lua Parse Patterns

| Pattern (regex) | Extracts |
|-----------------|----------|
| `Ach\((\d+)\)` | All achievement IDs |
| `Ach\((\d+)\)[^-\n]*--\s*(.+)` | ID + inline name comment |
| `:FactionSplit\(faction\.(Alliance\|Horde),\s*(\d+)\)` | Has faction split + paired ID |
| `:Title\(\)` | Has title reward |
| `:Mount\(\)` | Has mount reward |
| `:Pet\(\)` | Has pet reward |
| `:Item\(\)` | Has item reward |

## Batch Queries (for files with many entries)

Collect all IDs from the file first, then query them in one request using an alternation regex:

```powershell
$ids   = @(19408, 19409, 19410)   # extracted from Lua
$pat   = "^(" + ($ids -join "|") + ")$"
$body  = "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp  = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
             -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows  = ($resp.Content | ConvertFrom-Json).data
$byId  = @{}
$rows | ForEach-Object { $byId[$_[3]] = $_ }
# Look up: $byId["19408"]
```

Use batch mode for any file with more than ~20 entries.

## Choosing the Right Build

Different Lua file paths require different builds. The script (`Verify-AchievementData.ps1`) auto-detects by probing the DB with the first ID in the file — this is the most reliable method.

For manual queries, use this table as a starting point, but **always verify by probing** since actual data presence depends on which builds are loaded locally:

| Lua path | Build type to try first |
|----------|------------------------|
| `DataAddons/Retail/` | `wow` (e.g. `12.0.5.67602`) |
| `DataAddons/Classic/01_Vanilla` – `03_WrathOfTheLichKing` | `wow_classic` first, then `wow_classic_era` |
| `DataAddons/Classic/04_Cataclysm` – `05_MistsOfPandaria` | `wow_classic` (e.g. `5.5.3.67509`) |
| `DataAddons/Shared/` | `wow` first, then `wow_classic` |

> **Empirically verified**: WotLK Classic achievements (including IDs 15000+) are found in the `wow_classic` (Cataclysm Classic) build, **not** in `wow_classic_era`. The `wow_classic_era` build only contains Classic Era (Vanilla) achievement data.

Get all locally available builds:
```powershell
$body = "draw=1&start=0&length=50&showLocal=true"   # remote builds: showLocal=false&showOnline=true
$resp = Invoke-WebRequest "http://localhost:5000/build/table" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
($resp.Content | ConvertFrom-Json).data | ForEach-Object { "$($_[0]).$($_[1]) | $($_[2])" }
```

## Browser UI — Filtering by ID List

To inspect a set of IDs directly in the wow.tools.local web UI, use a URL-encoded alternation regex in the `colFilter[3]` hash parameter (column 3 = ID):

```
http://localhost:5000/dbc/?dbc=achievement&build=5.5.3.67509&locale=enUS#page=1&colFilter[3]=^(ID1|ID2|ID3)$
```

URL-encoded form (required — the browser won't encode the hash fragment automatically):
- `^` → `%5E`
- `|` → `%7C`
- `$` → `%24`

Example for IDs 7944, 61967, 61968 in MoP Classic build:
```
http://localhost:5000/dbc/?dbc=achievement&build=5.5.3.67509&locale=enUS#page=1&colFilter[3]=%5E(7944%7C61967%7C61968)%24
```

To generate the URL-encoded link for a set of failure IDs in PowerShell:
```powershell
$ids   = @(7944, 61967, 61968)
$inner = $ids -join "%7C"
$url   = "http://localhost:5000/dbc/?dbc=achievement&build=$build&locale=enUS#page=1&colFilter[3]=%5E($inner)%24"
$url
```

## Notes

- `Faction` field: `-1` = no restriction (both factions), `0` = Horde only, `1` = Alliance only.
- `RewardItemID` is **not a reliable indicator** for tangible rewards in Classic builds — it is non-zero for virtually all achievements regardless of whether they give a mount, pet, or item. Use `Reward_lang` instead.
- `Reward_lang` title formats: `"Title Reward: X"` (Cataclysm+ expansions) **and** `"Title: X"` (WotLK-era achievements) both signal a title reward that should have `:Title()` in the Lua. The `"Reward: X"` prefix (without "Title") signals a tangible item/mount/pet reward.
- Always verify the active build with `/casc/buildname`; the tool only holds one build in memory at a time. Use the build string from `/build/table` for the query URL — it does **not** require switching the active build.

## Hotfixed achievements (in no build)

An achievement Blizzard adds by hotfix mid-patch is in no client build, so wow.tools.local, `_lookup_ids.ps1`, `Find-NewAchievements.ps1` and Wowhead all come up empty. The live client's hotfix cache has it: `H:\World of Warcraft\_retail_\Cache\ADB\enUS\DBCache.bin` and its `DBCache.bin<N>.tmp` siblings (the `.tmp` is often the newer one, so search the whole folder).

Format: a 44-byte file header (`XFTH`, version, buildId), then entries back to back, each a 32-byte header and `dataSize` bytes of record data:

| Offset | Field |
|---|---|
| 0 | `XFTH` magic |
| 4 | regionId |
| 8 | pushId |
| 12 | uniqueId |
| 16 | tableHash |
| 20 | recordId: the achievement id |
| 24 | dataSize |
| 28 | status and 3 pad bytes |

- Find the byte offset of the achievement's title, then walk the chain from offset 44 (`off += 32 + dataSize`) and take the entry whose data range contains that offset. Never scan back for the nearest `XFTH`: those 4 bytes occur inside record data.
- `Achievement.db2`'s tableHash is `0xD2EE2CA7`, decimal 3538824359. In PowerShell `0xD2EE2CA7` overflows Int32 and silently never matches: use the decimal. The record data starts with the strings in column order: Description_lang, Title_lang, Reward_lang. Check the hash on a few other recordIds of the same table with `_lookup_ids.ps1`.
- `Verify-AchievementData.ps1` then reports `id-exists ... not found in DB` for that id, which is correct; say so in the commit.
