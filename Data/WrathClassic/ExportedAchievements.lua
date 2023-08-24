-- [[ Exported at 2023-08-24 13-34-02 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local f = objects.Faction;
local a = objects.Achievement;
local data = addon.Data;
local custObj = data.CustomObjectives;
data.ExportedAchievements = {};
local exportedAchievements = data.ExportedAchievements;

local function T(v, ...)
    v:AddTransmogSet(...)
end

local function O(v, ...)
    v:SetTemporaryObtainable(...)
end

local t, u;
local workload = {
    function() t[18688] = a:New(18688, f.Horde); end, -- Defense Protocol Beta: Terminated
    function() t[18678] = a:New(18678, f.Horde); end, -- Defense Protocol Beta: Trial of the Champion
    function() t[18677] = a:New(18677, f.Alliance); end, -- Defense Protocol Beta: Trial of the Champion
    function() t[18614] = a:New(18614, f.Alliance); end, -- Defense Protocol Beta: Terminated
    function() t[18601] = a:New(18601); end, -- Defense Protocol Beta: The Culling of Stratholme
    function() t[18600] = a:New(18600); end, -- Defense Protocol Beta: Utgarde Pinnacle
    function() t[18599] = a:New(18599); end, -- Defense Protocol Beta: The Oculus
    function() t[18598] = a:New(18598); end, -- Defense Protocol Beta: Halls of Lightning
    function() t[18597] = a:New(18597); end, -- Defense Protocol Beta: Halls of Stone
    function() t[18596] = a:New(18596); end, -- Defense Protocol Beta: Gundrak
    function() t[18595] = a:New(18595); end, -- Defense Protocol Beta: The Violet Hold
    function() t[18594] = a:New(18594); end, -- Defense Protocol Beta: Drak'Tharon Keep
    function() t[18593] = a:New(18593); end, -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
    function() t[18592] = a:New(18592); end, -- Defense Protocol Beta: Azjol-Nerub
    function() t[18591] = a:New(18591); end, -- Defense Protocol Beta: The Nexus
    function() t[18590] = a:New(18590); end, -- Defense Protocol Beta: Utgarde Keep
    function() t[17341] = a:New(17341); end, -- Cutting Edge: Ulduar
    function() t[17340] = a:New(17340); end, -- Ahead of the Curve: Yogg-Saron
    function() t[17304] = a:New(17304); end, -- Defense Protocol Alpha: Terminated
    function() t[17302] = a:New(17302); end, -- Defense Protocol Alpha: The Culling of Stratholme
    function() t[17301] = a:New(17301); end, -- Defense Protocol Alpha: Utgarde Pinnacle
    function() t[17300] = a:New(17300); end, -- Defense Protocol Alpha: The Oculus
    function() t[17299] = a:New(17299); end, -- Defense Protocol Alpha: Halls of Lightning
    function() t[17297] = a:New(17297); end, -- Defense Protocol Alpha: Halls of Stone
    function() t[17295] = a:New(17295); end, -- Defense Protocol Alpha: Gundrak
    function() t[17293] = a:New(17293); end, -- Defense Protocol Alpha: The Violet Hold
    function() t[17292] = a:New(17292); end, -- Defense Protocol Alpha: Drak'Tharon Keep
    function() t[17291] = a:New(17291); end, -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
    function() t[17285] = a:New(17285); end, -- Defense Protocol Alpha: Azjol-Nerub
    function() t[17283] = a:New(17283); end, -- Defense Protocol Alpha: The Nexus
    function() t[17213] = a:New(17213); end, -- Defense Protocol Alpha: Utgarde Keep
    function() O(t[16433], "Never"); end,
    function() t[16433] = a:New(16433); end, -- Soul of Iron (Season of Mastery)
    function() t[16332] = a:New(16332); end, -- The Perfect Pebble
    function() O(t[15637], "Never"); end,
    function() t[15637] = a:New(15637); end, -- The Immortal (Season of Mastery)
    function() O(t[15335], "Never"); end,
    function() t[15335] = a:New(15335); end, -- Survivor of the Damned (Season of Mastery)
    function() O(t[15334], "Never"); end,
    function() t[15334] = a:New(15334); end, -- Survivor of the Old God (Season of Mastery)
    function() O(t[15333], "Never"); end,
    function() t[15333] = a:New(15333); end, -- Survivor of the Shadow Flame (Season of Mastery)
    function() O(t[15330], "Never"); end,
    function() t[15330] = a:New(15330); end, -- Survivor of the Firelord (Season of Mastery)
    function() t[4824] = a:New(4824); end, -- Collector's Edition: Mini Thor
    function() t[4818] = a:New(4818); end, -- Heroic: The Twilight Destroyer (10 player)
    function() t[4817] = a:New(4817); end, -- The Twilight Destroyer (10 player)
    function() t[4816] = a:New(4816); end, -- Heroic: The Twilight Destroyer (25 player)
    function() t[4815] = a:New(4815); end, -- The Twilight Destroyer (25 player)
    function() O(t[4790], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[4790] = a:New(4790, f.Horde); end, -- Zalazane's Fall
    function() O(t[4786], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[4786] = a:New(4786, f.Alliance); end, -- Operation: Gnomeregan
    function() O(t[4785], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[4785] = a:New(4785, f.Horde); end, -- Emblematic
    function() O(t[4784], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[4784] = a:New(4784, f.Alliance); end, -- Emblematic
    function() O(t[4782]); end,
    function() t[4782] = a:New(4782); end, -- Green Brewfest Stein
    function() t[4637] = a:New(4637); end, -- Heroic: Fall of the Lich King (25 player)
    function() t[4636] = a:New(4636); end, -- Heroic: Fall of the Lich King (10 player)
    function() t[4635] = a:New(4635); end, -- Heroic: The Frostwing Halls (25 player)
    function() t[4634] = a:New(4634); end, -- Heroic: The Crimson Hall (25 player)
    function() t[4633] = a:New(4633); end, -- Heroic: The Plagueworks (25 player)
    function() t[4632] = a:New(4632); end, -- Heroic: Storming the Citadel (25 player)
    function() t[4631] = a:New(4631); end, -- Heroic: The Frostwing Halls (10 player)
    function() t[4630] = a:New(4630); end, -- Heroic: The Crimson Hall (10 player)
    function() t[4629] = a:New(4629); end, -- Heroic: The Plagueworks (10 player)
    function() t[4628] = a:New(4628); end, -- Heroic: Storming the Citadel (10 player)
    function() t[4627] = a:New(4627); end, -- X-45 Heartbreaker
    function() t[4626] = a:New(4626); end, -- And I'll Form the Head!
    function() t[4625] = a:New(4625); end, -- Invincible's Reins
    function() t[4624] = a:New(4624); end, -- Tough Love
    function() t[4623] = a:New(4623); end, -- Shadowmourne
    function() t[4622] = a:New(4622); end, -- Neck-Deep in Vile (25 player)
    function() t[4621] = a:New(4621); end, -- Been Waiting a Long Time for This (25 player)
    function() t[4620] = a:New(4620); end, -- All You Can Eat (25 player)
    function() t[4619] = a:New(4619); end, -- Portal Jockey (25 player)
    function() t[4618] = a:New(4618); end, -- "Once Bitten, Twice Shy (25 player)"
    function() t[4617] = a:New(4617); end, -- The Orb Whisperer (25 player)
    function() t[4616] = a:New(4616); end, -- "Nausea, Heartburn, Indigestion... (25 player)"
    function() t[4615] = a:New(4615); end, -- Flu Shot Shortage (25 player)
    function() t[4614] = a:New(4614); end, -- Dances with Oozes (25 player)
    function() t[4613] = a:New(4613); end, -- I've Gone and Made a Mess (25 player)
    function() t[4612] = a:New(4612); end, -- I'm on a Boat (25 player)
    function() t[4611] = a:New(4611); end, -- Full House (25 player)
    function() t[4610] = a:New(4610); end, -- Boned (25 player)
    function() t[4608] = a:New(4608); end, -- Fall of the Lich King (25 player)
    function() t[4607] = a:New(4607); end, -- The Frostwing Halls (25 player)
    function() t[4606] = a:New(4606); end, -- The Crimson Hall (25 player)
    function() t[4605] = a:New(4605); end, -- The Plagueworks (25 player)
    function() t[4604] = a:New(4604); end, -- Storming the Citadel (25 player)
    function() t[4603] = a:New(4603); end, -- Glory of the Icecrown Raider (25 player)
    function() t[4602] = a:New(4602); end, -- Glory of the Icecrown Raider (10 player)
    function() t[4601] = a:New(4601); end, -- Been Waiting a Long Time for This (10 player)
    function() O(t[4600], "From", "PvP Season", 8, "Until", "PvP Season", 8); end,
    function() t[4600] = a:New(4600, nil, nil, true); end, -- Wrathful Gladiator's Frost Wyrm
    function() O(t[4599], "From", "PvP Season", 8, "Until", "PvP Season", 8); end,
    function() t[4599] = a:New(4599, nil, nil, true); end, -- Wrathful Gladiator
    function() t[4598] = a:New(4598); end, -- The Ashen Verdict
    function() t[4597] = a:New(4597); end, -- The Frozen Throne (25 player)
    function() t[4596] = a:New(4596); end, -- The Sword in the Skull
    function() t[4586] = a:New(4586); end, -- Toravon the Ice Watcher (25 player)
    function() t[4585] = a:New(4585); end, -- Toravon the Ice Watcher (10 player)
    function() t[4584] = a:New(4584); end, -- The Light of Dawn
    function() t[4583] = a:New(4583); end, -- Bane of the Fallen King
    function() t[4582] = a:New(4582); end, -- The Orb Whisperer (10 player)
    function() t[4581] = a:New(4581); end, -- Neck-Deep in Vile (10 player)
    function() t[4580] = a:New(4580); end, -- All You Can Eat (10 player)
    function() t[4579] = a:New(4579); end, -- Portal Jockey (10 player)
    function() t[4578] = a:New(4578); end, -- "Nausea, Heartburn, Indigestion... (10 player)"
    function() t[4577] = a:New(4577); end, -- Flu Shot Shortage (10 player)
    function() O(t[4576], "Once"); end,
    function() t[4576] = a:New(4576, nil, nil, nil, true); end, -- Realm First! Fall of the Lich King
    function() t[4539] = a:New(4539); end, -- "Once Bitten, Twice Shy (10 player)"
    function() t[4538] = a:New(4538); end, -- Dances with Oozes (10 player)
    function() t[4537] = a:New(4537); end, -- I've Gone and Made a Mess (10 player)
    function() t[4536] = a:New(4536); end, -- I'm on a Boat (10 player)
    function() t[4535] = a:New(4535); end, -- Full House (10 player)
    function() t[4534] = a:New(4534); end, -- Boned (10 player)
    function() t[4532] = a:New(4532); end, -- Fall of the Lich King (10 player)
    function() t[4531] = a:New(4531); end, -- Storming the Citadel (10 player)
    function() t[4530] = a:New(4530); end, -- The Frozen Throne (10 player)
    function() t[4529] = a:New(4529); end, -- The Crimson Hall (10 player)
    function() t[4528] = a:New(4528); end, -- The Plagueworks (10 player)
    function() t[4527] = a:New(4527); end, -- The Frostwing Halls (10 player)
    function() t[4526] = a:New(4526); end, -- We're Not Retreating; We're Advancing in a Different Direction.
    function() t[4525] = a:New(4525); end, -- Don't Look Up
    function() t[4524] = a:New(4524); end, -- Doesn't Go to Eleven
    function() t[4523] = a:New(4523); end, -- Three Faced
    function() t[4522] = a:New(4522); end, -- Soul Power
    function() t[4521] = a:New(4521); end, -- Heroic: The Halls of Reflection
    function() t[4520] = a:New(4520); end, -- Heroic: The Pit of Saron
    function() t[4519] = a:New(4519); end, -- Heroic: The Forge of Souls
    function() t[4518] = a:New(4518); end, -- The Halls of Reflection
    function() t[4517] = a:New(4517); end, -- The Pit of Saron
    function() t[4516] = a:New(4516); end, -- The Forge of Souls
    function() t[4496] = a:New(4496); end, -- It's Over Nine Thousand!
    function() t[4478] = a:New(4478); end, -- Looking For Multitudes
    function() t[4477] = a:New(4477); end, -- Looking For Many
    function() t[4476] = a:New(4476); end, -- Looking For More
    function() t[4437] = a:New(4437, f.Horde, 4436); end, -- BB King
    function() t[4436] = a:New(4436, f.Alliance, 4437); end, -- BB King
    function() t[4407] = a:New(4407); end, -- She Deep Breaths More (25 player)
    function() t[4406] = a:New(4406); end, -- Many Whelps! Handle It! (25 player)
    function() t[4405] = a:New(4405); end, -- More Dots! (25 player)
    function() t[4404] = a:New(4404); end, -- She Deep Breaths More (10 player)
    function() t[4403] = a:New(4403); end, -- Many Whelps! Handle It! (10 player)
    function() t[4402] = a:New(4402); end, -- More Dots! (10 player)
    function() O(t[4400]); end,
    function() t[4400] = a:New(4400); end, -- WoW's 5th Anniversary
    function() t[4397] = a:New(4397); end, -- Onyxia's Lair (25 player)
    function() t[4396] = a:New(4396); end, -- Onyxia's Lair (10 player)
    function() O(t[4316], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[4316] = a:New(4316); end, -- 2500 Dungeon & Raid Emblems
    function() t[4298] = a:New(4298, f.Alliance, 4297); end, -- Heroic: Trial of the Champion
    function() t[4297] = a:New(4297, f.Horde, 4298); end, -- Heroic: Trial of the Champion
    function() t[4296] = a:New(4296, f.Alliance, 3778); end, -- Trial of the Champion
    function() t[4256] = a:New(4256, f.Horde, 3856, true); end, -- Demolition Derby
    function() t[4177] = a:New(4177, f.Horde, 3851, true); end, -- Mine
    function() t[4176] = a:New(4176, f.Horde, 3846, true); end, -- Resource Glut
    function() O(t[4156], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[4156] = a:New(4156, f.Alliance, 4079); end, -- A Tribute to Immortality
    function() O(t[4080], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[4080] = a:New(4080); end, -- A Tribute to Dedicated Insanity
    function() O(t[4079], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[4079] = a:New(4079, f.Horde, 4156); end, -- A Tribute to Immortality
    function() O(t[4078], "Once"); end,
    function() t[4078] = a:New(4078, nil, nil, nil, true); end, -- Realm First! Grand Crusader
    function() t[4017] = a:New(4017); end, -- "Earth, Wind & Fire (25 player)"
    function() t[4016] = a:New(4016); end, -- "Earth, Wind & Fire (10 player)"
    function() t[3997] = a:New(3997); end, -- Three Sixty Pain Spike (25 player)
    function() t[3996] = a:New(3996); end, -- Three Sixty Pain Spike (10 player)
    function() t[3957] = a:New(3957, f.Horde, 3857, true); end, -- Master of Isle of Conquest
    function() t[3937] = a:New(3937); end, -- "Not One, But Two Jormungars (25 player)"
    function() t[3936] = a:New(3936); end, -- "Not One, But Two Jormungars (10 player)"
    function() t[3918] = a:New(3918); end, -- Call of the Grand Crusade (10 player)
    function() t[3917] = a:New(3917); end, -- Call of the Crusade (10 player)
    function() t[3916] = a:New(3916); end, -- Call of the Crusade (25 player)
    function() O(t[3896], "Never"); end,
    function() t[3896] = a:New(3896); end, -- Onyx Panther
    function() O(t[3876], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3876] = a:New(3876); end, -- 1500 Dungeon & Raid Emblems
    function() t[3857] = a:New(3857, f.Alliance, 3957, true); end, -- Master of Isle of Conquest
    function() t[3856] = a:New(3856, f.Alliance, 4256, true); end, -- Demolition Derby
    function() t[3855] = a:New(3855, nil, nil, true); end, -- Glaive Grave
    function() t[3854] = a:New(3854, nil, nil, true); end, -- Back Door Job
    function() t[3853] = a:New(3853, nil, nil, true); end, -- All Over the Isle
    function() t[3852] = a:New(3852, nil, nil, true); end, -- Cut the Blue Wire... No the Red Wire!
    function() t[3851] = a:New(3851, f.Alliance, 4177, true); end, -- Mine
    function() t[3850] = a:New(3850, nil, nil, true); end, -- Mowed Down
    function() t[3849] = a:New(3849, nil, nil, true); end, -- A-bomb-ination
    function() t[3848] = a:New(3848, nil, nil, true); end, -- A-bomb-inable
    function() t[3847] = a:New(3847, nil, nil, true); end, -- Four Car Garage
    function() t[3846] = a:New(3846, f.Alliance, 4176, true); end, -- Resource Glut
    function() t[3845] = a:New(3845, nil, nil, true); end, -- Isle of Conquest All-Star
    function() O(t[3844], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3844] = a:New(3844); end, -- 1000 Dungeon & Raid Emblems
    function() O(t[3843], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3843] = a:New(3843); end, -- 500 Dungeon & Raid Emblems
    function() O(t[3842], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3842] = a:New(3842); end, -- 250 Dungeon & Raid Emblems
    function() O(t[3841], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3841] = a:New(3841); end, -- 100 Dungeon & Raid Emblems
    function() O(t[3840], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3840] = a:New(3840); end, -- 50 Dungeon & Raid Emblems
    function() O(t[3839], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3839] = a:New(3839); end, -- 25 Dungeon & Raid Emblems
    function() O(t[3838], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3838] = a:New(3838); end, -- Dungeon & Raid Emblem
    function() t[3837] = a:New(3837); end, -- Koralon the Flame Watcher (25 player)
    function() t[3836] = a:New(3836); end, -- Koralon the Flame Watcher (10 player)
    function() O(t[3819], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3819] = a:New(3819); end, -- A Tribute to Insanity (25 player)
    function() O(t[3818], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3818] = a:New(3818); end, -- A Tribute to Mad Skill (25 player)
    function() O(t[3817], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3817] = a:New(3817); end, -- A Tribute to Skill (25 player)
    function() t[3816] = a:New(3816); end, -- The Traitor King (25 player)
    function() t[3815] = a:New(3815); end, -- Salt and Pepper (25 player)
    function() O(t[3814], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3814] = a:New(3814); end, -- Resilience Will Fix It (25 player)
    function() t[3813] = a:New(3813); end, -- Upper Back Pain (25 player)
    function() t[3812] = a:New(3812); end, -- Call of the Grand Crusade (25 player)
    function() O(t[3810], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3810] = a:New(3810); end, -- A Tribute to Insanity (10 player)
    function() O(t[3809], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3809] = a:New(3809); end, -- A Tribute to Mad Skill (10 player)
    function() O(t[3808], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3808] = a:New(3808); end, -- A Tribute to Skill (10 player)
    function() t[3804] = a:New(3804); end, -- I've Had Worse
    function() t[3803] = a:New(3803); end, -- The Faceroller
    function() t[3802] = a:New(3802); end, -- Argent Confessor
    function() t[3800] = a:New(3800); end, -- The Traitor King (10 player)
    function() t[3799] = a:New(3799); end, -- Salt and Pepper (10 player)
    function() t[3798] = a:New(3798); end, -- Resilience Will Fix It (10 player)
    function() t[3797] = a:New(3797); end, -- Upper Back Pain (10 player)
    function() t[3778] = a:New(3778, f.Horde, 4296); end, -- Trial of the Champion
    function() t[3777] = a:New(3777, nil, nil, true); end, -- Isle of Conquest Veteran
    function() t[3776] = a:New(3776, nil, nil, true); end, -- Isle of Conquest Victory
    function() O(t[3758], "From", "PvP Season", 7, "Until", "PvP Season", 7); end,
    function() t[3758] = a:New(3758, nil, nil, true); end, -- Relentless Gladiator
    function() O(t[3757], "From", "PvP Season", 7, "Until", "PvP Season", 7); end,
    function() t[3757] = a:New(3757, nil, nil, true); end, -- Relentless Gladiator's Frost Wyrm
    function() O(t[3756], "From", "PvP Season", 6, "Until", "PvP Season", 6); end,
    function() t[3756] = a:New(3756, nil, nil, true); end, -- Furious Gladiator's Frost Wyrm
    function() t[3736] = a:New(3736); end, -- Pony Up!
    function() t[3677] = a:New(3677, f.Horde, 3676); end, -- The Sunreavers
    function() t[3676] = a:New(3676, f.Alliance, 3677); end, -- A Silver Confidant
    function() t[3656] = a:New(3656, f.Horde); end, -- Pilgrim
    function() O(t[3636], "Never"); end,
    function() t[3636] = a:New(3636); end, -- Jade Tiger
    function() O(t[3618], "Never"); end,
    function() t[3618] = a:New(3618, nil, nil, true); end, -- Murkimus the Gladiator
    function() t[3597] = a:New(3597, f.Horde, 3596); end, -- Pilgrim's Progress
    function() t[3596] = a:New(3596, f.Alliance, 3597); end, -- Pilgrim's Progress
    function() t[3582] = a:New(3582); end, -- Terokkar Turkey Time
    function() t[3581] = a:New(3581, f.Horde, 3580); end, -- Pilgrim's Peril
    function() t[3580] = a:New(3580, f.Alliance, 3581); end, -- Pilgrim's Peril
    function() t[3579] = a:New(3579); end, -- """FOOD FIGHT!"""
    function() t[3578] = a:New(3578); end, -- The Turkinator
    function() t[3577] = a:New(3577, f.Horde, 3576); end, -- Now We're Cookin'
    function() t[3576] = a:New(3576, f.Alliance, 3577); end, -- Now We're Cookin'
    function() t[3559] = a:New(3559); end, -- Turkey Lurkey
    function() t[3558] = a:New(3558); end, -- Sharing is Caring
    function() t[3557] = a:New(3557, f.Horde, 3556); end, -- Pilgrim's Paunch
    function() t[3556] = a:New(3556, f.Alliance, 3557); end, -- Pilgrim's Paunch
    function() t[3536] = a:New(3536); end, -- The Marine Marine
    function() t[3496] = a:New(3496); end, -- A Brew-FAST Mount
    function() t[3478] = a:New(3478, f.Alliance); end, -- Pilgrim
    function() t[3457] = a:New(3457); end, -- The Captain's Booty
    function() t[3456] = a:New(3456); end, -- Dead Man's Party
    function() O(t[3436], "From", "PvP Season", 6, "Until", "PvP Season", 6); end,
    function() t[3436] = a:New(3436, nil, nil, true); end, -- Furious Gladiator
    function() t[3357] = a:New(3357, f.Horde, 3356); end, -- Venomhide Ravasaur
    function() t[3356] = a:New(3356, f.Alliance, 3357); end, -- Winterspring Frostsaber
    function() O(t[3336], "From", "PvP Season", 5, "Until", "PvP Season", 5); end,
    function() t[3336] = a:New(3336, nil, nil, true); end, -- Deadly Gladiator
    function() t[3316] = a:New(3316); end, -- Herald of the Titans
    function() t[3296] = a:New(3296); end, -- Cooking with Style
    function() O(t[3259], "Once"); end,
    function() t[3259] = a:New(3259, nil, nil, nil, true); end, -- Realm First! Celestial Defender
    function() t[3237] = a:New(3237); end, -- Set Up Us the Bomb (25 player)
    function() t[3218] = a:New(3218); end, -- Turtles All the Way Down
    function() t[3217] = a:New(3217); end, -- Chasing Marcia
    function() t[3189] = a:New(3189); end, -- Firefighter (25 player)
    function() t[3188] = a:New(3188); end, -- I Love the Smell of Saronite in the Morning (25 player)
    function() t[3187] = a:New(3187); end, -- "Knock, Knock, Knock on Wood (25 player)"
    function() t[3186] = a:New(3186); end, -- "Knock, Knock on Wood (25 player)"
    function() t[3185] = a:New(3185); end, -- Knock on Wood (25 player)
    function() t[3184] = a:New(3184); end, -- I Could Say That This Cache Was Rare (25 player)
    function() t[3183] = a:New(3183); end, -- Lose Your Illusion (25 player)
    function() t[3182] = a:New(3182); end, -- I Could Say That This Cache Was Rare (10 player)
    function() t[3181] = a:New(3181); end, -- I Love the Smell of Saronite in the Morning (10 player)
    function() t[3180] = a:New(3180); end, -- Firefighter (10 player)
    function() t[3179] = a:New(3179); end, -- "Knock, Knock, Knock on Wood (10 player)"
    function() t[3178] = a:New(3178); end, -- "Knock, Knock on Wood (10 player)"
    function() t[3177] = a:New(3177); end, -- Knock on Wood (10 player)
    function() t[3176] = a:New(3176); end, -- Lose Your Illusion (10 player)
    function() t[3164] = a:New(3164); end, -- Alone in the Darkness (25 player)
    function() t[3163] = a:New(3163); end, -- One Light in the Darkness (25 player)
    function() t[3162] = a:New(3162); end, -- Two Lights in the Darkness (25 player)
    function() t[3161] = a:New(3161); end, -- Three Lights in the Darkness (25 player)
    function() t[3159] = a:New(3159); end, -- Alone in the Darkness (10 player)
    function() t[3158] = a:New(3158); end, -- One Light in the Darkness (10 player)
    function() t[3157] = a:New(3157); end, -- Three Lights in the Darkness (10 player)
    function() t[3142] = a:New(3142); end, -- "Val'anyr, Hammer of Ancient Kings"
    function() t[3141] = a:New(3141); end, -- Two Lights in the Darkness (10 player)
    function() t[3138] = a:New(3138); end, -- Not-So-Friendly Fire (10 player)
    function() t[3137] = a:New(3137); end, -- Emalon the Storm Watcher (25 player)
    function() t[3136] = a:New(3136); end, -- Emalon the Storm Watcher (10 player)
    function() t[3118] = a:New(3118); end, -- Lumberjacked (25 player)
    function() O(t[3117], "Once"); end,
    function() t[3117] = a:New(3117, nil, nil, nil, true); end, -- Realm First! Death's Demise
    function() t[3098] = a:New(3098); end, -- Dwarfageddon (25 player)
    function() t[3097] = a:New(3097); end, -- Dwarfageddon (10 player)
    function() O(t[3096], "From", "PvP Season", 5, "Until", "PvP Season", 5); end,
    function() t[3096] = a:New(3096, nil, nil, true); end, -- Deadly Gladiator's Frost Wyrm
    function() t[3077] = a:New(3077); end, -- Nine Lives (25 player)
    function() t[3076] = a:New(3076); end, -- Nine Lives (10 player)
    function() t[3059] = a:New(3059); end, -- Heartbreaker (25 player)
    function() t[3058] = a:New(3058); end, -- Heartbreaker (10 player)
    function() t[3057] = a:New(3057); end, -- Orbit-uary (25 player)
    function() t[3056] = a:New(3056); end, -- Orbit-uary (10 player)
    function() t[3037] = a:New(3037); end, -- Observed (25 player)
    function() t[3036] = a:New(3036); end, -- Observed (10 player)
    function() t[3017] = a:New(3017); end, -- They're Coming Out of the Walls (25 player)
    function() t[3016] = a:New(3016); end, -- In His House He Waits Dreaming (25 player)
    function() t[3015] = a:New(3015); end, -- In His House He Waits Dreaming (10 player)
    function() t[3014] = a:New(3014); end, -- They're Coming Out of the Walls (10 player)
    function() t[3013] = a:New(3013); end, -- He's Not Getting Any Older (25 player)
    function() t[3012] = a:New(3012); end, -- He's Not Getting Any Older (10 player)
    function() t[3011] = a:New(3011); end, -- Kiss and Make Up (25 player)
    function() t[3010] = a:New(3010); end, -- Drive Me Crazy (25 player)
    function() t[3009] = a:New(3009); end, -- Kiss and Make Up (10 player)
    function() t[3008] = a:New(3008); end, -- Drive Me Crazy (10 player)
    function() t[3007] = a:New(3007); end, -- Crazy Cat Lady (25 player)
    function() t[3006] = a:New(3006); end, -- Crazy Cat Lady (10 player)
    function() O(t[3005], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3005] = a:New(3005); end, -- He Feeds On Your Tears (25 player)
    function() O(t[3004], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[3004] = a:New(3004); end, -- He Feeds On Your Tears (10 player)
    function() t[3003] = a:New(3003); end, -- Supermassive (10 player)
    function() t[3002] = a:New(3002); end, -- Supermassive (25 player)
    function() t[2997] = a:New(2997); end, -- Shadowdodger (25 player)
    function() t[2996] = a:New(2996); end, -- Shadowdodger (10 player)
    function() t[2995] = a:New(2995); end, -- Not-So-Friendly Fire (25 player)
    function() t[2989] = a:New(2989); end, -- Set Up Us the Bomb (10 player)
    function() t[2985] = a:New(2985); end, -- Deforestation (10 player)
    function() t[2984] = a:New(2984); end, -- Deforestation (25 player)
    function() t[2983] = a:New(2983); end, -- Getting Back to Nature (25 player)
    function() t[2982] = a:New(2982); end, -- Getting Back to Nature (10 player)
    function() t[2981] = a:New(2981); end, -- Con-speed-atory (25 player)
    function() t[2980] = a:New(2980); end, -- Con-speed-atory (10 player)
    function() t[2979] = a:New(2979); end, -- Lumberjacked (10 player)
    function() t[2978] = a:New(2978); end, -- Siffed (25 player)
    function() t[2977] = a:New(2977); end, -- Siffed (10 player)
    function() t[2976] = a:New(2976); end, -- Who Needs Bloodlust? (25 player)
    function() t[2975] = a:New(2975); end, -- Who Needs Bloodlust? (10 player)
    function() t[2974] = a:New(2974); end, -- I'll Take You All On (25 player)
    function() t[2973] = a:New(2973); end, -- I'll Take You All On (10 player)
    function() t[2972] = a:New(2972); end, -- Don't Stand in the Lightning (25 player)
    function() t[2971] = a:New(2971); end, -- Don't Stand in the Lightning (10 player)
    function() t[2970] = a:New(2970); end, -- Staying Buffed All Winter (25 player)
    function() t[2969] = a:New(2969); end, -- Staying Buffed All Winter (10 player)
    function() t[2968] = a:New(2968); end, -- Getting Cold in Here (25 player)
    function() t[2967] = a:New(2967); end, -- Getting Cold in Here (10 player)
    function() t[2965] = a:New(2965); end, -- I Have the Coolest Friends (25 player)
    function() t[2963] = a:New(2963); end, -- I Have the Coolest Friends (10 player)
    function() t[2962] = a:New(2962); end, -- Cheese the Freeze (25 player)
    function() t[2961] = a:New(2961); end, -- Cheese the Freeze (10 player)
    function() t[2960] = a:New(2960); end, -- Rubble and Roll (25 player)
    function() t[2959] = a:New(2959); end, -- Rubble and Roll (10 player)
    function() t[2958] = a:New(2958); end, -- Glory of the Ulduar Raider (25 player)
    function() t[2957] = a:New(2957); end, -- Glory of the Ulduar Raider (10 player)
    function() t[2956] = a:New(2956); end, -- If Looks Could Kill (25 player)
    function() t[2955] = a:New(2955); end, -- If Looks Could Kill (10 player)
    function() t[2954] = a:New(2954); end, -- Disarmed (25 player)
    function() t[2953] = a:New(2953); end, -- Disarmed (10 player)
    function() t[2952] = a:New(2952); end, -- With Open Arms (25 player)
    function() t[2951] = a:New(2951); end, -- With Open Arms (10 player)
    function() t[2948] = a:New(2948); end, -- Can't Do That While Stunned (25 player)
    function() t[2947] = a:New(2947); end, -- Can't Do That While Stunned (10 player)
    function() t[2946] = a:New(2946); end, -- But I'm On Your Side (25 player)
    function() t[2945] = a:New(2945); end, -- But I'm On Your Side (10 player)
    function() t[2944] = a:New(2944); end, -- "I Choose You, Steelbreaker (25 player)"
    function() t[2943] = a:New(2943); end, -- "I Choose You, Stormcaller Brundir (25 player)"
    function() t[2942] = a:New(2942); end, -- "I Choose You, Runemaster Molgeim (25 player)"
    function() t[2941] = a:New(2941); end, -- "I Choose You, Steelbreaker (10 player)"
    function() t[2940] = a:New(2940); end, -- "I Choose You, Stormcaller Brundir (10 player)"
    function() t[2939] = a:New(2939); end, -- "I Choose You, Runemaster Molgeim (10 player)"
    function() t[2938] = a:New(2938); end, -- Must Deconstruct Faster (25 player)
    function() t[2937] = a:New(2937); end, -- Must Deconstruct Faster (10 player)
    function() t[2936] = a:New(2936); end, -- Nerf Gravity Bombs (25 player)
    function() t[2935] = a:New(2935); end, -- Nerf Scrapbots (25 player)
    function() t[2934] = a:New(2934); end, -- Nerf Gravity Bombs (10 player)
    function() t[2933] = a:New(2933); end, -- Nerf Scrapbots (10 player)
    function() t[2932] = a:New(2932); end, -- Nerf Engineering (25 player)
    function() t[2931] = a:New(2931); end, -- Nerf Engineering (10 player)
    function() t[2930] = a:New(2930); end, -- Stokin' the Furnace (10 player)
    function() t[2929] = a:New(2929); end, -- Stokin' the Furnace (25 player)
    function() t[2928] = a:New(2928); end, -- Hot Pocket (25 player)
    function() t[2927] = a:New(2927); end, -- Hot Pocket (10 player)
    function() t[2926] = a:New(2926); end, -- Shattered (25 player)
    function() t[2925] = a:New(2925); end, -- Shattered (10 player)
    function() t[2924] = a:New(2924); end, -- "Iron Dwarf, Medium Rare (25 player)"
    function() t[2923] = a:New(2923); end, -- "Iron Dwarf, Medium Rare (10 player)"
    function() t[2921] = a:New(2921); end, -- A Quick Shave (25 player)
    function() t[2919] = a:New(2919); end, -- A Quick Shave (10 player)
    function() t[2918] = a:New(2918); end, -- Orbital Bombardment (25 player)
    function() t[2917] = a:New(2917); end, -- Nuked from Orbit (25 player)
    function() t[2916] = a:New(2916); end, -- Orbital Devastation (25 player)
    function() t[2915] = a:New(2915); end, -- Nuked from Orbit (10 player)
    function() t[2914] = a:New(2914); end, -- Orbital Devastation (10 player)
    function() t[2913] = a:New(2913); end, -- Orbital Bombardment (10 player)
    function() t[2912] = a:New(2912); end, -- Shutout (25 player)
    function() t[2911] = a:New(2911); end, -- Shutout (10 player)
    function() t[2910] = a:New(2910); end, -- Take Out Those Turrets (25 player)
    function() t[2909] = a:New(2909); end, -- Take Out Those Turrets (10 player)
    function() t[2908] = a:New(2908); end, -- Three Car Garage (25 player)
    function() t[2907] = a:New(2907); end, -- Three Car Garage (10 player)
    function() t[2906] = a:New(2906); end, -- Unbroken (25 player)
    function() t[2905] = a:New(2905); end, -- Unbroken (10 player)
    function() t[2904] = a:New(2904); end, -- Conqueror of Ulduar
    function() t[2903] = a:New(2903); end, -- Champion of Ulduar
    function() t[2895] = a:New(2895); end, -- The Secrets of Ulduar (25 player)
    function() t[2894] = a:New(2894); end, -- The Secrets of Ulduar (10 player)
    function() t[2893] = a:New(2893); end, -- The Descent into Madness (25 player)
    function() t[2892] = a:New(2892); end, -- The Descent into Madness (10 player)
    function() t[2891] = a:New(2891); end, -- The Keepers of Ulduar (25 player)
    function() t[2890] = a:New(2890); end, -- The Keepers of Ulduar (10 player)
    function() t[2889] = a:New(2889); end, -- The Antechamber of Ulduar (25 player)
    function() t[2888] = a:New(2888); end, -- The Antechamber of Ulduar (10 player)
    function() t[2887] = a:New(2887); end, -- The Siege of Ulduar (25 player)
    function() t[2886] = a:New(2886); end, -- The Siege of Ulduar (10 player)
    function() t[2836] = a:New(2836); end, -- Lance a Lot
    function() t[2817] = a:New(2817, f.Alliance, 2816); end, -- Exalted Argent Champion of the Alliance
    function() t[2816] = a:New(2816, f.Horde, 2817); end, -- Exalted Argent Champion of the Horde
    function() t[2798] = a:New(2798, f.Horde); end, -- Noble Gardener
    function() t[2797] = a:New(2797, f.Alliance); end, -- Noble Gardener
    function() t[2796] = a:New(2796); end, -- Brew of the Month
    function() t[2788] = a:New(2788, f.Horde, 2782); end, -- Champion of the Horde
    function() t[2787] = a:New(2787, f.Horde, 2777); end, -- Champion of the Undercity
    function() t[2786] = a:New(2786, f.Horde, 2779); end, -- Champion of Thunder Bluff
    function() t[2785] = a:New(2785, f.Horde, 2778); end, -- Champion of Silvermoon City
    function() t[2784] = a:New(2784, f.Horde, 2780); end, -- Champion of Sen'jin
    function() t[2783] = a:New(2783, f.Horde, 2781); end, -- Champion of Orgrimmar
    function() t[2782] = a:New(2782, f.Alliance, 2788); end, -- Champion of the Alliance
    function() t[2781] = a:New(2781, f.Alliance, 2783); end, -- Champion of Stormwind
    function() t[2780] = a:New(2780, f.Alliance, 2784); end, -- Champion of Ironforge
    function() t[2779] = a:New(2779, f.Alliance, 2786); end, -- Champion of Gnomeregan
    function() t[2778] = a:New(2778, f.Alliance, 2785); end, -- Champion of the Exodar
    function() t[2777] = a:New(2777, f.Alliance, 2787); end, -- Champion of Darnassus
    function() t[2776] = a:New(2776, f.Horde); end, -- Master of Wintergrasp
    function() t[2773] = a:New(2773); end, -- It's Just a Flesh Wound
    function() t[2772] = a:New(2772); end, -- Tilted!
    function() t[2771] = a:New(2771, f.Horde, 2770); end, -- Exalted Champion of the Horde
    function() t[2770] = a:New(2770, f.Alliance, 2771); end, -- Exalted Champion of the Alliance
    function() t[2769] = a:New(2769, f.Horde, 2760); end, -- Exalted Champion of the Undercity
    function() t[2768] = a:New(2768, f.Horde, 2762); end, -- Exalted Champion of Thunder Bluff
    function() t[2767] = a:New(2767, f.Horde, 2761); end, -- Exalted Champion of Silvermoon City
    function() t[2766] = a:New(2766, f.Horde, 2763); end, -- Exalted Champion of Sen'jin
    function() t[2765] = a:New(2765, f.Horde, 2764); end, -- Exalted Champion of Orgrimmar
    function() t[2764] = a:New(2764, f.Alliance, 2765); end, -- Exalted Champion of Stormwind
    function() t[2763] = a:New(2763, f.Alliance, 2766); end, -- Exalted Champion of Ironforge
    function() t[2762] = a:New(2762, f.Alliance, 2768); end, -- Exalted Champion of Gnomeregan
    function() t[2761] = a:New(2761, f.Alliance, 2767); end, -- Exalted Champion of the Exodar
    function() t[2760] = a:New(2760, f.Alliance, 2769); end, -- Exalted Champion of Darnassus
    function() t[2758] = a:New(2758); end, -- Argent Valor
    function() t[2756] = a:New(2756); end, -- Argent Aspiration
    function() O(t[2716], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[2716] = a:New(2716); end, -- Dual Talent Specialization
    function() t[2676] = a:New(2676); end, -- I Found One!
    function() t[2576] = a:New(2576); end, -- Blushing Bride
    function() t[2557] = a:New(2557); end, -- To All The Squirrels Who Shared My Life
    function() t[2556] = a:New(2556); end, -- Pest Control
    function() t[2537] = a:New(2537, f.Horde, 2536); end, -- Mountain o' Mounts
    function() t[2536] = a:New(2536, f.Alliance, 2537); end, -- Mountain o' Mounts
    function() t[2516] = a:New(2516); end, -- Lil' Game Hunter
    function() t[2497] = a:New(2497, f.Horde, 2419); end, -- Spring Fling
    function() O(t[2496], "From", "Version", "030002", "Before", "Version", "030008"); end,
    function() t[2496] = a:New(2496); end, -- The Fifth Element
    function() t[2476] = a:New(2476, f.Horde, 1737, true); end, -- Destruction Derby
    function() O(t[2456], "From", "Version", "030002", "Until", "Version", "030002"); end,
    function() t[2456] = a:New(2456); end, -- Vampire Hunter
    function() t[2436] = a:New(2436); end, -- Desert Rose
    function() t[2422] = a:New(2422); end, -- Shake Your Bunny-Maker
    function() t[2421] = a:New(2421, f.Alliance, 2420); end, -- Noble Garden
    function() t[2420] = a:New(2420, f.Horde, 2421); end, -- Noble Garden
    function() t[2419] = a:New(2419, f.Alliance, 2497); end, -- Spring Fling
    function() t[2418] = a:New(2418); end, -- Chocoholic
    function() t[2417] = a:New(2417); end, -- Chocolate Lover
    function() t[2416] = a:New(2416); end, -- Hard Boiled
    function() O(t[2398]); end,
    function() t[2398] = a:New(2398); end, -- WoW's 4th Anniversary
    function() O(t[2359], "From", "Version", "020100", "Before", "Version", "040003a"); end,
    function() t[2359] = a:New(2359); end, -- Swift Flight Form
    function() O(t[2358], "From", "Version", "010400", "Before", "Version", "040003a"); end,
    function() t[2358] = a:New(2358); end, -- Charger
    function() O(t[2357], "From", "Version", "010400", "Before", "Version", "040003a"); end,
    function() t[2357] = a:New(2357); end, -- Dreadsteed of Xoroth
    function() t[2336] = a:New(2336); end, -- Insane in the Membrane
    function() O(t[2316], "From", "PvP Season", 4, "Until", "PvP Season", 4); end,
    function() t[2316] = a:New(2316, nil, nil, true); end, -- Brutal Nether Drake
    function() t[2257] = a:New(2257); end, -- Frostbitten
    function() t[2256] = a:New(2256); end, -- Northern Exposure
    function() O(t[2200], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2200] = a:New(2200, f.Horde, 1757, true); end, -- Defense of the Ancients
    function() t[2199] = a:New(2199, nil, nil, true); end, -- Wintergrasp Ranger
    function() O(t[2195], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2195] = a:New(2195, f.Horde); end, -- Master of Strand of the Ancients
    function() O(t[2194], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2194] = a:New(2194, f.Alliance, nil, true); end, -- Master of Strand of the Ancients
    function() O(t[2193], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2193] = a:New(2193, nil, nil, true); end, -- Explosives Expert
    function() O(t[2192], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2192] = a:New(2192, f.Horde, 1762, true); end, -- Not Even a Scratch
    function() O(t[2191], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2191] = a:New(2191, nil, nil, true); end, -- Ancient Courtyard Protector
    function() O(t[2190], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2190] = a:New(2190, nil, nil, true); end, -- Drop It Now!
    function() O(t[2189], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[2189] = a:New(2189, nil, nil, true); end, -- Artillery Expert
    function() O(t[2188], "From", "Version", "030002", "Before", "Version", "060002"); end,
    function() t[2188] = a:New(2188); end, -- Leeeeeeeeeeeeeroy!
    function() O(t[2187], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[2187] = a:New(2187); end, -- The Undying
    function() O(t[2186], "From", "Version", "030400", "Before", "Version", "040003a"); end,
    function() t[2186] = a:New(2186); end, -- The Immortal
    function() t[2185] = a:New(2185); end, -- Just Can't Get Enough (25 player)
    function() t[2184] = a:New(2184); end, -- Just Can't Get Enough (10 player)
    function() t[2183] = a:New(2183); end, -- Spore Loser (25 player)
    function() t[2182] = a:New(2182); end, -- Spore Loser (10 player)
    function() t[2181] = a:New(2181); end, -- Subtraction (25 player)
    function() t[2180] = a:New(2180); end, -- Subtraction (10 player)
    function() t[2179] = a:New(2179); end, -- Shocking! (25 player)
    function() t[2178] = a:New(2178); end, -- Shocking! (10 player)
    function() t[2177] = a:New(2177); end, -- And They Would All Go Down Together (25 player)
    function() t[2176] = a:New(2176); end, -- And They Would All Go Down Together (10 player)
    function() t[2157] = a:New(2157); end, -- King's Bane
    function() t[2156] = a:New(2156); end, -- My Girl Loves to Skadi All the Time
    function() t[2155] = a:New(2155); end, -- Abuse the Ooze
    function() t[2154] = a:New(2154); end, -- Brann Spankin' New
    function() t[2153] = a:New(2153); end, -- A Void Dance
    function() t[2152] = a:New(2152); end, -- Share The Love
    function() t[2151] = a:New(2151); end, -- Consumption Junction
    function() t[2150] = a:New(2150); end, -- Split Personality
    function() t[2149] = a:New(2149); end, -- Denyin' the Scion (25 player)
    function() t[2148] = a:New(2148); end, -- Denyin' the Scion (10 player)
    function() t[2147] = a:New(2147); end, -- The Hundred Club (25 player)
    function() t[2146] = a:New(2146); end, -- The Hundred Club (10 player)
    function() t[2145] = a:New(2145, f.Horde); end, -- "What A Long, Strange Trip It's Been"
    function() t[2144] = a:New(2144, f.Alliance); end, -- "What a Long, Strange Trip It's Been"
    function() t[2143] = a:New(2143); end, -- Leading the Cavalry
    function() t[2142] = a:New(2142); end, -- Filling Up The Barn
    function() t[2141] = a:New(2141); end, -- Stable Keeper
    function() t[2140] = a:New(2140); end, -- Momma Said Knock You Out (25 player)
    function() t[2139] = a:New(2139); end, -- The Safety Dance (25 player)
    function() t[2138] = a:New(2138); end, -- Glory of the Raider (25 player)
    function() t[2137] = a:New(2137); end, -- Glory of the Raider (10 player)
    function() t[2136] = a:New(2136); end, -- Glory of the Hero
    function() O(t[2116]); end,
    function() t[2116] = a:New(2116); end, -- Tabard of the Argent Dawn
    function() t[2097] = a:New(2097); end, -- Get to the Choppa!
    function() t[2096] = a:New(2096); end, -- The Coin Master
    function() t[2095] = a:New(2095); end, -- Silver in the City
    function() t[2094] = a:New(2094); end, -- A Penny For Your Thoughts
    function() t[2093] = a:New(2093, nil, nil, true); end, -- Rival
    function() t[2092] = a:New(2092, nil, nil, true); end, -- Duelist
    function() t[2091] = a:New(2091, nil, nil, true); end, -- Gladiator
    function() t[2090] = a:New(2090, nil, nil, true); end, -- Challenger
    function() O(t[2089], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[2089] = a:New(2089, nil, nil, true); end, -- 1000 Stone Keeper's Shards
    function() O(t[2088], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[2088] = a:New(2088, nil, nil, true); end, -- 500 Stone Keeper's Shards
    function() O(t[2087], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[2087] = a:New(2087, nil, nil, true); end, -- 250 Stone Keeper's Shards
    function() O(t[2086], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[2086] = a:New(2086, nil, nil, true); end, -- 100 Stone Keeper's Shards
    function() O(t[2085], "From", "Version", "030400", "Before", "Version", "040001"); end,
    function() t[2085] = a:New(2085, nil, nil, true); end, -- 50 Stone Keeper's Shards
    function() t[2084] = a:New(2084); end, -- Ring of the Kirin Tor
    function() t[2083] = a:New(2083); end, -- Grand Ice Mammoth
    function() t[2082] = a:New(2082); end, -- Ice Mammoth
    function() t[2081] = a:New(2081); end, -- Grand Black War Mammoth
    function() t[2080] = a:New(2080, nil, nil, true); end, -- Black War Mammoth
    function() O(t[2079]); end,
    function() t[2079] = a:New(2079); end, -- Tabard of the Protector
    function() t[2078] = a:New(2078); end, -- Traveler's Tundra Mammoth
    function() t[2077] = a:New(2077); end, -- Wooly Mammoth
    function() t[2076] = a:New(2076); end, -- Armored Brown Bear
    function() t[2058] = a:New(2058); end, -- Snakes. Why'd It Have To Be Snakes?
    function() t[2057] = a:New(2057); end, -- Oh Novos!
    function() t[2056] = a:New(2056); end, -- Volunteer Work
    function() t[2054] = a:New(2054); end, -- The Twilight Zone (25 player)
    function() t[2053] = a:New(2053); end, -- Twilight Duo (25 player)
    function() t[2052] = a:New(2052); end, -- Twilight Assist (25 player)
    function() t[2051] = a:New(2051); end, -- The Twilight Zone (10 player)
    function() t[2050] = a:New(2050); end, -- Twilight Duo (10 player)
    function() t[2049] = a:New(2049); end, -- Twilight Assist (10 player)
    function() t[2048] = a:New(2048); end, -- Gonna Go When the Volcano Blows (25 player)
    function() t[2047] = a:New(2047); end, -- Gonna Go When the Volcano Blows (10 player)
    function() t[2046] = a:New(2046); end, -- Amber Void
    function() t[2045] = a:New(2045); end, -- Emerald Void
    function() t[2044] = a:New(2044); end, -- Ruby Void
    function() t[2043] = a:New(2043); end, -- The Incredible Hulk
    function() t[2042] = a:New(2042); end, -- Shatter Resistant
    function() t[2041] = a:New(2041); end, -- Dehydration
    function() t[2040] = a:New(2040); end, -- Less-rabi
    function() t[2039] = a:New(2039); end, -- Better Off Dred
    function() t[2038] = a:New(2038); end, -- Respect Your Elders
    function() t[2037] = a:New(2037); end, -- Chaos Theory
    function() t[2036] = a:New(2036); end, -- Intense Cold
    function() O(t[2019], "From", "Version", "030400", "Before", "Version", "030700"); end,
    function() t[2019] = a:New(2019); end, -- Proof of Demise
    function() O(t[2018], "From", "Version", "030400", "Before", "Version", "030700"); end,
    function() t[2018] = a:New(2018); end, -- Timear Foresees
    function() t[2017] = a:New(2017, f.Horde, 2016, true); end, -- Grizzled Veteran
    function() t[2016] = a:New(2016, f.Alliance, 2017, true); end, -- Grizzled Veteran
    function() t[2002] = a:New(2002); end, -- 100 Cooking Awards
    function() t[2001] = a:New(2001); end, -- 50 Cooking Awards
    function() t[2000] = a:New(2000); end, -- 25 Cooking Awards
    function() t[1999] = a:New(1999); end, -- 10 Cooking Awards
    function() t[1998] = a:New(1998); end, -- Cooking Award
    function() t[1997] = a:New(1997); end, -- Momma Said Knock You Out (10 player)
    function() t[1996] = a:New(1996); end, -- The Safety Dance (10 player)
    function() t[1958] = a:New(1958); end, -- I Smell A Giant Rat
    function() t[1957] = a:New(1957); end, -- There's Gold In That There Fountain
    function() t[1956] = a:New(1956); end, -- Higher Learning
    function() t[1936] = a:New(1936); end, -- Does Your Wolpertinger Linger?
    function() t[1919] = a:New(1919); end, -- On The Rocks
    function() t[1877] = a:New(1877); end, -- Less Is More (25 player)
    function() t[1876] = a:New(1876); end, -- Besting the Black Dragonflight (10 player)
    function() t[1875] = a:New(1875); end, -- You Don't Have an Eternity (25 player)
    function() t[1874] = a:New(1874); end, -- You Don't Have an Eternity (10 player)
    function() t[1873] = a:New(1873); end, -- Lodi Dodi We Loves the Skadi
    function() t[1872] = a:New(1872); end, -- Zombiefest!
    function() t[1871] = a:New(1871); end, -- Experienced Drake Rider
    function() t[1870] = a:New(1870); end, -- A Poke in the Eye (25 player)
    function() t[1869] = a:New(1869); end, -- A Poke in the Eye (10 player)
    function() t[1868] = a:New(1868); end, -- Make It Count
    function() t[1867] = a:New(1867); end, -- Timely Death
    function() t[1866] = a:New(1866); end, -- Good Grief
    function() t[1865] = a:New(1865); end, -- Lockdown!
    function() t[1864] = a:New(1864); end, -- What the Eck?
    function() t[1862] = a:New(1862); end, -- Volazj's Quick Demise
    function() t[1860] = a:New(1860); end, -- Gotta Go!
    function() t[1859] = a:New(1859); end, -- Arachnophobia (25 player)
    function() t[1858] = a:New(1858); end, -- Arachnophobia (10 player)
    function() t[1857] = a:New(1857); end, -- Make Quick Werk of Him (25 player)
    function() t[1856] = a:New(1856); end, -- Make Quick Werk of Him (10 player)
    function() t[1837] = a:New(1837); end, -- Old Ironjaw
    function() t[1836] = a:New(1836); end, -- Old Crafty
    function() t[1834] = a:New(1834); end, -- Lightning Struck
    function() t[1833] = a:New(1833); end, -- It's Happy Hour Somewhere
    function() t[1832] = a:New(1832); end, -- Tastes Like Chicken
    function() t[1817] = a:New(1817); end, -- The Culling of Time
    function() t[1816] = a:New(1816); end, -- Defenseless
    function() t[1801] = a:New(1801); end, -- Captain Rumsey's Lager
    function() t[1800] = a:New(1800); end, -- The Outland Gourmet
    function() t[1799] = a:New(1799); end, -- Chef de Cuisine
    function() t[1798] = a:New(1798); end, -- Sous Chef
    function() t[1797] = a:New(1797); end, -- Chef de Partie
    function() t[1796] = a:New(1796); end, -- Short Order Cook
    function() t[1795] = a:New(1795); end, -- Lunch Lady
    function() t[1793] = a:New(1793); end, -- For the Children
    function() t[1792] = a:New(1792); end, -- "Aw, Isn't It Cute?"
    function() t[1791] = a:New(1791); end, -- Home Alone
    function() t[1790] = a:New(1790); end, -- "Hail To The King, Baby"
    function() t[1789] = a:New(1789); end, -- Daily Chores
    function() t[1788] = a:New(1788); end, -- Bad Example
    function() t[1786] = a:New(1786); end, -- School of Hard Knocks
    function() t[1785] = a:New(1785); end, -- Dinner Impossible
    function() t[1784] = a:New(1784, f.Horde); end, -- Hail to the Chef
    function() t[1783] = a:New(1783, f.Horde, 1782); end, -- Our Daily Bread
    function() t[1782] = a:New(1782, f.Alliance, 1783); end, -- Our Daily Bread
    function() t[1781] = a:New(1781); end, -- Critter Gitter
    function() t[1780] = a:New(1780); end, -- Second That Emotion
    function() t[1779] = a:New(1779); end, -- The Northrend Gourmet
    function() t[1778] = a:New(1778); end, -- The Northrend Gourmet
    function() t[1777] = a:New(1777); end, -- The Northrend Gourmet
    function() O(t[1766], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1766] = a:New(1766, nil, nil, true); end, -- Ancient Protector
    function() O(t[1765], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1765] = a:New(1765, nil, nil, true); end, -- Steady Hands
    function() O(t[1764], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1764] = a:New(1764, nil, nil, true); end, -- Drop It!
    function() O(t[1763], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1763] = a:New(1763, nil, nil, true); end, -- Artillery Veteran
    function() O(t[1762], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1762] = a:New(1762, f.Alliance, 2192, true); end, -- Not Even a Scratch
    function() O(t[1761], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1761] = a:New(1761, nil, nil, true); end, -- The Dapper Sapper
    function() O(t[1757], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1757] = a:New(1757, f.Alliance, 2200, true); end, -- Defense of the Ancients
    function() t[1755] = a:New(1755, nil, nil, true); end, -- Within Our Grasp
    function() t[1752] = a:New(1752, f.Alliance, nil, true); end, -- Master of Wintergrasp
    function() t[1751] = a:New(1751, nil, nil, true); end, -- Didn't Stand a Chance
    function() t[1737] = a:New(1737, f.Alliance, 2476, true); end, -- Destruction Derby
    function() t[1727] = a:New(1727, nil, nil, true); end, -- Leaning Tower
    function() t[1723] = a:New(1723, nil, nil, true); end, -- Vehicular Gnomeslaughter
    function() t[1722] = a:New(1722); end, -- Archavon the Stone Watcher (10 player)
    function() t[1721] = a:New(1721); end, -- Archavon the Stone Watcher (25 player)
    function() t[1718] = a:New(1718, nil, nil, true); end, -- Wintergrasp Veteran
    function() t[1717] = a:New(1717, nil, nil, true); end, -- Wintergrasp Victory
    function() t[1707] = a:New(1707, f.Alliance); end, -- Fool For Love
    function() t[1706] = a:New(1706); end, -- Crashin' Thrashin' Racer
    function() t[1705] = a:New(1705); end, -- Clockwork Rocket Bot
    function() t[1704] = a:New(1704); end, -- I Pitied The Fool
    function() t[1703] = a:New(1703); end, -- "My Love is Like a Red, Red Rose"
    function() t[1702] = a:New(1702); end, -- Sweet Tooth
    function() t[1701] = a:New(1701); end, -- Be Mine!
    function() t[1700] = a:New(1700); end, -- Perma-Peddle
    function() t[1699] = a:New(1699); end, -- Fistful of Love
    function() t[1698] = a:New(1698, f.Horde, 1697); end, -- Nation of Adoration
    function() t[1697] = a:New(1697, f.Alliance, 1698); end, -- Nation of Adoration
    function() t[1696] = a:New(1696); end, -- The Rocket's Pink Glare
    function() t[1695] = a:New(1695); end, -- Dangerous Love
    function() t[1694] = a:New(1694); end, -- Lovely Luck Is On Your Side
    function() t[1693] = a:New(1693, f.Horde); end, -- Fool For Love
    function() t[1692] = a:New(1692, f.Alliance); end, -- Merrymaker
    function() t[1691] = a:New(1691, f.Horde); end, -- Merrymaker
    function() t[1690] = a:New(1690); end, -- A Frosty Shake
    function() t[1689] = a:New(1689); end, -- He Knows If You've Been Naughty
    function() t[1688] = a:New(1688); end, -- The Winter Veil Gourmet
    function() t[1687] = a:New(1687); end, -- Let It Snow
    function() t[1686] = a:New(1686, f.Alliance, 1685); end, -- Holiday Bromance
    function() t[1685] = a:New(1685, f.Horde, 1686); end, -- Holiday Bromance
    function() t[1684] = a:New(1684, f.Alliance); end, -- Brewmaster
    function() t[1683] = a:New(1683, f.Horde); end, -- Brewmaster
    function() t[1682] = a:New(1682, f.Horde); end, -- The Loremaster
    function() t[1681] = a:New(1681, f.Alliance); end, -- The Loremaster
    function() t[1680] = a:New(1680, f.Horde); end, -- Loremaster of Kalimdor
    function() t[1678] = a:New(1678, f.Alliance); end, -- Loremaster of Kalimdor
    function() t[1677] = a:New(1677, f.Horde); end, -- Loremaster of Eastern Kingdoms
    function() t[1676] = a:New(1676, f.Alliance); end, -- Loremaster of Eastern Kingdoms
    function() t[1658] = a:New(1658); end, -- Champion of the Frozen Wastes
    function() t[1657] = a:New(1657, f.Horde); end, -- Hallowed Be Thy Name
    function() t[1656] = a:New(1656, f.Alliance); end, -- Hallowed Be Thy Name
    function() t[1638] = a:New(1638); end, -- Skyshattered
    function() O(t[1637]); end,
    function() t[1637] = a:New(1637); end, -- Spirit of Competition
    function() O(t[1636]); end,
    function() t[1636] = a:New(1636); end, -- Competitor's Tabard
    function() t[1596] = a:New(1596); end, -- Guru of Drakuru
    function() t[1576] = a:New(1576); end, -- Of Blood and Anguish
    function() t[1563] = a:New(1563, f.Alliance); end, -- Hail to the Chef
    function() t[1561] = a:New(1561); end, -- 1000 Fish
    function() t[1560] = a:New(1560); end, -- 500 Fish
    function() t[1559] = a:New(1559); end, -- 250 Fish
    function() t[1558] = a:New(1558); end, -- 100 Fish
    function() t[1557] = a:New(1557); end, -- 50 Fish
    function() t[1556] = a:New(1556); end, -- 25 Fish
    function() t[1552] = a:New(1552); end, -- Frenzied Firecracker
    function() t[1517] = a:New(1517); end, -- Northrend Angler
    function() t[1516] = a:New(1516); end, -- Accomplished Angler
    function() t[1502] = a:New(1502, f.Horde, 202, true); end, -- Quick Cap
    function() O(t[1463], "Once"); end,
    function() t[1463] = a:New(1463, nil, nil, nil, true); end, -- Realm First! Northrend Vanguard
    function() t[1457] = a:New(1457); end, -- Explore Crystalsong Forest
    function() O(t[1436]); end,
    function() t[1436] = a:New(1436); end, -- Friends In High Places
    function() t[1428] = a:New(1428); end, -- Mine Sweeper
    function() O(t[1427], "Once"); end,
    function() t[1427] = a:New(1427, nil, nil, nil, true); end, -- Realm First! Grand Master Tailor
    function() O(t[1426], "Once"); end,
    function() t[1426] = a:New(1426, nil, nil, nil, true); end, -- Realm First! Grand Master Skinner
    function() O(t[1425], "Once"); end,
    function() t[1425] = a:New(1425, nil, nil, nil, true); end, -- Realm First! Grand Master Miner
    function() O(t[1424], "Once"); end,
    function() t[1424] = a:New(1424, nil, nil, nil, true); end, -- Realm First! Grand Master Leatherworker
    function() O(t[1423], "Once"); end,
    function() t[1423] = a:New(1423, nil, nil, nil, true); end, -- Realm First! Grand Master Jewelcrafter
    function() O(t[1422], "Once"); end,
    function() t[1422] = a:New(1422, nil, nil, nil, true); end, -- Realm First! Grand Master Scribe
    function() O(t[1421], "Once"); end,
    function() t[1421] = a:New(1421, nil, nil, nil, true); end, -- Realm First! Grand Master Herbalist
    function() O(t[1420], "Once"); end,
    function() t[1420] = a:New(1420, nil, nil, nil, true); end, -- Realm First! Grand Master Angler
    function() O(t[1419], "Once"); end,
    function() t[1419] = a:New(1419, nil, nil, nil, true); end, -- Realm First! Grand Master Medic
    function() O(t[1418], "Once"); end,
    function() t[1418] = a:New(1418, nil, nil, nil, true); end, -- Realm First! Grand Master Engineer
    function() O(t[1417], "Once"); end,
    function() t[1417] = a:New(1417, nil, nil, nil, true); end, -- Realm First! Grand Master Enchanter
    function() O(t[1416], "Once"); end,
    function() t[1416] = a:New(1416, nil, nil, nil, true); end, -- Realm First! Grand Master Cook
    function() O(t[1415], "Once"); end,
    function() t[1415] = a:New(1415, nil, nil, nil, true); end, -- Realm First! Grand Master Alchemist
    function() O(t[1414], "Once"); end,
    function() t[1414] = a:New(1414, nil, nil, nil, true); end, -- Realm First! Grand Master Blacksmith
    function() O(t[1413], "Once"); end,
    function() t[1413] = a:New(1413, nil, nil, nil, true); end, -- Realm First! Level 80 Forsaken
    function() O(t[1412], "Once"); end,
    function() t[1412] = a:New(1412, nil, nil, nil, true); end, -- Realm First! Level 80 Troll
    function() O(t[1411], "Once"); end,
    function() t[1411] = a:New(1411, nil, nil, nil, true); end, -- Realm First! Level 80 Tauren
    function() O(t[1410], "Once"); end,
    function() t[1410] = a:New(1410, nil, nil, nil, true); end, -- Realm First! Level 80 Orc
    function() O(t[1409], "Once"); end,
    function() t[1409] = a:New(1409, nil, nil, nil, true); end, -- Realm First! Level 80 Night Elf
    function() O(t[1408], "Once"); end,
    function() t[1408] = a:New(1408, nil, nil, nil, true); end, -- Realm First! Level 80 Human
    function() O(t[1407], "Once"); end,
    function() t[1407] = a:New(1407, nil, nil, nil, true); end, -- Realm First! Level 80 Dwarf
    function() O(t[1406], "Once"); end,
    function() t[1406] = a:New(1406, nil, nil, nil, true); end, -- Realm First! Level 80 Draenei
    function() O(t[1405], "Once"); end,
    function() t[1405] = a:New(1405, nil, nil, nil, true); end, -- Realm First! Level 80 Blood Elf
    function() O(t[1404], "Once"); end,
    function() t[1404] = a:New(1404, nil, nil, nil, true); end, -- Realm First! Level 80 Gnome
    function() O(t[1402], "Once"); end,
    function() t[1402] = a:New(1402, nil, nil, nil, true); end, -- Realm First! Conqueror of Naxxramas
    function() O(t[1400], "Once"); end,
    function() t[1400] = a:New(1400, nil, nil, nil, true); end, -- Realm First! Magic Seeker
    function() t[1396] = a:New(1396); end, -- Elders of Northrend
    function() t[1360] = a:New(1360, f.Horde); end, -- Loremaster of Northrend
    function() t[1359] = a:New(1359, f.Horde, 35); end, -- Might of Dragonblight
    function() t[1358] = a:New(1358, f.Horde, 33); end, -- Nothing Boring About Borean
    function() t[1357] = a:New(1357, f.Horde, 37); end, -- Fo' Grizzle My Shizzle
    function() t[1356] = a:New(1356, f.Horde, 34); end, -- I've Toured the Fjord
    function() t[1312] = a:New(1312); end, -- Bloody Rare
    function() t[1311] = a:New(1311); end, -- Medium Rare
    function() O(t[1310], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1310] = a:New(1310, nil, nil, true); end, -- Storm the Beach
    function() O(t[1309], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1309] = a:New(1309, nil, nil, true); end, -- Strand of the Ancients Veteran
    function() O(t[1308], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[1308] = a:New(1308, nil, nil, true); end, -- Strand of the Ancients Victory
    function() O(t[1307], "From", "Version", "030002", "Before", "Version", "060002"); end,
    function() t[1307] = a:New(1307); end, -- Upper Blackrock Spire (Classic)
    function() t[1297] = a:New(1297); end, -- Hadronox Denied
    function() t[1296] = a:New(1296); end, -- Watch Him Die
    function() t[1295] = a:New(1295); end, -- Crashin' & Thrashin'
    function() O(t[1293]); end,
    function() t[1293] = a:New(1293); end, -- Blue Brewfest Stein
    function() O(t[1292]); end,
    function() t[1292] = a:New(1292); end, -- Yellow Brewfest Stein
    function() t[1291] = a:New(1291); end, -- Lonely?
    function() t[1289] = a:New(1289); end, -- Northrend Dungeon Hero
    function() t[1288] = a:New(1288); end, -- Northrend Dungeonmaster
    function() t[1287] = a:New(1287); end, -- Outland Dungeon Hero
    function() t[1286] = a:New(1286); end, -- Outland Raider
    function() t[1285] = a:New(1285); end, -- Classic Raider
    function() t[1284] = a:New(1284); end, -- Outland Dungeonmaster
    function() t[1283] = a:New(1283); end, -- Classic Dungeonmaster
    function() t[1282] = a:New(1282); end, -- Fa-la-la-la-Ogri'la
    function() t[1281] = a:New(1281); end, -- The Rocket's Red Glare
    function() t[1280] = a:New(1280, f.Horde, 1279); end, -- Flirt With Disaster
    function() t[1279] = a:New(1279, f.Alliance, 1280); end, -- Flirt With Disaster
    function() t[1277] = a:New(1277); end, -- Rapid Defense
    function() t[1276] = a:New(1276); end, -- Blade's Edge Bomberman
    function() t[1275] = a:New(1275); end, -- Bombs Away
    function() t[1274] = a:New(1274, f.Horde); end, -- Loremaster of Outland
    function() t[1273] = a:New(1273, f.Horde, 1192); end, -- Nagrand Slam
    function() t[1272] = a:New(1272, f.Horde, 1191); end, -- Terror of Terokkar
    function() t[1271] = a:New(1271, f.Horde, 1189); end, -- To Hellfire and Back
    function() t[1270] = a:New(1270); end, -- Explore Icecrown
    function() t[1269] = a:New(1269); end, -- Explore Storm Peaks
    function() t[1268] = a:New(1268); end, -- Explore Sholazar Basin
    function() t[1267] = a:New(1267); end, -- Explore Zul'Drak
    function() t[1266] = a:New(1266); end, -- Explore Grizzly Hills
    function() t[1265] = a:New(1265); end, -- Explore Dragonblight
    function() t[1264] = a:New(1264); end, -- Explore Borean Tundra
    function() t[1263] = a:New(1263); end, -- Explore Howling Fjord
    function() t[1262] = a:New(1262, f.Alliance); end, -- Loremaster of Outland
    function() t[1261] = a:New(1261); end, -- G.N.E.R.D. Rage
    function() t[1260] = a:New(1260); end, -- Almost Blind Luck
    function() t[1259] = a:New(1259, nil, nil, true); end, -- Not So Fast
    function() t[1258] = a:New(1258, nil, nil, true); end, -- Take a Chill Pill
    function() t[1257] = a:New(1257); end, -- The Scavenger
    function() t[1255] = a:New(1255, f.Alliance, 259); end, -- Scrooge
    function() t[1254] = a:New(1254); end, -- Friend or Fowl?
    function() t[1252] = a:New(1252, f.Horde, 206, true); end, -- Supreme Defender
    function() t[1251] = a:New(1251, f.Horde, 203, true); end, -- Not In My House
    function() t[1250] = a:New(1250); end, -- "Shop Smart, Shop Pet...Smart"
    function() t[1248] = a:New(1248); end, -- Plethora of Pets
    function() t[1244] = a:New(1244); end, -- Well Read
    function() t[1243] = a:New(1243); end, -- Fish Don't Leave Footprints
    function() t[1225] = a:New(1225); end, -- Outland Angler
    function() t[1206] = a:New(1206); end, -- To All The Squirrels I've Loved Before
    function() t[1205] = a:New(1205); end, -- Hero of Shattrath
    function() t[1203] = a:New(1203, f.Horde, 1184); end, -- Strange Brew
    function() t[1195] = a:New(1195); end, -- Shadow of the Betrayer
    function() t[1194] = a:New(1194); end, -- Into the Nether
    function() t[1193] = a:New(1193); end, -- On the Blade's Edge
    function() t[1192] = a:New(1192, f.Alliance, 1273); end, -- Nagrand Slam
    function() t[1191] = a:New(1191, f.Alliance, 1272); end, -- Terror of Terokkar
    function() t[1190] = a:New(1190); end, -- Mysteries of the Marsh
    function() t[1189] = a:New(1189, f.Alliance, 1271); end, -- To Hellfire and Back
    function() t[1188] = a:New(1188); end, -- Shafted!
    function() O(t[1187], "From", "Version", "030002", "Before", "Version", "040003a"); end,
    function() t[1187] = a:New(1187); end, -- The Keymaster
    function() O(t[1186], "From", "Version", "030002", "Before", "Version", "080200"); end,
    function() t[1186] = a:New(1186); end, -- Down With The Dark Iron
    function() t[1185] = a:New(1185); end, -- The Brewfest Diet
    function() t[1184] = a:New(1184, f.Alliance, 1203); end, -- Strange Brew
    function() t[1183] = a:New(1183); end, -- Brew of the Year
    function() t[1182] = a:New(1182); end, -- The Bread Winner
    function() t[1181] = a:New(1181); end, -- Got My Mind On My Money
    function() t[1180] = a:New(1180); end, -- Got My Mind On My Money
    function() t[1178] = a:New(1178); end, -- Got My Mind On My Money
    function() t[1177] = a:New(1177); end, -- Got My Mind On My Money
    function() t[1176] = a:New(1176); end, -- Got My Mind On My Money
    function() t[1175] = a:New(1175, f.Horde, 230, true); end, -- Battlemaster
    function() O(t[1174], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[1174] = a:New(1174, nil, nil, true); end, -- The Arena Master
    function() t[1173] = a:New(1173, f.Horde); end, -- Master of Warsong Gulch
    function() t[1172] = a:New(1172, f.Alliance, nil, true); end, -- Master of Warsong Gulch
    function() t[1171] = a:New(1171, nil, nil, true); end, -- Master of Eye of the Storm
    function() t[1170] = a:New(1170, f.Horde); end, -- Master of Arathi Basin
    function() t[1169] = a:New(1169, f.Alliance, nil, true); end, -- Master of Arathi Basin
    function() t[1168] = a:New(1168, f.Horde); end, -- Master of Alterac Valley
    function() t[1167] = a:New(1167, f.Alliance, nil, true); end, -- Master of Alterac Valley
    function() t[1166] = a:New(1166, nil, nil, true); end, -- To the Looter Go the Spoils
    function() t[1165] = a:New(1165); end, -- "My Storage is ""Gigantique"""
    function() t[1164] = a:New(1164, f.Horde, 225, true); end, -- Everything Counts
    function() t[1162] = a:New(1162, nil, nil, true); end, -- Hotter Streak
    function() O(t[1161], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[1161] = a:New(1161, nil, nil, true); end, -- High Five: 2200
    function() t[1160] = a:New(1160, nil, nil, true); end, -- Three's Company: 2200
    function() t[1159] = a:New(1159, nil, nil, true); end, -- Just the Two of Us: 2200
    function() t[1157] = a:New(1157, nil, nil, true); end, -- Duel-icious
    function() t[1153] = a:New(1153, nil, nil, true); end, -- Overly Defensive
    function() t[1151] = a:New(1151, f.Alliance, 224, true); end, -- Loyal Defender
    function() t[1145] = a:New(1145); end, -- King of the Fire Festival
    function() t[1041] = a:New(1041, f.Horde, 1040); end, -- Rotten Hallow
    function() t[1040] = a:New(1040, f.Alliance, 1041); end, -- Rotten Hallow
    function() t[1039] = a:New(1039, f.Horde, 1038); end, -- The Flame Keeper
    function() t[1038] = a:New(1038, f.Alliance, 1039); end, -- The Flame Warden
    function() t[1037] = a:New(1037, f.Horde, 1035); end, -- Desecration of the Alliance
    function() t[1036] = a:New(1036, f.Horde, 1034); end, -- The Fires of Azeroth
    function() t[1035] = a:New(1035, f.Alliance, 1037); end, -- Desecration of the Horde
    function() t[1034] = a:New(1034, f.Alliance, 1036); end, -- The Fires of Azeroth
    function() t[1033] = a:New(1033, f.Horde, 1030); end, -- Extinguishing Outland
    function() t[1032] = a:New(1032, f.Horde, 1029); end, -- Extinguishing Kalimdor
    function() t[1031] = a:New(1031, f.Horde, 1028); end, -- Extinguishing Eastern Kingdoms
    function() t[1030] = a:New(1030, f.Alliance, 1033); end, -- Extinguishing Outland
    function() t[1029] = a:New(1029, f.Alliance, 1032); end, -- Extinguishing Kalimdor
    function() t[1028] = a:New(1028, f.Alliance, 1031); end, -- Extinguishing Eastern Kingdoms
    function() t[1027] = a:New(1027, f.Horde, 1024); end, -- Flame Keeper of Outland
    function() t[1026] = a:New(1026, f.Horde, 1023); end, -- Flame Keeper of Kalimdor
    function() t[1025] = a:New(1025, f.Horde, 1022); end, -- Flame Keeper of Eastern Kingdoms
    function() t[1024] = a:New(1024, f.Alliance, 1027); end, -- Flame Warden of Outland
    function() t[1023] = a:New(1023, f.Alliance, 1026); end, -- Flame Warden of Kalimdor
    function() t[1022] = a:New(1022, f.Alliance, 1025); end, -- Flame Warden of Eastern Kingdoms
    function() t[1021] = a:New(1021); end, -- Twenty-Five Tabards
    function() t[1020] = a:New(1020); end, -- Ten Tabards
    function() t[1017] = a:New(1017); end, -- Can I Keep Him?
    function() t[1015] = a:New(1015); end, -- 40 Exalted Reputations
    function() t[1014] = a:New(1014); end, -- 35 Exalted Reputations
    function() t[1012] = a:New(1012, f.Alliance, 1011); end, -- The Winds of the North
    function() t[1011] = a:New(1011, f.Horde, 1012); end, -- The Winds of the North
    function() t[1010] = a:New(1010); end, -- Northrend Vanguard
    function() t[1009] = a:New(1009); end, -- Knights of the Ebon Blade
    function() t[1008] = a:New(1008); end, -- The Kirin Tor
    function() t[1007] = a:New(1007); end, -- The Wyrmrest Accord
    function() t[1006] = a:New(1006, f.Horde, 388, true); end, -- City Defender
    function() t[1005] = a:New(1005, f.Horde, 246, true); end, -- Know Thy Enemy
    function() t[981] = a:New(981); end, -- That Sparkling Smile
    function() t[980] = a:New(980); end, -- The Horseman's Reins
    function() t[979] = a:New(979); end, -- The Mask Task
    function() t[978] = a:New(978); end, -- 3000 Quests Completed
    function() t[977] = a:New(977); end, -- 1000 Daily Quests Completed
    function() t[976] = a:New(976); end, -- 500 Daily Quests Completed
    function() t[975] = a:New(975); end, -- 200 Daily Quests Completed
    function() t[974] = a:New(974); end, -- 50 Daily Quests Completed
    function() t[973] = a:New(973); end, -- 5 Daily Quests Completed
    function() t[972] = a:New(972); end, -- Trick or Treat!
    function() t[971] = a:New(971, f.Horde); end, -- Tricks and Treats of Azeroth
    function() t[970] = a:New(970, f.Alliance); end, -- Tricks and Treats of Azeroth
    function() t[969] = a:New(969, f.Alliance, 968); end, -- Tricks and Treats of Outland
    function() t[968] = a:New(968, f.Horde, 969); end, -- Tricks and Treats of Outland
    function() t[967] = a:New(967, f.Horde, 966); end, -- Tricks and Treats of Eastern Kingdoms
    function() t[966] = a:New(966, f.Alliance, 967); end, -- Tricks and Treats of Eastern Kingdoms
    function() t[965] = a:New(965, f.Horde, 963); end, -- Tricks and Treats of Kalimdor
    function() t[964] = a:New(964); end, -- Going Down?
    function() t[963] = a:New(963, f.Alliance, 965); end, -- Tricks and Treats of Kalimdor
    function() t[962] = a:New(962); end, -- Savior of the Oracles
    function() t[961] = a:New(961); end, -- Honorary Frenzyheart
    function() t[960] = a:New(960); end, -- The Violet Eye
    function() t[959] = a:New(959); end, -- The Scale of the Sands
    function() t[958] = a:New(958); end, -- Sworn to the Deathsworn
    function() O(t[957], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[957] = a:New(957); end, -- Hero of the Zandalar Tribe
    function() t[956] = a:New(956); end, -- Brood of Nozdormu
    function() t[955] = a:New(955); end, -- Hydraxian Waterlords
    function() t[953] = a:New(953); end, -- Guardian of Cenarius
    function() t[952] = a:New(952); end, -- Mercenary of Sholazar
    function() t[951] = a:New(951); end, -- The Oracles
    function() t[950] = a:New(950); end, -- Frenzyheart Tribe
    function() t[949] = a:New(949); end, -- Tuskarrmageddon
    function() t[948] = a:New(948, f.Alliance, 762); end, -- Ambassador of the Alliance
    function() t[947] = a:New(947); end, -- The Argent Crusade
    function() t[946] = a:New(946); end, -- The Argent Dawn
    function() t[945] = a:New(945); end, -- The Argent Champion
    function() t[944] = a:New(944); end, -- They Love Me In That Tunnel
    function() t[943] = a:New(943, f.Horde, 942); end, -- The Diplomat
    function() t[942] = a:New(942, f.Alliance, 943); end, -- The Diplomat
    function() t[941] = a:New(941); end, -- Hemet Nesingwary: The Collected Quests
    function() t[940] = a:New(940); end, -- The Green Hills of Stranglethorn
    function() t[939] = a:New(939); end, -- Hills Like White Elekk
    function() t[938] = a:New(938); end, -- The Snows of Northrend
    function() t[937] = a:New(937); end, -- Elune's Blessing
    function() t[915] = a:New(915); end, -- Elders of the Alliance
    function() t[914] = a:New(914); end, -- Elders of the Horde
    function() t[913] = a:New(913); end, -- To Honor One's Elders
    function() t[912] = a:New(912); end, -- Elders of Eastern Kingdoms
    function() t[911] = a:New(911); end, -- Elders of Kalimdor
    function() t[910] = a:New(910); end, -- Elders of the Dungeons
    function() t[909] = a:New(909, f.Horde, 908, true); end, -- Call to Arms!
    function() t[908] = a:New(908, f.Alliance, 909, true); end, -- Call to Arms!
    function() t[907] = a:New(907, f.Alliance, 714, true); end, -- The Justicar
    function() t[906] = a:New(906); end, -- Kickin' It Up a Notch
    function() t[905] = a:New(905); end, -- Old Man Barlowned
    function() t[903] = a:New(903); end, -- Shattrath Divided
    function() t[902] = a:New(902); end, -- Chief Exalted Officer
    function() t[901] = a:New(901, f.Horde, 899); end, -- Mag'har of Draenor
    function() t[900] = a:New(900); end, -- The Czar of Sporeggar
    function() t[899] = a:New(899, f.Alliance, 901); end, -- "Oh My, Kurenai"
    function() t[898] = a:New(898); end, -- On Wings of Nether
    function() t[897] = a:New(897); end, -- You're So Offensive
    function() t[896] = a:New(896); end, -- A Quest a Day Keeps the Ogres at Bay
    function() t[894] = a:New(894); end, -- Flying High Over Skettis
    function() t[893] = a:New(893); end, -- Cenarion War Hippogryph
    function() O(t[892], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[892] = a:New(892); end, -- The Right Stuff
    function() t[891] = a:New(891); end, -- Giddy Up!
    function() t[890] = a:New(890); end, -- Into the Wild Blue Yonder
    function() t[889] = a:New(889); end, -- Fast and Furious
    function() O(t[888], "From", "PvP Season", 3, "Until", "PvP Season", 3); end,
    function() t[888] = a:New(888, nil, nil, true); end, -- Vengeful Nether Drake
    function() O(t[887], "From", "PvP Season", 2, "Until", "PvP Season", 2); end,
    function() t[887] = a:New(887, nil, nil, true); end, -- Merciless Nether Drake
    function() O(t[886], "From", "PvP Season", 1, "Until", "PvP Season", 1); end,
    function() t[886] = a:New(886, nil, nil, true); end, -- Swift Nether Drake
    function() t[885] = a:New(885); end, -- Ashes of Al'ar
    function() t[884] = a:New(884); end, -- Swift White Hawkstrider
    function() t[883] = a:New(883); end, -- Reins of the Raven Lord
    function() t[882] = a:New(882); end, -- Fiery Warhorse's Reins
    function() O(t[881], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[881] = a:New(881); end, -- Swift Razzashi Raptor
    function() O(t[880], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[880] = a:New(880); end, -- Swift Zulian Tiger
    function() O(t[879]); end,
    function() t[879] = a:New(879); end, -- Old School Ride
    function() t[878] = a:New(878); end, -- One That Didn't Get Away
    function() t[877] = a:New(877); end, -- The Cake Is Not A Lie
    function() t[876] = a:New(876, nil, nil, true); end, -- Brutally Dedicated
    function() t[875] = a:New(875, nil, nil, true); end, -- Vengefully Dedicated
    function() t[873] = a:New(873, f.Horde, 220, true); end, -- Frostwolf Perfection
    function() t[872] = a:New(872, nil, nil, true); end, -- Frenzied Defender
    function() t[871] = a:New(871); end, -- "Avast Ye, Admiral!"
    function() t[870] = a:New(870, nil, nil, true); end, -- 100000 Honorable Kills
    function() t[869] = a:New(869, nil, nil, true); end, -- 50000 Honorable Kills
    function() t[868] = a:New(868); end, -- Explore Isle of Quel'Danas
    function() t[867] = a:New(867); end, -- Explore Terokkar Forest
    function() t[866] = a:New(866); end, -- Explore Nagrand
    function() t[865] = a:New(865); end, -- Explore Blade's Edge Mountains
    function() t[864] = a:New(864); end, -- Explore Shadowmoon Valley
    function() t[863] = a:New(863); end, -- Explore Zangarmarsh
    function() t[862] = a:New(862); end, -- Explore Hellfire Peninsula
    function() t[861] = a:New(861); end, -- Explore Bloodmyst Isle
    function() t[860] = a:New(860); end, -- Explore Azuremyst Isle
    function() t[859] = a:New(859); end, -- Explore Eversong Woods
    function() t[858] = a:New(858); end, -- Explore Ghostlands
    function() t[857] = a:New(857); end, -- Explore Winterspring
    function() t[856] = a:New(856); end, -- Explore Silithus
    function() t[855] = a:New(855); end, -- Explore Moonglade
    function() t[854] = a:New(854); end, -- Explore Un'Goro Crater
    function() t[853] = a:New(853); end, -- Explore Felwood
    function() t[852] = a:New(852); end, -- Explore Azshara
    function() t[851] = a:New(851); end, -- Explore Tanaris
    function() t[850] = a:New(850); end, -- Explore Dustwallow Marsh
    function() t[849] = a:New(849); end, -- Explore Feralas
    function() t[848] = a:New(848); end, -- Explore Desolace
    function() t[847] = a:New(847); end, -- Explore Stonetalon Mountains
    function() t[846] = a:New(846); end, -- Explore Thousand Needles
    function() t[845] = a:New(845); end, -- Explore Ashenvale
    function() t[844] = a:New(844); end, -- Explore Darkshore
    function() t[843] = a:New(843); end, -- Explore Netherstorm
    function() t[842] = a:New(842); end, -- Explore Teldrassil
    function() t[841] = a:New(841); end, -- Explore Wetlands
    function() t[802] = a:New(802); end, -- Explore Westfall
    function() t[784] = a:New(784, nil, nil, true); end, -- Eye of the Storm Domination
    function() t[783] = a:New(783, nil, nil, true); end, -- The Perfect Storm
    function() t[782] = a:New(782); end, -- Explore Swamp of Sorrows
    function() t[781] = a:New(781); end, -- Explore Northern Stranglethorn
    function() t[780] = a:New(780); end, -- Explore Redridge Mountains
    function() t[779] = a:New(779); end, -- Explore Loch Modan
    function() t[778] = a:New(778); end, -- Explore Duskwood
    function() t[777] = a:New(777); end, -- Explore Deadwind Pass
    function() t[776] = a:New(776); end, -- Explore Elwynn Forest
    function() t[775] = a:New(775); end, -- Explore Burning Steppes
    function() t[774] = a:New(774); end, -- Explore Searing Gorge
    function() t[773] = a:New(773); end, -- Explore The Hinterlands
    function() t[772] = a:New(772); end, -- Explore Hillsbrad Foothills
    function() t[771] = a:New(771); end, -- Explore Eastern Plaguelands
    function() t[770] = a:New(770); end, -- Explore Western Plaguelands
    function() t[769] = a:New(769); end, -- Explore Silverpine Forest
    function() t[768] = a:New(768); end, -- Explore Tirisfal Glades
    function() t[766] = a:New(766); end, -- Explore Blasted Lands
    function() t[765] = a:New(765); end, -- Explore Badlands
    function() t[764] = a:New(764, f.Alliance, 763); end, -- The Burning Crusader
    function() t[763] = a:New(763, f.Horde, 764); end, -- The Burning Crusader
    function() t[762] = a:New(762, f.Horde, 948); end, -- Ambassador of the Horde
    function() t[761] = a:New(761); end, -- Explore Arathi Highlands
    function() t[760] = a:New(760); end, -- Explore Alterac Mountains
    function() t[750] = a:New(750); end, -- Explore Northern Barrens
    function() t[736] = a:New(736); end, -- Explore Mulgore
    function() t[735] = a:New(735); end, -- Working In the Cold
    function() t[734] = a:New(734); end, -- Professional Northrend Master
    function() t[733] = a:New(733); end, -- Professional Outland Master
    function() t[732] = a:New(732); end, -- Professional Classic Master
    function() t[731] = a:New(731); end, -- Professional Expert
    function() O(t[730], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[730] = a:New(730); end, -- Skills to Pay the Bills
    function() t[729] = a:New(729); end, -- Deathcharger's Reins
    function() t[728] = a:New(728); end, -- Explore Durotar
    function() t[727] = a:New(727, nil, nil, true); end, -- Call in the Cavalry
    function() t[726] = a:New(726); end, -- Mr. Pinchy's Magical Crawdad Box
    function() t[725] = a:New(725); end, -- "Thori'dal, the Stars' Fury"
    function() t[714] = a:New(714, f.Horde, 907, true); end, -- The Conqueror
    function() t[713] = a:New(713, f.Alliance, 712, true); end, -- Silverwing Sentinel
    function() t[712] = a:New(712, f.Horde, 713, true); end, -- Warsong Outrider
    function() t[711] = a:New(711, f.Alliance, 710, true); end, -- Knight of Arathor
    function() t[710] = a:New(710, f.Horde, 711, true); end, -- The Defiler
    function() t[709] = a:New(709, f.Alliance, 708, true); end, -- Hero of the Stormpike Guard
    function() t[708] = a:New(708, f.Horde, 709, true); end, -- Hero of the Frostwolf Clan
    function() t[707] = a:New(707, f.Alliance, 706, true); end, -- Stormpike Battle Charger
    function() t[706] = a:New(706, f.Horde, 707, true); end, -- Frostwolf Howler
    function() O(t[705], "From", "Version", "000304", "Before", "Version", "040001"); end,
    function() t[705] = a:New(705); end, -- Master of Arms
    function() O(t[701], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[701] = a:New(701, f.Alliance, 700, true); end, -- Freedom of the Alliance
    function() O(t[700], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[700] = a:New(700, f.Horde, 701, true); end, -- Freedom of the Horde
    function() t[699] = a:New(699, nil, nil, true); end, -- World Wide Winner
    function() t[698] = a:New(698); end, -- Sunwell Plateau
    function() t[697] = a:New(697); end, -- The Black Temple
    function() t[696] = a:New(696); end, -- Tempest Keep
    function() t[695] = a:New(695); end, -- The Battle for Mount Hyjal
    function() t[694] = a:New(694); end, -- Serpentshrine Cavern
    function() t[693] = a:New(693); end, -- Magtheridon's Lair
    function() t[692] = a:New(692); end, -- Gruul's Lair
    function() O(t[691], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[691] = a:New(691); end, -- Zul'Aman
    function() t[690] = a:New(690); end, -- Karazhan
    function() t[689] = a:New(689); end, -- Ruins of Ahn'Qiraj
    function() O(t[688], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[688] = a:New(688); end, -- Zul'Gurub
    function() t[687] = a:New(687); end, -- Temple of Ahn'Qiraj
    function() t[686] = a:New(686); end, -- Molten Core
    function() t[685] = a:New(685); end, -- Blackwing Lair
    function() O(t[684], "Never"); end,
    function() t[684] = a:New(684); end, -- Onyxia's Lair (Level 60)
    function() t[683] = a:New(683); end, -- Collector's Edition: Frost Wyrm Whelp
    function() t[682] = a:New(682); end, -- Heroic: Magister's Terrace
    function() t[681] = a:New(681); end, -- Heroic: The Arcatraz
    function() t[680] = a:New(680); end, -- Heroic: The Botanica
    function() t[679] = a:New(679); end, -- Heroic: The Mechanar
    function() t[678] = a:New(678); end, -- Heroic: The Shattered Halls
    function() t[677] = a:New(677); end, -- Heroic: The Steamvault
    function() t[676] = a:New(676); end, -- Heroic: Opening of the Dark Portal
    function() t[675] = a:New(675); end, -- Heroic: Shadow Labyrinth
    function() t[674] = a:New(674); end, -- Heroic: Sethekk Halls
    function() t[673] = a:New(673); end, -- Heroic: The Escape From Durnholde
    function() t[672] = a:New(672); end, -- Heroic: Auchenai Crypts
    function() t[671] = a:New(671); end, -- Heroic: Mana-Tombs
    function() t[670] = a:New(670); end, -- Heroic: Underbog
    function() t[669] = a:New(669); end, -- Heroic: The Slave Pens
    function() t[668] = a:New(668); end, -- Heroic: The Blood Furnace
    function() t[667] = a:New(667); end, -- Heroic: Hellfire Ramparts
    function() t[666] = a:New(666); end, -- Auchenai Crypts
    function() t[665] = a:New(665); end, -- Collector's Edition: Netherwhelp
    function() t[664] = a:New(664); end, -- Collector's Edition: Zergling
    function() t[663] = a:New(663); end, -- Collector's Edition: Panda
    function() t[662] = a:New(662); end, -- Collector's Edition: Mini-Diablo
    function() t[661] = a:New(661); end, -- Magister's Terrace
    function() t[660] = a:New(660); end, -- The Arcatraz
    function() t[659] = a:New(659); end, -- The Botanica
    function() t[658] = a:New(658); end, -- The Mechanar
    function() t[657] = a:New(657); end, -- The Shattered Halls
    function() t[656] = a:New(656); end, -- The Steamvault
    function() t[655] = a:New(655); end, -- Opening of the Dark Portal
    function() t[654] = a:New(654); end, -- Shadow Labyrinth
    function() t[653] = a:New(653); end, -- Sethekk Halls
    function() t[652] = a:New(652); end, -- The Escape From Durnholde
    function() t[651] = a:New(651); end, -- Mana-Tombs
    function() t[650] = a:New(650); end, -- Underbog
    function() t[649] = a:New(649); end, -- The Slave Pens
    function() t[648] = a:New(648); end, -- The Blood Furnace
    function() t[647] = a:New(647); end, -- Hellfire Ramparts
    function() t[646] = a:New(646); end, -- Stratholme
    function() t[645] = a:New(645); end, -- Scholomance
    function() t[644] = a:New(644); end, -- King of Dire Maul
    function() t[643] = a:New(643); end, -- Lower Blackrock Spire
    function() t[642] = a:New(642); end, -- Blackrock Depths
    function() t[641] = a:New(641); end, -- Sunken Temple
    function() t[640] = a:New(640); end, -- Maraudon
    function() t[639] = a:New(639); end, -- Zul'Farrak
    function() t[638] = a:New(638); end, -- Uldaman
    function() t[637] = a:New(637); end, -- Scarlet Monastery
    function() t[636] = a:New(636); end, -- Razorfen Downs
    function() t[635] = a:New(635); end, -- Razorfen Kraul
    function() t[634] = a:New(634); end, -- Gnomeregan
    function() t[633] = a:New(633); end, -- Stormwind Stockade
    function() t[632] = a:New(632); end, -- Blackfathom Deeps
    function() t[631] = a:New(631); end, -- Shadowfang Keep
    function() t[630] = a:New(630); end, -- Wailing Caverns
    function() t[629] = a:New(629); end, -- Ragefire Chasm
    function() t[628] = a:New(628); end, -- Deadmines
    function() t[627] = a:New(627); end, -- Explore Dun Morogh
    function() t[626] = a:New(626); end, -- Lunar Festival Finery
    function() t[625] = a:New(625); end, -- Besting the Black Dragonflight (25 player)
    function() t[624] = a:New(624); end, -- Less Is More (10 player)
    function() t[623] = a:New(623); end, -- The Spellweaver's Downfall (25 player)
    function() t[622] = a:New(622); end, -- The Spellweaver's Downfall (10 player)
    function() t[621] = a:New(621); end, -- Represent
    function() t[619] = a:New(619, f.Horde, 614, true); end, -- For the Horde!
    function() t[618] = a:New(618, f.Horde, 613, true); end, -- Putting Out the Light
    function() O(t[617], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[617] = a:New(617, f.Horde, 612, true); end, -- Immortal No More
    function() t[616] = a:New(616, f.Horde, 611, true); end, -- Overthrow the Council
    function() O(t[615], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[615] = a:New(615, f.Horde, 610, true); end, -- Storming Stormwind
    function() t[614] = a:New(614, f.Alliance, 619, true); end, -- For the Alliance!
    function() t[613] = a:New(613, f.Alliance, 618, true); end, -- Killed in Quel'Thalas
    function() O(t[612], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[612] = a:New(612, f.Alliance, 617, true); end, -- Downing the Dark Lady
    function() O(t[611], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[611] = a:New(611, f.Alliance, 616, true); end, -- Bleeding Bloodhoof
    function() O(t[610], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[610] = a:New(610, f.Alliance, 615, true); end, -- Orgrimmar Offensive
    function() t[609] = a:New(609); end, -- 50 Coins of Ancestry
    function() t[608] = a:New(608); end, -- 25 Coins of Ancestry
    function() t[607] = a:New(607); end, -- 10 Coins of Ancestry
    function() t[606] = a:New(606); end, -- 5 Coins of Ancestry
    function() t[605] = a:New(605); end, -- A Coin of Ancestry
    function() t[604] = a:New(604, f.Alliance, 603, true); end, -- Wrath of the Alliance
    function() t[603] = a:New(603, f.Horde, 604, true); end, -- Wrath of the Horde
    function() t[587] = a:New(587, nil, nil, true); end, -- Stormy Assassin
    function() t[584] = a:New(584, nil, nil, true); end, -- Arathi Basin Assassin
    function() t[583] = a:New(583, nil, nil, true); end, -- Arathi Basin All-Star
    function() t[582] = a:New(582, nil, nil, true); end, -- Alterac Valley All-Star
    function() t[579] = a:New(579); end, -- The Dedicated Few (25 player)
    function() t[578] = a:New(578); end, -- The Dedicated Few (10 player)
    function() t[577] = a:New(577); end, -- The Fall of Naxxramas (25 player)
    function() t[576] = a:New(576); end, -- The Fall of Naxxramas (10 player)
    function() t[575] = a:New(575); end, -- Kel'Thuzad's Defeat (25 player)
    function() t[574] = a:New(574); end, -- Kel'Thuzad's Defeat (10 player)
    function() t[573] = a:New(573); end, -- Sapphiron's Demise (25 player)
    function() t[572] = a:New(572); end, -- Sapphiron's Demise (10 player)
    function() t[569] = a:New(569); end, -- The Military Quarter (25 player)
    function() t[568] = a:New(568); end, -- The Military Quarter (10 player)
    function() t[567] = a:New(567); end, -- The Plague Quarter (25 player)
    function() t[566] = a:New(566); end, -- The Plague Quarter (10 player)
    function() t[565] = a:New(565); end, -- The Construct Quarter (25 player)
    function() t[564] = a:New(564); end, -- The Construct Quarter (10 player)
    function() t[563] = a:New(563); end, -- The Arachnid Quarter (25 player)
    function() t[562] = a:New(562); end, -- The Arachnid Quarter (10 player)
    function() t[561] = a:New(561); end, -- D.E.H.T.A's Little P.I.T.A.
    function() O(t[560], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[560] = a:New(560); end, -- Deadliest Catch
    function() O(t[559], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[559] = a:New(559); end, -- Needy
    function() O(t[558], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[558] = a:New(558); end, -- Greedy
    function() O(t[557], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[557] = a:New(557); end, -- Superior
    function() O(t[556], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[556] = a:New(556); end, -- Epic
    function() t[547] = a:New(547); end, -- Veteran of the Wrathgate
    function() t[546] = a:New(546); end, -- Safe Deposit
    function() t[545] = a:New(545); end, -- Shave and a Haircut
    function() t[524] = a:New(524); end, -- 10 Exalted Reputations
    function() t[523] = a:New(523); end, -- 5 Exalted Reputations
    function() t[522] = a:New(522); end, -- Somebody Likes Me
    function() t[521] = a:New(521); end, -- 15 Exalted Reputations
    function() t[520] = a:New(520); end, -- 20 Exalted Reputations
    function() t[519] = a:New(519); end, -- 25 Exalted Reputations
    function() t[518] = a:New(518); end, -- 30 Exalted Reputations
    function() t[516] = a:New(516, nil, nil, true); end, -- 1000 Honorable Kills
    function() t[515] = a:New(515, nil, nil, true); end, -- 500 Honorable Kills
    function() t[513] = a:New(513, nil, nil, true); end, -- 100 Honorable Kills
    function() t[512] = a:New(512, nil, nil, true); end, -- 5000 Honorable Kills
    function() t[509] = a:New(509, nil, nil, true); end, -- 10000 Honorable Kills
    function() t[508] = a:New(508); end, -- 1500 Quests Completed
    function() t[507] = a:New(507); end, -- 1000 Quests Completed
    function() t[506] = a:New(506); end, -- 500 Quests Completed
    function() t[505] = a:New(505); end, -- 250 Quests Completed
    function() t[504] = a:New(504); end, -- 100 Quests Completed
    function() t[503] = a:New(503); end, -- 50 Quests Completed
    function() t[500] = a:New(500); end, -- Heroic: The Culling of Stratholme
    function() t[499] = a:New(499); end, -- Heroic: Utgarde Pinnacle
    function() t[498] = a:New(498); end, -- Heroic: The Oculus
    function() t[497] = a:New(497); end, -- Heroic: Halls of Lightning
    function() t[496] = a:New(496); end, -- Heroic: Halls of Stone
    function() t[495] = a:New(495); end, -- Heroic: Gundrak
    function() t[494] = a:New(494); end, -- Heroic: The Violet Hold
    function() t[493] = a:New(493); end, -- Heroic: Drak'Tharon Keep
    function() t[492] = a:New(492); end, -- Heroic: Ahn'kahet: The Old Kingdom
    function() t[491] = a:New(491); end, -- Heroic: Azjol-Nerub
    function() t[490] = a:New(490); end, -- Heroic: The Nexus
    function() t[489] = a:New(489); end, -- Heroic: Utgarde Keep
    function() t[488] = a:New(488); end, -- Utgarde Pinnacle
    function() t[487] = a:New(487); end, -- The Oculus
    function() t[486] = a:New(486); end, -- Halls of Lightning
    function() t[485] = a:New(485); end, -- Halls of Stone
    function() t[484] = a:New(484); end, -- Gundrak
    function() t[483] = a:New(483); end, -- The Violet Hold
    function() t[482] = a:New(482); end, -- Drak'Tharon Keep
    function() t[481] = a:New(481); end, -- Ahn'kahet: The Old Kingdom
    function() t[480] = a:New(480); end, -- Azjol-Nerub
    function() t[479] = a:New(479); end, -- The Culling of Stratholme
    function() t[478] = a:New(478); end, -- The Nexus
    function() t[477] = a:New(477); end, -- Utgarde Keep
    function() O(t[473], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[473] = a:New(473, f.Alliance, 446, true); end, -- Marshal
    function() O(t[472], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[472] = a:New(472, f.Alliance, 449, true); end, -- Knight-Lieutenant
    function() O(t[471], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[471] = a:New(471, f.Alliance, 453, true); end, -- Sergeant
    function() O(t[470], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[470] = a:New(470, f.Alliance, 468, true); end, -- Corporal
    function() O(t[469], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[469] = a:New(469, f.Horde, 438, true); end, -- Legionnaire
    function() O(t[468], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[468] = a:New(468, f.Horde, 470, true); end, -- Grunt
    function() O(t[467], "Once"); end,
    function() t[467] = a:New(467, nil, nil, nil, true); end, -- Realm First! Level 80 Shaman
    function() O(t[466], "Once"); end,
    function() t[466] = a:New(466, nil, nil, nil, true); end, -- Realm First! Level 80 Druid
    function() O(t[465], "Once"); end,
    function() t[465] = a:New(465, nil, nil, nil, true); end, -- Realm First! Level 80 Paladin
    function() O(t[464], "Once"); end,
    function() t[464] = a:New(464, nil, nil, nil, true); end, -- Realm First! Level 80 Priest
    function() O(t[463], "Once"); end,
    function() t[463] = a:New(463, nil, nil, nil, true); end, -- Realm First! Level 80 Warlock
    function() O(t[462], "Once"); end,
    function() t[462] = a:New(462, nil, nil, nil, true); end, -- Realm First! Level 80 Hunter
    function() O(t[461], "Once"); end,
    function() t[461] = a:New(461, nil, nil, nil, true); end, -- Realm First! Level 80 Death Knight
    function() O(t[460], "Once"); end,
    function() t[460] = a:New(460, nil, nil, nil, true); end, -- Realm First! Level 80 Mage
    function() O(t[459], "Once"); end,
    function() t[459] = a:New(459, nil, nil, nil, true); end, -- Realm First! Level 80 Warrior
    function() O(t[458], "Once"); end,
    function() t[458] = a:New(458, nil, nil, nil, true); end, -- Realm First! Level 80 Rogue
    function() O(t[457], "Once"); end,
    function() t[457] = a:New(457, nil, nil, nil, true); end, -- Realm First! Level 80
    function() O(t[456], "Once"); end,
    function() t[456] = a:New(456, nil, nil, nil, true); end, -- Realm First! Obsidian Slayer
    function() O(t[454], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[454] = a:New(454, f.Horde, 442, true); end, -- Scout
    function() O(t[453], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[453] = a:New(453, f.Horde, 471, true); end, -- Sergeant
    function() O(t[452], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[452] = a:New(452, f.Horde, 440, true); end, -- First Sergeant
    function() O(t[451], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[451] = a:New(451, f.Horde, 439, true); end, -- Stone Guard
    function() O(t[450], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[450] = a:New(450, f.Horde, 441, true); end, -- Senior Sergeant
    function() O(t[449], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[449] = a:New(449, f.Horde, 472, true); end, -- Blood Guard
    function() O(t[448], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[448] = a:New(448, f.Horde, 437, true); end, -- Centurion
    function() O(t[447], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[447] = a:New(447, f.Horde, 436, true); end, -- Champion
    function() O(t[446], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[446] = a:New(446, f.Horde, 473, true); end, -- General
    function() O(t[445], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[445] = a:New(445, f.Horde, 434, true); end, -- Warlord
    function() O(t[444], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[444] = a:New(444, f.Horde, 435, true); end, -- Lieutenant General
    function() O(t[443], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[443] = a:New(443, f.Horde, 433, true); end, -- High Warlord
    function() O(t[442], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[442] = a:New(442, f.Alliance, 454, true); end, -- Private
    function() O(t[441], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[441] = a:New(441, f.Alliance, 450, true); end, -- Master Sergeant
    function() O(t[440], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[440] = a:New(440, f.Alliance, 452, true); end, -- Sergeant Major
    function() O(t[439], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[439] = a:New(439, f.Alliance, 451, true); end, -- Knight
    function() O(t[438], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[438] = a:New(438, f.Alliance, 469, true); end, -- Knight-Captain
    function() O(t[437], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[437] = a:New(437, f.Alliance, 448, true); end, -- Knight-Champion
    function() O(t[436], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[436] = a:New(436, f.Alliance, 447, true); end, -- Lieutenant Commander
    function() O(t[435], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[435] = a:New(435, f.Alliance, 444, true); end, -- Commander
    function() O(t[434], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[434] = a:New(434, f.Alliance, 445, true); end, -- Field Marshal
    function() O(t[433], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[433] = a:New(433, f.Alliance, 443, true); end, -- Grand Marshal
    function() O(t[432]); end,
    function() t[432] = a:New(432); end, -- Champion of the Naaru
    function() O(t[431]); end,
    function() t[431] = a:New(431); end, -- Hand of A'dal
    function() O(t[430], "Never"); end,
    function() t[430] = a:New(430); end, -- Amani War Bear
    function() t[429] = a:New(429); end, -- "Sulfuras, Hand of Ragnaros"
    function() t[428] = a:New(428); end, -- "Thunderfury, Blessed Blade of the Windseeker"
    function() t[426] = a:New(426); end, -- Warglaives of Azzinoth
    function() O(t[425], "Never"); end,
    function() t[425] = a:New(425); end, -- "Atiesh, Greatstaff of the Guardian"
    function() t[424] = a:New(424); end, -- Why? Because It's Red
    function() O(t[420], "From", "PvP Season", 4, "Until", "PvP Season", 4); end,
    function() t[420] = a:New(420, nil, nil, true); end, -- Brutal Gladiator
    function() O(t[419], "From", "PvP Season", 3, "Until", "PvP Season", 3); end,
    function() t[419] = a:New(419, nil, nil, true); end, -- Vengeful Gladiator
    function() O(t[418], "From", "PvP Season", 2, "Until", "PvP Season", 2); end,
    function() t[418] = a:New(418, nil, nil, true); end, -- Merciless Gladiator
    function() O(t[416], "Never"); end,
    function() t[416] = a:New(416); end, -- Scarab Lord
    function() t[415] = a:New(415); end, -- Big Blizzard Bear
    function() t[414] = a:New(414); end, -- Tyrael's Hilt
    function() t[412] = a:New(412); end, -- Murloc Costume
    function() t[411] = a:New(411); end, -- Murky
    function() O(t[409], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[409] = a:New(409, nil, nil, true); end, -- Last Man Standing
    function() t[408] = a:New(408, nil, nil, true); end, -- Hot Streak
    function() O(t[407], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[407] = a:New(407, nil, nil, true); end, -- High Five: 1750
    function() O(t[406], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[406] = a:New(406, nil, nil, true); end, -- High Five: 1550
    function() t[405] = a:New(405, nil, nil, true); end, -- Three's Company: 2000
    function() O(t[404], "From", "Version", "030400", "Before", "Version", "070003"); end,
    function() t[404] = a:New(404, nil, nil, true); end, -- High Five: 2000
    function() t[403] = a:New(403, nil, nil, true); end, -- Three's Company: 1750
    function() t[402] = a:New(402, nil, nil, true); end, -- Three's Company: 1550
    function() t[401] = a:New(401, nil, nil, true); end, -- Just the Two of Us: 2000
    function() t[400] = a:New(400, nil, nil, true); end, -- Just the Two of Us: 1750
    function() t[399] = a:New(399, nil, nil, true); end, -- Just the Two of Us: 1550
    function() t[398] = a:New(398, nil, nil, true); end, -- Mercilessly Dedicated
    function() t[397] = a:New(397, nil, nil, true); end, -- Step Into The Arena
    function() t[396] = a:New(396, nil, nil, true); end, -- Gurubashi Arena Grand Master
    function() t[389] = a:New(389, nil, nil, true); end, -- Gurubashi Arena Master
    function() t[388] = a:New(388, f.Alliance, 1006, true); end, -- City Defender
    function() t[306] = a:New(306); end, -- Master Angler of Azeroth
    function() t[303] = a:New(303); end, -- "Have Keg, Will Travel"
    function() t[295] = a:New(295); end, -- Direbrewfest
    function() t[293] = a:New(293); end, -- Disturbing the Peace
    function() t[292] = a:New(292); end, -- Sinister Calling
    function() t[291] = a:New(291); end, -- Check Your Head
    function() t[289] = a:New(289); end, -- The Savior of Hallow's End
    function() t[288] = a:New(288); end, -- Out With It
    function() t[284] = a:New(284); end, -- A Mask for All Occasions
    function() t[283] = a:New(283); end, -- The Masquerade
    function() t[279] = a:New(279); end, -- Simply Abominable
    function() t[277] = a:New(277); end, -- 'Tis the Season
    function() t[275] = a:New(275); end, -- Veteran Nanny
    function() t[273] = a:New(273); end, -- On Metzen!
    function() t[272] = a:New(272); end, -- Torch Juggler
    function() t[271] = a:New(271); end, -- Burning Hot Pole Dance
    function() t[263] = a:New(263); end, -- Ice the Frost Lord
    function() t[260] = a:New(260); end, -- Charming
    function() t[259] = a:New(259, f.Horde, 1255); end, -- Scrooge
    function() t[255] = a:New(255); end, -- Bring Me The Head of... Oh Wait
    function() t[252] = a:New(252, nil, nil, true); end, -- With a Little Helper from My Friends
    function() t[249] = a:New(249); end, -- Dressed for the Occasion
    function() t[248] = a:New(248); end, -- Sunday's Finest
    function() t[247] = a:New(247, nil, nil, true); end, -- "Make Love, Not Warcraft"
    function() t[246] = a:New(246, f.Alliance, 1005, true); end, -- Know Thy Enemy
    function() t[245] = a:New(245, nil, nil, true); end, -- That Takes Class
    function() t[239] = a:New(239, nil, nil, true); end, -- 25000 Honorable Kills
    function() t[238] = a:New(238, nil, nil, true); end, -- An Honorable Kill
    function() t[233] = a:New(233, nil, nil, true); end, -- Bloodthirsty Berserker
    function() t[231] = a:New(231, nil, nil, true); end, -- Wrecking Ball
    function() t[230] = a:New(230, f.Alliance, 1175, true); end, -- Battlemaster
    function() t[229] = a:New(229, nil, nil, true); end, -- The Grim Reaper
    function() t[227] = a:New(227, nil, nil, true); end, -- Damage Control
    function() t[226] = a:New(226, nil, nil, true); end, -- The Alterac Blitz
    function() t[225] = a:New(225, f.Alliance, 1164, true); end, -- Everything Counts
    function() t[224] = a:New(224, f.Horde, 1151, true); end, -- Loyal Defender
    function() t[223] = a:New(223, nil, nil, true); end, -- The Sickly Gazelle
    function() t[222] = a:New(222, nil, nil, true); end, -- Tower Defense
    function() t[221] = a:New(221, nil, nil, true); end, -- Alterac Grave Robber
    function() t[220] = a:New(220, f.Alliance, 873, true); end, -- Stormpike Perfection
    function() t[219] = a:New(219, nil, nil, true); end, -- Alterac Valley Veteran
    function() t[218] = a:New(218, nil, nil, true); end, -- Alterac Valley Victory
    function() t[216] = a:New(216, nil, nil, true); end, -- Bound for Glory
    function() t[214] = a:New(214, nil, nil, true); end, -- Flurry
    function() t[213] = a:New(213, nil, nil, true); end, -- Stormtrooper
    function() t[212] = a:New(212, nil, nil, true); end, -- Storm Capper
    function() t[211] = a:New(211, nil, nil, true); end, -- Storm Glory
    function() t[209] = a:New(209, nil, nil, true); end, -- Eye of the Storm Veteran
    function() t[208] = a:New(208, nil, nil, true); end, -- Eye of the Storm Victory
    function() t[207] = a:New(207, nil, nil, true); end, -- Save the Day
    function() t[206] = a:New(206, f.Alliance, 1252, true); end, -- Supreme Defender
    function() t[204] = a:New(204, nil, nil, true); end, -- Ironman
    function() t[203] = a:New(203, f.Alliance, 1251, true); end, -- Not In My House
    function() t[202] = a:New(202, f.Alliance, 1502, true); end, -- Quick Cap
    function() t[201] = a:New(201, nil, nil, true); end, -- Warsong Expedience
    function() t[200] = a:New(200, nil, nil, true); end, -- Persistent Defender
    function() t[199] = a:New(199, nil, nil, true); end, -- Capture the Flag
    function() t[168] = a:New(168, nil, nil, true); end, -- Warsong Gulch Perfection
    function() t[167] = a:New(167, nil, nil, true); end, -- Warsong Gulch Veteran
    function() t[166] = a:New(166, nil, nil, true); end, -- Warsong Gulch Victory
    function() t[165] = a:New(165, nil, nil, true); end, -- Arathi Basin Perfection
    function() t[162] = a:New(162, nil, nil, true); end, -- We Had It All Along *cough*
    function() t[161] = a:New(161, nil, nil, true); end, -- Resilient Victory
    function() t[159] = a:New(159, nil, nil, true); end, -- Let's Get This Done
    function() t[158] = a:New(158, nil, nil, true); end, -- Me and the Cappin' Makin' it Happen
    function() t[157] = a:New(157, nil, nil, true); end, -- To The Rescue!
    function() t[156] = a:New(156, nil, nil, true); end, -- Territorial Dominance
    function() t[155] = a:New(155, nil, nil, true); end, -- Arathi Basin Veteran
    function() t[154] = a:New(154, nil, nil, true); end, -- Arathi Basin Victory
    function() t[153] = a:New(153); end, -- The Old Gnome and the Sea
    function() t[150] = a:New(150); end, -- The Fishing Diplomat
    function() t[144] = a:New(144); end, -- The Lurker Above
    function() t[141] = a:New(141); end, -- Ultimate Triage
    function() t[137] = a:New(137); end, -- Stocking Up
    function() O(t[135], "From", "Version", "030400", "Before", "Version", "080001"); end,
    function() t[135] = a:New(135); end, -- Grand Master Medic
    function() O(t[134], "From", "Version", "020003", "Before", "Version", "080001"); end,
    function() t[134] = a:New(134); end, -- Master Medic
    function() O(t[133], "From", "Version", "000304", "Before", "Version", "080001"); end,
    function() t[133] = a:New(133); end, -- Artisan Medic
    function() O(t[132], "From", "Version", "000304", "Before", "Version", "080001"); end,
    function() t[132] = a:New(132); end, -- Expert Medic
    function() O(t[131], "From", "Version", "000304", "Before", "Version", "080001"); end,
    function() t[131] = a:New(131); end, -- Journeyman Medic
    function() t[130] = a:New(130); end, -- Northrend Fisherman
    function() t[129] = a:New(129); end, -- Outland Fisherman
    function() t[128] = a:New(128); end, -- Artisan Fisherman
    function() t[127] = a:New(127); end, -- Expert Fisherman
    function() t[126] = a:New(126); end, -- Journeyman Fisherman
    function() t[125] = a:New(125); end, -- Northrend Cook
    function() t[124] = a:New(124); end, -- Outland Cook
    function() t[123] = a:New(123); end, -- Classic Cook
    function() t[122] = a:New(122); end, -- Expert Cook
    function() t[121] = a:New(121); end, -- Journeyman Cook
    function() t[116] = a:New(116); end, -- Professional Journeyman
    function() t[73] = a:New(73, nil, nil, true); end, -- Disgracin' The Basin
    function() t[46] = a:New(46); end, -- Universal Explorer
    function() t[45] = a:New(45); end, -- Northrend Explorer
    function() t[44] = a:New(44); end, -- Outland Explorer
    function() t[43] = a:New(43); end, -- Kalimdor Explorer
    function() t[42] = a:New(42); end, -- Eastern Kingdoms Explorer
    function() t[41] = a:New(41, f.Alliance); end, -- Loremaster of Northrend
    function() t[40] = a:New(40); end, -- Icecrown: The Final Goal
    function() t[39] = a:New(39); end, -- Into the Basin
    function() t[38] = a:New(38); end, -- The Summit of Storm Peaks
    function() t[37] = a:New(37, f.Alliance, 1357); end, -- Fo' Grizzle My Shizzle
    function() t[36] = a:New(36); end, -- The Empire of Zul'Drak
    function() t[35] = a:New(35, f.Alliance, 1359); end, -- Might of Dragonblight
    function() t[34] = a:New(34, f.Alliance, 1356); end, -- I've Toured the Fjord
    function() t[33] = a:New(33, f.Alliance, 1358); end, -- Nothing Boring About Borean
    function() t[32] = a:New(32); end, -- 2000 Quests Completed
    function() t[31] = a:New(31); end, -- A Simple Re-Quest
    function() O(t[16], "From", "Version", "000304", "Before", "Version", "040001"); end,
    function() t[16] = a:New(16); end, -- Did Somebody Order a Knuckle Sandwich?
    function() t[15] = a:New(15); end, -- Plenty of Pets
    function() O(t[13], "From", "Version", "030400", "Before", "Version", "090001"); end,
    function() t[13] = a:New(13); end, -- Level 80 (Legacy)
    function() O(t[12], "From", "Version", "020003", "Before", "Version", "090001"); end,
    function() t[12] = a:New(12); end, -- Level 70 (Legacy)
    function() O(t[11], "From", "Version", "000304", "Before", "Version", "090001"); end,
    function() t[11] = a:New(11); end, -- Level 60 (Legacy)
    function() O(t[10], "From", "Version", "000304", "Before", "Version", "090001"); end,
    function() t[10] = a:New(10); end, -- Level 50 (Legacy)
    function() t[9] = a:New(9); end, -- Level 40
    function() t[8] = a:New(8); end, -- Level 30
    function() t[7] = a:New(7); end, -- Level 20
    function() t[6] = a:New(6); end, -- Level 10
};

function exportedAchievements.Load(tbl, tmog, ids)
    t, u = tbl, tmog;
    wipe(t);
    local name = "Achievements";
    addon.Diagnostics.Debug(name .. ": Start loading data");
    addon.StartWork(name, workload, name .. ": Finished loading data", true);

    ids = {};
    for i = 1, 18688 do
        if t[i] ~= nil then
            tinsert(ids, i);
        end
    end
end