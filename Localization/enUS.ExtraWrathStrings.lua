-- [[ Exported at 2023-01-19 17-25-20 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
addon.ExtraWrathStrings = {};
addon.ExtraWrathStrings.enUS = {};
local extraWrathStrings = addon.ExtraWrathStrings.enUS;

function extraWrathStrings.Load(L)
    if not string.match((GetBuildInfo()), "(%d+)%.(%d+)%.(%d+)(%w?)") == "3" then
        return;
    end

    L["EJ_GetInstanceInfo241"] = "Zul'Farrak";
    L["EJ_GetInstanceInfo247"] = "Auchenai Crypts";
    L["EJ_GetInstanceInfo249"] = "Magisters' Terrace";
    L["EJ_GetInstanceInfo742"] = "Blackwing Lair";
    L["EJ_GetInstanceInfo750"] = "The Battle for Mount Hyjal";
    L["EJ_GetInstanceInfo255"] = "The Black Morass";
    L["EJ_GetInstanceInfo258"] = "The Mechanar";
    L["EJ_GetInstanceInfo262"] = "The Underbog";
    L["EJ_GetInstanceInfo274"] = "Gundrak";
    L["EJ_GetInstanceInfo278"] = "Pit of Saron";
    L["EJ_GetInstanceInfo282"] = "The Oculus";
    L["EJ_GetInstanceInfo286"] = "Utgarde Pinnacle";
    L["EJ_GetInstanceInfo743"] = "Ruins of Ahn'Qiraj";
    L["EJ_GetInstanceInfo751"] = "Black Temple";
    L["EJ_GetInstanceInfo759"] = "Ulduar";
    L["EJ_GetInstanceInfo1193"] = "Sanctum of Domination";
    L["EJ_GetInstanceInfo744"] = "Temple of Ahn'Qiraj";
    L["EJ_GetInstanceInfo752"] = "Sunwell Plateau";
    L["EJ_GetInstanceInfo760"] = "Onyxia's Lair";
    L["EJ_GetInstanceInfo259"] = "The Shattered Halls";
    L["EJ_GetInstanceInfo271"] = "Ahn'kahet: The Old Kingdom";
    L["EJ_GetInstanceInfo275"] = "Halls of Lightning";
    L["EJ_GetInstanceInfo279"] = "The Culling of Stratholme";
    L["EJ_GetInstanceInfo283"] = "The Violet Hold";
    L["EJ_GetInstanceInfo745"] = "Karazhan";
    L["EJ_GetInstanceInfo753"] = "Vault of Archavon";
    L["EJ_GetInstanceInfo761"] = "The Ruby Sanctum";
    L["EJ_GetInstanceInfo226"] = "Ragefire Chasm";
    L["EJ_GetInstanceInfo228"] = "Blackrock Depths";
    L["EJ_GetInstanceInfo230"] = "Dire Maul";
    L["EJ_GetInstanceInfo232"] = "Maraudon";
    L["EJ_GetInstanceInfo234"] = "Razorfen Kraul";
    L["EJ_GetInstanceInfo236"] = "Stratholme";
    L["EJ_GetInstanceInfo238"] = "The Stockade";
    L["EJ_GetInstanceInfo240"] = "Wailing Caverns";
    L["EJ_GetInstanceInfo246"] = "Scholomance";
    L["EJ_GetInstanceInfo248"] = "Hellfire Ramparts";
    L["EJ_GetInstanceInfo250"] = "Mana-Tombs";
    L["EJ_GetInstanceInfo252"] = "Sethekk Halls";
    L["EJ_GetInstanceInfo64"] = "Shadowfang Keep";
    L["EJ_GetInstanceInfo256"] = "The Blood Furnace";
    L["EJ_GetInstanceInfo260"] = "The Slave Pens";
    L["EJ_GetInstanceInfo272"] = "Azjol-Nerub";
    L["EJ_GetInstanceInfo276"] = "Halls of Reflection";
    L["EJ_GetInstanceInfo280"] = "The Forge of Souls";
    L["EJ_GetInstanceInfo284"] = "Trial of the Champion";
    L["EJ_GetInstanceInfo76"] = "Zul'Gurub";
    L["EJ_GetInstanceInfo77"] = "Zul'Aman";
    L["EJ_GetInstanceInfo747"] = "Magtheridon's Lair";
    L["EJ_GetInstanceInfo316"] = "Scarlet Monastery";
    L["EJ_GetInstanceInfo1195"] = "Sepulcher of the First Ones";
    L["EJ_GetInstanceInfo1190"] = "Castle Nathria";
    L["EJ_GetInstanceInfo748"] = "Serpentshrine Cavern";
    L["EJ_GetInstanceInfo756"] = "The Eye of Eternity";
    L["EJ_GetInstanceInfo257"] = "The Botanica";
    L["EJ_GetInstanceInfo261"] = "The Steamvault";
    L["EJ_GetInstanceInfo758"] = "Icecrown Citadel";
    L["EJ_GetInstanceInfo311"] = "Scarlet Halls";
    L["EJ_GetInstanceInfo273"] = "Drak'Tharon Keep";
    L["EJ_GetInstanceInfo277"] = "Halls of Stone";
    L["EJ_GetInstanceInfo281"] = "The Nexus";
    L["EJ_GetInstanceInfo285"] = "Utgarde Keep";
    L["EJ_GetInstanceInfo755"] = "The Obsidian Sanctum";
    L["EJ_GetInstanceInfo63"] = "Deadmines";
    L["EJ_GetInstanceInfo253"] = "Shadow Labyrinth";
    L["EJ_GetInstanceInfo254"] = "The Arcatraz";
    L["EJ_GetInstanceInfo251"] = "Old Hillsbrad Foothills";
    L["EJ_GetInstanceInfo741"] = "Molten Core";
    L["EJ_GetInstanceInfo749"] = "The Eye";
    L["EJ_GetInstanceInfo757"] = "Trial of the Crusader";
    L["EJ_GetInstanceInfo746"] = "Gruul's Lair";
    L["EJ_GetInstanceInfo227"] = "Blackfathom Deeps";
    L["EJ_GetInstanceInfo229"] = "Lower Blackrock Spire";
    L["EJ_GetInstanceInfo231"] = "Gnomeregan";
    L["EJ_GetInstanceInfo233"] = "Razorfen Downs";
    L["EJ_GetInstanceInfo559"] = "Upper Blackrock Spire";
    L["EJ_GetInstanceInfo237"] = "The Temple of Atal'hakkar";
    L["EJ_GetInstanceInfo239"] = "Uldaman";
    L["EJ_GetInstanceInfo754"] = "Naxxramas";
    L["GetCategoryInfo15218"] = "Deepwind Gorge";
    L["GetCategoryInfo15164"] = "Mists of Pandaria";
    L["GetCategoryInfo15234"] = "Legacy";
    L["GetCategoryInfo15072"] = "Cataclysm";
    L["GetCategoryInfo15266"] = "Honor";
    L["GetCategoryInfo15305"] = "Battle for Azeroth";
    L["GetCategoryInfo15414"] = "Ashran";
    L["GetCategoryInfo15283"] = "World";
    L["GetCategoryInfo15074"] = "Twin Peaks";
    L["GetCategoryInfo15268"] = "Promotions";
    L["GetCategoryInfo15441"] = "Covenant Sanctums";
    L["GetCategoryInfo15439"] = "Shadowlands";
    L["GetCategoryInfo15292"] = "Seething Shore";
    L["GetCategoryInfo15426"] = "Visions of N'Zoth";
    L["GetCategoryInfo15246"] = "Collections";
    L["GetCategoryInfo15440"] = "Torghast";
    L["GetCategoryInfo15417"] = "Heart of Azeroth";
    L["GetCategoryInfo15163"] = "Temple of Kotmogu";
    L["GetCategoryInfo15073"] = "Battle for Gilneas";
    L["GetCategoryInfo15162"] = "Silvershard Mines";
    L["GetCategoryInfo15272"] = "Dungeons";
    L["GetCategoryInfo15271"] = "Raids";
    L["GetCategoryInfo15258"] = "Legion";
    L["GetCategoryInfo15101"] = "Darkmoon Faire";
    L["GetCategoryInfo15233"] = "Warlords of Draenor";
    L["GetCategoryInfo15117"] = "Pet Battles";
    L["GetCategoryInfo15454"] = "Timewalking";
    L["Completed"] = "Completed";
    L["Not Completed"] = "Not Completed";
end

