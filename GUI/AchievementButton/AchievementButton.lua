-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
addon.GUI.AchievementButton = {};
local achievementButton = addon.GUI.AchievementButton;

local media = "Interface\\AddOns\\Krowi_AchievementFilter\\Media\\";

local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;
local plusMinusTexturesOffset = 0; -- 0.5 when in guild view
local descriptionWidthOffset = 166;
local descriptionSmallWidthOffset = 104;

local function UpdatePlusMinusTexture(self)
	local id = self.id;
	if not id then
		return; -- This happens when we create buttons
	end

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
		self.plusMinus:SetTexCoord(0, .5, plusMinusTexturesOffset, plusMinusTexturesOffset + 0.25);
	elseif self.collapsed then
		self.plusMinus:SetTexCoord(.5, 1, plusMinusTexturesOffset, plusMinusTexturesOffset + 0.25);
	elseif self.saturatedStyle then
		self.plusMinus:SetTexCoord(0, .5, plusMinusTexturesOffset + 0.25, plusMinusTexturesOffset + 0.50);
	else
		self.plusMinus:SetTexCoord(.5, 1, plusMinusTexturesOffset + 0.25, plusMinusTexturesOffset + 0.50);
	end
end

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

local function Saturate(self)
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

local function SaturatePartial(self)
	self:Desaturate();
	self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
	self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
	self.icon:Saturate();
	self.shield:Saturate();
	self.shield.points:SetVertexColor(1, 1, 1);
	self.glow:SetVertexColor(0.1, 0.1, 0.1);
	SetTsunamis(self);
end

local function Desaturate(self)
	if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	end
	SetTsunamis(self);
end

local function Collapse(self)
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
	self.tabard:Hide();
	self.guildCornerL:Hide();
	self.guildCornerR:Hide();
end

local function Expand(self, height)
	if not self.collapsed and self:GetHeight() == height then
		return;
	end

	self.collapsed = nil;
	self:UpdatePlusMinusTexture();
	if addon.InGuildView() then
		if height < GUILDACHIEVEMENTBUTTON_MINHEIGHT then
			height = GUILDACHIEVEMENTBUTTON_MINHEIGHT;
		end
		if self.Completed then
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

function KrowiAF_AchievementFrameAchievementsFrameAchievementButton_OnLoad(self)
	self.dateCompleted = self.shield.dateCompleted;
	if not ACHIEVEMENTUI_FONTHEIGHT then
		local _, fontHeight = self.description:GetFont();
		ACHIEVEMENTUI_FONTHEIGHT = fontHeight;
	end

	local descriptionHeight = ACHIEVEMENTUI_FONTHEIGHT;
	if not addon.Options.db.Achievements.Compact then
		descriptionHeight = descriptionHeight * ACHIEVEMENTUI_MAX_LINES_COLLAPSED;
	end

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
		local descriptionWidth = width - (addon.Options.db.Achievements.Compact and descriptionSmallWidthOffset or descriptionWidthOffset);
		self.description:SetWidth(descriptionWidth);
		self.hiddenDescription:SetWidth(descriptionWidth);
	end);

	self:Collapse();
end

local function OnEnter(self, achievementsFrame)
	achievementsFrame.SetHighlightedButton(self);
	self.ShowTooltip();
end

local function OnLeave(self, achievementsFrame)
	achievementsFrame.ClearHighlightedButton();
	AchievementMeta_OnLeave(self);
end

local function OnClickLeftButton(self, ignoreModifiers, achievementsFrame)
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

	local scrollFrame = achievementsFrame.Container;
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
	achievementsFrame:DisplayAchievement(self, addon.GUI.SelectedTab.SelectedAchievement, self.index, self.Achievement);
	HybridScrollFrame_ExpandButton(scrollFrame, ((self.index - 1) * addon.Options.db.Achievements.ButtonCollapsedHeight), self:GetHeight());
	achievementsFrame:Update();
	if not ignoreModifiers then
		achievementsFrame:AdjustSelection();
	end
end



local function OnClick(self, button, achievementsFrame, ignoreModifiers, anchor, offsetX, offsetY) -- ignoreModifiers, anchor, offsetX, offsetY are used for in code calls
	if button == "LeftButton" then
		OnClickLeftButton(self, ignoreModifiers, achievementsFrame);
	elseif button == "RightButton" then
		addon.GUI.RightClickMenu.AchievementMenu:Open(self.Achievement, anchor, offsetX, offsetY, achievementsFrame);
	end
end

local function AddRightClickMenuButton(achievementsFrame, button)
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

function achievementButton:PostLoadButtons(achievementsFrame)
	-- Here we hook a lot of our own functionality to extend the default Blizzard Buttons
	local scrollFrame = achievementsFrame.Container;
	local buttons = scrollFrame.buttons;

	for _, button in next, buttons do
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
			AddRightClickMenuButton(achievementsFrame, button);
		end

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
			self.Tooltip.ShowTooltip(button, addon.Filters.Validate, addon.Filters:GetFilters());
		end;

		local name = button:GetName();
		button.BottomTsunami1 = _G[name.."BottomTsunami1"];
		button.TopTsunami1 = _G[name.."TopTsunami1"];
	end
end