-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementsObjectives = {};
local achievementsObjectives = addon.GUI.AchievementsObjectives;

function achievementsObjectives:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementsObjectives", nil, "KrowiAF_AchievementsObjectives_Template");

	if addon.IsWrathClassic then -- 14 by default
		ACHIEVEMENTBUTTON_METAROWHEIGHT = 28;
	end

	addon.GUI.AchievementsObjectives = frame;
end

function KrowiAF_AchievementsObjectives_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT");
	local link = GetAchievementLink(self.Id);
	GameTooltip:SetHyperlink(link);
	GameTooltip:Show();
	if GameTooltip:GetTop() > self:GetBottom() then
		GameTooltip:ClearAllPoints();
		GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT");
	end
end

function KrowiAF_AchievementsObjectives_OnLeave(self)
	GameTooltip:Hide();
end

function KrowiAF_AchievementsObjectives_OnClick(self, button, down)
	if button == "LeftButton" then
		KrowiAF_SelectAchievementFromID(self.Id);
	elseif button == "RightButton" then
		addon.GUI.RightClickMenu.AchievementMenu:Open(addon.Data.Achievements[self.Id]);
	end
end