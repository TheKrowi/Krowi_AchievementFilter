local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["05_00_04"] = {
	{KrowiAF.SetAchievementPatch, 5, 0, 4},
	Ach(6089), -- Keep Rollin' Rollin' Rollin'
	Ach(6193):Obtainable("Before", "Version", {9, 0, 1}), -- Level 90 (Legacy)
	Ach(6300):AutoFactionSplit(faction.Alliance, 6534), -- Upjade Complete
	Ach(6301), -- Rally the Valley
	Ach(6332):Obtainable("Event", 374), -- That Rabbit's Dynamite!
	Ach(6348):Obtainable("Before", "Version", {8, 0, 1}), -- Mystically Superior
	Ach(6349):Obtainable("Before", "Version", {8, 0, 1}), -- Mystically Epic
	Ach(6350), -- To All the Squirrels I Once Caressed?
	Ach(6351), -- Explore Jade Forest
	Ach(6365), -- Zen Master Cook
	Ach(6366), -- Shado-Pan
	Ach(6374):Title():Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Conqueror: Bronze
	Ach(6375):Mount():Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Conqueror: Silver
	Ach(6378):Transmog():Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Conqueror: Gold
	Ach(6394), -- Rattle No More
	Ach(6396), -- Sanguinarian
	Ach(6400), -- How Did He Get Up There?
	Ach(6402):Pet(), -- Ling-Ting's Herbal Journey
	Ach(6420), -- Hopocalypse Now!
	Ach(6427), -- Mosh Pit
	Ach(6433):IsRealmFirst():Obtainable("Once"), -- Realm First! Challenge Conqueror: Gold
	Ach(6455), -- Show Me Your Moves!
	Ach(6456), -- Heroic: Stormstout Brewery
	Ach(6457), -- Stormstout Brewery
	Ach(6458), -- Guardians of Mogu'shan
	Ach(6460), -- Hydrophobia
	Ach(6462), -- Master Pet Battler
	Ach(6469), -- Shado-Pan Monastery
	Ach(6470), -- Heroic: Shado-Pan Monastery
	Ach(6471), -- Hate Leads to Suffering
	Ach(6472), -- The Obvious Solution
	Ach(6475), -- Cleaning Up
	Ach(6476), -- Conscriptinator
	Ach(6477), -- Respect
	Ach(6478), -- Glintrok N' Roll
	Ach(6479), -- Bomberman
	Ach(6480), -- Settle Down, Bro
	Ach(6485), -- Return to Sender
	Ach(6517), -- Extinction Event
	Ach(6518), -- I Heard You Like Amber...
	Ach(6523):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Shaman (Legacy)
	Ach(6524):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 (Legacy)
	Ach(6531), -- Attention to Detail
	Ach(6535):AutoFactionSplit(faction.Alliance, 6536), -- Mighty Roamin' Krasaranger
	Ach(6537):AutoFactionSplit(faction.Alliance, 6538), -- Slum It in the Summit
	Ach(6539), -- One Steppe Forward, Two Steppes Back
	Ach(6540), -- Dread Haste Makes Dread Waste
	Ach(6541), -- Loremaster of Pandaria
	Ach(6543), -- The August Celestials
	Ach(6544), -- The Tillers
	Ach(6545), -- Klaxxi
	Ach(6546), -- The Golden Lotus
	Ach(6547), -- The Anglers
	Ach(6548), -- The Lorewalkers
	Ach(6550), -- Order of the Cloud Serpent
	Ach(6551), -- Friend on the Farm
	Ach(6552), -- Friends on the Farm
	Ach(6553), -- Like an Arrow to the Face
	Ach(6554), -- He's Mine!
	Ach(6555), -- Building a Team
	Ach(6556):Pet(), -- Going to Need More Traps
	Ach(6557), -- Master Pet Hunter
	Ach(6558), -- Local Pet Mauler
	Ach(6559), -- Traveling Pet Mauler
	Ach(6560), -- World Pet Mauler
	Ach(6566):Pet(), -- Just a Pup
	Ach(6567), -- Growing Up
	Ach(6568), -- Time for a Leash
	Ach(6569), -- Old Timer
	Ach(6570), -- All Growns Up!
	Ach(6571), -- That Was Close!
	Ach(6578), -- Pro Pet Group
	Ach(6579), -- Rookie Pet Group
	Ach(6580), -- Rookie Pet Crew
	Ach(6581):Pet(), -- Pro Pet Crew
	Ach(6582):Pet(), -- Pro Pet Mob
	Ach(6583), -- Rookie Pet Mob
	Ach(6584), -- Big City Pet Brawlin' - Alliance
	Ach(6585), -- Kalimdor Safari
	Ach(6586), -- Eastern Kingdoms Safari
	Ach(6587), -- Outland Safari
	Ach(6588), -- Northrend Safari
	Ach(6589), -- Pandaria Safari
	Ach(6590):Title(), -- World Safari
	Ach(6591), -- Grand Master Pet Battler
	Ach(6592), -- Legendary Pet Battler
	Ach(6593), -- Experienced Pet Battler
	Ach(6594), -- Cat Fight!
	Ach(6595):IsPvP(), -- Pet Brawler
	Ach(6596):IsPvP(), -- Experienced Pet Brawler
	Ach(6597):IsPvP(), -- Master Pet Brawler
	Ach(6598):IsPvP(), -- Grand Master Pet Brawler
	Ach(6599):IsPvP(), -- Legendary Pet Brawler
	Ach(6600), -- Ultimate Trainer
	Ach(6601), -- Taming the Wild
	Ach(6602):Pet():AutoFactionSplit(faction.Horde, 6603), -- Taming Kalimdor / Taming Eastern Kingdoms
	Ach(6604):Pet(), -- Taming Outland
	Ach(6605):Pet(), -- Taming Northrend
	Ach(6606):Pet(), -- Taming Pandaria
	Ach(6607):Title(), -- Taming Azeroth
	Ach(6608), -- Family Reunion
	Ach(6609), -- No Favorites
	Ach(6610), -- All Pets Allowed
	Ach(6611), -- Continental Tamer
	Ach(6612), -- Kalimdor Tamer
	Ach(6613), -- Eastern Kingdoms Tamer
	Ach(6614), -- Outland Tamer
	Ach(6615), -- Northrend Tamer
	Ach(6616), -- Pandaria Tamer
	Ach(6618), -- On A Roll
	Ach(6619), -- Win Streak
	Ach(6620):IsPvP(), -- No Time To Heal
	Ach(6621), -- Big City Pet Brawlin' - Horde
	Ach(6622), -- Big City Pet Brawler
	Ach(6671), -- Seeds of Doubt
	Ach(6674), -- Anything You Can Do, I Can Do Better...
	Ach(6683), -- Less Than Three
	Ach(6684), -- Humane Society
	Ach(6686), -- Straight Six
	Ach(6687), -- Getting Hot In Here
	Ach(6688), -- Where's My Air Support?
	Ach(6689), -- Terrace of Endless Spring
	Ach(6713), -- Quarrelsome Quilen Quintet
	Ach(6715), -- Polyformic Acid Science
	Ach(6716), -- Between a Saurok and a Hard Place
	Ach(6717), -- Power Overwhelming
	Ach(6718), -- The Dread Approach
	Ach(6719), -- Heroic: Stone Guard
	Ach(6720), -- Heroic: Feng the Accursed
	Ach(6721), -- Heroic: Gara'jal the Spiritbinder
	Ach(6722), -- Heroic: Four Kings
	Ach(6723), -- Heroic: Elegon
	Ach(6724):Title(), -- Heroic: Will of the Emperor
	Ach(6725), -- Heroic: Imperial Vizier Zor'lok
	Ach(6726), -- Heroic: Blade Lord Ta'yak
	Ach(6727), -- Heroic: Garalon
	Ach(6728), -- Heroic: Wind Lord Mel'jarak
	Ach(6729), -- Heroic: Amber-Shaper Un'sok
	Ach(6730), -- Heroic: Grand Empress Shek'zeer
	Ach(6731), -- Heroic: Protectors of the Endless
	Ach(6732), -- Heroic: Tsulong
	Ach(6733), -- Heroic: Lei Shi
	Ach(6734):Title(), -- Heroic: Sha of Fear
	Ach(6736), -- What Does This Button Do?
	Ach(6739):IsPvP(), -- Silvershard Mines Victory
	Ach(6740):IsPvP(), -- Temple of Kotmogu Victory
	Ach(6741):PvP(11), -- Cataclysmic Gladiator's Twilight Drake
	Ach(6742):Title(), -- 60 Exalted Reputations
	Ach(6743):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Druid (Legacy)
	Ach(6744):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Paladin (Legacy)
	Ach(6745):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Priest (Legacy)
	Ach(6746):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Warlock (Legacy)
	Ach(6747):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Hunter (Legacy)
	Ach(6748):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Death Knight (Legacy)
	Ach(6749):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Mage (Legacy)
	Ach(6750):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Warrior (Legacy)
	Ach(6751):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Rogue (Legacy)
	Ach(6752):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Monk (Legacy)
	Ach(6753), -- Got My Mind On My Money
	Ach(6754), -- The Dark Heart of the Mogu
	Ach(6755), -- Mogu'shan Palace
	Ach(6756), -- Heroic: Mogu'shan Palace
	Ach(6757), -- Temple of the Jade Serpent
	Ach(6758), -- Heroic: Temple of the Jade Serpent
	Ach(6759), -- Heroic: Gate of the Setting Sun
	Ach(6760), -- Heroic: Scarlet Halls
	Ach(6761), -- Heroic: Scarlet Monastery
	Ach(6762), -- Heroic: Scholomance
	Ach(6763), -- Heroic: Siege of Niuzao Temple
	Ach(6821), -- School's Out Forever
	Ach(6822), -- Run with the Wind
	Ach(6823), -- Must Love Dogs
	Ach(6824), -- Face Clutchers
	Ach(6825), -- The Mind-Killer
	Ach(6826), -- 55 Exalted Reputations
	Ach(6827):Mount():AutoFactionSplit(faction.Horde, 6828), -- Pandaren Ambassador
	Ach(6829):IsRealmFirst():Obtainable("Once"), -- Realm First! Pandaren Ambassador
	Ach(6830), -- Professional Zen Master
	Ach(6835), -- Working For a Living
	Ach(6836):Obtainable("Before", "Version", {8, 0, 1}), -- Serious Skills to Pay the Bills
	Ach(6837), -- Zen Master Archaeologist
	Ach(6838):Obtainable("Before", "Version", {8, 0, 1}), -- Zen Master Medic
	Ach(6839), -- Zen Master Fisherman
	Ach(6844), -- The Vault of Mysteries
	Ach(6845), -- Nightmare of Shek'zeer
	Ach(6846), -- Fish Tales
	Ach(6847), -- The Song of the Yaungol
	Ach(6848), -- Collector's Edition: Lucky Quilen Cub
	Ach(6849), -- Collector's Edition: Imperial Quilen
	Ach(6850), -- Hozen in the Mist
	Ach(6851), -- Take 'Em All On!
	Ach(6855), -- The Seven Burdens of Shaohao
	Ach(6856), -- Ballad of Liu Lang
	Ach(6857), -- Heart of the Mantid Swarm
	Ach(6858), -- What Is Worth Fighting For
	Ach(6859):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Alchemist
	Ach(6860):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Blacksmith
	Ach(6861):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Cook
	Ach(6862):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Enchanter
	Ach(6863):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Engineer
	Ach(6864):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Medic
	Ach(6865):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Angler
	Ach(6866):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Herbalist
	Ach(6867):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Scribe
	Ach(6868):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Jewelcrafter
	Ach(6869):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Leatherworker
	Ach(6870):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Miner
	Ach(6871):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Skinner
	Ach(6872):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Tailor
	Ach(6873):IsRealmFirst():Obtainable("Once"), -- Realm First! Zen Master Archaeologist
	Ach(6874):Title():AutoFactionSplit(faction.Alliance, 7509), -- Scenaturday
	Ach(6882):IsPvP(), -- Temple of Kotmogu Veteran
	Ach(6883):IsPvP(), -- Silvershard Mines Veteran
	Ach(6884):Obtainable("Before", "Version", {6, 0, 2}), -- Temple of the Jade Serpent Challenger
	Ach(6885):Obtainable("Before", "Version", {6, 0, 2}), -- Temple of the Jade Serpent: Bronze
	Ach(6886):Obtainable("Before", "Version", {6, 0, 2}), -- Temple of the Jade Serpent: Silver
	Ach(6887):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Temple of the Jade Serpent: Gold
	Ach(6888):Obtainable("Before", "Version", {6, 0, 2}), -- Stormstout Brewery Challenger
	Ach(6889):Obtainable("Before", "Version", {6, 0, 2}), -- Stormstout Brewery: Bronze
	Ach(6890):Obtainable("Before", "Version", {6, 0, 2}), -- Stormstout Brewery: Silver
	Ach(6891):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Stormstout Brewery: Gold
	Ach(6892):Obtainable("Before", "Version", {6, 0, 2}), -- Mogu'shan Palace Challenger
	Ach(6893):Obtainable("Before", "Version", {6, 0, 2}), -- Shado-Pan Monastery Challenger
	Ach(6894):Obtainable("Before", "Version", {6, 0, 2}), -- Gate of the Setting Sun Challenger
	Ach(6895):Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Halls Challenger
	Ach(6896):Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Monastery Challenger
	Ach(6897):Obtainable("Before", "Version", {6, 0, 2}), -- Scholomance Challenger
	Ach(6898):Obtainable("Before", "Version", {6, 0, 2}), -- Siege of Niuzao Temple Challenger
	Ach(6899):Obtainable("Before", "Version", {6, 0, 2}), -- Mogu'shan Palace: Bronze
	Ach(6900):Obtainable("Before", "Version", {6, 0, 2}), -- Mogu'shan Palace: Silver
	Ach(6901):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Mogu'shan Palace: Gold
	Ach(6902):Obtainable("Before", "Version", {6, 0, 2}), -- Shado-Pan Monastery: Bronze
	Ach(6903):Obtainable("Before", "Version", {6, 0, 2}), -- Shado-Pan Monastery: Silver
	Ach(6904):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Shado-Pan Monastery: Gold
	Ach(6905):Obtainable("Before", "Version", {6, 0, 2}), -- Gate of the Setting Sun: Bronze
	Ach(6906):Obtainable("Before", "Version", {6, 0, 2}), -- Gate of the Setting Sun: Silver
	Ach(6907):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Gate of the Setting Sun: Gold
	Ach(6908):Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Halls: Bronze
	Ach(6909):Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Halls: Silver
	Ach(6910):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Halls: Gold
	Ach(6911):Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Monastery: Bronze
	Ach(6912):Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Monastery: Silver
	Ach(6913):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Scarlet Monastery: Gold
	Ach(6914):Obtainable("Before", "Version", {6, 0, 2}), -- Scholomance: Bronze
	Ach(6915):Obtainable("Before", "Version", {6, 0, 2}), -- Scholomance: Silver
	Ach(6916):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Scholomance: Gold
	Ach(6917):Obtainable("Before", "Version", {6, 0, 2}), -- Siege of Niuzao Temple: Bronze
	Ach(6918):Obtainable("Before", "Version", {6, 0, 2}), -- Siege of Niuzao Temple: Silver
	Ach(6919):Teleport():Obtainable("Before", "Version", {6, 0, 2}), -- Siege of Niuzao Temple: Gold
	Ach(6920):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Conqueror
	Ach(6922), -- Timing is Everything
	Ach(6923), -- Brewmoon Festival
	Ach(6924):Obtainable("Before", "Version", {6, 0, 2}), -- 100,000 Valor Points
	Ach(6925), -- Pandaria Dungeon Hero
	Ach(6926):Title(), -- Tranquil Master
	Ach(6927):Mount(), -- Glory of the Pandaria Hero
	Ach(6928), -- Burning Man
	Ach(6929), -- And Stay Dead!
	Ach(6930), -- Yaungolian Barbecue
	Ach(6931), -- Binan Village All-Star
	Ach(6932):Mount(), -- Glory of the Pandaria Raider
	Ach(6933), -- Who's Got Two Green Thumbs?
	Ach(6936), -- Candle in the Wind
	Ach(6937), -- Overzealous
	Ach(6938):PvP(11), -- Cataclysmic Gladiator: Season 11
	Ach(6939):AutoFactionSplit(faction.Alliance, 6940):PvP(11), -- Hero of the Alliance / Horde: Cataclysmic
	Ach(6941):Title():AutoFactionSplit(faction.Horde, 6942):IsPvP(), -- Hero of the Horde / Alliance
	Ach(6943), -- Queuing Spree
	Ach(6945), -- Mantid Swarm
	Ach(6946), -- Empowered Spiritualist
	Ach(6947):IsPvP(), -- Four Square
	Ach(6950):IsPvP(), -- Powerball
	Ach(6969), -- Explore Valley of the Four Winds
	Ach(6970):IsPvP(), -- Blackout
	Ach(6971):IsPvP(), -- I've Got the Power
	Ach(6972):IsPvP(), -- What is Best in Life?
	Ach(6973):IsPvP(), -- Can't Stop Won't Stop
	Ach(6974), -- Pandaria Explorer
	Ach(6975), -- Explore Krasarang Wilds
	Ach(6976), -- Explore Kun-Lai Summit
	Ach(6977), -- Explore Townlong Steppes
	Ach(6978), -- Explore Dread Wastes
	Ach(6979), -- Explore Vale of Eternal Blossoms
	Ach(6980):IsPvP(), -- Temple of Kotmogu All-Star
	Ach(6981):IsPvP(), -- Master of Temple of Kotmogu
	Ach(7039):IsPvP(), -- The Long Riders
	Ach(7049):IsPvP(), -- Mine Cart Courier
	Ach(7056), -- Sorry, Were You Looking for This?
	Ach(7057):IsPvP(), -- End of the Line
	Ach(7062):IsPvP(), -- Mine Mine Mine!
	Ach(7099):IsPvP(), -- Five for Five
	Ach(7100):IsPvP(), -- My Diamonds and Your Rust
	Ach(7102):IsPvP(), -- Escort Service
	Ach(7103):IsPvP(), -- Greed is Good
	Ach(7106):IsPvP(), -- Master of Silvershard Mines
	Ach(7230), -- Legend of the Brewfathers
	Ach(7231), -- Spill No Evil
	Ach(7232), -- The Keg Runner
	Ach(7239), -- Monkey in the Middle
	Ach(7248), -- Monkey See, Monkey Kill
	Ach(7249), -- Unga Ingoo
	Ach(7252), -- A Brewing Storm
	Ach(7257), -- Don't Shake the Keg
	Ach(7258), -- Party of Six
	Ach(7261), -- The Perfect Pour
	Ach(7265), -- Greenstone Village
	Ach(7266), -- Save it for Later
	Ach(7267), -- Perfect Delivery
	Ach(7271), -- Arena of Annihilation
	Ach(7272), -- In the Eye of the Tiger
	Ach(7273), -- Beat the Heat
	Ach(7274), -- Learning from the Best
	Ach(7275), -- It's a Trap!
	Ach(7276), -- Fancy Footwork
	Ach(7281), -- Lost and Found
	Ach(7282), -- Finders Keepers
	Ach(7283), -- One Man's Trash...
	Ach(7284):Title(), -- Is Another Man's Treasure
	Ach(7285), -- Every Day I'm Pand-a-ren
	Ach(7286), -- Finish Them!
	Ach(7287), -- Champion of Chi-Ji
	Ach(7288), -- Yak Attack
	Ach(7289), -- Shadow Hopper
	Ach(7290), -- How To Strain Your Dragon
	Ach(7291), -- In a Trail of Smoke
	Ach(7292), -- Green Acres
	Ach(7293), -- Till the Break of Dawn
	Ach(7294), -- A Taste of Things to Come
	Ach(7295), -- Listen to the Drunk Fish
	Ach(7296), -- Ain't Lost No More
	Ach(7297), -- Proven Strength
	Ach(7298), -- Getting Around with the Shado-Pan
	Ach(7299), -- Loner and a Rebel
	Ach(7300), -- Master of the Grill
	Ach(7301), -- Master of the Wok
	Ach(7302), -- Master of the Pot
	Ach(7303), -- Master of the Steamer
	Ach(7304), -- Master of the Oven
	Ach(7305), -- Master of the Brew
	Ach(7306):Title(), -- Master of Pandaren Cooking
	Ach(7307), -- Silent Assassin
	Ach(7308), -- Know Your Role
	Ach(7309), -- Fire in the Yaung-hole!
	Ach(7310), -- Defender of Gods
	Ach(7312), -- Amber is the Color of My Energy
	Ach(7313), -- Stay Klaxxi
	Ach(7314), -- Test Drive
	Ach(7315):Obtainable("Before", "Version", {5, 4, 0}), -- Eternally in the Vale
	Ach(7316), -- Over Their Heads
	Ach(7317), -- One Many Army
	Ach(7318), -- A Taste of History
	Ach(7319), -- Ready for Raiding III
	Ach(7320), -- Dog Pile
	Ach(7321), -- Spreading the Warmth
	Ach(7322), -- Roll Club
	Ach(7323), -- Collateral Damage
	Ach(7324), -- One Step at a Time
	Ach(7325), -- Now I Am the Master
	Ach(7326), -- The Pandaren Gourmet
	Ach(7327), -- The Pandaren Gourmet
	Ach(7328), -- Ironpaw Chef
	Ach(7329), -- Pandaren Cuisine
	Ach(7330), -- Pandaren Delicacies
	Ach(7331), -- The Three Brew Fathers
	Ach(7332), -- The Broken Hearted
	Ach(7333), -- The Four Celestials
	Ach(7334), -- Instruments of Cruelty
	Ach(7335), -- Symbols of Strength
	Ach(7336), -- Stone Servants
	Ach(7337), -- Documents of a Dark History
	Ach(7338), -- Collector: Pandaren Tea Sets
	Ach(7339), -- Collector: Pandaren Game Boards
	Ach(7340), -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
	Ach(7341), -- Collector: Walking Canes of Brewfather Ren Yun
	Ach(7342), -- Collector: Empty Kegs of Brewfather Xin Wo Yin
	Ach(7343), -- Collector: Carved Bronze Mirrors
	Ach(7344), -- Collector: Gold-Inlaid Porcelain Funerary Figurines
	Ach(7345), -- Collector: Apothecary Tins
	Ach(7346), -- Collector: Pearls of Yu'lon
	Ach(7347), -- Collector: Standards of Niuzao
	Ach(7348), -- Collector: Manacles of Rebellion
	Ach(7349), -- Collector: Cracked Mogu Runestones
	Ach(7350), -- Collector: Terracotta Arms
	Ach(7351), -- Collector: Petrified Bone Whips
	Ach(7352), -- Collector: Thunder King Insignias
	Ach(7353), -- Collector: Edicts of the Thunder King
	Ach(7354), -- Collector: Iron Amulets
	Ach(7355), -- Collector: Warlord's Branding Irons
	Ach(7356), -- Collector: Mogu Coins
	Ach(7357), -- Collector: Worn Monument Ledgers
	Ach(7358), -- Collector: Pandaren Tea Sets
	Ach(7359), -- Collector: Pandaren Game Boards
	Ach(7360), -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
	Ach(7361), -- Collector: Walking Canes of Brewfather Ren Yun
	Ach(7362), -- Collector: Empty Kegs of Brewfather Xin Wo Yin
	Ach(7363), -- Collector: Carved Bronze Mirrors
	Ach(7364), -- Collector: Gold-Inlaid Porcelain Funerary Figurines
	Ach(7365), -- Collector: Apothecary Tins
	Ach(7366), -- Collector: Pearls of Yu'lon
	Ach(7367), -- Collector: Standards of Niuzao
	Ach(7368), -- Collector: Manacles of Rebellion
	Ach(7369), -- Collector: Cracked Mogu Runestones
	Ach(7370), -- Collector: Terracotta Arms
	Ach(7371), -- Collector: Petrified Bone Whips
	Ach(7372), -- Collector: Thunder King Insignias
	Ach(7373), -- Collector: Edicts of the Thunder King
	Ach(7374), -- Collector: Iron Amulets
	Ach(7375), -- Collector: Warlord's Branding Irons
	Ach(7376), -- Collector: Mogu Coins
	Ach(7377), -- Collector: Worn Monument Ledgers
	Ach(7378), -- Jack of All Trades
	Ach(7379), -- Pandaren Master of All
	Ach(7380), -- Double Agent
	Ach(7381), -- Restore Balance
	Ach(7382):Other(), -- Dynamic Duo
	Ach(7383):Other(), -- Terrific Trio
	Ach(7384):Other(), -- Quintessential Quintet
	Ach(7385):Toy(), -- Pub Crawl
	Ach(7386), -- Grand Expedition Yak
	Ach(7410), -- 5000 Daily Quests Completed
	Ach(7411), -- 10000 Daily Quests Completed
	Ach(7412), -- Collector's Edition: Fetish Shaman
	Ach(7413), -- Scarlet Halls
	Ach(7433):Pet(), -- Newbie
	Ach(7436), -- Zen Pet Hunter
	Ach(7437), -- A Worthy Opponent
	Ach(7438), -- Could We Find More Like That?
	Ach(7439), -- Glorious!
	Ach(7462), -- A Rare Catch
	Ach(7463), -- Lots of Rarity
	Ach(7464), -- Quality & Quantity
	Ach(7465), -- An Uncommon Find
	Ach(7467):AutoFactionSplit(faction.Alliance, 7468):Obtainable("Never"), -- Theramore's Fall
	Ach(7479):Title(), -- The Shado-Master
	Ach(7482), -- Trainer Extraordinaire
	Ach(7483), -- Battle Master
	Ach(7485):Obtainable("Before", "Version", {5, 2, 0}), -- Cutting Edge: Will of the Emperor
	Ach(7486):Obtainable("Before", "Version", {5, 2, 0}), -- Cutting Edge: Grand Empress Shek'zeer
	Ach(7487):Obtainable("Before", "Version", {5, 2, 0}), -- Cutting Edge: Sha of Fear
	Ach(7498), -- Taming the Great Outdoors
	Ach(7499):Pet(), -- Taming the World
	Ach(7500):Pet(), -- Going to Need More Leashes
	Ach(7501):Pet(), -- That's a Lot of Pet Food
	Ach(7502), -- Savior of Stoneplow
	Ach(7518), -- Wanderers, Dreamers, and You
	Ach(7520):Title(), -- The Loremaster
	Ach(7521):Pet(), -- Time to Open a Pet Store
	Ach(7522), -- Crypt of Forgotten Kings
	Ach(7523):AutoFactionSplit(faction.Alliance, 7524), -- Theramore's Fall
	Ach(7525):Pet(), -- Taming Cataclysm
	Ach(7526):AutoFactionSplit(faction.Alliance, 7529), -- Kite Fight
	Ach(7527):AutoFactionSplit(faction.Alliance, 7530), -- No Tank You
	Ach(7533):Obtainable("Before", "Version", {6, 0, 2}), -- Chapter I: Trial of the Black Prince
	Ach(7534):AutoFactionSplit(faction.Alliance, 8008):Obtainable("Before", "Version", {6, 0, 2}), -- Chapter II: Wrathion's War
	Ach(7535):Obtainable("Before", "Version", {6, 0, 2}), -- Chapter III: Two Princes
	Ach(7536):Obtainable("Before", "Version", {6, 0, 2}), -- Chapter IV: Celestial Blessings
	Ach(7601):AutoFactionSplit(faction.Alliance, 7602):Obtainable("Event", 324), -- Tricks and Treats of Pandaria
	Ach(7611), -- Pandarian Angler
	Ach(7612):Title(), -- The Seat of Knowledge
	Ach(7614), -- Locking Down the Docks
	Ach(7842), -- Collector's Edition: Baneling
};

