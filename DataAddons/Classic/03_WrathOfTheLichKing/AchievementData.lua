local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["03_00_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 0, 2},
	Ach(158):IsPvP(), -- Me and the Cappin' Makin' it Happen
	Ach(167):IsPvP(), -- Warsong Gulch Veteran
	Ach(200):IsPvP(), -- Persistent Defender
	Ach(212):IsPvP(), -- Storm Capper
	Ach(213):IsPvP(), -- Stormtrooper
	Ach(221):IsPvP(), -- Alterac Grave Robber
	Ach(222):IsPvP(), -- Tower Defense
	Ach(229):IsPvP(), -- The Grim Reaper
	Ach(231):IsPvP(), -- Wrecking Ball
	Ach(411):Obtainable("Never"), -- Murky
	Ach(412):Obtainable("Never"), -- Murloc Costume
	Ach(414):Obtainable("Never"), -- Tyrael's Hilt
	Ach(415):Obtainable("Never"), -- Big Blizzard Bear
	Ach(418):Title():PvP(2), -- Merciless Gladiator: Season 2
	Ach(419):Title():PvP(3), -- Vengeful Gladiator: Season 3
	Ach(420):Title():PvP(4), -- Brutal Gladiator: Season 4
	Ach(546):Obtainable("Before", "Version", {11, 2, 0}), -- Safe Deposit
	Ach(662):Obtainable("Never"), -- Collector's Edition: Mini-Diablo
	Ach(663):Obtainable("Never"), -- Collector's Edition: Panda
	Ach(664):Obtainable("Never"), -- Collector's Edition: Zergling
	Ach(665):Obtainable("Never"), -- Collector's Edition: Netherwhelp
	Ach(683):Obtainable("Never"), -- Collector's Edition: Frost Wyrm Whelp
	Ach(714):Title():IsPvP():AutoFactionSplit(faction.Horde, 907), -- The Conqueror / Justicar
	Ach(762):Title():AutoFactionSplit(faction.Horde, 948), -- Ambassador of the Horde / Alliance
	Ach(938), -- The Snows of Northrend
	Ach(940), -- The Green Hills of Stranglethorn
	Ach(957):Obtainable("Before", "Version", {4, 0, 1}), -- Hero of the Zandalar Tribe
	Ach(1153):IsPvP(), -- Overly Defensive
	Ach(1157):IsPvP(), -- Duel-icious
	Ach(1436):Obtainable("Never"), -- Friends In High Places
	Ach(2398):Obtainable("Never"), -- WoW's 4th Anniversary
	Ach(2456):Obtainable("Never"), -- Vampire Hunter
}

KrowiAF.AchievementData["03_02_00"] = {
	{KrowiAF.SetAchievementPatch, 3, 2, 0},
	Ach(3536):Obtainable("Never"), -- The Marine Marine
	Ach(3618):IsPvP():Obtainable("Never"), -- Murkimus the Gladiator
	Ach(3636):Obtainable("Never"), -- Jade Tiger
	Ach(3896):Obtainable("Never"), -- Onyx Panther
}

KrowiAF.AchievementData["03_02_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 2, 2},
	Ach(4400):Obtainable("Never"), -- WoW's 5th Anniversary
	Ach(4405), -- More Dots! (25 player)
}

KrowiAF.AchievementData["03_03_05"] = {
	{KrowiAF.SetAchievementPatch, 3, 3, 5},
	Ach(4824):Obtainable("Never"), -- Collector's Edition: Mini Thor
}

KrowiAF.AchievementData["03_04_00"] = {
	{KrowiAF.SetAchievementPatch, 3, 4, 0},
	Ach(15018):Title():PvP(1), -- Infernal Gladiator: Season 1
	Ach(15019):Title():PvP(1), -- Gladiator: Season 1
	Ach(15020):Title():PvP(1), -- Duelist: Season 1
	Ach(15021):Title():PvP(1), -- Rival: Season 1
	Ach(15022):Title():PvP(1), -- Challenger: Season 1
	Ach(15199):Title():PvP(2), -- Gladiator: Season 2
	Ach(15200):Title():PvP(4), -- Gladiator: Season 4
	Ach(15201):Title():PvP(4), -- Duelist: Season 4
	Ach(15202):Title():PvP(4), -- Rival: Season 4
	Ach(15203):Title():PvP(4), -- Challenger: Season 4
	Ach(15204):Title():PvP(3), -- Gladiator: Season 3
	Ach(15205):Title():PvP(3), -- Duelist: Season 3
	Ach(15206):Title():PvP(3), -- Rival: Season 3
	Ach(15207):Title():PvP(3), -- Challenger: Season 3
	Ach(15208):Title():PvP(2), -- Duelist: Season 2
	Ach(15209):Title():PvP(2), -- Rival: Season 2
	Ach(15210):Title():PvP(2), -- Challenger: Season 2
	Ach(15330):Title():Obtainable("Never"), -- Survivor of the Firelord (Season of Mastery)
	Ach(15333):Obtainable("Never"), -- Survivor of the Shadow Flame (Season of Mastery)
	Ach(15334):Obtainable("Never"), -- Survivor of the Old God (Season of Mastery)
	Ach(15335):Obtainable("Never"), -- Survivor of the Damned (Season of Mastery)
	Ach(15637):Obtainable("Never"), -- The Immortal (Season of Mastery)
	Ach(16313):Title():PvP(5), -- Rival: Season 5
	Ach(16314):Title():PvP(5), -- Gladiator: Season 5
	Ach(16315):Title():PvP(5), -- Duelist: Season 5
	Ach(16316):Title():PvP(5), -- Challenger: Season 5
	Ach(16332), -- The Perfect Pebble
	Ach(16433):Title():Obtainable("Never"), -- Soul of Iron (Season of Mastery)
}

