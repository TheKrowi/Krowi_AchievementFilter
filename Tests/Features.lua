local addonName, addon = ...
addon.Tests.Features = {}
local features = addon.Tests.Features

-- The features that switch off (docs/work/2026-11-08-feature-split-poc): each feature's state against its switch.
-- - A feature that is off never starts: no frame, no data, no entry in a core slot (Slots.lua), nothing made while its
--   files load. One that is on has them all.
-- - A boot is "off" or "on" by the feature's switch in the profile (on while the profile has none), so a run checks the
--   state it finds: in game the switches of the moment (/kaftest matrix sets them for each step), headlessly
--   (.claude/tools/headless/run-tests.lua) two boots of the whole addon through options-env.lua, one per state.
-- - The file-load check (load) watches every file under Features/ while it loads and runs headlessly only; in game it is
--   a SKIP.
-- - In game the suite also records the addon's memory after a full collect, with no threshold.
-- Tests may name features (the feature-boundary lint rule exempts Tests/); a feature's own checks are listed in Known.
-- Before the registry (until 2026-11-08, verified headlessly) there was no switch default and no registry, and the reward
-- preview's frame was made at file load and its data kept whatever the profile said; Recorded is now the spec's Target.

-- Name: the feature's folder under Features/ and its key in the registry
-- Switch: its saved path in the profile; Frame: a frame it makes; Data: what its data load keeps
-- Help: the section id of its help page, or a list of them
-- Opener: it hosts the achievement menu (Slots.lua, AchievementMenu.SetOpener); RowPart: it adds a part to the rows
-- (Slots.lua, RowParts); MenuEntry: it adds an entry to the achievement menu (Slots.lua, AchievementMenu); Modifier: a
-- modifier click on a row reaches it (Slots.lua, RowModifiers); AfterDataLoad: it runs after the login data load
-- (Features.lua, AfterDataLoad); Opens: the table whose Open its menu entry and modifier call, so the checks press them
-- with Open recorded instead of opening a window
-- Made: whether any of its unnamed frames exists; AfterAchievementUI: it runs once Blizzard's achievement window has
-- loaded (Features.lua, AfterAchievementUI); DataManagerTab: it adds a tab to the Data Manager (Slots.lua, DataManagerTabs)
features.Known = {
    {Name = "RewardPreview", Switch = {"Features", "RewardPreview"}, Frame = "KrowiAF_RewardPreview", Help = "rewards",
        Data = function() return addon.Data.RewardPreviewData end},
    {Name = "RightClickMenu", Switch = {"Features", "RightClickMenu"}, Help = "rightclick", Opener = true, RowPart = true},
    {Name = "PopOut", Switch = {"Features", "PopOut"}, Help = "popout", MenuEntry = true, Modifier = true, AfterDataLoad = true,
        Opens = function() return addon.Gui.AchievementPopout end},
    -- docs/work/2026-11-12-event-reminders: its switch is the setting reminders always had; the pop-ups' container and the
    -- feature's listener frame are its frames
    {Name = "EventReminders", Switch = {"EventReminders", "Enabled"}, Help = {"events", "eventlist"}, AfterAchievementUI = true,
        DataManagerTab = true, Made = function()
            local alerts, own = addon.Gui.EventReminderAlertSystem, addon.EventReminders
            return (alerts and alerts.Holder) ~= nil or (own and own.Listener) ~= nil
        end}
}

