local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.Cataclysm = {
    { -- Drown Your Sorrows
        5754,
        {
            {1, 62790, type.Item}, -- Darkbrew Lager
            {1, 88015, type.Spell}, -- Darkbrew Lager
            {2, 58274, type.Item}, -- Fresh Water
            {3, 59230, type.Item}, -- Fungus Squeezings
            {4, 59029, type.Item}, -- Greasy Whale Milk
			{5, {62674, 65415}, type.Item}, -- Highland Spirits
			{5, 88022, type.Spell}, -- Highland Spirits
            {6, 58257, type.Item}, -- Highland Spring Water
			{7, 59229, type.Item}, -- Murky Water
            {8, {62672, 65433}, type.Item}, -- South Island Iced Tea
            {8, 88044, type.Spell}, -- South Island Iced Tea
            {9, 58256, type.Item}, -- Sparkling Oasis Water
            {10, {62675, 65414}, type.Item}, -- Starfire Espresso
			{10, 88045, type.Spell}, -- Starfire Espresso
        }
    },
    { -- Cataclysmically Delicious
        5753,
        {
            {1, {62661, 65426}, type.Item}, -- Baked Rockfish
            {1, 88003, type.Spell}, -- Baked Rockfish
            {2, {62665, 65427}, type.Item}, -- Basilisk Liverdog
            {2, 88004, type.Spell}, -- Basilisk Liverdog
            {3, {62670, 65429}, type.Item}, -- Beer-Basted Crocolisk
            {3, 88005, type.Spell}, -- Beer-Basted Crocolisk
            {4, {62668, 65424}, type.Item}, -- Blackbelly Sushi
            {4, 88034, type.Spell}, -- Blackbelly Sushi
			{5, 62676, type.Item}, -- Blackened Surprise
			{5, 88006, type.Spell}, -- Blackened Surprise
            {6, {62655, 65411}, type.Item}, -- Broiled Mountain Trout
            {6, 88012, type.Spell}, -- Broiled Mountain Trout
			{7, 58261, type.Item}, -- Buttery Wheat Roll
            {8, {62680, 65431}, type.Item}, -- Chocolate Cookie
            {8, 88013, type.Spell}, -- Chocolate Cookie
            {9, {62664, 65430}, type.Item}, -- Crocolisk Au Gratin
            {9, 88014, type.Spell}, -- Crocolisk Au Gratin
            {10, {62666, 65422}, type.Item}, -- Delicious Sagefish Tail
            {10, 88016, type.Spell}, -- Delicious Sagefish Tail
            {11, {62677, 65423}, type.Item}, -- Fish Fry
			{11, 88018, type.Spell}, -- Fish Fry
            {12, {62649, 65432}, type.Item}, -- Fortune Cookie
            {12, 88019, type.Spell}, -- Fortune Cookie
			{13, 58276, type.Item}, -- Gilnean White
            {14, {62662, 65428}, type.Item}, -- Grilled Dragon
            {14, 88020, type.Spell}, -- Grilled Dragon
			{15, 58263, type.Item}, -- Grilled Shark
			{16, 58275, type.Item}, -- Hardtack
            {17, {62659, 65418}, type.Item}, -- Hearty Seafood Soup
            {17, 88021, type.Spell}, -- Hearty Seafood Soup
			{18, 58265, type.Item}, -- Highland Pomegranate
			{19, 58259, type.Item}, -- Highland Sheep Cheese
			{20, {62654, 65407}, type.Item}, -- Lavascale Fillet
            {20, 88024, type.Spell}, -- Lavascale Fillet
            {21, {62663, 65409}, type.Item}, -- Lavascale Minestrone
            {21, 88025, type.Spell}, -- Lavascale Minestrone
			{22, {62651, 65412}, type.Item}, -- Lightly Fried Lurker
			{22, 88028, type.Spell}, -- Lightly Fried Lurker
			{23, {62657, 62657}, type.Item}, -- Lurker Lunch
			{23, 62657, type.Spell}, -- Lurker Lunch
			{24, 58269, type.Item}, -- Massive Turkey Leg
            {25, {62667, 65420}, type.Item}, -- Mushroom Sauce Mudfish
            {25, 88031, type.Spell}, -- Mushroom Sauce Mudfish
			{26, 59231, type.Item}, -- Oily Giblets
            {27, {62660, 65417}, type.Item}, -- Pickled Guppy
            {27, 88033, type.Spell}, -- Pickled Guppy
			{28, 58260, type.Item}, -- Pine Nut Bread
			{29, 58268, type.Item}, -- Roasted Beef
			{30, 59227, type.Item}, -- Rock-Hard Biscuit
			{31, {62653, 65410}, type.Item}, -- Salted Eye
			{31, 88035, type.Spell}, -- Salted Eye
			{32, {68687, 68688}, type.Item}, -- Scalding Murglesnout
			{32, 96133, type.Spell}, -- Scalding Murglesnout
			{33, 58267, type.Item}, -- Scarlet Polypore
			{34, {62652, 65413}, type.Item}, -- Seasoned Crab
			{34, 88037, type.Spell}, -- Seasoned Crab
            {35, {62671, 65421}, type.Item}, -- Severed Sagefish Head
            {35, 88039, type.Spell}, -- Severed Sagefish Head
			{36, 58277, type.Item}, -- Simmered Squid
            {37, {62669, 65425}, type.Item}, -- Skewered Eel
            {37, 88042, type.Spell}, -- Skewered Eel            
			{38, 58262, type.Item}, -- Sliced Raw Billfish
			{39, 58258, type.Item}, -- Smoked String Cheese
			{40, 58264, type.Item}, -- Sour Green Apple
			{41, 58280, type.Item}, -- Stewed Rabbit
			{42, 58279, type.Item}, -- Tasty Puffball
            {43, {62658, 65419}, type.Item}, -- Tender Baked Turtle
            {43, 88046, type.Spell}, -- Tender Baked Turtle
			{44, 58278, type.Item}, -- Tropical Sunfruit
			{45, 59232, type.Item}, -- Unidentifiable Meat Dish
			{46, 59228, type.Item}, -- Vile Purple Fungus
			{47, 58266, type.Item}, -- Violet Morel
			{48, {62656, 65406}, type.Item}, -- Whitecrest Gumbo
			{48, 88047, type.Spell}, -- Whitecrest Gumbo
        }
    },
    { -- To All the Squirrels Who Cared for Me
        5548, type.Unit,
        {
            {1, {49779, 62189}}, -- Alpine Chipmunk
            {2, 48630}, -- Baradin Fox Kit
            {3, 62884}, -- Grotto Vole
            {4, {48706, 62906}}, -- Highlands Turkey
            {5, {50491, 62892}}, -- Mac Frog
            {6, {50496, 62895}}, -- Oasis Moth
            {7, {48686, 61439}}, -- Rattlesnake
            {8, {50481, 62184, 117658}}, -- Rock Viper
            {9, 48848}, -- Rockchewer Whelk
            {10, 47682}, -- Sassy Cat
            {11, 48802}, -- Sea Cucumber
            {12, 61323}, -- Wharf Rat
            {13, {48683, 62904}}, -- Yellow-Bellied Marmot
        }
    },
    { -- The Cataclysmic Gourmet (15, 30)
        {5472, 5473},
        {
			{1, 62790, type.Item}, -- Darkbrew Lager
			{1, 88015, type.Spell}, -- Darkbrew Lager
			{2, {62673, 65408}, type.Item}, -- Feathered Lure
			{2, 88017, type.Spell}, -- Feathered Lure
			{3, 62676, type.Item}, -- Blackened Surprise
			{3, 88006, type.Spell}, -- Blackened Surprise
			{4, {62674, 65415}, type.Item}, -- Highland Spirits
			{4, 88022, type.Spell}, -- Highland Spirits
            {5, {62675, 65414}, type.Item}, -- Starfire Espresso
			{5, 88045, type.Spell}, -- Starfire Espresso
            {6, {62655, 65411}, type.Item}, -- Broiled Mountain Trout
            {6, 88012, type.Spell}, -- Broiled Mountain Trout
			{7, {62654, 65407}, type.Item}, -- Lavascale Fillet
            {7, 88024, type.Spell}, -- Lavascale Fillet
			{8, {62651, 65412}, type.Item}, -- Lightly Fried Lurker
			{8, 88028, type.Spell}, -- Lightly Fried Lurker
			{9, {62657, 62657}, type.Item}, -- Lurker Lunch
			{9, 62657, type.Spell}, -- Lurker Lunch
			{10, {62653, 65410}, type.Item}, -- Salted Eye
			{10, 88035, type.Spell}, -- Salted Eye
			{11, {62652, 65413}, type.Item}, -- Seasoned Crab
			{11, 88037, type.Spell}, -- Seasoned Crab
			{12, {62656, 65406}, type.Item}, -- Whitecrest Gumbo
			{12, 88047, type.Spell}, -- Whitecrest Gumbo
            {13, {62677, 65423}, type.Item}, -- Fish Fry
			{13, 88018, type.Spell}, -- Fish Fry
            {14, {62659, 65418}, type.Item}, -- Hearty Seafood Soup
            {14, 88021, type.Spell}, -- Hearty Seafood Soup
            {15, {62660, 65417}, type.Item}, -- Pickled Guppy
            {15, 88033, type.Spell}, -- Pickled Guppy
            {16, {62658, 65419}, type.Item}, -- Tender Baked Turtle
            {16, 88046, type.Spell}, -- Tender Baked Turtle
            {17, {62680, 65431}, type.Item}, -- Chocolate Cookie
            {17, 88013, type.Spell}, -- Chocolate Cookie
            {18, {62661, 65426}, type.Item}, -- Baked Rockfish
            {18, 88003, type.Spell}, -- Baked Rockfish
            {19, {62665, 65427}, type.Item}, -- Basilisk Liverdog
            {19, 88004, type.Spell}, -- Basilisk Liverdog
            {20, {62670, 65429}, type.Item}, -- Beer-Basted Crocolisk
            {20, 88005, type.Spell}, -- Beer-Basted Crocolisk
            {21, {62668, 65424}, type.Item}, -- Blackbelly Sushi
            {21, 88034, type.Spell}, -- Blackbelly Sushi
            {22, {62664, 65430}, type.Item}, -- Crocolisk Au Gratin
            {22, 88014, type.Spell}, -- Crocolisk Au Gratin
            {23, {62666, 65422}, type.Item}, -- Delicious Sagefish Tail
            {23, 88016, type.Spell}, -- Delicious Sagefish Tail
            {24, {62662, 65428}, type.Item}, -- Grilled Dragon
            {24, 88020, type.Spell}, -- Grilled Dragon
            {25, {62663, 65409}, type.Item}, -- Lavascale Minestrone
            {25, 88025, type.Spell}, -- Lavascale Minestrone
            {26, {62667, 65420}, type.Item}, -- Mushroom Sauce Mudfish
            {26, 88031, type.Spell}, -- Mushroom Sauce Mudfish
            {27, {62671, 65421}, type.Item}, -- Severed Sagefish Head
            {27, 88039, type.Spell}, -- Severed Sagefish Head
            {28, {62669, 65425}, type.Item}, -- Skewered Eel
            {28, 88042, type.Spell}, -- Skewered Eel
            {29, {62289, 62799}, type.Item}, -- Broiled Dragon Feast
            {29, 88011, type.Spell}, -- Broiled Dragon Feast
            {30, {62649, 65432}, type.Item}, -- Fortune Cookie
            {30, 88019, type.Spell}, -- Fortune Cookie
            {31, {62290, 62800}, type.Item}, -- Seafood Magnifique Feast
            {31, 88036, type.Spell}, -- Seafood Magnifique Feast
            {32, {62672, 65433}, type.Item}, -- South Island Iced Tea
            {32, 88044, type.Spell}, -- South Island Iced Tea
        }
    }
};