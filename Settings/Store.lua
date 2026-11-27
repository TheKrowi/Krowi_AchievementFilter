local _, addon = ...

-- The settings store (docs/work/2026-11-25-settings-store): every option, filter and search toggle, declared once
-- and read and written only through this interface. Kinds: a value (one scalar), a map (entries one or two levels
-- deep, each with its own registered default) and an object (a live table, saved as its difference from the default).
-- Scopes: the account, or the current profile of one of two profile systems, "options" and "filters".
-- Only what differs from a default is saved. Nothing here reads a saved variable until Load hands it the table.
addon.Settings = {}
local settings = addon.Settings

local sectionOf = { options = "Options", filters = "Filters" }

local declarations = {}   -- key -> declaration
local entryDefaults = {}  -- map key -> { [a] = value } or { [a] = { [b] = value } }
local listeners = {}      -- key -> list of functions
local profileListeners = { options = {}, filters = {} }

local root                -- the saved table once loaded
local characterKey        -- "<name> - <realm>"
local account             -- root.Account, or a throwaway table inside WithDefaults
local current = {}        -- system -> the current profile's saved table
local currentName = {}    -- system -> the current profile's name
local built = {}          -- saved table -> { [key] = live object }
local touched             -- while a failed migration waits for a retry: what the player set since (see Touch)
local snapshots = {}      -- while touched exists: saved table -> key -> { Mark, Copy } of each live object as built
local inDefaults, readCount = false, 0
local logoutFrame

