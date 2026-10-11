local _, addon = ...
local achievementMenu = addon.Gui.RightClickMenu.AchievementMenu
local section = {}
tinsert(achievementMenu.Sections, section)
achievementMenu.GuideSection = section -- Tests/Guide.lua runs this section on its own

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
                achievementMenu:CloseMenu()
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
                achievementMenu:CloseMenu()
            end,
            action.Enabled
        )
    end
    menuBuilder:AddChildMenu(menu, guideMenu)
end