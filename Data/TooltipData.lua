-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
addon.TooltipData = {};
local tooltipData = addon.TooltipData;
addon.Data.TooltipData = {};

local function ProcessGuid(guid)
    local unitType, _, serverId, instanceId, zoneUid, id, spawnUid = strsplit("-", guid);
    return unitType, serverId, instanceId, zoneUid, id, spawnUid;
end

local function AddTooltipLine(tooltip, tooltipLine)
    if tooltipLine.Faction then
        if addon.Faction.IsAlliance and tooltipLine.Faction ~= addon.Objects.Faction.Alliance
        or addon.Faction.IsHorde and tooltipLine.Faction ~= addon.Objects.Faction.Horde then
            return;
        end
    end

    local _, achievementName, _, achievementIsCompleted, _, _, _, _, _, achievementIcon, _, _, wasEarnedByMe = addon.GetAchievementInfo(tooltipLine.AchievementId);
    if not achievementName then -- Achievement does not exist
        return;
    end

    local show = not achievementIsCompleted;
    if not wasEarnedByMe and addon.Options.db.profile.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe then
        show = true;
    end

    if achievementIsCompleted and addon.Options.db.profile.Tooltip.Criteria.ShowIf.AchievementIsCompleted then
        show = true;
    end

    if not show then
        return;
    end

    local criteriaString, criteriaIsCompleted;
    if tooltipLine.CriteriaIndex ~= 0 then
        criteriaString, _, criteriaIsCompleted = addon.GetAchievementCriteriaInfo(tooltipLine.AchievementId, tooltipLine.CriteriaIndex);
    else
        criteriaString = achievementName;
        criteriaIsCompleted = achievementIsCompleted;
    end
    if criteriaIsCompleted and not addon.Options.db.profile.Tooltip.Criteria.ShowIf.CriteriaIsCompleted then
        return;
    end

    local icon, color;
    if criteriaIsCompleted then
        icon = "|T136814:0|t";
        color = addon.Util.Colors.GreenRGB;
    else
        icon = "|T136813:0|t";
        color = addon.Util.Colors.RedRGB;
    end
    tooltip:AddLine(icon .. " |T" .. achievementIcon .. ":0|t " .. achievementName .. " > " .. criteriaString, color.R, color.G, color.B);
    -- tooltip:AddDoubleLine(icon .. " |T" .. achievementIcon .. ":0|t " .. achievementName, criteriaString, color.R, color.G, color.B, color.R, color.G, color.B);
    if addon.Diagnostics.DebugEnabled() then
        tooltip:AddLine(tooltipLine.AchievementId .. " - " .. tooltipLine.CriteriaIndex);
    end
end

local function ProcessUnit(tooltip, guid)
    if not addon.Options.db.profile.Tooltip.Criteria.Show then
        return;
    end

    if not guid then
        return;
    end

    if addon.Diagnostics.DebugEnabled() then
        tooltip:AddLine(guid);
    end

    local unitType, _, _, _, unitId = ProcessGuid(guid);
    unitId = tonumber(unitId);
    if (unitType ~= "Creature" and unitType ~= "Vehicle") or not unitId then
        return;
    end

    local unitDatum = addon.Data.TooltipData[unitId];
    if not unitDatum then
        return;
    end

    for _, tooltipLine in next, unitDatum do
        if tooltipLine.ObjectType == addon.Objects.TooltipDataType.Unit then
            AddTooltipLine(tooltip, tooltipLine);
        end
    end
end

local function ProcessItem(tooltip, itemId)
    if not addon.Options.db.profile.Tooltip.Criteria.Show then
        return;
    end

    if not itemId then
        return;
    end

    if addon.Diagnostics.DebugEnabled() then
        tooltip:AddLine(itemId);
    end

    itemId = tonumber(itemId);
    if not itemId then
        return;
    end

    local itemDatum = addon.Data.TooltipData[itemId];
    if not itemDatum then
        return;
    end

    for _, tooltipLine in next, itemDatum do
        if tooltipLine.ObjectType == addon.Objects.TooltipDataType.Item then
            AddTooltipLine(tooltip, tooltipLine);
        end
    end
end

