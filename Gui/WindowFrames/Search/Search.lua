local _, addon = ...;
addon.Gui.Search = {};
local search = addon.Gui.Search;

function search:Load()
    local frame = CreateFrame("EditBox", "KrowiAF_SearchBoxFrame", AchievementFrame, "KrowiAF_SearchBoxFrame_Template");
	if addon.Util.IsClassicWithAchievements then
		frame:SetSize(107, 30);
		frame:SetPoint("TOPLEFT", AchievementFrame.Header.RightDDLInset, "TOPLEFT", 12, 2);
	elseif AchievementFrame.HeaderDetails then
		-- Newer layouts: sit to the left of our filter button, matching Blizzard's own Filters spacing (7px)
		frame:SetSize(200, 30);
		frame:SetPoint("RIGHT", KrowiAF_AchievementFrameFilterButton, "LEFT", -7, 0);
	else
		frame:SetPoint("TOPLEFT", AchievementFrame.SearchBox);
		frame:SetPoint("BOTTOMRIGHT", AchievementFrame.SearchBox);
	end

    frame:SetMaxLetters(40);

	tinsert(addon.Gui.SubFrames, frame);
    addon.Gui.Search = nil;
end