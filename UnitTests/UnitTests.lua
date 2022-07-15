-- [[ Namespaces ]] --
local addonName, addon = ...;
addon.UnitTests = {};
local unitTests = addon.UnitTests;
unitTests.Groups = {};
local groups = unitTests.Groups;

function unitTests:Load()
    for groupName, group in next, groups do
        local wowUnit = WoWUnit(groupName);
        local tests = group.Tests;
        for testName, test in next, tests do
            wowUnit[testName] = test;
        end
    end
end

local reason = select(5, GetAddOnInfo("WoWUnit"));
if reason == nil or reason == "DEMAND_LOADED" then
    unitTests.Active = true;
end

function unitTests:RegisterTest(groupName, testName, test)
    if groups[groupName] == nil then
        error("Group " .. groupName .. " does not exist");
    end
    local tests  = groups[groupName].Tests;
    if tests[testName] ~= nil then
        error("Test " .. testName .. " already exists");
    end
    tests[testName] = test;
end

function unitTests:RegisterGroup(groupName)
    if groups[groupName] ~= nil then
        error("Group already exists");
    end
    groups[groupName] = {
        Tests = {}
    };
    return function(testName, test)
        unitTests:RegisterTest(groupName, testName, test);
    end;
end