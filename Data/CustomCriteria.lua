local _, addon = ...;
addon.Data.CustomCriteria = {};
local customCriteria = addon.Data.CustomCriteria;

customCriteria[11474] = function(criteriaIndex)
    local achievementId = 11474;
    local numCriteria = KrowiAF_origGetAchievementNumCriteria(achievementId);
    if criteriaIndex == nil then
        return numCriteria;
    elseif criteriaIndex >= 1 and criteriaIndex <= numCriteria then
        local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetId, quantityString, criteriaId, eligible = KrowiAF_origGetAchievementCriteriaInfo(achievementId, criteriaIndex);
        criteriaString, _, _, quantity, reqQuantity, _, _, _, _, _, _ = KrowiAF_origGetAchievementCriteriaInfo(assetId, 1);
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

customCriteria[20509] = function(criteriaIndex)
    if criteriaIndex == nil then
        return 1;
    elseif criteriaIndex == 1 then
        local quantity = tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
        local reqQuantity = 1000000;
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

local baseCriteriaId = 108648;
local criteriaIdOffsets = {-288, -272, 3, 7, 6, 0, 8, 4, 9, 5, 2, 1};
customCriteria[42565] = function(criteriaIndex)
    if criteriaIndex == nil then
        return 12;
    elseif criteriaIndex >= 1 and criteriaIndex <= 12 then
        local _, _, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, duration, elapsed = KrowiAF_origGetAchievementCriteriaInfoById(42565, baseCriteriaId + criteriaIdOffsets[criteriaIndex]);
        return (GetClassInfo(criteriaIndex)), 0, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, duration, elapsed;
    end
end

local achievementFactionGroups = {
    [12076] = 2170, -- Protector of the Argussian Reach - Argussian Reach
    [12081] = 2165, -- Officer of the Light             - Army of the Light
    -- [42627] = 2170, -- Argussian Reach                  - Argussian Reach
    -- [42655] = 2045, -- The Armies of Legionfall         - Armies of Legionfall
};
for achievementId, factionId in next, achievementFactionGroups do
    customCriteria[achievementId] = function(criteriaIndex)
        if criteriaIndex == nil then
            return 1;
        elseif criteriaIndex == 1 then
            local quantity = tonumber(C_Reputation.GetFactionDataByID(factionId).currentStanding);
            local reqQuantity = 42000;
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
end








-- local function dumpTable(t, indent)
--     indent = indent or ""
--     for k, v in pairs(t) do
--         if type(v) == "table" then
--             print(indent .. tostring(k) .. " = {")
--             dumpTable(v, indent .. "  ")
--             print(indent .. "}")
--         else
--             print(indent .. tostring(k) .. " = " .. tostring(v))
--         end
--     end
-- end

-- hooksecurefunc(GameTooltip, "SetHyperlink", function(...)
--     local tbl = select(1, ...);
--     print(...)
--     dumpTable(tbl)
--     local tooltipInfo = CreateBaseTooltipInfo("GetHyperlink", ...)
--     print("Dumping tooltipInfo:")
--     -- dumpTable(tooltipInfo)
-- end)
