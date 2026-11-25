---@diagnostic disable: lowercase-global, undefined-global
-- Writes the settings suite's old file (docs/work/2026-11-25-leave-aceconfig): a player's saved variables as the code of
-- the moment writes them, with a value off its default in every option, and the values each option should read back.
-- Run once on the code the proof is recorded on; the settings suite then boots every later build on that file.
--
--   lua.exe .claude\tools\headless\write-settings-fixture.lua <repo root> [Retail|Classic|Both]
--
-- Per client it boots the whole addon as a new install (options-env.lua) and:
--   - sets every option that stores a value (the model's Settable: hidden and disabled ones too) to another value
--     (the model's OtherValue) in the profile Default;
--   - makes a second profile, Second, with every toggle turned the other way;
--   - turns every fifth boolean of the filters (in the order of their sorted paths) and every search option the other way,
--     which no option writes;
--   - goes back to Default and logs out (ctx.Logout, AceDB's own logout);
-- and writes fixtures/settings-baseline-<client>.lua (the four saved variables) and settings-baseline-<client>-values.lua
-- (what each option reads in each profile, and the filter and search values set, each with its path as a list of keys:
-- the filters have string keys that read as numbers, such as the build version "090205").

local root, which = arg[1], arg[2] or "Both"
assert(root, "usage: write-settings-fixture.lua <repo root> [Retail|Classic|Both]")
root = root:gsub("\\", "/"):gsub("/$", "")
local dir = root .. "/.claude/tools/headless"
local optionsEnv = assert(loadfile(dir .. "/options-env.lua"))()

local function WriteFile(path, text)
    local f = assert(io.open(path, "wb"))
    f:write(text)
    f:close()
end

-- The table at keys under t, made as AceDB makes them (indexing creates them from the defaults)
local function Walk(t, keys)
    for _, key in ipairs(keys) do t = t[key] end
    return t
end

local function Leaves(defaults)
    local out = {}
    local function Visit(node, keys)
        local names = {}
        for key in next, node do names[#names + 1] = key end
        table.sort(names, function(a, b) return tostring(a) < tostring(b) end)
        for _, key in ipairs(names) do
            local value = node[key]
            if key == "*" or key == "**" then value = nil end -- AceDB's wildcard defaults: no saved path of their own
            local path = { unpack(keys) }
            path[#path + 1] = key
            if type(value) == "table" then
                Visit(value, path)
            elseif type(value) == "boolean" then
                out[#out + 1] = path
            end
        end
    end
    Visit(defaults, {})
    return out
end

local function Write(client)
    local ctx = optionsEnv.New(root, client)
    assert(#ctx.Errors == 0, client .. " load errors: " .. tostring(ctx.Errors[1]))
    local env, addon = ctx.env, ctx.addon
    local model = addon.Options.Window.Model
    local options = {}
    for _, item in ipairs(model.Options()) do
        if model.Settable(item.Option) then options[#options + 1] = item.Option end
    end

    -- Default: every option off its value
    for _, option in ipairs(options) do
        local value = model.OtherValue(option, option:Get())
        if value ~= nil then pcall(option.Set, option, value) end
    end
    local values = { Options = { Default = {}, Second = {} }, Filters = {}, Search = {} }
    for _, option in ipairs(options) do values.Options.Default[option.Id] = option:Get() end

    -- Second: every toggle the other way from its default
    local db = addon.Options.db
    pcall(db.SetProfile, db, "Second")
    for _, option in ipairs(options) do
        if option.Type == "toggle" then pcall(option.Set, option, not option:Get()) end
    end
    for _, option in ipairs(options) do values.Options.Second[option.Id] = option:Get() end
    pcall(db.SetProfile, db, "Default")

    -- The filters (every fifth boolean) and the search options (all), which no option writes
    local filters = addon.Filters.db
    for i, keys in ipairs(Leaves(filters.defaults.profile)) do
        if i % 5 == 1 then
            local parent = Walk(filters.profile, { unpack(keys, 1, #keys - 1) })
            parent[keys[#keys]] = not parent[keys[#keys]]
            values.Filters[#values.Filters + 1] = { Keys = keys, Value = parent[keys[#keys]] }
        end
    end
    addon.SearchOptions:Load() -- as the search box does once Blizzard's achievement window loads
    local search = addon.SearchOptions.db
    for _, keys in ipairs(Leaves(search.defaults.profile)) do
        local parent = Walk(search.profile, { unpack(keys, 1, #keys - 1) })
        parent[keys[#keys]] = not parent[keys[#keys]]
        values.Search[#values.Search + 1] = { Keys = keys, Value = parent[keys[#keys]] }
    end

    ctx.Logout()
    local saved = {}
    for _, name in ipairs(model.SavedVariables) do saved[name] = rawget(env, name) end
    local header = "-- Written by .claude/tools/headless/write-settings-fixture.lua (docs/work/2026-11-25-leave-aceconfig); do not edit\n"
    WriteFile(dir .. "/fixtures/settings-baseline-" .. client .. ".lua", header .. "return " .. model.Serialize(saved) .. "\n")
    WriteFile(dir .. "/fixtures/settings-baseline-" .. client .. "-values.lua", header .. "return " .. model.Serialize(values) .. "\n")
    local count = 0
    for _ in next, values.Options.Default do count = count + 1 end
    local filterCount, searchCount = #values.Filters, #values.Search
    print(("%s: %d options in two profiles, %d filters, %d search options"):format(client, count, filterCount, searchCount))
end

for _, client in ipairs(which == "Both" and { "Retail", "Classic" } or { which }) do Write(client) end