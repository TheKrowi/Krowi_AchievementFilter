local _, addon = ...
local section = {}
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section)

function section:CheckAdd(achievement)
    return addon.RewardPreviewData ~= nil and addon.RewardPreviewData.HasPreviewableEntries(achievement.Id)
end

function section:Add(menu, achievement, menuBuilder, caller)
    local entries = addon.RewardPreviewData.GetPreviewableEntries(achievement.Id)

    if #entries == 1 then
        menuBuilder:CreateButtonAndAdd(
            menu,
            addon.L["Preview Reward"],
            function()
                addon.Gui.RewardPreview:TogglePin(caller, achievement.Id, entries[1])
                addon.Gui.RightClickMenu.AchievementMenu:CloseMenu()
            end
        )
        return
    end

    local previewMenu = menuBuilder:CreateSubmenuButton(menu, addon.L["Preview Reward"])
    for _, entry in next, entries do
        menuBuilder:CreateButtonAndAdd(
            previewMenu,
            addon.RewardPreviewData.GetLabel(entry),
            function()
                addon.Gui.RewardPreview:TogglePin(caller, achievement.Id, entry, entries)
                addon.Gui.RightClickMenu.AchievementMenu:CloseMenu()
            end
        )
    end
    menuBuilder:AddChildMenu(menu, previewMenu)
end
