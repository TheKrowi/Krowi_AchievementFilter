local _, addon = ...
addon.Gui.RightClickMenu = {}
local feature = addon.Gui.RightClickMenu

-- The right-click menu (docs/work/2026-11-09-right-click-menu): an achievement's menu, opened from a row, its menu button,
-- an objectives row, a Pop Out row or the chat-link tooltip. It hosts the core's menu slot (Slots.lua, AchievementMenu):
-- the core opens it through the slot, and other features add their entries there. Its files, in load order (Files.xml):
-- this registration, the menu (AchievementMenu.lua) and its own sections, the row's menu button (RowButton.xml and
-- RowButton.lua), the settings (Options.lua) and the help page (Help.lua).

-- The opener last: a Start that fails before it leaves no menu the core can open (Features.lua runs it in xpcall)
local function Start()
    local achievementMenu = feature.AchievementMenu
    achievementMenu.Create()
    addon.Slots.RowParts.Add({Order = 10, OnLoad = feature.AddRowButton})
    addon.Slots.AchievementMenu.SetOpener(function(caller, achievement)
        achievementMenu:Open(caller, achievement)
    end)
end

addon.Features.Register({
    Name = "RightClickMenu",
    Title = addon.L["Right-click menu"],
    Switch = "Features.RightClickMenu",
    Start = Start
})