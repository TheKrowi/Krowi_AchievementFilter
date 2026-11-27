---@diagnostic disable: lowercase-global, undefined-global
-- The saved-settings proof's functions (docs/work/2026-11-25-leave-aceconfig), headless only: the settings suite
-- (run-tests.lua), the fixture writer (write-settings-fixture.lua) and Compare-SavedSettings.ps1's Lua half
-- (saved-settings.lua) use them on a whole-addon load of options-env.lua. None of this ships or runs in game:
-- SavedKeys sets every option, and the game cuts a long script short ("script ran too long", Retail, 2026-11-25, on a
-- 7 MB saved file), which between a set and its put-back left a player's setting changed.
--
--   local proof = assert(loadfile(dir .. "/settings-proof.lua"))()
--   proof.Serialize(value), proof.Literal(value), proof.Hash(text), proof.DefaultsHash(addon), proof.SavedKeys(ctx)

local M = {}

-- The saved variables the options and the filters read and write
M.SavedVariables = { "KrowiAF_Options", "KrowiAF_Filters", "KrowiAF_SearchOptions", "KrowiAF_SavedData" }

local keywords = {}
for word in ("and break do else elseif end false for function if in local nil not or repeat return then true until while"):gmatch("%a+") do
    keywords[word] = true
end

local function KeyOrder(a, b)
    local ta, tb = type(a), type(b)
    if ta ~= tb then return ta < tb end
    if ta == "number" or ta == "string" then return a < b end
    return tostring(a) < tostring(b)
end

-- A value as Lua source. Whole numbers through %.0f: %d goes through a 32-bit long on Windows, which turns every whole
-- number from 2^31 up into -2147483648 (code review, 2026-11-25)
function M.Literal(value)
    local t = type(value)
    if t == "string" then return ("%q"):format(value) end
    if t == "number" then
        if value == math.floor(value) and math.abs(value) < 2^53 then return ("%.0f"):format(value) end
        return ("%.17g"):format(value)
    end
    if t == "boolean" or t == "nil" then return tostring(value) end
    return ("%q"):format("<" .. t .. ">") -- a function or userdata: named, so the text still loads
end

-- A Lua table constructor (or literal) for value: keys sorted, raw (no metatable is asked), one entry a line, so the
-- same content gives the same text; a key that is a Lua keyword or not a name is written in brackets
function M.Serialize(value, indent)
    if type(value) ~= "table" then return M.Literal(value) end
    indent = indent or ""
    local keys = {}
    for key in next, value do keys[#keys + 1] = key end
    table.sort(keys, KeyOrder)
    if #keys == 0 then return "{}" end
    local inner = indent .. "    "
    local parts = {}
    for _, key in ipairs(keys) do
        local bare = type(key) == "string" and key:match("^[%a_][%w_]*$") and not keywords[key]
        local name = bare and key or ("[" .. M.Literal(key) .. "]")
        parts[#parts + 1] = inner .. name .. " = " .. M.Serialize(rawget(value, key), inner) .. ","
    end
    return "{\n" .. table.concat(parts, "\n") .. "\n" .. indent .. "}"
end

-- The hash the options suite's fingerprint uses (Options/Window/Model.lua)
function M.Hash(text)
    local h = 5381
    for i = 1, #text do h = (h * 33 + text:byte(i)) % 4294967296 end
    return ("%08x"):format(h)
end

-- The defaults the three AceDB databases were made with (defaults-unchanged). The search options' database is made only
-- once Blizzard's achievement window loads, so its defaults are read where they are from the start (SearchOptions.lua).
function M.DefaultsHash(addon)
    local defaults = { Options = addon.Options.db and addon.Options.db.defaults, Filters = addon.Filters.db and addon.Filters.db.defaults,
        SearchOptions = addon.SearchOptions.Defaults }
    local parts = {}
    for _, name in ipairs({ "Options", "Filters", "SearchOptions" }) do
        parts[#parts + 1] = name .. " = " .. M.Serialize(defaults[name])
    end
    return M.Hash(table.concat(parts, "\n"))
end

local function Copy(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for key, inner in next, value do copy[key] = Copy(inner) end
    return copy
end

-- live made equal to snapshot in place, raw: the tables AceDB and the addon hold on to stay the same tables
local function Restore(live, snapshot)
    for key in next, live do
        if rawget(snapshot, key) == nil then rawset(live, key, nil) end
    end
    for key, value in next, snapshot do
        local current = rawget(live, key)
        if type(value) == "table" and type(current) == "table" then
            Restore(current, value)
        else
            rawset(live, key, Copy(value))
        end
    end
end

-- The raw paths where after differs from before
local function Diff(before, after, path, out)
    for key, value in next, after do
        local old = rawget(before, key)
        local at = path .. "." .. tostring(key)
        if type(value) == "table" and type(old) == "table" then
            Diff(old, value, at, out)
        elseif type(value) == "table" and old == nil then
            Diff({}, value, at, out) -- a table new as a whole (the settings store saves a map only once an entry differs): its leaves
        elseif value ~= old then
            out[#out + 1] = at
        end
    end
    for key in next, before do
        if rawget(after, key) == nil then out[#out + 1] = path .. "." .. tostring(key) end
    end
end

-- Which saved keys each option writes (saved-keys-unchanged), on the load ctx: every option that stores a value (the
-- model's Settable, hidden and disabled ones too) set one at a time to another value (the model's OtherValue). The four
-- saved variables are copied before each set and put back raw and in place after it, and the option is set back too. A
-- profile's name reads as *, so the paths are the same for every profile. Returns the count, the hash and the lines.
-- names: the saved variables to watch (default M.SavedVariables); prepare: run after each set, before the diff (the
-- settings store's save, which writes its live objects into the saved table).
function M.SavedKeys(ctx, names, prepare)
    local env, model = ctx.env, ctx.addon.Options.Window.Model
    local savedVariables = names or M.SavedVariables
    local lines = {}
    for _, item in ipairs(model.Options()) do
        local option = item.Option
        if model.Settable(option) then
            local before = option:Get()
            local value = model.OtherValue(option, before)
            if value ~= nil then
                local snapshot = {}
                for _, name in ipairs(savedVariables) do snapshot[name] = Copy(rawget(env, name)) end
                pcall(option.Set, option, value)
                if prepare then prepare() end
                local paths = {}
                for _, name in ipairs(savedVariables) do
                    local live = rawget(env, name)
                    if type(live) == "table" and type(snapshot[name]) == "table" then
                        Diff(snapshot[name], live, name, paths)
                    elseif live ~= snapshot[name] then
                        paths[#paths + 1] = name
                    end
                end
                pcall(option.Set, option, before)
                if prepare then prepare() end
                for _, name in ipairs(savedVariables) do
                    local live = rawget(env, name)
                    if type(live) == "table" and type(snapshot[name]) == "table" then Restore(live, snapshot[name]) end
                end
                for i, path in ipairs(paths) do
                    paths[i] = path:gsub("^(KrowiAF_%a+%.profiles%.)[^%.]+", "%1*"):gsub("^(KrowiAF_Settings%.%a+%.Profiles%.)[^%.]+", "%1*")
                end
                table.sort(paths)
                lines[#lines + 1] = option.Id .. " => " .. table.concat(paths, ",")
            end
        end
    end
    table.sort(lines)
    return #lines, M.Hash(table.concat(lines, "\n")), lines
end

return M