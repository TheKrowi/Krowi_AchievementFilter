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
};