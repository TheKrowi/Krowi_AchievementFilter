-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Event = {};
local event = objects.Event;

event.__index = event;
function event:New(id, icon, name, mapID)
    local instance = setmetatable({}, event);

    instance.Id = id or 0;
    instance.ID = instance.Id;
    instance.Icon = icon or 0;
    instance.Name = name;
    instance.MapId = mapID;
    instance.MapID = instance.MapId;
    return instance;
end

function event:AddAchievement(achievement)
    self.Achievements = self.Achievements or {}; -- By creating the achievements table here we reduce memory usage because not every category has achievements
    tinsert(self.Achievements, achievement);
    return achievement;
end