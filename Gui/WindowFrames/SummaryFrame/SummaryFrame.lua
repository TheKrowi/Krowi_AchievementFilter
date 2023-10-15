local _, addon = ...;
addon.Gui.SummaryFrame = {};
local summaryFrame = addon.Gui.SummaryFrame;

function summaryFrame:Load()
    local frame = CreateFrame("Frame", "KrowiAF_SummaryFrame", AchievementFrame, "KrowiAF_SummaryFrame_Template");
	frame:SetPoint("TOPLEFT", KrowiAF_CategoriesFrame, "TOPRIGHT", 0, 0);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetPoint("RIGHT", -20, 0);
	tinsert(addon.Gui.SubFrames, frame);
    addon.Gui.SummaryFrame = nil;
end