local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["04_00_01"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 1},
	Ach(4832):Obtainable("Before", "Date", {2019, 6, 11}), -- Friends In Even Higher Places
	Ach(4887):Obtainable("From", "Date", {2010, 11, 1}, "Until", "Date", {2010, 11, 22}), -- Tripping the Rifts
	Ach(5377), -- Collector's Edition: Lil' Deathwing
	Ach(5378), -- Deathy
	Ach(5512):Obtainable("From", "Date", {2010, 11, 30}, "Until", "Date", {2010, 12, 14}), -- WoW's 6th Anniversary
}

KrowiAF.AchievementData["04_00_03"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 3},
	Ach(4859):HousingDecor(), -- Kings Under the Mountain
	Ach(4894):FactionSplit(faction.Horde, 12455), -- Silverpine Forest Quests
	Ach(4899):FactionSplit(faction.Alliance), -- Loch Modan Quests
	Ach(4903):FactionSplit(faction.Alliance), -- Westfall Quests
	Ach(4908):FactionSplit(faction.Horde, 12456), -- Ghostlands Quests
	Ach(5223):HousingDecor():IsPvP(), -- Master of Twin Peaks
	Ach(5245):HousingDecor():IsPvP(), -- Battle for Gilneas Victory
	Ach(5344):AutoFactionSplit(faction.Alliance, 5358):PvP(9), -- Hero of the Alliance / Horde: Vicious
	Ach(5442):HousingDecor(), -- Full Caravan
	Ach(5533):Obtainable("Before", "Version", {4, 0, 3}), -- Veteran of the Shifting Sands
}

KrowiAF.AchievementData["04_01_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 1, 0},
	Ach(5788):Obtainable("Before", "Version", {4, 0, 3}), -- Agent of the Shen'dralar
}

KrowiAF.AchievementData["04_02_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 2, 0},
	Ach(5863):Obtainable("From", "Date", {2011, 11, 20}, "Until", "Date", {2011, 12, 3}), -- WoW's 7th Anniversary
}

KrowiAF.AchievementData["04_03_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 3, 0},
	Ach(6131):Obtainable("From", "Date", {2012, 11, 18}, "Until", "Date", {2012, 12, 2}), -- WoW's 8th Anniversary
	Ach(6185), -- Murkablo
}

KrowiAF.AchievementData["04_03_02"] = {
	{KrowiAF.SetAchievementPatch, 4, 3, 2},
	Ach(6316):AutoFactionSplit(faction.Alliance, 6317):PvP(10), -- Hero of the Alliance / Horde: Ruthless
}