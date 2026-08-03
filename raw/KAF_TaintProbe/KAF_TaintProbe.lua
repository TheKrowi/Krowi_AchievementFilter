-- KAF Taint Probe
-- Read-only diagnostic for Krowi_AchievementFilter issue #300.
--
-- Design constraint: this addon must NEVER inject anything into a Blizzard call
-- path. No hooksecurefunc, no HookScript, no SetScript on Blizzard frames, no
-- writes to Blizzard tables. It only polls issecurevariable() and chains the
-- error handler, neither of which can taint anything.

local addonName = ...

KAF_TaintProbeDB = KAF_TaintProbeDB or {}

local SWEEP_INTERVAL = 0.2
local FOCUS_SAMPLE_INTERVAL = 0.25
local FOCUS_HISTORY_SIZE = 40
local MAX_ERRORS = 15
local MAX_DETECTIONS = 60
local MAX_SESSIONS = 5
local MAX_CHAT_ALERTS = 3

local db, session
local focusHistory = {}
local knownInsecure = {}
local seenErrors = {}
local baselineDone = false
local chatAlerts = 0
local sweepElapsed, focusElapsed = 0, 0

local probe = CreateFrame("Frame")

local function Print(msg)
    print("|cFF1D92C2[KAF Taint Probe]|r " .. msg)
end

local function SafeName(frame)
    if not frame then
        return nil
    end
    local ok, name = pcall(function() return frame.GetDebugName and frame:GetDebugName() end)
    if ok and name and name ~= "" then
        return name
    end
    ok, name = pcall(function() return frame.GetName and frame:GetName() end)
    if ok and name and name ~= "" then
        return name
    end
    ok, name = pcall(tostring, frame)
    return ok and name or "<unnamed>"
end

