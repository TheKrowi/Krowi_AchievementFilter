local _, addon = ...

-- GW2_UI's skin of Event reminders' pop-ups and side buttons (Features/EventReminders), a part of the GW2_UI plugin
-- (Plugins/GW2_UI/GW2_UI.lua, AddPart), in a file of its own so the plugin's file names no feature
-- (docs/work/2026-11-12-event-reminders). It hooks the pop-ups' SetUpAlert and the side buttons' Refresh, never their
-- Load: the feature starts before the plugins load. While Event reminders is off it hooks nothing.

local function SkinAlertFrameTemplate(frame, addFlare)
    frame:SetAlpha(1)

    if not frame.hooked then
        hooksecurefunc(frame, 'SetAlpha', GW2_ADDON.ForceAlpha)
        frame.hooked = true
    end

    if not frame.backdrop then
        frame:GwCreateBackdrop(GW2_ADDON.BackdropTemplates.AlertFrame)
        frame.backdrop:SetPoint("TOPLEFT", frame.Background, "TOPLEFT", -10, 0)
        frame.backdrop:SetPoint("BOTTOMRIGHT", frame.Background, "BOTTOMRIGHT", 5, 0)
    end

    -- Background
    frame.Background:SetTexture()
    frame.glow:GwKill()
    frame.shine:GwKill()

    -- Text
    frame.Unlocked:SetTextColor(1, 1, 1)
    frame.Name:SetPoint("LEFT", frame, "LEFT", 60, 0)
    frame.Name:SetPoint("RIGHT", frame, "RIGHT", -10, 0)

    -- Icon
    frame.Icon.Texture:SetSize(45, 45)
    frame.Icon.Texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    frame.Icon.Overlay:GwKill()

    frame.Icon.Texture:ClearAllPoints()
    frame.Icon.Texture:SetPoint("LEFT", frame, 7, 0)

    if not frame.Icon.Texture.b then
        frame.Icon.Texture.b = CreateFrame("Frame", nil, frame)
        frame.Icon.Texture.b:SetAllPoints(frame.Icon.Texture)
        frame.Icon.Texture:SetParent(frame.Icon.Texture.b)
        frame.Icon.iconBorder = frame.Icon.Texture.b:CreateTexture(nil, "ARTWORK")
        frame.Icon.iconBorder:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitemborder")
        frame.Icon.iconBorder:SetAllPoints(frame.Icon.Texture.b)
    end

    -- Flare
    if addFlare then
        GW2_ADDON.AddFlareAnimationToObject(frame, frame.Icon.Texture.b)
    end
end

local function SkinSideButton(button, prevButton)
    if not button.HasGw2UiSkin then
        SkinAlertFrameTemplate(button, false)
    end
    if not prevButton then
        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, addon.Util.IsModern and 6 or 13) -- Make the 2nd button anchor like the 1st one
    else
        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9) -- Make the 2nd button anchor like the 1st one
    end
    button.HasGw2UiSkin = true
end

local function SkinSideButtons()
    local i = 1
    local button = _G["KrowiAF_AchievementFrameSideButton" .. i]
    local prevButton
    while button do
        SkinSideButton(button, prevButton)
        prevButton = button
        i = i + 1
        button = _G["KrowiAF_AchievementFrameSideButton" .. i]
    end
end

KrowiAF.PluginsApi.Plugins.GW2_UI.AddPart({
    Install = function(context)
        if not addon.Features.IsStarted("EventReminders") then
            return
        end
        local doSkin = context.DoSkin
        if doSkin.AlertFrames then
            hooksecurefunc(addon.Gui.EventReminderAlertSystem, "SetUpAlert", function(frame)
                SkinAlertFrameTemplate(frame)
            end)
        end
        hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Refresh", function()
            if doSkin.Achievements then
                SkinSideButtons()
            end
        end)
    end
})