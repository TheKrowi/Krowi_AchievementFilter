local addonName, addon = ...;

local customPreviousAchievements = {};
customPreviousAchievements[15664] = 15663;
customPreviousAchievements[15665] = 15664;
customPreviousAchievements[15668] = 15667;
customPreviousAchievements[15669] = 15668;

function addon.GetPreviousAchievement(achievementId)
    if customPreviousAchievements[achievementId] then
        return customPreviousAchievements[achievementId];
    end
    return GetPreviousAchievement(achievementId);
end

function addon.GetFirstAchievementId(id)
    local firstId;
	while id do
		firstId = id;
		id = addon.GetPreviousAchievement(id);
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

function addon.GetAchievementNumbers(_filters, achievement, numOfAch, numOfCompAch, numOfNotObtAch, ignoreFilters) -- , numOfIncompAch
    if achievement.AlwaysVisible then
        return numOfAch, numOfCompAch, numOfNotObtAch; -- , numOfIncompAch
    end
    local filters = addon.Filters;
	if filters and filters.Validate(_filters, achievement, ignoreFilters, true) > 0 then -- If set to false we lag the game
		numOfAch = numOfAch + 1;
		local _, _, _, completed = addon.GetAchievementInfo(achievement.Id);
        local state = achievement:GetObtainableState();
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
            local newCategory = addon.Objects.Category:New(cat.Id + 9999, cat.Name);
            addon.Data.Categories[cat.Id + 9999] = newCategory;
            extraFunc(newCategory);
            category = category:AddCategory(newCategory);
        end
        alreadyAdded = nil;
    end
    return category;
end

local function AddWatchListCategoriesTree(watchListCategory, achievement)
    if not addon.Options.db.profile.Categories.WatchList.ShowSubCategories then
        return watchListCategory;
    end
    return AddCategoriesTree(watchListCategory, achievement, function(newCategory)
        newCategory.IsWatchList = true;
    end);
end

local function AddTrackingAchievementsCategoriesTree(trackingAchievementsCategory, achievement)
    if not addon.Options.db.profile.Categories.TrackingAchievements.ShowSubCategories or achievement.Category == nil then
        return trackingAchievementsCategory;
    end
    return AddCategoriesTree(trackingAchievementsCategory, achievement, function(newCategory)
        newCategory.IsTracking = true;
    end);
end

local function AddExcludedCategoriesTree(excludedCategory, achievement)
    if not addon.Options.db.profile.Categories.Excluded.ShowSubCategories then
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
                if categories[i].Parent.TabName == nil then -- Do not remove the special category
                    categories[i].Parent:RemoveCategory(categories[i]);
                end
            end
        end
    end
end

