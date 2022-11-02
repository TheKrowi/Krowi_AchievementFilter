-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.DataManagerFrame = {};
local dataManagerFrame = addon.GUI.DataManagerFrame;

function dataManagerFrame:Load()
	local frame;
	frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template");
	frame.ResetPosition = self.ResetPosition;
	addon.GUI.SetFrameToLastPosition(frame, "DataManager");
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

	addon.GUI.DataManagerFrame = frame;

	frame.Inset:ClearAllPoints();
	frame.Inset:SetPoint("TOPLEFT", 4, -57);
	frame.Inset:SetPoint("BOTTOMRIGHT", -4, 0);
end

function dataManagerFrame:ResetPosition()
    SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
    SavedData.RememberLastPosition["DataManager"] = {
        X = 150,
        Y = -80
    };
	addon.GUI.SetFrameToLastPosition(self, "DataManager");
end