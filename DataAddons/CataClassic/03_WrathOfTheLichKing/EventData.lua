local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.WrathOfTheLichKing = {
    { -- Pilgrim's Bounty
        404, type.Calendar,
        916,
        250626,
		addon.L["Pilgrim's Bounty"],
        addon.L["Holidays"],
        1
    },
    { -- Day of the Dead
        409, type.Calendar,
        920,
        237272,
        addon.L["Day of the Dead"],
        addon.L["Holidays"],
        1
    },
};