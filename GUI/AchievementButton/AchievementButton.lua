-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementButton = {};
local achievementButton = addon.GUI.AchievementButton;

local function OnClick(self, button, achievementsFrame, ignoreModifiers, anchor, offsetX, offsetY) -- ignoreModifiers, anchor, offsetX, offsetY are used for in code calls
	if button == "LeftButton" then
		self:Select(ignoreModifiers, achievementsFrame);
	elseif button == "RightButton" then
		addon.GUI.RightClickMenu.AchievementMenu:Open(self.Achievement, anchor, offsetX, offsetY);
	end
end

local function AddRightClickMenuButton(button)
	local rightClickMenuButton = CreateFrame("Button", "$parentRightClickMenuButton", button, "KrowiAF_RightClickMenuButton_Template");
	if addon.Options.db.Achievements.Compact then
		rightClickMenuButton:SetPoint("TOPLEFT", 51, -6);
	else
		rightClickMenuButton:SetPoint("TOPLEFT", 72, -9);
	end

	rightClickMenuButton.Click = function()
		addon.GUI.RightClickMenu.AchievementMenu:Open(button.Achievement, rightClickMenuButton);
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
	local scrollFrame = achievementsFrame.ScrollFrame;
	local buttons = scrollFrame.buttons;

	for _, button in next, buttons do
		button:SetPoint("RIGHT", scrollFrame, -5, 0);
		button.Click = function(self, button, down, ignoreModifiers, anchor, offsetX, offsetY)
			OnClick(self, button, achievementsFrame, ignoreModifiers, anchor, offsetX, offsetY);
		end;
		button:SetScript("OnClick", button.Click);

		if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
			AddRightClickMenuButton(button);
		end
	end
end