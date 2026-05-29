---@diagnostic disable: undefined-global
-- Test fixture: known-bad WotLK entries.
-- Each entry deliberately breaks exactly ONE check → expect 10 failures in 10 entries.
-- Build: wow_classic (WotLK Classic).
--
-- id-exists (1 case):
--   Ach(99999) → [FAIL] id-exists        — ID does not exist in DB
-- faction (3 cases — one per distinct branch):
--   Ach(714)   → [FAIL] faction          — DB Faction=0 (Horde), no :FactionSplit()
--   Ach(907)   → [FAIL] faction          — DB Faction=1 (Alliance), no :FactionSplit()
--   Ach(938)a  → [FAIL] faction          — DB Faction=-1 (both) but has :FactionSplit()
-- title-reward (2 cases — both branches):
--   Ach(418)   → [FAIL] title-reward     — DB has title reward but :Title() is absent
--   Ach(938)b  → [FAIL] title-reward     — :Title() present but DB has no title reward
-- reward-item (2 cases — both branches):
--   Ach(940)   → [FAIL] reward-item      — :Mount() present but DB has no tangible reward
--   Ach(2136)  → [FAIL] reward-item      — DB has tangible reward but no reward method
-- description-lang (2 cases — plain mismatch + AutoFactionSplit mismatch):
--   Ach(938)c  → [FAIL] description-lang — plain entry, comment is wrong
--   Ach(714)b  → [FAIL] description-lang — AutoFactionSplit entry, comment is wrong (partial name)

KrowiAF.AchievementData["03_00_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 0, 2},
	-- id-exists
	Ach(99999), -- Fake Achievement
	-- faction
	Ach(714):Title():IsPvP(), -- The Conqueror
	Ach(907):Title(), -- The Justicar
	Ach(938):FactionSplit(faction.Alliance, nil), -- The Snows of Northrend
	-- title-reward
	Ach(418), -- Merciless Gladiator: Season 2
	Ach(938):Title(), -- The Snows of Northrend
	-- reward-item
	Ach(940):Mount(), -- The Green Hills of Stranglethorn
	Ach(2136), -- Glory of the Hero
	-- description-lang
	Ach(938), -- Incorrect Comment
	Ach(714):Title():AutoFactionSplit(faction.Horde, 907), -- The Conqueror
}
