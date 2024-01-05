local _, addon = ...;
addon.Data.CustomCriteria = {};
local customCriteria = addon.Data.CustomCriteria;

customCriteria[11474] = function(criteriaIndex)
    local achievementId = 11474;
    local numCriteria = GetAchievementNumCriteria(achievementId);
    if criteriaIndex == nil then
        return numCriteria;
    elseif criteriaIndex >= 1 and criteriaIndex <= numCriteria then
        local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetId, quantityString, criteriaId, eligible = GetAchievementCriteriaInfo(achievementId, criteriaIndex);
        criteriaString, _, _, quantity, reqQuantity, _, _, _, _, _, _ = GetAchievementCriteriaInfo(assetId, 1);
        return criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetId, quantityString, criteriaId, eligible;
    end
end

customCriteria[15406] = function(criteriaIndex)
    if criteriaIndex == nil then
        return 1;
    elseif criteriaIndex == 1 then
        local quantity = tonumber((GetStatistic(15406)));
        local reqQuantity = 1;
        return
        "", -- criteriaString
        nil, -- criteriaType
        quantity >= reqQuantity, -- completed
        quantity, -- quantity
        reqQuantity, -- reqQuantity
        nil, -- charName
        0x00000001, -- flags
        nil, -- assetId
        quantity .. " / " .. reqQuantity, -- quantityString
        nil, -- criteriaId
        nil; -- eligible
    end
end

customCriteria[15407] = function(criteriaIndex)
    if criteriaIndex == nil then
        return 1;
    elseif criteriaIndex == 1 then
        local quantity = tonumber((GetStatistic(15407)));
        local reqQuantity = 5;
        return
        "", -- criteriaString
        nil, -- criteriaType
        quantity >= reqQuantity, -- completed
        quantity, -- quantity
        reqQuantity, -- reqQuantity
        nil, -- charName
        0x00000001, -- flags
        nil, -- assetId
        quantity .. " / " .. reqQuantity, -- quantityString
        nil, -- criteriaId
        nil; -- eligible
    end
end

customCriteria[15410] = function(criteriaIndex)
    if criteriaIndex == nil then
        return 1;
    elseif criteriaIndex == 1 then
        local quantity = tonumber((GetStatistic(15410)));
        local reqQuantity = 25;
        return
        "", -- criteriaString
        nil, -- criteriaType
        quantity >= reqQuantity, -- completed
        quantity, -- quantity
        reqQuantity, -- reqQuantity
        nil, -- charName
        0x00000001, -- flags
        nil, -- assetId
        quantity .. " / " .. reqQuantity, -- quantityString
        nil, -- criteriaId
        nil; -- eligible
    end
end

customCriteria[15411] = function(criteriaIndex)
    if criteriaIndex == nil then
        return 1;
    elseif criteriaIndex == 1 then
        local quantity = tonumber((GetStatistic(15411)));
        local reqQuantity = 50;
        return
        "", -- criteriaString
        nil, -- criteriaType
        quantity >= reqQuantity, -- completed
        quantity, -- quantity
        reqQuantity, -- reqQuantity
        nil, -- charName
        0x00000001, -- flags
        nil, -- assetId
        quantity .. " / " .. reqQuantity, -- quantityString
        nil, -- criteriaId
        nil; -- eligible
    end
end