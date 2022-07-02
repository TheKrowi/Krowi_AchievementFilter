-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.SideButton = {};
local sideButton = gui.SideButton;

sideButton.OfsX1 = 0;
sideButton.OfsY1 = 0;
sideButton.OfsXn = 0;
sideButton.OfsYn = 0;

local OnClick;

-- [[ Constructors ]] --
sideButton.__index = sideButton; -- Used to support OOP like code
function sideButton:New(event, otherButtons)
    diagnostics.Trace("achievementFrameTabButton:New");

	-- Create frame
    local frame = CreateFrame("Button", "AchievementFrameSideButton" .. event.ID, AchievementFrame, addon.Options.db.EventReminders.Compact and "KrowiAF_Small_AlertFrameTemplate" or "KrowiAF_AlertFrameTemplate"); -- Blizzard naming
    frame:SetParent(AchievementFrame); -- Set parent to automatically hide when the AchievementFrame is hidden
    addon.Util.InjectMetatable(frame, sideButton);

    -- Properties
	frame.Event = event;

    frame.Name:SetText(event.EventDetails.Name);

    frame:UpdateRuntime();

	frame.Icon.Texture:SetTexture(event.Icon);

    -- Overwrite original alert frame properties
    frame:RegisterForClicks("LeftButtonUp");
    frame:SetScript("OnEnter", function(self)
        if self.shine then
            self.shine:Show();
            self.shine.animIn:Play();
        end
    end); -- Need to add new highlight fade in
    frame:SetScript("OnLeave", nil);

    -- Set OnClick
    frame:SetScript("OnClick", function(self)
        OnClick(self);
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    end);

    frame:SetScript("OnShow", function(self)
        self:UpdateRuntime();
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
    end);

    frame.TimeSinceLastUpdate = 0;
    frame:SetScript("OnUpdate", function(self, elapsed)
        self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;

        if self.TimeSinceLastUpdate > 1 then
            self:UpdateRuntime();
            self.TimeSinceLastUpdate = 0;
        end
    end);

    -- SetPoints
    local relativeFrame = AchievementFrame;
    local relativePoint = "TOPRIGHT";
    if otherButtons[#otherButtons] ~= nil then
        relativeFrame = otherButtons[#otherButtons];
        relativePoint = "BOTTOMLEFT";
    end
    frame:ClearAllPoints();
    frame:SetPoint("TOPLEFT", relativeFrame, relativePoint, 0, 0);

    hooksecurefunc("AchievementFrame_SetTabs", function() -- Cheaty way to easily show the frame by hooking into the tabs
        frame:Show();
    end);

    return frame;
end

function sideButton:UpdateRuntime()
    gui.UpdateEventRuntime(self);
end

function OnClick(self)
    diagnostics.Trace("achFrameTabBtn:Base_OnClick");

    if AlertFrame_OnClick(self) then
		return; -- Handle right-click and close the alert
	end

    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    KrowiAF_SelectCategory(self.Event.Category);
end