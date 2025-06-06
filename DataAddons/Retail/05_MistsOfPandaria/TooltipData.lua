local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.MistsOfPandaria = {
    { -- To All the Squirrels I Once Caressed?
        6350, type.Unit,
        {
            {1, {63288, 64798}}, -- Amethyst Spiderling
            {2, {63062, 64782, 129153, 144920}}, -- Bandicoon
            {3, {64242, 64803}}, -- Clouded Hedgehog
            {4, {59356, 62991}}, -- Coral Adder
            {5, {63847, 65209}}, -- Dancing Water Skimmer
            {6, {63329, 65203, 67057}}, -- Emperor Crab
            {7, {63838, 65205}}, -- Gilded Moth
            {8, {63841, 65206}}, -- Golden Civet
            {9, {63919, 64774, 160683}}, -- Leopard Tree Frog
            {10, {63289, 65124}}, -- Luyu Moth
            {11, {63094, 64784}}, -- Malayan Quillrat
            {12, {63096, 64786, 144917}}, -- Marsh Fiddler
            {13, {65190, 65191}}, -- Mongoose
            {14, {64238, 64807, 117502}}, -- Resilient Roach
            {15, {59770, 65216}}, -- Shrine Fly
            {16, {63057, 64787}}, -- Sifang Otter
            {17, {63957, 64802}}, -- Yakrat
        }
    },
    { -- Kalimdor Safari
        6585, type.Unit,
        {
            {1, 61325}, -- Adder
            {2, 62189}, -- Alpine Chipmunk
            {3, 61690}, -- Alpine Hare
            {4, 62182}, -- Amethyst Shale Hatchling
            {5, 62364}, -- Ash Lizard
            {6, 61829}, -- Bat
            {7, 61257}, -- Black Rat
            {8, 61319}, -- Beetle
            {9, 62815}, -- Biletoad
            {10, 62885}, -- Carrion Rat
            {11, 62664}, -- Chicken
            {12, 62129}, -- Cheetah Cub
            {13, 61384}, -- Cockroach
            {14, 62190}, -- Coral Snake
            {15, 62116}, -- Creepy Crawly
            {16, 62242}, -- Crested Owl
            {17, 62435}, -- Crystal Spider
            {18, 62250}, -- Darkshore Cub
            {19, 62887}, -- Deaths Head Cockroach
            {20, 62186}, -- Desert Spider
            {21, 62375}, -- Diemetradon Hatchling
            {22, 62115}, -- Dung Beetle
            {23, 62178}, -- Elfin Rabbit
            {24, 62127}, -- Emerald Boa
            {25, 61328}, -- Fire Beetle
            {26, 62886}, -- Fire Proof Roach
            {27, 62177}, -- Forest Moth
            {28, 62312}, -- Frog
            {29, 62176}, -- Gazelle Fawn
            {30, 62130}, -- Giraffe Calf
            {31, 61438}, -- Gold Beetle
            {32, 62050}, -- Grey Moth
            {33, 61751}, -- Hare
            {34, 62894}, -- Horned Lizard
            {35, 62185}, -- Horny Toad
            {36, 61827}, -- Infected Fawn
            {37, 61828}, -- Infected Squirrel
            {38, 62896}, -- Leopard Scorpid
            {39, 62893}, -- Locust
            {40, 61317}, -- Long Tailed Mole
            {41, 62892}, -- Mac Frog
            {42, 61753}, -- Maggot
            {43, 62317}, -- Minfernal
            {44, 61167}, -- Mountain Cottontail
            {45, 61677}, -- Mountain Skunk
            {46, 61143}, -- Mouse
            {47, 62395}, -- Nether Faerie Dragon
            {48, 62888}, -- Nordrassil Wisp
            {49, 62895}, -- Oasis Moth
            {50, 61313}, -- Parrot
            {51, 61141}, -- Prairie Dog
            {52, 62526}, -- Qiraji Guardling
            {53, 61080}, -- Rabbit
            {54, 62120}, -- Rabid Nut Varmint 5000
            {55, 61366}, -- Rat
            {56, 61439}, -- Rattlesnake
            {57, 62051}, -- Ravager Hatchling
            {58, 61757}, -- Red Tailed Chipmunk
            {59, 61169}, -- Roach
            {60, 62119}, -- Robo Chick
            {61, 62184}, -- Rock Viper
            {62, 62313}, -- Rusty Snail
            {63, 62257}, -- Sand Kitten
            {64, 62524}, -- Scarab Hatchling
            {65, 61326}, -- Scorpid
            {66, 62953}, -- Sea Gull
            {67, 62246}, -- Shimmershell Snail
            {68, 61158}, -- Shore Crab
            {69, 62523}, -- Sidewinder
            {70, 62258}, -- Silithid Hatchling
            {71, 62373}, -- Silky Moth
            {72, 61255}, -- Skunk
            {73, 61071}, -- Small Frog
            {74, 61142}, -- Snake
            {75, 7554}, -- Snowy Owl
            {76, 62201}, -- Spawn Of Onyxia
            {77, 61327}, -- Spider
            {78, 61441}, -- Spiky Lizard
            {79, 62114}, -- Spiny Lizard
            {80, 62370}, -- Spotted Bell Frog
            {81, 61081}, -- Squirrel
            {82, 62256}, -- Stinkbug
            {83, 62187}, -- Stone Armadillo
            {84, 61312}, -- Strand Crab
            {85, 61440}, -- Stripe Tailed Scorpid
            {86, 62314}, -- Tainted Cockroach
            {87, 62315}, -- Tainted Moth
            {88, 62316}, -- Tainted Rat
            {89, 61369}, -- Toad
        }
    },
    { -- Eastern Kingdoms Safari
        6586, type.Unit,
        {
            {1, 61325}, -- Adder
            {2, 61690}, -- Alpine Hare
            {3, 61420}, -- Ash Spiderling
            {4, 61385}, -- Ash Viper
            {5, 61324}, -- Baby Ape
            {6, 61829}, -- Bat
            {7, 61257}, -- Black Rat
            {8, 61319}, -- Beetle
            {9, 60649}, -- Black Lamb
            {10, 61890}, -- Blighted Squirrel
            {11, 61752}, -- Brown Marmot
            {12, 62019}, -- Cat
            {13, 62664}, -- Chicken
            {14, 61384}, -- Cockroach
            {15, 61314}, -- Crimson Moth
            {16, 61253}, -- Dusk Spiderling
            {17, 61165}, -- Fawn
            {18, 61830}, -- Festering Maggot
            {19, 61171}, -- Fledgling Buzzard
            {20, 61328}, -- Fire Beetle
            {21, 61320}, -- Forest Spiderling
            {22, 61438}, -- Gold Beetle
            {23, 61704}, -- Grasslands Cottontail
            {24, 62818}, -- Grizzly Squirrel
            {25, 61751}, -- Hare
            {26, 62905}, -- Highlands Mouse
            {27, 62907}, -- Highlands Skunk
            {28, 62906}, -- Highlands Turkey
            {29, 61368}, -- Huge Toad
            {30, 61827}, -- Infected Fawn
            {31, 61828}, -- Infected Squirrel
            {32, 61758}, -- Infested Bear Cub
            {33, 61691}, -- Irradiated Roach
            {34, 61718}, -- Jade Oozeling
            {35, 61443}, -- King Snake
            {36, 62022}, -- Larva
            {37, 61386}, -- Lava Beetle
            {38, 61383}, -- Lava Crab
            {39, 61459}, -- Little Black Ram
            {40, 61321}, -- Lizard Hatchling
            {41, 61317}, -- Long Tailed Mole
            {42, 61905}, -- Lost Of Lordaeron
            {43, 61753}, -- Maggot
            {44, 61372}, -- Moccasin
            {45, 61425}, -- Molten Hatchling
            {46, 61167}, -- Mountain Cottontail
            {47, 61677}, -- Mountain Skunk
            {48, 61143}, -- Mouse
            {49, 61313}, -- Parrot
            {50, 61322}, -- Polly
            {51, 61141}, -- Prairie Dog
            {52, 61080}, -- Rabbit
            {53, 61366}, -- Rat
            {54, 61258}, -- Rat Snake
            {55, 61439}, -- Rattlesnake
            {56, 61757}, -- Red Tailed Chipmunk
            {57, 61168}, -- Redridge Rat
            {58, 61375}, -- Restless Shadeling
            {59, 61169}, -- Roach
            {60, 62020}, -- Ruby Sapling
            {61, 61326}, -- Scorpid
            {62, 61329}, -- Scorpling
            {63, 62953}, -- Sea Gull
            {64, 61255}, -- Skunk
            {65, 61071}, -- Small Frog
            {66, 61142}, -- Snake
            {67, 61689}, -- Snow Cub
            {68, 61755}, -- Snowshoe Hare
            {69, 61327}, -- Spider
            {70, 61441}, -- Spiky Lizard
            {71, 62034}, -- Spirit Crab
            {72, 61081}, -- Squirrel
            {73, 61312}, -- Strand Crab
            {74, 62954}, -- Stormwind Rat
            {75, 61440}, -- Stripe Tailed Scorpid
            {76, 61370}, -- Swamp Moth
            {77, 61686}, -- Tiny Bog Beast
            {78, 61160}, -- Tiny Harvester
            {79, 61703}, -- Tiny Twister
            {80, 61369}, -- Toad
            {81, 61318}, -- Tree Python
            {82, 62914}, -- Twilight Fiendling
            {83, 62117}, -- Twilight Spider
            {84, 61889}, -- Undercity Rat
            {85, 61367}, -- Water Snake
            {86, 61323}, -- Wharf Rat
            {87, 61259}, -- Widow Spiderling
            {88, 62900}, -- Wildhammer Gryphon Hatchling
            {89, 62904}, -- Yellow Bellied Marmot
        }
    },
    { -- Outland Safari
        6587, type.Unit,
        {
            {1, 61325}, -- Adder
            {2, 61385}, -- Ash Viper
            {3, 61752}, -- Brown Marmot
            {4, 62019}, -- Cat
            {5, 62620}, -- Clefthoof Runt
            {6, 62555}, -- Flayer Youngling
            {7, 62627}, -- Fledgling Nether Ray
            {8, 62621}, -- Fel Flame
            {9, 61143}, -- Mouse
            {10, 62625}, -- Nether Roach
            {11, 61141}, -- Prairie Dog
            {12, 61080}, -- Rabbit
            {13, 61366}, -- Rat
            {14, 62184}, -- Rock Viper
            {15, 62628}, -- Scalded Basilisk Hatchling
            {16, 61326}, -- Scorpid
            {17, 62638}, -- Skittering Cavern Crawler
            {18, 61255}, -- Skunk
            {19, 61071}, -- Small Frog
            {20, 61142}, -- Snake
            {21, 62564}, -- Sporeling Sprout
            {22, 61081}, -- Squirrel
            {23, 61440}, -- Stripe Tailed Scorpid
            {24, 62314}, -- Tainted Cockroach
            {25, 61369}, -- Toad
            {26, 62583}, -- Warpstalker Hatchling
        }
    },
    { -- Northrend Safari
        6588, type.Unit,
        {
            {1, 62864}, -- Arctic Fox Kit
            {2, 62693}, -- Arctic Hare
            {3, 62815}, -- Biletoad
            {4, 62695}, -- Borean Marmot
            {5, 62664}, -- Chicken
            {6, 61384}, -- Cockroach
            {7, 62640}, -- Devouring Maggot
            {8, 62852}, -- Dragonbone Hatchling
            {9, 61165}, -- Fawn
            {10, 62641}, -- Fjord Rat
            {11, 62669}, -- Fjord Worg Pup
            {12, 62818}, -- Grizzly Squirrel
            {13, 61368}, -- Huge Toad
            {14, 62819}, -- Imperial Eagle Chick
            {15, 61753}, -- Maggot
            {16, 61677}, -- Mountain Skunk
            {17, 61143}, -- Mouse
            {18, 62697}, -- Oily Slimeling
            {19, 61080}, -- Rabbit
            {20, 61366}, -- Rat
            {21, 61169}, -- Roach
            {22, 62854}, -- Scourged Whelpling
            {23, 61158}, -- Shore Crab
            {24, 61255}, -- Skunk
            {25, 61142}, -- Snake
            {26, 61327}, -- Spider
            {27, 61081}, -- Squirrel
            {28, 61312}, -- Strand Crab
            {29, 62816}, -- Stunted Shardhorn
            {30, 61369}, -- Toad
            {31, 62835}, -- Tundra Penguin
            {32, 62648}, -- Turkey
            {33, 62820}, -- Water Waveling
        }
    },
    { -- Pandaria Safari
        6589, type.Unit,
        {
            {1, 63550}, -- Alpine Foxling
            {2, 63551}, -- Alpine Foxling Kit
            {3, 65187}, -- Amber Moth
            {4, 63288}, -- Amethyst Spiderling
            {5, 63062}, -- Bandicoon
            {6, 63064}, -- Bandicoon Kit
            {7, 62992}, -- Bucktooth Flapper
            {8, 64242}, -- Clouded Hedgehog
            {9, 63548}, -- Crunchy Scorpion
            {10, 62994}, -- Emerald Turtle
            {11, 65203}, -- Emperor Crab
            {12, 65054}, -- Feverbite Hatchling
            {13, 63002}, -- Garden Frog
            {14, 65215}, -- Garden Moth
            {15, 63549}, -- Grassland Hopper
            {16, 63004}, -- Grove Viper
            {17, 63715}, -- Jumping Spider
            {18, 62997}, -- Jungle Darter
            {19, 63304}, -- Jungle Grub
            {20, 63953}, -- Kuitan Mongoose
            {21, 63919}, -- Leopard Tree Frog
            {22, 65124}, -- Luyu Moth
            {23, 63094}, -- Malayan Quillrat
            {24, 63095}, -- Malayan Quillrat Pup
            {25, 63096}, -- Marsh Fiddler
            {26, 63003}, -- Masked Tanuki
            {27, 63716}, -- Masked Tanuki Pup
            {28, 65185}, -- Mei Li Sparkler
            {29, 62998}, -- Mirror Strider
            {30, 65190}, -- Mongoose
            {31, 63954}, -- Mongoose Pup
            {32, 63547}, -- Plains Monitor
            {33, 59702}, -- Prairie Mouse
            {34, 64352}, -- Rapana Whelk
            {35, 64238}, -- Resilient Roach
            {36, 63006}, -- Sandy Petrel
            {37, 63291}, -- Savory Beetle
            {38, 62953}, -- Sea Gull
            {39, 61158}, -- Shore Crab
            {40, 65216}, -- Shrine Fly
            {41, 64246}, -- Shy Bandicoon
            {42, 63057}, -- Sifang Otter
            {43, 63358}, -- Sifang Otter Pup
            {44, 64804}, -- Silent Hedgehog
            {45, 63001}, -- Silkbead Snail
            {46, 63060}, -- Softshell Snapling
            {47, 63293}, -- Spiny Terrapin
            {48, 63005}, -- Spirebound Crab
            {49, 64248}, -- Summit Kid
            {50, 63585}, -- Szechuan Chicken
            {51, 62999}, -- Temple Snake
            {52, 63557}, -- Tolai Hare
            {53, 63558}, -- Tolai Hare Pup
            {54, 63957}, -- Yakrat
            {55, 63555}, -- Zooey Snake
        }
    },
    { -- The Pandaren Gourmet (15, 30)
        {7326, 7327},
        {
			{1, 86057, type.Item}, -- Sliced Peaches
			{1, 125117, type.Spell}, -- Sliced Peaches
			{2, {85504, 85505}, type.Item}, -- Krasarang Fritters
			{2, 124032, type.Spell}, -- Krasarang Fritters
			{3, {85501, 85502}, type.Item}, -- Viseclaw Soup
			{3, 124029, type.Spell}, -- Viseclaw Soup
			{4, 86026, type.Item}, -- Perfectly Cooked Instant Noodles
			{4, 125067, type.Spell}, -- Perfectly Cooked Instant Noodles
            {5, 81402, type.Item}, -- Toasted Fish Jerky
            {5, 124225, type.Spell}, -- Toasted Fish Jerky
            {6, 81404, type.Item}, -- Dried Needle Mushrooms
            {6, 124227, type.Spell}, -- Dried Needle Mushrooms
            {7, 81400, type.Item}, -- Pounded Rice Cake
            {7, 124223, type.Spell}, -- Pounded Rice Cake
            {8, 81401, type.Item}, -- Yak Cheese Curds
            {8, 124224, type.Spell}, -- Yak Cheese Curds
            {9, 81403, type.Item}, -- Dried Peaches
            {9, 124226, type.Spell}, -- Dried Peaches
            {10, 81405, type.Item}, -- Boiled Silkworm Pupa
            {10, 124228, type.Spell}, -- Boiled Silkworm Pupa
            {11, 81406, type.Item}, -- Roasted Barley Tea
            {11, 125078, type.Spell}, -- Roasted Barley Tea
            {12, 74636, type.Item}, -- Golden Carp Consomme
            {12, 104237, type.Spell}, -- Golden Carp Consomme
            {13, 74641, type.Item}, -- Fish Cake
            {13, 104297, type.Spell}, -- Fish Cake
            {14, 81410, type.Item}, -- Green Curry Fish
            {14, 124231, type.Spell}, -- Green Curry Fish
            {15, 81412, type.Item}, -- Blanched Needle Mushrooms
            {15, 124233, type.Spell}, -- Blanched Needle Mushrooms
            {16, 81408, type.Item}, -- Red Bean Bun
            {16, 124229, type.Spell}, -- Red Bean Bun
            {17, 81409, type.Item}, -- Tangy Yogurt
            {17, 124230, type.Spell}, -- Tangy Yogurt
            {18, 81411, type.Item}, -- Peach Pie
            {18, 124232, type.Spell}, -- Peach Pie
            {19, 81413, type.Item}, -- Skewered Peanut Chicken
            {19, 124234, type.Spell}, -- Skewered Peanut Chicken
            {20, 81414, type.Item}, -- Pearl Milk Tea
            {20, 125080, type.Spell}, -- Pearl Milk Tea
            {21, 86069, type.Item}, -- Rice Pudding
            {21, 125122, type.Spell}, -- Rice Pudding
            {22, 86070, type.Item}, -- Wildfowl Ginseng Soup
            {22, 125121, type.Spell}, -- Wildfowl Ginseng Soup
            {23, {74658, 86074}, type.Item}, -- Spicy Vegetable Chips
            {23, 125123, type.Spell}, -- Spicy Vegetable Chips
            {24, {74657, 86073}, type.Item}, -- Spicy Salmon
            {24, 125120, type.Spell}, -- Spicy Salmon
            {25, 74643, type.Item}, -- Sauteed Carrots
            {25, 104301, type.Spell}, -- Sauteed Carrots
            {26, 74647, type.Item}, -- Valley Stir Fry
            {26, 104302, type.Spell}, -- Valley Stir Fry
            {27, 74648, type.Item}, -- Sea Mist Rice Noodles
            {27, 104303, type.Spell}, -- Sea Mist Rice Noodles
            {28, 75026, type.Item}, -- Ginseng Tea
            {28, 124052, type.Spell}, -- Ginseng Tea
            {29, 75037, type.Item}, -- Jade Witch Brew
            {29, 124053, type.Spell}, -- Jade Witch Brew
            {30, 75038, type.Item}, -- Mad Brewer's Breakfast
            {30, 124054, type.Spell}, -- Mad Brewer's Breakfast
            {31, 74644, type.Item}, -- Swirling Mist Soup
            {31, 104304, type.Spell}, -- Swirling Mist Soup
            {32, 74649, type.Item}, -- Braised Turtle
            {32, 104305, type.Spell}, -- Braised Turtle
            {33, 74650, type.Item}, -- Mogu Fish Stew
            {33, 104306, type.Spell}, -- Mogu Fish Stew
            {34, 74651, type.Item}, -- Shrimp Dumplings
            {34, 104307, type.Spell}, -- Shrimp Dumplings
            {35, 74652, type.Item}, -- Fire Spirit Salmon
            {35, 104308, type.Spell}, -- Fire Spirit Salmon
            {36, 74653, type.Item}, -- Steamed Crab Surprise
            {36, 104309, type.Spell}, -- Steamed Crab Surprise
            {37, 74654, type.Item}, -- Wildfowl Roast
            {37, 104310, type.Spell}, -- Wildfowl Roast
            {38, 74655, type.Item}, -- Twin Fish Platter
            {38, 104311, type.Spell}, -- Twin Fish Platter
            {39, 74656, type.Item}, -- Chun Tian Spring Rolls
            {39, 104312, type.Spell}, -- Chun Tian Spring Rolls
            {40, 74642, type.Item}, -- Charbroiled Tiger Steak
            {40, 104298, type.Spell}, -- Charbroiled Tiger Steak
            {41, 74645, type.Item}, -- Eternal Blossom Fish
            {41, 104299, type.Spell}, -- Eternal Blossom Fish
            {42, 74646, type.Item}, -- Black Pepper Ribs and Shrimp
            {42, 104300, type.Spell}, -- Black Pepper Ribs and Shrimp
        }
    },
    { -- Pandaren Cuisine
        7329,
        {
			{1, 86057, type.Item}, -- Sliced Peaches
			{1, 125117, type.Spell}, -- Sliced Peaches
			{2, 86026, type.Item}, -- Perfectly Cooked Instant Noodles
			{2, 125067, type.Spell}, -- Perfectly Cooked Instant Noodles
            {3, 81402, type.Item}, -- Toasted Fish Jerky
            {3, 124225, type.Spell}, -- Toasted Fish Jerky
            {4, 81404, type.Item}, -- Dried Needle Mushrooms
            {4, 124227, type.Spell}, -- Dried Needle Mushrooms
            {5, 81400, type.Item}, -- Pounded Rice Cake
            {5, 124223, type.Spell}, -- Pounded Rice Cake
            {6, 81401, type.Item}, -- Yak Cheese Curds
            {6, 124224, type.Spell}, -- Yak Cheese Curds
            {7, 81403, type.Item}, -- Dried Peaches
            {7, 124226, type.Spell}, -- Dried Peaches
            {8, 81405, type.Item}, -- Boiled Silkworm Pupa
            {8, 124228, type.Spell}, -- Boiled Silkworm Pupa
            {9, 81406, type.Item}, -- Roasted Barley Tea
            {9, 125078, type.Spell}, -- Roasted Barley Tea
            {10, 81412, type.Item}, -- Blanched Needle Mushrooms
            {10, 124233, type.Spell}, -- Blanched Needle Mushrooms
            {11, 81408, type.Item}, -- Red Bean Bun
            {11, 124229, type.Spell}, -- Red Bean Bun
            {12, 81409, type.Item}, -- Tangy Yogurt
            {12, 124230, type.Spell}, -- Tangy Yogurt
            {13, 81411, type.Item}, -- Peach Pie
            {13, 124232, type.Spell}, -- Peach Pie
            {14, 81413, type.Item}, -- Skewered Peanut Chicken
            {14, 124234, type.Spell}, -- Skewered Peanut Chicken
            {15, 81414, type.Item}, -- Pearl Milk Tea
            {15, 125080, type.Spell}, -- Pearl Milk Tea
            {16, 81410, type.Item}, -- Green Curry Fish
            {16, 124231, type.Spell}, -- Green Curry Fish
        }
    },
    { -- Pandaren Delicacies
        7330,
        {
            {1, 86069, type.Item}, -- Rice Pudding
            {1, 125122, type.Spell}, -- Rice Pudding
            {2, 74643, type.Item}, -- Sauteed Carrots
            {2, 104301, type.Spell}, -- Sauteed Carrots
            {3, 75026, type.Item}, -- Ginseng Tea
            {3, 124052, type.Spell}, -- Ginseng Tea
            {4, 74644, type.Item}, -- Swirling Mist Soup
            {4, 104304, type.Spell}, -- Swirling Mist Soup
            {5, 74651, type.Item}, -- Shrimp Dumplings
            {5, 104307, type.Spell}, -- Shrimp Dumplings
            {6, 74654, type.Item}, -- Wildfowl Roast
            {6, 104310, type.Spell}, -- Wildfowl Roast
            {7, 74642, type.Item}, -- Charbroiled Tiger Steak
            {7, 104298, type.Spell}, -- Charbroiled Tiger Steak
            {8, 74636, type.Item}, -- Golden Carp Consomme
            {8, 104237, type.Spell}, -- Golden Carp Consomme
            {9, 74641, type.Item}, -- Fish Cake
            {9, 104297, type.Spell}, -- Fish Cake
            {10, 74647, type.Item}, -- Valley Stir Fry
            {10, 104302, type.Spell}, -- Valley Stir Fry
            {11, 75037, type.Item}, -- Jade Witch Brew
            {11, 124053, type.Spell}, -- Jade Witch Brew
            {12, 86070, type.Item}, -- Wildfowl Ginseng Soup
            {12, 125121, type.Spell}, -- Wildfowl Ginseng Soup
            {13, 74649, type.Item}, -- Braised Turtle
            {13, 104305, type.Spell}, -- Braised Turtle
            {14, 74652, type.Item}, -- Fire Spirit Salmon
            {14, 104308, type.Spell}, -- Fire Spirit Salmon
            {15, 74655, type.Item}, -- Twin Fish Platter
            {15, 104311, type.Spell}, -- Twin Fish Platter
            {16, 74645, type.Item}, -- Eternal Blossom Fish
            {16, 104299, type.Spell}, -- Eternal Blossom Fish
            {17, 74648, type.Item}, -- Sea Mist Rice Noodles
            {17, 104303, type.Spell}, -- Sea Mist Rice Noodles
            {18, {74658, 86074}, type.Item}, -- Spicy Vegetable Chips
            {18, 125123, type.Spell}, -- Spicy Vegetable Chips
            {19, 75038, type.Item}, -- Mad Brewer's Breakfast
            {19, 124054, type.Spell}, -- Mad Brewer's Breakfast
            {20, {74657, 86073}, type.Item}, -- Spicy Salmon
            {20, 125120, type.Spell}, -- Spicy Salmon
            {21, 74650, type.Item}, -- Mogu Fish Stew
            {21, 104306, type.Spell}, -- Mogu Fish Stew
            {22, 74653, type.Item}, -- Steamed Crab Surprise
            {22, 104309, type.Spell}, -- Steamed Crab Surprise
            {23, 74656, type.Item}, -- Chun Tian Spring Rolls
            {23, 104312, type.Spell}, -- Chun Tian Spring Rolls
            {24, 74646, type.Item}, -- Black Pepper Ribs and Shrimp
            {24, 104300, type.Spell}, -- Black Pepper Ribs and Shrimp
        }
    },
    { -- Raiding with Leashes
        7934,
        {
            {1, 15263, type.Unit}, -- The Prophet Skeram
            {1, 68658, type.Item}, -- Mini Mindslayer
            {2, 15276, type.Unit}, -- Emperor Veklor
            {2, 68659, type.Item}, -- Anubisath Idol
            {3, 15952, type.Unit}, -- Maexxna
            {3, 68656, type.Item}, -- Giant Bone Spider
            {4, 16011, type.Unit}, -- Loatheb
            {4, 68657, type.Item}, -- Fungal Abomination
            {5, 15932, type.Unit}, -- Gluth
            {5, 68654, type.Item}, -- Stitched Pup
            {6, 12098, type.Unit}, -- Sulfuron Harbinger
            {6, 68665, type.Item}, -- Harbinger Of Flame
            {7, 11982, type.Unit}, -- Magmadar
            {7, 68664, type.Item}, -- Corefire Imp
            {8, 11988, type.Unit}, -- Golemagg The Incinerator
            {8, 68666, type.Item}, -- Ashstone Core
            {9, 12435, type.Unit}, -- Razorgore The Untamed
            {9, 68661, type.Item}, -- Untamed Hatchling
            {10, 14020, type.Unit}, -- Chromaggus
            {10, 68662, type.Item}, -- Chrominius
            {11, 12017, type.Unit}, -- Broodlord Lashlayer
            {11, 68663, type.Item}, -- Death Talon Whelpguard
            {12, 15299, type.Unit}, -- Viscidus
            {12, 68660, type.Item}, -- Viscidus Globule
        }
    },
    { -- Pay to Slay / It Was Worth Every Ritual Stone
        {8100, 8101}, type.Unit,
        {
            {1, 69471}, -- Spirit of Warlong Teng
            {1, 70201}, -- Spirit Stone for Spirit of Warlong Teng
            {2, 69633}, -- Kordok And Tinzo The Emberkeeper
            {2, 70204}, -- Spirit Stone for Kordok
            {3, 69341}, -- Echo Of Kros
            {3, 70203}, -- Spirit Stone for Echo Of Kros
            {4, 69339}, -- Electromancer Jule
            {4, 69770}, -- Lightning Ritual Stone for Electromancer Jule
            {5, 69749}, -- Qinor
            {6, 69767}, -- Ancient Mogu Guardian
            {6, 70197}, -- Lightning Ritual Stone for Ancient Mogu Guardian
            {7, 70080}, -- Windweaver Akilamon
            {7, 70198}, -- Primal Ritual Stone for Windweaver Akilamon
            {8, 69396}, -- Cera
            {8, 70196}, -- Lightning Ritual Stone for Cera
            {9, 69347}, -- Incomplete Drakkari Colossus
        }
    },
    { -- Raiding with Leashes II: Attunement Edition
        8293,
        {
            {1, 17521, type.Unit}, -- The Big Bad Wolf
            {1, 71014, type.Item}, -- Lil Bad Wolf
            {2, 15691, type.Unit}, -- The Curator
            {2, 71015, type.Item}, -- Menagerie Custodian
            {3, 15690, type.Unit}, -- Prince Malchezaar
            {3, 71016, type.Item}, -- Netherspace Abyssal
            {4, 15688, type.Unit}, -- Terestian Illhoof
            {4, 71033, type.Item}, -- Fiendish Imp
            {5, 21213, type.Unit}, -- Morogrim Tidewalker
            {5, 71017, type.Item}, -- Tideskipper
            {6, 21216, type.Unit}, -- Hydross The Unstable
            {6, 71018, type.Item}, -- Tainted Waveling
            {7, 21212, type.Unit}, -- Lady Vashj
            {7, 71019, type.Item}, -- Coilfang Stalker
            {8, 19516, type.Unit}, -- Void Reaver
            {8, 71020, type.Item}, -- Pocket Reaver
            {9, 18805, type.Unit}, -- High Astromancer Solarian
            {9, 71021, type.Item}, -- Lesser Voidcaller
            {10, 19514, type.Unit}, -- Alar
            {10, 71022, type.Item}, -- Phoenix Hawk Hatchling
        }
    },
    { -- Celestial Family
        8519, type.Unit,
        {
            {1, 71942}, -- Xu Fu Cub Of Xuen
            {2, 72462}, -- Chi Chi Hatchling Of Chi Ji
            {3, 72463}, -- Yula Broodling Of Yulon
            {4, 72464}, -- Zao Calfling Of Niuzao
        }
    },
    { -- Crazy for Cats
        8397,
        {
            {1, 7383, type.Item}, -- Black Tabby Cat
            {2, 6367, type.Unit}, -- Donni Anthania
            {2, 7385, type.Item}, -- Bombay Cat
            {3, 85283, type.Item}, -- Brightpaw
            {4, 142065, type.Unit}, -- Dana Pull
            {4, 96479, type.Unit}, -- Breanni
            {4, 229811, type.Unit}, -- Breanni
            {4, 28951, type.Unit}, -- Breanni
            {4, 34364, type.Item}, -- Calico Cat
            {5, 62019, type.Unit}, -- Cat [Battle Pet]
            {6, 62129, type.Unit}, -- Cheetah Cub [Battle Pet]
            {7, 68267, type.Item}, -- Cinder Kitten
            {8, 6367, type.Unit}, -- Donni Anthania
            {8, 7384, type.Item}, -- Cornish Rex Cat
            {9, 56031, type.Item}, -- Darkmoon Cub
            {10, 53884, type.Item}, -- Feline Familiar
            {11, 68838, type.Unit}, -- Fluxfire Feline [Battle Pet]
            {12, 53283, type.Item}, -- Guardian Cub
            {13, 68655, type.Item}, -- Mr Bigglesworth
            {14, 52344, type.Item}, -- Nightsaber Cub
            {15, 6367, type.Unit}, -- Donni Anthania
            {15, 7382, type.Item}, -- Orange Tabby Cat
            {16, 52226, type.Item}, -- Panther Cub
            {17, 62257, type.Unit}, -- Sand Kitten [Battle Pet]
            {18, 61883, type.Item}, -- Sapphire Cub
            {19, 229811, type.Unit}, -- Breanni
            {19, 20980, type.Unit}, -- Dealer Rashaad
            {19, 7380, type.Item}, -- Siamese Cat
            {20, 6367, type.Unit}, -- Donni Anthania
            {20, 7381, type.Item}, -- Silver Tabby Cat
            {21, 61689, type.Unit}, -- Snow Cub [Battle Pet]
            {22, 68502, type.Item}, -- Spectral Cub
            {23, 36511, type.Item}, -- Spectral Tiger Cub
            {24, 8666, type.Unit}, -- Lil Timmy
            {24, 7386, type.Item}, -- White Kitten
            {25, 52830, type.Item}, -- Michelle De Rum
            {25, 52831, type.Item}, -- Winterspring Cub
            {26, 73082, type.Unit}, -- Master Li
            {26, 71942, type.Item}, -- Xu Fu Cub Of Xuen
        }
    },
};