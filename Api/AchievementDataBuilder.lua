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

function KrowiAF.Ach(id)
    return setmetatable({KrowiAF.AddAchievementData, id}, AchBuilder)
end

-- Special obtainable helpers
function AchBuilder:Anniv20()
    return self:Obtainable("From", "Date", {2024, 11, 4}, "Until", "Date", {2025, 1, 7})
end
