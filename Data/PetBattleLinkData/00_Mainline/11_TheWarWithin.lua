local _, addon = ...;
local shared = addon.Data.PetBattleLinkData.Shared;
local sec, enc = shared.Section, shared.Encounter;

KrowiAF.PetBattleLinkData.TheWarWithin = {
    -- { -- Family Battler of Khaz Algar
    --     ?????,
    --     sec .. "105",
    --     {
    --         {1, 40154}, -- Aquatic Battler of Khaz Algar
    --         {2, 40155}, -- Beast Battler of Khaz Algar
    --         {3, 40156}, -- Critter Battler of Khaz Algar
    --         {4, 40157}, -- Dragonkin Battler of Khaz Algar
    --         {5, 40158}, -- Elemental Battler of Khaz Algar
    --         {6, 40161}, -- Flying Battler of Khaz Algar
    --         {7, 40162}, -- Humanoid Battler of Khaz Algar
    --         {8, 40163}, -- Magic Battler of Khaz Algar
    --         {9, 40164}, -- Mechanical Battler of Khaz Algar
    --         {10, 40165}, -- Undead Battler of Khaz Algar
    --     }
    -- },
    { -- Undead Battler of Khaz Algar
        40165,
        enc .. "1665",
        {
            {1, enc .. "1625"}, -- Collector Dyna
            {2, enc .. "1627"}, -- Friendhaver Grem
            {3, enc .. "1629"}, -- Kyrie
            {4, enc .. "1631"}, -- Ziriak
        }
    },
    { -- Mechanical Battler of Khaz Algar
        40164,
        enc .. "1665",
        {
            {1, enc .. "1673"}, -- Collector Dyna
            {2, enc .. "1675"}, -- Friendhaver Grem
            {3, enc .. "1677"}, -- Kyrie
            {4, enc .. "1679"}, -- Ziriak
        }
    },
    { -- Magic Battler of Khaz Algar
        40163,
        enc .. "1665",
        {
            {1, enc .. "1641"}, -- Collector Dyna
            {2, enc .. "1643"}, -- Friendhaver Grem
            {3, enc .. "1645"}, -- Kyrie
            {4, enc .. "1647"}, -- Ziriak
        }
    },
    { -- Humanoid Battler of Khaz Algar
        40162,
        enc .. "1665",
        {
            {1, enc .. "1601"}, -- Collector Dyna
            {2, enc .. "1603"}, -- Friendhaver Grem
            {3, enc .. "1605"}, -- Kyrie
            {4, enc .. "1607"}, -- Ziriak
        }
    },
    { -- Flying Battler of Khaz Algar
        40161,
        enc .. "1665",
        {
            {1, enc .. "1617"}, -- Collector Dyna
            {2, enc .. "1619"}, -- Friendhaver Grem
            {3, enc .. "1621"}, -- Kyrie
            {4, enc .. "1623"}, -- Ziriak
        }
    },
    { -- Elemental Battler of Khaz Algar
        40158,
        enc .. "1665",
        {
            {1, enc .. "1649"}, -- Collector Dyna
            {2, enc .. "1651"}, -- Friendhaver Grem
            {3, enc .. "1653"}, -- Kyrie
            {4, enc .. "1655"}, -- Ziriak
        }
    },
    { -- Dragonkin Battler of Khaz Algar
        40157,
        enc .. "1665",
        {
            {1, enc .. "1609"}, -- Collector Dyna
            {2, enc .. "1611"}, -- Friendhaver Grem
            {3, enc .. "1613"}, -- Kyrie
            {4, enc .. "1615"}, -- Ziriak
        }
    },
    { -- Critter Battler of Khaz Algar
        40156,
        enc .. "1665",
        {
            {1, enc .. "1633"}, -- Collector Dyna
            {2, enc .. "1635"}, -- Friendhaver Grem
            {3, enc .. "1637"}, -- Kyrie
            {4, enc .. "1639"}, -- Ziriak
        }
    },
    { -- Beast Battler of Khaz Algar
        40155,
        enc .. "1665",
        {
            {1, enc .. "1657"}, -- Collector Dyna
            {2, enc .. "1659"}, -- Friendhaver Grem
            {3, enc .. "1661"}, -- Kyrie
            {4, enc .. "1663"}, -- Ziriak
        }
    },
    { -- Aquatic Battler of Khaz Algar
        40154,
        enc .. "1665",
        {
            {1, enc .. "1665"}, -- Collector Dyna
            {2, enc .. "1667"}, -- Friendhaver Grem
            {3, enc .. "1669"}, -- Kyrie
            {4, enc .. "1671"}, -- Ziriak
        }
    },
    { -- Battle on Khaz Algar
        40153,
        sec .. "104",
        {
            {1, enc .. "1590"}, -- Awakened Custodian
            {2, enc .. "1593"}, -- Haywire Servobot
            {3, enc .. "1596"}, -- Guttergunk
            {4, enc .. "1589"}, -- Collector Dyna
            {5, enc .. "1599"}, -- Zaedu
            {6, enc .. "1592"}, -- Friendhaver Grem
            {7, enc .. "1595"}, -- Kyrie
            {8, enc .. "1598"}, -- Ziriak
        }
    },
}