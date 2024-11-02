local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["08_02_00"] = {
    { -- "Battle for Azeroth Pathfinder, Part Two"
        13250,
    },
    { -- Rest In Pistons
        13470,
    },
    { -- Deep Pockets
        13472,
    },
    { -- Diversified Investments
        13473,
    },
    { -- Junkyard Machinist
        13474,
    },
    { -- Junkyard Scavenger
        13475,
    },
    { -- Junkyard Tinkerer
        13476,
    },
    { -- Junkyard Apprentice
        13477,
    },
    { -- Junkyard Collector
        13478,
    },
    { -- Junkyard Architect
        13479,
    },
    { -- Head Financier of Mechagon
        13482,
    },
    { -- Secret Fish of Mechagon
        13489,
    },
    { -- Secret Fish and Where to Find Them
        13502,
    },
    { -- Available in Eight Colors
        13513,
    },
    { -- Mecha-Done
        13541,
    },
    { -- How to Train Your Direhorn
        13542,
        faction.Horde,
    },
    { -- "Go Ahead, Make My Daisy"
        13545,
    },
    { -- Trove Tracker
        13549,
    },
    { -- The Mechagonian Threat
        13553,
        faction.Alliance,
    },
    { -- Junkyard Tinkmaster
        13555,
    },
    { -- Outside Influences
        13556,
    },
    { -- Rustbolt Rebellion
        13557,
    },
    { -- Waveblade Ankoan
        13558,
        faction.Alliance,
    },
    { -- The Unshackled
        13559,
        faction.Horde,
    },
    { -- For Nazjatar!
        13568,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Nazjatar
        13569,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Mechagon
        13570,
        {
            IsPvP = true,
        },
    },
    { -- Under the Seams
        13571,
    },
    { -- The Heart Forge
        13572,
    },
    { -- How to Ptrain Your Pterrordax
        13573,
        faction.Horde,
    },
    { -- Crestfall
        13577,
    },
    { -- Heroic: Crestfall
        13578,
    },
    { -- Mythic: Crestfall
        13579,
    },
    { -- Crestfallen
        13580,
        {
            IsPvP = true,
        },
    },
    { -- Snowblossom Village
        13581,
    },
    { -- Heroic: Snowblossom Village
        13582,
    },
    { -- Mythic: Snowblossom Village
        13583,
    },
    { -- Snowblossom Scrapper
        13584,
        {
            IsPvP = true,
        },
    },
    { -- "Never Lose, Never Choose To"
        13585,
    },
    { -- Fighting on Two Fronts
        13623,
        {
            IsPvP = true,
        },
    },
    { -- Keep DPS-ing and Nobody Explodes
        13624,
    },
    { -- Mighty Minions of Mechagon
        13625,
    },
    { -- Nautical Nuisances of Nazjatar
        13626,
    },
    { -- Pet Battle Challenge: Stratholme
        13627,
    },
    { -- Intro to Marine Biology
        13628,
    },
    { -- Simple Geometry
        13629,
    },
    { -- Notorious Gladiator: Battle for Azeroth Season 3
        13630,
        {
            IsPvP = true,
        },
    },
    { -- Notorious Gladiator's Proto-Drake
        13632,
        {
            IsPvP = true,
        },
    },
    { -- If It Pleases the Court
        13633,
    },
    { -- Challenger: Battle for Azeroth Season 3
        13634,
        {
            IsPvP = true,
        },
    },
    { -- Tour of the Depths
        13635,
    },
    { -- Undersea Usurper
        13638,
    },
    { -- Combatant: Battle for Azeroth Season 3
        13639,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Battle for Azeroth Season 3
        13641,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Battle for Azeroth Season 3
        13642,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Notorious
        13643,
        faction.Alliance,
        13644,
        true,
    },
    { -- Hero of the Horde: Notorious
        13644,
        faction.Horde,
        13643,
        true,
    },
    { -- Nautical Battlefield Training
        13645,
        faction.Horde,
        13704,
    },
    { -- Gladiator: Battle for Azeroth Season 3
        13647,
        {
            IsPvP = true,
        },
    },
    { -- Elite: Battle for Azeroth Season 3
        13676,
        {
            IsPvP = true,
        },
    },
    { -- You and What Army?
        13684,
    },
    { -- Junkyard Melomaniac
        13686,
    },
    { -- Glory of the Eternal Raider
        13687,
    },
    { -- Nazjatarget Eliminated
        13690,
    },
    { -- I Thought You Said They'd Be Rare?
        13691,
    },
    { -- Give Me the Biggest Bag You've Got
        13692,
    },
    { -- Mecha-Safari
        13693,
    },
    { -- Nazjatari Safari
        13694,
    },
    { -- Team Aquashock
        13695,
    },
    { -- Scrappy's Best Friend
        13696,
    },
    { -- Clean Up On Aisle Mechagon
        13698,
    },
    { -- Periodic Destruction
        13699,
    },
    { -- The Mechagonian Threat
        13700,
        faction.Horde,
    },
    { -- Battlefield Brawler
        13701,
        {
            IsPvP = true,
        },
    },
    { -- Battlefield Tactician
        13702,
        {
            IsPvP = true,
        },
    },
    { -- Battlefield Master
        13703,
        {
            IsPvP = true,
        },
    },
    { -- Nautical Battlefield Training
        13704,
        faction.Alliance,
        13645,
    },
    { -- Stay Positive
        13706,
    },
    { -- Mrrl's Secret Stash
        13707,
    },
    { -- Most Minis Wins
        13708,
    },
    { -- Unfathomable
        13709,
        faction.Horde,
        13710,
    },
    { -- Sunken Ambitions
        13710,
        faction.Alliance,
        13709,
    },
    { -- A Fistful of Manapearls
        13711,
    },
    { -- Explore Nazjatar
        13712,
    },
    { -- Nothing To Scry About
        13713,
    },
    { -- From The Belly Of The Jelly
        13715,
    },
    { -- Lactose Intolerant
        13716,
    },
    { -- The Grand Reception
        13718,
    },
    { -- Depths of the Devoted
        13719,
    },
    { -- Supplying the Assassins
        13720,
        {
            IsPvP = true,
        },
    },
    { -- Terror of the Tadpoles
        13722,
    },
    { -- "M.C., Hammered"
        13723,
    },
    { -- A Smack of Jellyfish
        13724,
    },
    { -- The Circle of Stars
        13725,
    },
    { -- Mythic: Abyssal Commander Sivara
        13726,
    },
    { -- Mythic: Radiance of Azshara
        13727,
    },
    { -- Mythic: Blackwater Behemoth
        13728,
    },
    { -- Mythic: Lady Ashvane
        13729,
    },
    { -- Mythic: Orgozoa
        13730,
    },
    { -- Mythic: The Queen's Court
        13731,
    },
    { -- Mythic: Za'qul
        13732,
    },
    { -- Mythic: Queen Azshara
        13733,
    },
    { -- Heroic: War is Hell
        13735,
        faction.Horde,
        13737,
    },
    { -- Heroic: War is Hell
        13737,
        faction.Alliance,
        13735,
    },
    { -- Heroic: Tour of War
        13738,
        faction.Horde,
        13739,
    },
    { -- Heroic: Tour of War
        13739,
        faction.Alliance,
        13738,
    },
    { -- Seasoned: Hunter Akana
        13743,
        faction.Alliance,
        13746,
    },
    { -- Seasoned: Bladesman Inowari
        13744,
        faction.Alliance,
        13747,
    },
    { -- Seasoned: Farseer Ori
        13745,
        faction.Alliance,
        13748,
    },
    { -- Seasoned: Neri Sharpfin
        13746,
        faction.Horde,
        13743,
    },
    { -- Seasoned: Poen Gillbrack
        13747,
        faction.Horde,
        13744,
    },
    { -- Seasoned: Vim Brineheart
        13748,
        faction.Horde,
        13745,
    },
    { -- Veteran: Neri Sharpfin
        13749,
        faction.Horde,
        13753,
    },
    { -- Battle-Scarred: Neri Sharpfin
        13750,
        faction.Horde,
        13758,
    },
    { -- Veteran: Poen Gillbrack
        13751,
        faction.Horde,
        13754,
    },
    { -- Veteran: Vim Brineheart
        13752,
        faction.Horde,
        13755,
    },
    { -- Veteran: Hunter Akana
        13753,
        faction.Alliance,
        13749,
    },
    { -- Veteran: Bladesman Inowari
        13754,
        faction.Alliance,
        13751,
    },
    { -- Veteran: Farseer Ori
        13755,
        faction.Alliance,
        13752,
    },
    { -- Battle-Scarred: Poen Gillbrack
        13756,
        faction.Horde,
        13759,
    },
    { -- Battle-Scarred: Vim Brineheart
        13757,
        faction.Horde,
        13760,
    },
    { -- Battle-Scarred: Hunter Akana
        13758,
        faction.Alliance,
        13750,
    },
    { -- Battle-Scarred: Bladesman Inowari
        13759,
        faction.Alliance,
        13756,
    },
    { -- Battle-Scarred: Farseer Ori
        13760,
        faction.Alliance,
        13757,
    },
    { -- Aqua Team Murder Force
        13761,
        faction.Horde,
        13762,
    },
    { -- Aqua Team Murder Force
        13762,
        faction.Alliance,
        13761,
    },
    { -- Back to the Depths!
        13763,
    },
    { -- Puzzle Performer
        13764,
    },
    { -- Subaquatic Support
        13765,
    },
    { -- Malowned
        13766,
    },
    { -- Fun Run
        13767,
    },
    { -- The Best of Us
        13768,
    },
    { -- Power Up
        13769,
    },
    { -- Power Creep
        13770,
    },
    { -- Power Is Beautiful
        13771,
    },
    { -- Essence Essentials
        13772,
        {
            IsPvP = true,
        },
    },
    { -- Essence Gains
        13773,
        {
            IsPvP = true,
        },
    },
    { -- Essence Overload
        13775,
        {
            IsPvP = true,
        },
    },
    { -- Explore Mechagon
        13776,
    },
    { -- My Heart Container is Full
        13777,
    },
    { -- Phenomenal Cosmic Power
        13779,
    },
    { -- Battle for Azeroth Keystone Conqueror: Season Three
        13780,
    },
    { -- Battle for Azeroth Keystone Master: Season Three
        13781,
    },
    { -- Ahead of the Curve: Queen Azshara
        13784,
    },
    { -- Cutting Edge: Queen Azshara
        13785,
    },
    { -- Hertz Locker
        13789,
    },
    { -- Armed for Action
        13790,
    },
    { -- Making the Mount
        13791,
    },
    { -- Feline Figurines Found
        13836,
    },
    {KrowiAF.SetAchievementPatch, 8, 2, 0}, -- Rework loading so this can go to the top, future me problem
};