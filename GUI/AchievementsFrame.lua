-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementsFrame = {};
local achievementsFrame = addon.GUI.AchievementsFrame;

local achievementsWidth = 504;
local achievementsWidthScrollBarOffset = 26;
local achievementsButtonOffset = 8;

achievementsFrame.__index = achievementsFrame; -- Used to inject all the namespace functions to the frame
function achievementsFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameAchievementsFrame", AchievementFrame, "KrowiAF_AchievementFrameAchievementsFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPRIGHT", 22, 0);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetWidth(achievementsWidth);
	addon.Util.InjectMetatable(frame, achievementsFrame); -- Inject all the namespace functions to the frame

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, frame:GetName());

	local scrollFrame = frame.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local scrollBarShow = getmetatable(scrollBar).__index.Show;
	scrollBar.Show = function()
		self.Show_Hide(frame, scrollBarShow, achievementsWidth, achievementsButtonOffset);
	end;
	local scrollBarHide = getmetatable(scrollBar).__index.Hide;
	scrollBar.Hide = function()
		self.Show_Hide(frame, scrollBarHide, achievementsWidth + achievementsWidthScrollBarOffset, achievementsButtonOffset);
	end;

	scrollFrame.update = function()
		frame:Update();
	end

	local template = "KrowiAF_AchievementFrameAchievementsFrameAchievementButton" .. (addon.Options.db.Achievements.Compact and "_Small" or "") .. "_Template";
	HybridScrollFrame_CreateButtons(scrollFrame, template, 0, -2);
	addon.GUI.AchievementButton:PostLoadButtons(frame);

	hooksecurefunc("AchievementFrameAchievements_ForceUpdate", function()
		frame:ForceUpdate();
	end); -- Issue #3: Fix

	addon.GUI.AchievementsFrame = frame; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_AchievementFrameAchievementsFrame_OnShow(self)
	AchievementButton_ResetMetas(true);
	AchievementButton_ResetMetas(false);
	AchievementButton_ResetCriteria(true);
	AchievementButton_ResetCriteria(false);
	self:ForceUpdate(); -- Issue #42: Fix
end

function KrowiAF_AchievementFrameAchievementsFrame_OnHide(self)
	if self.Container.buttons[1] then -- Calling this on a single button hides them all
		self.Container.buttons[1].ResetMetas(true);
		self.Container.buttons[1].ResetMetas(false);
		self.Container.buttons[1].ResetCriteria(true);
		self.Container.buttons[1].ResetCriteria(false);
	end
	AchievementFrameAchievements_ForceUpdate(); -- Issue #42: Fix
end

function achievementsFrame.Show_Hide(frame, func, _achievementsWidth, _achievementsButtonOffset)
	local scrollFrame = frame.Container;

	frame:SetWidth(_achievementsWidth);

	local buttons = scrollFrame.buttons;
	for _, button in next, buttons do
		button:SetWidth(_achievementsWidth - _achievementsButtonOffset);
	end

	func(scrollFrame.ScrollBar);
end

local function Validate(achievements, displayAchievements, defaultOrder)
	if not achievements then
		return;
	end
	local filters = addon.Filters;
	for _, achievement in next, achievements do
		if filters and filters:AutoValidate(achievement) > 0 then -- Greater than 0 means it can be shown
			tinsert(displayAchievements, achievement);
		end
		defaultOrder[achievement] = #displayAchievements;
	end
end

local function GetFilteredAchievements(category)
	local displayAchievements = {};
	local defaultOrder = {};

	Validate(category.Achievements, displayAchievements, defaultOrder);
	Validate(category.MergedAchievements, displayAchievements, defaultOrder);

	if #displayAchievements == 0 then
		return displayAchievements;
	end

	local filters = addon.Filters;
	if filters then
		return filters:Sort(displayAchievements, defaultOrder);
	end
	return displayAchievements;
end

