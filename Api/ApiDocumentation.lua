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