local _, addon = ...

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

-- V2 Category Data Injection (current standard for plugins)
-- Use KrowiAF.NewInjection to add named subcategories under an existing KrowiAF category.
-- The target category Id must be a built-in KrowiAF category that is always processed first.
-- Call RegisterAs with a unique key before KrowiAF.CreateCategories runs (e.g. during PLAYER_LOGIN).
--
-- Migration example based on a plugin that previously used V1 format:
--
-- V1 (old):
--   KrowiAF.CategoryData.KhamulsExpansionMetaAchievementLists = {
--       971, -- existing category Id to inject into
--       {
--           L["Khamul's Meta-Expansion Achievement List"],
--           { 14808, 14814, 14821 }, -- BfA achievements
--           { 15259, 15260, 15261 }, -- Shadowlands achievements
--           { 16462, 16463, 16464 }, -- Dragonflight achievements
--           { 19763, 19764, 19765 }, -- The War Within achievements
--       },
--   }
--
-- V2 (new), flat — all IDs in one named subcategory:
local injection = KrowiAF.NewInjection(971) -- Existing category Id [Required]
injection:Named(addon.L["Khamul's Meta-Expansion Achievement List"], { -- Named subcategory [Optional, repeatable]
    14808, 14814, 14821, -- BfA achievements [Required]
    15259, 15260, 15261, -- Shadowlands achievements [Required]
    16462, 16463, 16464, -- Dragonflight achievements [Required]
    19763, 19764, 19765, -- The War Within achievements [Required]
})
injection:RegisterAs("KhamulsExpansionMetaAchievementLists") -- Unique key in KrowiAF.CategoryData [Required]

-- V2, grouped — one named subcategory per group:
local groupedInjection = KrowiAF.NewInjection(971)
groupedInjection:Named(addon.L["Battle for Azeroth"], { 14808, 14814, 14821 })
groupedInjection:Named(addon.L["Shadowlands"],        { 15259, 15260, 15261 })
groupedInjection:Named(addon.L["Dragonflight"],       { 16462, 16463, 16464 })
groupedInjection:Named(addon.L["The War Within"],     { 19763, 19764, 19765 })
groupedInjection:RegisterAs("KhamulsExpansionMetaAchievementLists")

-- :Named with canMerge = true — allows same-named subcategories from different plugins to be merged:
local mergedInjection = KrowiAF.NewInjection(971)
mergedInjection:Named(addon.L["My Shared Category"], { 14808, 14814 }, true) -- canMerge [Optional, default false]
mergedInjection:RegisterAs("MyPlugin_MergedExample")

-- :Ids — add achievement IDs directly to the target category (no subcategory created):
local directInjection = KrowiAF.NewInjection(971)
directInjection:Ids{ 14808, 14814, 14821 } -- Added directly to category 971 [Optional, repeatable]
directInjection:RegisterAs("MyPlugin_DirectIds")

-- V2 Achievement Data (current standard)
-- Use KrowiAF.AchievementData with the Ach() fluent builder.
local Ach = KrowiAF.Ach
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