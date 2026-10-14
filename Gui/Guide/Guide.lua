local _, addon = ...
addon.Gui.Guide = {}
local guide = addon.Gui.Guide

-- Renders an achievement's guide (achievement.Guide, built by Api/GuideDataBuilder.lua) for every surface, so a step
-- reads the same in the tooltip and the right-click menu. Names come from the game in the player's language, an NPC's
-- too (the data's English name stands in while the client has none, and a name the client gave is kept for the
-- session); only the tip comes from the data. Tests/Guide.lua holds this file to its contract.

guide.DetailSeparator = " \194\183 " -- a middle dot between the parts of a detail line

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

-- Order hall tiers are shown as roman numerals in every locale
local tierNames = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"}
local function GetTierName(tier) -- tier is the 0-based index C_Garrison returns
    return tierNames[tier + 1] or tostring(tier + 1)
end

-- "a or b", "a, b or c"; "and" for criteria that are all needed
local function JoinNames(names, isAny)
    if #names == 1 then
        return names[1]
    end
    local word = addon.L[isAny and "Guide Or" or "Guide And"]
    return table.concat(names, ", ", 1, #names - 1) .. " " .. word .. " " .. names[#names]
end

-- The talent's state in brackets after the step: done, being researched, the cost still missing, or else (not yet, or
-- locked behind the tiers step) what it will take
local function GetStateText(state, info)
    if state == "researched" then
        return addon.L["Guide Done"]
    elseif state == "researching" then
        return addon.L["Guide Researching Talent"]:K_ReplaceVars{talent = info.name}
    end
    local cost = info.researchCurrencyCosts and info.researchCurrencyCosts[1]
    local currency = cost and C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo(cost.currencyType)
    if not currency then
        return nil
    end
    local amount = BreakUpLargeNumbers(cost.currencyQuantity)
    if state == "cost" then
        return addon.L["Guide Needs Cost"]:K_ReplaceVars{amount = amount, currency = currency.name}
    end
    local time = info.researchDuration and info.researchDuration > 0 and SecondsToTime(info.researchDuration) or nil
    if not time then
        return ("%s %s"):format(amount, currency.name)
    end
    return addon.L["Guide Cost And Time"]:K_ReplaceVars{amount = amount, currency = currency.name, time = time}
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

-- The first tier below the target tier with no talent researched, and whether it is being researched; nil when every
-- tier below is done. Tiers are researched in order, so everything from that tier up to the target is still to do.
local function GetFirstMissingTier(treeId, targetTier)
    local treeInfo = C_Garrison.GetTalentTreeInfo and C_Garrison.GetTalentTreeInfo(treeId)
    if not treeInfo then
        return
    end
    local researched, researching = {}, {}
    for _, talent in ipairs(treeInfo.talents or {}) do
        if talent.researched then
            researched[talent.tier] = true
        end
        if talent.isBeingResearched then
            researching[talent.tier] = true
        end
    end
    for tier = 0, targetTier - 1 do
        if not researched[tier] then
            return tier, researching[tier]
        end
    end
end

-- The garrison talents the achievement's criteria ask for (type 198) and whether each criterion is done. Legendary
-- Research hides its criteria (GetAchievementNumCriteria returns 0), so they are read with countHidden. One index past
-- the last raises "criteria not found" instead of returning nil, so each read is guarded and the first error ends it.
local function GetCriteriaTalents(achievementId)
    local talents = {}
    for i = 1, maxHiddenCriteria do
        local ok, _, criteriaType, completed, _, _, _, _, assetId = pcall(GetAchievementCriteriaInfo, achievementId, i, true)
        if not ok or criteriaType == nil then
            break
        end
        local info = criteriaType == criteriaTypeGarrisonTalent and C_Garrison.GetTalentInfo(assetId)
        if info then
            tinsert(talents, {Info = info, Completed = completed})
        end
    end
    return talents
end

