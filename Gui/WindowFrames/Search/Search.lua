local _, addon = ...;
addon.Gui.Search = {};
local search = addon.Gui.Search;

function search:Load()
    local frame = CreateFrame("EditBox", "KrowiAF_SearchBoxFrame", AchievementFrame, "KrowiAF_SearchBoxFrame_Template");
	if addon.Util.IsWrathClassic then
		frame:SetSize(107, 30);
		frame:SetPoint("TOPLEFT", AchievementFrame.Header.RightDDLInset, "TOPLEFT", 12, 2);
	else
		frame:SetPoint("TOPLEFT", AchievementFrame.SearchBox);
		frame:SetPoint("BOTTOMRIGHT", AchievementFrame.SearchBox);
	end

    frame:SetMaxLetters(40);

	tinsert(addon.Gui.SubFrames, frame);
    addon.Gui.Search = nil;
end