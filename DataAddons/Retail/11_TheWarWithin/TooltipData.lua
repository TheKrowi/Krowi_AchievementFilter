local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.TheWarWithin = {
    { -- Battle on Khaz Algar
        40153, type.Unit,
        {
            {1, 223407}, -- Awakened Custodian
            {2, 222535}, -- Haywire Servobot
            {3, 223409}, -- Guttergunk
            {4, 223446}, -- Collector Dyna
            {5, 223406}, -- Zaedu
            {6, 223444}, -- Friendhaver Grem
            {7, 223442}, -- Kyrie
            {8, 223443}, -- Ziriak
        }
    },
    { -- Battler of Khaz Algar Aquatic / Beast / Critter / Dragonkin / Elemental / Flying / Humanoid / Magic / Mechanical / Undead
        {40154, 40155, 40156, 40157, 40158, 40161, 40162, 40163, 40164, 40165}, type.Unit,
        {
            {1, 223446}, -- Collector Dyna
            {2, 223444}, -- Friendhaver Grem
            {3, 223442}, -- Kyrie
            {4, 223443}, -- Ziriak
        }
    },
    { --Khaz Algar Safari
        40194, type.Unit,
        {
            {1, 222071}, -- Chitin Burrower
            {2, 222066}, -- Arachnoid Hatchling
            {3, 222613}, -- Fallowspark Glowfly
            {4, 222614}, -- Azure Flickerfly
            {5, 222615}, -- Vibrant Glowfly
            {6, 222325}, -- Aubergine Scootlefish
            {7, 222344}, -- Verdant Scootlefish
            {8, 222354}, -- Voidling Ooze
            {9, 222351}, -- Shadowy Oozeling
            {10, 222584}, -- Common Ploughworm
            {11, 222582}, -- Ebon Ploughworm
            {12, 222194}, -- Greenlands Chicken
            {13, 222195}, -- Arathi Chicken
            {14, 222875}, -- Meek Bloodlasher
            {15, 222877}, -- Ghostcap Menace
            {16, 222608}, -- Winged Arachnoid
            {17, 222421}, -- Vile Bloodtick
            {18, 222713}, -- Magmashell Crawler
            {19, 222499}, -- Mossy Snail
            {20, 222736}, -- Subterranean Dartswog
            {21, 222739}, -- Troglofrog
            {22, 222774}, -- Fragrant Stonelamb
            {23, 222775}, -- Sandstone Mosswool
            {24, 222778}, -- Shale Mosswool
            {25, 223090}, -- Bedrock Stonecharger
            {26, 223094}, -- Cobalt Ramolith
            {27, 223093}, -- Granite Ramolith
            {28, 223092}, -- Alabaster Stonecharger
            {29, 223715}, -- Snuffling
            {30, 223698}, -- Cinderhoney Emberstinger
        }
    },
    { -- Isle of Dorn Basic / Advanced / Reverse
        {40316, 40317, 40318, 40319, 40320, 40321, 40322, 40323, 40324}, type.Unit,
        {
            {1, 219542}, -- Dornogal Drift
            {2, 219544}, -- Storm's Watch Survey
            {3, 219547}, -- Basin Bypass
            {4, 219548}, -- The Wold Ways
            {5, 219549}, -- Thunderhead Trail
            {6, 219550}, -- Orecreg's Doglegs
        }
    },
    { -- The Ringing Deeps Basic / Advanced / Reverse
        {40325, 40326, 40327, 40328, 40329, 40330, 40331, 40332, 40333}, type.Unit,
        {
            {1, 219551}, -- Earthenworks Weave
            {2, 219552}, -- Ringing Deeps Ramble 
            {3, 219553}, -- Chittering Concourse
            {4, 219554}, -- Cataract River Cruise
            {5, 219555}, -- Taelloch Twist
            {6, 219556}, -- Opportunity Point
        }
    },
    { -- Hallowfall Basic / Advanced / Reverse
        {40334, 40335, 40336, 40337, 40338, 40339, 40340, 40341, 40342}, type.Unit,
        {
            {1, 219557}, -- Dunelle's Detour
            {2, 219558}, -- Tenir's Traversal
            {3, 219559}, -- Light's Redoubta
            {4, 219560}, -- Stillstone Slalom
            {5, 219561}, -- Mereldar Meander
            {6, 219562}, -- Velhan's Venture
        }
    },
    { -- Azj-Kahet Basic / Advanced / Reverse
        {40343, 40344, 40345, 40346, 40347, 40348, 40349, 40350, 40351}, type.Unit,
        {
            {1, 219564}, -- City of Threads
            {2, 219565}, -- Maddening Deep Dip
            {3, 219567}, -- Weavers Wing
            {4, 219568}, -- Rak-Ahat
            {5, 219569}, -- Pit Plunge
            {6, 219570}, -- Siegehold Scuttle
        }
    },
    { -- Undermine Safari
        41092, type.Unit,
        {
            {1, 231477}, -- Wily Rat
            {2, 231481}, -- Underroach
            {3, 231550}, -- Bombshell Crab
            {4, 231567}, -- Venture Crab
            {5, 231570}, -- Cave Crab
            {6, 231572}, -- Kaja Crab
            {7, 231577}, -- Varmint Mark Ii
            {8, 231579}, -- Lime Roboclucker
            {9, 231616}, -- Tropical Frog
            {10, 231684}, -- Spring Loaded Ribbitron
            {11, 222592}, -- Hemospore
            {12, 222420}, -- Frenzied Bloodtick
        }
    },
    { -- Adventurer of Undermine
        41216, type.Unit,
        {
            {1, 230931}, -- Scrap Beak
            {2, 230934}, -- Ratspit
            {3, 230940}, -- Tally Doublespeak
            {4, 230947}, -- Slimesby
            {5, 230946}, -- V V Goosworth
            {6, 230951}, -- Thwack
            {7, 230979}, -- S A L
            {8, 230995}, -- Nitro
            {9, 231012}, -- Candy Stickemup
            {10, 231017}, -- Grimewick
            {11, 231288}, -- Swigs Farsight
            {12, 230746}, -- Ephemeral Agent Lathyd
            {13, 230793}, -- The Junk Wall
            {14, 230800}, -- Slugger The Smart
            {15, 230828}, -- Chief Foreman Gutso
            {16, 230840}, -- Flyboy Snooty
            {17, 234480}, -- M A G N O
            {18, 234499}, -- Giovante
            {19, 233471}, -- Scrapchewer
            {20, 233472}, -- Volstrike The Charged
            {21, 231310}, -- Darkfuse Precipitant
        }
    },
};