local _, addon = ...;
local savedData = addon.Data.SavedData;
savedData.AchievementData = {};
local achievementData = savedData.AchievementData;

local ignoreAchievementIds = {};
ignoreAchievementIds[7268] = true;
ignoreAchievementIds[7269] = true;
ignoreAchievementIds[7270] = true;
ignoreAchievementIds[40910] = true;

function achievementData.Load()
    KrowiAF_Achievements = KrowiAF_Achievements or {};
    KrowiAF_Achievements.Completed = KrowiAF_Achievements.Completed or {};
    KrowiAF_Achievements.NotCompleted = KrowiAF_Achievements.NotCompleted or {};
    KrowiAF_Achievements.LastCompleted = KrowiAF_Achievements.LastCompleted or {};
    KrowiAF_Achievements.Watched = KrowiAF_Achievements.Watched or {};
end

local function DateTimeToEpoch(year, month, day)
    return time{
        year = 2000 + year,
        month = month,
        day = day,
        hour = 12,
        min = 0,
        sec = 0
    };
end

local function SetFirstCompletedOn(achievementId, epoch)
    if not KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn then
        KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn = epoch;
        return;
    end
    KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn = min(KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn, epoch);
end

local function SetEarnedByCharacter(characterGuid, achievementId, epoch)
    KrowiAF_Achievements.Completed[achievementId].EarnedBy[characterGuid] = KrowiAF_Achievements.Completed[achievementId].EarnedBy[characterGuid] or epoch;

    -- Also remove NotCompleted if it would exist
    if not KrowiAF_Achievements.NotCompleted[achievementId] or not KrowiAF_Achievements.NotCompleted[achievementId][characterGuid] then
        return;
    end
    KrowiAF_Achievements.NotCompleted[achievementId][characterGuid] = nil;
end

function achievementData.SetEarnedBy(characterGuid, achievementInfo)
    local achievementId = achievementInfo.Id;
    KrowiAF_Achievements.Completed[achievementId] = KrowiAF_Achievements.Completed[achievementId] or {};
    local dateTime = achievementInfo.DateTime;
    local epoch = DateTimeToEpoch(dateTime.Year, dateTime.Month, dateTime.Day);
    SetFirstCompletedOn(achievementId, epoch);
    if achievementInfo.Flags.IsAccountWide then
        return;
    end
    KrowiAF_Achievements.Completed[achievementId].EarnedBy = KrowiAF_Achievements.Completed[achievementId].EarnedBy or {};
    if not achievementInfo.WasEarnedByMe then
        return;
    end
    SetEarnedByCharacter(characterGuid, achievementId, epoch);
end

function achievementData.SetNotEarnedBy(characterGuid, achievementInfo)
    if achievementInfo.WasEarnedByMe or achievementInfo.Flags.IsAccountWide or KrowiAF_SavedData.CharacterList[characterGuid].Ignore then
        return;
    end
    local achievementId = achievementInfo.Id;
    KrowiAF_Achievements.NotCompleted[achievementId] = KrowiAF_Achievements.NotCompleted[achievementId] or {};
    KrowiAF_Achievements.NotCompleted[achievementId][characterGuid] = {};
end

function achievementData.SetCriteriaProgress(characterGuid, achievementInfo, criteriaIndex, progressValue)
    if achievementInfo.WasEarnedByMe or achievementInfo.Flags.IsAccountWide or KrowiAF_SavedData.CharacterList[characterGuid].Ignore then
        return;
    end
    KrowiAF_Achievements.NotCompleted[achievementInfo.Id][characterGuid][criteriaIndex] = progressValue;
end

function achievementData.IgnoreAchievement(achievementInfo)
    return achievementInfo.Points < 0 or achievementInfo.IsStatistic or achievementInfo.IsGuild or ignoreAchievementIds[achievementInfo.Id];
end

