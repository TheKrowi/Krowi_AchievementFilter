local addonName, addon = ...;
local data = addon.Data;
data.SavedData = {};
local savedData = data.SavedData;

function savedData.Load()
    savedData.CharacterData.Load();
    savedData.AchievementData.Load();
end