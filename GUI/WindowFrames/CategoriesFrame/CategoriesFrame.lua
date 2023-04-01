-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.CategoriesFrame = {};
local categoriesFrame = addon.GUI.CategoriesFrame;

function categoriesFrame:Load()
	addon.GUI.CategoriesFrame = CreateFrame("Frame", "KrowiAF_CategoriesFrame", AchievementFrame, "KrowiAF_CategoriesFrame_Template");
	tinsert(addon.GUI.SubFrames, addon.GUI.CategoriesFrame);
end