function addon.ClearWatchAchievement(achievement, update)
    achievement:ClearWatch();
    local numWatchListCategories = achievement.WatchListCategories and #achievement.WatchListCategories or 0;
    for i = 1, numWatchListCategories do
        achievement.WatchListCategories[i]:RemoveWatchedAchievement(achievement);
    end
    if addon.Options.db.profile.Categories.WatchList.ShowSubCategories then
        for i = 1, numWatchListCategories do
            ClearTree(achievement.WatchListCategories[i]:GetTree());
        end
    end
    achievement.WatchListCategories = nil;
    if update ~= false then
        addon.Gui:RefreshView();
    end
    for i = 1, #addon.SpecialCategories.WatchList do
        if (addon.SpecialCategories.WatchList[i].Achievements and #addon.SpecialCategories.WatchList[i].Achievements == 0) or (addon.SpecialCategories.WatchList[i].Children and #addon.SpecialCategories.WatchList[i].Children == 0) then
            addon.Data.SavedData.AchievementData:ClearWatchedAchievements();
            addon.SpecialCategories.WatchList[i].Achievements = nil;
        end
    end
end

function addon.WatchAchievement(achievement, update)
    achievement:Watch();
    for i = 1, #addon.SpecialCategories.WatchList do
        if addon.Options.db.profile.AdjustableCategories.WatchList[i] then
            local watchListCategory = AddWatchListCategoriesTree(addon.SpecialCategories.WatchList[i], achievement);
            watchListCategory:AddWatchedAchievement(achievement);
        end
	end
    if update ~= false then
        local scrollPercentage = KrowiAF_AchievementsFrame.ScrollBox:GetScrollPercentage();
        addon.Gui:RefreshView();
        KrowiAF_AchievementsFrame.ScrollBox:SetScrollPercentage(scrollPercentage);
    end
end

function addon.AddToTrackingAchievementsCategories(achievement, update)
    for i = 1, #addon.SpecialCategories.TrackingAchievements do
        if addon.Options.db.profile.AdjustableCategories.TrackingAchievements[i] then
            local trackingAchievementsCategory = AddTrackingAchievementsCategoriesTree(addon.SpecialCategories.TrackingAchievements[i], achievement);
            trackingAchievementsCategory:AddAchievement(achievement);
        end
    end
    if update ~= false then
        KrowiAF_CategoriesFrame:Update(true);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end
end

function addon.AddToUncategorizedAchievementsCategories(achievement, update)
    for i = 1, #addon.SpecialCategories.Uncategorized do
        if addon.Options.db.profile.AdjustableCategories.Uncategorized[i] then
            addon.SpecialCategories.Uncategorized[i]:AddAchievement(achievement);
        end
    end
    if update ~= false then
        KrowiAF_CategoriesFrame:Update(true);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end
end

function addon.IncludeAchievement(achievement, update)
    achievement:Include();
    local numExcludedCategories = achievement.ExcludedCategories and #achievement.ExcludedCategories or 0;
    for i = 1, numExcludedCategories do
        achievement.ExcludedCategories[i]:RemoveExcludedAchievement(achievement);
    end
    if addon.Options.db.profile.Categories.Excluded.ShowSubCategories then
        for i = 1, numExcludedCategories do
            ClearTree(achievement.ExcludedCategories[i]:GetTree());
        end
    end
    achievement.ExcludedCategories = nil;
    if update ~= false then
        addon.Gui:RefreshView();
    end
    for i = 1, #addon.SpecialCategories.Excluded do
        if (addon.SpecialCategories.Excluded[i].Achievements and #addon.SpecialCategories.Excluded[i].Achievements == 0) or (addon.SpecialCategories.Excluded[i].Children and #addon.SpecialCategories.Excluded[i].Children == 0) then
            addon.SpecialCategories.Excluded[i].Achievements = nil;
        end
    end
    if KrowiAF_SavedData.ExcludedAchievements then
        for _, _ in next, KrowiAF_SavedData.ExcludedAchievements do
            return;
        end
        KrowiAF_SavedData.ExcludedAchievements = nil;
    end
end

function addon.ExcludeAchievement(achievement, update)
    achievement:Exclude();
    if addon.Options.db.profile.Categories.Excluded.Show then
        for i = 1, #addon.SpecialCategories.Excluded do
            if addon.Options.db.profile.AdjustableCategories.Excluded[i] then
                local excludedCategory = AddExcludedCategoriesTree(addon.SpecialCategories.Excluded[i], achievement);
                excludedCategory:AddExcludedAchievement(achievement);
            end
        end
        if update ~= false then
            addon.Gui:RefreshView();
        end
    else
        addon.Gui:RefreshView();
    end
end

local function CheckDecFlags(flags, flag)
    return (flags / flag) % 2 >= 1;
end

addon.UncategorizedAchievements = {};
local function AddToUncategorizedCategories(achievementInfo)
    local achievementId = achievementInfo.Id;
    addon.Data.Achievements[achievementId].Uncategorized = true;
    addon.UncategorizedAchievements[achievementId] = true;
end

local function HandleAchievementExistence(achievementInfo)
    local achievementId = achievementInfo.Id;
    if achievementInfo.Exists then
        local wasAdded, achievement = addon.Data.AddAchievementIfNil(achievementId);
        return true, wasAdded, achievement;
    elseif addon.Data.Achievements[achievementId] then
        addon.Data.Achievements[achievementId].DoesNotExist = true;
        return;
    else
        return; -- Can this be reached?
    end
end

addon.TrackingAchievements = {};
local function HandleTrackingAchievement(achievementInfo)
    local achievementId = achievementInfo.Id;
    if not HandleAchievementExistence(achievementInfo) then
        return;
    end
    addon.Data.Achievements[achievementId].IsTracking = true;
    if not addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        return;
    end
    addon.TrackingAchievements[achievementId] = true;
end

local function HandleCompletedAchievement(characterGuid, achievementInfo)
    addon.Data.SavedData.AchievementData.SetEarnedBy(characterGuid, achievementInfo);
    if achievementInfo.WasEarnedByMe then
        addon.Data.SavedData.CharacterData.AddPoints(characterGuid, achievementInfo.Points);
    end
end

local criteriaCache;
local function AddToCriteriaCache(achievementInfo)
    local achievementId = achievementInfo.Id;
    local numCriteria = GetAchievementNumCriteria(achievementId);
    if numCriteria <= 0 then
        return 0;
    end
    for i = 1, numCriteria do
        local _, criteriaType, _, _, _, _, _, assetId, _, _, _, _ = addon.GetAchievementCriteriaInfo(achievementId, i);
        if criteriaType == 8 then -- See https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo for all criteria types
            tinsert(criteriaCache, {AchievementId = assetId, RequiredForId = achievementId});
        end
    end
    return numCriteria;
end

local function HandleNotCompletedAchievement(characterGuid, achievementInfo, numCriteria)
    addon.Data.SavedData.AchievementData.SetNotEarnedBy(characterGuid, achievementInfo);
    for i = 1, numCriteria do
        local _, _, criteriaIsCompleted, quantity, _, _, _, _, _, _, _, hasValueProgress = addon.GetAchievementCriteriaInfo(achievementInfo.Id, i);
        addon.Data.SavedData.AchievementData.SetCriteriaProgress(characterGuid, achievementInfo, i, hasValueProgress and quantity or criteriaIsCompleted);
    end
end

local function HandleAchievement(characterGuid, achievementInfo)
    if not achievementInfo.Id or addon.Data.SavedData.AchievementData.IgnoreAchievement(achievementInfo) then
        return;
    end

    if achievementInfo.Flags.IsTracking then
        HandleTrackingAchievement(achievementInfo);
        return;
    end

    local exists, wasAdded, achievement = HandleAchievementExistence(achievementInfo);
    if not exists then
        return;
    end
    if wasAdded and achievement then
        AddToUncategorizedCategories(achievement);
    end

    if achievementInfo.IsCompleted then
        HandleCompletedAchievement(characterGuid, achievementInfo);
    end

    local numCriteria = AddToCriteriaCache(achievementInfo);

    if achievementInfo.WasEarnedByMe or achievementInfo.Flags.IsAccountWide or KrowiAF_SavedData.CharacterList[characterGuid].Ignore then
        return;
    end

    HandleNotCompletedAchievement(characterGuid, achievementInfo, numCriteria);
end

local buildCacheHelper = CreateFrame("Frame");
local co, coMaxDuration, coStart, coStarted, coFinished;
local coOnFinish, coOnDelay = {}, {};
local maxGapSize = 20000; -- Biggest gap is 19320 in 11.0.5 as of 2024-11-10
-- local biggestGapSize = 0;
local function HandleAchievements(gapSize, i, highestId, characterGuid)
    while gapSize < maxGapSize or i < highestId do
        local achievementInfo = addon.GetAchievementInfoTable(i);
        HandleAchievement(characterGuid, achievementInfo);
        if achievementInfo.Id and achievementInfo.Exists then
            gapSize = 0;
        else
            gapSize = gapSize + 1;
        end
        -- if gapSize > biggestGapSize then
        --     biggestGapSize = gapSize;
        -- end
        i = i + 1;
        if (debugprofilestop() - coStart > coMaxDuration) then
            if #coOnDelay >= 1 then
                for _, onDelay in next, coOnDelay do
                    onDelay(highestId + maxGapSize - i);
                end
            end
            coroutine.yield();
        end
    end
    -- print("Biggest gap size:", biggestGapSize);
    buildCacheHelper:SetScript("OnUpdate", nil);
    coFinished = true;
    coStarted = nil;
    addon.Diagnostics.Trace("Cache: Finished loading data");
    if #coOnFinish >= 1 then
        for _, onFinish in next, coOnFinish do
            onFinish(criteriaCache);
        end
    end
    coOnFinish, coOnDelay = {}, {};
end

function addon.BuildCacheAsync(onFinish, onDelay)
    if coFinished then
        if onFinish then
            onFinish(criteriaCache);
        end
        return;
    end

    if coStarted then
        tinsert(coOnFinish, onFinish);
        tinsert(coOnDelay, onDelay);
        return;
    end

    coStarted = true;
    addon.Diagnostics.Trace("Cache: Start loading data");
    local characterGuid = UnitGUID("player");
    criteriaCache = {};
    local gapSize, i = 0, 1;
    local character = addon.Data.SavedData.CharacterData.Upsert(characterGuid);
    character.Points = 0;
    addon.Data.SortAchievementIds(); -- Sort beforehand to make sure the highest id is at the end
    local highestId = addon.Data.AchievementIds[#addon.Data.AchievementIds];
    co = coroutine.create(HandleAchievements);
    coMaxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate());
    coStart = debugprofilestop();
    tinsert(coOnFinish, onFinish);
    tinsert(coOnDelay, onDelay);
    buildCacheHelper:SetScript("OnUpdate", function()
        if co ~= nil then
            coStart = debugprofilestop();
            coroutine.resume(co, gapSize, i, highestId, characterGuid);
        end
    end);
    coroutine.resume(co, gapSize, i, highestId, characterGuid);
    addon.Data.SortAchievementIds(); -- Achievements are added to the back so we need to make sure the list is sorted again
end

function addon.ResetCache()
    coFinished = nil;
end

function addon.OnAchievementEarned(achievementId)
    if criteriaCache == nil then
        return; -- Achievement window is not opened yet
    end

    local characterGuid = UnitGUID("player");
    local achievementInfo = addon.GetAchievementInfoTable(achievementId);
    HandleAchievement(characterGuid, achievementInfo);
    addon.AchievementEarnedUpdateCategoriesFrameOnNextShow = true;
    addon.AchievementEarnedUpdateSummaryFrameOnNextShow = true;
    addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = true;
    local achievement = addon.Data.Achievements[achievementId];
    if achievement then
        achievement.IsTracked = nil;
    end
    addon.Data.SavedData.AchievementData.RegisterNewAchievementEarned(achievementId);
end

function addon.OverwriteFunctions()
    AchievementFrame_ToggleAchievementFrame = function(toggleStatFrame, toggleGuildView)
        AchievementFrameComparison:Hide();
        AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;

        if not toggleStatFrame then
            if AchievementFrame:IsShown() and AchievementFrame.selectedTab == 1 then
                AchievementFrame:Hide();
            else
                AchievementFrame_SetTabs();
                AchievementFrame:Show();
                if toggleGuildView then
                    AchievementFrameTab_OnClick(2);
                else
                    AchievementFrameTab_OnClick(1);
                end
            end
            return;
        end
        if AchievementFrame:IsShown() and AchievementFrame.selectedTab == (addon.Util.IsWrathClassic and 2 or 3) then
            AchievementFrame:Hide();
        else
            AchievementFrame:Show();
            AchievementFrame_SetTabs();
            AchievementFrameTab_OnClick(addon.Util.IsWrathClassic and 2 or 3);
        end
    end

    AchievementFrame_DisplayComparison = function(unit)
        if not addon.Util.IsMainline then
            AchievementFrame.wasShown = nil;
        end

        AchievementFrameTab_OnClick = AchievementFrameComparisonTab_OnClick;
        AchievementFrameTab_OnClick(1);
        if addon.Util.IsMainline then
            AchievementFrame_SetComparisonTabs();
        end
        AchievementFrame:Show();
        if addon.Util.IsMainline then
            AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparison.AchievementContainer);
        end
        AchievementFrameComparison_SetUnit(unit);
        AchievementFrameComparison_ForceUpdate();
    end

    AchievementFrame_SetTabs = function()
        addon.Gui:ShowHideTabs();
    end;

    local origAchievementFrame_SelectAchievement = AchievementFrame_SelectAchievement;
    AchievementFrame_SelectAchievement = function(id)
        if addon.Data.Achievements[id] and addon.Data.Achievements[id].Category then
            KrowiAF_SelectAchievementFromID(id);
            return;
        end
        origAchievementFrame_SelectAchievement(id);
    end
end

function addon.LoadBlizzardApiChanges()
    -- Bunch of API changes in 10.1.5
    if not IsTrackedAchievement then
        IsTrackedAchievement = function(achievementId)
            return C_ContentTracking.IsTracking(Enum.ContentTrackingType.Achievement, achievementId);
        end
    end

    if not RemoveTrackedAchievement then
        RemoveTrackedAchievement = function(achievementId)
            C_ContentTracking.StopTracking(Enum.ContentTrackingType.Achievement, achievementId, Enum.ContentTrackingStopType.Manual);
        end
    end

    if not GetNumTrackedAchievements then
        GetNumTrackedAchievements = function()
            return #C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement);
        end
    end

    if not MAX_TRACKED_ACHIEVEMENTS then
        MAX_TRACKED_ACHIEVEMENTS = Constants.ContentTrackingConsts.MaxTrackedAchievements;
    end

    if not AddTrackedAchievement then
        AddTrackedAchievement = function(achievementId)
            return C_ContentTracking.StartTracking(Enum.ContentTrackingType.Achievement, achievementId);
        end
    end

    if not WatchFrame_Update then
        WatchFrame_Update = function()
        end
    end

    if not SetFocusedAchievement then
        SetFocusedAchievement = function()
        end
    end
end

function addon.HookFunctions()
    if addon.Util.IsClassicWithAchievements then
        hooksecurefunc("PanelTemplates_SetTab", AchievementFrame_SetTabs);
    end

    if addon.Util.IsMainline then
        hooksecurefunc("AchievementFrame_SetComparisonTabs", function()
            addon.Gui:ShowHideTabs();
        end);
    end

    AchievementFrameFilterDropdown:HookScript("OnShow", function()
        if addon.Util.IsClassicWithAchievements then
            AchievementFrame.Header.RightDDLInset:Show();
        else
            AchievementFrame.Header.LeftDDLInset:Show();
        end
    end);
    AchievementFrameFilterDropdown:HookScript("OnHide", function()
        if addon.Util.IsClassicWithAchievements then
            if not KrowiAF_SearchBoxFrame:IsShown() then
                AchievementFrame.Header.RightDDLInset:Hide();
            end
        else
            if not KrowiAF_AchievementFrameFilterButton:IsShown() then
                AchievementFrame.Header.LeftDDLInset:Hide();
            end
        end
    end);
end

local function MakeStatic(frame, rememberLastPositionOption, target)
    if not frame or not frame.ClearAllPoints or not frame:IsMovable() then
        return;
    end

    if rememberLastPositionOption then
        addon.Gui:SetFrameToLastPosition(target or frame, rememberLastPositionOption);
    end

    frame:SetMovable(false);
    frame:EnableMouse(false);
    frame:SetScript("OnMouseDown", function() end);
    frame:SetScript("OnMouseUp", function() end);
end

function addon.MakeWindowStatic()
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        return;
    end
    MakeStatic(AchievementFrame, "AchievementWindow");
    MakeStatic(AchievementFrame.Header, "AchievementWindow", AchievementFrame);
    MakeStatic(KrowiAF_AchievementCalendarFrame, "Calendar");
    MakeStatic(KrowiAF_DataManagerFrame, "DataManager");
end

function addon.MakeMovable(frame, rememberLastPositionOption, target, point)
    if not frame or not frame.ClearAllPoints or frame:IsMovable() then -- Do not make it movable multiple times if another addon already did it
        return;
    end

    if not target then
        addon.Gui:SetFrameToLastPosition(frame, rememberLastPositionOption);
    end

    target = target or frame;

    frame:SetMovable(true);
    frame:EnableMouse(true);
    frame:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            target:StartMoving();
        end
    end);
    frame:SetScript("OnMouseUp", function()
        target:StopMovingOrSizing();
        if addon.Options.db.profile.Window.RememberLastPosition[rememberLastPositionOption] then
            KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
            KrowiAF_SavedData.RememberLastPosition[rememberLastPositionOption] = {
                X = target:GetLeft(),
                Y = target:GetTop() - UIParent:GetTop(),
                Point = point
            };
        end
    end);
