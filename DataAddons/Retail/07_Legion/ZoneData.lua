local _, addon = ...
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("Legion")

zoneData:Zone({650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660}, { -- Highmountain (zone)
    7520, -- The Loremaster
    2556, -- Pest Control
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    11186, -- Tehd & Marius' Excellent Adventure
    11544, -- Defender of the Broken Isles
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    11474, -- Free For All, More For Me
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    10059, -- Ain't No Mountain High Enough
    10774, -- Hatchling of the Talon
    10626, -- Zoom!
    10398, -- Drum Circle
    11427, -- No Shellfish Endeavor
    61910, -- Mrglgrgl of Grglmrgl
    10667, -- Explore Highmountain
    11257, -- Treasures of Highmountain
    11264, -- Adventurer of Highmountain
    11478, -- The Darkbrul-oh
    12292, -- Highmountain Tribe
    46, -- Universal Explorer
})

zoneData:Zone(903, { -- Seat of the Triumvirate (dungeon)
    12004, -- Welcome the Void
    12005, -- Let it All Out
    12009, -- Darker Side
    12007, -- Heroic: Seat of the Triumvirate
    12008, -- Mythic: Seat of the Triumvirate
    61270, -- Keystone Hero: Seat of the Triumvirate
    61593, -- Keystone Victor: Seat of the Triumvirate
})

zoneData:Zone({24, 626, 647, 648, 695, 702, 709, 717, 718, 719, 720, 721, 725, 726, 734, 735, 739, 747, 1468, 1471, 1475}, { -- Light's Hope Chapel (class halls)
    10994, 11135, 11136, 10706, 11212, 11213, 11214, 11215, 11216, 11217, 11219, 11220, 11221, 11222, 11223, 11298,
    10746, 10459, 10743, 10745, 10460, 10461, 10747, 10748, 11173, 10749, 10750, 11171, 11137, 11611, 11612, 11144,
    11772, 11609, 11610, 10852, 10853, 12071, 12072, 11218,
})