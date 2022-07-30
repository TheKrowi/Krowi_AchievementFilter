-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.DataManagerFrame = {};
local dataManagerFrame = addon.GUI.DataManagerFrame;

function dataManagerFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");

	addon.GUI.DataManagerFrame = frame;
end