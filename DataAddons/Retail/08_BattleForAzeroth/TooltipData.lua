local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

local battleForAzerothMenuCriteria =  {
    {1, {156526, 162288, 162289}, type.Item}, -- Bountiful Captain's Feast
    {1, {259421, 259422, 259423}, type.Spell}, -- Bountiful Captain's Feast
    {2, {156525, 162287}, type.Item}, -- Galley Banquet
    {2, {259418, 259420, 259419}, type.Spell}, -- Galley Banquet
    {3, {162292, 154889}, type.Item}, -- Grilled Catfish
    {3, {259432, 259430, 259431}, type.Spell}, -- Grilled Catfish
    {4, {154882, 162286}, type.Item}, -- Honey-Glazed Haunches
    {4, {259414, 259415, 259416}, type.Spell}, -- Honey-Glazed Haunches
    {5, {154881, 162285}, type.Item}, -- Kul Tiramisu
    {5, {259412, 259411, 259413}, type.Spell}, -- Kul Tiramisu
    {6, {162294, 154887}, type.Item}, -- Loa Loaf
    {6, {259438, 259436, 259437}, type.Spell}, -- Loa Loaf
    {7, {162296, 154885}, type.Item}, -- Mon'Dazi
    {7, {259442, 259443, 259444}, type.Spell}, -- Mon'Dazi
    {8, {154883, 162290}, type.Item}, -- Ravenberry Tarts
    {8, {259424, 259425, 259426}, type.Spell}, -- Ravenberry Tarts
    {9, {154888, 162295}, type.Item}, -- Sailor's Pie
    {9, {259441, 259439, 259440}, type.Spell}, -- Sailor's Pie
    {10, {162293, 154891}, type.Item}, -- Seasoned Loins
    {10, {259434, 259433, 259435}, type.Spell}, -- Seasoned Loins
    {11, {162297, 154886}, type.Item}, -- Spiced Snapper
    {11, {259447, 259445, 259446}, type.Spell}, -- Spiced Snapper
    {12, {154884, 162291}, type.Item}, -- Swamp Fish 'n Chips
    {12, {259427, 259429, 259428}, type.Spell}, -- Swamp Fish 'n Chips
};

