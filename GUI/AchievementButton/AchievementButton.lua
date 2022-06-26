-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.AchievementButton = {};
local achievementButton = gui.AchievementButton;

local media = "Interface\\AddOns\\Krowi_AchievementFilter\\Media\\";

local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;
local TEXTURES_OFFSET = 0;		-- 0.5 when in guild view

local UpdatePlusMinusTexture, Saturate, Desaturate, SaturatePartial, Collapse, Expand;
function KrowiAF_AchievementButton_OnLoad(self)
	self.dateCompleted = self.shield.dateCompleted;
	if not ACHIEVEMENTUI_FONTHEIGHT then
		local _, fontHeight = self.description:GetFont();
		ACHIEVEMENTUI_FONTHEIGHT = fontHeight;
	end

	local descriptionHeight = ACHIEVEMENTUI_FONTHEIGHT;
	if not addon.Options.db.Achievements.Compact then
		descriptionHeight = descriptionHeight * ACHIEVEMENTUI_MAX_LINES_COLLAPSED;
	end
	-- diagnostics.Debug(descriptionHeight);
	self.description:SetHeight(descriptionHeight);
	self.Collapse = Collapse;
	self.Expand = Expand;
	self.Saturate = AchievementButton_Saturate;
	self.Desaturate = AchievementButton_Desaturate;
	self.SaturatePartial = SaturatePartial;
	self.UpdatePlusMinusTexture = UpdatePlusMinusTexture;

	hooksecurefunc(self, "Saturate", Saturate);
	hooksecurefunc(self, "Desaturate", Desaturate);

	self:SetScript("OnSizeChanged", function(self, width, height)
		local descriptionWidth = width - 166;
		if addon.Options.db.Achievements.Compact then
			descriptionWidth = width - 104;
		end
		self.description:SetWidth(descriptionWidth);
		self.hiddenDescription:SetWidth(descriptionWidth);
	end);

	self:Collapse();
end

local OnEnter, OnLeave, OnClick;
function achievementButton:PostLoadButtons(achievementsFrame)
	-- Here we hook a lot of our own functionality to extend the default Blizzard Buttons
	diagnostics.Trace("achievementButton.PostLoadButtons");

	for _, button in next, achievementsFrame.Container.buttons do
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		button.Click = function(self, button, down, ignoreModifiers, anchor, offsetX, offsetY)
			OnClick(self, button, achievementsFrame, ignoreModifiers, anchor, offsetX, offsetY);
		end;
		button:SetScript("OnClick", button.Click);

		if not achievementsFrame.UIFontHeight then
			local _, fontHeight = button.description:GetFont();
			achievementsFrame.UIFontHeight = fontHeight;
		end

		if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
			local rightClickMenuButton = CreateFrame("Button", "$parentRightClickMenuButton", button);
			rightClickMenuButton:SetWidth(15);
			rightClickMenuButton:SetHeight(15);

			if addon.Options.db.Achievements.Compact then
				rightClickMenuButton:SetPoint("TOPLEFT", 51, -6);
			else
				rightClickMenuButton:SetPoint("TOPLEFT", 72, -9);
			end
			rightClickMenuButton:SetNormalTexture("Interface/Buttons/QuestTrackerButtons");
			rightClickMenuButton:SetPushedTexture("Interface/Buttons/QuestTrackerButtons");
			rightClickMenuButton:SetHighlightTexture("Interface/Buttons/QuestTrackerButtons", "ADD");
			rightClickMenuButton:GetNormalTexture():SetTexCoord(0.40625, 0.53125, 0.25, 0.5);
			rightClickMenuButton:GetPushedTexture():SetTexCoord(0.40625, 0.53125, 0, 0.25);
			rightClickMenuButton:GetHighlightTexture():SetTexCoord(0, 0.265625, 0, 0.53125);
			rightClickMenuButton.Click = function()
				OnClick(button, "RightButton", achievementsFrame, nil, rightClickMenuButton);
			end;
			rightClickMenuButton:SetScript("OnClick", rightClickMenuButton.Click);
			button.RightClickMenuButton = rightClickMenuButton;
			button.plusMinus:ClearAllPoints();
			if addon.Options.db.Achievements.Compact then
				button.plusMinus:SetPoint("TOPLEFT", rightClickMenuButton, "BOTTOMLEFT", 1, -3);
			else
				button.plusMinus:SetPoint("TOPLEFT", rightClickMenuButton, "BOTTOMLEFT", 0, -3);
			end
		end

		-- Change display behaviour
		button.DisplayObjectives = function(button, renderOffScreen)
			return self.Display.DisplayObjectives(button, renderOffScreen, achievementsFrame);
		end;
		button.ResetMetas = self.Display.ResetMetas;
		button.ResetCriteria = self.Display.ResetCriteria;

		-- Change tooltip behaviour
		button.Enter = function(self)
			OnEnter(self, achievementsFrame);
		end;
		button:HookScript("OnEnter", button.Enter);
		button.Leave = function(self)
			OnLeave(self, achievementsFrame);
		end;
		button:HookScript("OnLeave", button.Leave);
		button.shield:EnableMouse(false);
		button.ShowTooltip = function()
			self.Tooltip.ShowTooltip(button, gui.FilterButton.Validate, gui.FilterButton:GetFilters());
		end;

		local name = button:GetName();
		button.BottomTsunami1 = _G[name.."BottomTsunami1"];
		button.TopTsunami1 = _G[name.."TopTsunami1"];
	end
