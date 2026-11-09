local _, addon = ...
local feature = addon.RewardPreview

-- Preview Reward in the achievement's right-click menu, an entry of the core's menu slot (Slots.lua, AchievementMenu)
-- added by the feature's Start: after Pop Out, before Transmog sets
local section = {Order = 50}
feature.MenuEntry = section

function section:CheckAdd(achievement)
    return addon.RewardPreviewData.HasPreviewableEntries(achievement.Id)
end

function section:Add(menu, achievement, menuBuilder, caller)
    local entries = addon.RewardPreviewData.GetPreviewableEntries(achievement.Id)

    if #entries == 1 then
        menuBuilder:CreateButtonAndAdd(
            menu,
            addon.L["Preview Reward"],
            function()
                addon.Gui.RewardPreview:TogglePin(caller, achievement.Id, entries[1])
                menuBuilder:Close()
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
                menuBuilder:Close()
            end
        )
    end
    menuBuilder:AddChildMenu(menu, previewMenu)
end
