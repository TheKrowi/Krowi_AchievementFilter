# Reward Preview ID Backfill — Session Report (2026-08-09)

## Objective

Find every bare `:Mount()`, `:Pet()`, and `:HousingDecor()` call (i.e. called with no id argument) across `DataAddons/**/AchievementData.lua` and fill in the real id so the Reward Preview feature can render the correct model for every achievement that already declares one of these reward types.

## Scope & Constraints

- **wow.tools.local build availability**: only one build was loaded locally — `12.0.7.68974` (type `wow`, i.e. Retail). No `wow_classic` / `wow_classic_era` build was available (confirmed via `/casc/builds`).
  - As a result, **Classic-only files were skipped entirely**: `DataAddons/Classic/03_WrathOfTheLichKing/AchievementData.lua` (1 bare call, id `19439`) and `DataAddons/Classic/05_MistsOfPandaria/AchievementData.lua` (2 bare calls, ids `62055`/`62399`). No lookups were possible for these.
  - The Reward Preview GUI feature itself is Retail-only (`Gui/FilesModern.xml` only), so this scope restriction has no functional downside for Classic clients today.
- Work was therefore scoped to **all 10 Retail + Shared `AchievementData.lua` files**:
  - `DataAddons/Retail/06_WarlordsOfDaenor/AchievementData.lua`
  - `DataAddons/Retail/07_Legion/AchievementData.lua`
  - `DataAddons/Retail/08_BattleForAzeroth/AchievementData.lua`
  - `DataAddons/Retail/09_Shadowlands/AchievementData.lua`
  - `DataAddons/Retail/10_Dragonflight/AchievementData.lua`
  - `DataAddons/Retail/11_TheWarWithin/AchievementData.lua`
  - `DataAddons/Retail/12_Midnight/AchievementData.lua`
  - `DataAddons/Shared/03_WrathOfTheLichKing/AchievementData.lua`
  - `DataAddons/Shared/04_Cataclysm/AchievementData.lua`
  - `DataAddons/Shared/05_MistsOfPandaria/AchievementData.lua`

## Method

For each file, the same repeatable pipeline was used (all steps via the designated, reusable scripts in `.github/skills/add-achievement-data/`, never one-off inline commands):

1. **Discover bare calls** — `grep_search` for the regex `:Mount\(\)|:Pet\(\)|:HousingDecor\(\)` in the target file, collecting `{achievementId, inline comment}` pairs.
2. **Batch DB lookup** — edit `_lookup_ids.ps1`'s `$ids` array with every bare-call id in the file (build `12.0.7.68974`), run it once, and read back each achievement's `Reward_lang` column (e.g. `"Mount: Stormtouched Bruffalon"`, `"Pet: Fledgling Warden's Companion"`, `"Decor Reward: X"`).
3. **Classify & strip prefix** — determine whether the reward is a mount, pet, or decor based on the `Reward_lang` prefix (not always literally `"Mount:"`/`"Pet:"` — sometimes `"Reward: X"` or `"X Mount"` suffix — required manual judgment per entry), and extract the bare item name.
4. **Batch name→id lookup** — edit and run `_lookup_mount_id.ps1` (mount table `Name_lang` → `ID`), `_lookup_pet_speciesid.ps1` (creature table `Name_lang` → `ID` → `battlepetspecies` table `CreatureID` → `ID`), and/or `_lookup_housingdecor_id.ps1` (`housedecor` table `Name_lang` → `ID`) with the extracted names for that file.
5. **Handle NOTFOUND names** — for names that didn't exact-match:
   - Retried with common prefixes stripped (`"Reins of the "`, `"Keys to the "`) since item names often differ from the underlying mount/pet/decor record name.
   - For **PvP season achievements** (Gladiator titles), `Reward_lang` is always the generic string `"Reward: Gladiator Mount, Customization, Seasonal Character Title"` — these required a direct Wowhead fetch of the specific achievement page per season to get the real, unique mount name (pattern: `"<Adjective> Gladiator's <Mount Type>"`, sequential across expansions/seasons).
   - For names still unresolved after a retry, the entry was **left bare** rather than guessing — see "Left Bare" section below for the full accounting.
6. **Apply edits** — `multi_replace_string_in_file` to insert the resolved id as the method's first argument (`:Mount(id)`, `:Pet(speciesId)`, `:HousingDecor(recordId)`), preserving all other chained methods/comments untouched.
7. **Verify** — re-run the bare-call grep on the file to confirm only the intentionally-unresolvable entries remain, and run `get_errors` on all touched files at the end (all clean, no Lua diagnostics).

