local _, addon = ...
addon.Gui.Guide = {}
local guide = addon.Gui.Guide

-- Renders an achievement's guide (achievement.Guide, built by Api/GuideDataBuilder.lua) for every surface, so a step
-- reads the same in the tooltip and the right-click menu. Names come from the game in the player's language; only an
-- NPC's name and the tip come from the data. Tests/Guide.lua holds this file to its contract.

local criteriaTypeGarrisonTalent = 198
local maxHiddenCriteria = 32 -- a guard for the read loop below; Legendary Research has two

-- The steps a player of the given faction (KrowiAF.Enum.Faction) sees; a step without a faction shows to both
function guide.GetSteps(achievement, faction)
    local steps = {}
    for _, step in ipairs(achievement.Guide or {}) do
        if not step.Faction or step.Faction == faction then
            tinsert(steps, step)
        end
    end
    return steps
end

-- The research state of a garrison talent (C_Garrison.GetTalentInfo): "researched", "researching", "locked", "cost" or
-- "not-yet"; nil for another class's talent, which the game reports as "tier unavailable" rather than "wrong class".
-- A completed criterion wins over the talent's own flag: the player may have swapped to the other talent of the tier.
function guide.GetTalentState(info, isOwnClass, isCriterionCompleted)
    if isCriterionCompleted then
        return "researched"
    end
    if not isOwnClass then
        return nil
    end
    if info.researched then
        return "researched"
    end
    if info.isBeingResearched then
        return "researching"
    end
    local availability = Enum.GarrisonTalentAvailability or {}
    if info.talentAvailability == availability.UnavailableTierUnavailable then
        return "locked"
    end
    if info.talentAvailability == availability.UnavailableNotEnoughResources then
        return "cost"
    end
    return "not-yet"
end

local function GetStateText(state, info)
    if state == "researched" then
        return addon.L["Guide Researched"]
    elseif state == "researching" then
        return addon.L["Guide Researching"]
    elseif state == "locked" then
        return addon.L["Guide Locked"]
    elseif state == "cost" then
        local cost = info.researchCurrencyCosts and info.researchCurrencyCosts[1]
        local currency = cost and C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo(cost.currencyType)
        if currency then
            return addon.L["Guide Needs Cost"]:K_ReplaceVars{amount = BreakUpLargeNumbers(cost.currencyQuantity), currency = currency.name}
        end
    end
    return addon.L["Guide Not Yet"]
end

local function IsOwnClassTree(treeId, classId)
    if not C_Garrison.GetTalentTreeIDsByClassID then
        return false
    end
    for _, id in ipairs(C_Garrison.GetTalentTreeIDsByClassID(Enum.GarrisonType.Type_7_0_Garrison, classId) or {}) do
        if id == treeId then
            return true
        end
    end
    return false
end

-- Legendary Research hides its criteria (GetAchievementNumCriteria returns 0), so they are read with countHidden. One
-- index past the last raises "criteria not found" instead of returning nil, so each read is guarded and the first
-- error ends the list.
local function AddCriteriaLines(lines, achievement, classId)
    if not C_Garrison or not C_Garrison.GetTalentInfo then
        return
    end
    for i = 1, maxHiddenCriteria do
        local ok, _, criteriaType, completed, _, _, _, _, assetId = pcall(GetAchievementCriteriaInfo, achievement.Id, i, true)
        if not ok or criteriaType == nil then
            return
        end
        local info = criteriaType == criteriaTypeGarrisonTalent and C_Garrison.GetTalentInfo(assetId)
        if info then
            local state = guide.GetTalentState(info, IsOwnClassTree(info.treeID, classId), completed)
            local text = info.name
            if state then
                text = addon.L["Guide Talent State"]:K_ReplaceVars{talent = info.name, state = GetStateText(state, info)}
            end
            tinsert(lines, {Kind = "Criteria", Text = text, State = state})
        end
    end
end

local function GetMapName(mapId)
    local info = C_Map.GetMapInfo(mapId)
    return info and info.name or tostring(mapId)
end

-- Percent, as /way and the world map's coordinates show them, so a player can follow a step without any waypoint
local function WithCoordinates(text, step)
    return ("%s (%.1f, %.1f)"):format(text, step.X, step.Y)
end

local function GetSpellName(spellId)
    if C_Spell and C_Spell.GetSpellName then
        return C_Spell.GetSpellName(spellId)
    end
end

-- One line per step the player sees: {Kind, Text, State, Waypoint}, where Waypoint is {MapId, X, Y, PoiId, Title}
function guide.GetLines(achievement)
    local lines = {}
    local _, _, classId = UnitClass("player")
    local faction = KrowiAF.Enum.Faction[(UnitFactionGroup("player"))] -- nil for a neutral Pandaren: steps with a faction stay hidden
    for _, step in ipairs(guide.GetSteps(achievement, faction)) do
        if step.Type == "Travel" then
            local spellName = GetSpellName(step.SpellId) or tostring(step.SpellId)
            tinsert(lines, {Kind = "Travel", Text = addon.L["Guide Travel"]:K_ReplaceVars{spell = spellName}})
        elseif step.Type == "Npc" then
            local text = addon.L["Guide Talk To"]:K_ReplaceVars{npc = step.Name, map = GetMapName(step.MapId)}
            tinsert(lines, {Kind = "Npc", Text = WithCoordinates(text, step),
                Waypoint = {MapId = step.MapId, X = step.X, Y = step.Y, Title = step.Name}})
        elseif step.Type == "Poi" then
            -- Another class does not see a class portal's POI; the step then names the map only
            local info = C_AreaPoiInfo and C_AreaPoiInfo.GetAreaPOIInfo(step.MapId, step.PoiId)
            local mapName = GetMapName(step.MapId)
            local text = info and addon.L["Guide Go To"]:K_ReplaceVars{poi = info.name, map = mapName}
                or addon.L["Guide Go To Spot"]:K_ReplaceVars{map = mapName}
            tinsert(lines, {Kind = "Poi", Text = WithCoordinates(text, step),
                Waypoint = {MapId = step.MapId, X = step.X, Y = step.Y, PoiId = step.PoiId, Title = info and info.name or mapName}})
        elseif step.Type == "Criteria" then
            AddCriteriaLines(lines, achievement, classId)
        elseif step.Type == "Tip" then
            tinsert(lines, {Kind = "Tip", Text = step.Text})
        end
    end
    return lines
end