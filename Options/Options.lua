local _, addon = ...
local options = addon.Options

-- Closes the settings panel before the addon shows a window or page over the game. Close(true) commits and hides it
-- without Blizzard's way back to the game menu, whose ToggleGameMenu calls the protected SpellStopCasting
-- (docs/work/2026-10-11-latent-bugs). With unapplied settings Close asks through a popup whose buttons would then take
-- that way tainted, and in combat HideUIPanel refuses addon code, so the panel then stays open for the player to close.
-- Callers outside the panel (the options window) reach it too, so it does nothing while the panel is closed.
function options.CloseSettingsPanel()
    if not SettingsPanel:IsShown() or InCombatLockdown() or SettingsPanel:HasUnappliedSettings() then
        return
    end
    SettingsPanel:Close(true)
end

function options.SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = KrowiAF_GetOptions.GetTable(addon.Metadata.Prefix .. "_Layout", "args.Search.args.SearchPreview.args.NumberOfSearchPreviews")
    numberOfSearchPreviews.max = 17 + math.floor(addon.Options.db.profile.Window.AchievementFrameHeightOffset / 29)
    return numberOfSearchPreviews
end