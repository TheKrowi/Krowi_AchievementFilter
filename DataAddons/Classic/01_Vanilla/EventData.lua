local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.Vanilla = {
    { -- Feast of Winter Veil
        141, type.Calendar,
        917,
        236705,
        addon.L["Feast of Winter Veil"],
        addon.L["Holidays"],
        1
    },
    { -- Noblegarden
        181, type.Calendar,
        911,
        237000,
		addon.L["Noblegarden"],
        addon.L["Holidays"],
        1
    },
    { -- Children's Week
        201, type.Calendar,
        912,
        134508,
		addon.L["Children's Week"],
        addon.L["Holidays"],
        1
    },
    { -- Hallow's End
        324, type.Calendar,
        915,
        236552,
		addon.L["Hallow's End"],
        addon.L["Holidays"],
        1
    },
    { -- Lunar Festival
        327, type.Calendar,
        885,
        236704,
		addon.L["Lunar Festival"],
        addon.L["Holidays"],
        1
    },
    { -- Midsummer Fire Festival
        341, type.Calendar,
        913,
        135268,
		addon.L["Midsummer Fire Festival"],
        addon.L["Holidays"],
        1
    },
    { -- Love is in the Air
        423, type.Calendar,
        910,
        236709,
		addon.L["Love is in the Air"],
        addon.L["Holidays"],
        1
    },
};