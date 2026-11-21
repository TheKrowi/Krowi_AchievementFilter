local _, addon = ...
local shared = addon.Data.EventData.Shared
local type = KrowiAF.Enum.EventType

KrowiAF.EventData.WarlordsOfDaenor = {
    { -- WoW's Anniversary: every year's calendar holiday, one reminder for all. The calendar lists one of them at a time
      -- (2026-11-21: only 1808, though 590 and 1587 to 1590 carry the same window). Each autumn the new year's id goes
      -- here with its year; the release gate fails from 1 October until it does (.claude/tools/Check-Anniversary.ps1).
        {
            467, -- WoW's 7th Anniversary (2011)
            484, -- WoW's 8th Anniversary (2012)
            509, -- WoW's 9th Anniversary (2013)
            514, -- WoW's 10th Anniversary (2014)
            566, -- WoW's 11th Anniversary (2015)
            589, -- WoW's 12th Anniversary (2016)
            590, -- WoW's Anniversary
            693, -- WoW's 13th Anniversary (2017)
            807, -- WoW's 14th Anniversary (2018)
            808, -- WoW's 15th Anniversary (2019)
            1181, -- WoW's 16th Anniversary (2020)
            1225, -- WoW's 17th Anniversary (2021)
            1262, -- WoW's 18th Anniversary (2022)
            1397, -- WoW's 19th Anniversary (2023)
            1500, -- WoW's 20th Anniversary (2024)
            1501, -- WoW's 21st Anniversary (2025)
            1509, -- WoW's 20th Anniversary (2024)
            1587, -- WoW's Anniversary
            1588, -- WoW's Anniversary
            1589, -- WoW's Anniversary
            1590, -- WoW's Anniversary
            1592, -- WoW's 20th Anniversary (2024)
            1593, -- WoW's 20th Anniversary (2024)
            1594, -- WoW's 20th Anniversary (2024)
            1595, -- WoW's 20th Anniversary (2024)
            1808, -- WoW's 22nd Anniversary (2026)
        }, type.Calendar,
        1173,
        133783,
        addon.L["WoW's Anniversary"],
        addon.L["Holidays"],
        1
    },
}