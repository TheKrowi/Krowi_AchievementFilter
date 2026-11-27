local _, addon = ...

-- Migration 1's check, and the walk it shares with the migration (docs/work/2026-11-25-settings-store, requirements
-- 12 and 13). Every old value is a record: an options profile's value, a filter profile's value, a search toggle (once
-- per filter profile) or a character's profile choice. Target says where a record lives in the new store, Move puts
-- it there and Matches reads it back, all on raw tables by key, never through Get or Set.
addon.Settings.Check = {}
local check = addon.Settings.Check
local renames = addon.Settings.Renames

local function Under(segments, prefix)
    for n, name in ipairs(prefix) do
        if segments[n] ~= name then return false end
    end
    return true
end

local function Join(segments)
    local parts = {}
    for n, segment in ipairs(segments) do parts[n] = tostring(segment) end
    return table.concat(parts, ".")
end
check.Join = Join

-- An old options path's home in the rename table: "value", "map" or "object", the new key, the keys under the map's
-- or object's path, and whether the key is of account scope; nil when the path has no row
function check.Home(segments)
    local key = renames.Values[Join(segments)]
    if key then return "value", key, nil, renames.Account[key] == true end
    for _, object in ipairs(renames.Objects) do
        if #segments > #object.Path and Under(segments, object.Path) then
            return "object", object.Key, { unpack(segments, #object.Path + 1) }, false
        end
    end
    for _, map in ipairs(renames.Maps) do
        local want = #map.Path + map.Depth + (map.Leaf and 1 or 0)
        if #segments == want and Under(segments, map.Path) and (not map.Leaf or segments[want] == map.Leaf) then
            return "map", map.Key, { unpack(segments, #map.Path + 1, #map.Path + map.Depth) }, false
        end
    end
end

-- fn(segments, value) for every leaf (a value that is not a table) under t, the keys with their own types
local function Leaves(t, fn, prefix)
    for key, value in next, t do
        local segments = { unpack(prefix) }
        segments[#segments + 1] = key
        if type(value) == "table" then
            Leaves(value, fn, segments)
        else
            fn(segments, value)
        end
    end
end

function check.Read(t, keys)
    for _, key in ipairs(keys) do
        if type(t) ~= "table" then return nil end
        t = t[key]
    end
    return t
end

function check.Write(t, keys, value)
    for n = 1, #keys - 1 do
        local key = keys[n]
        if type(t[key]) ~= "table" then t[key] = {} end
        t = t[key]
    end
    t[keys[#keys]] = value
end

local function Append(keys, rest)
    for _, key in ipairs(rest) do keys[#keys + 1] = key end
    return keys
end

-- The old tables as the migration reads them. sv: the saved variables (Options, Filters, SearchOptions, SavedData);
-- options: a copy of the options profiles, the Legion Assaults merge applied when it is due (the migration's step 1)
function check.Old(sv, options, context)
    local function Field(t, key)
        local value = type(t) == "table" and t[key] or nil
        return type(value) == "table" and value or {}
    end
    local old = {
        OptionsProfiles = options,
        OptionsProfileKeys = Field(sv.Options, "profileKeys"),
        FiltersProfiles = Field(sv.Filters, "profiles"),
        FiltersProfileKeys = Field(sv.Filters, "profileKeys"),
        Search = Field(Field(sv.SearchOptions, "profiles"), "Default"), -- it has no profile UI: always its Default
    }
    old.CharacterProfile = old.OptionsProfileKeys[context.Character] or "Default"
    -- the filter profiles the search toggles go into: every old one, or Default when there is none and there are toggles
    local names = {}
    for name, profile in next, old.FiltersProfiles do
        if type(profile) == "table" then names[#names + 1] = name end
    end
    if #names == 0 and next(old.Search) ~= nil then names[1] = "Default" end
    table.sort(names, function(a, b) return tostring(a) < tostring(b) end)
    old.FilterProfileNames = names
    return old
end

-- fn(record, value) for every old value
function check.Records(old, fn)
    for name, profile in next, old.OptionsProfiles do
        if type(profile) == "table" then
            Leaves(profile, function(path, value) fn({ Section = "options", Profile = name, Path = path }, value) end, {})
        end
    end
    for name, profile in next, old.FiltersProfiles do
        if type(profile) == "table" then
            Leaves(profile, function(path, value) fn({ Section = "filters", Profile = name, Path = path }, value) end, {})
        end
    end
    for _, name in ipairs(old.FilterProfileNames) do
        Leaves(old.Search, function(path, value) fn({ Section = "search", Profile = name, Path = path }, value) end, {})
    end
    for character, name in next, old.OptionsProfileKeys do
        fn({ Section = "profileOf", System = "options", Character = character }, name)
    end
    for character, name in next, old.FiltersProfileKeys do
        fn({ Section = "profileOf", System = "filters", Character = character }, name)
    end
end

-- The old value a record names
function check.OldValue(old, record)
    if record.Section == "options" then return check.Read(old.OptionsProfiles[record.Profile], record.Path) end
    if record.Section == "filters" then return check.Read(old.FiltersProfiles[record.Profile], record.Path) end
    if record.Section == "search" then return check.Read(old.Search, record.Path) end
    if record.Section == "profileOf" then
        return (record.System == "options" and old.OptionsProfileKeys or old.FiltersProfileKeys)[record.Character]
    end
end

-- Where a record lives in the new store: the table and the keys in it. nil, nil and a reason when it is not carried:
-- "no-row" (an old path the rename table does not know: an option removed in the past) or "account" (an account
-- value in a profile other than the logging-in character's). create: make the profile's table when missing.
function check.Target(new, record, old, create)
    local section = record.Section
    if section == "profileOf" then
        return (record.System == "options" and new.Options or new.Filters).ProfileOf, { record.Character }
    end
    local profiles = section == "options" and new.Options.Profiles or new.Filters.Profiles
    local function Profile()
        local profile = profiles[record.Profile]
        if not profile and create then
            profile = {}
            profiles[record.Profile] = profile
        end
        return profile
    end
    if section == "filters" or section == "search" then
        return Profile(), Append({ section }, record.Path)
    end
    local kind, key, rest, account = check.Home(record.Path)
    if not kind then return nil, nil, "no-row" end
    if account then
        if record.Profile ~= old.CharacterProfile then return nil, nil, "account" end
        return new.Account, { key }
    end
    if kind == "value" then return Profile(), { key } end
    return Profile(), Append({ key }, rest)
end

-- Puts one old value where its record lives; a character on Default is not written (Default is what no entry means)
function check.Move(new, record, value, old)
    local t, keys = check.Target(new, record, old, true)
    if not t then return end
    if record.Section == "profileOf" and value == "Default" then value = nil end
    check.Write(t, keys, value)
end

-- Whether the new store holds the old value where its record lives (true for a value that is not carried)
function check.Matches(new, record, value, old)
    local t, keys = check.Target(new, record, old, false)
    if keys == nil then return true end
    local got = check.Read(t, keys)
    if record.Section == "profileOf" and got == nil then got = "Default" end
    return got == value
end

-- The check: every old value (or only the records given, a retry) found, equal, where its record lives. Returns the
-- failing records and the old paths that are not carried, as text, for the debug log.
function check.Run(old, new, records)
    local failures, notCarried = {}, {}
    local function One(record, value)
        if not check.Matches(new, record, value, old) then failures[#failures + 1] = record end
        if record.Section == "options" then
            local _, keys, reason = check.Target(new, record, old, false)
            if not keys and reason then notCarried[#notCarried + 1] = reason .. ": " .. tostring(record.Profile) .. "." .. Join(record.Path) end
        end
    end
    if records then
        for _, record in ipairs(records) do One(record, check.OldValue(old, record)) end
    else
        check.Records(old, One)
    end
    table.sort(notCarried)
    return failures, notCarried
end