-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementsFrame = {};
local achievementsFrame = addon.GUI.AchievementsFrame;

function achievementsFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementsFrame", AchievementFrame, "KrowiAF_AchievementsFrame_Template");
	frame:SetPoint("TOPLEFT", addon.GUI.CategoriesFrame, "TOPRIGHT", 0, 0);

	tinsert(addon.GUI.SubFrames, frame);

	-- This does not suffice anymore for Dragonflight
	hooksecurefunc("AchievementFrameAchievements_ForceUpdate", function()
		frame:ForceUpdate();
	end); -- Issue #3: Fix

	addon.GUI.AchievementsFrame = frame;
end

function KrowiAF_AchievementsFrame_OnShow(self)
	if addon.AchievementEarnedUpdateAchievementsFrameOnNextShow then
		self:ForceUpdate();
		addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = nil;
	end
end