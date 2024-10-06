local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = addon.Objects.EventType;

KrowiAF.EventData.TheWarWithin = {
    { -- WoW's 20th Anniversary
        1500, type.Calendar,
        1173,
        133783,
		addon.L["WoW's 20th Anniversary"],
        addon.L["Other"],
        2
    },
    { -- WoW's 21st Anniversary
        1501, type.Calendar,
        1173,
        133783,
		addon.L["WoW's 21st Anniversary"],
        addon.L["Other"],
        2
    },
};