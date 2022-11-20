-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AchievementButtonMixin = {};

function KrowiAF_AchievementButtonMixin:PostLoad(scrollFrame)
	self:SetPoint("RIGHT", scrollFrame, -5, 0);

	local xHeaderOffset = max(self.PlusMinus:GetRight() - self:GetLeft(), self:GetRight() - self.DateCompleted:GetLeft()) + 2;
	self.Header:SetPoint("LEFT", xHeaderOffset, 0);
	self.Header:SetPoint("RIGHT", -xHeaderOffset, 0);

	local xDescriptionOffset = max(self.PlusMinus:GetRight() - self:GetLeft(), self:GetRight() - self.Shield:GetLeft());
	self.Description:SetPoint("LEFT", xDescriptionOffset, 0);
	self.Description:SetPoint("RIGHT", -xDescriptionOffset, 0);

	local xObjectivesOffset = max(self.ObjectivesLeftAnchor:GetRight() - self:GetLeft(), self:GetRight() - self.Shield:GetLeft());
	self.XObjectivesOffset = xObjectivesOffset;
	addon.GUI.AchievementsObjectives:SetParent(self);
end

local cachedWidth;
function KrowiAF_AchievementButtonMixin:DisplayObjectives(forced)
	local objectives = addon.GUI.AchievementsObjectives;
	local topAnchor = self.HiddenDescription;

	objectives:SetParent(self);
	objectives:SetPoint("TOP", self.HiddenDescription, "BOTTOM", 0, -8);
	objectives:SetPoint("LEFT", self, "LEFT", self.XObjectivesOffset, 0); -- Set it each time to take the scrollbar into account
	objectives:SetPoint("RIGHT", self, "RIGHT", -self.XObjectivesOffset, 0); -- Set it each time to take the scrollbar into account
	objectives.Completed = self.Completed;
	objectives.FontHeight = self.FontHeight;
	local height = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT; -- Compact or not, we need this height
	local id = self.Achievement.Id;
	if objectives.Id == id and cachedWidth == objectives:GetWidth() and not forced then
		-- Cached, nothing to do
	elseif self.Completed and GetPreviousAchievement(id) then
		objectives:SetHeight(1);
		objectives:ResetAll();
		objectives:DisplayProgressiveAchievement(id);
	else
		objectives:SetHeight(1);
		objectives:ResetAll();
		objectives:DisplayCriteria(id);
		cachedWidth = objectives:GetWidth();
	end
	objectives:Show();
	height = height + objectives:GetHeight() - 1;
	if height ~= self.CollapsedHeight or self.numLines > self.MaxDescriptionLinesCollapsed then
		local descriptionHeight = self.HiddenDescription:GetHeight();
		height = height + descriptionHeight - ACHIEVEMENTBUTTON_DESCRIPTIONHEIGHT;
		if self.Reward:IsShown() then
			height = height + 4;
		end
	end
	objectives.Id = id;
	height = max(ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT, height);
	return height;
end

