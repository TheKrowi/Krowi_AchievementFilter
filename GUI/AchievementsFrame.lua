-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.AchievementsFrame = {};
local achievementsFrame = gui.AchievementsFrame;

achievementsFrame.__index = achievementsFrame; -- Used to inject all the namespace functions to the frame
function achievementsFrame:Load()
    diagnostics.Trace("achievementsFrame:Load");

	-- Create frame
	local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameAchievements", AchievementFrame, "KrowiAF_AchievementsFrame_Template");
	frame:SetWidth(504);
	addon.Util.InjectMetatable(frame, achievementsFrame); -- Inject all the namespace functions to the frame

	-- Set properties
	frame.UIFontHeight = nil;

	-- Set parents
	frame.Container.ParentFrame = frame;
	frame.Container.ScrollBar.ParentContainer = frame.Container;

	-- Rest
	frame:RegisterEvent("ADDON_LOADED");

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, frame:GetName());
	frame:Hide();

	frame.Container.ScrollBar.Show = function()
		self.Show_Hide(frame, frame.Container.ScrollBar, getmetatable(frame.Container.ScrollBar).__index.Show, 504, 8);
	end;
	frame.Container.ScrollBar.Hide = function()
		self.Show_Hide(frame, frame.Container.ScrollBar, getmetatable(frame.Container.ScrollBar).__index.Hide, 530, 8);
	end;

	frame.Container.ScrollBar.trackBG:Show();
	frame.Container.update = function(container)
		diagnostics.Trace("AchievementsFrame.Container.update");
		container.ParentFrame:Update();
	end

	local template = "KrowiAF_AchievementButton_Template";
	if addon.Options.db.Achievements.Compact then
		template = "KrowiAF_Small_AchievementButton_Template";
	end
	HybridScrollFrame_CreateButtons(frame.Container, template, 0, -2);
	-- diagnostics.Debug(frame.Container.buttons[1]:GetHeight());
	-- diagnostics.Debug(frame.Container:GetHeight());
	-- diagnostics.Debug(math.ceil(frame.Container:GetHeight() / frame.Container.buttons[1]:GetHeight()) + 1);
	gui.AchievementButton:PostLoadButtons(frame);

	hooksecurefunc("AchievementFrameAchievements_ForceUpdate", function()
		frame:ForceUpdate();
	end); -- Issue #3: Fix

	addon.GUI.AchievementsFrame = frame; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_AchievementsFrame_OnShow(self) -- Used in Templates - KrowiAF_AchievementsFrame_Template
	diagnostics.Trace("KrowiAF_AchievementsFrame_OnShow");

	AchievementButton_ResetMetas(true);
	AchievementButton_ResetMetas(false);
	AchievementButton_ResetCriteria(true);
	AchievementButton_ResetCriteria(false);
	self:ForceUpdate(); -- Issue #42: Fix
end

function KrowiAF_AchievementsFrame_OnHide(self) -- Used in Templates - KrowiAF_AchievementsFrame_Template
	diagnostics.Trace("KrowiAF_AchievementsFrame_OnHide");

	if self.Container.buttons[1] then -- Calling this on a single button hides them all
		self.Container.buttons[1].ResetMetas(true);
		self.Container.buttons[1].ResetMetas(false);
		self.Container.buttons[1].ResetCriteria(true);
		self.Container.buttons[1].ResetCriteria(false);
	end
	AchievementFrameAchievements_ForceUpdate(); -- Issue #42: Fix
end

function achievementsFrame.Show_Hide(frame, self, func, achievementsWidth, achievementsButtonOffset)
	diagnostics.Trace("achievementsFrame.Show_Hide");

	frame:SetWidth(achievementsWidth);
	for _, button in next, frame.Container.buttons do
		button:SetWidth(achievementsWidth - achievementsButtonOffset);
	end
	func(self);
end

local function Validate(achievements, achievement)
	if gui.FilterButton and gui.FilterButton:AutoValidate(achievement) > 0 then
		tinsert(achievements, achievement);
	end
end

