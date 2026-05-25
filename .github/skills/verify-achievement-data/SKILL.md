---
name: verify-achievement-data
description: Verifies Krowi_AchievementFilter Lua achievement entries against the WoW game database via wow.tools.local (http://localhost:5000). Use when checking if achievement IDs exist in the game DB, faction splits are correct, title rewards or reward items are properly tagged, or inline `-- Name` comments match live game data.
version: "1.1.0"
---

# Verify Achievement Data

## Prerequisites

wow.tools.local must be reachable at `http://localhost:5000`. The script checks this automatically — if the server is already running it skips startup, otherwise it launches the process and waits up to 60 seconds.

To start it manually:
```powershell
Start-Process "E:\World of Warcraft Addon Development\wow.tools.local\wow.tools.local.exe"
```

## Workflow

**Preferred: run the PowerShell script** — it handles parsing, build detection, batch queries, and all 5 checks automatically:

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
& ".github\skills\verify-achievement-data\Verify-AchievementData.ps1" "DataAddons\Classic\03_WrathOfTheLichKing\AchievementData.lua"
# or with specific checks only:
& ".github\skills\verify-achievement-data\Verify-AchievementData.ps1" "DataAddons\Retail\11_TheWarWithin\AchievementData.lua" -Checks id-exists,faction,title-reward,description-lang
```

The script auto-detects the correct build by probing the DB with the first ID in the file.

**Manual workflow** (fallback if script is unavailable):

- [ ] Ask the user which verification to run (see [REFERENCE.md — Verifications](REFERENCE.md#verifications))
- [ ] Ask which Lua file(s) to check (e.g. a specific `AchievementData.lua`)
- [ ] Count the entries. If **> 50 entries or running "all" verifications**, apply the [Large File Strategy](REFERENCE.md#large-file-strategy)
- [ ] Parse the file for achievement IDs and metadata using patterns in [API.md](API.md)
- [ ] Use **batch queries** (alternation regex, see [API.md](API.md)) rather than one query per ID
- [ ] Compare DB values to Lua metadata and report failures using the format in [REFERENCE.md — Reporting](REFERENCE.md#reporting)

## References

| File | Contents |
|------|----------|
| [REFERENCE.md](REFERENCE.md) | Verifications table, Large File Strategy, Reporting format |
| [API.md](API.md) | DB query patterns, column index map, build selection |
| [EDGE-CASES.md](EDGE-CASES.md) | Known false positives, faction split merging algorithm |
| [AUTOLEARN.md](AUTOLEARN.md) | How to extend the skill when you discover a new edge case |