KrowiAF.AchievementData["05_01_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 1, 0},
	Ach(7852), -- They're Both Footballs?
	Ach(7853):Obtainable("Never"), -- WoW's 9th Anniversary
	Ach(7860):Mount():AutoFactionSplit(faction.Alliance, 7862), -- We're Going to Need More Saddles
	Ach(7908):Other(), -- I Choose You
	Ach(7928):AutoFactionSplit(faction.Alliance, 7929), -- Operation: Shieldwall Campaign / Dominance Offensive Campaign
	Ach(7932), -- I'm In Your Base, Killing Your Dudes
	Ach(7933), -- And... It's Good!
	Ach(7934):Pet(), -- Raiding with Leashes
	Ach(7936):Pet(), -- Pandaren Spirit Tamer
	Ach(7937):AutoFactionSplit(faction.Alliance, 8020):Obtainable("Before", "Version", {6, 0, 2}), -- You Are Not Your $#*@! Legplates (Season 1)
	Ach(7939):AutoFactionSplit(faction.Horde, 7940):Obtainable("Before", "Version", {6, 0, 2}), -- The Second Rule of Brawler's Guild (Season 1)
	Ach(7941):Title():AutoFactionSplit(faction.Alliance, 7942):Obtainable("Before", "Version", {6, 0, 2}), -- Brawlin' and Shot Callin' (Season 1)
	Ach(7943):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}), -- I'm Your Number One Fan (Season 2)
	Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}), -- Bottle Service (Season 2)
	Ach(7945):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}), -- Haters Gonna Hate (Season 2)
	Ach(7946):AutoFactionSplit(faction.Alliance, 8022):Obtainable("Before", "Version", {6, 0, 2}), -- Now You're Just Showing Off (Season 1)
	Ach(7947):AutoFactionSplit(faction.Alliance, 7948):Obtainable("Before", "Version", {6, 0, 2}), -- The First Rule of Brawler's Guild (Season 1 or 2)
	Ach(7949):AutoFactionSplit(faction.Alliance, 7950):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}), -- Rabble Rabble Rabble (Season 2)
	Ach(7984), -- Watery Grave
	Ach(7986), -- You Mean That Wasn't a Void Zone?
	Ach(7987), -- No Egg Left Behind
	Ach(7988), -- A Little Patience
	Ach(7989), -- Bubbletrapped!
	Ach(7990), -- Cannonballer
	Ach(7991), -- Which Came First?
	Ach(7992), -- I Used To Love Them
	Ach(7993), -- We've Been Dancin'
	Ach(7994), -- Treasure of Pandaria
	Ach(7995), -- Fortune of Pandaria
	Ach(7996), -- Bounty of Pandaria
	Ach(7997), -- Riches of Pandaria
	Ach(8009), -- Dagger in the Dark
	Ach(8010):AutoFactionSplit(faction.Alliance, 8013), -- Lion's Landing / Domination Point
	Ach(8011):AutoFactionSplit(faction.Alliance, 8014), -- Number Five Is Alive
	Ach(8012):AutoFactionSplit(faction.Alliance, 8015), -- Waste Not, Want Not
	Ach(8016), -- Assault on Zan'vess
	Ach(8017), -- For the Swarm
	Ach(8023):Title(), -- Wakener
	Ach(8030):AutoFactionSplit(faction.Alliance, 8031):Obtainable("Before", "Version", {6, 0, 2}), -- A Test of Valor
};