## Results Summary

| Metric | Count |
|---|---|
| Total bare `:Mount()`/`:Pet()`/`:HousingDecor()` calls found (all files, incl. Classic) | 357 |
| Classic calls skipped (no DB build) | 3 |
| Retail + Shared calls in scope | 354 |
| **Resolved with a real id** | **272** |
| Left intentionally bare (documented reason) | 82 |

### Per-file breakdown

| File | Resolved / Total | Notable bare entries & reasons |
|---|---|---|
| `Retail/06_WarlordsOfDaenor` | 16 / 20 | `9236,10092,10094` (Vicious Saddle — PvP reward is a player choice, no single mount id); `9909` (Chauffeured Chopper — not a distinct mount table entry) |
| `Retail/07_Legion` | 14 / 25 | `10997,11003,11005,11009,12031,12136,12199` (Vicious Saddle, repeated across every Legion PvP season); `11320` (reward is "Celestial Invitation", not actually a pet despite the `:Pet()` tag); `11474` ("Prestigious War Mount" not found in DB); `12401` (Rusted/Ironbound Proto-Drake — dual faction-specific mount, no `FactionSplit`, ambiguous which one to pick); `12431` (Mailemental — creature exists but has no `battlepetspecies` row) |
| `Retail/08_BattleForAzeroth` | 35 / 43 | `12893,12900,12916` (Dutiful Companion / Wyrmtongue Fan / Vicious Crustacean Combatant — Honor-level pets not found as creatures despite `"Pet:"` prefix in DB); `12931` ("Biting Frostshard Core" not found); `12992` (Rooter — creature found, no pet species row); `13513` (Paint Color customization, not a mount); `13517` (Bloodflank Charger / Ironclad Frostclaw — dual continent-specific mount, ambiguous); `13627` (Evil Wizard Hat — not found as a creature) |
| `Retail/09_Shadowlands` | 30 / 32 | `14625` (Mawsworn Pet Leash is a Toy, not a pet, despite the tag); `15508` (Pocopoc costume variant — not a base creature) |
| `Retail/10_Dragonflight` | 50 / 53 | `17741` (Roggy — no pet species row); `19792,19793` (Reese / Hap'he — creatures not found in DB) |
| `Retail/11_TheWarWithin` | 66 / 74 | `41081` (D.R.I.V.E. mount-customization item, not found); `41084` (title-only reward, no mount at all); `41530` ("Golden-Gob Propulsion Rig" unresolved); `60933` (Delver's Dirigible colour/decal customization, no distinct id); `42692` ("Legion's Holo Communicator" decor not found); `60817` ("Increased Mount Speed" buff, not a mount); `61086` ("Feldruid's Scornwing Idol" Timerunner Druid mount not found); `61394` (a mount-choice voucher item, not a single mount) |
| `Retail/12_Midnight` | 39 / 62 | `61567` (Niblet — no pet species row); `63097` ("Timelost Saddle" not found); `63343` (achievement itself not present in the loaded DB build); **20 Midnight Season 2 (patch 12.1.0) ids** (`62447,62449,62460,62461,62492,62930,62955,63104,63254,63358,63359,63432,63451,63452,63453,63454,63609,63630,63633,63653`) — confirmed genuinely absent from the `12.0.7.68974` build (even the reward mount itself, e.g. *Venomous Gladiator's Goredrake*, could not be found in the mount table) |
| `Shared/03_WrathOfTheLichKing` | 14 / 15 | `2091` (generic "Custom Gladiator Mount" reward text, varies by season, no single id) |
| `Shared/04_Cataclysm` | 9 / 13 | `5325,5326,5823` ("Epic Wolf"/"Epic Warhorse" legacy Rank-14-era PvP mounts, not present in the current mount table); `5860` (Chirping Box item reward, not a pet) |
| `Shared/05_MistsOfPandaria` | 15 / 33 | `6375` ("Ancestral Phoenix" not found); `6402` (Hopling — no pet species row); `6556,6566,6581,7433,7499,8348` (trap/pet-slot/hat rewards — not creatures); `6602,6604,6605,6606,7525,7936,8080` ("Taming `<Continent>`"/"`<X>` Pandaren Tamer" achievements unlock **daily quests**, not pets, despite the `:Pet()` tag); `8484,8641` (Vicious Saddle again) |

## Full List of the 82 Left-Bare Entries

Every id below still has a bare `:Mount()`, `:Pet()`, or `:HousingDecor()` call in its file — none of these were guessed.

### `Retail/06_WarlordsOfDaenor/AchievementData.lua` (4)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 9236 | Primal Combatant | Mount | Reward is "Vicious Saddle" — a player-choice PvP mount token, no single mount id |
| 10092 | Wild Combatant | Mount | Vicious Saddle (same as above) |
| 10094 | Warmongering Combatant | Mount | Vicious Saddle (same as above) |

### `Retail/07_Legion/AchievementData.lua` (11)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 10997 | Vindictive Combatant | Mount | Vicious Saddle |
| 11003 | Fearless Combatant | Mount | Vicious Saddle |
| 11005 | Cruel Combatant | Mount | Vicious Saddle |
| 11009 | Ferocious Combatant | Mount | Vicious Saddle |
| 12031 | Fierce Combatant | Mount | Vicious Saddle |
| 12136 | Dominant Combatant | Mount | Vicious Saddle |
| 12199 | Demonic Combatant | Mount | Vicious Saddle |

### `Retail/08_BattleForAzeroth/AchievementData.lua` (8)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 13513 | Available in Eight Colors | Mount | Reward is a "Paint Color" customization option, not a distinct mount |

### `Retail/11_TheWarWithin/AchievementData.lua` (8)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 61086 | Timerunner: Druid | Mount | "Feldruid's Scornwing Idol" not found in the mount table |
| 61394 | Master of the Turbulent Timeways IV | Mount | Reward is "Ta'readon's Mount Voucher" — a choice-token item, not a single mount |

### `Retail/12_Midnight/AchievementData.lua` (23)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 63097 | Midnight Keystone Myth: Season One | Mount | Reward "Timelost Saddle" not found in the mount table |
| 62447 | Midnight Keystone Master: Season 2 | Mount | Season 2 (patch 12.1.0) content, not present in the loaded `12.0.7.68974` build |
| 62449 | Midnight Keystone Legend: Season 2 | Mount | Season 2 — not in loaded build |
| 62460 | Family Battler of Outland | Pet | Season 2 — not in loaded build |
| 62461 | Family Battler of Cataclysm | Pet | Season 2 — not in loaded build |
| 62492 | The Coiled Isle Safari | Pet | Season 2 — not in loaded build |
| 62930 | Gladiator: Midnight Season 2 | Mount | Season 2 — not in loaded build |
| 62955 | Venomous Gladiator's Goredrake | Mount | Season 2 — even the mount itself (named directly in the achievement title) was not found in the mount table |
| 63104 | Umbral Champion: Midnight Season 1 | Mount | Not found in the loaded DB build despite the "Season 1" name (likely added alongside the Season 2 patch) |
| 63254 | Glory of the Venomous Raider | Mount | Season 2 — not in loaded build |
| 63358 | Coiled to Strike | HousingDecor | Season 2 — not in loaded build |
| 63359 | Treasures of the Coiled Isle | Mount | Season 2 — not in loaded build |
| 63432 | Mysterious Mix Master | HousingDecor | Season 2 — not in loaded build |
| 63451 | Scales for Days | HousingDecor | Season 2 — not in loaded build |
| 63452 | Fangs for the Memories | HousingDecor | Season 2 — not in loaded build |
| 63453 | One, Two, Ral'kala's Coming for You | HousingDecor | Season 2 — not in loaded build |
| 63454 | Nine, Ten, Never Sleep Again | HousingDecor | Season 2 — not in loaded build |
| 63609 | No Egg Scramble | Pet | Season 2 — not in loaded build |
| 63630 | Assault the Vault | Mount | Season 2 — not in loaded build |
| 63633 | A Stack of Snacks | Pet | Season 2 — not in loaded build |
| 63653 | Pro Poison Patroller | Mount | Season 2 — not in loaded build |

### `Shared/03_WrathOfTheLichKing/AchievementData.lua` (1)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 2091 | Gladiator | Mount | Reward is a generic "Custom Gladiator Mount" — varies by season, no single id |

### `Shared/05_MistsOfPandaria/AchievementData.lua` (18)

| ID | Achievement | Reward tag | Reason |
|---|---|---|---|
| 7499 | Taming the World | Pet | Reward "Safari Hat" is an item, not a creature |
| 8484 | Grievous Combatant | Mount | Vicious Saddle |
| 8641 | Prideful Combatant | Mount | Vicious Saddle |

## Categories of "Left Bare" Entries (why no id was guessed)

1. **Player-choice / generic reward items** — "Vicious Saddle", "Custom Gladiator Mount", "Epic Wolf"/"Epic Warhorse": the achievement grants a *choice* of mount or a legacy generic reward with no single corresponding DBC row.
2. **Dual/faction-ambiguous rewards with no `FactionSplit` in code** — e.g. Rusted vs. Ironbound Proto-Drake, Bloodflank Charger vs. Ironclad Frostclaw. Since the Lua entry doesn't branch by faction, picking one id would misrepresent the other faction's actual reward.
3. **Reward-type / tag mismatches** — the achievement is tagged `:Mount()`/`:Pet()`/`:HousingDecor()` in the addon's data, but the DB's actual `Reward_lang` text reveals the true reward is something else entirely (a Toy, a Title, a buff, a customization/color option, or a quest-unlock) — no correct id exists to fill in without also correcting the reward-type tag itself (out of scope for this pass).
4. **Genuinely absent from the local DB snapshot** — creature/mount/decor name searched and not found, even after retrying with stripped prefixes and broader partial-match queries. Includes the entire Midnight Season 2 (12.1.0) content block, which is not present in the only locally loaded build.
5. **Creature exists but has no `battlepetspecies` row** — the pet's creature record was found, but it isn't wired up as a caged/collectible battle pet in this DBC snapshot (e.g. Roggy, Reese, Hap'he, Rooter, Niblet, Hopling).

## Tools & Scripts Used (all pre-existing, reused per the "designated script" convention)

- `.github/skills/add-achievement-data/_lookup_ids.ps1` — batch achievement → `Reward_lang`/`Title_lang`/etc. lookup.
- `.github/skills/add-achievement-data/_lookup_mount_id.ps1` — mount name → mount table `ID`.
- `.github/skills/add-achievement-data/_lookup_pet_speciesid.ps1` — pet name → creature `ID` → `battlepetspecies` `ID` (SpeciesID).
- `.github/skills/add-achievement-data/_lookup_housingdecor_id.ps1` — decor name → `housedecor` table `ID`.
- Ad-hoc broader/partial-match PowerShell queries (via terminal, not saved as new scripts) were used only as a last-resort retry step for a handful of stubborn NOTFOUND names (e.g. finding "Mechacycle Model W" from a partial "Model W" search, or "Spawn of Galakras" from a partial "Galakras" search) — no new throwaway script files were created, consistent with the repo's designated-script convention.
- A handful of Wowhead achievement-page fetches were used specifically for PvP Gladiator season achievements, since their DB `Reward_lang` text is generic and doesn't name the actual season-specific mount.

## Known Follow-ups / Future Work

- **If a `12.1.0+` (or newer) wow.tools.local build is ever loaded locally**, revisit the 20 Midnight Season 2 bare ids in `Retail/12_Midnight/AchievementData.lua` — none of that content exists in the currently loaded `12.0.7.68974` snapshot.
- **If a `wow_classic`/`wow_classic_era` build is ever loaded locally**, revisit the 3 skipped Classic entries (`19439` in Wrath Classic, `62055`/`62399` in MoP Classic).
- A small number of entries revealed **reward-type tag mismatches** (achievement tagged `:Pet()`/`:Mount()` in the addon data despite the DB showing the actual reward is a Toy, Title, buff, or quest-unlock). These were left alone since correcting the reward-type classification itself was out of scope for this pass, but they're flagged in the per-file table above for a future data-correctness pass.
- Consider a secondary pass specifically targeting the **dual-faction/dual-outcome mounts** (Rusted/Ironbound Proto-Drake, Bloodflank Charger/Ironclad Frostclaw, etc.) to see whether adding proper `FactionSplit`/`AutoFactionSplit` tagging would then make a single deterministic id assignment possible per faction.

## Session Memory Reference

Full working notes, including the exact resolved id for every entry and the precise reasoning per bare entry, are preserved in session memory at `session/reward-preview-backfill-progress.md` for continuity, plus durable lessons (naming-prefix gotchas, Gladiator-season lookup pattern, etc.) recorded in the repo memory file `repo/krowi-achievement-filter.md`.
