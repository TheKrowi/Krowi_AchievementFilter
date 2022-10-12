local _, addon = ...;
local data = addon.Data;
data.CustomObjectives = {};
local customObjectives = data.CustomObjectives;

customObjectives[11474] = function()
    local achievementId = 11474;
    local numCriteria = GetAchievementNumCriteria(achievementId);
    for i = 1, numCriteria, 1 do
        local assetId = select(8, GetAchievementCriteriaInfo(achievementId, i));
        local criteriaString, _, completed, quantity, reqQuantity, _, _, _, _, _, _ = GetAchievementCriteriaInfo(assetId, 1);
        addon.GUI.AchievementTooltip.AddCriteria({
            {
                criteriaString,
                completed,
                quantity,
                reqQuantity
            }
        });
    end
end

customObjectives[15406] = function()
    addon.GUI.AchievementTooltip.AddCriteria({
        {
            "",
            tonumber((GetStatistic(15406))) >= 1,
            (GetStatistic(15406)),
            1
        }
    });
end

customObjectives[15407] = function()
    addon.GUI.AchievementTooltip.AddCriteria({
        {
            "",
            tonumber((GetStatistic(15407))) >= 5,
            (GetStatistic(15407)),
            5
        }
    });
end

customObjectives[15410] = function()
    addon.GUI.AchievementTooltip.AddCriteria({
        {
            "",
            tonumber((GetStatistic(15410))) >= 25,
            (GetStatistic(15410)),
            25
        }
    });
end

customObjectives[15411] = function()
    addon.GUI.AchievementTooltip.AddCriteria({
        {
            "",
            tonumber((GetStatistic(15411))) >= 50,
            (GetStatistic(15411)),
            50
        }
    });
end

local co;
local transmogCriteriaHelper = CreateFrame("Frame");
function transmogCriteriaHelper:OnEvent(event)
    if event == "GET_ITEM_INFO_RECEIVED" then
        if co ~= nil then
            coroutine.resume(co);
        end
    end
end
transmogCriteriaHelper:SetScript("OnEvent", transmogCriteriaHelper.OnEvent);

local function Max(t, fn)
    if #t == 0 then return nil, nil end
    local key, value = 1, t[1]
    for i = 2, #t do
        if fn(value, t[i]) then
            key, value = i, t[i]
        end
    end
    return key, value
end

local function GetTooltipText()
    local linesLeft, linesRight = {}, {};
    for i = 1, GameTooltip:NumLines() do
        tinsert(linesLeft, _G["GameTooltipTextLeft"..i]:GetText() or "");
    end
    for i = 1, GameTooltip:NumLines() do
        tinsert(linesRight, _G["GameTooltipTextRight"..i]:GetText() or "");
    end
    return linesLeft, linesRight;
end

