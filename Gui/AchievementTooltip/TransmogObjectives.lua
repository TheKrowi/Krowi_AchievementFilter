local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

local co;
local transmogCriteriaHelper = CreateFrame("Frame");
function transmogCriteriaHelper:OnEvent(event)
    if event == "GET_ITEM_INFO_RECEIVED" and co ~= nil then
        coroutine.resume(co);
    end
end
transmogCriteriaHelper:SetScript("OnEvent", transmogCriteriaHelper.OnEvent);

local transmogSetIds;
function section:CheckAdd(achievement)
    if not achievement.TransmogSetIds then
		return;
	end
	local state = achievement:GetObtainableState();
	if not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show or state == "Past" then
		return;
	end
	if achievement.IsCompleted and not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted then
		return;
	end
    transmogSetIds = addon.GetUsableSets(achievement.TransmogSetIds);
	return true;
end

local function AnalyzeTransmogSets()
    local invTypes = {};
    local numCollectedPerSet = {};

    for i, transmogSetId in next, transmogSetIds do
        local numCollected = 0;
        local setInfo = C_TransmogSets.GetSetInfo(transmogSetId);
        local primaryAppearances = C_TransmogSets.GetSetPrimaryAppearances(transmogSetId);
        for _, primaryAppearance in ipairs(primaryAppearances) do
            local sourceId = primaryAppearance.appearanceID;
            local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceId);
            local equipLoc = select(9, GetItemInfo(sourceInfo.itemID));
            while equipLoc == nil do
                coroutine.yield();
                equipLoc = select(9, GetItemInfo(sourceInfo.itemID));
            end

            if equipLoc ~= nil then
                invTypes[equipLoc] = invTypes[equipLoc] or {
                    InvType = sourceInfo.invType,
                    Items = {}
                };
                invTypes[equipLoc].Items[i] = {
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

    return numCollectedPerSet, invTypes;
end

local function AchievementHasChanged(prevAchievementId)
    local owner = GameTooltip:GetOwner();
    if owner and prevAchievementId ~= owner.Achievement.Id then -- Owner changed so we stop the current lookup
        transmogCriteriaHelper:UnregisterEvent("GET_ITEM_INFO_RECEIVED");
        return true;
    end
end

local function AddMissingItems(invTypes)
    for i = 1, #transmogSetIds, 1 do
        for j, _ in next, invTypes do
            if invTypes[j].Items[i] == nil then
                invTypes[j].Items[i] = {
                    Description = addon.L["Not part of set"],
                    Collected = false
                };
            end
        end
    end
end

local function ConvertInvTypeHashSetToSortedList(invTypes)
    local list = {};
    for equipLoc, invType in next, invTypes do
        invType.EquipLoc = equipLoc;
        tinsert(list, invType);
    end
    sort(list, function(a, b) return a.InvType < b.InvType; end);
    return list;
end

local function GetTooltipText()
    local r, g, b;
    local linesLeft, linesRight = {}, {};
    for i = 1, GameTooltip:NumLines() do
        r, g, b = _G["GameTooltipTextLeft" .. i]:GetTextColor();
        tinsert(linesLeft, {
            Text = _G["GameTooltipTextLeft" .. i]:GetText() or "",
            R = r,
            G = g,
            B = b
        });
        r, g, b = _G["GameTooltipTextRight" .. i]:GetTextColor();
        tinsert(linesRight, {
            Text = _G["GameTooltipTextRight" .. i]:GetText() or "",
            R = r,
            G = g,
            B = b
        });
    end
    return linesLeft, linesRight;
end

local function CopyPrevTooltipLines(originalOwner)
    local linesLeft, linesRight = GetTooltipText();
    GameTooltip:SetOwner(originalOwner, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", originalOwner, "TOPRIGHT");
    local lineLeft, lineRight;
    for i = 1, #linesLeft - 1, 1 do
        lineLeft, lineRight = linesLeft[i], linesRight[i];
        if lineRight == "" then
            GameTooltip:AddLine(lineLeft.Text, lineLeft.R, lineLeft.G, lineLeft.B);
        else
            GameTooltip:AddDoubleLine(lineLeft.Text, lineRight.Text, lineLeft.R, lineLeft.G, lineLeft.B, lineRight.R, lineRight.G, lineRight.B);
        end
    end
end

local function GetMostCollectedSet(numCollectedPerSet)
    if #numCollectedPerSet == 0 then
        return nil, nil;
    end
    local key, value = 1, numCollectedPerSet[1];
    for i = 2, #numCollectedPerSet do
        if numCollectedPerSet[i] > value then
            key, value = i, numCollectedPerSet[i];
        end
    end
    return key, value;
end

local function AddCriteriaLine(numCollectedPerSet, invTypes)
    local headerSetCollected = GetMostCollectedSet(numCollectedPerSet);
    local icon, color;
    for _, invType in next, invTypes do
        local text = "";
        local collected = false;
        for j, item in next, invType.Items do
            if item.Collected then
                color = addon.Util.Colors.Green;
                if headerSetCollected == j then
                    collected = true;
                end
            else
                color = addon.Util.Colors.Grey;
            end
            text = text .. (j ~= 1 and ", " or "") .. string.format(color, item.Description);
        end
        if collected then
            icon = "|T136814:0|t";
            color = addon.Util.Colors.Green;
        else
            icon = "|T136815:0|t";
            color = addon.Util.Colors.Grey;
        end
        text = icon .. "|T:1:8|t" .. string.format(color, _G[invType.EquipLoc] or invType.EquipLoc) .. ":" .. "|T:1:8|t" .. text;
        GameTooltip:AddLine(text);
    end
end

local function AddCriteria()
    local originalOwner = GameTooltip:GetOwner();
    GameTooltip:AddLine(addon.L["Collecting data"]);
    transmogCriteriaHelper:RegisterEvent("GET_ITEM_INFO_RECEIVED");

    local achievementId;
    local owner = GameTooltip:GetOwner();
    if owner then
        achievementId = owner.Achievement.Id;
    end

    local numCollectedPerSet, invTypes = AnalyzeTransmogSets();

    -- AnalyzeTransmogSets might take a while so check if we're still viewing the same achievement
    if AchievementHasChanged(achievementId) then
        return;
    end

    AddMissingItems(invTypes);

    invTypes = ConvertInvTypeHashSetToSortedList(invTypes);

    CopyPrevTooltipLines(originalOwner);

    AddCriteriaLine(numCollectedPerSet, invTypes)

    GameTooltip:Show();

    transmogCriteriaHelper:UnregisterEvent("GET_ITEM_INFO_RECEIVED");
    co = nil;
end

local function AddTransmogCriteriaAsync()
    co = coroutine.create(AddCriteria);
    coroutine.resume(co);
end

function section:Add()
	GameTooltip:AddLine(addon.L["Objectives progress"]);
    if #transmogSetIds > 0 then
	    AddTransmogCriteriaAsync();
        return;
    end
    GameTooltip:AddLine(string.format(addon.Util.Colors.Red, addon.L["This achievement can't be earned by this character."]));
    GameTooltip:AddLine(string.format(addon.Util.Colors.Red, addon.L["This character's class has no transmog set that meet the requirements."]));
end