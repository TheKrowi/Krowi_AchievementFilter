local _, addon = ...;

KrowiAF.CustomCriteriaData = {};

function KrowiAF.AddCustomCriteriaData(achievementId, customCriteria)
    if not addon.Data.Achievements[achievementId] then
        return;
    end

    addon.Data.Achievements[achievementId]:SetCustomCriteria(customCriteria);
end

function KrowiAF.ReloadTrackedAchievements()
    local trackedAchievementIds = C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement);
    for _, achievementId in ipairs(trackedAchievementIds) do
        C_ContentTracking.StopTracking(Enum.ContentTrackingType.Achievement, achievementId, Enum.ContentTrackingStopType.Manual);
        C_ContentTracking.StartTracking(Enum.ContentTrackingType.Achievement, achievementId);
    end
end

local origGetAchievementCriteriaInfo = GetAchievementCriteriaInfo;
GetAchievementCriteriaInfo = function(achievementId, criteriaIndex, countHidden)
    if addon.Data.Achievements[achievementId] and addon.Data.Achievements[achievementId].GetCustomCriteria then
        return addon.Data.Achievements[achievementId].GetCustomCriteria(criteriaIndex);
    end
    return origGetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden);
end
KrowiAF_origGetAchievementCriteriaInfo = origGetAchievementCriteriaInfo;

local origGetAchievementCriteriaInfoById = GetAchievementCriteriaInfoByID;
GetAchievementCriteriaInfoByID = function(achievementId, criteriaId)
    return origGetAchievementCriteriaInfoById(achievementId, criteriaId);
end
KrowiAF_origGetAchievementCriteriaInfoById = origGetAchievementCriteriaInfoById;

local origGetAchievementNumCriteria = GetAchievementNumCriteria;
GetAchievementNumCriteria = function(achievementId)
    if addon.Data.Achievements[achievementId] and addon.Data.Achievements[achievementId].GetCustomCriteria then
        return addon.Data.Achievements[achievementId].GetCustomCriteria();
    else
        return origGetAchievementNumCriteria(achievementId);
    end
end
KrowiAF_origGetAchievementNumCriteria = origGetAchievementNumCriteria;

if not addon.Util.IsMainline then
    return;
end

local function AddCustomLine(lines, leftText, lr, lg, lb, wrap, rightText, rr, rg, rb)
    local leftColor = {};
    for funcName, func in pairs(lines[1].leftColor) do
        leftColor[funcName] = func;
    end
    leftColor.r, leftColor.g, leftColor.b = lr, lg, lb;

    local newLine = {
        leftText = leftText,
        leftColor = leftColor,
        type = 0,
        lineIndex = #lines + 1,
    };

    if rightText then
        local rightColor = {};
        for funcName, func in pairs(leftColor) do
            rightColor[funcName] = func;
        end
        rightColor.r, rightColor.g, rightColor.b = rr, rg, rb;
        newLine.rightText  = rightText;
        newLine.rightColor = rightColor;
    else
        newLine.wrapText = wrap or false;
    end

    table.insert(lines, newLine);
end

TooltipDataProcessor.AddTooltipPreCall(Enum.TooltipDataType.Achievement, function(tooltip, localData)
    if not addon.Data.Achievements[localData.id] or not addon.Data.Achievements[localData.id].GetCustomCriteria then
        return;
    end

    AddCustomLine(localData.lines, " ", 1, 1, 1);

    local getCustomCriteria = addon.Data.Achievements[localData.id].GetCustomCriteria;
    local numCriteria = getCustomCriteria();

    local green = addon.Util.Colors.GreenRGB;
    local grey = addon.Util.Colors.GreyRGB;
    for i = 1, numCriteria, 2 do
        local criteriaString1, _, completed1, _, _, _, _, _, quantityString1, _, _, _, _, _ = getCustomCriteria(i);
        local criteriaString2, _, completed2, _, _, _, _, _, quantityString2, _, _, _, _, _ = getCustomCriteria(i + 1);
        criteriaString1 = (not criteriaString1 or criteriaString1 == "") and quantityString1 or criteriaString1
        criteriaString2 = (not criteriaString2 or criteriaString2 == "") and quantityString2 or criteriaString2

        local color1 = completed1 and green or grey;
        if not criteriaString2 then
            AddCustomLine(localData.lines, criteriaString1, color1.R, color1.G, color1.B);
            break;
        end
        local color2 = completed2 and green or grey;
        AddCustomLine(localData.lines, criteriaString1, color1.R, color1.G, color1.B, nil, criteriaString2, color2.R, color2.G, color2.B);
    end
end);