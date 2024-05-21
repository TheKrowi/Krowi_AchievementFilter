local _, addon = ...;
local saturationStyle = addon.Objects.SaturationStyle;

local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";
local notObtainableSaturationStyle = saturationStyle:New(
	function(state) return state and (state == false or state == "Past"); end,
	"NotObtainable",
	media .. "NotObtainableAchievementBorders",
	nil,
	nil,
	function() return ACHIEVEMENT_RED_BORDER_COLOR; end
);
local tempObtainableSaturationStyle = saturationStyle:New(
	function(state) return state and state == "Current"; end,
	"TempObtainable",
	media .. "TempObtainableAchievementBorders",
	nil,
	nil,
	function() return CreateColor(0, 0.67, 0); end -- Green
);
local tempObtainableFutureSaturationStyle = saturationStyle:New(
	function(state) return state and state == "Future"; end,
	"TempObtainableFuture",
	media .. "TempObtainableFutureAchievementBorders",
	nil,
	nil,
	function() return ACHIEVEMENT_RED_BORDER_COLOR; end
);
local accountSaturationStyle = saturationStyle:New(
	function(_, isAccountWide) return isAccountWide; end,
	"account",
	nil,
	"Interface/AchievementFrame/AccountLevel-AchievementHeader",
	{
		Saturated = {0, 1, 0, 0.375},
		Desaturated = {0, 1, 0.40625, 0.78125}
	},
	function() return ACHIEVEMENT_BLUE_BORDER_COLOR; end
);
local saturationStyles = {
	notObtainableSaturationStyle,
	tempObtainableSaturationStyle,
	tempObtainableFutureSaturationStyle,
	accountSaturationStyle,
	saturationStyle:New()
};

local function GetSaturationStyle(state, isAccountWide)
	for _, _saturationStyle in next, saturationStyles do
		if _saturationStyle.UseThis(state, isAccountWide) then
			return _saturationStyle;
		end
	end
end

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

local function ProcessedModifiers(self, ignoreModifiers)
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

local function Select(self, ignoreModifiers)
	if ProcessedModifiers(self, ignoreModifiers) then
		return;
	end

	KrowiAF_AchievementsFrame.SelectionBehavior:ToggleSelect(self);
	KrowiAF_AchievementsFrame:ScrollToNearest(self.Achievement);
end

local function Click(self, button, ignoreModifiers)
	if button == "LeftButton" then
		Select(self, ignoreModifiers);
	elseif button == "RightButton" then
		addon.Gui.RightClickMenu.AchievementMenu:Open(self.Achievement);
	end
end

function KrowiAF_AchievementButtonLightMixin:OnClick(button, _, ignoreModifiers)
	if button ~= "LeftButton" then
		Click(self, button, ignoreModifiers);
		return;
	end
	if ProcessedModifiers(self, ignoreModifiers) then
		return;
	end
	KrowiAF_SelectAchievementFromID(self.Achievement.Id);
end

KrowiAF_AchievementButtonMixin = {};

local function SetAsTracked(self, isTracked)
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
		SetAsTracked(self, IsTrackedAchievement(achievement.Id));
	end
end

function KrowiAF_AchievementButtonMixin:OnShow()
	self:RegisterEvent("ACHIEVEMENT_EARNED");
	self:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
end

function KrowiAF_AchievementButtonMixin:OnHide()
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
	self:UnregisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
end

function KrowiAF_AchievementButtonMixin:OnEnter()
	KrowiAF_AchievementsFrame:SetHighlightedButton(self);
	self:ShowTooltip();
	self.Highlight:Show();
end

function KrowiAF_AchievementButtonMixin:OnLeave()
	KrowiAF_AchievementsFrame:ClearHighlightedButton();
	GameTooltip:Hide();
	local selectedTab = addon.Gui.SelectedTab;
	if selectedTab and self.Achievement ~= selectedTab.SelectedAchievement then
		self.Highlight:Hide();
	end
end

function KrowiAF_AchievementButtonMixin:OnClick(button, _, ignoreModifiers)
	Click(self, button, ignoreModifiers);
end

