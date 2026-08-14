local rewardType = KrowiAF.Enum.RewardType

local AchBuilder = {}
AchBuilder.__index = AchBuilder

local function GetExtras(self)
    if not self[3] then self[3] = {} end
    return self[3]
end

function AchBuilder:PvE(season)
    tinsert(GetExtras(self), {"PvE Season", season})
    return self
end

function AchBuilder:PvP(season)
    local e = GetExtras(self)
    e.IsPvP = true
    tinsert(e, {"PvP Season", season})
    return self
end

function AchBuilder:IsPvP()
    GetExtras(self).IsPvP = true
    return self
end

function AchBuilder:IsRealmFirst()
    local e = GetExtras(self)
    e.IsRealmFirst = true
    tinsert(e, {"Once"})
    return self
end

function AchBuilder:FactionSplit(f, altId)
    local e = GetExtras(self)
    e.Faction = f
    e.AltId = altId
    return self
end

function AchBuilder:AutoFactionSplit(f, altId)
    local e = GetExtras(self)
    e.Faction = f
    e.AltId = altId
    e.AutoPair = true
    return self
end

function AchBuilder:Obtainable(...)
    tinsert(GetExtras(self), {...})
    return self
end

for key, value in pairs(rewardType) do
    assert(AchBuilder[key] == nil, "RewardType key '" .. key .. "' conflicts with an existing AchBuilder method")
    AchBuilder[key] = function(self)
        local e = GetExtras(self)
        local rt = e.RewardType
        if rt == nil then
            e.RewardType = {value}
        else
            tinsert(rt, value)
        end
        return self
    end
end

-- Overrides the generic reward type method above to also accept previewable decor item id(s)
function AchBuilder:HousingDecor(...)
    local e = GetExtras(self)
    local rt = e.RewardType
    if rt == nil then
        e.RewardType = {rewardType.HousingDecor}
    else
        tinsert(rt, rewardType.HousingDecor)
    end
    if select("#", ...) > 1 then
        e.HousingDecorId = {...}
    else
        e.HousingDecorId = ...
    end
    return self
end

-- Overrides the generic reward type method above to also accept preview mount id(s) (found via the reward mount's own DBC record)
-- Multiple ids are used for faction-specific mount rewards (e.g. Alliance/Horde variants of the same achievement)
function AchBuilder:Mount(...)
    local e = GetExtras(self)
    local rt = e.RewardType
    if rt == nil then
        e.RewardType = {rewardType.Mount}
    else
        tinsert(rt, rewardType.Mount)
    end
    if select("#", ...) > 1 then
        e.MountId = {...}
    else
        e.MountId = ...
    end
    return self
end

-- Overrides the generic reward type method above to also accept preview battle pet species id(s) (found via the reward creature's battlepetspecies record)
function AchBuilder:Pet(...)
    local e = GetExtras(self)
    local rt = e.RewardType
    if rt == nil then
        e.RewardType = {rewardType.Pet}
    else
        tinsert(rt, rewardType.Pet)
    end
    if select("#", ...) > 1 then
        e.PetSpeciesId = {...}
    else
        e.PetSpeciesId = ...
    end
    return self
end

-- Registers a raw CreatureDisplayID for reward preview when no dedicated Mount/Pet/HousingDecor API applies (e.g. a Barbershop customization-unlock item). The preview name is resolved from the shapeshift/customization spell id at display time. Does not tag RewardType — combine with another reward-type method (e.g. :Other()) as needed.
function AchBuilder:CreatureDisplay(displayId, spellId)
    local e = GetExtras(self)
    e.CreatureDisplayId = e.CreatureDisplayId or {}
    tinsert(e.CreatureDisplayId, {Id = displayId, SpellId = spellId})
    return self
end

function KrowiAF.Ach(id)
    return setmetatable({KrowiAF.AddAchievementData, id}, AchBuilder)
end

-- Special obtainable helpers
function AchBuilder:Anniv20()
    return self:Obtainable("From", "Date", {2024, 11, 4}, "Until", "Date", {2025, 1, 7})
end
