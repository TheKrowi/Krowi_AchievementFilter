local _, addon = ...

-- Pop Out or Close Popout in the achievement's right-click menu, an entry of the core's menu slot (Slots.lua,
-- AchievementMenu), added when this file loads; it moves into Pop Out's Start once that feature is split
-- (docs/work/2026-11-09-right-click-menu)
local section = {Order = 40} -- after Guide, before Preview Reward
addon.Slots.AchievementMenu.Add(section)

function section:CheckAdd()
    return true
end

function section:Add(menu, achievement, menuBuilder, caller)
    local achievementPopout = addon.Gui.AchievementPopout

    if achievementPopout:IsPopoutButton(caller, achievement.Id) then
        menuBuilder:CreateButtonAndAdd(
            menu,
            addon.L["Close Popout"],
            function()
                achievementPopout:Close(achievement.Id)
                menuBuilder:Close()
            end
        )
        return
    end

    menuBuilder:CreateButtonAndAdd(
        menu,
        addon.L["Pop Out"],
        function()
            achievementPopout:Open(achievement)
            menuBuilder:Close()
        end
    )
end