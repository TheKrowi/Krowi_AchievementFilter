local _, addon = ...
local shared = addon.Data.EventData.Shared
local type = KrowiAF.Enum.EventType
local source = KrowiAF.Enum.EventSource

-- The Curse Surges of The Coiled Isle: one area POI per variant, their times and names from Blizzard's event scheduler
-- (Data/EventScheduler.lua; docs/work/2026-10-21-event-scheduler). Each variant comes every 2.5 hours and lasts 30
-- minutes, so a new surge starts every half hour.
local function CurseSurge(areaPoiId)
    return {
        areaPoiId, type.World,
        2571,
        5764921, -- Turn the Surge
        addon.L["Curse Surges"],
        addon.L["Curse Surges"],
        1,
        11,
        false,
        false, -- no map: false, not nil, keeps the row without holes for the loader's tinsert and the task runner's unpack
        source.Scheduler,
    }
end

KrowiAF.EventData.Midnight = {
    { -- Winds of Mysterious Fortune
        {1636, 1670, 1671, 1672, 1683}, type.Calendar,
        2570,
        6439633,
        addon.L["Winds of Mysterious Fortune"],
        addon.L["Holidays"],
        1
    },
    CurseSurge(8936), -- Curse Surge: The Looming Mutagenitor
    CurseSurge(8937), -- Curse Surge: Siege at the Whispering Marsh
    CurseSurge(8938), -- Curse Surge: The Broodmother's Nest
    CurseSurge(8939), -- Curse Surge: Mlurkkr Massacre
    CurseSurge(8940), -- Curse Surge: The Malformed Leviathan
}