KrowiAF.AchievementData["05_02_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 2, 0},
	Ach(6954):Obtainable("Before", "Version", {5, 2, 0}), -- Ahead of the Curve: Will of the Emperor
	Ach(8028), -- Praise the Sun!
	Ach(8037), -- Genetically Unmodified Organism
	Ach(8038), -- Cretaceous Collector
	Ach(8042):AutoFactionSplit(faction.Alliance, 8043):Obtainable("Event", 341), -- Extinguishing Pandaria
	Ach(8044):AutoFactionSplit(faction.Horde, 8045):Obtainable("Event", 341), -- Flame Keeper / Warden of Pandaria
	Ach(8049), -- The Zandalari Prophecy
	Ach(8050), -- Rumbles of Thunder
	Ach(8051), -- Gods and Monsters
	Ach(8052):Title():AutoFactionSplit(faction.Alliance, 8055):IsPvP(), -- Khan
	Ach(8056), -- Heroic: Jin'rokh the Breaker
	Ach(8057), -- Heroic: Horridon
	Ach(8058), -- Heroic: Council of Elders
	Ach(8059), -- Heroic: Tortos
	Ach(8060), -- Heroic: Megaera
	Ach(8061), -- Heroic: Ji-Kun
	Ach(8062), -- Heroic: Durumu the Forgotten
	Ach(8063), -- Heroic: Primordius
	Ach(8064), -- Heroic: Dark Animus
	Ach(8065), -- Heroic: Iron Qon
	Ach(8066), -- Heroic: Twin Empyreans
	Ach(8067):Title(), -- Heroic: Lei Shen
	Ach(8068), -- Heroic: Ra-den
	Ach(8069), -- Last Stand of the Zandalari
	Ach(8070), -- Forgotten Depths
	Ach(8071), -- Halls of Flesh-Shaping
	Ach(8072), -- Pinnacle of Storms
	Ach(8073), -- Cage Match
	Ach(8077), -- One-Up
	Ach(8078), -- Zul'Again
	Ach(8080):Pet(), -- Fabled Pandaren Tamer
	Ach(8081), -- Ritualist Who?
	Ach(8082), -- Head Case
	Ach(8086), -- From Dusk 'til Dawn
	Ach(8087), -- Can't Touch This
	Ach(8089):Obtainable("Before", "Version", {6, 0, 2}), -- I Thought He Was Supposed to Be Hard?
	Ach(8090), -- A Complete Circuit
	Ach(8092), -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
	Ach(8093):AutoFactionSplit(faction.Horde, 8218):PvP(13), -- Tyrannical Conquest
	Ach(8094), -- Lightning Overload
	Ach(8097), -- Soft Hands
	Ach(8098), -- You Said Crossing the Streams Was Bad
	Ach(8099), -- Isle of Thunder
	Ach(8100), -- Pay to Slay
	Ach(8101), -- It Was Worth Every Ritual Stone
	Ach(8103), -- Champions of Lei Shen
	Ach(8104), -- Thunder Plunder
	Ach(8105), -- The Crumble Bundle
	Ach(8106), -- In the Hall of the Thunder King
	Ach(8107), -- Ready for RAAAAIIIIDDD?!?ing
	Ach(8108), -- When in Ihgaluk, Do as the Skumblade Do
	Ach(8109), -- The Mogu Below-gu
	Ach(8110), -- These Mogu Have Gotta Go-gu
	Ach(8111), -- This Isn't Even My Final Form
	Ach(8112), -- Blue Response
	Ach(8114), -- Platform Hero
	Ach(8115), -- Speed Metal
	Ach(8116), -- You Made Me Bleed My Own Blood
	Ach(8117), -- For the Ward!
	Ach(8118), -- Boop
	Ach(8119), -- Our Powers Combined
	Ach(8120), -- Direhorn in a China Shop
	Ach(8121):Title(), -- Stormbreaker
	Ach(8123), -- Millions of Years of Evolution vs. My Fist
	Ach(8124):Mount(), -- Glory of the Thundering Raider
	Ach(8205):AutoFactionSplit(faction.Alliance, 8206), -- Operation: Shieldwall / Dominance Offensive
	Ach(8208):AutoFactionSplit(faction.Alliance, 8209), -- Kirin Tor Offensive / Sunreaver Onslaught
	Ach(8210), -- Shado-Pan Assault
	Ach(8212), -- Zandalari Library Card
	Ach(8213):Obtainable("Before", "Date", {2019, 6, 11}), -- Friends In Places Higher Yet
	Ach(8214):Title():PvP(12), -- Malevolent Gladiator: Season 12 (3v3)
	Ach(8216):PvP(12), -- Malevolent Gladiator's Cloud Serpent
	Ach(8219), -- History of the Mantid
	Ach(8220), -- Collector: Banners of the Mantid Empire
	Ach(8221), -- Collector: Banners of the Mantid Empire
	Ach(8222), -- Collector: Ancient Sap Feeders
	Ach(8223), -- Collector: Ancient Sap Feeders
	Ach(8224), -- Collector: Praying Mantids
	Ach(8225), -- Collector: Praying Mantids
	Ach(8226), -- Collector: Inert Sound Beacons
	Ach(8227), -- Collector: Inert Sound Beacons
	Ach(8228), -- Collector: Remains of Paragons
	Ach(8229), -- Collector: Remains of Paragons
	Ach(8230), -- Collector: Mantid Lamps
	Ach(8231), -- Collector: Mantid Lamps
	Ach(8232), -- Collector: Pollen Collectors
	Ach(8233), -- Collector: Pollen Collectors
	Ach(8234), -- Collector: Kypari Sap Containers
	Ach(8235), -- Collector: Kypari Sap Containers
	Ach(8238):Obtainable("Before", "Version", {5, 4, 0}), -- Cutting Edge: Lei Shen
	Ach(8243):AutoFactionSplit(faction.Alliance, 8244):PvP(12), -- Hero of the Alliance / Horde: Malevolent
	Ach(8246):Obtainable("Before", "Version", {5, 2, 0}), -- Ahead of the Curve: Grand Empress Shek'zeer
	Ach(8248):Obtainable("Before", "Version", {5, 2, 0}), -- Ahead of the Curve: Sha of Fear
	Ach(8249):Obtainable("Before", "Version", {5, 4, 0}), -- Ahead of the Curve: Lei Shen
	Ach(8260):Obtainable("Before", "Version", {5, 4, 0}), -- Cutting Edge: Ra-den
};