-- The research as what is left to do: the tiers still missing below the target tier (own class only), then the target
-- talents with what stands in their way. step.Operator "Any" means one criterion completes the achievement.
local function AddResearchLines(lines, achievement, classId, step)
    if not C_Garrison or not C_Garrison.GetTalentInfo then
        return
    end
    local talents = GetCriteriaTalents(achievement.Id)
    if #talents == 0 then
        return
    end
    local isAny = step.Operator == "Any"
    local numCompleted, names = 0, {}
    for _, talent in ipairs(talents) do
        numCompleted = numCompleted + (talent.Completed and 1 or 0)
        tinsert(names, talent.Info.name)
    end
    local target = talents[1].Info -- a tier's talents share their tier, cost and lock
    -- The game's completion, not achievement.IsCompleted: that is the list's display cache, unset until a row is drawn and
    -- following the EarnedBy filter
    local _, _, _, isCompleted = GetAchievementInfo(achievement.Id)
    local isDone = isCompleted or (isAny and numCompleted > 0) or numCompleted == #talents
    local isOwnClass = IsOwnClassTree(target.treeID, classId)

    if isOwnClass and not isDone then
        local missing, isResearching = GetFirstMissingTier(target.treeID, target.tier)
        if missing then
            local text = missing == target.tier - 1 and addon.L["Guide Research Tier"]:K_ReplaceVars{tier = GetTierName(missing)}
                or addon.L["Guide Research Tiers"]:K_ReplaceVars{from = GetTierName(missing), to = GetTierName(target.tier - 1)}
            local details = isResearching and {addon.L["Guide Tier Researching"]:K_ReplaceVars{tier = GetTierName(missing)}} or nil
            tinsert(lines, {Kind = "Tiers", Text = text, Details = details})
        end
    end

    local text = addon.L[isAny and "Guide Research Any" or "Guide Research All"]:K_ReplaceVars{tier = GetTierName(target.tier)}
    local details = {JoinNames(names, isAny)}
    local state, stateInfo
    if isDone then
        state, stateInfo = "researched", target
    elseif isOwnClass then
        for _, talent in ipairs(talents) do
            if talent.Info.isBeingResearched then
                state, stateInfo = "researching", talent.Info
            end
        end
        if not state then
            state, stateInfo = guide.GetTalentState(target, true, false), target
        end
    end
    local stateText = state and GetStateText(state, stateInfo)
    if stateText then
        tinsert(details, stateText)
    end
    tinsert(lines, {Kind = "Criteria", Text = text, Details = details, State = state})
end

local function GetMapName(mapId)
    local info = C_Map.GetMapInfo(mapId)
    return info and info.name or tostring(mapId)
end

-- The detail under a step that names a place: the map and the coordinates in percent, as /way and the world map show
-- them, so a player can follow the step without any waypoint
local function GetPlace(step)
    return ("%s%s%.1f, %.1f"):format(GetMapName(step.MapId), guide.DetailSeparator, step.X, step.Y)
end

local function GetSpellName(spellId)
    if C_Spell and C_Spell.GetSpellName then
        return C_Spell.GetSpellName(spellId)
    end
end

-- Whether a value is a table this code may index: indexing a secret table raises an error
local function CanIndex(value)
    return type(value) == "table" and (not canaccesstable or canaccesstable(value))
end

-- An NPC's name as the player's client has it, in its language, from its creature cache through a unit link. Nil while
-- the client has not cached the NPC (the call queries the server and the answer is cached a moment later), for an NPC
-- the game does not know, for a secret table or value, and on a client without C_TooltipInfo
local function GetCreatureName(npcId)
    if not C_TooltipInfo or not C_TooltipInfo.GetHyperlink then
        return
    end
    local data = C_TooltipInfo.GetHyperlink(("unit:Creature-0-0-0-0-%d-0000000000"):format(npcId))
    if not CanIndex(data) or not CanIndex(data.lines) or not CanIndex(data.lines[1]) then
        return
    end
    local name = data.lines[1].leftText
    -- type() is safe on a secret value; comparing or showing one raises an error
    if type(name) ~= "string" or canaccessvalue and not canaccessvalue(name) or name == "" then
        return
    end
    return name
