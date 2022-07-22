-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AchievementButtonMixin = {};

local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;
local descriptionWidthOffset = 166;
local descriptionSmallWidthOffset = 104;

do -- Scripts
	function KrowiAF_AchievementButton_OnEnter(self)
		addon.GUI.AchievementsFrame.SetHighlightedButton(self);
		self:ShowTooltip();
		self.highlight:Show();
	end

	function KrowiAF_AchievementButton_OnLeave(self)
		addon.GUI.AchievementsFrame.ClearHighlightedButton();
		AchievementMeta_OnLeave(self);
		if not self.selected then
			self.highlight:Hide();
		end
	end

	function KrowiAF_AchievementButton_OnLoad(self)
		self.dateCompleted = self.shield.dateCompleted;

		_, self.FontHeight = self.description:GetFont();

		local descriptionHeight = self.FontHeight;
		if not addon.Options.db.Achievements.Compact then
			descriptionHeight = descriptionHeight * ACHIEVEMENTUI_MAX_LINES_COLLAPSED;
		end

		self.description:SetHeight(descriptionHeight);

		self:SetScript("OnSizeChanged", function(self, width, height)
			local descriptionWidth = width - (addon.Options.db.Achievements.Compact and descriptionSmallWidthOffset or descriptionWidthOffset);
			self.description:SetWidth(descriptionWidth);
			self.hiddenDescription:SetWidth(descriptionWidth);
		end);

		self:Collapse();
	end
end

function KrowiAF_AchievementButtonMixin:DisplayObjectives()
	local objectives = addon.GUI.AchievementsFrame.AchievementsObjectives;
	local topAnchor = self.hiddenDescription;
	objectives:ClearAllPoints();
	objectives:SetParent(self);
	objectives:Show();
	objectives.Completed = self.Completed;
	local height = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT; -- Compact or not, we need this height
	local id = self.Achievement.Id;
	if objectives.Id == id then
		if objectives.Mode == objectives.Modes.Criteria then
			if objectives:GetHeight() > 0 then
				objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
				objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, 0);
				objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
			end
		else
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
		end
	elseif self.Completed and GetPreviousAchievement(id) then
		objectives:SetHeight(0);
		objectives:ResetAll();
		objectives:DisplayProgressiveAchievement(id);
		objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
	else
		objectives:SetHeight(0);
		objectives:ResetAll();
		objectives:DisplayCriteria(id);
		if objectives:GetHeight() > 0 then
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
			objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, -25);
			objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
		end
	end
	height = height + objectives:GetHeight();
	self.hiddenDescription:Show();
	self.description:Hide();
	if height ~= addon.Options.db.Achievements.ButtonCollapsedHeight or self.numLines > ACHIEVEMENTUI_MAX_LINES_COLLAPSED then
		local descriptionHeight = self.hiddenDescription:GetHeight();
		height = height + descriptionHeight - ACHIEVEMENTBUTTON_DESCRIPTIONHEIGHT;
		if self.reward:IsShown() then
			height = height + 4;
		end
	end
	objectives.Id = id;
	return height;
end

