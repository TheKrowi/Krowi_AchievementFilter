local _, addon = ...;
addon.Gui.FilterButton = {};
local filterButton = addon.Gui.FilterButton;

function filterButton:Load()
    local button = CreateFrame("DropDownToggleButton", "KrowiAF_AchievementFrameFilterButton", AchievementFrame, "KrowiAF_AchievementFrameFilterButton_Template");
    addon.Filters:ResetFilters();
	tinsert(addon.Gui.SubFrames, button);
	addon.Gui.FilterButton = nil;
end