end

function addon.MakeWindowMovable()
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        return;
    end
    addon.MakeMovable(AchievementFrame, "AchievementWindow");
    addon.MakeMovable(AchievementFrame.Header, "AchievementWindow", AchievementFrame);
    addon.MakeMovable(KrowiAF_AchievementCalendarFrame, "Calendar");
    addon.MakeMovable(KrowiAF_DataManagerFrame, "DataManager");
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

function addon.GetAchievmentName(achievementId)
    local _, name = GetAchievementInfo(achievementId);
    return name;
end

function addon.GetAchievementInfo(achievementId) -- Returns an additional bool indicating if the achievement is added to the game yet or not
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementId);
    if not id then
        flags = addon.Objects.Flags:New(0);
        return achievementId, " * Placeholder for " .. achievementId .. " * ", 0, false, nil, nil, nil,
        " * This is the placeholder for " .. achievementId .. " until it's available next patch.", flags, 134400, "", false, false, "", false, false;
    end
    flags = addon.Objects.Flags:New(flags);
    if id == 18849 or id == 18850 then
        flags.IsTracking = true;
    end
    -- if addon.Options.db.profile.Achievements.ShowOtherFactionWarbandAsCompleted then
	-- 	if flags.IsAccountWide and KrowiAF_Achievements.Completed[achievementId] and KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn then
	-- 		local date = date("*t", KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn);
	-- 		completed = true;
	-- 		month = date.month;
	-- 		day = date.day;
	-- 		year = date.year - 2000;
	-- 		wasEarnedByMe = true;
	-- 	end
	-- end
    return id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic, true;
