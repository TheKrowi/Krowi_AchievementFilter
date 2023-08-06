-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.AchievementsTabFixes = {};
local achievementsTabFixes = plugins.AchievementsTabFixes;
tinsert(plugins.Plugins, achievementsTabFixes);

function achievementsTabFixes.InjectOptions()
    addon.InjectOptions:AddDefaults("Plugins", "AchievementsTabFixes", {
        RenameExplorationDragonIslesCategory = true;
    });

    local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
    local pluginTable = addon.InjectOptions:AddPluginTable("AchievementsTabFixes", addon.L["AchievementsTabFixes"], addon.L["AchievementsTabFixes Desc"], function()
        return true;
    end);
    addon.InjectOptions:AddTable(pluginTable, "RenameExplorationDragonIslesCategory", {
        order = OrderPP(), type = "toggle", width = "full",
        name = addon.L["RenameExplorationDragonIslesCategory"],
        desc = addon.L["RenameExplorationDragonIslesCategory Desc"]:KAF_AddDefaultValueText("Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory"),
        get = function() return addon.Options.db.profile.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory; end,
        set = function() addon.Options.db.profile.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory = not addon.Options.db.profile.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory; end,
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
    if not addon.IsWrathClassic and addon.Options.db.profile.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory then
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