local cachedCategory, cachedAchievements; -- Caching this speeds up the scrolling of achievements when the selected category isn't changed
local highlightedButton;
function achievementsFrame:Update()
	local selectedTab = addon.GUI.SelectedTab;
	local selectedCategory = selectedTab.SelectedCategory;
	local selectedAchievement = selectedTab.SelectedAchievement;
	local scrollFrame = self.Container;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numButtons = #buttons;

	local updateAchievements = cachedCategory ~= selectedCategory;
	cachedCategory = selectedCategory;
	if cachedCategory == addon.Data.CurrentZoneCategory then
		updateAchievements = addon.Data.GetCurrentZoneAchievements() or updateAchievements;
	end

	if updateAchievements then
		cachedAchievements = GetFilteredAchievements(cachedCategory);
	end

	self.Text:Hide();

	if selectedAchievement then
		AchievementFrameAchievementsObjectives:Hide();
	end

	local index;
	local displayedHeight = 0;
	for i = 1, numButtons do
		index = i + offset;
		if index > #cachedAchievements then
			buttons[i]:Hide();
		else
			self:DisplayAchievement(buttons[i], cachedAchievements[index], index, selectedAchievement);
			displayedHeight = displayedHeight + buttons[i]:GetHeight();
		end
	end

	local buttonCollapsedHeight = addon.Options.db.Achievements.ButtonCollapsedHeight;
	local totalHeight = #cachedAchievements * buttonCollapsedHeight;
	local extraHeight = scrollFrame.largeButtonHeight or buttonCollapsedHeight;
	totalHeight = totalHeight + extraHeight - buttonCollapsedHeight;

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);

	if not selectedAchievement then
		HybridScrollFrame_CollapseButton(scrollFrame);
	end

	-- Make sure the correct tooltip is shown
	if highlightedButton then
		highlightedButton.ShowTooltip();
	end
end

function achievementsFrame:ForceUpdate(toTop) -- Issue #3: Fix
	if not self:IsShown() then -- Issue #8: Fix, Issue #10 : Broken
		return;
	end

	if toTop then -- Issue #27: Fix
		self.Container.ScrollBar:SetValue(0);
	end

	local filters = addon.Filters;
	if filters then
		local selectedTab = addon.GUI.SelectedTab;
		selectedTab.SelectedAchievement = filters.GetHighestAchievementWhenCollapseSeries(selectedTab.Filters, selectedTab.SelectedAchievement);
	end

	-- Issue #8: Broken
	AchievementFrameAchievementsObjectives:Hide();
	AchievementFrameAchievementsObjectives.id = nil;

	local buttons = self.Container.buttons;
	for _, button in next, buttons do
		button.id = nil;
	end

	-- Clear the cache
	cachedCategory = nil;
	cachedAchievements = nil;

	self:Update();
end

function achievementsFrame:ClearSelection()
	AchievementFrameAchievementsObjectives:Hide();
	local buttons = self.Container.buttons;
	for _, button in next, buttons do
		button:Collapse();
		if not button:IsMouseOver() then
			button.highlight:Hide();
		end
		button.selected = nil;
		if not button.tracked:GetChecked() then
			button.tracked:Hide();
		end
		if button.reward:GetText() == nil or not addon.Options.db.Achievements.Compact then
			button.description:Show();
		else
			button.description:Hide();
		end
		button.hiddenDescription:Hide();
	end

	addon.GUI.SelectedTab.SelectedAchievement = nil;
end

function achievementsFrame:SelectButton(button)
	addon.GUI.SelectedTab.SelectedAchievement = button.Achievement;
	button.selected = true;

	SetFocusedAchievement(button.Achievement.ID);
end

function achievementsFrame:FindSelection()
	local scrollFrame = self.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;
	local _, maxVal = scrollBar:GetMinMaxValues();
	local scrollHeight = scrollFrame:GetHeight();
	local newHeight = 0;

	scrollBar:SetValue(0);
	while true do
		for _, button in next, buttons do
			if button.selected then
				local scrollBarValue = scrollBar:GetValue();
				local scrollFrameTop = scrollFrame:GetTop();
				local buttonTop = button:GetTop();
				newHeight = scrollBarValue + scrollFrameTop - buttonTop;
				newHeight = min(newHeight, maxVal);
				scrollBar:SetValue(newHeight);
				return;
			end
		end
		if not scrollBar:IsVisible() or scrollBar:GetValue() == maxVal then
			return;
		else
			newHeight = newHeight + scrollHeight;
			newHeight = min(newHeight, maxVal);
			scrollBar:SetValue(newHeight);
		end
	end
end

function achievementsFrame:AdjustSelection()
	local scrollFrame = self.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;
	local selectedButton;

	-- check if selection is visible
	for _, button in next, buttons do
		if button.selected then
			selectedButton = button;
			break;
		end
	end

	if not selectedButton then
		self:FindSelection();
		return;
	end

	local newHeight;
	if selectedButton:GetTop() > scrollFrame:GetTop() then
		newHeight = scrollBar:GetValue() + scrollFrame:GetTop() - selectedButton:GetTop();
	elseif selectedButton:GetBottom() < scrollFrame:GetBottom() then
		if selectedButton:GetHeight() > scrollFrame:GetHeight() then
			newHeight = scrollBar:GetValue() + scrollFrame:GetTop() - selectedButton:GetTop();
		else
			newHeight = scrollBar:GetValue() + scrollFrame:GetBottom() - selectedButton:GetBottom();
		end
	end
	if newHeight then
		local _, maxVal = scrollBar:GetMinMaxValues();
		newHeight = min(newHeight, maxVal);
		scrollBar:SetValue(newHeight);
	end