function achievementData.IsEarnedByCharacter(characterGuid, achievement)
    local achievement = KrowiAF_Achievements.Completed[achievement.Id];
    if not achievement then
        return false;
    end

    if achievement.IsAccountWide then
        return achievement.FirstCompletedOn;
    end

    return achievement.EarnedBy and achievement.EarnedBy[characterGuid] or false;
end

function achievementData.GetEarnedByCharacter(characterGuid)
    local earnedBy = {};
    for achievementId, achievement in next, KrowiAF_Achievements.Completed do
        tinsert(earnedBy, {
            Id = achievementId,
            Date = (achievement.EarnedBy and achievement.EarnedBy[characterGuid]) or achievement.FirstCompletedOn
        });
    end
    return earnedBy;
end

function achievementData.GetEarnedByCharacterWithinDateRange(characterGuid, firstDate, lastDate)
    local earnedBy = {};
    local dateTime;
    for achievementId, achievement in next, KrowiAF_Achievements.Completed do
        dateTime = (achievement.EarnedBy and achievement.EarnedBy[characterGuid]) or achievement.FirstCompletedOn;
        if dateTime >= firstDate and dateTime <= lastDate then
            tinsert(earnedBy, {
                Id = achievementId,
                Date = dateTime
            });
        end
    end
    return earnedBy;
end

function achievementData.ClearCompletedForCharacter(characterGuid)
    for _, achievement in next, KrowiAF_Achievements.Completed do
        if achievement.EarnedBy and achievement.EarnedBy[characterGuid] then
            achievement.EarnedBy[characterGuid] = nil;
        end
    end
end

function achievementData.ClearNotCompletedForCharacter(characterGuid)
    for _, achievement in next, KrowiAF_Achievements.NotCompleted do
        if achievement[characterGuid] then
            achievement[characterGuid] = nil;
        end
    end
end

function achievementData.DeleteForCharacter(characterGuid)
    achievementData.ClearCompletedForCharacter(characterGuid);
    achievementData.ClearNotCompletedForCharacter(characterGuid);
    KrowiAF_Achievements.LastCompleted[characterGuid] = nil;
end

local function InitLastCompleted()
    local lastCompleted = {GetLatestCompletedAchievements()};
    for i = addon.Options.db.profile.Summary.NumAchievements + 1, #lastCompleted do
        lastCompleted[i] = nil;
    end
    return lastCompleted;
end

local newAchievementsEarned = {};
local function AddNewAchievementsEarned(lastCompleted)
    local lastCompletedEnum = addon.Util.Enum2(lastCompleted);
    for _, achievementId in next, newAchievementsEarned do
        if not lastCompletedEnum[achievementId] then
            tinsert(lastCompleted, achievementId);
            if #lastCompleted >= addon.Options.db.profile.Summary.NumAchievements then
                break;
            end
        end
    end
    return lastCompleted;
end

