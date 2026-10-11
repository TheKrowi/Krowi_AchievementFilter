---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Headless test runner: evaluates the addon files a suite needs in plain Lua 5.1 with WoW frames
-- and the relevant FrameXML functions modelled, then runs the suite's scenarios from Tests/<Suite>.lua,
-- the same scenarios /kaftest runs in the game against the real frames. Every scenario prints one
-- line, PASS when the code still behaves as the scenario's Recorded field says, so a behaviour change
-- is a diff of the scenario file; Read-GameTests.ps1 diffs the game's lines against these.
--
-- Usage: lua.exe run-tests.lua <repoRoot> [suite] [-client Retail|Classic] [-check]
--   (no flag)  print every scenario line and a summary, for both clients unless -client is given
--   -check     print only "<file>:<line>: <message>" per scenario that does not pass (what Check-Repo.ps1
--              runs as the unit-tests rule); exit 1 when any scenario fails or is skipped
-- Suites: escape (Gui/FramesForClosing.lua), special (Data/SpecialCategoryAchievements.lua, Data/SpecialCategories.lua,
--         Data/SavedData/AchievementData.lua: Watch List, Excluded and Tracking membership and the rebuilds the
--         layout options trigger; the option setters themselves live in Options/Layout.lua and only run in game),
--         navigation (Gui/Gui.lua's tab sub frames, the search box and Gui/BrowsingHistory/BrowsingHistory.lua: which
--         navigation buttons each tab of the achievement window shows, issue #325), worldmap (Gui/WorldMapButton/ with
--         the Krowi_WorldMapButtons library: whether the button stays in front of the Classic map when it resizes),
--         obtainable (Objects/Achievement.lua's SetTemporaryObtainable and Data/TemporaryObtainable.lua: the record an
--         Obtainable() call stores and the state it gives, on the real data load of client-env.lua), tooltip
--         (Gui/AchievementTooltip/TransmogObjectives.lua: whether the transmog set progress section of the achievement
--         tooltip finishes in a 12.1.5 environment without the global GetItemInfo; MostProgress.lua: whether the Most
--         progress section shows on an achievement with transmog set data), guide (Gui/Guide/, the guide's tooltip and
--         right-click menu sections: achievement guides and their waypoints, once their files exist), menu
--         (Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua: whether a "go to" entry for an achievement the addon
--         does not register is greyed out)
--
-- Retail model is 12.1: the Blizzard_GameMenuEsc handler registry, the UI panel manager (its slots stay
-- empty because the addon shows the achievement window with a plain Show), UISpecialFrames, static
-- popups, the Menu manager (context menus only; legacy dropdowns close without consuming). Classic model
-- is the legacy single ToggleGameMenu chain without the registry. Only globals the game really has are
-- provided, so a call to a Blizzard local shows up here as a nil call. Tests/Escape.lua documents the sources.

local root = ...
assert(root, "usage: run-tests.lua <repoRoot> [suite] [-client Retail|Classic] [-check]")
root = root:gsub("\\", "/"):gsub("/$", "")
local suiteArg, mode, clientArg
local args = { select(2, ...) }
local i = 1
while i <= #args do
    if args[i] == "-check" then mode = "-check"
    elseif args[i] == "-client" then clientArg = args[i + 1] i = i + 1
    else suiteArg = args[i] end
    i = i + 1
end
assert(clientArg == nil or clientArg == "Retail" or clientArg == "Classic", "-client must be Retail or Classic")

local function readFile(path)
    local f = assert(io.open(path, "rb"))
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

local function findLine(rel, needle)
    local n = 0
    for line in readFile(root .. "/" .. rel):gmatch("[^\n]*\n?") do
        n = n + 1
        if line:find(needle, 1, true) then return n end
        if line == "" then break end
    end
    return 1
end

-------------------------------------------------------------------------------------------------
-- Frame model: Show/Hide with OnShow/OnHide scripts and hooks, like the game's, nothing more. Unlike the game, the
-- scripts run only when the frame's own Show/Hide changes its flag, not when a parent's visibility changes it.
-- Strata as the game has it: a frame that never set one has its parent's, and setting one moves every descendant
-- along (SetFixedFrameStrata, which opts a frame out, is not modelled; levels are not modelled at all).
-------------------------------------------------------------------------------------------------
local Frame = {}
local frameMt = {
    __index = function(self, k)
        local method = Frame[k]
        if method == nil then error(("frame method %s is not modelled by run-tests.lua"):format(tostring(k)), 2) end
        return method
    end,
}
local lenientMt = { __index = Frame } -- for suites whose addon code reads frame fields that are still nil, as the game allows
local function NewFrame(name, parent, lenient)
    local frame = setmetatable({ name = name, parent = parent, shown = false, scripts = {}, hooks = {}, children = {} }, lenient and lenientMt or frameMt)
    local siblings = parent and rawget(parent, "children")
    if siblings then table.insert(siblings, frame) end
    return frame
end
function Frame:RunScript(kind, ...)
    if self.scripts[kind] then self.scripts[kind](self, ...) end
    for _, hook in ipairs(self.hooks[kind] or {}) do hook(self, ...) end
end
function Frame:Show()
    if self.shown then return end
    self.shown = true
    self:RunScript("OnShow")
end
function Frame:Hide()
    if not self.shown then return end
    self.shown = false
    self:RunScript("OnHide")
end
function Frame:IsShown() return self.shown end
function Frame:IsVisible()
    local f = self
    while f do
        if not f.shown then return false end
        f = rawget(f, "parent")
    end
    return true
end
function Frame:SetScript(kind, fn) self.scripts[kind] = fn end
function Frame:GetScript(kind) return self.scripts[kind] end
function Frame:HookScript(kind, fn)
    self.hooks[kind] = self.hooks[kind] or {}
    table.insert(self.hooks[kind], fn)