KrowiAF.AchievementData["05_03_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 3, 0},
	Ach(8293):Pet(), -- Raiding with Leashes II: Attunement Edition
	Ach(8294), -- The Secrets of Ragefire
	Ach(8295), -- The Few, the Proud, the Gob Squad
	Ach(8297):IsPvP(), -- Merciless Pet Brawler
	Ach(8298):IsPvP(), -- Vengeful Pet Brawler
	Ach(8300):Pet():IsPvP(), -- Brutal Pet Brawler
	Ach(8301):Title():IsPvP(), -- Deadly Pet Brawler
	Ach(8302):Mount():AutoFactionSplit(faction.Horde, 8304), -- Mount Parade
	Ach(8306):Title():AutoFactionSplit(faction.Alliance, 8307):Obtainable("Before", "Version", {5, 4, 0}), -- Hordebreaker / Darkspear Revolutionary
	Ach(8310), -- Heroic: A Brewing Storm
	Ach(8311), -- Heroic: Crypt of Forgotten Kings
	Ach(8312), -- Heroic: Blood in the Snow
	Ach(8314):AutoFactionSplit(faction.Alliance, 8315), -- Battle on the High Seas
	Ach(8316), -- Blood in the Snow
	Ach(8317), -- Dark Heart of Pandaria
	Ach(8318), -- Heroic: Dark Heart of Pandaria
	Ach(8319), -- Accelerated Archaeology
	Ach(8325):Title():Obtainable("Before", "Version", {6, 0, 2}), -- Chapter V: Judgment of the Black Prince
	Ach(8327), -- Heroic: The Secrets of Ragefire
	Ach(8329), -- Heed the Weed
	Ach(8330), -- Hekima's Heal-Halter
	Ach(8331):IsPvP(), -- Deepwind Gorge Victory
	Ach(8332):IsPvP(), -- Deepwind Gorge Veteran
	Ach(8333):IsPvP(), -- Deepwind Gorge Perfection
	Ach(8335):AutoFactionSplit(faction.Alliance, 8337):Obtainable("Before", "Version", {6, 0, 2}), -- Having a Brawl (Season 1)
	Ach(8336):AutoFactionSplit(faction.Alliance, 8338):Obtainable("Before", "Version", {6, 0, 2}), -- I've Got the Biggest Brawls of Them All (Season 1)
	Ach(8339):AutoFactionSplit(faction.Alliance, 8342):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}), -- Collect Your Deck (Season 2)
	Ach(8340):AutoFactionSplit(faction.Alliance, 8343):Obtainable("Before", "Version", {6, 0, 2}), -- Deck Your Collection (Season 1)
	Ach(8345), -- Hearthstoned
	Ach(8347), -- Keep those Bombs Away! (From Me)
	Ach(8348):Pet(), -- The Longest Day
	Ach(8350):IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Mine! Mine! Mine!
	Ach(8351):IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Other People's Property
	Ach(8354):IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Puddle Jumper
	Ach(8355):IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Weighed Down
	Ach(8358):IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Deepwind Gorge All-Star
	Ach(8359):IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Capping Spree
	Ach(8360):Title():IsPvP():Obtainable("Before", "Version", {8, 3, 0}), -- Master of Deepwind Gorge
	Ach(8364):AutoFactionSplit(faction.Alliance, 8366), -- Heroic: Battle on the High Seas
	Ach(8368), -- Fight Anger with Anger
	Ach(8391):IsPvP():Obtainable("From", "Date", {2013, 6, 18}, "Until", "Date", {2013, 8, 27}), -- Tournament Participation 2013
	Ach(8392):Title():IsPvP():Obtainable("From", "Date", {2013, 6, 18}, "Until", "Date", {2013, 8, 27}), -- Tournament Glory 2013
};

