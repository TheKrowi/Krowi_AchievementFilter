local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = addon.Objects.EventType;

KrowiAF.EventData.Dragonflight = {
    { -- Kalimdor Cup
        1395, type.Calendar,
        1453,
        1100022,
		addon.L["Kalimdor Cup"],
        addon.L["Other"],
        2
    },
    { -- Secrets of Azeroth
        {1396, 1398, 1399}, type.Calendar,
        1452,
        4419345,
		addon.L["Secrets of Azeroth"],
        addon.L["Other"],
        2
    },
    { -- WoW's 19th Anniversary
        1397, type.Calendar,
        1173,
        133783,
		addon.L["WoW's 19th Anniversary"],
        addon.L["Other"],
        2,
        nil,
        true
    },
    { -- Eastern Kingdoms Cup
        1400, type.Calendar,
        1531,
        1100022,
		addon.L["Eastern Kingdoms Cup"],
        addon.L["Other"],
        2
    },
    { -- Outland Cup
        1407, type.Calendar,
        1535,
        1100022,
		addon.L["Outland Cup"],
        addon.L["Other"],
        2
    },
    { -- Turbulent Timeways
        {1425, 1458, 1459, 1460}, type.Calendar,
        1538,
        4630413,
		addon.L["Turbulent Timeways"],
        addon.L["Other"],
        2
    },
    { -- Northrend Cup
        1429, type.Calendar,
        1559,
        1100022,
		addon.L["Northrend Cup"],
        addon.L["Other"],
        2
    },
    { -- Pandaria Cup
        1430, type.Calendar,
        1560,
        1100022,
		addon.L["Pandaria Cup"],
        addon.L["Other"],
        2
    },
    { -- Broken Isles Cup
        1431, type.Calendar,
        1561,
        1100022,
		addon.L["Broken Isles Cup"],
        addon.L["Other"],
        2
    },
    { -- Hearthstone's 10th Anniversary
        1462, type.Calendar,
        1563,
        1061040,
		addon.L["Hearthstone's 10th Anniversary"],
        addon.L["Other"],
        2
    },
    { -- WoW Remix: Mists of Pandaria
        {1514, 1515, 1516, 1525}, type.Calendar,
        1578,
        5754532,
		addon.L["WoW Remix: Mists of Pandaria"],
        addon.L["Other"],
        2
    },
};