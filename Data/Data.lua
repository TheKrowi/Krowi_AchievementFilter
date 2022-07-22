-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
addon.Data = {};
local data = addon.Data;

data.TransmogSets = {};

data.Achievements = {};
data.AchievementIDs = {};

data.CategoriesExpansions, data.CategoriesEvents, data.CategoriesPvP, data.CategoriesSpecials, data.CategoriesAchievements = {}, {}, {}, {}, {};
data.CurrentZoneCategory, data.SelectedZoneCategory, data.FocusedCategory, data.ExcludedCategory = {}, {}, {}, {};

data.RCMenuExtras = {};

data.Maps = {};

data.CalendarEvents, data.WidgetEvents, data.WorldEvents = {}, {}, {};

local isLoaded;
function data.Load()
    if isLoaded then
        return;
    end

    data.ExportedTransmogSets.Load(data.TransmogSets);

    data.AchievementIDs = data.ExportedAchievements.Load(data.Achievements, data.TransmogSets);
    local custom = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Layout"], "cmd", "KROWIAF-0.0").args.Summary.args.Summary.args.NumAchievements; -- cmd and KROWIAF-0.0 are just to make the function work
    custom.max = #data.AchievementIDs;

    local tabsCategories;
    tabsCategories, data.FocusedCategory, data.CurrentZoneCategory, data.SelectedZoneCategory, data.ExcludedCategory = data.ExportedCategories.Load(data.Achievements);
    for t, _ in next, addon.Tabs do
        if tabsCategories[t] ~= nil then
            addon.Tabs[t].Categories = tabsCategories[t];
        end
    end

    data.ExportedPetBattles.Load(data.RCMenuExtras);

    data.ExportedUiMaps.Load(data.Maps, data.Achievements);

    data.ExportedCalendarEvents.LoadCategories(data.CalendarEvents, data.Achievements);
    data.ExportedWidgetEvents.LoadCategories(data.WidgetEvents, data.Achievements);
    data.ExportedWorldEvents.LoadCategories(data.WorldEvents, data.Achievements);

    if addon.Tabs["Achievements"] then
        addon.Tabs["Achievements"].Categories = data.LoadBlizzardTabAchievements(addon.Tabs["Achievements"].Categories);
    end

    isLoaded = true;
    addon.Diagnostics.Debug("Expansion data loaded");

    -- TEST = {};
    -- data.PrintCriteria(14879, nil, 0);
end

function data.LoadFocusedAchievements(achievements)
    if SavedData.FocusedAchievements == nil or type(SavedData.FocusedAchievements) ~= "table" then
        return;
    end

    for achievementID, _ in next, SavedData.FocusedAchievements do
        addon.FocusAchievement(achievements[achievementID], false);
    end

    addon.GUI.CategoriesFrame:Update(true);

    addon.Diagnostics.Debug("Focused achievements loaded");
    -- diagnostics.DebugTable(SavedData.FocusedAchievements);
end

function data.LoadExcludedAchievements(achievements)
    if SavedData.ExcludedAchievements == nil or type(SavedData.ExcludedAchievements) ~= "table" then
        return;
    end

    for achievementID, _ in next, SavedData.ExcludedAchievements do
        addon.ExcludeAchievement(achievements[achievementID], false);
    end

    addon.GUI.CategoriesFrame:Update(true);

    addon.Diagnostics.Debug("Excluded achievements loaded");
    -- diagnostics.DebugTable(SavedData.ExcludedAchievements);
end

local cachedZone;
function data.GetCurrentZoneAchievements()
	diagnostics.Trace("data.GetCurrentZoneAchievements");

    if cachedZone ~= C_Map.GetBestMapForUnit("player") then
        cachedZone = C_Map.GetBestMapForUnit("player");
        addon.Data.CurrentZoneCategory.Achievements = addon.GetAchievementsInZone(cachedZone);
        return true; -- Output that the zone has changed
    end
end

function data.AddAchievementIfNil(id, points)
    if data.Achievements[id] == nil then
        data.Achievements[id] = addon.Objects.Achievement:New(id, points);
        tinsert(data.AchievementIDs, id);
    end
end

function data.SortAchievementIDs()
    sort(data.AchievementIDs);
end

