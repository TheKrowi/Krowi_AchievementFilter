local _, addon = ...

-- Guide in the achievement's right-click menu, an entry of the core's menu slot (Slots.lua, AchievementMenu), added when
-- this file loads; it moves into Achievement guides' Start once that feature is split (docs/work/2026-11-09-right-click-menu)
local section = {Order = 30} -- after Go to, before Pop Out
addon.Gui.Guide.MenuEntry = section -- Tests/Guide.lua runs this entry on its own
addon.Slots.AchievementMenu.Add(section)

-- The waypoint actions of every step that names a place, kept from CheckAdd for Add
local actions
function section:CheckAdd(achievement)
    local options = addon.Options.db.profile.Achievements.Guide
    if achievement.Guide == nil or not options.RightClickMenu then
        return
    end
    actions = {}
    for _, line in ipairs(addon.Gui.Guide.GetLines(achievement)) do
        if line.Waypoint then
            for _, action in ipairs(addon.Gui.Guide.Waypoint.GetCurrentActions(line.Waypoint)) do
                tinsert(actions, action)
            end
        end
    end
    return options.Icon or #actions > 0 -- the panel comes with the icon option
end

function section:Add(menu, achievement, menuBuilder, caller)
    local guideMenu = menuBuilder:CreateSubmenuButton(menu, addon.L["Guide"])
    if addon.Options.db.profile.Achievements.Guide.Icon then
        menuBuilder:CreateButtonAndAdd(
            guideMenu,
            addon.L["Guide Open"],
            function()
                addon.Gui.Guide.Panel:TogglePin(caller, achievement)
                menuBuilder:Close()
            end
        )
    end
    for _, action in ipairs(actions) do
        menuBuilder:CreateButtonAndAdd(
            guideMenu,
            action.Text,
            function()
                if action.Func then
                    action.Func()
                end
                menuBuilder:Close()
            end,
            action.Enabled
        )
    end
    menuBuilder:AddChildMenu(menu, guideMenu)
end