end

function addon.GetAchievementInfoTable(achievementId) -- Returns an additional bool indicating if the achievement is added to the game yet or not
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic, exists = addon.GetAchievementInfo(achievementId);
    return {
        Id = id,
        Name = name,
        Points = points,
        IsCompleted = completed,
        DateTime = {
            Year = year,
            Month = month,
            Day = day
        },
        Description = description,
        Flags = flags,
        Icon = icon,
        HasReward = rewardText ~= "",
        RewardText = rewardText,
        IsGuild = isGuild,
        WasEarnedByMe = wasEarnedByMe,
        EarnedBy = earnedBy,
        IsStatistic = isStatistic,
        Exists = exists
    };
end

function addon.GetNextAchievement(achievement)
    if achievement.NextAchievements then
        for _, nextAchievement in next, achievement.NextAchievements do
            local _, _, _, completed, _, _, _, _, _, _, _, _, _, earnedBy, _ = addon.GetAchievementInfo(nextAchievement.Id);
            if earnedBy ~= nil then -- Will be nil if the achievement is for the other faction
                return nextAchievement, completed;
            end
        end
    end
    return nil, false;
end

local function GetAchievementCriteriaInfoInternal(achievementId, criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, duration, elapsed)
    local hasValueProgress = (quantity ~= nil and reqQuantity ~= nil and not (quantity == 0 and (reqQuantity == 0 or reqQuantity == 1))) or achievementId == 17335;
    return criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, hasValueProgress, duration, elapsed;
