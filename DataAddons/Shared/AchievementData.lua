local _, addon = ...;
addon.Data.AchievementData = {};
addon.Data.AchievementData.Shared = {};
local shared = addon.Data.AchievementData.Shared;
local rewardType = KrowiAF.Enum.RewardType;

function shared.Ach(id, ...)
    if select("#", ...) == 0 then
        return {id}
    end
    return {id, {...}}
end

function shared.PvE(season)
    return {"PvE Season", season}
end

function shared.PvP(season)
    return {"PvP Season", season}
end

function shared.Reward(reward)
    return {RewardType = reward}
end

for key, value in pairs(rewardType) do
    shared[key] = function()
        return {RewardType = value}
    end
end