local function Copy(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for k, v in next, value do copy[k] = Copy(v) end
    return copy
end

-- diff merged into target, in place
local function Merge(target, diff)
    for k, v in next, diff do
        if type(v) == "table" and type(target[k]) == "table" then
            Merge(target[k], v)
        else
            target[k] = Copy(v)
        end
    end
    return target
end

-- What object holds that default does not, or nil when nothing differs; a field equal to its default is left out
local function Diff(object, default)
    local out
    for k, v in next, object do
        local d
        if type(default) == "table" then d = default[k] end
        local delta
        if type(v) == "table" then
            delta = Diff(v, type(d) == "table" and d or nil)
        elseif v ~= d then
            delta = v
        end
        if delta ~= nil then
            out = out or {}
            out[k] = delta
        end
    end
    return out
end

local function Wipe(t)
    for k in next, t do t[k] = nil end
end

local function Same(a, b)
    if type(a) ~= "table" or type(b) ~= "table" then return a == b end
    for k, v in next, a do
        if not Same(v, b[k]) then return false end
    end
    for k in next, b do
        if a[k] == nil then return false end
    end
    return true
end

local function Declared(key, kind)
    local declaration = declarations[key]
    if not declaration then error("addon.Settings: undeclared key " .. tostring(key), 3) end
    if declaration.Kind ~= kind then
        error(("addon.Settings: %s is a %s, not a %s"):format(key, declaration.Kind, kind), 3)
    end
    return declaration
end

local function StoreOf(declaration)
    if declaration.Scope == "account" then return account end
    return current[declaration.System]
end

local function Writable(declaration, key)
    local store = StoreOf(declaration)
    if not store then error("addon.Settings: " .. key .. " written before the store loaded", 3) end
    return store
end

-- While a failed migration waits for its retry (requirement 15): marks what the player sets, by scope, so the retry
-- moves no old value over it. "account:<key>", "<system>:<profile>:<key>", "<system>:<profile>:*" for a whole
-- profile (copied, reset, deleted), "profileOf:<system>:<character>" for a profile choice.
local function Touch(mark)
    if touched and not inDefaults then touched[mark] = true end
end

local function TouchKey(declaration, key)
    if not touched or inDefaults then return end
    if declaration.Scope == "account" then
        Touch("account:" .. key)
    else
        Touch(declaration.System .. ":" .. tostring(currentName[declaration.System]) .. ":" .. key)
    end
end

local function Fire(key)
    if inDefaults then return end
    local list = listeners[key]
    if not list then return end
    for i = 1, #list do list[i](key) end
end

--[[ Declarations ]]

-- declaration: Kind ("value", "map" or "object"; default "value"), Type, Default, Min, Max, Step, Scope
-- ("profile" or "account"; default "profile"), System ("options" or "filters"; default "options"), Depth (a map's
-- levels, 1 or 2; default 1). Declaring a key again replaces its declaration; saved values are never touched by it.
function settings.Declare(key, declaration)
    declaration.Key = key
    declaration.Kind = declaration.Kind or "value"
    declaration.Scope = declaration.Scope or "profile"
    declaration.System = declaration.System or "options"
    assert(sectionOf[declaration.System], "addon.Settings: unknown profile system " .. tostring(declaration.System))
    if declaration.Kind == "map" then
        declaration.Depth = declaration.Depth or 1
        entryDefaults[key] = entryDefaults[key] or {}
    end
    declarations[key] = declaration
end

function settings.Declaration(key)
    return declarations[key]
end

-- An option row that reads and writes one setting (requirement 10): it gets and sets through the store. A row that does
-- more on a write keeps its own set; the row keeps the table shape the options window reads.
function settings.Row(key, row)
    if not declarations[key] then error("addon.Settings: a row for the undeclared key " .. tostring(key), 2) end
    row.get = row.get or function() return settings.Get(key) end
    row.set = row.set or function(_, value) settings.Set(key, value) end
    -- a slider's limits from the declaration (Min, Max, Step); a row with limits of its own keeps them
    local declaration = declarations[key]
    if row.min == nil then row.min = declaration.Min end
    if row.max == nil then row.max = declaration.Max end
    if row.step == nil then row.step = declaration.Step end
    return row
end

-- for key, declaration in Declared(): every declaration (read only)
function settings.Declared()
    return next, declarations, nil
end

function settings.IsLoaded()
    return root ~= nil
end

--[[ Values ]]

function settings.Get(key)
    local declaration = Declared(key, "value")
    if inDefaults then readCount = readCount + 1 end
    local store = StoreOf(declaration)
    if store then
        local value = store[key]
        if value ~= nil then return value end
    end
    return declaration.Default
end

-- A value equal to the default is not saved; nil resets
function settings.Set(key, value)
    local declaration = Declared(key, "value")
    local store = Writable(declaration, key)
    local old = store[key]
    if old == nil then old = declaration.Default end
    if value == nil or value == declaration.Default then
        store[key] = nil
        value = declaration.Default
    else
        store[key] = value
    end
    TouchKey(declaration, key)
    if old ~= value then Fire(key) end
end

function settings.Reset(key)
    settings.Set(key, nil)
end

--[[ Maps ]]

local function EntryOf(t, depth, a, b)
    if not t then return nil end
    local value = t[a]
    if depth == 2 and value ~= nil then
        if type(value) ~= "table" then return nil end
        value = value[b]
    end
    return value
end

local function EntryDefault(key, depth, a, b)
    return EntryOf(entryDefaults[key], depth, a, b)
end

-- The entry's registered default, or nil: EntryDefault(key, a) or EntryDefault(key, a, b)
function settings.EntryDefault(key, a, b)
    local declaration = Declared(key, "map")
    return EntryDefault(key, declaration.Depth, a, b)
end

-- GetEntry(key, a) or, for a map two levels deep, GetEntry(key, a, b): the saved entry, else its registered default,
-- else nil
function settings.GetEntry(key, a, b)
    local declaration = Declared(key, "map")
    if inDefaults then readCount = readCount + 1 end
    local store = StoreOf(declaration)
    local value = EntryOf(store and store[key], declaration.Depth, a, b)
    if value ~= nil then return value end
    return EntryDefault(key, declaration.Depth, a, b)
end

function settings.HasEntry(key, a, b)
    return settings.GetEntry(key, a, b) ~= nil
end

-- SetEntry(key, a, value) or SetEntry(key, a, b, value); an entry equal to its registered default is not saved, nil
-- removes the saved entry
function settings.SetEntry(key, a, b, value)
    local declaration = Declared(key, "map")
    local depth = declaration.Depth
    if depth == 1 then value, b = b, nil end
    local store = Writable(declaration, key)
    local old = settings.GetEntry(key, a, b)
    local saved = store[key]
    if value == nil or value == EntryDefault(key, depth, a, b) then
        if saved then
            if depth == 1 then
                saved[a] = nil
            elseif type(saved[a]) == "table" then
                saved[a][b] = nil
                if next(saved[a]) == nil then saved[a] = nil end
            end
            if next(saved) == nil then store[key] = nil end
        end
    else
        if not saved then
            saved = {}
            store[key] = saved
        end
        if depth == 1 then
            saved[a] = value
        else
            if type(saved[a]) ~= "table" then saved[a] = {} end
            saved[a][b] = value
        end
    end
    TouchKey(declaration, key)
    if old ~= settings.GetEntry(key, a, b) then Fire(key) end
end

-- RegisterEntryDefault(key, a, value) or RegisterEntryDefault(key, a, b, value)
function settings.RegisterEntryDefault(key, a, b, value)
    local declaration = Declared(key, "map")
    local defaults = entryDefaults[key]
    if declaration.Depth == 1 then
        defaults[a] = b
    else
        if type(defaults[a]) ~= "table" then defaults[a] = {} end
        defaults[a][b] = value
    end
end

-- Drops every entry under a (a map two levels deep: an addon's tabs), saved in the current profile and registered
function settings.RemoveEntries(key, a)
    local declaration = Declared(key, "map")
    local store = Writable(declaration, key)
    local saved = store[key]
    local had = (saved and saved[a] ~= nil) or entryDefaults[key][a] ~= nil
    if saved then
        saved[a] = nil
        if next(saved) == nil then store[key] = nil end
    end
    if not inDefaults then entryDefaults[key][a] = nil end -- inside WithDefaults the registered defaults stay
    TouchKey(declaration, key)
    if had then Fire(key) end
end

-- for a, value in Entries(key): every registered or saved entry of a map one level deep; for a map two levels deep,
-- Entries(key) gives each first key with true, Entries(key, a) each b under a with its value
function settings.Entries(key, a)
    local declaration = Declared(key, "map")
    if inDefaults then readCount = readCount + 1 end
    local store = StoreOf(declaration)
    local saved = store and store[key]
    local defaults = entryDefaults[key]
    local list = {}
    if declaration.Depth == 1 or a == nil then
        local whole = declaration.Depth == 2
        for k, v in next, defaults do list[k] = whole or v end
        if saved then
            for k, v in next, saved do list[k] = whole or v end
        end
    else
        if type(defaults[a]) == "table" then
            for k, v in next, defaults[a] do list[k] = v end
        end
        if saved and type(saved[a]) == "table" then
            for k, v in next, saved[a] do list[k] = v end
        end
    end
    return next, list, nil
end

--[[ Objects ]]

-- The live table: built the first time it is asked for in a profile, from a copy of the default and the saved
-- difference; it stays bound to that profile until the logout save writes it back
function settings.GetObject(key)
    local declaration = Declared(key, "object")
    if inDefaults then readCount = readCount + 1 end
    local store = StoreOf(declaration)
    if not store then error("addon.Settings: " .. key .. " asked for before the store loaded", 2) end
    local objects = built[store]
    if not objects then
        objects = {}
        built[store] = objects
    end
    local object = objects[key]
    if not object then
        object = Copy(declaration.Default or {})
        if type(store[key]) == "table" then Merge(object, store[key]) end
        objects[key] = object
        -- while a failed migration waits for its retry: a copy as built, so the logout save sees what the player
        -- changed inside the live table (the filter menu, the minimap icon's drag, the sort lists), which no Set sees
        if touched and not inDefaults then
            local mark = declaration.Scope == "account" and ("account:" .. key)
                or (declaration.System .. ":" .. tostring(currentName[declaration.System]) .. ":" .. key)
            snapshots[store] = snapshots[store] or {}
            snapshots[store][key] = { Mark = mark, Copy = Copy(object) }
        end
    end
    return object
end

-- Every built object of a saved table written into it as its difference from its default
local function Flush(store)
    local objects = built[store]
    if not objects then return end
    for key, object in next, objects do
        local declaration = declarations[key]
        store[key] = Diff(object, declaration and declaration.Default)
        local snapshot = snapshots[store] and snapshots[store][key]
        if snapshot and not Same(snapshot.Copy, object) then
            Touch(snapshot.Mark)
            snapshot.Copy = Copy(object)
        end
    end
end

--[[ Events ]]

function settings.OnChange(key, fn)
    local list = listeners[key]
    if not list then
        list = {}
        listeners[key] = list
    end
    list[#list + 1] = fn
end

function settings.OnProfileChanged(system, fn)
    local list = assert(profileListeners[system], "addon.Settings: unknown profile system " .. tostring(system))
    list[#list + 1] = fn
end

-- The keys of one profile system with listeners whose value may differ between two saved tables (only a key saved in
-- either can), with their value before the change; maps and objects are always fired
local function Before(system, from, to)
    local before = {}
    local function Add(t)
        for key in next, t do
            local declaration = declarations[key]
            if listeners[key] and declaration and declaration.Scope == "profile" and declaration.System == system
                and before[key] == nil then
                if declaration.Kind == "value" then
                    before[key] = { settings.Get(key) }
                else
                    before[key] = true
                end
            end
        end
    end
    Add(from)
    if to then Add(to) end
    for key, list in next, listeners do
        local declaration = declarations[key]
        if list and declaration and declaration.Kind ~= "value" and declaration.Scope == "profile"
            and declaration.System == system then
            before[key] = true
        end
    end
    return before
end

local function After(system, before)
    for key, old in next, before do
        if old == true or old[1] ~= settings.Get(key) then Fire(key) end
    end
    local list = profileListeners[system]
    for i = 1, #list do list[i](system, currentName[system]) end
end

--[[ Profiles ]]

local function Section(system)
    local section = sectionOf[system]
    if not section then error("addon.Settings: unknown profile system " .. tostring(system), 3) end
    if not root then error("addon.Settings: profiles asked for before the store loaded", 3) end
    return root[section]
end

-- The profile names of a system, sorted: every profile that exists, and the current one (as AceDB listed them)
function settings.Profiles(system)
    local data = Section(system)
    local seen, names = { [currentName[system]] = true }, {}
    for name in next, data.Profiles do seen[name] = true end
    for name in next, seen do names[#names + 1] = name end
    table.sort(names)
    return names
end

function settings.CurrentProfile(system)
    Section(system)
    return currentName[system]
end

-- Switches the character to the profile name, creating it when new
function settings.SetProfile(system, name)
    local data = Section(system)
    if name == currentName[system] then return end
    local to = data.Profiles[name] or {}
    local before = Before(system, current[system], to)
    data.Profiles[name] = to
    data.ProfileOf[characterKey] = name ~= "Default" and name or nil
    Touch("profileOf:" .. system .. ":" .. characterKey)
    current[system], currentName[system] = to, name
    After(system, before)
end

-- Copies the profile name into the current one
function settings.CopyProfile(system, name)
    local data = Section(system)
    if name == currentName[system] then error("addon.Settings: cannot copy a profile into itself", 2) end
    local from = data.Profiles[name]
    if not from then error("addon.Settings: no profile " .. tostring(name), 2) end
    Flush(from)
    local store = current[system]
    local before = Before(system, store, from)
    built[store] = nil
    Wipe(store)
    Merge(store, from)
    Touch(system .. ":" .. tostring(currentName[system]) .. ":*")
    After(system, before)
end

-- Deletes the profile name; silent: no error when there is none. Characters on it go back to Default.
function settings.DeleteProfile(system, name, silent)
    local data = Section(system)
    if name == currentName[system] then error("addon.Settings: cannot delete the active profile", 2) end
    local store = data.Profiles[name]
    if not store then
        if silent then return end
        error("addon.Settings: no profile " .. tostring(name), 2)
    end
    built[store] = nil
    data.Profiles[name] = nil
    Touch(system .. ":" .. tostring(name) .. ":*")
    for character, profile in next, data.ProfileOf do
        if profile == name then
            data.ProfileOf[character] = nil
            Touch("profileOf:" .. system .. ":" .. character)
        end
    end
end

-- Empties the current profile: every setting in it back to its default
function settings.ResetProfile(system)
    Section(system)
    local store = current[system]
    local before = Before(system, store)
    built[store] = nil
    Wipe(store)
    Touch(system .. ":" .. tostring(currentName[system]) .. ":*")
    After(system, before)
end

--[[ Defaults ]]

-- Runs fn(...) with every setting at its default: reads give defaults (and what fn itself wrote meanwhile), objects
-- are throwaway copies of their defaults, writes go to a throwaway layer, no change event fires. Returns whether fn
-- read any setting, then fn's first two results. An error in fn is raised again once the real settings are back.
function settings.WithDefaults(fn, ...)
    if inDefaults then error("addon.Settings: WithDefaults inside WithDefaults", 2) end
    local realAccount, realOptions, realFilters, realBuilt = account, current.options, current.filters, built
    account, current.options, current.filters, built = {}, {}, {}, {}
    inDefaults, readCount = true, 0
    local ok, a, b = pcall(fn, ...)
    account, current.options, current.filters, built = realAccount, realOptions, realFilters, realBuilt
    inDefaults = false
    if not ok then error(a, 0) end
    return readCount > 0, a, b
end

--[[ Load and save ]]

-- Writes every built object back into its profile; the logout save. The objects stay live, so a later save writes
-- them again.
function settings.Save()
    if not root then return end
    for store in next, built do Flush(store) end
end

-- saved: the store's saved table (KrowiAF_Settings, after the migrations); character: "<name> - <realm>", by default
-- the logged-in character's
function settings.Load(saved, character)
    root = saved
    characterKey = character or (UnitName("player") .. " - " .. GetRealmName())
    root.Account = root.Account or {}
    account = root.Account
    for system, section in next, sectionOf do
        local data = root[section] or {}
        root[section] = data
        data.Profiles = data.Profiles or {}
        data.ProfileOf = data.ProfileOf or {}
        local name = data.ProfileOf[characterKey] or "Default"
        data.Profiles[name] = data.Profiles[name] or {}
        current[system], currentName[system] = data.Profiles[name], name
    end
    built, snapshots = {}, {}
    touched = type(root.MigrationFailed) == "table" and root.MigrationFailed.Touched or nil
    if not logoutFrame and CreateFrame then
        logoutFrame = CreateFrame("Frame")
        logoutFrame:RegisterEvent("PLAYER_LOGOUT")
        logoutFrame:SetScript("OnEvent", settings.Save)
    end
end