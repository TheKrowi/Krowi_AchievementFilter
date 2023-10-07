local _, addon = ...;
addon.Gui.DataManager = {};
local dataManager = addon.Gui.DataManager;

function dataManager:Load()
	local frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");
	addon.Gui.SetFrameToLastPosition(frame, "DataManager");
	KrowiAF_DataManagerFrameCloseButton:SetScript("OnClick", function()
		self:GetParent():Hide();
	end);
	KrowiAF_DataManagerFrameCloseButton:SetScript("OnKeyDown", addon.Gui.HandleCloseButtonOnKeyDown);

	frame.Inset:ClearAllPoints();
	frame.Inset:SetPoint("TOPLEFT", 4, -57);
	frame.Inset:SetPoint("BOTTOMRIGHT", -4, 0);
	addon.Gui.DataManager = nil;
end