local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.Cataclysm = {
    { -- Drown Your Sorrows
        5754,
        {
            -- NO CRITERIA DATA AVAILABLE - 2024-05-05
        }
    },
    { -- Cataclysmically Delicious
        5753,
        {
            -- NO CRITERIA DATA AVAILABLE - 2024-05-05
        }
    },
    { -- To All the Squirrels Who Cared for Me
        5548, type.Unit,
        {
            {1, {48683, 62904}}, -- Yellow-Bellied Marmot
            {2, 61323}, -- Wharf Rat
            {3, 48802}, -- Sea Cucumber
            {4, 47682}, -- Sassy Cat
            {5, 48848}, -- Rockchewer Whelk
            {6, {50481, 62184, 117658}}, -- Rock Viper
            {7, {48686, 61439}}, -- Rattlesnake
            {8, {50491, 62892}}, -- Mac Frog
            {9, {50496, 62895}}, -- Oasis Moth
            {10, 48630}, -- Baradin Fox Kit
            {11, 62884}, -- Grotto Vole
            {12, {48706, 62906}}, -- Highlands Turkey
            {13, {49779, 62189}}, -- Alpine Chipmunk
        }
    },
    { -- The Cataclysmic Gourmet (15, 30)
        {5472, 5473},
        {
            {1, {62649, 65432}, type.Item}, -- Fortune Cookie
            {1, 88019, type.Spell}, -- Fortune Cookie
            {2, {62663, 65409}, type.Item}, -- Lavascale Minestrone
            {2, 88025, type.Spell}, -- Lavascale Minestrone
            {3, {62289, 62799}, type.Item}, -- Broiled Dragon Feast
            {3, 88011, type.Spell}, -- Broiled Dragon Feast
            {4, {62670, 65429}, type.Item}, -- Beer-Basted Crocolisk
            {4, 88005, type.Spell}, -- Beer-Basted Crocolisk
            {5, {62677, 65423}, type.Item}, -- Fish Fry
			{5, 88018, type.Spell}, -- Fish Fry
			{6, 62676, type.Item}, -- Blackened Surprise
			{6, 88006, type.Spell}, -- Blackened Surprise
            {7, {62660, 65417}, type.Item}, -- Pickled Guppy
            {7, 88033, type.Spell}, -- Pickled Guppy
            {8, {62672, 65433}, type.Item}, -- South Island Iced Tea
            {8, 88044, type.Spell}, -- South Island Iced Tea
			{9, {62656, 65406}, type.Item}, -- Whitecrest Gumbo
			{9, 88047, type.Spell}, -- Whitecrest Gumbo
			{10, {62652, 65413}, type.Item}, -- Seasoned Crab
			{10, 88037, type.Spell}, -- Seasoned Crab
			{11, {62653, 65410}, type.Item}, -- Salted Eye
			{11, 88035, type.Spell}, -- Salted Eye
			{12, {62654, 65407}, type.Item}, -- Lavascale Fillet
            {12, 88024, type.Spell}, -- Lavascale Fillet
            {13, {62675, 65414}, type.Item}, -- Starfire Espresso
			{13, 88045, type.Spell}, -- Starfire Espresso
			{14, {62674, 65415}, type.Item}, -- Highland Spirits
			{14, 88022, type.Spell}, -- Highland Spirits
			{15, {62673, 65408}, type.Item}, -- Feathered Lure
			{15, 88017, type.Spell}, -- Feathered Lure
            {16, {62658, 65419}, type.Item}, -- Tender Baked Turtle
            {16, 88046, type.Spell}, -- Tender Baked Turtle
            {17, {62666, 65422}, type.Item}, -- Delicious Sagefish Tail
            {17, 88016, type.Spell}, -- Delicious Sagefish Tail
			{18, 62790, type.Item}, -- Darkbrew Lager
			{18, 88015, type.Spell}, -- Darkbrew Lager
            {19, {62669, 65425}, type.Item}, -- Skewered Eel
            {19, 88042, type.Spell}, -- Skewered Eel
            {20, {62290, 62800}, type.Item}, -- Seafood Magnifique Feast
            {20, 88036, type.Spell}, -- Seafood Magnifique Feast
            {21, {62671, 65421}, type.Item}, -- Severed Sagefish Head
            {21, 88039, type.Spell}, -- Severed Sagefish Head
            {22, {62667, 65420}, type.Item}, -- Mushroom Sauce Mudfish
            {22, 88031, type.Spell}, -- Mushroom Sauce Mudfish
            {23, {62662, 65428}, type.Item}, -- Grilled Dragon
            {23, 88020, type.Spell}, -- Grilled Dragon
            {24, {62664, 65430}, type.Item}, -- Crocolisk Au Gratin
            {24, 88014, type.Spell}, -- Crocolisk Au Gratin
            {25, {62665, 65427}, type.Item}, -- Basilisk Liverdog
            {25, 88004, type.Spell}, -- Basilisk Liverdog
            {26, {62661, 65426}, type.Item}, -- Baked Rockfish
            {26, 88003, type.Spell}, -- Baked Rockfish
            {27, {62659, 65418}, type.Item}, -- Hearty Seafood Soup
            {27, 88021, type.Spell}, -- Hearty Seafood Soup
            {28, {62668, 65424}, type.Item}, -- Blackbelly Sushi
            {28, 88034, type.Spell}, -- Blackbelly Sushi
			{29, {62651, 65412}, type.Item}, -- Lightly Fried Lurker
			{29, 88028, type.Spell}, -- Lightly Fried Lurker
            {30, {62655, 65411}, type.Item}, -- Broiled Mountain Trout
            {30, 88012, type.Spell}, -- Broiled Mountain Trout
			{31, {62657, 62657}, type.Item}, -- Lurker Lunch
			{31, 62657, type.Spell}, -- Lurker Lunch
            {32, {62680, 65431}, type.Item}, -- Chocolate Cookie
            {32, 88013, type.Spell}, -- Chocolate Cookie
        }
    }
};