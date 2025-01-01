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
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI");
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
    if event.EventDetails then
        self.Name:SetText(event.EventDetails.Name);
    elseif event.UpcomingEventDetails then
        self.Name:SetText(addon.L["Upcoming"] .. ": " .. event.UpcomingEventDetails.Name);
    else
        self.Name:SetText(addon.L["Collecting data"]);
    end
    self:UpdateEventRuntime();
    self.TimeSinceLastUpdate = 0;
end

function KrowiAF_EventReminderAlertFrameMixin:UpdateEventRuntime()
    local runtime;
    if self.Event.EventDetails then
        runtime = addon.Gui.EventReminderAlertSystem:GetRuntimeText(self.Event);
    elseif self.Event.UpcomingEventDetails then
        runtime = addon.L["In"] .. " " .. addon.Gui.EventReminderAlertSystem:GetUpcomingText(self.Event);
    end
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