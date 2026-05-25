-- Test fixture: known-good Retail (BfA) entries.
-- All entries should pass → script must exit 0 with "All N entries passed."
-- Build: wow (Retail). IDs sourced from verified Retail/08_BattleForAzeroth file.
--
-- Covers passing code paths relevant to Retail-specific edge cases:
--   Ach(12509) + Ach(12510) — mutual FactionSplit with asymmetric rewards
--     12509 (Horde) gives "Decor Reward: Lordaeron Rectangular Rug" → :HousingDecor()
--     12510 (Alliance) gives no reward → no reward modifier
--     Different reward method signatures → autofactionsplit-unique must NOT flag this pair

local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["08_00_01"] = {
	{KrowiAF.SetAchievementPatch, 8, 0, 1},
	Ach(12509):HousingDecor():FactionSplit(faction.Horde, 12510), -- Ready for War
	Ach(12510):FactionSplit(faction.Alliance, 12509), -- Ready for War
}
