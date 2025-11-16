local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.TheWarWithin = {
    { -- WoW's 20th Anniversary
        {1500, 1509, 1592, 1593, 1594, 1595}, type.Calendar,
        1678,
        6036545,
		addon.L["WoW's 20th Anniversary"],
        addon.L["Other"],
        2,
		nil,
		true
    },
    { -- WoW's 21st Anniversary
        1501, type.Calendar,
        1173,
        133783,
		addon.L["WoW's 21st Anniversary"],
        addon.L["Other"],
        2
    },
    { -- Dastardly Duos
        {1599, 1689}, type.Calendar,
        1681,
        6740278,
		addon.L["Dastardly Duos"],
        addon.L["Other"],
        2
    },
	{ -- WoW Remix: Legion
		{1640, 1641, 1642, 1643, 1644, 1697}, type.Calendar,
		2569,
		4622478,
		addon.L["Legion: Remix"],
		addon.L["Other"],
		2
	},
	{ -- Theater Troupe: The Wanderer: Next
		7943, type.World,
		1676,
		134927,
		{addon.L["Theater Troupe"], addon.L["The Wanderer: Next"]},
		addon.L["Theater Troupe"],
		2,
		10,
		false,
		2248,
	},
	{ -- Theater Troupe: The Cruelty of Dornic: Next
		8076, type.World,
		1676,
		134927,
		{addon.L["Theater Troupe"], addon.L["The Cruelty of Dornic: Next"]},
		addon.L["Theater Troupe"],
		2,
		10,
		false,
		2248,
	},
	{ -- Theater Troupe: The Rivals: Next
		8077, type.World,
		1676,
		134927,
		{addon.L["Theater Troupe"], addon.L["The Rivals: Next"]},
		addon.L["Theater Troupe"],
		2,
		10,
		false,
		2248,
	},
	{ -- Theater Troupe: Forget Me Not: Next
		8078, type.World,
		1676,
		134927,
		{addon.L["Theater Troupe"], addon.L["Forget Me Not: Next"]},
		addon.L["Theater Troupe"],
		2,
		10,
		false,
		2248,
	},
	{ -- Theater Troupe: The Thraegar's Descent: Next
		8079, type.World,
		1676,
		134927,
		{addon.L["Theater Troupe"], addon.L["The Thraegar's Descent: Next"]},
		addon.L["Theater Troupe"],
		2,
		10,
		false,
		2248,
	},
};