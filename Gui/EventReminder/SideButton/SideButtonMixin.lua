local _, addon = ...;

KrowiAF_EventReminderSideButtonMixin = {};

function KrowiAF_EventReminderSideButtonMixin:OnShow()
    self:UpdateEventRuntime();
end

function KrowiAF_EventReminderSideButtonMixin:OnEnter()
    if self.shine then
        self.shine:Show();
        self.shine.animIn:Play();
    end
    self:ShowGameTooltip();
end

function KrowiAF_EventReminderSideButtonMixin:OnLeave()
    self:HideGameTooltip();
end

function KrowiAF_EventReminderSideButtonMixin:OnClick(button)
    if button == "LeftButton" then
        self:HandleLeftClick();
    elseif button == "RightButton" then
		addon.Gui.RightClickMenu.EventReminderMenu:Open(self, self.Event);
    end
end

function KrowiAF_EventReminderSideButtonMixin:Reset()
    self:SetParent(addon.Gui.EventReminderSideButtonSystem:GetAnchor());
    self.Event = nil;
end