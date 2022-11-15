-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.AchievementsTabFixes = {};
local achievementsTabFixes = plugins.AchievementsTabFixes;
tinsert(plugins.Plugins, achievementsTabFixes);

function achievementsTabFixes.LoadLocalization(L)
    L["AchievementsTabFixes"] = "Achievements Tab Fixes";
    L["AchievementsTabFixes Desc"] = "This plugin provides some fixes for the Achievements Tab, toggleable below.";
    L["RenameExplorationDragonIslesCategory"] = "Rename Exploration -> Dragon Isles Category to Dragonflight";
    L["RenameExplorationDragonIslesCategory Desc"] = "Renames the Exploration -> Dragon Isles Category to Dragonflight.";
end

function achievementsTabFixes.InjectOptions()
    local defaults = {};
    defaults.RenameExplorationDragonIslesCategory = true;

    addon.Options.InjectDefaults(defaults, "AchievementsTabFixes", "Plugins");

    local optionsTable = {
        type = "group",
        name = addon.L["AchievementsTabFixes"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return true end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.L["AchievementsTabFixes Desc"],
                fontSize = "medium"
            },
            RenameExplorationDragonIslesCategory = {
                order = 4, type = "toggle", width = "full",
                name = addon.L["RenameExplorationDragonIslesCategory"],
                desc = addon.L["RenameExplorationDragonIslesCategory Desc"],
                get = function() return addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory; end,
                set = function()
                    addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory = not addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory;
                    addon.Options.Debug(addon.L["AchievementsTabFixes"] .. " " .. addon.L["RenameExplorationDragonIslesCategory"], addon.Options.db.Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory);
                end,
                hidden = addon.IsWrathClassic
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "AchievementsTabFixes", "Plugins", "args");
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