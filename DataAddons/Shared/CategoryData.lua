local _, addon = ...
addon.Data.CategoryData = {}
addon.Data.CategoryData.Shared = {}
local shared = addon.Data.CategoryData.Shared

shared.TheWarWithin = {}
local theWarWithin = shared.TheWarWithin

theWarWithin.MythicPlus = {
    { -- Season 1
        addon.L["Season"] .. " " .. 1,
        true,
        {
            20586, -- Keystone Hero: Ara-Kara, City of Echoes
            20582, -- Keystone Hero: City of Threads
            20585, -- Keystone Hero: The Dawnbreaker
            20580, -- Keystone Hero: The Stonevault
            15047, -- Keystone Hero: Mists of Tirna Scithe
            15045, -- Keystone Hero: The Necrotic Wake
            20587, -- Keystone Hero: Siege of Boralus
            20588, -- Keystone Hero: Grim Batol
            20523, -- The War Within Keystone Explorer: Season One
            20524, -- The War Within Keystone Conqueror: Season One
            20525, -- The War Within Keystone Master: Season One
            20526, -- The War Within Keystone Hero: Season One
            20589, -- Tempered Hero: The War Within Season 1
        },
    },
    { -- Season 2
        addon.L["Season"] .. " " .. 2,
        true,
        {
            20583, -- Keystone Hero: Cinderbrew Meadery
            20584, -- Keystone Hero: Darkflame Cleft
            20581, -- Keystone Hero: Priory of the Sacred Flame
            20579, -- Keystone Hero: The Rookery
            41348, -- Keystone Hero: Operation: Floodgate
            15050, -- Keystone Hero: Theater of Pain
            40966, -- Keystone Hero: Operation: Mechagon - Workshop
            40965, -- Keystone Hero: The MOTHERLODE!!
            40949, -- The War Within Keystone Explorer: Season Two
            40950, -- The War Within Keystone Conqueror: Season Two
            41533, -- The War Within Keystone Master: Season Two
            40952, -- The War Within Keystone Hero: Season Two
            40951, -- The War Within Keystone Legend: Season Two
            42139, -- The Enterprising Tank
            42141, -- The Enterprising Healer
            42144, -- The Enterprising Damage Dealer
            42148, -- The Enterprising Dungeon Master
            40954, -- Enterprising Hero: The War Within Season Two
        },
    },
    { -- Season 3
        addon.L["Season"] .. " " .. 3,
        {
            addon.L["Keystone Resilience"],
            true,
            {
                42149, -- The War Within Season 3: Resilient Keystone 12
                42150, -- The War Within Season 3: Resilient Keystone 13
                42151, -- The War Within Season 3: Resilient Keystone 14
                42152, -- The War Within Season 3: Resilient Keystone 15
                42153, -- The War Within Season 3: Resilient Keystone 16
                42154, -- The War Within Season 3: Resilient Keystone 17
                42155, -- The War Within Season 3: Resilient Keystone 18
                42156, -- The War Within Season 3: Resilient Keystone 19
                42157, -- The War Within Season 3: Resilient Keystone 20
                42158, -- The War Within Season 3: Resilient Keystone 21
                42159, -- The War Within Season 3: Resilient Keystone 22
                42160, -- The War Within Season 3: Resilient Keystone 23
                42161, -- The War Within Season 3: Resilient Keystone 24
                42162, -- The War Within Season 3: Resilient Keystone 25
                42802, -- The War Within Season 3: Resilient Keystone 26
                42803, -- The War Within Season 3: Resilient Keystone 27
                42804, -- The War Within Season 3: Resilient Keystone 28
                42805, -- The War Within Season 3: Resilient Keystone 29
                42806, -- The War Within Season 3: Resilient Keystone 30
            }
        },
        {
            20586, -- Keystone Hero: Ara-Kara, City of Echoes
            20585, -- Keystone Hero: The Dawnbreaker
            20581, -- Keystone Hero: Priory of the Sacred Flame
            41348, -- Keystone Hero: Operation: Floodgate
            42173, -- Keystone Hero: Eco-Dome Al'dani
            15048, -- Keystone Hero: Halls of Atonement
            15500, -- Keystone Hero: Tazavesh, the Veiled Market
            42169, -- The War Within Keystone Explorer: Season Three
            42170, -- The War Within Keystone Conqueror: Season Three
            41973, -- The War Within Keystone Master: Season Three
            42171, -- The War Within Keystone Hero: Season Three
            42172, -- The War Within Keystone Legend: Season Three
            61874, -- The Unbound Tank
            61875, -- The Unbound Healer
            61876, -- The Unbound Damage Dealer
            61877, -- The Unbound Dungeon Master
            42174, -- Unbound Hero: The War Within Season Three
        },
    },
    {
        40660, -- The War Within Season 1: Spelunker Supreme
        40723, -- Web-Wrapped in the Finest Silks
        40911, -- The War Within Season 2: Master Blaster
        41665, -- Dressed to the Mines
        41937, -- The War Within Season 3: Voidborne Victor
        42325, -- Void Wear Prohibited
    },
}

shared.GetTheWarWithinMythicPlus = function(categoryName)
    return {
        categoryName,
        unpack(theWarWithin.MythicPlus)
    }
end

shared.Midnight = {}
local midnight = shared.Midnight

midnight.MythicPlus = {
    { -- Season 1
        addon.L["Season"] .. " " .. 1,
        {
            addon.L["Keystone Resilience"],
            true,
            {
                61233, -- Midnight Season 1: Resilient Keystone 12
                61235, -- Midnight Season 1: Resilient Keystone 13
                61236, -- Midnight Season 1: Resilient Keystone 14
                61237, -- Midnight Season 1: Resilient Keystone 15
                61239, -- Midnight Season 1: Resilient Keystone 16
                61240, -- Midnight Season 1: Resilient Keystone 17
                61241, -- Midnight Season 1: Resilient Keystone 18
                61242, -- Midnight Season 1: Resilient Keystone 19
                61243, -- Midnight Season 1: Resilient Keystone 20
                61244, -- Midnight Season 1: Resilient Keystone 21
                61245, -- Midnight Season 1: Resilient Keystone 22
                61246, -- Midnight Season 1: Resilient Keystone 23
                61247, -- Midnight Season 1: Resilient Keystone 24
                61248, -- Midnight Season 1: Resilient Keystone 25
                61249, -- Midnight Season 1: Resilient Keystone 26
                61250, -- Midnight Season 1: Resilient Keystone 27
                61251, -- Midnight Season 1: Resilient Keystone 28
                61252, -- Midnight Season 1: Resilient Keystone 29
                61253, -- Midnight Season 1: Resilient Keystone 30
            }
        },
        {
            61267, -- Keystone Hero: Magisters' Terrace
            61269, -- Keystone Hero: Maisara Caverns
            61268, -- Keystone Hero: Nexus-Point Xenas
            61262, -- Keystone Hero: Windrunner Spire
            16643, -- Keystone Hero: Algeth'ar Academy
            61270, -- Keystone Hero: Seat of the Triumvirate
            61272, -- Keystone Hero: Skyreach
            61271, -- Keystone Hero: Pit of Saron
            61254, -- Midnight Keystone Explorer: Season One
            61255, -- Midnight Keystone Conqueror: Season One
            61256, -- Midnight Keystone Master: Season One
            61257, -- Midnight Keystone Hero: Season One
            61258, -- Midnight Keystone Legend: Season One
            61259, -- Umbral Hero: Midnight Season One
        },
    },
}

shared.GetMidnightMythicPlus = function(categoryName)
    return {
        categoryName,
        unpack(midnight.MythicPlus),
    }
end