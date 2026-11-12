local _, addon = ...
addon.EventReminders = {}
local eventReminders = addon.EventReminders

-- Event reminders (docs/work/2026-11-12-event-reminders): pop-ups and chat lines for the events going on and the
-- holidays coming up, on login, on reload and when an event starts, and the side buttons beside the achievement window
-- or the world map. Its switch is the setting reminders always had, EventReminders.Enabled. Its files, in load order
-- (Files.xml): this registration and the table addon.EventReminders, the event sources (Data/: the custom timers,
-- Blizzard's event scheduler, KAF's fixed schedules, the watcher, the active and upcoming events), the pop-ups
-- (AlertFrame/, AlertSystem.lua), the side buttons (SideButton/, SideButtonSystem.lua) and their menu (Menu/), the
-- per-event toggles (EventOptions.lua), the settings (Options.lua) and the help pages (Help.lua). The event data itself,
-- the event objects and the calendar cache are the core's (Api/EventDataApi.lua, Data/EventData.lua): the obtainable
-- state reads them whether reminders are on or off. The GUI tables keep their names under addon.Gui, which the tests reach.

-- The reminders on login and on reload, each after its delay; zoning into an instance fires the event too, without
-- either flag (isLogin, isReload)
local function OnEnteringWorld(isLogin, isReload)
    if not (isLogin or isReload) then
        return
    end
    local profile = addon.Options.db.profile.EventReminders
    local when = isLogin and "OnLogin" or "OnReload"
    local popUps, chatMessages = profile.PopUps[when], profile.ChatMessages[when]
    local popUpsUpcoming, chatMessagesUpcoming = profile.PopUps[when .. "Upcoming"], profile.ChatMessages[when .. "Upcoming"]
    C_Timer.After(0, function()
        C_Timer.After(profile.OnLoginDelay, function()
            eventReminders.EventScheduler.EnsureData() -- the times of the events from Blizzard's event scheduler, for the reminders below
            addon.Gui.EventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(popUps, chatMessages)
            eventReminders.EventObserver.Start() -- after the reminders, so nothing it does can stop them; learns the older events' starts, once a session
        end)
    end)
    C_Timer.After(0, function()
        C_Timer.After(profile.OnLoginUpcomingDelay, function()
            addon.Gui.EventReminderAlertSystem:ShowUpcomingCalendarEventsOnPlayerEnteringWorld(popUpsUpcoming, chatMessagesUpcoming)
        end)
    end)
end

local function OnEvent(self, event, arg1, arg2)
    if event == "PLAYER_ENTERING_WORLD" then
        OnEnteringWorld(arg1, arg2)
    elseif event == "ADDON_LOADED" and arg1 == "Blizzard_Calendar" then
        self:UnregisterEvent("ADDON_LOADED")
        eventReminders.EventData.LoadBlizzard_Calendar()
    end
end

-- At ADDON_LOADED, after the options load (Features.lua StartAll): the pop-ups' own alert container before the login
-- events it waits for, the listener for the login and the calendar, the side buttons on the world map (the achievement
-- window's wait for AfterAchievementUI) and the watcher's log in the Data Manager
local function Start()
    addon.Gui.EventReminderAlertSystem:Load()
    local listener = CreateFrame("Frame")
    eventReminders.Listener = listener
    listener:SetScript("OnEvent", OnEvent)
    listener:RegisterEvent("PLAYER_ENTERING_WORLD")
    if C_AddOns.IsAddOnLoaded("Blizzard_Calendar") then
        eventReminders.EventData.LoadBlizzard_Calendar()
    else
        listener:RegisterEvent("ADDON_LOADED")
    end
    addon.Gui.EventReminderSideButtonSystem:Load()
    addon.Slots.DataManagerTabs.Add(eventReminders.EventObserver.DataManagerTab)
end

-- The side buttons on the achievement window, once it exists; Load left them unloaded when it was their anchor
local function AfterAchievementUI()
    local sideButtons = addon.Gui.EventReminderSideButtonSystem
    if not sideButtons.Loaded then
        sideButtons:Load()
    end
end

addon.Features.Register({
    Name = "EventReminders",
    Title = addon.L["Event reminders"],
    Switch = "EventReminders.Enabled",
    Start = Start,
    AfterAchievementUI = AfterAchievementUI
})