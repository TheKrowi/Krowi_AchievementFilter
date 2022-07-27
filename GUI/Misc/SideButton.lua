-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.SideButton = {};
local sideButton = gui.SideButton;

sideButton.OfsX1 = 0;
sideButton.OfsY1 = 0;
sideButton.OfsXn = 0;
sideButton.OfsYn = 0;

-- [[ Constructors ]] --
sideButton.__index = sideButton; -- Used to support OOP like code
function sideButton:New(event, otherButtons)
    local frame = CreateFrame("Button", "AchievementFrameSideButton" .. event.ID, AchievementFrame, addon.Options.db.EventReminders.Compact and "KrowiAF_EventAlertFrame_Small_Template" or "KrowiAF_EventAlertFrame_Template"); -- Blizzard naming
    frame:SetParent(AchievementFrame); -- Set parent to automatically hide when the AchievementFrame is hidden
    addon.Util.InjectMetatable(frame, sideButton);

	frame.Event = event;

    frame.Name:SetText(event.EventDetails.Name);

    frame:UpdateEventRuntime();

	frame.Icon.Texture:SetTexture(event.Icon);

    frame:RegisterForClicks("LeftButtonUp");
    frame:SetScript("OnEnter", sideButton.OnEnter);
    frame:SetScript("OnLeave", nil);
    frame:HookScript("OnClick", function()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    end);
    frame:SetScript("OnShow", function(self)
        self:OnShow(otherButtons);
    end);

    frame.TimeSinceLastUpdate = 0;

    -- SetPoints
    local relativeFrame = AchievementFrame;
    local relativePoint = "TOPRIGHT";
    if otherButtons[#otherButtons] ~= nil then
        relativeFrame = otherButtons[#otherButtons];
        relativePoint = "BOTTOMLEFT";
    end
    frame:ClearAllPoints();
    frame:SetPoint("TOPLEFT", relativeFrame, relativePoint, 0, 0);

    hooksecurefunc(AchievementFrame, "Show", function()
        frame:Show();
    end);

    return frame;
end

function sideButton:OnEnter()
    if self.shine then
        self.shine:Show();
        self.shine.animIn:Play();
    end
end

function sideButton:OnShow(otherButtons)
    self:UpdateEventRuntime();
    if self.Event.EventDetails.EndTime - time() < 0 then -- Event finished so remove button and reorder rest
        for i = 1, #otherButtons, 1 do
            if otherButtons[i].Event.ID == self.Event.ID then -- Found this button
                if i == 1 and i + 1 <= #otherButtons then -- Button is the 1st and there are more
                    otherButtons[i + 1]:ClearAllPoints();
                    otherButtons[i + 1]:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", sideButton.OfsX1, sideButton.OfsY1); -- Make the 2nd button anchor like the 1st one
                elseif i < #otherButtons then -- Button is somewhere in the middle
                    otherButtons[i + 1]:ClearAllPoints();
                    otherButtons[i + 1]:SetPoint("TOPLEFT", otherButtons[i - 1], "BOTTOMLEFT", sideButton.OfsXn, sideButton.OfsYn); -- Make the 2nd button anchor like the 1st one
                -- else -- Button is the last, nothing to move
                end
            end
        end
    end
end