local tmpC = {};
local addedOutOfOrder = {};
local function AddAchievementsToCategory(categoryID, achID)
    if data.Achievements[achID] ~= nil then
        tmpC[categoryID]:AddAchievement(data.Achievements[achID]);
        addedOutOfOrder[achID] = true;

        if data.Achievements[achID].NextAchievements then
            for id, _ in next, data.Achievements[achID].NextAchievements do
                AddAchievementsToCategory(categoryID, id);
            end
        end
    end
end

function data.LoadBlizzardTabAchievements(categories)
    addon.BuildCache();

    -- local categories = addon.Objects.Category:New(addon.L["Achievements"]); -- TAB - Achievements;
    -- categories.TabName = "Achievements";
    local tab = categories[1].Parent;

    local cats = GetCategoryList();

    for _, id in next, cats do -- Load all categories, this is done in a random order and is possible for a child to load before a parent
		local name, parentID = GetCategoryInfo(id);
        tmpC[id] = addon.Objects.Category:New(name);
		if parentID == -1 then
			-- categories:AddCategory(tmpC[id]);
			tab:AddCategory(tmpC[id]);
		end
	end

    for _, id in next, cats do -- When everything is loaded, we can link children and parents
		local _, parentID = GetCategoryInfo(id);
		if parentID ~= -1 then
            tmpC[parentID]:AddCategory(tmpC[id]);
		end
	end

    for i = 1, #data.AchievementIDs do
        local prevID = GetPreviousAchievement(data.AchievementIDs[i]);
        if prevID == 14884 then -- 14884 is a tracking achievement and is not earned by everyone
            prevID = 9;
        end
        if prevID and data.Achievements[prevID] then
            data.Achievements[prevID]:AddNext(data.Achievements[data.AchievementIDs[i]]);
        end
    end

    for i = 1, #data.AchievementIDs do
        local achID = data.AchievementIDs[i];
        if addedOutOfOrder[achID] == nil then -- Not yet added
            local categoryID = GetAchievementCategory(achID);
            if tmpC[categoryID] ~= nil then
                achID = addon.GetFirstAchievementId(achID);
                AddAchievementsToCategory(categoryID, achID);
            end
        end
    end

    -- Clean up after ourselves
    tmpC = nil;
    addedOutOfOrder = nil;

    return tab.Children;
end

-- function data.PrintCriteria(achievementID, parentCriteriaID, criteriaNumber)
--     local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID);

--     local record = "A" .. tostring(id) .. "\t" .. tostring(achievementID) .. "\t" .. tostring(criteriaNumber) .. "\t" .. name .. "\t" .. tostring(parentCriteriaID) .. "\t" .. 0;
--     tinsert(TEST, record);

--     if parentCriteriaID == nil then
--         parentCriteriaID = "A" .. tostring(id);
--     end

--     for i = 1, GetAchievementNumCriteria(achievementID) do
--         local family = "nil";
--         if string.match(description:lower(), "aquatic") then
--             family = "Aquatic";
--         elseif string.match(description:lower(), "beast") then
--             family = "Beast";
--         elseif string.match(description:lower(), "critter") then
--             family = "Critter";
--         elseif string.match(description:lower(), "dragonkin") then
--             family = "Dragonkin";
--         elseif string.match(description:lower(), "elemental") then
--             family = "Elemental";
--         elseif string.match(description:lower(), "flying") then
--             family = "Flying";
--         elseif string.match(description:lower(), "humanoid") then
--             family = "Humanoid";
--         elseif string.match(description:lower(), "magic") then
--             family = "Magic";
--         elseif string.match(description:lower(), "mechanical") then
--             family = "Mechanical";
--         elseif string.match(description:lower(), "undead") then
--             family = "Undead";
--         end
--         local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(achievementID, i);
--         if GetAchievementInfo(assetID) ~= nil then -- Means the assetID was not an achievementID but something else like a quest
--             data.PrintCriteria(assetID, "A" .. tostring(id), i);
--         else
--             local record = tostring(criteriaID) .. "\t" .. tostring(nil) .. "\t" .. tostring(i) .. "\t" .. criteriaString .. "\t" .. "A" .. tostring(id) .. "\t" .. family;
--             tinsert(TEST, record);
--         end
--     end
-- end