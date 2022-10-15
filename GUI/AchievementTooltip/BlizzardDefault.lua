-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return true;
end

function section.Add(achievement)
	if achievement.IsAccountWide then
		if achievement.IsCompleted then
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED);
		else
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT);
		end
		return;
	end

	local earnedBy, notEarnedBy, _, earnedByThisCharacter = addon.GUI.AchievementTooltip.EvaluateCharacters(achievement);
	if earnedBy ~= "" then
		GameTooltip:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy), nil, nil, nil, true);
	end
	if notEarnedBy ~= "" and (addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter ~= earnedByThisCharacter) then
		GameTooltip:AddLine(format(addon.L["Not earned by:"], notEarnedBy), nil, nil, nil, true);
	end
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);