end

local function SetTsunamis(self)
	if addon.Options.db.Achievements.Compact then
		return;
	end
	if self.Achievement.NotObtainable then
		self.BottomTsunami1:SetTexture(media .. "NotObtainableAchievementBorders");
		self.BottomTsunami1:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
		self.BottomTsunami1:SetAlpha(0.35);
		self.TopTsunami1:SetTexture(media .. "NotObtainableAchievementBorders");
		self.TopTsunami1:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
		self.TopTsunami1:SetAlpha(0.3);
	else
		self.BottomTsunami1:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.BottomTsunami1:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
		self.BottomTsunami1:SetAlpha(0.35);
		self.TopTsunami1:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.TopTsunami1:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
		self.TopTsunami1:SetAlpha(0.3);
	end
end

function UpdatePlusMinusTexture(self)
	local id = self.id;
	if not id then
		return; -- This happens when we create buttons
	end
	local display = false;
	if addon.Options.db.Achievements.Compact then
		display = true;
	elseif GetAchievementNumCriteria(id) ~= 0 then
		display = true;
	elseif self.completed and GetPreviousAchievement(id) then
		display = true;
	elseif not self.completed and GetAchievementGuildRep(id) then
		display = true;
	end
	if display then
		self.plusMinus:Show();
		if self.collapsed and self.saturatedStyle then
			self.plusMinus:SetTexCoord(0, .5, TEXTURES_OFFSET, TEXTURES_OFFSET + 0.25);
		elseif self.collapsed then
			self.plusMinus:SetTexCoord(.5, 1, TEXTURES_OFFSET, TEXTURES_OFFSET + 0.25);
		elseif self.saturatedStyle then
			self.plusMinus:SetTexCoord(0, .5, TEXTURES_OFFSET + 0.25, TEXTURES_OFFSET + 0.50);
		else
			self.plusMinus:SetTexCoord(.5, 1, TEXTURES_OFFSET + 0.25, TEXTURES_OFFSET + 0.50);
		end
	else
		self.plusMinus:Hide();
	end
end

-- [[ Saturate ]] --
function Saturate(self)
	if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "NotObtainable";
	else
		if not addon.InGuildView() and not self.accountWide then
			self:SetBackdropBorderColor(ACHIEVEMENT_GOLD_BORDER_COLOR:GetRGB());
		end
	end
	SetTsunamis(self);
end

function SaturatePartial(self)
	-- diagnostics.Debug("Completed but not by me: " .. self.label:GetText());
	self:Desaturate();
	self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
	self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
	self.icon:Saturate();
	self.shield:Saturate();
	self.shield.points:SetVertexColor(1, 1, 1);
	self.glow:SetVertexColor(0.1, 0.1, 0.1);
	SetTsunamis(self);
end

-- [[ Desaturate ]] --
function Desaturate(self)
	if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	end
	SetTsunamis(self);
end