KrowiAF.AchievementData["05_04_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 4, 0},
	Ach(8381):AutoFactionSplit(faction.Horde, 8382):PvP(14), -- Grievous Conquest
	Ach(8397):Title(), -- Crazy for Cats
	Ach(8398):Mount():Obtainable("Before", "Version", {6, 0, 2}), -- Ahead of the Curve: Garrosh Hellscream (10 player)
	Ach(8399):Mount():Obtainable("Before", "Version", {6, 0, 2}), -- Ahead of the Curve: Garrosh Hellscream (25 player)
	Ach(8400):Obtainable("Before", "Version", {6, 0, 2}), -- Cutting Edge: Garrosh Hellscream (10 player)
	Ach(8401):Obtainable("Before", "Version", {6, 0, 2}), -- Cutting Edge: Garrosh Hellscream (25 player)
	Ach(8410), -- The Celestial Tournament
	Ach(8430):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Temple of the Jade Serpent
	Ach(8431):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Stormstout Brewery
	Ach(8432):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Shado-Pan Monastery
	Ach(8433):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Mogu'shan Palace
	Ach(8434):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Gate of the Setting Sun
	Ach(8436):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Scarlet Halls
	Ach(8437):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Scarlet Monastery
	Ach(8438):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Scholomance
	Ach(8439):Obtainable("Before", "Version", {6, 0, 2}), -- Challenge Master: Siege of Niuzao Temple
	Ach(8448), -- Gamon Will Save Us!
	Ach(8450):AutoFactionSplit(faction.Horde, 8451):PvP(15), -- Prideful Conquest
	Ach(8453), -- Rescue Raiders
	Ach(8454):Mount(), -- Glory of the Orgrimmar Raider
	Ach(8458), -- Vale of Eternal Sorrows
	Ach(8459), -- Gates of Retribution
	Ach(8461), -- The Underhold
	Ach(8462), -- Downfall
	Ach(8463), -- Mythic: Immerseus
	Ach(8465), -- Mythic: Fallen Protectors
	Ach(8466), -- Mythic: Norushen
	Ach(8467), -- Mythic: Sha of Pride
	Ach(8468), -- Mythic: Galakras
	Ach(8469), -- Mythic: Iron Juggernaut
	Ach(8470), -- Mythic: Kor'kron Dark Shaman
	Ach(8471), -- Mythic: General Nazgrim
	Ach(8472), -- Mythic: Malkorok
	Ach(8478), -- Mythic: Spoils of Pandaria
	Ach(8479), -- Mythic: Thok the Bloodthirsty
	Ach(8480), -- Mythic: Siegecrafter Blackfuse
	Ach(8481), -- Mythic: Paragons of the Klaxxi
	Ach(8482):Title(), -- Mythic: Garrosh Hellscream
	Ach(8484):Mount():AutoFactionSplit(faction.Horde, 8485):PvP(14), -- Grievous Combatant
	Ach(8486):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Bronze Damage (Level 90)
	Ach(8487):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Bronze Tank (Level 90)
	Ach(8488):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Bronze Healer (Level 90)
	Ach(8491):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Silver Damage (Level 90)
	Ach(8492):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Silver Tank (Level 90)
	Ach(8493):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Silver Healer (Level 90)
	Ach(8496):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Gold Damage (Level 90)
	Ach(8497):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Gold Tank (Level 90)
	Ach(8498):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Gold Healer (Level 90)
	Ach(8501):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
	Ach(8502):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
	Ach(8503):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
	Ach(8504):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
	Ach(8505):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
	Ach(8506):Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
	Ach(8507):Title():Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
	Ach(8508):Title():Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
	Ach(8509):Title():Obtainable("Before", "Version", {6, 0, 2}), -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
	Ach(8518), -- Master of the Masters
	Ach(8519), -- Celestial Family
	Ach(8520), -- Fire in the Hole!
	Ach(8521), -- Swallow Your Pride
	Ach(8527), -- Giant Dinosaur vs. Mega Snail
	Ach(8528), -- Go Long
	Ach(8529), -- Criss Cross
	Ach(8530), -- The Immortal Vanguard
	Ach(8531), -- Now We are the Paragon
	Ach(8532), -- None Shall Pass
	Ach(8533), -- Ordos
	Ach(8535), -- Celestial Challenge
	Ach(8536), -- No More Tears
	Ach(8537), -- Strike!
	Ach(8538), -- Unlimited Potential
	Ach(8543), -- Lasers and Magnets and Drills! Oh My!
	Ach(8641):Mount():AutoFactionSplit(faction.Horde, 8642):PvP(15), -- Prideful Combatant
	Ach(8643):Title():PvP(14), -- Grievous Gladiator: Season 14 (3v3)
	Ach(8644):Title():PvP(14), -- Gladiator: Season 14 (3v3)
	Ach(8645):Title():PvP(14), -- Duelist: Season 14
	Ach(8646):Title():PvP(14), -- Rival: Season 14
	Ach(8649):Title():PvP(14), -- Challenger: Season 14
	Ach(8652):AutoFactionSplit(faction.Alliance, 8653):PvP(13), -- Hero of the Alliance / Horde: Tyrannical
	Ach(8654):AutoFactionSplit(faction.Alliance, 8657):PvP(14), -- Hero of the Alliance / Horde: Grievous
	Ach(8658):AutoFactionSplit(faction.Alliance, 8659):PvP(15), -- Hero of the Alliance / Horde: Prideful
	Ach(8666):Title():PvP(15), -- Prideful Gladiator: Season 15 (3v3)
	Ach(8667):Title():PvP(15), -- Gladiator: Season 15 (3v3)
	Ach(8668):Title():PvP(15), -- Duelist: Season 15
	Ach(8669):Title():PvP(15), -- Rival: Season 15
	Ach(8670):Title():PvP(15), -- Challenger: Season 15
	Ach(8678):PvP(13), -- Tyrannical Gladiator's Cloud Serpent
	Ach(8679):Title():AutoFactionSplit(faction.Alliance, 8680), -- Conqueror / Liberator of Orgrimmar
	Ach(8697):Obtainable("Before", "Version", {6, 0, 2}), -- You're Doing it Wrong (Level 90)
	Ach(8698), -- Crashin' Thrashin' Flyer
	Ach(8699):Obtainable("Event", 141), -- The Danger Zone
	Ach(8705):PvP(14), -- Grievous Gladiator's Cloud Serpent
	Ach(8707):PvP(15), -- Prideful Gladiator's Cloud Serpent
	Ach(8712), -- Killing Time
	Ach(8714), -- Timeless Champion
	Ach(8715), -- Emperor Shaohao
	Ach(8716), -- Emissary of Ordos
	Ach(8717):IsPvP(), -- Candlekeeper
	Ach(8718):IsPvP(), -- Oathguard
	Ach(8719):IsPvP(), -- Blazebinder
	Ach(8720):IsPvP(), -- Kilnmaster
	Ach(8721):Title():IsPvP(), -- Fire-Watcher
	Ach(8722), -- Timeless Nutriment
	Ach(8723), -- Legend of the Past
	Ach(8724), -- Pilgrimage
	Ach(8725), -- Eyes On The Ground
	Ach(8726), -- Extreme Treasure Hunter
	Ach(8727), -- Where There's Pirates, There's Booty
	Ach(8728), -- Going To Need A Bigger Bag
	Ach(8729), -- Treasure, Treasure Everywhere
	Ach(8730), -- Rolo's Riddle
	Ach(8743), -- Zarhym Altogether
	Ach(8784), -- Timeless Legends
	Ach(8791):Title():PvP(13), -- Tyrannical Gladiator: Season 13 (3v3)
};