local function CurrentFocus()
    local result = {}
    local ok = pcall(function()
        if GetMouseFoci then
            for _, frame in ipairs(GetMouseFoci()) do
                result[#result + 1] = SafeName(frame)
            end
        elseif GetMouseFocus then
            result[1] = SafeName(GetMouseFocus())
        end
    end)
    if not ok then
        result[1] = "<error>"
    end
    return result
end

local function RecordFocus()
    local joined = table.concat(CurrentFocus(), " | ")
    if joined == "" then
        joined = "<none>"
    end

    local last = focusHistory[#focusHistory]
    if last and last.name == joined then
        return
    end

    focusHistory[#focusHistory + 1] = { name = joined, at = GetTime() }
    while #focusHistory > FOCUS_HISTORY_SIZE do
        table.remove(focusHistory, 1)
    end
end

local function Snapshot()
    local snapshot = {}
    snapshot.wallClock = date("%Y-%m-%d %H:%M:%S")
    snapshot.uptime = session and (GetTime() - session.startTime) or 0

    pcall(function() snapshot.zone = GetZoneText() end)
    pcall(function() snapshot.subZone = GetSubZoneText() end)
    pcall(function() snapshot.mapId = C_Map.GetBestMapForUnit("player") end)
    pcall(function() snapshot.inCombat = InCombatLockdown() end)
    pcall(function() snapshot.worldMapShown = WorldMapFrame and WorldMapFrame:IsShown() or false end)
    pcall(function() snapshot.tooltipShown = GameTooltip and GameTooltip:IsShown() or false end)
    pcall(function() snapshot.tooltipOwner = GameTooltip and SafeName(GameTooltip:GetOwner()) end)
    pcall(function() snapshot.achievementFrameShown = AchievementFrame and AchievementFrame:IsShown() or false end)

    snapshot.focus = CurrentFocus()
    snapshot.recentFocus = {}
    for i, entry in ipairs(focusHistory) do
        snapshot.recentFocus[i] = string.format("-%.1fs  %s", GetTime() - entry.at, entry.name)
    end

    return snapshot
end

local globalWatch = {
    "GameTooltip",
    "UIWidgetManager",
    "ItemRefTooltip",
    "EmbeddedItemTooltip",
    "GameTooltipStatusBar",
    "TooltipDataProcessor",
}

local function GetTableWatch()
    local tooltip = GameTooltip
    return {
        { label = "GameTooltip", tbl = tooltip },
        { label = "GameTooltip.widgetContainer", tbl = tooltip and rawget(tooltip, "widgetContainer") },
        { label = "ItemRefTooltip", tbl = ItemRefTooltip },
        { label = "EmbeddedItemTooltip", tbl = EmbeddedItemTooltip },
        { label = "UIWidgetManager", tbl = UIWidgetManager },
        { label = "WorldMapFrame", tbl = WorldMapFrame },
    }
end

local function Report(label, key, source)
    local id = label .. "||" .. tostring(key)
    if knownInsecure[id] then
        return
    end
    knownInsecure[id] = true

    if not baselineDone then
        session.baseline[#session.baseline + 1] = {
            target = label,
            key = key,
            taintedBy = source or "<unknown>"
        }
        return
    end

    if #session.detections >= MAX_DETECTIONS then
        return
    end

    local entry = Snapshot()
    entry.target = label
    entry.key = key
    entry.taintedBy = source or "<unknown>"
    session.detections[#session.detections + 1] = entry

    if chatAlerts < MAX_CHAT_ALERTS then
        chatAlerts = chatAlerts + 1
        Print(string.format("|cFFFF2020DETECTED|r %s.%s tainted by |cFFFFFF00%s|r", label, tostring(key), entry.taintedBy))
        Print("Hovering: " .. (entry.focus[1] or "<none>") .. "  |  Zone: " .. tostring(entry.zone))
        Print("Please note what you just did, then /reload and send KAF_TaintProbeDB.lua")
    end
end

-- The widget container is created lazily by Blizzard the first time a tooltip
-- carries a UI widget set. Until it exists there is nothing to poison, so a
-- session with no detections is only meaningful once this returns a key.
local function FindWidgetContainerKey()
    local tooltip = GameTooltip
    if type(tooltip) ~= "table" then
        return nil
    end

    local ok, found = pcall(function()
        for key, value in pairs(tooltip) do
            if type(key) == "string" and type(value) == "table" and key:lower():find("widget", 1, true) then
                return key
            end
        end
        return nil
    end)

    return ok and found or nil
end

local function UpdateSessionState()
    if not session then
        return
    end

    session.durationSeconds = GetTime() - session.startTime
    session.sweeps = (session.sweeps or 0) + 1

    if not session.armedKey then
        local key = FindWidgetContainerKey()
        if key then
            session.armedKey = key
            session.armedAt = session.durationSeconds
            Print(string.format("|cFF20FF20armed|r - GameTooltip.%s now exists and is being watched.", key))
        end
    end
end

local function Sweep()
    UpdateSessionState()

    for _, name in ipairs(globalWatch) do
        local ok, isSecure, source = pcall(issecurevariable, name)
        if ok and isSecure == false then
            Report("_G", name, source)
        end
    end

    for _, target in ipairs(GetTableWatch()) do
        local tbl = target.tbl
        if type(tbl) == "table" then
            local ok, keys = pcall(function()
                local list = {}
                for key in pairs(tbl) do
                    if type(key) == "string" then
                        list[#list + 1] = key
                    end
                end
                return list
            end)
            if ok then
                for _, key in ipairs(keys) do
                    local ok2, isSecure, source = pcall(issecurevariable, tbl, key)
                    if ok2 and isSecure == false then
                        Report(target.label, key, source)
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
    local existing = seenErrors[key]
    if existing then
        existing.count = existing.count + 1
        return
    end

    if #session.errors >= MAX_ERRORS then
        return
    end

    local entry = Snapshot()
    entry.message = msg
    entry.stack = debugstack(3, 25, 25)
    entry.count = 1
    seenErrors[key] = entry
    session.errors[#session.errors + 1] = entry
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

local function OnUpdate(_, elapsed)
    focusElapsed = focusElapsed + elapsed
    if focusElapsed >= FOCUS_SAMPLE_INTERVAL then
        focusElapsed = 0
        pcall(RecordFocus)
    end

    sweepElapsed = sweepElapsed + elapsed
    if sweepElapsed >= SWEEP_INTERVAL then
        sweepElapsed = 0
        pcall(Sweep)
    end
end

local function CollectLoadedAddons()
    local loaded = {}
    local ok = pcall(function()
        for i = 1, C_AddOns.GetNumAddOns() do
            if C_AddOns.IsAddOnLoaded(i) then
                local name = C_AddOns.GetAddOnInfo(i)
                local version = C_AddOns.GetAddOnMetadata(name, "Version")
                loaded[#loaded + 1] = name .. " (" .. tostring(version) .. ")"
            end
        end
    end)
    if not ok then
        loaded[1] = "<error>"
    end
    return loaded
end

local function StartSession()
    db = KAF_TaintProbeDB
    db.sessions = db.sessions or {}

    local version, build = GetBuildInfo()
    session = {
        startedAt = date("%Y-%m-%d %H:%M:%S"),
        startTime = GetTime(),
        client = tostring(version) .. "." .. tostring(build),
        character = (UnitName("player") or "?") .. "-" .. (GetRealmName() or "?"),
        addons = CollectLoadedAddons(),
        baseline = {},
        detections = {},
        errors = {}
    }

    table.insert(db.sessions, session)
    while #db.sessions > MAX_SESSIONS do
        table.remove(db.sessions, 1)
    end
end

local function Status()
    if not session then
        Print("not initialised")
        return
    end

    Print(string.format("session %s  |  %s  |  client %s", session.startedAt, session.character, session.client))
    Print(string.format("played this session: %.0f min  (%d sweeps)", (session.durationSeconds or 0) / 60, session.sweeps or 0))

    if session.armedKey then
        Print(string.format("|cFF20FF20ARMED|r - GameTooltip.%s exists (first seen at +%.0fs)", session.armedKey, session.armedAt or 0))
    else
        Print("|cFFFF2020NOT ARMED|r - no widget container on GameTooltip yet. Hover a world map")
        Print("POI with an active event/assault until this says ARMED, or results mean nothing.")
    end

    Print(string.format("baseline (already tainted at login): %d", #session.baseline))
    Print(string.format("detections since login: |cFFFFFF00%d|r", #session.detections))
    Print(string.format("secret/taint errors captured: |cFFFFFF00%d|r", #session.errors))

    local first = session.detections[1]
    if first then
        Print(string.format("FIRST: %s.%s by |cFFFFFF00%s|r at +%.0fs, zone %s, hovering %s",
            first.target, tostring(first.key), first.taintedBy, first.uptime,
            tostring(first.zone), tostring(first.focus[1])))
    else
        if session.armedKey then
            Print("|cFF20FF20Shared tooltip state is still clean.|r")
        else
            Print("No detections, but |cFFFF2020not armed|r - this is not evidence of anything yet.")
        end
    end
end

probe:RegisterEvent("ADDON_LOADED")
probe:RegisterEvent("PLAYER_LOGIN")
probe:SetScript("OnEvent", function(self, event, loadedAddon)
    if event == "ADDON_LOADED" and loadedAddon == addonName then
        StartSession()
    elseif event == "PLAYER_LOGIN" then
        pcall(Sweep)
        baselineDone = true
        InstallErrorHandler()
        self:SetScript("OnUpdate", OnUpdate)
        Print("armed. Watching shared tooltip state. Type |cFFFFFF00/kaftp|r for status.")
    end
end)

SLASH_KAFTAINTPROBE1 = "/kaftp"
SlashCmdList.KAFTAINTPROBE = function(msg)
    msg = (msg or ""):lower():match("^%s*(.-)%s*$")

    if msg == "reset" then
        KAF_TaintProbeDB = {}
        StartSession()
        knownInsecure = {}
        seenErrors = {}
        focusHistory = {}
        chatAlerts = 0
        baselineDone = false
        pcall(Sweep)
        baselineDone = true
        Print("reset. New baseline taken.")
        return
    end

    if msg == "check" then
        pcall(Sweep)
    end

    Status()
end
