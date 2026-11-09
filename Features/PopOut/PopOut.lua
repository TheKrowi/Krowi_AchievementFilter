local _, addon = ...

-- Pop Out (docs/work/2026-11-09-pop-out): an achievement row in a small window of its own, kept across sessions and
-- snapping to other Pop Outs. Opened by a modifier click on a row (Modifier.lua, the core's row-modifier slot), from the
-- achievement's right-click menu (MenuEntry.lua, the core's menu slot) and by Show me. Its files, in load order
-- (Files.xml): this registration, the snapping (SnapFrame.xml), the windows (AchievementPopout.lua and its mixin, the
-- template in AchievementPopout.xml), the menu entry, the modifier, the settings (Options.lua) and the help page
-- (Help.lua). The table addon.Gui.AchievementPopout keeps its name: the tests and EllesmereUI's part
-- (Plugins/EllesmereUI/PopOut.lua) reach it.

local function Start()
    local achievementPopout = addon.Gui.AchievementPopout
    achievementPopout.StartLog()
    addon.Slots.AchievementMenu.Add(achievementPopout.MenuEntry)
    addon.Slots.RowModifiers.Add(achievementPopout.Modifier)
end

-- The Pop Outs of the last session come back once the achievements exist
local function AfterDataLoad()
    addon.Gui.AchievementPopout:Load()
end

addon.Features.Register({
    Name = "PopOut",
    Title = addon.L["Pop Out"],
    Switch = "Features.PopOut",
    Start = Start,
    AfterDataLoad = AfterDataLoad
})