function KrowiAF_AchievementButtonMixin:SetAchievement(achievement)
	if not achievement then
		self.Achievement = nil;
	end

	local compact = addon.Options.db.Achievements.Compact;
	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, _, wasEarnedByMe, earnedBy = addon.GetAchievementInfo(achievement.Id);
	flags = addon.Objects.Flags:New(flags);

	if self.Achievement ~= achievement then
		self.Achievement = achievement;

		local saturatedStyle;
		if achievement.NotObtainable then
			saturatedStyle = "NotObtainable";
		else
			if flags.IsAccountWide then
				self.accountWide = true;
				achievement.IsAccountWide = true;
				saturatedStyle = "account";
			else
				self.accountWide = nil;
				achievement.IsAccountWide = nil;
				saturatedStyle = "normal";
			end
		end

		self.label:SetText(name)

		if GetPreviousAchievement(id) then
			AchievementShield_SetPoints(AchievementButton_GetProgressivePoints(id), self.shield.points, AchievementPointsFont, AchievementPointsFontSmall);
		else
			AchievementShield_SetPoints(points, self.shield.points, AchievementPointsFont, AchievementPointsFontSmall);
		end

		local texture = points > 0 and "Interface/AchievementFrame/UI-Achievement-Shields" or "Interface/AchievementFrame/UI-Achievement-Shields-NoPoints";
		self.shield.icon:SetTexture(texture);

		self.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
		self.shield.earnedBy = earnedBy;
		self.shield.id = id;

		self.description:SetText(description);
		self.hiddenDescription:SetText(description);
		self.numLines = ceil(self.hiddenDescription:GetHeight() / self.FontHeight);

		self.icon.texture:SetTexture(icon);

		local earnedByFilter = addon.Filters.db.EarnedBy;
		if (earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe) or (earnedByFilter == addon.Filters.CharacterAccount and completed and wasEarnedByMe) then
			self.Completed = true;
			achievement.IsCompleted = true;
			self.dateCompleted:SetText(FormatShortDate(day, month, year));
			self.dateCompleted:Show();
			if self.saturatedStyle ~= saturatedStyle then
				self:Saturate();
			end
		elseif (earnedByFilter == addon.Filters.CharacterAccount and completed and not wasEarnedByMe) then
			self.Completed = true;
			achievement.IsCompleted = true;
			self.dateCompleted:SetText(FormatShortDate(day, month, year));
			self.dateCompleted:Show();
			self:SaturatePartial();
		else
			self.Completed = nil;
			achievement.IsCompleted = nil;
			self.dateCompleted:Hide();
			self:Desaturate();
		end

		if rewardText == "" then
			if compact then
				self.reward:SetText(nil);
				self.description:Show();
			end
			self.reward:Hide();
			self.rewardBackground:Hide();
		else
			self.reward:SetText(rewardText);
			self.reward:Show();
			self.rewardBackground:Show();
			if self.Completed then
				self.rewardBackground:SetVertexColor(1, 1, 1);
			else
				self.rewardBackground:SetVertexColor(0.35, 0.35, 0.35);
			end
			if compact then
				self.description:Hide();
			end
		end
	end

	if IsTrackedAchievement(id) then -- Issue #10 : Fix
		self.check:Show();
		self.label:SetWidth(self.label:GetStringWidth() + 4); -- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
		self.tracked:SetChecked(true);
		if not compact then
			self.tracked:Show();
		end
	else
		self.check:Hide();
		self.tracked:SetChecked(false);
		self.tracked:Hide();
	end

	self:UpdatePlusMinusTexture();
end

function KrowiAF_AchievementButtonMixin:Update(achievement, index)
	local compact = addon.Options.db.Achievements.Compact;

	local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, _ = addon.GetAchievementInfo(achievement.Id);
	self:SetAchievement(achievement);

	self.index = index; -- This is used to keep the correct achievement expanded
	self.Id = achievement.Id;

	if achievement == addon.GUI.SelectedTab.SelectedAchievement then
		self.selected = true;
		self.highlight:Show();
		local height = self:DisplayObjectives();

		if height == addon.Options.db.Achievements.ButtonCollapsedHeight then
			self:Collapse();
		else
			self:Expand(height);
		end
		if not completed or not wasEarnedByMe then
			self.tracked:Show();
		end
	elseif self.selected then
		self.selected = nil;
		if not self:IsMouseOver() then -- This causes the first 2 - 3 achievement to be highlighted when changing the filter if the mouse is over one of the achievements
			self.highlight:Hide();
		end
		self:Collapse();
		if compact and self.reward:GetText() ~= nil then
			self.description:Hide();
		else
			self.description:Show();
		end
		self.hiddenDescription:Hide();
	end
end

function KrowiAF_AchievementButtonMixin:UpdatePlusMinusTexture()
	if self.Achievement == nil then
		return; -- This happens when we create buttons
	end

	local id = self.Achievement.Id;
	local display = false;
	if addon.Options.db.Achievements.Compact then
		display = true;
	elseif GetAchievementNumCriteria(id) ~= 0 then
		display = true;
	elseif self.Completed and GetPreviousAchievement(id) then
		display = true;
	elseif not self.Completed and GetAchievementGuildRep(id) then
		display = true;
	end

	if not display then
		self.plusMinus:Hide();
		return;
	end

	self.plusMinus:Show();
	if self.collapsed and self.saturatedStyle then
		self.plusMinus:SetTexCoord(0, 0.5, 0, 0.25);
	elseif self.collapsed then
		self.plusMinus:SetTexCoord(0.5, 1, 0, 0.25);
	elseif self.saturatedStyle then
		self.plusMinus:SetTexCoord(0, 0.5, 0.25, 0.50);
	else
		self.plusMinus:SetTexCoord(0.5, 1, 0.25, 0.50);
	end
end

function KrowiAF_AchievementButtonMixin:Collapse()
	if self.collapsed then
		return;
	end

	self.collapsed = true;
	self:UpdatePlusMinusTexture();
	local buttonCollapsedHeight = addon.Options.db.Achievements.ButtonCollapsedHeight;
	self:SetHeight(buttonCollapsedHeight);
	self.background:SetTexCoord(0, 1, 1 - (buttonCollapsedHeight / 256), 1);
	if not self.tracked:GetChecked() or addon.Options.db.Achievements.Compact then
		self.tracked:Hide();
	end
end

