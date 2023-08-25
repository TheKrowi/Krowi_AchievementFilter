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
        addon.GUI.RefreshView();
        -- addon.GUI.SummaryFrame:Achievements_Update("KROWIAF_FORCE_UPDATE");
    end
    for i = 1, #addon.Data.WatchListCategories do
        if (addon.Data.WatchListCategories[i].Achievements and #addon.Data.WatchListCategories[i].Achievements == 0) or (addon.Data.WatchListCategories[i].Children and #addon.Data.WatchListCategories[i].Children == 0) then
            KrowiAF_SavedData.WatchedAchievements = nil;
            addon.Data.WatchListCategories[i].Achievements = nil;
        end
    end
end

function addon.WatchAchievement(achievement, update)
    achievement:Watch();
    for i = 1, #addon.Data.WatchListCategories do
        if addon.Options.db.profile.AdjustableCategories.WatchList[i] then
            local watchListCategory = AddWatchListCategoriesTree(addon.Data.WatchListCategories[i], achievement);
            watchListCategory:AddWatchedAchievement(achievement);
        end
	end
    if update ~= false then
        addon.GUI.RefreshView();
        -- addon.GUI.SummaryFrame:Achievements_Update("KROWIAF_FORCE_UPDATE");
    end
end

function addon.AddToTrackingAchievementsCategories(achievement, update)
    for i = 1, #addon.Data.TrackingAchievementsCategories do
        if addon.Options.db.profile.AdjustableCategories.TrackingAchievements[i] then
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
        addon.GUI.RefreshView();
    end
    for i = 1, #addon.Data.ExcludedCategories do
        if (addon.Data.ExcludedCategories[i].Achievements and #addon.Data.ExcludedCategories[i].Achievements == 0) or (addon.Data.ExcludedCategories[i].Children and #addon.Data.ExcludedCategories[i].Children == 0) then
            KrowiAF_SavedData.ExcludedAchievements = nil;
            addon.Data.ExcludedCategories[i].Achievements = nil;
        end
    end
end

function addon.ExcludeAchievement(achievement, update)
    achievement:Exclude();
    if addon.Options.db.profile.Categories.Excluded.Show then
        for i = 1, #addon.Data.ExcludedCategories do
            if addon.Options.db.profile.AdjustableCategories.Excluded[i] then
                local excludedCategory = AddExcludedCategoriesTree(addon.Data.ExcludedCategories[i], achievement);
                excludedCategory:AddExcludedAchievement(achievement);
            end
        end
        if update ~= false then
            addon.GUI.RefreshView();
        end
    else
        addon.GUI.RefreshView();
    end
end

local function CheckDecFlags(flags, flag)
    return (flags / flag) % 2 >= 1;
end

local function HandleAchievementExistence(achievementInfo)
    local achievementId = achievementInfo.Id;
    if achievementInfo.Exists then
        addon.Data.AddAchievementIfNil(achievementId, achievementInfo.Points);
        return true;
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
    if not addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        return;
    end
    if not HandleAchievementExistence(achievementInfo) then
        return;
    end
    addon.TrackingAchievements[achievementId] = true;
    addon.Data.Achievements[achievementId].IsTracking = true;
end

local function HandleCompletedAchievement(characterGuid, achievementInfo)
    addon.Data.SavedData.AchievementData.SetEarnedBy(characterGuid, achievementInfo);
    if achievementInfo.WasEarnedByMe then
        addon.Data.SavedData.CharacterData.AddPoints(characterGuid, achievementInfo.Points);
    end
end

local criteriaCache;
local function AddToCriteriaCache(characterGuid, achievementInfo)
    local achievementId = achievementInfo.Id;
    local numCriteria = GetAchievementNumCriteria(achievementId);
    if numCriteria <= 0 then
        return;
    end
    addon.Data.SavedData.AchievementData.SetNotEarnedBy(characterGuid, achievementInfo);
    for j = 1, numCriteria do
        local _, criteriaType, criteriaIsCompleted, quantity, _, _, _, assetId, _, _, _, hasValueProgress = addon.GetAchievementCriteriaInfo(achievementId, j);
        if criteriaType == 8 then -- See https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo for all criteria types
            tinsert(criteriaCache, {AchievementId = assetId, RequiredForId = achievementId});
        end
        addon.Data.SavedData.AchievementData.SetCriteriaProgress(characterGuid, achievementInfo, j, hasValueProgress and quantity or criteriaIsCompleted);
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

    if not HandleAchievementExistence(achievementInfo) then
        return;
    end

    if achievementInfo.IsCompleted then
        HandleCompletedAchievement(characterGuid, achievementInfo);
    end

    if achievementInfo.WasEarnedByMe or achievementInfo.Flags.IsAccountWide or KrowiAF_SavedData.CharacterList[characterGuid].Ignore then
        return;
    end

    AddToCriteriaCache(characterGuid, achievementInfo);
end

local characterPoints;
function addon.BuildCache()
    if criteriaCache ~= nil then -- Build cache the first time
        return criteriaCache, characterPoints;
    end

    local characterGuid = UnitGUID("player");
    criteriaCache = {};
    local gapSize, i = 0, 1;
    local character = addon.Data.SavedData.CharacterData.Upsert(characterGuid);
    character.Points = 0;
    local highestId = addon.Data.AchievementIds[#addon.Data.AchievementIds];
    print(highestId, #addon.Data.AchievementIds)
    while gapSize < 500 or i < highestId do -- Biggest gap is 209 in 9.0.5 as of 2021-05-03
        local achievementInfo = addon.GetAchievementInfoTable(i);
        HandleAchievement(characterGuid, achievementInfo);
        if achievementInfo.Id and achievementInfo.Exists then
            gapSize = 0;
        else
            gapSize = gapSize + 1;
        end
        i = i + 1;
    end
    addon.Data.SortAchievementIds(); -- Achievements are added to the back so we need to make sure the list is sorted again
    characterPoints = KrowiAF_SavedData.CharacterList[characterGuid].Points;
    return criteriaCache, characterPoints;
end

function addon.ResetCache()
    criteriaCache = nil;
end

function addon.OnAchievementEarned(achievementId)
    if criteriaCache == nil then
        return; -- Achievement window is not opened yet
    end

    local characterGuid = UnitGUID("player");
    local achievementInfo = addon.GetAchievementInfoTable(achievementId);
    HandleAchievement(characterGuid, achievementInfo);
    addon.AchievementEarnedUpdateCategoriesFrameOnNextShow = true;
    addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = true;
    local achievement = addon.Data.Achievements[achievementId];
    if achievement then
        achievement.IsTracked = nil;
    end
end

function addon.OverwriteFunctions()
    AchievementFrame_ToggleAchievementFrame = function(toggleStatFrame, toggleGuildView)
        -- if addon.IsDragonflightRetail then
        --     ClearSelectedCategories();
        -- end

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
        if AchievementFrame:IsShown() and AchievementFrame.selectedTab == (addon.IsWrathClassic and 2 or 3) then
            AchievementFrame:Hide();
        else
            AchievementFrame:Show();
            AchievementFrame_SetTabs();
            AchievementFrameTab_OnClick(addon.IsWrathClassic and 2 or 3);
        end
    end

    AchievementFrame_DisplayComparison = function(unit)
        -- if addon.IsDragonflightRetail then
            -- ClearSelectedCategories();
        -- else
        if not addon.IsDragonflightRetail then
            AchievementFrame.wasShown = nil;
        end

        AchievementFrameTab_OnClick = AchievementFrameComparisonTab_OnClick;
        AchievementFrameTab_OnClick(1);
        if addon.IsDragonflightRetail then
            AchievementFrame_SetComparisonTabs();
        end
        AchievementFrame:Show();
        if addon.IsDragonflightRetail then
            AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparison.AchievementContainer);
        end
        AchievementFrameComparison_SetUnit(unit);
        AchievementFrameComparison_ForceUpdate();
    end

    AchievementFrame_SetTabs = addon.GUI.ShowHideTabs;

    local origAchievementFrame_SelectAchievement = AchievementFrame_SelectAchievement;
    AchievementFrame_SelectAchievement = function(id)
        if addon.Data.Achievements[id] then
            KrowiAF_SelectAchievementFromID(id);
            return;
        end
        origAchievementFrame_SelectAchievement(id);
    end

    -- Bunch of API changes in 10.1.5
    if not IsTrackedAchievement then
        IsTrackedAchievement = function(achievementId)
            return C_ContentTracking.IsTracking(Enum.ContentTrackingType.Achievement, achievementId);
        end
    end

    if not RemoveTrackedAchievement then
        RemoveTrackedAchievement = function(achievementId)
            C_ContentTracking.StopTracking(Enum.ContentTrackingType.Achievement, achievementId);
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
end

function addon.HookFunctions()
    hooksecurefunc(AchievementFrame, "Show", function()
        addon.Data.GetCurrentZoneAchievements();
    end);

    if addon.IsWrathClassic then
        hooksecurefunc("PanelTemplates_SetTab", AchievementFrame_SetTabs);
    end

    if addon.IsDragonflightRetail then
        hooksecurefunc("AchievementFrame_SetComparisonTabs", addon.GUI.ShowHideTabs);
    end
end

local function MakeStatic(frame, rememberLastPositionOption, target)
    if not frame or not frame.ClearAllPoints or not frame:IsMovable() then
        return;
    end

    if rememberLastPositionOption then
        addon.GUI.SetFrameToLastPosition(target or frame, rememberLastPositionOption);
    end

    frame:SetMovable(false);
    frame:EnableMouse(false);
    frame:SetScript("OnMouseDown", function(frame, button)
    end);
    frame:SetScript("OnMouseUp", function(frame, button)
    end);
end

function addon.MakeWindowStatic()
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        return;
    end
    MakeStatic(AchievementFrame, "AchievementWindow");
    MakeStatic(AchievementFrame.Header, "AchievementWindow", AchievementFrame);
    MakeStatic(addon.GUI.Calendar.Frame, "Calendar");
    MakeStatic(addon.GUI.DataManagerFrame, "DataManager");
end

local function MakeMovable(frame, rememberLastPositionOption, target)
    if not frame or not frame.ClearAllPoints or frame:IsMovable() then -- Do not make it movable multiple times if another addon already did it
        return;
    end

    if not target then
        addon.GUI.SetFrameToLastPosition(frame, rememberLastPositionOption);
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
        if addon.Options.db.profile.Window.RememberLastPosition[rememberLastPositionOption] then
            KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
            KrowiAF_SavedData.RememberLastPosition[rememberLastPositionOption] = {
                X = target:GetLeft(),
                Y = target:GetTop() - UIParent:GetTop()
            };
        end
    end);
end

function addon.MakeWindowMovable()
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        return;
    end
    MakeMovable(AchievementFrame, "AchievementWindow");
    MakeMovable(AchievementFrame.Header, "AchievementWindow", AchievementFrame);
    MakeMovable(addon.GUI.Calendar.Frame, "Calendar");
    MakeMovable(addon.GUI.DataManagerFrame, "DataManager");
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

function addon.GetAchievementInfo(achievementId) -- Returns an additional bool indicating if the achievement is added to the game yet or not
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementId);
    if not id then
        flags = addon.Objects.Flags:New(0);
        return achievementId, " * Placeholder for " .. achievementId .. " * ", 0, false, nil, nil, nil,
        " * This is the placeholder for " .. achievementId .. " until it's available next patch.", flags, 134400, "", false, false, "", false, false;
    end
    flags = addon.Objects.Flags:New(flags);
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

function addon.GetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden)
    local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible;
    if type(addon.Data.CustomCriteria[achievementId]) == "function" then
        criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible = addon.Data.CustomCriteria[achievementId](criteriaIndex);
    else
        criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden);
    end
    local hasValueProgress = (quantity ~= nil and reqQuantity ~= nil and not (quantity == 0 and (reqQuantity == 0 or reqQuantity == 1))) or achievementId == 17335;
    return criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, hasValueProgress;
