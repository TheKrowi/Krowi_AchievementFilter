-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local achievementButton = addon.GUI.AchievementButton;

local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;
local descriptionWidthOffset = 166;
local descriptionSmallWidthOffset = 104;


local function OnEnter(self, achievementsFrame)
	achievementsFrame.SetHighlightedButton(self);
	self.ShowTooltip();
end

local function OnLeave(self, achievementsFrame)
	achievementsFrame.ClearHighlightedButton();
	AchievementMeta_OnLeave(self);
end

function achievementButton:PostLoadButtons(achievementsFrame)
	-- Here we hook a lot of our own functionality to extend the default Blizzard Buttons
	local scrollFrame = achievementsFrame.Container;
	local buttons = scrollFrame.buttons;

	for _, button in next, buttons do
		button:SetPoint("RIGHT", scrollFrame, -5, 0);

		-- Change display behaviour
		-- button.DisplayObjectives = function(button, renderOffScreen)
		-- 	return self.Display.DisplayObjectives(button, renderOffScreen, achievementsFrame);
		-- end;
		-- button.ResetMetas = self.Display.ResetMetas;
		-- button.ResetCriteria = self.Display.ResetCriteria;

		button.Enter = function(self)
			OnEnter(self, achievementsFrame);
		end;
		button:HookScript("OnEnter", button.Enter);
		button.Leave = function(self)
			OnLeave(self, achievementsFrame);
		end;
		button:HookScript("OnLeave", button.Leave);
		-- button.shield:EnableMouse(false);
		button.ShowTooltip = function()
			self.Tooltip.ShowTooltip(button, addon.Filters.Validate, addon.Filters:GetFilters());
		end;
	end
end