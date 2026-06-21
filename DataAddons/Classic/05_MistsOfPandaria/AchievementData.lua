local Ach = KrowiAF.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["05_00_04"] = {
	Ach(6981):IsPvP(), -- Master of Temple of Kotmogu
}

KrowiAF.AchievementData["05_01_00"] = {
	Ach(7853):Obtainable("Never"), -- WoW's 9th Anniversary
	Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}), -- Bottle Service
}

KrowiAF.AchievementData["05_02_00"] = {
	Ach(8214):Title():PvP(12), -- Malevolent Gladiator: Season 12 (3v3)
}

KrowiAF.AchievementData["05_03_00"] = {
	Ach(8316), -- Blood in the Snow
}

KrowiAF.AchievementData["05_04_00"] = {
	Ach(8791):Title():PvP(13), -- Tyrannical Gladiator: Season 13 (3v3)
}

KrowiAF.AchievementData["05_05_00"] = {
	Ach(8913), -- Collector's Edition: Dread Raven
	Ach(8915), -- Collector's Edition: Dread Hatchling
	Ach(42762):Title():PvP(12), -- Challenger: Season 12
	Ach(42763):Title():PvP(12), -- Duelist: Season 12
	Ach(42764):Title():PvP(12), -- Rival: Season 12
	Ach(42765):Title():PvP(12), -- Gladiator: Season 12 (3v3)
	Ach(42772):Title():PvP(11), -- Rival: Season 11
	Ach(42774):Title():PvP(11), -- Duelist: Season 11
	Ach(42775):Title():PvP(11), -- Challenger: Season 11
	Ach(42777):Title():PvP(11), -- Gladiator: Season 11
	Ach(60892), -- Celestial: Temple of the Jade Serpent
	Ach(60893), -- Celestial: Stormstout Brewery
	Ach(60894), -- Celestial: Mogu'shan Palace
	Ach(60895), -- Celestial: Shado-Pan Monastery
	Ach(60896), -- Celestial: Gate of the Setting Sun
	Ach(60897), -- Celestial: Scarlet Halls
	Ach(60898), -- Celestial: Scarlet Monastery
	Ach(60899), -- Celestial: Scholomance
	Ach(60900), -- Celestial: Siege of Niuzao Temple
	Ach(60901), -- Pandaria Celestial Hero
}

KrowiAF.AchievementData["05_05_01"] = {
	Ach(61096):Title():PvP(13), -- Gladiator: Season 13 (3v3)
	Ach(61097):Title():PvP(13), -- Duelist: Season 13
	Ach(61098):Title():PvP(13), -- Challenger: Season 13
	Ach(61099):Title():PvP(13), -- Rival: Season 13
	Ach(61350):Title():PvP(12), -- Gladiator: Season 12 (2v2)
	Ach(61351):Title():PvP(13), -- Gladiator: Season 13 (2v2)
	Ach(61352):Title():PvP(14), -- Gladiator: Season 14 (2v2)
	Ach(61353):Title():PvP(15), -- Gladiator: Season 15 (2v2)
	Ach(61354):Title():PvP(12), -- Malevolent Gladiator: Season 12 (2v2)
	Ach(61355):Title():PvP(13), -- Tyrannical Gladiator: Season 13 (2v2)
	Ach(61356):Title():PvP(14), -- Grievous Gladiator: Season 14 (2v2)
	Ach(61357):Title():PvP(15), -- Prideful Gladiator: Season 15 (2v2)
	Ach(61358):Title():PvP(12), -- Gladiator: Season 12 (5v5)
	Ach(61359):Title():PvP(13), -- Gladiator: Season 13 (5v5)
	Ach(61360):Title():PvP(14), -- Gladiator: Season 14 (5v5)
	Ach(61361):Title():PvP(15), -- Gladiator: Season 15 (5v5)
	Ach(61362):Title():PvP(12), -- Malevolent Gladiator: Season 12 (5v5)
	Ach(61363):Title():PvP(13), -- Tyrannical Gladiator: Season 13 (5v5)
	Ach(61364):Title():PvP(14), -- Grievous Gladiator: Season 14 (5v5)
	Ach(61365):Title():PvP(15), -- Prideful Gladiator: Season 15 (5v5)
	Ach(61415):Title():PvP(12), -- Undisputed Gladiator: Season 12
	Ach(61416):Title():PvP(13), -- Undisputed Gladiator: Season 13
	Ach(61417):Title():PvP(14), -- Undisputed Gladiator: Season 14
	Ach(61418):Title():PvP(15), -- Undisputed Gladiator: Season 15
	Ach(61459):AutoFactionSplit(faction.Horde, 61460):PvP(12), -- Malevolent Conquest
}

KrowiAF.AchievementData["05_05_03"] = {
	Ach(61962):Title(), -- Realm First! Challenge Conqueror: Platinum (Season 2)
	Ach(61963):Title(), -- Realm First! Challenge Conqueror: Platinum (Season 3)
	Ach(61967):Toy(), -- Temple of the Jade Serpent: Platinum
	Ach(61968):Toy(), -- Stormstout Brewery: Platinum
	Ach(61969):Toy(), -- Mogu'shan Palace: Platinum
	Ach(61970):Toy(), -- Shado-Pan Monastery: Platinum
	Ach(61971):Toy(), -- Gate of the Setting Sun: Platinum
	Ach(61972):Toy(), -- Scarlet Halls: Platinum
	Ach(61973):Toy(), -- Scarlet Monastery: Platinum
	Ach(61974):Toy(), -- Scholomance: Platinum
	Ach(61975):Toy(), -- Siege of Niuzao Temple: Platinum
	Ach(61987):Other(), -- Challenge Conqueror: Platinum (Season 1)
	Ach(61990):Other(), -- Challenge Conqueror: Platinum (Season 2)
	Ach(61991):Other(), -- Challenge Conqueror: Platinum (Season 3)
	Ach(62055):Mount(), -- The Mistwalker
	Ach(62059):Title(), -- Mistborne
	Ach(62060):Title(), -- Heir to the Mist
	Ach(62399):Mount(), -- The Mistwalker
}