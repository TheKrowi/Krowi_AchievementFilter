local _, addon = ...
addon.Features = {}
local features = addon.Features

-- The feature registry (docs/work/2026-11-08-feature-split-poc). Each feature lives in Features/<Name>/ and registers
-- while its files load; loading them makes nothing (no frame, hook, script, event, timer or slash command). At
-- ADDON_LOADED, right after the options' AceDB is made, StartAll starts every feature whose switch is on in the current
-- profile; one that is off never starts that session, and turning a switch on or off takes effect after a reload.
-- - Register{Name, Title, Switch, Start, OnNotStarted}: Switch is the saved path in the profile ("Features.<Name>"),
--   on by default; Start makes the feature's frames and adds its entries to the core's slots (Slots.lua);
--   OnNotStarted lets a feature that stays off drop what its public API queued while the files loaded.
-- - AddOptions(name, {Rows, Defaults, Section}): its settings, whether it is on or off. Rows() returns the AceConfig
--   rows, built after Defaults went into the profile defaults. The registry puts the switch on top and the rows in a
--   group greyed out while the switch is off, under the Features page of the options table, and adds Section (Id, Name,
--   Card, NavGroup, Order and the card fields of Options/Window/Map.lua) to the options window.
-- - AddHelp(name, {Id, Title, Blocks, Scene}): its help page, whether it is on or off; Scene is its Show me, wired only
--   while it is started. A feature that is off gets a line on top saying so, and no Show me.
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

function features.AddOptions(name, def)
    local record = Get(name)
    assert(record.Registered, "feature " .. name .. " registers before it adds its options")
    if def.Defaults then
        Merge(addon.Options.Defaults.profile, def.Defaults)
    end
    local path = "Features.args." .. name
    options.OptionsTable.args.Features.args[name] = {
        type = "group", name = record.Title,
        args = {
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
    }
    local section = def.Section
    section.Groups = {
        {Header = section.Header or record.Title, Entries = {
            {Path = path .. ".args.Enabled"},
            {Group = path .. ".args.Settings"}
        }}
    }
    section.Header = nil
    AddSection(section)
end

function features.AddHelp(name, def)
    local record = Get(name)
    record.Help = def
    addon.Options.Window.Help[def.Id] = {Title = def.Title, Blocks = def.Blocks}
end

function features.AddDataFields(name, fields)
    Get(name).DataFields = fields
end

-- Show me for a started feature, wired as Options/Window/Help/ShowMe.lua wires the core's; the off line for one that
-- stays off
local function WireHelp(record)
    local def = record.Help
    if not def then
        return
    end
    local window = addon.Options.Window
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
        tinsert(help.Blocks, 1, window.HelpBlocks.Text(addon.L["Feature Off Help"]:K_ReplaceVars({feature = record.Title})))
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
            for field, handler in next, record.DataFields or {} do
                addon.Slots.AchievementData.AddField(field, handler)
            end
            local ok = true
            if record.Start then
                ok = xpcall(record.Start, CallErrorHandler)
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

-- Whether StartAll ran: a feature's public API holds what it gets until then
function features.HasStarted()
    return hasStarted
end

-- The registered features in registration order: Name, Title, Switch, HelpId (the section id of its help page)
function features.List()
    local list = {}
    for _, record in ipairs(order) do
        list[#list + 1] = {Name = record.Name, Title = record.Title, Switch = record.Switch, HelpId = record.Help and record.Help.Id}
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