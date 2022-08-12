-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.DataManagerFrame = {};
local dataManagerFrame = addon.GUI.DataManagerFrame;

function dataManagerFrame:Load()
	local frame;
	if addon.IsNotWotLKClassic() then
		frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");
	end

	addon.GUI.DataManagerFrame = frame;
end