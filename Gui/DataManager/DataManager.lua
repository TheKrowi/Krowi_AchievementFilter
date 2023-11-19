local _, addon = ...;
addon.Gui.DataManager = {};
local dataManager = addon.Gui.DataManager;

function dataManager:Load()
	local frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");
	addon.Gui:SetFrameToLastPosition(frame, "DataManager");
end

function dataManager:GetTextFrame(...)
	local frame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template");
	frame:Init(...);
	return frame;
end