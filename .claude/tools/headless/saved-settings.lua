---@diagnostic disable: lowercase-global, undefined-global
-- The Lua half of .claude/tools/Compare-SavedSettings.ps1 (docs/work/2026-11-25-leave-aceconfig): reads a player's
-- saved-variables file of this addon (WTF\Account\<account>\SavedVariables\Krowi_AchievementFilter.lua).
--
--   lua.exe saved-settings.lua dump <file>                    the settings in it, one sorted dump on stdout
--   lua.exe saved-settings.lua options <root> <client> <file> every option's value in every profile, as the checkout
--                                                             at <root> reads them, one line each on stdout
--
-- The settings are what the options and the filters keep: KrowiAF_Options, KrowiAF_Filters and KrowiAF_SearchOptions
-- whole, and KrowiAF_SavedData.Tabs (the tab list). The rest of KrowiAF_SavedData changes with every login (calendar
-- messages, event observations, characters) and no option writes it (saved-keys-unchanged's lines).

local mode = arg[1]

local function KeyOrder(a, b)
    local ta, tb = type(a), type(b)
    if ta ~= tb then return ta < tb end
    if ta == "number" or ta == "string" then return a < b end
    return tostring(a) < tostring(b)
end

local function Literal(value)
    local t = type(value)
    if t == "string" then return ("%q"):format(value) end
    if t == "number" then
        if value == math.floor(value) and math.abs(value) < 2^53 then return ("%d"):format(value) end
        return ("%.17g"):format(value)
    end
    return tostring(value)
end

local function Serialize(value, indent)
    if type(value) ~= "table" then return Literal(value) end
    indent = indent or ""
    local keys = {}
    for key in next, value do keys[#keys + 1] = key end
    table.sort(keys, KeyOrder)
    if #keys == 0 then return "{}" end
    local inner, parts = indent .. "    ", {}
    for _, key in ipairs(keys) do
        parts[#parts + 1] = inner .. "[" .. Literal(key) .. "] = " .. Serialize(rawget(value, key), inner) .. ","
    end
    return "{\n" .. table.concat(parts, "\n") .. "\n" .. indent .. "}"
end

-- The file's globals, read without running anything else (the file is only assignments)
local function Load(file)
    local chunk = assert(loadfile(file))
    local globals = {}
    setfenv(chunk, globals)
    chunk()
    return globals
end

local function Settings(globals)
    local savedData = globals.KrowiAF_SavedData
    return {
        KrowiAF_Options = globals.KrowiAF_Options,
        KrowiAF_Filters = globals.KrowiAF_Filters,
        KrowiAF_SearchOptions = globals.KrowiAF_SearchOptions,
        Tabs = type(savedData) == "table" and savedData.Tabs or nil,
    }
end

if mode == "dump" then
    io.stdout:write(Serialize(Settings(Load(assert(arg[2], "dump <file>")))), "\n")
elseif mode == "options" then
    local root, client, file = arg[2], arg[3], arg[4]
    assert(root and client and file, "options <root> <client> <file>")
    root = root:gsub("\\", "/"):gsub("/$", "")
    local globals = Load(file)
    local optionsEnv = assert(loadfile(root .. "/.claude/tools/headless/options-env.lua"))()
    local ctx = optionsEnv.New(root, client, { SavedVariables = {
        KrowiAF_Options = globals.KrowiAF_Options, KrowiAF_Filters = globals.KrowiAF_Filters,
        KrowiAF_SearchOptions = globals.KrowiAF_SearchOptions, KrowiAF_SavedData = globals.KrowiAF_SavedData } })
    for _, err in ipairs(ctx.Errors) do io.stderr:write("load: ", err, "\n") end
    local addon = ctx.addon
    addon.SearchOptions:Load() -- as the search box does once Blizzard's achievement window loads
    local model = addon.Options.Window.Model
    local lines = {}
    local db = addon.Options.db
    for _, profile in ipairs(db:GetProfiles({})) do
        pcall(db.SetProfile, db, profile)
        for _, item in ipairs(model.Options()) do
            local option = item.Option
            if model.Settable(option) then
                lines[#lines + 1] = ("options %s %s = %s"):format(profile, option.Id, Literal(option:Get()))
            end
        end
    end
    for _, entry in ipairs({ { "filters", addon.Filters.db }, { "search", addon.SearchOptions.db } }) do
        local other = entry[2]
        for _, profile in ipairs(other:GetProfiles({})) do
            pcall(other.SetProfile, other, profile)
            lines[#lines + 1] = ("%s %s = %s"):format(entry[1], profile, Serialize(other.profile):gsub("%s+", " "))
        end
    end
    table.sort(lines)
    io.stdout:write(table.concat(lines, "\n"), "\n")
else
    error("usage: saved-settings.lua dump <file> | options <root> <client> <file>")
end