end

function addon.GetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden)
    if type(addon.Data.CustomCriteria[achievementId]) == "function" then
        return GetAchievementCriteriaInfoInternal(achievementId, addon.Data.CustomCriteria[achievementId](criteriaIndex));
    end
    return GetAchievementCriteriaInfoInternal(achievementId, GetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden));
end

function addon.GetAchievementCriteriaInfoById(achievementId, criteriaId)
    return GetAchievementCriteriaInfoInternal(achievementId, GetAchievementCriteriaInfoByID(achievementId, criteriaId));
end

function addon.GetAchievementNumCriteria(achievementId)
    if type(addon.Data.CustomCriteria[achievementId]) == "function" then
        return addon.Data.CustomCriteria[achievementId]();
    else
        return GetAchievementNumCriteria(achievementId);
    end
end

local function ClassCanUseSet(setInfo, classId)
    return CheckDecFlags(setInfo.classMask, math.pow(2, classId - 1));
end

local function FactionCanUseSet(setInfo, faction)
    return setInfo and (setInfo.requiredFaction == nil or setInfo.requiredFaction == faction);
end

function addon.GetUsableSets(transmogSetIds)
    local usableTransmogSetIds = {};
    local _, _, classId = UnitClass("player");
    local faction = UnitFactionGroup("player");
    for _, transmogSetId in next, transmogSetIds do
        local setInfo = C_TransmogSets.GetSetInfo(transmogSetId);
        if setInfo then
            if ClassCanUseSet(setInfo, classId) and FactionCanUseSet(setInfo, faction) then
                tinsert(usableTransmogSetIds, transmogSetId);
            end
        else
            addon.Diagnostics.Debug("No transmog info found for " .. transmogSetId);
        end
    end
    return usableTransmogSetIds;
