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
local knownInsecure = {_G = {}, GameTooltip = {}, ["GameTooltip.widgetContainer"] = {}} -- [label][key] = true once reported
local pendingKeys, pendingSources = {}, {} -- what a walk found, reported after it; reused by every sweep
local seenErrors = {}
local baselineDone = false

local globalWatch = {"GameTooltip", "UIWidgetManager"}

local function Snapshot()
    local snapshot = {WallClock = date("%Y-%m-%d %H:%M:%S")}
    pcall(function() snapshot.Zone = GetZoneText() end)
    pcall(function() snapshot.WorldMapShown = WorldMapFrame and WorldMapFrame:IsShown() or false end)
    pcall(function() snapshot.AchievementFrameShown = AchievementFrame and AchievementFrame:IsShown() or false end)
    pcall(function() snapshot.TooltipOwner = GameTooltip and GameTooltip:GetOwner() and GameTooltip:GetOwner():GetName() end)
    return snapshot
end

local function Report(label, key, source)
    local known = knownInsecure[label]
    if known[key] then
        return
    end
    known[key] = true

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

-- Runs twice a second for the whole session, so it allocates nothing unless it finds something new: the table is
-- walked in place and a key already reported is not checked again (docs/work/2026-10-18-memory-growth). What a walk
-- finds is reported after it: the report calls functions other addons may hook, and a hook that adds a field to the
-- table during the walk would break the walk.
local function SweepTable(label, t)
    local known = knownInsecure[label]
    local found = 0
    for key in next, t do
        if type(key) == "string" and not known[key] then
            local ok, isSecure, source = pcall(issecurevariable, t, key)
            if ok and isSecure == false then
                found = found + 1
                pendingKeys[found], pendingSources[found] = key, source or false
            end
        end
    end
    for i = 1, found do
        Report(label, pendingKeys[i], pendingSources[i] or nil)
        pendingKeys[i], pendingSources[i] = nil, nil
    end
end

local function Sweep()
    for _, name in next, globalWatch do
        local ok, isSecure, source = pcall(issecurevariable, name)
        if ok and isSecure == false then
            Report("_G", name, source)
        end
    end

    local tooltip = GameTooltip
    if type(tooltip) ~= "table" then
        return
    end
    pcall(SweepTable, "GameTooltip", tooltip) -- each table on its own, so an error in one still lets the other be swept
    local widgetContainer = rawget(tooltip, "widgetContainer")
    if type(widgetContainer) == "table" then
        pcall(SweepTable, "GameTooltip.widgetContainer", widgetContainer)
    end
end

local function RecordError(msg)
    if type(msg) ~= "string" then
        return
    end

    -- Every error of every addon passes here, so the test copies nothing
    if not (strfind(msg, "[Ss][Ee][Cc][Rr][Ee][Tt]") or strfind(msg, "[Tt][Aa][Ii][Nn][Tt][Ee][Dd]")) then
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

-- One sweep as the OnUpdate runs it, and how often it runs; for the memory suite (Tests/Memory.lua)
taintProbe.SweepsPerMinute = 60 / SWEEP_INTERVAL
function taintProbe.SweepOnce()
    pcall(Sweep)
end

function taintProbe.HasData() -- Used by the options panel to decide whether to enable the export button
    local sessions = KrowiAF_DebugTable and KrowiAF_DebugTable.TaintDiagnostics and KrowiAF_DebugTable.TaintDiagnostics.Sessions
    return sessions ~= nil and #sessions > 0
end
