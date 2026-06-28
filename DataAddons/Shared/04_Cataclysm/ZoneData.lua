local _, addon = ...
addon.Data.ZoneData.Shared.Cataclysm = {}
local sharedCata = addon.Data.ZoneData.Shared.Cataclysm

local zoneData = KrowiAF.NewZoneData("Cataclysm")
sharedCata.ZoneData = zoneData

-- [[ Zones identical in Retail and Classic ]] --

zoneData:Zone(337, { -- Zul'Gurub (dungeon)
    560, -- Deadliest Catch
    688, -- Zul'Gurub
    880, -- Swift Zulian Tiger
    881, -- Swift Razzashi Raptor
    957, -- Hero of the Zandalar Tribe
    5743, -- It's Not Easy Being Green
    5762, -- Ohganot So Fast!
    5765, -- Here, Kitty Kitty...
    5759, -- Spirit Twister
    5744, -- Gurubashi Headhunter
    5768, -- Heroic: Zul'Gurub
})

zoneData:Zone(206, { -- Twin Peaks (battleground)
    5208, -- Twin Peaking
    5209, -- Twin Peaks Veteran
    5210, -- Two-Timer
    5211, -- Top Defender
    5213, -- Soaring Spirits
    5214, -- Soaring Spirits
    5215, -- Twin Peaks Perfection
    5216, -- Peak Speed
    5226, -- Cloud Nine
    5227, -- Cloud Nine
    5229, -- Drag a Maw
    5228, -- Wild Hammering
    5219, -- I'm in the White Lodge
    5220, -- I'm in the Black Lodge
    5221, -- Fire, Walk With Me
    5222, -- Fire, Walk With Me
    5230, -- Twin Peaks Mountaineer
    5231, -- Double Jeopardy
    5552, -- Double Jeopardy
    5223, -- Master of Twin Peaks
})

zoneData:Zone(244, { -- Tol Barad (battleground)
    5548, -- To All the Squirrels Who Cared for Me
    5489, -- Master of Tol Barad
    5490, -- Master of Tol Barad
    4874, -- Breaking Out of Tol Barad
    5718, -- Just Another Day in Tol Barad
    5719, -- Just Another Day in Tol Barad
    5412, -- Tol Barad Victory
    5418, -- Tol Barad Veteran
    5417, -- Tol Barad Veteran
    5415, -- Tower Plower
    5488, -- Towers of Power
    5487, -- Tol Barad Saboteur
    5486, -- Tol Barad All-Star
    5375, -- Baradin's Wardens
    5376, -- Hellscream's Reach
})

zoneData:Zone(245, { -- Tol Barad Peninsula (zone)
    2556, -- Pest Control
    5548, -- To All the Squirrels Who Cared for Me
    5489, -- Master of Tol Barad
    5490, -- Master of Tol Barad
    4874, -- Breaking Out of Tol Barad
    5718, -- Just Another Day in Tol Barad
    5719, -- Just Another Day in Tol Barad
    5412, -- Tol Barad Victory
    5418, -- Tol Barad Veteran
    5417, -- Tol Barad Veteran
    5415, -- Tower Plower
    5488, -- Towers of Power
    5487, -- Tol Barad Saboteur
    5486, -- Tol Barad All-Star
    5375, -- Baradin's Wardens
    5376, -- Hellscream's Reach
})

zoneData:Zone(275, { -- The Battle for Gilneas (battleground)
    5245, -- Battle for Gilneas Victory
    5246, -- Battle for Gilneas Veteran
    5247, -- Battle for Gilneas Perfection
    5248, -- Bustin' Caps to Make It Haps
    5249, -- One Two Three You Don't Know About Me
    5250, -- Out of the Fog
    5251, -- Not Your Average PUG'er
    5252, -- Don't Get Cocky Kid
    5253, -- Full Coverage
    5254, -- Newbs to Plowshares
    5255, -- Jugger Not
    5256, -- Battle for Gilneas All-Star
    5257, -- Battle for Gilneas Assassin
    5262, -- Double Rainbow
    5258, -- Master of the Battle for Gilneas
})

zoneData:Zone(282, { -- Baradin Hold (raid)
    5416, -- Pit Lord Argaloth
    6045, -- Occu'thar
    6108, -- Alizabal
})

zoneData:Zone(338, { -- Molten Front (zone)
    5859, -- Legacy of Leyara
    5866, -- The Molten Front Offensive
    5867, -- Flawless Victory
    5871, -- Master of the Molten Flow
    5872, -- King of the Spider-Hill
    5874, -- Death From Above
    5873, -- Ready for Raiding II
    5879, -- Veteran of the Molten Front
})

zoneData:Zone(398, { -- Well of Eternity (dungeon)
    6127, -- Lazy Eye
    6070, -- That's Not Canon!
    6118, -- Heroic: Well of Eternity
})

zoneData:Zone({399, 400}, { -- Hour of Twilight (dungeon)
    6132, -- Eclipse
    6119, -- Heroic: Hour of Twilight
})

zoneData:Zone({401, 402, 403, 404, 405, 406}, { -- End Time (dungeon)
    5995, -- Moon Guard
    6130, -- Severed Ties
    6117, -- Heroic: End Time
})