KrowiAF.AchievementData["05_04_01"] = {
	{KrowiAF.SetAchievementPatch, 5, 4, 1},
	Ach(8793), -- Murkalot
	Ach(8794):Obtainable("Before", "Date", {2019, 6, 11}), -- Friends In Places Even Higher Than That
};

KrowiAF.AchievementData["05_04_02"] = {
	{KrowiAF.SetAchievementPatch, 5, 4, 2},
	Ach(8795), -- Collector's Edition: Treasure Goblin
};

KrowiAF.AchievementData["05_05_00"] = {
	{KrowiAF.SetAchievementPatch, 5, 5, 0},
	Ach(8913), -- Collector's Edition: Dread Raven
	Ach(8915), -- Collector's Edition: Dread Hatchling
	Ach(42762):Title():PvP(12), -- Challenger: Season 12
	Ach(42763):Title():PvP(12), -- Duelist: Season 12
	Ach(42764):Title():PvP(12), -- Rival: Season 12
	Ach(42765):Title():PvP(12), -- Gladiator: Season 12 (3v3)
	Ach(42772):Title():PvP(11), -- Rival: Season 11
	Ach(42774):Title():PvP(11), -- Duelist: Season 11
	Ach(42775):Title():PvP(11), -- Challenger: Season 11
	Ach(42777):Title():PvP(11), -- Gladiator: Season 11
	Ach(60892), -- Celestial: Temple of the Jade Serpent
	Ach(60893), -- Celestial: Stormstout Brewery
	Ach(60894), -- Celestial: Mogu'shan Palace
	Ach(60895), -- Celestial: Shado-Pan Monastery
	Ach(60896), -- Celestial: Gate of the Setting Sun
	Ach(60897), -- Celestial: Scarlet Halls
	Ach(60898), -- Celestial: Scarlet Monastery
	Ach(60899), -- Celestial: Scholomance
	Ach(60900), -- Celestial: Siege of Niuzao Temple
	Ach(60901), -- Pandaria Celestial Hero
};

