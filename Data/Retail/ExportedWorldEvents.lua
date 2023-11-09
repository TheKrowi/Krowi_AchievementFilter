local _, addon = ...;
addon.Data.ExportedWorldEvents = {};
local exportedWorldEvents = addon.Data.ExportedWorldEvents;

local tasks, worldEvents, categories;
function exportedWorldEvents.RegisterTasks(_worldEvents, _categories)
    worldEvents, categories = _worldEvents, _categories;
    wipe(worldEvents);

    local name = "World Events";
    addon.Data.InjectLoadingDebug(tasks, name);

    tinsert(addon.Data.TasksGroups, 1, tasks);
end

local event = addon.Objects.Event;
local eventType = addon.Objects.EventType;
local function N(id, cId, ...)
    worldEvents[id] = event:New(id, categories[cId], eventType.World, ...);
end

local a = addon; -- Saves some characters and file size as we use this a lot in the tasks

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-11-09 21-46-29 ]] --
tasks = {
    {N, 5175, 948, 1408998, a.L["Assault on Azsuna"], nil, 619}, -- Assault on Azsuna
    {N, 5177, 948, 1409000, a.L["Assault on Highmountain"], nil, 619}, -- Assault on Highmountain
    {N, 5178, 948, 1409001, a.L["Assault on Stormheim"], nil, 619}, -- Assault on Stormheim
    {N, 5210, 948, 1409010, a.L["Assault on Val'sharah"], nil, 619}, -- Assault on Val'sharah
    {N, 5896, 935, 2065630, a.L["Assault on Tiragarde Sound"], nil, 876}, -- Assault on Tiragarde Sound
    {N, 5964, 936, 2065567, a.L["Assault on Drustvar"], nil, 876}, -- Assault on Drustvar
    {N, 5966, 937, 2065627, a.L["Assault on Stormsong Valley"], nil, 876}, -- Assault on Stormsong Valley
    {N, 5969, 938, 2032229, a.L["Assault on Nazmir"], nil, 875}, -- Assault on Nazmir
    {N, 5970, 939, 2065632, a.L["Assault on Vol'dun"], nil, 875}, -- Assault on Vol'dun
    {N, 5973, 934, 2065640, a.L["Assault on Zuldazar"], nil, 875}, -- Assault on Zuldazar
    {N, 6486, 942, 3196264, a.L["Assault: N'Zoth (Uldum)"], nil, 12}, -- Assault: N'Zoth (Uldum)
    {N, 6487, 942, 415054, a.L["Assault: Amathet"], nil, 12}, -- Assault: Amathet
    {N, 6488, 942, 458247, a.L["Assault: Aqir"], nil, 12}, -- Assault: Aqir
    {N, 6489, 941, 3196265, a.L["Assault: N'Zoth (Vale of Eternal Blossoms)"], nil, 424}, -- Assault: N'Zoth (Vale of Eternal Blossoms)
    {N, 6490, 941, 801016, a.L["Assault: Mogu"], nil, 424}, -- Assault: Mogu
    {N, 6491, 941, 615301, a.L["Assault: Mantid"], nil, 424}, -- Assault: Mantid
    {N, 6989, 929, 3257749, a.L["Necrolord Assault"], nil, 1550}, -- Necrolord Assault
    {N, 6990, 931, 3257751, a.L["Venthyr Assault"], nil, 1550}, -- Venthyr Assault
    {N, 6991, 928, 3257748, a.L["Kyrian Assault"], nil, 1550}, -- Kyrian Assault
    {N, 6992, 930, 3257750, a.L["Night Fae Assault"], nil, 1550}, -- Night Fae Assault
    {N, 7104, 1394, 1394891, a.L["Siege on Dragonbane Keep: Active"], nil, 2057}, -- Siege on Dragonbane Keep: Active
    {N, 7221, 1364, 4554434, a.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7222, 1364, 4554437, a.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7223, 1364, 4554438, a.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7224, 1364, 4554439, a.L["Nokhudon Hold"], nil, 2057}, -- Nokhudon Hold
    {N, 7225, 1364, 4554434, a.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7226, 1364, 4554437, a.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7227, 1364, 4554438, a.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7228, 1364, 4554439, a.L["Ohn'iri Springs"], nil, 2057}, -- Ohn'iri Springs
    {N, 7229, 1365, 4554434, a.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7230, 1365, 4554437, a.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7231, 1365, 4554438, a.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7232, 1365, 4554439, a.L["Brackenhide Hollow"], nil, 2057}, -- Brackenhide Hollow
    {N, 7233, 1365, 4554434, a.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7234, 1365, 4554437, a.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7235, 1365, 4554438, a.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7236, 1365, 4554439, a.L["Cobalt Assembly"], nil, 2057}, -- Cobalt Assembly
    {N, 7237, 1365, 4554434, a.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7238, 1365, 4554437, a.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7239, 1365, 4554438, a.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7240, 1365, 4554439, a.L["Imbu"], nil, 2057}, -- Imbu
    {N, 7245, 1366, 4554434, a.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7246, 1366, 4554437, a.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7247, 1366, 4554438, a.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7248, 1366, 4554439, a.L["Tyrhold"], nil, 2057}, -- Tyrhold
    {N, 7249, 1363, 4554434, a.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7250, 1363, 4554437, a.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7251, 1363, 4554438, a.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7252, 1363, 4554439, a.L["Dragonbane Keep"], nil, 2057}, -- Dragonbane Keep
    {N, 7253, 1363, 4554434, a.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7254, 1363, 4554437, a.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7255, 1363, 4554438, a.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7256, 1363, 4554439, a.L["Slagmire"], nil, 2057}, -- Slagmire
    {N, 7257, 1363, 4554434, a.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7258, 1363, 4554437, a.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7259, 1363, 4554438, a.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7260, 1363, 4554439, a.L["Scalecracker Keep"], nil, 2057}, -- Scalecracker Keep
    {N, 7267, 1394, 1394891, a.L["Siege on Dragonbane Keep: Gathering"], nil, 2057}, -- Siege on Dragonbane Keep: Gathering
    {N, 7298, 1366, 4554434, a.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7299, 1366, 4554437, a.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7300, 1366, 4554438, a.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7301, 1366, 4554439, a.L["Primalist Tomorrow"], nil, 2057}, -- Primalist Tomorrow
    {N, 7342, 1392, 4622465, a.L["Grand Hunts: Ohn'ahran Plains"], nil, 1978}, -- Grand Hunts: Ohn'ahran Plains
    {N, 7343, 1392, 4622465, a.L["Grand Hunts: The Waking Shore"], nil, 1978}, -- Grand Hunts: The Waking Shore
    {N, 7344, 1392, 4622465, a.L["Grand Hunts: Thaldraszus"], nil, 1978}, -- Grand Hunts: Thaldraszus
    {N, 7345, 1392, 4622465, a.L["Grand Hunts: The Azure Span"], nil, 1978}, -- Grand Hunts: The Azure Span
    {N, 7433, 1425, 4914672, a.L["Azure Span"], nil, 2024}, -- Azure Span
    {N, 7459, 1430, 254117, a.L["Titan Lockdown: Next"], nil, 2133}, -- Titan Lockdown: Next
    {N, 7460, 1429, 4237659, a.L["Zaqali Ruin Investigation: Next"], nil, 2133}, -- Zaqali Ruin Investigation: Next
    {N, 7461, 1430, 254117, a.L["Titan Lockdown: Active"], nil, 2133}, -- Titan Lockdown: Active
    {N, 7462, 1429, 4237659, a.L["Zaqali Ruin Investigation: Active"], nil, 2133}, -- Zaqali Ruin Investigation: Active
    {N, 7471, 1425, 4914672, a.L["Ohn'ahran Plains"], nil, 2023}, -- Ohn'ahran Plains
    {N, 7553, 1537, 1394953, a.L["Thaldraszus: Next"], {7602}, 1978}, -- Thaldraszus: Next
    {N, 7602, 1537, 1394953, a.L["Thaldraszus: Next"], {7553}, 1978}, -- Thaldraszus: Next
    {N, 7554, 1537, 1394953, a.L["Azure Span: Next"], {7605}, 1978}, -- Azure Span: Next
    {N, 7605, 1537, 1394953, a.L["Azure Span: Next"], {7554}, 1978}, -- Azure Span: Next
    {N, 7555, 1537, 1394953, a.L["Ohn'ahran Plains: Next"], {7604}, 1978}, -- Ohn'ahran Plains: Next
    {N, 7604, 1537, 1394953, a.L["Ohn'ahran Plains: Next"], {7555}, 1978}, -- Ohn'ahran Plains: Next
    {N, 7556, 1537, 1394953, a.L["Waking Shores: Next"], {7603}, 1978}, -- Waking Shores: Next
    {N, 7603, 1537, 1394953, a.L["Waking Shores: Next"], {7556}, 1978}, -- Waking Shores: Next
};

function exportedWorldEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("World", "Legion", a.L["Legion"], {5175}, a.L["Assault on Azsuna"]);
    KrowiAF_RegisterEventOptions("World", "Legion", a.L["Legion"], {5177}, a.L["Assault on Highmountain"]);
    KrowiAF_RegisterEventOptions("World", "Legion", a.L["Legion"], {5178}, a.L["Assault on Stormheim"]);
    KrowiAF_RegisterEventOptions("World", "Legion", a.L["Legion"], {5210}, a.L["Assault on Val'sharah"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Legion", { 5175, 5177, 5178, 5210 });
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {5896}, a.L["Assault on Tiragarde Sound"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {5964}, a.L["Assault on Drustvar"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {5966}, a.L["Assault on Stormsong Valley"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {5969}, a.L["Assault on Nazmir"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {5970}, a.L["Assault on Vol'dun"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {5973}, a.L["Assault on Zuldazar"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {6486}, a.L["Assault: N'Zoth (Uldum)"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {6487}, a.L["Assault: Amathet"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {6488}, a.L["Assault: Aqir"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {6489}, a.L["Assault: N'Zoth (Vale of Eternal Blossoms)"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {6490}, a.L["Assault: Mogu"]);
    KrowiAF_RegisterEventOptions("World", "Battle_for_Azeroth", a.L["Battle for Azeroth"], {6491}, a.L["Assault: Mantid"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Battle_for_Azeroth", { 5896, 5964, 5966, 5969, 5970, 5973, 6486, 6487, 6488, 6489, 6490, 6491 });
    KrowiAF_RegisterEventOptions("World", "Shadowlands", a.L["Shadowlands"], {6989}, a.L["Necrolord Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", a.L["Shadowlands"], {6990}, a.L["Venthyr Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", a.L["Shadowlands"], {6991}, a.L["Kyrian Assault"]);
    KrowiAF_RegisterEventOptions("World", "Shadowlands", a.L["Shadowlands"], {6992}, a.L["Night Fae Assault"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "Shadowlands", { 6989, 6990, 6991, 6992 });
    KrowiAF_RegisterEventOptions("World", "DF___Siege_on_Dragonbane_Keep", a.L["DF - Siege on Dragonbane Keep"], {7104}, a.L["Siege on Dragonbane Keep: Active"]);
    KrowiAF_RegisterEventOptions("World", "DF___Siege_on_Dragonbane_Keep", a.L["DF - Siege on Dragonbane Keep"], {7267}, a.L["Siege on Dragonbane Keep: Gathering"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Siege_on_Dragonbane_Keep", { 7104, 7267 });
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", a.L["DF - Grand Hunts"], {7342}, a.L["Grand Hunts: Ohn'ahran Plains"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", a.L["DF - Grand Hunts"], {7343}, a.L["Grand Hunts: The Waking Shore"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", a.L["DF - Grand Hunts"], {7344}, a.L["Grand Hunts: Thaldraszus"]);
    KrowiAF_RegisterEventOptions("World", "DF___Grand_Hunts", a.L["DF - Grand Hunts"], {7345}, a.L["Grand Hunts: The Azure Span"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Grand_Hunts", { 7342, 7343, 7344, 7345 });
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7221}, a.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7225}, a.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7229}, a.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7233}, a.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7237}, a.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7245}, a.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7249}, a.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7253}, a.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7257}, a.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Thunderstorms", a.L["DF - Thunderstorms"], {7298}, a.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Thunderstorms", { 7221, 7225, 7229, 7233, 7237, 7245, 7249, 7253, 7257, 7298 });
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7222}, a.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7226}, a.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7230}, a.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7234}, a.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7238}, a.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7246}, a.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7250}, a.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7254}, a.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7258}, a.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Sandstorms", a.L["DF - Sandstorms"], {7299}, a.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Sandstorms", { 7222, 7226, 7230, 7234, 7238, 7246, 7250, 7254, 7258, 7299 });
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7223}, a.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7227}, a.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7231}, a.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7235}, a.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7239}, a.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7247}, a.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7251}, a.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7255}, a.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7259}, a.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Firestorms", a.L["DF - Firestorms"], {7300}, a.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Firestorms", { 7223, 7227, 7231, 7235, 7239, 7247, 7251, 7255, 7259, 7300 });
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7224}, a.L["Nokhudon Hold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7228}, a.L["Ohn'iri Springs"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7232}, a.L["Brackenhide Hollow"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7236}, a.L["Cobalt Assembly"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7240}, a.L["Imbu"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7248}, a.L["Tyrhold"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7252}, a.L["Dragonbane Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7256}, a.L["Slagmire"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7260}, a.L["Scalecracker Keep"]);
    KrowiAF_RegisterEventOptions("World", "DF___Snowstorms", a.L["DF - Snowstorms"], {7301}, a.L["Primalist Tomorrow"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Snowstorms", { 7224, 7228, 7232, 7236, 7240, 7248, 7252, 7256, 7260, 7301 });
    KrowiAF_RegisterEventOptions("World", "DF___Fyrakk_Assault", a.L["DF - Fyrakk Assault"], {7433}, a.L["Azure Span"]);
    KrowiAF_RegisterEventOptions("World", "DF___Fyrakk_Assault", a.L["DF - Fyrakk Assault"], {7471}, a.L["Ohn'ahran Plains"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Fyrakk_Assault", { 7433, 7471 });
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", a.L["DF - Researchers Under Fire"], {7459}, a.L["Titan Lockdown: Next"]);
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", a.L["DF - Researchers Under Fire"], {7460}, a.L["Zaqali Ruin Investigation: Next"]);
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", a.L["DF - Researchers Under Fire"], {7461}, a.L["Titan Lockdown: Active"]);
    KrowiAF_RegisterEventOptions("World", "DF___Researchers_Under_Fire", a.L["DF - Researchers Under Fire"], {7462}, a.L["Zaqali Ruin Investigation: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Researchers_Under_Fire", { 7459, 7460, 7461, 7462 });
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", a.L["DF - Dreamsurge"], {7553, 7602}, a.L["Thaldraszus: Next"]);
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", a.L["DF - Dreamsurge"], {7554, 7605}, a.L["Azure Span: Next"]);
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", a.L["DF - Dreamsurge"], {7555, 7604}, a.L["Ohn'ahran Plains: Next"]);
    KrowiAF_RegisterEventOptions("World", "DF___Dreamsurge", a.L["DF - Dreamsurge"], {7556, 7603}, a.L["Waking Shores: Next"]);
    KrowiAF_RegisterDeSelectAllEventOptions("World", "DF___Dreamsurge", { 7553, 7602, 7554, 7605, 7555, 7604, 7556, 7603 });
end