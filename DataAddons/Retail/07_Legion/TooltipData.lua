local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.Legion = {
    { -- The Legion Menu
        10762,
        {
            {1, {133557, 133810, 133831, 133851}, type.Item}, -- Salt and Pepper Shank
            {1, {201413, 201524, 201544}, type.Spell}, -- Salt and Pepper Shank
            {2, {133561, 133812, 133832, 133852}, type.Item}, -- Deep-Fried Mossgill
            {2, {201496, 201525, 201545}, type.Spell}, -- Deep-Fried Mossgill
            {3, {133562, 133813, 133833, 133853}, type.Item}, -- Pickled Stormray
            {3, {201497, 201526, 201546}, type.Spell}, -- Pickled Stormray
            {4, {133563, 133814, 133834, 133854}, type.Item}, -- Faronaar Fizz
            {4, {201498, 201527, 201547}, type.Spell}, -- Faronaar Fizz
            {5, {133564, 133815, 133835, 133855}, type.Item}, -- Spice Rib Roast
            {5, {201499, 201528, 201548}, type.Spell}, -- Spice Rib Roast
            {6, {133565, 133816, 133836, 133856}, type.Item}, -- Leybeque Ribs
            {6, {201500, 201529, 201549}, type.Spell}, -- Leybeque Ribs
            {7, {133566, 133817, 133837, 133857}, type.Item}, -- Suramar Surf and Turf
            {7, {201501, 201530, 201550}, type.Spell}, -- Suramar Surf and Turf
            {8, {133567, 133818, 133838, 133858}, type.Item}, -- Barracuda Mrglgagh
            {8, {201502, 201531, 201551}, type.Spell}, -- Barracuda Mrglgagh
            {9, {133568, 133819, 133839, 133859}, type.Item}, -- Koi-Scented Stormray
            {9, {201503, 201532, 201552}, type.Spell}, -- Koi-Scented Stormray
            {10, {133569, 133820, 133840, 133860}, type.Item}, -- Drogbar-Style Salmon
            {10, {201504, 201533, 201553}, type.Spell}, -- Drogbar-Style Salmon
            {11, {133570, 133821, 133841, 133861}, type.Item}, -- The Hungry Magister
            {11, {201554, 201505, 201534}, type.Spell}, -- The Hungry Magister
            {12, {133571, 133822, 133842, 133862}, type.Item}, -- Azshari Salad
            {12, {201555, 201506, 201535}, type.Spell}, -- Azshari Salad
            {13, {133572, 133823, 133843, 133863}, type.Item}, -- Nightborne Delicacy Platter
            {13, {201507, 201536, 201556}, type.Spell}, -- Nightborne Delicacy Platter
            {14, {133573, 133824, 133844, 133864}, type.Item}, -- Seed-Battered Fish Plate
            {14, {201508, 201537, 201557}, type.Spell}, -- Seed-Battered Fish Plate
            {15, {133574, 133825, 133845, 133865}, type.Item}, -- Fishbrul Special
            {15, {201538, 201558, 201511}, type.Spell}, -- Fishbrul Special
            {16, {133575, 133826, 133846, 133866}, type.Item}, -- Dried Mackerel Strips
            {16, {201512, 201559, 201539}, type.Spell}, -- Dried Mackerel Strips
            {17, {133576, 133827, 133847, 133867}, type.Item}, -- Bear Tartare
            {17, {201513, 201560, 201540}, type.Spell}, -- Bear Tartare
            {18, {133577, 133828, 133848, 133868}, type.Item}, -- Fighter Chow
            {18, {201514, 201541, 201561}, type.Spell}, -- Fighter Chow
            {19, {133578, 133829, 133849, 133869}, type.Item}, -- Hearty Feast
            {19, {201515, 201542, 201562}, type.Spell}, -- Hearty Feast
            {20, {133579, 133830, 133850, 133870}, type.Item}, -- Lavish Suramar Feast
            {20, {201516, 201543, 201563}, type.Spell}, -- Lavish Suramar Feast
            {21, {133681, 133871, 133872, 133873}, type.Item}, -- Crispy Bacon
            {21, {201683, 201684, 201685}, type.Spell}, -- Crispy Bacon
        }
    },
    { -- Broken Isles Safari
        11233, type.Unit,
        {
            {1, 97018}, -- Albatross Chick
            {2, 97076}, -- Fledgling Kingfeather
            {3, 97078}, -- Fledgling Oliveback
            {4, 97080}, -- Golden Eaglet
            {5, 97118}, -- Long Eared Owl
            {6, 97126}, -- Northern Hawk Owl
            {7, 97236}, -- Burrow Spiderling
            {8, 97283}, -- Juvenile Scuttleback
            {9, 97294}, -- Olivetail Hare
            {10, 97323}, -- Felspider
            {11, 97511}, -- Shimmering Aquafly
            {12, 97531}, -- Terror Larva
            {13, 97542}, -- Slithering Brownscale
            {14, 97547}, -- Vale Flitter
            {15, 97555}, -- Auburn Ringtail
            {16, 97559}, -- Spring Strider
            {17, 97741}, -- Black Footed Fox Kit
            {18, 97743}, -- Mist Fox Kit
            {19, 97840}, -- Rose Taipan
            {20, 97952}, -- Tiny Apparition
            {21, 88542}, -- Echo Batling
            {22, 98192}, -- Hog Nosed Bat
            {23, 98211}, -- Spiketail Beaver
            {24, 98385}, -- Erudite Manafiend
            {25, 98386}, -- Eldritch Manafiend
            {26, 98428}, -- Coralback Fiddler
            {27, 98446}, -- Mudshell Conch
            {28, 98506}, -- Dust Bunny
            {29, 99513}, -- Vicious Broodling
            {30, 99527}, -- Crystalline Broodling
            {31, 99528}, -- Thornclaw Broodling
            {32, 110741}, -- Gleamhoof Fawn
            {33, 110826}, -- Coastal Sandpiper
            {34, 111158}, -- Blind Rat
            {35, 111172}, -- Stormstruck Beaver
        }
    },
    { -- Raiding with Leashes IV: Wrath of the Lick King
        11320,
        {
            {1, 34797, type.Unit}, -- Icehowl
            {1, 115135, type.Item}, -- Dreadmaw
            {2, 34564, type.Unit}, -- Anubarak
            {2, 115137, type.Item}, -- Nerubian Swarmer
            {3, 33118, type.Unit}, -- Ignis The Furnace Master
            {3, 115138, type.Item}, -- Magma Rageling
            {4, 33186, type.Unit}, -- Razorscale
            {4, 115139, type.Item}, -- Ironbound Proto Whelp
            {5, 32857, type.Unit}, -- Stormcaller Brundir
            {5, 115140, type.Item}, -- Runeforged Servitor
            {6, 33515, type.Unit}, -- Auriaya
            {6, 115141, type.Item}, -- Sanctum Cub
            {7, 32845, type.Unit}, -- Hodir
            {7, 115142, type.Item}, -- Winter Rageling
            {8, 32906, type.Unit}, -- Freya
            {8, 115143, type.Item}, -- Snaplasher
            {9, 33350, type.Unit}, -- Mimiron
            {9, 115144, type.Item}, -- G0 R41 0N Ultratonk
            {10, 33288, type.Unit}, -- Yogg Saron
            {10, 115145, type.Item}, -- Creeping Tentacle
            {11, 36612, type.Unit}, -- Lord Marrowgar
            {11, 115146, type.Item}, -- Boneshard
            {12, 37813, type.Unit}, -- Deathbringer Saurfang
            {12, 115147, type.Item}, -- Blood Boil
            {13, 36678, type.Unit}, -- Professor Putricide
            {13, 115148, type.Item}, -- Blightbreath
            {14, 36853, type.Unit}, -- Sindragosa
            {14, 115149, type.Item}, -- Soulbroken Whelpling

	    -- Only the Normal Mode has this pet
            {15, 36597, type.Unit}, -- The Lich King (Normal Mode)
            {15, 115150, type.Item}, -- Drudge Ghoul

	    -- Only the Heroic Mode has this pet
            {16, 36597, type.Unit}, -- The Lich King (Heroic Mode)
            {16, 115152, type.Item}, -- Wicked Soul
        }
    },
};