-- [[ Collapse ]] --
function Collapse(self)
	if self.collapsed then
		return;
	end
	self.collapsed = true;
	self:UpdatePlusMinusTexture();
	self:SetHeight(addon.Options.db.Achievements.ButtonCollapsedHeight);
	self.background:SetTexCoord(0, 1, 1 - (addon.Options.db.Achievements.ButtonCollapsedHeight / 256), 1);
	if not self.tracked:GetChecked() then
		self.tracked:Hide();
	end
	self.tabard:Hide();
	self.guildCornerL:Hide();
	self.guildCornerR:Hide();
end

-- [[ Expand ]] --
function Expand(self, height)
	if not self.collapsed and self:GetHeight() == height then
		return;
	end
	self.collapsed = nil;
	self:UpdatePlusMinusTexture();
	if addon.InGuildView() then
		if height < GUILDACHIEVEMENTBUTTON_MINHEIGHT then
			height = GUILDACHIEVEMENTBUTTON_MINHEIGHT;
		end
		if self.completed then
			self.tabard:Show();
			self.shield:SetFrameLevel(self.tabard:GetFrameLevel() + 1);
			SetLargeGuildTabardTextures("player", self.tabard.emblem, self.tabard.background, self.tabard.border);
		end
		self.guildCornerL:Show();
		self.guildCornerR:Show();
	end
	self:SetHeight(height);
	self.background:SetTexCoord(0, 1, max(0, 1-(height / 256)), 1);
end

-- [[ OnEnter ]] --
function OnEnter(self, achievementsFrame)
	diagnostics.Trace("OnEnter");

	achievementsFrame.SetHighlightedButton(self);
	self.ShowTooltip();
end

-- [[ OnLeave ]] --
function OnLeave(self, achievementsFrame)
	diagnostics.Trace("OnLeave");

	achievementsFrame.ClearHighlightedButton();

	AchievementMeta_OnLeave(self);
end

-- [[ OnClick ]] --
local OnClickLeftButton, OnClickRightButton;
function OnClick(self, button, achievementsFrame, ignoreModifiers, anchor, offsetX, offsetY) -- ignoreModifiers, anchor, offsetX, offsetY are used for in code calls
	diagnostics.Trace("achievementButton.OnClick");

	if button == "LeftButton" then
		-- diagnostics.Debug("LeftButton");
		OnClickLeftButton(self, ignoreModifiers, achievementsFrame);
	elseif button == "RightButton" then
		-- diagnostics.Debug("RightButton");
		OnClickRightButton(self, anchor, offsetX, offsetY, achievementsFrame);
	else
		-- diagnostics.Debug(button);
	end
end

-- [[ OnClickLeftButton ]] --
function OnClickLeftButton(self, ignoreModifiers, achievementsFrame)
	diagnostics.Trace("OnClickLeftButton");

	if IsModifiedClick() and not ignoreModifiers then
		local handled = nil;
		if IsModifiedClick("CHATLINK") then
			local achievementLink = GetAchievementLink(self.id);
			if achievementLink then
				handled = ChatEdit_InsertLink(achievementLink);
				if not handled and SocialPostFrame and Social_IsShown() then
					Social_InsertLink(achievementLink);
					handled = true;
				end
			end
		end
		if not handled and IsModifiedClick("QUESTWATCHTOGGLE") then
			AchievementButton_ToggleTracking(self.id);
		end
		return;
	end

	if self.selected then
		if not self:IsMouseOver() then
			self.highlight:Hide();
		end
		achievementsFrame:ClearSelection();
		HybridScrollFrame_CollapseButton(achievementsFrame.Container);
		achievementsFrame:Update();
		return;
	end

	achievementsFrame:ClearSelection();
	achievementsFrame:SelectButton(self);
	achievementsFrame:DisplayAchievement(self, gui.SelectedTab.SelectedAchievement, self.index, self.Achievement);
	HybridScrollFrame_ExpandButton(achievementsFrame.Container, ((self.index - 1) * addon.Options.db.Achievements.ButtonCollapsedHeight), self:GetHeight());
	achievementsFrame:Update();
	if not ignoreModifiers then
		achievementsFrame:AdjustSelection();
	end
end

-- [[ OnClickRightButton ]] --
local rightClickMenu = LibStub("Krowi_Menu-1.0");
local popupDialog = LibStub("Krowi_PopopDialog-1.0");