end

function addon.ChangeAchievementMicroButtonOnClick()
    addon.Gui:TabsOrderGetActiveKeys(); -- Cleanup unused tabs
    if addon.Options.db.profile.MicroButtonTab > #KrowiAF_SavedData.Tabs then
        for i, _ in next, KrowiAF_SavedData.Tabs do
            if KrowiAF_SavedData.Tabs[i].AddonName == addonName and KrowiAF_SavedData.Tabs[i].Name == "Achievements" then
                addon.Options.db.profile.MicroButtonTab = i;
            end
        end
    end
    local tab = KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab];
    AchievementMicroButton:SetScript("OnClick", function(self)
        KrowiAF_ToggleAchievementFrame(tab.AddonName, tab.Name);
    end);
end

addon.Modifiers = {
    addon.L["None"],
    addon.L["Alt"],
    addon.L["Ctrl"],
    addon.L["Shift"],
    addon.L["Right Alt"],
    addon.L["Right Ctrl"],
    addon.L["Right Shift"],
    addon.L["Left Alt"],
    addon.L["Left Ctrl"],
    addon.L["Left Shift"]
};

function addon.IsCustomModifierKeyDown(modifier)
    if modifier == 1 then
        return;
    elseif modifier == 2 then
        return IsAltKeyDown();
    elseif modifier == 3 then
        return IsControlKeyDown();
    elseif modifier == 4 then
        return IsShiftKeyDown();
    elseif modifier == 5 then
        return IsRightAltKeyDown();
    elseif modifier == 6 then
        return IsRightControlKeyDown();
    elseif modifier == 7 then
        return IsRightShiftKeyDown();
    elseif modifier == 8 then
        return IsLeftAltKeyDown();
    elseif modifier == 9 then
        return IsLeftControlKeyDown();
    elseif modifier == 10 then
        return IsLeftShiftKeyDown();
    end
