# add-category-data — Self-Judge Rubric

Run this checklist against your own CategoryData.lua edits before presenting them to the user.
Each item is a yes/no check. Any "no" is a finding — fix it or explicitly flag it to the user
with your reasoning. This rubric covers judgment calls the `_evaluate_coverage.ps1` script
cannot check (it only checks that every ID exists *somewhere*, not that it's in the *right*
place or *order*).

## Placement

- [ ] **Code style matches the target file.** Did you check whether the file already uses the
      V2 fluent builder API (`expansion:Zones()`, `zone:Quests{}`, `delves:Delve()`, etc. — see
      `Api/CategoryDataBuilder.lua`) or the older V1 raw-table style (`tinsert(..., {CT.X, true, {ids}})`)
      before writing new code? Never assume REFERENCE.md's example is the only valid style.
- [ ] **Cross-expansion achievements are NOT in the current expansion's file.** For every new ID,
      does its comment/name reference an OLD expansion or zone by name (e.g. "Family Battler of
      Outland", "... in Khaz Algar")? If so, it very likely belongs in THAT expansion's own
      `CategoryData.lua`, not the current patch's file. Check precedent with a grep for the
      exact achievement name pattern across `DataAddons/**/CategoryData.lua` first.
- [ ] **PvP/Events/Housing/Collections achievements are NOT in the expansion file.** Checked
      each new ID's achievement_category against:
      - `CategoryData_PvP.lua` (`KrowiAF.CategoryData.PvP`) — battlegrounds, arenas, Training Grounds
      - `CategoryData_Events.lua` — Brewfest/Hallow's End/other holiday achievements referencing
        the current expansion/zone by name
      - Confirmed always-out-of-scope categories: PvP ladder titles/mounts/transmog (achievement_category
        15270, 15269 Mounts under Feats of Strength), Housing (15606), Collections/Appearances (15259)
- [ ] **Keystone Hero appears in BOTH the season's flat MythicPlus block AND nested in the
      dungeon's own node.** Keystone Victor appears ONLY nested in the dungeon's own node, never
      flat in the season block.
- [ ] **A dungeon-specific Feat of Strength/lore achievement is inside that dungeon's node**,
      placed first (before base Normal/Heroic/Mythic clears).
- [ ] **A zone's own summary/meta achievement ("`<Zone>` Uncoiled" style) is in the zone's bare
      root list** (`zones:Zone(uiMapId, { metaId })`), not nested in `:Exploration{}`.
- [ ] **A rotating world-event mechanic gets its own category, scoped correctly**: expansion-wide
      (Ritual Sites/Void Assaults precedent) → `expansion:Named()`; single-zone-only → nested under
      that `ZoneBuilder` via `:Named(label, ids)` placed after `:Reputation{}`.
- [ ] **Delve `areaPoiId` picked the plain "Delve" record**, not a "Bountiful Delve" variant
      (cross-check against an existing delve's DB record if unsure).
- [ ] **Nemesis delve blocks include `40732 Heavy-Handed` first**, even if not present in the
      current patch's `AchievementData.lua` (it's a shared/reused achievement).

## Ordering

- [ ] **Season MythicPlus flat lists**: current-expansion dungeons alphabetically first, then
      old-expansion dungeons grouped chronologically by original release, alphabetically within
      the same old expansion.
- [ ] **Raid root `Raid()` id list**: boss-group/meta achievements first, then base difficulty
      clears (Normal → Heroic → Mythic), then AotC/CE last. Any non-glory achievement that got
      miscategorized into `:Glory{}` moves here, after AotC/CE.
- [ ] **`:Glory{}` and `:Mythic{}` sub-blocks follow boss encounter order** (derive order from
      the `:Mythic{}` boss-kill sequence; match each Glory achievement to its boss via the DB
      description, not alphabetically).
- [ ] **`prey:Named()` tier blocks**: misc/boss-kill achievements first, the tier's own
      "Prey: `<TierName>`" meta achievement LAST (mirrors Mode I/II/III trailing Hard/Nightmare).
- [ ] **New patch zones are ordered after previously-added patch zones** (`ZoneNamed`/`Named`
      blocks), not squeezed in right after the last full `Zone()` block — patch-chronological,
      not alphabetical.

## Coverage sanity (cross-check against the script, don't just trust it blindly)

- [ ] Ran `_evaluate_coverage.ps1` and it passed (or every FAIL item was individually justified
      to the user and, if confirmed out-of-scope, added to the script's allowlist).
- [ ] No achievement ID appears in a place that contradicts its DB category without a documented
      reason (spot-check a handful of placements against the DB category, not just presence).

## After running this rubric

State which items you checked, which (if any) required a fix, and which (if any) you're
flagging to the user as still-ambiguous. Do not silently skip a "no" — either fix it or say so.
