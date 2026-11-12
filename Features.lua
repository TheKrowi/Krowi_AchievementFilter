local _, addon = ...
addon.Features = {}
local features = addon.Features

-- The feature registry (docs/work/2026-11-08-feature-split-poc). Each feature lives in Features/<Name>/ and registers
-- while its files load; loading them makes nothing (no frame, hook, script, event, timer or slash command). At
-- ADDON_LOADED, right after the options' AceDB is made, StartAll starts every feature whose switch is on in the current
-- profile; one that is off never starts that session, and turning a switch on or off takes effect after a reload.
-- - Register{Name, Title, Switch, Start, OnNotStarted}: Switch is the saved path in the profile ("Features.<Name>", or a
--   setting the feature had before it was one), on by default; Start makes the feature's frames and adds its entries to
--   the core's slots (Slots.lua); OnNotStarted lets a feature that stays off drop what its public API queued while the
--   files loaded; AfterDataLoad runs once the login data load filled addon.Data.Achievements, only for a started feature
--   (DataLoaded); AfterAchievementUI runs once Blizzard's achievement window has loaded, only for a started feature
--   (AchievementUILoaded, docs/work/2026-11-12-event-reminders).
-- - AddOptions(name, {Rows, Defaults, Section, Sections, Beside, Into, Late}): its settings, whether it is on or off.
--   AddOptions only records them; BuildOptions builds every feature's at ADDON_LOADED, after every file loaded (the data
--   files included) and before the options load, in registration order: Defaults into the profile defaults, Rows() and
--   Beside() into the feature's group, then Late() (rows made from data that loads after the feature's files, put into
--   those defaults and that group), then Into() and the sections. The registry puts
--   the switch on top and the rows in a group greyed out while the switch is off, under the Features page of the options
--   table (Path(name) .. ".args.Settings"). Beside() returns rows put next to the switch, outside that group, which
--   never grey: the way to the switch stays open. Section (Id, Name, Card, NavGroup, Order, the card fields of
--   Options/Window/Map.lua, Header and Pairs, the section group's pairs) is one section of the options window drawing
--   the switch and the group; Sections() instead returns the window's sections as Options/Window/Map.lua writes them
--   (Groups with Path, Group, Families, Grid and the rest, full paths built on Path(name)), each with NavGroup and Order,
--   and the switch goes on top of the first one's first group. Into() returns { {Path, Key, Order, Row, FollowsSwitch,
--   With} }: rows the feature puts into a group of the core (Path, the group's path in the options table) at Key and
--   Order (after the group's rows when left out); with FollowsSwitch the row greys out while the switch is off;
--   With = {Key, Row}, a button drawn after the row, which does not follow the switch (docs/work/2026-11-09-pop-out).
-- - AddHelp(name, {Id, Title, Blocks, Scene}): a help page, whether it is on or off, one call per page; Scene is its
--   Show me, wired only while it is started. A feature that is off gets a line on top of each page saying so, and no
--   Show me.
-- - AddDataFields(name, {field = handler}): the achievement data fields it takes (Slots.lua, AchievementData), added
--   when it starts.
-- The core never names a feature (the feature-boundary lint rule).

local records, order = {}, {}
local started = {}
local hasStarted = false

local function Get(name)
    local record = records[name]
    if not record then
        record = {Name = name}
        records[name] = record
    end
    return record
end

local function Split(path)
    local parts = {}
    for part in path:gmatch("[^%.]+") do
        parts[#parts + 1] = part
    end
    return parts
end

local function Read(tbl, path)
    for _, key in ipairs(Split(path)) do
        if type(tbl) ~= "table" then
            return nil
        end
        tbl = tbl[key]
    end
    return tbl
end

local function Write(tbl, path, value)
    local parts = Split(path)
    for i = 1, #parts - 1 do
        tbl[parts[i]] = tbl[parts[i]] or {}
        tbl = tbl[parts[i]]
    end
    tbl[parts[#parts]] = value
end

local function Merge(into, from)
    for key, value in next, from do
        if type(value) == "table" and type(into[key]) == "table" then
            Merge(into[key], value)
        else
            into[key] = value
        end
    end
end

-- The switch as saved in the current profile; on before the options load
local function IsOn(record)
    local db = addon.Options.db
    return not db or Read(db.profile, record.Switch) ~= false
end

function features.Register(def)
    assert(type(def.Name) == "string" and type(def.Switch) == "string", "a feature registers with a Name and a Switch")
    local record = Get(def.Name)
    assert(not record.Registered, "feature " .. def.Name .. " is already registered")
    for key, value in next, def do
        record[key] = value
    end
    record.Registered = true
    tinsert(order, record)
    Write(addon.Options.Defaults.profile, record.Switch, true)
    return record
end

-- The options page every feature's settings hang under; the options window maps them by path (Options/Window/Map.lua)
local options = addon.Options
options.OptionsTable.args.Features = {type = "group", name = "Features", args = {}}
tinsert(options.OptionsTables, {
    RegisterOptionsTable = function()
        LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.Metadata.Prefix .. "_Features", options.OptionsTable.args.Features)
    end
})

-- Puts a section into its navigation group at its Order (Options/Window/Map.lua: each group's Orders); the options
-- window reads the groups when it draws, which comes after every file loaded
local function AddSection(section)
    local map = addon.Options.Window.Map
    tinsert(map.Sections, section)
    for _, group in ipairs(map.Groups) do
        if group.Key == section.NavGroup then
            local at = #group.Sections + 1
            for i, id in ipairs(group.Sections) do
                if (group.Orders[id] or math.huge) > section.Order then
                    at = i
                    break
                end
            end
            tinsert(group.Sections, at, section.Id)
            group.Orders[section.Id] = section.Order
            return
        end
    end
    error("feature section " .. tostring(section.Id) .. " names no navigation group " .. tostring(section.NavGroup))
end

-- The path of a feature's group in the options table; its settings are under Path(name) .. ".args.Settings"
function features.Path(name)
    return "Features.args." .. name
end

local optionsOrder, optionsBuilt = {}, false

function features.AddOptions(name, def)
    local record = Get(name)
    assert(record.Registered, "feature " .. name .. " registers before it adds its options")
    assert(not record.Options, "feature " .. name .. " adds its options once")
    assert(not optionsBuilt, "feature " .. name .. " adds its options after the options were built")
    record.Options = def
    tinsert(optionsOrder, record)
end

local function BuildFeatureOptions(record)
    local name, def = record.Name, record.Options
    if def.Defaults then
        Merge(addon.Options.Defaults.profile, def.Defaults)
    end
    local path = features.Path(name)
    local args = {
        Enabled = {
            order = 1, type = "toggle", width = "full",
            name = addon.L["Enable"],
            desc = addon.L["Feature Switch Desc"]:K_ReplaceVars({feature = record.Title}):KAF_AddDefaultValueText(record.Switch):K_AddReloadRequired(),
            get = function() return IsOn(record) end,
            set = function(_, value) Write(addon.Options.db.profile, record.Switch, value) end
        },
        Settings = {
            order = 2, type = "group", inline = true, name = "",
            disabled = function() return not IsOn(record) end,
            args = def.Rows and def.Rows() or {}
        }
    }
    for key, row in next, def.Beside and def.Beside() or {} do
        assert(not args[key], "feature " .. name .. " puts a row beside its switch at " .. key .. ", which is taken")
        args[key] = row
    end
    options.OptionsTable.args.Features.args[name] = {type = "group", name = record.Title, args = args}
    -- Rows made from data, put into the defaults and the group built above (Event reminders' per-event toggles)
    if def.Late then
        def.Late()
    end
    for _, into in ipairs(def.Into and def.Into() or {}) do
        local group = Read(options.OptionsTable.args, into.Path) -- the paths of Options/Window/Map.lua
        assert(type(group) == "table" and type(group.args) == "table", "feature " .. name .. " puts a row into " .. tostring(into.Path) .. ", which is no group")
        local row = into.Row
        -- Without an Order, after the group's last row: the core numbers its rows from one counter it shares with every
        -- options file, so no fixed number is sure to come after them
        if not into.Order then
            local last = 0
            for _, existing in next, group.args do
                if type(existing.order) == "number" and existing.order > last then last = existing.order end
            end
            into.Order = last + 1
        end
        row.order = into.Order
        if into.FollowsSwitch then
            row.disabled = function() return not IsOn(record) end
        end
        group.args[into.Key] = row
        -- A button drawn after the row (Krowi_Options 2.1: a dropdown's button): put in the group too, and paired with the
        -- row on the window's map entry that draws the group
        if into.With then
            into.With.Row.order = into.Order + 0.5
            group.args[into.With.Key] = into.With.Row
            local paired = false
            for _, mapSection in ipairs(addon.Options.Window.Map.Sections) do
                for _, mapGroup in ipairs(mapSection.Groups or {}) do
                    for _, entry in ipairs(mapGroup.Entries or {}) do
                        if entry.Group == into.Path then
                            entry.Pairs = entry.Pairs or {}
                            entry.Pairs[into.Key] = into.With.Key
                            paired = true
                        end
                    end
                end
            end
            assert(paired, "feature " .. name .. " pairs a button in " .. into.Path .. ", which no section of the window draws")
        end
    end
    if def.Sections then
        local sections = def.Sections()
        local first = sections[1] and sections[1].Groups and sections[1].Groups[1]
        assert(first and first.Entries, "feature " .. name .. "'s first section starts with a group of entries, where its switch goes")
        tinsert(first.Entries, 1, {Path = path .. ".args.Enabled"})
        for _, section in ipairs(sections) do
            AddSection(section)
        end
        return
    end
    local section = def.Section
    section.Groups = {
        {Header = section.Header or record.Title, Entries = {
            {Path = path .. ".args.Enabled"},
            {Group = path .. ".args.Settings", Pairs = section.Pairs}
        }}
    }
    section.Header, section.Pairs = nil, nil
    AddSection(section)
end

-- Once, at ADDON_LOADED before addon.Options:Load (Krowi_AchievementFilter.lua): every feature's settings, built after
-- every file loaded; one whose build errors does not stop the others
function features.BuildOptions()
    if optionsBuilt then
        return
    end
    optionsBuilt = true
    for _, record in ipairs(optionsOrder) do
        xpcall(function() BuildFeatureOptions(record) end, CallErrorHandler) -- Lua 5.1's xpcall passes no arguments
    end
end

function features.AddHelp(name, def)
    local record = Get(name)
    record.Help = record.Help or {}
    for _, page in ipairs(record.Help) do
        assert(page.Id ~= def.Id, "feature " .. name .. " adds help page " .. def.Id .. " twice")
    end
    tinsert(record.Help, def)
    addon.Options.Window.Help[def.Id] = {Title = def.Title, Blocks = def.Blocks}
end

function features.AddDataFields(name, fields)
    Get(name).DataFields = fields
end

-- Show me for a started feature, wired as Options/Window/Help/ShowMe.lua wires the core's; the off line for one that
-- stays off; on each of its pages
local function WireHelp(record)
    local window = addon.Options.Window
    for index, def in ipairs(record.Help or {}) do
        local help = window.Help[def.Id]
        if started[record.Name] then
            if def.Scene then
                window.HelpScenes[def.Id] = def.Scene
                local canShow = window.ShowMeKit.CanShow
                help.CanShowMe = canShow
                help.ShowMe = function()
                    if not canShow() then
                        return false
                    end
                    return def.Scene()
                end
            end
        else
            -- The first page is the section with the switch on top; a later one points at that section by its name
            local off = index == 1 and addon.L["Feature Off Help"] or addon.L["Feature Off Help Other Section"]
            tinsert(help.Blocks, 1, window.HelpBlocks.Text(off:K_ReplaceVars({feature = record.Title})))
        end
    end
end

-- Once, at ADDON_LOADED after addon.Options:Load (Krowi_AchievementFilter.lua): before the achievement window can build
-- its rows and before the data load at PLAYER_LOGIN hands out the achievement data fields
function features.StartAll()
    if hasStarted then
        return
    end
    hasStarted = true
    for name, record in next, records do
        if not record.Registered then
            CallErrorHandler("feature " .. name .. " adds parts but never registers")
        end
    end
    for _, record in ipairs(order) do
        if IsOn(record) then
            features.Starting = record.Name
            local ok = true
            if record.Start then
                ok = xpcall(record.Start, CallErrorHandler)
            end
            -- Only for a feature that started: one whose Start failed takes no data either
            if ok then
                for field, handler in next, record.DataFields or {} do
                    addon.Slots.AchievementData.AddField(field, handler)
                end
            end
            features.Starting = nil
            started[record.Name] = ok
        elseif record.OnNotStarted then
            xpcall(record.OnNotStarted, CallErrorHandler)
        end
        WireHelp(record)
    end
end

function features.IsStarted(name)
    return started[name] == true
end

-- Once, at the end of the login data load (Data/Data.lua, LoadOnPlayerLogin), when addon.Data.Achievements is filled and
-- before the cache build: each started feature's AfterDataLoad, in registration order; one that errors does not stop
-- the others
local dataLoaded, ranAfterDataLoad = false, {}

function features.DataLoaded()
    if dataLoaded then
        return
    end
    dataLoaded = true
    for _, record in ipairs(order) do
        if started[record.Name] and record.AfterDataLoad then
            ranAfterDataLoad[record.Name] = xpcall(record.AfterDataLoad, CallErrorHandler)
        end
    end
end

function features.DataHasLoaded()
    return dataLoaded
end

-- Whether a feature's AfterDataLoad ran without an error; for the features suite
function features.RanAfterDataLoad(name)
    return ranAfterDataLoad[name] == true
end

-- Once, when Blizzard's achievement window has loaded (Krowi_AchievementFilter.lua, LoadBlizzard_AchievementUI, which runs
-- once whether the window loads before or after PLAYER_LOGIN): each started feature's AfterAchievementUI, in
-- registration order; one that errors does not stop the others
local achievementUILoaded, ranAfterAchievementUI = false, {}

function features.AchievementUILoaded()
    if achievementUILoaded then
        return
    end
    achievementUILoaded = true
    for _, record in ipairs(order) do
        if started[record.Name] and record.AfterAchievementUI then
            ranAfterAchievementUI[record.Name] = xpcall(record.AfterAchievementUI, CallErrorHandler)
        end
    end
end

function features.AchievementUIHasLoaded()
    return achievementUILoaded
end

-- Whether a feature's AfterAchievementUI ran without an error; for the features suite
function features.RanAfterAchievementUI(name)
    return ranAfterAchievementUI[name] == true
end

-- Whether StartAll ran: a feature's public API holds what it gets until then
function features.HasStarted()
    return hasStarted
end

-- The registered features in registration order: Name, Title, Switch, HelpIds (the section ids of its help pages)
function features.List()
    local list = {}
    for _, record in ipairs(order) do
        local helpIds = {}
        for _, page in ipairs(record.Help or {}) do
            helpIds[#helpIds + 1] = page.Id
        end
        list[#list + 1] = {Name = record.Name, Title = record.Title, Switch = record.Switch, HelpIds = helpIds}
    end
    return list
end

-- The switch as saved in the current profile, and setting it (takes effect after a reload); for /kaftest matrix
function features.GetSwitch(name)
    return IsOn(Get(name))
end

function features.SetSwitch(name, value)
    Write(addon.Options.db.profile, Get(name).Switch, value and true or false)
end