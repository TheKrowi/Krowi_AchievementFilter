local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = addon.Objects.EventType;

KrowiAF.EventData.Shadowlands = {
    { -- WoW's 18th Anniversary
        1262, type.Calendar,
        1173,
        133783,
		addon.L["WoW's 18th Anniversary"],
        addon.L["Other"],
        2,
        nil,
        true
    },
    { -- Covenant assaults: Necrolord
        6989, type.World,
        929,
        3257749,
		{addon.L["Covenant assaults"], addon.L["Necrolord"]},
        addon.L["Covenant assaults"],
        1,
        8,
        false,
        1550
    },
    { -- Covenant assaults: Venthyr
        6990, type.World,
        931,
        3257751,
		{addon.L["Covenant assaults"], addon.L["Venthyr"]},
        addon.L["Covenant assaults"],
        1,
        8,
        false,
        1550
    },
    { -- Covenant assaults: Kyrian
        6991, type.World,
        928,
        3257748,
		{addon.L["Covenant assaults"], addon.L["Kyrian"]},
        addon.L["Covenant assaults"],
        1,
        8,
        false,
        1550
    },
    { -- Covenant assaults: Night Fae
        6992, type.World,
        930,
        3257750,
		{addon.L["Covenant assaults"], addon.L["Night Fae"]},
        addon.L["Covenant assaults"],
        1,
        8,
        false,
        1550
    },
};