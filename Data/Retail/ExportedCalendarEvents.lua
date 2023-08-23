-- [[ Exported at 2023-08-23 19-51-31 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local event = objects.Event;
local data = addon.Data;
data.ExportedCalendarEvents = {};
local exportedCalendarEvents = data.ExportedCalendarEvents;

function exportedCalendarEvents.Load(e)
    for i, _ in next, e do
        e[i] = nil;
    end

    e[141] = event:New(141, 236705); -- Feast of Winter Veil
    e[181] = event:New(181, 237000); -- Noblegarden
    e[201] = event:New(201, 134508); -- Children's Week
    e[324] = event:New(324, 236552); -- Hallow's End
    e[327] = event:New(327, 236704); -- Lunar Festival
    e[341] = event:New(341, 135268); -- Midsummer Fire Festival
    e[372] = event:New(372, 236701); -- Brewfest
    e[398] = event:New(398, 133168); -- Pirates' Day
    e[404] = event:New(404, 250626); -- Pilgrim's Bounty
    e[409] = event:New(409, 237272); -- Day of the Dead
    e[423] = event:New(423, 236709); -- Love is in the Air
    e[479] = event:New(479, 134481); -- Darkmoon Faire
    e[1262] = event:New(1262, 133783); -- WoW's 18th Anniversary
    e[1395] = event:New(1395, 1100022); -- Kalimdor Cup
    e[1396] = event:New(1396, 4419345); -- Secrets of Azeroth (US)
    e[1397] = event:New(1397, 133783); -- WoW's 19th Anniversary
    e[1398] = event:New(1398, 4419345); -- Secrets of Azeroth (EU)
    e[1399] = event:New(1399, 4419345); -- Secrets of Azeroth (KR)
    e[1400] = event:New(1400, 1100022); -- Eastern Kingdoms Cup
    e[1425] = event:New(1425, 4630413); -- Turbulent Timeways
end

function exportedCalendarEvents.LoadCategories(e)
    if e[141] == nil or e[181] == nil or e[201] == nil or e[324] == nil or e[327] == nil or e[341] == nil or e[372] == nil or e[398] == nil or e[404] == nil or e[409] == nil or e[423] == nil or e[479] == nil or e[1262] == nil or e[1395] == nil or e[1396] == nil or e[1397] == nil or e[1398] == nil or e[1399] == nil or e[1400] == nil or e[1425] == nil then
        exportedCalendarEvents.Load(e);
    end

    e[141].Category = addon.Tabs["Events"].Categories[6].Children[11]; -- Winter Veil
    e[181].Category = addon.Tabs["Events"].Categories[6].Children[3]; -- Noblegarden
    e[201].Category = addon.Tabs["Events"].Categories[6].Children[4]; -- Children's Week
    e[324].Category = addon.Tabs["Events"].Categories[6].Children[8]; -- Hallow's End
    e[327].Category = addon.Tabs["Events"].Categories[6].Children[1]; -- Lunar Festival
    e[341].Category = addon.Tabs["Events"].Categories[6].Children[5]; -- Midsummer
    e[372].Category = addon.Tabs["Events"].Categories[6].Children[7]; -- Brewfest
    e[398].Category = addon.Tabs["Events"].Categories[6].Children[6]; -- Pirates' Day
    e[404].Category = addon.Tabs["Events"].Categories[6].Children[10]; -- Pilgrim's Bounty
    e[409].Category = addon.Tabs["Events"].Categories[6].Children[9]; -- Day of the Dead
    e[423].Category = addon.Tabs["Events"].Categories[6].Children[2]; -- Love is in the Air
    e[479].Category = addon.Tabs["Events"].Categories[8]; -- Darkmoon Faire
    e[1262].Category = addon.Tabs["Events"].Categories[7]; -- WoW's Anniversary
    e[1395].Category = addon.Tabs["Events"].Categories[9].Children[1]; -- Kalimdor Cup
    e[1396].Category = addon.Tabs["Events"].Categories[10]; -- Secrets of Azeroth
    e[1397].Category = addon.Tabs["Events"].Categories[7]; -- WoW's Anniversary
    e[1398].Category = addon.Tabs["Events"].Categories[10]; -- Secrets of Azeroth
    e[1399].Category = addon.Tabs["Events"].Categories[10]; -- Secrets of Azeroth
    e[1400].Category = addon.Tabs["Events"].Categories[9].Children[2]; -- Eastern Kingdoms Cup
    e[1425].Category = addon.Tabs["Events"].Categories[11].Children[2]; -- Turbulent Timeways
end

function exportedCalendarEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 141, addon.L["Feast of Winter Veil"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 181, addon.L["Noblegarden"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 201, addon.L["Children's Week"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 324, addon.L["Hallow's End"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 327, addon.L["Lunar Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 341, addon.L["Midsummer Fire Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 372, addon.L["Brewfest"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 398, addon.L["Pirates' Day"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 404, addon.L["Pilgrim's Bounty"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 409, addon.L["Day of the Dead"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 423, addon.L["Love is in the Air"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Holidays", { 141, 181, 201, 324, 327, 341, 372, 398, 404, 409, 423 });
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 479, addon.L["Darkmoon Faire"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1262, addon.L["WoW's 18th Anniversary"], false);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1395, addon.L["Kalimdor Cup"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1396, addon.L["Secrets of Azeroth (US)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1397, addon.L["WoW's 19th Anniversary"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1398, addon.L["Secrets of Azeroth (EU)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1399, addon.L["Secrets of Azeroth (KR)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1400, addon.L["Eastern Kingdoms Cup"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 1425, addon.L["Turbulent Timeways"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Other", { 479, 1262, 1395, 1396, 1397, 1398, 1399, 1400, 1425 });
end

