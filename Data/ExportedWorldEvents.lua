-- [[ Exported at 2023-01-06 22-19-43 ]] --
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
    e[7104] = event:New(7104, 1394891, addon.L["Siege on Dragonbane Keep: Active"], 2057, 3600); -- Siege on Dragonbane Keep: Active
    e[7218] = event:New(7218, 4240492, addon.L["Community Feast: Cooking"], 2057, 900); -- Community Feast: Cooking
    e[7219] = event:New(7219, 4240492, addon.L["Community Feast: Soon"], 2057, 960); -- Community Feast: Soon
    e[7220] = event:New(7220, 4240492, addon.L["Community Feast: Ready"], 2057, 3600); -- Community Feast: Ready
    e[7221] = event:New(7221, 4554434, addon.L["Nokhudon Hold"], 2057, 5400); -- Nokhudon Hold
    e[7222] = event:New(7222, 4554437, addon.L["Nokhudon Hold"], 2057, 5400); -- Nokhudon Hold
    e[7223] = event:New(7223, 4554438, addon.L["Nokhudon Hold"], 2057, 5400); -- Nokhudon Hold
    e[7224] = event:New(7224, 4554439, addon.L["Nokhudon Hold"], 2057, 5400); -- Nokhudon Hold
    e[7225] = event:New(7225, 4554434, addon.L["Ohn'iri Springs"], 2057, 5400); -- Ohn'iri Springs
    e[7226] = event:New(7226, 4554437, addon.L["Ohn'iri Springs"], 2057, 5400); -- Ohn'iri Springs
    e[7227] = event:New(7227, 4554438, addon.L["Ohn'iri Springs"], 2057, 5400); -- Ohn'iri Springs
    e[7228] = event:New(7228, 4554439, addon.L["Ohn'iri Springs"], 2057, 5400); -- Ohn'iri Springs
    e[7229] = event:New(7229, 4554434, addon.L["Brackenhide Hollow"], 2057, 5400); -- Brackenhide Hollow
    e[7230] = event:New(7230, 4554437, addon.L["Brackenhide Hollow"], 2057, 5400); -- Brackenhide Hollow
    e[7231] = event:New(7231, 4554438, addon.L["Brackenhide Hollow"], 2057, 5400); -- Brackenhide Hollow
    e[7232] = event:New(7232, 4554439, addon.L["Brackenhide Hollow"], 2057, 5400); -- Brackenhide Hollow
    e[7233] = event:New(7233, 4554434, addon.L["Cobalt Assembly"], 2057, 5400); -- Cobalt Assembly
    e[7234] = event:New(7234, 4554437, addon.L["Cobalt Assembly"], 2057, 5400); -- Cobalt Assembly
    e[7235] = event:New(7235, 4554438, addon.L["Cobalt Assembly"], 2057, 5400); -- Cobalt Assembly
    e[7236] = event:New(7236, 4554439, addon.L["Cobalt Assembly"], 2057, 5400); -- Cobalt Assembly
    e[7237] = event:New(7237, 4554434, addon.L["Imbu"], 2057, 5400); -- Imbu
    e[7238] = event:New(7238, 4554437, addon.L["Imbu"], 2057, 5400); -- Imbu
    e[7239] = event:New(7239, 4554438, addon.L["Imbu"], 2057, 5400); -- Imbu
    e[7240] = event:New(7240, 4554439, addon.L["Imbu"], 2057, 5400); -- Imbu
    e[7245] = event:New(7245, 4554434, addon.L["Tyrhold"], 2057, 5400); -- Tyrhold
    e[7246] = event:New(7246, 4554437, addon.L["Tyrhold"], 2057, 5400); -- Tyrhold
    e[7247] = event:New(7247, 4554438, addon.L["Tyrhold"], 2057, 5400); -- Tyrhold
    e[7248] = event:New(7248, 4554439, addon.L["Tyrhold"], 2057, 5400); -- Tyrhold
    e[7249] = event:New(7249, 4554434, addon.L["Dragonbane Keep"], 2057, 5400); -- Dragonbane Keep
    e[7250] = event:New(7250, 4554437, addon.L["Dragonbane Keep"], 2057, 5400); -- Dragonbane Keep
    e[7251] = event:New(7251, 4554438, addon.L["Dragonbane Keep"], 2057, 5400); -- Dragonbane Keep
    e[7252] = event:New(7252, 4554439, addon.L["Dragonbane Keep"], 2057, 5400); -- Dragonbane Keep
    e[7253] = event:New(7253, 4554434, addon.L["Slagmire"], 2057, 5400); -- Slagmire
    e[7254] = event:New(7254, 4554437, addon.L["Slagmire"], 2057, 5400); -- Slagmire
    e[7255] = event:New(7255, 4554438, addon.L["Slagmire"], 2057, 5400); -- Slagmire
    e[7256] = event:New(7256, 4554439, addon.L["Slagmire"], 2057, 5400); -- Slagmire
    e[7257] = event:New(7257, 4554434, addon.L["Scalecracker Keep"], 2057, 5400); -- Scalecracker Keep
    e[7258] = event:New(7258, 4554437, addon.L["Scalecracker Keep"], 2057, 5400); -- Scalecracker Keep
    e[7259] = event:New(7259, 4554438, addon.L["Scalecracker Keep"], 2057, 5400); -- Scalecracker Keep
    e[7260] = event:New(7260, 4554439, addon.L["Scalecracker Keep"], 2057, 5400); -- Scalecracker Keep
    e[7267] = event:New(7267, 1394891, addon.L["Siege on Dragonbane Keep: Gathering"], 2057, 3600); -- Siege on Dragonbane Keep: Gathering
    e[7298] = event:New(7298, 4554434, addon.L["Primalist Tomorrow"], 2057, 5400); -- Primalist Tomorrow
    e[7299] = event:New(7299, 4554437, addon.L["Primalist Tomorrow"], 2057, 5400); -- Primalist Tomorrow
    e[7300] = event:New(7300, 4554438, addon.L["Primalist Tomorrow"], 2057, 5400); -- Primalist Tomorrow
    e[7301] = event:New(7301, 4554439, addon.L["Primalist Tomorrow"], 2057, 5400); -- Primalist Tomorrow
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