local function AddWowheadLink(achievement)
	if not achievement.HasNoWowheadLink then
		local externalLink = "https://www.wowhead.com/achievement=" .. achievement.ID; -- .. "#comments"; -- make go to comments optional in settings
		diagnostics.Debug(externalLink);
		rightClickMenu:AddFull({Text = addon.L["Wowhead"], Func = function() popupDialog.ShowExternalLink(externalLink); end});
	end
end

local function AddGoToAchievementLine(goTo, id, achievementsFrame, nameSuffix)
	nameSuffix = nameSuffix or "";
	local _, name = addon.GetAchievementInfo(id);
	local disabled;
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")";
		disabled = true;
	end
	goTo:AddFull({ Text = name .. nameSuffix,
					Func = function()
						achievementsFrame:SelectAchievementFromID(id, nil, true);
						rightClickMenu:Close();
					end,
					Disabled = disabled
				});
end

local function AddGoToAchievementWithCategoryLine(goTo, achievement, category, achievementsFrame)
	goTo:AddFull({ Text = category:GetPath(),
					Func = function()
						achievementsFrame:SelectAchievementWithCategory(achievement, category, nil, true);
						rightClickMenu:Close();
					end,
					-- Disabled = disabled
				});
end

local function AddPartOfAChainAchievement(goTo, achID, achievementsFrame, nameSuffix)
	AddGoToAchievementLine(goTo, achID, achievementsFrame, nameSuffix);
	if addon.Data.Achievements[achID].NextAchievements == nil then
		return;
	end
	for id, _ in next, addon.Data.Achievements[achID].NextAchievements do
		if addon.Data.Achievements[achID].NumNextAchievements > 1 then
			if addon.Data.Achievements[id].Faction then
				nameSuffix = " (";
				if addon.Data.Achievements[id].Faction then
					nameSuffix = nameSuffix .. addon.L[addon.Objects.Faction[addon.Data.Achievements[id].Faction]];
					nameSuffix = nameSuffix .. ")";
				end
			end
		end
		AddPartOfAChainAchievement(goTo, id, achievementsFrame, nameSuffix);
	end
end

local function AddGoTo(achievementsFrame, achievement)
	local achID = addon.GetFirstAchievementID(achievement.ID);
	local requiredForIDs = achievement:GetRequiredForIDs(gui.FilterButton.Validate, gui.FilterButton:GetFilters());

	if addon.Data.Achievements[achID].NextAchievements == nil
	and #requiredForIDs == 0
	and achievement.MoreCategories == nil
	and gui.SelectedTab.SelectedCategory ~= addon.Data.CurrentZoneCategory
	and gui.SelectedTab.SelectedCategory ~= addon.Data.SelectedZoneCategory then -- Others can be added here later
		return;
	end

	local goTo = addon.Objects.MenuItem:New({Text = addon.L["Go to"]});
	local addSeparator = nil;

	-- Part of a chain
	if addon.Data.Achievements[achID].NextAchievements ~= nil then
		goTo:AddFull({Text = addon.L["Part of a chain"], IsTitle = true});
		AddPartOfAChainAchievement(goTo, achID, achievementsFrame);
		addSeparator = true;
	end

	-- Required for
	if #requiredForIDs ~= 0 then -- Add individual Go to parts
		if addSeparator then
			goTo:AddSeparator();
			addSeparator = nil;
		end
		goTo:AddFull({Text = addon.L["Required for"], IsTitle = true});
		for _, id in next, requiredForIDs do
			if id ~= achievement.ID then
				AddGoToAchievementLine(goTo, id, achievementsFrame);
			end
		end
		addSeparator = true;
	end

	-- Other faction
	if achievement.OtherFactionAchievementID then
		if addSeparator then
			goTo:AddSeparator();
			addSeparator = nil;
		end
		local faction = addon.L["Neutral"];
		if addon.Faction.IsAlliance then
			faction = addon.L["Horde"];
		elseif addon.Faction.IsHorde then
			faction = addon.L["Alliance"];
		end
		goTo:AddFull({Text = addon.L["Other faction"] .. " (" .. faction .. ")", IsTitle = true});
		AddGoToAchievementLine(goTo, achievement.OtherFactionAchievementID, achievementsFrame);
		addSeparator = true;
	end

	-- Other locations
	if achievement.MoreCategories then
		if addSeparator then
			goTo:AddSeparator();
			addSeparator = nil;
		end
		goTo:AddFull({Text = addon.L["Other locations"], IsTitle = true});
		if gui.SelectedTab.SelectedCategory ~= achievement.Category then
			AddGoToAchievementWithCategoryLine(goTo, achievement, achievement.Category, achievementsFrame);
		end
		for _, category in next, achievement.MoreCategories do				
			if gui.SelectedTab.SelectedCategory ~= category then
				AddGoToAchievementWithCategoryLine(goTo, achievement, category, achievementsFrame);
			end
		end
		addSeparator = true;
	end

	-- First category with achievement
	if gui.SelectedTab.SelectedCategory == addon.Data.CurrentZoneCategory or
		gui.SelectedTab.SelectedCategory == addon.Data.SelectedZoneCategory then

		if addSeparator then
			goTo:AddSeparator();
			addSeparator = nil;
		end
		goTo:AddFull({Text = achievement.Category:GetPath(), IsTitle = true});
		AddGoToAchievementLine(goTo, achievement.ID, achievementsFrame);
		addSeparator = true;
	end

	rightClickMenu:Add(goTo); -- Add Go to menu to the right click menu
