---
name: verify-achievement-data
description: Verifies Krowi_AchievementFilter Lua achievement entries against the WoW game database via wow.tools.local (http://localhost:5000). Use when checking if achievement IDs exist in the game DB, faction splits are correct, title rewards or reward items are properly tagged, or inline `-- Name` comments match live game data. Requires wow.tools.local to be running locally at that address.
version: "1.0.0"
---

# Verify Achievement Data

## Prerequisites

wow.tools.local must be reachable at `http://localhost:5000`. The script checks this automatically before doing anything else — if the server is already running, it skips startup entirely. If it is not reachable, it launches the process and waits up to 60 seconds for it to become ready.

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

- [ ] Ask the user which verification to run (see [Verifications](#verifications))
- [ ] Ask which Lua file(s) to check (e.g. a specific `AchievementData.lua`)
- [ ] Count the entries in the file. If **> 50 entries or running "all" verifications**, apply the [Large File Strategy](#large-file-strategy) below — do NOT attempt to process the whole file in one response.
- [ ] Parse the file for achievement IDs and metadata using patterns in [API.md](API.md)
- [ ] Use **batch queries** (alternation regex, see [API.md](API.md)) rather than one query per ID
- [ ] Compare DB values to Lua metadata and report all discrepancies

## Large File Strategy

Running all 5 verifications on a file with many entries will exceed the response length limit. The response length limit is about **output size**, not computation — so the solution is to minimize output per turn, not to do less work.

### Preferred: Parallel subagents (one per patch block)

Spawn one subagent per `KrowiAF.AchievementData["XX_YY_ZZ"]` block. Each subagent:
1. Receives the block's entries and the correct build string.
2. Runs all queries and all verification checks.
3. Returns **only `[FAIL]` lines** — passes are silent.

The main agent collects all subagent results and outputs the combined failure report. This is fast (parallel queries) and keeps the final response short — unless the file has many failures, in which case fall back to block-by-block interactive mode.

### Fallback: Block-by-block interactive mode

If subagents are unavailable or the failure count is high:
1. **Announce the plan**: "This file has N entries across X patch blocks. Processing one block at a time."
2. Process one block per response turn, reporting only failures.
3. Ask "Continue to next block?" before proceeding.

Rule of thumb: **never queue more than ~30 IDs worth of DB queries + output in a single response turn.**

## Verifications

| Option | What it checks | Fail condition |
|--------|---------------|----------------|
| `id-exists` | Achievement ID is present in the game DB | `recordsFiltered == 0` for a queried ID |
| `faction` | `:FactionSplit()` usage matches DB `Faction` field | DB `Faction` is `0` or `1` but Lua has no `:FactionSplit()`, or `:FactionSplit()` present but DB `Faction` is `-1` |
| `title-reward` | `:Title()` aligns with DB `Reward_lang` | DB `Reward_lang` starts with `"Title Reward:"` or `"Title:"` but no `:Title()`, or `:Title()` present but `Reward_lang` matches neither prefix |
| `reward-item` | `:Mount()` / `:Pet()` / `:Item()` aligns with DB `Reward_lang` | DB `Reward_lang` starts with `"Reward:"` (not `"Title Reward:"`) but no reward-type method, or reward method present but `Reward_lang` is not a tangible reward |
| `description-lang` | Inline `-- comment` matches DB `Title_lang` (with special handling for faction-split entries — see below) | Trimmed comment differs from expected name (case-sensitive) |

> **Note on `reward-item`**: `RewardItemID` from the DB is **not** a reliable signal — it is non-zero for virtually all achievements in Classic builds regardless of actual rewards. The script uses `Reward_lang` (`"Reward: X"`) as the reliable indicator instead. This means achievements that give a tangible reward but have an empty `Reward_lang` cannot be auto-detected.

> **Note on `title-reward`**: Two `Reward_lang` formats signal a title reward: `"Title Reward: X"` (used in Cataclysm+ expansions) and `"Title: X"` (used in WotLK-era achievements). The script accepts both as valid `:Title()` signals.

### `description-lang` — Faction Split Entries

For entries using `:AutoFactionSplit()` or `:FactionSplit()`, the comment represents **both** achievement names combined. Apply the same merging rule as the `add-achievement-data` skill, with one refinement learned from testing:

1. Look up **both** IDs (primary + split) in the correct build for the file's client/expansion.
2. Reconstruct the expected comment using the merging formula:
   - Identify the longest common **prefix** and longest common **suffix** between the two names.
   - **Only apply suffix stripping if `sLen >= 2`** — a single trailing character match (e.g. both names ending in `r` or `e`) is almost always coincidental and should NOT be stripped.
   - If `sLen >= 2`: format as `[shared prefix][primary unique] / [secondary unique][shared suffix]`
   - If `sLen < 2` (or no suffix): keep both full names as `[Name1] / [Name2]` (even if there is a common prefix)
   - Examples:
     - Same name → `-- Name`
     - Long shared suffix (`>= 2` chars): `Galactic Marshal: Midnight Season 1` / `Galactic Warlord: Midnight Season 1` → `-- Galactic Marshal / Warlord: Midnight Season 1`
     - Short/no suffix (prefix only): `The Conqueror` / `The Justicar` → `-- The Conqueror / The Justicar` (keep full names, `r` suffix is incidental)
     - Short/no suffix (no prefix): `Ambassador of the Horde` / `Ambassador of the Alliance` → `-- Ambassador of the Horde / Ambassador of the Alliance`
3. Compare the reconstructed comment to the actual Lua comment.

**Important:** For Classic files (`DataAddons/Classic/`), always use the correct Classic build — **not** the Retail build — since names can differ between clients. See [API.md](API.md) for build selection.

## Reporting

Print failures in this format, then a summary line:
```
[FAIL] id-exists       : Ach(99999) — not found in DB
[FAIL] faction         : Ach(12345) — DB Faction=1 (Alliance) but no :FactionSplit()
[FAIL] title-reward    : Ach(11111) — DB Reward_lang="the Flamebreaker" but no :Title()
[FAIL] reward-item     : Ach(22222) — DB RewardItemID=54321 but no :Mount()/:Pet()/:Item()
[FAIL] description-lang: Ach(33333) — comment "Old Name" ≠ DB Title_lang "New Name"
[FAIL] description-lang: Ach(4894)+Ach(4903) — comment "Silverpine Forest / Redridge Mountains (Classic) Quests" ≠ expected "Silverpine Forest / Westfall and Duskwood Quests"

3 failures in 47 entries checked.
```
If no failures: `All X entries passed.`

## Self-Learning

When running verifications, you will occasionally discover edge cases — new `Reward_lang` formats, unexpected DB field values, or incorrect detection logic. **When you encounter one, update this skill immediately** so the next run benefits from the fix.

### When to self-update

| Situation | What to do |
|-----------|------------|
| Script produces a false positive or false negative | Fix the detection logic in `Verify-AchievementData.ps1` and document the new rule here |
| A new `Reward_lang` prefix is encountered (e.g. a future format change) | Add it to the `title-reward` or `reward-item` note in [Verifications](#verifications) and fix the script regex |
| A new `Faction` field value is encountered | Add it to the `faction` check description and handle it in the script |
| The faction-split comment merging rule produces wrong output | Add the case to the `description-lang` examples list |
| A build-selection rule in [API.md](API.md) turns out to be wrong | Correct the table and add a note explaining the empirical finding |

### Learned edge cases (append new findings here)

- **WotLK-era title rewards** use `"Title: X"` in `Reward_lang` (without the word "Reward"), not `"Title Reward: X"`. Both formats must be accepted as valid `:Title()` signals. Observed on Ach(714) and Ach(762) in `Retail/03_WrathOfTheLichKing/AchievementData.lua` (build `12.0.5.67602`).

- **Single-faction FactionSplit without a partner ID** — `:FactionSplit(faction.Alliance)` (no second argument) marks an achievement as Alliance-only with no Horde counterpart. The faction-check regex must also match this pattern (no `,\s*(\d+)` group), otherwise the script falsely reports "DB Faction=1 but no :FactionSplit()". Fixed by adding a `$factOnlyPat` fallback in the parser. Observed on Ach(4899) and Ach(4903) in `Retail/04_Cataclysm/AchievementData.lua`.

- **`:Toy()`, `:Transmog()`, and `:Other()` are valid reward-type markers** — the `reward-item` check must also accept these alongside `:Mount()/:Pet()/:Item()` as evidence that a tangible reward has been tagged. Failing to recognise them produces false positives for all challenge-mode platinum rewards in Classic MoP. Fixed in the script by adding `HasToy`, `HasTransmog`, and `HasOther` properties and including them in `$hasMethod`. Note: cosmetic use-items (e.g. Platinum challenge rewards) are `:Toy()`; currency rewards (e.g. Platinum Coins, currency=3407) are `:Other()`. **Do NOT rely on wowhead search result item type labels** (e.g. "Permanent Item Enhancement", "Miscellaneous Item") to determine toy vs transmog vs item — always open the actual item page, as the search result type can be misleading.

- **Some Classic MoP title rewards use `"Reward:"` instead of `"Title Reward:"` in `Reward_lang`** — the `title-reward` check will false-positive on `:Title()` entries whose `Reward_lang` begins with `"Reward:"`, and the `reward-item` check will simultaneously flag them as missing a reward method. Confirmed on Ach(62060) "Heir to the Mist" in `Classic/05_MistsOfPandaria/AchievementData.lua` (build `5.5.3.67509`): DB says `"Reward: Heir to the Mist"` but https://www.wowhead.com/mop-classic/title/heir-to-the-mist-1188 confirms it is a title. These 2 failures are expected false positives; `:Title()` is correct.

- **Greedy suffix matching across word boundaries** — when two achievement names share a common word ending (e.g. "Ghost**lands**"/"Wet**lands**" or "Allianc**e**"/"Hord**e**"), the suffix algorithm greedily includes the shared letters as part of the suffix, producing mid-word splits like "Ghos / Loch Modan & We..." or "Allianc / Hord:...". Fix: after computing the raw suffix, trim it leftward until it starts with a non-alphanumeric character. This yields the correct " Quests" or ": Vicious" boundary. Observed on Ach(4908)+Ach(12456) and Ach(5344)+Ach(5358) in `Retail/04_Cataclysm/AchievementData.lua`.