end

function achievementsFrame:DisplayAchievement(button, achievement, index, selection, renderOffScreen)
	local compact = addon.Options.db.Achievements.Compact;
	local earnedByFilter = addon.Filters.db.EarnedBy;

	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = addon.GetAchievementInfo(achievement.ID);

	button:Show();

	button.index = index;
	button.Achievement = achievement;

	if button.id ~= id then
		local saturatedStyle;
		if achievement.NotObtainable then
			saturatedStyle = "NotObtainable";
		else
			if bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT then
				button.accountWide = true;
				saturatedStyle = "account";
			else
				button.accountWide = nil;
				saturatedStyle = "normal";
			end
		end
		button.id = id;
		local labelWidth = ACHIEVEMENTBUTTON_LABELWIDTH;
		if compact then
			labelWidth = labelWidth - 10;
		end
		button.label:SetWidth(labelWidth);
		button.label:SetText(name);

		if GetPreviousAchievement(id) then
			-- If this is a progressive achievement, show the total score.
			AchievementShield_SetPoints(AchievementButton_GetProgressivePoints(id), button.shield.points, AchievementPointsFont, AchievementPointsFontSmall);
		else
			AchievementShield_SetPoints(points, button.shield.points, AchievementPointsFont, AchievementPointsFontSmall);
		end

		local texture = points > 0 and "Interface/AchievementFrame/UI-Achievement-Shields" or "Interface/AchievementFrame/UI-Achievement-Shields-NoPoints";
		button.shield.icon:SetTexture(texture);

		if isGuild then
			button.shield.points:Show();
			button.shield.wasEarnedByMe = nil;
			button.shield.earnedBy = nil;
		else
			button.shield.wasEarnedByMe = completed and wasEarnedByMe;
			button.shield.earnedBy = earnedBy;
		end

		button.shield.id = id;
		button.description:SetText(description);
		button.hiddenDescription:SetText(description);
		button.numLines = ceil(button.hiddenDescription:GetHeight() / self.UIFontHeight);
		button.icon.texture:SetTexture(icon);
		if (earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe) or (earnedByFilter == addon.Filters.CharacterAccount and completed and wasEarnedByMe) then
			button.completed = true;
			button.dateCompleted:SetText(FormatShortDate(day, month, year));
			button.dateCompleted:Show();
			if button.saturatedStyle ~= saturatedStyle then
				button:Saturate();
			end
		elseif (earnedByFilter == addon.Filters.CharacterAccount and completed and not wasEarnedByMe) then
			button.completed = true;
			button.dateCompleted:SetText(FormatShortDate(day, month, year));
			button.dateCompleted:Show();
			button:SaturatePartial();
		else
			button.completed = nil;
			button.dateCompleted:Hide();
			button:Desaturate();
		end

		if rewardText == "" then
			if compact then
				button.reward:SetText(nil);
				button.description:Show();
			end
			button.reward:Hide();
			button.rewardBackground:Hide();
		else
			button.reward:SetText(rewardText);
			button.reward:Show();
			button.rewardBackground:Show();
			if button.completed then
				button.rewardBackground:SetVertexColor(1, 1, 1);
			else
				button.rewardBackground:SetVertexColor(0.35, 0.35, 0.35);
			end
			if compact then
				button.description:Hide();
			end
		end
	end

	if IsTrackedAchievement(id) then -- Issue #10 : Fix
		button.check:Show();
		button.label:SetWidth(button.label:GetStringWidth() + 4); -- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
		button.tracked:SetChecked(true);
		if not compact then
			button.tracked:Show();
		end
	else
		button.check:Hide();
		button.tracked:SetChecked(false);
		button.tracked:Hide();
	end

	button:UpdatePlusMinusTexture();

	if selection and id == selection.ID then
		button.selected = true;
		button.highlight:Show();
		local height = button:DisplayObjectives(renderOffScreen);

		if height == ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT then
			button:Collapse();
		else
			button:Expand(height);
		end
		if not completed or (not wasEarnedByMe and not isGuild) then
			button.tracked:Show();
		end
	elseif button.selected then
		button.selected = nil;
		if not button:IsMouseOver() then -- This causes the first 2 - 3 achievement to be highlighted when changing the filter if the mouse is over one of the achievements
			button.highlight:Hide();
		end
		button:Collapse();
		if compact and button.reward:GetText() ~= nil then
			button.description:Hide();
		else
			button.description:Show();
		end
		button.hiddenDescription:Hide();
	end

	return id;
end

function achievementsFrame.SetHighlightedButton(button)
	highlightedButton = button;
end

function achievementsFrame.ClearHighlightedButton()
	highlightedButton = nil;
end