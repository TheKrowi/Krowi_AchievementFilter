local _, addon = ...

-- The settings store's interface over AceDB's three databases, for the build order of docs/work/2026-11-25-settings-store
-- (plan steps 6-8): while the option rows and the readers move to the interface, AceDB stays the truth, so the saved-
-- settings proof keeps checking that every key leads back to the path its row wrote. Each key reads and writes its old
-- path, found through the shipped rename table. Goes, with AceDB, at the switch (plan step 9); Settings/Store.lua is
-- left exactly as the store suite proves it, and only this file replaces its functions.
--   - A write of the default writes the value, never nil: AceDB's active profile holds its copied defaults, which the
--     readers not moved yet read raw.
--   - A read allocates nothing: each key's path is split once, at its first use.
--   - The profile events stay AceDB's until the switch; OnProfileChanged is not served here.
local settings = addon.Settings
local renames = settings.Renames

local pathOf, mapOf, objectOf -- key -> the old path's segments, the map's spec, the object's spec
local function Build()
    pathOf, mapOf, objectOf = {}, {}, {}
    for path, key in next, renames.Values do
        local segments = {}
        for segment in path:gmatch("[^%.]+") do segments[#segments + 1] = segment end
        pathOf[key] = segments
    end
    for _, map in ipairs(renames.Maps) do mapOf[map.Key] = map end
    for _, object in ipairs(renames.Objects) do objectOf[object.Key] = object end
end

local listeners = {}
local inDefaults, readCount = false, 0

local function Declared(key, kind)
    local declaration = settings.Declaration(key)
    if not declaration then error("addon.Settings: undeclared key " .. tostring(key), 3) end
    if declaration.Kind ~= kind then
        error(("addon.Settings: %s is a %s, not a %s"):format(key, declaration.Kind, kind), 3)
    end
    if not pathOf then Build() end
    return declaration
end

-- The options profile (nil before the options load); read each time, since the options window's default per option
-- swaps it for a copy of the defaults (Options/Window/Source.lua, ComputeDefault)
local function Profile()
    local db = addon.Options.db
    return db and db.profile
end

local function Walk(t, segments, last)
    for n = 1, last do
        if type(t) ~= "table" then return nil end
        t = t[segments[n]]
    end
    return t
end

-- The table at segments[1 .. last] under t, made where missing
local function Make(t, segments, last)
    for n = 1, last do
        local key = segments[n]
        if type(t[key]) ~= "table" then t[key] = {} end
        t = t[key]
    end
    return t
end

local function Writable(key)
    local profile = Profile()
    if not profile then error("addon.Settings: " .. key .. " written before the store loaded", 3) end
    return profile
end

local function Fire(key)
    if inDefaults then return end
    local list = listeners[key]
    if not list then return end
    for n = 1, #list do list[n](key) end
end

function settings.IsLoaded()
    return addon.Options.db ~= nil
end

--[[ Values ]]

function settings.Get(key)
    local declaration = Declared(key, "value")
    if inDefaults then readCount = readCount + 1 end
    local segments = pathOf[key]
    local value = Walk(Profile(), segments, #segments)
    if value == nil then return declaration.Default end
    return value
end

function settings.Set(key, value)
    local declaration = Declared(key, "value")
    local segments = pathOf[key]
    local parent = Make(Writable(key), segments, #segments - 1)
    if value == nil then value = declaration.Default end
    local old = parent[segments[#segments]]
    parent[segments[#segments]] = value
    if old ~= value then Fire(key) end
end

function settings.Reset(key)
    settings.Set(key, nil)
end

--[[ Maps ]]

-- The entry's value in the map's old table (a Leaf map: the field of the entry's table)
local function Entry(map, t, a, b)
    if type(t) ~= "table" then return nil end
    local value = t[a]
    if map.Depth == 2 then
        if type(value) ~= "table" then return nil end
        value = value[b]
    end
    if map.Leaf then
        if type(value) ~= "table" then return nil end
        value = value[map.Leaf]
    end
    return value
end

function settings.GetEntry(key, a, b)
    Declared(key, "map")
    if inDefaults then readCount = readCount + 1 end
    local map = mapOf[key]
    return Entry(map, Walk(Profile(), map.Path, #map.Path), a, b)
end

function settings.HasEntry(key, a, b)
    return settings.GetEntry(key, a, b) ~= nil
end

function settings.SetEntry(key, a, b, value)
    local declaration = Declared(key, "map")
    if declaration.Depth == 1 then value, b = b, nil end
    local map = mapOf[key]
    local t = Make(Writable(key), map.Path, #map.Path)
    local old = Entry(map, t, a, b)
    local field, parent = a, t
    if map.Depth == 2 then
        if type(parent[a]) ~= "table" then parent[a] = {} end
        parent, field = parent[a], b
    end
    if map.Leaf then
        if type(parent[field]) ~= "table" then parent[field] = {} end
        parent, field = parent[field], map.Leaf
    end
    parent[field] = value
    if old ~= value then Fire(key) end
end

-- Drops everything under a in the map's old table: for the tabs, an addon's Show and Order together, as before
function settings.RemoveEntries(key, a)
    Declared(key, "map")
    local map = mapOf[key]
    local t = Walk(Writable(key), map.Path, #map.Path)
    if type(t) == "table" and t[a] ~= nil then
        t[a] = nil
        Fire(key)
    end
end

function settings.Entries(key, a)
    local declaration = Declared(key, "map")
    if inDefaults then readCount = readCount + 1 end
    local map = mapOf[key]
    local t = Walk(Profile(), map.Path, #map.Path)
    local list = {}
    if type(t) == "table" then
        if declaration.Depth == 2 and a == nil then
            for k in next, t do list[k] = true end
        else
            local entries = declaration.Depth == 2 and t[a] or t
            for k, v in next, type(entries) == "table" and entries or {} do
                if map.Leaf then
                    if type(v) == "table" then v = v[map.Leaf] else v = nil end
                end
                list[k] = v
            end
        end
    end
    return next, list, nil
end

--[[ Objects ]]

-- The live table AceDB keeps: a subtable of the options profile, or the filters' and search options' profile
function settings.GetObject(key)
    Declared(key, "object")
    if inDefaults then readCount = readCount + 1 end
    if key == "filters" then return addon.Filters.db.profile end
    if key == "search" then return addon.SearchOptions.db.profile end
    local object = objectOf[key]
    return Walk(Profile(), object.Path, #object.Path)
end

--[[ Events ]]

function settings.OnChange(key, fn)
    listeners[key] = listeners[key] or {}
    table.insert(listeners[key], fn)
end

function settings.OnProfileChanged()
    error("addon.Settings: profile events stay AceDB's until the switch (docs/work/2026-11-25-settings-store, plan step 9)", 2)
end

--[[ Profiles ]]

local function Db(system)
    local db = (system == "options" and addon.Options.db) or (system == "filters" and addon.Filters.db) or nil
    if not db then error("addon.Settings: no " .. tostring(system) .. " profiles yet", 3) end
    return db
end

function settings.Profiles(system)
    local names = {}
    Db(system):GetProfiles(names)
    table.sort(names)
    return names
end

function settings.CurrentProfile(system)
    return Db(system):GetCurrentProfile()
end

function settings.SetProfile(system, name)
    Db(system):SetProfile(name)
end

function settings.CopyProfile(system, name)
    Db(system):CopyProfile(name)
end

function settings.DeleteProfile(system, name, silent)
    Db(system):DeleteProfile(name, silent)
end

function settings.ResetProfile(system)
    Db(system):ResetProfile()
end

--[[ Defaults ]]

local function DeepCopy(t)
    local copy = {}
    for k, v in next, t do copy[k] = type(v) == "table" and DeepCopy(v) or v end
    return copy
end

-- fn(...) against a copy of the options defaults, as the options window's default per option does today
function settings.WithDefaults(fn, ...)
    if inDefaults then error("addon.Settings: WithDefaults inside WithDefaults", 2) end
    local db = addon.Options.db
    local real = db and rawget(db, "profile")
    if db then rawset(db, "profile", DeepCopy(addon.Options.Defaults.profile)) end
    inDefaults, readCount = true, 0
    local ok, a, b = pcall(fn, ...)
    if db then rawset(db, "profile", real) end
    inDefaults = false
    if not ok then error(a, 0) end
    return readCount > 0, a, b
end

--[[ Load and save: AceDB's own ]]

function settings.Load() end
function settings.Save() end