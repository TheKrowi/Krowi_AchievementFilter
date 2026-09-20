---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Shared headless client environment.
--
-- Builds one sandboxed Lua 5.1 global environment per client family with the WoW globals the addon
-- touches at load time stubbed, loads every Api/, Objects/, Data/Data.lua and DataAddons/ file in
-- the order the .toc and the nested Files.xml manifests give, and drives the real task groups the
-- way Data.lua:LoadOnPlayerLogin does.
--
-- load-data.lua and snapshot-categories.lua both build on this, so the stub surface lives in one
-- place and cannot drift between them. Extend the stubs in New() when a new WoW global is used at
-- load time.
--
--   local clientEnv = assert(loadfile(dir .. "/client-env.lua"))()
--   local ctx = clientEnv.New(root, "Retail")
--   ctx:LoadFiles{ ParseError = f, RuntimeError = f, BeforeFile = f, AfterFile = f }
--   ctx:RunPipeline{ StepError = f, BeforeGroup = f, TaskError = f }
--   -- ctx.addon.Data.Categories is now populated

local M = {}

-------------------------------------------------------------------------------------------------
-- File reading, shared across clients (the tree does not change between the two runs)
-------------------------------------------------------------------------------------------------
local fileCache = {}

local function readFile(path)
    local f = assert(io.open(path, "rb"))
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

function M.NormaliseRoot(root)
    return (root:gsub("\\", "/"):gsub("/$", ""))
end

function M.FileText(root, rel)
    local key = root .. "/" .. rel
    if not fileCache[key] then fileCache[key] = readFile(key) end
    return fileCache[key]
end

-- first line in rel where the integer id appears as a whole number
function M.FindIdLine(root, rel, id)
    local n = 0
    for line in M.FileText(root, rel):gmatch("[^\n]*\n?") do
        n = n + 1
        if line:find("%f[%d]" .. id .. "%f[%D]") then return n end
        if line == "" then break end
    end
    return nil
end

-------------------------------------------------------------------------------------------------
-- One client, one sandboxed global environment
-------------------------------------------------------------------------------------------------
local Context = {}
Context.__index = Context

