local _, addon = ...

-- EllesmereUI's skin of Event reminders' pop-ups and side buttons (Features/EventReminders), a part of the EllesmereUI
-- plugin (Plugins/EllesmereUI.lua, AddPart), in a file of its own so the plugin's file names no feature
-- (docs/work/2026-11-12-event-reminders). It hooks the pop-ups' SetUpAlert and the side buttons' Refresh, never their
-- Load: the feature starts before the plugins load. While Event reminders is off it hooks nothing. It runs nothing while
-- it loads: plugins load before the localization and the feature registry.

local compatibility = KrowiAF.PluginsApi.Plugins.EllesmereUI
local GetSkin -- EllesmereUI's skin primitives once registered (Install)

-- [[ EventReminder alert toasts ]]
-- Clears a texture outright rather than alphaing it out: a toast fades in through an
-- animation that drives alpha every frame and overwrites a SetAlpha.
local function KillTexture(texture)
    if not texture then
        return
    end
    if texture.SetAtlas then
        texture:SetAtlas("")
    end
    if texture.SetTexture then
        texture:SetTexture("")
    end
    if texture.SetAlpha then
        texture:SetAlpha(0)
    end
end

local function SkinAlertFrameTemplate(frame)
    local skin = GetSkin and GetSkin()
    if not (skin and frame) then
        return
    end

    -- Backdrop before art, so a throw leaves the plate rather than floating text. S.Shell is
    -- the toast-shaped primitive (no top bar, the frame has no title row); S.Panel is the
    -- fallback and is known to throw inside its region walk on this AlertFrameTemplate-derived
    -- frame. Both pcall-isolated: this runs inside Blizzard's ShowAlert flow, once per toast.
    local ok = pcall(skin.Shell, frame, {noTopBar = true})
    if not ok then
        ok = pcall(skin.Panel, frame)
    end
    if not ok then
        return false -- no backdrop, so leave Blizzard's plate in place
    end

    KillTexture(frame.Background)
    KillTexture(frame.glow)
    KillTexture(frame.shine)
    if frame.Icon then
        KillTexture(frame.Icon.Overlay) -- AchievementToast ring; SquareIcon supplies the border
        if frame.Icon.Texture then
            skin.SquareIcon(frame.Icon.Texture, frame.Icon)
        end
    end

    skin.Font(frame.Name)
    skin.White(frame.Name)
    skin.Font(frame.Unlocked)
    skin.White(frame.Unlocked) -- GameFontBlack, unreadable on the shell
    return true -- reports that the frame rect is now the panel
end

-- [[ EventReminder side strip ]]
-- The side buttons inherit the alert toast templates (SideButton.xml), so they take the same
-- skin. A skinned button's frame rect is the panel and seats flush on a one-pixel seam; the
-- offsets below are for the unskinned art, which insets the plate inside the frame rect.
local function SkinSideButton(button, previous, anchor)
    local x, y, stack = 5, 6, 9 -- offsets for the unskinned toast art
    if SkinAlertFrameTemplate(button) then
        local seam = compatibility.GetPixelSeam(button)
        x, y, stack = seam, 0, -seam
    end

    button:ClearAllPoints()
    if previous then
        button:SetPoint("TOPLEFT", previous, "BOTTOMLEFT", 0, stack)
    else
        button:SetPoint("TOPLEFT", anchor, "TOPRIGHT", x, y)
    end
end

local function SkinSideButtons()
    -- The strip can be anchored to the world map instead; SideButtonSystem owns that choice.
    local system = addon.Gui.EventReminderSideButtonSystem
    local anchor = system.GetAnchor and system:GetAnchor()
    if not anchor then
        return
    end

    local index = 1
    local button = _G["KrowiAF_AchievementFrameSideButton" .. index]
    local previous
    while button do
        -- Buttons are pooled by index and never destroyed, so hidden ones linger in _G.
        -- SideButtonSystem's SetPoints chains the shown ones only.
        if button:IsShown() then
            SkinSideButton(button, previous, anchor)
            previous = button
        end
        index = index + 1
        button = _G["KrowiAF_AchievementFrameSideButton" .. index]
    end
end

compatibility.AddPart({
    Install = function(getSkin)
        if not addon.Features.IsStarted("EventReminders") then
            return
        end
        GetSkin = getSkin
        hooksecurefunc(addon.Gui.EventReminderAlertSystem, "SetUpAlert", SkinAlertFrameTemplate)
        hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Refresh", SkinSideButtons)
    end
})