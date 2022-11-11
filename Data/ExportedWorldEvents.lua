-- [[ Exported at 2022-11-11 11-29-51 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local objects = addon.Objects;
local event = objects.Event;
local widthMultiplier = addon.Options.WidthMultiplier;
local data = addon.Data;
data.ExportedWorldEvents = {};
local exportedWorldEvents = data.ExportedWorldEvents;

function exportedWorldEvents.Load(e)
    if addon.IsWrathClassic then
        return;
    end

    for i, _ in next, e do
        e[i] = nil;
    end

    e[5175] = event:New(5175, 1408998, addon.L["Assault on Azsuna"], 619, 21600); -- Assault on Azsuna
    e[5177] = event:New(5177, 1409000, addon.L["Assault on Highmountain"], 619, 21600); -- Assault on Highmountain
    e[5178] = event:New(5178, 1409001, addon.L["Assault on Stormheim"], 619, 21600); -- Assault on Stormheim
    e[5210] = event:New(5210, 1409010, addon.L["Assault on Val'sharah"], 619, 21600); -- Assault on Val'sharah
    e[5896] = event:New(5896, 2065630, addon.L["Assault on Tiragarde Sound"], 876, 25200); -- Assault on Tiragarde Sound
    e[5964] = event:New(5964, 2065567, addon.L["Assault on Drustvar"], 876, 25200); -- Assault on Drustvar
    e[5966] = event:New(5966, 2065627, addon.L["Assault on Stormsong Valley"], 876, 25200); -- Assault on Stormsong Valley
    e[5969] = event:New(5969, 2032229, addon.L["Assault on Nazmir"], 875, 25200); -- Assault on Nazmir
    e[5970] = event:New(5970, 2065632, addon.L["Assault on Vol'dun"], 875, 25200); -- Assault on Vol'dun
    e[5973] = event:New(5973, 2065640, addon.L["Assault on Zuldazar"], 875, 25200); -- Assault on Zuldazar
    e[6486] = event:New(6486, 3196264, addon.L["Assault: N'Zoth (Uldum)"], 12, 604800); -- Assault: N'Zoth (Uldum)
    e[6487] = event:New(6487, 415054, addon.L["Assault: Amathet"], 12, 302400); -- Assault: Amathet
    e[6488] = event:New(6488, 458247, addon.L["Assault: Aqir"], 12, 302400); -- Assault: Aqir
    e[6489] = event:New(6489, 3196265, addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"], 424, 604800); -- Assault: N'Zoth (Vale of Eternal Blossoms)
    e[6490] = event:New(6490, 801016, addon.L["Assault: Mogu"], 424, 302400); -- Assault: Mogu
    e[6491] = event:New(6491, 615301, addon.L["Assault: Mantid"], 424, 302400); -- Assault: Mantid
    e[6989] = event:New(6989, 3257749, addon.L["Necrolord Assault"], 1550, 302400); -- Necrolord Assault
    e[6990] = event:New(6990, 3257751, addon.L["Venthyr Assault"], 1550, 302400); -- Venthyr Assault
    e[6991] = event:New(6991, 3257748, addon.L["Kyrian Assault"], 1550, 302400); -- Kyrian Assault
    e[6992] = event:New(6992, 3257750, addon.L["Night Fae Assault"], 1550, 302400); -- Night Fae Assault
    e[7221] = event:New(7221, 132845, addon.L["Nokhudon Hold"], 1978, 5400); -- Nokhudon Hold
    e[7222] = event:New(7222, 451165, addon.L["Nokhudon Hold"], 1978, 5400); -- Nokhudon Hold
    e[7223] = event:New(7223, 460952, addon.L["Nokhudon Hold"], 1978, 5400); -- Nokhudon Hold
    e[7224] = event:New(7224, 135783, addon.L["Nokhudon Hold"], 1978, 5400); -- Nokhudon Hold
    e[7225] = event:New(7225, 132845, addon.L["Ohn'iri Springs"], 1978, 5400); -- Ohn'iri Springs
    e[7226] = event:New(7226, 451165, addon.L["Ohn'iri Springs"], 1978, 5400); -- Ohn'iri Springs
    e[7227] = event:New(7227, 460952, addon.L["Ohn'iri Springs"], 1978, 5400); -- Ohn'iri Springs
    e[7228] = event:New(7228, 135783, addon.L["Ohn'iri Springs"], 1978, 5400); -- Ohn'iri Springs
    e[7229] = event:New(7229, 132845, addon.L["Brackenhide Hollow"], 1978, 5400); -- Brackenhide Hollow
    e[7230] = event:New(7230, 451165, addon.L["Brackenhide Hollow"], 1978, 5400); -- Brackenhide Hollow
    e[7231] = event:New(7231, 460952, addon.L["Brackenhide Hollow"], 1978, 5400); -- Brackenhide Hollow
    e[7232] = event:New(7232, 135783, addon.L["Brackenhide Hollow"], 1978, 5400); -- Brackenhide Hollow
    e[7233] = event:New(7233, 132845, addon.L["Cobalt Assembly"], 1978, 5400); -- Cobalt Assembly
    e[7234] = event:New(7234, 451165, addon.L["Cobalt Assembly"], 1978, 5400); -- Cobalt Assembly
    e[7235] = event:New(7235, 460952, addon.L["Cobalt Assembly"], 1978, 5400); -- Cobalt Assembly
    e[7236] = event:New(7236, 135783, addon.L["Cobalt Assembly"], 1978, 5400); -- Cobalt Assembly
    e[7237] = event:New(7237, 132845, addon.L["Imbu"], 1978, 5400); -- Imbu
    e[7238] = event:New(7238, 451165, addon.L["Imbu"], 1978, 5400); -- Imbu
    e[7239] = event:New(7239, 460952, addon.L["Imbu"], 1978, 5400); -- Imbu
    e[7240] = event:New(7240, 135783, addon.L["Imbu"], 1978, 5400); -- Imbu
    e[7245] = event:New(7245, 132845, addon.L["Tyrhold"], 1978, 5400); -- Tyrhold
    e[7246] = event:New(7246, 451165, addon.L["Tyrhold"], 1978, 5400); -- Tyrhold
    e[7247] = event:New(7247, 460952, addon.L["Tyrhold"], 1978, 5400); -- Tyrhold
    e[7248] = event:New(7248, 135783, addon.L["Tyrhold"], 1978, 5400); -- Tyrhold
    e[7249] = event:New(7249, 132845, addon.L["Dragonbane Keep"], 1978, 5400); -- Dragonbane Keep
    e[7250] = event:New(7250, 451165, addon.L["Dragonbane Keep"], 1978, 5400); -- Dragonbane Keep
    e[7251] = event:New(7251, 460952, addon.L["Dragonbane Keep"], 1978, 5400); -- Dragonbane Keep
    e[7252] = event:New(7252, 135783, addon.L["Dragonbane Keep"], 1978, 5400); -- Dragonbane Keep
    e[7253] = event:New(7253, 132845, addon.L["Slagmire"], 1978, 5400); -- Slagmire
    e[7254] = event:New(7254, 451165, addon.L["Slagmire"], 1978, 5400); -- Slagmire
    e[7255] = event:New(7255, 460952, addon.L["Slagmire"], 1978, 5400); -- Slagmire
    e[7256] = event:New(7256, 135783, addon.L["Slagmire"], 1978, 5400); -- Slagmire
    e[7257] = event:New(7257, 132845, addon.L["Scalecracker Keep"], 1978, 5400); -- Scalecracker Keep
    e[7258] = event:New(7258, 451165, addon.L["Scalecracker Keep"], 1978, 5400); -- Scalecracker Keep
    e[7259] = event:New(7259, 460952, addon.L["Scalecracker Keep"], 1978, 5400); -- Scalecracker Keep
    e[7260] = event:New(7260, 135783, addon.L["Scalecracker Keep"], 1978, 5400); -- Scalecracker Keep
    e[7298] = event:New(7298, 132845, addon.L["Primalist Tomorrow"], 1978, 5400); -- Primalist Tomorrow
    e[7299] = event:New(7299, 451165, addon.L["Primalist Tomorrow"], 1978, 5400); -- Primalist Tomorrow
    e[7300] = event:New(7300, 460952, addon.L["Primalist Tomorrow"], 1978, 5400); -- Primalist Tomorrow
    e[7301] = event:New(7301, 135783, addon.L["Primalist Tomorrow"], 1978, 5400); -- Primalist Tomorrow
    e[7366] = event:New(7366, 451165, addon.L["Badlands"], 15, 5400); -- Badlands
    e[7367] = event:New(7367, 135783, addon.L["Badlands"], 15, 5400); -- Badlands
    e[7368] = event:New(7368, 460952, addon.L["Badlands"], 15, 5400); -- Badlands
    e[7369] = event:New(7369, 132845, addon.L["Badlands"], 15, 5400); -- Badlands
    e[7370] = event:New(7370, 135783, addon.L["Northern Barrens"], 10, 5400); -- Northern Barrens
    e[7371] = event:New(7371, 451165, addon.L["Northern Barrens"], 10, 5400); -- Northern Barrens
    e[7372] = event:New(7372, 460952, addon.L["Northern Barrens"], 10, 5400); -- Northern Barrens
    e[7373] = event:New(7373, 132845, addon.L["Northern Barrens"], 10, 5400); -- Northern Barrens
    e[7374] = event:New(7374, 135783, addon.L["Tirisfal Glades"], 18, 5400); -- Tirisfal Glades
    e[7375] = event:New(7375, 451165, addon.L["Tirisfal Glades"], 18, 5400); -- Tirisfal Glades
    e[7376] = event:New(7376, 460952, addon.L["Tirisfal Glades"], 18, 5400); -- Tirisfal Glades
    e[7377] = event:New(7377, 132845, addon.L["Tirisfal Glades"], 18, 5400); -- Tirisfal Glades
    e[7378] = event:New(7378, 135783, addon.L["Un'Goro Crater"], 78, 5400); -- Un'Goro Crater
    e[7379] = event:New(7379, 451165, addon.L["Un'Goro Crater"], 78, 5400); -- Un'Goro Crater
    e[7380] = event:New(7380, 460952, addon.L["Un'Goro Crater"], 78, 5400); -- Un'Goro Crater
    e[7381] = event:New(7381, 132845, addon.L["Un'Goro Crater"], 78, 5400); -- Un'Goro Crater
end

function exportedWorldEvents.LoadCategories(e)
    if addon.IsWrathClassic then
        return;
    end

    if e[5175] == nil or e[5177] == nil or e[5178] == nil or e[5210] == nil or e[5896] == nil or e[5964] == nil or e[5966] == nil or e[5969] == nil or e[5970] == nil or e[5973] == nil or e[6486] == nil or e[6487] == nil or e[6488] == nil or e[6489] == nil or e[6490] == nil or e[6491] == nil or e[6989] == nil or e[6990] == nil or e[6991] == nil or e[6992] == nil or e[7221] == nil or e[7222] == nil or e[7223] == nil or e[7224] == nil or e[7225] == nil or e[7226] == nil or e[7227] == nil or e[7228] == nil or e[7229] == nil or e[7230] == nil or e[7231] == nil or e[7232] == nil or e[7233] == nil or e[7234] == nil or e[7235] == nil or e[7236] == nil or e[7237] == nil or e[7238] == nil or e[7239] == nil or e[7240] == nil or e[7245] == nil or e[7246] == nil or e[7247] == nil or e[7248] == nil or e[7249] == nil or e[7250] == nil or e[7251] == nil or e[7252] == nil or e[7253] == nil or e[7254] == nil or e[7255] == nil or e[7256] == nil or e[7257] == nil or e[7258] == nil or e[7259] == nil or e[7260] == nil or e[7298] == nil or e[7299] == nil or e[7300] == nil or e[7301] == nil or e[7366] == nil or e[7367] == nil or e[7368] == nil or e[7369] == nil or e[7370] == nil or e[7371] == nil or e[7372] == nil or e[7373] == nil or e[7374] == nil or e[7375] == nil or e[7376] == nil or e[7377] == nil or e[7378] == nil or e[7379] == nil or e[7380] == nil or e[7381] == nil then
        exportedWorldEvents.Load(e);
    end

    e[5175].Category = addon.Tabs["Events"].Categories[9].Children[1]; -- Legion Assaults
    e[5177].Category = addon.Tabs["Events"].Categories[9].Children[1]; -- Legion Assaults
    e[5178].Category = addon.Tabs["Events"].Categories[9].Children[1]; -- Legion Assaults
    e[5210].Category = addon.Tabs["Events"].Categories[9].Children[1]; -- Legion Assaults
    e[5896].Category = addon.Tabs["Events"].Categories[10].Children[1].Children[1]; -- Assault on Tiragarde Sound
    e[5964].Category = addon.Tabs["Events"].Categories[10].Children[1].Children[2]; -- Assault on Drustvar
    e[5966].Category = addon.Tabs["Events"].Categories[10].Children[1].Children[3]; -- Assault on Stormsong Valley
    e[5969].Category = addon.Tabs["Events"].Categories[10].Children[1].Children[5]; -- Assault on Nazmir
    e[5970].Category = addon.Tabs["Events"].Categories[10].Children[1].Children[6]; -- Assault on Vol'dun
    e[5973].Category = addon.Tabs["Events"].Categories[10].Children[1].Children[4]; -- Assault on Zuldazar
    e[6486].Category = addon.Tabs["Events"].Categories[10].Children[2].Children[2]; -- Uldum
    e[6487].Category = addon.Tabs["Events"].Categories[10].Children[2].Children[2]; -- Uldum
    e[6488].Category = addon.Tabs["Events"].Categories[10].Children[2].Children[2]; -- Uldum
    e[6489].Category = addon.Tabs["Events"].Categories[10].Children[2].Children[1]; -- Vale of Eternal Blossoms
    e[6490].Category = addon.Tabs["Events"].Categories[10].Children[2].Children[1]; -- Vale of Eternal Blossoms
    e[6491].Category = addon.Tabs["Events"].Categories[10].Children[2].Children[1]; -- Vale of Eternal Blossoms
    e[6989].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[2]; -- Necrolords Assault
    e[6990].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[4]; -- Venthyr Assault
    e[6991].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[1]; -- Kyrian Assault
    e[6992].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[3]; -- Night Fae Assault
    e[7221].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7222].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7223].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7224].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7225].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7226].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7227].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7228].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7229].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7230].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7231].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7232].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7233].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7234].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7235].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7236].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7237].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7238].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7239].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7240].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7245].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7246].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7247].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7248].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7249].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7250].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7251].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7252].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7253].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7254].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7255].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7256].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7257].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7258].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7259].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7260].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7298].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7299].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7300].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7301].Category = addon.Tabs["Expansions"].Categories[14].Children[7]; -- Primal Storms
    e[7366].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[1].Children[22]; -- Badlands
    e[7367].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[1].Children[22]; -- Badlands
    e[7368].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[1].Children[22]; -- Badlands
    e[7369].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[1].Children[22]; -- Badlands
    e[7370].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[9]; -- Northern Barrens
    e[7371].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[9]; -- Northern Barrens
    e[7372].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[9]; -- Northern Barrens
    e[7373].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[9]; -- Northern Barrens
    e[7374].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[5]; -- Durotar
    e[7375].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[5]; -- Durotar
    e[7376].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[5]; -- Durotar
    e[7377].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[5]; -- Durotar
    e[7378].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[21]; -- Un'Goro Crater
    e[7379].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[21]; -- Un'Goro Crater
    e[7380].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[21]; -- Un'Goro Crater
    e[7381].Category = addon.Tabs["Expansions"].Categories[5].Children[1].Children[2].Children[21]; -- Un'Goro Crater
