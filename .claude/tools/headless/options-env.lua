---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Headless options environment: the whole addon loaded the way the game loads it, for the options suite.
--
-- client-env.lua loads only the data files into a namespace it builds by hand. The options need the
-- libraries too (LibStub, Krowi_Util with LibMan and AceLocale, AceDB), which build the addon's namespace
-- themselves, so this module loads every file of the client's TOC instead, with WoW's globals stubbed. The
-- AceConfig family is replaced by fakes that record what the addon registers; AceGUI, the serializers and
-- Tests/ are not loaded. It then runs the ADDON_LOADED steps of Krowi_AchievementFilter.lua that build and
-- register the options. Every parse, load and step error is kept with its file and line in ctx.Errors.
--
--   local optionsEnv = assert(loadfile(dir .. "/options-env.lua"))()
--   local ctx = optionsEnv.Get(root, "Retail")   -- cached per client
--   ctx.addon.Options.OptionsTable, ctx.Registry[appName], ctx.BlizOptions, ctx.Errors

local M = {}
local cache = {}

local function readFile(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

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
    local zero = function() return 0 end
    mt.__add, mt.__sub, mt.__mul, mt.__div, mt.__mod, mt.__pow, mt.__unm = zero, zero, zero, zero, zero, zero, zero
    mt.__lt = function() return false end
    mt.__le = function() return false end
    mt.IsStub = true
    return setmetatable({}, mt)
end

function M.IsStub(v)
    local mt = type(v) == "table" and getmetatable(v)
    return mt and rawget(mt, "IsStub") == true or false
end

local function normalise(p)
    local parts = {}
    for part in p:gmatch("[^/]+") do
        if part == ".." then parts[#parts] = nil elseif part ~= "." then parts[#parts + 1] = part end
    end
    return table.concat(parts, "/")
end

-- Other addons the plugins look for stay absent, so each plugin takes its "not loaded" path
local absentGlobals = { ElvUI = true, GW2_ADDON = true, EllesmereUI = true, ZGV = true, IAT_HasAchievement = true,
    IAT_DisplayAchievement = true, BetterWardrobeCollectionFrame = true, WOW_PROJECT_CAMELOT = true, LIBSTUB_MAJOR = true,
    KROWI_LIBMAN = true, BINDING_HEADER_KrowiAF = true, GAME_LOCALE = true, LibStub = true,
    GetBindingByKey = true } -- C_KeyBindings.GetBindingByKey since 11.2.7 and 5.5.1; the global is gone

local skip = { "^Libs/AceGUI%-3%.0/", "^Libs/AceConfig%-3%.0/", "^Libs/TaintLess/", "^Libs/LibSerialize/", "^Libs/LibDeflate/",
    "^Libs/AceSerializer%-3%.0/", "^Tests/" }

local function New(root, client)
    root = root:gsub("\\", "/"):gsub("/$", "")
    assert(client == "Retail" or client == "Classic", "client must be Retail or Classic")
    local ctx = { Root = root, Client = client, Errors = {}, Registry = {}, BlizOptions = {}, FilesLoaded = 0 }
    local function Fail(where, err) ctx.Errors[#ctx.Errors + 1] = where .. ": " .. tostring(err) end

    local env = {}
    ctx.env = env
    env._G = env
    setmetatable(env, {
        __index = function(t, k)
            local base = rawget(_G, k)
            if base ~= nil then return base end
            if type(k) ~= "string" or absentGlobals[k] then return nil end
            -- the frames the GUI load creates stand in as stubs, so an option's setter can refresh them
            if k:match("^KrowiAF_.+Frame$") then
                local s = Stub(k)
                rawset(t, k, s)
                return s
            end
            if k:match("^KrowiAF_") or k:match("^BINDING_") then return nil end
            if k == "FONT_COLOR_CODE_CLOSE" then return "|r" end
            if k:match("_FONT_COLOR_CODE$") then return "|cffffffff" end
            -- Blizzard's global strings read as their own name; colour objects, tables, numbers and enums stay stubs
            if k:match("^[A-Z][A-Z0-9_]*$") and not (k:match("_COLORS?$") or k:match("^LE_") or k:match("^WOW_PROJECT")
                or k:match("^MAX_") or k:match("^NUM_") or k:match("_ORDER$") or k:match("_LIST$") or k:match("_TABLE$")) then
                rawset(t, k, k)
                return k
            end
            if k:match("^%u") then
                local s = Stub(k)
                rawset(t, k, s)
                return s
            end
            return nil
        end,
    })

    -- WoW's Lua extensions and the API the options touch, implemented for real
    env.print = function() end
    env.CreateFrame = function(_, name)
        local frame = Stub("Frame:" .. tostring(name))
        if type(name) == "string" then rawset(env, name, frame) end
        return frame
    end
    env.tinsert, env.tremove, env.sort = table.insert, table.remove, table.sort
    env.format, env.strupper, env.strlower, env.strlen, env.strsub, env.strfind, env.strmatch, env.gsub, env.strrep, env.strbyte, env.strchar, env.strrev =
        string.format, string.upper, string.lower, string.len, string.sub, string.find, string.match, string.gsub, string.rep, string.byte, string.char, string.reverse
    env.gmatch = string.gmatch
    env.floor, env.ceil, env.abs, env.max, env.min, env.sqrt, env.mod = math.floor, math.ceil, math.abs, math.max, math.min, math.sqrt, math.fmod
    env.random = math.random
    env.wipe = function(t) for k in pairs(t) do t[k] = nil end return t end
    env.strtrim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
    local function splitPlain(sep, s)
        local out, start = {}, 1
        while true do
            local i, j = string.find(s, sep, start, true)
            if not i then out[#out + 1] = s:sub(start) break end
            out[#out + 1] = s:sub(start, i - 1)
            start = j + 1
        end
        return out
    end
    env.strsplit = function(sep, s) return unpack(splitPlain(sep, s)) end
    env.strsplittable = function(sep, s) return splitPlain(sep, s) end
    env.strjoin = function(sep, ...) return table.concat({ ... }, sep) end
    env.strconcat = function(...) return table.concat({ ... }) end
    env.tostringall = function(...) local r = {} for i = 1, select("#", ...) do r[i] = tostring((select(i, ...))) end return unpack(r, 1, select("#", ...)) end
    env.tContains = function(t, v) for _, x in pairs(t) do if x == v then return true end end return false end
    env.tIndexOf = function(t, v) for i, x in ipairs(t) do if x == v then return i end end end
    env.tDeleteItem = function(t, v) local i = 1 while t[i] do if t[i] == v then table.remove(t, i) else i = i + 1 end end end
    env.tInvert = function(t) local r = {} for k, v in pairs(t) do r[v] = k end return r end
    env.GetKeysArray = function(t) local r = {} for k in pairs(t) do r[#r + 1] = k end return r end
    env.CopyTable = function(t) local r = {} for k, v in pairs(t) do r[k] = type(v) == "table" and env.CopyTable(v) or v end return r end
    env.Mixin = function(o, ...) for i = 1, select("#", ...) do local m = select(i, ...) if type(m) == "table" then for k, v in pairs(m) do o[k] = v end end end return o end
    env.CreateFromMixins = function(...) return env.Mixin({}, ...) end
    env.securecall = function(f, ...) if type(f) == "function" then return f(...) end end
    env.securecallfunction = env.securecall
    env.hooksecurefunc = function() end
    env.issecurevariable = function() return true end
    env.issecretvalue = function() return false end
    env.canaccesstable = function() return true end
    env.canaccessvalue = function() return true end
    env.geterrorhandler = function() return function(e) Fail("errorhandler", e) end end
    env.seterrorhandler = function() end
    env.GetLocale = function() return "enUS" end
    env.UnitName = function() return "Player" end
    env.GetRealmName = function() return "Realm" end
    env.GetNormalizedRealmName = function() return "Realm" end
    env.UnitClass = function() return "Warrior", "WARRIOR", 1 end
    env.UnitRace = function() return "Human", "Human", 1 end
    env.UnitFactionGroup = function() return "Alliance", "Alliance" end
    env.UnitLevel = function() return 80 end
    env.UnitGUID = function() return "Player-1-00000001" end
    env.GetCurrentRegion = function() return 3 end
    env.GetCurrentRegionName = function() return "EU" end
    env.InCombatLockdown = function() return false end
    env.IsLoggedIn = function() return false end
    -- The key bindings as the game loads them (docs/work/197-reopen-where-left-off, measured in game): none at all while
    -- the files load and ADDON_LOADED runs (binding set 0), the player's own set before PLAYER_LOGIN (see the end of New).
    -- A key holds one command, so binding it takes it off any other. SetBinding returns true, as the game does when it
    -- takes the binding (Blizzard_Keybindings.lua:167)
    ctx.Bindings, ctx.BindingSet = {}, 0
    env.GetBindingKey = function(command) local b = ctx.Bindings[command] if b then return b[1], b[2] end end
    env.SetBinding = function(key, command, index)
        if not command then return true end
        for other, keys in pairs(ctx.Bindings) do
            if other ~= command then
                for i = 1, 2 do if keys[i] == key then keys[i] = nil end end
            end
        end
        ctx.Bindings[command] = ctx.Bindings[command] or {}
        ctx.Bindings[command][index or 1] = key
        return true
    end
    local C_KeyBindings = Stub("C_KeyBindings")
    rawset(C_KeyBindings, "GetBindingByKey", function(key)
        for command, keys in pairs(ctx.Bindings) do
            if keys[1] == key or keys[2] == key then return command end
        end
        return ""
    end)
    env.C_KeyBindings = C_KeyBindings
    local Enum = Stub("Enum")
    rawset(Enum, "BindingSet", { Default = 0, Account = 1, Character = 2 })
    env.Enum = Enum
    env.GetCurrentBindingSet = function() return ctx.BindingSet end
    env.SaveBindings = function() end
    env.GetTime = function() return 1000 end
    env.GetServerTime = function() return os.time({ year = 2026, month = 10, day = 25, hour = 21, min = 30, sec = 0 }) end
    env.debugprofilestop = function() return 0 end
    local fixedNow = os.time({ year = 2026, month = 10, day = 25, hour = 21, min = 30, sec = 0 })
    env.time = function(t) if t then return os.time(t) end return fixedNow end
    env.date = function(fmt, t)
        fmt = (fmt or "%c"):gsub("%%R", "%%H:%%M")
        if fmt:find("%%[^aAbBcdHIjmMpSUwWxXyYZ%%]") then return fmt end
        return os.date(fmt, t or fixedNow)
    end
    -- Achievement lookups some option texts name an achievement or criterion with
    env.GetAchievementInfo = function(id) return id, "Achievement " .. tostring(id) end
    env.GetAchievementCriteriaInfo = function(id, index) return "Criterion " .. tostring(id) .. "/" .. tostring(index) end
    env.GetCategoryInfo = function(id) return "Category " .. tostring(id) end
    env.GetBuildInfo = function()
        if client == "Retail" then return "12.1.5", "65000", "Oct 1 2026", 120105 end
        return "5.5.4", "65000", "Oct 1 2026", 50504
    end
    env.WOW_PROJECT_MAINLINE, env.WOW_PROJECT_CLASSIC, env.WOW_PROJECT_BURNING_CRUSADE_CLASSIC = 1, 2, 5
    env.WOW_PROJECT_WRATH_CLASSIC, env.WOW_PROJECT_CATACLYSM_CLASSIC, env.WOW_PROJECT_MISTS_CLASSIC = 11, 14, 19
    env.WOW_PROJECT_ID = client == "Retail" and 1 or 19
    env.CALENDAR_WEEKDAY_NAMES = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
    env.CALENDAR_FULLDATE_MONTH_NAMES = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
    env.CALENDAR_FIRST_WEEKDAY = 1
    local covenants = { "Kyrian", "Venthyr", "Night Fae", "Necrolord" }
    local C_Covenants = Stub("C_Covenants")
    rawset(C_Covenants, "GetCovenantData", function(id) return { name = covenants[id] or ("Covenant " .. tostring(id)) } end)
    env.C_Covenants = C_Covenants
    env.EnumUtil = {
        MakeEnum = function(...) local e = {} for i = 1, select("#", ...) do e[(select(i, ...))] = i end return e end,
        GenerateNameTranslation = function(e) local names = {} for k, v in pairs(e) do names[v] = k end return function(v) return names[v] end end,
    }

    local toc = assert(readFile(root .. "/Krowi_AchievementFilter.toc"), "Krowi_AchievementFilter.toc not found")
    local tocMeta = {}
    for line in toc:gmatch("[^\r\n]+") do
        local k, v = line:match("^##%s*([^:]+):%s*(.-)%s*$")
        if k then tocMeta[k] = v end
    end
    local C_AddOns = Stub("C_AddOns")
    rawset(C_AddOns, "GetAddOnMetadata", function(name, field) if name == "Krowi_AchievementFilter" then return tocMeta[field] end end)
    rawset(C_AddOns, "IsAddOnLoaded", function(name) return name == "Krowi_AchievementFilter" end)
    rawset(C_AddOns, "GetAddOnEnableState", function() return 0 end)
    env.C_AddOns = C_AddOns
    env.GetAddOnMetadata = C_AddOns.GetAddOnMetadata
    env.IsAddOnLoaded = C_AddOns.IsAddOnLoaded

    -- The AceConfig family, faked: registrations are recorded, nothing is drawn
    local function InstallFakes(LibStub)
        local function fallback(lib, name)
            return setmetatable(lib, { __index = function(t, k) local s = Stub(name .. "." .. tostring(k)) rawset(t, k, s) return s end })
        end
        local aceConfig = LibStub:NewLibrary("AceConfig-3.0", 999999)
        aceConfig.RegisterOptionsTable = function(_, appName, options) ctx.Registry[appName] = options end
        fallback(aceConfig, "AceConfig-3.0")
        local aceReg = LibStub:NewLibrary("AceConfigRegistry-3.0", 999999)
        aceReg.RegisterOptionsTable = aceConfig.RegisterOptionsTable
        aceReg.GetOptionsTable = function(_, appName, uiType, uiName)
            local t = ctx.Registry[appName]
            if type(t) == "function" then t = t(uiType or "dialog", uiName or "x", appName) end
            return t
        end
        aceReg.NotifyChange = function() end
        fallback(aceReg, "AceConfigRegistry-3.0")
        local aceDialog = LibStub:NewLibrary("AceConfigDialog-3.0", 999999)
        aceDialog.BlizOptionsIDMap = {}
        aceDialog.BlizOptions = {}
        aceDialog.AddToBlizOptions = function(_, appName, name, parent)
            ctx.BlizOptions[#ctx.BlizOptions + 1] = { AppName = appName, Name = name, Parent = parent }
            aceDialog.BlizOptions[appName] = aceDialog.BlizOptions[appName] or {}
            aceDialog.BlizOptions[appName][appName] = Stub("BlizOptionsGroup." .. appName)
            return Stub("BlizPanel." .. appName), appName
        end
        fallback(aceDialog, "AceConfigDialog-3.0")
    end
    local stubLibs = {}
    local function PatchLibStub()
        local LS = rawget(env, "LibStub")
        if not LS or LS.__patched then return end
        LS.__patched = true
        function LS:GetLibrary(major)
            if self.libs[major] then return self.libs[major], self.minors[major] end
            stubLibs[major] = stubLibs[major] or Stub("Lib:" .. tostring(major))
            return stubLibs[major]
        end
        getmetatable(LS).__call = function(self, major, silent) return self:GetLibrary(major, silent) end
        InstallFakes(LS)
    end

    -- Every file of the client's TOC in load order, honouring [AllowLoadGameType]
    local gameType = client == "Retail" and "mainline" or "mists"
    local files = {}
    local function addFromXml(rel)
        local text = readFile(root .. "/" .. rel)
        if not text then Fail(rel, "missing XML file") return end
        local xml = text:gsub("<!%-%-.-%-%->", "")
        local dir = rel:match("^(.*)/") or ""
        for tag, file in xml:gmatch("<(%a+)%s+file%s*=%s*[\"']([^\"']+)[\"']") do
            local child = normalise((dir ~= "" and dir .. "/" or "") .. file:gsub("\\", "/"))
            if tag == "Include" or child:match("%.xml$") then addFromXml(child) elseif tag == "Script" then files[#files + 1] = child end
        end
    end
    for line in toc:gmatch("[^\r\n]+") do
        if not line:match("^##") then
            local entry = line:gsub("#.*$", "")
            local gate = entry:match("%[AllowLoadGameType%s+([^%]]+)%]")
            entry = env.strtrim((entry:gsub("%[.-%]", "")))
            local allowed = true
            if gate then
                allowed = false
                for g in gate:gmatch("[%a_]+") do if g == gameType then allowed = true end end
            end
            if entry ~= "" and allowed then
                entry = normalise(entry:gsub("\\", "/"))
                if entry:match("%.xml$") then addFromXml(entry) else files[#files + 1] = entry end
            end
        end
    end
    local function skipped(rel)
        for _, p in ipairs(skip) do if rel:match(p) then return true end end
        if rel:match("Localization/") then
            local base = rel:match("([^/]+)%.lua$")
            return not (base:match("^enUS") or base == "Shared")
        end
        return false
    end

    local addon = {}
    ctx.addon = addon
    for _, rel in ipairs(files) do
        if not skipped(rel) then
            local text = readFile(root .. "/" .. rel)
            if not text then
                Fail(rel, "missing file")
            else
                local chunk, err = loadstring(text, "@" .. rel)
                if not chunk then
                    Fail(rel, err)
                else
                    setfenv(chunk, env)
                    local ok, runErr = pcall(chunk, "Krowi_AchievementFilter", addon)
                    if ok then ctx.FilesLoaded = ctx.FilesLoaded + 1 else Fail(rel, runErr) end
                end
                if rel:match("LibStub%.lua$") then PatchLibStub() end
            end
        end
    end

    -- The ADDON_LOADED steps of Krowi_AchievementFilter.lua that build and register the options, in order
    local KrowiAF = rawget(env, "KrowiAF")
    ctx.KrowiAF = KrowiAF
    local function Step(label, fn)
        local ok, err = pcall(fn)
        if not ok then Fail("step " .. label, err) end
        return ok
    end
    if addon.Data and addon.Data.EventScheduler then addon.Data.EventScheduler.GetName = function() return nil end end
    Step("Diagnostics.Load", function() addon.Diagnostics.Load() end)
    Step("LoadTabs", function() KrowiAF.LoadTabs() end)
    Step("SpecialCategories.InjectDynamicOptions", function() addon.SpecialCategories.InjectDynamicOptions() end)
    Step("InjectEventDataDynamicOptions", function() KrowiAF.InjectEventDataDynamicOptions() end)
    Step("InjectTabDataDynamicOptions", function() KrowiAF.InjectTabDataDynamicOptions() end)
    Step("AchievementFrameHeader:InjectDynamicOptions", function() addon.Gui.AchievementFrameHeader:InjectDynamicOptions() end)
    Step("Filters:InjectDefaults", function() addon.Filters:InjectDefaults() end)
    Step("PluginsApi:InjectPluginOptions", function() KrowiAF.PluginsApi:InjectPluginOptions() end)
    Step("Options:Load", function() addon.Options:Load(true) end)

    -- What PLAYER_LOGIN builds and some setters refresh: the data load, driven the way client-env.lua's RunPipeline
    -- drives Data.lua:LoadOnPlayerLogin, and the world map button the GUI load makes (a stub here)
    local data = addon.Data
    Step("CreateBuildVersions", function() KrowiAF.CreateBuildVersions() end)
    for _, fn in ipairs({ "RegisterAchievementDataTasks", "RegisterCustomCriteriaDataTasks", "RegisterCategoryDataTasks", "RegisterEventDataTasks",
        "RegisterTooltipDataTasks", "RegisterPetBattleLinkDataTasks", "RegisterTransmogSetDataTasks", "RegisterGuideDataTasks", "RegisterZoneDataTasks" }) do
        if type(data[fn]) == "function" then Step(fn, function() data[fn](data) end) end
    end
    local groups = data.TasksGroups or {}
    while #groups > 0 do
        local tasks = table.remove(groups)
        for _, task in ipairs(tasks) do
            local ok, err = pcall(function()
                if type(task) == "function" then task() elseif type(task) == "table" then task[1](unpack(task, 2, #task)) end
            end)
            if not ok then Fail("data task", err) end
        end
    end
    if addon.Gui and addon.Gui.WorldMapButton and not addon.Gui.WorldMapButton.Refresh then
        addon.Gui.WorldMapButton = Stub("addon.Gui.WorldMapButton")
    end

    -- PLAYER_LOGIN on a new install: the account's key bindings are loaded by then, with Blizzard's Toggle Achievements on
    -- Y, and the addon moves Y (Krowi_AchievementFilter.lua LoadPlayerLogin). What that left is the options suite's
    -- y-on-new-install; then the bindings go back to the empty account set the other scenarios were written against
    ctx.BindingSet, ctx.Bindings = 1, { TOGGLEACHIEVEMENT = { "Y" } }
    if addon.Gui and type(addon.Gui.MoveYToMicroButtonTab) == "function" then
        Step("MoveYToMicroButtonTab", function() addon.Gui:MoveYToMicroButtonTab() end)
    end
    local savedData = rawget(env, "KrowiAF_SavedData")
    local setUp = savedData and savedData.FirstTimeSetUp
    ctx.NewInstall = { Y = C_KeyBindings.GetBindingByKey("Y"), Pending = setUp and setUp.YBindingPending }
    ctx.Bindings = {}
    return ctx
end

function M.Get(root, client)
    local key = root .. "|" .. client
    if not cache[key] then cache[key] = New(root, client) end
    return cache[key]
end

return M