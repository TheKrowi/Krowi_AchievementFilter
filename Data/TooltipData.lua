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

local function AddTooltipLine(tooltipLine)
    if tooltipLine.Faction then
        if addon.Faction.IsAlliance and tooltipLine.Faction ~= addon.Objects.Faction.Alliance
        or addon.Faction.IsHorde and tooltipLine.Faction ~= addon.Objects.Faction.Horde then
            return;
        end
    end

    local _, name, _, achievementIsCompleted, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(tooltipLine.AchievementId);
    if not name then -- Achievement does not exist
        return;
    end

    local show = not achievementIsCompleted;
    if not wasEarnedByMe and addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe then
        show = true;
    end

    if achievementIsCompleted and addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted then
        show = true;
    end

    if not show then
        return;
    end

    local _, _, criteriaIsCompleted = GetAchievementCriteriaInfo(tooltipLine.AchievementId, tooltipLine.CriteriaIndex);

    if criteriaIsCompleted and not addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted then
        return;
    end

    local icon, text, color;
    if criteriaIsCompleted then
        icon = "|T136814:0|t";
        text = tooltipLine.CompletedText;
        color = addon.Colors.GreenRGB;
    else
        icon = "|T136813:0|t";
        text = tooltipLine.NotCompletedText;
        color = addon.Colors.RedRGB;
    end
    text = text:ReplaceVars{
        forAchievement = addon.Options.db.Tooltip.Criteria.ShowForAchievement and addon.L["for achievement"] or ""
    };
    GameTooltip:AddLine(icon .. " " .. string.trim(text:ReplaceVars{
        achievement = name
    }), color.R, color.G, color.B);
end

local function ProcessUnit(guid)
    if not addon.Options.db.Tooltip.Criteria.Show then
        return;
    end

    if not guid then
        return;
    end
    if addon.Diagnostics.DebugEnabled() then
        GameTooltip:AddLine(guid);
    end

    local unitType, _, _, _, unitId = ProcessGuid(guid);
    unitId = tonumber(unitId);
    if unitType ~= "Creature" or not unitId then
        return;
    end

    local unitDatum = addon.Data.TooltipData[unitId];
    if not unitDatum then
        return;
    end

    for _, tooltipLine in next, unitDatum.TooltipLines do
        if tooltipLine.Type == addon.Objects.TooltipDataType.Unit then
            AddTooltipLine(tooltipLine);
        end
    end
end

local function ProcessItem(itemId)
    if not addon.Options.db.Tooltip.Criteria.Show then
        return;
    end

    if not itemId then
        return;
    end
    if addon.Diagnostics.DebugEnabled() then
        GameTooltip:AddLine(itemId);
    end

    itemId = tonumber(itemId);
    if not itemId then
        return;
    end

    local unitDatum = addon.Data.TooltipData[itemId];
    if not unitDatum then
        return;
    end

    for _, tooltipLine in next, unitDatum.TooltipLines do
        if tooltipLine.Type == addon.Objects.TooltipDataType.Item then
            AddTooltipLine(tooltipLine);
        end
    end
end

local function ProcessUnit100000()
    local _, unit = GameTooltip:GetUnit();
    if not unit then
        return;
    end
    local guid = UnitGUID(unit);
    ProcessUnit(guid);
end

local function DoProcessItem(tt, itemId)
    local classId = (select(12, GetItemInfo(itemId)));
    if classId == Enum.ItemClass.Recipe then
        tt.isFirstTime = not tt.isFirstTime;
        return not tt.isFirstTime;
    end
    return true;
end

local function ProcessItem100000()
    local _, link = GameTooltip:GetItem();
    if not link then
        return;
    end
    local itemId = (select(3, strfind(link, "item:(%d+)")));
    itemId = tonumber(itemId);

    if DoProcessItem(GameTooltip, itemId) then
        ProcessItem(itemId);
    end
end

local function ProcessUnit100002(tooltip, localData)
    ProcessUnit(localData.guid);
end

local function ProcessItem100002(tooltip, localData)
    ProcessItem(localData.id);
end

function tooltipData.Load()
    local tocVersion = select(4, GetBuildInfo());
    if tocVersion < 100002 then
        GameTooltip:HookScript("OnTooltipSetUnit", ProcessUnit100000);
        GameTooltip:HookScript("OnTooltipSetItem", ProcessItem100000);
    else
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, ProcessUnit100002);
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ProcessItem100002);
    end

    data.ExportedTooltipData.Load(addon.Data.TooltipData);
end

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