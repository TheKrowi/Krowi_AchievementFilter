local _, addon = ...;
addon.Data.AchievementData = {};
addon.Data.AchievementData.Shared = {};
local shared = addon.Data.AchievementData.Shared;
local rewardType = KrowiAF.Enum.RewardType;

-- ============================================================
-- AchBuilder: fluent builder for V2 data entries
-- Usage: Ach(id):PvE(13):Title()
-- ============================================================
local AchBuilder = {}
AchBuilder.__index = AchBuilder

local function GetExtras(self)
    if not self[2] then self[2] = {} end
    return self[2]
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
    GetExtras(self).IsRealmFirst = true
    return self
end

function AchBuilder:FactionSplit(f, altId)
    local e = GetExtras(self)
    e.Faction = f
    e.AltId = altId
    return self
end

function AchBuilder:Obtainable(...)
    tinsert(GetExtras(self), {...})
    return self
end

for key, value in pairs(rewardType) do
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

function shared.Ach(id)
    return setmetatable({id}, AchBuilder)
end