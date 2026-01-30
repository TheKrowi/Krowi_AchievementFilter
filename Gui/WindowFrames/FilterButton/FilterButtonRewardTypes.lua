local _, addon = ...

addon.FilterButtonRewardTypes = addon.FilterButtonRewardTypes or {}
local rewardTypes = addon.FilterButtonRewardTypes

local rewardTypeSpecialCases = {
    [KrowiAF.Enum.RewardType.Other] = true,
    [KrowiAF.Enum.RewardType.RemixBronze] = true,
    [KrowiAF.Enum.RewardType.RemixInfiniteKnowledge] = true,
    [KrowiAF.Enum.RewardType.NotCategorized] = true
}

local cachedRewardItems

local function BuildRewardTypeMenuItems()
    local items = {}

    for rewardTypeName, rewardType in next, KrowiAF.Enum.RewardType do
        if type(rewardType) == "number" and not rewardTypeSpecialCases[rewardType] then
            local label = addon.L[rewardTypeName]
            if label == true or label == nil then
                label = rewardTypeName
            end
            table.insert(items, {label = label, keys = {"RewardType", rewardType}})
        end
    end

    table.sort(items, function(left, right)
        return string.lower(left.label) < string.lower(right.label)
    end)

    return items
end

function rewardTypes.BuildRewardItems()
    if cachedRewardItems then
        return cachedRewardItems
    end

    local items = {
        {label = addon.L["Yes"], keys = {"HasReward", "Yes"}},
        {label = addon.L["No"], keys = {"HasReward", "No"}},
        {divider = true}
    }

    addon.Util.ConcatTables(items, BuildRewardTypeMenuItems())

    addon.Util.ConcatTables(items, {
        {label = addon.L["Other"], keys = {"RewardType", KrowiAF.Enum.RewardType.Other}},
        {divider = true},
        {label = addon.L["RemixBronze"], keys = {"RewardType", KrowiAF.Enum.RewardType.RemixBronze}},
        {label = addon.L["RemixInfiniteKnowledge"], keys = {"RewardType", KrowiAF.Enum.RewardType.RemixInfiniteKnowledge}},
        {divider = true},
        {label = addon.L["NotCategorized"], keys = {"RewardType", KrowiAF.Enum.RewardType.NotCategorized}},
        {divider = true},
        {selectAll = true}
    })

    cachedRewardItems = items
    return cachedRewardItems
end

function rewardTypes.SetRewardsFilters(owner, filters, value)
    owner:SetSelected(filters, {"HasReward", "Yes"}, value, true, true)
    owner:SetSelected(filters, {"HasReward", "No"}, value, true, true)
    for rewardType, _ in next, filters.RewardType do
        owner:SetSelected(filters, {"RewardType", rewardType}, value, true, true)
    end
    owner:UpdateAchievementFrame()
end

function rewardTypes.CreateRewardMenu(owner, menu, filters)
    local mb = owner.menuBuilder
    local reward = mb:CreateSubmenuButton(menu, addon.L["Has Reward"])
    local rewardItems = rewardTypes.BuildRewardItems()

    for _, item in ipairs(rewardItems) do
        if item.divider then
            mb:CreateDivider(reward)
        elseif item.selectAll then
            mb:CreateSelectDeselectAllButtons(reward, nil, nil, function(_, _, _, value)
                rewardTypes.SetRewardsFilters(owner, filters, value)
            end)
        else
            mb:CreateCheckbox(reward, item.label, filters, item.keys, true)
        end
    end

    mb:AddChildMenu(menu, reward)
end
