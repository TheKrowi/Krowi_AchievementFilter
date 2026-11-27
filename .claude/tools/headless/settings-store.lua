---@diagnostic disable: lowercase-global, undefined-global
-- A real settings store (Settings/Store.lua) loaded on its own, for headless suites that need settings without a
-- whole-addon boot (docs/work/2026-11-25-settings-store): the store suite, and the suites that used to fake
-- addon.Options.db in AceDB's layout.
--
--   local store = assert(loadfile(dir .. "/settings-store.lua"))()
--   local s = store.New(repoRoot, { Declarations = { ["popOut.enabled"] = { Default = true } },
--       Saved = { Options = { Profiles = { Default = { ["popOut.enabled"] = false } } } }, Character = "Krowi - Frostmane" })
--   s.Settings.Get("popOut.enabled")  -- false
--   s.Logout()                         -- the store's PLAYER_LOGOUT handler, as the game fires it
--
-- New loads a fresh copy each call, so suites never share state. Without Saved the store is not loaded (Get gives
-- defaults, as before ADDON_LOADED); Saved = {} is a new install. addon: the namespace to load it into (default {}).

local M = {}

function M.New(repoRoot, opts)
    opts = opts or {}
    repoRoot = repoRoot:gsub("\\", "/"):gsub("/$", "")
    local frames = {}
    local env = setmetatable({
        UnitName = function() return "Tester" end,
        GetRealmName = function() return "Realm" end,
        CreateFrame = function()
            local frame = { Events = {}, Scripts = {} }
            function frame:RegisterEvent(event) self.Events[event] = true end
            function frame:SetScript(name, fn) self.Scripts[name] = fn end
            frames[#frames + 1] = frame
            return frame
        end,
    }, { __index = _G })
    local chunk = assert(loadfile(repoRoot .. "/Settings/Store.lua"))
    setfenv(chunk, env)
    local addon = opts.Addon or {}
    chunk("Krowi_AchievementFilter", addon)
    local settings = addon.Settings
    for key, declaration in next, opts.Declarations or {} do settings.Declare(key, declaration) end
    if opts.Saved then settings.Load(opts.Saved, opts.Character) end
    local s = { Settings = settings, Addon = addon, Saved = opts.Saved, Frames = frames }
    function s.Logout()
        for _, frame in ipairs(frames) do
            if frame.Events.PLAYER_LOGOUT and frame.Scripts.OnEvent then frame.Scripts.OnEvent(frame, "PLAYER_LOGOUT") end
        end
    end
    return s
end

-- A real settings store made from a suite's fake old-shaped options profile (addon.Options.db.profile, as the suites
-- built one for AceDB; docs/work/2026-11-25-settings-store): Store.lua, Renames.lua, Check.lua and Declarations.lua load
-- into addon, the fake moves into the store through the migration's own Check.Move, and the store loads on it for the
-- character "Player - Realm". Every old option path the core does not declare (the features' and the plugins' settings,
-- declared at ADDON_LOADED in the game) is declared with no default, so a key the fake does not hold reads nil, as the
-- fake did. A map's table with a metatable (a fake that answers every id) is kept as it is, so it answers as before.
function M.FromFakeProfile(repoRoot, addon)
    repoRoot = repoRoot:gsub("\\", "/"):gsub("/$", "")
    addon.Settings = nil
    for _, file in ipairs({ "Store", "Renames", "Check", "Declarations" }) do
        assert(loadfile(repoRoot .. "/Settings/" .. file .. ".lua"))("Krowi_AchievementFilter", addon)
    end
    local settings, check = addon.Settings, addon.Settings.Check
    for _, key in next, settings.Renames.Values do
        if not settings.Declaration(key) then settings.Declare(key, {}) end
    end
    for _, map in ipairs(settings.Renames.Maps) do
        if not settings.Declaration(map.Key) then settings.Declare(map.Key, { Kind = "map", Depth = map.Depth }) end
    end
    for _, key in ipairs({ "filters", "search" }) do
        if not settings.Declaration(key) then settings.Declare(key, { Kind = "object", System = "filters" }) end
    end
    local options = rawget(addon, "Options")
    local db = type(options) == "table" and rawget(options, "db")
    local profile = type(db) == "table" and db.profile or {}
    local context = { Character = "Player - Realm" }
    local old = check.Old({ Options = { profiles = { Default = profile }, profileKeys = {} } }, { Default = profile }, context)
    local saved = { Account = {}, Options = { Profiles = { Default = {} }, ProfileOf = {} }, Filters = { Profiles = {}, ProfileOf = {} } }
    check.Records(old, function(record, value) check.Move(saved, record, value, old) end)
    for _, map in ipairs(settings.Renames.Maps) do
        local t = profile
        for _, name in ipairs(map.Path) do t = type(t) == "table" and rawget(t, name) or nil end
        if type(t) == "table" and getmetatable(t) and not map.Leaf then saved.Options.Profiles.Default[map.Key] = t end
    end
    settings.Load(saved, context.Character)
    return settings
end
-- The migration runner on its own: Settings/Renames.lua, Check.lua and Migrations.lua in a fresh namespace. Returns
-- addon.Settings (Renames, Check, Migrations); migrations.Run(sv, context) works on plain tables, no game needed.
function M.Runner(repoRoot)
    repoRoot = repoRoot:gsub("\\", "/"):gsub("/$", "")
    local addon = { Settings = {} }
    for _, file in ipairs({ "Renames", "Check", "Migrations" }) do
        assert(loadfile(repoRoot .. "/Settings/" .. file .. ".lua"))("Krowi_AchievementFilter", addon)
    end
    return addon.Settings
end

return M