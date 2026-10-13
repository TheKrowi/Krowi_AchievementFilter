local _, addon = ...
local gui = addon.Gui

-- Side panels pinned to or hovered from an achievement row, the reward preview and the guide panel. Each closes with the
-- window its row belongs to (the main achievements frame or a popout). Both open next to the row; when one is already
-- open for the same row, the next one sits to its right, and when the one in the middle closes the other moves back next
-- to the row (Krowi, 2026-10-11). Each panel keeps its row in OwnerButton.

local sidePanels = {}

-- The top-level window an achievement row belongs to; nil for any other frame
function gui.GetOwnerWindow(button)
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

-- Calls onHide(ownerWindow) whenever ownerWindow hides. A panel passes the same function every time, so each window is
-- hooked once per panel.
local hookedOwners = {}
function gui.HookOwnerWindowHide(ownerWindow, onHide)
    if not ownerWindow then
        return
    end
    hookedOwners[onHide] = hookedOwners[onHide] or {}
    if hookedOwners[onHide][ownerWindow] then
        return
    end
    hookedOwners[onHide][ownerWindow] = true
    ownerWindow:HookScript("OnHide", onHide)
end

-- Places a side panel next to its row, or next to another side panel already open for the same row. A panel never
-- anchors to one that is anchored to it.
function gui.AnchorSidePanel(frame, button)
    local anchor = button
    for _, other in ipairs(sidePanels) do
        if other ~= frame and other:IsShown() and other.OwnerButton == button and other.SidePanelAnchor ~= frame then
            anchor = other
            break
        end
    end
    frame.SidePanelAnchor = anchor ~= button and anchor or nil
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", anchor, "TOPRIGHT", 0, 0)
end

-- Adds a panel to the chain once; when it hides, a panel that sat next to it moves back next to its own row. Escape
-- closes a side panel before the window it belongs to (Gui/FramesForClosing.lua); a panel registers before its first
-- Show, so the OnShow hook sees that Show
function gui.RegisterSidePanel(frame)
    if frame.IsSidePanel then
        return
    end
    frame.IsSidePanel = true
    tinsert(sidePanels, frame)
    gui:RegisterFrameForClosing(frame)
    frame:HookScript("OnHide", function(self)
        self.SidePanelAnchor = nil
        for _, other in ipairs(sidePanels) do
            if other ~= self and other:IsShown() and other.SidePanelAnchor == self and other.OwnerButton then
                gui.AnchorSidePanel(other, other.OwnerButton)
            end
        end
    end)
end