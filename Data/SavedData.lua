-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local data = addon.Data;
data.SavedData = {};
local savedData = data.SavedData;

function savedData.TabsOrderAddIfNotContains(id, addonDisplayName, tabDisplayName)
    SavedData.TabKeys = SavedData.TabKeys or {};

    SavedData.TabKeys[id] = addonDisplayName .. " - " .. tabDisplayName;
    if addon.Options.Defaults then -- Pre options loaded
        addon.Options.Defaults.profile.Tabs[id].Order = id;
    else -- Post options loaded
        addon.Options.db.Tabs[id].Order = id;
    end

    addon.Options.InjectOptionsTableAdd({
        order = id, type = "select", width = 2,
        name = "",
        values = function() return savedData.TabsOrderGetActiveKeys(); end,
        get = function()
            savedData.TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
            for i, tab in next, addon.Options.db.Tabs do
               if tab.Order == id then
                   return i;
               end
            end
        end,
        set = function (_, value)
            savedData.TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
            for i, tab in next, addon.Options.db.Tabs do
                if tab.Order == id then
                    addon.Options.db.Tabs[i].Order = addon.Options.db.Tabs[value].Order;
                end
             end
            addon.Options.db.Tabs[value].Order = id;
            addon.GUI.ShowHideTabs();
        end
    }, tostring(id), "args", "Layout", "args", "Tabs", "args", "Order");
end

local needsCleanup = true;
function savedData.TabsOrderGetActiveKeys()
    if not needsCleanup then
        return SavedData.TabKeys;
    end
    -- local tabsOrderActiveKeys = {};
    -- local tabsToRemove = {};
    for i = #addon.Options.db.Tabs, 1, -1 do
        local tab = addon.Options.db.Tabs[i];
        if tab.AddonName == "Blizzard_AchievementUI" or IsAddOnLoaded(tab.AddonName) then
            -- tinsert(tabsOrderActiveKeys, SavedData.TabKeys[id]);
        else
            tremove(addon.Options.db.Tabs, i);
            tremove(SavedData.TabKeys, i);
        end
    end
    -- for id, tab in next, addon.Options.db.Tabs do
    --     if tab.AddonName == "Blizzard_AchievementUI" or IsAddOnLoaded(tab.AddonName) then
    --         tinsert(tabsOrderActiveKeys, SavedData.TabKeys[id]);
    --     else
    --         tinsert(tabsToRemove, id);
    --     end
    -- end
    -- for _, id in next, tabsToRemove do
    --     tremove(addon.Options.db.Tabs, id);
    -- end
    -- SavedData.TabKeys = tabsOrderActiveKeys;
    needsCleanup = nil;
    return SavedData.TabKeys;
end

local LoadSolutions, Resolve;
function savedData.Load()
    if SavedData == nil then
        SavedData = {};
    end

    if SavedData.Fixes == nil then
        SavedData.Fixes = {};
    end

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
local FixMergeSmallCategoriesThresholdChanged, FixShowCurrentCharacterIcons, FixTabs;
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
    if currVersion < "35.0" or addon.Options.db.Tabs == nil or SavedData.Fixes.FixTabs == true then
        diagnostics.Debug("Tabs already ported from previous version");
        return;
    end

    addon.Diagnostics.DebugTable(addon.Options.db.Tabs);
    for _addonName, tab in next, addon.Options.db.Tabs do
        if not tab.AddonName then
            for _tabName, _ in next, addon.Options.db.Tabs[_addonName] do
                for i, tab2 in next, addon.Options.db.Tabs do
                    if tab2.AddonName and tab2.AddonName == _addonName and tab2.TabName == _tabName then
                        addon.Options.db.Tabs[i].Show = addon.Options.db.Tabs[_addonName][_tabName];
                    end
                end
            end
            addon.Options.db.Tabs[_addonName] = nil;
        end
    end
    addon.Diagnostics.DebugTable(addon.Options.db.Tabs);

    -- StaticPopupDialogs["KROWIAF_FIXTABS"] = {
    --     text = addon.MetaData.Title .. "\n\n" .. addon.L["FixTabs"] .. "\n\n - " .. addon.MetaData.Author,
    --     button1 = addon.L["Options"],
    --     button2 = addon.L["Close"],
    --     OnButton1 = function()
    --         addon.Options.Open();
    --     end,
    --     timeout = 0,
    --     whileDead = true,
    --     hideOnEscape = true
    -- };
    -- StaticPopup_Show("KROWIAF_FIXTABS");

    SavedData.Fixes.FixTabs = true;

    diagnostics.Debug("Ported Tabs from previous version");
end