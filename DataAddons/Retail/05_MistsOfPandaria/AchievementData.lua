local Ach = KrowiAF.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["05_00_04"] = {
	Ach(6981):HousingDecor(3880):IsPvP(), -- Master of Temple of Kotmogu
	Ach(7315):Obtainable("Before", "Version", {5, 4, 0}), -- Eternally in the Vale
}

KrowiAF.AchievementData["05_01_00"] = {
	Ach(7853):Obtainable("From", "Date", {2013, 11, 18}, "Until", "Date", {2013, 12, 1}), -- WoW's 9th Anniversary
	Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}):Obtainable("From", "Version", {11, 2, 7}), -- Bottle Service (Season 2)
}

KrowiAF.AchievementData["05_02_00"] = {
	Ach(8214):PvP(12), -- Malevolent Gladiator
	Ach(8238):Obtainable("Before", "Version", {5, 4, 0}), -- Cutting Edge: Lei Shen
	Ach(8249):Obtainable("Before", "Version", {5, 4, 0}), -- Ahead of the Curve: Lei Shen
	Ach(8260):Obtainable("Before", "Version", {5, 4, 0}), -- Cutting Edge: Ra-den
}

KrowiAF.AchievementData["05_03_00"] = {
	Ach(8316):HousingDecor(11160), -- Blood in the Snow
	Ach(8306):Title():AutoFactionSplit(faction.Alliance, 8307):Obtainable("Before", "Version", {5, 4, 0}), -- Hordebreaker / Darkspear Revolutionary
}

KrowiAF.AchievementData["05_04_00"] = {
	Ach(8791):PvP(13), -- Tyrannical Gladiator
}