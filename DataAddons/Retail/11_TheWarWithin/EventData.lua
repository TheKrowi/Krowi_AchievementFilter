local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = addon.Objects.EventType;

KrowiAF.EventData.TheWarWithin = {
    { -- WoW's 20th Anniversary
        {1500, 1509, 1592, 1593, 1594, 1595}, type.Calendar,
        1678,
        6036545,
		addon.L["WoW's 20th Anniversary"],
        addon.L["Other"],
        2
    },
    -- { -- Timewalking Dungeon Event
    --     {1508, 1583, 1584, 1585}, type.Calendar,
    --     1678,
    --     6036545,
	-- 	addon.L["Timewalking Dungeon Event"],
    --     addon.L["Other"],
    --     2
    -- },
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