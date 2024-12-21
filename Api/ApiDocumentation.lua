local _, addon = ...;

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

KrowiAF.AchievementData["03_00_02_Example1"] = {
    {KrowiAF.SetAchievementPatch, 3, 0, 2}, -- Patch settings, used to show the "Added in patch" info [Required]
    {6}, -- An achievement with only its Id [Optional]
    { -- Another achievement [Optional]
        37, -- Achievement Id [Required]
        KrowiAF.Enum.Faction.Alliance, -- Achievement faction [Optional]
        1357, -- Achievement Id for other faction [Optional]
    },
    { -- Another achievement [Optional]
        404, -- Achievement Id [Required]
        { -- Additional achievement info
            IsPvP = true, -- Achievement is a PvP achievement [Optional]
            {"Before", "Version", {7, 0, 3}}, -- Achievement temporary availability [Optional]
        },
    },
};