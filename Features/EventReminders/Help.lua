local _, addon = ...
local L = addon.L

-- Event reminders' two help pages in the options window, whether the feature is on or off, and their Show me scenes,
-- which the registry wires only while the feature is started (Features.lua AddHelp). The scenes are shared with
-- /kaftest pictures through Options.Window.HelpScenes.

local window = addon.Options.Window
local blocks, kit = window.HelpBlocks, window.ShowMeKit

-- Placeholder reminders, as the Location button shows them (AlertSystem.lua ShowPlaceholders), for the fade delay.
-- worldFirst: the event list's Show me starts with the world events, the reminders' with the calendar ones.
local function ShowPlaceholders(ready, worldFirst)
    local system = addon.Gui.EventReminderAlertSystem
    if not system.SubSystem then -- no alert container to show them in; the registry wires this scene only while started
        return false
    end
    local shown = system:ShowPlaceholders(worldFirst, addon.Options.db.profile.EventReminders.PopUps.FadeDelay)
    kit.Ready(ready, {Shown = shown})
end

addon.Features.AddHelp("EventReminders", {
    Id = "events",
    Title = L["Event Reminders"],
    Blocks = blocks.Blocks(
        blocks.Picture("Reminders"),
        blocks.Text(L["Help Events Intro"]),
        blocks.Term(L["Help Shared Click"], L["Help Events Click"]),
        blocks.Term(L["Help Shared Right Click"], L["Help Events Right Click"]),
        blocks.Term(L["Help Events Time Term"], L["Help Events Time"])
    ),
    Scene = function(ready)
        return ShowPlaceholders(ready, false)
    end
})

addon.Features.AddHelp("EventReminders", {
    Id = "eventlist",
    Title = L["Help Eventlist Title"],
    Blocks = blocks.Blocks(
        blocks.Text(L["Help Eventlist Intro"])
    ),
    Scene = function(ready)
        return ShowPlaceholders(ready, true)
    end
})