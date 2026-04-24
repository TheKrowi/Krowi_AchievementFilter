local _, addon = ...

-- Deterministic hash of all achievements for a given expansion major version.
-- Stored in KrowiAF_SavedData.VerifyHash after data finishes loading.
-- Set MAJOR to the expansion being verified: 10 = Dragonflight, 11 = The War Within, etc.
-- TEMPORARY — remove from .toc after verification is done.

local MAJOR = 6 -- <<< SET THIS

print("|cff00ff00[KAF-Verify]|r Script loaded OK (major=" .. MAJOR .. ")")

local function ComputeHash(str)
    local h = 5381
    for i = 1, #str do
        h = (h * 33 + string.byte(str, i)) % 2147483648
    end
    return h
end

local function SerRT(rt)
    if rt == nil then return "0" end
    if type(rt) == "number" then return tostring(rt) end
    if type(rt) == "table" then
        local t = {}
        for _, v in ipairs(rt) do tinsert(t, tostring(v)) end
        table.sort(t)
        return table.concat(t, "+")
    end
    return "?"
end

local function SerTO(ach)
    local to = ach.TemporaryObtainable
    if not to or #to == 0 then return "" end
    local parts = {}
    for _, rec in ipairs(to) do
        local s = rec.Start and table.concat({
            rec.Start.Inclusion or "",
            rec.Start.Function or "",
            tostring(rec.Start.Value or ""),
        }, "/") or "-"
        local e = rec.End and table.concat({
            rec.End.Inclusion or "",
            rec.End.Function or "",
            tostring(rec.End.Value or ""),
        }, "/") or "-"
        tinsert(parts, s .. "~" .. e .. "~" .. (rec.IsNotObtainable and "1" or "0"))
    end
    return table.concat(parts, ";")
end

local function RunHash()
    local ids = {}
    for id, ach in pairs(addon.Data.Achievements) do
        if ach.BuildVersion and ach.BuildVersion.Major == MAJOR then
            tinsert(ids, id)
        end
    end
    table.sort(ids)

    local lines = {}
    local perAch = {}
    for _, id in ipairs(ids) do
        local a = addon.Data.Achievements[id]
        local row = table.concat({
            tostring(id),
            tostring(a.BuildVersion.Id),
            tostring(a.Faction or 0),
            tostring(a.OtherFactionAchievementId or 0),
            SerRT(a.RewardType),
            a.IsPvP and "1" or "0",
            a.IsRealmFirst and "1" or "0",
            SerTO(a),
        }, "|")
        tinsert(lines, row)
        perAch[tostring(id)] = row
    end

    local raw = table.concat(lines, "\n")
    local h = ComputeHash(raw)

    KrowiAF_SavedData = KrowiAF_SavedData or {}
    KrowiAF_SavedData.VerifyHash = KrowiAF_SavedData.VerifyHash or {}
    KrowiAF_SavedData.VerifyHash[tostring(MAJOR)] = {
        hash = tostring(h),
        count = #ids,
        ts = tostring(GetTime()),
        perAch = perAch,
    }
    print(string.format("|cff00ff00[KAF-Verify]|r Major %d: %d achievements, hash=%d", MAJOR, #ids, h))
end

-- Use a frame to wait for PLAYER_LOGIN, then delay 10 s for StartTasksGroups to finish.
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    f:UnregisterAllEvents()
    print("|cff00ff00[KAF-Verify]|r PLAYER_LOGIN seen, waiting 10s for data (major=" .. MAJOR .. ")...")
    C_Timer.After(10, function()
        local ok, err = pcall(RunHash)
        if not ok then
            print("|cffff0000[KAF-Verify] ERROR:|r " .. tostring(err))
        end
    end)
end)
