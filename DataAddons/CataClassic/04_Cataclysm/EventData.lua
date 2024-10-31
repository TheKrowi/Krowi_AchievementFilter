local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = addon.Objects.EventType;

KrowiAF.EventData.Cataclysm = {
    { -- Darkmoon Faire
        {374, 479}, type.Calendar,
        925,
        134481,
		addon.L["Darkmoon Faire"],
        addon.L["Holidays"],
        1
    },
    { -- WoW's 20th Anniversary
        1500, type.Calendar,
        1173,
        133783,
		addon.L["WoW's 20th Anniversary"],
        addon.L["Other"],
        2
    },
};