-- Check: what is observed; Recorded and Target per boot state; When: the field of Known a feature needs for the check,
-- which makes no line for a feature without it
features.Scenarios = {
    {Check = "default", Recorded = {off = "default on", on = "default on"}, Target = {off = "default on", on = "default on"}},
    {Check = "started", Recorded = {off = "not started", on = "started"}, Target = {off = "not started", on = "started"}},
    {Check = "frame", When = "Frame", Recorded = {off = "none", on = "frame"}, Target = {off = "none", on = "frame"}},
    {Check = "data", When = "Data", Recorded = {off = "none", on = "data"}, Target = {off = "none", on = "data"}},
    {Check = "slots", Recorded = {off = "owns none", on = "owns entries"}, Target = {off = "owns none", on = "owns entries"}},
    -- its help page in the options window: Show me while started; while off no Show me and the off line on top
    {Check = "help", Recorded = {off = "off line", on = "show me"}, Target = {off = "off line", on = "show me"}},
    -- the core opens the achievement menu through the slot only while its host is started
    {Check = "opener", When = "Opener", Recorded = {off = "no opener", on = "opener"}, Target = {off = "no opener", on = "opener"}},
    -- the row's parts, such as the menu button, are made only while their feature is started
    {Check = "rowpart", When = "RowPart", Recorded = {off = "no part", on = "part"}, Target = {off = "no part", on = "part"}},
    -- its entry in the achievement menu, its modifier click on a row and its step after the data load, only while started
    -- the entry's button and the modifier click are pressed, Open recorded (WithOpenRecorded)
    {Check = "menuentry", When = "MenuEntry", Recorded = {off = "no entry", on = "entry opens"}, Target = {off = "no entry", on = "entry opens"}},
    {Check = "modifier", When = "Modifier", Recorded = {off = "no modifier", on = "modifier opens"}, Target = {off = "no modifier", on = "modifier opens"}},
    {Check = "afterload", When = "AfterDataLoad", Recorded = {off = "not run", on = "ran"}, Target = {off = "not run", on = "ran"}},
    -- its frames without a global name, its step once the achievement window loaded and its Data Manager tab, only while
    -- started
    {Check = "made", When = "Made", Recorded = {off = "none", on = "made"}, Target = {off = "none", on = "made"}},
    {Check = "afterui", When = "AfterAchievementUI", Recorded = {off = "not run", on = "ran"}, Target = {off = "not run", on = "ran"}},
    {Check = "tab", When = "DataManagerTab", Recorded = {off = "no tab", on = "tab"}, Target = {off = "no tab", on = "tab"}},
    {Check = "load", Recorded = {off = "nothing made", on = "nothing made"}, Target = {off = "nothing made", on = "nothing made"}}
}

local function Read(tbl, path)
    for _, key in ipairs(path) do
        if type(tbl) ~= "table" then
            return nil
        end
        tbl = tbl[key]
    end
    return tbl
end

-- "on" or "off" by the feature's switch in the current profile; on while the profile has none
function features.State(feature)
    local db = addon.Options and addon.Options.db
    local value = db and Read(db.profile, feature.Switch)
    return value == false and "off" or "on"
end

local observe = {}

function observe.default(feature)
    local defaults = addon.Options and addon.Options.Defaults and addon.Options.Defaults.profile
    return Read(defaults, feature.Switch) == true and "default on" or "no default"
end

function observe.started(feature)
    local registry = addon.Features
    if type(registry) ~= "table" or type(registry.IsStarted) ~= "function" then
        return "no registry"
    end
    return registry.IsStarted(feature.Name) and "started" or "not started"
end

function observe.frame(feature, env)
    return env.Global(feature.Frame) ~= nil and "frame" or "none"
end

function observe.data(feature)
    local data = feature.Data()
    return type(data) == "table" and next(data) ~= nil and "data" or "none"
end

-- An owned entry of the feature's that holds the opener, and the slot's opener itself
function observe.opener(feature)
    local owns = false
    for _, entry in ipairs(addon.Slots.Owned(feature.Name)) do
        owns = owns or entry.Opener ~= nil
    end
    local set = addon.Slots.AchievementMenu.Opener ~= nil
    if owns ~= set then
        return "opener of another owner"
    end
    return set and "opener" or "no opener"
end

function observe.rowpart(feature)
    for _, entry in ipairs(addon.Slots.RowParts.Entries) do
        if entry.Owner == feature.Name then
            return "part"
        end
    end
    return "no part"
end

