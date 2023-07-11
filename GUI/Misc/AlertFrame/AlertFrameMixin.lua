-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AlertFrameMixin = {};

function KrowiAF_AlertFrameMixin:UpdateEventRuntime()
    local runtime = addon.GUI.AlertSystem.GetRuntimeText(self.Event);
    self.Unlocked:SetText(runtime);
end

function KrowiAF_AlertFrameMixin:ShowGameTooltip()
    if self.Name:IsTruncated() then
        GameTooltip:SetOwner(self, "ANCHOR_NONE");
        GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT", 0, 0);
        GameTooltip:SetText(self.Name:GetText());
        GameTooltip:Show();
    end
end

function KrowiAF_AlertFrameMixin:HideGameTooltip()
    GameTooltip:Hide();
end

function KrowiAF_AlertFrameMixin:OnEnter()
    self:ShowGameTooltip();
end

function KrowiAF_AlertFrameMixin:OnLeave()
    self:HideGameTooltip();
end