function exportedWorldEvents.InjectDynamicOptions()
    if addon.IsWrathClassic then
        return;
    end

    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 5896, addon.L["Assault on Tiragarde Sound"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 5964, addon.L["Assault on Drustvar"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 5966, addon.L["Assault on Stormsong Valley"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 5969, addon.L["Assault on Nazmir"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 5970, addon.L["Assault on Vol'dun"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 5973, addon.L["Assault on Zuldazar"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 6486, addon.L["Assault: N'Zoth (Uldum)"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 6487, addon.L["Assault: Amathet"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 6488, addon.L["Assault: Aqir"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 6489, addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 6490, addon.L["Assault: Mogu"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], 6491, addon.L["Assault: Mantid"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Battle_for_Azeroth", { 5896, 5964, 5966, 5969, 5970, 5973, 6486, 6487, 6488, 6489, 6490, 6491 });
    KrowiAF_RegisterEventOptions("World", "DF___Community_Feast", addon.L["DF - Community Feast"], 7218, addon.L["Community Feast: Cooking"]);
    KrowiAF_RegisterEventOptions("World", "DF___Community_Feast", addon.L["DF - Community Feast"], 7219, addon.L["Community Feast: Soon"]);
    KrowiAF_RegisterEventOptions("World", "DF___Community_Feast", addon.L["DF - Community Feast"], 7220, addon.L["Community Feast: Ready"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Community_Feast", { 7218, 7219, 7220 });
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7223, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7227, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7231, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7235, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7239, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7247, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7251, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7255, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7259, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], 7300, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Firestorms", { 7223, 7227, 7231, 7235, 7239, 7247, 7251, 7255, 7259, 7300 });
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], 7342, addon.L["Grand Hunts: Ohn'ahran Plains"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], 7343, addon.L["Grand Hunts: The Waking Shore"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], 7344, addon.L["Grand Hunts: Thaldraszus"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], 7345, addon.L["Grand Hunts: The Azure Span"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Grand_Hunts", { 7342, 7343, 7344, 7345 });
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7222, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7226, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7230, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7234, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7238, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7246, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7250, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7254, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7258, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], 7299, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Sandstorms", { 7222, 7226, 7230, 7234, 7238, 7246, 7250, 7254, 7258, 7299 });
    KrowiAF_RegisterEventOptions("World", "DF___Siege_on_Dragonbane_Keep", addon.L["DF - Siege on Dragonbane Keep"], 7104, addon.L["Siege on Dragonbane Keep: Active"]);
    KrowiAF_RegisterEventOptions("World", "DF___Siege_on_Dragonbane_Keep", addon.L["DF - Siege on Dragonbane Keep"], 7267, addon.L["Siege on Dragonbane Keep: Gathering"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Siege_on_Dragonbane_Keep", { 7104, 7267 });
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7224, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7228, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7232, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7236, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7240, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7248, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7252, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7256, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7260, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], 7301, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Snowstorms", { 7224, 7228, 7232, 7236, 7240, 7248, 7252, 7256, 7260, 7301 });
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7221, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7225, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7229, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7233, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7237, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7245, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7249, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7253, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7257, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], 7298, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Thunderstorms", { 7221, 7225, 7229, 7233, 7237, 7245, 7249, 7253, 7257, 7298 });
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], 5175, addon.L["Assault on Azsuna"]);
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], 5177, addon.L["Assault on Highmountain"]);
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], 5178, addon.L["Assault on Stormheim"]);
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], 5210, addon.L["Assault on Val'sharah"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Legion", { 5175, 5177, 5178, 5210 });
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], 6989, addon.L["Necrolord Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], 6990, addon.L["Venthyr Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], 6991, addon.L["Kyrian Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], 6992, addon.L["Night Fae Assault"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Shadowlands", { 6989, 6990, 6991, 6992 });
end