function KrowiAF_AchievementButtonMixin:OnSizeChanged(width)
	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab or not self.Achievement or selectedTab.SelectedAchievement ~= self.Achievement then
		return;
	end
	if self.CachedWidthOnSizeChanged and self.CachedWidthOnSizeChanged ~= width then
		-- Delay here to give the previous OnSizeChanged to finish
		addon.Util.DelayFunction("KrowiAF_AchievementButton_OnSizeChanged", 0.01, function()
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

local function GetSaturatedStyle(self, achievement, flags)
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end

	self.accountWide = nil;
	if flags.IsAccountWide then
		self.accountWide = true;
	end
	local _saturationStyle = GetSaturationStyle(state, self.accountWide);
	return _saturationStyle.Style;
end

local function SetShield(self, id, points)
	if GetPreviousAchievement(id) and points > 0 then
		points = AchievementButton_GetProgressivePoints(id);
	end
	local normalFont = self.Compact and GameFontHighlight or AchievementPointsFontHighlight;
	local smallFont = self.Compact and GameFontHighlightSmall or AchievementPointsFontHighlightSmall;
	AchievementShield_SetPoints(points, self.Shield.Points, normalFont, smallFont);

	local texture = points > 0 and "Interface/AchievementFrame/UI-Achievement-Shields" or "Interface/AchievementFrame/UI-Achievement-Shields-NoPoints";
	self.Shield.Icon:SetTexture(texture);
end

local function UpdatePlusMinusTexture(self)
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
		self.PlusMinus:SetTexCoord(0, 0.5, 0, addon.Util.IsWrathClassic and 0.5 or 0.25);
	elseif self.collapsed then
		self.PlusMinus:SetTexCoord(0.5, 1, 0, addon.Util.IsWrathClassic and 0.5 or 0.25);
	elseif self.saturatedStyle then
		self.PlusMinus:SetTexCoord(0, 0.5, addon.Util.IsWrathClassic and 0.5 or 0.25, addon.Util.IsWrathClassic and 1 or 0.5);
	else
		self.PlusMinus:SetTexCoord(0.5, 1, addon.Util.IsWrathClassic and 0.5 or 0.25, addon.Util.IsWrathClassic and 1 or 0.5);
	end
end

local function SetTsunamis(self)
	if self.Compact then
		return;
	end
	local achievement = self.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end

	local _saturationStyle = GetSaturationStyle(state);
	local texture = _saturationStyle.BordersTexture;

	self.BottomTsunami:SetTexture(texture);
	self.BottomTsunami:SetAlpha(0.35);
	self.TopTsunami:SetTexture(texture);
	self.TopTsunami:SetAlpha(0.3);
	self.BottomTsunami:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
	self.TopTsunami:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
end

local function Saturate(self)
	local achievement = self.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
	local _saturationStyle = GetSaturationStyle(state, self.accountWide);
	self.saturatedStyle = _saturationStyle.Style;
	self.HeaderBackground:SetTexture(_saturationStyle.HeaderBackgroundTexture);
	self.HeaderBackground:SetTexCoord(unpack(_saturationStyle.HeaderBackgroundCoords.Saturated));
	local backdropBorderColor =_saturationStyle.GetBackdropBorderColor();
	self:SetBackdropBorderColor(backdropBorderColor:GetRGB());
	self.Background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal");
	self.Glow:SetVertexColor(1, 1, 1);
	self.Icon.Texture:SetVertexColor(1, 1, 1, 1);
	self.Icon.Border:SetVertexColor(1, 1, 1, 1);
	self.Shield.Icon:SetTexCoord(0, 0.5, 0, addon.Util.IsWrathClassic and 1 or 0.5);
	self.Shield.Points:SetVertexColor(1, 1, 1);
	self.Reward:SetVertexColor(1, 0.82, 0);
	self.Header:SetVertexColor(1, 1, 1);
	self.Description:SetTextColor(0, 0, 0, 1);
	self.Description:SetShadowOffset(0, 0);
	UpdatePlusMinusTexture(self);
	SetTsunamis(self);
end

local function Desaturate(self)
	local achievement = self.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
	local _saturationStyle = GetSaturationStyle(state, self.accountWide);
	self.saturatedStyle = nil;
	self.HeaderBackground:SetTexture(_saturationStyle.HeaderBackgroundTexture);
	self.HeaderBackground:SetTexCoord(unpack(_saturationStyle.HeaderBackgroundCoords.Desaturated));
	self:SetBackdropBorderColor(0.5, 0.5, 0.5);
	self.Background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal-Desaturated");
	self.Glow:SetVertexColor(0.22, 0.17, 0.13);
	self.Icon.Texture:SetVertexColor(0.55, 0.55, 0.55, 1);
	self.Icon.Border:SetVertexColor(0.75, 0.75, 0.75, 1);
	self.Shield.Icon:SetTexCoord(0.5, 1, 0, addon.Util.IsWrathClassic and 1 or 0.5);
	self.Shield.Points:SetVertexColor(0.65, 0.65, 0.65);
	self.Reward:SetVertexColor(0.8, 0.8, 0.8);
	self.Header:SetVertexColor(0.65, 0.65, 0.65);
	self.Description:SetTextColor(1, 1, 1, 1);
	self.Description:SetShadowOffset(1, -1);
	UpdatePlusMinusTexture(self);
	SetTsunamis(self);
end

local function SaturatePartial(self)
	Desaturate(self);
	self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
	self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
	self.Icon.Texture:SetVertexColor(1, 1, 1, 1);
	self.Icon.Border:SetVertexColor(1, 1, 1, 1);
	self.Shield.Icon:SetTexCoord(0, 0.5, 0, addon.Util.IsWrathClassic and 1 or 0.5);
	self.Shield.Points:SetVertexColor(1, 1, 1);
	self.Glow:SetVertexColor(0.1, 0.1, 0.1);
	SetTsunamis(self);
end

local function SetCompletionState(self, achievement, completed, month, day, year, wasEarnedByMe, saturatedStyle)
	local earnedByFilter = addon.Filters.db.profile.EarnedBy;
	if (earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe) or (earnedByFilter == addon.Filters.CharacterAccount and completed and wasEarnedByMe) then
		self.Completed = true;
		achievement.IsCompleted = true;
		self.DateCompleted:SetText(FormatShortDate(day, month, year));
		if not addon.Options.db.profile.Achievements.HideDateCompleted then
			self.DateCompleted:Show();
		end
		if self.saturatedStyle ~= saturatedStyle then
			Saturate(self);
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
		SaturatePartial(self);
		return;
	end
	self.Completed = nil;
	achievement.IsCompleted = nil;
	self.DateCompleted:Hide();
	Desaturate(self);
end

local function SetRewardText(self, rewardText)
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

local function SetFaction(self, achievement)
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

local function ResetExtraIcons(self)
	self.ExtraIcon1.Used = nil;
	self.ExtraIcon1:Hide();
	self.ExtraIcon2.Used = nil;
	self.ExtraIcon2:Hide();
end

local function GetExtraIcon(self)
	if not self.ExtraIcon1.Used then
		self.ExtraIcon1.Used = true;
		self.ExtraIcon1:Show();
		return self.ExtraIcon1;
	end
	if not self.ExtraIcon2.Used then
		self.ExtraIcon2.Used = true;
		self.ExtraIcon2:Show();
		return self.ExtraIcon2;
	end
end

local function SetExtraIconAlwaysVisible(self, achievement)
	if not achievement.AlwaysVisible then
		return;
	end

	local extraIcon = GetExtraIcon(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("flightpath");
	extraIcon.Text = addon.L["Achievement shown temporarily"];
end

local function SetExtraIconIsWatched(self, achievement)
	if not achievement.IsWatched then
		return;
	end

	local extraIcon = GetExtraIcon(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("groupfinder-eye-frame");
	extraIcon.Text = addon.L["Achievement is watched"]:K_ReplaceVars(addon.L["Watch List"]);
end

local function SetExtraIconIsExcluded(self, achievement)
	if not achievement.IsExcluded then
		return;
	end

	local extraIcon = GetExtraIcon(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("XMarksTheSpot");
	extraIcon.Text = addon.L["Achievement is excluded"];
end

local function SetExtraIconRemixPandaria(self, achievement)
	if not achievement.TemporaryObtainable
	or not achievement.TemporaryObtainable.Start
	or achievement.TemporaryObtainable.Start.Function ~= "Event"
	or achievement.TemporaryObtainable.Start.Value ~= "1514" then
		return;
	end

	local extraIcon = GetExtraIcon(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("timerunning-glues-icon");
	extraIcon.Text = addon.L["Achievement is excluded"];
end

local function SetExtraIcons(self, achievement)
	ResetExtraIcons(self);
	SetExtraIconRemixPandaria(self, achievement);
	SetExtraIconAlwaysVisible(self, achievement);
	SetExtraIconIsWatched(self, achievement);
	SetExtraIconIsExcluded(self, achievement);
end

function KrowiAF_AchievementButtonMixin:SetAchievementData(achievement, id, name, points, completed, month, day, year, description, flags, icon, rewardText, wasEarnedByMe)
	self.Achievement = achievement;

	local saturatedStyle = GetSaturatedStyle(self, achievement, flags);

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
	SetShield(self, id, points);
	SetCompletionState(self, achievement, completed, month, day, year, wasEarnedByMe, saturatedStyle);
	SetRewardText(self, rewardText);
	SetFaction(self, achievement);
	SetExtraIcons(self, achievement);
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

	SetAsTracked(self, IsTrackedAchievement(achievement.Id));
	UpdatePlusMinusTexture(self);
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

	-- print(achievement and achievement.Id, selectedTab and achievement == selectedTab.SelectedAchievement)
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

function KrowiAF_AchievementButtonMixin:Collapse()
	if self.collapsed then
		return;
	end

	self.collapsed = true;
	UpdatePlusMinusTexture(self);
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
	UpdatePlusMinusTexture(self);
	self:SetHeight(height);
	self.NewHeight = height;
	self.Background:SetTexCoord(0, 1, max(0, 1 - (height / 256)), 1);
	self.HiddenDescription:Show();
	self.Description:Hide();
end

function KrowiAF_AchievementButtonMixin:ShowTooltip()
	if not self.Achievement then
		return;
	end
	addon.Gui.AchievementTooltip:ShowTooltip(self, self.Achievement);
end

function KrowiAF_AchievementButtonMixin:ToggleTracking()
	self:UnregisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");

	local id = self.Achievement.Id;
	if self.Achievement.IsTracked then
		RemoveTrackedAchievement(id);
		SetAsTracked(self, false);
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
		SetAsTracked(self, false);
		return;
	end

	local trackingError = AddTrackedAchievement(id);
	SetAsTracked(self, true);
	if trackingError then
		ContentTrackingUtil.DisplayTrackingError(trackingError);
	end

	self:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");

	return true;
end