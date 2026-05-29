# Achievement Data Verification Report

**Date:** 2026-05-25
**Build:** 12.0.5.67602 (Retail) / 5.5.3.67509 (Classic)
**Files checked:** 16 (all `DataAddons/**/AchievementData.lua` excluding the top-level `Shared/AchievementData.lua` which contains no `Ach()` entries)

---

## Summary

| File | Entries | Failures |
|------|--------:|--------:|
| `Shared/03_WrathOfTheLichKing` | 1151 | 6 (+ 3 false positives) |
| `Shared/04_Cataclysm` | 408 | 0 ✅ |
| `Shared/05_MistsOfPandaria` | 749 | 2 |
| `Classic/03_WrathOfTheLichKing` | 122 | 0 ✅ |
| `Classic/04_Cataclysm` | 38 | 0 ✅ (2 false positives) |
| `Classic/05_MistsOfPandaria` | 70 | 2 |
| `Retail/03_WrathOfTheLichKing` | 39 | 0 ✅ |
| `Retail/04_Cataclysm` | 20 | 0 ✅ |
| `Retail/05_MistsOfPandaria` | 6 | 0 ✅ |
| `Retail/06_WarlordsOfDaenor` | 605 | 0 ✅ |
| `Retail/07_Legion` | 702 | 11 |
| `Retail/08_BattleForAzeroth` | 658 | 12 |
| `Retail/09_Shadowlands` | 588 | 0 ✅ |
| `Retail/10_Dragonflight` | 1208 | 0 ✅ |
| `Retail/11_TheWarWithin` | 1175 | 63 |
| `Retail/12_Midnight` | 648 | 19 |
| **Total** | **8181** | **115** (+ 5 false positives) |

---

## Failures by File

### `Shared/03_WrathOfTheLichKing` — 6 failures (+ 3 false positives)

#### `autofactionsplit-unique` (3) — FALSE POSITIVES
These pairs have **different `:Obtainable()` windows on each side**, which `:AutoFactionSplit()` cannot represent — it propagates the primary's metadata to the secondary unchanged. Mutual `:FactionSplit()` is therefore the correct representation. The existing script exception only covers asymmetric reward methods; it does not cover asymmetric obtainability.

| Primary | `:Obtainable()` | Secondary | `:Obtainable()` |
|---------|----------------|-----------|----------------|
| `Ach(610)` | Before 8.0.1 | `Ach(615)` | Before 9.0.1 |
| `Ach(611)` | Before 9.0.1 | `Ach(616)` | *(none)* |
| `Ach(612)` | Before 9.0.1 | `Ach(617)` | Before 8.0.1 |

> **Script gap:** The `autofactionsplit-unique` check should also skip mutual `:FactionSplit()` pairs where the two entries differ in `:Obtainable()` metadata.

#### `description-lang` (6)
Plain `:FactionSplit()` entries use the single DB name as their comment (no merging). The `A / B` convention belongs to `:AutoFactionSplit()` only. These comments incorrectly use the merged form.

| Entry | Comment in Lua | Expected (DB name) |
|-------|---------------|--------------------|
| `Ach(610)+Ach(615)` | `"Orgrimmar Offensive / Storming Stormwind"` | `"Orgrimmar Offensive"` |
| `Ach(615)+Ach(610)` | `"Storming Stormwind / Orgrimmar Offensive"` | `"Storming Stormwind"` |
| `Ach(611)+Ach(616)` | `"Bleeding Bloodhoof / Overthrow the Council"` | `"Bleeding Bloodhoof"` |
| `Ach(616)+Ach(611)` | `"Overthrow the Council / Bleeding Bloodhoof"` | `"Overthrow the Council"` |
| `Ach(612)+Ach(617)` | `"Downing the Dark Lady / Immortal No More"` | `"Downing the Dark Lady"` |
| `Ach(617)+Ach(612)` | `"Immortal No More / Downing the Dark Lady"` | `"Immortal No More"` |

---

### `Shared/05_MistsOfPandaria` — 2 failures

#### `description-lang` (2)
Comments include extra words compared to DB names.

| Entry | Comment in Lua | Expected (DB) |
|-------|---------------|---------------|
| `Ach(6602)+Ach(6603)` | `"Taming Kalimdor / Taming Eastern Kingdoms"` | `"Taming Kalimdor / Eastern Kingdoms"` |
| `Ach(6941)+Ach(6942)` | `"Hero of the Horde / Hero of the Alliance"` | `"Hero of the Horde / Alliance"` |

---

### `Classic/04_Cataclysm` — 0 real failures (2 false positives)

#### `title-reward` (2) — FALSE POSITIVES
The Classic DB (build 5.5.3.67509) has empty `Reward_lang` for both entries, but Wowhead confirms the Season 9 pair (5344/5358) grants the "Hero of the Alliance/Horde" title. Season 10 (6316/6317) follows the identical FoS pattern (top 0.5% RBG) and almost certainly also grants a title — Wowhead's page shows no reward section, which is consistent with older FoS data gaps rather than a genuine absence.

| ID | Name | Wowhead title grant |
|----|------|--------------------|
| `Ach(5344)` | Hero of the Alliance: Vicious (S9) | ✅ confirmed |
| `Ach(6316)` | Hero of the Alliance: Ruthless (S10) | ⚠ not shown (likely data gap) |

> **Root cause:** The Classic build does not populate `Reward_lang` for these PvP FoS title rewards. The `:Title()` tags are correct.

---

### `Classic/05_MistsOfPandaria` — 2 failures

