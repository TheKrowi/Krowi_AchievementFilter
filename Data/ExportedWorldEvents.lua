-- [[ Exported at 2022-12-20 13-50-52 ]] --
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
    e[7104] = event:New(7104, 1394891, addon.L["Siege on Dragonbane Keep: Active"], 2022, 3600); -- Siege on Dragonbane Keep: Active
    e[7218] = event:New(7218, 4240492, addon.L["Community Feast: Cooking"], 2024, 900); -- Community Feast: Cooking
    e[7219] = event:New(7219, 4240492, addon.L["Community Feast: Soon"], 2024, 960); -- Community Feast: Soon
    e[7220] = event:New(7220, 4240492, addon.L["Community Feast: Ready"], 2024, 2700); -- Community Feast: Ready
    e[7221] = event:New(7221, 132845, addon.L["Nokhudon Hold"], 2023, 5400); -- Nokhudon Hold
    e[7222] = event:New(7222, 451165, addon.L["Nokhudon Hold"], 2023, 5400); -- Nokhudon Hold
    e[7223] = event:New(7223, 460952, addon.L["Nokhudon Hold"], 2023, 5400); -- Nokhudon Hold
    e[7224] = event:New(7224, 135783, addon.L["Nokhudon Hold"], 2023, 5400); -- Nokhudon Hold
    e[7225] = event:New(7225, 132845, addon.L["Ohn'iri Springs"], 2023, 5400); -- Ohn'iri Springs
    e[7226] = event:New(7226, 451165, addon.L["Ohn'iri Springs"], 2023, 5400); -- Ohn'iri Springs
    e[7227] = event:New(7227, 460952, addon.L["Ohn'iri Springs"], 2023, 5400); -- Ohn'iri Springs
    e[7228] = event:New(7228, 135783, addon.L["Ohn'iri Springs"], 2023, 5400); -- Ohn'iri Springs
    e[7229] = event:New(7229, 132845, addon.L["Brackenhide Hollow"], 2024, 5400); -- Brackenhide Hollow
    e[7230] = event:New(7230, 451165, addon.L["Brackenhide Hollow"], 2024, 5400); -- Brackenhide Hollow
    e[7231] = event:New(7231, 460952, addon.L["Brackenhide Hollow"], 2024, 5400); -- Brackenhide Hollow
    e[7232] = event:New(7232, 135783, addon.L["Brackenhide Hollow"], 2024, 5400); -- Brackenhide Hollow
    e[7233] = event:New(7233, 132845, addon.L["Cobalt Assembly"], 2024, 5400); -- Cobalt Assembly
    e[7234] = event:New(7234, 451165, addon.L["Cobalt Assembly"], 2024, 5400); -- Cobalt Assembly
    e[7235] = event:New(7235, 460952, addon.L["Cobalt Assembly"], 2024, 5400); -- Cobalt Assembly
    e[7236] = event:New(7236, 135783, addon.L["Cobalt Assembly"], 2024, 5400); -- Cobalt Assembly
    e[7237] = event:New(7237, 132845, addon.L["Imbu"], 2024, 5400); -- Imbu
    e[7238] = event:New(7238, 451165, addon.L["Imbu"], 2024, 5400); -- Imbu
    e[7239] = event:New(7239, 460952, addon.L["Imbu"], 2024, 5400); -- Imbu
    e[7240] = event:New(7240, 135783, addon.L["Imbu"], 2024, 5400); -- Imbu
    e[7245] = event:New(7245, 132845, addon.L["Tyrhold"], 2025, 5400); -- Tyrhold
    e[7246] = event:New(7246, 451165, addon.L["Tyrhold"], 2025, 5400); -- Tyrhold
    e[7247] = event:New(7247, 460952, addon.L["Tyrhold"], 2025, 5400); -- Tyrhold
    e[7248] = event:New(7248, 135783, addon.L["Tyrhold"], 2025, 5400); -- Tyrhold
    e[7249] = event:New(7249, 132845, addon.L["Dragonbane Keep"], 2022, 5400); -- Dragonbane Keep
    e[7250] = event:New(7250, 451165, addon.L["Dragonbane Keep"], 2022, 5400); -- Dragonbane Keep
    e[7251] = event:New(7251, 460952, addon.L["Dragonbane Keep"], 2022, 5400); -- Dragonbane Keep
    e[7252] = event:New(7252, 135783, addon.L["Dragonbane Keep"], 2022, 5400); -- Dragonbane Keep
    e[7253] = event:New(7253, 132845, addon.L["Slagmire"], 2022, 5400); -- Slagmire
    e[7254] = event:New(7254, 451165, addon.L["Slagmire"], 2022, 5400); -- Slagmire
    e[7255] = event:New(7255, 460952, addon.L["Slagmire"], 2022, 5400); -- Slagmire
    e[7256] = event:New(7256, 135783, addon.L["Slagmire"], 2022, 5400); -- Slagmire
    e[7257] = event:New(7257, 132845, addon.L["Scalecracker Keep"], 2022, 5400); -- Scalecracker Keep
    e[7258] = event:New(7258, 451165, addon.L["Scalecracker Keep"], 2022, 5400); -- Scalecracker Keep
    e[7259] = event:New(7259, 460952, addon.L["Scalecracker Keep"], 2022, 5400); -- Scalecracker Keep
    e[7260] = event:New(7260, 135783, addon.L["Scalecracker Keep"], 2022, 5400); -- Scalecracker Keep
    e[7267] = event:New(7267, 1394891, addon.L["Siege on Dragonbane Keep: Gathering"], 2022, 3600); -- Siege on Dragonbane Keep: Gathering
    e[7298] = event:New(7298, 132845, addon.L["Primalist Tomorrow"], 2025, 5400); -- Primalist Tomorrow
    e[7299] = event:New(7299, 451165, addon.L["Primalist Tomorrow"], 2025, 5400); -- Primalist Tomorrow
    e[7300] = event:New(7300, 460952, addon.L["Primalist Tomorrow"], 2025, 5400); -- Primalist Tomorrow
    e[7301] = event:New(7301, 135783, addon.L["Primalist Tomorrow"], 2025, 5400); -- Primalist Tomorrow
    e[7342] = event:New(7342, 4622465, addon.L["Grand Hunts: Ohn'ahran Plains"], 1978, 7200); -- Grand Hunts: Ohn'ahran Plains
    e[7343] = event:New(7343, 4622465, addon.L["Grand Hunts: The Waking Shore"], 1978, 7200); -- Grand Hunts: The Waking Shore
    e[7344] = event:New(7344, 4622465, addon.L["Grand Hunts: Thaldraszus"], 1978, 7200); -- Grand Hunts: Thaldraszus
    e[7345] = event:New(7345, 4622465, addon.L["Grand Hunts: The Azure Span"], 1978, 7200); -- Grand Hunts: The Azure Span