local function GetFilteredAchievements(self, category)
	diagnostics.Trace("GetFilteredAchievements");

	local achievements = {};
	local indexes = {};

	-- Filter achievements
	if category.Achievements then
		for _, achievement in next, category.Achievements do
			Validate(achievements, achievement);
			indexes[achievement] = #achievements;
		end
	end

	-- Filter merged achievements
	if category.MergedAchievements then
		for _, achievement in next, category.MergedAchievements do
			Validate(achievements, achievement);
			indexes[achievement] = #achievements;
		end
	end

	local filters = gui.FilterButton:GetFilters();
	if category.Achievements or category.MergedAchievements then
		-- Sort achievements
		if filters.SortBy.Criteria == addon.L["Name"] then
			-- diagnostics.Debug("Sort By " .. addon.L["Name"]);
			table.sort(achievements, function(a, b)
				local nameA, nameB = "", "";
				if a then
					_, nameA = GetAchievementInfo(a.ID);
				end
				if b then
					_, nameB = GetAchievementInfo(b.ID);
				end

				local compare;
				if nameA == nil then
					return false;
				elseif nameB == nil then
					return true;
				else
					compare = nameA:lower() < nameB:lower();
					if filters.SortBy.ReverseSort then
						compare = not compare;
					end
					return compare;
				end
			end);
		elseif filters.SortBy.Criteria == addon.L["Completion"] then
			-- diagnostics.Debug("Sort By " .. addon.L["Completion"]);
			table.sort(achievements, function(a, b)
				local completedA = false;
				if a then
					_, _, _, completedA = GetAchievementInfo(a.ID);
				end
				local completedB = false;
				if b then
					_, _, _, completedB = GetAchievementInfo(b.ID);
				end
				local compare = completedA;
				if filters.SortBy.ReverseSort then
					if completedA == completedB then
						compare = indexes[a] > indexes[b];
					end
					compare = not compare;
				else
					if completedA == completedB then
						compare = indexes[a] < indexes[b];
					end
				end
				return compare;
			end);
		elseif filters.SortBy.Criteria == addon.L["ID"] then
			-- diagnostics.Debug("Sort By " .. addon.L["ID"]);
			table.sort(achievements, function(a, b)
				local compare = a.ID < b.ID;
				if filters.SortBy.ReverseSort then
					compare = not compare;
				end
				return compare;
			end);
		else -- filters.SortBy.Criteria == addon.L["Default"]
			-- diagnostics.Debug("Sort By " .. addon.L["Default"]);
			if filters.SortBy.ReverseSort then
				local tmpTbl = {};
				for i = #achievements, 1, -1 do
					tinsert(tmpTbl, achievements[i]);
				end
				achievements = tmpTbl;
			end
		end
	end

	return achievements;
end

local cachedCategory, cachedAchievements; -- Caching this speeds up the scrolling of achievements when the selected category isn't changed
local highlightedButton;
function achievementsFrame:Update()
	diagnostics.Trace("achievementsFrame:Update");

	local updateAchievements = cachedCategory ~= gui.SelectedTab.SelectedCategory;
	cachedCategory = gui.SelectedTab.SelectedCategory;
	local scrollFrame = self.Container;

	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	if cachedCategory == addon.Data.CurrentZoneCategory then
		updateAchievements = addon.Data.GetCurrentZoneAchievements() or updateAchievements;
	end

	if updateAchievements then
		cachedAchievements = GetFilteredAchievements(self, cachedCategory);
	end
	local numButtons = #buttons;

	self.Text:Hide();

	if gui.SelectedTab.SelectedAchievement then
		AchievementFrameAchievementsObjectives:Hide();
	end

	local extraHeight = scrollFrame.largeButtonHeight or addon.Options.db.Achievements.ButtonCollapsedHeight;
	-- diagnostics.Debug("extraHeight " .. tostring(extraHeight));

	local achievementIndex;
	local displayedHeight = 0;
	for i = 1, numButtons do
		achievementIndex = i + offset;
		if achievementIndex > #cachedAchievements then
			buttons[i]:Hide();
		else
			self:DisplayAchievement(buttons[i], cachedAchievements[achievementIndex], achievementIndex, gui.SelectedTab.SelectedAchievement);
			displayedHeight = displayedHeight + buttons[i]:GetHeight();
		end
	end

	local totalHeight = #cachedAchievements * addon.Options.db.Achievements.ButtonCollapsedHeight;
	-- diagnostics.Debug("totalHeight1 " .. tostring(totalHeight));
	totalHeight = totalHeight + extraHeight - addon.Options.db.Achievements.ButtonCollapsedHeight;
	-- diagnostics.Debug("totalHeight2 " .. tostring(totalHeight));

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);

	-- gui.SelectedTab.AchievementsFrameScrollBarValue = scrollFrame.ScrollBar:GetValue();

	if not gui.SelectedTab.SelectedAchievement then
		HybridScrollFrame_CollapseButton(scrollFrame);
	end

	-- Make sure the correct tooltip is shown
	if highlightedButton then
		highlightedButton.ShowTooltip();
	end
end

