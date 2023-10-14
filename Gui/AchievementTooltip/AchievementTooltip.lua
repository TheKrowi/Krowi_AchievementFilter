local _, addon = ...;
addon.Gui.AchievementTooltip = {};
local tooltip = addon.Gui.AchievementTooltip;
tooltip.Sections = {};
local sections = tooltip.Sections;

local function GetAchievementIconAndColor(completed, state, sameAchievement)
	local icon, color;
	if completed then
		icon = "|T136814:0|t";
		color = sameAchievement and addon.Util.Colors.LightGreenRGB or addon.Util.Colors.GreenRGB;
	elseif state and (not state or state == "Past") then
		icon = "|T136813:0|t";
		color = sameAchievement and addon.Util.Colors.LightRedRGB or addon.Util.Colors.RedRGB;
	else
		icon = "|T136815:0|t";
		color = sameAchievement and addon.Util.Colors.LightGreyRGB or addon.Util.Colors.GreyRGB;
	end
	return icon, color;
end

local function GetCurrentCharacterIcon(showCurrentCharacterIcons, wasEarnedByMe, state)
	if not showCurrentCharacterIcons then
		return "";
	end

	local currentCharacterIcon
	if wasEarnedByMe then
		currentCharacterIcon = "|T136814:0|t";
	elseif state and (not state or state == "Past") then
		currentCharacterIcon = "|T136813:0|t";
	else
		currentCharacterIcon = "|T136815:0|t";
	end
	return currentCharacterIcon .. "|T:1:8|t";
end

function tooltip:AddAchievementLine(currentAchievement, otherAchievementId, showCurrentCharacterIcons, nameSuffix, otherFactionAchievementCompleted)
	nameSuffix = nameSuffix or "";
	local _, name, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(otherAchievementId);
	completed = otherFactionAchievementCompleted or completed;

	local sameAchievement = otherAchievementId == currentAchievement.Id;
	local state;
	if currentAchievement.TemporaryObtainable then
		state = currentAchievement.TemporaryObtainable.Obtainable();
	end
	local icon, color = GetAchievementIconAndColor(completed, state, sameAchievement);
	local currentCharacterIcon = GetCurrentCharacterIcon(showCurrentCharacterIcons, wasEarnedByMe, state)

	GameTooltip:AddLine(icon .. "|T:1:8|t" .. currentCharacterIcon .. name .. nameSuffix, color.R, color.G, color.B); -- Achievement name
end

local function GetCriteriaElements(achievementId, criteriaIndex)
	local criteriaString, completed, quantity, reqQuantity, hasValueProgress;
	if type(achievementId) == "table" then
		criteriaString, completed, quantity, reqQuantity, hasValueProgress = unpack(achievementId[criteriaIndex]);
	else
		criteriaString, _, completed, quantity, reqQuantity, _, _, _, _, _, _, hasValueProgress = addon.GetAchievementCriteriaInfo(achievementId, criteriaIndex);
	end
	return criteriaString, completed, quantity, reqQuantity, hasValueProgress;
end

local function GetCriteriaIconAndColor(criteriaString, hasValueProgress, completed)
	if criteriaString == "" and not hasValueProgress then
		return;
	end
	local icon, color;
	if completed then
		icon = "|T136814:0|t";
		color = addon.Util.Colors.GreenRGB;
	else
		icon = "|T136815:0|t";
		color = addon.Util.Colors.GreyRGB;
	end
	return icon, color;
end

local function GetCriteriaTextAndColor(achievementId, criteriaIndex)
	local criteriaString, completed, quantity, reqQuantity, hasValueProgress = GetCriteriaElements(achievementId, criteriaIndex);
	local icon, color = GetCriteriaIconAndColor(criteriaString, hasValueProgress, completed);
	local text = criteriaString;
	if not completed and hasValueProgress then
		text = text .. (text ~= "" and " " or "") .. (text ~= "" and "(" or "") .. tostring(quantity) .. "/" .. tostring(reqQuantity) .. (text ~= "" and ")" or "");
	end
	if icon then
		text = icon .. "|T:1:8|t" .. (text or "");
	end

	return text or "", color or addon.Util.Colors.WhiteRGB;
end

function tooltip:AddCriteriaLine(achievementId, criteriaIndex)
	local text, color = GetCriteriaTextAndColor(achievementId, criteriaIndex);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
end

function tooltip:AddDoubleCriteriaLine(achievementId, criteriaIndex1, criteriaIndex2)
	local texts = {"", ""};
	local colors = {addon.Util.Colors.WhiteRGB, addon.Util.Colors.WhiteRGB};
	for i, criteriaIndex in next, {criteriaIndex1, criteriaIndex2} do
		texts[i], colors[i] = GetCriteriaTextAndColor(achievementId, criteriaIndex);
	end
	GameTooltip:AddDoubleLine(texts[1], texts[2], colors[1].R, colors[1].G, colors[1].B, colors[2].R, colors[2].G, colors[2].B);
end

function tooltip:AddCriteria(numCriteria, achievementId)
	if numCriteria < addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
		for i = 1, numCriteria do
			self:AddCriteriaLine(achievementId, i);
		end
		return;
	end
	for i = 1, numCriteria, 2 do
		self:AddDoubleCriteriaLine(achievementId, i, i + 1 <= numCriteria and i + 1 or nil);
	end
end

function tooltip:ShowTooltip(anchor, achievement)
	GameTooltip:SetOwner(anchor, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", anchor, "TOPRIGHT");

	for _, sect in next, sections do
		if sect.CheckAdd(achievement) then
			if GameTooltip:NumLines() > 0 then
				GameTooltip_AddBlankLineToTooltip(GameTooltip);
			end
			sect.Add(achievement);
		end
	end

	GameTooltip:Show();
end