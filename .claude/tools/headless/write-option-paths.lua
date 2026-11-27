---@diagnostic disable: lowercase-global, undefined-global
-- Freezes which old saved paths each option writes (docs/work/2026-11-25-settings-store, plan step 1): the settings
-- suite's renames-by-option scenario checks every option of a later build against this file, so a row of the rename
-- table that sends an option's value to another option's key fails headless, before the game.
-- Run once, on the code before the settings store (main 72c80618); the file is not written again after that.
--
--   lua.exe .claude\tools\headless\write-option-paths.lua <repo root> [Retail|Classic|Both]
--
-- Per client it boots the whole addon as a new install (options-env.lua), takes settings-proof.lua's SavedKeys lines
-- (every option that stores a value set to another value, one at a time, and put back) and writes
-- fixtures/settings-option-paths-<client>.lua: option Id -> the sorted list of paths it wrote, a profile's name as *.
-- It refuses when the lines' hash is not the one saved-keys-unchanged records, so the file is the old code's.
-- It also writes fixtures/settings-old-defaults-<client>.lua, the defaults the three AceDB databases were made with
-- (the tab, event and category defaults injected at load included), for renames-cover and defaults-unchanged once
-- Options/Defaults.lua is gone; it refuses unless they give defaults-unchanged's recorded hash.

local root, which = arg[1], arg[2] or "Both"
assert(root, "usage: write-option-paths.lua <repo root> [Retail|Classic|Both]")
root = root:gsub("\\", "/"):gsub("/$", "")
local dir = root .. "/.claude/tools/headless"
local optionsEnv = assert(loadfile(dir .. "/options-env.lua"))()
local proof = assert(loadfile(dir .. "/settings-proof.lua"))()

-- saved-keys-unchanged's recorded lines on the old code (run-tests.lua, the settings suite)
local expected = { Retail = "options=359 hash=ffa1ae09", Classic = "options=255 hash=a1fc83f7" }
local expectedDefaults = { Retail = "10ea1a00", Classic = "e5944253" } -- defaults-unchanged

local function WriteDefaults(ctx, client)
    local addon = ctx.addon
    local defaults = { Options = addon.Options.db.defaults, Filters = addon.Filters.db.defaults,
        SearchOptions = addon.SearchOptions.Defaults }
    local hash = proof.DefaultsHash(addon)
    assert(hash == expectedDefaults[client], client .. ": defaults hash " .. hash .. ", expected " .. expectedDefaults[client])
    local header = "-- Written by .claude/tools/headless/write-option-paths.lua from the old code's defaults "
        .. "(docs/work/2026-11-25-settings-store); do not edit\n"
    local f = assert(io.open(dir .. "/fixtures/settings-old-defaults-" .. client .. ".lua", "wb"))
    f:write(header .. "return " .. proof.Serialize(defaults) .. "\n")
    f:close()
    print(client .. ": defaults hash=" .. hash)
end

local function Write(client)
    local ctx = optionsEnv.New(root, client)
    assert(#ctx.Errors == 0, client .. " load errors: " .. tostring(ctx.Errors[1]))
    ctx.addon.SearchOptions:Load() -- as the settings suite boots
    WriteDefaults(ctx, client)
    local count, hash, lines = proof.SavedKeys(ctx)
    local got = ("options=%d hash=%s"):format(count, hash)
    assert(got == expected[client], client .. ": " .. got .. ", expected " .. expected[client] .. "; not the old code")
    local paths = {}
    for _, line in ipairs(lines) do
        local id, list = line:match("^(.-) => (.*)$")
        local entry = {}
        for path in list:gmatch("[^,]+") do entry[#entry + 1] = path end
        paths[id] = entry
    end
    local header = "-- Written by .claude/tools/headless/write-option-paths.lua on main 72c80618 "
        .. "(docs/work/2026-11-25-settings-store); do not edit\n"
    local f = assert(io.open(dir .. "/fixtures/settings-option-paths-" .. client .. ".lua", "wb"))
    f:write(header .. "return " .. proof.Serialize(paths) .. "\n")
    f:close()
    print(client .. ": " .. got)
end

for _, client in ipairs(which == "Both" and { "Retail", "Classic" } or { which }) do Write(client) end