end
function Frame:GetName() return rawget(self, "name") end -- rawget: a missing field must not trip the unknown-method guard
function Frame:GetParent() return rawget(self, "parent") end
function Frame:RegisterEvent() end
function Frame:UnregisterEvent() end
function Frame:SetOwner() end
function Frame:SetText(text) rawset(self, "_text", text) end
function Frame:GetText() return rawget(self, "_text") end
function Frame:SetShown(shown) if shown then self:Show() else self:Hide() end end
-- Layout and state the suites never assert on: stored where a getter needs it, otherwise ignored
-- Points are recorded, so a suite can read an anchor back the way GetPoint gives it in the game
function Frame:SetPoint(point, relativeTo, ...)
    local points = rawget(self, "_points") or {}
    rawset(self, "_points", points)
    points[#points + 1] = { point, relativeTo, ... }
end
function Frame:ClearAllPoints() rawset(self, "_points", nil) end
function Frame:GetPoint(index)
    local point = (rawget(self, "_points") or {})[index or 1]
    if point then return unpack(point) end
end
function Frame:SetAllPoints() end
function Frame:SetSize(width, height) rawset(self, "_width", width) rawset(self, "_height", height) end
function Frame:SetWidth(width) rawset(self, "_width", width) end
function Frame:SetHeight(height) rawset(self, "_height", height) end
function Frame:GetWidth() return rawget(self, "_width") or 0 end
function Frame:GetHeight() return rawget(self, "_height") or 0 end
function Frame:SetFrameStrata(strata)
    rawset(self, "_strata", strata)
    for _, child in ipairs(rawget(self, "children")) do Frame.SetFrameStrata(child, strata) end -- the engine's move, which runs no Lua hook on the children
end
function Frame:GetFrameStrata()
    local strata, parent = rawget(self, "_strata"), rawget(self, "parent")
    if strata then return strata end
    return parent and parent:GetFrameStrata() or "MEDIUM"
end
function Frame:SetFrameLevel(level) rawset(self, "_level", level) end
function Frame:GetFrameLevel() return rawget(self, "_level") or 0 end
function Frame:SetID(id) rawset(self, "_id", id) end
function Frame:GetID() return rawget(self, "_id") or 0 end
function Frame:Enable() rawset(self, "_disabled", false) end
function Frame:Disable() rawset(self, "_disabled", true) end
function Frame:IsEnabled() return not rawget(self, "_disabled") end
function Frame:EnableMouse() end
function Frame:SetTexture() end
function Frame:SetMaxLetters() end
function Frame:SetEnabled(enabled) rawset(self, "_disabled", not enabled) end
function Frame:SetMotionScriptsWhileDisabled() end
function Frame:SetClampedToScreen() end
function Frame:SetMovable() end
function Frame:StartMoving() end
function Frame:StopMovingOrSizing() end
-- Font strings: one line of 12 pixels and 6 pixels per character, enough for layout code to stack them
function Frame:CreateFontString() local fontString = NewFrame(nil, self, true) fontString.shown = true return fontString end
function Frame:SetJustifyH() end
function Frame:SetWordWrap() end
function Frame:GetStringHeight() return 12 end
function Frame:GetTextWidth() return #(tostring(rawget(self, "_text") or "")) * 6 end
function Frame:GetStringWidth() return self:GetTextWidth() end
function Frame:CreateTexture() local texture = NewFrame(nil, self, true) texture.shown = true return texture end
function Frame:SetAtlas() end
function Frame:SetDesaturated() end
function Frame:SetAlpha(alpha) rawset(self, "_alpha", alpha) end
function Frame:SetHighlightTexture() end
function Frame:SetNormalFontObject() end
function Frame:SetHighlightFontObject() end
function Frame:SetDisabledFontObject() end

local function Stub(name)
    local mt = {}
    mt.__index = function(t, k)
        local child = Stub(name .. "." .. tostring(k))
        rawset(t, k, child)
        return child
    end
    mt.__call = function() return Stub(name .. "()") end
    mt.__tostring = function() return "<stub " .. name .. ">" end
    mt.__concat = function(a, b) return tostring(a) .. tostring(b) end
    return setmetatable({}, mt)
end

-------------------------------------------------------------------------------------------------
-- One client: a sandboxed global environment plus the Blizzard model for that client
-------------------------------------------------------------------------------------------------
local function BuildClient(client)
    local isRetail = client == "Retail"
    local env = {}
    env._G = env
    env.tinsert, env.tremove, env.sort, env.wipe = table.insert, table.remove, table.sort, function(t) for k in pairs(t) do t[k] = nil end return t end
    env.format, env.strupper, env.strlower, env.strsub, env.strfind, env.strmatch, env.gsub = string.format, string.upper, string.lower, string.sub, string.find, string.match, string.gsub
    env.floor, env.ceil, env.abs, env.max, env.min = math.floor, math.ceil, math.abs, math.max, math.min
    env.strtrim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
    env.strsplit = function(sep, s) local out = {} for piece in (s .. sep):gmatch("(.-)" .. sep:gsub("%p", "%%%0")) do out[#out + 1] = piece end return unpack(out) end
    env.CopyTable = function(t) local r = {} for k, v in pairs(t) do r[k] = type(v) == "table" and env.CopyTable(v) or v end return r end
    local hooks = {}
    env.hooksecurefunc = function(a, b)
        if type(a) == "string" then
            hooks[a] = hooks[a] or {}
            table.insert(hooks[a], b)
            local original = rawget(env, a)
            -- A modelled Blizzard function: the hook runs after it with its arguments, as in the game. A hook on a function
            -- the model does not define is only recorded (the game would error); the escape suite runs those itself
            if type(original) == "function" then
                rawset(env, a, function(...)
                    local results = { original(...) }
                    b(...)
                    return unpack(results)
                end)
            end
        end
    end
    env.securecall = function(f, ...)
        if type(f) == "string" then f = env[f] end
        return f(...)
    end
    env.securecallfunction = function(f, ...) return f(...) end
    -- A suite that loads GUI code sets lenient (fields read while nil return nil), createShown (a new frame is shown,
    -- as in the game; the escape and special suites keep frames hidden until shown) and templates (name -> function
    -- applying the mixin, scripts and children of an XML template the code under test depends on)
    local frameOptions = { lenient = false, createShown = false, templates = {} }
    env.CreateFrame = function(_, name, parent, template)
        local frame = NewFrame(name, parent, frameOptions.lenient)
        frame.shown = frameOptions.createShown
        if name then rawset(env, name, frame) end
        local apply = template and frameOptions.templates[template]
        if apply then apply(frame) end
        return frame
    end
    env.UISpecialFrames = {}
    env.UIParent = NewFrame("UIParent")
    env.UIParent.shown = true
    env.InCombatLockdown = function() return false end
    env.GetBuildInfo = function()
        if isRetail then return "12.1.0", "69587", "Sep 4 2026", 120100 end
        return "5.5.4", "69585", "Sep 4 2026", 50504
    end
    env.date = os.date
    local knownGlobals = { LibStub = true, UnitFactionGroup = true, C_Timer = true, SlashCmdList = true }
    setmetatable(env, {
        __index = function(_, k)
            local base = rawget(_G, k)
            if base ~= nil then return base end
            if type(k) == "string" and (knownGlobals[k] or k:match("^C_%u") or k:match("^[A-Z][A-Z0-9_]+$")) then
                local s = Stub(k)
                rawset(env, k, s)
                return s
            end
            return nil
        end,
    })

    local addon = {
        Metadata = { Title = "Krowi's Achievement Filter", Version = "0.0", Prefix = "KrowiAF" },
        L = setmetatable({}, { __index = function(_, k) return k end }),
        Diagnostics = { DebugEnabled = function() return true end, TraceEnabled = function() return false end, Trace = function() end, Debug = function() end },
        Util = { IsMainline = isRetail, IsClassicWithAchievements = not isRetail },
        Tests = { Suites = {}, Ready = {} },
    }
    setmetatable(addon, { __index = function(t, k) local s = Stub("addon." .. tostring(k)) rawset(t, k, s) return s end })

    local function loadAddonFile(rel)
        local chunk, err = loadstring(readFile(root .. "/" .. rel), "@" .. rel)
        assert(chunk, err)
        setfenv(chunk, env)
        return chunk("Krowi_AchievementFilter", addon)
    end

    -- --- Blizzard model (sources listed in Tests/Escape.lua) ---------------------------------
    local state = { popup = false, menu = false, dropdown = false }
    local panelSlots = {} -- FramePositionDelegate: area key -> frame, filled only by ShowUIPanel
    local panelKeys = { "left", "center", "right", "doublewide", "fullscreen" }
    local escHandlers = {}
    if isRetail then
        env.GameMenuEscPriority = { Dialog = 1, Menu = 2, Casting = 4, FrameworkPre = 5, Framework = 6, FrameworkPost = 7, AddOn = 8, AddOnPost = 9, AddOnPost2 = 10, World = 11 }
        env.RegisterGameMenuEscHandler = function(priority, handler)
            assert(type(priority) == "number" and type(handler) == "function", "RegisterGameMenuEscHandler(priority, handler)")
            escHandlers[#escHandlers + 1] = { priority = priority, handler = handler }
        end
    end
    env.UIPanelWindows = { AchievementFrame = { area = "doublewide", pushable = 0, xoffset = 80, whileDead = 1 } }
    env.GetUIPanel = function(key) return panelSlots[key] end
    env.ShowUIPanel = function(frame)
        if not frame or frame:IsShown() then return end
        local layout = env.UIPanelWindows[frame:GetName() or ""]
        if layout then panelSlots[layout.area] = frame end
        frame:Show()
    end
    env.HideUIPanel = function(frame)
        if not frame or not frame:IsShown() then return end -- Blizzard's early return: a hidden panel keeps its slot
        local layout = env.UIPanelWindows[frame:GetName() or ""]
        if layout then panelSlots[layout.area] = nil end
        frame:Hide()
    end
    env.StaticPopup_EscapePressed = function()
        if state.popup then
            state.popup = false
            return 1
        end
    end
    local menuManager = {}
    function menuManager:GetOpenMenu() return state.menu and {} or nil end -- a legacy dropdown is not tracked by the manager (verified in game)
    function menuManager:HandleESC()
        if state.menu then
            state.menu = false
            return true
        end
        return false
    end
    function menuManager:CloseMenus() state.menu = false end
    env.Menu = { GetManager = function() return menuManager end }
    env.CloseMenus = function()
        state.dropdown = false -- hides the UIMenus entries and returns nothing
    end
    env.CloseSpecialWindows = function()
        local found
        for _, name in pairs(env.UISpecialFrames) do
            local frame = rawget(env, name)
            if frame and frame:IsShown() then
                frame:Hide()
                found = 1
            end
        end
        return found
    end
    env.CloseWindows = function()
        local found
        for _, key in ipairs(panelKeys) do
            if panelSlots[key] then found = true end
        end
        for _, key in ipairs(panelKeys) do
            env.HideUIPanel(panelSlots[key])
        end
        found = env.securecall("CloseSpecialWindows") or found
        return found
    end
    env.CloseAllWindows = function() return env.CloseWindows() end

    return {
        client = client, isRetail = isRetail, env = env, addon = addon, hooks = hooks, state = state,
        escHandlers = escHandlers, loadAddonFile = loadAddonFile, frames = frameOptions,
    }
end

-------------------------------------------------------------------------------------------------
-- Suites: each takes a built client and returns results, the scenario file and observations
-------------------------------------------------------------------------------------------------
local suites = {}

suites.escape = function(c)
    local env, addon, state = c.env, c.addon, c.state
    local frames = {}
    for key, name in pairs({ Tooltip = "KrowiAF_FloatingAchievementTooltip", Text = "KrowiAF_TextFrame", MapVerifier = "KrowiAF_MapVerifierFrame",
        DataManager = "KrowiAF_DataManagerFrame", Calendar = "KrowiAF_AchievementCalendarFrame", Achievements = "AchievementFrame", GameMenu = "GameMenuFrame" }) do
        frames[key] = env.CreateFrame("Frame", name, env.UIParent)
    end
    frames.CalendarSide = env.CreateFrame("Frame", nil, frames.Calendar)
    frames.Calendar.SideFrame = frames.CalendarSide

    c.loadAddonFile("Krowi_AchievementFilter.lua") -- creates KrowiAF_SpecialFrame
    c.loadAddonFile("Gui/Gui.lua")
    c.loadAddonFile("Gui/FramesForClosing.lua")
    c.loadAddonFile("Tests/Escape.lua")
    local escape = addon.Tests.Escape
    for _, key in ipairs(escape.RegisteredKeys) do
        addon.Gui:RegisterFrameForClosing(frames[key])
    end
    local observations = {}
    if c.isRetail then -- registering there taints Blizzard's handler table (see Gui/FramesForClosing.lua); it must stay at 0
        observations[#observations + 1] = "Escape handlers the addon registered with Blizzard_GameMenuEsc: " .. #c.escHandlers
    end

    local headless = {}
    function headless.IsRetail() return c.isRetail end
    function headless.IsShown(key)
        if key == "GameMenu" then return escape.IsGameMenuShown() end
        return frames[key]:IsShown()
    end
    function headless.Show(key)
        frames[key]:Show() -- the achievement window too: the addon's toggle uses a plain Show
        return frames[key]:IsShown()
    end
    function headless.Close(key) frames[key]:Hide() end
    function headless.Arm(branch)
        if state[branch] == nil then return false end
        state[branch] = true
        return true
    end
    function headless.Press()
        escape.PressEscape()
        for _, hook in ipairs(c.hooks.ToggleGameMenu or {}) do hook() end
    end
    function headless.Reset()
        state.popup, state.menu, state.dropdown = false, false, false
        escape.ResetGameMenu()
        for _, key in ipairs(escape.FrameKeys) do frames[key]:Hide() end
        env.KrowiAF_SpecialFrame:Hide()
    end
    return escape.Run(headless), "Tests/Escape.lua", observations
end

-- The real object, special-category and saved-data code with the frames and options stubbed; two tabs, so
-- every special category has two roots. The rebuild is what Options/Layout.lua's DrawSubCategories does
-- (reset, reload) without the frame updates, since the option tables need AceConfig and the whole GUI.
suites.special = function(c)
    local env, addon = c.env, c.addon
    env.UnitGUID = function() return "Player-Test" end
    env.KrowiAF_Achievements = { Watched = {} }
    env.KrowiAF_SavedData = {}
    local noop = function() end
    env.KrowiAF_CategoriesFrame = { Update = noop }
    env.KrowiAF_AchievementsFrame = { ForceUpdate = noop, ScrollBox = { GetScrollPercentage = function() return 0 end, SetScrollPercentage = noop } }
    env.KrowiAF_SummaryFrame = { UpdateAchievementsOnNextShow = noop }
    addon.Objects = {}
    addon.Gui = { SelectedTab = {}, RefreshView = noop, RefreshViewAfterPlayerLogin = noop }
    local profile = {
        Categories = {
            WatchList = { ShowSubCategories = false, IgnoreFilters = true, CharacterSpecific = false },
            TrackingAchievements = { ShowSubCategories = false, DoLoad = true },
            Excluded = { Show = true, ShowSubCategories = false },
        },
        AdjustableCategories = { Summary = { true, true }, WatchList = { true, true }, TrackingAchievements = { true, true }, Excluded = { true, true }, Uncategorized = { true, true } },
    }
    addon.Options = { db = { profile = profile } }
    local nextCategoryId = 9000
    addon.Data = { Achievements = {}, Categories = {}, AchievementIds = {}, SavedData = {}, GetNextFreeCategoryId = function()
        nextCategoryId = nextCategoryId + 1
        return nextCategoryId
    end }
    addon.TrackingAchievements, addon.UncategorizedAchievements = {}, {} -- Data/AchievementCache.lua's tables
    c.loadAddonFile("Objects/Achievement.lua")
    c.loadAddonFile("Objects/Category.lua")
    c.loadAddonFile("Objects/Tab.lua")
    c.loadAddonFile("Data/SavedData/AchievementData.lua")
    c.loadAddonFile("Data/SpecialCategories.lua")
    c.loadAddonFile("Data/SpecialCategoryAchievements.lua")
    addon.Tabs, addon.TabsOrder = {}, { "Achievements", "Expansions" }
    for _, name in ipairs(addon.TabsOrder) do
        local tab = addon.Objects.Tab:New(name, name)
        tab.Category = addon.Objects.Category:New(addon.Data.GetNextFreeCategoryId(), name)
        tab.Category:SetTabName(name)
        addon.Data.Categories[tab.Category.Id] = tab.Category
        addon.Tabs[name] = tab
    end
    addon.SpecialCategories:Load()
    c.loadAddonFile("Tests/SpecialCategories.lua")
    local special = addon.Tests.SpecialCategories

    local resets = { WatchList = addon.ResetWatchListCategories, Excluded = addon.ResetExcludedCategories, TrackingAchievements = addon.ResetTrackingAchievementsCategories }
    local loaders = {
        WatchList = function() addon.Data.SavedData.AchievementData.LoadWatchedAchievements() end,
        Excluded = addon.SpecialCategories.LoadExcludedAchievements,
        TrackingAchievements = addon.SpecialCategories.LoadTrackingAchievements,
    }
    local headless = {}
    function headless.Setup() return true end
    function headless.Teardown() end
    function headless.Rebuild(kind)
        resets[kind]()
        loaders[kind]()
    end
    function headless.SetSubCategories(kind, on)
        profile.Categories[kind].ShowSubCategories = on
        headless.Rebuild(kind)
    end
    function headless.SetExcludedShown(on) -- Options/Layout.lua's ShowExcludedCategory
        profile.Categories.Excluded.Show = on
        if on then addon.SpecialCategories.LoadExcludedAchievements() else addon.ResetExcludedCategories() end
    end
    return special.Run(headless), "Tests/SpecialCategories.lua", {}
end

-- The real Gui.lua load (gui:LoadWithBlizzard_AchievementUI with its sub-frame hook), tab factory and tab mixin, search
-- box and browsing-history buttons, against a model of Blizzard_AchievementUI's tab switching (sources in
-- Tests/Navigation.lua). Only the loaders that build frames this suite never looks at are faked; the tabs are
-- selected through the real gui:ToggleAchievementFrame, the path the key bindings and /kaftest use.
suites.navigation = function(c)
    local env, addon, isRetail = c.env, c.addon, c.isRetail
    c.frames.lenient, c.frames.createShown = true, true
    local noop = function() end
    env.PlaySound = noop
    env.CreateFromMixins = function(...)
        local mixed = {}
        for n = 1, select("#", ...) do
            for k, v in pairs((select(n, ...))) do mixed[k] = v end
        end
        return mixed
    end
    rawset(env, "GUILD_ACHIEVEMENTS_TITLE", "Guild Achievements")
    rawset(env, "ACHIEVEMENT_TITLE", "Achievements")

    -- --- Blizzard_AchievementUI model -------------------------------------------------------
    local function NewBlizzardFrame(name, parent) return env.CreateFrame("Frame", name, parent) end
    local achievementFrame = NewBlizzardFrame("AchievementFrame", env.UIParent)
    achievementFrame:Hide() -- hidden="true" until the addon's toggle shows it
    achievementFrame:SetSize(768, 500)
    achievementFrame.numTabs = 3
    achievementFrame.Header = NewBlizzardFrame(nil, achievementFrame)
    achievementFrame.Header.Title = NewBlizzardFrame(nil, achievementFrame.Header)
    achievementFrame.Header.Title:SetText(env.ACHIEVEMENT_TITLE)
    if isRetail then -- 12.1: the HeaderDetails strip with Back and the Filters frame
        local details = NewBlizzardFrame(nil, achievementFrame)
        achievementFrame.HeaderDetails = details
        details.Back = env.CreateFrame("Button", nil, details)
        details.Filters = NewBlizzardFrame(nil, details)
        details.Filters.FilterDropdown = NewBlizzardFrame(nil, details.Filters)
        details.Filters.SearchBox = env.CreateFrame("EditBox", nil, details.Filters)
    else -- the old header: points border, the inset the search box sits in, the global filter dropdown
        achievementFrame.Header.PointBorder = NewBlizzardFrame(nil, achievementFrame.Header)
        achievementFrame.Header.RightDDLInset = NewBlizzardFrame(nil, achievementFrame.Header)
        NewBlizzardFrame("AchievementFrameFilterDropDown", achievementFrame)
    end
    for _, name in ipairs({ "AchievementFrameWaterMark", "AchievementFrameMetalBorderLeft", "AchievementFrameMetalBorderRight" }) do
        NewBlizzardFrame(name, achievementFrame)
    end
    local pages = {}
    for _, name in ipairs({ "AchievementFrameSummary", "AchievementFrameAchievements", "AchievementFrameStats", "AchievementFrameComparison" }) do
        pages[#pages + 1] = NewBlizzardFrame(name, achievementFrame)
        if name ~= "AchievementFrameAchievements" then pages[#pages]:Hide() end
    end
    for tabIndex = 1, 3 do env.CreateFrame("Button", "AchievementFrameTab" .. tabIndex, achievementFrame) end

    env.AchievementFrame_ShowSubFrame = function(...)
        for _, page in ipairs(pages) do
            local show = false
            for n = 1, select("#", ...) do
                if page == select(n, ...) then show = true break end
            end
            page:SetShown(show)
        end
    end
    local guildView = false -- achievementFunctions == GUILD_ACHIEVEMENT_FUNCTIONS
    env.AchievementFrame_RefreshView = function()
        achievementFrame.Header.Title:SetText(guildView and env.GUILD_ACHIEVEMENTS_TITLE or env.ACHIEVEMENT_TITLE)
    end
    env.AchievementFrame_UpdateTabs = noop -- PanelTemplates_Tab_OnClick and the tab text offsets; the addon hooks it
    env.AchievementFrameBaseTab_OnClick = function(tabIndex)
        env.AchievementFrame_UpdateTabs(tabIndex)
        guildView = tabIndex == 2
        if tabIndex == 3 then
            env.AchievementFrame_ShowSubFrame(env.AchievementFrameStats)
        else -- InitAchievementPage, a category selected rather than the summary
            env.AchievementFrame_ShowSubFrame(env.AchievementFrameAchievements)
            env.AchievementFrame_RefreshView()
        end
        if isRetail then -- AchievementFrame_RefreshBackButton(tabIndex ~= StatisticsCategoryIndex)
            achievementFrame.HeaderDetails.Back:SetShown(tabIndex ~= 3)
        end
    end
    env.AchievementFrameTab_OnClick = env.AchievementFrameBaseTab_OnClick
    env.PanelTemplates_SetNumTabs = function(frame, numTabs) frame.numTabs = numTabs end
    env.AchievementFrame_SetTabs = noop
    env.AchievementFrame_HideSearchPreview = noop

    -- XML templates of the code under test: mixin, scripts, start state and the children the mixins touch
    c.frames.templates.KrowiAF_AchievementFrameTab_Template = function(frame)
        for k, v in pairs(env.KrowiAF_AchievementFrameTabMixin) do rawset(frame, k, v) end
        rawset(frame, isRetail and "Text" or "text", NewBlizzardFrame(nil, frame)) -- AchievementFrameTabButtonTemplate's label
    end
    c.frames.templates.KrowiAF_SearchBoxFrame_Template = function(frame)
        for k, v in pairs(env.KrowiAF_SearchBoxFrameMixin) do rawset(frame, k, v) end
        frame:SetScript("OnShow", frame.OnShow)
        frame:SetScript("OnHide", frame.OnHide)
        frame.shown = false -- hidden="true"
        for _, key in ipairs({ "OptionsMenuButton", "PreviewContainer", "ResultsFrame" }) do -- built by its OnLoad, which is not run
            rawset(frame, key, env.CreateFrame("Frame", nil, frame))
        end
    end

    -- --- The addon ---------------------------------------------------------------------------
    local profile = { TrackAchievementBrowserHistory = true, ResetViewOnOpen = false, ToggleWindow = true,
        Window = { AchievementFrameHeightOffset = 0, CategoriesFrameWidthOffset = 0, AchievementsFrameWidthOffset = 0 } }
    addon.Options = { db = { profile = profile } }
    addon.Tabs, addon.TabsOrder = { Achievements = { Name = "Achievements", Text = "Achievements", Categories = { {} }, Filters = {} } }, { "Achievements" }
    for _, rel in ipairs({ "Globals.lua", "Api/API.lua", "BrowsingHistory.lua", "Gui/Gui.lua",
        "Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonMixin.lua",
        "Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonFactory.lua",
        "Gui/WindowFrames/Search/BoxFrame/BoxFrameMixin.lua", "Gui/WindowFrames/Search/Search.lua",
        "Gui/BrowsingHistory/BrowsingHistory.lua" }) do
        c.loadAddonFile(rel)
    end
    local gui = addon.Gui
    local function FakeSubFrame(name)
        local frame = env.CreateFrame("Frame", name, achievementFrame)
        table.insert(gui.SubFrames, frame)
        return frame
    end
    for _, key in ipairs({ "AchievementFrameHeader", "AchievementsObjectives", "EventReminderSideButtonSystem", "Calendar", "DataManager" }) do
        gui[key] = { Load = noop }
    end
    gui.CategoriesFrame = { Load = function() FakeSubFrame("KrowiAF_CategoriesFrame").SetRightPoint = noop end }
    gui.AchievementsFrame = { Load = function() FakeSubFrame("KrowiAF_AchievementsFrame").Update = noop end }
    gui.SummaryFrame = { Load = function() FakeSubFrame("KrowiAF_SummaryFrame") end }
    gui.FilterButton = { Load = function() FakeSubFrame("KrowiAF_AchievementFrameFilterButton") end }
    gui.SetFrameToLastPosition, gui.RegisterFrameForClosing = noop, noop -- Gui/MovableFrames.lua, Gui/FramesForClosing.lua
    addon.BrowsingHistory:Load() -- the bootstrap does this in phase 1
    gui:LoadWithBlizzard_AchievementUI()

    c.loadAddonFile("Tests/Navigation.lua")
    local navigation = addon.Tests.Navigation
    local headless = {}
    function headless.IsRetail() return isRetail end
    function headless.Setup() return true end
    function headless.Teardown() end
    function headless.Reset() achievementFrame:Hide() end
    function headless.SelectTab(tabKey)
        local addonName, tabName = unpack(navigation.Tabs[tabKey])
        if not (gui.Tabs[addonName] and gui.Tabs[addonName][tabName]) then return false, "no such tab on this client" end
        gui:ToggleAchievementFrame(addonName, tabName, nil, true)
        return true
    end
    function headless.ToggleOption() -- what Options/Layout.lua's BrowserHistoryTrackSet does for off, then on
        local prevButton, nextButton = env.KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton, env.KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton
        for _, on in ipairs({ false, true }) do
            profile.TrackAchievementBrowserHistory = on
            prevButton:Hide()
            nextButton:Hide()
            if on then
                prevButton:Show()
                nextButton:Show()
            end
        end
    end
    function headless.IsVisible(key)
        if key == "Back" then return achievementFrame.HeaderDetails ~= nil and achievementFrame.HeaderDetails.Back:IsVisible() end
        return env.KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:IsVisible() or env.KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:IsVisible()
    end
    return navigation.Run(headless), "Tests/Navigation.lua", {}
end

-- The real Krowi_WorldMapButtons library, button mixin and Gui/WorldMapButton/WorldMapButton.lua against a model of the
-- Mists Classic world map (sources in Tests/WorldMap.lua); the suite's own environment then drives the model through
-- the same globals it uses in game. Levels follow the in-game probe of 2026-10-02: map 1, ScrollContainer 2, canvas 3.
suites.worldmap = function(c)
    local env, addon = c.env, c.addon
    c.loadAddonFile("Tests/WorldMap.lua")
    local worldMap = addon.Tests.WorldMap
    local observations = {}
    if c.isRetail then
        return worldMap.Run(worldMap.GameEnv, observations), "Tests/WorldMap.lua", observations
    end
    c.frames.lenient = true -- the library reads WorldMapFrame.overlayFrames, which Mists does have but the model leaves nil

    -- hooksecurefunc on a table method, as the library (OnMapChanged) and the button (SetFrameStrata) use it: the hook
    -- runs after the original with its arguments; kept to this suite so the others keep their model
    local hookGlobal = env.hooksecurefunc
    env.hooksecurefunc = function(target, name, hook)
        if type(target) ~= "table" then return hookGlobal(target, name) end
        local original = target[name]
        assert(type(original) == "function", "hooksecurefunc(): " .. tostring(name) .. " is not a function")
        rawset(target, name, function(...)
            local results = { original(...) }
            hook(...)
            return unpack(results)
        end)
    end
    local libraries = {}
    rawset(env, "LibStub", setmetatable({ NewLibrary = function(_, major)
        libraries[major] = {}
        return libraries[major]
    end }, { __call = function(_, major) return libraries[major] end }))
    local cvars = { miniWorldMap = "1" }
    env.GetCVar = function(name) return cvars[name] end
    env.GetCVarBool = function(name) return cvars[name] == "1" end
    env.SetCVar = function(name, value) cvars[name] = tostring(value) end
    env.C_AddOns = { IsAddOnLoaded = function() return false end }

    -- --- Blizzard_WorldMap model (Cata/Blizzard_WorldMap.lua and Wrath/QuestLogOwnerMixin.lua, classic branch) ---------
    local map = env.CreateFrame("Frame", "WorldMapFrame", env.UIParent)
    map:SetFrameStrata("MEDIUM") -- MapCanvasFrameTemplate
    map:SetFrameLevel(1)
    map.ScrollContainer = env.CreateFrame("ScrollFrame", nil, map)
    map.ScrollContainer:SetFrameLevel(2)
    map.ScrollContainer.Child = env.CreateFrame("Frame", nil, map.ScrollContainer)
    map.ScrollContainer.Child:SetFrameLevel(3)
    function map:GetCanvasContainer() return self.ScrollContainer end
    function map:OnMapChanged() end -- the library hooks it; opening the map in the model sets no map
    function map:IsMaximized() return rawget(self, "isMaximized") end
    function map:SynchronizeDisplayState() self:SetFrameStrata(self:IsMaximized() and "FULLSCREEN" or "MEDIUM") end
    function map:Maximize()
        self.isMaximized = true
        self:SynchronizeDisplayState()
    end
    function map:Minimize()
        self.isMaximized = false
        self:SynchronizeDisplayState()
    end
    function map:SetDisplayState(maximized) -- only a size change calls Maximize or Minimize
        env.ShowUIPanel(self)
        if maximized and not self:IsMaximized() then
            self:Maximize()
        elseif not maximized and self:IsMaximized() then
            self:Minimize()
        end
    end
    function map:HandleUserActionMaximizeSelf()
        env.SetCVar("miniWorldMap", 0)
        self:SetDisplayState(true)
    end
    function map:HandleUserActionMinimizeSelf()
        env.SetCVar("miniWorldMap", 1)
        self:SetDisplayState(false)
    end
    function map:HandleUserActionToggleSelf()
        if self:IsShown() then
            env.HideUIPanel(self) -- closing a maximized map that should be small reopens it small; the suite never does that
        else
            self:SetDisplayState(not env.GetCVarBool("miniWorldMap"))
        end
    end
    map.MaximizeMinimizeFrame = {
        Maximize = function() map:HandleUserActionMaximizeSelf() end,
        Minimize = function() map:HandleUserActionMinimizeSelf() end,
    }
    map:SetScript("OnShow", function(self) -- WorldMapMixin:OnShow brings the size in line with the CVar
        local miniWorldMap = env.GetCVarBool("miniWorldMap")
        if miniWorldMap ~= self:IsMaximized() then
            if miniWorldMap then self.MaximizeMinimizeFrame.Minimize() else self.MaximizeMinimizeFrame.Maximize() end
        end
    end)
    env.ToggleWorldMap = function() map:HandleUserActionToggleSelf() end

    -- --- The addon ---------------------------------------------------------------------------
    c.frames.templates.KrowiAF_WorldMapButton_Template = function(frame)
        for k, v in pairs(env.KrowiAF_WorldMapButtonMixin) do rawset(frame, k, v) end
        frame:SetFrameStrata("HIGH")
    end
    addon.Gui = {}
    addon.Options = { db = { profile = { ShowWorldmapIcon = true } } }
    c.loadAddonFile("Libs/Krowi_WorldMapButtons/Krowi_WorldMapButtons.lua")
    c.loadAddonFile("Gui/WorldMapButton/WorldMapButtonMixin.lua")
    c.loadAddonFile("Gui/WorldMapButton/WorldMapButton.lua")
    addon.Gui.WorldMapButton:Load() -- Gui/Gui.lua's LoadWithAddon, phase 1
    return worldMap.Run(worldMap.GameEnv, observations), "Tests/WorldMap.lua", observations
end

-- Krowi_Tooltip as the tooltip sections use it: lines, owner, and the Krowi_TooltipTextLeft/Right<n> font strings a section
-- may copy. Returns the tooltip and a function giving its left texts.
local function ModelKrowiTooltip(env)
    local lines, owner = {}, nil
    local function FontString(text, r, g, b)
        return { GetText = function() return text end, GetTextColor = function() return r or 1, g or 1, b or 1 end }
    end
    local function AddRow(left, right, lr, lg, lb, rr, rg, rb)
        lines[#lines + 1] = left
        rawset(env, "Krowi_TooltipTextLeft" .. #lines, FontString(left, lr, lg, lb))
        rawset(env, "Krowi_TooltipTextRight" .. #lines, FontString(right, rr, rg, rb))
    end
    local krowiTooltip = {}
    function krowiTooltip:SetOwner(frame) owner = frame; lines = {} end -- like GameTooltip:SetOwner, it clears the lines
    function krowiTooltip:GetOwner() return owner end
    function krowiTooltip:AddLine(text, r, g, b) AddRow(text, nil, r, g, b) end
    function krowiTooltip:AddDoubleLine(left, right, lr, lg, lb, rr, rg, rb) AddRow(left, right, lr, lg, lb, rr, rg, rb) end
    function krowiTooltip:NumLines() return #lines end
    function krowiTooltip:Show() end
    function krowiTooltip:Hide() end
    rawset(env, "Krowi_Tooltip", krowiTooltip)
    return krowiTooltip, function() return lines end
end

-- A copy of AchievementTooltip:ShowTooltip (Gui/AchievementTooltip/AchievementTooltip.lua): every registered section that
-- wants the achievement adds its lines
local function ModelShowTooltip(addon, krowiTooltip)
    function addon.Gui.AchievementTooltip:ShowTooltip(anchor, achievement)
        krowiTooltip:SetOwner(anchor, "ANCHOR_BOTTOMRIGHT", 0, anchor:GetHeight())
        for _, section in next, self.Sections do
            if section:CheckAdd(achievement) then
                section:Add(achievement)
            end
        end
        krowiTooltip:Show()
    end
end

-- The real Gui/AchievementTooltip/TransmogObjectives.lua behind a copy of AchievementTooltip:ShowTooltip, against a model of
-- Krowi_Tooltip and the transmog and item APIs: one fake set of two items, both in the item cache, so the section runs
-- without yielding. Like 12.1.5 the environment has no global GetItemInfo, only C_Item.GetItemInfo (sources in
-- Tests/Tooltip.lua).
suites.tooltip = function(c)
    local env, addon = c.env, c.addon
    c.loadAddonFile("Tests/Tooltip.lua")
    local suite = addon.Tests.Tooltip
    local observations = {}
    local headless = {}
    function headless.IsRetail() return c.isRetail end
    if not c.isRetail then
        return suite.Run(headless, observations), "Tests/Tooltip.lua", observations
    end
    local krowiTooltip, getLines = ModelKrowiTooltip(env)

    -- --- Transmog and item APIs (C_TransmogSets, C_TransmogCollection, C_Item on 12.1.5) ---------------------------------
    local items = { [101] = "INVTYPE_HEAD", [102] = "INVTYPE_CHEST" } -- item id -> equip slot
    rawset(env, "C_TransmogSets", {
        GetSetInfo = function() return { description = "Normal" } end,
        GetSetPrimaryAppearances = function() return { { appearanceID = 1, collected = true }, { appearanceID = 2, collected = false } } end,
    })
    rawset(env, "C_TransmogCollection", {
        GetSourceInfo = function(sourceId) return { itemID = 100 + sourceId, invType = sourceId } end,
    })
    rawset(env, "C_Item", {
        GetItemInfo = function(itemId)
            local equipLoc = items[itemId]
            if not equipLoc then return nil end
            return "Item " .. itemId, nil, 4, 600, 80, "Armor", "Cloth", 1, equipLoc, 0, 0, 4, 1, 1, 11, nil, false
        end,
    })
    env.INVTYPE_HEAD, env.INVTYPE_CHEST = "Head", "Chest"

    -- --- Most progress: no characters saved, so the section writes its header and "No characters found" -------------
    rawset(env, "GetAchievementNumCriteria", function() return 2 end)
    rawset(env, "KrowiAF_SavedData", { CharacterList = {} })
    rawset(env, "KrowiAF_Achievements", { NotCompleted = {} })
    string.SetColorRed = string.SetColorRed or function(text) return text end -- Libs/Krowi_Util/Colors.lua adds these to string

    -- --- The addon -------------------------------------------------------------------------------------------------
    addon.Gui = { AchievementTooltip = { Sections = {} } }
    addon.Options = { db = { profile = { Tooltip = { Achievements = {
        ObjectivesProgress = { Show = true, ShowWhenAchievementCompleted = true },
        MostProgress = { Characters = 1, AlwaysShowRealm = false },
    } } } } }
    addon.GetUsableSets = function(setIds) return setIds end
    addon.Util.Colors = setmetatable({}, { __index = function() return "%s" end })
    c.loadAddonFile("Gui/AchievementTooltip/TransmogObjectives.lua") -- in the order of Gui/AchievementTooltip/Files.xml
    c.loadAddonFile("Gui/AchievementTooltip/MostProgress.lua")
    ModelShowTooltip(addon, krowiTooltip)

    local anchor = env.CreateFrame("Frame", nil, env.UIParent)
    function headless.Setup() return true end
    function headless.CollectingText() return addon.L["Collecting data"] end
    function headless.ProgressText() return addon.L["Objectives progress"] end
    function headless.MostProgressText() return addon.L["Most progress"] end
    function headless.Show(scenario)
        local achievement = { Id = scenario.Id, TransmogSetIds = { 1 }, IsCompleted = false, IsAccountWide = false, GetObtainableState = function() return nil end }
        rawset(anchor, "Achievement", achievement)
        addon.Gui.AchievementTooltip:ShowTooltip(anchor, achievement)
        return true
    end
    function headless.Lines() return getLines() end
    function headless.Teardown() end
    return suite.Run(headless, observations), "Tests/Tooltip.lua", observations
end

-- Achievement guides (docs/work/2026-10-11-achievement-guides): the guide renderer, the waypoint actions and the tooltip
-- and right-click menu sections, each loaded once its file exists, against a model of what they read on a Death Knight
-- in Acherus on Retail. The model holds:
--   - the 60962 guide as the data registers it, and its two hidden type-198 criteria, 486 Frost and Death and
--     487 Roster of Champions, with Tier VII locked, as on the step-0 Death Knight;
--   - the maps the user waypoint allows (Acherus yes, Dalaran no) and the Alliance Paladin portal's POI;
--   - no TomTom.
-- Until the feature exists no file loads, and every scenario gets "none". Classic runs the faction and waypoint scenarios
-- only, which read nothing from the game.
suites.guide = function(c)
    local env, addon = c.env, c.addon
    c.loadAddonFile("Tests/Guide.lua")
    local suite = addon.Tests.Guide
    local observations = {}
    local headless = {}
    function headless.IsRetail() return c.isRetail end
    function headless.Text(key) return addon.L[key] end
    local factions = { Alliance = 1, Horde = 2 } -- KrowiAF.Enum.Faction, Api/AchievementDataApi.lua
    function headless.Faction(name) return factions[name] end
    env.KrowiAF = { Enum = { Faction = factions } }
    -- Libs/Krowi_Util/Strings.lua's ReplaceVars, line for line: "{name}" placeholders from a table, or every placeholder
    -- from one value; a nil value makes it read the string as its {str, vars} table form and fail, as in the game
    string.K_ReplaceVars = function(str, vars)
        if not vars then
            vars = str
            str = vars[1]
        end
        if type(vars) == "table" then
            return (string.gsub(str, "({([^}]+)})", function(whole, key) return vars[key] or whole end))
        end
        return (string.gsub(str, "({([^}]+)})", function() return vars end))
    end

    if c.isRetail then
        -- --- Garrison talents, hidden criteria, currency (values read in game in step 0 of the plan) --------------------
        env.Enum = {
            GarrisonType = { Type_7_0_Garrison = 3 },
            GarrisonTalentAvailability = { Available = 0, Unavailable = 1, UnavailableAnotherIsResearching = 2, UnavailableNotEnoughResources = 3,
                UnavailableNotEnoughGold = 4, UnavailableTierUnavailable = 5, UnavailablePlayerCondition = 6, UnavailableAlreadyHave = 7,
                UnavailableRequiresPrerequisiteTalent = 8 },
            SuperTrackingMapPinType = { AreaPOI = 0, QuestOffer = 1, TaxiNode = 2, DigSite = 3, HousingPlot = 4 },
        }
        local function Talent(id, name)
            return { id = id, name = name, treeID = 128, tier = 6, researched = false, isBeingResearched = false, talentAvailability = 5,
                researchDuration = 86400, researchCurrencyCosts = { { currencyType = 1220, currencyQuantity = 10000 } } }
        end
        local talents = { [486] = Talent(486, "Frost and Death"), [487] = Talent(487, "Roster of Champions") }
        -- The Death Knight tree 128 with Tier I researched, as on Krowi's Death Knight (screenshot, 2026-10-11)
        local tree = { talents = { { id = 1, tier = 0, researched = true }, { id = 2, tier = 0, researched = false } } }
        for tier = 1, 5 do table.insert(tree.talents, { id = 10 + tier, tier = tier, researched = false }) end
        table.insert(tree.talents, talents[486])
        table.insert(tree.talents, talents[487])
        env.C_Garrison = {
            GetTalentInfo = function(id) return talents[id] end,
            GetTalentTreeIDsByClassID = function(_, classId) return classId == 6 and { 128 } or {} end,
            GetTalentTreeInfo = function(treeId) return treeId == 128 and tree or nil end,
        }
        env.SecondsToTime = function(seconds) return seconds == 86400 and "1 Day" or (seconds .. " Sec") end
        env.UnitClass = function() return "Death Knight", "DEATHKNIGHT", 6 end
        env.UnitFactionGroup = function() return "Alliance", "Alliance" end
        -- 60962's criteria are hidden: only countHidden returns them, and one index past the last raises an error
        local hiddenCriteria = { [60962] = { 486, 487 } }
        env.GetAchievementNumCriteria = function() return 0 end
        env.GetAchievementInfo = function(id) return id, "Achievement " .. id, 5, false end -- not completed
        env.GetAchievementCriteriaInfo = function(id, index, countHidden)
            local assets = countHidden and hiddenCriteria[id]
            if not assets or not assets[index] then error("criteria not found", 2) end
            return "", 198, false, 0, 1, nil, 0, assets[index], "0/1", 0, false
        end
        env.C_CurrencyInfo = { GetCurrencyInfo = function(id) return id == 1220 and { name = "Order Resources" } or nil end }
        env.BreakUpLargeNumbers = function(n) return (tostring(n):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")) end

        -- --- Spells, maps, waypoints, POIs, TomTom ------------------------------------------------------------------------
        env.C_Spell = { GetSpellName = function(id) return ({ [50977] = "Death Gate" })[id] end }
        local mapNames = { [627] = "Dalaran", [647] = "Acherus: The Ebon Hold", [648] = "Acherus: The Ebon Hold" }
        local userWaypointMaps = { [647] = true, [648] = true } -- /kafwhere, step 0: Acherus allows the map pin, Dalaran refuses it
        env.C_Map = {
            GetMapInfo = function(id) return mapNames[id] and { mapID = id, name = mapNames[id] } or nil end,
            CanSetUserWaypointOnMap = function(id) return userWaypointMaps[id] == true end,
            SetUserWaypoint = function() end,
        }
        env.UiMapPoint = { CreateFromCoordinates = function(id, x, y) return { uiMapID = id, position = { x = x, y = y } } end }
        env.C_SuperTrack = { SetSuperTrackedUserWaypoint = function() end, SetSuperTrackedMapPin = function() end }
        local pois = { [5057] = { areaPoiID = 5057, name = "Sanctum of Light", description = "Portal to the Sanctum of Light, Home of the Silver Hand",
            position = { x = 0.327, y = 0.698 } } } -- a Death Knight would not see it in game; the model keeps one POI to read
        env.C_AreaPoiInfo = { GetAreaPOIInfo = function(mapId, id) return mapId == 627 and pois[id] or nil end }
        env.C_AddOns = { IsAddOnLoaded = function() return false end }
    else
        env.C_Map = { GetMapInfo = function() return nil end } -- Classic has none of the Legion maps the scenarios name
    end

    -- --- The addon -------------------------------------------------------------------------------------------------
    -- The real enUS strings, written the way AceLocale's default locale stores them (true is the key itself), so the
    -- observed lines read as the game shows them
    local strings = setmetatable({}, { __index = function(_, key) return key end })
    addon.Localization = { NewDefaultLocale = function()
        return setmetatable({}, { __newindex = function(_, key, value) rawset(strings, key, value == true and key or value) end })
    end }
    env.KrowiAF.PluginsApi = { LoadPluginLocalization = function() end }
    c.loadAddonFile("Localization/enUS.lua")
    addon.L = strings
    c.frames.lenient = true -- the guide frames keep their pools in fields that start out nil, as the game allows
    addon.Gui = { AchievementTooltip = { Sections = {} }, RightClickMenu = { AchievementMenu = { Sections = {} } },
        RegisterFrameForClosing = function() end, -- Gui/FramesForClosing.lua, which the escape suite covers
        RewardPreview = { Close = function() end } } -- the guide panel closes it on open (Gui/RewardPreview/RewardPreview.lua)
    addon.Options = { db = { profile = { Achievements = { Guide = { Tooltip = true, RightClickMenu = true, Icon = true, ExpandedRow = false,
        ActionStyle = 1, WaypointProvider = 1 } } } } } -- Options/Defaults.lua
    local loaded = {}
    -- Gui/SidePanels.lua first: the side panel chain the panel scenarios read
    for _, rel in ipairs({ "Gui/SidePanels.lua", "Gui/Guide/Guide.lua", "Gui/Guide/Waypoint.lua", "Gui/Guide/Content.lua", "Gui/Guide/Panel.lua",
        "Gui/AchievementTooltip/Guide.lua", "Gui/RightClickMenu/AchievementMenu/Guide.lua" }) do
        local f = io.open(root .. "/" .. rel, "rb")
        if f then
            f:close()
            c.loadAddonFile(rel)
            loaded[#loaded + 1] = rel
        end
    end
    if #loaded == 0 then table.insert(observations, "none of the guide files exists yet") end
    local krowiTooltip, getLines = ModelKrowiTooltip(env)
    ModelShowTooltip(addon, krowiTooltip)

    local achievements = {
        [60962] = { Id = 60962, IsCompleted = false, Guide = { -- as DataAddons/Retail/07_Legion/GuideData.lua registers it
            { Type = "Travel", SpellId = 50977 },
            { Type = "Npc", NpcId = 97485, Name = "Archivist Zubashi", MapId = 648, X = 47.7, Y = 53.8 },
            { Type = "Criteria", Operator = "Any" },
        } },
        [11223] = { Id = 11223, IsCompleted = true },
    }
    function headless.Achievement(id) return achievements[id] end
    local savedOptions
    function headless.SetOptions(options)
        local guideOptions = addon.Options.db.profile.Achievements.Guide
        savedOptions = {}
        for key, value in pairs(options or {}) do
            savedOptions[key] = { Value = guideOptions[key] }
            guideOptions[key] = value
        end
    end
    local anchor = env.CreateFrame("Frame", nil, env.UIParent)
    local objectives = env.CreateFrame("Frame", nil, env.UIParent)
    objectives:SetSize(400, 20)
    local row = env.CreateFrame("Frame") -- no parent: the panel walks up to the row's window, and the model's UIParent is strict
    local otherRow, standIn = env.CreateFrame("Frame"), env.CreateFrame("Frame")
    function headless.Anchor() return row end
    function headless.OtherRow() return otherRow end
    function headless.StandIn() return standIn end
    function headless.Objectives() return objectives end
    function headless.TooltipLines(achievement)
        rawset(anchor, "Achievement", achievement)
        addon.Gui.AchievementTooltip:ShowTooltip(anchor, achievement)
        return getLines()
    end
    function headless.Teardown()
        local guideOptions = addon.Options.db.profile.Achievements.Guide
        for key, saved in pairs(savedOptions or {}) do guideOptions[key] = saved.Value end
        savedOptions = nil
    end
    return suite.Run(headless, observations), "Tests/Guide.lua", observations
end

-- The real Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua against a model of addon.MenuBuilder that keeps the one
-- rule this suite is about: CreateButtonAndAdd disables an entry only when its fourth argument, isEnabled, is false
-- (Libs/Krowi_Menu/Krowi_MenuBuilder.lua, CreateSubmenuButton on Retail and on Classic). Achievement 6 is registered; the
-- missing id is a fake the model's data does not hold (sources in Tests/Menu.lua).
suites.menu = function(c)
    local addon = c.addon
    c.loadAddonFile("Tests/Menu.lua")
    local suite = addon.Tests.Menu
    local observations = {}

    local builder = {}
    function builder:New() return self end
    function builder:Close() end
    function builder:CreateButtonAndAdd(menu, text, func, isEnabled)
        local entry = { Text = text, Func = func, Enabled = isEnabled ~= false }
        menu.Entries[#menu.Entries + 1] = entry
        return entry
    end
    addon.MenuBuilder = builder
    addon.Gui = { RightClickMenu = {} }
    addon.Data = { Achievements = { [6] = { Id = 6 } } }
    addon.GetAchievmentName = function(id) return "Achievement " .. id end
    c.loadAddonFile("Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua")

    local missingId = 999999
    local headless = {}
    function headless.MissingId(obs)
        obs[#obs + 1] = ("missing-achievement-entry links to %d, a fake id the model's data does not hold"):format(missingId)
        return missingId
    end
    function headless.Build(id)
        local rootMenu = { Entries = {} }
        addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementLine(rootMenu, id)
        return rootMenu
    end
    function headless.IsEntryEnabled(rootMenu)
        local entry = rootMenu.Entries[1]
        if not entry then return nil, "the root menu got no entry" end
        return entry.Enabled
    end
    return suite.Run(headless, observations), "Tests/Menu.lua", observations
end

-- The real data load of client-env.lua (the one load-data.lua checks), then Data/TemporaryObtainable.lua on top,
-- which the load itself does not need. The suite drives the addon's own objects, so the game and this run share
-- every line of it; only the clock is set here, which client-env leaves as a stub because nothing reads it at load.
suites.obtainable = function(c)
    local scriptDir = ((arg and arg[0]) or ""):gsub("\\", "/"):match("^(.*)/") or "."
    local clientEnv = assert(loadfile(scriptDir .. "/client-env.lua"))()
    local ctx = clientEnv.New(root, c.client)
    local failures = {}
    local function fail(label) return function(_, err) failures[#failures + 1] = label .. ": " .. tostring(type(err) == "table" and err.msg or err) end end
    ctx:LoadFiles{ ParseError = fail("parse"), RuntimeError = fail("load") }
    ctx:RunPipeline{ StepError = fail("step"), TaskError = fail("task") }
    assert(#failures == 0, "data load failed (run load-data.lua): " .. tostring(failures[1]))
    local env, addon = ctx.env, ctx.addon
    env.time = os.time
    env.KrowiAF_GetUtcOffsetSeconds = function() return 0 end
    addon.Tests = { Suites = {}, Ready = {} }
    for _, rel in ipairs({ "Data/TemporaryObtainable.lua", "Tests/Obtainable.lua" }) do
        local chunk = assert(loadstring(readFile(root .. "/" .. rel), "@" .. rel))
        setfenv(chunk, env)
        chunk("Krowi_AchievementFilter", addon)
    end
    return addon.Tests.Obtainable.Run(), "Tests/Obtainable.lua", {}
end

-------------------------------------------------------------------------------------------------
-- Run
-------------------------------------------------------------------------------------------------
local names = {}
if suiteArg then
    assert(suites[suiteArg], "unknown suite " .. tostring(suiteArg))
    names = { suiteArg }
else
    for name in pairs(suites) do names[#names + 1] = name end
    table.sort(names)
end
local clients = clientArg and { clientArg } or { "Retail", "Classic" }

local exitCode = 0
for _, client in ipairs(clients) do
    for _, name in ipairs(names) do
        local results, scenarioFile, observations = suites[name](BuildClient(client))
        local counts, open = { PASS = 0, FAIL = 0, SKIP = 0 }, 0
        for _, r in ipairs(results) do
            counts[r.Status] = counts[r.Status] + 1
            if r.TargetMet == false then open = open + 1 end
            if mode == "-check" then
                if r.Status ~= "PASS" then
                    io.stdout:write(("%s:%d: %s: %s (a deliberate change updates the scenario's Recorded field)\n"):format(scenarioFile, findLine(scenarioFile, 'Name = "' .. r.Name .. '"'), client, r.Line))
                end
            else
                io.stdout:write(r.Line, "\n")
            end
        end
        io.stdout:write(("run-tests: %s (%s): %d passed, %d failed, %d skipped; %d open against the target behaviour\n"):format(name, client, counts.PASS, counts.FAIL, counts.SKIP, open))
        for _, observation in ipairs(observations or {}) do io.stdout:write("observed: ", observation, "\n") end
        if counts.FAIL > 0 or counts.SKIP > 0 then exitCode = 1 end
    end
end
os.exit(exitCode)