local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

local battleForAzerothMenuCriteria =  {
    {1, {156526, 162288, 162289}, type.Item}, -- Bountiful Captain's Feast
    {1, {259421, 259422, 259423}, type.Spell}, -- Bountiful Captain's Feast
    {2, {156525, 162287}, type.Item}, -- Galley Banquet
    {2, {259418, 259420, 259419}, type.Spell}, -- Galley Banquet
    {3, {162292, 154889}, type.Item}, -- Grilled Catfish
    {3, {259432, 259430, 259431}, type.Spell}, -- Grilled Catfish
    {4, {154882, 162286}, type.Item}, -- Honey-Glazed Haunches
    {4, {259414, 259415, 259416}, type.Spell}, -- Honey-Glazed Haunches
    {5, {154881, 162285}, type.Item}, -- Kul Tiramisu
    {5, {259412, 259411, 259413}, type.Spell}, -- Kul Tiramisu
    {6, {162294, 154887}, type.Item}, -- Loa Loaf
    {6, {259438, 259436, 259437}, type.Spell}, -- Loa Loaf
    {7, {162296, 154885}, type.Item}, -- Mon'Dazi
    {7, {259442, 259443, 259444}, type.Spell}, -- Mon'Dazi
    {8, {154883, 162290}, type.Item}, -- Ravenberry Tarts
    {8, {259424, 259425, 259426}, type.Spell}, -- Ravenberry Tarts
    {9, {154888, 162295}, type.Item}, -- Sailor's Pie
    {9, {259441, 259439, 259440}, type.Spell}, -- Sailor's Pie
    {10, {162293, 154891}, type.Item}, -- Seasoned Loins
    {10, {259434, 259433, 259435}, type.Spell}, -- Seasoned Loins
    {11, {162297, 154886}, type.Item}, -- Spiced Snapper
    {11, {259447, 259445, 259446}, type.Spell}, -- Spiced Snapper
    {12, {154884, 162291}, type.Item}, -- Swamp Fish 'n Chips
    {12, {259427, 259429, 259428}, type.Spell}, -- Swamp Fish 'n Chips    
};

KrowiAF.TooltipData.BattleForAzeroth = {
    { -- The Zandalari Menu
        12746,
        {
            Faction = PLAYER_FACTION_GROUP.Horde,
        },
        battleForAzerothMenuCriteria
    },
    { -- The Zandalari Menu
        12744,
        {
            Faction = PLAYER_FACTION_GROUP.Alliance,
        },
        battleForAzerothMenuCriteria
    },
};