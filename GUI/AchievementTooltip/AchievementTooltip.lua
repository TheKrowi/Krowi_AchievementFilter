-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementTooltip = {};
local tooltip = addon.GUI.AchievementTooltip;
tooltip.Sections = {};
local sections = tooltip.Sections;

function tooltip.AddAchievementLine(currentAchievement, otherAchievementId, showCurrentCharacterIcons, nameSuffix, otherFactionAchievementCompleted)
	nameSuffix = nameSuffix or "";
	local _, name, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(otherAchievementId);
	completed = otherFactionAchievementCompleted or completed;
	local icon, currentCharacterIcon, color = nil, "", nil;

	local sameAchievement = otherAchievementId == currentAchievement.Id;
	local state;
	if currentAchievement.TemporaryObtainable then
		state = currentAchievement.TemporaryObtainable.Obtainable();
	end
	if completed then
		icon = "|T136814:0|t";
		color = sameAchievement and addon.Colors.LightGreenRGB or addon.Colors.GreenRGB;
	elseif state and (not state or state == "Past") then
		icon = "|T136813:0|t";
		color = sameAchievement and addon.Colors.LightRedRGB or addon.Colors.RedRGB;
	else
		icon = "|T136815:0|t";
		color = sameAchievement and addon.Colors.LightGreyRGB or addon.Colors.GreyRGB;
	end

	if showCurrentCharacterIcons then
		if wasEarnedByMe then
			currentCharacterIcon = "|T136814:0|t";
		elseif state and (not state or state == "Past") then
			currentCharacterIcon = "|T136813:0|t";
		else
			currentCharacterIcon = "|T136815:0|t";
		end
		currentCharacterIcon = currentCharacterIcon .. addon.L["TAB"];
	end

	GameTooltip:AddLine(icon .. addon.L["TAB"] .. currentCharacterIcon .. name .. nameSuffix, color.R, color.G, color.B); -- Achievement name
end

local function GetCriteriaTextAndColor(achievementId, criteriaIndex)
	local criteriaString, completed, quantity, reqQuantity, hasValueProgress;
	if type(achievementId) == "table" then
		criteriaString, completed, quantity, reqQuantity, hasValueProgress = unpack(achievementId[criteriaIndex]);
	else
		criteriaString, _, completed, quantity, reqQuantity, _, _, _, _, _, _, hasValueProgress = addon.GetAchievementCriteriaInfo(achievementId, criteriaIndex);
	end
	local icon, color;
	if criteriaString ~= "" or hasValueProgress then
		if completed then
			icon = "|T136814:0|t";
			color = addon.Colors.GreenRGB;
		else
			icon = "|T136815:0|t";
			color = addon.Colors.GreyRGB;
		end
	end
	local text = criteriaString;
	if not completed and hasValueProgress then
		text = text .. (text ~= "" and " " or "") .. (text ~= "" and "(" or "") .. tostring(quantity) .. "/" .. tostring(reqQuantity) .. (text ~= "" and ")" or "");
	end
	if icon then
		text = icon .. addon.L["TAB"] .. (text or "");
	end

	return text or "", color or addon.Colors.WhiteRGB;
end

function tooltip.AddCriteriaLine(achievementId, criteriaIndex)
	local text, color = GetCriteriaTextAndColor(achievementId, criteriaIndex);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
end

function tooltip.AddDoubleCriteriaLine(achievementId, criteriaIndex1, criteriaIndex2)
	local texts = {"", ""};
	local colors = {addon.Colors.WhiteRGB, addon.Colors.WhiteRGB};
	for i, criteriaIndex in next, {criteriaIndex1, criteriaIndex2} do
		texts[i], colors[i] = GetCriteriaTextAndColor(achievementId, criteriaIndex);
	end
	GameTooltip:AddDoubleLine(texts[1], texts[2], colors[1].R, colors[1].G, colors[1].B, colors[2].R, colors[2].G, colors[2].B);
end

function tooltip.AddCriteria(customObjectives)
	if #customObjectives < addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
		for i = 1, #customObjectives do
			tooltip.AddCriteriaLine(customObjectives, i);
		end
	else
		for i = 1, #customObjectives, 2 do
			tooltip.AddDoubleCriteriaLine(customObjectives, i, i + 1 <= #customObjectives and i + 1 or nil);
		end
	end
end

function tooltip.ShowTooltip(anchor, achievement)
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