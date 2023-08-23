-- [[ Namespaces ]] --
local addonName, addon = ...;
local diagnostics = addon.Diagnostics;
local data = addon.Data;
data.DataIntegrityManager = {};
local dataIntegrityManager = data.DataIntegrityManager;

function dataIntegrityManager.FixSavedVariables()
    -- Special function that needs to be called before loading anything !!!
    -- In version 53.0 Options, SavedData, Filters are replaced by KrowiAF_Options, KrowiAF_SavedData, KrowiAF_Filters
    -- Here we try to copy the data from the old to new location for users pre 53.0

    if KrowiAF_Options and KrowiAF_SavedData and KrowiAF_Filters then
        -- print("Options, SavedData, Filters already moved to new location");
        return;
    end

    if not KrowiAF_Options and Options then
        KrowiAF_Options = Options;
    end

    if not KrowiAF_SavedData and SavedData then
        KrowiAF_SavedData = SavedData;
    end

    if not KrowiAF_Filters and Filters then
        KrowiAF_Filters = Filters;
    end

    -- print("Moved Options, SavedData, Filters to new locations");
end

local LoadVerifications, Verify, LoadSolutions, Resolve;
function dataIntegrityManager.Load()
    KrowiAF_SavedData = KrowiAF_SavedData or {}; -- Does not exist yet for new users
    KrowiAF_SavedData.Fixes = KrowiAF_SavedData.Fixes or {}; -- Does not exist yet for new users

    local prevBuild = KrowiAF_SavedData["Build"];
    diagnostics.Debug("Previous Build: " .. tostring(prevBuild)); -- Can be nil
    KrowiAF_SavedData["Build"] = addon.Metadata.Build;
    local currBuild = KrowiAF_SavedData["Build"];
    diagnostics.Debug("Current Build: " .. KrowiAF_SavedData["Build"]);

    local prevVersion = KrowiAF_SavedData["Version"];
    diagnostics.Debug("Previous Version: " .. tostring(prevVersion)); -- Can be nil
    KrowiAF_SavedData["Version"] = addon.Metadata.Version;
    local currVersion = KrowiAF_SavedData["Version"];
    diagnostics.Debug("Current Version: " .. KrowiAF_SavedData["Version"]);

    if prevBuild == nil and prevVersion == nil then
        -- First time user
        Resolve(LoadSolutions(), prevBuild, currBuild, prevVersion, currVersion, true);
    else
        Resolve(LoadSolutions(), prevBuild, currBuild, prevVersion, currVersion, false);
    end

    Verify(LoadVerifications());

    diagnostics.Debug("SavedData loaded");
end

local VerifySavedCharacterData;
function LoadVerifications()
    local verifications = {
        VerifySavedCharacterData, -- 1
    };

    return verifications;
end

function Verify(verifications)
    for _, verification in next, verifications do
        verification();
    end
    diagnostics.Debug("Verified all");
end

local FixFeaturesTutorialProgress, FixElvUISkin, FixFilters, FixEventDetails, FixShowExcludedCategory, FixEventDetails2, FixCharacters, FixEventAlert;
local FixMergeSmallCategoriesThresholdChanged, FixShowCurrentCharacterIcons, FixTabs, FixCovenantFilters, FixNewEarnedByFilter, FixTabs2, FixNewEarnedByFilter2;
local FixEventDetails3, FixTooltipCriteria, FixFocusedAchievements, FixFocusedOptions, FixEventRemindersTimeDisplay, FixEventRemindersOptions, FixEventRemindersOptions2;
local FixActiveEvents, FixSummaryOptions;
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
        FixNewEarnedByFilter2, -- 15
        FixEventDetails3, -- 16
        FixTooltipCriteria, -- 17
        FixFocusedAchievements, -- 18
        FixFocusedOptions, -- 19
        FixEventRemindersTimeDisplay, -- 20
        FixEventRemindersOptions, -- 21
        FixEventRemindersOptions2, -- 22
        FixActiveEvents, -- 23
        FixSummaryOptions, -- 24
    };

    return solutions;
end

