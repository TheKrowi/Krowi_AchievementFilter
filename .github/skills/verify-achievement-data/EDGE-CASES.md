# Verify Achievement Data — Edge Cases & Reference

## description-lang: AutoFactionSplit Merging Algorithm

For entries using `:AutoFactionSplit()`, reconstruct the expected comment by merging both achievement names:

1. Look up **both** IDs (primary + split) in the correct build.
2. Apply the merging formula:
   - Find the longest common **prefix** and longest common **suffix** between the two names.
   - **Only apply suffix stripping if `sLen >= 2`** — a single trailing character match is almost always coincidental and must NOT be stripped.
   - **Always apply prefix stripping if a word-boundary prefix exists** — strip the common prefix from the second name even when there is no usable suffix.
   - If `sLen >= 2`: trim the suffix leftward to the nearest non-alphanumeric boundary first; if still `>= 2`, format as `[shared prefix][primary unique] / [secondary unique][shared suffix]`
   - If `sLen < 2` but prefix exists: trim prefix rightward to a word boundary, then format as `[shared prefix][primary unique] / [secondary unique]`
   - If neither prefix nor suffix: keep both full names as `[Name1] / [Name2]`

**Examples:**

| Primary | Secondary | Expected comment |
|---------|-----------|-----------------|
| `Name` | `Name` | `Name` |
| `Galactic Marshal: Midnight Season 1` | `Galactic Warlord: Midnight Season 1` | `Galactic Marshal / Warlord: Midnight Season 1` |
| `In Service of the Alliance` | `In Service of the Horde` | `In Service of the Alliance / Horde` |
| `Let's Do Lunch: Stormwind` | `Let's Do Lunch: Orgrimmar` | `Let's Do Lunch: Stormwind / Orgrimmar` |
| `Ambassador of the Horde` | `Ambassador of the Alliance` | `Ambassador of the Horde / Ambassador of the Alliance` |

**Important for Classic files:** Always use the correct Classic build — names can differ between clients. See [API.md](API.md).

### AutoFactionSplit uniqueness rule

`:AutoFactionSplit(faction.F, Y)` automatically creates **both** the primary and secondary achievement objects. Therefore:

- The secondary ID `Y` must **not** appear as its own `Ach(Y)` entry anywhere in the same file.
- Two `:FactionSplit()` entries that mutually reference each other (e.g. `Ach(X):FactionSplit(f1, Y)` and `Ach(Y):FactionSplit(f2, X)`) are also incorrect **unless the two entries differ in any modifier chain beyond `:FactionSplit()` itself** — see exception below.

Both patterns are detected by the `autofactionsplit-unique` check.

**Exception — asymmetric modifier chains (mutual FactionSplit IS correct):**

`:AutoFactionSplit()` propagates the primary entry's **entire modifier chain** to the auto-generated secondary unchanged. If the two faction versions differ in **any** builder call — reward type, `:Obtainable()`, `:IsPvP()`, or anything else — `:AutoFactionSplit()` cannot be used. Separate mutual `:FactionSplit()` entries are the correct representation.

The `autofactionsplit-unique` check **skips** mutual FactionSplit pairs where the two entries differ in any modifier beyond `:FactionSplit()` itself. Programmatically: strip the `:FactionSplit(...)` call from each line and compare the remainder — if they differ, skip.

**Examples of asymmetric modifier pairs (mutual FactionSplit is correct):**
- Different reward methods: `Ach(X):HousingDecor():FactionSplit(faction.Horde, Y)` + `Ach(Y):FactionSplit(faction.Alliance, X)` — only one side has a reward
- Different `:Obtainable()` windows: `Ach(610):IsPvP():FactionSplit(faction.Alliance, 615):Obtainable("Before", "Version", {8, 0, 1})` + `Ach(615):IsPvP():FactionSplit(faction.Horde, 610):Obtainable("Before", "Version", {9, 0, 1})` — same (no) reward but different obtainability windows. Observed on Ach(610/615, 611/616, 612/617) in `Shared/03_WrathOfTheLichKing/AchievementData.lua`.

**BfA examples of intentionally asymmetric mutual FactionSplit pairs:**

| Horde ID | Alliance ID | Rewarded faction | Reward |
|----------|-------------|-----------------|--------|
| 12510 | 12509 | Horde (12510→wait, no) | — Actually 12509 Horde gives "Decor Reward: Lordaeron Rectangular Rug" |

