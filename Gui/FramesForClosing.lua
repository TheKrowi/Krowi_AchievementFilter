local _, addon = ...
local gui = addon.Gui

-- Escape closes the addon's frames one per press, the most recently shown first, and leaves the
-- frames underneath open. Tests/Escape.lua holds the scenarios and the Blizzard facts behind this.
--
-- KrowiAF_SpecialFrame stays in UISpecialFrames while a registered frame is shown. Blizzard's
-- CloseAllWindows hides it (inside securecall("CloseSpecialWindows"), which contains the taint of an
-- addon entry), its OnHide closes the topmost frame, and it shows itself again while frames remain.
-- The achievement window is shown by this addon's own toggle with a plain Show (addon.OverwriteFunctions),
-- so the UI panel manager does not know it is open, CloseWindows does not hide it before the special
-- frames, and it takes its turn in the list like any other frame on both clients. Only when another
-- path registered it through ShowUIPanel does it go through HideUIPanel: a plain Hide would leave it
-- registered, and CloseWindows would then consume every following Escape (HideUIPanel returns early
-- for a hidden frame).
-- Do NOT use RegisterGameMenuEscHandler (Retail 12.1, Blizzard_GameMenuEsc) for this: registering
-- from addon code writes and re-sorts Blizzard's handler table in tainted execution, after which every
-- Escape press runs the whole chain tainted and its SpellStopCasting call is forbidden (verified
-- 2026-09-19). Its AddOn priority is for Blizzard's own load-on-demand addons.

local framesForClosing = {} -- shown registered frames, last = most recently shown

local function Remove(frame)
    for i = #framesForClosing, 1, -1 do
        if framesForClosing[i] == frame then
            tremove(framesForClosing, i)
        end
    end
end

function gui:RegisterFrameForClosing(frame)
    frame:HookScript("OnShow", function()
        Remove(frame)
        tinsert(framesForClosing, frame)
        KrowiAF_SpecialFrame:Show()
    end)
    frame:HookScript("OnHide", function()
        Remove(frame)
        if #framesForClosing == 0 then
            KrowiAF_SpecialFrame:Hide()
        end
    end)
end

local function IsRegisteredUiPanel(frame) -- shown through ShowUIPanel, so the panel manager holds it in an area slot
    local name = frame:GetName()
    local layout = name and UIPanelWindows[name]
    return layout ~= nil and layout.area ~= nil and GetUIPanel(layout.area) == frame
end

-- Closes the topmost registered frame; true when it did
function addon.OnEscapePressed()
    local frame = framesForClosing[#framesForClosing]
    if not frame then
        return false
    end
    if IsRegisteredUiPanel(frame) then
        if InCombatLockdown() then
            return false -- HideUIPanel refuses insecure calls in combat; Blizzard's CloseAllWindows hides the panel securely instead
        end
        HideUIPanel(frame)
    else
        frame:Hide()
    end
    return not frame:IsShown()
end

tinsert(UISpecialFrames, "KrowiAF_SpecialFrame")
KrowiAF_SpecialFrame:HookScript("OnHide", function()
    addon.OnEscapePressed()
    if #framesForClosing > 0 then
        KrowiAF_SpecialFrame:Show()
    end
end)