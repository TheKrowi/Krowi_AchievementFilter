# Wiki Log

## [2026-05-29] ingest | Achievement Data Format
## [2026-05-29] lint | V1 legacy references removed repo-wide; wiki and raw updated to reflect V2-only state
## [2026-05-29] ingest | Category Data Format
- Updated: Achievement Data Format (See Also link now resolves)
## [2026-05-29] lint | Achievement Data Format — corrected FactionSplit description and examples to match actual codebase usage
## [2026-05-30] ingest | Zone Data Format
## [2026-05-30] lint | Zone Data Format — expanded with entry type conventions, cross-zone repetition patterns, delve seasonal composition rules, boss-lair delve pattern, uncertain map ID notes
## [2026-06-19] ingest | Category Data Format — expanded with ordering, raid structure, MythicPlus pattern
- Raw: add-category-data Skill Reference (2026-06-19-add-category-data-skill-reference.md)
- Added: canMerge now includes Races; explicit table of what gets true vs omit
- Added: Standard Subcategory Order Within a Zone (Quests → Exploration → PvP → Reputation → Races → specific → bare)
- Added: Raid Sub-block Order (Glory → Mythic → flat block) with code example
- Added: MythicPlus Helper Pattern (shared.GetXxxMythicPlus in Shared/CategoryData.lua)
- Added: inline comment requirement for every achievement ID

## [2026-06-12] ingest | Achievement Data Format — expanded Obtainability section
- Raw: Obtainable Patterns Full Analysis (2026-06-12-obtainable-patterns-full-analysis.md)
- Fixed: Overview no longer mentions V1 legacy format
- Added: Never, Once, Before/Date cutoff, PvP/PvE Season during, version window, open-ended re-introduction patterns
- Added: chaining mechanics (last record governs filter state; all records in tooltip)
- Added: note on implicit start for cutoff patterns (BuildVersion.Id substitution)
- Added: new Common Patterns examples for all new patterns
## [2026-09-05] rewrite | Zone Data Format — builder syntax replaces the V1 table format; placement model (achievements now, criteria later); twelve placement rules with rationale; decision record D1 to D9; validation tooling incl. new raw/Evaluate-ZoneCriteria.ps1
- Raw: raw/ZoneDataDecisions.md (Reconciliation sweep backlog), .claude/skills/add-zone-data/SKILL.md (binding rule text)

## [2026-09-09] lint | Achievement Data Format — file header and Key Files table now name `KrowiAF.Ach` and `Api/AchievementDataBuilder.lua`; the last two `shared.Ach` stragglers (also in add-achievement-data SKILL.md) are gone