Correct BfA pairs where only ONE side has a reward (mutual FactionSplit is correct):
- `Ach(12509):HousingDecor():FactionSplit(faction.Horde, 12510)` + `Ach(12510):FactionSplit(faction.Alliance, 12509)` — only 12509 (Horde) gives "Decor Reward: Lordaeron Rectangular Rug"
- Similarly for pairs: 12479/12891, 12555/12582, 12731/12733, 12744/12746, 12867/12896, 12869/12898, 12870/12899, 13251/13263, 13283/13284

**Example fix** (BfA 8.0, Ach 12593/13294 "Loremaster of Kul Tiras / Zandalar"):
```lua
-- Before (wrong — symmetric rewards, mutual FactionSplit; should use AutoFactionSplit)
Ach(12593):FactionSplit(faction.Alliance, 13294), -- Loremaster of Kul Tiras
Ach(13294):FactionSplit(faction.Horde, 12593),    -- Loremaster of Zandalar

-- After (correct — single AutoFactionSplit, partner removed; both have no reward)
Ach(12593):AutoFactionSplit(faction.Alliance, 13294), -- Loremaster of Kul Tiras / Zandalar
```

**Example fix** (BfA 8.2.0, Ach 13553/13700 "The Mechagonian Threat"):
```lua
-- Before (wrong — duplicate entries, wrong type)
Ach(13553):FactionSplit(faction.Alliance, nil),
...
Ach(13700):FactionSplit(faction.Horde, nil),

-- After (correct — single AutoFactionSplit, partner removed)
Ach(13553):AutoFactionSplit(faction.Alliance, 13700), -- The Mechagonian Threat
```

---

## Learned Edge Cases

### faction check

- **Some faction-gated achievements have DB Faction=-1 despite being restricted to one faction** — this affects allied race unlocks (e.g. "Allied Races: Void Elf"), heritage armor achievements (e.g. "Heritage of the Nightborne"), and some event achievements (e.g. "Fight for the Alliance" / "Fight for the Horde"). All record `Faction=-1` in the DB even though they can only be earned by the appropriate faction. `:FactionSplit()` usage IS correct for these — they are known false positives. Two sub-cases:
  - **Single-faction no-partner** (`:FactionSplit(faction.X, nil)`): `SplitID` is null — suppress as FP. Observed on Ach(11210, 12242–12245, 12291, 12413–12415) in `Retail/07_Legion/AchievementData.lua` and Ach(12515, 12518, 13076, 13077, 13161, 13163, 13503, 13504, 13206, 14002, 14013, 14014) in `Retail/08_BattleForAzeroth/AchievementData.lua`.
  - **AutoFactionSplit with partner** (`:AutoFactionSplit(faction.X, Y)`): `IsAutoSplit` is true — suppress as FP. `:AutoFactionSplit()` signals explicit developer intent to faction-split; DB Faction=-1 is a data gap. Observed on Ach(11210) in `Retail/07_Legion/AchievementData.lua`.

- **Single-faction FactionSplit without a partner ID** — `:FactionSplit(faction.Alliance)` (no second argument) or `:FactionSplit(faction.Alliance, nil)` (explicit `nil`) marks an achievement as faction-only with no counterpart. The faction-check regex matches both patterns via `$factOnlyPat = ':(?:Auto)?FactionSplit\(faction\.(Alliance|Horde)(?:,\s*nil)?\)'`. Observed on Ach(4899/4903) in `Retail/04_Cataclysm/AchievementData.lua` and Ach(4786/4790) in `Shared/03_WrathOfTheLichKing/AchievementData.lua`.

### title-reward check

- **WotLK-era title rewards** use `"Title: X"` in `Reward_lang` (without the word "Reward"), not `"Title Reward: X"`. Both formats are accepted. Observed on Ach(714) and Ach(762) in `Retail/03_WrathOfTheLichKing/AchievementData.lua`.

- **Retail DB uses `"Character Title:"` and `"Seasonal Character Title:"` for PvP title rewards.** Also, `"Reward: Title & X"` (combined title + cosmetic item, e.g. Ach(7520) "The Loremaster") is a title signal but must not be excluded from the `reward-item` tangible-reward check. Observed in `Shared/05_MistsOfPandaria/AchievementData.lua`.

- **`"Titles:"` (plural) is a valid title-reward signal** — some achievements grant multiple titles (e.g. Ach(12399) "Observed" → `"Titles: Starcaller and The Astral Walker"`). Observed in `Retail/07_Legion/AchievementData.lua`.

