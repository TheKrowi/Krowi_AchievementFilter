local _, addon = ...
addon.Gui.Guide.Panel = {}
local panel = addon.Gui.Guide.Panel

-- A side panel with an achievement's guide, like the reward preview (Gui/RewardPreview/RewardPreview.lua): hovering the
-- row's guide icon shows it (Achievements.Guide.MouseoverShow), clicking the icon or Open guide in the right-click menu
-- pins it, and only a pinned panel can be moved. It shares the spot next to the row with the reward preview
-- (Gui/SidePanels.lua). Escape closes it, and so does hiding the window the row belongs to. It is built in Lua on first
-- use, so the headless guide suite builds the same frame.

local width = 320
local padding = 12
local titleGap = 10

-- The panel closes with the window its row belongs to (Gui/SidePanels.lua)
local function OnOwnerWindowHide(ownerWindow)
    if panel.Frame and panel.Frame.OwnerWindow == ownerWindow then
        panel:Close()
    end
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

local function OnMouseDown(frame)
    if frame.Pinned then
        frame:StartMoving()
    end
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
    frame:SetScript("OnMouseDown", OnMouseDown)
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
    addon.Gui.RegisterSidePanel(frame) -- also registers it for Escape
    return frame
end

function panel:Render()
    local frame = self.Frame
    frame.Title:SetText(addon.GetAchievmentName(frame.Achievement.Id))
    local height = addon.Gui.Guide.Content.Render(frame.Content, frame.Achievement, width - 2 * padding)
    frame.Content:SetHeight(max(height, 1))
    frame:SetHeight(padding + frame.Title:GetStringHeight() + titleGap + height + padding)
end

-- Shows the panel for the achievement next to the row (or next to the reward preview open for it) without pinning it
function panel:ShowUnpinned(button, achievement)
    self.Frame = self.Frame or Create()
    local frame = self.Frame
    frame.OwnerButton = button
    frame.Achievement = achievement
    frame.OwnerWindow = addon.Gui.GetOwnerWindow(button)
    addon.Gui.HookOwnerWindowHide(frame.OwnerWindow, OnOwnerWindowHide)
    addon.Gui.AnchorSidePanel(frame, button)
    self:Render()
    frame.Pinned = nil
    frame:Show()
end

-- Pins the panel for the achievement; the same row and achievement again, while pinned, closes it
function panel:TogglePin(button, achievement)
    local frame = self.Frame
    if frame and frame:IsShown() and frame.Pinned and frame.OwnerButton == button and frame.Achievement == achievement then
        self:Close()
        return
    end
    self:ShowUnpinned(button, achievement)
    self.Frame.Pinned = true
end

-- Called when the mouse leaves the row's guide icon; a pinned panel, or one shown for another row, stays
function panel:HideIfUnpinned(button)
    local frame = self.Frame
    if frame and not frame.Pinned and frame.OwnerButton == button then
        frame:Hide()
    end
end

function panel:Close()
    if self.Frame then
        self.Frame:Hide()
    end
end