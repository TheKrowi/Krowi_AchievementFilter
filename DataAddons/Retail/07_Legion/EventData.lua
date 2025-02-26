local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.Legion = {
    { -- Legion Assaults: Azsuna
        5175, type.World,
        948,
        1408998,
		{addon.L["Legion Assaults"], addon.L["Azsuna"]},
        addon.L["Legion Assaults"],
        1,
        6,
        false,
        619
    },
    { -- Legion Assaults: Highmountain
        5177, type.World,
        948,
        1409000,
		{addon.L["Legion Assaults"], addon.L["Highmountain"]},
        addon.L["Legion Assaults"],
        1,
        6,
        false,
        619
    },
    { -- Legion Assaults: Stormheim
        5178, type.World,
        948,
        1409001,
		{addon.L["Legion Assaults"], addon.L["Stormheim"]},
        addon.L["Legion Assaults"],
        1,
        6,
        false,
        619
    },
    { -- Legion Assaults: Val'sharah
        5210, type.World,
        948,
        1409010,
		{addon.L["Legion Assaults"], addon.L["Val'sharah"]},
        addon.L["Legion Assaults"],
        1,
        6,
        false,
        619
    },
};