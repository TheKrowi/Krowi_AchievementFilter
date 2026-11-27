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

-- The store's interface in its AceDB mode (Settings/AceDBMode.lua) over a suite's fake addon.Options.db, until the
-- switch (docs/work/2026-11-25-settings-store, plan steps 8-9): the suites that fake an old-shaped profile keep it, and
-- the code they run, moved to addon.Settings, reads and writes that same table. Loads Store.lua, Renames.lua,
-- Declarations.lua and AceDBMode.lua into addon; every old option path the core does not declare (the features' and
-- the plugins' settings, declared at ADDON_LOADED in the game) is declared with no default, so a read of one the fake
-- does not hold gives nil, as the fake did.
function M.AceDBMode(repoRoot, addon)
    repoRoot = repoRoot:gsub("\\", "/"):gsub("/$", "")
    addon.Settings = nil
    for _, file in ipairs({ "Store", "Renames", "Declarations", "AceDBMode" }) do
        assert(loadfile(repoRoot .. "/Settings/" .. file .. ".lua"))("Krowi_AchievementFilter", addon)
    end
    local settings = addon.Settings
    for _, key in next, settings.Renames.Values do
        if not settings.Declaration(key) then settings.Declare(key, {}) end
    end
    for _, map in ipairs(settings.Renames.Maps) do
        if not settings.Declaration(map.Key) then settings.Declare(map.Key, { Kind = "map", Depth = map.Depth }) end
    end
    for _, key in ipairs({ "filters", "search" }) do
        if not settings.Declaration(key) then settings.Declare(key, { Kind = "object", System = "filters" }) end
    end
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