end

function addon.GetAchievementNumCriteria(achievementId)
    if type(addon.Data.CustomCriteria[achievementId]) == "function" then
        return addon.Data.CustomCriteria[achievementId]();
    else
        return GetAchievementNumCriteria(achievementId);
    end
end

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
    if addon.Options.db.profile.MicroButtonTab > #KrowiAF_SavedData.Tabs then
        for i, _ in next, KrowiAF_SavedData.Tabs do
            if KrowiAF_SavedData.Tabs[i].AddonName == addonName and KrowiAF_SavedData.Tabs[i].Name == "Achievements" then
                addon.Options.db.profile.MicroButtonTab = i;
            end
        end
    end
    local tab = KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab];
    if tab.AddonName == "Blizzard_AchievementUI" then
        return;
    end
    AchievementMicroButton:SetScript("OnClick", function(self)
        addon.GUI.ToggleAchievementFrame(tab.AddonName, tab.Name);
    end);
end

addon.DelayObjects = {};
function addon.DelayFunction(delayObjectName, delayTime, func, ...)
    if addon.DelayObjects[delayObjectName] ~= nil then
        -- print("skipping")
        return;
    end
    -- print("start timer")
    local args = {...};
    addon.DelayObjects[delayObjectName] = C_Timer.NewTimer(delayTime, function()
        -- print("run func")
        func(unpack(args));
        addon.DelayObjects[delayObjectName] = nil;
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

--  Budgets 50% of target or current FPS to perform a workload. 
--  finished = start(workload, onFinish, onDelay)
--  Arguments:
--      workload        table       Stack (last in, first out) of functions to call.
--      onFinish        function?   Optional callback when the table is empty.
--      onDelay         function?   Optional callback each time work delays to the next frame.
--  Returns:
--      finished        boolean     True when finished without any delay; false otherwise.
function addon.StartWork(name, workload, onFinish, onDelay)
    name = name and " " .. name or "";
    if type(onFinish) == "string" then
        local onFinishPrint = onFinish;
        onFinish = function()
            addon.Diagnostics.Debug(onFinishPrint);
        end;
    end
    if type(onFinish) ~= "function" then
        onFinish = nil;
    end
    local overallStart = debugprofilestop();
    if type(onDelay) == "boolean" then
        onDelay = function()
            addon.Diagnostics.Debug(#workload .. name .. " remaining after " .. ("%.2d"):format(debugprofilestop() - overallStart) / 1000);
        end;
    end
    if type(onDelay) ~= "function" then
        onDelay = nil;
    end

    local maxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate());
    local function continue()
        local startTime = debugprofilestop();
        local task = tremove(workload);
        while task do
            if type(task) == "function" then
                task();
            elseif type(task) == "table" then
                task[1](unpack(task, 2, #task));
            end
            if (debugprofilestop() - startTime > maxDuration) then
                C_Timer.After(0, continue);
                if onDelay then
                    onDelay();
                end
                return false;
            end
            task = tremove(workload);
        end
        if onFinish then
            onFinish();
        end
        return true;
    end
    return continue();
end

function addon.StartWorkTable(workloadTables, onFinish, onDelay)
    local maxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate());
    local workload = tremove(workloadTables);
    local function continue()
        local startTime = debugprofilestop();
        local task = tremove(workload);
        while task do
            if type(task) == "function" then
                task();
            elseif type(task) == "table" then
                task[1](unpack(task, 2, #task));
            end
            if (debugprofilestop() - startTime > maxDuration) then
                C_Timer.After(0, continue);
                if onDelay then
                    local numOfWork = 0;
                    for _, wl in next, workloadTables do
                        numOfWork = numOfWork + #wl;
                    end
                    numOfWork = numOfWork + #workload;
                    onDelay(numOfWork);
                end
                return false;
            end
            task = tremove(workload);
            if not task then
                workload = tremove(workloadTables);
                if workload then
                    task = tremove(workload);
                end
            end
        end
        if onFinish then
            onFinish();
        end
        return true;
    end
    return continue();
end

-- function addon.WorkFinished(subject)
--     addon.Diagnostics.Debug(subject);
-- end

-- local workload = {}

-- local function sillyLoop()
--     addon.Objects.TransmogSet:New(0, 0);
-- end

-- SlashCmdList["DEBUG_SILLYLOOP"] = function(msg)
--     wipe(workload)
--     for i=1, tonumber(msg) or 1 do
--         workload[i] = sillyLoop
--     end
--     local overallStart = debugprofilestop()
--     addon.StartWork(
--         workload,
--         function() print("done!") end,
--         function() print(#workload.." remaining after "..("%.2d"):format(debugprofilestop()-overallStart)/1000) end
--     )
-- end
-- SLASH_DEBUG_SILLYLOOP1 = "/sillyloop"