function achievementsFrame:ForceUpdate(toTop) -- Issue #3: Fix
	diagnostics.Trace("achievementsFrame:ForceUpdate");

	if not self:IsShown() then -- Issue #8: Fix, Issue #10 : Broken
		return;
	end

	if toTop then -- Issue #27: Fix
		self.Container.ScrollBar:SetValue(0);
	end

	if gui.FilterButton then
		gui.SelectedTab.SelectedAchievement = gui.FilterButton:GetHighestAchievementWhenCollapseSeries(gui.SelectedTab.Filters, gui.SelectedTab.SelectedAchievement);
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
	diagnostics.Trace("achievementsFrame:ClearSelection");

	AchievementFrameAchievementsObjectives:Hide();
	for _, button in next, self.Container.buttons do
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

	gui.SelectedTab.SelectedAchievement = nil;
end

function achievementsFrame:SelectButton(button)
	diagnostics.Trace("achievementsFrame:SelectButton");

	gui.SelectedTab.SelectedAchievement = button.Achievement;
	button.selected = true;

	SetFocusedAchievement(button.Achievement.ID);
end

function achievementsFrame:FindSelection()
	diagnostics.Trace("achievementsFrame:FindSelection");

	local _, maxVal = self.Container.ScrollBar:GetMinMaxValues();
	local scrollHeight = self.Container:GetHeight();
	local newHeight = 0;
	self.Container.ScrollBar:SetValue(0);
	while true do
		for _, button in next, self.Container.buttons do
			if button.selected then
				newHeight = self.Container.ScrollBar:GetValue() + self.Container:GetTop() - button:GetTop();
				newHeight = min(newHeight, maxVal);
				self.Container.ScrollBar:SetValue(newHeight);
				return;
			end
		end
		if not self.Container.ScrollBar:IsVisible() or self.Container.ScrollBar:GetValue() == maxVal then
			return;
		else
			newHeight = newHeight + scrollHeight;
			newHeight = min(newHeight, maxVal);
			self.Container.ScrollBar:SetValue(newHeight);
		end
	end
end

function achievementsFrame:AdjustSelection()
	diagnostics.Trace("achievementsFrame:AdjustSelection");

	local selectedButton;
	-- check if selection is visible
	for _, button in next, self.Container.buttons do
		if button.selected then
			selectedButton = button;
			break;
		end
	end

	if not selectedButton then
		-- AchievementFrameAchievements_FindSelection();
		self:FindSelection();
	else
		local newHeight;
		if selectedButton:GetTop() > self.Container:GetTop() then
			newHeight = self.Container.ScrollBar:GetValue() + self.Container:GetTop() - selectedButton:GetTop();
		elseif selectedButton:GetBottom() < self.Container:GetBottom() then
			if selectedButton:GetHeight() > self.Container:GetHeight() then
				newHeight = self.Container.ScrollBar:GetValue() + self.Container:GetTop() - selectedButton:GetTop();
			else
				newHeight = self.Container.ScrollBar:GetValue() + self.Container:GetBottom() - selectedButton:GetBottom();
			end
		end
		if newHeight then
			local _, maxVal = self.Container.ScrollBar:GetMinMaxValues();
			newHeight = min(newHeight, maxVal);
			self.Container.ScrollBar:SetValue(newHeight);
		end
	end
end

function achievementsFrame:DisplayAchievement(button, achievement, index, selection, renderOffScreen)
	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = addon.GetAchievementInfo(achievement.ID);
	-- diagnostics.Trace("achievementsFrame.DisplayAchievement for achievement " .. tostring(id) .. "-" .. name .. "-" .. tostring(earnedBy));

	-- if not id then
	-- 	button:Hide();
	-- 	return;
	-- else
		button:Show();
	-- end

	button.index = index;
	button.Achievement = achievement;

	if button.id ~= id then
		local saturatedStyle;
		if bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT then
			button.accountWide = true;
			saturatedStyle = "account";
		else
			button.accountWide = nil;
			if achievement.NotObtainable then
				saturatedStyle = "NotObtainable";
			else
				saturatedStyle = "normal";
			end
		end
		button.id = id;
		local labelWidth = ACHIEVEMENTBUTTON_LABELWIDTH;
		if addon.Options.db.Achievements.Compact then
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

		if points > 0 then
			button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
		else
			button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
		end

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
		if (gui.FilterButton.Filters.db.EarnedBy == addon.L["Account"] and completed or wasEarnedByMe) or (gui.FilterButton.Filters.db.EarnedBy == addon.L["Character"] and completed and wasEarnedByMe) then
		-- if completed or wasEarnedByMe then
			button.completed = true;
			button.dateCompleted:SetText(FormatShortDate(day, month, year));
			button.dateCompleted:Show();
			if button.saturatedStyle ~= saturatedStyle then
				button:Saturate();
			end
		elseif (gui.FilterButton.Filters.db.EarnedBy == addon.L["Character"] and completed and not wasEarnedByMe) then
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
			if addon.Options.db.Achievements.Compact then
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
			if addon.Options.db.Achievements.Compact then
				button.description:Hide();
			end
		end
	end

	if IsTrackedAchievement(id) then -- Issue #10 : Fix
		button.check:Show();
		button.label:SetWidth(button.label:GetStringWidth() + 4); -- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
		button.tracked:SetChecked(true);
		button.tracked:Show();
	else
		button.check:Hide();
		button.tracked:SetChecked(false);
		button.tracked:Hide();
	end

	button:UpdatePlusMinusTexture();

	-- if selection then
	-- 	diagnostics.Debug(tostring(selection.ID) .. " - " .. tostring(id) .. " - " .. tostring(button.selected) .. " - " .. tostring(not button:IsMouseOver()));
	-- end
	if selection and id == selection.ID then
		-- self.SelectedAchievement = achievement;
		button.selected = true;
		button.highlight:Show();
		-- local height = AchievementButton_DisplayObjectives(button, button.id, button.completed, renderOffScreen);
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
		if addon.Options.db.Achievements.Compact and button.reward:GetText() ~= nil then
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