function KrowiAF_AchievementButtonMixin:Expand(height)
	if not self.collapsed and self:GetHeight() == height then
		return;
	end

	self.collapsed = nil;
	self:UpdatePlusMinusTexture();
	self:SetHeight(height);
	self.background:SetTexCoord(0, 1, max(0, 1-(height / 256)), 1);
end

local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";
local function SetTsunamis(self)
	if addon.Options.db.Achievements.Compact then
		return;
	end
	local notObtainable = self.Achievement.NotObtainable;
	local texture = notObtainable and (media .. "NotObtainableAchievementBorders") or "Interface/AchievementFrame/UI-Achievement-Borders";

	self.BottomTsunami1:SetTexture(texture);
	self.BottomTsunami1:SetAlpha(0.35);
	self.TopTsunami1:SetTexture(texture);
	self.TopTsunami1:SetAlpha(0.3);
	if notObtainable then
		self.BottomTsunami1:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
		self.TopTsunami1:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
	else
		self.BottomTsunami1:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
		self.TopTsunami1:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
	end
end

function KrowiAF_AchievementButtonMixin:Saturate()
	if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "NotObtainable";
	else
		self.background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal");
		if self.accountWide then
			self.titleBar:SetTexture("Interface/AchievementFrame/AccountLevel-AchievementHeader");
			self.titleBar:SetTexCoord(0, 1, 0, 0.375);
			self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "account";
		else
			self.titleBar:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
			self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
			self:SetBackdropBorderColor(ACHIEVEMENT_GOLD_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "normal";
		end
		self.shield.points:SetVertexColor(1, 1, 1);
	end
	self.glow:SetVertexColor(1.0, 1.0, 1.0);
	self.icon:Saturate();
	self.shield:Saturate();
	self.reward:SetVertexColor(1, .82, 0);
	self.label:SetVertexColor(1, 1, 1);
	self.description:SetTextColor(0, 0, 0, 1);
	self.description:SetShadowOffset(0, 0);
	self:UpdatePlusMinusTexture();
	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:Desaturate()
	self.saturatedStyle = nil;
	if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	else
		self.background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal-Desaturated");
		if self.accountWide then
			self.titleBar:SetTexture("Interface/AchievementFrame/AccountLevel-AchievementHeader");
			self.titleBar:SetTexCoord(0, 1, 0.40625, 0.78125);
		else
			self.titleBar:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
			self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375);
		end
	end
	self.glow:SetVertexColor(.22, .17, .13);
	self.icon:Desaturate();
	self.shield:Desaturate();
	self.shield.points:SetVertexColor(.65, .65, .65);
	self.reward:SetVertexColor(.8, .8, .8);
	self.label:SetVertexColor(.65, .65, .65);
	self.description:SetTextColor(1, 1, 1, 1);
	self.description:SetShadowOffset(1, -1);
	self:UpdatePlusMinusTexture();
	self:SetBackdropBorderColor(.5, .5, .5);
	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:SaturatePartial()
	self:Desaturate();
	self.titleBar:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
	self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
	self.icon:Saturate();
	self.shield:Saturate();
	self.shield.points:SetVertexColor(1, 1, 1);
	self.glow:SetVertexColor(0.1, 0.1, 0.1);
	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:Select(ignoreModifiers)
	if IsModifiedClick() and not ignoreModifiers then
		local handled = nil;
		if IsModifiedClick("CHATLINK") then
			local achievementLink = GetAchievementLink(self.Achievement.Id);
			if achievementLink then
				handled = ChatEdit_InsertLink(achievementLink);
				if not handled and SocialPostFrame and Social_IsShown() then
					Social_InsertLink(achievementLink);
					handled = true;
				end
			end
		end
		if not handled and IsModifiedClick("QUESTWATCHTOGGLE") then
			AchievementButton_ToggleTracking(self.Achievement.Id);
		end
		return;
	end

	local achievementsFrame = addon.GUI.AchievementsFrame;
	local scrollFrame = achievementsFrame.ScrollFrame;
	if self.selected then
		if not self:IsMouseOver() then
			self.highlight:Hide();
		end
		achievementsFrame:ClearSelection();
		HybridScrollFrame_CollapseButton(scrollFrame);
		achievementsFrame:Update();
		return;
	end

	achievementsFrame:ClearSelection();
	achievementsFrame:SelectButton(self);
	self:Update(addon.GUI.SelectedTab.SelectedAchievement, self.index);
	HybridScrollFrame_ExpandButton(scrollFrame, ((self.index - 1) * addon.Options.db.Achievements.ButtonCollapsedHeight), self:GetHeight());
	achievementsFrame:Update();
	if not ignoreModifiers then
		achievementsFrame:AdjustSelection();
	end
end

function KrowiAF_AchievementButtonMixin:ShowTooltip()
	addon.GUI.AchievementTooltip.ShowTooltip(self, self.Achievement);
end