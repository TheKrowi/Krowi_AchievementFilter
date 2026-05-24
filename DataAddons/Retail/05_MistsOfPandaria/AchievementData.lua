local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["05_00_04"] = {
	{KrowiAF.SetAchievementPatch, 5, 0, 4},
	Ach(6981):HousingDecor():IsPvP(), -- Master of Temple of Kotmogu
}

KrowiAF.AchievementData["05_01_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 1, 0},
	Ach(7853):Obtainable("From", "Date", {2013, 11, 18}, "Until", "Date", {2013, 12, 1}), -- WoW's 9th Anniversary
	Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}):Obtainable("From", "Version", {11, 2, 7}), -- Bottle Service (Season 2)
}

KrowiAF.AchievementData["05_02_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 2, 0},
	Ach(8214):PvP(12), -- Malevolent Gladiator
}

KrowiAF.AchievementData["05_03_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 3, 0},
	Ach(8316):HousingDecor(), -- Blood in the Snow
}

KrowiAF.AchievementData["05_04_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 4, 0},
	Ach(8791):PvP(13), -- Tyrannical Gladiator
}