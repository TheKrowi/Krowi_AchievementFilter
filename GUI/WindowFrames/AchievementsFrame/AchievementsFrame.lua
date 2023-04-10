-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementsFrame = {};
local achievementsFrame = addon.GUI.AchievementsFrame;

function achievementsFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementsFrame", AchievementFrame, "KrowiAF_AchievementsFrame_Template");
	frame:SetPoint("TOPLEFT", addon.GUI.CategoriesFrame, "TOPRIGHT", 0, 0);

	tinsert(addon.GUI.SubFrames, frame);

	hooksecurefunc("AchievementFrameAchievements_ForceUpdate", function()
		frame:ForceUpdate();
	end);

	addon.GUI.AchievementsFrame = frame;
end

function KrowiAF_AchievementsFrame_OnShow(self)
	if addon.AchievementEarnedUpdateAchievementsFrameOnNextShow then
		self:ForceUpdate();
		addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = nil;
	end
end