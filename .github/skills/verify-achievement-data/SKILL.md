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
   - **Always apply prefix stripping if a word-boundary prefix exists** — strip the common prefix from the second name even when there is no usable suffix.
   - If `sLen >= 2`: format as `[shared prefix][primary unique] / [secondary unique][shared suffix]`
   - If `sLen < 2` but prefix exists: format as `[shared prefix][primary unique] / [secondary unique]`
   - If neither prefix nor suffix: keep both full names as `[Name1] / [Name2]`
   - Both prefix and suffix are trimmed to word boundaries (non-alphanumeric chars) before applying — this prevents mid-word splits like `"Allianc / Horde"` when a prefix shares trailing letters.
   - Examples:
     - Same name → `-- Name`
     - Long shared suffix (`>= 2` chars): `Galactic Marshal: Midnight Season 1` / `Galactic Warlord: Midnight Season 1` → `-- Galactic Marshal / Warlord: Midnight Season 1`
     - Prefix only: `In Service of the Alliance` / `In Service of the Horde` → `-- In Service of the Alliance / Horde`
     - Prefix only: `Let's Do Lunch: Stormwind` / `Let's Do Lunch: Orgrimmar` → `-- Let's Do Lunch: Stormwind / Orgrimmar`
     - No prefix or suffix: `Ambassador of the Horde` / `Ambassador of the Alliance` → `-- Ambassador of the Horde / Ambassador of the Alliance`
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

- **`:Garrison()` is a valid reward-type marker** — garrison blueprint unlocks, monument rewards, follower rewards, and other garrison-type rewards use `:Garrison()` as both their category tag and their reward-type marker. The `reward-item` check must accept `:Garrison()` (via `HasGarrison`) in `$hasMethod`; do **not** add `:Other()` to these entries. The script also needs to recognise `"Follower: X"` and `"Garrison Monument Reward: X"` in `$isReward` as valid tangible-reward signals (the generic `"Reward:"` prefix does not cover all garrison monument formats). Fixed by adding `HasGarrison = [bool]($eChain -match ':Garrison\(\)')` to the parser, including `$e.HasGarrison` in `$hasMethod`, and adding `$r -match '^Follower:'` and `$r -match '^Garrison Monument Reward:'` to `$isReward`. Observed across `Retail/06_WarlordsOfDaenor/AchievementData.lua` (build `12.0.5.67602`).

- **Some Classic MoP title rewards use `"Reward:"` instead of `"Title Reward:"` in `Reward_lang`** — the `title-reward` check will false-positive on `:Title()` entries whose `Reward_lang` begins with `"Reward:"`, and the `reward-item` check will simultaneously flag them as missing a reward method. Confirmed on Ach(62060) "Heir to the Mist" in `Classic/05_MistsOfPandaria/AchievementData.lua` (build `5.5.3.67509`): DB says `"Reward: Heir to the Mist"` but https://www.wowhead.com/mop-classic/title/heir-to-the-mist-1188 confirms it is a title. These 2 failures are expected false positives; `:Title()` is correct.

- **Retail DB uses specific-type `Reward_lang` prefixes instead of the generic `"Reward:"` prefix** — in Retail builds (e.g. `12.0.5.67602`), the DB uses `"Mount: X"`, `"Mount Reward: X"`, `"Pet: X"`, `"Toy: X"`, `"Unlock: X"`, and `"Character Unlock: X"` rather than the generic `"Reward: X"`. The `reward-item` check must recognise all of these as tangible-reward signals. Fixed by expanding `$isReward` in the script to include all these prefixes. Observed across `Shared/05_MistsOfPandaria/AchievementData.lua` (749 entries, Retail build).

- **Retail DB uses `"Character Title:"` and `"Seasonal Character Title:"` for PvP title rewards** — the `title-reward` check must accept these formats (in addition to `"Title Reward:"` and `"Title:"`) as valid signals for `:Title()`. Also, `"Reward: Title & X"` (combined title + cosmetic item, e.g. Ach(7520) "The Loremaster") must be recognised as a title signal and excluded from the `reward-item` tangible-reward check. Fixed by expanding `$isTitle` in both blocks. Observed in `Shared/05_MistsOfPandaria/AchievementData.lua` (Retail build `12.0.5.67602`).

