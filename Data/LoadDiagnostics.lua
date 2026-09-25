local _, addon = ...
local data = addon.Data
data.LoadDiagnostics = {}
local loadDiagnostics = data.LoadDiagnostics

-- The data load used to know two error settings: a silent skip, or a fatal assert. Every place that
-- drops or skips a data entry reports here instead, tagged with the data group that was loading, so
-- a slip in a data file shows in debug mode after login and fails the offline lint, which reads this
-- table (.claude/tools/headless/load-data.lua). The rule: a drop is a data defect until it is proven
-- intentional, and an intentional one is declared where it happens, never implied.
-- Kinds, in the order the summary lists them:
loadDiagnostics.Kind = {
    -- Referenced by category, zone, tooltip, transmog set, custom criteria or pet battle link data
    -- while no data file on this client registers the id. Expected when a Shared file names an id
    -- the other client has, a defect otherwise; only the lint, which loads both clients, can tell
    UnregisteredAchievement = "UnregisteredAchievement",
    -- A Version anchor naming a Retail patch no live patch on this client has reached: the beat has not
    -- happened on this game version, so the achievement is obtainable here with no end scheduled.
    -- Expected on a re-release client, a defect on Retail, which is the reference timeline
    UnscheduledVersion = "UnscheduledVersion",
    -- An Obtainable() word the resolver does not understand, so the anchor never resolves
    UnknownAnchorFunction = "UnknownAnchorFunction",
    -- Obtainable() arguments matching none of the forms Achievement:SetTemporaryObtainable knows
    MalformedObtainable = "MalformedObtainable",
    -- A V1 category node that matches no parser branch; it and everything under it is dropped
    UnparsedCategoryNode = "UnparsedCategoryNode",
    -- An event bound to a category id no category file declares
    UnregisteredCategory = "UnregisteredCategory"
}
local kind = loadDiagnostics.Kind

loadDiagnostics.Entries = {}
loadDiagnostics.Counts = {}

local source
function loadDiagnostics.SetSource(registry, key) -- the first task of every data group, see Data.lua
    source = { Registry = registry, Key = key }
end

function loadDiagnostics:Report(reportKind, id, detail)
    tinsert(self.Entries, { Kind = reportKind, Id = id, Detail = detail, Source = source })
    self.Counts[reportKind] = (self.Counts[reportKind] or 0) + 1
end

function loadDiagnostics.SourceToString(entrySource)
    if not entrySource then
        return "?"
    end
    return entrySource.Registry .. (entrySource.Key ~= nil and (" " .. tostring(entrySource.Key)) or "")
end

local defectKinds = { kind.UnknownAnchorFunction, kind.MalformedObtainable, kind.UnparsedCategoryNode, kind.UnregisteredCategory }

-- Called once the task groups have run; prints in debug mode only
function loadDiagnostics:Print()
    if not addon.Diagnostics.DebugEnabled() then
        return
    end
    local debug = addon.Diagnostics.Debug
    if #self.Entries == 0 then
        debug("Data load: nothing skipped or dropped")
        return
    end

    -- In game only the client itself can tell a Shared reference to the other client's id from a typo
    local inClient, notInClient, examples = 0, 0, {}
    for _, entry in next, self.Entries do
        if entry.Kind == kind.UnregisteredAchievement then
            if GetAchievementInfo(entry.Id) then
                inClient = inClient + 1
                if #examples < 5 then
                    tinsert(examples, entry.Id .. " (" .. entry.Detail .. ")")
                end
            else
                notInClient = notInClient + 1
            end
        end
    end

    debug(("Data load: %d entries skipped or dropped"):format(#self.Entries))
    if notInClient > 0 then
        debug(("  %d references to achievements this client does not have, skipped by design (Shared data)"):format(notInClient))
    end
    if inClient > 0 then
        debug(("  %d references to achievements this client has but no data file registers, e.g. %s"):format(inClient, table.concat(examples, ", ")))
    end
    if self.Counts[kind.UnscheduledVersion] then
        debug(("  %d Version anchors name a patch this game version has not reached; their achievements are obtainable here with no end scheduled"):format(self.Counts[kind.UnscheduledVersion]))
    end
    for _, defectKind in next, defectKinds do
        if self.Counts[defectKind] then
            debug(("  %d %s:"):format(self.Counts[defectKind], defectKind))
            for _, entry in next, self.Entries do
                if entry.Kind == defectKind then
                    debug(("    %s: %s [%s]"):format(tostring(entry.Id), entry.Detail, self.SourceToString(entry.Source)))
                end
            end
        end
    end
end