function KrowiAF_AchievementButtonMixin:SetAchievement(achievement, refresh)
	if not achievement then
		self.Achievement = nil;
		return;
	end

	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, _, wasEarnedByMe, earnedBy = addon.GetAchievementInfo(achievement.Id);
	flags = addon.Objects.Flags:New(flags);

	if self.Achievement ~= achievement or refresh then
		self.Achievement = achievement;

		local saturatedStyle;
		local state;
        if achievement.TemporaryObtainable then
            state = achievement.TemporaryObtainable.Obtainable();
        end

		if state and (state == false or state == "Past") then
			saturatedStyle = "NotObtainable";
		elseif state and state == "Current" then
			self.saturatedStyle = "TempObtainable";
		elseif state and state == "Future" then
			self.saturatedStyle = "TempObtainableFuture";
		else
			if flags.IsAccountWide then
				self.accountWide = true;
				saturatedStyle = "account";
			else
				self.accountWide = nil;
				saturatedStyle = "normal";
			end
		end

		if flags.IsAccountWide then
			achievement.IsAccountWide = true;
		else
			achievement.IsAccountWide = nil;
		end

		self.Header:SetText(name)

		local normalFont = self.Compact and GameFontHighlight or AchievementPointsFontHighlight;
		local smallFont = self.Compact and GameFontHighlightSmall or AchievementPointsFontHighlightSmall;
		if GetPreviousAchievement(id) and points > 0 then
			AchievementShield_SetPoints(AchievementButton_GetProgressivePoints(id), self.Shield.Points, normalFont, smallFont);
		else
			AchievementShield_SetPoints(points, self.Shield.Points, normalFont, smallFont);
		end

		local texture = points > 0 and "Interface/AchievementFrame/UI-Achievement-Shields" or "Interface/AchievementFrame/UI-Achievement-Shields-NoPoints";
		self.Shield.Icon:SetTexture(texture);

		-- self.Shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
		-- self.Shield.earnedBy = earnedBy;
		-- self.Shield.id = id;

		self.Description:SetText(description);
		self.HiddenDescription:SetText(description);
		self.numLines = ceil(self.HiddenDescription:GetHeight() / self.FontHeight);

		self.Icon.Texture:SetTexture(icon);

		local earnedByFilter = addon.Filters.db.EarnedBy;
		if (earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe) or (earnedByFilter == addon.Filters.CharacterAccount and completed and wasEarnedByMe) then
			self.Completed = true;
			achievement.IsCompleted = true;
			self.DateCompleted:SetText(FormatShortDate(day, month, year));
			self.DateCompleted:Show();
			if self.saturatedStyle ~= saturatedStyle then
				self:Saturate();
			end
		elseif (earnedByFilter == addon.Filters.CharacterAccount and completed and not wasEarnedByMe) then
			self.Completed = true;
			achievement.IsCompleted = true;
			self.DateCompleted:SetText(FormatShortDate(day, month, year));
			self.DateCompleted:Show();
			self:SaturatePartial();
		else
			self.Completed = nil;
			achievement.IsCompleted = nil;
			self.DateCompleted:Hide();
			self:Desaturate();
		end

		if rewardText == "" then
			if self.Compact then
				self.Reward:SetText(nil);
				self.Description:Show();
			end
			self.Reward:Hide();
			self.RewardBackground:Hide();
		else
			self.Reward:SetText(rewardText);
			self.Reward:Show();
			self.RewardBackground:Show();
			if self.Completed then
				self.RewardBackground:SetVertexColor(1, 1, 1);
			else
				self.RewardBackground:SetVertexColor(0.35, 0.35, 0.35);
			end
			if self.Compact then
				self.Description:Hide();
			end
		end

		if achievement.AlwaysVisible then
			self.ExtraIcon.Texture:SetAtlas("flightpath");
			self.ExtraIcon.Text = addon.L["Achievement shown temporarily"];
			self.ExtraIcon:Show();
		elseif achievement.IsWatched then
			self.ExtraIcon.Texture:SetAtlas("groupfinder-eye-frame");
			self.ExtraIcon.Text = addon.L["Achievement is watched"];
			self.ExtraIcon:Show();
		else
			self.ExtraIcon:Hide();
		end
	end

	if IsTrackedAchievement(id) then -- Issue #10 : Fix
		self.Check:Show();
		self.Header:SetWidth(self.Header:GetStringWidth() + 4); -- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
		self.Tracked:SetChecked(true);
		if not self.Compact then
			self.Tracked:Show();
		end
	else
		self.Check:Hide();
		self.Tracked:SetChecked(false);
		self.Tracked:Hide();
	end

	self:UpdatePlusMinusTexture();
end

