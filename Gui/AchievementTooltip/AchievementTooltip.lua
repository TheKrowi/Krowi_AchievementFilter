local _, addon = ...;
addon.Gui.AchievementTooltip = {
	Sections = {}
};
local tooltip = addon.Gui.AchievementTooltip;

local function GetAchievementIconAndColor(completed, state, sameAchievement)
	local icon, color;
	if completed then
		icon = "|T136814:0|t";
		color = sameAchievement and addon.Util.Colors.LightGreenRGB or addon.Util.Colors.GreenRGB;
	elseif state == "Past" then
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
	elseif state == "Past" then
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
	local state = currentAchievement:GetObtainableState();
	local icon, color = GetAchievementIconAndColor(completed, state, sameAchievement);
	local currentCharacterIcon = GetCurrentCharacterIcon(showCurrentCharacterIcons, wasEarnedByMe, state)

	GameTooltip:AddLine(icon .. "|T:1:8|t" .. currentCharacterIcon .. name .. nameSuffix, color.R, color.G, color.B); -- Achievement name
end

local function GetCriteriaElements(achievementData, criteriaIndex)
	local criteriaString, completed, quantity, reqQuantity;
	if type(achievementData) == "table" then
		criteriaString, completed, quantity, reqQuantity = unpack(achievementData[criteriaIndex]);
	else
		criteriaString, _, completed, quantity, reqQuantity = GetAchievementCriteriaInfo(achievementData, criteriaIndex);
	end
	return criteriaString, completed, quantity, reqQuantity;
end

local function GetCriteriaIconAndColor(completed)
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

local function GetCriteriaTextAndColor(achievementId, achievementData, criteriaIndex)
	local criteriaString, completed, quantity, reqQuantity = GetCriteriaElements(achievementData, criteriaIndex);

	local text = criteriaString;
	if reqQuantity > 1 or (criteriaString == "" and reqQuantity == 1) then
		if (not criteriaString or criteriaString == "") then
			text = select(8, addon.GetAchievementInfo(achievementId));
			if not completed then
				text = tostring(quantity) .. "/" .. tostring(reqQuantity) .. " " .. text;
			end
		elseif criteriaString and criteriaString ~= "" and not completed then
			text = text .. (text ~= "" and " " or "") .. (text ~= "" and "(" or "") .. tostring(quantity) .. "/" .. tostring(reqQuantity) .. (text ~= "" and ")" or "");
		end
	end

	local icon, color = GetCriteriaIconAndColor(completed);
	if icon then
		text = icon .. "|T:1:8|t" .. (text or "");
	end

	return text or "", color or addon.Util.Colors.WhiteRGB;
end

local function AddCriteriaLine(achievementId, achievementData, criteriaIndex)
	local text, color = GetCriteriaTextAndColor(achievementId, achievementData, criteriaIndex);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
end

local function AddDoubleCriteriaLine(achievementId, achievementData, criteriaIndex1, criteriaIndex2)
	local texts = {"", ""};
	local colors = {addon.Util.Colors.WhiteRGB, addon.Util.Colors.WhiteRGB};
	for i, criteriaIndex in next, {criteriaIndex1, criteriaIndex2} do
		texts[i], colors[i] = GetCriteriaTextAndColor(achievementId, achievementData, criteriaIndex);
	end
	GameTooltip:AddDoubleLine(texts[1], texts[2], colors[1].R, colors[1].G, colors[1].B, colors[2].R, colors[2].G, colors[2].B);
end

function tooltip:AddCriteria(achievementId, achievementData, numCriteria)
	if numCriteria < addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
		for i = 1, numCriteria do
			AddCriteriaLine(achievementId, achievementData, i);
		end
		return;
	end
	for i = 1, numCriteria, 2 do
		AddDoubleCriteriaLine(achievementId, achievementData, i, i + 1 <= numCriteria and i + 1 or nil);
	end
end

function tooltip:ShowTooltip(anchor, achievement)
	GameTooltip:SetOwner(anchor, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", anchor, "TOPRIGHT");

	for _, sect in next, self.Sections do
		if sect:CheckAdd(achievement) then
			if GameTooltip:NumLines() > 0 then
				GameTooltip_AddBlankLineToTooltip(GameTooltip);
			end
			sect:Add(achievement);
		end
	end

	-- if addon.Diagnostics.DebugEnabled() then
	-- 	GameTooltip_AddBlankLineToTooltip(GameTooltip);
	-- 	GameTooltip:AddDoubleLine("", achievement.Id);
	-- 	GameTooltip_AddBlankLineToTooltip(GameTooltip);
	-- end

	GameTooltip:Show();
end