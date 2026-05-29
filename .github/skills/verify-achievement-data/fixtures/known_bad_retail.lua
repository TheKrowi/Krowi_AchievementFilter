---@diagnostic disable: undefined-global
-- Test fixture: known-bad Retail (BfA) entries.
-- Each entry deliberately breaks exactly ONE check → expect 1 failure in 2 entries.
-- Build: wow (Retail).
--
-- autofactionsplit-unique (1 case):
--   Ach(12593) + Ach(13294) — mutual FactionSplit with SAME reward methods (neither has any)
--   Both exist, both are faction-specific (12593=Alliance, 13294=Horde), neither has a reward.
--   Same reward method signature → should be replaced by AutoFactionSplit on the primary.
--   → [FAIL] autofactionsplit-unique: Ach(12593) and Ach(13294) mutually reference each other

local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["08_01_00"] = {
	{KrowiAF.SetAchievementPatch, 8, 1, 0},
	Ach(12593):FactionSplit(faction.Alliance, 13294), -- Loremaster of Kul Tiras
	Ach(13294):FactionSplit(faction.Horde, 12593), -- Loremaster of Zandalar
}