end

function exportedWorldEvents.LoadCategories(e)
    if addon.IsWrathClassic then
        return;
    end

    if e[5175] == nil or e[5177] == nil or e[5178] == nil or e[5210] == nil or e[5896] == nil or e[5964] == nil or e[5966] == nil or e[5969] == nil or e[5970] == nil or e[5973] == nil or e[6486] == nil or e[6487] == nil or e[6488] == nil or e[6489] == nil or e[6490] == nil or e[6491] == nil or e[6989] == nil or e[6990] == nil or e[6991] == nil or e[6992] == nil or e[7104] == nil or e[7218] == nil or e[7219] == nil or e[7220] == nil or e[7221] == nil or e[7222] == nil or e[7223] == nil or e[7224] == nil or e[7225] == nil or e[7226] == nil or e[7227] == nil or e[7228] == nil or e[7229] == nil or e[7230] == nil or e[7231] == nil or e[7232] == nil or e[7233] == nil or e[7234] == nil or e[7235] == nil or e[7236] == nil or e[7237] == nil or e[7238] == nil or e[7239] == nil or e[7240] == nil or e[7245] == nil or e[7246] == nil or e[7247] == nil or e[7248] == nil or e[7249] == nil or e[7250] == nil or e[7251] == nil or e[7252] == nil or e[7253] == nil or e[7254] == nil or e[7255] == nil or e[7256] == nil or e[7257] == nil or e[7258] == nil or e[7259] == nil or e[7260] == nil or e[7267] == nil or e[7298] == nil or e[7299] == nil or e[7300] == nil or e[7301] == nil or e[7342] == nil or e[7343] == nil or e[7344] == nil or e[7345] == nil then
        exportedWorldEvents.Load(e);
    end

    e[5175].Category = addon.Tabs["Events"].Categories[10].Children[1]; -- Legion Assaults
    e[5177].Category = addon.Tabs["Events"].Categories[10].Children[1]; -- Legion Assaults
    e[5178].Category = addon.Tabs["Events"].Categories[10].Children[1]; -- Legion Assaults
    e[5210].Category = addon.Tabs["Events"].Categories[10].Children[1]; -- Legion Assaults
    e[5896].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[1]; -- Assault on Tiragarde Sound
    e[5964].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[2]; -- Assault on Drustvar
    e[5966].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[3]; -- Assault on Stormsong Valley
    e[5969].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[5]; -- Assault on Nazmir
    e[5970].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[6]; -- Assault on Vol'dun
    e[5973].Category = addon.Tabs["Events"].Categories[11].Children[1].Children[4]; -- Assault on Zuldazar
    e[6486].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[2]; -- Uldum
    e[6487].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[2]; -- Uldum
    e[6488].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[2]; -- Uldum
    e[6489].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[1]; -- Vale of Eternal Blossoms
    e[6490].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[1]; -- Vale of Eternal Blossoms
    e[6491].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[1]; -- Vale of Eternal Blossoms
    e[6989].Category = addon.Tabs["Events"].Categories[12].Children[1].Children[2]; -- Necrolords Assault
    e[6990].Category = addon.Tabs["Events"].Categories[12].Children[1].Children[4]; -- Venthyr Assault
    e[6991].Category = addon.Tabs["Events"].Categories[12].Children[1].Children[1]; -- Kyrian Assault
    e[6992].Category = addon.Tabs["Events"].Categories[12].Children[1].Children[3]; -- Night Fae Assault
    e[7104].Category = addon.Tabs["Events"].Categories[13].Children[1]; -- Siege on Dragonbane Keep
    e[7218].Category = addon.Tabs["Events"].Categories[13].Children[3]; -- Community Feast
    e[7219].Category = addon.Tabs["Events"].Categories[13].Children[3]; -- Community Feast
    e[7220].Category = addon.Tabs["Events"].Categories[13].Children[3]; -- Community Feast
    e[7221].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7222].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7223].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7224].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7225].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7226].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7227].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7228].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[4].Children[7]; -- Primal Storms
    e[7229].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7230].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7231].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7232].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7233].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7234].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7235].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7236].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7237].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7238].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7239].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7240].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[5].Children[7]; -- Primal Storms
    e[7245].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7246].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7247].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7248].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7249].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7250].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7251].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7252].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7253].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7254].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7255].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7256].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7257].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7258].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7259].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7260].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[3].Children[7]; -- Primal Storms
    e[7267].Category = addon.Tabs["Events"].Categories[13].Children[1]; -- Siege on Dragonbane Keep
    e[7298].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7299].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7300].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7301].Category = addon.Tabs["Expansions"].Categories[15].Children[1].Children[6].Children[7]; -- Primal Storms
    e[7342].Category = addon.Tabs["Events"].Categories[13].Children[2]; -- Grand Hunter
    e[7343].Category = addon.Tabs["Events"].Categories[13].Children[2]; -- Grand Hunter
    e[7344].Category = addon.Tabs["Events"].Categories[13].Children[2]; -- Grand Hunter
    e[7345].Category = addon.Tabs["Events"].Categories[13].Children[2]; -- Grand Hunter
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
    defaults[7104] = true;
    defaults[7218] = true;
    defaults[7219] = true;
    defaults[7220] = true;
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
    defaults[7267] = true;
    defaults[7298] = true;
    defaults[7299] = true;
    defaults[7300] = true;
    defaults[7301] = true;
    defaults[7342] = true;
    defaults[7343] = true;
    defaults[7344] = true;
    defaults[7345] = true;

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
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5896]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5896] = not addon.Options.db.EventReminders.WorldEvents[5896];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Tiragarde Sound"], addon.Options.db.EventReminders.WorldEvents[5896]);
                        end
                    },
                    E5964 = {
                        order = 3, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Drustvar"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5964]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5964] = not addon.Options.db.EventReminders.WorldEvents[5964];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Drustvar"], addon.Options.db.EventReminders.WorldEvents[5964]);
                        end
                    },
                    E5966 = {
                        order = 4, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Stormsong Valley"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5966]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5966] = not addon.Options.db.EventReminders.WorldEvents[5966];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Stormsong Valley"], addon.Options.db.EventReminders.WorldEvents[5966]);
                        end
                    },
                    E5969 = {
                        order = 5, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Nazmir"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5969]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5969] = not addon.Options.db.EventReminders.WorldEvents[5969];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Nazmir"], addon.Options.db.EventReminders.WorldEvents[5969]);
                        end
                    },
                    E5970 = {
                        order = 6, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Vol'dun"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5970]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5970] = not addon.Options.db.EventReminders.WorldEvents[5970];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Vol'dun"], addon.Options.db.EventReminders.WorldEvents[5970]);
                        end
                    },
                    E5973 = {
                        order = 7, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Zuldazar"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5973]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5973] = not addon.Options.db.EventReminders.WorldEvents[5973];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Zuldazar"], addon.Options.db.EventReminders.WorldEvents[5973]);
                        end
                    },
                    E6486 = {
                        order = 8, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: N'Zoth (Uldum)"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6486]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6486] = not addon.Options.db.EventReminders.WorldEvents[6486];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault: N'Zoth (Uldum)"], addon.Options.db.EventReminders.WorldEvents[6486]);
                        end
                    },
                    E6487 = {
                        order = 9, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Amathet"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6487]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6487] = not addon.Options.db.EventReminders.WorldEvents[6487];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault: Amathet"], addon.Options.db.EventReminders.WorldEvents[6487]);
                        end
                    },
                    E6488 = {
                        order = 10, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Aqir"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6488]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6488] = not addon.Options.db.EventReminders.WorldEvents[6488];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault: Aqir"], addon.Options.db.EventReminders.WorldEvents[6488]);
                        end
                    },
                    E6489 = {
                        order = 11, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6489]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6489] = not addon.Options.db.EventReminders.WorldEvents[6489];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"], addon.Options.db.EventReminders.WorldEvents[6489]);
                        end
                    },
                    E6490 = {
                        order = 12, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Mogu"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6490]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6490] = not addon.Options.db.EventReminders.WorldEvents[6490];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault: Mogu"], addon.Options.db.EventReminders.WorldEvents[6490]);
                        end
                    },
                    E6491 = {
                        order = 13, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault: Mantid"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6491]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6491] = not addon.Options.db.EventReminders.WorldEvents[6491];
                            addon.GUI.SideButtonSystem.Refresh();
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
            DF___Community_Feast = {
                order = 17, type = "group",
                name = addon.L["DF - Community Feast"],
                args = {
                    E7218 = {
                        order = 18, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Community Feast: Cooking"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7218]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7218] = not addon.Options.db.EventReminders.WorldEvents[7218];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Community Feast: Cooking"], addon.Options.db.EventReminders.WorldEvents[7218]);
                        end
                    },
                    E7219 = {
                        order = 19, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Community Feast: Soon"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7219]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7219] = not addon.Options.db.EventReminders.WorldEvents[7219];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Community Feast: Soon"], addon.Options.db.EventReminders.WorldEvents[7219]);
                        end
                    },
                    E7220 = {
                        order = 20, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Community Feast: Ready"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7220]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7220] = not addon.Options.db.EventReminders.WorldEvents[7220];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Community Feast: Ready"], addon.Options.db.EventReminders.WorldEvents[7220]);
                        end
                    },
                    Blank21 = {order = 21, type = "description", width = "full", name = ""},
                    SelectAll22 = {
                        order = 22, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7218] = true;
                            addon.Options.db.EventReminders.WorldEvents[7219] = true;
                            addon.Options.db.EventReminders.WorldEvents[7220] = true;
                        end
                    },
                    DeselectAll23 = {
                        order = 23, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7218] = false;
                            addon.Options.db.EventReminders.WorldEvents[7219] = false;
                            addon.Options.db.EventReminders.WorldEvents[7220] = false;
                        end
                    },
                }
            },
            DF___Firestorms = {
                order = 24, type = "group",
                name = addon.L["DF - Firestorms"],
                args = {
                    E7223 = {
                        order = 25, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7223]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7223] = not addon.Options.db.EventReminders.WorldEvents[7223];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7223]);
                        end
                    },
                    E7227 = {
                        order = 26, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7227]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7227] = not addon.Options.db.EventReminders.WorldEvents[7227];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7227]);
                        end
                    },
                    E7231 = {
                        order = 27, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7231]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7231] = not addon.Options.db.EventReminders.WorldEvents[7231];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7231]);
                        end
                    },
                    E7235 = {
                        order = 28, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7235]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7235] = not addon.Options.db.EventReminders.WorldEvents[7235];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7235]);
                        end
                    },
                    E7239 = {
                        order = 29, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7239]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7239] = not addon.Options.db.EventReminders.WorldEvents[7239];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7239]);
                        end
                    },
                    E7247 = {
                        order = 30, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7247]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7247] = not addon.Options.db.EventReminders.WorldEvents[7247];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7247]);
                        end
                    },
                    E7251 = {
                        order = 31, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7251]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7251] = not addon.Options.db.EventReminders.WorldEvents[7251];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7251]);
                        end
                    },
                    E7255 = {
                        order = 32, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7255]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7255] = not addon.Options.db.EventReminders.WorldEvents[7255];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7255]);
                        end
                    },
                    E7259 = {
                        order = 33, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7259]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7259] = not addon.Options.db.EventReminders.WorldEvents[7259];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7259]);
                        end
                    },
                    E7300 = {
                        order = 34, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7300]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7300] = not addon.Options.db.EventReminders.WorldEvents[7300];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7300]);
                        end
                    },
                    Blank35 = {order = 35, type = "description", width = "full", name = ""},
                    SelectAll36 = {
                        order = 36, type = "execute", width = 1 * widthMultiplier,
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
                    DeselectAll37 = {
                        order = 37, type = "execute",
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
            DF___Grand_Hunts = {
                order = 38, type = "group",
                name = addon.L["DF - Grand Hunts"],
                args = {
                    E7342 = {
                        order = 39, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Grand Hunts: Ohn'ahran Plains"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7342]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7342] = not addon.Options.db.EventReminders.WorldEvents[7342];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Grand Hunts: Ohn'ahran Plains"], addon.Options.db.EventReminders.WorldEvents[7342]);
                        end
                    },
                    E7343 = {
                        order = 40, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Grand Hunts: The Waking Shore"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7343]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7343] = not addon.Options.db.EventReminders.WorldEvents[7343];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Grand Hunts: The Waking Shore"], addon.Options.db.EventReminders.WorldEvents[7343]);
                        end
                    },
                    E7344 = {
                        order = 41, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Grand Hunts: Thaldraszus"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7344]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7344] = not addon.Options.db.EventReminders.WorldEvents[7344];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Grand Hunts: Thaldraszus"], addon.Options.db.EventReminders.WorldEvents[7344]);
                        end
                    },
                    E7345 = {
                        order = 42, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Grand Hunts: The Azure Span"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7345]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7345] = not addon.Options.db.EventReminders.WorldEvents[7345];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Grand Hunts: The Azure Span"], addon.Options.db.EventReminders.WorldEvents[7345]);
                        end
                    },
                    Blank43 = {order = 43, type = "description", width = "full", name = ""},
                    SelectAll44 = {
                        order = 44, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7342] = true;
                            addon.Options.db.EventReminders.WorldEvents[7343] = true;
                            addon.Options.db.EventReminders.WorldEvents[7344] = true;
                            addon.Options.db.EventReminders.WorldEvents[7345] = true;
                        end
                    },
                    DeselectAll45 = {
                        order = 45, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7342] = false;
                            addon.Options.db.EventReminders.WorldEvents[7343] = false;
                            addon.Options.db.EventReminders.WorldEvents[7344] = false;
                            addon.Options.db.EventReminders.WorldEvents[7345] = false;
                        end
                    },
                }
            },
            DF___Sandstorms = {
                order = 46, type = "group",
                name = addon.L["DF - Sandstorms"],
                args = {
                    E7222 = {
                        order = 47, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7222]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7222] = not addon.Options.db.EventReminders.WorldEvents[7222];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7222]);
                        end
                    },
                    E7226 = {
                        order = 48, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7226]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7226] = not addon.Options.db.EventReminders.WorldEvents[7226];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7226]);
                        end
                    },
                    E7230 = {
                        order = 49, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7230]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7230] = not addon.Options.db.EventReminders.WorldEvents[7230];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7230]);
                        end
                    },
                    E7234 = {
                        order = 50, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7234]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7234] = not addon.Options.db.EventReminders.WorldEvents[7234];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7234]);
                        end
                    },
                    E7238 = {
                        order = 51, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7238]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7238] = not addon.Options.db.EventReminders.WorldEvents[7238];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7238]);
                        end
                    },
                    E7246 = {
                        order = 52, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7246]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7246] = not addon.Options.db.EventReminders.WorldEvents[7246];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7246]);
                        end
                    },
                    E7250 = {
                        order = 53, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7250]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7250] = not addon.Options.db.EventReminders.WorldEvents[7250];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7250]);
                        end
                    },
                    E7254 = {
                        order = 54, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7254]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7254] = not addon.Options.db.EventReminders.WorldEvents[7254];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7254]);
                        end
                    },
                    E7258 = {
                        order = 55, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7258]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7258] = not addon.Options.db.EventReminders.WorldEvents[7258];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7258]);
                        end
                    },
                    E7299 = {
                        order = 56, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7299]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7299] = not addon.Options.db.EventReminders.WorldEvents[7299];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7299]);
                        end
                    },
                    Blank57 = {order = 57, type = "description", width = "full", name = ""},
                    SelectAll58 = {
                        order = 58, type = "execute", width = 1 * widthMultiplier,
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
                    DeselectAll59 = {
                        order = 59, type = "execute",
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
            DF___Siege_on_Dragonbane_Keep = {
                order = 60, type = "group",
                name = addon.L["DF - Siege on Dragonbane Keep"],
                args = {
                    E7104 = {
                        order = 61, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Siege on Dragonbane Keep: Active"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7104]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7104] = not addon.Options.db.EventReminders.WorldEvents[7104];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Siege on Dragonbane Keep: Active"], addon.Options.db.EventReminders.WorldEvents[7104]);
                        end
                    },
                    E7267 = {
                        order = 62, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Siege on Dragonbane Keep: Gathering"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7267]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7267] = not addon.Options.db.EventReminders.WorldEvents[7267];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Siege on Dragonbane Keep: Gathering"], addon.Options.db.EventReminders.WorldEvents[7267]);
                        end
                    },
                    Blank63 = {order = 63, type = "description", width = "full", name = ""},
                    SelectAll64 = {
                        order = 64, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7104] = true;
                            addon.Options.db.EventReminders.WorldEvents[7267] = true;
                        end
                    },
                    DeselectAll65 = {
                        order = 65, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[7104] = false;
                            addon.Options.db.EventReminders.WorldEvents[7267] = false;
                        end
                    },
                }
            },
            DF___Snowstorms = {
                order = 66, type = "group",
                name = addon.L["DF - Snowstorms"],
                args = {
                    E7224 = {
                        order = 67, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7224]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7224] = not addon.Options.db.EventReminders.WorldEvents[7224];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7224]);
                        end
                    },
                    E7228 = {
                        order = 68, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7228]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7228] = not addon.Options.db.EventReminders.WorldEvents[7228];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7228]);
                        end
                    },
                    E7232 = {
                        order = 69, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7232]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7232] = not addon.Options.db.EventReminders.WorldEvents[7232];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7232]);
                        end
                    },
                    E7236 = {
                        order = 70, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7236]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7236] = not addon.Options.db.EventReminders.WorldEvents[7236];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7236]);
                        end
                    },
                    E7240 = {
                        order = 71, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7240]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7240] = not addon.Options.db.EventReminders.WorldEvents[7240];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7240]);
                        end
                    },
                    E7248 = {
                        order = 72, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7248]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7248] = not addon.Options.db.EventReminders.WorldEvents[7248];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7248]);
                        end
                    },
                    E7252 = {
                        order = 73, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7252]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7252] = not addon.Options.db.EventReminders.WorldEvents[7252];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7252]);
                        end
                    },
                    E7256 = {
                        order = 74, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7256]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7256] = not addon.Options.db.EventReminders.WorldEvents[7256];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7256]);
                        end
                    },
                    E7260 = {
                        order = 75, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7260]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7260] = not addon.Options.db.EventReminders.WorldEvents[7260];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7260]);
                        end
                    },
                    E7301 = {
                        order = 76, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7301]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7301] = not addon.Options.db.EventReminders.WorldEvents[7301];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7301]);
                        end
                    },
                    Blank77 = {order = 77, type = "description", width = "full", name = ""},
                    SelectAll78 = {
                        order = 78, type = "execute", width = 1 * widthMultiplier,
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
                    DeselectAll79 = {
                        order = 79, type = "execute",
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
            DF___Thunderstorms = {
                order = 80, type = "group",
                name = addon.L["DF - Thunderstorms"],
                args = {
                    E7221 = {
                        order = 81, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Nokhudon Hold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7221]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7221] = not addon.Options.db.EventReminders.WorldEvents[7221];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Nokhudon Hold"], addon.Options.db.EventReminders.WorldEvents[7221]);
                        end
                    },
                    E7225 = {
                        order = 82, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Ohn'iri Springs"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7225]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7225] = not addon.Options.db.EventReminders.WorldEvents[7225];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Ohn'iri Springs"], addon.Options.db.EventReminders.WorldEvents[7225]);
                        end
                    },
                    E7229 = {
                        order = 83, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brackenhide Hollow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7229]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7229] = not addon.Options.db.EventReminders.WorldEvents[7229];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Brackenhide Hollow"], addon.Options.db.EventReminders.WorldEvents[7229]);
                        end
                    },
                    E7233 = {
                        order = 84, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Cobalt Assembly"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7233]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7233] = not addon.Options.db.EventReminders.WorldEvents[7233];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Cobalt Assembly"], addon.Options.db.EventReminders.WorldEvents[7233]);
                        end
                    },
                    E7237 = {
                        order = 85, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Imbu"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7237]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7237] = not addon.Options.db.EventReminders.WorldEvents[7237];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Imbu"], addon.Options.db.EventReminders.WorldEvents[7237]);
                        end
                    },
                    E7245 = {
                        order = 86, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Tyrhold"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7245]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7245] = not addon.Options.db.EventReminders.WorldEvents[7245];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Tyrhold"], addon.Options.db.EventReminders.WorldEvents[7245]);
                        end
                    },
                    E7249 = {
                        order = 87, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Dragonbane Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7249]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7249] = not addon.Options.db.EventReminders.WorldEvents[7249];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Dragonbane Keep"], addon.Options.db.EventReminders.WorldEvents[7249]);
                        end
                    },
                    E7253 = {
                        order = 88, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Slagmire"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7253]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7253] = not addon.Options.db.EventReminders.WorldEvents[7253];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Slagmire"], addon.Options.db.EventReminders.WorldEvents[7253]);
                        end
                    },
                    E7257 = {
                        order = 89, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Scalecracker Keep"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7257]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7257] = not addon.Options.db.EventReminders.WorldEvents[7257];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Scalecracker Keep"], addon.Options.db.EventReminders.WorldEvents[7257]);
                        end
                    },
                    E7298 = {
                        order = 90, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Primalist Tomorrow"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[7298]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[7298] = not addon.Options.db.EventReminders.WorldEvents[7298];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Primalist Tomorrow"], addon.Options.db.EventReminders.WorldEvents[7298]);
                        end
                    },
                    Blank91 = {order = 91, type = "description", width = "full", name = ""},
                    SelectAll92 = {
                        order = 92, type = "execute", width = 1 * widthMultiplier,
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
                    DeselectAll93 = {
                        order = 93, type = "execute",
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
            Legion = {
                order = 94, type = "group",
                name = addon.L["Legion"],
                args = {
                    E5175 = {
                        order = 95, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Azsuna"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5175]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5175] = not addon.Options.db.EventReminders.WorldEvents[5175];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Azsuna"], addon.Options.db.EventReminders.WorldEvents[5175]);
                        end
                    },
                    E5177 = {
                        order = 96, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Highmountain"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5177]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5177] = not addon.Options.db.EventReminders.WorldEvents[5177];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Highmountain"], addon.Options.db.EventReminders.WorldEvents[5177]);
                        end
                    },
                    E5178 = {
                        order = 97, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Stormheim"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5178]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5178] = not addon.Options.db.EventReminders.WorldEvents[5178];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Stormheim"], addon.Options.db.EventReminders.WorldEvents[5178]);
                        end
                    },
                    E5210 = {
                        order = 98, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Assault on Val'sharah"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[5210]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[5210] = not addon.Options.db.EventReminders.WorldEvents[5210];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Assault on Val'sharah"], addon.Options.db.EventReminders.WorldEvents[5210]);
                        end
                    },
                    Blank99 = {order = 99, type = "description", width = "full", name = ""},
                    SelectAll100 = {
                        order = 100, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[5175] = true;
                            addon.Options.db.EventReminders.WorldEvents[5177] = true;
                            addon.Options.db.EventReminders.WorldEvents[5178] = true;
                            addon.Options.db.EventReminders.WorldEvents[5210] = true;
                        end
                    },
                    DeselectAll101 = {
                        order = 101, type = "execute",
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
                order = 102, type = "group",
                name = addon.L["Shadowlands"],
                args = {
                    E6989 = {
                        order = 103, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Necrolord Assault"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6989]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6989] = not addon.Options.db.EventReminders.WorldEvents[6989];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Necrolord Assault"], addon.Options.db.EventReminders.WorldEvents[6989]);
                        end
                    },
                    E6990 = {
                        order = 104, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Venthyr Assault"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6990]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6990] = not addon.Options.db.EventReminders.WorldEvents[6990];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Venthyr Assault"], addon.Options.db.EventReminders.WorldEvents[6990]);
                        end
                    },
                    E6991 = {
                        order = 105, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Kyrian Assault"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6991]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6991] = not addon.Options.db.EventReminders.WorldEvents[6991];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Kyrian Assault"], addon.Options.db.EventReminders.WorldEvents[6991]);
                        end
                    },
                    E6992 = {
                        order = 106, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Night Fae Assault"],
                        get = function() return addon.Options.db.EventReminders.WorldEvents[6992]; end,
                        set = function()
                            addon.Options.db.EventReminders.WorldEvents[6992] = not addon.Options.db.EventReminders.WorldEvents[6992];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Night Fae Assault"], addon.Options.db.EventReminders.WorldEvents[6992]);
                        end
                    },
                    Blank107 = {order = 107, type = "description", width = "full", name = ""},
                    SelectAll108 = {
                        order = 108, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.WorldEvents[6989] = true;
                            addon.Options.db.EventReminders.WorldEvents[6990] = true;
                            addon.Options.db.EventReminders.WorldEvents[6991] = true;
                            addon.Options.db.EventReminders.WorldEvents[6992] = true;
                        end
                    },
                    DeselectAll109 = {
                        order = 109, type = "execute",
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
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "WorldEvents", "EventReminders", "args");
end