end

function exportedWorldEvents.InjectOptions()
    if addon.IsWrathClassic then
        return;
    end

    local defaults = {};
    defaults[5175] = true;
    defaults[5177] = true;
    defaults[5178] = true;
    defaults[5210] = true;
    defaults[5896] = true;
    defaults[5964] = true;
    defaults[5966] = true;
    defaults[5969] = true;
    defaults[5970] = true;
    defaults[5973] = true;
    defaults[6486] = true;
    defaults[6487] = true;
    defaults[6488] = true;
    defaults[6489] = true;
    defaults[6490] = true;
    defaults[6491] = true;
    defaults[6989] = true;
    defaults[6990] = true;
    defaults[6991] = true;
    defaults[6992] = true;
    defaults[7221] = true;
    defaults[7222] = true;
    defaults[7223] = true;
    defaults[7224] = true;
    defaults[7225] = true;
    defaults[7226] = true;
    defaults[7227] = true;
    defaults[7228] = true;
    defaults[7229] = true;
    defaults[7230] = true;
    defaults[7231] = true;
    defaults[7232] = true;
    defaults[7233] = true;
    defaults[7234] = true;
    defaults[7235] = true;
    defaults[7236] = true;
    defaults[7237] = true;
    defaults[7238] = true;
    defaults[7239] = true;
    defaults[7240] = true;
    defaults[7245] = true;
    defaults[7246] = true;
    defaults[7247] = true;
    defaults[7248] = true;
    defaults[7249] = true;
    defaults[7250] = true;
    defaults[7251] = true;
    defaults[7252] = true;
    defaults[7253] = true;
    defaults[7254] = true;
    defaults[7255] = true;
    defaults[7256] = true;
    defaults[7257] = true;
    defaults[7258] = true;
    defaults[7259] = true;
    defaults[7260] = true;
    defaults[7298] = true;
    defaults[7299] = true;
    defaults[7300] = true;
    defaults[7301] = true;
    defaults[7366] = true;
    defaults[7367] = true;
    defaults[7368] = true;
    defaults[7369] = true;
    defaults[7370] = true;
    defaults[7371] = true;
    defaults[7372] = true;
    defaults[7373] = true;
    defaults[7374] = true;
    defaults[7375] = true;
    defaults[7376] = true;
    defaults[7377] = true;
    defaults[7378] = true;
    defaults[7379] = true;
    defaults[7380] = true;
    defaults[7381] = true;

    addon.Options.InjectDefaults(defaults, "WorldEvents", "EventReminders");

    local optionsTable = {
        order = 4, type = "group",
        name = addon.L["World Events"],
        args = {
            Battle_for_Azeroth = {
                order = 1, type = "group",
                name = addon.L["Battle for Azeroth"],
                args = {
                    E5896 = {
                        order = 2, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Tiragarde Sound"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5896]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5896] = not addon.Options.db.EventReminders.WorldEvents[5896];
                            diagnostics.Debug(addon.L["Assault on Tiragarde Sound"], addon.Options.db.EventReminders.WorldEvents[5896]);
                        end
                    },
                    E5964 = {
                        order = 3, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Drustvar"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5964]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5964] = not addon.Options.db.EventReminders.WorldEvents[5964];
                            diagnostics.Debug(addon.L["Assault on Drustvar"], addon.Options.db.EventReminders.WorldEvents[5964]);
                        end
                    },
                    E5966 = {
                        order = 4, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Stormsong Valley"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5966]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5966] = not addon.Options.db.EventReminders.WorldEvents[5966];
                            diagnostics.Debug(addon.L["Assault on Stormsong Valley"], addon.Options.db.EventReminders.WorldEvents[5966]);
                        end
                    },
                    E5969 = {
                        order = 5, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Nazmir"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5969]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5969] = not addon.Options.db.EventReminders.WorldEvents[5969];
                            diagnostics.Debug(addon.L["Assault on Nazmir"], addon.Options.db.EventReminders.WorldEvents[5969]);
                        end
                    },
                    E5970 = {
                        order = 6, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Vol'dun"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5970]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5970] = not addon.Options.db.EventReminders.WorldEvents[5970];
                            diagnostics.Debug(addon.L["Assault on Vol'dun"], addon.Options.db.EventReminders.WorldEvents[5970]);
                        end
                    },
                    E5973 = {
                        order = 7, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Zuldazar"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5973]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5973] = not addon.Options.db.EventReminders.WorldEvents[5973];
                            diagnostics.Debug(addon.L["Assault on Zuldazar"], addon.Options.db.EventReminders.WorldEvents[5973]);
                        end
                    },
                    E6486 = {
                        order = 8, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: N'Zoth (Uldum)"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6486]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6486] = not addon.Options.db.EventReminders.WorldEvents[6486];
                            diagnostics.Debug(addon.L["Assault: N'Zoth (Uldum)"], addon.Options.db.EventReminders.WorldEvents[6486]);
                        end
                    },
                    E6487 = {
                        order = 9, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Amathet"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6487]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6487] = not addon.Options.db.EventReminders.WorldEvents[6487];
                            diagnostics.Debug(addon.L["Assault: Amathet"], addon.Options.db.EventReminders.WorldEvents[6487]);
                        end
                    },
                    E6488 = {
                        order = 10, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Aqir"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6488]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6488] = not addon.Options.db.EventReminders.WorldEvents[6488];
                            diagnostics.Debug(addon.L["Assault: Aqir"], addon.Options.db.EventReminders.WorldEvents[6488]);
                        end
                    },
                    E6489 = {
                        order = 11, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6489]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6489] = not addon.Options.db.EventReminders.WorldEvents[6489];
                            diagnostics.Debug(addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"], addon.Options.db.EventReminders.WorldEvents[6489]);
                        end
                    },
                    E6490 = {
                        order = 12, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Mogu"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6490]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6490] = not addon.Options.db.EventReminders.WorldEvents[6490];
                            diagnostics.Debug(addon.L["Assault: Mogu"], addon.Options.db.EventReminders.WorldEvents[6490]);
                        end
                    },
                    E6491 = {
                        order = 13, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Mantid"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6491]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6491] = not addon.Options.db.EventReminders.WorldEvents[6491];
                            diagnostics.Debug(addon.L["Assault: Mantid"], addon.Options.db.EventReminders.WorldEvents[6491]);
                        end
                    },
                    Blank14 = {order = 14, type = "description", width = "full", name = ""},
                    SelectAll15 = {
                        order = 15, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[5896] = true;
                            addon.Options.db.EventReminders.WorldEvents[5964] = true;
                            addon.Options.db.EventReminders.WorldEvents[5966] = true;
                            addon.Options.db.EventReminders.WorldEvents[5969] = true;
                            addon.Options.db.EventReminders.WorldEvents[5970] = true;
                            addon.Options.db.EventReminders.WorldEvents[5973] = true;
                            addon.Options.db.EventReminders.WorldEvents[6486] = true;
                            addon.Options.db.EventReminders.WorldEvents[6487] = true;
                            addon.Options.db.EventReminders.WorldEvents[6488] = true;
                            addon.Options.db.EventReminders.WorldEvents[6489] = true;
                            addon.Options.db.EventReminders.WorldEvents[6490] = true;
                            addon.Options.db.EventReminders.WorldEvents[6491] = true;
                        end
                    },
                    DeselectAll16 = {
                        order = 16, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[5896] = false;
                            addon.Options.db.EventReminders.WorldEvents[5964] = false;
                            addon.Options.db.EventReminders.WorldEvents[5966] = false;
                            addon.Options.db.EventReminders.WorldEvents[5969] = false;
                            addon.Options.db.EventReminders.WorldEvents[5970] = false;
                            addon.Options.db.EventReminders.WorldEvents[5973] = false;
                            addon.Options.db.EventReminders.WorldEvents[6486] = false;
                            addon.Options.db.EventReminders.WorldEvents[6487] = false;
                            addon.Options.db.EventReminders.WorldEvents[6488] = false;
                            addon.Options.db.EventReminders.WorldEvents[6489] = false;
                            addon.Options.db.EventReminders.WorldEvents[6490] = false;
                            addon.Options.db.EventReminders.WorldEvents[6491] = false;
                        end
                    },
                }
            },
            Dragonflight___Firestorms = {
                order = 17, type = "group",
                name = addon.L["Dragonflight - Firestorms"],
                args = {
                    E7223 = {
                        order = 18, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7223]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7223] = not addon.Options.db.EventReminders.WorldEvents[7223];
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7223]);
                        end
                    },
                    E7227 = {
                        order = 19, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7227]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7227] = not addon.Options.db.EventReminders.WorldEvents[7227];
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7227]);
                        end
                    },
                    E7231 = {
                        order = 20, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7231]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7231] = not addon.Options.db.EventReminders.WorldEvents[7231];
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7231]);
                        end
                    },
                    E7235 = {
                        order = 21, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7235]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7235] = not addon.Options.db.EventReminders.WorldEvents[7235];
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7235]);
                        end
                    },
                    E7239 = {
                        order = 22, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7239]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7239] = not addon.Options.db.EventReminders.WorldEvents[7239];
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7239]);
                        end
                    },
                    E7247 = {
                        order = 23, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7247]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7247] = not addon.Options.db.EventReminders.WorldEvents[7247];
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7247]);
                        end
                    },
                    E7251 = {
                        order = 24, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7251]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7251] = not addon.Options.db.EventReminders.WorldEvents[7251];
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7251]);
                        end
                    },
                    E7255 = {
                        order = 25, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7255]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7255] = not addon.Options.db.EventReminders.WorldEvents[7255];
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7255]);
                        end
                    },
                    E7259 = {
                        order = 26, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7259]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7259] = not addon.Options.db.EventReminders.WorldEvents[7259];
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7259]);
                        end
                    },
                    E7300 = {
                        order = 27, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7300]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7300] = not addon.Options.db.EventReminders.WorldEvents[7300];
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7300]);
                        end
                    },
                    Blank28 = {order = 28, type = "description", width = "full", name = ""},
                    SelectAll29 = {
                        order = 29, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7223] = true;
                            addon.Options.db.EventReminders.WorldEvents[7227] = true;
                            addon.Options.db.EventReminders.WorldEvents[7231] = true;
                            addon.Options.db.EventReminders.WorldEvents[7235] = true;
                            addon.Options.db.EventReminders.WorldEvents[7239] = true;
                            addon.Options.db.EventReminders.WorldEvents[7247] = true;
                            addon.Options.db.EventReminders.WorldEvents[7251] = true;
                            addon.Options.db.EventReminders.WorldEvents[7255] = true;
                            addon.Options.db.EventReminders.WorldEvents[7259] = true;
                            addon.Options.db.EventReminders.WorldEvents[7300] = true;
                        end
                    },
                    DeselectAll30 = {
                        order = 30, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7223] = false;
                            addon.Options.db.EventReminders.WorldEvents[7227] = false;
                            addon.Options.db.EventReminders.WorldEvents[7231] = false;
                            addon.Options.db.EventReminders.WorldEvents[7235] = false;
                            addon.Options.db.EventReminders.WorldEvents[7239] = false;
                            addon.Options.db.EventReminders.WorldEvents[7247] = false;
                            addon.Options.db.EventReminders.WorldEvents[7251] = false;
                            addon.Options.db.EventReminders.WorldEvents[7255] = false;
                            addon.Options.db.EventReminders.WorldEvents[7259] = false;
                            addon.Options.db.EventReminders.WorldEvents[7300] = false;
                        end
                    },
                }
            },
            Dragonflight___Sandstorms = {
                order = 31, type = "group",
                name = addon.L["Dragonflight - Sandstorms"],
                args = {
                    E7222 = {
                        order = 32, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7222]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7222] = not addon.Options.db.EventReminders.WorldEvents[7222];
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7222]);
                        end
                    },
                    E7226 = {
                        order = 33, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7226]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7226] = not addon.Options.db.EventReminders.WorldEvents[7226];
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7226]);
                        end
                    },
                    E7230 = {
                        order = 34, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7230]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7230] = not addon.Options.db.EventReminders.WorldEvents[7230];
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7230]);
                        end
                    },
                    E7234 = {
                        order = 35, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7234]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7234] = not addon.Options.db.EventReminders.WorldEvents[7234];
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7234]);
                        end
                    },
                    E7238 = {
                        order = 36, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7238]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7238] = not addon.Options.db.EventReminders.WorldEvents[7238];
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7238]);
                        end
                    },
                    E7246 = {
                        order = 37, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7246]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7246] = not addon.Options.db.EventReminders.WorldEvents[7246];
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7246]);
                        end
                    },
                    E7250 = {
                        order = 38, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7250]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7250] = not addon.Options.db.EventReminders.WorldEvents[7250];
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7250]);
                        end
                    },
                    E7254 = {
                        order = 39, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7254]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7254] = not addon.Options.db.EventReminders.WorldEvents[7254];
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7254]);
                        end
                    },
                    E7258 = {
                        order = 40, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7258]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7258] = not addon.Options.db.EventReminders.WorldEvents[7258];
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7258]);
                        end
                    },
                    E7299 = {
                        order = 41, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7299]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7299] = not addon.Options.db.EventReminders.WorldEvents[7299];
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7299]);
                        end
                    },
                    Blank42 = {order = 42, type = "description", width = "full", name = ""},
                    SelectAll43 = {
                        order = 43, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7222] = true;
                            addon.Options.db.EventReminders.WorldEvents[7226] = true;
                            addon.Options.db.EventReminders.WorldEvents[7230] = true;
                            addon.Options.db.EventReminders.WorldEvents[7234] = true;
                            addon.Options.db.EventReminders.WorldEvents[7238] = true;
                            addon.Options.db.EventReminders.WorldEvents[7246] = true;
                            addon.Options.db.EventReminders.WorldEvents[7250] = true;
                            addon.Options.db.EventReminders.WorldEvents[7254] = true;
                            addon.Options.db.EventReminders.WorldEvents[7258] = true;
                            addon.Options.db.EventReminders.WorldEvents[7299] = true;
                        end
                    },
                    DeselectAll44 = {
                        order = 44, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7222] = false;
                            addon.Options.db.EventReminders.WorldEvents[7226] = false;
                            addon.Options.db.EventReminders.WorldEvents[7230] = false;
                            addon.Options.db.EventReminders.WorldEvents[7234] = false;
                            addon.Options.db.EventReminders.WorldEvents[7238] = false;
                            addon.Options.db.EventReminders.WorldEvents[7246] = false;
                            addon.Options.db.EventReminders.WorldEvents[7250] = false;
                            addon.Options.db.EventReminders.WorldEvents[7254] = false;
                            addon.Options.db.EventReminders.WorldEvents[7258] = false;
                            addon.Options.db.EventReminders.WorldEvents[7299] = false;
                        end
                    },
                }
            },
            Dragonflight___Snowstorms = {
                order = 45, type = "group",
                name = addon.L["Dragonflight - Snowstorms"],
                args = {
                    E7224 = {
                        order = 46, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7224]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7224] = not addon.Options.db.EventReminders.WorldEvents[7224];
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7224]);
                        end
                    },
                    E7228 = {
                        order = 47, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7228]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7228] = not addon.Options.db.EventReminders.WorldEvents[7228];
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7228]);
                        end
                    },
                    E7232 = {
                        order = 48, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7232]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7232] = not addon.Options.db.EventReminders.WorldEvents[7232];
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7232]);
                        end
                    },
                    E7236 = {
                        order = 49, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7236]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7236] = not addon.Options.db.EventReminders.WorldEvents[7236];
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7236]);
                        end
                    },
                    E7240 = {
                        order = 50, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7240]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7240] = not addon.Options.db.EventReminders.WorldEvents[7240];
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7240]);
                        end
                    },
                    E7248 = {
                        order = 51, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7248]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7248] = not addon.Options.db.EventReminders.WorldEvents[7248];
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7248]);
                        end
                    },
                    E7252 = {
                        order = 52, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7252]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7252] = not addon.Options.db.EventReminders.WorldEvents[7252];
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7252]);
                        end
                    },
                    E7256 = {
                        order = 53, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7256]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7256] = not addon.Options.db.EventReminders.WorldEvents[7256];
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7256]);
                        end
                    },
                    E7260 = {
                        order = 54, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7260]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7260] = not addon.Options.db.EventReminders.WorldEvents[7260];
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7260]);
                        end
                    },
                    E7301 = {
                        order = 55, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7301]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7301] = not addon.Options.db.EventReminders.WorldEvents[7301];
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7301]);
                        end
                    },
                    Blank56 = {order = 56, type = "description", width = "full", name = ""},
                    SelectAll57 = {
                        order = 57, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7224] = true;
                            addon.Options.db.EventReminders.WorldEvents[7228] = true;
                            addon.Options.db.EventReminders.WorldEvents[7232] = true;
                            addon.Options.db.EventReminders.WorldEvents[7236] = true;
                            addon.Options.db.EventReminders.WorldEvents[7240] = true;
                            addon.Options.db.EventReminders.WorldEvents[7248] = true;
                            addon.Options.db.EventReminders.WorldEvents[7252] = true;
                            addon.Options.db.EventReminders.WorldEvents[7256] = true;
                            addon.Options.db.EventReminders.WorldEvents[7260] = true;
                            addon.Options.db.EventReminders.WorldEvents[7301] = true;
                        end
                    },
                    DeselectAll58 = {
                        order = 58, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7224] = false;
                            addon.Options.db.EventReminders.WorldEvents[7228] = false;
                            addon.Options.db.EventReminders.WorldEvents[7232] = false;
                            addon.Options.db.EventReminders.WorldEvents[7236] = false;
                            addon.Options.db.EventReminders.WorldEvents[7240] = false;
                            addon.Options.db.EventReminders.WorldEvents[7248] = false;
                            addon.Options.db.EventReminders.WorldEvents[7252] = false;
                            addon.Options.db.EventReminders.WorldEvents[7256] = false;
                            addon.Options.db.EventReminders.WorldEvents[7260] = false;
                            addon.Options.db.EventReminders.WorldEvents[7301] = false;
                        end
                    },
                }
            },
            Dragonflight___Thunderstorms = {
                order = 59, type = "group",
                name = addon.L["Dragonflight - Thunderstorms"],
                args = {
                    E7221 = {
                        order = 60, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7221]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7221] = not addon.Options.db.EventReminders.WorldEvents[7221];
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7221]);
                        end
                    },
                    E7225 = {
                        order = 61, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7225]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7225] = not addon.Options.db.EventReminders.WorldEvents[7225];
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7225]);
                        end
                    },
                    E7229 = {
                        order = 62, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7229]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7229] = not addon.Options.db.EventReminders.WorldEvents[7229];
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7229]);
                        end
                    },
                    E7233 = {
                        order = 63, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7233]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7233] = not addon.Options.db.EventReminders.WorldEvents[7233];
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7233]);
                        end
                    },
                    E7237 = {
                        order = 64, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7237]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7237] = not addon.Options.db.EventReminders.WorldEvents[7237];
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7237]);
                        end
                    },
                    E7245 = {
                        order = 65, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7245]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7245] = not addon.Options.db.EventReminders.WorldEvents[7245];
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7245]);
                        end
                    },
                    E7249 = {
                        order = 66, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7249]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7249] = not addon.Options.db.EventReminders.WorldEvents[7249];
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7249]);
                        end
                    },
                    E7253 = {
                        order = 67, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7253]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7253] = not addon.Options.db.EventReminders.WorldEvents[7253];
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7253]);
                        end
                    },
                    E7257 = {
                        order = 68, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7257]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7257] = not addon.Options.db.EventReminders.WorldEvents[7257];
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7257]);
                        end
                    },
                    E7298 = {
                        order = 69, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7298]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7298] = not addon.Options.db.EventReminders.WorldEvents[7298];
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7298]);
                        end
                    },
                    Blank70 = {order = 70, type = "description", width = "full", name = ""},
                    SelectAll71 = {
                        order = 71, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7221] = true;
                            addon.Options.db.EventReminders.WorldEvents[7225] = true;
                            addon.Options.db.EventReminders.WorldEvents[7229] = true;
                            addon.Options.db.EventReminders.WorldEvents[7233] = true;
                            addon.Options.db.EventReminders.WorldEvents[7237] = true;
                            addon.Options.db.EventReminders.WorldEvents[7245] = true;
                            addon.Options.db.EventReminders.WorldEvents[7249] = true;
                            addon.Options.db.EventReminders.WorldEvents[7253] = true;
                            addon.Options.db.EventReminders.WorldEvents[7257] = true;
                            addon.Options.db.EventReminders.WorldEvents[7298] = true;
                        end
                    },
                    DeselectAll72 = {
                        order = 72, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7221] = false;
                            addon.Options.db.EventReminders.WorldEvents[7225] = false;
                            addon.Options.db.EventReminders.WorldEvents[7229] = false;
                            addon.Options.db.EventReminders.WorldEvents[7233] = false;
                            addon.Options.db.EventReminders.WorldEvents[7237] = false;
                            addon.Options.db.EventReminders.WorldEvents[7245] = false;
                            addon.Options.db.EventReminders.WorldEvents[7249] = false;
                            addon.Options.db.EventReminders.WorldEvents[7253] = false;
                            addon.Options.db.EventReminders.WorldEvents[7257] = false;
                            addon.Options.db.EventReminders.WorldEvents[7298] = false;
                        end
                    },
                }
            },
            Dragonflight_pre_patch___Firestorms = {
                order = 73, type = "group",
                name = addon.L["Dragonflight pre-patch - Firestorms"],
                args = {
                    E7368 = {
                        order = 74, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Badlands"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7368]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7368] = not addon.Options.db.EventReminders.WorldEvents[7368];
                            diagnostics.Debug(addon.L["Badlands"], addon.Options.db.EventReminders.WorldEvents[7368]);
                        end
                    },
                    E7372 = {
                        order = 75, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Northern Barrens"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7372]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7372] = not addon.Options.db.EventReminders.WorldEvents[7372];
                            diagnostics.Debug(addon.L["Northern Barrens"], addon.Options.db.EventReminders.WorldEvents[7372]);
                        end
                    },
                    E7376 = {
                        order = 76, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tirisfal Glades"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7376]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7376] = not addon.Options.db.EventReminders.WorldEvents[7376];
                            diagnostics.Debug(addon.L["Tirisfal Glades"], addon.Options.db.EventReminders.WorldEvents[7376]);
                        end
                    },
                    E7380 = {
                        order = 77, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Un'Goro Crater"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7380]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7380] = not addon.Options.db.EventReminders.WorldEvents[7380];
                            diagnostics.Debug(addon.L["Un'Goro Crater"], addon.Options.db.EventReminders.WorldEvents[7380]);
                        end
                    },
                    Blank78 = {order = 78, type = "description", width = "full", name = ""},
                    SelectAll79 = {
                        order = 79, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7368] = true;
                            addon.Options.db.EventReminders.WorldEvents[7372] = true;
                            addon.Options.db.EventReminders.WorldEvents[7376] = true;
                            addon.Options.db.EventReminders.WorldEvents[7380] = true;
                        end
                    },
                    DeselectAll80 = {
                        order = 80, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7368] = false;
                            addon.Options.db.EventReminders.WorldEvents[7372] = false;
                            addon.Options.db.EventReminders.WorldEvents[7376] = false;
                            addon.Options.db.EventReminders.WorldEvents[7380] = false;
                        end
                    },
                }
            },
            Dragonflight_pre_patch___Sandstorms = {
                order = 81, type = "group",
                name = addon.L["Dragonflight pre-patch - Sandstorms"],
                args = {
                    E7366 = {
                        order = 82, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Badlands"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7366]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7366] = not addon.Options.db.EventReminders.WorldEvents[7366];
                            diagnostics.Debug(addon.L["Badlands"], addon.Options.db.EventReminders.WorldEvents[7366]);
                        end
                    },
                    E7371 = {
                        order = 83, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Northern Barrens"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7371]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7371] = not addon.Options.db.EventReminders.WorldEvents[7371];
                            diagnostics.Debug(addon.L["Northern Barrens"], addon.Options.db.EventReminders.WorldEvents[7371]);
                        end
                    },
                    E7375 = {
                        order = 84, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tirisfal Glades"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7375]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7375] = not addon.Options.db.EventReminders.WorldEvents[7375];
                            diagnostics.Debug(addon.L["Tirisfal Glades"], addon.Options.db.EventReminders.WorldEvents[7375]);
                        end
                    },
                    E7379 = {
                        order = 85, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Un'Goro Crater"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7379]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7379] = not addon.Options.db.EventReminders.WorldEvents[7379];
                            diagnostics.Debug(addon.L["Un'Goro Crater"], addon.Options.db.EventReminders.WorldEvents[7379]);
                        end
                    },
                    Blank86 = {order = 86, type = "description", width = "full", name = ""},
                    SelectAll87 = {
                        order = 87, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7366] = true;
                            addon.Options.db.EventReminders.WorldEvents[7371] = true;
                            addon.Options.db.EventReminders.WorldEvents[7375] = true;
                            addon.Options.db.EventReminders.WorldEvents[7379] = true;
                        end
                    },
                    DeselectAll88 = {
                        order = 88, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7366] = false;
                            addon.Options.db.EventReminders.WorldEvents[7371] = false;
                            addon.Options.db.EventReminders.WorldEvents[7375] = false;
                            addon.Options.db.EventReminders.WorldEvents[7379] = false;
                        end
                    },
                }
            },
            Dragonflight_pre_patch___Snowstorms = {
                order = 89, type = "group",
                name = addon.L["Dragonflight pre-patch - Snowstorms"],
                args = {
                    E7367 = {
                        order = 90, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Badlands"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7367]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7367] = not addon.Options.db.EventReminders.WorldEvents[7367];
                            diagnostics.Debug(addon.L["Badlands"], addon.Options.db.EventReminders.WorldEvents[7367]);
                        end
                    },
                    E7370 = {
                        order = 91, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Northern Barrens"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7370]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7370] = not addon.Options.db.EventReminders.WorldEvents[7370];
                            diagnostics.Debug(addon.L["Northern Barrens"], addon.Options.db.EventReminders.WorldEvents[7370]);
                        end
                    },
                    E7374 = {
                        order = 92, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tirisfal Glades"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7374]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7374] = not addon.Options.db.EventReminders.WorldEvents[7374];
                            diagnostics.Debug(addon.L["Tirisfal Glades"], addon.Options.db.EventReminders.WorldEvents[7374]);
                        end
                    },
                    E7378 = {
                        order = 93, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Un'Goro Crater"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7378]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7378] = not addon.Options.db.EventReminders.WorldEvents[7378];
                            diagnostics.Debug(addon.L["Un'Goro Crater"], addon.Options.db.EventReminders.WorldEvents[7378]);
                        end
                    },
                    Blank94 = {order = 94, type = "description", width = "full", name = ""},
                    SelectAll95 = {
                        order = 95, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7367] = true;
                            addon.Options.db.EventReminders.WorldEvents[7370] = true;
                            addon.Options.db.EventReminders.WorldEvents[7374] = true;
                            addon.Options.db.EventReminders.WorldEvents[7378] = true;
                        end
                    },
                    DeselectAll96 = {
                        order = 96, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7367] = false;
                            addon.Options.db.EventReminders.WorldEvents[7370] = false;
                            addon.Options.db.EventReminders.WorldEvents[7374] = false;
                            addon.Options.db.EventReminders.WorldEvents[7378] = false;
                        end
                    },
                }
            },
            Dragonflight_pre_patch___Thunderstorms = {
                order = 97, type = "group",
                name = addon.L["Dragonflight pre-patch - Thunderstorms"],
                args = {
                    E7369 = {
                        order = 98, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Badlands"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7369]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7369] = not addon.Options.db.EventReminders.WorldEvents[7369];
                            diagnostics.Debug(addon.L["Badlands"], addon.Options.db.EventReminders.WorldEvents[7369]);
                        end
                    },
                    E7373 = {
                        order = 99, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Northern Barrens"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7373]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7373] = not addon.Options.db.EventReminders.WorldEvents[7373];
                            diagnostics.Debug(addon.L["Northern Barrens"], addon.Options.db.EventReminders.WorldEvents[7373]);
                        end
                    },
                    E7377 = {
                        order = 100, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tirisfal Glades"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7377]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7377] = not addon.Options.db.EventReminders.WorldEvents[7377];
                            diagnostics.Debug(addon.L["Tirisfal Glades"], addon.Options.db.EventReminders.WorldEvents[7377]);
                        end
                    },
                    E7381 = {
                        order = 101, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Un'Goro Crater"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7381]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7381] = not addon.Options.db.EventReminders.WorldEvents[7381];
                            diagnostics.Debug(addon.L["Un'Goro Crater"], addon.Options.db.EventReminders.WorldEvents[7381]);
                        end
                    },
                    Blank102 = {order = 102, type = "description", width = "full", name = ""},
                    SelectAll103 = {
                        order = 103, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7369] = true;
                            addon.Options.db.EventReminders.WorldEvents[7373] = true;
                            addon.Options.db.EventReminders.WorldEvents[7377] = true;
                            addon.Options.db.EventReminders.WorldEvents[7381] = true;
                        end
                    },
                    DeselectAll104 = {
                        order = 104, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7369] = false;
                            addon.Options.db.EventReminders.WorldEvents[7373] = false;
                            addon.Options.db.EventReminders.WorldEvents[7377] = false;
                            addon.Options.db.EventReminders.WorldEvents[7381] = false;
                        end
                    },
                }
            },
            Legion = {
                order = 105, type = "group",
                name = addon.L["Legion"],
                args = {
                    E5175 = {
                        order = 106, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Azsuna"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5175]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5175] = not addon.Options.db.EventReminders.WorldEvents[5175];
                            diagnostics.Debug(addon.L["Assault on Azsuna"], addon.Options.db.EventReminders.WorldEvents[5175]);
                        end
                    },
                    E5177 = {
                        order = 107, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Highmountain"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5177]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5177] = not addon.Options.db.EventReminders.WorldEvents[5177];
                            diagnostics.Debug(addon.L["Assault on Highmountain"], addon.Options.db.EventReminders.WorldEvents[5177]);
                        end
                    },
                    E5178 = {
                        order = 108, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Stormheim"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5178]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5178] = not addon.Options.db.EventReminders.WorldEvents[5178];
                            diagnostics.Debug(addon.L["Assault on Stormheim"], addon.Options.db.EventReminders.WorldEvents[5178]);
                        end
                    },
                    E5210 = {
                        order = 109, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Val'sharah"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5210]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5210] = not addon.Options.db.EventReminders.WorldEvents[5210];
                            diagnostics.Debug(addon.L["Assault on Val'sharah"], addon.Options.db.EventReminders.WorldEvents[5210]);
                        end
                    },
                    Blank110 = {order = 110, type = "description", width = "full", name = ""},
                    SelectAll111 = {
                        order = 111, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[5175] = true;
                            addon.Options.db.EventReminders.WorldEvents[5177] = true;
                            addon.Options.db.EventReminders.WorldEvents[5178] = true;
                            addon.Options.db.EventReminders.WorldEvents[5210] = true;
                        end
                    },
                    DeselectAll112 = {
                        order = 112, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[5175] = false;
                            addon.Options.db.EventReminders.WorldEvents[5177] = false;
                            addon.Options.db.EventReminders.WorldEvents[5178] = false;
                            addon.Options.db.EventReminders.WorldEvents[5210] = false;
                        end
                    },
                }
            },
            Shadowlands = {
                order = 113, type = "group",
                name = addon.L["Shadowlands"],
                args = {
                    E6989 = {
                        order = 114, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Necrolord Assault"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6989]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6989] = not addon.Options.db.EventReminders.WorldEvents[6989];
                            diagnostics.Debug(addon.L["Necrolord Assault"], addon.Options.db.EventReminders.WorldEvents[6989]);
                        end
                    },
                    E6990 = {
                        order = 115, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Venthyr Assault"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6990]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6990] = not addon.Options.db.EventReminders.WorldEvents[6990];
                            diagnostics.Debug(addon.L["Venthyr Assault"], addon.Options.db.EventReminders.WorldEvents[6990]);
                        end
                    },
                    E6991 = {
                        order = 116, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Kyrian Assault"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6991]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6991] = not addon.Options.db.EventReminders.WorldEvents[6991];
                            diagnostics.Debug(addon.L["Kyrian Assault"], addon.Options.db.EventReminders.WorldEvents[6991]);
                        end
                    },
                    E6992 = {
                        order = 117, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Night Fae Assault"],
                        desc = addon.L["Requires a reload"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6992]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6992] = not addon.Options.db.EventReminders.WorldEvents[6992];
                            diagnostics.Debug(addon.L["Night Fae Assault"], addon.Options.db.EventReminders.WorldEvents[6992]);
                        end
                    },
            Blank118 = {order = 118, type = "description", width = "full", name = ""},
            SelectAll119 = {
                order = 119, type = "execute", width = 1 * widthMultiplier,
                name = addon.L["Select All"],
                func = function()
                    addon.Options.db.EventReminders.WorldEvents[6989] = true;
                    addon.Options.db.EventReminders.WorldEvents[6990] = true;
                    addon.Options.db.EventReminders.WorldEvents[6991] = true;
                    addon.Options.db.EventReminders.WorldEvents[6992] = true;
                end
            },
            DeselectAll120 = {
                order = 120, type = "execute",
                name = addon.L["Deselect All"],
                func = function()
                    addon.Options.db.EventReminders.WorldEvents[6989] = false;
                    addon.Options.db.EventReminders.WorldEvents[6990] = false;
                    addon.Options.db.EventReminders.WorldEvents[6991] = false;
                    addon.Options.db.EventReminders.WorldEvents[6992] = false;
                end
            },
                }
            },
            Blank121 = {order = 121, type = "description", width = 2 * widthMultiplier, name = ""},
            RefreshEvents122 = {
                order = 122, type = "execute", width = 1 * widthMultiplier,
                name = addon.L["Refresh Events"],
                desc = addon.L["Requires a reload"],
                func = function()
                    EventDetails.WorldEvents = nil;
                    addon.EventData.Load();
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "WorldEvents", "EventReminders", "args");
end

