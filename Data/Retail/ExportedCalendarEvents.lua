-- [[ Exported at 2023-01-06 22-19-00 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local objects = addon.Objects;
local event = objects.Event;
local widthMultiplier = addon.Options.WidthMultiplier;
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
    e[1315] = event:New(1315, 3614361); -- Fated Raids: Castle Nathria (US)
    e[1316] = event:New(1316, 4254074); -- Fated Raids: Sepulcher of the First Ones (US)
    e[1317] = event:New(1317, 4062765); -- Fated Raids: Sanctum of Domination (US)
    e[1325] = event:New(1325, 3614361); -- Fated Raids: Castle Nathria (EU)
    e[1326] = event:New(1326, 3614361); -- Fated Raids: Castle Nathria (CN)
    e[1328] = event:New(1328, 4062765); -- Fated Raids: Sanctum of Domination (EU)
    e[1329] = event:New(1329, 4062765); -- Fated Raids: Sanctum of Domination (CN)
    e[1331] = event:New(1331, 4254074); -- Fated Raids: Sepulcher of the First Ones (EU)
    e[1332] = event:New(1332, 4254074); -- Fated Raids: Sepulcher of the First Ones (CN)
end

function exportedCalendarEvents.LoadCategories(e)
    if e[141] == nil or e[181] == nil or e[201] == nil or e[324] == nil or e[327] == nil or e[341] == nil or e[372] == nil or e[398] == nil or e[404] == nil or e[409] == nil or e[423] == nil or e[479] == nil or e[1262] == nil or e[1315] == nil or e[1316] == nil or e[1317] == nil or e[1325] == nil or e[1326] == nil or e[1328] == nil or e[1329] == nil or e[1331] == nil or e[1332] == nil then
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
    e[1315].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[1]; -- Castle Nathria
    e[1316].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[3]; -- Sepulcher of the First Ones
    e[1317].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[2]; -- Sanctum of Domination
    e[1325].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[1]; -- Castle Nathria
    e[1326].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[1]; -- Castle Nathria
    e[1328].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[2]; -- Sanctum of Domination
    e[1329].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[2]; -- Sanctum of Domination
    e[1331].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[3]; -- Sepulcher of the First Ones
    e[1332].Category = addon.Tabs["Events"].Categories[12].Children[2].Children[3]; -- Sepulcher of the First Ones
end

function exportedCalendarEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1315, addon.L["Fated Raids: Castle Nathria (US)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1316, addon.L["Fated Raids: Sepulcher of the First Ones (US)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1317, addon.L["Fated Raids: Sanctum of Domination (US)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1325, addon.L["Fated Raids: Castle Nathria (EU)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1326, addon.L["Fated Raids: Castle Nathria (CN)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1328, addon.L["Fated Raids: Sanctum of Domination (EU)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1329, addon.L["Fated Raids: Sanctum of Domination (CN)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1331, addon.L["Fated Raids: Sepulcher of the First Ones (EU)"]);
    KrowiAF_RegisterEventOptions("Calendar", "Fated_Raids", addon.L["Fated Raids"], 1332, addon.L["Fated Raids: Sepulcher of the First Ones (CN)"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Fated_Raids", { 1315, 1316, 1317, 1325, 1326, 1328, 1329, 1331, 1332 });
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
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Other", { 479 });
    KrowiAF_RegisterEventOptions("Calendar", "WoW_s_Anniversary", addon.L["WoW's Anniversary"], 1262, addon.L["WoW's 18th Anniversary"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "WoW_s_Anniversary", { 1262 });
end

