local _, addon = ...
addon.Tests.Obtainable = {}
local obtainable = addon.Tests.Obtainable

-- How Achievement:SetTemporaryObtainable (Objects/Achievement.lua) reads the arguments of an Obtainable() call,
-- and what Data/TemporaryObtainable.lua makes of the record it stores. A scenario feeds Args to a fake
-- achievement added in 4.0.3, a patch both clients register, or reads the records of a real achievement (Id).
-- The line lists every record as "<start> .. <end>" with the anchor as written (a Version as its patch, a Date
-- as Y-M-D, "own" on the start an end-only cutoff takes from the achievement's own patch), the state
-- GetObtainableState returns, and for a fake the number of reports the data load received
-- (addon.Data.LoadDiagnostics). The tooltip text is not observed: it follows from the record, and its locale and
-- date format would make the game's lines differ from the headless ones. Recorded is the behaviour of the
-- current code; a scenario passes when the code still behaves that way. Target is the desired behaviour;
-- scenarios whose Recorded differs from Target are open defects, counted separately.
-- The same scenarios run in game (/kaftest obtainable) against the loaded data and headlessly
-- (.claude/tools/headless/run-tests.lua) against the data load of .claude/tools/headless/client-env.lua.
-- Every anchor is 5.1.0 or older, so the states are the same on Retail and on Mists Classic, where 5.0.4
-- resolves to 5.5.0 and 5.1.0 to 5.5.1 through DataAddons/Classic/ContentTimeline.lua.
--
-- Before 101.1 a three-argument "Until" was read as an open-ended start until 2100 (until-version, data-5313): the
-- reported tooltip "was temporarily obtainable Mists of Pandaria (pre-patch) (5.0.4) until the end of
-- 2100/01/01", and the achievement listed as Time Limited. Inclusion words in the wrong place were taken
-- without a report (unknown-start-word, swapped-window). See docs/work/2026-10-02-until-version-cutoff/.

local fakeBaseId = 999999100
local fakePatch = "040003"

-- Args: the Obtainable() arguments given to a fake; Id: a real achievement whose records are read instead
obtainable.Scenarios = {
    {Name = "until-version", Args = {"Until", "Version", {5, 0, 4}},
        Recorded = "From Version 4.0.3 own .. Until Version 5.0.4; state=Past; reports=0",
        Target = "From Version 4.0.3 own .. Until Version 5.0.4; state=Past; reports=0"},
    {Name = "before-version", Args = {"Before", "Version", {5, 1, 0}},
        Recorded = "From Version 4.0.3 own .. Before Version 5.1.0; state=Past; reports=0",
        Target = "From Version 4.0.3 own .. Before Version 5.1.0; state=Past; reports=0"},
    {Name = "from-version", Args = {"From", "Version", {5, 0, 4}},
        Recorded = "From Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=0",
        Target = "From Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=0"},
    {Name = "window-version", Args = {"From", "Version", {4, 0, 3}, "Until", "Version", {5, 0, 4}},
        Recorded = "From Version 4.0.3 .. Until Version 5.0.4; state=Past; reports=0",
        Target = "From Version 4.0.3 .. Until Version 5.0.4; state=Past; reports=0"},
    {Name = "never", Args = {"Never"},
        Recorded = "Never; state=Past; reports=0",
        Target = "Never; state=Past; reports=0"},
    {Name = "unknown-start-word", Args = {"Through", "Version", {5, 0, 4}},
        Recorded = "Through Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=1",
        Target = "Through Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=1"},
    {Name = "swapped-window", Args = {"Until", "Version", {5, 0, 4}, "From", "Version", {4, 0, 3}},
        Recorded = "Until Version 5.0.4 .. From Version 4.0.3; state=Current; reports=2",
        Target = "Until Version 5.0.4 .. From Version 4.0.3; state=Current; reports=2"},
    {Name = "data-5313", Id = 5313, -- I Can't Hear You Over the Sound of How Awesome I Am, DataAddons/Shared/04_Cataclysm/AchievementData.lua
        Recorded = "From Version 4.0.3 own .. Until Version 5.0.4; state=Past",
        Target = "From Version 4.0.3 own .. Until Version 5.0.4; state=Past"}
}

local function DescribeValue(side)
    local value = side.Value
    if value == nil then
        return
    end
    if side.Function == "Version" then
        return KrowiAF.FormatBuildVersionId(value)
    end
    if type(value) == "table" then
        return table.concat(value, "-")
    end
    return tostring(value)
end

local function DescribeSide(side)
    local words = {}
    if side.Inclusion then
        tinsert(words, side.Inclusion)
    end
    if side.Function then
        tinsert(words, side.Function)
    end
    local value = DescribeValue(side)
    if value then
        tinsert(words, value)
    end
    if side.Implicit then
        tinsert(words, "own")
    end
    return table.concat(words, " ")
end

local function DescribeRecord(record)
    if not record.Start then
        return "empty"
    end
    local text = DescribeSide(record.Start)
    if record.End then
        text = text .. " .. " .. DescribeSide(record.End)
    end
    if record.IsNotObtainable then
        text = text .. " not obtainable"
    end
    return text
end

local function Observe(achievement, reports)
    local records = {}
    for _, record in ipairs(achievement.TemporaryObtainable or {}) do
        tinsert(records, DescribeRecord(record))
    end
    local text = (#records > 0 and table.concat(records, " | ") or "none") .. "; state=" .. tostring(achievement:GetObtainableState() or "none")
    if reports then
        text = text .. "; reports=" .. reports
    end
    return text
end

-- Drops what a fake reported, so the player's own data-load summary is left as the login made it
local function TakeReports(countBefore)
    local diagnostics = addon.Data.LoadDiagnostics
    local taken = 0
    while #diagnostics.Entries > countBefore do
        local entry = tremove(diagnostics.Entries)
        diagnostics.Counts[entry.Kind] = diagnostics.Counts[entry.Kind] - 1
        if diagnostics.Counts[entry.Kind] == 0 then
            diagnostics.Counts[entry.Kind] = nil
        end
        taken = taken + 1
    end
    return taken
end

local function ObserveFake(index, args)
    local fake = addon.Objects.Achievement:New(fakeBaseId + index)
    fake.BuildVersion = addon.Data.BuildVersions[fakePatch] -- not passed to New, which would mark the patch in use for the build-version filter
    local countBefore = #addon.Data.LoadDiagnostics.Entries
    local ok, err = pcall(fake.SetTemporaryObtainable, fake, unpack(args))
    local reports = TakeReports(countBefore)
    if not ok then
        return "error " .. tostring(err)
    end
    return Observe(fake, reports)
end

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(scenario, index)
    local got, blocked
    if scenario.Id then
        local achievement = addon.Data.Achievements[scenario.Id]
        if achievement then
            got = Observe(achievement)
        else
            blocked = "achievement " .. scenario.Id .. " is not registered on this client"
        end
    elseif not addon.Data.BuildVersions[fakePatch] then
        blocked = "build version " .. fakePatch .. " is not registered on this client"
    else
        got = ObserveFake(index, scenario.Args)
    end

    local status, targetMet, tail
    if blocked then
        status, tail = "SKIP", blocked
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=[%s] target=[%s] %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("obtainable/%s: %s %s"):format(scenario.Name, status, tail)
    }
end

function obtainable.Run()
    local results = {}
    for index, scenario in ipairs(obtainable.Scenarios) do
        tinsert(results, RunScenario(scenario, index))
    end
    return results
end

addon.Tests.Suites.obtainable = function()
    return obtainable.Run(), {}
end

addon.Tests.Ready.obtainable = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end