KrowiAF.TooltipData.BattleForAzeroth = {
    { -- Raiding with Leashes V: Cuteaclysm
        12079,
        {
            {1, 42178, type.Unit}, -- Magmatron
            {1, 127850, type.Item}, -- Tinytron
            {2, 41378, type.Unit}, -- Maloriak
            {2, 127852, type.Item}, -- Discarded Experiment
            {3, 41376, type.Unit}, -- Nefarian
            {3, 127853, type.Item}, -- Rattlejaw
            {4, 45992, type.Unit}, -- Valiona
            {4, 127857, type.Item}, -- Twilight Clutch Sister
            {5, 43735, type.Unit}, -- Elementium Monstrosity
            {5, 127858, type.Item}, -- Bound Stream
            {6, 43324, type.Unit}, -- Chogall
            {6, 127859, type.Item}, -- Faceless Minion
            {7, 45871, type.Unit}, -- Nezir
            {7, 127863, type.Item}, -- Drafty
            {8, 46753, type.Unit}, -- Alakir
            {8, 127862, type.Item}, -- Zephyrian Prince
            {9, 53691, type.Unit}, -- Shannox
            {9, 127947, type.Item}, -- Blazehound
            {10, 52498, type.Unit}, -- Bethtilac
            {10, 127948, type.Item}, -- Cinderweb Recluse
            {11, 53494, type.Unit}, -- Baleroc
            {11, 127950, type.Item}, -- Surger
            {12, 52571, type.Unit}, -- Majordomo Staghelm
            {12, 127951, type.Item}, -- Infernal Pyreclaw
            {13, 55312, type.Unit}, -- Yorsahj The Unsleeping
            {13, 127952, type.Item}, -- Faceless Mindlasher
            {14, 53879, type.Unit}, -- Deathwing
            {14, 127953, type.Item}, -- Corrupted Blood
            {15, 53879, type.Unit}, -- Deathwing
            {15, 127954, type.Item}, -- Unstable Tendril
        }
    },
    { -- The Zandalari Menu
        12744,
        {
            Faction = PLAYER_FACTION_GROUP.Alliance,
        },
        battleForAzerothMenuCriteria
    },
    { -- The Zandalari Menu
        12746,
        {
            Faction = PLAYER_FACTION_GROUP.Horde,
        },
        battleForAzerothMenuCriteria
    },
    { -- Battle Safari
        12930, type.Unit,
        {
            {1, 143031}, -- Shadowback Crawler
            {2, 143032}, -- River Frog
            {3, 143033}, -- Freshwater Crawler
            {4, 143034}, -- Vale Marmot
            {5, 143035}, -- Valley Chicken
            {6, 143036}, -- Sandyback Crawler
            {7, 143037}, -- River Otter
            {8, 143039}, -- Parasitic Boarfly
            {9, 143040}, -- Shack Crab
            {10, 143041}, -- Inland Croaker
            {11, 143042}, -- Giant Woodworm
            {12, 143043}, -- Shore Butterfly
            {13, 143044}, -- Barrier Hermit
            {14, 143045}, -- Coastal Scuttler
            {15, 143046}, -- Golden Beetle
            {16, 143047}, -- Bloodfever Tarantula
            {17, 143048}, -- Elusive Skimmer
            {18, 143049}, -- Leafy Flutterwing
            {19, 143050}, -- Young Sand Sifter
            {20, 143051}, -- Sticky Oozeling
            {21, 143052}, -- Returned Hatchling
            {22, 143053}, -- Glutted Bleeder
            {23, 143054}, -- Spectral Raven
            {24, 143055}, -- Boghopper
            {25, 143056}, -- Hermit Crab
            {26, 143057}, -- Coastal Bounder
            {27, 143038}, -- Honey Bee
        }
    },
    { -- Raiding with Leashes VI: Pets of Pandaria
        13469,
        {
            {1, 59915, type.Unit}, -- Jasper Guardian
            {1, 60043, type.Unit}, -- Jade Guardian
            {1, 60047, type.Unit}, -- Amethyst Guardian
            {1, 60051, type.Unit}, -- Cobalt Guardian
            {1, 150354, type.Item}, -- Stoneclaw
            {2, 60143, type.Unit}, -- Garajal The Spiritbinder
            {2, 150356, type.Item}, -- Wayward Spirit
            {3, 60410, type.Unit}, -- Elegon
            {3, 150357, type.Item}, -- Comet
            {4, 60399, type.Unit}, -- Qin Xi
            {4, 150360, type.Item}, -- Baoh Xi
            {5, 62442, type.Unit}, -- Tsulong
            {5, 150365, type.Item}, -- Azure Windseeker
            {6, 62983, type.Unit}, -- Lei Shi
            {6, 150372, type.Item}, -- Spirit Of The Spring
            {7, 62980, type.Unit}, -- Imperial Vizier Zorlok
            {7, 150374, type.Item}, -- Korthik Swarmling
            {8, 62543, type.Unit}, -- Blade Lord Tayak
            {8, 150375, type.Item}, -- Amberglow Stinger
            {9, 62164, type.Unit}, -- Garalon
            {9, 150377, type.Item}, -- Spawn Of Garalon
            {10, 62511, type.Unit}, -- Amber Shaper Unsok
            {10, 150380, type.Item}, -- Living Amber
            {11, 62837, type.Unit}, -- Grand Empress Shekzeer
            {11, 150381, type.Item}, -- Ravenous Prideling
        }
    },
    { -- Mecha-Safari
        13693, type.Unit,
        {
            {1, 154771}, -- Junkheap Roach
            {2, 154775}, -- Fleeting Frog
            {3, 154785}, -- Mechagon Marmot
            {4, 154779}, -- Motorized Croaker
            {5, 154791}, -- Scrapyard Tunneler
            {6, 154769}, -- Duskytooth Snooter
            {7, 154783}, -- Rustbolt Clucker
            {8, 154767}, -- Rustyroot Snooter
            {9, 154777}, -- Yellow Junkhopper
            {10, 154773}, -- Experimental Roach
            {11, 154787}, -- Specimen 97
            {12, 154798}, -- Malfunctioning Microbot
        }
    },
    { -- Nazjatari Safari
        13694, type.Unit,
        {
            {1, 154716}, -- Spireshell Snail
            {2, 154724}, -- Muck Slug
            {3, 154702}, -- Sandclaw Sunshell
            {4, 154814}, -- Abyssal Slitherling
            {5, 154706}, -- Chitterspine Skitterling
            {6, 154712}, -- Deeptide Fingerling
            {7, 154697}, -- Sandclaw Pincher
            {8, 154704}, -- Glimmershell Scuttler
            {9, 154708}, -- Hissing Chitterspine
            {10, 154710}, -- Great Sea Albatross
            {11, 154714}, -- Bloodseeker
        }
    },
    { -- From The Belly Of The Jelly
        13715, type.Unit,
        {
            {1, 151651}, -- Slimy Darkhunter
            {2, 151697}, -- Slimy Eel
            {3, 151696}, -- Slimy Fangtooth
            {4, 151632}, -- Slimy Hermit Crab
            {5, 151673}, -- Slimy Octopode
            {6, 151700}, -- Slimy Otter
            {7, 151631}, -- Slimy Sea Slug
        }
    },
};