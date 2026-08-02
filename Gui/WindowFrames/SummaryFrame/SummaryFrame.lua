local _, addon = ...;
addon.Gui.SummaryFrame = {};
local summaryFrame = addon.Gui.SummaryFrame;

function summaryFrame:Load()
    local frame = CreateFrame("Frame", "KrowiAF_SummaryFrame", AchievementFrame, "KrowiAF_SummaryFrame_Template");
	-- Newer layouts insert a HeaderDetails strip (Back button, filter, search) above the list; leave room for it
	local topOffset = AchievementFrame.HeaderDetails and -(AchievementFrame.HeaderDetails:GetHeight() - 2) or 0;
	frame:SetPoint("TOPLEFT", KrowiAF_CategoriesFrame, "TOPRIGHT", 0, topOffset);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetPoint("RIGHT", -20, 0);
	tinsert(addon.Gui.SubFrames, frame);
    addon.Gui.SummaryFrame = nil;
end