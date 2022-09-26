local addonName, addon = ...;

function addon.GetFirstAchievementId(id)
    local firstId;
	while id do
		firstId = id;
		id = GetPreviousAchievement(id);
	end
    return firstId;
end

function addon.InGuildView()
    return AchievementFrame.Header.Title:GetText() == GUILD_ACHIEVEMENTS_TITLE;
end

function addon.GetActiveCovenant()
    return C_Covenants.GetActiveCovenantID() + 1; -- 1 offset since Covenant Enum is 1 based (lua) and Covenant Database Table 0 based
end

function addon.GetAchievementsInZone(mapID, getAll)
    addon.Diagnostics.Trace("addon.GetAchievementsInZone");

    -- Differentiate between 10 and 25 man raids and Normal and Heroic raids
    local player10 = GetDifficultyInfo(3); -- 10 player
    local player10Hc = GetDifficultyInfo(5); -- 10 player
    local player25 = GetDifficultyInfo(4); -- 25 player
    local player25Hc = GetDifficultyInfo(6); -- 25 player
    local _, _, _, difficulty = GetInstanceInfo();

    local achievements = {};
    if addon.Data.Maps[mapID] == nil then
        return achievements;
    else
        addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements);
    end

    if difficulty ~= "" then -- Need to add 10 and 25 when doing it from the map
        if difficulty == player10 or difficulty == player10Hc then
            addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements10);
        elseif difficulty == player25 or difficulty == player25Hc then
            addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements25);
        end
    elseif getAll then
        addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements10);
        addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements25);
    end

    return achievements;
end

function addon.GetAchievementNumbers(_filters, achievement, numOfAch, numOfCompAch, numOfNotObtAch) -- , numOfIncompAch
    if achievement.AlwaysVisible then
        return numOfAch, numOfCompAch, numOfNotObtAch; -- , numOfIncompAch
    end
    local filters = addon.Filters;
	if filters and filters.Validate(_filters, achievement, true) > 0 then -- If set to false we lag the game
		numOfAch = numOfAch + 1;
		local _, _, _, completed = addon.GetAchievementInfo(achievement.Id);
        local state;
        if achievement.TemporaryObtainable then
            state = achievement.TemporaryObtainable.Obtainable();
        end
		if completed then
			numOfCompAch = numOfCompAch + 1;
		-- else
		-- 	numOfIncompAch = numOfIncompAch + 1;
        elseif state and (state == false or state == "Past" or state == "Future") then
			numOfNotObtAch = numOfNotObtAch + 1;
		end
	end

	return numOfAch, numOfCompAch, numOfNotObtAch; -- , numOfIncompAch
end

local function AddCategoriesTree(category, achievement, extraFunc)
    local categories = achievement.Category:GetTree();
    for _, cat in next, categories do
        local alreadyAdded;
        if category.Children then
            for _, child in next, category.Children do
                if child.Name == cat.Name then
                    alreadyAdded = true;
                    category = child;
                end
            end
        end
        if alreadyAdded == nil then
            local newCategory = addon.Objects.Category:New(cat.Name);
            extraFunc(newCategory);
            category = category:AddCategory(newCategory);
        end
        alreadyAdded = nil;
    end
    return category;
end

local function AddFocusedCategoriesTree(focusedCategory, achievement)
    if not addon.Options.db.Categories.Focused.ShowSubCategories then
        return focusedCategory;
    end
    return AddCategoriesTree(focusedCategory, achievement, function(newCategory)

    end);
end

local function AddTrackingAchievementsCategoriesTree(trackingAchievementsCategory, achievement)
    if not addon.Options.db.Categories.TrackingAchievements.ShowSubCategories or achievement.Category == nil then
        return trackingAchievementsCategory;
    end
    return AddCategoriesTree(trackingAchievementsCategory, achievement, function(newCategory)
        newCategory.IsTracking = true;
    end);
end

local function AddExcludedCategoriesTree(excludedCategory, achievement)
    if not addon.Options.db.Categories.Excluded.ShowSubCategories then
        return excludedCategory;
    end
    return AddCategoriesTree(excludedCategory, achievement, function(newCategory)
        newCategory.Excluded = true;
    end);
end