function Resolve(solutions, prevBuild, currBuild, prevVersion, currVersion, firstTime)
    if not (prevBuild == nil or prevVersion == nil or prevBuild .. "." .. prevVersion < currBuild .. "." .. currVersion) then
        diagnostics.Debug("Nothing to resolve, same build and version");
        return;
    end

    for _, solution in next, solutions do
        solution(prevBuild, currBuild, prevVersion, currVersion, firstTime);
    end
    diagnostics.Debug("Resolved all");
end

function VerifySavedCharacterData()
    if not KrowiAF_SavedData.Characters then
        return;
    end
    for guid, character in next, KrowiAF_SavedData.Characters do
        local _, realm, name = strsplit("-", guid);
        if character.Name == nil then
            KrowiAF_SavedData.Characters[guid].Name = name;
        end
        if character.Realm == nil then
            KrowiAF_SavedData.Characters[guid].Realm = realm;
        end
    end
end

function FixFeaturesTutorialProgress(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 23.0 the tutorial was rewritten and moved from addon.Options.db.profile.FeaturesTutorial to KrowiAF_SavedData.FeaturesTutorial
    -- Here we clean up the old addon.Options.db.profile.FeaturesTutorial for users pre 23.0
    -- KrowiAF_SavedData.FeaturesTutorial is created by the Tutorial so we don't need to do this here

    if firstTime and currVersion > "23.0" then
        diagnostics.Debug("First time Features Tutorial Progress OK");
        return;
    end
    if KrowiAF_SavedData.FeaturesTutorial then
        diagnostics.Debug("Features Tutorial Progress already cleared from previous version");
        return;
    end

    addon.Options.db.profile.FeaturesTutorial = nil;

    diagnostics.Debug("Cleared Features Tutorial Progress from previous version");
end

function FixElvUISkin(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 23.0 the ElvUI skin settings were moved from addon.Options.db.profile.ElvUISkin to KrowiAF_SavedData.ElvUISkin
    -- Here we clean up the old addon.Options.db.profile.ElvUISkin for users pre 23.0
    -- KrowiAF_SavedData.ElvUISkin is created by the ElvUI plugin so we don't need to do this here

    if firstTime and currVersion > "23.0" then
        diagnostics.Debug("First time ElvUISkin OK");
        return;
    end
    if KrowiAF_SavedData.ElvUISkin then
        diagnostics.Debug("ElvUISkin already cleared from previous version");
        return;
    end

    addon.Options.db.profile.ElvUISkin = nil;

    diagnostics.Debug("Cleared ElvUISkin from previous version");
end

function FixFilters(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 24.0 the filters were moved from addon.Options.db.profile.Filters to Filters
    -- Here we clean up the old addon.Options.db.profile.Filters for users pre 24.0
    -- Filters is created by the Filters so we don't need to do this here

    if firstTime and currVersion > "24.0" then
        diagnostics.Debug("First time Filter OK");
        return;
    end
    if Filters then
        diagnostics.Debug("Filter settings already cleared from previous location");
        return;
    end

    addon.Options.db.profile.Filters = nil;

    diagnostics.Debug("Clear filter settings from previous location");
end

function FixEventDetails(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 28.0 changes were made to the Event Reminders and the tutorial
    -- Here we reset the view flag to inform the users about the changes for users pre 28.0
    -- This is now however useless since FixEventDetails2 does a complete reset of the view flags

    -- Now we just make sure to remove the fix flag for users pre 34.0
    if firstTime and currVersion > "28.0" then
        KrowiAF_SavedData.Fixes.FixEventDetails = true;
        diagnostics.Debug("First time EventDetails OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixEventDetails == true then
        diagnostics.Debug("EventDetails already reset");
        return;
    end

    KrowiAF_SavedData.Fixes.FixEventDetails = true;

    diagnostics.Debug("EventDetails reset");
end

function FixShowExcludedCategory(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 29.0 addon.Options.db.profile.Categories.ShowExcludedCategory was moved to addon.Options.db.profile.Categories.Excluded.Show
    -- Here we clean up the old addon.Options.db.profile.Categories.ShowExcludedCategory for users pre 29.0
    -- addon.Options.db.profile.Categories.Excluded.Show is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "29.0" then
        diagnostics.Debug("First time Show Excluded Category OK");
        return;
    end
    if addon.Options.db.profile.Categories.ShowExcludedCategory == nil then
        diagnostics.Debug("Show Excluded Category already moved");
        return;
    end

    addon.Options.db.profile.Categories.Excluded.Show = addon.Options.db.profile.Categories.ShowExcludedCategory;
    addon.Options.db.profile.Categories.ShowExcludedCategory = nil;

    diagnostics.Debug("Show Excluded Category moved");
end

function FixEventDetails2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 the Event Reminders data structure changed
    -- Here we reset the EventDetails for users pre 34.0
    -- EventDetails is created by the Event Data so we don't need to do this here

    if firstTime and currVersion > "34.0" then
        KrowiAF_SavedData.Fixes.FixEventDetails2 = true;
        diagnostics.Debug("First time EventDetails2 OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixEventDetails2 == true then
        diagnostics.Debug("EventDetails2 already reset");
        return;
    end

    EventDetails = nil;
    KrowiAF_SavedData.Fixes.FixEventDetails2 = true;

    diagnostics.Debug("EventDetails2 reset");
end

function FixCharacters(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 the character cache structure changed
    -- Here we clean up the old KrowiAF_SavedData.CharacterAchievementPoints for users pre 34.0

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time CharacterAchievementPoints OK");
        return;
    end
    if KrowiAF_SavedData.CharacterAchievementPoints == nil then
        diagnostics.Debug("CharacterAchievementPoints already cleared from previous version");
        return;
    end

    KrowiAF_SavedData.CharacterAchievementPoints = nil;

    diagnostics.Debug("Cleared CharacterAchievementPoints from previous version");
end

function FixEventAlert(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 options related to Event Alerts changed
    -- Here we move the old data to the new locations

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time EventAlerts OK");
        return;
    end
    if addon.Options.db.profile.EventAlert == nil then
        diagnostics.Debug("EventAlerts already copied and cleared from previous version");
        return;
    end

    addon.Options.db.profile.EventAlert.ShowPopUps = not addon.Options.db.profile.EventAlert.NoPopUps;
    addon.Options.db.profile.EventAlert.NoPopUps = nil;
    addon.Options.db.profile.EventReminders = addon.Options.db.profile.EventAlert;
    addon.Options.db.profile.EventAlert = nil;

    diagnostics.Debug("Copied and cleared EventAlerts from previous version");
end

function FixMergeSmallCategoriesThresholdChanged(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 addon.Options.db.profile.Window.MergeSmallCategoriesThresholdChanged became obsolete
    -- Here we clean up the old addon.Options.db.profile.Window.MergeSmallCategoriesThresholdChanged for users pre 34.0

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time MergeSmallCategoriesThresholdChanged OK");
        return;
    end
    if addon.Options.db.profile.Window.MergeSmallCategoriesThresholdChanged == nil then
        diagnostics.Debug("MergeSmallCategoriesThresholdChanged already cleared from previous version");
        return;
    end

    addon.Options.db.profile.Window.MergeSmallCategoriesThresholdChanged = nil;

    diagnostics.Debug("Cleared MergeSmallCategoriesThresholdChanged from previous version");
end

function FixShowCurrentCharacterIcons(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIcons got split into 2 parts
    -- Here we copy the addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIcons to the 2 new parts

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time ShowCurrentCharacterIcons OK");
        return;
    end
    if addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIcons == nil then
        diagnostics.Debug("ShowCurrentCharacterIcons already cleared from previous version");
        return;
    end

    addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain = addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIcons;
    addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor = addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIcons;
    addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIcons = nil;

    diagnostics.Debug("Cleared ShowCurrentCharacterIcons from previous version");
end

function FixTabs(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 35.0 the data structure for the tabs got changes from 
    -- addonName = {
    --     tab1 = true,
    --     tab2 = true,
    --     tab3 = false
    -- }
    -- with the boolean meaning show or hide the tab to
    -- {
    --     {
    --         AddonName = addonName,
    --         TabName = tab1,
    --         Show = true
    --     },
    --     ...
    -- }
    -- Here we transfer the data from the old structure to the new
    -- This has however changed again in 37.0

    -- Now we just make sure to remove the fix flag for users pre 37.0
    if firstTime and currVersion > "35.0" then
        KrowiAF_SavedData.Fixes.FixTabs = true;
        diagnostics.Debug("First time Tabs port OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixTabs == true then
        diagnostics.Debug("Tabs already ported from previous version");
        return;
    end

    KrowiAF_SavedData.Fixes.FixTabs = true;

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

function FixCovenantFilters(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 35.1 the covenant filters got removed
    -- Here we clean up the old data

    if firstTime and currVersion > "35.1" then
        KrowiAF_SavedData.Fixes.FixCovenantFilters = true;
        diagnostics.Debug("First time Covenant filters OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixCovenantFilters == true then
        diagnostics.Debug("Covenant filters already cleared from previous version");
        return;
    end

    if Filters.profiles then
        ClearCovenant(Filters.profiles);
    end

    KrowiAF_SavedData.Fixes.FixCovenantFilters = true;

    diagnostics.Debug("Cleared covenant filters from previous version");
end

function FixNewEarnedByFilter(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 36.0 the Character earned by filter changed to Character / Account
    -- Here we transfer that data

    if firstTime and currVersion > "35.1" then
        KrowiAF_SavedData.Fixes.FixNewEarnedByFilter = true;
        diagnostics.Debug("First time New earned by filter OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixNewEarnedByFilter == true then
        diagnostics.Debug("New earned by filter already transfered from previous version");
        return;
    end

    if Filters.profiles and Filters.profiles.Default and Filters.profiles.Default.EarnedBy == (GetCategoryInfo(92)) then
        Filters.profiles.Default.EarnedBy = (GetCategoryInfo(92)) .. " / " .. addon.L["Account"];
    end

    KrowiAF_SavedData.Fixes.FixNewEarnedByFilter = true;

    diagnostics.Debug("Transfered new earned by filter from previous version");
end

function FixTabs2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 37.0 the tabs data structure changed once again from (see FixTabs) tostring
    -- {
    --     addonName = {
    --         tab1 = {
    --             Show = true,
    --             Order = 1
    --         },
    --         ...
    --     },
    --     ...
    -- }
    -- Porting from pre 34.0 versions is impossible since 37.0 simply overwrites it with default values
    -- Porting from 35.0 - pre 37.0 is difficult because mixed data needs to be handled
    -- Lastly, data is handled based on KrowiAF_SavedData.Tabs and is new in 37.0 so cleanup is needed in KrowiAF_SavedData.TabKeys
    -- Choosing to reset data, cleanup and inform user
    -- Remove bad tabs from addon.Options.db.profile.Tabs, remove duplicate KrowiAF_SavedData.TabKeys value

    if firstTime and currVersion > "37.0" then
        KrowiAF_SavedData.Fixes.FixTabs2 = true;
        diagnostics.Debug("First time Tabs2 OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixTabs2 == true then
        diagnostics.Debug("Tabs2 already ported from previous version");
        return;
    end

    for i, _ in next, addon.Options.db.profile.Tabs do
        if type(i) == "number" then
            addon.Options.db.profile.Tabs[i] = nil;
        end
    end

    local newTabKeys = {};
    local addonName2, tabName;
    for i, tab in next, KrowiAF_SavedData.Tabs do
        addonName2 = tab.AddonName;
        tabName = tab.Name;
        local order = i;
        if addonName2 == "Blizzard_AchievementUI" and tabName == "Achievements" then
            order = 4;
        end
        if addonName2 == addonName and tabName == "Achievements" then
            order = 1;
        end
        addon.Options.db.profile.Tabs[addonName2][tabName].Order = order;
        tinsert(newTabKeys, KrowiAF_SavedData.TabKeys[i]);
    end
    KrowiAF_SavedData.TabKeys = newTabKeys;

    local tabsOrderTable = KrowiAF_GetOptions.GetTable(addon.Metadata.Prefix .. "_Layout", "args.Tabs.args.Order.args");
    addon.InjectOptions:AddTable(tabsOrderTable, "Locked", {
        order = 1, type = "description", width = "full",
        name = "Tabs have been changed from your previous version and have been reset. This should be a one time thing. The addon should work properly without these settings changable. Please reload at any time to fix this section. Sorry for any inconvenience.\n\n- Krowi\n\n"
    });
    addon.InjectOptions:AddTable(tabsOrderTable, "Reload", {
        order = 2, type = "execute",
        name = "Reload",
        func = C_UI.Reload
    });

    KrowiAF_SavedData.Fixes.FixTabs2 = true;

    diagnostics.Debug("Ported Tabs2 from previous version");
end

function FixNewEarnedByFilter2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 37.0 the Character earned by filter changed again to Character only
    -- Here we transfer that data
    
    if firstTime and currVersion > "37.0" then
        KrowiAF_SavedData.Fixes.FixNewEarnedByFilter2 = true;
        diagnostics.Debug("First time New earned by filter2 OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixNewEarnedByFilter2 == true then
        diagnostics.Debug("New earned by filter2 already transfered from previous version");
        return;
    end

    if Filters.profiles and Filters.profiles.Default and Filters.profiles.Default.EarnedBy == (GetCategoryInfo(92)) then
        Filters.profiles.Default.EarnedBy = addon.L["Character only"];
    end

    KrowiAF_SavedData.Fixes.FixNewEarnedByFilter2 = true;

    diagnostics.Debug("Transfered new earned by filter2 from previous version");
end

function FixEventDetails3(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 38.0 the new Event Reminders were added
    -- Here we reset the EventDetails for users pre 38.0
    -- EventDetails is created by the Event Data so we don't need to do this here

    if firstTime and currVersion > "38.0" then
        KrowiAF_SavedData.Fixes.FixEventDetails3 = true;
        diagnostics.Debug("First time EventDetails3 OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixEventDetails3 == true then
        diagnostics.Debug("EventDetails3 already reset");
        return;
    end

    EventDetails = nil;
    KrowiAF_SavedData.Fixes.FixEventDetails3 = true;

    diagnostics.Debug("EventDetails3 reset");
end

function FixTooltipCriteria(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 46.4 addon.Options.db.profile.Tooltip.Units was moved to addon.Options.db.profile.Tooltip.Criteria
    -- Here we clean up the old addon.Options.db.profile.Tooltip.Units for users pre 46.4
    -- addon.Options.db.profile.Tooltip.Criteria is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "46.4" then
        diagnostics.Debug("First time Tooltip Criteria OK");
        return;
    end
    if addon.Options.db.profile.Tooltip.Units == nil then
        diagnostics.Debug("Tooltip Criteria already moved");
        return;
    end

    addon.Options.db.profile.Tooltip.Criteria = addon.Options.db.profile.Tooltip.Units;
    addon.Options.db.profile.Tooltip.Criteria.Show = addon.Options.db.profile.Tooltip.Criteria.ShowCriteria;
    addon.Options.db.profile.Tooltip.Criteria.ShowIf = addon.Options.db.profile.Tooltip.Criteria.ShowCriteriaIf;
    addon.Options.db.profile.Tooltip.Units = nil;
    addon.Options.db.profile.Tooltip.Criteria.ShowCriteria = nil;
    addon.Options.db.profile.Tooltip.Criteria.ShowCriteriaIf = nil;

    diagnostics.Debug("Tooltip Criteria moved");
end

function FixFocusedAchievements(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 48.0 KrowiAF_SavedData.FocusedAchievements was renamed to KrowiAF_SavedData.WatchedAchievements
    -- Here we clean up the old KrowiAF_SavedData.FocusedAchievements for users pre 48.0
    -- KrowiAF_SavedData.WatchedAchievements is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "48.0" then
        diagnostics.Debug("First time Focused Achievements OK");
        return;
    end
    if KrowiAF_SavedData.FocusedAchievements == nil then
        diagnostics.Debug("Focused Achievements already renamed");
        return;
    end

    KrowiAF_SavedData.WatchedAchievements = KrowiAF_SavedData.FocusedAchievements;
    KrowiAF_SavedData.FocusedAchievements = nil;

    diagnostics.Debug("Focused Achievements renamed");
end

function FixFocusedOptions(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 48.0 addon.Options.db.profile.Categories.Focused was moved to addon.Options.db.profile.Categories.WatchList
    -- Here we clean up the old addon.Options.db.profile.Categories.Focused for users pre 48.0
    -- addon.Options.db.profile.Categories.WatchList is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "48.0" then
        diagnostics.Debug("First time Focused Options OK");
        return;
    end
    if addon.Options.db.profile.Categories.Focused == nil then
        diagnostics.Debug("Focused Options already moved");
        return;
    end

    addon.Options.db.profile.Categories.WatchList = addon.Options.db.profile.Categories.Focused;
    addon.Options.db.profile.Categories.Focused = nil;

    diagnostics.Debug("Focused Options moved");
end

function FixEventRemindersTimeDisplay(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 51.0 EventReminders.TimeDisplay's Start Time option is being removed
    -- Here we fix the numbering

    if firstTime and currVersion > "51.0" then
        KrowiAF_SavedData.Fixes.FixEventRemindersTimeDisplay = true;
        diagnostics.Debug("First time EventReminders TimeDisplay Options OK");
        return;
    end
    if KrowiAF_SavedData.Fixes.FixEventRemindersTimeDisplay == true then
        diagnostics.Debug("EventReminders TimeDisplay Options already fixed");
        return;
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 > 1 then
        addon.Options.db.profile.EventReminders.TimeDisplay.Line1 = addon.Options.db.profile.EventReminders.TimeDisplay.Line1 - 1;
    end
    if addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 2 then -- If Start Time is selected, fall back to the defaults
        addon.Options.db.profile.EventReminders.TimeDisplay.Line2 = 3;
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 > 1 then
        addon.Options.db.profile.EventReminders.TimeDisplay.Line2 = addon.Options.db.profile.EventReminders.TimeDisplay.Line2 - 1;
    end

    KrowiAF_SavedData.Fixes.FixEventRemindersTimeDisplay = true;

    diagnostics.Debug("EventReminders TimeDisplay Options fixed");
end

function FixEventRemindersOptions(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 51.0 addon.Options.db.profile.EventReminders.MaxAlerts and addon.Options.db.profile.EventReminders.FadeDelay were
    -- moved to addon.Options.db.profile.EventReminders.PopUps.MaxAlerts and addon.Options.db.profile.EventReminders.PopUps.FadeDelay
    -- Here we clean up the old addon.Options.db.profile.EventReminders.MaxAlerts and addon.Options.db.profile.EventReminders.FadeDelay for users pre 51.0
    -- addon.Options.db.profile.EventReminders.PopUps.MaxAlerts and addon.Options.db.profile.EventReminders.PopUps.FadeDelay are created by the Options
    -- so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "51.0" then
        diagnostics.Debug("EventReminders Options OK");
        return;
    end
    if addon.Options.db.profile.EventReminders.MaxAlerts == nil and addon.Options.db.profile.EventReminders.FadeDelay == nil then
        diagnostics.Debug("EventReminders Options already moved");
        return;
    end

    addon.Options.db.profile.EventReminders.PopUps.MaxAlerts = addon.Options.db.profile.EventReminders.MaxAlerts;
    addon.Options.db.profile.EventReminders.PopUps.FadeDelay = addon.Options.db.profile.EventReminders.FadeDelay;
    addon.Options.db.profile.EventReminders.MaxAlerts = nil;
    addon.Options.db.profile.EventReminders.FadeDelay = nil;

    diagnostics.Debug("EventReminders Options moved");
end

function FixEventRemindersOptions2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 52.0 addon.Options.db.profile.EventReminders.PopUps.Show and addon.Options.db.profile.EventReminders.ChatMessages.Show were
    -- moved and split to addon.Options.db.profile.EventReminders.PopUps.OnLogin, addon.Options.db.profile.EventReminders.PopUps.OnReload,
    -- addon.Options.db.profile.EventReminders.PopUps.OnEventStart, addon.Options.db.profile.EventReminders.ChatMessages.OnLogin,
    -- addon.Options.db.profile.EventReminders.ChatMessages.OnReload and addon.Options.db.profile.EventReminders.ChatMessages.OnEventStart
    -- Here we clean up the old addon.Options.db.profile.EventReminders.PopUps.Show and addon.Options.db.profile.EventReminders.ChatMessages.Show for users pre 52.0
    -- New options mentioned above are created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "51.4" then
        diagnostics.Debug("EventReminders Options2 OK");
        return;
    end
    if addon.Options.db.profile.EventReminders.PopUps.Show == nil and addon.Options.db.profile.EventReminders.ChatMessages.Show == nil then
        diagnostics.Debug("EventReminders Options2 already moved");
        return;
    end

    if addon.Options.db.profile.EventReminders.PopUps.Show then
    addon.Options.db.profile.EventReminders.PopUps.OnLogin = {
            Show = addon.Options.db.profile.EventReminders.PopUps.Show.OnLogin,
            ShowInInstances = addon.Options.db.profile.EventReminders.PopUps.Show.OnLoginInInstances,
        };
        addon.Options.db.profile.EventReminders.PopUps.OnEventStart = {
            Show = addon.Options.db.profile.EventReminders.PopUps.Show.OnEventStart,
            ShowInInstances = addon.Options.db.profile.EventReminders.PopUps.Show.OnEventStartInInstances,
        };
    end
    if addon.Options.db.profile.EventReminders.ChatMessages.Show then
        addon.Options.db.profile.EventReminders.ChatMessages.OnLogin = {
            Show = addon.Options.db.profile.EventReminders.ChatMessages.Show.OnLogin,
            ShowInInstances = addon.Options.db.profile.EventReminders.ChatMessages.Show.OnLoginInInstances,
        };
        addon.Options.db.profile.EventReminders.ChatMessages.OnEventStart = {
            Show = addon.Options.db.profile.EventReminders.ChatMessages.Show.OnEventStart,
            ShowInInstances = addon.Options.db.profile.EventReminders.ChatMessages.Show.OnEventStartInInstances,
        };
    end
    addon.Options.db.profile.EventReminders.PopUps.Show = nil;
    addon.Options.db.profile.EventReminders.ChatMessages.Show = nil;

    diagnostics.Debug("EventReminders Options2 moved");
end

function FixActiveEvents(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 52.0 KrowiAF_SavedData.ActiveEvents became obsolete
    -- Here we clean up the old KrowiAF_SavedData.ActiveEvents for users pre 52.0

    if firstTime and currVersion > "51.4" then
        diagnostics.Debug("KrowiAF_SavedData.ActiveEvents OK");
        return;
    end
    if KrowiAF_SavedData.ActiveEvents == nil then
        diagnostics.Debug("KrowiAF_SavedData.ActiveEvents already cleared from previous version");
        return;
    end

    KrowiAF_SavedData.ActiveEvents = nil;

    diagnostics.Debug("Cleared KrowiAF_SavedData.ActiveEvents from previous version");
end

function FixFocusedOptions(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 56.0 addon.Options.db.profile.Categories.Summary.NumAchievements was moved to addon.Options.db.profile.Summary.NumAchievements
    -- Here we clean up the old addon.Options.db.profile.Categories.Summary.NumAchievements for users pre 56.0
    -- addon.Options.db.profile.Summary.NumAchievements is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "56.0" then
        diagnostics.Debug("First time Summary Options OK");
        return;
    end
    if addon.Options.db.profile.Categories.Summary == nil then
        diagnostics.Debug("Summary Options already moved");
        return;
    end

    addon.Options.db.profile.Summary = addon.Options.db.profile.Categories.Summary;
    addon.Options.db.profile.Categories.Summary = nil;

    diagnostics.Debug("Summary Options moved");
end