- **Combined mount + title reward uses `"Reward: X and Y Title"` format** — some Cataclysm-era PvP achievements give both a mount and a title (e.g. "Reward: Epic Wolf and Veteran of the Horde Title"). The `title-reward` check accepts `^Reward:.*\bTitle$`; tag these entries with both `:Mount()` and `:Title()`. Observed on Ach(5325/5326) in `Shared/04_Cataclysm/AchievementData.lua`.

- **`"Reward: 'Title Name' Title, X Customization"` format** — some achievements grant both a title and a customization option (e.g. `"Reward: 'Of Lordaeron' Title, 'Dark Ranger' Elf Customization"`). The title-reward check accepts `^Reward:.*'[^']*'\s+Title`; tag these entries with both `:Title()` and `:Other()`. Observed on Ach(15579) "Return to Lordaeron" in `Retail/09_Shadowlands/AchievementData.lua`.

- **Some Classic MoP title rewards use `"Reward:"` instead of `"Title Reward:"` in `Reward_lang`** — confirmed on Ach(62060) "Heir to the Mist" in `Classic/05_MistsOfPandaria/AchievementData.lua` (DB: `"Reward: Heir to the Mist"`; wowhead confirms it is a title). These are expected false positives; `:Title()` is correct.

- **Cataclysm "Hero of the Alliance/Horde" ranked-BG achievements have empty `Reward_lang` in all builds despite granting titles** — confirmed on Ach(5344) "Hero of the Alliance: Vicious" and Ach(6316) "Hero of the Alliance: Ruthless" (and their Horde counterparts 5358/6317) in `Classic/04_Cataclysm/AchievementData.lua`. Both Retail and MoP Classic DBs return `Reward_lang = ""` for all four IDs. Wowhead confirms Ach(5344) grants the "Hero of the Alliance" title. The `:Title():PvP(N)` tags are correct; these are expected false positives caused by a DB data gap, not a tagging error.

### reward-item check

- **`:Toy()`, `:Transmog()`, and `:Other()` are valid reward-type markers** — MoP challenge-mode platinum rewards use these. Do NOT rely on wowhead search result item type labels to determine which to use — always open the actual item page. Observed across `Classic/05_MistsOfPandaria/AchievementData.lua`.

- **`"Toys:"` (plural) maps to `:Toy()`** — some Timerunning/Remix achievements use the plural form `"Toys: X"` instead of the singular `"Toy: X"`. The script's pattern `'^Toys?:'` covers both forms. Observed on Ach(20538) "Infinite Power XII" in `Retail/10_Dragonflight/AchievementData.lua`.

- **`"Unlocks X"` (verb form) maps to `:Other()`** — some achievements use `"Unlocks <content description>"` (verb, no colon) instead of the `"Unlock: X"` noun-prefix form. The script's pattern `'^Unlocks?[: ]'` covers both forms. Observed on Ach(17366/18368/18372) in `Retail/10_Dragonflight/AchievementData.lua`.

- **`"Future Timerunning X"` maps to `:Other()`** — Timerunning/Remix meta-progression rewards use this text format (e.g. `"Future Timerunning characters will begin with threads collected."`). These grant real in-game benefits to future Timerunning alts and are tagged with `:Other()`. Observed on Ach(20527–20537) in `Retail/10_Dragonflight/AchievementData.lua`.

- **`:Garrison()` is a valid reward-type marker** — garrison blueprint unlocks, monument rewards, and follower rewards use `:Garrison()`. The script recognises `"Follower: X"` and `"Garrison Monument Reward: X"` in `$isReward`. Observed across `Retail/06_WarlordsOfDaenor/AchievementData.lua`.

- **`:Tabard()` is a valid reward-type marker** — e.g. Ach(45) "Northrend Explorer". Observed in `Shared/03_WrathOfTheLichKing/AchievementData.lua`.

- **`:AlliedRace()` is a valid reward-type marker** — allied race unlock achievements (DB encodes as `"Reward: X Race Unlocked"`). Observed on Ach(12242–12245) in `Retail/07_Legion/AchievementData.lua`.

- **Retail DB uses specific-type `Reward_lang` prefixes** instead of the generic `"Reward:"` — `"Mount: X"`, `"Mount Reward: X"`, `"Pet: X"`, `"Toy: X"`, `"Unlock: X"`, `"Character Unlock: X"`, and others. Observed across `Shared/05_MistsOfPandaria/AchievementData.lua`.

