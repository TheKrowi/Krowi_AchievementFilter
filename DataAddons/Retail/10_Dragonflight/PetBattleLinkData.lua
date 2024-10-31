local _, addon = ...;
local shared = addon.Data.PetBattleLinkData.Shared;
local sec, enc = shared.Section, shared.Encounter;

KrowiAF.PetBattleLinkData.Dragonflight = {
    { -- Family Battler of Zaralek Cavern
        17934,
        sec .. "100",
        {
            {1, 17881}, -- Aquatic Battler of Zaralek Cavern
            {2, 17882}, -- Beast Battler of Zaralek Cavern
            {3, 17883}, -- Critter Battler of Zaralek Cavern
            {4, 17890}, -- Dragonkin Battler of Zaralek Cavern
            {5, 17904}, -- Elemental Battler of Zaralek Cavern
            {6, 17905}, -- Flying Battler of Zaralek Cavern
            {7, 17915}, -- Humanoid Battler of Zaralek Cavern
            {8, 17916}, -- Magic Battler of Zaralek Cavern
            {9, 17917}, -- Mechanical Battler of Zaralek Cavern
            {10, 17918}, -- Undead Battler of Zaralek Cavern
        }
    },
    { -- Undead Battler of Zaralek Cavern
        17918,
        enc .. "1542",
        {
            {1, enc .. "1542"}, -- Shinmura
            {2, enc .. "1543"}, -- Delver Mardei
            {3, enc .. "1544"}, -- Trainer Orlogg
            {4, enc .. "1545"}, -- Explorer Bezzert
        }
    },
    { -- Mechanical Battler of Zaralek Cavern
        17917,
        enc .. "1566",
        {
            {1, enc .. "1566"}, -- Explorer Bezzert
            {2, enc .. "1567"}, -- Shinmura
            {3, enc .. "1568"}, -- Delver Mardei
            {4, enc .. "1569"}, -- Trainer Orlogg
        }
    },
    { -- Magic Battler of Zaralek Cavern
        17916,
        enc .. "1550",
        {
            {1, enc .. "1550"}, -- Explorer Bezzert
            {2, enc .. "1551"}, -- Shinmura
            {3, enc .. "1552"}, -- Delver Mardei
            {4, enc .. "1553"}, -- Trainer Orlogg
        }
    },
    { -- Humanoid Battler of Zaralek Cavern
        17915,
        enc .. "1530",
        {
            {1, enc .. "1530"}, -- Explorer Bezzert
            {2, enc .. "1531"}, -- Shinmura
            {3, enc .. "1532"}, -- Delver Mardei
            {4, enc .. "1533"}, -- Trainer Orlogg
        }
    },
    { -- Flying Battler of Zaralek Cavern
        17905,
        enc .. "1538",
        {
            {1, enc .. "1538"}, -- Explorer Bezzert
            {2, enc .. "1539"}, -- Shinmura
            {3, enc .. "1540"}, -- Delver Mardei
            {4, enc .. "1541"}, -- Trainer Orlogg
        }
    },
    { -- Elemental Battler of Zaralek Cavern
        17904,
        enc .. "1554",
        {
            {1, enc .. "1554"}, -- Explorer Bezzert
            {2, enc .. "1555"}, -- Shinmura
            {3, enc .. "1556"}, -- Delver Mardei
            {4, enc .. "1557"}, -- Trainer Orlogg
        }
    },
    { -- Dragonkin Battler of Zaralek Cavern
        17890,
        enc .. "1534",
        {
            {1, enc .. "1534"}, -- Explorer Bezzert
            {2, enc .. "1535"}, -- Shinmura
            {3, enc .. "1536"}, -- Delver Mardei
            {4, enc .. "1537"}, -- Trainer Orlogg
        }
    },
    { -- Critter Battler of Zaralek Cavern
        17883,
        enc .. "1546",
        {
            {1, enc .. "1546"}, -- Explorer Bezzert
            {2, enc .. "1547"}, -- Shinmura
            {3, enc .. "1548"}, -- Delver Mardei
            {4, enc .. "1549"}, -- Trainer Orlogg
        }
    },
    { -- Beast Battler of Zaralek Cavern
        17882,
        enc .. "1558",
        {
            {1, enc .. "1558"}, -- Explorer Bezzert
            {2, enc .. "1559"}, -- Shinmura
            {3, enc .. "1560"}, -- Delver Mardei
            {4, enc .. "1561"}, -- Trainer Orlogg
        }
    },
    { -- Aquatic Battler of Zaralek Cavern
        17881,
        enc .. "1562",
        {
            {1, enc .. "1562"}, -- Explorer Bezzert
            {2, enc .. "1563"}, -- Shinmura
            {3, enc .. "1564"}, -- Delver Mardei
            {4, enc .. "1565"}, -- Trainer Orlogg
        }
    },
    { -- Battle in Zaralek Cavern
        17880,
        sec .. "97",
        {
            {1, enc .. "1526"}, -- To a Land Down Under
            {2, enc .. "1527"}, -- Are They Not Beautiful?
            {3, enc .. "1528"}, -- Delver Mardai
            {4, enc .. "1529"}, -- Do You Even Train?
        }
    },
    { -- Global Swarming
        17541,
        sec .. "99",
        {
            {1, enc .. "1506"}, -- Vortex - Legendary
            {2, enc .. "1514"}, -- Tremblor - Legendary
            {3, enc .. "1510"}, -- Wildfire - Legendary
            {4, enc .. "1518"}, -- Flow - Legendary
        }
    },
    { -- Battle on the Dragon Isles II
        17406,
        sec .. "97",
        {
            {1, enc .. "1498"}, -- Adinakon
            {2, enc .. "1500"}, -- Lyver
            {3, enc .. "1502"}, -- Enok the Stinky
            {4, enc .. "1504"}, -- Right Twice a Day
            {5, enc .. "1497"}, -- Sharp as Flint
            {6, enc .. "1499"}, -- Paws of Thunder
            {7, enc .. "1501"}, -- A New Vocation
            {8, enc .. "1503"}, -- They're Full of Stars!
        }
    },
    { -- Family Battler of the Dragon Isles
        16512,
        sec .. "98",
        {
            {1, 16501}, -- Aquatic Battler of the Dragon Isles
            {2, 16503}, -- Beast Battler of the Dragon Isles
            {3, 16504}, -- Critter Battler of the Dragon Isles
            {4, 16505}, -- Dragonkin Battler of the Dragon Isles
            {5, 16506},-- Elemental Battler of the Dragon Isles
            {6, 16507}, -- Flying Battler of the Dragon Isles
            {7, 16508}, -- Humanoid Battler of the Dragon Isles
            {8, 16509}, -- Magic Battler of the Dragon Isles
            {9, 16510}, -- Mechanical Battler of the Dragon Isles
            {10, 16511}, -- Undead Battler of the Dragon Isles
        }
    },
    { -- Undead Battler of the Dragon Isles
        16511,
        enc .. "1414",
        {
            {1, enc .. "1421"}, -- Arcantus
            {2, enc .. "1417"}, -- Bakhushek
            {3, enc .. "1424"}, -- Enyobon
            {4, enc .. "1415"}, -- Haniko
            {5, enc .. "1420"}, -- Patchu
            {6, enc .. "1423"}, -- Setimothes
            {7, enc .. "1418"}, -- Stormamu
            {8, enc .. "1414"}, -- Swog
        }
    },
    { -- Mechanical Battler of the Dragon Isles
        16510,
        enc .. "1486",
        {
            {1, enc .. "1493"}, -- Arcantus
            {2, enc .. "1489"}, -- Bakhushek
            {3, enc .. "1496"}, -- Enyobon
            {4, enc .. "1487"}, -- Haniko
            {5, enc .. "1492"}, -- Patchu
            {6, enc .. "1495"}, -- Setimothes
            {7, enc .. "1490"}, -- Stormamu
            {8, enc .. "1486"}, -- Swog
        }
    },
    { -- Magic Battler of the Dragon Isles
        16509,
        enc .. "1438",
        {
            {1, enc .. "1445"}, -- Arcantus
            {2, enc .. "1441"}, -- Bakhushek
            {3, enc .. "1448"}, -- Enyobon
            {4, enc .. "1439"}, -- Haniko
            {5, enc .. "1444"}, -- Patchu
            {6, enc .. "1447"}, -- Setimothes
            {7, enc .. "1442"}, -- Stormamu
            {8, enc .. "1438"}, -- Swog
        }
    },
    { -- Humanoid Battler of the Dragon Isles
        16508,
        enc .. "1378",
        {
            {1, enc .. "1385"}, -- Arcantus
            {2, enc .. "1381"}, -- Bakhushek
            {3, enc .. "1388"}, -- Enyobon
            {4, enc .. "1379"}, -- Haniko
            {5, enc .. "1384"}, -- Patchu
            {6, enc .. "1387"}, -- Setimothes
            {7, enc .. "1382"}, -- Stormamu
            {8, enc .. "1378"}, -- Swog
        }
    },
    { -- Flying Battler of the Dragon Isles
        16507,
        enc .. "1402",
        {
            {1, enc .. "1409"}, -- Arcantus
            {2, enc .. "1405"}, -- Bakhushek
            {3, enc .. "1412"}, -- Enyobon
            {4, enc .. "1403"}, -- Haniko
            {5, enc .. "1408"}, -- Patchu
            {6, enc .. "1411"}, -- Setimothes
            {7, enc .. "1406"}, -- Stormamu
            {8, enc .. "1402"}, -- Swog
        }
    },
    { -- Elemental Battler of the Dragon Isles
        16506,
        enc .. "1450",
        {
            {1, enc .. "1457"}, -- Arcantus
            {2, enc .. "1453"}, -- Bakhushek
            {3, enc .. "1460"}, -- Enyobon
            {4, enc .. "1451"}, -- Haniko
            {5, enc .. "1456"}, -- Patchu
            {6, enc .. "1459"}, -- Setimothes
            {7, enc .. "1454"}, -- Stormamu
            {8, enc .. "1450"}, -- Swog
        }
    },
    { -- Dragonkin Battler of the Dragon Isles
        16505,
        enc .. "1390",
        {
            {1, enc .. "1397"}, -- Arcantus
            {2, enc .. "1393"}, -- Bakhushek
            {3, enc .. "1400"}, -- Enyobon
            {4, enc .. "1391"}, -- Haniko
            {5, enc .. "1396"}, -- Patchu
            {6, enc .. "1399"}, -- Setimothes
            {7, enc .. "1394"}, -- Stormamu
            {8, enc .. "1390"}, -- Swog
        }
    },
    { -- Critter Battler of the Dragon Isles
        16504,
        enc .. "1426",
        {
            {1, enc .. "1433"}, -- Arcantus
            {2, enc .. "1429"}, -- Bakhushek
            {3, enc .. "1436"}, -- Enyobon
            {4, enc .. "1427"}, -- Haniko
            {5, enc .. "1432"}, -- Patchu
            {6, enc .. "1435"}, -- Setimothes
            {7, enc .. "1430"}, -- Stormamu
            {8, enc .. "1426"}, -- Swog
        }
    },
    { -- Beast Battler of the Dragon Isles
        16503,
        enc .. "1462",
        {
            {1, enc .. "1469"}, -- Arcantus
            {2, enc .. "1465"}, -- Bakhushek
            {3, enc .. "1472"}, -- Enyobon
            {4, enc .. "1463"}, -- Haniko
            {5, enc .. "1468"}, -- Patchu
            {6, enc .. "1471"}, -- Setimothes
            {7, enc .. "1466"}, -- Stormamu
            {8, enc .. "1462"}, -- Swog
        }
    },
    { -- Aquatic Battler of the Dragon Isles
        16501,
        enc .. "1474",
        {
            {1, enc .. "1481"}, -- Arcantus
            {2, enc .. "1477"}, -- Bakhushek
            {3, enc .. "1484"}, -- Enyobon
            {4, enc .. "1475"}, -- Haniko
            {5, enc .. "1480"}, -- Patchu
            {6, enc .. "1483"}, -- Setimothes
            {7, enc .. "1478"}, -- Stormamu
            {8, enc .. "1474"}, -- Swog
        }
    },
    { -- Battle on the Dragon Isles
        16464,
        sec .. "97",
        {
            {1, enc .. "1370"}, -- Eye of the Stormling
            {2, enc .. "1373"}, -- Mini Manafiend Melee
            {3, enc .. "1366"}, -- Swog the Elder
            {4, enc .. "1372"}, -- The Grand Master
            {5, enc .. "1376"}, -- The Oldest Dragonfly
            {6, enc .. "1367"}, -- The Terrible Three
            {7, enc .. "1369"}, -- Two and Two Together
            {8, enc .. "1375"}, -- You Have to Start Somewhere
        }
    },
};