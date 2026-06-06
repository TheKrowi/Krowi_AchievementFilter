-- KrowiAF Achievement Data V2 Benchmark (frame-aware)
-- Usage:
--   1. Add "Benchmark.lua" as the last line of Krowi_AchievementFilter.toc
--   2. Load the game and type /kafbench
--   3. Remove the TOC line when done

local ITERATIONS = 10000

-- ============================================================
-- Local replicas of the helpers (do NOT touch shared tables)
-- ============================================================
local rewardType = KrowiAF.Enum.RewardType

-- Builder replica (mirrors AchBuilder in Shared/AchievementData.lua)
local AchBuilder = {}
AchBuilder.__index = AchBuilder
local function GetExtras(self)
    if not self[2] then self[2] = {} end
    return self[2]
end
function AchBuilder:PvE(season)      tinsert(GetExtras(self), {"PvE Season", season}); return self end
function AchBuilder:PvP(season)      local e = GetExtras(self); e.IsPvP = true; tinsert(e, {"PvP Season", season}); return self end
function AchBuilder:IsPvP()          GetExtras(self).IsPvP = true;                                                    return self end
function AchBuilder:IsRealmFirst()   GetExtras(self).IsRealmFirst = true;               return self end
function AchBuilder:Title()          GetExtras(self).RewardType = rewardType.Title;     return self end
function AchBuilder:Mount()          GetExtras(self).RewardType = rewardType.Mount;     return self end
function AchBuilder:Teleport()       GetExtras(self).RewardType = rewardType.Teleport;  return self end
function AchBuilder:HousingDecor()   GetExtras(self).RewardType = rewardType.HousingDecor; return self end
function AchBuilder:Pet()            GetExtras(self).RewardType = rewardType.Pet;       return self end
function AchBuilder:Toy()            GetExtras(self).RewardType = rewardType.Toy;       return self end
function AchBuilder:Rewards(...)     GetExtras(self).RewardType = {...};                return self end
function AchBuilder:Obtainable(...)  tinsert(GetExtras(self), {...});                   return self end
local function Ach(id) return setmetatable({id}, AchBuilder) end

-- Builder replica: Always-Table variant — reward methods always store {value}
local AchBuilderAlwaysTable = setmetatable({}, {__index = AchBuilder})
AchBuilderAlwaysTable.__index = AchBuilderAlwaysTable
for key, value in pairs(rewardType) do
    AchBuilderAlwaysTable[key] = function(self) GetExtras(self).RewardType = {value}; return self end
end
local function AchAT(id) return setmetatable({id}, AchBuilderAlwaysTable) end

-- Builder replica: Promote variant — first call stores {value}, subsequent calls tinsert
local AchBuilderPromote = setmetatable({}, {__index = AchBuilder})
AchBuilderPromote.__index = AchBuilderPromote
for key, value in pairs(rewardType) do
    AchBuilderPromote[key] = function(self)
        local e = GetExtras(self)
        local rt = e.RewardType
        if rt == nil then
            e.RewardType = {value}
        else
            tinsert(rt, value)
        end
        return self
    end
end
local function AchP(id) return setmetatable({id}, AchBuilderPromote) end

-- ============================================================
-- Local replica of the parser (no writes to addon data)
-- ============================================================
local function ParseV2(id, extras)
    if not extras then return id end
    local temporaryObtainables
    if #extras > 0 then
        temporaryObtainables = {}
        for i = 1, #extras do tinsert(temporaryObtainables, extras[i]) end
    end
    return id, extras.Faction, extras.AltId, extras.RewardType, extras.IsPvP, extras.IsRealmFirst, temporaryObtainables
end