- **`"Item Reward:"` prefix is a tangible-reward signal** — DB uses this for some specific item rewards (e.g. Ach(5859) "Legacy of Leyara" → `"Item Reward: Smoke-Stained Locket"`). Observed in `Shared/04_Cataclysm/AchievementData.lua`.

- **`"Appearance:"` prefix maps to `:Transmog()`** — Retail DB uses this for appearance/transmog unlock rewards (e.g. Ach(10172) "Petty Officer"). Observed in `Retail/06_WarlordsOfDaenor/AchievementData.lua`.

- **`"Demon Hunter Appearance:"` and `"Arsenal:"` are tangible-reward signals** — DH-restricted appearance rewards and weapon arsenal unlocks; tag with `:Transmog()`. Observed in `Retail/07_Legion/AchievementData.lua`.

- **`"Cross-Game Reward:"` maps to `:Other()`** — rewards content in other Blizzard games (e.g. Ach(10657) "Fledgling Hero of Warcraft"). Observed in `Retail/07_Legion/AchievementData.lua`.

- **`"Drake Customization:"` maps to `:Mount()`** — Dragonflight racing/skyriding customization rewards (e.g. `"Drake Customization: Renewed Proto-Drake - Red Hair"`). Observed in `Retail/10_Dragonflight/AchievementData.lua`.

- **`"Paint Color:"` maps to `:Mount()`** — mount paint colour unlocks (e.g. Ach(13513) "Available in Eight Colors" → `"Paint Color: Battletorn Blue"`). Same concept as `"Drake Customization:"` — changes a mount's appearance. No fixture entry added; this reward type is absent from the wow_classic fixture build. Observed in `Retail/08_BattleForAzeroth/AchievementData.lua`.

- **`"Decor Rewards:"` (plural) maps to `:HousingDecor()`** — the script's pattern `'^Decor Rewards?:'` covers both the singular `"Decor Reward:"` and plural `"Decor Rewards:"` forms. The plural form is used for PvP battleground achievements that grant multiple housing decor items (e.g. Ach(6981) "Master of Temple of Kotmogu" → `"Decor Rewards: Kotmogu Orb of Power, Kotmogu Pedestal"`). Observed in `Retail/05_MistsOfPandaria/AchievementData.lua`. Note: no fixture entry could be added — housing decor is a TWW-era feature absent from the wow_classic fixture build.

- **`"Pet Costume:"` maps to `:Pet()`** — cosmetic pet costume rewards (e.g. Ach(15508) "Fashion of the First Ones" → `"Pet Costume: Lovely Regal Pocopoc"`). Observed in `Retail/09_Shadowlands/AchievementData.lua`.

- **Some Classic MoP title rewards use `"Reward:"` in `Reward_lang`** — see title-reward note above for Ach(62060). These produce expected false positives in both the `title-reward` and `reward-item` checks.

