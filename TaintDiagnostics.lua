local _, addon = ...
addon.Diagnostics.TaintProbe = {}
local taintProbe = addon.Diagnostics.TaintProbe

-- Built-in, always-on-by-default diagnostic for Issue #300 (GameTooltip's widget-container
-- taint bug: "attempt to compare/perform arithmetic on a secret number value, execution tainted
-- by 'Krowi_AchievementFilter'"). Ported from the standalone raw/KAF_TaintProbe addon so every
-- affected user already has this data in their own KrowiAF_DebugTable SavedVariable, without
-- needing to install a separate addon.
--
-- Design constraint (same as the standalone probe): this module must NEVER hooksecurefunc,
-- HookScript, SetScript on a Blizzard frame, or write into a Blizzard table - only pcall +
-- issecurevariable reads and error handler chaining - so it structurally cannot cause what it
-- measures.

local SWEEP_INTERVAL = 0.5
local MAX_DETECTIONS = 30
local MAX_ERRORS = 15
local MAX_SESSIONS = 5

local session, sweepElapsed = {Baseline = {}, Detections = {}, Errors = {}}, 0
local knownInsecure = {}
local seenErrors = {}
local baselineDone = false

local globalWatch = {"GameTooltip", "UIWidgetManager"}

local function GetTableWatch()
    local tooltip = GameTooltip
    local ok, widgetContainer = pcall(function() return tooltip and tooltip.widgetContainer end)
    return {
        {Label = "GameTooltip", Table = tooltip},
        {Label = "GameTooltip.widgetContainer", Table = ok and widgetContainer or nil}
    }
end

local function Snapshot()
    local snapshot = {WallClock = date("%Y-%m-%d %H:%M:%S")}
    pcall(function() snapshot.Zone = GetZoneText() end)
    pcall(function() snapshot.WorldMapShown = WorldMapFrame and WorldMapFrame:IsShown() or false end)
    pcall(function() snapshot.AchievementFrameShown = AchievementFrame and AchievementFrame:IsShown() or false end)
    pcall(function() snapshot.TooltipOwner = GameTooltip and GameTooltip:GetOwner() and GameTooltip:GetOwner():GetName() end)
    return snapshot
end

local function Report(label, key, source)
    local id = label .. "||" .. tostring(key)
    if knownInsecure[id] then
        return
    end
    knownInsecure[id] = true

    if not baselineDone then -- Already tainted before our own sweep ever ran - not caused this session
        tinsert(session.Baseline, {Target = label, Key = key, TaintedBy = source or "<unknown>"})
        return
    end

    if #session.Detections >= MAX_DETECTIONS then
        return
    end

    local entry = Snapshot()
    entry.Target = label
    entry.Key = key
    entry.TaintedBy = source or "<unknown>"
    tinsert(session.Detections, entry)
end

local function Sweep()
    for _, name in next, globalWatch do
        local ok, isSecure, source = pcall(issecurevariable, name)
        if ok and isSecure == false then
            Report("_G", name, source)
        end
    end

    for _, target in next, GetTableWatch() do
        if type(target.Table) == "table" then
            local ok, keys = pcall(function()
                local list = {}
                for key in next, target.Table do
                    if type(key) == "string" then
                        tinsert(list, key)
                    end
                end
                return list
            end)
            if ok then
                for _, key in next, keys do
                    local ok2, isSecure, source = pcall(issecurevariable, target.Table, key)
                    if ok2 and isSecure == false then
                        Report(target.Label, key, source)
                    end
                end
            end
        end
    end
end

local function RecordError(msg)
    if type(msg) ~= "string" then
        return
    end

    local lowered = msg:lower()
    if not (lowered:find("secret", 1, true) or lowered:find("tainted", 1, true)) then
        return
    end

    local key = msg:match("^[^\n]*") or msg
    if seenErrors[key] then
        seenErrors[key].Count = seenErrors[key].Count + 1
        return
    end

    if #session.Errors >= MAX_ERRORS then
        return
    end

    local entry = Snapshot()
    entry.Message = msg
    entry.Stack = debugstack(3, 25, 25)
    entry.Count = 1
    seenErrors[key] = entry
    tinsert(session.Errors, entry)
end

local function InstallErrorHandler()
    local previous = geterrorhandler()
    seterrorhandler(function(...)
        pcall(RecordError, ...)
        if previous then
            return previous(...)
        end
    end)
end

local function CollectLoadedAddons()
    local loaded = {}
    pcall(function()
        for i = 1, C_AddOns.GetNumAddOns() do
            if C_AddOns.IsAddOnLoaded(i) then
                local name = C_AddOns.GetAddOnInfo(i)
                tinsert(loaded, name .. " (" .. tostring(C_AddOns.GetAddOnMetadata(name, "Version")) .. ")")
            end
        end
    end)
    return loaded
end

local function StartSession()
    KrowiAF_DebugTable = KrowiAF_DebugTable or {}
    KrowiAF_DebugTable.TaintDiagnostics = KrowiAF_DebugTable.TaintDiagnostics or {}
    local db = KrowiAF_DebugTable.TaintDiagnostics
    db.Sessions = db.Sessions or {}

    local version, build = GetBuildInfo()
    session = {
        StartedAt = date("%Y-%m-%d %H:%M:%S"),
        Client = tostring(version) .. "." .. tostring(build),
        Character = (UnitName("player") or "?") .. "-" .. (GetRealmName() or "?"),
        Addons = CollectLoadedAddons(),
        Baseline = {},
        Detections = {},
        Errors = {}
    }

    tinsert(db.Sessions, session)
    while #db.Sessions > MAX_SESSIONS do
        tremove(db.Sessions, 1)
    end
end

local function OnUpdate(_, elapsed)
    sweepElapsed = sweepElapsed + elapsed
    if sweepElapsed >= SWEEP_INTERVAL then
        sweepElapsed = 0
        pcall(Sweep)
    end
end

function taintProbe.Load()
    if not addon.Options.db.profile.EnableTaintDiagnostics then
        return
    end

    StartSession()
    pcall(Sweep)
    baselineDone = true
    InstallErrorHandler()

    local frame = CreateFrame("Frame")
    frame:SetScript("OnUpdate", OnUpdate)
end

function taintProbe.HasData() -- Used by the options panel to decide whether to enable the export button
    local sessions = KrowiAF_DebugTable and KrowiAF_DebugTable.TaintDiagnostics and KrowiAF_DebugTable.TaintDiagnostics.Sessions
    return sessions ~= nil and #sessions > 0
end
