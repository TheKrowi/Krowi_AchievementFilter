local _, addon = ...

local function RunTask(task)
    if type(task) == "function" then
        task()
    elseif type(task) == "table" then
        task[1](unpack(task, 2, #task))
    end
end

local taskIndex = 1
local function GetNumOfTasksLeft(workloadTables, tasks)
    local numOfTasksLeft = tasks and #tasks or 0
    for _, wl in next, workloadTables do
        numOfTasksLeft = numOfTasksLeft + #wl
    end
    return numOfTasksLeft - taskIndex + 1
end

local function Delay(continue, startTime, maxDuration, onDelay, workloadTables, tasks)
    if (debugprofilestop() - startTime <= maxDuration) then
        return false
    end
    C_Timer.After(0, continue)
    if onDelay then
        onDelay(GetNumOfTasksLeft(workloadTables, tasks))
    end
    return true
end

local function GetNextTask(tasks, workloadTables)
    taskIndex = taskIndex + 1
    local task = tasks[taskIndex]
    if task then
        return tasks, task
    end
    tasks = tremove(workloadTables)
    if tasks then
        taskIndex = 1
        task = tasks[taskIndex]
    end
    return tasks, task
end

function addon.StartTasksGroups(tasksGroups, onFinish, onDelay)
    local maxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate())
    local tasks = tremove(tasksGroups)
    local function continue()
        local startTime = debugprofilestop()
        local task = tasks and tasks[taskIndex]
        while task do
            RunTask(task)
            tasks, task = GetNextTask(tasks, tasksGroups) -- Get the new task first so in case the task takes longer than a frame duration, the current tasks keeps looping
            if Delay(continue, startTime, maxDuration, onDelay, tasksGroups, tasks) then -- Really need to solve this in a different way!!!
                return false
            end
        end
        if onFinish then
            onFinish()
        end
        return true
    end
    return continue()
end