local function Owns(entries, feature)
    for _, entry in ipairs(entries or {}) do
        if entry.Owner == feature.Name then
            return true
        end
    end
    return false
end

-- Runs fn with the feature's Open recorded instead of opening a window, and the modifier the setting names held
-- (addon.IsCustomModifierKeyDown, the addon's own function; no game global is touched). Returns the achievement Open
-- got, or nil; and whether fn ran without an error. Only Pop Out names an Open (Known, Opens).
local function WithOpenRecorded(feature, fn)
    local target = feature.Opens()
    local isDown, open = addon.IsCustomModifierKeyDown, target.Open
    local setting = addon.Options.db.profile.Achievements.Modifiers.PopOut
    local opened
    addon.IsCustomModifierKeyDown = function(modifier) return modifier == setting end
    target.Open = function(_, achievement) opened = achievement end
    local ok = pcall(fn)
    addon.IsCustomModifierKeyDown, target.Open = isDown, open
    return opened, ok
end

-- Its entry in the slot, and pressing that entry's button opens the achievement (Features/PopOut/MenuEntry.lua): a
-- stand-in menu builder records the button the entry adds
function observe.menuentry(feature)
    local entry
    for _, candidate in ipairs(addon.Slots.AchievementMenu.Entries) do
        if candidate.Owner == feature.Name then
            entry = candidate
        end
    end
    if not entry then
        return "no entry"
    end
    if not feature.Opens then
        return "entry"
    end
    local achievement, button = {Id = -1}, nil
    local builder = {
        CreateButtonAndAdd = function(_, _, _, onClick) button = button or onClick end,
        Close = function() end
    }
    local opened, ok = WithOpenRecorded(feature, function()
        entry:Add({}, achievement, builder, nil)
        if button then button() end
    end)
    return ok and opened == achievement and "entry opens" or "entry does not open"
end

-- Its entry in the slot, and a modifier click on a row reaching the slot opens the row's achievement
-- (Slots.RowModifiers.Handle, which AchievementButtonMixin.lua's ProcessModifiers calls last)
function observe.modifier(feature)
    local slot = addon.Slots.RowModifiers
    if not slot then
        return "no slot"
    end
    if not Owns(slot.Entries, feature) then
        return "no modifier"
    end
    local row = {Achievement = {Id = -1}}
    local opened, ok = WithOpenRecorded(feature, function() slot.Handle(row) end)
    return ok and opened == row.Achievement and "modifier opens" or "modifier does not open"
end

-- Whether the registry ran the feature's AfterDataLoad; nil before the data load finished
function observe.afterload(feature)
    local registry = addon.Features
    if type(registry.RanAfterDataLoad) ~= "function" then
        return "no phase"
    end
    if not registry.DataHasLoaded() then
        return nil, "the data load has not finished"
    end
    return registry.RanAfterDataLoad(feature.Name) and "ran" or "not run"
end

function observe.made(feature)
    return feature.Made() and "made" or "none"
end

-- Whether the registry ran the feature's AfterAchievementUI; nil before Blizzard's achievement window loaded
function observe.afterui(feature)
    local registry = addon.Features
    if type(registry.RanAfterAchievementUI) ~= "function" then
        return "no phase"
    end
    if not registry.AchievementUIHasLoaded() then
        return nil, "the achievement window has not loaded"
    end
    return registry.RanAfterAchievementUI(feature.Name) and "ran" or "not run"
end

function observe.tab(feature)
    local slot = addon.Slots.DataManagerTabs
    if not slot then
        return "no slot"
    end
    return Owns(slot.Entries, feature) and "tab" or "no tab"
end

function observe.slots(feature)
    local slots = addon.Slots
    if type(slots) ~= "table" or type(slots.Owned) ~= "function" then
        return "no slots"
    end
    return #slots.Owned(feature.Name) > 0 and "owns entries" or "owns none"
end

-- Each of its help pages; all must agree, else the first page that differs is named
function observe.help(feature)
    local window = addon.Options.Window
    local title
    for _, registered in ipairs(addon.Features.List()) do
        if registered.Name == feature.Name then
            title = registered.Title
        end
    end
    local ids = type(feature.Help) == "table" and feature.Help or {feature.Help}
    local seen
    for index, id in ipairs(ids) do
        -- The first page is the section with the switch; a later one names that section (Features.lua WireHelp)
        local offLine = title and addon.L[index == 1 and "Feature Off Help" or "Feature Off Help Other Section"]:K_ReplaceVars({feature = title})
        local page = window and window.Help and window.Help[id]
        local got
        if not page then
            got = "no page"
        else
            local first = page.Blocks and page.Blocks[1]
            local hasOffLine = offLine ~= nil and first ~= nil and first.Text == offLine
            local hasShowMe = type(page.ShowMe) == "function"
            if hasShowMe and not hasOffLine then
                got = "show me"
            elseif hasOffLine and not hasShowMe then
                got = "off line"
            else
                got = hasShowMe and "show me and off line" or "neither"
            end
        end
        if seen and got ~= seen then
            return seen .. ", but " .. got .. " on " .. id
        end
        seen = got
    end
    return seen
end

-- env.LoadCalls: { {File, What} } for everything made while a file loaded; only files under Features/<Name>/ count
function observe.load(feature, env)
    if not env.LoadCalls then
        return nil, "headless only: the file load is watched headlessly"
    end
    local prefix = "Features/" .. feature.Name .. "/"
    local made = {}
    for _, call in ipairs(env.LoadCalls) do
        if call.File:sub(1, #prefix) == prefix then
            made[#made + 1] = call.File .. " " .. call.What
        end
    end
    if #made > 0 then
        return "made " .. table.concat(made, ", ")
    end
    return env.HasFeatureFiles and env.HasFeatureFiles(feature.Name) and "nothing made" or "no feature files"
end

-- One check of one feature in its state, as a result line
local function RunCheck(env, feature, scenario, state)
    local name = ("%s/%s-%s"):format(state, feature.Name, scenario.Check)
    local recorded, target = scenario.Recorded[state], scenario.Target[state]
    local ok, got, reason = pcall(observe[scenario.Check], feature, env)
    if not ok then
        got, reason = nil, "raised: " .. tostring(got)
    end
    local status, targetMet, tail
    if not got then
        status, tail = "SKIP", reason or "nothing observed"
    else
        status = got == recorded and "PASS" or "FAIL"
        targetMet = got == target
        tail = ("got=[%s] target=[%s] %s"):format(got, target, targetMet and "met" or "open")
    end
    return {
        Name = name,
        Status = status,
        TargetMet = targetMet,
        Line = ("features/%s: %s recorded=[%s] %s"):format(name, status, recorded, tail)
    }
end

-- env: Global(name) -> value; LoadCalls and HasFeatureFiles(name) headlessly; State(feature) overrides the profile's
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
function features.Run(env, observations)
    local results = {}
    for _, feature in ipairs(features.Known) do
        local state = env.State and env.State(feature) or features.State(feature)
        tinsert(observations, ("%s is %s"):format(feature.Name, state))
        for _, scenario in ipairs(features.Scenarios) do
            if not scenario.When or feature[scenario.When] then
                tinsert(results, RunCheck(env, feature, scenario, state))
            end
        end
    end
    return results
end

-- In game ------------------------------------------------------------------------------------------------------------

local gameEnv = {}

function gameEnv.Global(name)
    return _G[name]
end

addon.Tests.Ready.features = function()
    if not addon.Data.IsLoaded then -- the reward ids reach the feature during the data load
        return false, "the data load has not finished"
    end
    return true
end

addon.Tests.Suites.features = function()
    local observations = {}
    local results = features.Run(gameEnv, observations)
    collectgarbage("collect")
    UpdateAddOnMemoryUsage()
    tinsert(observations, ("memory after a full collect: %.0f KB"):format(GetAddOnMemoryUsage(addonName)))
    return results, observations
end