KrowiAF.AchievementData["05_05_01"] = {
	{KrowiAF.SetAchievementPatch, 5, 5, 1},
	Ach(61096):Title():PvP(13), -- Gladiator: Season 13 (3v3)
	Ach(61097):Title():PvP(13), -- Duelist: Season 13
	Ach(61098):Title():PvP(13), -- Challenger: Season 13
	Ach(61099):Title():PvP(13), -- Rival: Season 13
	Ach(61350):Title():PvP(12), -- Gladiator: Season 12 (2v2)
	Ach(61351):Title():PvP(13), -- Gladiator: Season 13 (2v2)
	Ach(61352):Title():PvP(14), -- Gladiator: Season 14 (2v2)
	Ach(61353):Title():PvP(15), -- Gladiator: Season 15 (2v2)
	Ach(61354):Title():PvP(12), -- Malevolent Gladiator: Season 12 (2v2)
	Ach(61355):Title():PvP(13), -- Tyrannical Gladiator: Season 13 (2v2)
	Ach(61356):Title():PvP(14), -- Grievous Gladiator: Season 14 (2v2)
	Ach(61357):Title():PvP(15), -- Prideful Gladiator: Season 15 (2v2)
	Ach(61358):Title():PvP(12), -- Gladiator: Season 12 (5v5)
	Ach(61359):Title():PvP(13), -- Gladiator: Season 13 (5v5)
	Ach(61360):Title():PvP(14), -- Gladiator: Season 14 (5v5)
	Ach(61361):Title():PvP(15), -- Gladiator: Season 15 (5v5)
	Ach(61362):Title():PvP(12), -- Malevolent Gladiator: Season 12 (5v5)
	Ach(61363):Title():PvP(13), -- Tyrannical Gladiator: Season 13 (5v5)
	Ach(61364):Title():PvP(14), -- Grievous Gladiator: Season 14 (5v5)
	Ach(61365):Title():PvP(15), -- Prideful Gladiator: Season 15 (5v5)
	Ach(61415):Title():PvP(12), -- Undisputed Gladiator: Season 12
	Ach(61416):Title():PvP(13), -- Undisputed Gladiator: Season 13
	Ach(61417):Title():PvP(14), -- Undisputed Gladiator: Season 14
	Ach(61418):Title():PvP(15), -- Undisputed Gladiator: Season 15
	Ach(61459):AutoFactionSplit(faction.Horde, 61460):PvP(12), -- Malevolent Conquest
};