function KrowiAF_AchievementButtonMixin:Update(achievement, index)
	local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, _ = addon.GetAchievementInfo(achievement.Id);
	self:SetAchievement(achievement);

	self.index = index; -- This is used to keep the correct achievement expanded
	-- self.Id = achievement.Id;

	local selectedTab = addon.GUI.SelectedTab;
	if selectedTab and achievement == selectedTab.SelectedAchievement then
		self.selected = true;
		self.Highlight:Show();
		local height = self:DisplayObjectives();
		self:Expand(height);
		if not completed or not wasEarnedByMe then
			self.Tracked:Show();
		end
	elseif self.selected then
		self.selected = nil;
		self:Collapse();
	end

	if self.Compact then
		if not self.collapsed then
			self.Glow:Show();
			self.Glow:SetHeight(64);
			self.Glow:SetTexCoord(0, 1, 1 / 256, (self.Glow:GetHeight() + 1) / 256); -- Add 1 to height since top starts at 1
		else
			if self.Reward:GetText() ~= nil then
				self.Glow:Hide();
			else
				self.Glow:Show();
				self.Glow:SetHeight(24);
				self.Glow:SetTexCoord(0, 1, 1 / 256, (self.Glow:GetHeight() + 1) / 256); -- Add 1 to height since top starts at 1
			end
		end
	end
end

function KrowiAF_AchievementButtonMixin:UpdatePlusMinusTexture()
	if self.Achievement == nil then
		return; -- This happens when we create buttons
	end

	local id = self.Achievement.Id;
	local display = false;
	if self.Compact then
		display = true;
	elseif GetAchievementNumCriteria(id) ~= 0 then
		display = true;
	elseif self.Completed and GetPreviousAchievement(id) then
		display = true;
	-- elseif not self.Completed and GetAchievementGuildRep(id) then -- Not sure what this one does
	-- 	display = true;
	end

	if not display then
		self.PlusMinus:Hide();
		return;
	end

	self.PlusMinus:Show();
	if self.collapsed and self.saturatedStyle then
		self.PlusMinus:SetTexCoord(0, 0.5, 0, addon.IsWrathClassic and 0.5 or 0.25);
	elseif self.collapsed then
		self.PlusMinus:SetTexCoord(0.5, 1, 0, addon.IsWrathClassic and 0.5 or 0.25);
	elseif self.saturatedStyle then
		self.PlusMinus:SetTexCoord(0, 0.5, addon.IsWrathClassic and 0.5 or 0.25, addon.IsWrathClassic and 1 or 0.5);
	else
		self.PlusMinus:SetTexCoord(0.5, 1, addon.IsWrathClassic and 0.5 or 0.25, addon.IsWrathClassic and 1 or 0.5);
	end
end

function KrowiAF_AchievementButtonMixin:Collapse()
	if self.collapsed then
		return;
	end

	self.collapsed = true;
	self:UpdatePlusMinusTexture();
	self:SetHeight(self.CollapsedHeight);
	self.Background:SetTexCoord(0, 1, 1 - (self.CollapsedHeight / 256), 1);
	if not self:IsMouseOver() then
		self.Highlight:Hide();
	end
	if not self.Tracked:GetChecked() or self.Compact then
		self.Tracked:Hide();
	end
	if self.Compact and self.Reward:GetText() ~= nil then
		self.Description:Hide();
	else
		self.Description:Show();
	end
	self.HiddenDescription:Hide();
end

function KrowiAF_AchievementButtonMixin:Expand(height)
	if not self.collapsed and self:GetHeight() == height then
		return;
	end

	self.collapsed = nil;
	self:UpdatePlusMinusTexture();
	self:SetHeight(height);
	self.Background:SetTexCoord(0, 1, max(0, 1 - (height / 256)), 1);
	self.HiddenDescription:Show();
	self.Description:Hide();
end

local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";
local function SetTsunamis(self)
	if self.Compact then
		return;
	end
	local achievement = self.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
	local notObtainable = state and (state == false or state == "Past" or state == "Future");

	local texture;
	if state and (state == false or state == "Past") then
		texture = media .. "NotObtainableAchievementBorders";
	elseif state and state == "Current" then
		texture = media .. "TempObtainableAchievementBorders";
	elseif state and state == "Future" then
		texture = media .. "TempObtainableFutureAchievementBorders";
	else
		texture = "Interface/AchievementFrame/UI-Achievement-Borders";
	end

	self.BottomTsunami:SetTexture(texture);
	self.BottomTsunami:SetAlpha(0.35);
	self.TopTsunami:SetTexture(texture);
	self.TopTsunami:SetAlpha(0.3);
	self.BottomTsunami:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
	self.TopTsunami:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
