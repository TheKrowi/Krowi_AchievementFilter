-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Event = {};
local event = objects.Event;

event.__index = event;
function event:New(id, icon, name, mapID, totalDuration)
    local self = {};
    setmetatable(self, event);

    self.ID = id or 0;
    self.Icon = icon or 0;
    self.Name = name;
    self.MapID = mapID;
    self.TotalDuration = totalDuration;

    return self;
end

function event:AddAchievement(achievement)
    self.Achievements = self.Achievements or {}; -- By creating the achievements table here we reduce memory usage because not every category has achievements
    tinsert(self.Achievements, achievement);
    return achievement;
end