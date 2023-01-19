-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.AchievementsTabFixes = {};
local achievementsTabFixes = plugins.AchievementsTabFixes;
tinsert(plugins.Plugins, achievementsTabFixes);

function achievementsTabFixes.InjectOptions()
    KrowiAF_InjectOptions.AddDefaults("Plugins", "AchievementsTabFixes", {
        RenameExplorationDragonIslesCategory = true;
    });

    local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
    local pluginTable = KrowiAF_InjectOptions.AddPluginTable("AchievementsTabFixes", addon.L["AchievementsTabFixes"], addon.L["AchievementsTabFixes Desc"], function()
        return true;
    end);
    KrowiAF_InjectOptions.AddTable(pluginTable, "RenameExplorationDragonIslesCategory", {
        order = OrderPP(), type = "toggle", width = "full",
        name = addon.L["RenameExplorationDragonIslesCategory"],
        desc = addon.L["RenameExplorationDragonIslesCategory Desc"]:AddDefaultValueText("Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory"),
        get = function() return addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory; end,
        set = function() addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory = not addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory; end,
        hidden = addon.IsWrathClassic
    });
end

local function FindCategory(categories, name)
    for _, category in next, categories do
        if category.Name == name then
            return category;
        end
    end
end

function achievementsTabFixes.Load()
    if not addon.IsWrathClassic and addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory then
        local preHookFunction = addon.Data.LoadBlizzardTabAchievements;
        function addon.Data.LoadBlizzardTabAchievements(categories)
            local tabCategories = preHookFunction(categories);
            local explorationCategory = FindCategory(tabCategories, addon.GetCategoryInfoTitle(97));
            if explorationCategory then
                local dragonIslesCategory = FindCategory(explorationCategory.Children, addon.GetCategoryInfoTitle(15465));
                if dragonIslesCategory then
                    dragonIslesCategory.Name = addon.GetCategoryInfoTitle(15455);
                end
            end
            return tabCategories;
        end
    end
end