end

-- The names the client has given, by NPC id, kept for the session: a later read can come back empty or as a secret
-- value (an encounter), and the expanded row's cache key reads them on every list update (Content.lua)
local npcNames = {}

-- The data's name is the English one
local function GetNpcName(step)
    local name = npcNames[step.NpcId] or GetCreatureName(step.NpcId)
    if name then
        npcNames[step.NpcId] = name
    end
    return name or step.Name
end

-- The names the achievement's NPC steps show, joined: part of the expanded row's cache key, so a name the client
-- learns after the row was drawn makes it render again
function guide.GetNpcNames(achievement)
    local names = {}
    for _, step in ipairs(achievement.Guide or {}) do
        if step.Type == "Npc" then
            tinsert(names, GetNpcName(step))
        end
    end
    return table.concat(names, ",")
end

-- Asks the client once for the name of every NPC the achievements' guides send the player to, so the name is in its
-- creature cache before a guide shows (Data/Data.lua, at login). Returns the NPC ids, sorted.
function guide.RequestNpcNames(achievements)
    local ids, asked = {}, {}
    for _, achievement in next, achievements do
        if achievement.Guide then
            for _, step in ipairs(achievement.Guide) do
                if step.Type == "Npc" and not asked[step.NpcId] then
                    asked[step.NpcId] = true
                    npcNames[step.NpcId] = GetCreatureName(step.NpcId) or npcNames[step.NpcId] -- always asks the client
                    tinsert(ids, step.NpcId)
                end
            end
        end
    end
    table.sort(ids)
    return ids
end

-- One line per step the player sees, in order: {Kind, Number, Text, Details, State, Waypoint}. Text is the step's short
-- headline, Details the smaller lines under it (place, talents, cost), Waypoint {MapId, X, Y, PoiId, Title}. Each
-- surface lays out the number, headline and details itself. A research step can give two lines: the tiers still
-- missing, then the target talents.
function guide.GetLines(achievement)
    local lines = {}
    local _, _, classId = UnitClass("player")
    local faction = KrowiAF.Enum.Faction[(UnitFactionGroup("player"))] -- nil for a neutral Pandaren: steps with a faction stay hidden
    for _, step in ipairs(guide.GetSteps(achievement, faction)) do
        if step.Type == "Travel" then
            local spellName = GetSpellName(step.SpellId) or tostring(step.SpellId)
            tinsert(lines, {Kind = "Travel", Text = addon.L["Guide Travel"]:K_ReplaceVars{spell = spellName}})
        elseif step.Type == "Npc" then
            local npcName = GetNpcName(step)
            tinsert(lines, {Kind = "Npc", Text = addon.L["Guide Talk To"]:K_ReplaceVars{npc = npcName}, Details = {GetPlace(step)},
                Waypoint = {MapId = step.MapId, X = step.X, Y = step.Y, Title = npcName}})
        elseif step.Type == "Poi" then
            -- Another class does not see a class portal's POI; the step then names the map only
            local info = C_AreaPoiInfo and C_AreaPoiInfo.GetAreaPOIInfo(step.MapId, step.PoiId)
            local text = info and addon.L["Guide Go To"]:K_ReplaceVars{poi = info.name} or addon.L["Guide Go To Spot"]
            tinsert(lines, {Kind = "Poi", Text = text, Details = {GetPlace(step)},
                Waypoint = {MapId = step.MapId, X = step.X, Y = step.Y, PoiId = step.PoiId, Title = info and info.name or GetMapName(step.MapId)}})
        elseif step.Type == "Criteria" then
            AddResearchLines(lines, achievement, classId, step)
        elseif step.Type == "Tip" then
            tinsert(lines, {Kind = "Tip", Text = step.Text})
        end
    end
    for i, line in ipairs(lines) do
        line.Number = i
    end
    return lines
end