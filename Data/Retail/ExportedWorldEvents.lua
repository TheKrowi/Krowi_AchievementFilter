local _, addon = ...;
local data = addon.Data;
data.ExportedWorldEvents = {};
local exportedWorldEvents = data.ExportedWorldEvents;
local objects = addon.Objects;
local eventType = objects.EventType;
local event = objects.Event;

local tasks, worldEvents, categories;
function exportedWorldEvents.RegisterTasks(_worldEvents, _categories)
    worldEvents, categories = _worldEvents, _categories;
    wipe(worldEvents);

    local name = "World Events";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

local function N(id, cId, ...)
    worldEvents[id] = event:New(id, categories[cId], eventType.World, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-31 20-52-17 ]] --
tasks = {
    {N, 5175, 948, 1408998, addon.L["Assault on Azsuna"], nil, 619}, -- Assault on Azsuna
    {N, 5177, 948, 1409000, addon.L["Assault on Highmountain"], nil, 619}, -- Assault on Highmountain
    {N, 5178, 948, 1409001, addon.L["Assault on Stormheim"], nil, 619}, -- Assault on Stormheim
    {N, 5210, 948, 1409010, addon.L["Assault on Val'sharah"], nil, 619}, -- Assault on Val'sharah
    {N, 5896, 935, 2065630, addon.L["Assault on Tiragarde Sound"], nil, 876}, -- Assault on Tiragarde Sound
    {N, 5964, 936, 2065567, addon.L["Assault on Drustvar"], nil, 876}, -- Assault on Drustvar
    {N, 5966, 937, 2065627, addon.L["Assault on Stormsong Valley"], nil, 876}, -- Assault on Stormsong Valley
    {N, 5969, 938, 2032229, addon.L["Assault on Nazmir"], nil, 875}, -- Assault on Nazmir
    {N, 5970, 939, 2065632, addon.L["Assault on Vol'dun"], nil, 875}, -- Assault on Vol'dun
    {N, 5973, 934, 2065640, addon.L["Assault on Zuldazar"], nil, 875}, -- Assault on Zuldazar
    {N, 6486, 942, 3196264, addon.L["Assault: N'Zoth (Uldum)"], nil, 12}, -- Assault: N'Zoth (Uldum)
    {N, 6487, 942, 415054, addon.L["Assault: Amathet"], nil, 12}, -- Assault: Amathet
    {N, 6488, 942, 458247, addon.L["Assault: Aqir"], nil, 12}, -- Assault: Aqir
    {N, 6489, 941, 3196265, addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"], nil, 424}, -- Assault: N'Zoth (Vale of Eternal Blossoms)
    {N, 6490, 941, 801016, addon.L["Assault: Mogu"], nil, 424}, -- Assault: Mogu
    {N, 6491, 941, 615301, addon.L["Assault: Mantid"], nil, 424}, -- Assault: Mantid
    {N, 6989, 929, 3257749, addon.L["Necrolord Assault"], nil, 1550}, -- Necrolord Assault
    {N, 6990, 931, 3257751, addon.L["Venthyr Assault"], nil, 1550}, -- Venthyr Assault
    {N, 6991, 928, 3257748, addon.L["Kyrian Assault"], nil, 1550}, -- Kyrian Assault
    {N, 6992, 930, 3257750, addon.L["Night Fae Assault"], nil, 1550}, -- Night Fae Assault
    {N, 7104, 1394, 1394891, addon.L["Siege on Dragonbane Keep: Active"], nil, 2057}, -- Siege on Dragonbane Keep: Active
    {N, 7221, 1364, 4554434, addon.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7222, 1364, 4554437, addon.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7223, 1364, 4554438, addon.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7224, 1364, 4554439, addon.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7225, 1364, 4554434, addon.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7226, 1364, 4554437, addon.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7227, 1364, 4554438, addon.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7228, 1364, 4554439, addon.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7229, 1365, 4554434, addon.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7230, 1365, 4554437, addon.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7231, 1365, 4554438, addon.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7232, 1365, 4554439, addon.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7233, 1365, 4554434, addon.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7234, 1365, 4554437, addon.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7235, 1365, 4554438, addon.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7236, 1365, 4554439, addon.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7237, 1365, 4554434, addon.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7238, 1365, 4554437, addon.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7239, 1365, 4554438, addon.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7240, 1365, 4554439, addon.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7245, 1366, 4554434, addon.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7246, 1366, 4554437, addon.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7247, 1366, 4554438, addon.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7248, 1366, 4554439, addon.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7249, 1363, 4554434, addon.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7250, 1363, 4554437, addon.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7251, 1363, 4554438, addon.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7252, 1363, 4554439, addon.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7253, 1363, 4554434, addon.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7254, 1363, 4554437, addon.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7255, 1363, 4554438, addon.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7256, 1363, 4554439, addon.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7257, 1363, 4554434, addon.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7258, 1363, 4554437, addon.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7259, 1363, 4554438, addon.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7260, 1363, 4554439, addon.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7267, 1394, 1394891, addon.L["Siege on Dragonbane Keep: Gathering"], nil, 2057}, -- Siege on Dragonbane Keep: Gathering
    {N, 7298, 1366, 4554434, addon.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7299, 1366, 4554437, addon.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7300, 1366, 4554438, addon.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7301, 1366, 4554439, addon.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7342, 1392, 4622465, addon.L["Grand Hunts: Ohn'ahran Plains"], nil, 1978}, -- Grand Hunts: Ohn'ahran Plains
    {N, 7343, 1392, 4622465, addon.L["Grand Hunts: The Waking Shore"], nil, 1978}, -- Grand Hunts: The Waking Shore
    {N, 7344, 1392, 4622465, addon.L["Grand Hunts: Thaldraszus"], nil, 1978}, -- Grand Hunts: Thaldraszus
    {N, 7345, 1392, 4622465, addon.L["Grand Hunts: The Azure Span"], nil, 1978}, -- Grand Hunts: The Azure Span
    {N, 7429, 1425, 4914672, addon.L["Ohn'ahran Plains"], nil, 1978}, -- Ohn'ahran Plains
    {N, 7432, 1425, 4914672, addon.L["Azure Span"], nil, 1978}, -- Azure Span
    {N, 7459, 1430, 254117, addon.L["Titan Lockdown: Starting Soon"], nil, 2133}, -- Titan Lockdown: Starting Soon
    {N, 7460, 1429, 4237659, addon.L["Zaqali Ruin Investigation: Starting Soon"], nil, 2133}, -- Zaqali Ruin Investigation: Starting Soon
    {N, 7461, 1430, 254117, addon.L["Titan Lockdown: Active"], nil, 2133}, -- Titan Lockdown: Active
    {N, 7462, 1429, 4237659, addon.L["Zaqali Ruin Investigation: Active"], nil, 2133}, -- Zaqali Ruin Investigation: Active
    {N, 7554, 1537, 1394953, addon.L["Azure Span"], nil, 1978}, -- Azure Span
    {N, 7555, 1537, 1394953, addon.L["Ohn'ahran Plains"], nil, 1978}, -- Ohn'ahran Plains
    {N, 7556, 1537, 1394953, addon.L["Waking Shores"], nil, 1978}, -- Waking Shores
    {N, 7602, 1537, 1394953, addon.L["Thaldraszus"], nil, 1978}, -- Thaldraszus
};

function exportedWorldEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], {5175}, addon.L["Assault on Azsuna"]);
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], {5177}, addon.L["Assault on Highmountain"]);
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], {5178}, addon.L["Assault on Stormheim"]);
    KrowiAF_RegisterEventOptions("World", "Legion", addon.L["Legion"], {5210}, addon.L["Assault on Val'sharah"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Legion", { 5175, 5177, 5178, 5210 });
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {5896}, addon.L["Assault on Tiragarde Sound"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {5964}, addon.L["Assault on Drustvar"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {5966}, addon.L["Assault on Stormsong Valley"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {5969}, addon.L["Assault on Nazmir"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {5970}, addon.L["Assault on Vol'dun"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {5973}, addon.L["Assault on Zuldazar"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {6486}, addon.L["Assault: N'Zoth (Uldum)"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {6487}, addon.L["Assault: Amathet"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {6488}, addon.L["Assault: Aqir"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {6489}, addon.L["Assault: N'Zoth (Vale of Eternal Blossoms)"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {6490}, addon.L["Assault: Mogu"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", addon.L["Battle for Azeroth"], {6491}, addon.L["Assault: Mantid"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Battle_for_Azeroth", { 5896, 5964, 5966, 5969, 5970, 5973, 6486, 6487, 6488, 6489, 6490, 6491 });
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], {6989}, addon.L["Necrolord Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], {6990}, addon.L["Venthyr Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], {6991}, addon.L["Kyrian Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", addon.L["Shadowlands"], {6992}, addon.L["Night Fae Assault"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Shadowlands", { 6989, 6990, 6991, 6992 });
    KrowiAF_RegisterEventOptions("World", "DF___Siege_on_Dragonbane_Keep", addon.L["DF - Siege on Dragonbane Keep"], {7104}, addon.L["Siege on Dragonbane Keep: Active"]);
    KrowiAF_RegisterEventOptions("World", "DF___Siege_on_Dragonbane_Keep", addon.L["DF - Siege on Dragonbane Keep"], {7267}, addon.L["Siege on Dragonbane Keep: Gathering"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Siege_on_Dragonbane_Keep", { 7104, 7267 });
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], {7342}, addon.L["Grand Hunts: Ohn'ahran Plains"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], {7343}, addon.L["Grand Hunts: The Waking Shore"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], {7344}, addon.L["Grand Hunts: Thaldraszus"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", addon.L["DF - Grand Hunts"], {7345}, addon.L["Grand Hunts: The Azure Span"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Grand_Hunts", { 7342, 7343, 7344, 7345 });
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7221}, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7225}, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7229}, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7233}, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7237}, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7245}, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7249}, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7253}, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7257}, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", addon.L["DF - Thunderstorms"], {7298}, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Thunderstorms", { 7221, 7225, 7229, 7233, 7237, 7245, 7249, 7253, 7257, 7298 });
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7222}, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7226}, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7230}, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7234}, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7238}, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7246}, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7250}, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7254}, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7258}, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", addon.L["DF - Sandstorms"], {7299}, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Sandstorms", { 7222, 7226, 7230, 7234, 7238, 7246, 7250, 7254, 7258, 7299 });
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7223}, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7227}, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7231}, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7235}, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7239}, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7247}, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7251}, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7255}, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7259}, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", addon.L["DF - Firestorms"], {7300}, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Firestorms", { 7223, 7227, 7231, 7235, 7239, 7247, 7251, 7255, 7259, 7300 });
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7224}, addon.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7228}, addon.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7232}, addon.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7236}, addon.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7240}, addon.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7248}, addon.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7252}, addon.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7256}, addon.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7260}, addon.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", addon.L["DF - Snowstorms"], {7301}, addon.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Snowstorms", { 7224, 7228, 7232, 7236, 7240, 7248, 7252, 7256, 7260, 7301 });
    KrowiAF_RegisterEventOptions("World", "DF___Fyrakk_Assault", addon.L["DF - Fyrakk Assault"], {7429}, addon.L["Ohn'ahran Plains"]);
    KrowiAF_RegisterEventOptions("World", "DF___Fyrakk_Assault", addon.L["DF - Fyrakk Assault"], {7432}, addon.L["Azure Span"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Fyrakk_Assault", { 7429, 7432 });
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", addon.L["DF - Researchers Under Fire"], {7459}, addon.L["Titan Lockdown: Starting Soon"]);
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", addon.L["DF - Researchers Under Fire"], {7460}, addon.L["Zaqali Ruin Investigation: Starting Soon"]);
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", addon.L["DF - Researchers Under Fire"], {7461}, addon.L["Titan Lockdown: Active"]);
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", addon.L["DF - Researchers Under Fire"], {7462}, addon.L["Zaqali Ruin Investigation: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Researchers_Under_Fire", { 7459, 7460, 7461, 7462 });
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", addon.L["DF - Dreamsurge"], {7554}, addon.L["Azure Span"]);
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", addon.L["DF - Dreamsurge"], {7555}, addon.L["Ohn'ahran Plains"]);
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", addon.L["DF - Dreamsurge"], {7556}, addon.L["Waking Shores"]);
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", addon.L["DF - Dreamsurge"], {7602}, addon.L["Thaldraszus"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Dreamsurge", { 7554, 7555, 7556, 7602 });
end