local _, addon = ...
addon.Data.ZoneData = {}
addon.Data.ZoneData.Shared = {}
local shared = addon.Data.ZoneData.Shared

shared.OldWorldPetAchievements = {
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6611, -- Continental Tamer
    6590, -- World Safari
}

shared.CrossExpansionDelves = {
    40436, -- You're Getting a Delve!
    40460, -- Delve Deep
    40462, -- Delve Deeper
    40463, -- Delve Deepest
    41095, -- Delve Beyond
    41096, -- Delve Infinite
    40819, -- Ready to Turn
    40788, -- I Got the Keys
    40882, -- Copious Coffers
    40885, -- The Key to Madness
    40817, -- A Delver's Bounty
    40863, -- Perplexing Puzzle
    40864, -- Plentiful Perplexing Puzzles
    41105, -- Prodigious Plentiful Perplexing Puzzles
}

local zoneData = KrowiAF.NewZoneData("CrossExpansion")

zoneData:Zone(947, { -- Azeroth (continent)
    971, -- Tricks and Treats of Azeroth
    1034, -- The Fires of Azeroth
    1035, -- Desecration of the Horde
    1036, -- The Fires of Azeroth
    1037, -- Desecration of the Alliance
})

zoneData:Zone({500, 503}, { -- Bizmo's Brawlpub / Brawl'gar Arena (zone)
    7947, -- The First Rule of Brawler's Guild (Season 1 or 2)
    7948, -- The First Rule of Brawler's Guild (Season 1 or 2)
    7937, -- You Are Not Your $#*@! Legplates (Season 1)
    8020, -- You Are Not Your $#*@! Legplates (Season 1)
    7940, -- The Second Rule of Brawler's Guild (Season 1)
    7939, -- The Second Rule of Brawler's Guild (Season 1)
    7941, -- Brawlin' and Shot Callin' (Season 1)
    7942, -- Brawlin' and Shot Callin' (Season 1)
    8335, -- Having a Brawl (Season 1)
    8337, -- Having a Brawl (Season 1)
    8336, -- I've Got the Biggest Brawls of Them All (Season 1)
    8338, -- I've Got the Biggest Brawls of Them All (Season 1)
    7946, -- Now You're Just Showing Off (Season 1)
    8022, -- Now You're Just Showing Off (Season 1)
    8340, -- Deck Your Collection (Season 1)
    8343, -- Deck Your Collection (Season 1)
    9168, -- You Are Not Your $#*@! Legplates (Season 2)
    9172, -- You Are Not Your $#*@! Legplates (Season 2)
    9169, -- The Second Rule of Brawler's Guild (Season 2)
    9173, -- The Second Rule of Brawler's Guild (Season 2)
    9170, -- Brawlin' and Shot Callin' (Season 2)
    9174, -- Brawlin' and Shot Callin' (Season 2)
    9171, -- Now You're Just Showing Off (Season 2)
    9175, -- Now You're Just Showing Off (Season 2)
    8339, -- Collect Your Deck (Season 2)
    8342, -- Collect Your Deck (Season 2)
    9176, -- Deck Your Collection (Season 2)
    9177, -- Deck Your Collection (Season 2)
    7949, -- Rabble Rabble Rabble (Season 2)
    7950, -- Rabble Rabble Rabble (Season 2)
    7943, -- I'm Your Number One Fan (Season 2)
    7945, -- Haters Gonna Hate (Season 2)
    7944, -- Bottle Service (Season 2)
    11558, -- The First Rule of Brawler's Guild
    11559, -- The First Rule of Brawler's Guild
    11560, -- You Are Not Your $#*@! Legplates (Season 3)
    11561, -- You Are Not Your $#*@! Legplates (Season 3)
    11563, -- The Second Rule of Brawler's Guild (Season 3)
    11564, -- The Second Rule of Brawler's Guild (Season 3)
    11565, -- King of the Guild (Season 3)
    11566, -- King of the Guild (Season 3)
    11572, -- I Am Thrall's Complete Lack Of Surprise (Season 3)
    13186, -- You Are Not Your $#*@! Legplates
    13188, -- You Are Not Your $#*@! Legplates
    13189, -- The Second Rule of Brawler's Guild
    13190, -- The Second Rule of Brawler's Guild
    13191, -- Brawler for Azeroth
    13192, -- Brawler for Azeroth
    13194, -- I Am Thrall's Complete Lack Of Surprise
    11573, -- Rumble Club
    11567, -- You Are Not The Contents Of Your Wallet
    11570, -- Educated Guesser
    61413, -- The First Rule of Brawler's Guild
    61414, -- The First Rule of Brawler's Guild
    61466, -- The Best There Is
    61419, -- Brawler's Chilled
    61420, -- Let Me Solo It
    61421, -- A Prime Ordeal
    61422, -- Audience Participation
    61423, -- Featherweight Brawler
    61424, -- Brawlzilla
    61425, -- Hot Footed
    61426, -- Bare Knuckle Brawl
    61429, -- Brawl Star
})

shared.GenericBattleground = {
    227, -- Damage Control
    229, -- The Grim Reaper
    231, -- Wrecking Ball
}