KrowiAF.AchievementData["05_05_03"] = {
	{KrowiAF.SetAchievementPatch, 5, 5, 3},
	Ach(40821), -- Successfully Stress Test CN Realms
	Ach(61962):Title(), -- Realm First! Challenge Conqueror: Platinum (Season 2)
	Ach(61963):Title(), -- Realm First! Challenge Conqueror: Platinum (Season 3)
	Ach(61967):Transmog(), -- Temple of the Jade Serpent: Platinum
	Ach(61968):Toy(), -- Stormstout Brewery: Platinum
	Ach(61969):Toy(), -- Mogu'shan Palace: Platinum
	Ach(61970):Toy(), -- Shado-Pan Monastery: Platinum
	Ach(61971):Toy(), -- Gate of the Setting Sun: Platinum
	Ach(61972):Toy(), -- Scarlet Halls: Platinum
	Ach(61973):Toy(), -- Scarlet Monastery: Platinum
	Ach(61974):Toy(), -- Scholomance: Platinum
	Ach(61975):Toy(), -- Siege of Niuzao Temple: Platinum
	Ach(61987):NotCategorized(), -- Challenge Conqueror: Platinum (Season 1)
	Ach(61990):NotCategorized(), -- Challenge Conqueror: Platinum (Season 2)
	Ach(61991):NotCategorized(), -- Challenge Conqueror: Platinum (Season 3)
	Ach(62055):Mount(), -- The Mistwalker
	Ach(62059):Mount(), -- Mistborne
	Ach(62060):Title(), -- Heir to the Mist
	Ach(62399):Mount(), -- The Mistwalker
};