function M.New(root, client)
    root = M.NormaliseRoot(root)
    assert(client == "Retail" or client == "Classic", "client must be Retail or Classic")

    local self = setmetatable({
        Root = root,
        Client = client,
        Prefix = "[" .. client .. "] ",
        StubbedGlobals = {},
        FilesLoaded = 0,
        TasksRun = 0,
        CurrentFile = "?",
        CurrentGroup = nil,
    }, Context)

    local gameType = client == "Retail" and "mainline" or "mists"

    -- --- stubs -------------------------------------------------------------------------------
    local stubbedGlobals = self.StubbedGlobals
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
        return setmetatable({}, mt)
    end
    self.Stub = Stub

    local env = {}
    self.env = env
    env._G = env
    -- WoW's Lua extensions used at load time, implemented for real
    env.tinsert, env.tremove, env.sort = table.insert, table.remove, table.sort
    env.format, env.strupper, env.strlower, env.strlen, env.strsub, env.strfind, env.strmatch, env.gsub, env.strrep = string.format, string.upper, string.lower, string.len, string.sub, string.find, string.match, string.gsub, string.rep
    env.floor, env.ceil, env.abs, env.max, env.min = math.floor, math.ceil, math.abs, math.max, math.min
    env.wipe = function(t) for k in pairs(t) do t[k] = nil end return t end
    env.strtrim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
    env.strsplit = function(sep, s) local out = {} for piece in (s .. sep):gmatch("(.-)" .. sep:gsub("%p", "%%%0")) do out[#out + 1] = piece end return unpack(out) end
    env.strjoin = function(sep, ...) return table.concat({ ... }, sep) end
    env.tContains = function(t, v) for _, x in pairs(t) do if x == v then return true end end return false end
    env.tInvert = function(t) local r = {} for k, v in pairs(t) do r[v] = k end return r end
    env.CopyTable = function(t) local r = {} for k, v in pairs(t) do r[k] = type(v) == "table" and env.CopyTable(v) or v end return r end
    env.Mixin = function(o, ...) for i = 1, select("#", ...) do for k, v in pairs((select(i, ...))) do o[k] = v end end return o end
    env.CreateFromMixins = function(...) return env.Mixin({}, ...) end
    env.securecall = function(f, ...) return f(...) end
    env.hooksecurefunc = function() end
    env.issecurevariable = function() return true end
    env.GetLocale = function() return "enUS" end
    env.GetDifficultyInfo = function(id) return "Difficulty " .. tostring(id), "raid", false, false, false, false, id end
    env.GetTitleName = function(id) return "Title " .. tostring(id) end
    env.UnitName = function() return "Player" end
    env.GetBuildInfo = function() return client == "Retail" and "12.1.0" or "5.5.3", "69587", "Sep 4 2026", client == "Retail" and 120100 or 50503 end
    env.EnumUtil = {
        MakeEnum = function(...)
            local e = {}
            for i = 1, select("#", ...) do e[(select(i, ...))] = i end
            return e
        end,
        GenerateNameTranslation = function(e)
            local names = {}
            for k, v in pairs(e) do names[v] = k end
            return function(v) return names[v] end
        end,
    }
    env.WOW_PROJECT_MAINLINE, env.WOW_PROJECT_CLASSIC, env.WOW_PROJECT_MISTS_CLASSIC = 1, 2, 19
    env.WOW_PROJECT_ID = client == "Retail" and 1 or 19

    -- Only names that look like WoW API surface are stubbed; anything else stays nil so typos surface
    local knownGlobals = { CreateFrame = true, LibStub = true, GameTooltip = true, UIParent = true, Enum = true, SlashCmdList = true,
        GetAchievementInfo = true, GetAchievementNumCriteria = true, GetAchievementCriteriaInfo = true, GetAchievementCriteriaInfoByID = true,
        GetCategoryInfo = true, GetCategoryList = true, UnitFactionGroup = true, UnitLevel = true, UnitGUID = true, GetRealmName = true,
        IsAddOnLoaded = true, GetAddOnMetadata = true, GetTime = true, GetServerTime = true, InCombatLockdown = true, GetCurrentArenaSeason = true,
        GetLFGDungeonInfo = true, GetRealZoneText = true, EJ_GetInstanceInfo = true, GetItemInfo = true, GetSpellInfo = true, GetCurrentRegion = true,
        ScrollBoxConstants = true, MenuUtil = true, MenuResponse = true, Settings = true, EventRegistry = true, ChatFrame1 = true, DEFAULT_CHAT_FRAME = true,
        TooltipDataProcessor = true, GameTooltip_AddBlankLineToTooltip = true, GameTooltip_AddNormalLine = true, GameTooltip_AddHighlightLine = true,
        GetCVar = true, SetCVar = true, GetFrameRate = true, debugprofilestop = true, CreateColor = true, CreateColorFromHexString = true,
        WrapTextInColorCode = true, GetAchievementCategory = true, GetPreviousAchievement = true, GetNextAchievement = true, GetAchievementLink = true,
        time = true, date = true, GetCurrentBindingSet = true, GetBindingKey = true, SetBinding = true, SaveBindings = true }
    setmetatable(env, {
        __index = function(t, k)
            local base = rawget(_G, k)
            if base ~= nil then return base end
            if type(k) ~= "string" then return nil end
            if knownGlobals[k] or k:match("^C_%u") or k:match("^LE_") or k:match("^KrowiAF_") or k:match("^[A-Z][A-Z0-9_]+$") or k:match("^Blizzard_") then
                local s = Stub(k)
                rawset(t, k, s)
                stubbedGlobals[#stubbedGlobals + 1] = k
                return s
            end
            return nil
        end,
    })

    -- --- the private addon namespace ----------------------------------------------------------
    local addon = {}
    self.addon = addon
    addon.L = setmetatable({}, { __index = function(_, k) return k end })
    addon.Metadata = { Title = "Krowi's Achievement Filter", Version = "0.0", Prefix = "KrowiAF" }
    addon.Diagnostics = { TraceEnabled = function() return false end, DebugEnabled = function() return false end, Trace = function() end, Debug = function() end }
    addon.Util = {
        IsMainline = client == "Retail",
        IsClassicWithAchievements = client == "Classic",
        IsMistsClassic = client == "Classic",
        IsWrathClassic = false,
        IsCataClassic = false,
        IsTable = function(v) return type(v) == "table" end,
        IsFunction = function(v) return type(v) == "function" end,
        IsString = function(v) return type(v) == "string" end,
        IsNumber = function(v) return type(v) == "number" end,
        IsBoolean = function(v) return type(v) == "boolean" end,
        TableRemoveByValue = function(t, value)
            for k, v in pairs(t) do
                if v == value then table.remove(t, k) return true end
            end
            return false
        end,
        Colors = Stub("addon.Util.Colors"),
    }
    -- Deterministic and id-encoding on purpose: a snapshot records ids, never locale-dependent names
    for _, fn in ipairs({ "GetMapName", "GetInstanceInfoName", "GetLFGDungeonInfo", "GetAreaPoiNameName", "GetAchievmentName", "GetCovenantName" }) do
        addon[fn] = function(id) return fn:gsub("^Get", "") .. " " .. tostring(id) end
    end
    setmetatable(addon, { __index = function(t, k) local s = Stub("addon." .. tostring(k)); rawset(t, k, s); return s end })
    self:EnsureDataTables()

    -- --- file list in game load order, honouring [AllowLoadGameType] gates -------------------
    local files = {}
    local function addFromXml(rel)
        local xml = M.FileText(root, rel):gsub("<!%-%-.-%-%->", "")
        local dir = rel:match("^(.*)/") or ""
        for tag, file in xml:gmatch("<(%a+)%s+file%s*=%s*[\"']([^\"']+)[\"']") do
            local child = (dir ~= "" and dir .. "/" or "") .. file:gsub("\\", "/")
            if tag == "Include" or child:match("%.xml$") then
                addFromXml(child)
            elseif tag == "Script" then
                files[#files + 1] = child
            end
        end
    end
    for line in M.FileText(root, "Krowi_AchievementFilter.toc"):gmatch("[^\r\n]+") do
        local entry = line:gsub("#.*$", "")
        local gate = entry:match("%[AllowLoadGameType%s+([^%]]+)%]")
        entry = env.strtrim((entry:gsub("%[.-%]", "")))
        local allowed = true
        if gate then
            allowed = false
            for g in gate:gmatch("[%a_]+") do if g == gameType then allowed = true end end
        end
        if entry ~= "" and allowed then
            entry = entry:gsub("\\", "/")
            if entry:match("%.xml$") then addFromXml(entry) else files[#files + 1] = entry end
        end
    end
    local selected = {}
    for _, rel in ipairs(files) do
        if rel:match("^Api/") or rel:match("^Objects/") or rel == "Data/Data.lua" or rel:match("^DataAddons/") then
            selected[#selected + 1] = rel
        end
    end
    self.Selected = selected

    return self
end

-- Data.lua replaces addon.Data wholesale, so the registry tables are re-created after it loads
function Context:EnsureDataTables()
    local addon = self.addon
    addon.Data = addon.Data or {}
    for _, name in ipairs({ "AchievementData", "BuildVersionData", "CategoryData", "CustomCriteriaData", "EventData", "PetBattleLinkData", "TabData", "TooltipData", "TransmogSetData", "ZoneData" }) do
        addon.Data[name] = addon.Data[name] or {}
    end
end

function Context:FileText(rel)
    return M.FileText(self.Root, rel)
end

function Context:FindIdLine(rel, id)
    return M.FindIdLine(self.Root, rel, id)
end

-- chunks are named "=#<index>" so a Lua error names a number; map it back to the real path
function Context:RealPath(message)
    local selected = self.Selected
    return (message:gsub("#(%d+):", function(i) return (selected[tonumber(i)] or ("#" .. i)) .. ":" end))
end

function Context:KrowiAF()
    return rawget(self.env, "KrowiAF")
end

-- Hooks: BeforeFile(rel, index), AfterFile(rel, index), ParseError(rel, err), RuntimeError(rel, { msg, trace })
function Context:LoadFiles(hooks)
    hooks = hooks or {}
    for index, rel in ipairs(self.Selected) do
        self.CurrentFile = rel
        if hooks.BeforeFile then hooks.BeforeFile(rel, index) end
        local chunk, err = loadstring(self:FileText(rel), "=#" .. index)
        if not chunk then
            if hooks.ParseError then hooks.ParseError(rel, err) end
        else
            setfenv(chunk, self.env)
            local ok, runErr = xpcall(function() return chunk("Krowi_AchievementFilter", self.addon) end, function(e) return { msg = e, trace = debug.traceback("", 2) } end)
            if ok then
                self.FilesLoaded = self.FilesLoaded + 1
                if rel == "Data/Data.lua" then self:EnsureDataTables() end
                if hooks.AfterFile then hooks.AfterFile(rel, index) end
            elseif hooks.RuntimeError then
                hooks.RuntimeError(rel, runErr)
            end
        end
    end
end

-- Drives the pipeline the way Data.lua:LoadOnPlayerLogin does.
-- Hooks: StepError(label, file, err), BeforeGroup(tasks), TaskError(tasks, err)
-- Every task is pcall'ed, so this is strictly more forgiving than the game: a task that would halt
-- the real load is merely reported here.
function Context:RunPipeline(hooks)
    hooks = hooks or {}
    local KrowiAF = self:KrowiAF()
    local data = self.addon.Data

    local function runStep(label, file, fn, ...)
        local ok, err = pcall(fn, ...)
        if not ok and hooks.StepError then hooks.StepError(label, file, err) end
        return ok
    end

    runStep("LoadTabs", "Api/TabDataApi.lua", KrowiAF.LoadTabs)
    runStep("CreateBuildVersions", "Api/BuildVersionDataApi.lua", KrowiAF.CreateBuildVersions)
    for _, fn in ipairs({ "RegisterAchievementDataTasks", "RegisterCustomCriteriaDataTasks", "RegisterCategoryDataTasks", "RegisterEventDataTasks",
        "RegisterTooltipDataTasks", "RegisterPetBattleLinkDataTasks", "RegisterTransmogSetDataTasks", "RegisterZoneDataTasks" }) do
        if type(data[fn]) == "function" then runStep(fn, "Data/Data.lua", data[fn], data) end
    end

    local groups = data.TasksGroups or {}
    while #groups > 0 do
        local tasks = table.remove(groups)
        self.CurrentGroup = tasks
        if hooks.BeforeGroup then hooks.BeforeGroup(tasks) end
        for _, task in ipairs(tasks) do
            self.TasksRun = self.TasksRun + 1
            local ok, err = pcall(function()
                if type(task) == "function" then task() elseif type(task) == "table" then task[1](unpack(task, 2, #task)) end
            end)
            if not ok and hooks.TaskError then hooks.TaskError(tasks, err) end
        end
    end
end

function Context:SortedStubbedGlobals()
    local out = {}
    for _, name in ipairs(self.StubbedGlobals) do out[#out + 1] = name end
    table.sort(out)
    return out
end

return M