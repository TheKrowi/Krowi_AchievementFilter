local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.WrathOfTheLichKing = {
    { -- To All The Squirrels Who Shared My Life
        2557, type.Unit,
        {
            {1, 28440}, -- Tundra Penguin
            {2, 28093}, -- Sholazar Tickbird
            {3, 26503}, -- Scalawag Frog
            {4, 31890}, -- Mountain Skunk
            {5, 9700}, -- Lava Crab
            {6, 6653}, -- Huge Toad
            {7, 31889}, -- Grizzly Squirrel
            {8, 32498}, -- Glacier Penguin
            {9, 24746}, -- Fjord Turkey
            {10, 28407}, -- Fjord Penguin
            {11, 31685}, -- Borean Marmot
            {12, 29328} -- Arctic Hare
        }
    },
    { -- Pest Control
        2556, type.Unit,
        {
            {1, 1412}, -- Squirrel
            {2, 28202}, -- Zul'Drak Rat
            {3, 32428}, -- Underbelly Rat
            {4, 14881}, -- Spider
            {5, 4075}, -- Rat
            {6, 6271}, -- Mouse
            {7, 4953}, -- Moccasin
            {8, 16030}, -- Maggot
            {9, 16068}, -- Larva
            {10, 24174}, -- Fjord Rat
            {11, 9699}, -- Fire Beetle
            {12, 24270}, -- Devouring Maggot
            {13, 32261}, -- Crystal Spider
            {14, 32258}, -- Gold Beetle
            {15, 3300}, -- Adder
            {16, 2914}, -- Snake
            {17, 15476}, -- Scorpion
            {18, 4076} -- Roach
        }
    },
    { -- The Outland Gourmet
        1800,
        {
            {1, 33053, type.Item}, -- Hot Buttered Trout
            {1, 42305, type.Spell}, -- Hot Buttered Trout
            {2, {27665, 27698}, type.Item}, -- Poached Bluefish
            {2, 33294, type.Spell}, -- Poached Bluefish
            {3, {27655, 27688}, type.Item}, -- Ravager Dog
            {3, 33284, type.Spell}, -- Ravager Dog
            {4, 33048, type.Item}, -- Stewed Trout
            {4, 42296, type.Spell}, -- Stewed Trout
            {5, {27667, 27700}, type.Item}, -- Spicy Crawdad
            {5, 33296, type.Spell}, -- Spicy Crawdad
            {6, 33052, type.Item}, -- Fisherman's Feast
            {6, 42302, type.Spell}, -- Fisherman's Feast
            {7, {31673, 31674}, type.Item}, -- Crunchy Serpent
            {7, 8868, type.Spell}, -- Crunchy Serpent
            {8, {27660, 27693}, type.Item}, -- Talbuk Steak
            {8, 3289, type.Spell}, -- Talbuk Steak
            {9, {27658, 27691}, type.Item}, -- Roasted Clefthoof
            {9, 3287, type.Spell}, -- Roasted Clefthoof
            {10, {33867, 33869}, type.Item}, -- Broiled Bloodfin
            {10, 43761, type.Spell}, -- Broiled Bloodfin
            {11, {30155, 30156}, type.Item}, -- Clam Bar
            {11, 36210, type.Spell}, -- Clam Bar
            {12, {27664, 27697}, type.Item}, -- Grilled Mudfish
            {12, 33293, type.Spell}, -- Grilled Mudfish
            {13, {27663, 27696}, type.Item}, -- Blackened Sporefish
            {13, 33292, type.Spell}, -- Blackened Sporefish
            {14, {33866, 33871}, type.Item}, -- Stormchops
            {14, 43758, type.Spell}, -- Stormchops
            {15, {27662, 27695}, type.Item}, -- Feltail Delight
            {15, 33291, type.Spell}, -- Feltail Delight
            {16, {33924, 33925}, type.Item}, -- Delicious Chocolate Cake
            {16, 43779, type.Spell}, -- Delicious Chocolate Cake
            {17, {27666, 27699}, type.Item}, -- Golden Fish Sticks
            {17, 33295, type.Spell}, -- Golden Fish Sticks
            {18, {33874, 33875}, type.Item}, -- Kibler's Bits
            {18, 43772, type.Spell}, -- Kibler's Bits
            {19, {27659, 27692}, type.Item}, -- Warp Burger
            {19, 33288, type.Spell}, -- Warp Burger
            {20, {27651, 27684}, type.Item}, -- Buzzard Bites
            {20, 33279, type.Spell}, -- Buzzard Bites
            {21, {27661, 27694}, type.Item}, -- Blackened Trout
            {21, 33290, type.Spell}, -- Blackened Trout
            {23, {33825, 33870}, type.Item}, -- Skullfish Soup
            {23, 43707, type.Spell}, -- Skullfish Soup
            {24, {33872, 33873}, type.Item}, -- Spicy Hot Talbuk
            {24, 43765, type.Spell}, -- Spicy Hot Talbuk
            {25, {27657, 27690}, type.Item}, -- Blackened Basilisk
            {25, 33286, type.Spell}, -- Blackened Basilisk
            {26, {31672, 31675}, type.Item}, -- Mok'Nathal Shortribs
            {26, 38867, type.Spell}, -- Mok'Nathal Shortribs
        }
    },
    { -- Second That Emotion
        1780,
        {
            {1, {43490, 43507}, type.Item}, -- Tasty Cupcake
            {1, 58512, type.Spell}, -- Tasty Cupcake
            {2, {43492, 43510}, type.Item}, -- Haunted Herring
            {2, 58525, type.Spell}, -- Haunted Herring
            {3, {43491, 43509}, type.Item}, -- Bad Clams
            {3, 58523, type.Spell}, -- Bad Clams
            {4, {43488, 43508}, type.Item}, -- Last Week's Mammoth
            {4, 58521, type.Spell}, -- Last Week's Mammoth
        }
    },
    { -- The Northrend Gourmet
        1779,
        {
            {1, {43005, 43034}, type.Item}, -- Spiced Mammoth Treats
            {1, 57440, type.Spell}, -- Spiced Mammoth Treats
            {2, {44953, 44954}, type.Item}, -- Worg Tartare
            {2, 62350, type.Spell}, -- Worg Tartare
            {3, 34759, type.Item}, -- Smoked Rockfin
            {3, 45560, type.Spell}, -- Smoked Rockfin
            {4, 34761, type.Item}, -- Sauteed Goby
            {4, 45562, type.Spell}, -- Sauteed Goby
            {5, 34752, type.Item}, -- Rhino Dogs
            {5, 45553, type.Spell}, -- Rhino Dogs
            {6, 34764, type.Item}, -- Poached Nettlefish
            {6, 45565, type.Spell}, -- Poached Nettlefish
            {7, 34765, type.Item}, -- Pickled Fangtooth
            {7, 45566, type.Spell}, -- Pickled Fangtooth
            {8, 34747, type.Item}, -- Northern Stew
            {8, 57421, type.Spell}, -- Northern Stew
            {9, {43491, 43509}, type.Item}, -- Bad Clams
            {9, 58523, type.Spell}, -- Bad Clams
            {10, {43000, 43036}, type.Item}, -- Dragonfin Filet
            {10, 57442, type.Spell}, -- Dragonfin Filet
            {11, 34750, type.Item}, -- Worm Delight
            {11, 45551, type.Spell}, -- Worm Delight
            {12, {43492, 43510}, type.Item}, -- Haunted Herring
            {12, 58525, type.Spell}, -- Haunted Herring
            {13, {43001, 43037}, type.Item}, -- Tracker Snacks
            {13, 57443, type.Spell}, -- Tracker Snacks
            {14, {43004, 43029}, type.Item}, -- Critter Bites
            {14, 57435, type.Spell}, -- Critter Bites
            {15, {42999, 43035}, type.Item}, -- Blackened Dragonfin
            {15, 57441, type.Spell}, -- Blackened Dragonfin
            {16, {39520, 39644}, type.Item}, -- Kungaloosh
            {16, 53056, type.Spell}, -- Kungaloosh
            {17, {42995, 43030}, type.Item}, -- Hearty Rhino
            {17, 57436, type.Spell}, -- Hearty Rhino
            {18, {43015, 43017}, type.Item}, -- Fish Feast
            {18, 57423, type.Spell}, -- Fish Feast
            {19, 34760, type.Item}, -- Grilled Bonescale
            {19, 45561, type.Spell}, -- Grilled Bonescale
            {20, {34757, 43021}, type.Item}, -- Very Burnt Worg
            {20, 45558, type.Spell}, -- Very Burnt Worg
            {21, {42994, 43028}, type.Item}, -- Rhinolicious Wormsteak
            {21, 57434, type.Spell}, -- Rhinolicious Wormsteak
            {22, {42993, 43027}, type.Item}, -- Spicy Fried Herring
            {22, 57433, type.Spell}, -- Spicy Fried Herring
            {23, {34766, 43023}, type.Item}, -- Poached Northern Sculpin
            {23, 45567, type.Spell}, -- Poached Northern Sculpin
            {24, {34754, 43018}, type.Item}, -- Mega Mammoth Meal
            {24, 45555, type.Spell}, -- Mega Mammoth Meal
            {25, {34767, 43024}, type.Item}, -- Firecracker Salmon
            {25, 45568, type.Spell}, -- Firecracker Salmon
            {26, {42998, 43033}, type.Item}, -- Cuttlesteak
            {26, 57439, type.Spell}, -- Cuttlesteak
            {27, 34748, type.Item}, -- Mammoth Meal
            {27, 45549, type.Spell}, -- Mammoth Meal
            {28, 34762, type.Item}, -- Grilled Sculpin
            {28, 45563, type.Spell}, -- Grilled Sculpin
            {29, {43488, 43508}, type.Item}, -- Last Week's Mammoth
            {29, 58521, type.Spell}, -- Last Week's Mammoth
            {30, {42996, 43031}, type.Item}, -- Snapper Extreme
            {30, 57437, type.Spell}, -- Snapper Extreme
            {31, {43490, 43507}, type.Item}, -- Tasty Cupcake
            {31, 58512, type.Spell}, -- Tasty Cupcake
            {32, 43268, type.Item}, -- Dalaran Clam Chowder
            {32, 58065, type.Spell}, -- Dalaran Clam Chowder
            {33, {43480, 43506}, type.Item}, -- Small Feast
            {33, 58528, type.Spell}, -- Small Feast
            {34, {34769, 43026}, type.Item}, -- Imperial Manta Steak
            {34, 45570, type.Spell}, -- Imperial Manta Steak
            {35, {34768, 43025}, type.Item}, -- Spicy Blue Nettlefish
            {35, 45571, type.Spell}, -- Spicy Blue Nettlefish
            {36, {34755, 43019}, type.Item}, -- Tender Shoveltusk Steak
            {36, 45556, type.Spell}, -- Tender Shoveltusk Steak
            {37, {34758, 43022}, type.Item}, -- Mighty Rhino Dogs
            {37, 45559, type.Spell}, -- Mighty Rhino Dogs
            {38, 42942, type.Item}, -- Baked Manta Ray
            {38, 45569, type.Spell}, -- Baked Manta Ray
            {39, 34753, type.Item}, -- Great Feast
            {39, 45554, type.Spell}, -- Great Feast
            {40, {43478, 43505}, type.Item}, -- Gigantic Feast
            {40, 58527, type.Spell}, -- Gigantic Feast
            {41, {42997, 43032}, type.Item}, -- Blackened Worg Steak
            {41, 57438, type.Spell}, -- Blackened Worg Steak
            {42, 34751, type.Item}, -- Roasted Worg
            {42, 45552, type.Spell}, -- Roasted Worg
            {43, 34763, type.Item}, -- Smoked Salmon
            {43, 45564, type.Spell}, -- Smoked Salmon
            {44, 34749, type.Item}, -- Shoveltusk Steak
            {44, 45550, type.Spell}, -- Shoveltusk Steak
            {45, {34756, 43020}, type.Item}, -- Spiced Worm Burger
            {45, 45557, type.Spell}, -- Spiced Worm Burger
        }
    },
    { -- The Winter Veil Gourmet
        1688, type.Item,
        {
            {1, {17197, 17200}}, -- Gingerbread Cookie
            {2, {17198, 17201}}, -- Winter Veil Egg Nog
            {3, {34411, 34413}}, -- Hot Apple Cider
        }
    },
    { -- To All The Squirrels I've Loved Before
        1206, type.Unit,
        {
            {1, 2442}, -- Cow
            {2, 620}, -- Chicken
            {3, 6368}, -- Cat
            {4, 2620}, -- Prairie Dog
            {5, 1420}, -- Toad
            {6, 10685}, -- Swine
            {7, 17467}, -- Skunk
            {8, 1933}, -- Sheep
            {9, 721}, -- Rabbit
            {10, 9600}, -- Parrot
            {11, 5951}, -- Hare
            {12, 4166}, -- Gazelle
            {13, 13321}, -- Frog
            {14, 890}, -- Fawn
            {15, 6827}, -- Crab
            {16, 883}, -- Deer
            {17, 1412}, -- Squirrel
            {18, 19665}, -- Ewe
            {19, 2098}, -- Ram
            {20, 25677}, -- Borean Frog
            {21, 25679} -- Steam Frog
        }
    },
};