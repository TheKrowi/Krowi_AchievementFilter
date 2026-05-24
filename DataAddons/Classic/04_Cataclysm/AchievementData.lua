local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["04_00_01"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 1},
	Ach(4832):Obtainable("Never"), -- Friends In Even Higher Places
	Ach(4887):Obtainable("Never"), -- Tripping the Rifts
	Ach(5377):Obtainable("Never"), -- Collector's Edition: Lil' Deathwing
	Ach(5378):Obtainable("Never"), -- Deathy
	Ach(5512):Obtainable("Never"), -- WoW's 6th Anniversary
}

KrowiAF.AchievementData["04_00_03"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 3},
	Ach(4859), -- Kings Under the Mountain
	Ach(4894):AutoFactionSplit(faction.Horde, 4903), -- Silverpine Forest / Redridge Mountains (Classic) Quests
	Ach(4908):AutoFactionSplit(faction.Horde, 4899), -- Ghostlands / Loch Modan Quests
	Ach(5223):IsPvP(), -- Master of Twin Peaks
	Ach(5245):IsPvP(), -- Battle for Gilneas Victory
	Ach(5344):AutoFactionSplit(faction.Alliance, 5358):Title():PvP(9), -- Hero of the Alliance / Horde: Vicious
	Ach(5364):Obtainable("Before", "Version", {6, 0, 2}), -- Don't Want No Zombies on My Lawn
	Ach(5365):Obtainable("Before", "Version", {6, 0, 2}), -- Bloom and Doom
	Ach(5442), -- Full Caravan
	Ach(5533):Obtainable("Never"), -- Veteran of the Shifting Sands
}

KrowiAF.AchievementData["04_01_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 1, 0},
	Ach(5788):Obtainable("Never"), -- Agent of the Shen'dralar
}

KrowiAF.AchievementData["04_02_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 2, 0},
	Ach(5863):Obtainable("Never"), -- WoW's 7th Anniversary
}

KrowiAF.AchievementData["04_03_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 3, 0},
	Ach(6131):Obtainable("Never"), -- WoW's 8th Anniversary
	Ach(6185):Obtainable("Never"), -- Murkablo
}

KrowiAF.AchievementData["04_03_02"] = {
	{KrowiAF.SetAchievementPatch, 4, 3, 2},
	Ach(6316):AutoFactionSplit(faction.Alliance, 6317):Title():PvP(10), -- Hero of the Alliance / Horde: Ruthless
}

KrowiAF.AchievementData["04_04_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 4, 0},
	Ach(40968):Title():PvP(9), -- Rival: Season 9
	Ach(40969):Title():PvP(9), -- Gladiator: Season 9
	Ach(40970):Title():PvP(9), -- Duelist: Season 9
	Ach(40971):Title():PvP(9), -- Challenger: Season 9
}

KrowiAF.AchievementData["04_04_01"] = {
	{KrowiAF.SetAchievementPatch, 4, 4, 1},
	Ach(41139), -- Protocol Inferno: Blackrock Caverns
	Ach(41140), -- Protocol Inferno: Throne of the Tides
	Ach(41141), -- Protocol Inferno: The Stonecore
	Ach(41142), -- Protocol Inferno: The Vortex Pinnacle
	Ach(41143), -- Protocol Inferno: Grim Batol
	Ach(41144), -- Protocol Inferno: Halls of Origination
	Ach(41145), -- Protocol Inferno: Lost City of the Tol'vir
	Ach(41146), -- Protocol Inferno: Deadmines
	Ach(41147), -- Protocol Inferno: Shadowfang Keep
	Ach(41148), -- Protocol Inferno: Terminated
	Ach(41332):Title():PvP(10), -- Rival: Season 10
	Ach(41333):Title():PvP(10), -- Duelist: Season 10
	Ach(41334):Title():PvP(10), -- Challenger: Season 10
	Ach(41336):Title():PvP(10), -- Gladiator: Season 10
}