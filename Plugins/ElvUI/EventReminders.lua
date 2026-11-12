local _, addon = ...

-- ElvUI's skin of Event reminders' pop-ups and side buttons (Features/EventReminders), a part of the ElvUI plugin
-- (Plugins/ElvUI.lua, AddPart), in a file of its own so the plugin's file names no feature
-- (docs/work/2026-11-12-event-reminders). It hooks the pop-ups' SetUpAlert and the side buttons' Refresh, never their
-- Load: the feature starts before the plugins load. While Event reminders is off it hooks nothing.

local engine -- ElvUI's engine, from the plugin's Load (Install)

local function ForceAlpha(self, alpha, forced)
    if alpha ~= 1 and forced ~= true then
        self:SetAlpha(1, true)
    end
end

local function SkinAlertFrameTemplate(frame)
    frame:SetAlpha(1)

    if not frame.hooked then
        hooksecurefunc(frame, 'SetAlpha', ForceAlpha)
        frame.hooked = true
    end

    if not frame.backdrop then
        frame:CreateBackdrop('Transparent')
        frame.backdrop:Point('TOPLEFT', frame.Background, 'TOPLEFT', -2, -6)
        frame.backdrop:Point('BOTTOMRIGHT', frame.Background, 'BOTTOMRIGHT', -2, 6)
    end

    -- Background
    frame.Background:SetTexture()
    frame.glow:Kill()
    frame.shine:Kill()

    -- Text
    frame.Unlocked:FontTemplate(nil, 12)
    frame.Unlocked:SetTextColor(1, 1, 1)
    frame.Name:FontTemplate(nil, 12)

    -- Icon
    frame.Icon.Texture:SetTexCoord(unpack(engine.TexCoords))
    frame.Icon.Overlay:Kill()

    frame.Icon.Texture:ClearAllPoints()
    frame.Icon.Texture:Point('LEFT', frame, 7, 0)

    if not frame.Icon.Texture.b then
        frame.Icon.Texture.b = CreateFrame('Frame', nil, frame)
        frame.Icon.Texture.b:SetTemplate()
        frame.Icon.Texture.b:SetOutside(frame.Icon.Texture)
        frame.Icon.Texture:SetParent(frame.Icon.Texture.b)
    end
end

local function SkinSideButton(button, prevButton)
    if not button.HasElvUiSkin then
        SkinAlertFrameTemplate(button)
    end
    if not prevButton then
        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, addon.Util.IsModern and 6 or 13) -- Make the 2nd button anchor like the 1st one
    else
        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9) -- Make the 2nd button anchor like the 1st one
    end
    button.HasElvUiSkin = true
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

KrowiAF.PluginsApi.Plugins.ElvUI.AddPart({
    Install = function(context)
        if not addon.Features.IsStarted("EventReminders") then
            return
        end
        engine = context.Engine
        local doSkin = context.DoSkin
        if doSkin.AlertFrames then
            hooksecurefunc(addon.Gui.EventReminderAlertSystem, "SetUpAlert", SkinAlertFrameTemplate)
        end
        hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Refresh", function()
            if doSkin.Achievements then
                SkinSideButtons()
            end
        end)
    end
})