local _, addon = ...;
addon.Gui.CategoriesFrame = {};
local categoriesFrame = addon.Gui.CategoriesFrame;

function categoriesFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_CategoriesFrame", AchievementFrame, "KrowiAF_CategoriesFrame_Template");
	tinsert(addon.Gui.SubFrames, frame);
	addon.Gui.CategoriesFrame = nil;
end