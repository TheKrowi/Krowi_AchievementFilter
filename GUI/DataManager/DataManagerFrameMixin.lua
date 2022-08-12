-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_DataManagerFrameMixin = {};

function KrowiAF_DataManagerFrameMixin:OnLoad()
    self:SetTitle(addon.L["Data Manager"]);
	ButtonFrameTemplate_HidePortrait(self);
    ButtonFrameTemplate_HideButtonBar(self);
end

function KrowiAF_DataManagerFrameMixin:OnShow()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN);
end

function KrowiAF_DataManagerFrameMixin:OnHide()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE);
end