end

local function RunTask(task)
    if type(task) == "function" then
        task();
    elseif type(task) == "table" then
        task[1](unpack(task, 2, #task));
    end
end

--  Budgets 50% of target or current FPS to perform a workload. 
--  finished = start(workload, onFinish, onDelay)
--  Arguments:
--      workload        table       Stack (last in, first out) of functions to call.
--      onFinish        function?   Optional callback when the table is empty.
--      onDelay         function?   Optional callback each time work delays to the next frame.
--  Returns:
--      finished        boolean     True when finished without any delay; false otherwise.
-- function addon.StartWork(name, workload, onFinish, onDelay)
--     name = name and " " .. name or "";
--     if type(onFinish) == "string" then
--         local onFinishPrint = onFinish;
--         onFinish = function()
--             addon.Diagnostics.Debug(onFinishPrint);
--         end;
--     end
--     if type(onFinish) ~= "function" then
--         onFinish = nil;
--     end
--     local overallStart = debugprofilestop();
--     if type(onDelay) == "boolean" then
--         onDelay = function()
--             addon.Diagnostics.Debug(#workload .. name .. " remaining after " .. ("%.2d"):format(debugprofilestop() - overallStart) / 1000);
--         end;
--     end
--     if type(onDelay) ~= "function" then
--         onDelay = nil;
--     end

--     local maxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate());
--     local function continue()
--         local startTime = debugprofilestop();
--         local task = tremove(workload, 1);
--         while task do
--             RunTask(task);
--             if (debugprofilestop() - startTime > maxDuration) then
--                 C_Timer.After(0, continue);
--                 if onDelay then
--                     onDelay();
--                 end
--                 return false;
--             end
--             task = tremove(workload, 1);
--         end
--         if onFinish then
--             onFinish();
--         end
--         return true;
--     end
--     return continue();
-- end

local taskIndex = 1;
local function GetNumOfTasksLeft(workloadTables, tasks)
    local numOfTasksLeft = tasks and #tasks or 0;
    for _, wl in next, workloadTables do
        numOfTasksLeft = numOfTasksLeft + #wl;
    end
    return numOfTasksLeft - taskIndex + 1;
end

local function Delay(continue, startTime, maxDuration, onDelay, workloadTables, tasks)
    if (debugprofilestop() - startTime <= maxDuration) then
        return false;
    end
    C_Timer.After(0, continue);
    if onDelay then
        onDelay(GetNumOfTasksLeft(workloadTables, tasks));
    end
    return true;
end

local function GetNextTask(tasks, workloadTables)
    taskIndex = taskIndex + 1;
    local task = tasks[taskIndex];
    if task then
        return tasks, task;
    end
    tasks = tremove(workloadTables);
    if tasks then
        taskIndex = 1
        task = tasks[taskIndex];
    end
    return tasks, task;
end

function addon.StartTasksGroups(tasksGroups, onFinish, onDelay)
    local maxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate());
    local tasks = tremove(tasksGroups);
    local function continue()
        local startTime = debugprofilestop();
        local task = tasks[taskIndex];
        while task do
            RunTask(task);
            tasks, task = GetNextTask(tasks, tasksGroups); -- Get the new task first so in case the task takes longer than a frame duration, the current tasks keeps looping
            if Delay(continue, startTime, maxDuration, onDelay, tasksGroups, tasks) then -- Really need to solve this in a different way!!!
                return false;
            end
        end
        if onFinish then
            onFinish();
        end
        return true;
    end
    return continue();
end

addon.MonthNames = {
    addon.L["January"],
    addon.L["February"],
    addon.L["March"],
    addon.L["April"],
    addon.L["May"],
    addon.L["June"],
    addon.L["July"],
    addon.L["August"],
    addon.L["September"],
    addon.L["October"],
    addon.L["November"],
    addon.L["December"]
};

addon.WeekdayNames = {
	addon.L["Sunday"],
    addon.L["Monday"],
    addon.L["Tuesday"],
    addon.L["Wednesday"],
    addon.L["Thursday"],
    addon.L["Friday"],
    addon.L["Saturday"]
};