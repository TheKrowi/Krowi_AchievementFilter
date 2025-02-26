local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.TheBurningCrusade = {
    { -- Brewfest
        372, type.Calendar,
        914,
        236701,
		addon.L["Brewfest"],
        addon.L["Holidays"],
        1
    },
    { -- Pirates' Day
        398, type.Calendar,
        919,
        133168,
		addon.L["Pirates' Day"],
        addon.L["Holidays"],
        1
    },
};