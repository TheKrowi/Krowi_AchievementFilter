local _, addon = ...

addon.UncategorizedAchievements = {}
local function AddToUncategorizedCategories(achievementInfo)
    local achievementId = achievementInfo.Id
    addon.Data.Achievements[achievementId].Uncategorized = true
    addon.UncategorizedAchievements[achievementId] = true
end

local function HandleAchievementExistence(achievementInfo)
    local achievementId = achievementInfo.Id
    if achievementInfo.Exists then
        local wasAdded, achievement = addon.Data.AddAchievementIfNil(achievementId)
        return true, wasAdded, achievement
    elseif addon.Data.Achievements[achievementId] then
        addon.Data.Achievements[achievementId].DoesNotExist = true
        return
    else
        return -- Can this be reached?
    end
end

addon.TrackingAchievements = {}
local function HandleTrackingAchievement(achievementInfo)
    local achievementId = achievementInfo.Id
    if not HandleAchievementExistence(achievementInfo) then
        return
    end
    addon.Data.Achievements[achievementId].IsTracking = true
    if not addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        return
    end
    addon.TrackingAchievements[achievementId] = true
end

local function HandleCompletedAchievement(characterGuid, achievementInfo)
    addon.Data.SavedData.AchievementData.SetEarnedBy(characterGuid, achievementInfo)
    if achievementInfo.WasEarnedByMe then
        addon.Data.SavedData.CharacterData.AddPoints(characterGuid, achievementInfo.Points)
    end
end

local criteriaCache
local function AddToCriteriaCache(achievementInfo)
    local achievementId = achievementInfo.Id
    local numCriteria = GetAchievementNumCriteria(achievementId)
    if numCriteria <= 0 then
        return 0
    end
    for i = 1, numCriteria do
        local _, criteriaType, _, _, _, _, _, assetId, _, _, _, _ = GetAchievementCriteriaInfo(achievementId, i)
        if criteriaType == 8 then -- See https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo for all criteria types
            tinsert(criteriaCache, {AchievementId = assetId, RequiredForId = achievementId})
        end
    end
    return numCriteria
end

local function HandleNotCompletedAchievement(characterGuid, achievementInfo, numCriteria)
    addon.Data.SavedData.AchievementData.SetNotEarnedBy(characterGuid, achievementInfo)
    for i = 1, numCriteria do
        local _, _, criteriaIsCompleted, quantity, reqQuantity = GetAchievementCriteriaInfo(achievementInfo.Id, i)
        addon.Data.SavedData.AchievementData.SetCriteriaProgress(characterGuid, achievementInfo, i, reqQuantity > 1 and quantity or criteriaIsCompleted)
    end
end

local function HandleAchievement(characterGuid, achievementInfo)
    if not achievementInfo.Id or addon.Data.SavedData.AchievementData.IgnoreAchievement(achievementInfo) then
        return
    end

    if achievementInfo.Flags.IsTracking and achievementInfo.Id ~= 11558 and achievementInfo.Id ~= 11559 then
        HandleTrackingAchievement(achievementInfo)
        return
    end

    local exists, wasAdded, achievement = HandleAchievementExistence(achievementInfo)
    if not exists then
        return
    end

    if wasAdded and achievement then
        AddToUncategorizedCategories(achievement)
    end

    if achievementInfo.IsCompleted then
        HandleCompletedAchievement(characterGuid, achievementInfo)
    end

    local numCriteria = AddToCriteriaCache(achievementInfo)

    if achievementInfo.WasEarnedByMe or achievementInfo.Flags.IsAccountWide or KrowiAF_SavedData.CharacterList[characterGuid].Ignore then
        return
    end

    HandleNotCompletedAchievement(characterGuid, achievementInfo, numCriteria)
end

local buildCacheHelper = CreateFrame("Frame")
local co, coMaxDuration, coStart, coStarted, coFinished
local coOnFinish, coOnDelay = {}, {}
local maxGapSize = 20000 -- Biggest gap is 19320 in 11.0.5 as of 2024-11-10
-- local biggestGapSize = 0;
local function HandleAchievements(gapSize, i, highestId, characterGuid)
    while gapSize < maxGapSize or i < highestId do
        local achievementInfo = addon.GetAchievementInfoTable(i)
        HandleAchievement(characterGuid, achievementInfo)
        if achievementInfo.Id and achievementInfo.Exists then
            gapSize = 0
        else
            gapSize = gapSize + 1
        end
        -- if gapSize > biggestGapSize then
        --     biggestGapSize = gapSize;
        -- end
        i = i + 1
        if (debugprofilestop() - coStart > coMaxDuration) then
            if #coOnDelay >= 1 then
                for _, onDelay in next, coOnDelay do
                    onDelay(highestId + maxGapSize - i)
                end
            end
            coroutine.yield()
        end
    end
    -- print("Biggest gap size:", biggestGapSize);
    buildCacheHelper:SetScript("OnUpdate", nil)
    coFinished = true
    coStarted = nil
    addon.Diagnostics.Trace("Cache: Finished loading data")
    if #coOnFinish >= 1 then
        for _, onFinish in next, coOnFinish do
            onFinish(criteriaCache)
        end
    end
    coOnFinish, coOnDelay = {}, {}
end

function addon.BuildCacheAsync(onFinish, onDelay)
    if coFinished then
        if onFinish then
            onFinish(criteriaCache)
        end
        return
    end

    if coStarted then
        tinsert(coOnFinish, onFinish)
        tinsert(coOnDelay, onDelay)
        return
    end

    coStarted = true
    addon.Diagnostics.Trace("Cache: Start loading data")
    local characterGuid = UnitGUID("player")
    criteriaCache = {}
    local gapSize, i = 0, 1
    local character = addon.Data.SavedData.CharacterData.Upsert(characterGuid)
    character.Points = 0
    addon.Data.SortAchievementIds() -- Sort beforehand to make sure the highest id is at the end
    local highestId = addon.Data.AchievementIds[#addon.Data.AchievementIds]
    co = coroutine.create(HandleAchievements)
    coMaxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate())
    coStart = debugprofilestop()
    tinsert(coOnFinish, onFinish)
    tinsert(coOnDelay, onDelay)
    buildCacheHelper:SetScript("OnUpdate", function()
        if co ~= nil then
            coStart = debugprofilestop()
            coroutine.resume(co, gapSize, i, highestId, characterGuid)
        end
    end)
    coroutine.resume(co, gapSize, i, highestId, characterGuid)
    addon.Data.SortAchievementIds() -- Achievements are added to the back so we need to make sure the list is sorted again
end

function addon.ResetCache()
    coFinished = nil
end

function addon.OnAchievementEarned(achievementId)
    if criteriaCache == nil then
        return -- Achievement window is not opened yet
    end

    local characterGuid = UnitGUID("player")
    local achievementInfo = addon.GetAchievementInfoTable(achievementId)
    HandleAchievement(characterGuid, achievementInfo)
    addon.AchievementEarnedUpdateCategoriesFrameOnNextShow = true
    addon.AchievementEarnedUpdateSummaryFrameOnNextShow = true
    addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = true
    local achievement = addon.Data.Achievements[achievementId]
    if achievement then
        achievement.IsTracked = nil
    end
    addon.Data.SavedData.AchievementData.RegisterNewAchievementEarned(achievementId)
end