end

function achievementButton.AddTransmogSets(achievement)
	if achievement.TransmogSets == nil then
		return;
	end

	local transmogSets = addon.Objects.MenuItem:New({Text = addon.L["Transmog Sets"]});

	local tSets = addon.GetUsableSets(achievement.TransmogSets);
	for _, set in next, tSets do
		local setInfo = C_TransmogSets.GetSetInfo(set.Id);
		if setInfo.requiredFaction == nil or setInfo.requiredFaction == UnitFactionGroup("player") then
			transmogSets:AddFull({ Text = setInfo.name .. " (" .. setInfo.description .. ")",
									Func = function()
										if not IsAddOnLoaded("Blizzard_Collections") then
											LoadAddOn("Blizzard_Collections");
										end
										CollectionsJournal:Show();
										CollectionsJournal_SetTab(CollectionsJournal, 5);
										WardrobeCollectionFrame:GoToSet(set.Id);
										rightClickMenu:Close();
									end
								});
		end
	end

	rightClickMenu:Add(transmogSets);
end

local function AddClearFocusFocus(menu, achievement)
	if achievement.Focused then
		menu:AddFull({Text = addon.L["Clear focus"], Func = function()
			addon.ClearFocusAchievement(achievement);
			rightClickMenu:Close();
		end});
	else
		menu:AddFull({Text = addon.L["Focus"], Func = function()
			addon.FocusAchievement(achievement);
			rightClickMenu:Close();
		end});
	end
end

local function AddIncludeExclude(menu, achievement)
	if achievement.Excluded then
		menu:AddFull({Text = addon.L["Include"], Func = function()
			addon.IncludeAchievement(achievement);
			rightClickMenu:Close();
		end});
	else
		menu:AddFull({Text = addon.L["Exclude"], Func = function()
			addon.ExcludeAchievement(achievement);
			rightClickMenu:Close();
		end});
	end
end

local function AddMore(achievement)
	local more = addon.Objects.MenuItem:New({Text = addon.L["More"]});

	AddClearFocusFocus(more, achievement);
	AddIncludeExclude(more, achievement);

	rightClickMenu:Add(more);
end

function OnClickRightButton(self, anchor, offsetX, offsetY, achievementsFrame)
	diagnostics.Trace("OnClickRightButton");

	local achievement = self.Achievement;

	-- Reset menu
	rightClickMenu:Clear();

	-- Always add header
	local _, name = addon.GetAchievementInfo(achievement.ID);
	rightClickMenu:AddFull({Text = name, IsTitle = true});

	AddWowheadLink(achievement);
	AddGoTo(achievementsFrame, achievement);
	achievementButton.AddTransmogSets(achievement);

	-- Extra menu defined at the achievement self including pet battles
	if addon.Data.RCMenuExtras[achievement.ID] ~= nil then
		rightClickMenu:Add(addon.Data.RCMenuExtras[achievement.ID]);
	end

	addon.Plugins:AddRightClickMenuItems(rightClickMenu, achievement);

	AddMore(achievement);

	rightClickMenu:Open(anchor, offsetX, offsetY);
end