- **Greedy suffix matching across word boundaries** — when two achievement names share a common word ending (e.g. "Ghost**lands**"/"Wet**lands**" or "Allianc**e**"/"Hord**e**"), the suffix algorithm greedily includes the shared letters as part of the suffix, producing mid-word splits like "Ghos / Loch Modan & We..." or "Allianc / Hord:...". Fix: after computing the raw suffix, trim it leftward until it starts with a non-alphanumeric character. This yields the correct " Quests" or ": Vicious" boundary. Observed on Ach(4908)+Ach(12456) and Ach(5344)+Ach(5358) in `Retail/04_Cataclysm/AchievementData.lua`.

- **Combined mount + title reward uses `"Reward: X and Y Title"` format** — some Cataclysm-era PvP achievements (e.g. "Veteran of the Horde", "Warbringer") give both a mount and a title, and the DB encodes this as `"Reward: Epic Wolf and Veteran of the Horde Title"` (ends with the word "Title"). The `title-reward` check must accept `^Reward:.*\bTitle$` as a valid `:Title()` signal; the `reward-item` check must still treat it as a tangible reward requiring a mount/pet/item marker. Tag these entries with both `:Mount()` and `:Title()` in the Lua file. Fixed by adding `$r -match '^Reward:.*\bTitle$'` to `$isTitle` in the title-reward block only (not to `$isTitleStr` in reward-item). Observed on Ach(5325) and Ach(5326) in `Shared/04_Cataclysm/AchievementData.lua` (build `12.0.5.67602`).

- **`"Item Reward:"` prefix is a tangible-reward signal** — the DB uses `"Item Reward: X"` for some achievements that grant a specific item (e.g. Ach(5859) "Legacy of Leyara" → `"Item Reward: Smoke-Stained Locket"`, Ach(5860) → `"Item Reward: Chirping Box"`). The `reward-item` check must recognise this prefix in `$isReward`; otherwise it produces a false positive when a reward method like `:Other()` or `:Pet()` is already present. Fixed by adding `$r -match '^Item Reward:'` to `$isReward`. Observed in `Shared/04_Cataclysm/AchievementData.lua` (build `12.0.5.67602`).

- **Faction-split comments with a shared prefix but no suffix use the shortened prefix format** — when two achievement names share only a common prefix (and have no common suffix of length ≥ 2), strip the prefix from the second name: `"In Service of the Alliance / Horde"` (not `"In Service of the Alliance / In Service of the Horde"`). The same applies to repeated city-name prefixes: `"Let's Do Lunch: Stormwind / Orgrimmar"`, `"Fish or Cut Bait: Ironforge / Thunder Bluff"`, etc. The `Get-MergedFactionComment` function was updated to apply prefix stripping (trimmed to a word boundary) as a fallback when no usable suffix exists. Observed across multiple entries in `Shared/04_Cataclysm/AchievementData.lua`.

- **`:Tabard()` is a valid reward-type marker** — the `reward-item` check must recognise `:Tabard()` alongside `:Mount()/:Pet()/:Item()/:Toy()/:Transmog()/:Other()` as evidence that a tangible reward has been tagged, otherwise entries like Ach(45) "Northrend Explorer" (tabard reward) produce false positives. Fixed by adding `HasTabard` property to the parser and including it in `$hasMethod`. The error message was also updated to include `/:Tabard()`. Observed in `Shared/03_WrathOfTheLichKing/AchievementData.lua` (build `12.0.5.67602`).

- **`FactionSplit(faction.X, nil)` is a valid single-faction split** — when an achievement uses `:FactionSplit(faction.Alliance, nil)` or `:FactionSplit(faction.Horde, nil)` (second argument explicitly `nil`, no paired ID), neither `$factPat` (requires `\d+`) nor the original `$factOnlyPat` (requires no second argument) matched, causing false-positive "DB Faction=X but no :FactionSplit()" failures. Fixed by updating `$factOnlyPat` to `':(?:Auto)?FactionSplit\(faction\.(Alliance|Horde)(?:,\s*nil)?\)'`. Observed on Ach(4786) and Ach(4790) in `Shared/03_WrathOfTheLichKing/AchievementData.lua`.
- **`"Appearance:"` prefix is a tangible-reward signal for transmog unlocks** — the Retail DB uses `"Appearance: X"` for achievements that grant an appearance/transmog unlock (e.g. Ach(10172) "Petty Officer" → `"Appearance: Captain's Hat"`). The `reward-item` check must recognise this prefix in `$isReward`; tag these entries with `:Transmog()`. Failing to recognise it produces false positives ("has reward method but DB Reward_lang is not a tangible reward") for correct `:Transmog()` entries. Fixed by adding `$r -match '^Appearance:'` to `$isReward`. Observed on Ach(10172) and Ach(10256) in `Retail/06_WarlordsOfDaenor/AchievementData.lua` (build `12.0.5.67602`).

