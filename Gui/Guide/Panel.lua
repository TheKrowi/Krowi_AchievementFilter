local _, addon = ...
addon.Gui.Guide.Panel = {}
local panel = addon.Gui.Guide.Panel

-- A pinned side panel with an achievement's guide, opened from the row's guide icon or the right-click menu and anchored
-- to the row, like the reward preview (Gui/RewardPreview/RewardPreview.lua). Escape closes it, and so does hiding the
-- window the row belongs to. It is built in Lua on first use, so the headless guide suite builds the same frame.

local width = 320
local padding = 12
local titleGap = 10
local hookedOwners = {}

-- The top-level window the row belongs to: the main achievements frame or a popout
local function GetOwnerWindow(button)
    local frame = button
    while frame do
        if frame == KrowiAF_AchievementsFrame then
            return frame
        end
        if frame.AchievementId and frame.Button then -- looks like a KrowiAF_AchievementPopout instance
            return frame
        end
        frame = frame.GetParent and frame:GetParent()
    end
end

local function HookOwner(ownerWindow)
    if not ownerWindow or hookedOwners[ownerWindow] then
        return
    end
    hookedOwners[ownerWindow] = true
    ownerWindow:HookScript("OnHide", function()
        if panel.Frame and panel.Frame.OwnerWindow == ownerWindow then
            panel:Close()
        end
    end)
end

-- Entering or leaving combat changes which waypoint actions are enabled. Lockdown starts only after the
-- PLAYER_REGEN_DISABLED handlers ran, so that render waits a frame for InCombatLockdown() to say so.
local function RenderIfShown()
    local frame = panel.Frame
    if frame and frame:IsShown() and frame.Achievement then
        panel:Render()
    end
end

local function OnEvent(_, event)
    if event == "PLAYER_REGEN_DISABLED" then
        C_Timer.After(0, RenderIfShown)
    else
        RenderIfShown()
    end
end

local function CloseButtonOnClick()
    panel:Close()
end

-- The row the panel is pinned to is a recycled list button: once it scrolls out of view or shows another achievement,
-- the panel would point at the wrong row, so it closes
local function OnUpdate(frame)
    local owner = frame.OwnerButton
    if owner and (not owner:IsVisible() or (owner.Achievement and owner.Achievement ~= frame.Achievement)) then
        panel:Close()
    end
end

local function Create()
    local frame = CreateFrame("Frame", "KrowiAF_GuidePanel", UIParent, "TooltipBackdropTemplate")
    frame:SetFrameStrata("HIGH")
    frame:SetWidth(width)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:SetScript("OnMouseDown", frame.StartMoving)
    frame:SetScript("OnMouseUp", frame.StopMovingOrSizing)
    frame:SetScript("OnHide", frame.StopMovingOrSizing)
    frame:SetScript("OnEvent", OnEvent)
    frame:SetScript("OnUpdate", OnUpdate) -- runs only while the panel is shown
    frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")

    frame.Title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.Title:SetPoint("TOPLEFT", frame, "TOPLEFT", padding, -padding)
    frame.Title:SetWidth(width - 2 * padding - 20)
    frame.Title:SetJustifyH("LEFT")

    -- NoScripts: the plain close button hides through HideUIPanel, the panel manager's entry point, which refuses a
    -- tainted caller in combat; the reward preview closes itself the same way
    frame.CloseButton = CreateFrame("Button", nil, frame, "UIPanelCloseButtonNoScripts")
    frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    frame.CloseButton:SetScript("OnClick", CloseButtonOnClick)

    frame.Content = CreateFrame("Frame", nil, frame)
    frame.Content:SetPoint("TOPLEFT", frame.Title, "BOTTOMLEFT", 0, -titleGap)
    frame.Content:SetWidth(width - 2 * padding)

    frame:Hide()
    addon.Gui:RegisterFrameForClosing(frame)
    return frame
end

function panel:Render()
    local frame = self.Frame
    frame.Title:SetText(addon.GetAchievmentName(frame.Achievement.Id))
    local height = addon.Gui.Guide.Content.Render(frame.Content, frame.Achievement, width - 2 * padding)
    frame.Content:SetHeight(max(height, 1))
    frame:SetHeight(padding + frame.Title:GetStringHeight() + titleGap + height + padding)
end

-- Opens the panel for the achievement next to the row; the same row and achievement again closes it
function panel:TogglePin(button, achievement)
    self.Frame = self.Frame or Create()
    local frame = self.Frame
    if frame:IsShown() and frame.OwnerButton == button and frame.Achievement == achievement then
        self:Close()
        return
    end
    frame.OwnerButton = button
    frame.Achievement = achievement
    frame.OwnerWindow = GetOwnerWindow(button)
    HookOwner(frame.OwnerWindow)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
    self:Render()
    frame:Show()
end

function panel:Close()
    if self.Frame then
        self.Frame:Hide()
    end
end