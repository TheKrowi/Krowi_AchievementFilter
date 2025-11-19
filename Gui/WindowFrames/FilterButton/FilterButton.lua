local _, addon = ...;
addon.Gui.FilterButton = {};
local filterButton = addon.Gui.FilterButton;

local function CreateModern()
    local button = CreateFrame("DropdownButton", "KrowiAF_AchievementFrameFilterButton", AchievementFrame, "KrowiAF_AchievementFrameFilterButton_Modern_Template");
    button:SetPoint("BOTTOMLEFT", AchievementFrame.Header, "BOTTOMLEFT", 118, 28);
    return button;
end

local function CreateClassic()
    local button = CreateFrame("DropDownToggleButton", "KrowiAF_AchievementFrameFilterButton", AchievementFrame, "KrowiAF_AchievementFrameFilterButton_Template");
    button:SetPoint("BOTTOMLEFT", AchievementFrame.Header, "BOTTOMLEFT", 116, 26);
    return button;
end

function filterButton:Load()
    addon.Filters:ResetFilters();
	tinsert(addon.Gui.SubFrames, addon.Util.IsMainline and CreateModern() or CreateClassic());
	addon.Gui.FilterButton = nil;
end