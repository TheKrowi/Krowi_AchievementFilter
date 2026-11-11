local _, addon = ...

-- EllesmereUI's skin of Pop Outs (Features/PopOut), a part of the EllesmereUI plugin (Plugins/EllesmereUI.lua, AddPart),
-- in a file of its own so the plugin's file names no feature (docs/work/2026-11-09-pop-out). The button clone and its
-- objectives ride the plugin's mixin hooks; this is the corner chrome only. While Pop Out is off no Pop Out opens, so
-- the part skins nothing. It runs nothing while it loads: plugins load before the localization and the feature registry.

local function SkinAchievementPopout(skin, popout)
    if not (skin and popout) then
        return
    end
    skin.CloseButton(popout.CloseButton)
    if popout.ResizeButton then
        skin.Button(popout.ResizeButton)
    end
end

KrowiAF.PluginsApi.Plugins.EllesmereUI.AddPart({
    -- Pop Outs are pooled and reused: each one opened gets the chrome
    -- Only for a started Pop Out: a feature that is off gets no hook (InstallHooks runs after the registry's StartAll)
    Install = function(GetSkin)
        local achievementPopout = addon.Gui.AchievementPopout
        if not (achievementPopout and addon.Features.IsStarted("PopOut")) then
            return
        end
        hooksecurefunc(achievementPopout, "Open", function(self, achievement)
            SkinAchievementPopout(GetSkin(), self.OpenPopouts[achievement and achievement.Id])
        end)
    end,
    -- The ones already open, such as those restored at login
    Apply = function(GetSkin)
        local achievementPopout = addon.Gui.AchievementPopout
        for _, popout in next, achievementPopout and achievementPopout.OpenPopouts or {} do
            SkinAchievementPopout(GetSkin(), popout)
        end
    end
})