- **`:WarbandCampsite()` reward type produces false positives** — the DB encodes warband campsite rewards as `"Warband Campsite: X"`. The script's `$isReward` pattern should include `'^Warband Campsite:'`. Observed on Ach(41555, 41586, 41970) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:KeystoneResilience()` reward type produces false positives** — these achievements grant a season-long keystone depletion immunity (DB: `"Keystones will no longer deplete below level X during the War Within Season Y."`). The script's `$isReward` pattern does not match this prose-style text. Observed on Ach(42149–42162, 42802–42806) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:RemixBronze():HousingDecor()` with `"Bronze Cache, Decor Reward:"` prefix produces false positives** — Legion Remix reputation achievements grant a bronze cache alongside a housing decor item, so `Reward_lang` reads `"Bronze Cache, Decor Reward: X"` or `"Greater Bronze Cache, Decor Reward: X"`. The existing `'^Decor Rewards?:'` pattern does not match when the string starts with the cache prefix. Observed on Ach(42318, 42321, 42547, 42619, 42627, 42628, 42655, 42658, 42674, 42675, 42689, 42692, 61054, 61060, 61218) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:RemixBronze()` alone (standalone cache reward)** — some Legion Remix achievements grant only a bronze cache with no decor item. `Reward_lang` reads `"Bronze Cache"`, `"Lesser Bronze Cache"`, `"Greater Bronze Cache"`, or `"Minor Bronze Cache"` (no `", Decor Reward:"` suffix). These are recognized by the `'\bCache$'` pattern in `$isReward`. `:RemixBronze()` must be in `$hasMethod`. Observed on entries in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:RemixBronze()` for bronze-progression prose rewards** — some achievements grant extra bronze for ongoing activities rather than a discrete cache item. `Reward_lang` is a sentence ending in `"Bronze"` (e.g. `"Infinite Research assignments grant additional Bronze"`). These are recognized by the `'\bBronze$'` pattern in `$isReward`. Observed on Ach(60961) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`"Decord Reward:"` (DB typo) produces a false positive for `:HousingDecor()`** — Ach(40612) "Sprinting in the Ravine" has `Reward_lang="Decord Reward: Deephaul Crystal"` (misspelled "Decord" instead of "Decor"). The `:HousingDecor()` tag is correct; the DB has a typo. Observed in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`"D.R.I.V.E. Engine:"` prefix maps to `:Mount()`** — Undermine racing achievements grant a D.R.I.V.E. engine cosmetic (e.g. `"D.R.I.V.E. Engine: the Pozzik Standard"`) which functions as a mount customization. Observed on Ach(41081) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:Transmog()` for item cache rewards with no recognized prefix** — some achievements grant a named cache that contains transmog items (e.g. Ach(41978) "Moonlighter" → `"Ethereal Sash Cache"`). The `:Transmog()` tag is correct; the script does not recognize "Cache" suffix as a transmog reward. Observed in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:Other()` for Seekerthread/Anglerthread warband-share rewards** — DB encodes these as a description: `"Share the Seekerthread collected across your Warband."` / `"Share the Anglerthread collected across your Warband."`. These are warband currency benefits, not a tangible item. `:Other()` is correct; the script flags them because the prose does not start with a recognised reward prefix. Observed on Ach(40476–40503) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **`:Other()` for Dastardly Duos gameplay-bonus rewards** — some event achievements grant in-match mechanical bonuses described in prose (e.g. `"Cheery bombs collect more cheers near you"`). `:Other()` is correct. Observed on Ach(41715, 41716, 41722) in `Retail/11_TheWarWithin/AchievementData.lua`.

- **PowerShell backtick-quote escaping** — error messages using `` `"$var`" `` prevent variable interpolation. Use `""` (double-quote escaping) inside double-quoted strings instead.

### description-lang check

- **Greedy suffix matching across word boundaries** — when two names share a common word ending (e.g. "Ghost**lands**"/"Wet**lands**"), the suffix algorithm can greedily include shared letters, producing mid-word splits. Fix: after computing the raw suffix, trim leftward until it starts at a non-alphanumeric character. Observed on Ach(4908)+Ach(12456) and Ach(5344)+Ach(5358) in `Retail/04_Cataclysm/AchievementData.lua`.

- **Plain `:FactionSplit()` comments use only the primary achievement's name** — unlike `:AutoFactionSplit()`, a plain `:FactionSplit(faction.X, Y)` comment should contain only the primary `Title_lang`, not the merged form. The script tracks `IsAutoSplit` and only calls `Get-MergedFactionComment` when `IsAutoSplit` is true. Observed on `Ach(12555):FactionSplit(faction.Horde, 12582)` in `Retail/08_BattleForAzeroth/AchievementData.lua`.

- **Faction-split comments with prefix only** — when two names share only a common prefix (no suffix ≥ 2), strip the prefix from the second name. E.g. `"In Service of the Alliance / Horde"`, `"Let's Do Lunch: Stormwind / Orgrimmar"`, `"Fish or Cut Bait: Ironforge / Thunder Bluff"`. Observed across `Shared/04_Cataclysm/AchievementData.lua`.

- **`"Reward: X Title & Y"` format with combined title + item** — e.g. `"Reward: Pilgrim Title & Plump Turkey Pet"`. The `title-reward` check accepts `^Reward:.*\bTitle\s*&`; tag with both `:Title()` and the item reward method (e.g. `:Pet()`). Observed on Ach(3478) "Pilgrim" in `Shared/03_WrathOfTheLichKing/AchievementData.lua`.

- **`:HousingDecor()` on pre-housing-era achievements has empty `Reward_lang` in the DB** — housing decor rewards were retroactively added to old achievements (Legion and earlier) but the DB `Reward_lang` was never updated. The `:HousingDecor()` tag is correct; these are expected false positives caused by a DB data gap. The script suppresses `reward-item` failures where `HasHousingDecor` is the sole method and `Reward_lang=""`. Observed on Ach(10398) "Drum Circle" (Decor: Skyhorn Arrow Kite) and Ach(11340) "Insurrection" (Decor: Deluxe Suramar Sleeper) in `Retail/07_Legion/AchievementData.lua`.
