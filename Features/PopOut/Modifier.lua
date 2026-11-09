local _, addon = ...

-- A modifier click on an achievement row opens its Pop Out: an entry of the core's row-modifier slot (Slots.lua,
-- RowModifiers), added in the feature's Start (PopOut.lua). The modifier is the setting Achievements.Modifiers.PopOut.
addon.Gui.AchievementPopout.Modifier = {
    Order = 10,
    Handle = function(row)
        if not addon.IsCustomModifierKeyDown(addon.Options.db.profile.Achievements.Modifiers.PopOut) then
            return false
        end
        addon.Gui.AchievementPopout:Open(row.Achievement)
        return true
    end
}