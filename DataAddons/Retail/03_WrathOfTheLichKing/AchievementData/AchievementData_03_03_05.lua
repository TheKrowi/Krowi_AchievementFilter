local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_03_05"] = {
    {4815}, -- The Twilight Destroyer (25 player)
    {4816}, -- Heroic: The Twilight Destroyer (25 player)
    {4817}, -- The Twilight Destroyer (10 player)
    {4818}, -- Heroic: The Twilight Destroyer (10 player)
    {4824}, -- Collector's Edition: Mini Thor
    {KrowiAF.SetAchievementPatch, 3, 3, 5}, -- Rework loading so this can go to the top, future me problem
};