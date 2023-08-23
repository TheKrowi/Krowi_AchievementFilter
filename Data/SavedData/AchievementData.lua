local addonName, addon = ...;
local savedData = addon.Data.SavedData;
savedData.AchievementData = {};
local achievementData = savedData.AchievementData;

function achievementData.Load()
    KrowiAF_Achievements = KrowiAF_Achievements or {};
    KrowiAF_Achievements.Completed = KrowiAF_Achievements.Completed or {};
    KrowiAF_Achievements.NotCompleted = KrowiAF_Achievements.NotCompleted or {};
    KrowiAF_Achievements.LastCompleted = KrowiAF_Achievements.LastCompleted or {};
end

local function DateTimeToEpoch(year, month, day, hour, min, sec)
    return time{
        year = year,
        month = month,
        day = day,
        hour = hour or 12,
        min = min or 0,
        sec = sec or 0
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
    local epoch = DateTimeToEpoch(dateTime.Year, dateTime.Month, dateTime.Day, dateTime.Hour, dateTime.Min, dateTime.Sec);
    SetFirstCompletedOn(achievementId, epoch);
    if achievementInfo.Flags.IsAccountWide then
        return;
    end
    KrowiAF_Achievements.Completed[achievementId].EarnedBy = KrowiAF_Achievements.Completed[achievementId].EarnedBy or {};
    if achievementInfo.WasEarnedByMe then
        SetEarnedByCharacter(characterGuid, achievementId, epoch);
    end
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
    return achievementInfo.Points < 0 or achievementInfo.IsStatistic or achievementInfo.IsGuild or achievementInfo.Flags.IsTracking or not achievementInfo.Exists;
end

-- function achievementData.Prune(achievementId)
--     KrowiAF_Achievements.Completed[achievementId] = nil;
--     KrowiAF_Achievements.NotCompleted[achievementId] = nil;
-- end

function achievementData.IsEarnedByCharacter(characterGuid, achievementId)
    local achievement = KrowiAF_Achievements.Completed[achievementId];
    if not achievement then
        return false;
    end
    return (achievement.EarnedBy and achievement.EarnedBy[characterGuid]) or achievement.FirstCompletedOn;
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

local function GetAdjustedDateTime(year, month, day)
    local dateTable = date("*t", time());
    local isToday = dateTable.year == 2000 + year and dateTable.month == month and dateTable.day == day;
    return 2000 + year, month, day, isToday and dateTable.hour or 12, isToday and dateTable.min or 0, isToday and dateTable.sec or 0;
end

function achievementData.GetCompletionDateTime(id, completed, flags, wasEarnedByMe, characterGuid, year, month, day)
    if not completed then
        -- Not completed achievements return all nil
        return nil, nil, nil, nil, nil, nil;
    end

    if not KrowiAF_Achievements.Completed[id] then
        -- Achievement is completed but has no record yet so return the default
        return GetAdjustedDateTime(year, month, day);
    end

    -- At this point we're sure the record exists
    local secondsSince;
    if flags.IsAccountWide then
        -- If account wide, get FirstCompletedOn
        secondsSince = KrowiAF_Achievements.Completed[id].FirstCompletedOn;
    elseif wasEarnedByMe and KrowiAF_Achievements.Completed[id].EarnedBy then
        -- If it was earned by the character, get the character's completion
        secondsSince = KrowiAF_Achievements.Completed[id].EarnedBy[characterGuid];
    end

    -- When an achievement is earned and is not account wide, the first time the record does not exist yet, return the default
    if not secondsSince then
        return GetAdjustedDateTime(year, month, day);
    end

    local dateTable = date("*t", secondsSince);
    return dateTable.year, dateTable.month, dateTable.day, dateTable.hour, dateTable.min, dateTable.sec;
end