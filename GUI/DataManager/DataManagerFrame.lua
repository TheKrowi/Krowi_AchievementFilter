-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.DataManagerFrame = {};
local dataManagerFrame = addon.GUI.DataManagerFrame;

function dataManagerFrame:Load()
	local frame;
	if addon.IsNotWotLKClassic() then
		frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");
		KrowiAF_DataManagerFrameCloseButton:SetScript("OnKeyDown", function(selfFunc, key)
			if key == GetBindingKey("TOGGLEGAMEMENU") then
				if selfFunc:GetParent():IsShown() then
					-- selfFunc:Click(selfFunc);
					selfFunc:GetParent():Hide();
					selfFunc:SetPropagateKeyboardInput(false);
					return;
				end
			end
			selfFunc:SetPropagateKeyboardInput(true);
		end);
	end

	frame.ResetPosition = self.ResetPosition;
	addon.GUI.DataManagerFrame = frame;
end

function dataManagerFrame:ResetPosition()
    SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
    SavedData.RememberLastPosition["DataManager"] = {
        X = 150,
        Y = -80
    };
    if not self.ClearAllPoints then
		return;
	end
	local pos = SavedData.RememberLastPosition["DataManager"];
	self:ClearAllPoints();
	self:SetPoint("TOPLEFT", pos.X, pos.Y);
end