---@diagnostic disable: lowercase-global, undefined-global
-- Migrates a real saved-variables file in memory and runs migration 1's check (docs/work/2026-11-25-settings-store, plan
-- step 4), to prove the rename table on players' real files before any build reaches the game. It reads the file and
-- writes nothing: the result stays in memory and is thrown away. Never commit a player's file or its output.
--
--   lua.exe .claude\tools\headless\settings-dryrun.lua <repo root> <path to Krowi_AchievementFilter.lua> [character]
--
-- character: "<name> - <realm>", whose options profile gives the account-scope values; by default the first in
-- KrowiAF_Options.profileKeys, sorted. Retail or Classic is read from the path (_retail_ is Retail). The achievement
-- records step needs the game's achievement data, so here it treats no achievement as account-wide: its time is the
-- walk only, and the line says whether it would run at all.
-- Prints one line: the result, the records checked, the failures, the old values not carried (no-row: an old path with
-- no row; account: an Advanced switch in another character's profile), the step and the time taken; then each value not
-- carried, and each failing record.

local root, file, character = arg[1], arg[2], arg[3]
assert(root and file, "usage: settings-dryrun.lua <repo root> <saved variables file> [character]")
root = root:gsub("\\", "/"):gsub("/$", "")
local helper = assert(loadfile(root .. "/.claude/tools/headless/settings-store.lua"))()
local s = helper.Runner(root)
s.Migrations.ClearOld = true

local env = {}
local chunk = assert(loadfile(file))
setfenv(chunk, env)
chunk()

local options = env.KrowiAF_Options
if not character then
    local names = {}
    for name in next, type(options) == "table" and type(options.profileKeys) == "table" and options.profileKeys or {} do
        names[#names + 1] = name
    end
    table.sort(names)
    character = names[1] or "Nobody - Nowhere"
end
local isRetail = file:gsub("\\", "/"):lower():find("/_retail_/", 1, true) ~= nil
local savedData = env.KrowiAF_SavedData
local verified = type(savedData) == "table" and type(savedData.Verifications) == "table" and savedData.Verifications.AchievementsData
local step = (isRetail and type(env.KrowiAF_Achievements) == "table" and not verified) and "runs" or "skipped"

local sv = { Settings = env.KrowiAF_Settings, Options = options, Filters = env.KrowiAF_Filters,
    SearchOptions = env.KrowiAF_SearchOptions, SavedData = savedData, Achievements = env.KrowiAF_Achievements }
local context = { Character = character, AddonVersion = "dry run", IsMainline = isRetail, IsAccountWide = function() return false end }

-- The records the check reads, counted on its own view (the run below clears the old tables)
local profiles = {}
for name, profile in next, type(options) == "table" and type(options.profiles) == "table" and options.profiles or {} do
    profiles[name] = profile
end
local records = 0
s.Check.Records(s.Check.Old(sv, profiles, context), function() records = records + 1 end)

local start = os.clock()
local result = s.Migrations.Run(sv, context)
local milliseconds = (os.clock() - start) * 1000

local noRow, account, lines = 0, 0, {}
for _, line in ipairs(s.Migrations.Log) do
    if line:find("not carried, no-row", 1, true) then noRow = noRow + 1 end
    if line:find("not carried, account", 1, true) then account = account + 1 end
    if line:find("not carried", 1, true) then lines[#lines + 1] = line end
end
local failed = type(sv.Settings) == "table" and sv.Settings.MigrationFailed
local failures = failed and failed.Paths and #failed.Paths or (failed and -1 or 0)
print(("%s: result=%s check=%s records=%d failures=%d no-row=%d account=%d achievements-step=%s time=%.0fms character=%s"):format(
    isRetail and "Retail" or "Classic", result, failures == 0 and "pass" or "fail", records, failures, noRow, account, step,
    milliseconds, character))
for _, line in ipairs(lines) do print("  " .. line) end
if failed then
    if failed.Error then print("  error: " .. tostring(failed.Error)) end
    for _, record in ipairs(failed.Paths or {}) do
        print(("  failing: %s %s %s"):format(record.Section, tostring(record.Profile or record.System), s.Check.Join(record.Path or { record.Character })))
    end
end