-- [[ API ]] --
function achievementsFrame:SelectAchievementWithCategory(achievement, category, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	diagnostics.Trace("achievementsFrame:SelectAchievementWithCategory");

	if mouseButton == nil then
		mouseButton = "LeftButton";
	end

	gui.CategoriesFrame:SelectCategory(category);
	self.Container.ScrollBar:SetValue(0); -- Makes sure the scrollbar is at the top since this can be in a diff location if the category is already selected

	-- Select achievement
	local shown = false;
	local previousScrollValue;
	local container = self.Container;
	local child = container.ScrollChild;
	local scrollBar = container.ScrollBar;

	while not shown do
		for _, button in next, container.buttons do
			-- addon.Diagnostics.Debug(button.id);
			-- addon.Diagnostics.Debug(achievement.ID);
			-- diagnostics.Debug(button:GetTop());
			-- diagnostics.Debug(gui.GetSafeScrollChildBottom(child));
			if button.id == achievement.ID and math.ceil(button:GetTop()) >= math.ceil(gui.GetSafeScrollChildBottom(container)) then
				-- diagnostics.Debug("Req 1 ok");
				if not (gui.SelectedTab.SelectedAchievement and gui.SelectedTab.SelectedAchievement.ID == achievement.ID) then
					-- diagnostics.Debug("Req 2 ok");
					button:Click(mouseButton, nil, ignoreModifiers, anchor, offsetX, offsetY);
				else
					-- diagnostics.Debug("Req 2 nok");
				end
				shown = button;
				break;
			end
		end
		-- addon.Diagnostics.Debug(shown ~= nil);

		if scrollBar:IsShown() then
			local _, maxVal = scrollBar:GetMinMaxValues();
			if shown then
				local newHeight = scrollBar:GetValue() + container:GetTop() - shown:GetTop();
				newHeight = min(newHeight, maxVal);
				scrollBar:SetValue(newHeight);
			else
				local scrollValue = scrollBar:GetValue();
				if scrollValue == maxVal or scrollValue == previousScrollValue then
					return;
				else
					previousScrollValue = scrollValue;
					HybridScrollFrame_OnMouseWheel(container, -1);
				end
			end
		end
	end
end

function achievementsFrame:SelectAchievement(achievement, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	diagnostics.Trace("achievementsFrame:SelectAchievement");

	if not achievement then
		diagnostics.Debug("No achievement provided");
		return;
	end

	-- Get category
	local category;
	if gui.FilterButton.Filters.db.MergeSmallCategories then
		category = achievement:GetMergedCategory(); -- This way we get the parent category
		-- diagnostics.Debug(category.Name);
	else
		category = achievement.Category;
	end

	-- Set filters so achievement is visible
	if gui.FilterButton then
		local filters = addon.Tabs[category:GetTree()[1].TabName].Filters;
		achievement = gui.FilterButton:GetHighestAchievementWhenCollapseSeries(filters, achievement);
		gui.FilterButton:SetFilters(filters, achievement);
	end

	self:SelectAchievementWithCategory(achievement, category, mouseButton, ignoreModifiers, anchor, offsetX, offsetY);
end

function achievementsFrame:SelectAchievementFromID(id, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	diagnostics.Trace("achievementsFrame:SelectAchievementFromID");

	local achievement = addon.Data.Achievements[id];
	self:SelectAchievement(achievement, mouseButton, ignoreModifiers, anchor, offsetX, offsetY);
end