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
--         navigation buttons each tab of the achievement window shows, issue #325)
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
    return setmetatable({ name = name, parent = parent, shown = false, scripts = {}, hooks = {} }, lenient and lenientMt or frameMt)
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
function Frame:SetPoint() end
function Frame:ClearAllPoints() end
function Frame:SetAllPoints() end
function Frame:SetSize(width, height) rawset(self, "_width", width) rawset(self, "_height", height) end
function Frame:SetWidth(width) rawset(self, "_width", width) end
function Frame:SetHeight(height) rawset(self, "_height", height) end
function Frame:GetWidth() return rawget(self, "_width") or 0 end
function Frame:GetHeight() return rawget(self, "_height") or 0 end
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