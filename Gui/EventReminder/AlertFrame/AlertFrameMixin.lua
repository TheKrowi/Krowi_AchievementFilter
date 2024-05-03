local _, addon = ...;

KrowiAF_EventReminderAlertFrameMixin = {};

function KrowiAF_EventReminderAlertFrameMixin:OnUpdate(elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > 1 then
        self:UpdateEventRuntime();
        self.TimeSinceLastUpdate = 0;
    end
end

function KrowiAF_EventReminderAlertFrameMixin:OnEnter()
    self:ShowGameTooltip();
end

function KrowiAF_EventReminderAlertFrameMixin:OnLeave()
    self:HideGameTooltip();
end

function KrowiAF_EventReminderAlertFrameMixin:HandleLeftClick()
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    local category = KrowiAF_SelectCategory(self.Event.Category);
    if category.NumOfAch == 0 then
        KrowiAF_AchievementsFrame.Text:Show();
        KrowiAF_AchievementsFrame.Text:SetText(addon.L["Category shown temporarily"]:K_ReplaceVars(self.Event.EventDetails.Name));
    end
end

function KrowiAF_EventReminderAlertFrameMixin:OnClick(button, down)
    if AlertFrame_OnClick(self, button, down) then
		return; -- Handle right-click and close the alert
	end

    self:HandleLeftClick();
end

function KrowiAF_EventReminderAlertFrameMixin:SetEvent(event)
    self.Event = event;
	self.Icon.Texture:SetTexture(event.Icon);
    self.Name:SetText(event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"]);
    self:UpdateEventRuntime();
    self.TimeSinceLastUpdate = 0;
end

function KrowiAF_EventReminderAlertFrameMixin:UpdateEventRuntime()
    local runtime = addon.Gui.EventReminderAlertSystem:GetRuntimeText(self.Event);
    self.Unlocked:SetText(runtime);
end

function KrowiAF_EventReminderAlertFrameMixin:ShowGameTooltip()
    if self.Name:IsTruncated() then
        GameTooltip:SetOwner(self, "ANCHOR_NONE");
        GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT", 0, 0);
        GameTooltip:SetText(self.Name:GetText());
        GameTooltip:Show();
    end
end

function KrowiAF_EventReminderAlertFrameMixin:HideGameTooltip()
    GameTooltip:Hide();
end