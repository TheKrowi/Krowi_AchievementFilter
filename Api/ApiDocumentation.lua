KrowiAF.CategoryData.Example1 = {
    1, -- Category Id [Required]
    "General", -- Category Name [Optional][Required when the root is a new category]
    true, -- Can Merge [Optional]
    { -- Child Data [Optional]
        TabName = "GeneralTab", -- Tells the category to add itself as the root of the tab with this name [Optional]
        IgnoreFactionFilter = true, -- Tells the category to ignore the faction filter and always show all achievements regardless of faction [Optional]
        IgnoreCollapsedChainFilter = true, -- Tells the category to ignore the collapse chain filter (only show latest earned and not earned in chain) [Optional]
        Tooltip = "General achievements", -- Extra tooltip text shown when mousing over the category [Optional]
    },
    { -- A Child Category [Optional]
        2, -- Child Category Id [Optional]
        "Subcategory", -- Category name [Required]
        false, -- Can Merge [Optional]
        { -- Achievement Ids [Optional]
            2001, -- Achievement Id [Required]
            2002, -- Achievement Id [Required]
        },
    },
    { -- Another Child Category [Optional]
        "Subcategory", -- Category name [Required]
        { -- Achievement Ids [Optional]
            2003, -- Achievement Id [Required]
            2004, -- Achievement Id [Required]
        },
    },
    { -- Achievement Ids [Optional]
        2003, -- Achievement Id [Required]
        2005, -- Achievement Id [Required]
    },
};

-- V2 Achievement Data (current standard)
-- Use KrowiAF.AchievementData with the Ach() fluent builder.
local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
KrowiAF.AchievementData["03_00_02_Example1"] = {
    {KrowiAF.SetAchievementPatch, 3, 0, 2}, -- Patch settings, used to show the "Added in patch" info [Required]
    Ach(6), -- A simple achievement with only its Id [Optional]
    Ach(19408):HousingDecor(), -- Achievement with a reward type [Optional]
    Ach(20523):PvE(13), -- Achievement tied to a PvE season [Optional]
    Ach(40234):FactionSplit(KrowiAF.Enum.Faction.Horde, 40235):Title():PvP(38), -- Faction-split achievement with reward type and PvP season [Optional]
    Ach(40088):Pet():IsPvP(), -- PvP achievement with a reward type [Optional]
    Ach(40098):Title(), -- Achievement with a single reward type [Optional]
    Ach(20524):Title():PvE(13), -- Achievement with reward type and PvE season [Optional]
    Ach(20525):Mount():PvE(13), -- Achievement with mount reward and PvE season [Optional]
    Ach(20579):Teleport():PvE(14), -- Achievement with teleport reward [Optional]
    Ach(40307):AlliedRace(), -- Achievement that unlocks an allied race [Optional]
}