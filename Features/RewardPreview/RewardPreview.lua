local _, addon = ...
addon.RewardPreview = {}
local feature = addon.RewardPreview

-- Reward preview (docs/work/2026-11-08-feature-split-poc): a model of an achievement's mount, pet, decor or other reward,
-- from a row icon, the right-click menu or Show me. The first switchable feature: it starts only while its switch is on
-- (Features.lua). Its files, in load order (Files.xml): this registration, the public API and the data fields (Api.lua),
-- the entries' lookups (Data.lua), the window (Window.xml with Window.lua and WindowMixin.lua), the row icons
-- (RowIcon.lua), the menu entry (MenuEntry.lua), the settings (Options.lua) and the help page (Help.lua).

local function Start()
    addon.Gui.RewardPreview.Create()
    feature.TakeQueue()
    addon.Slots.RowIcons.Add({Order = 1000, Set = feature.SetRowIcons})
    addon.Slots.AchievementMenu.Add(feature.MenuEntry)
end

addon.Features.Register({
    Name = "RewardPreview",
    Title = addon.L["Reward preview"],
    Switch = "Features.RewardPreview",
    Start = Start,
    OnNotStarted = function() feature.DropQueue() end
})