KrowiAF.AchievementData["03_04_01"] = {
	{KrowiAF.SetAchievementPatch, 3, 4, 1},
	Ach(17213), -- Defense Protocol Alpha: Utgarde Keep
	Ach(17283), -- Defense Protocol Alpha: The Nexus
	Ach(17285), -- Defense Protocol Alpha: Azjol-Nerub
	Ach(17291), -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
	Ach(17292), -- Defense Protocol Alpha: Drak'Tharon Keep
	Ach(17293), -- Defense Protocol Alpha: The Violet Hold
	Ach(17295), -- Defense Protocol Alpha: Gundrak
	Ach(17297), -- Defense Protocol Alpha: Halls of Stone
	Ach(17299), -- Defense Protocol Alpha: Halls of Lightning
	Ach(17300), -- Defense Protocol Alpha: The Oculus
	Ach(17301), -- Defense Protocol Alpha: Utgarde Pinnacle
	Ach(17302), -- Defense Protocol Alpha: The Culling of Stratholme
	Ach(17304), -- Defense Protocol Alpha: Terminated
	Ach(17415):Title():PvP(6), -- Rival: Season 6
	Ach(17416):Title():PvP(6), -- Gladiator: Season 6
	Ach(17417):Title():PvP(6), -- Duelist: Season 6
	Ach(17418):Title():PvP(6), -- Challenger: Season 6
}

KrowiAF.AchievementData["03_04_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 4, 2},
	Ach(17340):Obtainable("Before", "Version", {3, 4, 3}), -- Ahead of the Curve: Yogg-Saron
	Ach(17341):Obtainable("Before", "Version", {3, 4, 3}), -- Cutting Edge: Ulduar
	Ach(18544):Title():PvP(7), -- Rival: Season 7
	Ach(18545):Title():PvP(7), -- Gladiator: Season 7
	Ach(18546):Title():PvP(7), -- Duelist: Season 7
	Ach(18547):Title():PvP(7), -- Challenger: Season 7
	Ach(18548):Title():PvP(8), -- Rival: Season 8
	Ach(18549):Title():PvP(8), -- Duelist: Season 8
	Ach(18550):Title():PvP(8), -- Challenger: Season 8
	Ach(18551):Title():PvP(8), -- Gladiator: Season 8
	Ach(18590), -- Defense Protocol Beta: Utgarde Keep
	Ach(18591), -- Defense Protocol Beta: The Nexus
	Ach(18592), -- Defense Protocol Beta: Azjol-Nerub
	Ach(18593), -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
	Ach(18594), -- Defense Protocol Beta: Drak'Tharon Keep
	Ach(18595), -- Defense Protocol Beta: The Violet Hold
	Ach(18596), -- Defense Protocol Beta: Gundrak
	Ach(18597), -- Defense Protocol Beta: Halls of Stone
	Ach(18598), -- Defense Protocol Beta: Halls of Lightning
	Ach(18599), -- Defense Protocol Beta: The Oculus
	Ach(18600), -- Defense Protocol Beta: Utgarde Pinnacle
	Ach(18601), -- Defense Protocol Beta: The Culling of Stratholme
	Ach(18614):AutoFactionSplit(faction.Alliance, 18688), -- Defense Protocol Beta: Terminated
	Ach(18677):AutoFactionSplit(faction.Alliance, 18678), -- Defense Protocol Beta: Trial of the Champion
}

KrowiAF.AchievementData["03_04_03"] = {
	{KrowiAF.SetAchievementPatch, 3, 4, 3},
	Ach(19425):AutoFactionSplit(faction.Horde, 19426), -- Defense Protocol Gamma: Trial of the Champion
	Ach(19427), -- Defense Protocol Gamma: Utgarde Keep
	Ach(19428), -- Defense Protocol Gamma: The Nexus
	Ach(19429), -- Defense Protocol Gamma: Azjol-Nerub
	Ach(19430), -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
	Ach(19431), -- Defense Protocol Gamma: Drak'Tharon Keep
	Ach(19432), -- Defense Protocol Gamma: The Violet Hold
	Ach(19433), -- Defense Protocol Gamma: Gundrak
	Ach(19434), -- Defense Protocol Gamma: Halls of Stone
	Ach(19435), -- Defense Protocol Gamma: Halls of Lightning
	Ach(19436), -- Defense Protocol Gamma: The Oculus
	Ach(19437), -- Defense Protocol Gamma: Utgarde Pinnacle
	Ach(19438), -- Defense Protocol Gamma: The Culling of Stratholme
	Ach(19439):Pet():AutoFactionSplit(faction.Alliance, 19440), -- Defense Protocol Gamma: Terminated
}