local function AddTransmogCriteria(tooltip, transmogSets)
    local originalOwner = tooltip:GetOwner();
    tooltip:AddLine(addon.L["Collecting data"]);
    transmogCriteriaHelper:RegisterEvent("GET_ITEM_INFO_RECEIVED");
    local invTypes = {};

    local id;
    local owner = tooltip:GetOwner();
    if owner then
        id = owner.Achievement.Id;
    end

    local numCollectedPerSet = {};
    local numUsableSets = 0;
    -- addon.Diagnostics.DebugTable(transmogSets);
    for _, transmogSet in next, transmogSets do
        local numCollected = 0;
        local setInfo = C_TransmogSets.GetSetInfo(transmogSet.Id);
        if setInfo.requiredFaction == nil or setInfo.requiredFaction == UnitFactionGroup("player") then
            numUsableSets = numUsableSets + 1;
            local primaryAppearances = C_TransmogSets.GetSetPrimaryAppearances(transmogSet.Id);
            for _, primaryAppearance in ipairs(primaryAppearances) do
                local sourceID = primaryAppearance.appearanceID;
                local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);

                local equipLoc = select(9, GetItemInfo(sourceInfo.itemID));
                while equipLoc == nil do
                    -- addon.Diagnostics.Debug("No data found for " .. tostring(sourceInfo.itemID));
                    coroutine.yield();
                    equipLoc = select(9, GetItemInfo(sourceInfo.itemID));
                end

                if equipLoc ~= nil then
                    invTypes[equipLoc] = invTypes[equipLoc] or {
                        InvType = sourceInfo.invType,
                        Items = {}
                    };
                    -- tinsert(invTypes[equipLoc].Items, {
                    --     Description = setInfo.description,
                    --     Collected = primaryAppearance.collected
                    -- });
                    invTypes[equipLoc].Items[numUsableSets] = {
                        Description = setInfo.description,
                        Collected = primaryAppearance.collected
                    };
                    if primaryAppearance.collected then
                        numCollected = numCollected + 1;
                    end
                end
            end
            tinsert(numCollectedPerSet, numCollected / #primaryAppearances);
        end
    end

    for i = 1, numUsableSets, 1 do
        for j, _ in next, invTypes do
            if invTypes[j].Items[i] == nil then
                invTypes[j].Items[i] = {
                    Description = addon.L["Not part of set"],
                    Collected = false
                };
            end
        end
    end

    owner = tooltip:GetOwner();
    if owner and id ~= owner.Achievement.Id then
        transmogCriteriaHelper:UnregisterEvent("GET_ITEM_INFO_RECEIVED");
        return;
    end

    local res = {};
    for equipLoc, invType in next, invTypes do
        invType.EquipLoc = equipLoc;
        tinsert(res, invType);
    end
    invTypes = res;
    sort(invTypes, function(a, b) return a.InvType < b.InvType; end);

    -- addon.Diagnostics.DebugTable(numCollectedPerSet);
    local headerSetCollected = Max(numCollectedPerSet, function(a,b) return a < b end);

    local linesLeft, linesRight = GetTooltipText();
    tooltip:SetOwner(originalOwner, "ANCHOR_NONE");
	tooltip:SetPoint("TOPLEFT", originalOwner, "TOPRIGHT");
    for i = 1, #linesLeft - 1, 1 do
        if linesRight[i] == "" then
            tooltip:AddLine(linesLeft[i]);
        else
            tooltip:AddDoubleLine(linesLeft[i], linesRight[i]);
        end
    end

    if numUsableSets > 0 then
        local icon, color;
        for i, invType in next, invTypes do
            local text = "";
            local collected = false;
            for j, item in next, invType.Items do
                if item.Collected then
                    color = addon.Colors.Green;
                    if headerSetCollected == j then
                        collected = true;
                    end
                else
                    color = addon.Colors.Grey;
                end
                text = text .. (j ~= 1 and ", " or "") .. string.format(color, item.Description);
            end
            if collected then
                icon = "|T136814:0|t";
                color = addon.Colors.Green;
            else
                icon = "|T136815:0|t";
                color = addon.Colors.Grey;
            end
            text = icon .. addon.L["TAB"] .. string.format(color, _G[invType.EquipLoc] or invType.EquipLoc) .. ":" .. addon.L["TAB"] .. text;
            tooltip:AddLine(text);
        end
    else
        tooltip:AddLine(string.format(addon.Colors.Red, addon.L["This achievement can't be earned by this character."]));
        tooltip:AddLine(string.format(addon.Colors.Red, addon.L["This character's class has no transmog set that meet the requirements."]));
    end
    tooltip:Show();
    transmogCriteriaHelper:UnregisterEvent("GET_ITEM_INFO_RECEIVED");
    co = nil;
end

function customObjectives.AddTransmogCriteriaAsync(tooltip)
    local transmogSets = tooltip:GetOwner().Achievement.TransmogSets;
    if transmogSets == nil then
        return;
    end
    transmogSets = addon.GetUsableSets(transmogSets);
    co = coroutine.create(AddTransmogCriteria);
    coroutine.resume(co, tooltip, transmogSets);
end