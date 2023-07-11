-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.SideButton = {};
local sideButton = gui.SideButton;

local function OnEnter(self)
    if self.shine then
        self.shine:Show();
        self.shine.animIn:Play();
    end
    self:ShowGameTooltip();
end

local function OnLeave(self)
    self:HideGameTooltip();
end

local function SetEvent(self, event)
    self.Event = event;
	self.Icon.Texture:SetTexture(event.Icon);
    self.Name:SetText(event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"]);
    self:UpdateEventRuntime();
    self.TimeSinceLastUpdate = 0;
    self:SetScript("OnUpdate", KrowiAF_AlertFrame_OnUpdate);
    self:Show();
end

local function Reset(self)
    self:SetScript("OnUpdate", nil);
    self.Event = nil;
    self:Hide();
end

function sideButton:New(index)
    local frame = CreateFrame("Button", "AchievementFrameSideButton" .. index, AchievementFrame, "KrowiAF_AlertFrame_" .. (addon.Options.db.EventReminders.Compact and "Small" or "Normal") .. "_Template"); -- Blizzard naming
    frame:SetParent(AchievementFrame); -- Set parent to automatically hide when the AchievementFrame is hidden
    frame:RegisterForClicks("LeftButtonUp");

    frame.SetEvent = SetEvent;
    frame.Reset = Reset;
    frame:SetScript("OnEnter", OnEnter);
    frame:SetScript("OnLeave", OnLeave);
    frame:HookScript("OnClick", function()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    end);
    frame:SetScript("OnShow", function(self)
        -- OnShow(self, otherButtons);
        self:UpdateEventRuntime();
    end);

    return frame;
end