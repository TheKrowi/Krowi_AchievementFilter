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
end

-- local function OnShow(self, otherButtons)
--     self:UpdateEventRuntime(); -- Here for instant update on show
--     local eventElapsed;
--     if self.Event.MapID then -- Handle the world events different, elapsed if not visible on the map
--         local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(self.Event.MapID, self.Event.Id);
--         eventElapsed = poiInfo == nil;
--     else
--         eventElapsed = self.Event.EventDetails.EndTime - time() < 0;
--     end
--     if eventElapsed then -- Event finished so remove button and reorder rest
--         for i = 1, #otherButtons, 1 do
--             if otherButtons[i].Event.ID == self.Event.ID then -- Found this button
--                 if i == 1 and i + 1 <= #otherButtons then -- Button is the 1st and there are more
--                     otherButtons[i + 1]:ClearAllPoints();
--                     otherButtons[i + 1]:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 0, 0); -- Make the 2nd button anchor like the 1st one
--                 elseif i < #otherButtons then -- Button is somewhere in the middle
--                     otherButtons[i + 1]:ClearAllPoints();
--                     otherButtons[i + 1]:SetPoint("TOPLEFT", otherButtons[i - 1], "BOTTOMLEFT", 0, 0); -- Make the 2nd button anchor like the 1st one
--                 -- else -- Button is the last, nothing to move
--                 end
--             end
--         end
--     end
-- end

local function SetEvent(self, event)
    self.Event = event;
	self.Icon.Texture:SetTexture(event.Icon);
    self.Name:SetText(event.EventDetails.Name);
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

    frame.SetEvent = SetEvent;
    frame.Reset = Reset;
    frame:SetScript("OnEnter", OnEnter);
    frame:SetScript("OnLeave", nil);
    frame:HookScript("OnClick", function()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    end);
    frame:SetScript("OnShow", function(self)
        -- OnShow(self, otherButtons);
        self:UpdateEventRuntime();
    end);

    return frame;
end