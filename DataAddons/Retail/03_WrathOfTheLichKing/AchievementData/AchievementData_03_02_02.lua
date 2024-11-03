local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_02_02"] = {
    {4396}, -- Onyxia's Lair (10 player)
    {4397}, -- Onyxia's Lair (25 player)
    { -- WoW's 5th Anniversary
        4400,
        {
            {}
        }
    },
    {4402}, -- More Dots! (10 player)
    {4403}, -- Many Whelps! Handle It! (10 player)
    {4404}, -- She Deep Breaths More (10 player)
    {4405}, -- More Dots! (25 player)
    {4406}, -- Many Whelps! Handle It! (25 player)
    {4407}, -- She Deep Breaths More (25 player)
    { -- BB King
        4436,
        faction.Alliance,
        4437,
        {
            {"Event", 141},
        },
    },
    { -- BB King
        4437,
        faction.Horde,
        4436,
        {
            {"Event", 141},
        },
    },
    {4476}, -- Looking For More
    {4477}, -- Looking For Many
    {4478}, -- Looking For Multitudes
    {4496}, -- It's Over Nine Thousand!
    {4585}, -- Toravon the Ice Watcher (10 player)
    {4586}, -- Toravon the Ice Watcher (25 player)
    {KrowiAF.SetAchievementPatch, 3, 2, 2}, -- Rework loading so this can go to the top, future me problem
};