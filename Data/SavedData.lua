-- [[ Namespaces ]] --
local addonName, addon = ...;
local diagnostics = addon.Diagnostics;
local data = addon.Data;
data.SavedData = {};
local savedData = data.SavedData;

local LoadSolutions, Resolve;
function savedData.Load()
    SavedData = SavedData or {}; -- Does not exist yet for new users
    SavedData.Fixes = SavedData.Fixes or {}; -- Does not exist yet for new users

    local prevBuild = SavedData["Build"];
    diagnostics.Debug("Previous Build: " .. tostring(prevBuild)); -- Can be nil
    SavedData["Build"] = addon.MetaData.Build;
    local currBuild = SavedData["Build"];
    diagnostics.Debug("Current Build: " .. SavedData["Build"]);

    local prevVersion = SavedData["Version"];
    diagnostics.Debug("Previous Version: " .. tostring(prevVersion)); -- Can be nil
    SavedData["Version"] = addon.MetaData.Version;
    local currVersion = SavedData["Version"];
    diagnostics.Debug("Current Version: " .. SavedData["Version"]);

    if prevBuild ~= nil and prevVersion ~= nil then
        Resolve(LoadSolutions(), prevBuild, currBuild, prevVersion, currVersion);
    else
        -- First time user, nothing to do
    end

    diagnostics.Debug("SavedData loaded");
end

local FixFeaturesTutorialProgress, FixElvUISkin, FixFilters, FixEventDetails, FixShowExcludedCategory, FixEventDetails2, FixCharacters, FixEventAlert;
local FixMergeSmallCategoriesThresholdChanged, FixShowCurrentCharacterIcons, FixTabs, FixCovenantFilters, FixNewEarnedByFilter, FixTabs2;
function LoadSolutions()
    local solutions = {
        FixFeaturesTutorialProgress, -- 1
        FixElvUISkin, -- 2
        FixFilters, -- 3
        FixEventDetails, -- 4
        FixShowExcludedCategory, -- 5
        FixEventDetails2, -- 6
        FixCharacters, -- 7
        FixEventAlert, -- 8
        FixMergeSmallCategoriesThresholdChanged, -- 9
        FixShowCurrentCharacterIcons, -- 10
        FixTabs, -- 11
        FixCovenantFilters, -- 12
        FixNewEarnedByFilter, -- 13
        FixTabs2, -- 14
    };

    return solutions;
end

function Resolve(solutions, prevBuild, currBuild, prevVersion, currVersion)
    if not (prevBuild == nil or prevVersion == nil or prevBuild .. "." .. prevVersion < currBuild .. "." .. currVersion) then
        diagnostics.Debug("Nothing to resolve, same build and version");
        return;
    end

    for _, solution in next, solutions do
        solution(prevBuild, currBuild, prevVersion, currVersion);
    end
    diagnostics.Debug("Resolved all");
end

function FixFeaturesTutorialProgress(prevBuild, currBuild, prevVersion, currVersion)
    if SavedData.FeaturesTutorial then
        diagnostics.Debug("Features Tutorial Progress already cleared from previous version");
        return;
    end

    addon.Options.db.FeaturesTutorial = nil;

    diagnostics.Debug("Cleared Features Tutorial Progress from previous version");
end

function FixElvUISkin(prevBuild, currBuild, prevVersion, currVersion)
    if SavedData.ElvUISkin then
        diagnostics.Debug("ElvUISkin already cleared from previous version");
        return;
    end

    addon.Options.db.ElvUISkin = nil;

    diagnostics.Debug("Cleared ElvUISkin from previous version");
end

function FixFilters(prevBuild, currBuild, prevVersion, currVersion)
    if Filters then
        diagnostics.Debug("Filter settings already cleared from previous location");
        return;
    end

    addon.Options.db.Filters = nil;

    diagnostics.Debug("Clear filter settings from previous location");
end