local function AddFromEarnedByCharacter(characterGuid, lastCompleted)
    local lastCompletedEnum = addon.Util.Enum2(lastCompleted);
    local earnedByCharacter = achievementData.GetEarnedByCharacter(characterGuid);
    sort(earnedByCharacter, function(a, b) return a.Date > b.Date; end);
    local max = min(addon.Options.db.profile.Summary.NumAchievements, #earnedByCharacter);
    for i = 1, max do
        if not lastCompletedEnum[earnedByCharacter[i].Id] then
            tinsert(lastCompleted, earnedByCharacter[i].Id);
        end
    end
    return lastCompleted;
end

function achievementData.RefreshLastCompleted(characterGuid)
    local lastCompleted = InitLastCompleted();
    -- for key, value in pairs(lastCompleted) do
    --     print(key, value, (select(2, GetAchievementInfo(value))));
    -- end
    lastCompleted = AddNewAchievementsEarned(lastCompleted);
    lastCompleted = AddFromEarnedByCharacter(characterGuid, lastCompleted);
    KrowiAF_Achievements.LastCompleted[characterGuid] = lastCompleted;
end

function achievementData.RegisterNewAchievementEarned(achievementId)
    tinsert(newAchievementsEarned, 1, achievementId);
end

-- function achievementData.SetCharacterSpecific()
--     if addon.Options.db.profile.Categories.WatchList.CharacterSpecific then
--         local characterGuid = UnitGUID("player");
--         for id, _ in next, KrowiAF_Achievements.Watched do
--             KrowiAF_Achievements.Watched[id] = KrowiAF_Achievements.Watched[id] or {};
--             KrowiAF_Achievements.Watched[id][characterGuid] = true;
--         end
--         return;
--     end

--     for id, _ in next, KrowiAF_Achievements.Watched do
--         KrowiAF_Achievements.Watched[id] = true;
--     end
-- end

function achievementData.CopyAccountWideToCharacter()
    local characterGuid = UnitGUID("player");
    for achievementId, _ in next, KrowiAF_Achievements.Watched do
        KrowiAF_Achievements.Watched[achievementId][characterGuid] = true;
    end
    achievementData.ReloadWatchedAchievements();
end

function achievementData.SetWatched(achievement, isWatched)
    if not achievement then
        return;
    end

    if isWatched or isWatched == nil then
        achievement.IsWatched = true;
        KrowiAF_Achievements.Watched[achievement.Id] = KrowiAF_Achievements.Watched[achievement.Id] or {};
        if addon.Options.db.profile.Categories.WatchList.CharacterSpecific then
            KrowiAF_Achievements.Watched[achievement.Id][UnitGUID("player")] = true;
        else
            KrowiAF_Achievements.Watched[achievement.Id].AccountWide = true;
        end
        return;
    end

    achievement.IsWatched = nil;

    if addon.Options.db.profile.Categories.WatchList.CharacterSpecific then
        KrowiAF_Achievements.Watched[achievement.Id][UnitGUID("player")] = nil;
    else
        KrowiAF_Achievements.Watched[achievement.Id].AccountWide = nil;
    end

    for _, _ in next, KrowiAF_Achievements.Watched[achievement.Id] do
        return;
    end
    KrowiAF_Achievements.Watched[achievement.Id] = nil;
end

function achievementData:ClearWatchedAchievements()
    for achievementId, _ in next, KrowiAF_Achievements.Watched do
        self.SetWatched(addon.Data.Achievements[achievementId], false);
    end
end

local function LoadAchievements(sourceTable, func)
    if sourceTable == nil or type(sourceTable) ~= "table" then
        return;
    end

    for achievementId, _ in next, sourceTable do
        if addon.Data.Achievements[achievementId] then
            if addon.Options.db.profile.Categories.WatchList.CharacterSpecific then
                if sourceTable[achievementId][UnitGUID("player")] then
                    func(addon.Data.Achievements[achievementId], false);
                end
            else
                if sourceTable[achievementId].AccountWide then
                    func(addon.Data.Achievements[achievementId], false);
                end
            end
        else -- This is to clean up achievements that are no longer in the dataset
            sourceTable[achievementId] = nil;
        end
    end
end

function achievementData.LoadWatchedAchievements()
    LoadAchievements(KrowiAF_Achievements.Watched, addon.WatchAchievement);
end

function achievementData.ReloadWatchedAchievements()
    if not addon.SpecialCategories.WatchList then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI");
    end
    for i = 1, #addon.SpecialCategories.WatchList do
        addon.SpecialCategories.WatchList[i].Achievements = nil;
        addon.SpecialCategories.WatchList[i].Children = nil;
    end
    if addon.Gui.SelectedTab ~= nil then -- If nil, not yet loaded
        KrowiAF_CategoriesFrame:Update(true);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end

    LoadAchievements(KrowiAF_Achievements.Watched, addon.WatchAchievement);

    if AchievementFrame and AchievementFrame:IsShown() then
        addon.Gui:RefreshViewAfterPlayerLogin();
    end
end