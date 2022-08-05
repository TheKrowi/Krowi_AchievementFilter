-- [[ Namespaces ]] --
local _, addon = ...;

local function UpdateColorForEnabledState(self, color)
	if color then
		self:SetTextColor(color:GetRGBA());
	end
end

function KrowiAF_InputBoxInstructions_OnDisable(self)
	UpdateColorForEnabledState(self, self.disabledColor);
end

function KrowiAF_InputBoxInstructions_OnEnable(self)
	UpdateColorForEnabledState(self, self.enabledColor);
end

function KrowiAF_SearchBoxTemplateClearButton_OnClick(self)
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	local editBox = self:GetParent();
	editBox:SetText("");
	editBox:ClearFocus();
end

function KrowiAF_EditBox_ClearFocus(self)
    self:ClearFocus();
end