#### `title-reward` + `reward-item` (same entry)
- `Ach(62060)`: tagged `:Title()` but DB `Reward_lang="Reward: Heir to the Mist"` (not a title); also missing a matching tangible reward method (`:Mount()` or similar)

---

### `Retail/07_Legion` — 11 failures

#### `reward-item` (2)
Has a reward method tag but DB `Reward_lang` is empty.

- `Ach(10398)`
- `Ach(11340)`

#### `faction` (9)
DB `Faction=-1` (both factions) but entries use `:FactionSplit()`.

- `Ach(11210)`, `Ach(12242)`, `Ach(12243)`, `Ach(12244)`, `Ach(12245)`, `Ach(12291)`, `Ach(12413)`, `Ach(12414)`, `Ach(12415)`

---

### `Retail/08_BattleForAzeroth` — 12 failures

#### `faction` (12)
DB `Faction=-1` (both factions) but entries use `:FactionSplit()`.

- `Ach(12515)`, `Ach(12518)`, `Ach(13076)`, `Ach(13077)`, `Ach(13161)`, `Ach(13163)`, `Ach(13503)`, `Ach(13504)`, `Ach(13206)`, `Ach(14002)`, `Ach(14013)`, `Ach(14014)`

---

### `Retail/11_TheWarWithin` — 63 failures

All `reward-item` — has a reward method but DB reward text is non-tangible.

#### Warband Seekerthread (10)
DB: `"Share the Seekerthread collected across your Warband."`

`Ach(40476)`, `Ach(40480)`, `Ach(40484)`, `Ach(40485)`, `Ach(40487)`, `Ach(40488)`, `Ach(40489)`, `Ach(40490)`, `Ach(40491)`, `Ach(40492)`

#### Warband Anglerthread (10)
DB: `"Share the Anglerthread collected across your Warband."`

`Ach(40494)`, `Ach(40495)`, `Ach(40496)`, `Ach(40497)`, `Ach(40498)`, `Ach(40499)`, `Ach(40500)`, `Ach(40501)`, `Ach(40502)`, `Ach(40503)`

#### Keystone Depletion Floor — Season 3 (19)
DB: `"Keystones will no longer deplete below level N during the War Within Season 3."`

`Ach(42149)`–`Ach(42162)` (levels 12–25), `Ach(42802)`–`Ach(42806)` (levels 26–30)

#### Bronze / Greater Bronze Cache + Decor Rewards (15)
| ID | DB Reward_lang |
|----|---------------|
| `Ach(40612)` | `"Decord Reward: Deephaul Crystal"` |
| `Ach(42318)` | `"Bronze Cache, Decor Reward: Tome of the Corrupt"` |
| `Ach(42321)` | `"Bronze Cache, Decor Reward: Corruption Pit"` |
| `Ach(42547)` | `"Bronze Cache, Decor Reward: Hanging Felsteel Cage"` |
| `Ach(42619)` | `"Bronze Cache, Decor Reward: Legion's Fel Brazier"` |
| `Ach(42627)` | `"Bronze Cache, Decor Reward: Eredar Lord's Fel Torch"` |
| `Ach(42628)` | `"Bronze Cache, Decor Reward: Large Legion Candle"` |
| `Ach(42655)` | `"Bronze Cache, Decor Reward: Demonic Storage Chest"` |
| `Ach(42658)` | `"Bronze Cache, Decor Reward: Vrykul Lord's Throne"` |
| `Ach(42674)` | `"Greater Bronze Cache, Decor Reward: Altar of the Corrupted Flames"` |
| `Ach(42675)` | `"Greater Bronze Cache, Decor Reward: Vertical Felsteel Chain"` |
| `Ach(42689)` | `"Bronze Cache, Decor Reward: Fel Fountain"` |
| `Ach(42692)` | `"Bronze Cache, Decor Reward: Legion's Holo Communicator"` |
| `Ach(61054)` | `"Greater Bronze Cache, Decor Reward: Legion Torture Rack"` |
| `Ach(61060)` | `"Bronze Cache, Decor Reward: Legion's Fel Torch"` |

#### Other Non-Tangible Rewards (9)
| ID | DB Reward_lang |
|----|---------------|
| `Ach(41081)` | `"D.R.I.V.E. Engine: the Pozzik Standard"` |
| `Ach(41555)` | `"Warband Campsite: Freywold Spring"` |
| `Ach(41586)` | `"Warband Campsite: Gallagio Grand Gallery"` |
| `Ach(41715)` | `"Cheery bombs collect more cheers near you"` |
| `Ach(41716)` | `"Gain higher scores when you don't die in Dastardly Duos matches"` |
| `Ach(41722)` | `"Workers hide an extra present inside one Dastardly Duos prop."` |
| `Ach(41970)` | `"Warband Campsite: The Fate of the Devoured"` |
| `Ach(41978)` | `"Ethereal Sash Cache"` |
| `Ach(61218)` | `"Bronze Cache, Decor Reward: Sentinel's Moonwing Gaze"` |

---

### `Retail/12_Midnight` — 19 failures

#### `reward-item` (19)
Keystone depletion floor rewards (Season 1, levels 12–30) — tagged with a reward method but DB reward text is non-tangible.

`Ach(61233)`, `Ach(61235)`, `Ach(61236)`, `Ach(61237)`, `Ach(61239)`, `Ach(61240)`, `Ach(61241)`, `Ach(61242)`, `Ach(61243)`, `Ach(61244)`, `Ach(61245)`, `Ach(61246)`, `Ach(61247)`, `Ach(61248)`, `Ach(61249)`, `Ach(61250)`, `Ach(61251)`, `Ach(61252)`, `Ach(61253)`
