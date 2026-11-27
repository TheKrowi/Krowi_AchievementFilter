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

return M