-- ============================================================
-- Frame-aware runner
-- Mirrors StartTasksGroups: budgets 50% of target/current FPS
-- per frame, spreads work across as many frames as needed.
-- Scenarios run sequentially via a queue.
-- ============================================================
local function RunFrameAware(name, n, fn, frameBudget, onDone)
    local i = 0
    local totalWorkMs = 0
    local frameCount = 0
    local wallStart

    local frame = CreateFrame("Frame")
    frame:SetScript("OnUpdate", function()
        if not wallStart then wallStart = debugprofilestop() end
        frameCount = frameCount + 1

        local chunkStart = debugprofilestop()
        local deadline = chunkStart + frameBudget
        while i < n and debugprofilestop() < deadline do
            fn()
            i = i + 1
        end
        totalWorkMs = totalWorkMs + (debugprofilestop() - chunkStart)

        if i >= n then
            frame:SetScript("OnUpdate", nil)
            onDone(name, n, totalWorkMs, frameCount, debugprofilestop() - wallStart)
        end
    end)
end

local function PrintResult(name, n, workMs, frames, wallMs)
    print(string.format("|cFF88CCFFBench|r %-50s |cFFFFFF00%6.2fms|r work  |cFFFFFF00%8.5fms|r/call  |cFF88FF88%d frame(s)|r  wall: |cFFAAAAAA%.1fms|r",
        name, workMs, workMs / n, frames, wallMs))
end

-- ============================================================
-- Scenarios  (construct + parse combined = full cost per entry)
-- ============================================================
local scenarios = {
    -- --------------------------------------------------------
    -- Reward-type builder approach comparison
    -- --------------------------------------------------------
    {   -- Single reward: current raw-value vs always-table
        "reward single  current      :HousingDecor()",
        "reward single  always-table :HousingDecor()",
        function() local t = Ach(19408):HousingDecor();   ParseV2(t[1], t[2]) end,
        function() local t = AchAT(19408):HousingDecor(); ParseV2(t[1], t[2]) end,
    },
    {   -- Single reward: current raw-value vs promote
        "reward single  current      :HousingDecor()",
        "reward single  promote      :HousingDecor()",
        function() local t = Ach(19408):HousingDecor();  ParseV2(t[1], t[2]) end,
        function() local t = AchP(19408):HousingDecor(); ParseV2(t[1], t[2]) end,
    },
    {   -- Multi reward: Rewards(...) vs chained promote
        "reward multi   :Rewards(r1, r2)",
        "reward multi   chained :r1():r2()",
        function() local t = Ach(42318):Rewards(rewardType.RemixBronze, rewardType.HousingDecor); ParseV2(t[1], t[2]) end,
        function() local t = AchP(42318):RemixBronze():HousingDecor();                            ParseV2(t[1], t[2]) end,
    },
}

-- ============================================================
-- Sequential queue runner
-- ============================================================
local function RunQueue(queue, frameBudget)
    local function Next()
        if #queue == 0 then
            print(string.format("|cFF88CCFFKrowiAF Benchmark|r done.  Frame budget: |cFFFFFF00%.2fms|r", frameBudget))
            return
        end
        collectgarbage("collect")
        local entry = tremove(queue, 1)
        RunFrameAware(entry[1], ITERATIONS, entry[2], frameBudget, function(...)
            PrintResult(...)
            if entry[3] then print("--------------------------------------------------------------------") end
            Next()
        end)
    end
    Next()
end

SLASH_KAFBENCH1 = "/kafbench"
SlashCmdList["KAFBENCH"] = function()
    local fps = tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate()
    local frameBudget = 500 / fps  -- 50% of one frame, matching StartTasksGroups

    print(string.format("|cFF88CCFFKrowiAF Benchmark|r — %d iterations/test  FPS target: %d  budget: %.2fms/frame",
        ITERATIONS, fps, frameBudget))
    print("--------------------------------------------------------------------")

    local queue = {}
    for i, s in ipairs(scenarios) do
        local isLast = (i == #scenarios)
        tinsert(queue, {s[1], s[3], false})           -- first variant: no separator
        tinsert(queue, {s[2], s[4], not isLast})      -- second variant: separator after, except last
    end

    RunQueue(queue, frameBudget)
end