local function ClearTree(categories)
    for i = #categories, 1, -1 do
        if categories[i].Achievements == nil or #categories[i].Achievements == 0 then -- No more achievements
            if categories[i].Children == nil or #categories[i].Children == 0 then -- And no more children
                categories[i].Parent:RemoveCategory(categories[i]);
            end
        end
    end
end

function addon.ClearFocusAchievement(achievement, update)
    achievement:ClearFocus();
    if addon.Options.db.Categories.Focused.ShowSubCategories then
        ClearTree(achievement.FocusedCategory:GetTree());
    end
    local numFocusedCategories = achievement.FocusedCategories and #achievement.FocusedCategories or 0;
    for i = 1, numFocusedCategories do
        achievement.FocusedCategories[i]:RemoveFocusedAchievement(achievement);
    end
    if update ~= false then
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
    for i = 1, #addon.Data.FocusedCategories do
        if (addon.Data.FocusedCategories[i].Achievements and #addon.Data.FocusedCategories[i].Achievements == 0) or (addon.Data.FocusedCategories[i].Children and #addon.Data.FocusedCategories[i].Children == 0) then
            SavedData.FocusedAchievements = nil;
            addon.Data.FocusedCategories[i].Achievements = nil;
        end
    end
end

function addon.FocusAchievement(achievement, update)
    achievement:Focus();
    for i = 1, #addon.Data.FocusedCategories do
        if addon.Options.db.AdjustableCategories.Focused[i] then
            local focusedCategory = AddFocusedCategoriesTree(addon.Data.FocusedCategories[i], achievement);
            focusedCategory:AddFocusedAchievement(achievement);
        end
	end
    if update ~= false then
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
end

function addon.AddToTrackingAchievementsCategories(achievement, update)
    for i = 1, #addon.Data.TrackingAchievementsCategories do
        if addon.Options.db.AdjustableCategories.TrackingAchievements[i] then
            local trackingAchievementsCategory = AddTrackingAchievementsCategoriesTree(addon.Data.TrackingAchievementsCategories[i], achievement);
            trackingAchievementsCategory:AddAchievement(achievement);
        end
    end
    if update ~= false then
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
end

function addon.IncludeAchievement(achievement, update)
    achievement:Include();
    if addon.Options.db.Categories.Excluded.ShowSubCategories then
        ClearTree(achievement.ExcludedCategory:GetTree());
    end
    local numExcludedCategories = achievement.ExcludedCategories and #achievement.ExcludedCategories or 0;
    for i = 1, numExcludedCategories do
        achievement.ExcludedCategories[i]:RemoveExcludedAchievement(achievement);
    end
    if update ~= false then
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
    for i = 1, #addon.Data.ExcludedCategories do
        if (addon.Data.ExcludedCategories[i].Achievements and #addon.Data.ExcludedCategories[i].Achievements == 0) or (addon.Data.ExcludedCategories[i].Children and #addon.Data.ExcludedCategories[i].Children == 0) then
            SavedData.ExcludedAchievements = nil;
            addon.Data.ExcludedCategories[i].Achievements = nil;
        end
    end
end

function addon.ExcludeAchievement(achievement, update)
    achievement:Exclude();
    if addon.Options.db.Categories.Excluded.Show then
        for i = 1, #addon.Data.ExcludedCategories do
            if addon.Options.db.AdjustableCategories.Excluded[i] then
                local excludedCategory = AddExcludedCategoriesTree(addon.Data.ExcludedCategories[i], achievement);
                excludedCategory:AddExcludedAchievement(achievement);
            end
        end
        if update ~= false then
            addon.GUI.CategoriesFrame:Update(true);
            addon.GUI.AchievementsFrame:ForceUpdate();
        end
    else
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
end

local criteriaCache, characterPoints;
local function AddCharToSavedData(playerGUID)
    if not SavedData.Characters then
        SavedData.Characters = {};
    end
    local character = SavedData.Characters[playerGUID];
    local excludeFromHeaderTooltip;
    if character then
        excludeFromHeaderTooltip = character.ExcludeFromHeaderTooltip;
    end
    SavedData.Characters[playerGUID] = {
        Name = (UnitFullName("player")),
        Realm = (select(2, UnitFullName("player"))),
        Class = (select(2, UnitClass("player"))),
        Faction = (UnitFactionGroup("player")),
        CompletedAchievements = {},
        ExcludeFromHeaderTooltip = excludeFromHeaderTooltip
    };
end

local function SetCharPoints(playerGUID, points)
    SavedData.Characters[playerGUID].Points = points;
end

local function AddCharCompletedAchievement(playerGUID, achievementID, month, day, year)
    SavedData.Characters[playerGUID].CompletedAchievements[achievementID] = time{
        year = 2000 + year,
        month = month,
        day = day
    };
end

local function CheckHexFlags(flags, flag)
    return (flags / tonumber(flag, 16)) % 2 >= 1;
end

local function CheckDecFlags(flags, flag)
    return (flags / flag) % 2 >= 1;
end

local function IsTraching(flags)
    return CheckHexFlags(flags, "100000"); -- See https://wowpedia.fandom.com/wiki/API_GetAchievementInfo for all flags
end

local function IncrementCharacterPoints(playerGUID, id, points, month, day, year, flags, isGuild, wasEarnedByMe, isStatistic, exists)
    if wasEarnedByMe and points >= 0 and not isStatistic and not isGuild and not IsTraching(flags) and exists then
        characterPoints = characterPoints + points;
        AddCharCompletedAchievement(playerGUID, id, month, day, year);
    end
end

addon.TrackingAchievements = {};
local function AddToCache(id, points, flags, isGuild, isStatistic, exists)
    if isStatistic or isGuild then
        return;
    end
    local isTracking = IsTraching(flags);
    if isTracking and not addon.Options.db.Categories.TrackingAchievements.DoLoad then
        return;
    end
    if exists then
        addon.Data.AddAchievementIfNil(id, points);
    elseif addon.Data.Achievements[id] then
        addon.Data.Achievements[id].DoesNotExist = true;
        return;
    else
        return; -- Can this be reached?
    end
    if isTracking then
        addon.TrackingAchievements[id] = true;
        addon.Data.Achievements[id].IsTracking = true;
        return;
    end
    local numCriteria = GetAchievementNumCriteria(id);
    if numCriteria <= 0 then
        return;
    end
    for j = 1, numCriteria do
        local _, criteriaType, _, _, _, _, _, assetID = GetAchievementCriteriaInfo(id, j);
        if criteriaType == 8 then -- See https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo for all criteria types
            tinsert(criteriaCache, {AchievementId = assetID, RequiredForId = id});
        end
    end
end

function addon.BuildCache()
    if criteriaCache ~= nil then -- Build cache the first time
        return criteriaCache, characterPoints;
    end

    local playerGUID = UnitGUID("player");
    criteriaCache = {};
    characterPoints = 0;
    local gapSize, i = 0, 1;
    AddCharToSavedData(playerGUID);
    local highestId = addon.Data.AchievementIDs[#addon.Data.AchievementIDs];
    while gapSize < 500 or i < highestId do -- Biggest gap is 209 in 9.0.5 as of 2021-05-03
        local id, _, points, _, month, day, year, _, flags, _, _, isGuild, wasEarnedByMe, _, isStatistic, exists = addon.GetAchievementInfo(i);

        if id then
            IncrementCharacterPoints(playerGUID, id, points, month, day, year, flags, isGuild, wasEarnedByMe, isStatistic, exists);
            AddToCache(id, points, flags, isGuild, isStatistic, exists);
        end
        if id and exists then
            gapSize = 0;
        else
            gapSize = gapSize + 1;
        end
        i = i + 1;
    end
    addon.Data.SortAchievementIDs(); -- Achievements are added to the back so we need to make sure the list is sorted again
    SetCharPoints(playerGUID, characterPoints);
    return criteriaCache, characterPoints;
end

function addon.ResetCache()
    criteriaCache = nil;
end

function addon.HookSelectAchievement()
    hooksecurefunc("AchievementFrame_SelectAchievement", function(id, forceSelect, isComparison)
        KrowiAF_SelectAchievementFromID(id);
    end);
end

function addon.HookAchievementFrameOnShow()
    hooksecurefunc(AchievementFrame, "Show", function()
        addon.Data.GetCurrentZoneAchievements();
    end);

    local funcName = addon.IsWrathClassic and "PanelTemplates_SetTab" or "AchievementFrame_SetTabs";
    hooksecurefunc(funcName, function()
        addon.GUI.ShowHideTabs();
    end);
end

local function MakeMovable(frame, rememberLastPositionOption, target)
    if frame:IsMovable() then -- Do not hook it multiple times if another addon already made it movable
        return;
    end

    target = target or frame;

    frame:SetMovable(true);
    frame:EnableMouse(true);
    frame:SetScript("OnMouseDown", function(frame, button)
        if button == "LeftButton" then
            target:StartMoving();
        end
    end);
    frame:SetScript("OnMouseUp", function(frame, button)
        target:StopMovingOrSizing();
        if addon.Options.db.Window.RememberLastPosition[rememberLastPositionOption] then
            SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
            SavedData.RememberLastPosition[rememberLastPositionOption] = {
                X = target:GetLeft(),
                Y = target:GetTop() - UIParent:GetTop()
            };
        end
    end);
end

function addon.MakeWindowMovable()
    SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
    if not SavedData.RememberLastPosition["AchievementWindow"] then
        addon.GUI.ResetAchievementWindowPosition();
    end
    if not SavedData.RememberLastPosition["Calendar"] then
        addon.GUI.Calendar:ResetFramePosition();
    end
    if not SavedData.RememberLastPosition["DataManager"] then
        addon.GUI.DataManagerFrame:ResetPosition();
    end

    if not addon.Options.db.Window.Movable then
        return;
    end
    if AchievementFrame and AchievementFrame.Header then
        local pos = SavedData.RememberLastPosition["AchievementWindow"];
        AchievementFrame:SetPoint("TOPLEFT", pos.X, pos.Y);
        MakeMovable(AchievementFrame, "AchievementWindow");
        MakeMovable(AchievementFrame.Header, "AchievementWindow", AchievementFrame);
    end
    if addon.GUI.Calendar.Frame then
        local pos = SavedData.RememberLastPosition["Calendar"];
        addon.GUI.Calendar.Frame:SetPoint("TOPLEFT", pos.X, pos.Y);
        MakeMovable(addon.GUI.Calendar.Frame, "Calendar");
    end
    if addon.GUI.DataManagerFrame then
        local pos = SavedData.RememberLastPosition["DataManager"];
        addon.GUI.DataManagerFrame:SetPoint("TOPLEFT", pos.X, pos.Y);
        MakeMovable(addon.GUI.DataManagerFrame, "DataManager");
    end
end

function addon.GetSecondsSince(date)
    date.day = date.monthDay;
    date.monthDay = nil;
    date.wday = date.weekday;
    date.weekday = nil;
    date.min = date.minute;
    date.minute = nil;
    return time(date);
end

function addon.ReplaceVarsWithReloadReq(str, vars)
    if not vars then
        vars = type(str) == "table" and str or {str};
        str = vars[1];
    end
    vars["reloadRequired"] = addon.L["Requires a reload"];
    return addon.Util.ReplaceVars(str, vars);
end

function addon.GetAchievementInfo(achievementID) -- Returns an additional bool indicating if the achievement is added to the game yet or not
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementID);
    if id then
        return id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic, true;
    else
        return achievementID, " * Placeholder for " .. achievementID .. " * ", 0, false, nil, nil, nil,
        " * This is the placeholder for " .. achievementID .. " until it's available next patch.", 0, 134400, "", false, false, "", false, false;
    end
    return nil; -- Achievement info not found, default function also returns nil when not found
end

function addon.GetNextAchievement(achievement)
    if achievement.NextAchievements then
        for _, nextAchievement in next, achievement.NextAchievements do
            local _, _, _, completed, _, _, _, _, _, _, _, _, _, earnedBy, _ = addon.GetAchievementInfo(nextAchievement.ID);
            if earnedBy ~= nil then -- Will be nil if the achievement is for the other faction
                return nextAchievement, completed;
            end
        end
    end
    return nil, false;
end

-- function addon.GetOpposingFaction(faction)
--     if faction == addon.Objects.Faction.Alliance then
--         return addon.Objects.Faction.Horde;
--     elseif faction == addon.Objects.Faction.Horde then
--         return addon.Objects.Faction.Alliance;
--     end
-- end

-- function addon.GetFactionName(faction)
--     if faction == addon.Objects.Faction.Alliance then
--         return addon.L["Alliance"];
--     elseif faction == addon.Objects.Faction.Horde then
--         return addon.L["Horde"];
--     else
--         return addon.L["Neutral"];
--     end
-- end

function addon.GetUsableSets(transmogSets)
    local usableTransmogSets = {};
    local _, _, classId = UnitClass("player");
    for _, transmogSet in next, transmogSets do
        if CheckDecFlags(transmogSet.ClassMask, math.pow(2, classId - 1)) then
            tinsert(usableTransmogSets, transmogSet);
            -- addon.Diagnostics.Debug("Usable set " .. tostring(transmogSet.Id) .. " added");
        end
    end
    return usableTransmogSets;
end

function addon.GetVariantSetIDs(baseSetIds)
    if not IsAddOnLoaded("Blizzard_Collections") then
        LoadAddOn("Blizzard_Collections");
    end
    local setIDs = {};
    for _, baseSetId in next, baseSetIds do
        local variantSets = WardrobeSetsDataProviderMixin:GetVariantSets(baseSetId);
        if #variantSets ~= 0 then
            for _, set in next, variantSets do
                tinsert(setIDs, set.setID);
            end
        else
            tinsert(setIDs, baseSetId);
        end
    end
    return setIDs;
end

function addon.ChangeAchievementMicroButtonOnClick()
    addon.GUI.TabsOrderGetActiveKeys(); -- Cleanup unused tabs
    if addon.Options.db.MicroButtonTab > #SavedData.Tabs then
        for i, _ in next, SavedData.Tabs do
            if SavedData.Tabs[i].AddonName == addonName and SavedData.Tabs[i].Name == "Achievements" then
                addon.Options.db.MicroButtonTab = i;
            end
        end
    end
    local tab = SavedData.Tabs[addon.Options.db.MicroButtonTab];
    if tab.AddonName == "Blizzard_AchievementUI" then
        return;
    end
    AchievementMicroButton:SetScript("OnClick", function(self)
        addon.GUI.ToggleAchievementFrame(tab.AddonName, tab.Name);
    end);
end

function addon.GetInstanceInfoName(journalInstanceId)
    local name = EJ_GetInstanceInfo and (EJ_GetInstanceInfo(journalInstanceId)) or nil;
    if name then
        return name;
    end
    name = addon.L["EJ_GetInstanceInfo" .. journalInstanceId];
    if name then
        return name;
    end
    return journalInstanceId;
end

function addon.GetCategoryInfoTitle(categoryId)
    local title = (GetCategoryInfo(categoryId));
    if title then
        return title;
    end
    title = addon.L["GetCategoryInfo" .. categoryId];
    if title then
        return title;
    end
    return categoryId;
end

function addon.GetLFGDungeonInfo(dungeonID)
    return GetLFGDungeonInfo and GetLFGDungeonInfo(dungeonID) or dungeonID;
end

function addon.GetCovenantName(covenantID)
    return C_Covenants and C_Covenants.GetCovenantData(covenantID).name or covenantID;
end

function addon.GetMapName(uiMapID)
    local mapInfo = C_Map.GetMapInfo(uiMapID);
    return mapInfo and mapInfo.name or uiMapID;
end

-- function KrowiAF_FireEvent(event, ...)
--     event=event:upper();--  Events are always uppercase
--     local list={GetFramesRegisteredForEvent(event)};--  Get list of frames
--     for _,frame in ipairs(list) do
--         local func=frame:GetScript("OnEvent");--    Get OnEvent handler
--         if func then 
--             print(frame:GetName());
--         end--   Run it if there is one
--     end
-- end

-- /run KrowiAF_FireEvent("ACHIEVEMENT_EARNED");

-- function KrowiAF_GetAreaPOILeft()
--     for i = 1, 7216 do
--         local left = C_AreaPoiInfo.GetAreaPOISecondsLeft(i);
--         if left then
--             print(i, left);
--         end
--     end
--     print(i)
-- end

-- /run KrowiAF_GetAreaPOILeft();