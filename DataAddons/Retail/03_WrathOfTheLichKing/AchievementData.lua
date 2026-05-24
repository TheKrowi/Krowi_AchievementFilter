local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["03_00_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 0, 2},
	Ach(158):HousingDecor():IsPvP(), -- Me and the Cappin' Makin' it Happen
	Ach(167):HousingDecor():IsPvP(), -- Warsong Gulch Veteran
	Ach(200):HousingDecor():IsPvP(), -- Persistent Defender
	Ach(212):HousingDecor():IsPvP(), -- Storm Capper
	Ach(213):HousingDecor():IsPvP(), -- Stormtrooper
	Ach(221):HousingDecor():IsPvP(), -- Alterac Grave Robber
	Ach(222):HousingDecor():IsPvP(), -- Tower Defense
	Ach(229):HousingDecor():IsPvP(), -- The Grim Reaper
	Ach(231):HousingDecor():IsPvP(), -- Wrecking Ball
	Ach(411), -- Murky
	Ach(412), -- Murloc Costume
	Ach(414), -- Tyrael's Hilt
	Ach(415), -- Big Blizzard Bear
	Ach(418):PvP(2), -- Merciless Gladiator
	Ach(419):PvP(3), -- Vengeful Gladiator
	Ach(420):PvP(4), -- Brutal Gladiator
	Ach(546), -- Safe Deposit
	Ach(662), -- Collector's Edition: Mini-Diablo
	Ach(663), -- Collector's Edition: Panda
	Ach(664), -- Collector's Edition: Zergling
	Ach(665), -- Collector's Edition: Netherwhelp
	Ach(683), -- Collector's Edition: Frost Wyrm Whelp
	Ach(714):Title():IsPvP():FactionSplit(faction.Horde, 907), -- The Conqueror
	Ach(762):Title():FactionSplit(faction.Horde, 948), -- Ambassador of the Horde
	Ach(907):Title():IsPvP():FactionSplit(faction.Alliance, 714), -- The Justicar
	Ach(938):HousingDecor(), -- The Snows of Northrend
	Ach(940):HousingDecor(), -- The Green Hills of Stranglethorn
	Ach(948):Title():FactionSplit(faction.Alliance, 762), -- Ambassador of the Alliance
	Ach(957):Obtainable("Event", 1592), -- Hero of the Zandalar Tribe
	Ach(1005):IsPvP():FactionSplit(faction.Horde, 246), -- Know Thy Enemy
	Ach(1006):IsPvP():FactionSplit(faction.Horde, 388), -- City Defender
	Ach(1153):HousingDecor():IsPvP(), -- Overly Defensive
	Ach(1157):HousingDecor():IsPvP(), -- Duel-icious
	Ach(1175):Title():IsPvP():FactionSplit(faction.Horde, 230), -- Battlemaster
	Ach(1436):Obtainable("Before", "Date", {2019, 6, 11}), -- Friends In High Places
	Ach(2398):Obtainable("From", "Date", {2008, 11, 23}, "Until", "Date", {2008, 12, 7}), -- WoW's 4th Anniversary
	Ach(2456):Obtainable("From", "Date", {2008, 10, 22}, "Until", "Date", {2008, 11, 4}), -- Vampire Hunter
}

KrowiAF.AchievementData["03_02_00"] = {
	{KrowiAF.SetAchievementPatch, 3, 2, 0},
	Ach(3536), -- The Marine Marine
	Ach(3618):IsPvP():Obtainable("From", "Date", {2013, 8, 21}, "Until", "Date", {2013, 8, 25}), -- Murkimus the Gladiator
	Ach(3636):Obtainable("From", "Date", {2009, 10, 19}, "Until", "Date", {2009, 11, 24}), -- Jade Tiger
	Ach(3896):Obtainable("From", "Date", {2009, 10, 1}, "Until", "Date", {2010, 2, 28}), -- Onyx Panther
}

KrowiAF.AchievementData["03_02_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 2, 2},
	Ach(4400):Obtainable("From", "Date", {2009, 11, 22}, "Until", "Date", {2009, 12, 6}), -- WoW's 5th Anniversary
	Ach(4405):HousingDecor(), -- More Dots! (25 player)
}

KrowiAF.AchievementData["03_03_05"] = {
	{KrowiAF.SetAchievementPatch, 3, 3, 5},
	Ach(4824), -- Collector's Edition: Mini Thor
}
