local _, addon = ...;
local shared = addon.Data.PetBattleLinkData.Shared;
local sec, enc = shared.Section, shared.Encounter;

KrowiAF.PetBattleLinkData.TheWarWithin = {
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
    { -- Beast Battler of Khaz Algar
        40155,
        enc .. "1657",
        {
            {1, enc .. "1657"}, -- Collector Dyna
            {2, enc .. "1659"}, -- Friendhaver Grem
            {3, enc .. "1661"}, -- Kyrie
            {4, enc .. "1663"}, -- Ziriak
        }
    },
    { -- Critter Battler of Khaz Algar
        40156,
        enc .. "1633",
        {
            {1, enc .. "1633"}, -- Collector Dyna
            {2, enc .. "1635"}, -- Friendhaver Grem
            {3, enc .. "1637"}, -- Kyrie
            {4, enc .. "1639"}, -- Ziriak
        }
    },
    { -- Dragonkin Battler of Khaz Algar
        40157,
        enc .. "1609",
        {
            {1, enc .. "1609"}, -- Collector Dyna
            {2, enc .. "1611"}, -- Friendhaver Grem
            {3, enc .. "1613"}, -- Kyrie
            {4, enc .. "1615"}, -- Ziriak
        }
    },
    { -- Elemental Battler of Khaz Algar
        40158,
        enc .. "1649",
        {
            {1, enc .. "1649"}, -- Collector Dyna
            {2, enc .. "1651"}, -- Friendhaver Grem
            {3, enc .. "1653"}, -- Kyrie
            {4, enc .. "1655"}, -- Ziriak
        }
    },
    { -- Flying Battler of Khaz Algar
        40161,
        enc .. "1617",
        {
            {1, enc .. "1617"}, -- Collector Dyna
            {2, enc .. "1619"}, -- Friendhaver Grem
            {3, enc .. "1621"}, -- Kyrie
            {4, enc .. "1623"}, -- Ziriak
        }
    },
    { -- Humanoid Battler of Khaz Algar
        40162,
        enc .. "1601",
        {
            {1, enc .. "1601"}, -- Collector Dyna
            {2, enc .. "1603"}, -- Friendhaver Grem
            {3, enc .. "1605"}, -- Kyrie
            {4, enc .. "1607"}, -- Ziriak
        }
    },
    { -- Magic Battler of Khaz Algar
        40163,
        enc .. "1641",
        {
            {1, enc .. "1641"}, -- Collector Dyna
            {2, enc .. "1643"}, -- Friendhaver Grem
            {3, enc .. "1645"}, -- Kyrie
            {4, enc .. "1647"}, -- Ziriak
        }
    },
    { -- Mechanical Battler of Khaz Algar
        40164,
        enc .. "1673",
        {
            {1, enc .. "1673"}, -- Collector Dyna
            {2, enc .. "1675"}, -- Friendhaver Grem
            {3, enc .. "1677"}, -- Kyrie
            {4, enc .. "1679"}, -- Ziriak
        }
    },
    { -- Undead Battler of Khaz Algar
        40165,
        enc .. "1625",
        {
            {1, enc .. "1625"}, -- Collector Dyna
            {2, enc .. "1627"}, -- Friendhaver Grem
            {3, enc .. "1629"}, -- Kyrie
            {4, enc .. "1631"}, -- Ziriak
        }
    },
    { -- Family Battler of Khaz Algar
        40980,
        sec .. "105",
        {
            {1, 40154}, -- Aquatic Battler of Khaz Algar
            {2, 40155}, -- Beast Battler of Khaz Algar
            {3, 40156}, -- Critter Battler of Khaz Algar
            {4, 40157}, -- Dragonkin Battler of Khaz Algar
            {5, 40158}, -- Elemental Battler of Khaz Algar
            {6, 40161}, -- Flying Battler of Khaz Algar
            {7, 40162}, -- Humanoid Battler of Khaz Algar
            {8, 40163}, -- Magic Battler of Khaz Algar
            {9, 40164}, -- Mechanical Battler of Khaz Algar
            {10, 40165}, -- Undead Battler of Khaz Algar
        }
    },
    { -- Aquatic Battler of Undermine
        41542,
        enc .. "1762",
        {
            {1, enc .. "1762"}, -- Precision Powerdrill
            {2, enc .. "1763"}, -- Baxx the Purveyor
            {3, enc .. "1764"}, -- Prezly Wavecutter
            {4, enc .. "1765"}, -- Creech
        }
    },
    { -- Beast Battler of Undermine
        41543,
        enc .. "1758",
        {
            {1, enc .. "1758"}, -- Precision Powerdrill
            {2, enc .. "1759"}, -- Baxx the Purveyor
            {3, enc .. "1760"}, -- Prezly Wavecutter
            {4, enc .. "1761"}, -- Creech
        }
    },
    { -- Critter Battler of Undermine
        41541,
        enc .. "1746",
        {
            {1, enc .. "1746"}, -- Precision Powerdrill
            {2, enc .. "1747"}, -- Baxx the Purveyor
            {3, enc .. "1748"}, -- Prezly Wavecutter
            {4, enc .. "1749"}, -- Creech
        }
    },
    { -- Dragonkin Battler of Undermine
        41544,
        enc .. "1734",
        {
            {1, enc .. "1734"}, -- Precision Powerdrill
            {2, enc .. "1735"}, -- Baxx the Purveyor
            {3, enc .. "1736"}, -- Prezly Wavecutter
            {4, enc .. "1737"}, -- Creech
        }
    },
    { -- Elemental Battler of Undermine
        41545,
        enc .. "1754",
        {
            {1, enc .. "1754"}, -- Precision Powerdrill
            {2, enc .. "1755"}, -- Baxx the Purveyor
            {3, enc .. "1756"}, -- Prezly Wavecutter
            {4, enc .. "1757"}, -- Creech
        }
    },
    { -- Flying Battler of Undermine
        41546,
        enc .. "1738",
        {
            {1, enc .. "1738"}, -- Precision Powerdrill
            {2, enc .. "1739"}, -- Baxx the Purveyor
            {3, enc .. "1740"}, -- Prezly Wavecutter
            {4, enc .. "1741"}, -- Creech
        }
    },
    { -- Humanoid Battler of Undermine
        41547,
        enc .. "1730",
        {
            {1, enc .. "1730"}, -- Precision Powerdrill
            {2, enc .. "1731"}, -- Baxx the Purveyor
            {3, enc .. "1732"}, -- Prezly Wavecutter
            {4, enc .. "1733"}, -- Creech
        }
    },
    { -- Magic Battler of Undermine
        41548,
        enc .. "1750",
        {
            {1, enc .. "1750"}, -- Precision Powerdrill
            {2, enc .. "1751"}, -- Baxx the Purveyor
            {3, enc .. "1752"}, -- Prezly Wavecutter
            {4, enc .. "1753"}, -- Creech
        }
    },
    { -- Mechanical Battler of Undermine
        41549,
        enc .. "1766",
        {
            {1, enc .. "1766"}, -- Precision Powerdrill
            {2, enc .. "1767"}, -- Baxx the Purveyor
            {3, enc .. "1768"}, -- Prezly Wavecutter
            {4, enc .. "1769"}, -- Creech
        }
    },
    { -- Undead Battler of Undermine
        41550,
        enc .. "1742",
        {
            {1, enc .. "1742"}, -- Precision Powerdrill
            {2, enc .. "1743"}, -- Baxx the Purveyor
            {3, enc .. "1744"}, -- Prezly Wavecutter
            {4, enc .. "1745"}, -- Creech
        }
    },
    { -- Family Battler of Undermine
        41551,
        sec .. "111",
        {
            {1, 41542}, -- Aquatic Battler of Undermine
            {2, 41543}, -- Beast Battler of Undermine
            {3, 41541}, -- Critter Battler of Undermine
            {4, 41544}, -- Dragonkin Battler of Undermine
            {5, 41545}, -- Elemental Battler of Undermine
            {6, 41546}, -- Flying Battler of Undermine
            {7, 41547}, -- Humanoid Battler of Undermine
            {8, 41548}, -- Magic Battler of Undermine
            {9, 41549}, -- Mechanical Battler of Undermine
            {10, 41550}, -- Undead Battler of Undermine
        }
    },
}