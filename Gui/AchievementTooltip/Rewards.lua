local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

function section:CheckAdd(achievement)
	if not addon.Options.db.profile.Tooltip.Achievements.ShowRewards or achievement.IsTracking or not achievement.RewardType then
		return
	end
    return true
end

local getTypeName
function section:Add(achievement)
	GameTooltip:AddLine(addon.L["Rewards"]) -- Header
    local rewardType = achievement.RewardType
    if rewardType then
        if not addon.Util.IsTable(rewardType) then
            rewardType = {rewardType}
        end

        if not getTypeName then
            getTypeName = EnumUtil.GenerateNameTranslation(KrowiAF.Enum.RewardType)
        end

        for _, rType in next, rewardType do
            GameTooltip:AddLine(addon.L[getTypeName(rType)], 1, 1, 1)
        end
    end
end