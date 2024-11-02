local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_01_00"] = {
    { -- They're Both Footballs?
        7852,
    },
    { -- WoW's 9th Anniversary
        7853,
    },
    { -- We're Going to Need More Saddles
        7860,
        faction.Alliance,
        7862,
    },
    { -- We're Going to Need More Saddles
        7862,
        faction.Horde,
        7860,
    },
    { -- I Choose You
        7908,
    },
    { -- Operation: Shieldwall Campaign
        7928,
        faction.Alliance,
        7929,
    },
    { -- Dominance Offensive Campaign
        7929,
        faction.Horde,
        7928,
    },
    { -- "I'm In Your Base, Killing Your Dudes"
        7932,
    },
    { -- And... It's Good!
        7933,
    },
    { -- Raiding with Leashes
        7934,
    },
    { -- Pandaren Spirit Tamer
        7936,
    },
    { -- You Are Not Your $#*@! Legplates (Season 1)
        7937,
        faction.Alliance,
        8020,
    },
    { -- The Second Rule of Brawler's Guild (Season 1)
        7939,
        faction.Horde,
        7940,
    },
    { -- The Second Rule of Brawler's Guild (Season 1)
        7940,
        faction.Alliance,
        7939,
    },
    { -- Brawlin' and Shot Callin' (Season 1)
        7941,
        faction.Alliance,
        7942,
    },
    { -- Brawlin' and Shot Callin' (Season 1)
        7942,
        faction.Horde,
        7941,
    },
    { -- I'm Your Number One Fan (Season 2)
        7943,
    },
    { -- Bottle Service (Season 2)
        7944,
    },
    { -- Haters Gonna Hate (Season 2)
        7945,
    },
    { -- Now You're Just Showing Off (Season 1)
        7946,
        faction.Alliance,
        8022,
    },
    { -- The First Rule of Brawler's Guild (Season 1 or 2)
        7947,
        faction.Alliance,
        7948,
    },
    { -- The First Rule of Brawler's Guild (Season 1 or 2)
        7948,
        faction.Horde,
        7947,
    },
    { -- Rabble Rabble Rabble (Season 2)
        7949,
        faction.Alliance,
        7950,
    },
    { -- Rabble Rabble Rabble (Season 2)
        7950,
        faction.Horde,
        7949,
    },
    { -- Watery Grave
        7984,
    },
    { -- You Mean That Wasn't a Void Zone?
        7986,
    },
    { -- No Egg Left Behind
        7987,
    },
    { -- A Little Patience
        7988,
    },
    { -- Bubbletrapped!
        7989,
    },
    { -- Cannonballer
        7990,
    },
    { -- Which Came First?
        7991,
    },
    { -- I Used To Love Them
        7992,
    },
    { -- We've Been Dancin'
        7993,
    },
    { -- Treasure of Pandaria
        7994,
    },
    { -- Fortune of Pandaria
        7995,
    },
    { -- Bounty of Pandaria
        7996,
    },
    { -- Riches of Pandaria
        7997,
    },
    { -- Chapter II: Wrathion's War
        8008,
        faction.Horde,
        7534,
    },
    { -- Dagger in the Dark
        8009,
    },
    { -- Lion's Landing
        8010,
        faction.Alliance,
        8013,
    },
    { -- Number Five Is Alive
        8011,
        faction.Alliance,
        8014,
    },
    { -- "Waste Not, Want Not"
        8012,
        faction.Alliance,
        8015,
    },
    { -- Domination Point
        8013,
        faction.Horde,
        8010,
    },
    { -- Number Five Is Alive
        8014,
        faction.Horde,
        8011,
    },
    { -- "Waste Not, Want Not"
        8015,
        faction.Horde,
        8012,
    },
    { -- Assault on Zan'vess
        8016,
    },
    { -- For the Swarm
        8017,
    },
    { -- You Are Not Your $#*@! Legplates (Season 1)
        8020,
        faction.Horde,
        7937,
    },
    { -- Now You're Just Showing Off (Season 1)
        8022,
        faction.Horde,
        7946,
    },
    { -- Wakener
        8023,
    },
    { -- A Test of Valor
        8030,
        faction.Alliance,
        8031,
    },
    { -- A Test of Valor
        8031,
        faction.Horde,
        8030,
    },
    {KrowiAF.SetAchievementPatch, 5, 1, 0}, -- Rework loading so this can go to the top, future me problem
};