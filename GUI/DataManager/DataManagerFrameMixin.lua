-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_DataManagerFrameMixin = {};

function KrowiAF_DataManagerFrameMixin:OnLoad()
	if addon.IsWrathClassic then
		self.TitleText:SetText(addon.L["Data Manager"]);
	else
    	self:SetTitle(addon.L["Data Manager"]);
	end
	ButtonFrameTemplate_HidePortrait(self);
    ButtonFrameTemplate_HideButtonBar(self);
end

function KrowiAF_DataManagerFrameMixin:OnShow()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN);
end

function KrowiAF_DataManagerFrameMixin:OnHide()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE);
end