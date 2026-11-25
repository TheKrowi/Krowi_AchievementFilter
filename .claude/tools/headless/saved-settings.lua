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
-- Any failure exits non-zero with the reason on stderr, so the PowerShell half never compares a read that did not work:
-- a load error, a checkout whose options-env.lua does not load a player's saved variables (one from before
-- opts.SavedVariables), or nothing read.

local mode = arg[1]
local scriptDir = ((arg and arg[0]) or ""):gsub("\\", "/"):match("^(.*)/") or "."
local proof = assert(loadfile(scriptDir .. "/settings-proof.lua"))()

local function Fail(message)
    io.stderr:write(message, "\n")
    os.exit(1)
end

-- The file's globals, read without running anything else (the file is only assignments)
local function Load(file)
    local chunk, err = loadfile(file)
    if not chunk then Fail("cannot read " .. tostring(file) .. ": " .. tostring(err)) end
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
    io.stdout:write(proof.Serialize(Settings(Load(arg[2] or Fail("dump <file>")))), "\n")
elseif mode == "options" then
    local root, client, file = arg[2], arg[3], arg[4]
    if not (root and client and file) then Fail("options <root> <client> <file>") end
    root = root:gsub("\\", "/"):gsub("/$", "")
    local globals = Load(file)
    local optionsEnv = assert(loadfile(root .. "/.claude/tools/headless/options-env.lua"))()
    local saved = { KrowiAF_Options = globals.KrowiAF_Options, KrowiAF_Filters = globals.KrowiAF_Filters,
        KrowiAF_SearchOptions = globals.KrowiAF_SearchOptions, KrowiAF_SavedData = globals.KrowiAF_SavedData }
    local ctx = optionsEnv.New(root, client, { SavedVariables = saved })
    if #ctx.Errors > 0 then Fail("load error: " .. tostring(ctx.Errors[1]) .. (#ctx.Errors > 1 and (" (and " .. (#ctx.Errors - 1) .. " more)") or "")) end
    if saved.KrowiAF_Options and rawget(ctx.env, "KrowiAF_Options") ~= saved.KrowiAF_Options then
        Fail("the checkout at " .. root .. " did not load the file's saved variables (its options-env.lua has no opts.SavedVariables)")
    end
    local addon = ctx.addon
    addon.SearchOptions:Load() -- as the search box does once Blizzard's achievement window loads
    local model = addon.Options.Window.Model
    local lines = {}
    local db = addon.Options.db
    for _, profile in ipairs(db:GetProfiles({})) do
        local ok, err = pcall(db.SetProfile, db, profile)
        if not ok then
            lines[#lines + 1] = ("options %s ERROR switching to it: %s"):format(profile, tostring(err))
        else
            for _, item in ipairs(model.Options()) do
                local option = item.Option
                if model.Settable(option) then
                    lines[#lines + 1] = ("options %s %s = %s"):format(profile, option.Id, proof.Literal(option:Get()))
                end
            end
        end
    end
    for _, entry in ipairs({ { "filters", addon.Filters.db }, { "search", addon.SearchOptions.db } }) do
        local other = entry[2]
        for _, profile in ipairs(other:GetProfiles({})) do
            local ok, err = pcall(other.SetProfile, other, profile)
            if not ok then
                lines[#lines + 1] = ("%s %s ERROR switching to it: %s"):format(entry[1], profile, tostring(err))
            else
                lines[#lines + 1] = ("%s %s = %s"):format(entry[1], profile, (proof.Serialize(other.profile):gsub("%s+", " ")))
            end
        end
    end
    if #lines == 0 then Fail("no option was read from " .. file) end
    table.sort(lines)
    io.stdout:write(table.concat(lines, "\n"), "\n")
else
    Fail("usage: saved-settings.lua dump <file> | options <root> <client> <file>")
end