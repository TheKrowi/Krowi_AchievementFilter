-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
addon.Data = {};
local data = addon.Data;

data.Workload = {};

data.TransmogSets = {};

data.Achievements = {};
data.AchievementIds = {};

data.CategoriesExpansions, data.CategoriesEvents, data.CategoriesPvP, data.CategoriesSpecials, data.CategoriesAchievements = {}, {}, {}, {}, {};

data.RCMenuExtras = {};

data.Maps = {};

data.CalendarEvents, data.WidgetEvents, data.WorldEvents = {}, {}, {};

function data:LoadOnPlayerLogin()
    self.TemporaryObtainable:Load();
    self.ExportedTransmogSets.RegisterWorkload(self.TransmogSets);
    self.ExportedAchievements.RegisterWorkload(self.Achievements, self.TransmogSets);
    local overallStart = debugprofilestop();
    addon.StartWorkTable(
        self.Workload,
        function() print("Finished whoo"); end,
        function(numOfWork)
            print(numOfWork .. " remaining after " .. ("%.2d"):format(debugprofilestop() - overallStart) / 1000);
        end
    );
    addon.Diagnostics.Debug("On Player Login: Start loading data");
    addon.StartWork(
        nil,
        {
            { self.ExportedWorldEvents.Load, self.WorldEvents },
            { self.ExportedWidgetEvents.Load, self.WidgetEvents },
            { self.ExportedCalendarEvents.Load, self.CalendarEvents }
        },
        "On Player Login: Finished loading data",
        true
    );

    self.ExportedAchievements.Load(self.AchievementIds);
end

local isLoaded;
function data.Load()
    if isLoaded then
        return;
    end

    -- data.AchievementIds = data.ExportedAchievements.Load(data.Achievements, data.TransmogSets);
    local custom = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.Metadata.Prefix .. "_Layout", "cmd", "KROWIAF-0.0").args.Summary.args.Summary.args.NumAchievements; -- cmd and KROWIAF-0.0 are just to make the function work
    custom.max = #data.AchievementIds;

    local tabsCategories;
    tabsCategories, data.WatchListCategories, data.CurrentZoneCategories, data.SelectedZoneCategories, data.SearchResultsCategories, data.TrackingAchievementsCategories, data.ExcludedCategories = data.ExportedCategories.Load(data.Achievements);
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
end

local function LoadAchievements(sourceTable, func)
    if sourceTable == nil or type(sourceTable) ~= "table" then
        return;
    end

    for achievementId, _ in next, sourceTable do
        if data.Achievements[achievementId] then -- This is to clean up achievements that are no longer in the dataset
            func(data.Achievements[achievementId], false);
        else
            sourceTable[achievementId] = nil;
        end
    end

    addon.GUI.CategoriesFrame:Update(true);
end

function data.LoadWatchedAchievements()
    LoadAchievements(KrowiAF_SavedData.WatchedAchievements, addon.WatchAchievement);
    addon.Diagnostics.Debug("Watched achievements loaded");
end

function data.LoadTrackingAchievements()
    LoadAchievements(addon.TrackingAchievements, addon.AddToTrackingAchievementsCategories);
    addon.Diagnostics.Debug("Tracking achievements loaded");
end

function data.LoadExcludedAchievements()
    LoadAchievements(KrowiAF_SavedData.ExcludedAchievements, addon.ExcludeAchievement);
    addon.Diagnostics.Debug("Excluded achievements loaded");
end

local cachedZone;
function data.GetCurrentZoneAchievements()
	diagnostics.Trace("data.GetCurrentZoneAchievements");

    if cachedZone ~= C_Map.GetBestMapForUnit("player") then
        cachedZone = C_Map.GetBestMapForUnit("player");
        local achievements = addon.GetAchievementsInZone(cachedZone);
        for i = 1, #addon.Data.CurrentZoneCategories do
            addon.Data.CurrentZoneCategories[i].Achievements = addon.Options.db.profile.AdjustableCategories.CurrentZone[i] and achievements or nil;
        end
        return true; -- Output that the zone has changed
    end
end

function data.AddAchievementIfNil(id, points)
    if data.Achievements[id] == nil then
        addon.Objects.Achievement:New(id, points);
        tinsert(data.AchievementIds, id);
    end
end

function data.SortAchievementIds()
    sort(data.AchievementIds);
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
			tab:InsertCategory(tmpC[id], #tab.Children - 2);
		end
	end

    for _, id in next, cats do -- When everything is loaded, we can link children and parents
		local _, parentID = GetCategoryInfo(id);
		if parentID ~= -1 then
            tmpC[parentID]:AddCategory(tmpC[id]);
		end
	end

    for i = 1, #data.AchievementIds do
        local prevId = GetPreviousAchievement(data.AchievementIds[i]);
        if prevId == 14884 then -- 14884 is a tracking achievement and is not earned by everyone
            prevId = 9;
        end
        if prevId and data.Achievements[prevId] then
            data.Achievements[prevId]:AddNext(data.Achievements[data.AchievementIds[i]]);
        end
    end

    for i = 1, #data.AchievementIds do
        local achId = data.AchievementIds[i];
        if addedOutOfOrder[achId] == nil then -- Not yet added
            local categoryID = GetAchievementCategory(achId);
            if tmpC[categoryID] ~= nil then
                achId = addon.GetFirstAchievementId(achId);
                AddAchievementsToCategory(categoryID, achId);
            end
        end
    end

    -- Clean up after ourselves
    tmpC = nil;
    addedOutOfOrder = nil;

    return tab.Children;
end

function data.InjectLoadingDebug(workload, name)
    if not addon.Diagnostics.DebugEnabled() then
        return;
    end

    tinsert(workload, function() print(name .. ": Start loading data"); end);
    tinsert(workload, 1, function() print(name .. ": Finished loading data"); end);
end

-- function KrowiAF_PrintPetCriteria(achievementID, parentCriteriaID, criteriaNumber)
--     TEST = {};
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
--         local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID = addon.GetAchievementCriteriaInfo(achievementID, i);
--         if GetAchievementInfo(assetID) ~= nil then -- Means the assetID was not an achievementID but something else like a quest
--             data.PrintCriteria(assetID, "A" .. tostring(id), i);
--         else
--             local record = tostring(criteriaID) .. "\t" .. tostring(nil) .. "\t" .. tostring(i) .. "\t" .. criteriaString .. "\t" .. "A" .. tostring(id) .. "\t" .. family;
--             tinsert(TEST, record);
--         end
--     end
-- end