local function ProcessSpell(tooltip, spellId)
    if not addon.Options.db.profile.Tooltip.Criteria.Show then
        return;
    end

    if not spellId then
        return;
    end

    if addon.Diagnostics.DebugEnabled() then
        tooltip:AddLine(spellId);
    end

    spellId = tonumber(spellId);
    if not spellId then
        return;
    end

    local spellDatum = addon.Data.TooltipData[spellId];
    if not spellDatum then
        return;
    end

    for _, tooltipLine in next, spellDatum do
        if tooltipLine.ObjectType == addon.Objects.TooltipDataType.Spell then
            AddTooltipLine(tooltip, tooltipLine);
        end
    end
end

local function ProcessUnit100000(tooltip)
    local _, unit = tooltip:GetUnit();
    if not unit then
        return;
    end
    local guid = UnitGUID(unit);
    ProcessUnit(tooltip, guid);
end

local function DoProcessItem(tooltip, itemId)
    if not itemId then
        return;
    end
    local classId = (select(12, GetItemInfo(itemId)));
    if classId == Enum.ItemClass.Recipe then
        tooltip.isFirstTime = not tooltip.isFirstTime;
        return not tooltip.isFirstTime;
    end
    return true;
end

local function ProcessItem100000(tooltip)
    local _, link = tooltip:GetItem();
    if not link then
        return;
    end
    local itemId = (select(3, strfind(link, "item:(%d+)")));
    itemId = tonumber(itemId);

    if not DoProcessItem(tooltip, itemId) then -- This is to skip embedded items
        return;
    end

    ProcessItem(tooltip, itemId);
end

local function ProcessSpell100000(tooltip)
    local _, id = tooltip:GetSpell();
    if not id then
        return;
    end

    ProcessSpell(tooltip, id);
end

local function ProcessUnit100002(tooltip, localData)
    ProcessUnit(tooltip, localData.guid);
end

local function ProcessItem100002(tooltip, localData)
    ProcessItem(tooltip, localData.id);
end

local function ProcessSpell100002(tooltip, localData)
    ProcessSpell(tooltip, localData.id);
end

function tooltipData.Load()
    local tocVersion = select(4, GetBuildInfo());
    if tocVersion < 100002 then
        GameTooltip:HookScript("OnTooltipSetUnit", ProcessUnit100000);
        GameTooltip:HookScript("OnTooltipSetItem", ProcessItem100000);
        GameTooltip:HookScript("OnTooltipSetSpell", ProcessSpell100000);
        -- GameTooltip:HookScript("OnShow", function(self)
		-- 	-- Debug all of the available fields on the owner.
        --     local owner = self:GetOwner();
		-- 	-- self:AddDoubleLine("GetOwner", tostring(owner:GetName()));
		-- 	for i,j in pairs(self) do
		-- 		self:AddDoubleLine(tostring(i), tostring(j));
		-- 	end
		-- 	self:Show();
        -- end);

        ItemRefTooltip:HookScript("OnTooltipSetItem", ProcessItem100000);
    else
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, ProcessUnit100002);
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ProcessItem100002);
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, ProcessSpell100002);
        -- for i = 0, 30, 1 do
        --     TooltipDataProcessor.AddTooltipPostCall(i, function(tooltip, localData)
        --         addon.Diagnostics.DebugTable(localData);
        --         tooltip:AddLine(tostring(i));
        --     end);
        -- end
        -- hooksecurefunc("WorldMap_GetQuestTimeForTooltip", function(questID)
        --     print(questID);
        -- end);
        -- GameTooltip:HookScript("OnShow", function(self)
        --     DebugTable = {};
        --     local charactersPerLine = 1000;
        --     for line in TableToString(self, charactersPerLine):gmatch("[^\r\n]+") do
        --         tinsert(DebugTable, line);
        --     end
        -- end);
    end

    data.ExportedTooltipData.Load(addon.Data.TooltipData);
end

-- function KrowiAF_DumpTooltip()
--     DebugTable = GameTooltip;
-- end

-- local unitLink = "|cffffff00|Hunit:%s|h[%s]|h|r"

-- function KrowiAF_ParseGUID(unit)
-- 	local guid = UnitGUID(unit)
-- 	local name = UnitName(unit)
-- 	if guid then
-- 		local link = unitLink:format(guid, name) -- clickable link
-- 		local unit_type = strsplit("-", guid)
-- 		if unit_type == "Creature" or unit_type == "Vehicle" then
-- 			local _, _, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-", guid)
-- 			print(format("%s is a creature with NPC ID %d", link, npc_id))
-- 		elseif unit_type == "Player" then
-- 			local _, server_id, player_id = strsplit("-", guid)
-- 			print(format("%s is a player with ID %s", link, player_id))
-- 		end
-- 	end
-- end