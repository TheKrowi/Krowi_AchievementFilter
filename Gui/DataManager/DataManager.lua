local _, addon = ...;
addon.Gui.DataManager = {};
local dataManager = addon.Gui.DataManager;

function dataManager:Load()
	local frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");
	frame.Inset:ClearAllPoints();
	frame.Inset:SetPoint("TOPLEFT", 4, -57);
	frame.Inset:SetPoint("BOTTOMRIGHT", -4, 0);
	addon.Gui:SetFrameToLastPosition(frame, "DataManager");
	KrowiAF_DataManagerFrameCloseButton:SetScript("OnClick", function(selfFunc)
		selfFunc:GetParent():Hide();
	end);
	addon.Gui:RegisterSafeCloseButtonDuringCombat(KrowiAF_DataManagerFrameCloseButton);
	KrowiAF_DataManagerFrameCloseButton:SetScript("OnKeyDown", addon.Gui.HandleCloseButtonOnKeyDown);
	addon.Gui.DataManager = nil;
end