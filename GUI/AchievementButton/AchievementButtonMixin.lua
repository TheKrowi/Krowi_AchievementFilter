-- [[ Namespaces ]] --
local _, addon = ...;

AchievementButtonMixin = {};

local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;		-- can show 3 lines of text when achievement is collapsed

function AchievementButtonMixin:DisplayObjectives()
	local objectives = addon.GUI.AchievementsFrame.AchievementsObjectives;
	local topAnchor = self.hiddenDescription;
	objectives:ClearAllPoints();
	objectives:SetParent(self);
	objectives:Show();
	objectives.Completed = self.Completed;
	local height = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT; -- Compact or not, we need this height
	if objectives.id == self.id then
		if ( objectives.Mode == objectives.Modes.Criteria) then
			if ( objectives:GetHeight() > 0 ) then
				objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
				objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, 0);
				objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
			end
		else
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
		end
	elseif ( self.Completed and GetPreviousAchievement(self.id) ) then
		objectives:SetHeight(0);
		objectives:ResetAll();
		objectives:DisplayProgressiveAchievement(self.id);
		objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
	else
		objectives:SetHeight(0);
		objectives:ResetAll();
		objectives:DisplayCriteria(self.id);
		if ( objectives:GetHeight() > 0 ) then
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
			objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, -25);
			objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
		end
	end
	height = height + objectives:GetHeight();
	self.hiddenDescription:Show();
	self.description:Hide();
	if ( height ~= addon.Options.db.Achievements.ButtonCollapsedHeight or self.numLines > ACHIEVEMENTUI_MAX_LINES_COLLAPSED ) then
		local descriptionHeight = self.hiddenDescription:GetHeight();
		height = height + descriptionHeight - ACHIEVEMENTBUTTON_DESCRIPTIONHEIGHT;
		if ( self.reward:IsShown() ) then
			height = height + 4;
		end
	end
	objectives.id = self.id;
	return height;
end