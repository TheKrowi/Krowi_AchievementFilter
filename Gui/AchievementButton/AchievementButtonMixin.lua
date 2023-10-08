local _, addon = ...;

KrowiAF_AchievementButtonTrackedMixin = {};

function KrowiAF_AchievementButtonTrackedMixin:OnShow()
	if self:GetParent().Achievement then
		self:SetChecked(IsTrackedAchievement(self:GetParent().Achievement.Id));
	end
end

function KrowiAF_AchievementButtonTrackedMixin:OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(self:GetChecked() and UNTRACK_ACHIEVEMENT_TOOLTIP or TRACK_ACHIEVEMENT_TOOLTIP, nil, nil, nil, nil, true);
end

function KrowiAF_AchievementButtonTrackedMixin:OnLeave()
	GameTooltip:Hide();
end

function KrowiAF_AchievementButtonTrackedMixin:OnClick()
	PlaySound(self:GetChecked() and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
	local tracked = self:GetParent():ToggleTracking();
	if not tracked then
		self:SetChecked(false);
	end
end

KrowiAF_AchievementButtonExtraIconMixin = {};

function KrowiAF_AchievementButtonExtraIconMixin:OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(self.Text, nil, nil, nil, nil, true);
end

function KrowiAF_AchievementButtonExtraIconMixin:OnLeave()
	GameTooltip:Hide();
end

KrowiAF_AchievementButtonLightMixin = {};

function KrowiAF_AchievementButtonLightMixin:OnEnter()
	self.Highlight:Show();
    if self.Achievement == nil then
        return;
    end
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT");
    local link = GetAchievementLink(self.Achievement.Id);
    GameTooltip:SetHyperlink(link);
    GameTooltip:Show();
    if GameTooltip:GetTop() > self:GetTop() then
        GameTooltip:ClearAllPoints();
        GameTooltip:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT");
    end
end

function KrowiAF_AchievementButtonLightMixin:OnLeave()
	self.Highlight:Hide();
	GameTooltip:Hide();
end

function KrowiAF_AchievementButtonLightMixin:OnClick(button, _, ignoreModifiers)
	if button ~= "LeftButton" then
		self:Click(button, ignoreModifiers);
		return;
	end
	if self:ProcessedModifiers(ignoreModifiers) then
		return;
	end
	KrowiAF_SelectAchievementFromID(self.Achievement.Id);
end

KrowiAF_AchievementButtonMixin = {};

function KrowiAF_AchievementButtonMixin:OnEnter()
	KrowiAF_AchievementsFrame.SetHighlightedButton(self);
	self:ShowTooltip();
	self.Highlight:Show();
end

function KrowiAF_AchievementButtonMixin:OnLeave()
	KrowiAF_AchievementsFrame.ClearHighlightedButton();
	GameTooltip:Hide();
	local selectedTab = addon.Gui.SelectedTab;
	if selectedTab and self.Achievement ~= selectedTab.SelectedAchievement then
		self.Highlight:Hide();
	end
end

function KrowiAF_AchievementButtonMixin:Click(button, ignoreModifiers)
	if button == "LeftButton" then
		self:Select(ignoreModifiers);
	elseif button == "RightButton" then
		addon.Gui.RightClickMenu.AchievementMenu:Open(self.Achievement);
	end
end

function KrowiAF_AchievementButtonMixin:OnClick(button, _, ignoreModifiers)
	self:Click(button, ignoreModifiers);
end

function KrowiAF_AchievementButtonMixin:OnShow()
	self:RegisterEvent("ACHIEVEMENT_EARNED");
	self:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
end

function KrowiAF_AchievementButtonMixin:OnHide()
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
	self:UnregisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
end

function KrowiAF_AchievementButtonMixin:OnEvent(event, ...)
	if event ~= "ACHIEVEMENT_EARNED" and event ~= "TRACKED_ACHIEVEMENT_LIST_CHANGED" then
		return;
	end
	if not self.Achievement then
		return;
	end
	local achievementId = ...;
	if achievementId ~= self.Achievement.Id then
		return;
	end

	local achievement = self.Achievement;
	if event == "ACHIEVEMENT_EARNED" then
		self.Achievement = nil;
		self:Update(achievement);
	elseif event == "TRACKED_ACHIEVEMENT_LIST_CHANGED" then
		self:SetAsTracked(IsTrackedAchievement(achievement.Id));
	end
end

function KrowiAF_AchievementButtonMixin:OnSizeChanged(width)
	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab or not self.Achievement or selectedTab.SelectedAchievement ~= self.Achievement then
		return;
	end
	if self.CachedWidthOnSizeChanged and self.CachedWidthOnSizeChanged ~= width then
		-- Delay here to give the previous OnSizeChanged to finish
		addon.DelayFunction("KrowiAF_AchievementButtonMixin_OnSizeChanged", 0.01, function()
			self.ForceDisplayObjectives = true;
			KrowiAF_AchievementsFrame.SelectionBehavior:TriggerEvent(SelectionBehaviorMixin.Event.OnSelectionChanged, self.Achievement, true);
			KrowiAF_AchievementsFrame:ScrollToNearest(self.Achievement);
			self.ForceDisplayObjectives = nil;
		end);
	end
	self.CachedWidthOnSizeChanged = width;
end

local cachedWidthDisplayObjectives;
function KrowiAF_AchievementButtonMixin:DisplayObjectives(forced)
	local objectives = KrowiAF_AchievementsObjectives;

	objectives:SetParent(self);
	objectives:SetPoint("TOP", self.HiddenDescription, "BOTTOM", 0, -8);
	objectives:SetPoint("LEFT", self.ObjectivesLeftAnchor, "RIGHT", 0, 0);
	objectives:SetPoint("RIGHT", self.Shield, "LEFT", 0, 0);
	objectives.Completed = self.Completed;
	objectives.FontHeight = self.FontHeight;
	local height = self.MinExpandedHeight; -- Compact or not, we need this height
	local id = self.Achievement.Id;
	if objectives.Id == id and cachedWidthDisplayObjectives == objectives:GetWidth() and not forced then
		-- Cached, nothing to do
	elseif self.Completed and GetPreviousAchievement(id) then
		objectives:SetHeight(1);
		objectives:ResetAll();
		objectives:DisplayProgressiveAchievement(id);
	else
		objectives:SetHeight(1);
		objectives:ResetAll();
		objectives:DisplayCriteria(id);
		cachedWidthDisplayObjectives = objectives:GetWidth();
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
	height = max(self.MinExpandedHeight, height);
	return height;
end

function KrowiAF_AchievementButtonMixin:SetSaturatedStyle(achievement, flags)
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end

	if state and (state == false or state == "Past") then
		return "NotObtainable";
	elseif state and state == "Current" then
		self.saturatedStyle = "TempObtainable";
	elseif state and state == "Future" then
		self.saturatedStyle = "TempObtainableFuture";
	else
		if flags.IsAccountWide then
			self.accountWide = true;
			return "account";
		else
			self.accountWide = nil;
			return "normal";
		end
	end
end

function KrowiAF_AchievementButtonMixin:SetShield(id, points)
	if GetPreviousAchievement(id) and points > 0 then
		points = AchievementButton_GetProgressivePoints(id);
	end
	local normalFont = self.Compact and GameFontHighlight or AchievementPointsFontHighlight;
	local smallFont = self.Compact and GameFontHighlightSmall or AchievementPointsFontHighlightSmall;
	AchievementShield_SetPoints(points, self.Shield.Points, normalFont, smallFont);

	local texture = points > 0 and "Interface/AchievementFrame/UI-Achievement-Shields" or "Interface/AchievementFrame/UI-Achievement-Shields-NoPoints";
	self.Shield.Icon:SetTexture(texture);
end

function KrowiAF_AchievementButtonMixin:SetCompletionState(achievement, completed, month, day, year, wasEarnedByMe, saturatedStyle)
	local earnedByFilter = addon.Filters.db.profile.EarnedBy;
	if (earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe) or (earnedByFilter == addon.Filters.CharacterAccount and completed and wasEarnedByMe) then
		self.Completed = true;
		achievement.IsCompleted = true;
		self.DateCompleted:SetText(FormatShortDate(day, month, year));
		if not addon.Options.db.profile.Achievements.HideDateCompleted then
			self.DateCompleted:Show();
		end
		if self.saturatedStyle ~= saturatedStyle then
			self:Saturate();
		end
		return;
	end
	if (earnedByFilter == addon.Filters.CharacterAccount and completed and not wasEarnedByMe) then
		self.Completed = true;
		achievement.IsCompleted = true;
		self.DateCompleted:SetText(FormatShortDate(day, month, year));
		if not addon.Options.db.profile.Achievements.HideDateCompleted then
			self.DateCompleted:Show();
		end
		self:SaturatePartial();
		return;
	end
	self.Completed = nil;
	achievement.IsCompleted = nil;
	self.DateCompleted:Hide();
	self:Desaturate();
end

function KrowiAF_AchievementButtonMixin:SetRewardText(rewardText)
	if rewardText == "" then
		if self.Compact then
			self.Reward:SetText(nil);
			self.Description:Show();
		end
		self.Reward:Hide();
		self.RewardBackground:Hide();
		return;
	end

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

function KrowiAF_AchievementButtonMixin:SetFaction(achievement)
	if achievement.Faction == addon.Objects.Faction.Alliance and addon.Options.db.profile.Achievements.ShowAllianceFactionIcon then
		self.Faction.Icon:SetAtlas("MountJournalIcons-Alliance");
		self.Faction:Show();
		return;
	end
	if achievement.Faction == addon.Objects.Faction.Horde and addon.Options.db.profile.Achievements.ShowHordeFactionIcon then
		self.Faction.Icon:SetAtlas("MountJournalIcons-Horde");
		self.Faction:Show();
		return;
	end
	self.Faction:Hide();
end

function KrowiAF_AchievementButtonMixin:SetExtraIcon(achievement)
	if achievement.AlwaysVisible then
		self.ExtraIcon.Texture:SetAtlas("flightpath");
		self.ExtraIcon.Text = addon.L["Achievement shown temporarily"];
		self.ExtraIcon:Show();
		return;
	end
	if achievement.IsWatched then
		self.ExtraIcon.Texture:SetAtlas("groupfinder-eye-frame");
		self.ExtraIcon.Text = addon.L["Achievement is watched"]:K_ReplaceVars(addon.L["Watch List"]);
		self.ExtraIcon:Show();
		return;
	end
	if achievement.IsExcluded then
		self.ExtraIcon.Texture:SetAtlas("XMarksTheSpot");
		self.ExtraIcon.Text = addon.L["Achievement is excluded"];
		self.ExtraIcon:Show();
		return;
	end
	self.ExtraIcon:Hide();
end

function KrowiAF_AchievementButtonMixin:SetAchievementData(achievement, id, name, points, completed, month, day, year, description, flags, icon, rewardText, wasEarnedByMe)
	self.Achievement = achievement;

	local saturatedStyle = self:SetSaturatedStyle(achievement, flags);

	if flags.IsAccountWide then
		achievement.IsAccountWide = true;
	else
		achievement.IsAccountWide = nil;
	end

	self.Header:SetText(name);
	self.Icon.Texture:SetTexture(icon);
	self.Description:SetText(description);
	self.HiddenDescription:SetText(description);
	self.numLines = ceil(self.HiddenDescription:GetHeight() / self.FontHeight);
	self:SetShield(id, points);
	self:SetCompletionState(achievement, completed, month, day, year, wasEarnedByMe, saturatedStyle);
	self:SetRewardText(rewardText);
	self:SetFaction(achievement);
	self:SetExtraIcon(achievement);
end

function KrowiAF_AchievementButtonMixin:SetAchievement(achievement, refresh)
	if not achievement then
		self.Achievement = nil;
		return;
	end

	if self.Achievement ~= achievement or refresh then
		local id, name, points, completed, month, day, year, description, flags, icon, rewardText, _, wasEarnedByMe = addon.GetAchievementInfo(achievement.Id);
		self:SetAchievementData(achievement, id, name, points, completed, month, day, year, description, flags, icon, rewardText, wasEarnedByMe);
	end

	self:SetAsTracked(IsTrackedAchievement(achievement.Id));
	self:UpdatePlusMinusTexture();
end

function KrowiAF_AchievementButtonMixin:Update(achievement, refresh, notSelectable)
	local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(achievement.Id);
	self:SetAchievement(achievement, refresh);

	local selectedTab = addon.Gui.SelectedTab;
	local objectives = KrowiAF_AchievementsObjectives;
	local objectivesParent = objectives:GetParent();
	if (objectivesParent and objectivesParent.Achievement and objectivesParent.Achievement.Id ~= objectives.Id) or (selectedTab and selectedTab.SelectedAchievement == nil) then
		objectives:Hide();
	end

	if selectedTab and achievement == selectedTab.SelectedAchievement and not notSelectable then
		self.Highlight:Show();
		local height = self:DisplayObjectives(self.ForceDisplayObjectives);
		self:Expand(height);
		if not completed or not wasEarnedByMe then
			self.Tracked:Show();
		end
	else
		self:Collapse();
	end

	if not self.Compact then
		return;
	end

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

function KrowiAF_AchievementButtonMixin:UpdatePlusMinusTexture()
	if self.Achievement == nil then
		return; -- This happens when we create buttons
	end

	local id = self.Achievement.Id;
	local display = self.Compact or GetAchievementNumCriteria(id) ~= 0 or (self.Completed and GetPreviousAchievement(id));
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
	self.NewHeight = self.CollapsedHeight;
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
	self.NewHeight = height;
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
	if not IsModifierKeyDown() or ignoreModifiers then
		return;
	end

	if addon.IsCustomModifierKeyDown(addon.Options.db.profile.Achievements.Modifiers.PasteToChat) then
		local achievementLink = GetAchievementLink(self.Achievement.Id);
		if achievementLink then
			if ChatEdit_InsertLink(achievementLink) then
				return true;
			end
			if SocialPostFrame and Social_IsShown() then
				Social_InsertLink(achievementLink);
				return true;
			end
		end
	end
	if addon.IsCustomModifierKeyDown(addon.Options.db.profile.Achievements.Modifiers.ToggleTracking) then
		self:ToggleTracking();
		return true;
	end
	if addon.IsCustomModifierKeyDown(addon.Options.db.profile.Achievements.Modifiers.ToggleWatchList) then
		if self.Achievement.IsWatched then
			addon.ClearWatchAchievement(self.Achievement);
		else
			addon.WatchAchievement(self.Achievement);
		end
		return true;
	end
	if addon.IsCustomModifierKeyDown(addon.Options.db.profile.Achievements.Modifiers.ToggleExcluded) then
		if self.Achievement.IsExcluded then
			addon.IncludeAchievement(self.Achievement);
		else
			addon.ExcludeAchievement(self.Achievement);
		end
		return true;
	end
	return true;
end

function KrowiAF_AchievementButtonMixin:Select(ignoreModifiers)
	if self:ProcessedModifiers(ignoreModifiers) then
		return;
	end

	KrowiAF_AchievementsFrame.SelectionBehavior:ToggleSelect(self);
	KrowiAF_AchievementsFrame:ScrollToNearest(self.Achievement);
end

function KrowiAF_AchievementButtonMixin:ShowTooltip()
	if not self.Achievement then
		return;
	end
	addon.Gui.AchievementTooltip.ShowTooltip(self, self.Achievement);
end

function KrowiAF_AchievementButtonMixin:ToggleTracking()
	self:UnregisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");

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

	local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = GetAchievementInfo(id);
	local earnedByFilter = addon.Filters.db.profile.EarnedBy;
	if (earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe) or (earnedByFilter == addon.Filters.CharacterAccount and completed and wasEarnedByMe) then
		UIErrorsFrame:AddMessage(ERR_ACHIEVEMENT_WATCH_COMPLETED, 1.0, 0.1, 0.1, 1.0);
		self:SetAsTracked(false);
		return;
	end

	local trackingError = AddTrackedAchievement(id);
	self:SetAsTracked(true);
	if trackingError then
		ContentTrackingUtil.DisplayTrackingError(trackingError);
	end

	self:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");

	return true;
end

function KrowiAF_AchievementButtonMixin:SetAsTracked(isTracked)
	self.Achievement.IsTracked = nil;
	if isTracked then
		self.Achievement.IsTracked = true;
	end
	if isTracked and not self.Compact then
		self.Tracked:Show();
	else
		local selectedTab = addon.Gui.SelectedTab;
		if selectedTab and selectedTab.SelectedAchievement ~= self.Achievement then
			self.Tracked:Hide();
		end
	end
	self.Check:SetShown(isTracked);
	self.Tracked:SetChecked(isTracked);
	-- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
	self.Header:SetWidth(isTracked and self.Header:GetStringWidth() + 4 or ACHIEVEMENTBUTTON_LABELWIDTH);
	WatchFrame_Update(); -- Needed for Wrath Classic, does nothing for Retail
end