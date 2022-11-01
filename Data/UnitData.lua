-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
addon.UnitData = {};
local unitData = addon.UnitData;
addon.Data.UnitData = {};

local function ProcessGuid(guid)
    local unitType, _, serverId, instanceId, zoneUid, id, spawnUid = strsplit("-", guid);
    return unitType, serverId, instanceId, zoneUid, id, spawnUid;
end

local function ProcessUnit()
    if not addon.Options.db.Tooltip.Units.ShowCriteria then
        return;
    end

    local _, unit = GameTooltip:GetUnit();
    local guid = UnitGUID(unit);
    local unitType, _, _, _, id = ProcessGuid(guid);
    if unitType ~= "Creature" then
        return;
    end
    local unitDatum = addon.Data.UnitData[id];
    if not unitDatum then
        return;
    end
    local _, name, _, achievementIsCompleted, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(unitDatum.AchievementId);
    if not name then -- Achievement does not exist
        return;
    end

    local show = false;
    if not wasEarnedByMe and addon.Options.db.Tooltip.Units.ShowCriteriaIf.AchievementWasNotEarnedByMe then
        show = true;
    end

    if achievementIsCompleted and addon.Options.db.Tooltip.Units.ShowCriteriaIf.AchievementIsCompleted then
        show = true;
    end

    if not show then
        return;
    end

    local _, _, criteriaIsCompleted = GetAchievementCriteriaInfo(unitDatum.AchievementId, unitDatum.CriteriaIndex);

    if criteriaIsCompleted and not addon.Options.db.Tooltip.Units.ShowCriteriaIf.CriteriaIsCompleted then
        return;
    end

    if criteriaIsCompleted then
        local color = addon.Colors.GreenRGB;
        GameTooltip:AddLine("|T136814:0|t " .. unitDatum.CompletedText:ReplaceVars{
            achievement = name
        }, color.R, color.G, color.B);
    else
        local color = addon.Colors.RedRGB;
        GameTooltip:AddLine("|T136813:0|t " .. unitDatum.NotCompletedText:ReplaceVars{
            achievement = name
        }, color.R, color.G, color.B);
    end
end

function unitData.Load()
    GameTooltip:HookScript("OnTooltipSetUnit", ProcessUnit);

    data.ExportedUnitData.Load(addon.Data.UnitData);
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