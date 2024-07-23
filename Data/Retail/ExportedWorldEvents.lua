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

local function N(ids, cId, ...)
    for _, id in next, ids do
        worldEvents[id] = event:New(id, ids, categories[cId], eventType.World, ...);
    end
end

local a = addon; -- Saves some characters and file size as we use this a lot in the tasks

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-07-21 13-47-15 ]] --
tasks = {
    {N, {5175}, 948, 1408998, a.L["Legion Assaults"] .. ": " .. a.L["Azsuna"], 619},
    {N, {5177}, 948, 1409000, a.L["Legion Assaults"] .. ": " .. a.L["Highmountain"], 619},
    {N, {5178}, 948, 1409001, a.L["Legion Assaults"] .. ": " .. a.L["Stormheim"], 619},
    {N, {5210}, 948, 1409010, a.L["Legion Assaults"] .. ": " .. a.L["Val'sharah"], 619},
    {N, {5896}, 935, 2065630, a.L["Faction Assaults"] .. ": " .. a.L["Tiragarde Sound"], 876},
    {N, {5964}, 936, 2065567, a.L["Faction Assaults"] .. ": " .. a.L["Drustvar"], 876},
    {N, {5966}, 937, 2065627, a.L["Faction Assaults"] .. ": " .. a.L["Stormsong Valley"], 876},
    {N, {5969}, 938, 2032229, a.L["Faction Assaults"] .. ": " .. a.L["Nazmir"], 875},
    {N, {5970}, 939, 2065632, a.L["Faction Assaults"] .. ": " .. a.L["Vol'dun"], 875},
    {N, {5973}, 934, 2065640, a.L["Faction Assaults"] .. ": " .. a.L["Zuldazar"], 875},
    {N, {6486}, 942, 3196264, a.L["Defending Azeroth Assaults"] .. ": " .. a.L["N'Zoth (Uldum)"], 12},
    {N, {6487}, 942, 415054, a.L["Defending Azeroth Assaults"] .. ": " .. a.L["Amathet"], 12},
    {N, {6488}, 942, 458247, a.L["Defending Azeroth Assaults"] .. ": " .. a.L["Aqir"], 12},
    {N, {6489}, 941, 3196265, a.L["Defending Azeroth Assaults"] .. ": " .. a.L["N'Zoth (Vale of Eternal Blossoms)"], 424},
    {N, {6490}, 941, 801016, a.L["Defending Azeroth Assaults"] .. ": " .. a.L["Mogu"], 424},
    {N, {6491}, 941, 615301, a.L["Defending Azeroth Assaults"] .. ": " .. a.L["Mantid"], 424},
    {N, {6989}, 929, 3257749, a.L["Covenant assaults"] .. ": " .. a.L["Necrolord"], 1550},
    {N, {6990}, 931, 3257751, a.L["Covenant assaults"] .. ": " .. a.L["Venthyr"], 1550},
    {N, {6991}, 928, 3257748, a.L["Covenant assaults"] .. ": " .. a.L["Kyrian"], 1550},
    {N, {6992}, 930, 3257750, a.L["Covenant assaults"] .. ": " .. a.L["Night Fae"], 1550},
    {N, {7104}, 1394, 1394891, a.L["Siege on Dragonbane Keep"] .. ": " .. a.L["Active"], 2057},
    {N, {7221}, 1364, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Nokhudon Hold"], 2023},
    {N, {7222}, 1364, 451165, a.L["Sandstorms"] .. ": " .. a.L["Nokhudon Hold"], 2023},
    {N, {7223}, 1364, 460952, a.L["Firestorms"] .. ": " .. a.L["Nokhudon Hold"], 2023},
    {N, {7224}, 1364, 135783, a.L["Snowstorms"] .. ": " .. a.L["Nokhudon Hold"], 2023},
    {N, {7225}, 1364, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Ohn'iri Springs"], 2023},
    {N, {7226}, 1364, 451165, a.L["Sandstorms"] .. ": " .. a.L["Ohn'iri Springs"], 2023},
    {N, {7227}, 1364, 460952, a.L["Firestorms"] .. ": " .. a.L["Ohn'iri Springs"], 2023},
    {N, {7228}, 1364, 135783, a.L["Snowstorms"] .. ": " .. a.L["Ohn'iri Springs"], 2023},
    {N, {7229}, 1365, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Brackenhide Hollow"], 2024},
    {N, {7230}, 1365, 451165, a.L["Sandstorms"] .. ": " .. a.L["Brackenhide Hollow"], 2024},
    {N, {7231}, 1365, 460952, a.L["Firestorms"] .. ": " .. a.L["Brackenhide Hollow"], 2024},
    {N, {7232}, 1365, 135783, a.L["Snowstorms"] .. ": " .. a.L["Brackenhide Hollow"], 2024},
    {N, {7233}, 1365, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Cobalt Assembly"], 2024},
    {N, {7234}, 1365, 451165, a.L["Sandstorms"] .. ": " .. a.L["Cobalt Assembly"], 2024},
    {N, {7235}, 1365, 460952, a.L["Firestorms"] .. ": " .. a.L["Cobalt Assembly"], 2024},
    {N, {7236}, 1365, 135783, a.L["Snowstorms"] .. ": " .. a.L["Cobalt Assembly"], 2024},
    {N, {7237}, 1365, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Imbu"], 2024},
    {N, {7238}, 1365, 451165, a.L["Sandstorms"] .. ": " .. a.L["Imbu"], 2024},
    {N, {7239}, 1365, 460952, a.L["Firestorms"] .. ": " .. a.L["Imbu"], 2024},
    {N, {7240}, 1365, 135783, a.L["Snowstorms"] .. ": " .. a.L["Imbu"], 2024},
    {N, {7245}, 1366, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Tyrhold"], 2025},
    {N, {7246}, 1366, 451165, a.L["Sandstorms"] .. ": " .. a.L["Tyrhold"], 2025},
    {N, {7247}, 1366, 460952, a.L["Firestorms"] .. ": " .. a.L["Tyrhold"], 2025},
    {N, {7248}, 1366, 135783, a.L["Snowstorms"] .. ": " .. a.L["Tyrhold"], 2025},
    {N, {7249}, 1363, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Dragonbane Keep"], 2022},
    {N, {7250}, 1363, 451165, a.L["Sandstorms"] .. ": " .. a.L["Dragonbane Keep"], 2022},
    {N, {7251}, 1363, 460952, a.L["Firestorms"] .. ": " .. a.L["Dragonbane Keep"], 2022},
    {N, {7252}, 1363, 135783, a.L["Snowstorms"] .. ": " .. a.L["Dragonbane Keep"], 2022},
    {N, {7253}, 1363, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Slagmire"], 2022},
    {N, {7254}, 1363, 451165, a.L["Sandstorms"] .. ": " .. a.L["Slagmire"], 2022},
    {N, {7255}, 1363, 460952, a.L["Firestorms"] .. ": " .. a.L["Slagmire"], 2022},
    {N, {7256}, 1363, 135783, a.L["Snowstorms"] .. ": " .. a.L["Slagmire"], 2022},
    {N, {7257}, 1363, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Scalecracker Keep"], 2022},
    {N, {7258}, 1363, 451165, a.L["Sandstorms"] .. ": " .. a.L["Scalecracker Keep"], 2022},
    {N, {7259}, 1363, 460952, a.L["Firestorms"] .. ": " .. a.L["Scalecracker Keep"], 2022},
    {N, {7260}, 1363, 135783, a.L["Snowstorms"] .. ": " .. a.L["Scalecracker Keep"], 2022},
    {N, {7267}, 1394, 1394891, a.L["Siege on Dragonbane Keep"] .. ": " .. a.L["Gathering"], 2057},
    {N, {7298}, 1366, 132845, a.L["Thunderstorms"] .. ": " .. a.L["Primalist Tomorrow"], 2025},
    {N, {7299}, 1366, 451165, a.L["Sandstorms"] .. ": " .. a.L["Primalist Tomorrow"], 2025},
    {N, {7300}, 1366, 460952, a.L["Firestorms"] .. ": " .. a.L["Primalist Tomorrow"], 2025},
    {N, {7301}, 1366, 135783, a.L["Snowstorms"] .. ": " .. a.L["Primalist Tomorrow"], 2025},
    {N, {7342}, 1392, 4622465, a.L["Grand Hunts"] .. ": " .. a.L["Ohn'ahran Plains"], 1978},
    {N, {7343}, 1392, 4622465, a.L["Grand Hunts"] .. ": " .. a.L["The Waking Shore"], 1978},
    {N, {7344}, 1392, 4622465, a.L["Grand Hunts"] .. ": " .. a.L["Thaldraszus"], 1978},
    {N, {7345}, 1392, 4622465, a.L["Grand Hunts"] .. ": " .. a.L["The Azure Span"], 1978},
    {N, {7433}, 1425, 4914672, a.L["Fyrakk Assaults"] .. ": " .. a.L["Azure Span"], 2024},
    {N, {7459}, 1430, 254117, a.L["Researchers Under Fire"] .. ": " .. a.L["Titan Lockdown: Next"], 2133},
    {N, {7460}, 1429, 4237659, a.L["Researchers Under Fire"] .. ": " .. a.L["Zaqali Ruin Investigation: Next"], 2133},
    {N, {7461}, 1430, 254117, a.L["Researchers Under Fire"] .. ": " .. a.L["Titan Lockdown: Active"], 2133},
    {N, {7462}, 1429, 4237659, a.L["Researchers Under Fire"] .. ": " .. a.L["Zaqali Ruin Investigation: Active"], 2133},
    {N, {7471}, 1425, 4914672, a.L["Fyrakk Assaults"] .. ": " .. a.L["Ohn'ahran Plains"], 2023},
    {N, {7553, 7602}, 1537, 1394953, a.L["Dreamsurges"] .. ": " .. a.L["Thaldraszus: Next"], 1978},
    {N, {7554, 7605}, 1537, 1394953, a.L["Dreamsurges"] .. ": " .. a.L["Azure Span: Next"], 1978},
    {N, {7555, 7604}, 1537, 1394953, a.L["Dreamsurges"] .. ": " .. a.L["Ohn'ahran Plains: Next"], 1978},
    {N, {7556, 7603}, 1537, 1394953, a.L["Dreamsurges"] .. ": " .. a.L["Waking Shores: Next"], 1978},
};

function exportedWorldEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("World", {5175}, a.L["Azsuna"], a.L["Legion Assaults"], 1, 6);
    KrowiAF_RegisterEventOptions("World", {5177}, a.L["Highmountain"], a.L["Legion Assaults"], 1, 6);
    KrowiAF_RegisterEventOptions("World", {5178}, a.L["Stormheim"], a.L["Legion Assaults"], 1, 6);
    KrowiAF_RegisterEventOptions("World", {5210}, a.L["Val'sharah"], a.L["Legion Assaults"], 1, 6);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {5175, 5177, 5178, 5210}, a.L["Legion Assaults"], 6);
    KrowiAF_RegisterEventOptions("World", {5896}, a.L["Tiragarde Sound"], a.L["Faction Assaults"], 1, 7);
    KrowiAF_RegisterEventOptions("World", {5964}, a.L["Drustvar"], a.L["Faction Assaults"], 1, 7);
    KrowiAF_RegisterEventOptions("World", {5966}, a.L["Stormsong Valley"], a.L["Faction Assaults"], 1, 7);
    KrowiAF_RegisterEventOptions("World", {5969}, a.L["Nazmir"], a.L["Faction Assaults"], 1, 7);
    KrowiAF_RegisterEventOptions("World", {5970}, a.L["Vol'dun"], a.L["Faction Assaults"], 1, 7);
    KrowiAF_RegisterEventOptions("World", {5973}, a.L["Zuldazar"], a.L["Faction Assaults"], 1, 7);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {5896, 5964, 5966, 5969, 5970, 5973}, a.L["Faction Assaults"], 7);
    KrowiAF_RegisterEventOptions("World", {6989}, a.L["Necrolord"], a.L["Covenant assaults"], 1, 8);
    KrowiAF_RegisterEventOptions("World", {6990}, a.L["Venthyr"], a.L["Covenant assaults"], 1, 8);
    KrowiAF_RegisterEventOptions("World", {6991}, a.L["Kyrian"], a.L["Covenant assaults"], 1, 8);
    KrowiAF_RegisterEventOptions("World", {6992}, a.L["Night Fae"], a.L["Covenant assaults"], 1, 8);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {6989, 6990, 6991, 6992}, a.L["Covenant assaults"], 8);
    KrowiAF_RegisterEventOptions("World", {7104}, a.L["Active"], a.L["Siege on Dragonbane Keep"], 1, 9);
    KrowiAF_RegisterEventOptions("World", {7267}, a.L["Gathering"], a.L["Siege on Dragonbane Keep"], 1, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7104, 7267}, a.L["Siege on Dragonbane Keep"], 9);
    KrowiAF_RegisterEventOptions("World", {6486}, a.L["N'Zoth (Uldum)"], a.L["Defending Azeroth Assaults"], 2, 7);
    KrowiAF_RegisterEventOptions("World", {6487}, a.L["Amathet"], a.L["Defending Azeroth Assaults"], 2, 7);
    KrowiAF_RegisterEventOptions("World", {6488}, a.L["Aqir"], a.L["Defending Azeroth Assaults"], 2, 7);
    KrowiAF_RegisterEventOptions("World", {6489}, a.L["N'Zoth (Vale of Eternal Blossoms)"], a.L["Defending Azeroth Assaults"], 2, 7);
    KrowiAF_RegisterEventOptions("World", {6490}, a.L["Mogu"], a.L["Defending Azeroth Assaults"], 2, 7);
    KrowiAF_RegisterEventOptions("World", {6491}, a.L["Mantid"], a.L["Defending Azeroth Assaults"], 2, 7);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {6486, 6487, 6488, 6489, 6490, 6491}, a.L["Defending Azeroth Assaults"], 7);
    KrowiAF_RegisterEventOptions("World", {7342}, a.L["Ohn'ahran Plains"], a.L["Grand Hunts"], 3, 9);
    KrowiAF_RegisterEventOptions("World", {7343}, a.L["The Waking Shore"], a.L["Grand Hunts"], 3, 9);
    KrowiAF_RegisterEventOptions("World", {7344}, a.L["Thaldraszus"], a.L["Grand Hunts"], 3, 9);
    KrowiAF_RegisterEventOptions("World", {7345}, a.L["The Azure Span"], a.L["Grand Hunts"], 3, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7342, 7343, 7344, 7345}, a.L["Grand Hunts"], 9);
    KrowiAF_RegisterEventOptions("World", {7221}, a.L["Nokhudon Hold"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7225}, a.L["Ohn'iri Springs"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7229}, a.L["Brackenhide Hollow"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7233}, a.L["Cobalt Assembly"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7237}, a.L["Imbu"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7245}, a.L["Tyrhold"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7249}, a.L["Dragonbane Keep"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7253}, a.L["Slagmire"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7257}, a.L["Scalecracker Keep"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterEventOptions("World", {7298}, a.L["Primalist Tomorrow"], a.L["Thunderstorms"], 4, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7221, 7225, 7229, 7233, 7237, 7245, 7249, 7253, 7257, 7298}, a.L["Thunderstorms"], 9);
    KrowiAF_RegisterEventOptions("World", {7222}, a.L["Nokhudon Hold"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7226}, a.L["Ohn'iri Springs"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7230}, a.L["Brackenhide Hollow"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7234}, a.L["Cobalt Assembly"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7238}, a.L["Imbu"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7246}, a.L["Tyrhold"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7250}, a.L["Dragonbane Keep"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7254}, a.L["Slagmire"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7258}, a.L["Scalecracker Keep"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterEventOptions("World", {7299}, a.L["Primalist Tomorrow"], a.L["Sandstorms"], 5, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7222, 7226, 7230, 7234, 7238, 7246, 7250, 7254, 7258, 7299}, a.L["Sandstorms"], 9);
    KrowiAF_RegisterEventOptions("World", {7223}, a.L["Nokhudon Hold"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7227}, a.L["Ohn'iri Springs"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7231}, a.L["Brackenhide Hollow"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7235}, a.L["Cobalt Assembly"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7239}, a.L["Imbu"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7247}, a.L["Tyrhold"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7251}, a.L["Dragonbane Keep"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7255}, a.L["Slagmire"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7259}, a.L["Scalecracker Keep"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterEventOptions("World", {7300}, a.L["Primalist Tomorrow"], a.L["Firestorms"], 6, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7223, 7227, 7231, 7235, 7239, 7247, 7251, 7255, 7259, 7300}, a.L["Firestorms"], 9);
    KrowiAF_RegisterEventOptions("World", {7224}, a.L["Nokhudon Hold"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7228}, a.L["Ohn'iri Springs"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7232}, a.L["Brackenhide Hollow"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7236}, a.L["Cobalt Assembly"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7240}, a.L["Imbu"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7248}, a.L["Tyrhold"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7252}, a.L["Dragonbane Keep"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7256}, a.L["Slagmire"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7260}, a.L["Scalecracker Keep"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterEventOptions("World", {7301}, a.L["Primalist Tomorrow"], a.L["Snowstorms"], 7, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7224, 7228, 7232, 7236, 7240, 7248, 7252, 7256, 7260, 7301}, a.L["Snowstorms"], 9);
    KrowiAF_RegisterEventOptions("World", {7433}, a.L["Azure Span"], a.L["Fyrakk Assaults"], 8, 9);
    KrowiAF_RegisterEventOptions("World", {7471}, a.L["Ohn'ahran Plains"], a.L["Fyrakk Assaults"], 8, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7433, 7471}, a.L["Fyrakk Assaults"], 9);
    KrowiAF_RegisterEventOptions("World", {7459}, a.L["Titan Lockdown: Next"], a.L["Researchers Under Fire"], 9, 9);
    KrowiAF_RegisterEventOptions("World", {7460}, a.L["Zaqali Ruin Investigation: Next"], a.L["Researchers Under Fire"], 9, 9);
    KrowiAF_RegisterEventOptions("World", {7461}, a.L["Titan Lockdown: Active"], a.L["Researchers Under Fire"], 9, 9);
    KrowiAF_RegisterEventOptions("World", {7462}, a.L["Zaqali Ruin Investigation: Active"], a.L["Researchers Under Fire"], 9, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7459, 7460, 7461, 7462}, a.L["Researchers Under Fire"], 9);
    KrowiAF_RegisterEventOptions("World", {7553, 7602}, a.L["Thaldraszus: Next"], a.L["Dreamsurges"], 11, 9);
    KrowiAF_RegisterEventOptions("World", {7554, 7605}, a.L["Azure Span: Next"], a.L["Dreamsurges"], 11, 9);
    KrowiAF_RegisterEventOptions("World", {7555, 7604}, a.L["Ohn'ahran Plains: Next"], a.L["Dreamsurges"], 11, 9);
    KrowiAF_RegisterEventOptions("World", {7556, 7603}, a.L["Waking Shores: Next"], a.L["Dreamsurges"], 11, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("World", {7553, 7602, 7554, 7605, 7555, 7604, 7556, 7603}, a.L["Dreamsurges"], 9);
end