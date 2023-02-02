-- [[ Namespaces ]] --
local addonName, addon = ...;
local diagnostics = addon.Diagnostics;
local data = addon.Data;
data.SavedData = {};
local savedData = data.SavedData;

local LoadVerifications, Verify, LoadSolutions, Resolve;
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
local FixActiveEvents;
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
    if not SavedData.Characters then
        return;
    end
    for guid, character in next, SavedData.Characters do
        local _, realm, name = strsplit("-", guid);
        if character.Name == nil then
            SavedData.Characters[guid].Name = name;
        end
        if character.Realm == nil then
            SavedData.Characters[guid].Realm = realm;
        end
    end
end

function FixFeaturesTutorialProgress(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 23.0 the tutorial was rewritten and moved from addon.Options.db.FeaturesTutorial to SavedData.FeaturesTutorial
    -- Here we clean up the old addon.Options.db.FeaturesTutorial for users pre 23.0
    -- SavedData.FeaturesTutorial is created by the Tutorial so we don't need to do this here

    if firstTime and currVersion > "23.0" then
        diagnostics.Debug("First time Features Tutorial Progress OK");
        return;
    end
    if SavedData.FeaturesTutorial then
        diagnostics.Debug("Features Tutorial Progress already cleared from previous version");
        return;
    end

    addon.Options.db.FeaturesTutorial = nil;

    diagnostics.Debug("Cleared Features Tutorial Progress from previous version");
end

function FixElvUISkin(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 23.0 the ElvUI skin settings were moved from addon.Options.db.ElvUISkin to SavedData.ElvUISkin
    -- Here we clean up the old addon.Options.db.ElvUISkin for users pre 23.0
    -- SavedData.ElvUISkin is created by the ElvUI plugin so we don't need to do this here

    if firstTime and currVersion > "23.0" then
        diagnostics.Debug("First time ElvUISkin OK");
        return;
    end
    if SavedData.ElvUISkin then
        diagnostics.Debug("ElvUISkin already cleared from previous version");
        return;
    end

    addon.Options.db.ElvUISkin = nil;

    diagnostics.Debug("Cleared ElvUISkin from previous version");
end

function FixFilters(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 24.0 the filters were moved from addon.Options.db.Filters to Filters
    -- Here we clean up the old addon.Options.db.Filters for users pre 24.0
    -- Filters is created by the Filters so we don't need to do this here

    if firstTime and currVersion > "24.0" then
        diagnostics.Debug("First time Filter OK");
        return;
    end
    if Filters then
        diagnostics.Debug("Filter settings already cleared from previous location");
        return;
    end

    addon.Options.db.Filters = nil;

    diagnostics.Debug("Clear filter settings from previous location");
end

function FixEventDetails(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 28.0 changes were made to the Event Reminders and the tutorial
    -- Here we reset the view flag to inform the users about the changes for users pre 28.0
    -- This is now however useless since FixEventDetails2 does a complete reset of the view flags

    -- Now we just make sure to remove the fix flag for users pre 34.0
    if firstTime and currVersion > "28.0" then
        diagnostics.Debug("First time EventDetails OK");
        return;
    end
    if SavedData.Fixes.FixEventDetails == nil then
        diagnostics.Debug("EventDetails already reset");
        return;
    end

    SavedData.Fixes.FixEventDetails = nil;

    diagnostics.Debug("EventDetails reset");
end

function FixShowExcludedCategory(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 29.0 addon.Options.db.Categories.ShowExcludedCategory was moved to addon.Options.db.Categories.Excluded.Show
    -- Here we clean up the old addon.Options.db.Categories.ShowExcludedCategory for users pre 29.0
    -- addon.Options.db.Categories.Excluded.Show is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "29.0" then
        diagnostics.Debug("First time Show Excluded Category OK");
        return;
    end
    if addon.Options.db.Categories.ShowExcludedCategory == nil then
        diagnostics.Debug("Show Excluded Category already moved");
        return;
    end

    addon.Options.db.Categories.Excluded.Show = addon.Options.db.Categories.ShowExcludedCategory;
    addon.Options.db.Categories.ShowExcludedCategory = nil;

    diagnostics.Debug("Show Excluded Category moved");
end

function FixEventDetails2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 the Event Reminders data structure changed
    -- Here we reset the EventDetails for users pre 34.0
    -- EventDetails is created by the Event Data so we don't need to do this here

    if firstTime and currVersion > "34.0" then
        SavedData.Fixes.FixEventDetails2 = true;
        diagnostics.Debug("First time EventDetails2 OK");
        return;
    end
    if SavedData.Fixes.FixEventDetails2 == true then
        diagnostics.Debug("EventDetails2 already reset");
        return;
    end

    EventDetails = nil;
    SavedData.Fixes.FixEventDetails2 = true;

    diagnostics.Debug("EventDetails2 reset");
end

function FixCharacters(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 the character cache structure changed
    -- Here we clean up the old SavedData.CharacterAchievementPoints for users pre 34.0

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time CharacterAchievementPoints OK");
        return;
    end
    if SavedData.CharacterAchievementPoints == nil then
        diagnostics.Debug("CharacterAchievementPoints already cleared from previous version");
        return;
    end

    SavedData.CharacterAchievementPoints = nil;

    diagnostics.Debug("Cleared CharacterAchievementPoints from previous version");
end

function FixEventAlert(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 options related to Event Alerts changed
    -- Here we move the old data to the new locations

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time EventAlerts OK");
        return;
    end
    if addon.Options.db.EventAlert == nil then
        diagnostics.Debug("EventAlerts already copied and cleared from previous version");
        return;
    end

    addon.Options.db.EventAlert.ShowPopUps = not addon.Options.db.EventAlert.NoPopUps;
    addon.Options.db.EventAlert.NoPopUps = nil;
    addon.Options.db.EventReminders = addon.Options.db.EventAlert;
    addon.Options.db.EventAlert = nil;

    diagnostics.Debug("Copied and cleared EventAlerts from previous version");
end

function FixMergeSmallCategoriesThresholdChanged(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 addon.Options.db.Window.MergeSmallCategoriesThresholdChanged became obsolete
    -- Here we clean up the old addon.Options.db.Window.MergeSmallCategoriesThresholdChanged for users pre 34.0

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time MergeSmallCategoriesThresholdChanged OK");
        return;
    end
    if addon.Options.db.Window.MergeSmallCategoriesThresholdChanged == nil then
        diagnostics.Debug("MergeSmallCategoriesThresholdChanged already cleared from previous version");
        return;
    end

    addon.Options.db.Window.MergeSmallCategoriesThresholdChanged = nil;

    diagnostics.Debug("Cleared MergeSmallCategoriesThresholdChanged from previous version");
end

function FixShowCurrentCharacterIcons(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 34.0 addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons got split into 2 parts
    -- Here we copy the addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons to the 2 new parts

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("First time ShowCurrentCharacterIcons OK");
        return;
    end
    if addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons == nil then
        diagnostics.Debug("ShowCurrentCharacterIcons already cleared from previous version");
        return;
    end

    addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain = addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons;
    addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor = addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons;
    addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIcons = nil;

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
        diagnostics.Debug("First time Tabs port OK");
        return;
    end
    if SavedData.Fixes.FixTabs == nil then
        diagnostics.Debug("Tabs already ported from previous version");
        return;
    end

    SavedData.Fixes.FixTabs = nil;

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
        SavedData.Fixes.FixCovenantFilters = true;
        diagnostics.Debug("First time Covenant filters OK");
        return;
    end
    if SavedData.Fixes.FixCovenantFilters == true then
        diagnostics.Debug("Covenant filters already cleared from previous version");
        return;
    end

    if Filters.profiles then
        ClearCovenant(Filters.profiles);
    end

    SavedData.Fixes.FixCovenantFilters = true;

    diagnostics.Debug("Cleared covenant filters from previous version");
end

function FixNewEarnedByFilter(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 36.0 the Character earned by filter changed to Character / Account
    -- Here we transfer that data

    if firstTime and currVersion > "35.1" then
        SavedData.Fixes.FixNewEarnedByFilter = true;
        diagnostics.Debug("First time New earned by filter OK");
        return;
    end
    if SavedData.Fixes.FixNewEarnedByFilter == true then
        diagnostics.Debug("New earned by filter already transfered from previous version");
        return;
    end

    if Filters.profiles and Filters.profiles.Default and Filters.profiles.Default.EarnedBy == (GetCategoryInfo(92)) then
        Filters.profiles.Default.EarnedBy = (GetCategoryInfo(92)) .. " / " .. addon.L["Account"];
    end

    SavedData.Fixes.FixNewEarnedByFilter = true;

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
    -- Lastly, data is handled based on SavedData.Tabs and is new in 37.0 so cleanup is needed in SavedData.TabKeys
    -- Choosing to reset data, cleanup and inform user
    -- Remove bad tabs from addon.Options.db.Tabs, remove duplicate SavedData.TabKeys value

    if firstTime and currVersion > "37.0" then
        SavedData.Fixes.FixTabs2 = true;
        diagnostics.Debug("First time Tabs2 OK");
        return;
    end
    if SavedData.Fixes.FixTabs2 == true then
        diagnostics.Debug("Tabs2 already ported from previous version");
        return;
    end

    for i, _ in next, addon.Options.db.Tabs do
        if type(i) == "number" then
            addon.Options.db.Tabs[i] = nil;
        end
    end

    local newTabKeys = {};
    local addonName2, tabName;
    for i, tab in next, SavedData.Tabs do
        addonName2 = tab.AddonName;
        tabName = tab.Name;
        local order = i;
        if addonName2 == "Blizzard_AchievementUI" and tabName == "Achievements" then
            order = 4;
        end
        if addonName2 == addonName and tabName == "Achievements" then
            order = 1;
        end
        addon.Options.db.Tabs[addonName2][tabName].Order = order;
        tinsert(newTabKeys, SavedData.TabKeys[i]);
    end
    SavedData.TabKeys = newTabKeys;

    addon.Options.InjectOptionsTable({
        Locked = {
            order = 1, type = "description", width = "full",
            name = "Tabs have been changed from your previous version and have been reset. This should be a one time thing. The addon should work properly without these settings changable. Please reload at any time to fix this section. Sorry for any inconvenience.\n\n- Krowi\n\n"
        },
        Reload = {
            order = 2, type = "execute",
            name = "Reload",
            func = C_UI.Reload
        }
    }, "args", "Layout", "args", "Tabs", "args", "Order");

    SavedData.Fixes.FixTabs2 = true;

    diagnostics.Debug("Ported Tabs2 from previous version");
end

function FixNewEarnedByFilter2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 37.0 the Character earned by filter changed again to Character only
    -- Here we transfer that data
    
    if firstTime and currVersion > "37.0" then
        SavedData.Fixes.FixNewEarnedByFilter2 = true;
        diagnostics.Debug("First time New earned by filter2 OK");
        return;
    end
    if SavedData.Fixes.FixNewEarnedByFilter2 == true then
        diagnostics.Debug("New earned by filter2 already transfered from previous version");
        return;
    end

    if Filters.profiles and Filters.profiles.Default and Filters.profiles.Default.EarnedBy == (GetCategoryInfo(92)) then
        Filters.profiles.Default.EarnedBy = addon.L["Character only"];
    end

    SavedData.Fixes.FixNewEarnedByFilter2 = true;

    diagnostics.Debug("Transfered new earned by filter2 from previous version");
end

function FixEventDetails3(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 38.0 the new Event Reminders were added
    -- Here we reset the EventDetails for users pre 38.0
    -- EventDetails is created by the Event Data so we don't need to do this here

    if firstTime and currVersion > "38.0" then
        SavedData.Fixes.FixEventDetails3 = true;
        diagnostics.Debug("First time EventDetails3 OK");
        return;
    end
    if SavedData.Fixes.FixEventDetails3 == true then
        diagnostics.Debug("EventDetails3 already reset");
        return;
    end

    EventDetails = nil;
    SavedData.Fixes.FixEventDetails3 = true;

    diagnostics.Debug("EventDetails3 reset");
end

function FixTooltipCriteria(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 46.4 addon.Options.db.Tooltip.Units was moved to addon.Options.db.Tooltip.Criteria
    -- Here we clean up the old addon.Options.db.Tooltip.Units for users pre 46.4
    -- addon.Options.db.Tooltip.Criteria is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "46.4" then
        diagnostics.Debug("First time Tooltip Criteria OK");
        return;
    end
    if addon.Options.db.Tooltip.Units == nil then
        diagnostics.Debug("Tooltip Criteria already moved");
        return;
    end

    addon.Options.db.Tooltip.Criteria = addon.Options.db.Tooltip.Units;
    addon.Options.db.Tooltip.Criteria.Show = addon.Options.db.Tooltip.Criteria.ShowCriteria;
    addon.Options.db.Tooltip.Criteria.ShowIf = addon.Options.db.Tooltip.Criteria.ShowCriteriaIf;
    addon.Options.db.Tooltip.Units = nil;
    addon.Options.db.Tooltip.Criteria.ShowCriteria = nil;
    addon.Options.db.Tooltip.Criteria.ShowCriteriaIf = nil;

    diagnostics.Debug("Tooltip Criteria moved");
end

function FixFocusedAchievements(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 48.0 SavedData.FocusedAchievements was renamed to SavedData.WatchedAchievements
    -- Here we clean up the old SavedData.FocusedAchievements for users pre 48.0
    -- SavedData.WatchedAchievements is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "48.0" then
        diagnostics.Debug("First time Focused Achievements OK");
        return;
    end
    if SavedData.FocusedAchievements == nil then
        diagnostics.Debug("Focused Achievements already renamed");
        return;
    end

    SavedData.WatchedAchievements = SavedData.FocusedAchievements;
    SavedData.FocusedAchievements = nil;

    diagnostics.Debug("Focused Achievements renamed");
end

function FixFocusedOptions(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 48.0 addon.Options.db.Categories.Focused was moved to addon.Options.db.Categories.WatchList
    -- Here we clean up the old addon.Options.db.Categories.Focused for users pre 48.0
    -- addon.Options.db.Categories.WatchList is created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "48.0" then
        diagnostics.Debug("First time Focused Options OK");
        return;
    end
    if addon.Options.db.Categories.Focused == nil then
        diagnostics.Debug("Focused Options already moved");
        return;
    end

    addon.Options.db.Categories.WatchList = addon.Options.db.Categories.Focused;
    addon.Options.db.Categories.Focused = nil;

    diagnostics.Debug("Focused Options moved");
end

function FixEventRemindersTimeDisplay(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 51.0 EventReminders.TimeDisplay's Start Time option is being removed
    -- Here we fix the numbering

    if firstTime and currVersion > "51.0" then
        diagnostics.Debug("First time EventReminders TimeDisplay Options OK");
        return;
    end
    if SavedData.Fixes.FixEventRemindersTimeDisplay == true then
        diagnostics.Debug("EventReminders TimeDisplay Options already fixed");
        return;
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line1 > 1 then
        addon.Options.db.EventReminders.TimeDisplay.Line1 = addon.Options.db.EventReminders.TimeDisplay.Line1 - 1;
    end
    if addon.Options.db.EventReminders.TimeDisplay.Line2 == 2 then -- If Start Time is selected, fall back to the defaults
        addon.Options.db.EventReminders.TimeDisplay.Line2 = 3;
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 > 1 then
        addon.Options.db.EventReminders.TimeDisplay.Line2 = addon.Options.db.EventReminders.TimeDisplay.Line2 - 1;
    end

    SavedData.Fixes.FixEventRemindersTimeDisplay = true;

    diagnostics.Debug("EventReminders TimeDisplay Options fixed");
end

function FixEventRemindersOptions(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 51.0 addon.Options.db.EventReminders.MaxAlerts and addon.Options.db.EventReminders.FadeDelay were
    -- moved to addon.Options.db.EventReminders.PopUps.MaxAlerts and addon.Options.db.EventReminders.PopUps.FadeDelay
    -- Here we clean up the old addon.Options.db.EventReminders.MaxAlerts and addon.Options.db.EventReminders.FadeDelay for users pre 51.0
    -- addon.Options.db.EventReminders.PopUps.MaxAlerts and addon.Options.db.EventReminders.PopUps.FadeDelay are created by the Options
    -- so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "51.0" then
        diagnostics.Debug("EventReminders Options OK");
        return;
    end
    if addon.Options.db.EventReminders.MaxAlerts == nil and addon.Options.db.EventReminders.FadeDelay == nil then
        diagnostics.Debug("EventReminders Options already moved");
        return;
    end

    addon.Options.db.EventReminders.PopUps.MaxAlerts = addon.Options.db.EventReminders.MaxAlerts;
    addon.Options.db.EventReminders.PopUps.FadeDelay = addon.Options.db.EventReminders.FadeDelay;
    addon.Options.db.EventReminders.MaxAlerts = nil;
    addon.Options.db.EventReminders.FadeDelay = nil;

    diagnostics.Debug("EventReminders Options moved");
end

function FixEventRemindersOptions2(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 52.0 addon.Options.db.EventReminders.PopUps.Show and addon.Options.db.EventReminders.ChatMessages.Show were
    -- moved and split to addon.Options.db.EventReminders.PopUps.OnLogin, addon.Options.db.EventReminders.PopUps.OnReload,
    -- addon.Options.db.EventReminders.PopUps.OnEventStart, addon.Options.db.EventReminders.ChatMessages.OnLogin,
    -- addon.Options.db.EventReminders.ChatMessages.OnReload and addon.Options.db.EventReminders.ChatMessages.OnEventStart
    -- Here we clean up the old addon.Options.db.EventReminders.PopUps.Show and addon.Options.db.EventReminders.ChatMessages.Show for users pre 52.0
    -- New options mentioned above are created by the Options so we don't need to do this here, just copy if previous existed

    if firstTime and currVersion > "51.5" then
        diagnostics.Debug("EventReminders Options2 OK");
        return;
    end
    if addon.Options.db.EventReminders.PopUps.Show == nil and addon.Options.db.EventReminders.ChatMessages.Show == nil then
        diagnostics.Debug("EventReminders Options2 already moved");
        return;
    end

    addon.Options.db.EventReminders.PopUps.OnLogin = {
        Show = addon.Options.db.EventReminders.PopUps.Show.OnLogin,
        ShowInInstances = addon.Options.db.EventReminders.PopUps.Show.OnLoginInInstances,
    };
    addon.Options.db.EventReminders.PopUps.OnEventStart = {
        Show = addon.Options.db.EventReminders.PopUps.Show.OnEventStart,
        ShowInInstances = addon.Options.db.EventReminders.PopUps.Show.OnEventStartInInstances,
    };
    addon.Options.db.EventReminders.ChatMessages.OnLogin = {
        Show = addon.Options.db.EventReminders.ChatMessages.Show.OnLogin,
        ShowInInstances = addon.Options.db.EventReminders.ChatMessages.Show.OnLoginInInstances,
    };
    addon.Options.db.EventReminders.ChatMessages.OnEventStart = {
        Show = addon.Options.db.EventReminders.ChatMessages.Show.OnEventStart,
        ShowInInstances = addon.Options.db.EventReminders.ChatMessages.Show.OnEventStartInInstances,
    };
    addon.Options.db.EventReminders.PopUps.Show = nil;
    addon.Options.db.EventReminders.ChatMessages.Show = nil;

    diagnostics.Debug("EventReminders Options2 moved");
end

function FixActiveEvents(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    -- In version 52.0 SavedData.ActiveEvents became obsolete
    -- Here we clean up the old SavedData.ActiveEvents for users pre 52.0

    if firstTime and currVersion > "34.0" then
        diagnostics.Debug("SavedData.ActiveEvents OK");
        return;
    end
    if SavedData.ActiveEvents == nil then
        diagnostics.Debug("SavedData.ActiveEvents already cleared from previous version");
        return;
    end

    SavedData.ActiveEvents = nil;

    diagnostics.Debug("Cleared SavedData.ActiveEvents from previous version");
end