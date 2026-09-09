local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.Midnight = {
    { -- Winds of Mysterious Fortune
        {1636, 1670, 1671, 1672, 1683}, type.Calendar,
        2570,
        6439633,
        addon.L["Winds of Mysterious Fortune"],
        addon.L["Holidays"],
        1
    },
};