function FixEventDetails(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "28.0" or SavedData.Fixes.FixEventDetails == true then
        diagnostics.Debug("EventDetails already reset");
        return;
    end

    EventDetails = nil;
    if currVersion == "28.0" then -- Only reset for this version
        SavedData.FeaturesTutorial.PageViewed[11] = false;
    end
    SavedData.Fixes.FixEventDetails = true;

    diagnostics.Debug("EventDetails reset");
end

function FixShowExcludedCategory(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "29.0" or addon.Options.db.Categories.ShowExcludedCategory == nil then
        diagnostics.Debug("Show Excluded Category already moved");
        return;
    end

    if addon.Options.db.Categories.ShowExcludedCategory ~= nil then
        addon.Options.db.Categories.Excluded.Show = addon.Options.db.Categories.ShowExcludedCategory;
    end
    addon.Options.db.Categories.ShowExcludedCategory = nil;

    diagnostics.Debug("Show Excluded Category moved");
end

function FixEventDetails2(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "34.0" or SavedData.Fixes.FixEventDetails2 == true then
        diagnostics.Debug("EventDetails2 already reset");
        return;
    end

    EventDetails = nil;
    SavedData.Fixes.FixEventDetails2 = true;

    diagnostics.Debug("EventDetails2 reset");
end


function FixCharacters(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "34.0" or SavedData.CharacterAchievementPoints == nil then
        diagnostics.Debug("CharacterAchievementPoints already cleared from previous version");
        return;
    end

    SavedData.CharacterAchievementPoints = nil;

    diagnostics.Debug("Cleared CharacterAchievementPoints from previous version");
end

function FixEventAlert(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "34.0" or addon.Options.db.EventAlert == nil then
        diagnostics.Debug("EventAlerts already copied and cleared from previous version");
        return;
    end

    addon.Options.db.EventAlert.ShowPopUps = not addon.Options.db.EventAlert.NoPopUps;
    addon.Options.db.EventAlert.NoPopUps = nil;
    addon.Options.db.EventReminders = addon.Options.db.EventAlert;
    addon.Options.db.EventAlert = nil;

    diagnostics.Debug("Copied and cleared EventAlerts from previous version");
end

function FixMergeSmallCategoriesThresholdChanged(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "34.0" or addon.Options.db.Window.MergeSmallCategoriesThresholdChanged == nil then
        diagnostics.Debug("MergeSmallCategoriesThresholdChanged already cleared from previous version");
        return;
    end

    addon.Options.db.Window.MergeSmallCategoriesThresholdChanged = nil;

    diagnostics.Debug("Cleared MergeSmallCategoriesThresholdChanged from previous version");
end

function FixShowCurrentCharacterIcons(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "34.0" or addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons == nil then
        diagnostics.Debug("ShowCurrentCharacterIcons already cleared from previous version");
        return;
    end

    addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain = addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons;
    addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor = addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons;
    addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons = nil;

    diagnostics.Debug("Cleared ShowCurrentCharacterIcons from previous version");
end

function FixTabs(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "35.0" or currVersion >= "37.0" or addon.Options.db.Tabs == nil or SavedData.Fixes.FixTabs == true then
        diagnostics.Debug("Tabs already ported from previous version");
        return;
    end

    for addonName2, tab in next, addon.Options.db.Tabs do
        if not tab.AddonName then
            for tabName, _ in next, addon.Options.db.Tabs[addonName2] do
                for i, tab2 in next, addon.Options.db.Tabs do
                    if tab2.AddonName and tab2.AddonName == addonName2 and tab2.TabName == tabName then
                        addon.Options.db.Tabs[i].Show = addon.Options.db.Tabs[addonName2][tabName];
                    end
                end
            end
            addon.Options.db.Tabs[addonName2] = nil;
        end
    end

    SavedData.Fixes.FixTabs = true;

    diagnostics.Debug("Ported Tabs from previous version");
end

local function ClearCovenant(table)
    for i, _ in next, table do
        if i == "Covenant" then
            table[i] = nil;
        elseif type(table[i]) == "table" then
            ClearCovenant(table[i]);
        end
    end
end

function FixCovenantFilters(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "35.1" or SavedData.Fixes.FixCovenantFilters == true then
        diagnostics.Debug("Covenant filters already cleared from previous version");
        return;
    end

    if Filters.profiles then
        ClearCovenant(Filters.profiles);
    end

    SavedData.Fixes.FixCovenantFilters = true;

    diagnostics.Debug("Cleared covenant filters from previous version");
end

function FixNewEarnedByFilter(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "36" or SavedData.Fixes.FixNewEarnedByFilter == true then
        diagnostics.Debug("New earned by filter already transfered from previous version");
        return;
    end

    if Filters.profiles and Filters.profiles.Default and Filters.profiles.Default.EarnedBy == (GetCategoryInfo(92)) then
        Filters.profiles.Default.EarnedBy = (GetCategoryInfo(92)) .. " / " .. addon.L["Account"];
    end

    SavedData.Fixes.FixNewEarnedByFilter = true;

    diagnostics.Debug("Transfered new earned by filter from previous version");
end

function FixTabs2(prevBuild, currBuild, prevVersion, currVersion)
    if currVersion < "37.0" or addon.Options.db.Tabs == nil or SavedData.Fixes.FixTabs2 == true then
        diagnostics.Debug("Tabs2 already ported from previous version");
        return;
    end

    if pcall(function()
        local addonName2, tabName, show, order;
        for addonName3, tab in next, addon.Options.db.Tabs do
            if tab.AddonName ~= nil then -- 35.x - 36.x
                addonName2 = tab.AddonName;
                tabName = tab.TabName;
                show = tab.Show;
                order = tab.Order;

                addon.Options.db.Tabs[addonName2] = addon.Options.db.Tabs[addonName2] or {};
                addon.Options.db.Tabs[addonName2][tabName] = {};
                addon.Options.db.Tabs[addonName2][tabName].Show = show;
                addon.Options.db.Tabs[addonName2][tabName].Order = order;

                addon.Options.db.Tabs[addonName3] = nil;
            else -- <= 34.x or >= 37.x
                for tabName2, tab2 in next, tab do
                    if type(tab2) == "boolean" then -- <= 34.x
                        addonName2 = addonName3;
                        tabName = tabName2;
                        show = tab2;

                        addon.Options.db.Tabs[addonName2] = addon.Options.db.Tabs[addonName2] or {};
                        addon.Options.db.Tabs[addonName2][tabName] = {};
                        addon.Options.db.Tabs[addonName2][tabName].Show = show;
                    end
                end
            end
        end

        local tabOrder = {};
        local noOrder = {};
        local tabs = 0;
        -- Now we have correct data, we can verify the order now
        for _, tab in next, addon.Options.db.Tabs do
            for _, tab2 in next, tab do
                tabs = tabs + 1;
                order = tab2.Order;
                if order == nil then
                    tinsert(noOrder, tab2);
                elseif tabOrder[order] == nil then
                    tabOrder[order] = tab2;
                else
                    tab2.Order = nil;
                    tinsert(noOrder, tab2);
                end
            end
        end

        local noOrderFixed = 1;
        for i = 1, tabs do
            if tabOrder[i] == nil then
                noOrder[noOrderFixed].Order = i;
                noOrderFixed = noOrderFixed + 1;
            end
        end
    end) then
        -- No errors, assume tabs are ported
    else
        -- Porting failed, just reset tabs
        addon.Options.db.Tabs = nil;
    end

    SavedData.Fixes.FixTabs2 = true;

    diagnostics.Debug("Ported Tabs2 from previous version");
end