end

ACHIEVEMENT_GREEN_BORDER_COLOR = CreateColor(0, 0.67, 0);

function KrowiAF_AchievementButtonMixin:Saturate()
	self.Background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal");
	local achievement = self.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
	if state and (state == false or state == "Past") then
		self.HeaderBackground:SetTexture(media .. "NotObtainableAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "NotObtainable";
	elseif state and state == "Current" then
		self.HeaderBackground:SetTexture(media .. "TempObtainableAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_GREEN_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "TempObtainable";
	elseif state and state == "Future" then
		self.HeaderBackground:SetTexture(media .. "TempObtainableFutureAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "TempObtainableFuture";
	else
		if self.accountWide then
			self.HeaderBackground:SetTexture("Interface/AchievementFrame/AccountLevel-AchievementHeader");
			self.HeaderBackground:SetTexCoord(0, 1, 0, 0.375);
			self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "account";
		else
			self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
			self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
			self:SetBackdropBorderColor(ACHIEVEMENT_GOLD_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "normal";
		end
		self.Shield.Points:SetVertexColor(1, 1, 1);
	end
	self.Glow:SetVertexColor(1, 1, 1);
	self.Icon.Texture:SetVertexColor(1, 1, 1, 1);
	self.Icon.Border:SetVertexColor(1, 1, 1, 1);
	self.Shield.Icon:SetTexCoord(0, 0.5, 0, addon.IsWrathClassic and 1 or 0.5);
	self.Reward:SetVertexColor(1, 0.82, 0);
	self.Header:SetVertexColor(1, 1, 1);
	self.Description:SetTextColor(0, 0, 0, 1);
	self.Description:SetShadowOffset(0, 0);
	self:UpdatePlusMinusTexture();
	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:Desaturate()
	self.saturatedStyle = nil;
	self.Background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal-Desaturated");
	local achievement = self.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
	if state and (state == false or state == "Past") then
		self.HeaderBackground:SetTexture(media .. "NotObtainableAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	elseif state and state == "Current" then
		self.HeaderBackground:SetTexture(media .. "TempObtainableAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	elseif state and state == "Future" then
		self.HeaderBackground:SetTexture(media .. "TempObtainableFutureAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	else
		if self.accountWide then
			self.HeaderBackground:SetTexture("Interface/AchievementFrame/AccountLevel-AchievementHeader");
			self.HeaderBackground:SetTexCoord(0, 1, 0.40625, 0.78125);
		else
			self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
			self.HeaderBackground:SetTexCoord(0, 1, 0.91796875, 0.99609375);
		end
	end
	self.Glow:SetVertexColor(0.22, 0.17, 0.13);
	self.Icon.Texture:SetVertexColor(0.55, 0.55, 0.55, 1);
	self.Icon.Border:SetVertexColor(0.75, 0.75, 0.75, 1);
	self.Shield.Icon:SetTexCoord(0.5, 1, 0, addon.IsWrathClassic and 1 or 0.5);
	self.Shield.Points:SetVertexColor(0.65, 0.65, 0.65);
	self.Reward:SetVertexColor(0.8, 0.8, 0.8);
	self.Header:SetVertexColor(0.65, 0.65, 0.65);
	self.Description:SetTextColor(1, 1, 1, 1);
	self.Description:SetShadowOffset(1, -1);
	self:UpdatePlusMinusTexture();
	self:SetBackdropBorderColor(0.5, 0.5, 0.5);
	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:SaturatePartial()
	self:Desaturate();
	self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
	self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
	self.Icon.Texture:SetVertexColor(1, 1, 1, 1);
	self.Icon.Border:SetVertexColor(1, 1, 1, 1);
	self.Shield.Icon:SetTexCoord(0, 0.5, 0, addon.IsWrathClassic and 1 or 0.5);
	self.Shield.Points:SetVertexColor(1, 1, 1);
	self.Glow:SetVertexColor(0.1, 0.1, 0.1);
	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:ProcessedModifiers(ignoreModifiers)
	if IsModifierKeyDown() and not ignoreModifiers then
		local handled = nil;
		if addon.IsCustomModifierKeyDown(addon.Options.db.Achievements.Modifiers.PasteToChat) then
			local achievementLink = GetAchievementLink(self.Achievement.Id);
			if achievementLink then
				handled = ChatEdit_InsertLink(achievementLink);
				if not handled and SocialPostFrame and Social_IsShown() then
					Social_InsertLink(achievementLink);
					handled = true;
				end
			end
		end
		if not handled and addon.IsCustomModifierKeyDown(addon.Options.db.Achievements.Modifiers.ToggleTracking) then
			if addon.IsWrathClassic or addon.IsShadowlandsRetail then
				AchievementButton_ToggleTracking(self.Achievement.Id);
			else
				self:ToggleTracking();
			end
			handled = true;
		end
		if not handled and addon.IsCustomModifierKeyDown(addon.Options.db.Achievements.Modifiers.AddRemoveWatchList) then
			if self.Achievement.IsWatched then
				addon.ClearWatchAchievement(self.Achievement);
			else
				addon.WatchAchievement(self.Achievement);
			end
		end
		return true;
	end
end

function KrowiAF_AchievementButtonMixin:Select(ignoreModifiers)
	if self:ProcessedModifiers(ignoreModifiers) then
		return;
	end

	local achievementsFrame = addon.GUI.AchievementsFrame;
	local scrollFrame = achievementsFrame.ScrollFrame;
	if self.selected then
		if not self:IsMouseOver() then
			self.Highlight:Hide();
		end
		achievementsFrame:ClearSelection();
		HybridScrollFrame_CollapseButton(scrollFrame);
		achievementsFrame:Update();
		return;
	end

	achievementsFrame:ClearSelection();
	achievementsFrame:SelectButton(self);
	self:Update(addon.GUI.SelectedTab.SelectedAchievement, self.index);
	achievementsFrame:ExpandSelection(self);
end

function KrowiAF_AchievementButtonMixin:ShowTooltip()
	if self.Achievement then
		addon.GUI.AchievementTooltip.ShowTooltip(self, self.Achievement);
	end
end

function KrowiAF_AchievementButtonMixin:ToggleTracking()
	local id = self.Achievement.Id;
	if self.Achievement.IsTracked then
		RemoveTrackedAchievement(id);
		self:SetAsTracked(false);
		return;
	end

	local count = GetNumTrackedAchievements();
	if count >= MAX_TRACKED_ACHIEVEMENTS then
		UIErrorsFrame:AddMessage(format(ACHIEVEMENT_WATCH_TOO_MANY, MAX_TRACKED_ACHIEVEMENTS), 1.0, 0.1, 0.1, 1.0);
		return;
	end

	local _, _, _, completed, _, _, _, _, _, _, _, isGuild, wasEarnedByMe = GetAchievementInfo(id);
	if (completed and isGuild) or wasEarnedByMe then
		UIErrorsFrame:AddMessage(ERR_ACHIEVEMENT_WATCH_COMPLETED, 1.0, 0.1, 0.1, 1.0);
		return;
	end

	self:SetAsTracked(true);
	AddTrackedAchievement(id);

	return true;
end

function KrowiAF_AchievementButtonMixin:SetAsTracked(tracked)
	self.Achievement.IsTracked = nil;
	if tracked then
		self.Achievement.IsTracked = true;
	end
	self.Check:SetShown(tracked);
	self.Tracked:SetChecked(tracked);
	if tracked then
		self.Tracked:Show();
	else
		if not self.selected then
			self.Tracked:Hide();
		end
	end
end