- **`"Demon Hunter Appearance:"` and `"Arsenal:"` are tangible-reward signals** — the Retail DB uses these for DH-restricted appearance rewards (e.g. Ach(11869) "I'll Hold These For You Until You Get Out" → `"Demon Hunter Appearance: Warglaives of Azzinoth"`) and weapon arsenal unlocks (e.g. Ach(12078) "Commander of Argus" → `"Arsenal: Weapons of the Lightforged"`). Tag these entries with `:Transmog()`. Fixed by adding both prefixes to `$isReward`. Observed in `Retail/07_Legion/AchievementData.lua` (build `12.0.5.67602`).

- **`"Cross-Game Reward:"` is a tangible-reward signal** — the Retail DB uses this for achievements that reward content in other Blizzard games (e.g. Ach(10657) "Fledgling Hero of Warcraft" → `"Cross-Game Reward: Lady Liadrin Paladin Hero in Hearthstone"`). Tag these entries with `:Other()`. Fixed by adding `$r -match '^Cross-Game Reward:'` to `$isReward`. Observed in `Retail/07_Legion/AchievementData.lua` (build `12.0.5.67602`).

- **`"Titles:"` (plural) is a valid title-reward signal** — some achievements grant multiple titles and the DB uses the plural form (e.g. Ach(12399) "Observed" → `"Titles: Starcaller and The Astral Walker"`). The `title-reward` check must accept `^Titles:` alongside `^Title:` and `^Title Reward:`. Fixed by adding `$r -match '^Titles:'` to both `$isTitle` and `$isTitleStr`. Observed in `Retail/07_Legion/AchievementData.lua` (build `12.0.5.67602`).

- **`:AlliedRace()` is a valid reward-type marker** — allied race unlock achievements (e.g. Ach(12242) "Allied Races: Void Elf") use `:AlliedRace()` as their reward marker, and the DB encodes the reward as `"Reward: X Race Unlocked"`. The `reward-item` check must recognise `:AlliedRace()` (via `HasAlliedRace`) in `$hasMethod`, otherwise these entries produce false positives. Fixed by adding `HasAlliedRace` property to the parser and including it in `$hasMethod`. Observed across Ach(12242–12245) in `Retail/07_Legion/AchievementData.lua` (build `12.0.5.67602`).

- **Some faction-gated achievements have DB Faction=-1 despite being restricted to one faction** — this affects allied race unlocks (e.g. "Allied Races: Void Elf"), heritage armor achievements (e.g. "Heritage of the Nightborne"), and some event achievements (e.g. "Fight for the Alliance" / "Fight for the Horde", pre-launch event). All record `Faction=-1` in the DB even though they can only be earned by the appropriate faction. The `faction` check will always fire for these. The `:FactionSplit()` usage IS correct — do not remove it. These are known false positives; the DB Faction field does not reliably capture in-game faction restrictions for these achievement types. Observed on Ach(11210, 12242–12245, 12291, 12413–12415) in `Retail/07_Legion/AchievementData.lua`.
- **`"Reward: X Title & Y"` format signals a combined title + item reward** — some achievements grant both a title and a companion/toy, encoded as e.g. `"Reward: Pilgrim Title & Plump Turkey Pet"`. The `title-reward` check must accept `^Reward:.*\bTitle\s*&` as a valid `:Title()` signal; the `reward-item` check must still treat it as a tangible reward requiring an appropriate reward method (e.g. `:Pet()`). Tag these entries with both `:Title()` and the item reward method in the Lua file. Fixed by adding `$r -match '^Reward:.*\bTitle\s*&'` to `$isTitle` in the title-reward block only. Observed on Ach(3478) "Pilgrim" in `Shared/03_WrathOfTheLichKing/AchievementData.lua` (build `12.0.5.67602`).
