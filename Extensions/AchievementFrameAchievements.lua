-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local extension = addon.Extension;
extension.AchFrameAchies = {};
local achFrameAchies = extension.AchFrameAchies;

local PostLoadButtons, HookAchievementButton_DisplayAchievement;
function achFrameAchies:Load()
    PostLoadButtons();
    HookAchievementButton_DisplayAchievement();
end

local OnEnter, OnLeave, OnClick;
function PostLoadButtons()
    for _, button in next, AchievementFrameAchievementsContainer.buttons do
        button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        button.Click = function(self, button, down, ignoreModifiers, anchor, offsetX, offsetY)
			OnClick(self, button, ignoreModifiers, anchor, offsetX, offsetY);
		end;
		button:SetScript("OnClick", button.Click);

		-- Change tooltip behaviour
		button.Enter = function(self)
			OnEnter(self);
		end;
		button:HookScript("OnEnter", button.Enter);
		button.Leave = function(self)
			OnLeave(self);
		end;
		button:HookScript("OnLeave", button.Leave);
		button.shield:EnableMouse(false);
		button.ShowTooltip = function()
			addon.GUI.AchievementButton.Tooltip.ShowTooltip(button, nil, nil);
		end;
    end
end

function HookAchievementButton_DisplayAchievement()
    hooksecurefunc("AchievementButton_DisplayAchievement", function(button, category, achievement, selectionID, renderOffScreen)
        local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(category, achievement);
        if addon.Data.Achievements[id] ~= nil then
            button.Achievement = addon.Data.Achievements[id];
            return;
        end

        button.Achievement = addon.Objects.Achievement:New(id);
    end);
end

-- [[ OnEnter ]] --
function OnEnter(self)
	diagnostics.Trace("OnEnter");

	self.highlight:Show();
	self.ShowTooltip();
end

-- [[ OnLeave ]] --
function OnLeave(self)
	diagnostics.Trace("OnLeave");

    if not self.selected then
        self.highlight:Hide();
    end
    
	AchievementMeta_OnLeave(self);
end

-- [[ OnClick ]] --
function OnClick(self, button, ignoreModifiers, anchor, offsetX, offsetY) -- ignoreModifiers, anchor, offsetX, offsetY are used for in code calls
	diagnostics.Trace("AchievementFrameAchievementsContainer.button.OnClick");

	if button == "LeftButton" then
		diagnostics.Debug("LeftButton");
		AchievementButton_OnClick(self, button, nil, ignoreModifiers);
	elseif button == "RightButton" then
		diagnostics.Debug("RightButton");
		-- OnClickRightButton(self, anchor, offsetX, offsetY, AchievementFrameAchievements);
	else
		diagnostics.Debug(button);
	end
end