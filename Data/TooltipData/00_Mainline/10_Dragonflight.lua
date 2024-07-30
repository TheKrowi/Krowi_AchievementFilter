local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.Dragonflight = {
    { -- Northrend Basic / Advanced / Reverse
        {19674, 19675, 19676, 19677, 19679, 19681, 19682, 19683, 19684}, type.Unit,
        {
            {1, 211762}, -- Scalawag Slither
            {2, 211886}, -- Daggercap Dart
            {3, 211940}, -- Blackriver Burble
            {4, 212003}, -- Zul'Drak Zephyr
            {5, 212118}, -- Makers' Marathon
            {6, 212193}, -- Crystalsong Crisis
            {7, 212250}, -- Dragonblight Dragon Flight
            {8, 212418}, -- Citadel Sortie
            {9, 212666}, -- Sholazar Spree
            {10, 213086}, -- Geothermal Jaunt
            {11, 215795}, -- Gundrak Fast Track
            {12, 215825}, -- Coldarra Climb
        }
    },
    { -- Zaralek Cavern Challenge
        {18786, 18787, 18788}, type.Unit,
        {
            {1, 202524}, -- Crystal Circuit Challenge
            {2, 202524}, -- Crystal Circuit Reverse Challenge
            {3, 202676}, -- Caldera Cruise Challenge
            {4, 202676}, -- Caldera Cruise Reverse Challenge
            {5, 202749}, -- Brimstone Scramble Challenge
            {6, 202749}, -- Brimstone Scramble Reverse Challenge
            {7, 202772}, -- Shimmering Slalom Challenge
            {8, 202772}, -- Shimmering Slalom Reverse Challenge
            {9, 202795}, -- Loamm Roamm Challenge
            {10, 202795}, -- Loamm Roamm Reverse Challenge
            {11, 202973}, -- Sulfur Sprint Challenge
            {12, 202973}, -- Sulfur Sprint Reverse Challenge
        }
    },
    { -- Forbidden Reach Challenge
        {18779, 18780, 18781}, type.Unit,
        {
            {1, 200183}, -- Stormsunder Crater Circuit Challenge
            {2, 200183}, -- Stormsunder Crater Circuit Reverse Challenge
            {3, 200212}, -- Morqut Ascent Challenge
            {4, 200212}, -- Morqut Ascent Reverse Challenge
            {5, 200236}, -- Aerie Chasm Cruise Challenge
            {6, 200236}, -- Aerie Chasm Cruise Reverse Challenge
            {7, 200247}, -- Southern Reach Route Challenge
            {8, 200247}, -- Southern Reach Route Reverse Challenge
            {9, 200316}, -- Caldera Coaster Challenge
            {10, 200316}, -- Caldera Coaster Reverse Challenge
            {11, 200417}, -- Forbidden Reach Rush Challenge
            {12, 200417}, -- Forbidden Reach Rush Reverse Challenge
        }
    },
    { -- Thaldraszus Challenge
        {18760, 18761, 18762}, type.Unit,
        {
            {1, 192555}, -- The Flowing Forest Flight Challenge
            {2, 192555}, -- The Flowing Forest Flight Reverse Challenge
            {3, 193651}, -- Tyrhold Trial Challenge
            {4, 193651}, -- Tyrhold Trial Reverse Challenge
            {5, 193911}, -- Cliffside Circuit Challenge
            {6, 193911}, -- Cliffside Circuit Reverse Challenge
            {7, 193951}, -- Academy Ascent Challenge
            {8, 193951}, -- Academy Ascent Reverse Challenge
            {9, 194348}, -- Garden Gallivant Challenge
            {10, 194348}, -- Garden Gallivant Reverse Challenge
            {11, 194372}, -- Caverns Criss-Cross Challenge
            {12, 194372}, -- Caverns Criss-Cross Reverse Challenge
        }
    },
    { -- Azure Span Challenge
        {18757, 18758, 18759}, type.Unit,
        {
            {1, 191572}, -- The Azure Span Sprint Challenge
            {2, 191572}, -- The Azure Span Sprint Reverse Challenge
            {3, 191947}, -- The Azure Span Slalom Challenge
            {4, 191947}, -- The Azure Span Slalom Reverse Challenge
            {5, 192115}, -- The Vakthros Ascent Challenge
            {6, 192115}, -- The Vakthros Ascent Reverse Challenge
            {7, 192886}, -- Iskaara Tour Challenge
            {8, 192886}, -- Iskaara Tour Reverse Challenge
            {9, 192945}, -- Frostland Flyover Challenge
            {10, 192945}, -- Frostland Flyover Reverse Challenge
            {11, 193027}, -- Archive Ambit Challenge
            {12, 193027}, -- Archive Ambit Reverse Challenge
        }
    },
    { -- Ohn'ahran Plains Challenge
        {18754, 18755, 18756}, type.Unit,
        {
            {1, 190928}, -- Sundapple Copse Circuit Challenge
            {2, 190928}, -- Sundapple Copse Circuit Reverse Challenge
            {3, 191121}, -- Fen Flythrough Challenge
            {4, 191121}, -- Fen Flythrough Reverse Challenge
            {5, 191165}, -- Ravine River Run Challenge
            {6, 191165}, -- Ravine River Run Reverse Challenge
            {7, 191247}, -- Emerald Garden Ascent Challenge
            {8, 191247}, -- Emerald Garden Ascent Reverse Challenge
            {9, 196092}, -- River Rapids Route Challenge
            {10, 196092}, -- River Rapids Route Reverse Challenge
            {11, 191422}, -- Maruukai Dash Challenge
            {12, 191511}, -- Mirror of the Sky Dash Challenge
        }
    },
    { -- Waking Shores Challenge: Silver / Gold
        {18749, 18750}, type.Unit,
        {
            {1, 190123}, -- Ruby Lifeshrine Loop Challenge
            {2, 190123}, -- Ruby Lifeshrine Loop Reverse Challenge
            {3, 190473}, -- Wild Preserve Slalom Challenge
            {4, 190473}, -- Wild Preserve Slalom Reverse Challenge
            {5, 190519}, -- Emberflow Flight Challenge
            {6, 190519}, -- Emberflow Flight Reverse Challenge
            {7, 190551}, -- Apex Canopy River Run Challenge
            {8, 190551}, -- Apex Canopy River Run Reverse Challenge
            {9, 190667}, -- Uktulut Coaster Challenge
            {10, 190667}, -- Uktulut Coaster Reverse Challenge
            {11, 190753}, -- Wingrest Roundabout Challenge
            {12, 190753}, -- Wingrest Roundabout Reverse Challenge
            {13, 190326}, -- Flashfrost Flyover Challenge
            {14, 190326}, -- Flashfrost Flyover Reverse Challenge
            {15, 190503}, -- Wild Preserve Circuit Challenge
            {16, 190503}, -- Wild Preserve Circuit Reverse Challenge
        }
    },
    { -- Waking Shores Challenge: Bronze
        18748, type.Unit,
        {
            {1, 190123}, -- Ruby Lifeshrine Loop Challenge: Bronze
            {2, 190123}, -- Ruby Lifeshrine Loop Reverse Challenge: Bronze
            {3, 190503}, -- Wild Preserve Circuit Challenge: Bronze
            {4, 190503}, -- Wild Preserve Circuit Reverse Challenge: Bronze
            {5, 190519}, -- Emberflow Flight Challenge: Bronze
            {6, 190519}, -- Emberflow Flight Reverse Challenge: Bronze
            {7, 190551}, -- Apex Canopy River Run Challenge: Bronze
            {8, 190551}, -- Apex Canopy River Run Reverse Challenge: Bronze
            {9, 190667}, -- Uktulut Coaster Challenge: Bronze
            {10, 190667}, -- Uktulut Coaster Reverse Challenge: Bronze
            {11, 190753}, -- Wingrest Roundabout Challenge: Bronze
            {12, 190753}, -- Wingrest Roundabout Reverse Challenge: Bronze
            {13, 190326}, -- Flashfrost Flyover Challenge: Bronze
            {14, 190326}, -- Flashfrost Flyover Reverse Challenge: Bronze
            {15, 190473}, -- Wild Preserve Slalom Challenge: Bronze
            {16, 190473}, -- Wild Preserve Slalom Reverse Challenge: Bronze
        }
    },
    { -- Battler of Zaralek Cavern Aquatic / Beast / Critter / Dragonkin / Elemental / Flying / Humanoid / Magic / Mechanical / Undead
        {17881, 17882, 17883, 17890, 17904, 17905, 17915, 17916, 17917, 17918}, type.Unit,
        {
            {1, 201004}, -- Explorer Bezzert
            {2, 204792}, -- Shinmura
            {3, 204926}, -- Delver Mardei
            {4, 204934}, -- Trainer Orlogg
        }
    },
    { -- Battle in Zaralek Cavern
        17880, type.Unit,
        {
            {1, 201004}, -- To a Land Down Under
            {2, 204792}, -- Are They Not Beautiful?
            {3, 204926}, -- Delver Mardei
            {4, 204934}, -- Do you Even Train?
        }
    },
    { -- Global Swarming
        17541, type.Unit,
        {
            {1, 200684}, -- Vortex
            {2, 200692}, -- Tremblor
            {3, 200686}, -- Wildfire
            {4, 200696}, -- Flow
        }
    },
    { -- Zaralek Cavern Basic / Advanced / Reverse
        {17483, 17484, 17485, 17486, 17487, 17488, 17489, 17490, 17491}, type.Unit,
        {
            {1, 202524}, -- Crystal Circuit
            {2, 202676}, -- Caldera Cruise
            {3, 202749}, -- Brimstone Scramble
            {4, 202772}, -- Shimmering Slalom
            {5, 202795}, -- Loamm Roamm
            {6, 202973}, -- Sulfur Sprint
        }
    },
    { -- Battle on the Dragon Isles II
        17406, type.Unit,
        {
            {1, 201849}, -- Adinakon
            {2, 201858}, -- Lyver
            {3, 202440}, -- Enok the Stinky
            {4, 202452}, -- Right Twice a Day
            {5, 201802}, -- Sharp as Flint
            {6, 201878}, -- Paws of Thunder
            {7, 201899}, -- A New Vocation
            {8, 202458}, -- They're Full of Stars!
        }
    },
    { -- Forbidden Reach Basic / Advanced / Reverse
        {17279, 17280, 17281, 17284, 17286, 17287, 17288, 17289, 17290}, type.Unit,
        {
            {1, 200183}, -- Stormsunder Crater Circuit
            {2, 200212}, -- Morqut Ascent
            {3, 200236}, -- Aerie Chasm Cruise
            {4, 200247}, -- Southern Reach Route
            {5, 200316}, -- Caldera Coaster
            {6, 200417}, -- Forbidden Reach Rush
        }
    },
    { -- To All the Squirrels Hidden Til Now
        16729, type.Unit,
        {
            {1, 189737}, -- Kelp Nibbler
            {2, 192135}, -- Phoenix Hatchling
            {3, 193756}, -- Docile Kit
            {4, 186306}, -- Frilled Hatchling
            {5, 192948}, -- Thicket Glider
            {6, 192942}, -- Thunderspine Calf
            {7, 193594}, -- Timbertooth Kit
            {8, 186481}, -- Frosty Spiderling
            {9, 197718}, -- Crimson Knocker
            {10, 195869}, -- Diminuitive Boghopper
            {11, 196652}, -- Reservoir Filly
            {12, 185148} -- Rocdrop Scarab
        }
    },
    { -- Great Gourmand of The Ruby Feast
        16556, type.Item,
        {
            {1, 200886}, -- Lemon Silverleaf Tea
            {2, 200885}, -- Cinna-Cinderbloom Tea
            {3, 200759}, -- Aruunem Berrytart
            {4, 200887}, -- Charred Porter
            {5, 200888}, -- Coal-Fired Rib Rack
            {6, 200889}, -- Highly-Spiced Haunch
            {7, 200890}, -- Stonetalen Bloom Skewer
            {8, 200891}, -- Druidic Dreamsalad
            {9, 200892}, -- Dragonfruit Punch
            {10, 200893}, -- Azsunian-Poached Lobster
            {11, 200894}, -- Rare Vintage Arcwine
            {12, 200896}, -- Captain's Carmelized Catfish
            {13, 200897}, -- Venrick's Goat Milk
            {14, 200898}, -- Mantis Shrimp Cocktail
            {15, 200899}, -- Seared Sea Mist Noodles
            {16, 200900}, -- Fried Emperor Wraps
            {17, 200901}, -- Roquefort-Stuffed Peppers
            {18, 200902}, -- Ravenberry Panacotta Delight
            {19, 200904}, -- Picante Pomfruit Cake
            {20, 200903}, -- Moira's Choice Espresso
        }
    },
    { -- Battler of the Dragon Isles Aquatic / Beast / Critter / Dragonkin / Elemental / Flying / Humanoid / Magic / Mechanical / Undead
        {16501, 16503, 16504, 16505, 16506, 16507, 16508, 16509, 16510, 16511}, type.Unit,
        {
            {1, 197417}, -- Arcantus
            {2, 197102}, -- Bakhushek
            {3, 197336}, -- Enyobon
            {4, 196264}, -- Haniko
            {5, 196069}, -- Patchu
            {6, 197350}, -- Setimothes
            {7, 197447}, -- Stormamu
            {8, 189376}, -- Swog
        }
    },
    { -- Battle on the Dragon Isles
        16464, type.Unit,
        {
            {1, 197447}, -- Eye of the Stormling
            {2, 197417}, -- Mini Manafiend Melee
            {3, 189376}, -- Swog the Elder
            {4, 196069}, -- The Grand Master
            {5, 197336}, -- The Oldest Dragonfly
            {6, 196264}, -- The Terrible Three
            {7, 197102}, -- Two and Two Together
            {8, 197350}, -- You Have to Start Somewhere
        }
    },
    { -- Who's a Good Bakar?
        16424, type.Unit,
        {
            {1, 197569}, -- Alli
            {2, 189274}, -- Baba
            {3, 196871}, -- Baga
            {4, 195669}, -- Berrel
            {5, 187840}, -- Elaichi
            {6, 187667}, -- Ellam
            {7, 189387}, -- Fogl
            {8, 186189}, -- Gentara
            {9, 189377}, -- Hugo
            {10, 196650}, -- Katei
            {11, 190043}, -- Laila
            {12, 192687}, -- Nahma
            {13, 189278}, -- Pesca
            {14, 191405}, -- Rotti
            {15, 197514}, -- Soyoo
            {16, 197518}, -- Taivan
            {17, 189276}, -- Tseg
            {18, 196651}, -- Vinyu
            {19, 191408}, -- Wish
            {20, 189388}, -- Zephyr
        }
    },
    { -- Ohn'ahran Plains Advanced / Reverse
        {15930, 15931, 15932, 17198, 17199, 17200}, type.Unit,
        {
            {1, 190928}, -- Sundapple Copse Circuit
            {2, 191121}, -- Fen Flythrough
            {3, 191165}, -- Ravine River Run
            {4, 191247}, -- Emerald Gardens Ascent
            {7, 196092}, -- River Rapids Route
        }
    },
    { -- Thaldraszus Basic / Advanced / Reverse
        {15924, 15925, 15926, 15936, 15937, 15938, 17204, 17205, 17206}, type.Unit,
        {
            {1, 192555}, -- The Flowing Forest Flight
            {2, 193651}, -- Tyrhold Trial
            {3, 193911}, -- Cliffside Circuit
            {4, 193951}, -- Academy Ascent
            {5, 194348}, -- Garden Gallivant
            {6, 194372}, -- Caverns Criss-Cross
        }
    },
    { -- Azure Span Basic / Advanced / Reverse
        {15921, 15922, 15923, 15933, 15934, 15935, 17201, 17202, 17203}, type.Unit,
        {
            {1, 191572}, -- The Azure Span Sprint
            {2, 191947}, -- The Azure Span Slalom
            {3, 192115}, -- The Vakthros Ascent
            {4, 192886}, -- Iskaara Tour
            {5, 192945}, -- Frostland Flyover
            {6, 193027}, -- Archive Ambit
        }
    },
    { -- Ohn'ahran Plains Basic
        {15918, 15919, 15920}, type.Unit,
        {
            {1, 190928}, -- Sundapple Copse Circuit
            {2, 191121}, -- Fen Flythrough
            {3, 191165}, -- Ravine River Run
            {4, 191247}, -- Emerald Gardens Ascent
            {5, 191422}, -- Maruukai Dash
            {6, 191511}, -- Mirror of the Sky Dash
            {7, 196092}, -- River Rapids Route
        }
    },
    { -- Waking Shores Basic / Advanced / Reverse
        {15915, 15916, 15917, 15927, 15928, 15929, 17195, 17196, 17197}, type.Unit,
        {
            {1, 190123}, -- Ruby Lifeshrine Loop
            {2, 190473}, -- Wild Preserve Slalom
            {3, 190519}, -- Emberflow Flight
            {4, 190551}, -- Apex Canopy River Run
            {5, 190667}, -- Uktulut Coaster
            {6, 190753}, -- Wingrest Roundabout
            {7, 190326}, -- Flashfrost Flyover
            {8, 190503}, -- Wild Preserve Circuit
        }
    },
};