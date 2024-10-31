local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.WrathOfTheLichKing = {
    { -- To All The Squirrels Who Shared My Life
        2557, type.Unit,
        {
            {1, {29328, 62693, 150873}}, -- Arctic Hare
            {2, {31685, 62695}}, -- Borean Marmot
            {3, 28407}, -- Fjord Penguin
            {4, 24746}, -- Fjord Turkey
            {5, 32498}, -- Glacier Penguin
            {6, {31889, 62818}}, -- Grizzly Squirrel
            {7, {6653, 61368, 97420}}, -- Huge Toad
            {8, {9700, 61383}}, -- Lava Crab
            {9, {31890, 61677}}, -- Mountain Skunk
            {10, 26503}, -- Scalawag Frog
            {11, 28093}, -- Sholazar Tickbird
            {12, {28440, 62835}}, -- Tundra Penguin
        }
    },
    { -- Pest Control
        2556, type.Unit,
        {
            {1, {16068, 62022}}, -- Larva
            {2, {4953, 61367}}, -- Water Snake
            {3, {14881, 61327, 66580, 97327, 106469, 133222, 156544, 168702, 168703}}, -- Spider
            {4, {1412, 61081, 63607, 80881, 95654, 96011, 99798, 100151, 100152, 144846}}, -- Squirrel
            {5, 32428}, -- Underbelly Rat
            {6, {24270, 62640}}, -- Devouring Maggot
            {7, {6271, 61143}}, -- Mouse
            {8, 28202}, -- Zul'Drak Rat
            {9, {4076, 61169, 82454}}, -- Roach
            {10, {2914, 47794, 61142, 97376, 106470, 182787, 193640}}, -- Snake
            {11, {32261, 62435}}, -- Crystal Spider
            {12, {3300, 61325, 115086, 133223}}, -- Adder
            {13, {16030, 61753, 89832, 97560, 97641}}, -- Maggot
            {14, {15476, 61326, 117659}}, -- Scorpion
            {15, {24174, 62641}}, -- Fjord Rat
            {16, {9699, 61328, 195260}}, -- Fire Beetle
            {17, {32258, 61438}}, -- Gold Beetle
            {18, {4075, 61366, 74908, 76704, 80093, 85722, 92251, 99796, 115087, 116249, 116495, 141587, 144845, 158050, 169044}}, -- Rat
        }
    },
    { -- The Outland Gourmet
        1800,
        {
            {1, {33924, 33925}, type.Item}, -- Delicious Chocolate Cake
            {1, 43779, type.Spell}, -- Delicious Chocolate Cake
            {2, {27661, 27694}, type.Item}, -- Blackened Trout
            {2, 33290, type.Spell}, -- Blackened Trout
            {3, {27651, 27684}, type.Item}, -- Buzzard Bites
            {3, 33279, type.Spell}, -- Buzzard Bites
            {4, {30155, 30156}, type.Item}, -- Clam Bar
            {4, 36210, type.Spell}, -- Clam Bar
            {5, {27662, 27695}, type.Item}, -- Feltail Delight
            {5, 33291, type.Spell}, -- Feltail Delight
            {6, {27655, 27688}, type.Item}, -- Ravager Dog
            {6, 33284, type.Spell}, -- Ravager Dog
            {7, {33866, 33871}, type.Item}, -- Stormchops
            {7, 43758, type.Spell}, -- Stormchops
            {8, {27663, 27696}, type.Item}, -- Blackened Sporefish
            {8, 33292, type.Spell}, -- Blackened Sporefish
            {9, {27657, 27690}, type.Item}, -- Blackened Basilisk
            {9, 33286, type.Spell}, -- Blackened Basilisk
            {10, {27664, 27697}, type.Item}, -- Grilled Mudfish
            {10, 33293, type.Spell}, -- Grilled Mudfish
            {11, {27665, 27698}, type.Item}, -- Poached Bluefish
            {11, 33294, type.Spell}, -- Poached Bluefish
            {12, {33867, 33869}, type.Item}, -- Broiled Bloodfin
            {12, 43761, type.Spell}, -- Broiled Bloodfin
            {13, {27666, 27699}, type.Item}, -- Golden Fish Sticks
            {13, 33295, type.Spell}, -- Golden Fish Sticks
            {14, {33874, 33875}, type.Item}, -- Kibler's Bits
            {14, 43772, type.Spell}, -- Kibler's Bits
            {15, {27658, 27691}, type.Item}, -- Roasted Clefthoof
            {15, 33287, type.Spell}, -- Roasted Clefthoof
            {16, {27660, 27693}, type.Item}, -- Talbuk Steak
            {16, 33289, type.Spell}, -- Talbuk Steak
            {17, {27659, 27692}, type.Item}, -- Warp Burger
            {17, 33288, type.Spell}, -- Warp Burger
            {18, {31673, 31674}, type.Item}, -- Crunchy Serpent
            {18, 38868, type.Spell}, -- Crunchy Serpent
            {19, {31672, 31675}, type.Item}, -- Mok'Nathal Shortribs
            {19, 38867, type.Spell}, -- Mok'Nathal Shortribs
            {20, 33052, type.Item}, -- Fisherman's Feast
            {20, 42302, type.Spell}, -- Fisherman's Feast
            {21, 33053, type.Item}, -- Hot Buttered Trout
            {21, 42305, type.Spell}, -- Hot Buttered Trout
            {22, {33825, 33870}, type.Item}, -- Skullfish Soup
            {22, 43707, type.Spell}, -- Skullfish Soup
            {23, {27667, 27700}, type.Item}, -- Spicy Crawdad
            {23, 33296, type.Spell}, -- Spicy Crawdad
            {24, {33872, 33873}, type.Item}, -- Spicy Hot Talbuk
            {24, 43765, type.Spell}, -- Spicy Hot Talbuk
            {25, 33048, type.Item}, -- Stewed Trout
            {25, 42296, type.Spell}, -- Stewed Trout
        }
    },
    { -- Second That Emotion
        1780,
        {
            {1, {43491, 43509}, type.Item}, -- Bad Clams
            {1, 58523, type.Spell}, -- Bad Clams
            {2, {43492, 43510}, type.Item}, -- Haunted Herring
            {2, 58525, type.Spell}, -- Haunted Herring
            {3, {43488, 43508}, type.Item}, -- Last Week's Mammoth
            {3, 58521, type.Spell}, -- Last Week's Mammoth
            {4, {43490, 43507}, type.Item}, -- Tasty Cupcake
            {4, 58512, type.Spell}, -- Tasty Cupcake
        }
    },
    { -- The Northrend Gourmet
        1779,
        {
            {1, {43491, 43509}, type.Item}, -- Bad Clams
            {1, 58523, type.Spell}, -- Bad Clams
            {2, 42942, type.Item}, -- Baked Manta Ray
            {2, 45569, type.Spell}, -- Baked Manta Ray
            {3, 43268, type.Item}, -- Dalaran Clam Chowder
            {3, 58065, type.Spell}, -- Dalaran Clam Chowder
            {4, 34760, type.Item}, -- Grilled Bonescale
            {4, 45561, type.Spell}, -- Grilled Bonescale
            {5, 34762, type.Item}, -- Grilled Sculpin
            {5, 45563, type.Spell}, -- Grilled Sculpin
            {6, {43492, 43510}, type.Item}, -- Haunted Herring
            {6, 58525, type.Spell}, -- Haunted Herring
            {7, {43488, 43508}, type.Item}, -- Last Week's Mammoth
            {7, 58521, type.Spell}, -- Last Week's Mammoth
            {8, 34748, type.Item}, -- Mammoth Meal
            {8, 45549, type.Spell}, -- Mammoth Meal
            {9, 34747, type.Item}, -- Northern Stew
            {9, 57421, type.Spell}, -- Northern Stew
            {10, 34765, type.Item}, -- Pickled Fangtooth
            {10, 45566, type.Spell}, -- Pickled Fangtooth
            {11, 34764, type.Item}, -- Poached Nettlefish
            {11, 45565, type.Spell}, -- Poached Nettlefish
            {12, 34752, type.Item}, -- Rhino Dogs
            {12, 45553, type.Spell}, -- Rhino Dogs
            {13, 34751, type.Item}, -- Roasted Worg
            {13, 45552, type.Spell}, -- Roasted Worg
            {14, 34761, type.Item}, -- Sauteed Goby
            {14, 45562, type.Spell}, -- Sauteed Goby
            {15, 34749, type.Item}, -- Shoveltusk Steak
            {15, 45550, type.Spell}, -- Shoveltusk Steak
            {16, 34759, type.Item}, -- Smoked Rockfin
            {16, 45560, type.Spell}, -- Smoked Rockfin
            {17, 34763, type.Item}, -- Smoked Salmon
            {17, 45564, type.Spell}, -- Smoked Salmon
            {18, {43490, 43507}, type.Item}, -- Tasty Cupcake
            {18, 58512, type.Spell}, -- Tasty Cupcake
            {19, 34750, type.Item}, -- Worm Delight
            {19, 45551, type.Spell}, -- Worm Delight
            {20, 34753, type.Item}, -- Great Feast
            {20, 45554, type.Spell}, -- Great Feast
            {21, {39520, 39644}, type.Item}, -- Kungaloosh
            {21, 53056, type.Spell}, -- Kungaloosh
            {22, {42999, 43035}, type.Item}, -- Blackened Dragonfin
            {22, 57441, type.Spell}, -- Blackened Dragonfin
            {23, {42997, 43032}, type.Item}, -- Blackened Worg Steak
            {23, 57438, type.Spell}, -- Blackened Worg Steak
            {24, {43004, 43029}, type.Item}, -- Critter Bites
            {24, 57435, type.Spell}, -- Critter Bites
            {25, {42998, 43033}, type.Item}, -- Cuttlesteak
            {25, 57439, type.Spell}, -- Cuttlesteak
            {26, {43000, 43036}, type.Item}, -- Dragonfin Filet
            {26, 57442, type.Spell}, -- Dragonfin Filet
            {27, {34767, 43024}, type.Item}, -- Firecracker Salmon
            {27, 45568, type.Spell}, -- Firecracker Salmon
            {28, {43015, 43017}, type.Item}, -- Fish Feast
            {28, 57423, type.Spell}, -- Fish Feast
            {29, {43478, 43505}, type.Item}, -- Gigantic Feast
            {29, 58527, type.Spell}, -- Gigantic Feast
            {30, {42995, 43030}, type.Item}, -- Hearty Rhino
            {30, 57436, type.Spell}, -- Hearty Rhino
            {31, {34769, 43026}, type.Item}, -- Imperial Manta Steak
            {31, 45570, type.Spell}, -- Imperial Manta Steak
            {32, {34754, 43018}, type.Item}, -- Mega Mammoth Meal
            {32, 45555, type.Spell}, -- Mega Mammoth Meal
            {33, {34758, 43022}, type.Item}, -- Mighty Rhino Dogs
            {33, 45559, type.Spell}, -- Mighty Rhino Dogs
            {34, {34766, 43023}, type.Item}, -- Poached Northern Sculpin
            {34, 45567, type.Spell}, -- Poached Northern Sculpin
            {35, {42994, 43028}, type.Item}, -- Rhinolicious Wormsteak
            {35, 57434, type.Spell}, -- Rhinolicious Wormsteak
            {36, {43480, 43506}, type.Item}, -- Small Feast
            {36, 58528, type.Spell}, -- Small Feast
            {37, {42996, 43031}, type.Item}, -- Snapper Extreme
            {37, 57437, type.Spell}, -- Snapper Extreme
            {38, {43005, 43034}, type.Item}, -- Spiced Mammoth Treats
            {38, 57440, type.Spell}, -- Spiced Mammoth Treats
            {39, {34756, 43020}, type.Item}, -- Spiced Worm Burger
            {39, 45557, type.Spell}, -- Spiced Worm Burger
            {40, {34768, 43025}, type.Item}, -- Spicy Blue Nettlefish
            {40, 45571, type.Spell}, -- Spicy Blue Nettlefish
            {41, {42993, 43027}, type.Item}, -- Spicy Fried Herring
            {41, 57433, type.Spell}, -- Spicy Fried Herring
            {42, {34755, 43019}, type.Item}, -- Tender Shoveltusk Steak
            {42, 45556, type.Spell}, -- Tender Shoveltusk Steak
            {43, {43001, 43037}, type.Item}, -- Tracker Snacks
            {43, 57443, type.Spell}, -- Tracker Snacks
            {44, {34757, 43021}, type.Item}, -- Very Burnt Worg
            {44, 45558, type.Spell}, -- Very Burnt Worg
            {45, {44953, 44954}, type.Item}, -- Worg Tartare
            {45, 62350, type.Spell}, -- Worg Tartare
        }
    },
    { -- The Winter Veil Gourmet
        1688, type.Item,
        {
            {1, {17198, 17201}}, -- Egg Nog
            {2, {34411, 34413}}, -- Hot Apple Cider
            {3, {17197, 17200}}, -- Gingerbread Cookie
        }
    },
    { -- To All The Squirrels I've Loved Before
        1206, type.Unit,
        {
            {1, 25677}, -- Borean Frog
            {2, {6368, 35610, 62019, 66163, 112694, 112698, 117203, 137538, 161221, 167914, 197382}}, -- Cat
            {3, {620, 621, 62664, 129926, 132981, 134955, 138666, 144478, 148500, 150298, 150443, 173201, 197384}}, -- Chicken
            {4, {2442, 71444}}, -- Cow
            {5, {883, 61750}}, -- Deer
            {6, 19665}, -- Ewe
            {7, {890, 61165, 112991}}, -- Fawn
            {8, {13321, 61071, 70495}}, -- Small Frog
            {9, {4166, 62163, 124528, 124529, 124701, 127959}}, -- Gazelle
            {10, {5951, 61751}}, -- Hare
            {11, {9600, 61313, 67368}}, -- Parrot
            {12, {721, 56047, 56285, 61080, 94150, 95867, 96463, 96472, 96477, 96478, 96548, 99797, 100150, 100153, 112028, 144844, 146361, 147694, 158150}}, -- Rabbit
            {13, {2098, 61456}}, -- Ram
            {14, {1933, 61170, 64402, 132300, 141137, 141315, 157926, 158224, 158242, 160579}}, -- Sheep
            {15, 60761}, -- Shore Crab
            {16, {17467, 61255, 80890, 114571}}, -- Skunk
            {17, {1412, 56046, 56284, 61081, 63607, 73915, 74001, 74713, 80881, 95654, 96011, 99798, 100151, 100152, 144846, 155638}}, -- Squirrel
            {18, 25679}, -- Steam Frog
            {19, 10685}, -- Swine
            {20, {1420, 61369, 150305, 174540}}, -- Toad
            {21, {2620, 61141, 75486, 77908, 165757}}, -- Prairie Dog
        }
    },
};