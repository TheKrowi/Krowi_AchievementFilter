-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementsFrame = {};
local achievementsFrame = addon.GUI.AchievementsFrame;

function achievementsFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementsFrame", AchievementFrame, "KrowiAF_AchievementsFrame_Template");
	frame:SetPoint("TOPLEFT", addon.GUI.CategoriesFrame, "TOPRIGHT", 0, 0);
	tinsert(addon.GUI.SubFrames, frame);
	addon.GUI.AchievementsFrame = frame;
end