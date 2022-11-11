-- [[ Exported at 2022-11-11 11-28-41 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local fac = objects.Faction;
local b = objects.Achievement;
local data = addon.Data;
local custObj = data.CustomObjectives;
data.ExportedAchievements = {};
local exportedAchievements = data.ExportedAchievements;

local function T(a, t)
    a:AddTransmogSet(t)
end

local function O(a, o, sI, sF, sV, eI, eF, eV)
    a:SetTemporaryObtainable(o, sI, sF, sV, eI, eF, eV)
end

function exportedAchievements.Load(a, t)
    for i, _ in next, a do
        a[i] = nil;
    end

    a[6] = b:New(6, 10); -- Level 10
    a[7] = b:New(7, 10); -- Level 20
    a[8] = b:New(8, 10); -- Level 30
    a[9] = b:New(9, 10); -- Level 40
    a[10] = b:New(10, 0); -- Level 50 (Legacy)
    O(a[10], "From", "Version", "000304", "Before", "Version", "090001");
    a[11] = b:New(11, 0); -- Level 60 (Legacy)
    O(a[11], "From", "Version", "000304", "Before", "Version", "090001");
    a[12] = b:New(12, 0); -- Level 70 (Legacy)
    O(a[12], "From", "Version", "020003", "Before", "Version", "090001");
    a[13] = b:New(13, 0); -- Level 80 (Legacy)
    O(a[13], "From", "Version", "030003", "Before", "Version", "090001");
    a[15] = b:New(15, 10); -- Plenty of Pets
    a[16] = b:New(16, 0); -- Did Somebody Order a Knuckle Sandwich?
    O(a[16], "From", "Version", "000304", "Before", "Version", "040001");
    a[31] = b:New(31, 10); -- A Simple Re-Quest
    a[32] = b:New(32, 10); -- 2000 Quests Completed
    a[33] = b:New(33, 10, fac.Alliance, 1358); -- Nothing Boring About Borean
    a[34] = b:New(34, 10, fac.Alliance, 1356); -- I've Toured the Fjord
    a[35] = b:New(35, 10, fac.Alliance, 1359); -- Might of Dragonblight
    a[36] = b:New(36, 10); -- The Empire of Zul'Drak
    a[37] = b:New(37, 10, fac.Alliance, 1357); -- Fo' Grizzle My Shizzle
    a[38] = b:New(38, 10); -- The Summit of Storm Peaks
    a[39] = b:New(39, 10); -- Into the Basin
    a[40] = b:New(40, 10); -- Icecrown: The Final Goal
    a[41] = b:New(41, 10); -- Loremaster of Northrend
    a[42] = b:New(42, 25); -- Eastern Kingdoms Explorer
    a[43] = b:New(43, 25); -- Kalimdor Explorer
    a[44] = b:New(44, 25); -- Outland Explorer
    a[45] = b:New(45, 25); -- Northrend Explorer
    a[46] = b:New(46, 50); -- Universal Explorer
    a[73] = b:New(73, 10); -- Disgracin' The Basin
    a[116] = b:New(116, 10); -- Professional Journeyman
    a[121] = b:New(121, 10); -- Journeyman Cook
    a[122] = b:New(122, 10); -- Expert Cook
    a[123] = b:New(123, 10); -- Classic Cook
    a[124] = b:New(124, 10); -- Outland Cook
    a[125] = b:New(125, 10); -- Northrend Cook
    a[126] = b:New(126, 10); -- Journeyman Fisherman
    a[127] = b:New(127, 10); -- Expert Fisherman
    a[128] = b:New(128, 10); -- Artisan Fisherman
    a[129] = b:New(129, 10); -- Outland Fisherman
    a[130] = b:New(130, 10); -- Northrend Fisherman
    a[131] = b:New(131, 0); -- Journeyman Medic
    O(a[131], "From", "Version", "000304", "Before", "Version", "080001");
    a[132] = b:New(132, 0); -- Expert Medic
    O(a[132], "From", "Version", "000304", "Before", "Version", "080001");
    a[133] = b:New(133, 0); -- Artisan Medic
    O(a[133], "From", "Version", "000304", "Before", "Version", "080001");
    a[134] = b:New(134, 0); -- Master Medic
    O(a[134], "From", "Version", "020003", "Before", "Version", "080001");
    a[135] = b:New(135, 0); -- Grand Master Medic
    O(a[135], "From", "Version", "030003", "Before", "Version", "080001");
    a[137] = b:New(137, 0); -- Stocking Up
    O(a[137], "From", "Version", "030003", "Before", "Version", "080001");
    a[141] = b:New(141, 0); -- Ultimate Triage
    O(a[141], "From", "Version", "030003", "Before", "Version", "080001");
    a[144] = b:New(144, 10); -- The Lurker Above
    a[150] = b:New(150, 10); -- The Fishing Diplomat
    a[153] = b:New(153, 10); -- The Old Gnome and the Sea
    a[154] = b:New(154, 10); -- Arathi Basin Victory
    a[155] = b:New(155, 10); -- Arathi Basin Veteran
    a[156] = b:New(156, 10); -- Territorial Dominance
    a[157] = b:New(157, 10); -- To The Rescue!
    a[158] = b:New(158, 10); -- Me and the Cappin' Makin' it Happen
    a[159] = b:New(159, 10); -- Let's Get This Done
    a[161] = b:New(161, 10); -- Resilient Victory
    a[162] = b:New(162, 10); -- We Had It All Along *cough*
    a[165] = b:New(165, 20); -- Arathi Basin Perfection
    a[166] = b:New(166, 10); -- Warsong Gulch Victory
    a[167] = b:New(167, 10); -- Warsong Gulch Veteran
    a[168] = b:New(168, 10); -- Warsong Gulch Perfection
    a[199] = b:New(199, 10); -- Capture the Flag
    a[200] = b:New(200, 10); -- Persistent Defender
    a[201] = b:New(201, 10); -- Warsong Expedience
    a[202] = b:New(202, 10, fac.Alliance, 1502); -- Quick Cap
    a[203] = b:New(203, 10, fac.Alliance, 1251); -- Not In My House
    a[204] = b:New(204, 10); -- Ironman
    a[206] = b:New(206, 10, fac.Alliance, 1252); -- Supreme Defender
    a[207] = b:New(207, 10); -- Save the Day
    a[208] = b:New(208, 10); -- Eye of the Storm Victory
    a[209] = b:New(209, 10); -- Eye of the Storm Veteran
    a[211] = b:New(211, 10); -- Storm Glory
    a[212] = b:New(212, 10); -- Storm Capper
    a[213] = b:New(213, 10); -- Stormtrooper
    a[214] = b:New(214, 10); -- Flurry
    a[216] = b:New(216, 10); -- Bound for Glory
    a[218] = b:New(218, 10); -- Alterac Valley Victory
    a[219] = b:New(219, 10); -- Alterac Valley Veteran
    a[220] = b:New(220, 20, fac.Alliance, 873); -- Stormpike Perfection
    a[221] = b:New(221, 10); -- Alterac Grave Robber
    a[222] = b:New(222, 10); -- Tower Defense
    a[223] = b:New(223, 10); -- The Sickly Gazelle
    a[224] = b:New(224, 10, fac.Horde, 1151); -- Loyal Defender
    a[225] = b:New(225, 10, fac.Alliance, 1164); -- Everything Counts
    a[226] = b:New(226, 20); -- The Alterac Blitz
    a[227] = b:New(227, 10); -- Damage Control
    a[229] = b:New(229, 10); -- The Grim Reaper
    a[230] = b:New(230, 50, fac.Alliance, 1175); -- Battlemaster
    a[231] = b:New(231, 10); -- Wrecking Ball
    a[233] = b:New(233, 10); -- Bloodthirsty Berserker
    a[238] = b:New(238, 10); -- An Honorable Kill
    a[239] = b:New(239, 10); -- 25000 Honorable Kills
    a[245] = b:New(245, 10); -- That Takes Class
    a[246] = b:New(246, 10, fac.Alliance, 1005); -- Know Thy Enemy
    a[247] = b:New(247, 10); -- "Make Love, Not Warcraft"
    a[248] = b:New(248, 10); -- Sunday's Finest
    a[249] = b:New(249, 10); -- Dressed for the Occasion
    a[252] = b:New(252, 10); -- With a Little Helper from My Friends
    a[255] = b:New(255, 10); -- Bring Me The Head of... Oh Wait
    a[259] = b:New(259, 10, fac.Horde, 1255); -- Scrooge
    a[260] = b:New(260, 10); -- Charming
    a[263] = b:New(263, 10); -- Ice the Frost Lord
    a[271] = b:New(271, 10); -- Burning Hot Pole Dance
    a[272] = b:New(272, 10); -- Torch Juggler
    a[273] = b:New(273, 10); -- On Metzen!
    a[275] = b:New(275, 50); -- Veteran Nanny
    a[277] = b:New(277, 10); -- 'Tis the Season
    a[279] = b:New(279, 10); -- Simply Abominable
    a[283] = b:New(283, 10); -- The Masquerade
    a[284] = b:New(284, 20); -- A Mask for All Occasions
    a[288] = b:New(288, 10); -- Out With It
    a[289] = b:New(289, 10); -- The Savior of Hallow's End
    a[291] = b:New(291, 10); -- Check Your Head
    a[292] = b:New(292, 10); -- Sinister Calling
    a[293] = b:New(293, 10); -- Disturbing the Peace
    a[295] = b:New(295, 10); -- Direbrewfest
    a[303] = b:New(303, 10); -- "Have Keg, Will Travel"
    a[306] = b:New(306, 20); -- Master Angler of Azeroth
    a[388] = b:New(388, 10, fac.Alliance, 1006); -- City Defender
    a[389] = b:New(389, 10); -- Gurubashi Arena Master
    a[396] = b:New(396, 10); -- Gurubashi Arena Grand Master
    a[397] = b:New(397, 10); -- Step Into The Arena
    a[398] = b:New(398, 10); -- Mercilessly Dedicated
    a[399] = b:New(399, 10); -- Just the Two of Us: 1550
    a[400] = b:New(400, 10); -- Just the Two of Us: 1750
    a[401] = b:New(401, 10); -- Just the Two of Us: 2000
    a[402] = b:New(402, 10); -- Three's Company: 1550
    a[403] = b:New(403, 10); -- Three's Company: 1750
    a[404] = b:New(404, 0); -- High Five: 2000
    O(a[404], "From", "Version", "030003", "Before", "Version", "070003");
    a[405] = b:New(405, 10); -- Three's Company: 2000
    a[406] = b:New(406, 0); -- High Five: 1550
    O(a[406], "From", "Version", "030003", "Before", "Version", "070003");
    a[407] = b:New(407, 0); -- High Five: 1750
    O(a[407], "From", "Version", "030003", "Before", "Version", "070003");
    a[408] = b:New(408, 10); -- Hot Streak
    a[409] = b:New(409, 0); -- Last Man Standing
    O(a[409], "From", "Version", "030003", "Before", "Version", "070003");
    a[411] = b:New(411, 0); -- Murky
    a[412] = b:New(412, 0); -- Murloc Costume
    a[414] = b:New(414, 0); -- Tyrael's Hilt
    a[415] = b:New(415, 0); -- Big Blizzard Bear
    a[416] = b:New(416, 0); -- Scarab Lord
    O(a[416], "Never");
    a[418] = b:New(418, 0); -- Merciless Gladiator
    O(a[418], "From", "PvP Season", 2, "Until", "PvP Season", 2);
    a[419] = b:New(419, 0); -- Vengeful Gladiator
    O(a[419], "From", "PvP Season", 3, "Until", "PvP Season", 3);
    a[420] = b:New(420, 0); -- Brutal Gladiator
    O(a[420], "From", "PvP Season", 4, "Until", "PvP Season", 4);
    a[424] = b:New(424, 0); -- Why? Because It's Red
    a[425] = b:New(425, 0); -- "Atiesh, Greatstaff of the Guardian"
    O(a[425], "Never");
    a[426] = b:New(426, 0); -- Warglaives of Azzinoth
    a[428] = b:New(428, 0); -- "Thunderfury, Blessed Blade of the Windseeker"
    a[429] = b:New(429, 0); -- "Sulfuras, Hand of Ragnaros"
    a[430] = b:New(430, 0); -- Amani War Bear
    O(a[430], "Never");
    a[431] = b:New(431, 0); -- Hand of A'dal
    O(a[431]);
    a[432] = b:New(432, 0); -- Champion of the Naaru
    O(a[432]);
    a[433] = b:New(433, 0, fac.Alliance, 443); -- Grand Marshal
    O(a[433], "From", "Version", "010400", "Before", "Version", "020001");
    a[434] = b:New(434, 0, fac.Alliance, 445); -- Field Marshal
    O(a[434], "From", "Version", "010400", "Before", "Version", "020001");
    a[435] = b:New(435, 0, fac.Alliance, 444); -- Commander
    O(a[435], "From", "Version", "010400", "Before", "Version", "020001");
    a[436] = b:New(436, 0, fac.Alliance, 447); -- Lieutenant Commander
    O(a[436], "From", "Version", "010400", "Before", "Version", "020001");
    a[437] = b:New(437, 0, fac.Alliance, 448); -- Knight-Champion
    O(a[437], "From", "Version", "010400", "Before", "Version", "020001");
    a[438] = b:New(438, 0, fac.Alliance, 469); -- Knight-Captain
    O(a[438], "From", "Version", "010400", "Before", "Version", "020001");
    a[439] = b:New(439, 0, fac.Alliance, 451); -- Knight
    O(a[439], "From", "Version", "010400", "Before", "Version", "020001");
    a[440] = b:New(440, 0, fac.Alliance, 452); -- Sergeant Major
    O(a[440], "From", "Version", "010400", "Before", "Version", "020001");
    a[441] = b:New(441, 0, fac.Alliance, 450); -- Master Sergeant
    O(a[441], "From", "Version", "010400", "Before", "Version", "020001");
    a[442] = b:New(442, 0, fac.Alliance, 454); -- Private
    O(a[442], "From", "Version", "010400", "Before", "Version", "020001");
    a[443] = b:New(443, 0, fac.Horde, 433); -- High Warlord
    O(a[443], "From", "Version", "010400", "Before", "Version", "020001");
    a[444] = b:New(444, 0, fac.Horde, 435); -- Lieutenant General
    O(a[444], "From", "Version", "010400", "Before", "Version", "020001");
    a[445] = b:New(445, 0, fac.Horde, 434); -- Warlord
    O(a[445], "From", "Version", "010400", "Before", "Version", "020001");
    a[446] = b:New(446, 0, fac.Horde, 473); -- General
    O(a[446], "From", "Version", "010400", "Before", "Version", "020001");
    a[447] = b:New(447, 0, fac.Horde, 436); -- Champion
    O(a[447], "From", "Version", "010400", "Before", "Version", "020001");
    a[448] = b:New(448, 0, fac.Horde, 437); -- Centurion
    O(a[448], "From", "Version", "010400", "Before", "Version", "020001");
    a[449] = b:New(449, 0, fac.Horde, 472); -- Blood Guard
    O(a[449], "From", "Version", "010400", "Before", "Version", "020001");
    a[450] = b:New(450, 0, fac.Horde, 441); -- Senior Sergeant
    O(a[450], "From", "Version", "010400", "Before", "Version", "020001");
    a[451] = b:New(451, 0, fac.Horde, 439); -- Stone Guard
    O(a[451], "From", "Version", "010400", "Before", "Version", "020001");
    a[452] = b:New(452, 0, fac.Horde, 440); -- First Sergeant
    O(a[452], "From", "Version", "010400", "Before", "Version", "020001");
    a[453] = b:New(453, 0, fac.Horde, 471); -- Sergeant
    O(a[453], "From", "Version", "010400", "Before", "Version", "020001");
    a[454] = b:New(454, 0, fac.Horde, 442); -- Scout
    O(a[454], "From", "Version", "010400", "Before", "Version", "020001");
    a[456] = b:New(456, 0, nil, nil, true); -- Realm First! Obsidian Slayer
    O(a[456], "Once");
    a[457] = b:New(457, 0, nil, nil, true); -- Realm First! Level 80
    O(a[457], "Once");
    a[458] = b:New(458, 0, nil, nil, true); -- Realm First! Level 80 Rogue
    O(a[458], "Once");
    a[459] = b:New(459, 0, nil, nil, true); -- Realm First! Level 80 Warrior
    O(a[459], "Once");
    a[460] = b:New(460, 0, nil, nil, true); -- Realm First! Level 80 Mage
    O(a[460], "Once");
    a[461] = b:New(461, 0, nil, nil, true); -- Realm First! Level 80 Death Knight
    O(a[461], "Once");
    a[462] = b:New(462, 0, nil, nil, true); -- Realm First! Level 80 Hunter
    O(a[462], "Once");
    a[463] = b:New(463, 0, nil, nil, true); -- Realm First! Level 80 Warlock
    O(a[463], "Once");
    a[464] = b:New(464, 0, nil, nil, true); -- Realm First! Level 80 Priest
    O(a[464], "Once");
    a[465] = b:New(465, 0, nil, nil, true); -- Realm First! Level 80 Paladin
    O(a[465], "Once");
    a[466] = b:New(466, 0, nil, nil, true); -- Realm First! Level 80 Druid
    O(a[466], "Once");
    a[467] = b:New(467, 0, nil, nil, true); -- Realm First! Level 80 Shaman
    O(a[467], "Once");
    a[468] = b:New(468, 0, fac.Horde, 470); -- Grunt
    O(a[468], "From", "Version", "010400", "Before", "Version", "020001");
    a[469] = b:New(469, 0, fac.Horde, 438); -- Legionnaire
    O(a[469], "From", "Version", "010400", "Before", "Version", "020001");
    a[470] = b:New(470, 0, fac.Alliance, 468); -- Corporal
    O(a[470], "From", "Version", "010400", "Before", "Version", "020001");
    a[471] = b:New(471, 0, fac.Alliance, 453); -- Sergeant
    O(a[471], "From", "Version", "010400", "Before", "Version", "020001");
    a[472] = b:New(472, 0, fac.Alliance, 449); -- Knight-Lieutenant
    O(a[472], "From", "Version", "010400", "Before", "Version", "020001");
    a[473] = b:New(473, 0, fac.Alliance, 446); -- Marshal
    O(a[473], "From", "Version", "010400", "Before", "Version", "020001");
    a[477] = b:New(477, 10); -- Utgarde Keep
    a[478] = b:New(478, 10); -- The Nexus
    a[479] = b:New(479, 10); -- The Culling of Stratholme
    a[480] = b:New(480, 10); -- Azjol-Nerub
    a[481] = b:New(481, 10); -- Ahn'kahet: The Old Kingdom
    a[482] = b:New(482, 10); -- Drak'Tharon Keep
    a[483] = b:New(483, 10); -- The Violet Hold
    a[484] = b:New(484, 10); -- Gundrak
    a[485] = b:New(485, 10); -- Halls of Stone
    a[486] = b:New(486, 10); -- Halls of Lightning
    a[487] = b:New(487, 10); -- The Oculus
    a[488] = b:New(488, 10); -- Utgarde Pinnacle
    a[489] = b:New(489, 10); -- Heroic: Utgarde Keep
    a[490] = b:New(490, 10); -- Heroic: The Nexus
    a[491] = b:New(491, 10); -- Heroic: Azjol-Nerub
    a[492] = b:New(492, 10); -- Heroic: Ahn'kahet: The Old Kingdom
    a[493] = b:New(493, 10); -- Heroic: Drak'Tharon Keep
    a[494] = b:New(494, 10); -- Heroic: The Violet Hold
    a[495] = b:New(495, 10); -- Heroic: Gundrak
    a[496] = b:New(496, 10); -- Heroic: Halls of Stone
    a[497] = b:New(497, 10); -- Heroic: Halls of Lightning
    a[498] = b:New(498, 10); -- Heroic: The Oculus
    a[499] = b:New(499, 10); -- Heroic: Utgarde Pinnacle
    a[500] = b:New(500, 10); -- Heroic: The Culling of Stratholme
    a[503] = b:New(503, 10); -- 50 Quests Completed
    a[504] = b:New(504, 10); -- 100 Quests Completed
    a[505] = b:New(505, 10); -- 250 Quests Completed
    a[506] = b:New(506, 10); -- 500 Quests Completed
    a[507] = b:New(507, 10); -- 1000 Quests Completed
    a[508] = b:New(508, 10); -- 1500 Quests Completed
    a[509] = b:New(509, 10); -- 10000 Honorable Kills
    a[512] = b:New(512, 10); -- 5000 Honorable Kills
    a[513] = b:New(513, 10); -- 100 Honorable Kills
    a[515] = b:New(515, 10); -- 500 Honorable Kills
    a[516] = b:New(516, 10); -- 1000 Honorable Kills
    a[518] = b:New(518, 10); -- 30 Exalted Reputations
    a[519] = b:New(519, 10); -- 25 Exalted Reputations
    a[520] = b:New(520, 10); -- 20 Exalted Reputations
    a[521] = b:New(521, 10); -- 15 Exalted Reputations
    a[522] = b:New(522, 10); -- Somebody Likes Me
    a[523] = b:New(523, 10); -- 5 Exalted Reputations
    a[524] = b:New(524, 10); -- 10 Exalted Reputations
    a[545] = b:New(545, 10); -- Shave and a Haircut
    a[546] = b:New(546, 10); -- Safe Deposit
    a[547] = b:New(547, 10); -- Veteran of the Wrathgate
    a[556] = b:New(556, 0); -- Epic
    O(a[556], "From", "Version", "030003", "Before", "Version", "080001");
    a[557] = b:New(557, 0); -- Superior
    O(a[557], "From", "Version", "030003", "Before", "Version", "080001");
    a[558] = b:New(558, 0); -- Greedy
    O(a[558], "From", "Version", "030002", "Before", "Version", "080001");
    a[559] = b:New(559, 0); -- Needy
    O(a[559], "From", "Version", "030002", "Before", "Version", "080001");
    a[560] = b:New(560, 0); -- Deadliest Catch
    O(a[560], "From", "Version", "030002", "Before", "Version", "040001");
    a[561] = b:New(561, 10); -- D.E.H.T.A's Little P.I.T.A.
    a[562] = b:New(562, 10); -- The Arachnid Quarter (10 player)
    a[563] = b:New(563, 10); -- The Arachnid Quarter (25 player)
    a[564] = b:New(564, 10); -- The Construct Quarter (10 player)
    a[565] = b:New(565, 10); -- The Construct Quarter (25 player)
    a[566] = b:New(566, 10); -- The Plague Quarter (10 player)
    a[567] = b:New(567, 10); -- The Plague Quarter (25 player)
    a[568] = b:New(568, 10); -- The Military Quarter (10 player)
    a[569] = b:New(569, 10); -- The Military Quarter (25 player)
    a[572] = b:New(572, 10); -- Sapphiron's Demise (10 player)
    a[573] = b:New(573, 10); -- Sapphiron's Demise (25 player)
    a[574] = b:New(574, 10); -- Kel'Thuzad's Defeat (10 player)
    a[575] = b:New(575, 10); -- Kel'Thuzad's Defeat (25 player)
    a[576] = b:New(576, 25); -- The Fall of Naxxramas (10 player)
    a[577] = b:New(577, 50); -- The Fall of Naxxramas (25 player)
    a[578] = b:New(578, 25); -- The Dedicated Few (10 player)
    a[579] = b:New(579, 50); -- The Dedicated Few (25 player)
    a[582] = b:New(582, 20); -- Alterac Valley All-Star
    a[583] = b:New(583, 20); -- Arathi Basin All-Star
    a[584] = b:New(584, 20); -- Arathi Basin Assassin
    a[587] = b:New(587, 10); -- Stormy Assassin
    a[603] = b:New(603, 10, fac.Horde, 604); -- Wrath of the Horde
    a[604] = b:New(604, 10, fac.Alliance, 603); -- Wrath of the Alliance
    a[605] = b:New(605, 10); -- A Coin of Ancestry
    a[606] = b:New(606, 10); -- 5 Coins of Ancestry
    a[607] = b:New(607, 10); -- 10 Coins of Ancestry
    a[608] = b:New(608, 10); -- 25 Coins of Ancestry
    a[609] = b:New(609, 10); -- 50 Coins of Ancestry
    a[610] = b:New(610, 0, fac.Alliance, 615); -- Orgrimmar Offensive
    O(a[610], "From", "Version", "030002", "Before", "Version", "080001");
    a[611] = b:New(611, 10, fac.Alliance, 616); -- Bleeding Bloodhoof
    O(a[611], "From", "Version", "030002", "Before", "Version", "090001");
    a[612] = b:New(612, 0, fac.Alliance, 617); -- Downing the Dark Lady
    O(a[612], "From", "Version", "030002", "Before", "Version", "090001");
    a[613] = b:New(613, 10, fac.Alliance, 618); -- Killed in Quel'Thalas
    a[614] = b:New(614, 20, fac.Alliance, 619); -- For the Alliance!
    a[615] = b:New(615, 0, fac.Horde, 610); -- Storming Stormwind
    O(a[615], "From", "Version", "030002", "Before", "Version", "090001");
    a[616] = b:New(616, 10, fac.Horde, 611); -- Overthrow the Council
    a[617] = b:New(617, 0, fac.Horde, 612); -- Immortal No More
    O(a[617], "From", "Version", "030002", "Before", "Version", "080001");
    a[618] = b:New(618, 10, fac.Horde, 613); -- Putting Out the Light
    a[619] = b:New(619, 20, fac.Horde, 614); -- For the Horde!
    a[621] = b:New(621, 10); -- Represent
    a[622] = b:New(622, 10); -- The Spellweaver's Downfall (10 player)
    a[623] = b:New(623, 25); -- The Spellweaver's Downfall (25 player)
    a[624] = b:New(624, 10); -- Less Is More (10 player)
    a[625] = b:New(625, 25); -- Besting the Black Dragonflight (25 player)
    a[626] = b:New(626, 10); -- Lunar Festival Finery
    a[627] = b:New(627, 10); -- Explore Dun Morogh
    a[628] = b:New(628, 10); -- Deadmines
    a[629] = b:New(629, 10); -- Ragefire Chasm
    a[630] = b:New(630, 10); -- Wailing Caverns
    a[631] = b:New(631, 10); -- Shadowfang Keep
    a[632] = b:New(632, 10); -- Blackfathom Deeps
    a[633] = b:New(633, 10); -- Stormwind Stockade
    a[634] = b:New(634, 10); -- Gnomeregan
    a[635] = b:New(635, 10); -- Razorfen Kraul
    a[636] = b:New(636, 10); -- Razorfen Downs
    a[637] = b:New(637, 10); -- Scarlet Monastery
    a[638] = b:New(638, 10); -- Uldaman
    a[639] = b:New(639, 10); -- Zul'Farrak
    a[640] = b:New(640, 10); -- Maraudon
    a[641] = b:New(641, 10); -- Sunken Temple
    a[642] = b:New(642, 10); -- Blackrock Depths
    a[643] = b:New(643, 10); -- Lower Blackrock Spire
    a[644] = b:New(644, 10); -- King of Dire Maul
    a[645] = b:New(645, 10); -- Scholomance
    a[646] = b:New(646, 10); -- Stratholme
    a[647] = b:New(647, 10); -- Hellfire Ramparts
    a[648] = b:New(648, 10); -- The Blood Furnace
    a[649] = b:New(649, 10); -- The Slave Pens
    a[650] = b:New(650, 10); -- Underbog
    a[651] = b:New(651, 10); -- Mana-Tombs
    a[652] = b:New(652, 10); -- The Escape From Durnholde
    a[653] = b:New(653, 10); -- Sethekk Halls
    a[654] = b:New(654, 10); -- Shadow Labyrinth
    a[655] = b:New(655, 10); -- Opening of the Dark Portal
    a[656] = b:New(656, 10); -- The Steamvault
    a[657] = b:New(657, 10); -- The Shattered Halls
    a[658] = b:New(658, 10); -- The Mechanar
    a[659] = b:New(659, 10); -- The Botanica
    a[660] = b:New(660, 10); -- The Arcatraz
    a[661] = b:New(661, 10); -- Magister's Terrace
    a[662] = b:New(662, 0); -- Collector's Edition: Mini-Diablo
    a[663] = b:New(663, 0); -- Collector's Edition: Panda
    a[664] = b:New(664, 0); -- Collector's Edition: Zergling
    a[665] = b:New(665, 0); -- Collector's Edition: Netherwhelp
    a[666] = b:New(666, 10); -- Auchenai Crypts
    a[667] = b:New(667, 10); -- Heroic: Hellfire Ramparts
    a[668] = b:New(668, 10); -- Heroic: The Blood Furnace
    a[669] = b:New(669, 10); -- Heroic: The Slave Pens
    a[670] = b:New(670, 10); -- Heroic: Underbog
    a[671] = b:New(671, 10); -- Heroic: Mana-Tombs
    a[672] = b:New(672, 10); -- Heroic: Auchenai Crypts
    a[673] = b:New(673, 10); -- Heroic: The Escape From Durnholde
    a[674] = b:New(674, 10); -- Heroic: Sethekk Halls
    a[675] = b:New(675, 10); -- Heroic: Shadow Labyrinth
    a[676] = b:New(676, 10); -- Heroic: Opening of the Dark Portal
    a[677] = b:New(677, 10); -- Heroic: The Steamvault
    a[678] = b:New(678, 10); -- Heroic: The Shattered Halls
    a[679] = b:New(679, 10); -- Heroic: The Mechanar
    a[680] = b:New(680, 10); -- Heroic: The Botanica
    a[681] = b:New(681, 10); -- Heroic: The Arcatraz
    a[682] = b:New(682, 10); -- Heroic: Magister's Terrace
    a[683] = b:New(683, 0); -- Collector's Edition: Frost Wyrm Whelp
    a[684] = b:New(684, 0); -- Onyxia's Lair (Level 60)
    O(a[684], "Never");
    a[685] = b:New(685, 10); -- Blackwing Lair
    a[686] = b:New(686, 10); -- Molten Core
    a[687] = b:New(687, 10); -- Temple of Ahn'Qiraj
    a[688] = b:New(688, 0); -- Zul'Gurub
    O(a[688], "From", "Version", "030002", "Before", "Version", "040001");
    a[689] = b:New(689, 10); -- Ruins of Ahn'Qiraj
    a[690] = b:New(690, 10); -- Karazhan
    a[691] = b:New(691, 0); -- Zul'Aman
    O(a[691], "From", "Version", "030002", "Before", "Version", "040001");
    a[692] = b:New(692, 10); -- Gruul's Lair
    a[693] = b:New(693, 10); -- Magtheridon's Lair
    a[694] = b:New(694, 10); -- Serpentshrine Cavern
    a[695] = b:New(695, 10); -- The Battle for Mount Hyjal
    a[696] = b:New(696, 10); -- Tempest Keep
    a[697] = b:New(697, 10); -- The Black Temple
    a[698] = b:New(698, 10); -- Sunwell Plateau
    a[699] = b:New(699, 10); -- World Wide Winner
    a[700] = b:New(700, 0, fac.Horde, 701); -- Freedom of the Horde
    O(a[700], "From", "PvP Season", 5, "Until", "PvP Season", 18);
    a[701] = b:New(701, 0, fac.Alliance, 700); -- Freedom of the Alliance
    O(a[701], "From", "PvP Season", 5, "Until", "PvP Season", 18);
    a[705] = b:New(705, 0); -- Master of Arms
    O(a[705], "From", "Version", "000304", "Before", "Version", "040001");
    a[706] = b:New(706, 10, fac.Horde, 707); -- Frostwolf Howler
    a[707] = b:New(707, 10, fac.Alliance, 706); -- Stormpike Battle Charger
    a[708] = b:New(708, 10, fac.Horde, 709); -- Hero of the Frostwolf Clan
    a[709] = b:New(709, 10, fac.Alliance, 708); -- Hero of the Stormpike Guard
    a[710] = b:New(710, 10, fac.Horde, 711); -- The Defiler
    a[711] = b:New(711, 10, fac.Alliance, 710); -- Knight of Arathor
    a[712] = b:New(712, 10, fac.Horde, 713); -- Warsong Outrider
    a[713] = b:New(713, 10, fac.Alliance, 712); -- Silverwing Sentinel
    a[714] = b:New(714, 20, fac.Horde, 907); -- The Conqueror
    a[725] = b:New(725, 0); -- "Thori'dal, the Stars' Fury"
    a[726] = b:New(726, 10); -- Mr. Pinchy's Magical Crawdad Box
    a[727] = b:New(727, 10); -- Call in the Cavalry
    a[728] = b:New(728, 10); -- Explore Durotar
    a[729] = b:New(729, 0); -- Deathcharger's Reins
    a[730] = b:New(730, 0); -- Skills to Pay the Bills
    O(a[730], "From", "Version", "030003", "Before", "Version", "080001");
    a[731] = b:New(731, 10); -- Professional Expert
    a[732] = b:New(732, 10); -- Professional Classic Master
    a[733] = b:New(733, 10); -- Professional Outland Master
    a[734] = b:New(734, 10); -- Professional Northrend Master
    a[735] = b:New(735, 10); -- Working In the Cold
    a[736] = b:New(736, 10); -- Explore Mulgore
    a[750] = b:New(750, 10); -- Explore Northern Barrens
    a[761] = b:New(761, 10); -- Explore Arathi Highlands
    a[762] = b:New(762, 10, fac.Horde, 948); -- Ambassador of the Horde
    a[763] = b:New(763, 20, fac.Horde, 764); -- The Burning Crusader
    a[764] = b:New(764, 20, fac.Alliance, 763); -- The Burning Crusader
    a[765] = b:New(765, 10); -- Explore Badlands
    a[766] = b:New(766, 10); -- Explore Blasted Lands
    a[768] = b:New(768, 10); -- Explore Tirisfal Glades
    a[769] = b:New(769, 10); -- Explore Silverpine Forest
    a[770] = b:New(770, 10); -- Explore Western Plaguelands
    a[771] = b:New(771, 10); -- Explore Eastern Plaguelands
    a[772] = b:New(772, 10); -- Explore Hillsbrad Foothills
    a[773] = b:New(773, 10); -- Explore The Hinterlands
    a[774] = b:New(774, 10); -- Explore Searing Gorge
    a[775] = b:New(775, 10); -- Explore Burning Steppes
    a[776] = b:New(776, 10); -- Explore Elwynn Forest
    a[777] = b:New(777, 10); -- Explore Deadwind Pass
    a[778] = b:New(778, 10); -- Explore Duskwood
    a[779] = b:New(779, 10); -- Explore Loch Modan
    a[780] = b:New(780, 10); -- Explore Redridge Mountains
    a[781] = b:New(781, 10); -- Explore Northern Stranglethorn
    a[782] = b:New(782, 10); -- Explore Swamp of Sorrows
    a[783] = b:New(783, 10); -- The Perfect Storm
    a[784] = b:New(784, 10); -- Eye of the Storm Domination
    a[802] = b:New(802, 10); -- Explore Westfall
    a[841] = b:New(841, 10); -- Explore Wetlands
    a[842] = b:New(842, 10); -- Explore Teldrassil
    a[843] = b:New(843, 10); -- Explore Netherstorm
    a[844] = b:New(844, 10); -- Explore Darkshore
    a[845] = b:New(845, 10); -- Explore Ashenvale
    a[846] = b:New(846, 10); -- Explore Thousand Needles
    a[847] = b:New(847, 10); -- Explore Stonetalon Mountains
    a[848] = b:New(848, 10); -- Explore Desolace
    a[849] = b:New(849, 10); -- Explore Feralas
    a[850] = b:New(850, 10); -- Explore Dustwallow Marsh
    a[851] = b:New(851, 10); -- Explore Tanaris
    a[852] = b:New(852, 10); -- Explore Azshara
    a[853] = b:New(853, 10); -- Explore Felwood
    a[854] = b:New(854, 10); -- Explore Un'Goro Crater
    a[855] = b:New(855, 10); -- Explore Moonglade
    a[856] = b:New(856, 10); -- Explore Silithus
    a[857] = b:New(857, 10); -- Explore Winterspring
    a[858] = b:New(858, 10); -- Explore Ghostlands
    a[859] = b:New(859, 10); -- Explore Eversong Woods
    a[860] = b:New(860, 10); -- Explore Azuremyst Isle
    a[861] = b:New(861, 10); -- Explore Bloodmyst Isle
    a[862] = b:New(862, 10); -- Explore Hellfire Peninsula
    a[863] = b:New(863, 10); -- Explore Zangarmarsh
    a[864] = b:New(864, 10); -- Explore Shadowmoon Valley
    a[865] = b:New(865, 10); -- Explore Blade's Edge Mountains
    a[866] = b:New(866, 10); -- Explore Nagrand
    a[867] = b:New(867, 10); -- Explore Terokkar Forest
    a[868] = b:New(868, 10); -- Explore Isle of Quel'Danas
    a[869] = b:New(869, 10); -- 50000 Honorable Kills
    a[870] = b:New(870, 10); -- 100000 Honorable Kills
    a[871] = b:New(871, 0); -- "Avast Ye, Admiral!"
    a[872] = b:New(872, 10); -- Frenzied Defender
    a[873] = b:New(873, 20, fac.Horde, 220); -- Frostwolf Perfection
    a[875] = b:New(875, 10); -- Vengefully Dedicated
    a[876] = b:New(876, 10); -- Brutally Dedicated
    a[877] = b:New(877, 10); -- The Cake Is Not A Lie
    a[878] = b:New(878, 10); -- One That Didn't Get Away
    a[879] = b:New(879, 0); -- Old School Ride
    O(a[879]);
    a[880] = b:New(880, 0); -- Swift Zulian Tiger
    O(a[880], "From", "Version", "030002", "Before", "Version", "040001");
    a[881] = b:New(881, 0); -- Swift Razzashi Raptor
    O(a[881], "From", "Version", "030002", "Before", "Version", "040001");
    a[882] = b:New(882, 0); -- Fiery Warhorse's Reins
    a[883] = b:New(883, 0); -- Reins of the Raven Lord
    a[884] = b:New(884, 0); -- Swift White Hawkstrider
    a[885] = b:New(885, 0); -- Ashes of Al'ar
    a[886] = b:New(886, 0); -- Swift Nether Drake
    O(a[886], "From", "PvP Season", 1, "Until", "PvP Season", 1);
    a[887] = b:New(887, 0); -- Merciless Nether Drake
    O(a[887], "From", "PvP Season", 2, "Until", "PvP Season", 2);
    a[888] = b:New(888, 0); -- Vengeful Nether Drake
    O(a[888], "From", "PvP Season", 3, "Until", "PvP Season", 3);
    a[889] = b:New(889, 10); -- Fast and Furious
    a[890] = b:New(890, 10); -- Into the Wild Blue Yonder
    a[891] = b:New(891, 10); -- Giddy Up!
    a[892] = b:New(892, 0); -- The Right Stuff
    O(a[892], "From", "Version", "030002", "Before", "Version", "090001");
    a[893] = b:New(893, 10); -- Cenarion War Hippogryph
    a[894] = b:New(894, 10); -- Flying High Over Skettis
    a[896] = b:New(896, 10); -- A Quest a Day Keeps the Ogres at Bay
    a[897] = b:New(897, 10); -- You're So Offensive
    a[898] = b:New(898, 10); -- On Wings of Nether
    a[899] = b:New(899, 15, fac.Alliance, 901); -- "Oh My, Kurenai"
    a[900] = b:New(900, 15); -- The Czar of Sporeggar
    a[901] = b:New(901, 15, fac.Horde, 899); -- Mag'har of Draenor
    a[902] = b:New(902, 10); -- Chief Exalted Officer
    a[903] = b:New(903, 10); -- Shattrath Divided
    a[905] = b:New(905, 10); -- Old Man Barlowned
    a[906] = b:New(906, 10); -- Kickin' It Up a Notch
    a[907] = b:New(907, 20, fac.Alliance, 714); -- The Justicar
    a[908] = b:New(908, 10, fac.Alliance, 909); -- Call to Arms!
    a[909] = b:New(909, 10, fac.Horde, 908); -- Call to Arms!
    a[910] = b:New(910, 10); -- Elders of the Dungeons
    a[911] = b:New(911, 10); -- Elders of Kalimdor
    a[912] = b:New(912, 10); -- Elders of Eastern Kingdoms
    a[913] = b:New(913, 30); -- To Honor One's Elders
    a[914] = b:New(914, 10); -- Elders of the Horde
    a[915] = b:New(915, 10); -- Elders of the Alliance
    a[937] = b:New(937, 10); -- Elune's Blessing
    a[938] = b:New(938, 10); -- The Snows of Northrend
    a[939] = b:New(939, 10); -- Hills Like White Elekk
    a[940] = b:New(940, 10); -- The Green Hills of Stranglethorn
    a[941] = b:New(941, 10); -- Hemet Nesingwary: The Collected Quests
    a[942] = b:New(942, 25, fac.Alliance, 943); -- The Diplomat
    a[943] = b:New(943, 25, fac.Horde, 942); -- The Diplomat
    a[944] = b:New(944, 15); -- They Love Me In That Tunnel
    a[945] = b:New(945, 25); -- The Argent Champion
    a[946] = b:New(946, 15); -- The Argent Dawn
    a[947] = b:New(947, 15); -- The Argent Crusade
    a[948] = b:New(948, 10, fac.Alliance, 762); -- Ambassador of the Alliance
    a[949] = b:New(949, 15); -- Tuskarrmageddon
    a[950] = b:New(950, 10); -- Frenzyheart Tribe
    a[951] = b:New(951, 10); -- The Oracles
    a[952] = b:New(952, 10); -- Mercenary of Sholazar
    a[953] = b:New(953, 25); -- Guardian of Cenarius
    a[955] = b:New(955, 10); -- Hydraxian Waterlords
    a[956] = b:New(956, 10); -- Brood of Nozdormu
    a[957] = b:New(957, 0); -- Hero of the Zandalar Tribe
    O(a[957], "From", "Version", "030002", "Before", "Version", "040001");
    a[958] = b:New(958, 10); -- Sworn to the Deathsworn
    a[959] = b:New(959, 10); -- The Scale of the Sands
    a[960] = b:New(960, 10); -- The Violet Eye
    a[961] = b:New(961, 10); -- Honorary Frenzyheart
    a[962] = b:New(962, 10); -- Savior of the Oracles
    a[963] = b:New(963, 10, fac.Alliance, 965); -- Tricks and Treats of Kalimdor
    a[964] = b:New(964, 10); -- Going Down?
    a[965] = b:New(965, 10, fac.Horde, 963); -- Tricks and Treats of Kalimdor
    a[966] = b:New(966, 10, fac.Alliance, 967); -- Tricks and Treats of Eastern Kingdoms
    a[967] = b:New(967, 10, fac.Horde, 966); -- Tricks and Treats of Eastern Kingdoms
    a[968] = b:New(968, 10, fac.Horde, 969); -- Tricks and Treats of Outland
    a[969] = b:New(969, 10, fac.Alliance, 968); -- Tricks and Treats of Outland
    a[971] = b:New(971, 20); -- Tricks and Treats of Azeroth
    a[972] = b:New(972, 10); -- Trick or Treat!
    a[973] = b:New(973, 10); -- 5 Daily Quests Completed
    a[974] = b:New(974, 10); -- 50 Daily Quests Completed
    a[975] = b:New(975, 10); -- 200 Daily Quests Completed
    a[976] = b:New(976, 10); -- 500 Daily Quests Completed
    a[977] = b:New(977, 10); -- 1000 Daily Quests Completed
    a[978] = b:New(978, 50); -- 3000 Quests Completed
    a[979] = b:New(979, 10); -- The Mask Task
    a[980] = b:New(980, 0); -- The Horseman's Reins
    a[981] = b:New(981, 10); -- That Sparkling Smile
    a[1005] = b:New(1005, 10, fac.Horde, 246); -- Know Thy Enemy
    a[1006] = b:New(1006, 10, fac.Horde, 388); -- City Defender
    a[1007] = b:New(1007, 10); -- The Wyrmrest Accord
    a[1008] = b:New(1008, 10); -- The Kirin Tor
    a[1009] = b:New(1009, 10); -- Knights of the Ebon Blade
    a[1010] = b:New(1010, 20); -- Northrend Vanguard
    a[1011] = b:New(1011, 20, fac.Horde, 1012); -- The Winds of the North
    a[1012] = b:New(1012, 20, fac.Alliance, 1011); -- The Winds of the North
    a[1014] = b:New(1014, 10); -- 35 Exalted Reputations
    a[1015] = b:New(1015, 10); -- 40 Exalted Reputations
    a[1017] = b:New(1017, 10); -- Can I Keep Him?
    a[1020] = b:New(1020, 10); -- Ten Tabards
    a[1021] = b:New(1021, 10); -- Twenty-Five Tabards
    a[1022] = b:New(1022, 10, fac.Alliance, 1025); -- Flame Warden of Eastern Kingdoms
    a[1023] = b:New(1023, 10, fac.Alliance, 1026); -- Flame Warden of Kalimdor
    a[1024] = b:New(1024, 10, fac.Alliance, 1027); -- Flame Warden of Outland
    a[1025] = b:New(1025, 10, fac.Horde, 1022); -- Flame Keeper of Eastern Kingdoms
    a[1026] = b:New(1026, 10, fac.Horde, 1023); -- Flame Keeper of Kalimdor
    a[1027] = b:New(1027, 10, fac.Horde, 1024); -- Flame Keeper of Outland
    a[1028] = b:New(1028, 10, fac.Alliance, 1031); -- Extinguishing Eastern Kingdoms
    a[1029] = b:New(1029, 10, fac.Alliance, 1032); -- Extinguishing Kalimdor
    a[1030] = b:New(1030, 10, fac.Alliance, 1033); -- Extinguishing Outland
    a[1031] = b:New(1031, 10, fac.Horde, 1028); -- Extinguishing Eastern Kingdoms
    a[1032] = b:New(1032, 10, fac.Horde, 1029); -- Extinguishing Kalimdor
    a[1033] = b:New(1033, 10, fac.Horde, 1030); -- Extinguishing Outland
    a[1034] = b:New(1034, 10, fac.Alliance, 1036); -- The Fires of Azeroth
    a[1035] = b:New(1035, 10, fac.Alliance, 1037); -- Desecration of the Horde
    a[1036] = b:New(1036, 10, fac.Horde, 1034); -- The Fires of Azeroth
    a[1037] = b:New(1037, 10, fac.Horde, 1035); -- Desecration of the Alliance
    a[1038] = b:New(1038, 20, fac.Alliance, 1039); -- The Flame Warden
    a[1039] = b:New(1039, 20, fac.Horde, 1038); -- The Flame Keeper
    a[1040] = b:New(1040, 10, fac.Alliance, 1041); -- Rotten Hallow
    a[1041] = b:New(1041, 10, fac.Horde, 1040); -- Rotten Hallow
    a[1145] = b:New(1145, 10); -- King of the Fire Festival
    a[1151] = b:New(1151, 10, fac.Alliance, 224); -- Loyal Defender
    a[1153] = b:New(1153, 10); -- Overly Defensive
    a[1157] = b:New(1157, 10); -- Duel-icious
    a[1159] = b:New(1159, 10); -- Just the Two of Us: 2200
    a[1160] = b:New(1160, 10); -- Three's Company: 2200
    a[1161] = b:New(1161, 0); -- High Five: 2200
    O(a[1161], "From", "Version", "030003", "Before", "Version", "070003");
    a[1162] = b:New(1162, 10); -- Hotter Streak
    a[1164] = b:New(1164, 10, fac.Horde, 225); -- Everything Counts
    a[1165] = b:New(1165, 10); -- "My Storage is ""Gigantique"""
    a[1166] = b:New(1166, 10); -- To the Looter Go the Spoils
    a[1167] = b:New(1167, 25); -- Master of Alterac Valley
    a[1169] = b:New(1169, 25); -- Master of Arathi Basin
    a[1171] = b:New(1171, 25); -- Master of Eye of the Storm
    a[1172] = b:New(1172, 25); -- Master of Warsong Gulch
    a[1174] = b:New(1174, 0); -- The Arena Master
    O(a[1174], "From", "Version", "030003", "Before", "Version", "070003");
    a[1175] = b:New(1175, 50, fac.Horde, 230); -- Battlemaster
    a[1176] = b:New(1176, 10); -- Got My Mind On My Money
    a[1177] = b:New(1177, 10); -- Got My Mind On My Money
    a[1178] = b:New(1178, 10); -- Got My Mind On My Money
    a[1180] = b:New(1180, 10); -- Got My Mind On My Money
    a[1181] = b:New(1181, 10); -- Got My Mind On My Money
    a[1182] = b:New(1182, 10); -- The Bread Winner
    a[1183] = b:New(1183, 10); -- Brew of the Year
    a[1184] = b:New(1184, 10, fac.Alliance, 1203); -- Strange Brew
    a[1185] = b:New(1185, 10); -- The Brewfest Diet
    a[1186] = b:New(1186, 0); -- Down With The Dark Iron
    O(a[1186], "From", "Version", "030002", "Before", "Version", "080200");
    a[1188] = b:New(1188, 10); -- Shafted!
    a[1189] = b:New(1189, 10, fac.Alliance, 1271); -- To Hellfire and Back
    a[1190] = b:New(1190, 10); -- Mysteries of the Marsh
    a[1191] = b:New(1191, 10, fac.Alliance, 1272); -- Terror of Terokkar
    a[1192] = b:New(1192, 10, fac.Alliance, 1273); -- Nagrand Slam
    a[1193] = b:New(1193, 10); -- On the Blade's Edge
    a[1194] = b:New(1194, 10); -- Into the Nether
    a[1195] = b:New(1195, 10); -- Shadow of the Betrayer
    a[1203] = b:New(1203, 10, fac.Horde, 1184); -- Strange Brew
    a[1205] = b:New(1205, 0); -- Hero of Shattrath
    a[1206] = b:New(1206, 10); -- To All The Squirrels I've Loved Before
    a[1225] = b:New(1225, 10); -- Outland Angler
    a[1243] = b:New(1243, 10); -- Fish Don't Leave Footprints
    a[1244] = b:New(1244, 10); -- Well Read
    a[1248] = b:New(1248, 10); -- Plethora of Pets
    a[1250] = b:New(1250, 10); -- "Shop Smart, Shop Pet...Smart"
    a[1251] = b:New(1251, 10, fac.Horde, 203); -- Not In My House
    a[1252] = b:New(1252, 10, fac.Horde, 206); -- Supreme Defender
    a[1254] = b:New(1254, 10); -- Friend or Fowl?
    a[1255] = b:New(1255, 10, fac.Alliance, 259); -- Scrooge
    a[1257] = b:New(1257, 10); -- The Scavenger
    a[1258] = b:New(1258, 10); -- Take a Chill Pill
    a[1259] = b:New(1259, 10); -- Not So Fast
    a[1260] = b:New(1260, 10); -- Almost Blind Luck
    a[1261] = b:New(1261, 10); -- G.N.E.R.D. Rage
    a[1262] = b:New(1262, 10); -- Loremaster of Outland
    a[1263] = b:New(1263, 10); -- Explore Howling Fjord
    a[1264] = b:New(1264, 10); -- Explore Borean Tundra
    a[1265] = b:New(1265, 10); -- Explore Dragonblight
    a[1266] = b:New(1266, 10); -- Explore Grizzly Hills
    a[1267] = b:New(1267, 10); -- Explore Zul'Drak
    a[1268] = b:New(1268, 10); -- Explore Sholazar Basin
    a[1269] = b:New(1269, 10); -- Explore Storm Peaks
    a[1270] = b:New(1270, 10); -- Explore Icecrown
    a[1271] = b:New(1271, 10, fac.Horde, 1189); -- To Hellfire and Back
    a[1272] = b:New(1272, 10, fac.Horde, 1191); -- Terror of Terokkar
    a[1273] = b:New(1273, 10, fac.Horde, 1192); -- Nagrand Slam
    a[1275] = b:New(1275, 10); -- Bombs Away
    a[1276] = b:New(1276, 10); -- Blade's Edge Bomberman
    a[1277] = b:New(1277, 10); -- Rapid Defense
    a[1279] = b:New(1279, 10, fac.Alliance, 1280); -- Flirt With Disaster
    a[1280] = b:New(1280, 10, fac.Horde, 1279); -- Flirt With Disaster
    a[1281] = b:New(1281, 10); -- The Rocket's Red Glare
    a[1282] = b:New(1282, 10); -- Fa-la-la-la-Ogri'la
    a[1283] = b:New(1283, 10); -- Classic Dungeonmaster
    a[1284] = b:New(1284, 10); -- Outland Dungeonmaster
    a[1285] = b:New(1285, 20); -- Classic Raider
    a[1286] = b:New(1286, 20); -- Outland Raider
    a[1287] = b:New(1287, 20); -- Outland Dungeon Hero
    a[1288] = b:New(1288, 10); -- Northrend Dungeonmaster
    a[1289] = b:New(1289, 20); -- Northrend Dungeon Hero
    a[1291] = b:New(1291, 10); -- Lonely?
    a[1292] = b:New(1292, 0); -- Yellow Brewfest Stein
    O(a[1292]);
    a[1293] = b:New(1293, 0); -- Blue Brewfest Stein
    O(a[1293]);
    a[1295] = b:New(1295, 10); -- Crashin' & Thrashin'
    a[1296] = b:New(1296, 10); -- Watch Him Die
    a[1297] = b:New(1297, 10); -- Hadronox Denied
    a[1307] = b:New(1307, 0); -- Upper Blackrock Spire (Classic)
    O(a[1307], "From", "Version", "030002", "Before", "Version", "060002");
    a[1308] = b:New(1308, 0); -- Strand of the Ancients Victory
    O(a[1308], "From", "Version", "030003", "Before", "Version", "080001");
    a[1309] = b:New(1309, 0); -- Strand of the Ancients Veteran
    O(a[1309], "From", "Version", "030003", "Before", "Version", "080001");
    a[1310] = b:New(1310, 0); -- Storm the Beach
    O(a[1310], "From", "Version", "030003", "Before", "Version", "080001");
    a[1311] = b:New(1311, 10); -- Medium Rare
    a[1312] = b:New(1312, 25); -- Bloody Rare
    a[1356] = b:New(1356, 10, fac.Horde, 34); -- I've Toured the Fjord
    a[1357] = b:New(1357, 10, fac.Horde, 37); -- Fo' Grizzle My Shizzle
    a[1358] = b:New(1358, 10, fac.Horde, 33); -- Nothing Boring About Borean
    a[1359] = b:New(1359, 10, fac.Horde, 35); -- Might of Dragonblight
    a[1396] = b:New(1396, 10); -- Elders of Northrend
    a[1400] = b:New(1400, 0, nil, nil, true); -- Realm First! Magic Seeker
    O(a[1400], "Once");
    a[1402] = b:New(1402, 0, nil, nil, true); -- Realm First! Conqueror of Naxxramas
    O(a[1402], "Once");
    a[1404] = b:New(1404, 0, nil, nil, true); -- Realm First! Level 80 Gnome
    O(a[1404], "Once");
    a[1405] = b:New(1405, 0, nil, nil, true); -- Realm First! Level 80 Blood Elf
    O(a[1405], "Once");
    a[1406] = b:New(1406, 0, nil, nil, true); -- Realm First! Level 80 Draenei
    O(a[1406], "Once");
    a[1407] = b:New(1407, 0, nil, nil, true); -- Realm First! Level 80 Dwarf
    O(a[1407], "Once");
    a[1408] = b:New(1408, 0, nil, nil, true); -- Realm First! Level 80 Human
    O(a[1408], "Once");
    a[1409] = b:New(1409, 0, nil, nil, true); -- Realm First! Level 80 Night Elf
    O(a[1409], "Once");
    a[1410] = b:New(1410, 0, nil, nil, true); -- Realm First! Level 80 Orc
    O(a[1410], "Once");
    a[1411] = b:New(1411, 0, nil, nil, true); -- Realm First! Level 80 Tauren
    O(a[1411], "Once");
    a[1412] = b:New(1412, 0, nil, nil, true); -- Realm First! Level 80 Troll
    O(a[1412], "Once");
    a[1413] = b:New(1413, 0, nil, nil, true); -- Realm First! Level 80 Forsaken
    O(a[1413], "Once");
    a[1414] = b:New(1414, 0, nil, nil, true); -- Realm First! Grand Master Blacksmith
    O(a[1414], "Once");
    a[1415] = b:New(1415, 0, nil, nil, true); -- Realm First! Grand Master Alchemist
    O(a[1415], "Once");
    a[1416] = b:New(1416, 0, nil, nil, true); -- Realm First! Grand Master Cook
    O(a[1416], "Once");
    a[1417] = b:New(1417, 0, nil, nil, true); -- Realm First! Grand Master Enchanter
    O(a[1417], "Once");
    a[1418] = b:New(1418, 0, nil, nil, true); -- Realm First! Grand Master Engineer
    O(a[1418], "Once");
    a[1419] = b:New(1419, 0, nil, nil, true); -- Realm First! Grand Master Medic
    O(a[1419], "Once");
    a[1420] = b:New(1420, 0, nil, nil, true); -- Realm First! Grand Master Angler
    O(a[1420], "Once");
    a[1421] = b:New(1421, 0, nil, nil, true); -- Realm First! Grand Master Herbalist
    O(a[1421], "Once");
    a[1422] = b:New(1422, 0, nil, nil, true); -- Realm First! Grand Master Scribe
    O(a[1422], "Once");
    a[1423] = b:New(1423, 0, nil, nil, true); -- Realm First! Grand Master Jewelcrafter
    O(a[1423], "Once");
    a[1424] = b:New(1424, 0, nil, nil, true); -- Realm First! Grand Master Leatherworker
    O(a[1424], "Once");
    a[1425] = b:New(1425, 0, nil, nil, true); -- Realm First! Grand Master Miner
    O(a[1425], "Once");
    a[1426] = b:New(1426, 0, nil, nil, true); -- Realm First! Grand Master Skinner
    O(a[1426], "Once");
    a[1427] = b:New(1427, 0, nil, nil, true); -- Realm First! Grand Master Tailor
    O(a[1427], "Once");
    a[1428] = b:New(1428, 10); -- Mine Sweeper
    a[1436] = b:New(1436, 0); -- Friends In High Places
    O(a[1436]);
    a[1457] = b:New(1457, 10); -- Explore Crystalsong Forest
    a[1463] = b:New(1463, 0, nil, nil, true); -- Realm First! Northrend Vanguard
    O(a[1463], "Once");
    a[1502] = b:New(1502, 10, fac.Horde, 202); -- Quick Cap
    a[1516] = b:New(1516, 10); -- Accomplished Angler
    a[1517] = b:New(1517, 10); -- Northrend Angler
    a[1552] = b:New(1552, 10); -- Frenzied Firecracker
    a[1556] = b:New(1556, 10); -- 25 Fish
    a[1557] = b:New(1557, 10); -- 50 Fish
    a[1558] = b:New(1558, 10); -- 100 Fish
    a[1559] = b:New(1559, 10); -- 250 Fish
    a[1560] = b:New(1560, 10); -- 500 Fish
    a[1561] = b:New(1561, 10); -- 1000 Fish
    a[1563] = b:New(1563, 10); -- Hail to the Chef
    a[1576] = b:New(1576, 10); -- Of Blood and Anguish
    a[1596] = b:New(1596, 10); -- Guru of Drakuru
    a[1636] = b:New(1636, 0); -- Competitor's Tabard
    O(a[1636]);
    a[1637] = b:New(1637, 0); -- Spirit of Competition
    O(a[1637]);
    a[1638] = b:New(1638, 10); -- Skyshattered
    a[1656] = b:New(1656, 10); -- Hallowed Be Thy Name
    a[1658] = b:New(1658, 10); -- Champion of the Frozen Wastes
    a[1676] = b:New(1676, 10); -- Loremaster of Eastern Kingdoms
    a[1678] = b:New(1678, 10); -- Loremaster of Kalimdor
    a[1683] = b:New(1683, 10); -- Brewmaster
    a[1685] = b:New(1685, 10, fac.Horde, 1686); -- Holiday Bromance
    a[1686] = b:New(1686, 10, fac.Alliance, 1685); -- Holiday Bromance
    a[1687] = b:New(1687, 10); -- Let It Snow
    a[1688] = b:New(1688, 10); -- The Winter Veil Gourmet
    a[1689] = b:New(1689, 10); -- He Knows If You've Been Naughty
    a[1690] = b:New(1690, 10); -- A Frosty Shake
    a[1691] = b:New(1691, 10); -- Merrymaker
    a[1693] = b:New(1693, 10); -- Fool For Love
    a[1694] = b:New(1694, 10); -- Lovely Luck Is On Your Side
    a[1695] = b:New(1695, 10); -- Dangerous Love
    a[1696] = b:New(1696, 10); -- The Rocket's Pink Glare
    a[1697] = b:New(1697, 10, fac.Alliance, 1698); -- Nation of Adoration
    a[1698] = b:New(1698, 10, fac.Horde, 1697); -- Nation of Adoration
    a[1699] = b:New(1699, 10); -- Fistful of Love
    a[1700] = b:New(1700, 10); -- Perma-Peddle
    a[1701] = b:New(1701, 10); -- Be Mine!
    a[1702] = b:New(1702, 10); -- Sweet Tooth
    a[1703] = b:New(1703, 10); -- "My Love is Like a Red, Red Rose"
    a[1704] = b:New(1704, 10); -- I Pitied The Fool
    a[1705] = b:New(1705, 0); -- Clockwork Rocket Bot
    a[1706] = b:New(1706, 0); -- Crashin' Thrashin' Racer
    a[1717] = b:New(1717, 10); -- Wintergrasp Victory
    a[1718] = b:New(1718, 10); -- Wintergrasp Veteran
    a[1721] = b:New(1721, 10); -- Archavon the Stone Watcher (25 player)
    a[1722] = b:New(1722, 10); -- Archavon the Stone Watcher (10 player)
    a[1723] = b:New(1723, 10); -- Vehicular Gnomeslaughter
    a[1727] = b:New(1727, 10); -- Leaning Tower
    a[1737] = b:New(1737, 10, fac.Alliance, 2476); -- Destruction Derby
    a[1751] = b:New(1751, 10); -- Didn't Stand a Chance
    a[1752] = b:New(1752, 10); -- Master of Wintergrasp
    a[1755] = b:New(1755, 10); -- Within Our Grasp
    a[1757] = b:New(1757, 0, fac.Alliance, 2200); -- Defense of the Ancients
    O(a[1757], "From", "Version", "030003", "Before", "Version", "080001");
    a[1761] = b:New(1761, 0); -- The Dapper Sapper
    O(a[1761], "From", "Version", "030003", "Before", "Version", "080001");
    a[1762] = b:New(1762, 0, fac.Alliance, 2192); -- Not Even a Scratch
    O(a[1762], "From", "Version", "030003", "Before", "Version", "080001");
    a[1763] = b:New(1763, 0); -- Artillery Veteran
    O(a[1763], "From", "Version", "030003", "Before", "Version", "080001");
    a[1764] = b:New(1764, 0); -- Drop It!
    O(a[1764], "From", "Version", "030003", "Before", "Version", "080001");
    a[1765] = b:New(1765, 0); -- Steady Hands
    O(a[1765], "From", "Version", "030003", "Before", "Version", "080001");
    a[1766] = b:New(1766, 0); -- Ancient Protector
    O(a[1766], "From", "Version", "030003", "Before", "Version", "080001");
    a[1777] = b:New(1777, 10); -- The Northrend Gourmet
    a[1778] = b:New(1778, 10); -- The Northrend Gourmet
    a[1779] = b:New(1779, 10); -- The Northrend Gourmet
    a[1780] = b:New(1780, 10); -- Second That Emotion
    a[1781] = b:New(1781, 10); -- Critter Gitter
    a[1782] = b:New(1782, 10, fac.Alliance, 1783); -- Our Daily Bread
    a[1783] = b:New(1783, 10, fac.Horde, 1782); -- Our Daily Bread
    a[1785] = b:New(1785, 10); -- Dinner Impossible
    a[1786] = b:New(1786, 10); -- School of Hard Knocks
    a[1788] = b:New(1788, 10); -- Bad Example
    a[1789] = b:New(1789, 10); -- Daily Chores
    a[1790] = b:New(1790, 10); -- "Hail To The King, Baby"
    a[1791] = b:New(1791, 10); -- Home Alone
    a[1792] = b:New(1792, 10); -- "Aw, Isn't It Cute?"
    a[1793] = b:New(1793, 10); -- For the Children
    a[1795] = b:New(1795, 10); -- Lunch Lady
    a[1796] = b:New(1796, 10); -- Short Order Cook
    a[1797] = b:New(1797, 10); -- Chef de Partie
    a[1798] = b:New(1798, 10); -- Sous Chef
    a[1799] = b:New(1799, 10); -- Chef de Cuisine
    a[1800] = b:New(1800, 10); -- The Outland Gourmet
    a[1801] = b:New(1801, 10); -- Captain Rumsey's Lager
    a[1816] = b:New(1816, 10); -- Defenseless
    a[1817] = b:New(1817, 10); -- The Culling of Time
    a[1832] = b:New(1832, 10); -- Tastes Like Chicken
    a[1833] = b:New(1833, 10); -- It's Happy Hour Somewhere
    a[1834] = b:New(1834, 10); -- Lightning Struck
    a[1836] = b:New(1836, 10); -- Old Crafty
    a[1837] = b:New(1837, 10); -- Old Ironjaw
    a[1856] = b:New(1856, 10); -- Make Quick Werk of Him (10 player)
    a[1857] = b:New(1857, 10); -- Make Quick Werk of Him (25 player)
    a[1858] = b:New(1858, 10); -- Arachnophobia (10 player)
    a[1859] = b:New(1859, 10); -- Arachnophobia (25 player)
    a[1860] = b:New(1860, 10); -- Gotta Go!
    a[1862] = b:New(1862, 10); -- Volazj's Quick Demise
    a[1864] = b:New(1864, 10); -- What the Eck?
    a[1865] = b:New(1865, 10); -- Lockdown!
    a[1866] = b:New(1866, 10); -- Good Grief
    a[1867] = b:New(1867, 10); -- Timely Death
    a[1868] = b:New(1868, 10); -- Make It Count
    a[1869] = b:New(1869, 10); -- A Poke in the Eye (10 player)
    a[1870] = b:New(1870, 10); -- A Poke in the Eye (25 player)
    a[1871] = b:New(1871, 10); -- Experienced Drake Rider
    a[1872] = b:New(1872, 10); -- Zombiefest!
    a[1873] = b:New(1873, 10); -- Lodi Dodi We Loves the Skadi
    a[1874] = b:New(1874, 10); -- You Don't Have an Eternity (10 player)
    a[1875] = b:New(1875, 10); -- You Don't Have an Eternity (25 player)
    a[1876] = b:New(1876, 10); -- Besting the Black Dragonflight (10 player)
    a[1877] = b:New(1877, 10); -- Less Is More (25 player)
    a[1919] = b:New(1919, 10); -- On The Rocks
    a[1936] = b:New(1936, 10); -- Does Your Wolpertinger Linger?
    a[1956] = b:New(1956, 10); -- Higher Learning
    a[1957] = b:New(1957, 10); -- There's Gold In That There Fountain
    a[1958] = b:New(1958, 10); -- I Smell A Giant Rat
    a[1996] = b:New(1996, 10); -- The Safety Dance (10 player)
    a[1997] = b:New(1997, 10); -- Momma Said Knock You Out (10 player)
    a[1998] = b:New(1998, 10); -- Cooking Award
    a[1999] = b:New(1999, 10); -- 10 Cooking Awards
    a[2000] = b:New(2000, 10); -- 25 Cooking Awards
    a[2001] = b:New(2001, 10); -- 50 Cooking Awards
    a[2002] = b:New(2002, 10); -- 100 Cooking Awards
    a[2016] = b:New(2016, 10, fac.Alliance, 2017); -- Grizzled Veteran
    a[2017] = b:New(2017, 10, fac.Horde, 2016); -- Grizzled Veteran
    a[2018] = b:New(2018, 0); -- Timear Foresees
    O(a[2018], "From", "Version", "030003", "Before", "Version", "030300");
    a[2019] = b:New(2019, 0); -- Proof of Demise
    O(a[2019], "From", "Version", "030003", "Before", "Version", "030300");
    a[2036] = b:New(2036, 10); -- Intense Cold
    a[2037] = b:New(2037, 10); -- Chaos Theory
    a[2038] = b:New(2038, 10); -- Respect Your Elders
    a[2039] = b:New(2039, 10); -- Better Off Dred
    a[2040] = b:New(2040, 10); -- Less-rabi
    a[2041] = b:New(2041, 10); -- Dehydration
    a[2042] = b:New(2042, 10); -- Shatter Resistant
    a[2043] = b:New(2043, 10); -- The Incredible Hulk
    a[2044] = b:New(2044, 10); -- Ruby Void
    a[2045] = b:New(2045, 10); -- Emerald Void
    a[2046] = b:New(2046, 10); -- Amber Void
    a[2047] = b:New(2047, 10); -- Gonna Go When the Volcano Blows (10 player)
    a[2048] = b:New(2048, 10); -- Gonna Go When the Volcano Blows (25 player)
    a[2049] = b:New(2049, 10); -- Twilight Assist (10 player)
    a[2050] = b:New(2050, 10); -- Twilight Duo (10 player)
    a[2051] = b:New(2051, 10); -- The Twilight Zone (10 player)
    a[2052] = b:New(2052, 10); -- Twilight Assist (25 player)
    a[2053] = b:New(2053, 10); -- Twilight Duo (25 player)
    a[2054] = b:New(2054, 10); -- The Twilight Zone (25 player)
    a[2056] = b:New(2056, 10); -- Volunteer Work
    a[2057] = b:New(2057, 10); -- Oh Novos!
    a[2058] = b:New(2058, 10); -- Snakes. Why'd It Have To Be Snakes?
    a[2076] = b:New(2076, 10); -- Armored Brown Bear
    a[2077] = b:New(2077, 10); -- Wooly Mammoth
    a[2078] = b:New(2078, 10); -- Traveler's Tundra Mammoth
    a[2079] = b:New(2079, 0); -- Tabard of the Protector
    O(a[2079]);
    a[2080] = b:New(2080, 10); -- Black War Mammoth
    a[2081] = b:New(2081, 0); -- Grand Black War Mammoth
    a[2082] = b:New(2082, 10); -- Ice Mammoth
    a[2083] = b:New(2083, 10); -- Grand Ice Mammoth
    a[2084] = b:New(2084, 10); -- Ring of the Kirin Tor
    a[2085] = b:New(2085, 0); -- 50 Stone Keeper's Shards
    O(a[2085], "From", "Version", "030003", "Before", "Version", "040001");
    a[2086] = b:New(2086, 0); -- 100 Stone Keeper's Shards
    O(a[2086], "From", "Version", "030003", "Before", "Version", "040001");
    a[2087] = b:New(2087, 0); -- 250 Stone Keeper's Shards
    O(a[2087], "From", "Version", "030003", "Before", "Version", "040001");
    a[2088] = b:New(2088, 0); -- 500 Stone Keeper's Shards
    O(a[2088], "From", "Version", "030003", "Before", "Version", "040001");
    a[2089] = b:New(2089, 0); -- 1000 Stone Keeper's Shards
    O(a[2089], "From", "Version", "030003", "Before", "Version", "040001");
    a[2090] = b:New(2090, 10); -- Challenger
    a[2091] = b:New(2091, 10); -- Gladiator
    a[2092] = b:New(2092, 10); -- Duelist
    a[2093] = b:New(2093, 10); -- Rival
    a[2094] = b:New(2094, 10); -- A Penny For Your Thoughts
    a[2095] = b:New(2095, 10); -- Silver in the City
    a[2096] = b:New(2096, 10); -- The Coin Master
    a[2097] = b:New(2097, 10); -- Get to the Choppa!
    a[2116] = b:New(2116, 0); -- Tabard of the Argent Dawn
    O(a[2116]);
    a[2136] = b:New(2136, 25); -- Glory of the Hero
    a[2137] = b:New(2137, 25); -- Glory of the Raider (10 player)
    a[2138] = b:New(2138, 25); -- Glory of the Raider (25 player)
    a[2139] = b:New(2139, 10); -- The Safety Dance (25 player)
    a[2140] = b:New(2140, 10); -- Momma Said Knock You Out (25 player)
    a[2141] = b:New(2141, 10); -- Stable Keeper
    a[2142] = b:New(2142, 10); -- Filling Up The Barn
    a[2143] = b:New(2143, 10); -- Leading the Cavalry
    a[2144] = b:New(2144, 50); -- "What a Long, Strange Trip It's Been"
    a[2146] = b:New(2146, 10); -- The Hundred Club (10 player)
    a[2147] = b:New(2147, 10); -- The Hundred Club (25 player)
    a[2148] = b:New(2148, 10); -- Denyin' the Scion (10 player)
    a[2149] = b:New(2149, 10); -- Denyin' the Scion (25 player)
    a[2150] = b:New(2150, 10); -- Split Personality
    a[2151] = b:New(2151, 10); -- Consumption Junction
    a[2152] = b:New(2152, 10); -- Share The Love
    a[2153] = b:New(2153, 10); -- A Void Dance
    a[2154] = b:New(2154, 10); -- Brann Spankin' New
    a[2155] = b:New(2155, 10); -- Abuse the Ooze
    a[2156] = b:New(2156, 10); -- My Girl Loves to Skadi All the Time
    a[2157] = b:New(2157, 10); -- King's Bane
    a[2176] = b:New(2176, 10); -- And They Would All Go Down Together (10 player)
    a[2177] = b:New(2177, 10); -- And They Would All Go Down Together (25 player)
    a[2178] = b:New(2178, 10); -- Shocking! (10 player)
    a[2179] = b:New(2179, 10); -- Shocking! (25 player)
    a[2180] = b:New(2180, 10); -- Subtraction (10 player)
    a[2181] = b:New(2181, 10); -- Subtraction (25 player)
    a[2182] = b:New(2182, 10); -- Spore Loser (10 player)
    a[2183] = b:New(2183, 10); -- Spore Loser (25 player)
    a[2184] = b:New(2184, 10); -- Just Can't Get Enough (10 player)
    a[2185] = b:New(2185, 10); -- Just Can't Get Enough (25 player)
    a[2186] = b:New(2186, 0); -- The Immortal
    O(a[2186], "From", "Version", "030003", "Before", "Version", "040003a");
    a[2187] = b:New(2187, 0); -- The Undying
    O(a[2187], "From", "Version", "030003", "Before", "Version", "040003a");
    a[2188] = b:New(2188, 0); -- Leeeeeeeeeeeeeroy!
    O(a[2188], "From", "Version", "030002", "Before", "Version", "060002");
    a[2189] = b:New(2189, 0); -- Artillery Expert
    O(a[2189], "From", "Version", "030003", "Before", "Version", "080001");
    a[2190] = b:New(2190, 0); -- Drop It Now!
    O(a[2190], "From", "Version", "030003", "Before", "Version", "080001");
    a[2191] = b:New(2191, 0); -- Ancient Courtyard Protector
    O(a[2191], "From", "Version", "030003", "Before", "Version", "080001");
    a[2192] = b:New(2192, 0, fac.Horde, 1762); -- Not Even a Scratch
    O(a[2192], "From", "Version", "030003", "Before", "Version", "080001");
    a[2193] = b:New(2193, 0); -- Explosives Expert
    O(a[2193], "From", "Version", "030003", "Before", "Version", "080001");
    a[2194] = b:New(2194, 0); -- Master of Strand of the Ancients
    O(a[2194], "From", "Version", "030003", "Before", "Version", "080001");
    a[2199] = b:New(2199, 10); -- Wintergrasp Ranger
    a[2200] = b:New(2200, 0, fac.Horde, 1757); -- Defense of the Ancients
    O(a[2200], "From", "Version", "030003", "Before", "Version", "080001");
    a[2256] = b:New(2256, 10); -- Northern Exposure
    a[2257] = b:New(2257, 25); -- Frostbitten
    a[2316] = b:New(2316, 0); -- Brutal Nether Drake
    O(a[2316], "From", "PvP Season", 4, "Until", "PvP Season", 4);
    a[2336] = b:New(2336, 0); -- Insane in the Membrane
    a[2357] = b:New(2357, 0); -- Dreadsteed of Xoroth
    O(a[2357], "From", "Version", "010400", "Before", "Version", "040003a");
    a[2358] = b:New(2358, 0); -- Charger
    O(a[2358], "From", "Version", "010400", "Before", "Version", "040003a");
    a[2359] = b:New(2359, 0); -- Swift Flight Form
    O(a[2359], "From", "Version", "020100", "Before", "Version", "040003a");
    a[2398] = b:New(2398, 0); -- WoW's 4th Anniversary
    O(a[2398]);
    a[2416] = b:New(2416, 10); -- Hard Boiled
    a[2417] = b:New(2417, 10); -- Chocolate Lover
    a[2418] = b:New(2418, 10); -- Chocoholic
    a[2419] = b:New(2419, 10, fac.Alliance, 2497); -- Spring Fling
    a[2420] = b:New(2420, 10, fac.Horde, 2421); -- Noble Garden
    a[2421] = b:New(2421, 10, fac.Alliance, 2420); -- Noble Garden
    a[2422] = b:New(2422, 10); -- Shake Your Bunny-Maker
    a[2436] = b:New(2436, 10); -- Desert Rose
    a[2456] = b:New(2456, 0); -- Vampire Hunter
    O(a[2456], "From", "Version", "030002", "Until", "Version", "030002");
    a[2476] = b:New(2476, 10, fac.Horde, 1737); -- Destruction Derby
    a[2496] = b:New(2496, 0); -- The Fifth Element
    O(a[2496], "From", "Version", "030002", "Before", "Version", "030008");
    a[2497] = b:New(2497, 10, fac.Horde, 2419); -- Spring Fling
    a[2516] = b:New(2516, 10); -- Lil' Game Hunter
    a[2536] = b:New(2536, 10, fac.Alliance, 2537); -- Mountain o' Mounts
    a[2537] = b:New(2537, 10, fac.Horde, 2536); -- Mountain o' Mounts
    a[2556] = b:New(2556, 10); -- Pest Control
    a[2557] = b:New(2557, 10); -- To All The Squirrels Who Shared My Life
    a[2576] = b:New(2576, 10); -- Blushing Bride
    a[2676] = b:New(2676, 10); -- I Found One!
    a[2716] = b:New(2716, 0); -- Dual Talent Specialization
    O(a[2716], "From", "Version", "030100", "Before", "Version", "070003");
    a[2756] = b:New(2756, 10); -- Argent Aspiration
    a[2758] = b:New(2758, 10); -- Argent Valor
    a[2760] = b:New(2760, 10, fac.Alliance, 2769); -- Exalted Champion of Darnassus
    a[2761] = b:New(2761, 10, fac.Alliance, 2767); -- Exalted Champion of the Exodar
    a[2762] = b:New(2762, 10, fac.Alliance, 2768); -- Exalted Champion of Gnomeregan
    a[2763] = b:New(2763, 10, fac.Alliance, 2766); -- Exalted Champion of Ironforge
    a[2764] = b:New(2764, 10, fac.Alliance, 2765); -- Exalted Champion of Stormwind
    a[2765] = b:New(2765, 10, fac.Horde, 2764); -- Exalted Champion of Orgrimmar
    a[2766] = b:New(2766, 10, fac.Horde, 2763); -- Exalted Champion of Sen'jin
    a[2767] = b:New(2767, 10, fac.Horde, 2761); -- Exalted Champion of Silvermoon City
    a[2768] = b:New(2768, 10, fac.Horde, 2762); -- Exalted Champion of Thunder Bluff
    a[2769] = b:New(2769, 10, fac.Horde, 2760); -- Exalted Champion of the Undercity
    a[2770] = b:New(2770, 10, fac.Alliance, 2771); -- Exalted Champion of the Alliance
    a[2771] = b:New(2771, 10, fac.Horde, 2770); -- Exalted Champion of the Horde
    a[2772] = b:New(2772, 10); -- Tilted!
    a[2773] = b:New(2773, 10); -- It's Just a Flesh Wound
    a[2777] = b:New(2777, 10, fac.Alliance, 2787); -- Champion of Darnassus
    a[2778] = b:New(2778, 10, fac.Alliance, 2785); -- Champion of the Exodar
    a[2779] = b:New(2779, 10, fac.Alliance, 2786); -- Champion of Gnomeregan
    a[2780] = b:New(2780, 10, fac.Alliance, 2784); -- Champion of Ironforge
    a[2781] = b:New(2781, 10, fac.Alliance, 2783); -- Champion of Stormwind
    a[2782] = b:New(2782, 10, fac.Alliance, 2788); -- Champion of the Alliance
    a[2783] = b:New(2783, 10, fac.Horde, 2781); -- Champion of Orgrimmar
    a[2784] = b:New(2784, 10, fac.Horde, 2780); -- Champion of Sen'jin
    a[2785] = b:New(2785, 10, fac.Horde, 2778); -- Champion of Silvermoon City
    a[2786] = b:New(2786, 10, fac.Horde, 2779); -- Champion of Thunder Bluff
    a[2787] = b:New(2787, 10, fac.Horde, 2777); -- Champion of the Undercity
    a[2788] = b:New(2788, 10, fac.Horde, 2782); -- Champion of the Horde
    a[2796] = b:New(2796, 10); -- Brew of the Month
    a[2798] = b:New(2798, 10); -- Noble Gardener
    a[2816] = b:New(2816, 10, fac.Horde, 2817); -- Exalted Argent Champion of the Horde
    a[2817] = b:New(2817, 10, fac.Alliance, 2816); -- Exalted Argent Champion of the Alliance
    a[2836] = b:New(2836, 10); -- Lance a Lot
    a[2886] = b:New(2886, 0); -- The Siege of Ulduar (10 player)
    O(a[2886], "From", "Version", "030100", "Before", "Version", "070305");
    a[2887] = b:New(2887, 0); -- The Siege of Ulduar (25 player)
    O(a[2887], "From", "Version", "030100", "Before", "Version", "070305");
    a[2888] = b:New(2888, 0); -- The Antechamber of Ulduar (10 player)
    O(a[2888], "From", "Version", "030100", "Before", "Version", "070305");
    a[2889] = b:New(2889, 0); -- The Antechamber of Ulduar (25 player)
    O(a[2889], "From", "Version", "030100", "Before", "Version", "070305");
    a[2890] = b:New(2890, 0); -- The Keepers of Ulduar (10 player)
    O(a[2890], "From", "Version", "030100", "Before", "Version", "070305");
    a[2891] = b:New(2891, 0); -- The Keepers of Ulduar (25 player)
    O(a[2891], "From", "Version", "030100", "Before", "Version", "070305");
    a[2892] = b:New(2892, 0); -- The Descent into Madness (10 player)
    O(a[2892], "From", "Version", "030100", "Before", "Version", "070305");
    a[2893] = b:New(2893, 0); -- The Descent into Madness (25 player)
    O(a[2893], "From", "Version", "030100", "Before", "Version", "070305");
    a[2894] = b:New(2894, 0); -- The Secrets of Ulduar (10 player)
    O(a[2894], "From", "Version", "030100", "Before", "Version", "070305");
    a[2895] = b:New(2895, 0); -- The Secrets of Ulduar (25 player)
    O(a[2895], "From", "Version", "030100", "Before", "Version", "070305");
    a[2903] = b:New(2903, 0); -- Champion of Ulduar
    O(a[2903], "From", "Version", "030100", "Before", "Version", "070305");
    a[2904] = b:New(2904, 0); -- Conqueror of Ulduar
    O(a[2904], "From", "Version", "030100", "Before", "Version", "070305");
    a[2905] = b:New(2905, 0); -- Unbroken (10 player)
    O(a[2905], "From", "Version", "030100", "Before", "Version", "070305");
    a[2906] = b:New(2906, 0); -- Unbroken (25 player)
    O(a[2906], "From", "Version", "030100", "Before", "Version", "070305");
    a[2907] = b:New(2907, 0); -- Three Car Garage (10 player)
    O(a[2907], "From", "Version", "030100", "Before", "Version", "070305");
    a[2908] = b:New(2908, 0); -- Three Car Garage (25 player)
    O(a[2908], "From", "Version", "030100", "Before", "Version", "070305");
    a[2909] = b:New(2909, 0); -- Take Out Those Turrets (10 player)
    O(a[2909], "From", "Version", "030100", "Before", "Version", "070305");
    a[2910] = b:New(2910, 0); -- Take Out Those Turrets (25 player)
    O(a[2910], "From", "Version", "030100", "Before", "Version", "070305");
    a[2911] = b:New(2911, 0); -- Shutout (10 player)
    O(a[2911], "From", "Version", "030100", "Before", "Version", "070305");
    a[2912] = b:New(2912, 0); -- Shutout (25 player)
    O(a[2912], "From", "Version", "030100", "Before", "Version", "070305");
    a[2913] = b:New(2913, 0); -- Orbital Bombardment (10 player)
    O(a[2913], "From", "Version", "030100", "Before", "Version", "070305");
    a[2914] = b:New(2914, 0); -- Orbital Devastation (10 player)
    O(a[2914], "From", "Version", "030100", "Before", "Version", "070305");
    a[2915] = b:New(2915, 0); -- Nuked from Orbit (10 player)
    O(a[2915], "From", "Version", "030100", "Before", "Version", "070305");
    a[2916] = b:New(2916, 0); -- Orbital Devastation (25 player)
    O(a[2916], "From", "Version", "030100", "Before", "Version", "070305");
    a[2917] = b:New(2917, 0); -- Nuked from Orbit (25 player)
    O(a[2917], "From", "Version", "030100", "Before", "Version", "070305");
    a[2918] = b:New(2918, 0); -- Orbital Bombardment (25 player)
    O(a[2918], "From", "Version", "030100", "Before", "Version", "070305");
    a[2919] = b:New(2919, 0); -- A Quick Shave (10 player)
    O(a[2919], "From", "Version", "030100", "Before", "Version", "070305");
    a[2921] = b:New(2921, 0); -- A Quick Shave (25 player)
    O(a[2921], "From", "Version", "030100", "Before", "Version", "070305");
    a[2923] = b:New(2923, 0); -- "Iron Dwarf, Medium Rare (10 player)"
    O(a[2923], "From", "Version", "030100", "Before", "Version", "070305");
    a[2924] = b:New(2924, 0); -- "Iron Dwarf, Medium Rare (25 player)"
    O(a[2924], "From", "Version", "030100", "Before", "Version", "070305");
    a[2925] = b:New(2925, 0); -- Shattered (10 player)
    O(a[2925], "From", "Version", "030100", "Before", "Version", "070305");
    a[2926] = b:New(2926, 0); -- Shattered (25 player)
    O(a[2926], "From", "Version", "030100", "Before", "Version", "070305");
    a[2927] = b:New(2927, 0); -- Hot Pocket (10 player)
    O(a[2927], "From", "Version", "030100", "Before", "Version", "070305");
    a[2928] = b:New(2928, 0); -- Hot Pocket (25 player)
    O(a[2928], "From", "Version", "030100", "Before", "Version", "070305");
    a[2929] = b:New(2929, 0); -- Stokin' the Furnace (25 player)
    O(a[2929], "From", "Version", "030100", "Before", "Version", "070305");
    a[2930] = b:New(2930, 0); -- Stokin' the Furnace (10 player)
    O(a[2930], "From", "Version", "030100", "Before", "Version", "070305");
    a[2931] = b:New(2931, 0); -- Nerf Engineering (10 player)
    O(a[2931], "From", "Version", "030100", "Before", "Version", "070305");
    a[2932] = b:New(2932, 0); -- Nerf Engineering (25 player)
    O(a[2932], "From", "Version", "030100", "Before", "Version", "070305");
    a[2933] = b:New(2933, 0); -- Nerf Scrapbots (10 player)
    O(a[2933], "From", "Version", "030100", "Before", "Version", "070305");
    a[2934] = b:New(2934, 0); -- Nerf Gravity Bombs (10 player)
    O(a[2934], "From", "Version", "030100", "Before", "Version", "070305");
    a[2935] = b:New(2935, 0); -- Nerf Scrapbots (25 player)
    O(a[2935], "From", "Version", "030100", "Before", "Version", "070305");
    a[2936] = b:New(2936, 0); -- Nerf Gravity Bombs (25 player)
    O(a[2936], "From", "Version", "030100", "Before", "Version", "070305");
    a[2937] = b:New(2937, 0); -- Must Deconstruct Faster (10 player)
    O(a[2937], "From", "Version", "030100", "Before", "Version", "070305");
    a[2938] = b:New(2938, 0); -- Must Deconstruct Faster (25 player)
    O(a[2938], "From", "Version", "030100", "Before", "Version", "070305");
    a[2939] = b:New(2939, 0); -- "I Choose You, Runemaster Molgeim (10 player)"
    O(a[2939], "From", "Version", "030100", "Before", "Version", "070305");
    a[2940] = b:New(2940, 0); -- "I Choose You, Stormcaller Brundir (10 player)"
    O(a[2940], "From", "Version", "030100", "Before", "Version", "070305");
    a[2941] = b:New(2941, 0); -- "I Choose You, Steelbreaker (10 player)"
    O(a[2941], "From", "Version", "030100", "Before", "Version", "070305");
    a[2942] = b:New(2942, 0); -- "I Choose You, Runemaster Molgeim (25 player)"
    O(a[2942], "From", "Version", "030100", "Before", "Version", "070305");
    a[2943] = b:New(2943, 0); -- "I Choose You, Stormcaller Brundir (25 player)"
    O(a[2943], "From", "Version", "030100", "Before", "Version", "070305");
    a[2944] = b:New(2944, 0); -- "I Choose You, Steelbreaker (25 player)"
    O(a[2944], "From", "Version", "030100", "Before", "Version", "070305");
    a[2945] = b:New(2945, 0); -- But I'm On Your Side (10 player)
    O(a[2945], "From", "Version", "030100", "Before", "Version", "070305");
    a[2946] = b:New(2946, 0); -- But I'm On Your Side (25 player)
    O(a[2946], "From", "Version", "030100", "Before", "Version", "070305");
    a[2947] = b:New(2947, 0); -- Can't Do That While Stunned (10 player)
    O(a[2947], "From", "Version", "030100", "Before", "Version", "070305");
    a[2948] = b:New(2948, 0); -- Can't Do That While Stunned (25 player)
    O(a[2948], "From", "Version", "030100", "Before", "Version", "070305");
    a[2951] = b:New(2951, 0); -- With Open Arms (10 player)
    O(a[2951], "From", "Version", "030100", "Before", "Version", "070305");
    a[2952] = b:New(2952, 0); -- With Open Arms (25 player)
    O(a[2952], "From", "Version", "030100", "Before", "Version", "070305");
    a[2953] = b:New(2953, 0); -- Disarmed (10 player)
    O(a[2953], "From", "Version", "030100", "Before", "Version", "070305");
    a[2954] = b:New(2954, 0); -- Disarmed (25 player)
    O(a[2954], "From", "Version", "030100", "Before", "Version", "070305");
    a[2955] = b:New(2955, 0); -- If Looks Could Kill (10 player)
    O(a[2955], "From", "Version", "030100", "Before", "Version", "070305");
    a[2956] = b:New(2956, 0); -- If Looks Could Kill (25 player)
    O(a[2956], "From", "Version", "030100", "Before", "Version", "070305");
    a[2957] = b:New(2957, 0); -- Glory of the Ulduar Raider (10 player)
    O(a[2957], "From", "Version", "030100", "Before", "Version", "070305");
    a[2958] = b:New(2958, 0); -- Glory of the Ulduar Raider (25 player)
    O(a[2958], "From", "Version", "030100", "Before", "Version", "070305");
    a[2959] = b:New(2959, 0); -- Rubble and Roll (10 player)
    O(a[2959], "From", "Version", "030100", "Before", "Version", "070305");
    a[2960] = b:New(2960, 0); -- Rubble and Roll (25 player)
    O(a[2960], "From", "Version", "030100", "Before", "Version", "070305");
    a[2961] = b:New(2961, 0); -- Cheese the Freeze (10 player)
    O(a[2961], "From", "Version", "030100", "Before", "Version", "070305");
    a[2962] = b:New(2962, 0); -- Cheese the Freeze (25 player)
    O(a[2962], "From", "Version", "030100", "Before", "Version", "070305");
    a[2963] = b:New(2963, 0); -- I Have the Coolest Friends (10 player)
    O(a[2963], "From", "Version", "030100", "Before", "Version", "070305");
    a[2965] = b:New(2965, 0); -- I Have the Coolest Friends (25 player)
    O(a[2965], "From", "Version", "030100", "Before", "Version", "070305");
    a[2967] = b:New(2967, 0); -- Getting Cold in Here (10 player)
    O(a[2967], "From", "Version", "030100", "Before", "Version", "070305");
    a[2968] = b:New(2968, 0); -- Getting Cold in Here (25 player)
    O(a[2968], "From", "Version", "030100", "Before", "Version", "070305");
    a[2969] = b:New(2969, 0); -- Staying Buffed All Winter (10 player)
    O(a[2969], "From", "Version", "030100", "Before", "Version", "070305");
    a[2970] = b:New(2970, 0); -- Staying Buffed All Winter (25 player)
    O(a[2970], "From", "Version", "030100", "Before", "Version", "070305");
    a[2971] = b:New(2971, 0); -- Don't Stand in the Lightning (10 player)
    O(a[2971], "From", "Version", "030100", "Before", "Version", "070305");
    a[2972] = b:New(2972, 0); -- Don't Stand in the Lightning (25 player)
    O(a[2972], "From", "Version", "030100", "Before", "Version", "070305");
    a[2973] = b:New(2973, 0); -- I'll Take You All On (10 player)
    O(a[2973], "From", "Version", "030100", "Before", "Version", "070305");
    a[2974] = b:New(2974, 0); -- I'll Take You All On (25 player)
    O(a[2974], "From", "Version", "030100", "Before", "Version", "070305");
    a[2975] = b:New(2975, 0); -- Who Needs Bloodlust? (10 player)
    O(a[2975], "From", "Version", "030100", "Before", "Version", "070305");
    a[2976] = b:New(2976, 0); -- Who Needs Bloodlust? (25 player)
    O(a[2976], "From", "Version", "030100", "Before", "Version", "070305");
    a[2977] = b:New(2977, 0); -- Siffed (10 player)
    O(a[2977], "From", "Version", "030100", "Before", "Version", "070305");
    a[2978] = b:New(2978, 0); -- Siffed (25 player)
    O(a[2978], "From", "Version", "030100", "Before", "Version", "070305");
    a[2979] = b:New(2979, 0); -- Lumberjacked (10 player)
    O(a[2979], "From", "Version", "030100", "Before", "Version", "070305");
    a[2980] = b:New(2980, 0); -- Con-speed-atory (10 player)
    O(a[2980], "From", "Version", "030100", "Before", "Version", "070305");
    a[2981] = b:New(2981, 0); -- Con-speed-atory (25 player)
    O(a[2981], "From", "Version", "030100", "Before", "Version", "070305");
    a[2982] = b:New(2982, 0); -- Getting Back to Nature (10 player)
    O(a[2982], "From", "Version", "030100", "Before", "Version", "070305");
    a[2983] = b:New(2983, 0); -- Getting Back to Nature (25 player)
    O(a[2983], "From", "Version", "030100", "Before", "Version", "070305");
    a[2984] = b:New(2984, 0); -- Deforestation (25 player)
    O(a[2984], "From", "Version", "030100", "Before", "Version", "070305");
    a[2985] = b:New(2985, 0); -- Deforestation (10 player)
    O(a[2985], "From", "Version", "030100", "Before", "Version", "070305");
    a[2989] = b:New(2989, 0); -- Set Up Us the Bomb (10 player)
    O(a[2989], "From", "Version", "030100", "Before", "Version", "070305");
    a[2995] = b:New(2995, 0); -- Not-So-Friendly Fire (25 player)
    O(a[2995], "From", "Version", "030100", "Before", "Version", "070305");
    a[2996] = b:New(2996, 0); -- Shadowdodger (10 player)
    O(a[2996], "From", "Version", "030100", "Before", "Version", "070305");
    a[2997] = b:New(2997, 0); -- Shadowdodger (25 player)
    O(a[2997], "From", "Version", "030100", "Before", "Version", "070305");
    a[3002] = b:New(3002, 0); -- Supermassive (25 player)
    O(a[3002], "From", "Version", "030100", "Before", "Version", "070305");
    a[3003] = b:New(3003, 0); -- Supermassive (10 player)
    O(a[3003], "From", "Version", "030100", "Before", "Version", "070305");
    a[3004] = b:New(3004, 0); -- He Feeds On Your Tears (10 player)
    O(a[3004], "From", "Version", "030100", "Before", "Version", "040003a");
    a[3005] = b:New(3005, 0); -- He Feeds On Your Tears (25 player)
    O(a[3005], "From", "Version", "030100", "Before", "Version", "040003a");
    a[3006] = b:New(3006, 0); -- Crazy Cat Lady (10 player)
    O(a[3006], "From", "Version", "030100", "Before", "Version", "070305");
    a[3007] = b:New(3007, 0); -- Crazy Cat Lady (25 player)
    O(a[3007], "From", "Version", "030100", "Before", "Version", "070305");
    a[3008] = b:New(3008, 0); -- Drive Me Crazy (10 player)
    O(a[3008], "From", "Version", "030100", "Before", "Version", "070305");
    a[3009] = b:New(3009, 0); -- Kiss and Make Up (10 player)
    O(a[3009], "From", "Version", "030100", "Before", "Version", "070305");
    a[3010] = b:New(3010, 0); -- Drive Me Crazy (25 player)
    O(a[3010], "From", "Version", "030100", "Before", "Version", "070305");
    a[3011] = b:New(3011, 0); -- Kiss and Make Up (25 player)
    O(a[3011], "From", "Version", "030100", "Before", "Version", "070305");
    a[3012] = b:New(3012, 0); -- He's Not Getting Any Older (10 player)
    O(a[3012], "From", "Version", "030100", "Before", "Version", "070305");
    a[3013] = b:New(3013, 0); -- He's Not Getting Any Older (25 player)
    O(a[3013], "From", "Version", "030100", "Before", "Version", "070305");
    a[3014] = b:New(3014, 0); -- They're Coming Out of the Walls (10 player)
    O(a[3014], "From", "Version", "030100", "Before", "Version", "070305");
    a[3015] = b:New(3015, 0); -- In His House He Waits Dreaming (10 player)
    O(a[3015], "From", "Version", "030100", "Before", "Version", "070305");
    a[3016] = b:New(3016, 0); -- In His House He Waits Dreaming (25 player)
    O(a[3016], "From", "Version", "030100", "Before", "Version", "070305");
    a[3017] = b:New(3017, 0); -- They're Coming Out of the Walls (25 player)
    O(a[3017], "From", "Version", "030100", "Before", "Version", "070305");
    a[3036] = b:New(3036, 0); -- Observed (10 player)
    O(a[3036], "From", "Version", "030100", "Before", "Version", "070305");
    a[3037] = b:New(3037, 0); -- Observed (25 player)
    O(a[3037], "From", "Version", "030100", "Before", "Version", "070305");
    a[3056] = b:New(3056, 0); -- Orbit-uary (10 player)
    O(a[3056], "From", "Version", "030100", "Before", "Version", "070305");
    a[3057] = b:New(3057, 0); -- Orbit-uary (25 player)
    O(a[3057], "From", "Version", "030100", "Before", "Version", "070305");
    a[3058] = b:New(3058, 0); -- Heartbreaker (10 player)
    O(a[3058], "From", "Version", "030100", "Before", "Version", "070305");
    a[3059] = b:New(3059, 0); -- Heartbreaker (25 player)
    O(a[3059], "From", "Version", "030100", "Before", "Version", "070305");
    a[3076] = b:New(3076, 0); -- Nine Lives (10 player)
    O(a[3076], "From", "Version", "030100", "Before", "Version", "070305");
    a[3077] = b:New(3077, 0); -- Nine Lives (25 player)
    O(a[3077], "From", "Version", "030100", "Before", "Version", "070305");
    a[3096] = b:New(3096, 0); -- Deadly Gladiator's Frost Wyrm
    O(a[3096], "From", "PvP Season", 5, "Until", "PvP Season", 5);
    a[3097] = b:New(3097, 0); -- Dwarfageddon (10 player)
    O(a[3097], "From", "Version", "030100", "Before", "Version", "070305");
    a[3098] = b:New(3098, 0); -- Dwarfageddon (25 player)
    O(a[3098], "From", "Version", "030100", "Before", "Version", "070305");
    a[3117] = b:New(3117, 0, nil, nil, true); -- Realm First! Death's Demise
    O(a[3117], "Once");
    a[3118] = b:New(3118, 0); -- Lumberjacked (25 player)
    O(a[3118], "From", "Version", "030100", "Before", "Version", "070305");
    a[3136] = b:New(3136, 10); -- Emalon the Storm Watcher (10 player)
    a[3137] = b:New(3137, 10); -- Emalon the Storm Watcher (25 player)
    a[3138] = b:New(3138, 0); -- Not-So-Friendly Fire (10 player)
    O(a[3138], "From", "Version", "030100", "Before", "Version", "070305");
    a[3141] = b:New(3141, 0); -- Two Lights in the Darkness (10 player)
    O(a[3141], "From", "Version", "030100", "Before", "Version", "070305");
    a[3142] = b:New(3142, 0); -- "Val'anyr, Hammer of Ancient Kings"
    a[3157] = b:New(3157, 0); -- Three Lights in the Darkness (10 player)
    O(a[3157], "From", "Version", "030100", "Before", "Version", "070305");
    a[3158] = b:New(3158, 0); -- One Light in the Darkness (10 player)
    O(a[3158], "From", "Version", "030100", "Before", "Version", "070305");
    a[3159] = b:New(3159, 0); -- Alone in the Darkness (10 player)
    O(a[3159], "From", "Version", "030100", "Before", "Version", "070305");
    a[3161] = b:New(3161, 0); -- Three Lights in the Darkness (25 player)
    O(a[3161], "From", "Version", "030100", "Before", "Version", "070305");
    a[3162] = b:New(3162, 0); -- Two Lights in the Darkness (25 player)
    O(a[3162], "From", "Version", "030100", "Before", "Version", "070305");
    a[3163] = b:New(3163, 0); -- One Light in the Darkness (25 player)
    O(a[3163], "From", "Version", "030100", "Before", "Version", "070305");
    a[3164] = b:New(3164, 0); -- Alone in the Darkness (25 player)
    O(a[3164], "From", "Version", "030100", "Before", "Version", "070305");
    a[3176] = b:New(3176, 0); -- Lose Your Illusion (10 player)
    O(a[3176], "From", "Version", "030100", "Before", "Version", "070305");
    a[3177] = b:New(3177, 0); -- Knock on Wood (10 player)
    O(a[3177], "From", "Version", "030100", "Before", "Version", "070305");
    a[3178] = b:New(3178, 0); -- "Knock, Knock on Wood (10 player)"
    O(a[3178], "From", "Version", "030100", "Before", "Version", "070305");
    a[3179] = b:New(3179, 0); -- "Knock, Knock, Knock on Wood (10 player)"
    O(a[3179], "From", "Version", "030100", "Before", "Version", "070305");
    a[3180] = b:New(3180, 0); -- Firefighter (10 player)
    O(a[3180], "From", "Version", "030100", "Before", "Version", "070305");
    a[3181] = b:New(3181, 0); -- I Love the Smell of Saronite in the Morning (10 player)
    O(a[3181], "From", "Version", "030100", "Before", "Version", "070305");
    a[3182] = b:New(3182, 0); -- I Could Say That This Cache Was Rare (10 player)
    O(a[3182], "From", "Version", "030100", "Before", "Version", "070305");
    a[3183] = b:New(3183, 0); -- Lose Your Illusion (25 player)
    O(a[3183], "From", "Version", "030100", "Before", "Version", "070305");
    a[3184] = b:New(3184, 0); -- I Could Say That This Cache Was Rare (25 player)
    O(a[3184], "From", "Version", "030100", "Before", "Version", "070305");
    a[3185] = b:New(3185, 0); -- Knock on Wood (25 player)
    O(a[3185], "From", "Version", "030100", "Before", "Version", "070305");
    a[3186] = b:New(3186, 0); -- "Knock, Knock on Wood (25 player)"
    O(a[3186], "From", "Version", "030100", "Before", "Version", "070305");
    a[3187] = b:New(3187, 0); -- "Knock, Knock, Knock on Wood (25 player)"
    O(a[3187], "From", "Version", "030100", "Before", "Version", "070305");
    a[3188] = b:New(3188, 0); -- I Love the Smell of Saronite in the Morning (25 player)
    O(a[3188], "From", "Version", "030100", "Before", "Version", "070305");
    a[3189] = b:New(3189, 0); -- Firefighter (25 player)
    O(a[3189], "From", "Version", "030100", "Before", "Version", "070305");
    a[3217] = b:New(3217, 10); -- Chasing Marcia
    a[3218] = b:New(3218, 10); -- Turtles All the Way Down
    a[3237] = b:New(3237, 0); -- Set Up Us the Bomb (25 player)
    O(a[3237], "From", "Version", "030100", "Before", "Version", "070305");
    a[3259] = b:New(3259, 0, nil, nil, true); -- Realm First! Celestial Defender
    O(a[3259], "Once");
    a[3296] = b:New(3296, 10); -- Cooking with Style
    a[3316] = b:New(3316, 0); -- Herald of the Titans
    a[3336] = b:New(3336, 0); -- Deadly Gladiator
    O(a[3336], "From", "PvP Season", 5, "Until", "PvP Season", 5);
    a[3356] = b:New(3356, 0, fac.Alliance, 3357); -- Winterspring Frostsaber
    a[3357] = b:New(3357, 0, fac.Horde, 3356); -- Venomhide Ravasaur
    a[3436] = b:New(3436, 0); -- Furious Gladiator
    O(a[3436], "From", "PvP Season", 6, "Until", "PvP Season", 6);
    a[3456] = b:New(3456, 10); -- Dead Man's Party
    a[3457] = b:New(3457, 10); -- The Captain's Booty
    a[3478] = b:New(3478, 10); -- Pilgrim
    a[3496] = b:New(3496, 0); -- A Brew-FAST Mount
    a[3536] = b:New(3536, 0); -- The Marine Marine
    a[3556] = b:New(3556, 10, fac.Alliance, 3557); -- Pilgrim's Paunch
    a[3557] = b:New(3557, 10, fac.Horde, 3556); -- Pilgrim's Paunch
    a[3558] = b:New(3558, 10); -- Sharing is Caring
    a[3559] = b:New(3559, 10); -- Turkey Lurkey
    a[3576] = b:New(3576, 10, fac.Alliance, 3577); -- Now We're Cookin'
    a[3577] = b:New(3577, 10, fac.Horde, 3576); -- Now We're Cookin'
    a[3578] = b:New(3578, 10); -- The Turkinator
    a[3579] = b:New(3579, 10); -- """FOOD FIGHT!"""
    a[3580] = b:New(3580, 10, fac.Alliance, 3581); -- Pilgrim's Peril
    a[3581] = b:New(3581, 10, fac.Horde, 3580); -- Pilgrim's Peril
    a[3582] = b:New(3582, 10); -- Terokkar Turkey Time
    a[3596] = b:New(3596, 10, fac.Alliance, 3597); -- Pilgrim's Progress
    a[3597] = b:New(3597, 10, fac.Horde, 3596); -- Pilgrim's Progress
    a[3618] = b:New(3618, 0); -- Murkimus the Gladiator
    O(a[3618], "Never");
    a[3636] = b:New(3636, 0); -- Jade Tiger
    a[3676] = b:New(3676, 10, fac.Alliance, 3677); -- A Silver Confidant
    a[3677] = b:New(3677, 10, fac.Horde, 3676); -- The Sunreavers
    a[3736] = b:New(3736, 10); -- Pony Up!
    a[3756] = b:New(3756, 0); -- Furious Gladiator's Frost Wyrm
    O(a[3756], "From", "PvP Season", 6, "Until", "PvP Season", 6);
    a[3757] = b:New(3757, 0); -- Relentless Gladiator's Frost Wyrm
    O(a[3757], "From", "PvP Season", 7, "Until", "PvP Season", 7);
    a[3758] = b:New(3758, 0); -- Relentless Gladiator
    O(a[3758], "From", "PvP Season", 7, "Until", "PvP Season", 7);
    a[3776] = b:New(3776, 10); -- Isle of Conquest Victory
    a[3777] = b:New(3777, 10); -- Isle of Conquest Veteran
    a[3778] = b:New(3778, 10, fac.Horde, 4296); -- Trial of the Champion
    a[3797] = b:New(3797, 10); -- Upper Back Pain (10 player)
    a[3798] = b:New(3798, 10); -- Resilience Will Fix It (10 player)
    a[3799] = b:New(3799, 10); -- Salt and Pepper (10 player)
    a[3800] = b:New(3800, 10); -- The Traitor King (10 player)
    a[3802] = b:New(3802, 10); -- Argent Confessor
    a[3803] = b:New(3803, 10); -- The Faceroller
    a[3804] = b:New(3804, 10); -- I've Had Worse
    a[3808] = b:New(3808, 0); -- A Tribute to Skill (10 player)
    O(a[3808], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3809] = b:New(3809, 0); -- A Tribute to Mad Skill (10 player)
    O(a[3809], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3810] = b:New(3810, 0); -- A Tribute to Insanity (10 player)
    O(a[3810], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3812] = b:New(3812, 10); -- Call of the Grand Crusade (25 player)
    a[3813] = b:New(3813, 10); -- Upper Back Pain (25 player)
    a[3815] = b:New(3815, 10); -- Salt and Pepper (25 player)
    a[3816] = b:New(3816, 10); -- The Traitor King (25 player)
    a[3817] = b:New(3817, 0); -- A Tribute to Skill (25 player)
    O(a[3817], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3818] = b:New(3818, 0); -- A Tribute to Mad Skill (25 player)
    O(a[3818], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3819] = b:New(3819, 0); -- A Tribute to Insanity (25 player)
    O(a[3819], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3836] = b:New(3836, 10); -- Koralon the Flame Watcher (10 player)
    a[3837] = b:New(3837, 10); -- Koralon the Flame Watcher (25 player)
    a[3844] = b:New(3844, 0); -- 1000 Dungeon & Raid Emblems
    O(a[3844], "From", "Version", "030200", "Before", "Version", "040003a");
    a[3845] = b:New(3845, 20); -- Isle of Conquest All-Star
    a[3846] = b:New(3846, 10, fac.Alliance, 4176); -- Resource Glut
    a[3847] = b:New(3847, 10); -- Four Car Garage
    a[3848] = b:New(3848, 10); -- A-bomb-inable
    a[3849] = b:New(3849, 10); -- A-bomb-ination
    a[3850] = b:New(3850, 10); -- Mowed Down
    a[3851] = b:New(3851, 10, fac.Alliance, 4177); -- Mine
    a[3852] = b:New(3852, 10); -- Cut the Blue Wire... No the Red Wire!
    a[3853] = b:New(3853, 10); -- All Over the Isle
    a[3854] = b:New(3854, 10); -- Back Door Job
    a[3855] = b:New(3855, 10); -- Glaive Grave
    a[3856] = b:New(3856, 10, fac.Alliance, 4256); -- Demolition Derby
    a[3857] = b:New(3857, 25, fac.Alliance, 3957); -- Master of Isle of Conquest
    a[3896] = b:New(3896, 0); -- Onyx Panther
    a[3916] = b:New(3916, 10); -- Call of the Crusade (25 player)
    a[3917] = b:New(3917, 10); -- Call of the Crusade (10 player)
    a[3918] = b:New(3918, 10); -- Call of the Grand Crusade (10 player)
    a[3936] = b:New(3936, 10); -- "Not One, But Two Jormungars (10 player)"
    a[3937] = b:New(3937, 10); -- "Not One, But Two Jormungars (25 player)"
    a[3957] = b:New(3957, 25, fac.Horde, 3857); -- Master of Isle of Conquest
    a[3996] = b:New(3996, 10); -- Three Sixty Pain Spike (10 player)
    a[3997] = b:New(3997, 10); -- Three Sixty Pain Spike (25 player)
    a[4016] = b:New(4016, 10); -- "Earth, Wind & Fire (10 player)"
    a[4017] = b:New(4017, 10); -- "Earth, Wind & Fire (25 player)"
    a[4078] = b:New(4078, 0, nil, nil, true); -- Realm First! Grand Crusader
    O(a[4078], "Once");
    a[4079] = b:New(4079, 0, fac.Horde, 4156); -- A Tribute to Immortality
    O(a[4079], "From", "Version", "030200", "Before", "Version", "040003a");
    a[4080] = b:New(4080, 0); -- A Tribute to Dedicated Insanity
    O(a[4080], "From", "Version", "030200", "Before", "Version", "040003a");
    a[4156] = b:New(4156, 0, fac.Alliance, 4079); -- A Tribute to Immortality
    O(a[4156], "From", "Version", "030200", "Before", "Version", "040003a");
    a[4176] = b:New(4176, 10, fac.Horde, 3846); -- Resource Glut
    a[4177] = b:New(4177, 10, fac.Horde, 3851); -- Mine
    a[4256] = b:New(4256, 10, fac.Horde, 3856); -- Demolition Derby
    a[4296] = b:New(4296, 10, fac.Alliance, 3778); -- Trial of the Champion
    a[4297] = b:New(4297, 10, fac.Horde, 4298); -- Heroic: Trial of the Champion
    a[4298] = b:New(4298, 10, fac.Alliance, 4297); -- Heroic: Trial of the Champion
    a[4316] = b:New(4316, 0); -- 2500 Dungeon & Raid Emblems
    O(a[4316], "From", "Version", "030200", "Before", "Version", "040003a");
    a[4396] = b:New(4396, 10); -- Onyxia's Lair (10 player)
    a[4397] = b:New(4397, 10); -- Onyxia's Lair (25 player)
    a[4400] = b:New(4400, 0); -- WoW's 5th Anniversary
    O(a[4400]);
    a[4402] = b:New(4402, 10); -- More Dots! (10 player)
    a[4403] = b:New(4403, 10); -- Many Whelps! Handle It! (10 player)
    a[4404] = b:New(4404, 10); -- She Deep Breaths More (10 player)
    a[4405] = b:New(4405, 10); -- More Dots! (25 player)
    a[4406] = b:New(4406, 10); -- Many Whelps! Handle It! (25 player)
    a[4407] = b:New(4407, 10); -- She Deep Breaths More (25 player)
    a[4436] = b:New(4436, 10, fac.Alliance, 4437); -- BB King
    a[4437] = b:New(4437, 10, fac.Horde, 4436); -- BB King
    a[4476] = b:New(4476, 10); -- Looking For More
    a[4477] = b:New(4477, 10); -- Looking For Many
    a[4478] = b:New(4478, 10); -- Looking For Multitudes
    a[4496] = b:New(4496, 0); -- It's Over Nine Thousand!
    a[4516] = b:New(4516, 10); -- The Forge of Souls
    a[4517] = b:New(4517, 10); -- The Pit of Saron
    a[4518] = b:New(4518, 10); -- The Halls of Reflection
    a[4519] = b:New(4519, 10); -- Heroic: The Forge of Souls
    a[4520] = b:New(4520, 10); -- Heroic: The Pit of Saron
    a[4521] = b:New(4521, 10); -- Heroic: The Halls of Reflection
    a[4522] = b:New(4522, 10); -- Soul Power
    a[4523] = b:New(4523, 10); -- Three Faced
    a[4524] = b:New(4524, 10); -- Doesn't Go to Eleven
    a[4525] = b:New(4525, 10); -- Don't Look Up
    a[4526] = b:New(4526, 10); -- We're Not Retreating; We're Advancing in a Different Direction.
    a[4527] = b:New(4527, 10); -- The Frostwing Halls (10 player)
    a[4528] = b:New(4528, 10); -- The Plagueworks (10 player)
    a[4529] = b:New(4529, 10); -- The Crimson Hall (10 player)
    a[4530] = b:New(4530, 10); -- The Frozen Throne (10 player)
    a[4531] = b:New(4531, 10); -- Storming the Citadel (10 player)
    a[4532] = b:New(4532, 25); -- Fall of the Lich King (10 player)
    a[4534] = b:New(4534, 10); -- Boned (10 player)
    a[4535] = b:New(4535, 10); -- Full House (10 player)
    a[4536] = b:New(4536, 10); -- I'm on a Boat (10 player)
    a[4537] = b:New(4537, 10); -- I've Gone and Made a Mess (10 player)
    a[4538] = b:New(4538, 10); -- Dances with Oozes (10 player)
    a[4539] = b:New(4539, 10); -- "Once Bitten, Twice Shy (10 player)"
    a[4576] = b:New(4576, 0, nil, nil, true); -- Realm First! Fall of the Lich King
    O(a[4576], "Once");
    a[4577] = b:New(4577, 10); -- Flu Shot Shortage (10 player)
    a[4578] = b:New(4578, 10); -- "Nausea, Heartburn, Indigestion... (10 player)"
    a[4579] = b:New(4579, 10); -- Portal Jockey (10 player)
    a[4580] = b:New(4580, 10); -- All You Can Eat (10 player)
    a[4581] = b:New(4581, 10); -- Neck-Deep in Vile (10 player)
    a[4582] = b:New(4582, 10); -- The Orb Whisperer (10 player)
    a[4583] = b:New(4583, 10); -- Bane of the Fallen King
    a[4584] = b:New(4584, 10); -- The Light of Dawn
    a[4585] = b:New(4585, 10); -- Toravon the Ice Watcher (10 player)
    a[4586] = b:New(4586, 10); -- Toravon the Ice Watcher (25 player)
    a[4596] = b:New(4596, 10); -- The Sword in the Skull
    a[4597] = b:New(4597, 10); -- The Frozen Throne (25 player)
    a[4598] = b:New(4598, 15); -- The Ashen Verdict
    a[4599] = b:New(4599, 0); -- Wrathful Gladiator
    O(a[4599], "From", "PvP Season", 8, "Until", "PvP Season", 8);
    a[4600] = b:New(4600, 0); -- Wrathful Gladiator's Frost Wyrm
    O(a[4600], "From", "PvP Season", 8, "Until", "PvP Season", 8);
    a[4601] = b:New(4601, 10); -- Been Waiting a Long Time for This (10 player)
    a[4602] = b:New(4602, 25); -- Glory of the Icecrown Raider (10 player)
    a[4603] = b:New(4603, 25); -- Glory of the Icecrown Raider (25 player)
    a[4604] = b:New(4604, 10); -- Storming the Citadel (25 player)
    a[4605] = b:New(4605, 10); -- The Plagueworks (25 player)
    a[4606] = b:New(4606, 10); -- The Crimson Hall (25 player)
    a[4607] = b:New(4607, 10); -- The Frostwing Halls (25 player)
    a[4608] = b:New(4608, 25); -- Fall of the Lich King (25 player)
    a[4610] = b:New(4610, 10); -- Boned (25 player)
    a[4611] = b:New(4611, 10); -- Full House (25 player)
    a[4612] = b:New(4612, 10); -- I'm on a Boat (25 player)
    a[4613] = b:New(4613, 10); -- I've Gone and Made a Mess (25 player)
    a[4614] = b:New(4614, 10); -- Dances with Oozes (25 player)
    a[4615] = b:New(4615, 10); -- Flu Shot Shortage (25 player)
    a[4616] = b:New(4616, 10); -- "Nausea, Heartburn, Indigestion... (25 player)"
    a[4617] = b:New(4617, 10); -- The Orb Whisperer (25 player)
    a[4618] = b:New(4618, 10); -- "Once Bitten, Twice Shy (25 player)"
    a[4619] = b:New(4619, 10); -- Portal Jockey (25 player)
    a[4620] = b:New(4620, 10); -- All You Can Eat (25 player)
    a[4621] = b:New(4621, 10); -- Been Waiting a Long Time for This (25 player)
    a[4622] = b:New(4622, 10); -- Neck-Deep in Vile (25 player)
    a[4623] = b:New(4623, 0); -- Shadowmourne
    a[4624] = b:New(4624, 10); -- Tough Love
    a[4625] = b:New(4625, 0); -- Invincible's Reins
    a[4626] = b:New(4626, 0); -- And I'll Form the Head!
    a[4627] = b:New(4627, 0); -- X-45 Heartbreaker
    a[4628] = b:New(4628, 10); -- Heroic: Storming the Citadel (10 player)
    a[4629] = b:New(4629, 10); -- Heroic: The Plagueworks (10 player)
    a[4630] = b:New(4630, 10); -- Heroic: The Crimson Hall (10 player)
    a[4631] = b:New(4631, 10); -- Heroic: The Frostwing Halls (10 player)
    a[4632] = b:New(4632, 10); -- Heroic: Storming the Citadel (25 player)
    a[4633] = b:New(4633, 10); -- Heroic: The Plagueworks (25 player)
    a[4634] = b:New(4634, 10); -- Heroic: The Crimson Hall (25 player)
    a[4635] = b:New(4635, 10); -- Heroic: The Frostwing Halls (25 player)
    a[4636] = b:New(4636, 25); -- Heroic: Fall of the Lich King (10 player)
    a[4637] = b:New(4637, 25); -- Heroic: Fall of the Lich King (25 player)
    a[4782] = b:New(4782, 0); -- Green Brewfest Stein
    O(a[4782]);
    a[4786] = b:New(4786, 0, fac.Alliance); -- Operation: Gnomeregan
    O(a[4786], "From", "Version", "030305a", "Before", "Version", "040001");
    a[4790] = b:New(4790, 0, fac.Horde); -- Zalazane's Fall
    O(a[4790], "From", "Version", "030305a", "Before", "Version", "040001");
    a[4815] = b:New(4815, 10); -- The Twilight Destroyer (25 player)
    a[4816] = b:New(4816, 10); -- Heroic: The Twilight Destroyer (25 player)
    a[4817] = b:New(4817, 10); -- The Twilight Destroyer (10 player)
    a[4818] = b:New(4818, 10); -- Heroic: The Twilight Destroyer (10 player)
    a[4824] = b:New(4824, 0); -- Collector's Edition: Mini Thor
    a[4825] = b:New(4825, 10); -- Explore Vashj'ir
    a[4826] = b:New(4826, 0); -- Level 85 (Legacy)
    O(a[4826], "From", "Version", "040003a", "Before", "Version", "090001");
    a[4827] = b:New(4827, 10); -- Surveying the Damage
    a[4832] = b:New(4832, 0); -- Friends In Even Higher Places
    O(a[4832]);
    a[4833] = b:New(4833, 10); -- Blackrock Caverns
    a[4839] = b:New(4839, 10); -- Throne of the Tides
    a[4840] = b:New(4840, 10); -- Grim Batol
    a[4841] = b:New(4841, 10); -- Halls of Origination
    a[4842] = b:New(4842, 10); -- Blackwing Descent
    a[4844] = b:New(4844, 20); -- Cataclysm Dungeon Hero
    a[4845] = b:New(4845, 25); -- Glory of the Cataclysm Hero
    a[4846] = b:New(4846, 10); -- The Stonecore
    a[4847] = b:New(4847, 10); -- The Vortex Pinnacle
    a[4848] = b:New(4848, 10); -- Lost City of the Tol'vir
    a[4849] = b:New(4849, 10); -- Keeping it in the Family
    a[4850] = b:New(4850, 10); -- The Bastion of Twilight
    a[4851] = b:New(4851, 10); -- Throne of the Four Winds
    a[4852] = b:New(4852, 10); -- Double Dragon
    a[4853] = b:New(4853, 25); -- Glory of the Cataclysm Raider
    a[4854] = b:New(4854, 10); -- I Had It in My Hand
    a[4855] = b:New(4855, 10); -- What was Briefly Yours is Now Mine
    a[4856] = b:New(4856, 10); -- It Belongs in a Museum!
    a[4857] = b:New(4857, 10); -- Journeyman Archaeologist
    a[4858] = b:New(4858, 10); -- Seven Scepters
    a[4859] = b:New(4859, 10); -- Kings Under the Mountain
    a[4863] = b:New(4863, 10); -- Explore Hyjal
    a[4864] = b:New(4864, 10); -- Explore Deepholm
    a[4865] = b:New(4865, 10); -- Explore Uldum
    a[4866] = b:New(4866, 10); -- Explore Twilight Highlands
    a[4868] = b:New(4868, 25); -- Cataclysm Explorer
    a[4869] = b:New(4869, 10, fac.Alliance, 4982); -- Sinking into Vashj'ir
    a[4870] = b:New(4870, 10); -- Coming Down the Mountain
    a[4871] = b:New(4871, 10); -- Deep into Deepholm
    a[4872] = b:New(4872, 10); -- Unearthing Uldum
    a[4873] = b:New(4873, 10, fac.Alliance, 5501); -- Fading into Twilight
    a[4874] = b:New(4874, 10); -- Breaking Out of Tol Barad
    a[4875] = b:New(4875, 10); -- Loremaster of Cataclysm
    a[4881] = b:New(4881, 10); -- The Earthen Ring
    a[4882] = b:New(4882, 10); -- The Guardians of Hyjal
    a[4883] = b:New(4883, 10); -- Therazane
    a[4884] = b:New(4884, 10); -- Ramkahen
    a[4885] = b:New(4885, 10, fac.Alliance, 4886); -- Wildhammer Clan
    a[4886] = b:New(4886, 10, fac.Horde, 4885); -- Dragonmaw Clan
    a[4887] = b:New(4887, 0); -- Tripping the Rifts
    O(a[4887]);
    a[4888] = b:New(4888, 10); -- One Hump or Two?
    a[4892] = b:New(4892, 10); -- Eastern Plaguelands Quests
    a[4893] = b:New(4893, 10); -- Western Plaguelands Quests
    a[4894] = b:New(4894, 20, fac.Horde, 12455); -- Silverpine Forest Quests
    a[4895] = b:New(4895, 10, fac.Horde, 4902); -- Hillsbrad Foothills Quests
    a[4896] = b:New(4896, 10); -- Arathi Highlands Quests
    a[4897] = b:New(4897, 10); -- Hinterlands Quests
    a[4899] = b:New(4899, 10, fac.Alliance); -- Loch Modan Quests
    a[4900] = b:New(4900, 10); -- Badlands Quests
    a[4901] = b:New(4901, 10); -- Burning Steppes Quests
    a[4902] = b:New(4902, 10, fac.Alliance, 4895); -- Redridge Mountains Quests
    a[4903] = b:New(4903, 10, fac.Alliance); -- Westfall Quests
    a[4904] = b:New(4904, 10); -- Swamp of Sorrows Quests
    a[4905] = b:New(4905, 10); -- Cape of Stranglethorn Quests
    a[4906] = b:New(4906, 10); -- Northern Stranglethorn Quests
    a[4908] = b:New(4908, 20, fac.Horde, 12456); -- Ghostlands Quests
    a[4909] = b:New(4909, 10); -- Blasted Lands Quests
    a[4910] = b:New(4910, 10); -- Searing Gorge Quests
    a[4914] = b:New(4914, 10); -- Working In the Heat
    a[4915] = b:New(4915, 0); -- More Skills to Pay the Bills
    O(a[4915], "From", "Version", "040003a", "Before", "Version", "080001");
    a[4916] = b:New(4916, 10); -- Cataclysmic Cook
    a[4917] = b:New(4917, 10); -- Cataclysmic Fisherman
    a[4918] = b:New(4918, 0); -- Illustrious Grand Master Medic
    O(a[4918], "From", "Version", "040003a", "Before", "Version", "080001");
    a[4919] = b:New(4919, 10); -- Expert Archaeologist
    a[4920] = b:New(4920, 10); -- Artisan Archaeologist
    a[4921] = b:New(4921, 10); -- Master Archaeologist
    a[4922] = b:New(4922, 10); -- Grand Master Archaeologist
    a[4923] = b:New(4923, 10); -- Illustrious Grand Master Archaeologist
    a[4924] = b:New(4924, 10); -- Professional Cataclysmic Master
    a[4925] = b:New(4925, 10, fac.Alliance, 4976); -- Ashenvale Quests
    a[4926] = b:New(4926, 10, fac.Alliance, 4933); -- Bloodmyst Isle Quests
    a[4927] = b:New(4927, 10, fac.Horde, 4928); -- Azshara Quests
    a[4928] = b:New(4928, 10, fac.Alliance, 4927); -- Darkshore Quests
    a[4929] = b:New(4929, 10, fac.Alliance, 4978); -- Dustwallow Marsh Quests
    a[4930] = b:New(4930, 10); -- Desolace Quests
    a[4931] = b:New(4931, 10); -- Felwood Quests
    a[4932] = b:New(4932, 10, fac.Alliance, 4979); -- Feralas Quests
    a[4933] = b:New(4933, 10, fac.Horde, 4926); -- Northern Barrens Quests
    a[4934] = b:New(4934, 10); -- Silithus Quests
    a[4935] = b:New(4935, 10); -- Tanaris Quests
    a[4936] = b:New(4936, 10, fac.Alliance, 4980); -- Stonetalon Mountains Quests
    a[4937] = b:New(4937, 10, fac.Alliance, 4981); -- Southern Barrens Quests
    a[4938] = b:New(4938, 10); -- Thousand Needles Quests
    a[4939] = b:New(4939, 10); -- Un'Goro Crater Quests
    a[4940] = b:New(4940, 10); -- Winterspring Quests
    a[4956] = b:New(4956, 10); -- 5 Dungeon Quests Completed
    a[4957] = b:New(4957, 10); -- 20 Dungeon Quests Completed
    a[4958] = b:New(4958, 10); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    a[4959] = b:New(4959, 10); -- Beware of the 'Unbeatable?' Pterodactyl
    a[4960] = b:New(4960, 10); -- Round Three. Fight!
    a[4961] = b:New(4961, 10); -- In a Thousand Years Even You Might be Worth Something
    a[4975] = b:New(4975, 10); -- From Hell's Heart I Stab at Thee
    a[4976] = b:New(4976, 10, fac.Horde, 4925); -- Ashenvale Quests
    a[4978] = b:New(4978, 10, fac.Horde, 4929); -- Dustwallow Marsh Quests
    a[4979] = b:New(4979, 10, fac.Horde, 4932); -- Feralas Quests
    a[4980] = b:New(4980, 10, fac.Horde, 4936); -- Stonetalon Mountains Quests
    a[4981] = b:New(4981, 10, fac.Horde, 4937); -- Southern Barrens Quests
    a[4982] = b:New(4982, 10, fac.Horde, 4869); -- Sinking into Vashj'ir
    a[4995] = b:New(4995, 10); -- Explore the Cape of Stranglethorn
    a[4996] = b:New(4996, 10); -- Explore Southern Barrens
    a[4998] = b:New(4998, 0, nil, nil, true); -- Realm First! Level 85 Shaman
    O(a[4998], "Once");
    a[4999] = b:New(4999, 0, nil, nil, true); -- Realm First! Level 85
    O(a[4999], "Once");
    a[5000] = b:New(5000, 0, nil, nil, true); -- Realm First! Level 85 Druid
    O(a[5000], "Once");
    a[5001] = b:New(5001, 0, nil, nil, true); -- Realm First! Level 85 Paladin
    O(a[5001], "Once");
    a[5002] = b:New(5002, 0, nil, nil, true); -- Realm First! Level 85 Priest
    O(a[5002], "Once");
    a[5003] = b:New(5003, 0, nil, nil, true); -- Realm First! Level 85 Warlock
    O(a[5003], "Once");
    a[5004] = b:New(5004, 0, nil, nil, true); -- Realm First! Level 85 Hunter
    O(a[5004], "Once");
    a[5005] = b:New(5005, 0, nil, nil, true); -- Realm First! Level 85 Death Knight
    O(a[5005], "Once");
    a[5006] = b:New(5006, 0, nil, nil, true); -- Realm First! Level 85 Mage
    O(a[5006], "Once");
    a[5007] = b:New(5007, 0, nil, nil, true); -- Realm First! Level 85 Warrior
    O(a[5007], "Once");
    a[5008] = b:New(5008, 0, nil, nil, true); -- Realm First! Level 85 Rogue
    O(a[5008], "Once");
    a[5060] = b:New(5060, 10); -- Heroic: Blackrock Caverns
    a[5061] = b:New(5061, 10); -- Heroic: Throne of the Tides
    a[5062] = b:New(5062, 10); -- Heroic: Grim Batol
    a[5063] = b:New(5063, 10); -- Heroic: The Stonecore
    a[5064] = b:New(5064, 10); -- Heroic: The Vortex Pinnacle
    a[5065] = b:New(5065, 10); -- Heroic: Halls of Origination
    a[5066] = b:New(5066, 10); -- Heroic: Lost City of the Tol'vir
    a[5083] = b:New(5083, 10); -- Heroic: Deadmines
    a[5093] = b:New(5093, 10); -- Heroic: Shadowfang Keep
    a[5094] = b:New(5094, 10); -- Heroic: Magmaw
    a[5107] = b:New(5107, 10); -- Heroic: Omnotron Defense System
    a[5108] = b:New(5108, 10); -- Heroic: Maloriak
    a[5109] = b:New(5109, 10); -- Heroic: Atramedes
    a[5115] = b:New(5115, 10); -- Heroic: Chimaeron
    a[5116] = b:New(5116, 10); -- Heroic: Nefarian
    a[5117] = b:New(5117, 10); -- Heroic: Valiona and Theralion
    a[5118] = b:New(5118, 10); -- Heroic: Halfus Wyrmbreaker
    a[5119] = b:New(5119, 10); -- Heroic: Ascendant Council
    a[5120] = b:New(5120, 10); -- Heroic: Cho'gall
    a[5121] = b:New(5121, 10); -- Heroic: Sinestra
    a[5122] = b:New(5122, 10); -- Heroic: Conclave of Wind
    a[5123] = b:New(5123, 10); -- Heroic: Al'Akir
    a[5180] = b:New(5180, 10); -- Breaking the Sound Barrier
    a[5191] = b:New(5191, 10); -- Tragedy in Three Acts
    a[5192] = b:New(5192, 10); -- The Harder they Fall
    a[5193] = b:New(5193, 10); -- Blue Streak
    a[5208] = b:New(5208, 10); -- Twin Peaking
    a[5209] = b:New(5209, 10); -- Twin Peaks Veteran
    a[5210] = b:New(5210, 10); -- Two-Timer
    a[5211] = b:New(5211, 10); -- Top Defender
    a[5213] = b:New(5213, 10, fac.Alliance, 5214); -- Soaring Spirits
    a[5214] = b:New(5214, 10, fac.Horde, 5213); -- Soaring Spirits
    a[5215] = b:New(5215, 10); -- Twin Peaks Perfection
    a[5216] = b:New(5216, 10); -- Peak Speed
    a[5219] = b:New(5219, 10, fac.Alliance, 5220); -- I'm in the White Lodge
    a[5220] = b:New(5220, 10, fac.Horde, 5219); -- I'm in the Black Lodge
    a[5221] = b:New(5221, 10, fac.Alliance, 5222); -- "Fire, Walk With Me"
    a[5222] = b:New(5222, 10, fac.Horde, 5221); -- "Fire, Walk With Me"
    a[5223] = b:New(5223, 25); -- Master of Twin Peaks
    a[5226] = b:New(5226, 10, fac.Alliance, 5227); -- Cloud Nine
    a[5227] = b:New(5227, 10, fac.Horde, 5226); -- Cloud Nine
    a[5228] = b:New(5228, 10, fac.Horde, 5229); -- Wild Hammering
    a[5229] = b:New(5229, 10, fac.Alliance, 5228); -- Drag a Maw
    a[5230] = b:New(5230, 10); -- Twin Peaks Mountaineer
    a[5231] = b:New(5231, 10, fac.Alliance, 5552); -- Double Jeopardy
    a[5245] = b:New(5245, 10); -- Battle for Gilneas Victory
    a[5246] = b:New(5246, 10); -- Battle for Gilneas Veteran
    a[5247] = b:New(5247, 20); -- Battle for Gilneas Perfection
    a[5248] = b:New(5248, 10); -- Bustin' Caps to Make It Haps
    a[5249] = b:New(5249, 10); -- One Two Three You Don't Know About Me
    a[5250] = b:New(5250, 10); -- Out of the Fog
    a[5251] = b:New(5251, 10); -- Not Your Average PUG'er
    a[5252] = b:New(5252, 10); -- Don't Get Cocky Kid
    a[5253] = b:New(5253, 10); -- Full Coverage
    a[5254] = b:New(5254, 10); -- Newbs to Plowshares
    a[5255] = b:New(5255, 10); -- Jugger Not
    a[5256] = b:New(5256, 20); -- Battle for Gilneas All-Star
    a[5257] = b:New(5257, 20); -- Battle for Gilneas Assassin
    a[5258] = b:New(5258, 25); -- Master of the Battle for Gilneas
    a[5262] = b:New(5262, 10); -- Double Rainbow
    a[5266] = b:New(5266, 10); -- Three's Company: 2400
    a[5267] = b:New(5267, 10); -- Three's Company: 2700
    a[5268] = b:New(5268, 10, fac.Alliance, 5269); -- In Service of the Alliance
    a[5269] = b:New(5269, 10, fac.Horde, 5268); -- In Service of the Horde
    a[5281] = b:New(5281, 10); -- Crushing Bones and Cracking Skulls
    a[5282] = b:New(5282, 10); -- Arrested Development
    a[5283] = b:New(5283, 10); -- Too Hot to Handle
    a[5284] = b:New(5284, 10); -- Ascendant Descending
    a[5285] = b:New(5285, 10); -- Old Faithful
    a[5286] = b:New(5286, 10); -- Prince of Tides
    a[5287] = b:New(5287, 10); -- Rotten to the Core
    a[5288] = b:New(5288, 10); -- No Static at All
    a[5289] = b:New(5289, 10); -- Extra Credit Bonus Stage
    a[5290] = b:New(5290, 10); -- Kill It With Fire!
    a[5291] = b:New(5291, 10); -- Acrocalypse Now
    a[5292] = b:New(5292, 10); -- Headed South
    a[5293] = b:New(5293, 10); -- I Hate That Song
    a[5294] = b:New(5294, 10); -- Straw That Broke the Camel's Back
    a[5295] = b:New(5295, 10); -- Sun of a....
    a[5296] = b:New(5296, 10); -- Faster Than the Speed of Light
    a[5297] = b:New(5297, 10); -- Umbrage for Umbriss
    a[5298] = b:New(5298, 10); -- Don't Need to Break Eggs to Make an Omelet
    a[5300] = b:New(5300, 10); -- The Only Escape
    a[5301] = b:New(5301, 10); -- The Boy Who Would be King
    a[5304] = b:New(5304, 10); -- Stay Chill
    a[5305] = b:New(5305, 10); -- Four Play
    a[5306] = b:New(5306, 10); -- Parasite Evening
    a[5307] = b:New(5307, 10); -- Achieve-a-tron
    a[5308] = b:New(5308, 10); -- Silence is Golden
    a[5309] = b:New(5309, 10); -- Full of Sound and Fury
    a[5310] = b:New(5310, 10); -- Aberrant Behavior
    a[5311] = b:New(5311, 10); -- Elementary
    a[5312] = b:New(5312, 10); -- The Abyss Will Gaze Back Into You
    a[5313] = b:New(5313, 0); -- I Can't Hear You Over the Sound of How Awesome I Am
    O(a[5313]);
    a[5315] = b:New(5315, 10); -- Digger
    a[5317] = b:New(5317, 10); -- Help the Bombardier! I'm the Bombardier!
    a[5318] = b:New(5318, 10, fac.Alliance, 5319); -- "20,000 Leagues Under the Sea"
    a[5319] = b:New(5319, 10, fac.Horde, 5318); -- "20,000 Leagues Under the Sea"
    a[5320] = b:New(5320, 10, fac.Alliance, 5321); -- King of the Mountain
    a[5321] = b:New(5321, 10, fac.Horde, 5320); -- King of the Mountain
    a[5322] = b:New(5322, 10, fac.Alliance, 5323); -- In Service of the Alliance
    a[5323] = b:New(5323, 10, fac.Horde, 5322); -- In Service of the Horde
    a[5324] = b:New(5324, 10, fac.Horde, 5327); -- In Service of the Horde
    a[5325] = b:New(5325, 10, fac.Horde, 5328); -- Veteran of the Horde
    a[5326] = b:New(5326, 10, fac.Horde, 5329); -- Warbringer of the Horde
    a[5327] = b:New(5327, 10, fac.Alliance, 5324); -- In Service of the Alliance
    a[5328] = b:New(5328, 10, fac.Alliance, 5325); -- Veteran of the Alliance
    a[5329] = b:New(5329, 10, fac.Alliance, 5326); -- Warbound Veteran of the Alliance
    a[5330] = b:New(5330, 10, fac.Alliance, 5345); -- Private
    a[5331] = b:New(5331, 10, fac.Alliance, 5346); -- Corporal
    a[5332] = b:New(5332, 10, fac.Alliance, 5347); -- Sergeant
    a[5333] = b:New(5333, 10, fac.Alliance, 5348); -- Master Sergeant
    a[5334] = b:New(5334, 10, fac.Alliance, 5349); -- Sergeant Major
    a[5335] = b:New(5335, 10, fac.Alliance, 5350); -- Knight
    a[5336] = b:New(5336, 10, fac.Alliance, 5351); -- Knight-Lieutenant
    a[5337] = b:New(5337, 10, fac.Alliance, 5352); -- Knight-Captain
    a[5338] = b:New(5338, 10, fac.Horde, 5359); -- Centurion
    a[5339] = b:New(5339, 10, fac.Alliance, 5353); -- Lieutenant Commander
    a[5340] = b:New(5340, 10, fac.Alliance, 5354); -- Commander
    a[5341] = b:New(5341, 10, fac.Alliance, 5355); -- Marshal
    a[5342] = b:New(5342, 10, fac.Horde, 5357); -- Warlord
    a[5343] = b:New(5343, 10, fac.Alliance, 5356); -- Grand Marshal
    a[5344] = b:New(5344, 0, fac.Alliance, 5358); -- Hero of the Alliance: Vicious
    O(a[5344], "From", "PvP Season", 9, "Until", "PvP Season", 9);
    a[5345] = b:New(5345, 10, fac.Horde, 5330); -- Scout
    a[5346] = b:New(5346, 10, fac.Horde, 5331); -- Grunt
    a[5347] = b:New(5347, 10, fac.Horde, 5332); -- Sergeant
    a[5348] = b:New(5348, 10, fac.Horde, 5333); -- Senior Sergeant
    a[5349] = b:New(5349, 10, fac.Horde, 5334); -- First Sergeant
    a[5350] = b:New(5350, 10, fac.Horde, 5335); -- Stone Guard
    a[5351] = b:New(5351, 10, fac.Horde, 5336); -- Blood Guard
    a[5352] = b:New(5352, 10, fac.Horde, 5337); -- Legionnaire
    a[5353] = b:New(5353, 10, fac.Horde, 5339); -- Champion
    a[5354] = b:New(5354, 10, fac.Horde, 5340); -- Lieutenant General
    a[5355] = b:New(5355, 10, fac.Horde, 5341); -- General
    a[5356] = b:New(5356, 10, fac.Horde, 5343); -- High Warlord
    a[5357] = b:New(5357, 10, fac.Alliance, 5342); -- Field Marshal
    a[5358] = b:New(5358, 0, fac.Horde, 5344); -- Hero of the Horde: Vicious
    O(a[5358], "From", "PvP Season", 9, "Until", "PvP Season", 9);
    a[5359] = b:New(5359, 10, fac.Alliance, 5338); -- Knight-Champion
    a[5363] = b:New(5363, 10); -- 250000 Honorable Kills
    a[5366] = b:New(5366, 10); -- Ready for Raiding
    a[5367] = b:New(5367, 10); -- Rat Pack
    a[5368] = b:New(5368, 10); -- Prototype Prodigy
    a[5369] = b:New(5369, 10); -- It's Frost Damage
    a[5370] = b:New(5370, 10); -- I'm on a Diet
    a[5371] = b:New(5371, 10); -- Vigorous VanCleef Vindicator
    a[5372] = b:New(5372, 0); -- Cataclysmically Epic
    O(a[5372], "From", "Version", "040003a", "Before", "Version", "080001");
    a[5373] = b:New(5373, 0); -- Cataclysmically Superior
    O(a[5373], "From", "Version", "040003a", "Before", "Version", "080001");
    a[5374] = b:New(5374, 10); -- 45 Exalted Reputations
    a[5375] = b:New(5375, 10, fac.Alliance, 5376); -- Baradin's Wardens
    a[5376] = b:New(5376, 10, fac.Horde, 5375); -- Hellscream's Reach
    a[5377] = b:New(5377, 0); -- Collector's Edition: Lil' Deathwing
    a[5378] = b:New(5378, 0); -- Deathy
    a[5381] = b:New(5381, 0, nil, nil, true); -- Realm First! Illustrious Alchemist
    O(a[5381], "Once");
    a[5382] = b:New(5382, 0, nil, nil, true); -- Realm First! Illustrious Blacksmith
    O(a[5382], "Once");
    a[5383] = b:New(5383, 0, nil, nil, true); -- Realm First! Illustrious Cook
    O(a[5383], "Once");
    a[5384] = b:New(5384, 0, nil, nil, true); -- Realm First! Illustrious Enchanter
    O(a[5384], "Once");
    a[5385] = b:New(5385, 0, nil, nil, true); -- Realm First! Illustrious Engineer
    O(a[5385], "Once");
    a[5386] = b:New(5386, 0, nil, nil, true); -- Realm First! Illustrious Medic
    O(a[5386], "Once");
    a[5387] = b:New(5387, 0, nil, nil, true); -- Realm First! Illustrious Angler
    O(a[5387], "Once");
    a[5388] = b:New(5388, 0, nil, nil, true); -- Realm First! Illustrious Herbalist
    O(a[5388], "Once");
    a[5389] = b:New(5389, 0, nil, nil, true); -- Realm First! Illustrious Scribe
    O(a[5389], "Once");
    a[5390] = b:New(5390, 0, nil, nil, true); -- Realm First! Illustrious Jewelcrafter
    O(a[5390], "Once");
    a[5391] = b:New(5391, 0, nil, nil, true); -- Realm First! Illustrious Leatherworker
    O(a[5391], "Once");
    a[5392] = b:New(5392, 0, nil, nil, true); -- Realm First! Illustrious Miner
    O(a[5392], "Once");
    a[5393] = b:New(5393, 0, nil, nil, true); -- Realm First! Illustrious Skinner
    O(a[5393], "Once");
    a[5394] = b:New(5394, 0, nil, nil, true); -- Realm First! Illustrious Tailor
    O(a[5394], "Once");
    a[5395] = b:New(5395, 0, nil, nil, true); -- Realm First! Grand Master Archaeologist
    O(a[5395], "Once");
    a[5396] = b:New(5396, 0, nil, nil, true); -- Realm First! Illustrious Archaeologist
    O(a[5396], "Once");
    a[5412] = b:New(5412, 10); -- Tol Barad Victory
    a[5415] = b:New(5415, 10); -- Tower Plower
    a[5416] = b:New(5416, 10); -- Pit Lord Argaloth
    a[5417] = b:New(5417, 10, fac.Alliance, 5418); -- Tol Barad Veteran
    a[5418] = b:New(5418, 10, fac.Horde, 5417); -- Tol Barad Veteran
    a[5442] = b:New(5442, 10); -- Full Caravan
    a[5443] = b:New(5443, 10); -- E'ko Madness
    a[5444] = b:New(5444, 10); -- "Ready, Set, Goat!"
    a[5445] = b:New(5445, 10); -- Fungalophobia
    a[5446] = b:New(5446, 10); -- The Glop Family Line
    a[5447] = b:New(5447, 10); -- My Very Own Broodmother
    a[5448] = b:New(5448, 10); -- Glutton for Fiery Punishment
    a[5449] = b:New(5449, 10); -- Rock Lover
    a[5450] = b:New(5450, 10); -- Fungal Frenzy
    a[5451] = b:New(5451, 10); -- Consumed by Nightmare
    a[5452] = b:New(5452, 10); -- Visions of Vashj'ir Past
    a[5453] = b:New(5453, 10, fac.Alliance); -- Ghosts in the Dark
    a[5454] = b:New(5454, 10, fac.Horde); -- Joy Ride
    a[5455] = b:New(5455, 10); -- Got My Mind On My Money
    a[5456] = b:New(5456, 10); -- Got My Mind On My Money
    a[5469] = b:New(5469, 10); -- Diggerer
    a[5470] = b:New(5470, 10); -- Diggerest
    a[5471] = b:New(5471, 10); -- Iron Chef
    a[5472] = b:New(5472, 10); -- The Cataclysmic Gourmet
    a[5473] = b:New(5473, 10); -- The Cataclysmic Gourmet
    a[5474] = b:New(5474, 10, fac.Alliance, 5475); -- Let's Do Lunch: Stormwind
    a[5475] = b:New(5475, 10, fac.Horde, 5474); -- Let's Do Lunch: Orgrimmar
    a[5476] = b:New(5476, 10, fac.Alliance, 5477); -- Fish or Cut Bait: Stormwind
    a[5477] = b:New(5477, 10, fac.Horde, 5476); -- Fish or Cut Bait: Orgrimmar
    a[5478] = b:New(5478, 10); -- The Limnologist
    a[5479] = b:New(5479, 10); -- The Oceanographer
    a[5480] = b:New(5480, 0); -- Preparing for Disaster
    O(a[5480], "From", "Version", "040003a", "Before", "Version", "080001");
    a[5481] = b:New(5481, 10, fac.Alliance, 5482); -- Wildhammer Tour of Duty
    a[5482] = b:New(5482, 10, fac.Horde, 5481); -- Dragonmaw Tour of Duty
    a[5483] = b:New(5483, 10); -- Bounce
    a[5486] = b:New(5486, 10); -- Tol Barad All-Star
    a[5487] = b:New(5487, 10); -- Tol Barad Saboteur
    a[5488] = b:New(5488, 10); -- Towers of Power
    a[5489] = b:New(5489, 10, fac.Alliance, 5490); -- Master of Tol Barad
    a[5490] = b:New(5490, 10, fac.Horde, 5489); -- Master of Tol Barad
    a[5501] = b:New(5501, 10, fac.Horde, 4873); -- Fading into Twilight
    a[5503] = b:New(5503, 10); -- Pardon Denied
    a[5504] = b:New(5504, 10); -- To the Ground!
    a[5505] = b:New(5505, 10); -- Bullet Time
    a[5506] = b:New(5506, 10); -- Defender of a Shattered World
    a[5511] = b:New(5511, 10); -- It's Always in the Last Place You Look
    a[5512] = b:New(5512, 0); -- WoW's 6th Anniversary
    O(a[5512]);
    a[5518] = b:New(5518, 10); -- Stood in the Fire
    a[5533] = b:New(5533, 0); -- Veteran of the Shifting Sands
    O(a[5533], "Never");
    a[5535] = b:New(5535, 0); -- 1000 Valor Points
    O(a[5535]);
    a[5536] = b:New(5536, 0); -- 5000 Valor Points
    O(a[5536]);
    a[5537] = b:New(5537, 0); -- "25,000 Valor Points"
    O(a[5537]);
    a[5538] = b:New(5538, 0); -- "50,000 Valor Points"
    O(a[5538]);
    a[5539] = b:New(5539, 0); -- "50,000 Conquest Points"
    O(a[5539], "From", "PvP Season", 5, "Until", "PvP Season", 18);
    a[5540] = b:New(5540, 0); -- "25,000 Conquest Points"
    O(a[5540], "From", "PvP Season", 5, "Until", "PvP Season", 18);
    a[5541] = b:New(5541, 0); -- 5000 Conquest Points
    O(a[5541], "From", "PvP Season", 5, "Until", "PvP Season", 18);
    a[5542] = b:New(5542, 0); -- 1000 Conquest Points
    O(a[5542], "From", "PvP Season", 5, "Until", "PvP Season", 18);
    a[5546] = b:New(5546, 10); -- Glutton for Icy Punishment
    a[5547] = b:New(5547, 10); -- Glutton for Shadowy Punishment
    a[5548] = b:New(5548, 10); -- To All the Squirrels Who Cared for Me
    a[5552] = b:New(5552, 10, fac.Horde, 5231); -- Double Jeopardy
    a[5718] = b:New(5718, 10, fac.Alliance, 5719); -- Just Another Day in Tol Barad
    a[5719] = b:New(5719, 10, fac.Horde, 5718); -- Just Another Day in Tol Barad
    a[5723] = b:New(5723, 10); -- 50 Exalted Reputations
    a[5743] = b:New(5743, 10); -- It's Not Easy Being Green
    a[5744] = b:New(5744, 10); -- Gurubashi Headhunter
    a[5749] = b:New(5749, 10); -- Vial of the Sands
    a[5750] = b:New(5750, 10); -- Tunnel Vision
    a[5751] = b:New(5751, 10); -- 2500 Daily Quests Completed
    a[5752] = b:New(5752, 10); -- Justly Rewarded
    a[5753] = b:New(5753, 20); -- Cataclysmically Delicious
    a[5754] = b:New(5754, 10); -- Drown Your Sorrows
    a[5755] = b:New(5755, 10); -- Thirty Tabards
    a[5759] = b:New(5759, 10); -- Spirit Twister
    a[5760] = b:New(5760, 10); -- Ring Out!
    a[5761] = b:New(5761, 10); -- Hex Mix
    a[5762] = b:New(5762, 10); -- Ohganot So Fast!
    a[5765] = b:New(5765, 10); -- "Here, Kitty Kitty..."
    a[5767] = b:New(5767, 0); -- Scourer of the Eternal Sands
    a[5768] = b:New(5768, 10); -- Heroic: Zul'Gurub
    a[5769] = b:New(5769, 10); -- Heroic: Zul'Aman
    a[5779] = b:New(5779, 10); -- You'll Feel Right as Rain
    a[5788] = b:New(5788, 0); -- Agent of the Shen'dralar
    O(a[5788], "Never");
    a[5794] = b:New(5794, 10); -- Time Flies When You're Having Fun
    a[5799] = b:New(5799, 10); -- Only the Penitent...
    a[5802] = b:New(5802, 10); -- Firelands
    a[5803] = b:New(5803, 10); -- Heroic: Ragnaros
    a[5804] = b:New(5804, 10); -- Heroic: Majordomo Fandral Staghelm
    a[5805] = b:New(5805, 10); -- Heroic: Baleroc
    a[5806] = b:New(5806, 10); -- Heroic: Shannox
    a[5807] = b:New(5807, 10); -- Heroic: Beth'tilac
    a[5808] = b:New(5808, 10); -- Heroic: Lord Rhyolith
    a[5809] = b:New(5809, 10); -- Heroic: Alysrazor
    a[5810] = b:New(5810, 10); -- Not an Ambi-Turner
    a[5813] = b:New(5813, 10); -- Do a Barrel Roll!
    a[5821] = b:New(5821, 10); -- Death from Above
    a[5823] = b:New(5823, 10, fac.Alliance, 5824); -- Veteran of the Alliance II
    a[5824] = b:New(5824, 10, fac.Horde, 5823); -- Veteran of the Horde II
    a[5827] = b:New(5827, 15); -- Avengers of Hyjal
    a[5828] = b:New(5828, 25); -- Glory of the Firelands Raider
    a[5829] = b:New(5829, 10); -- Bucket List
    a[5830] = b:New(5830, 10); -- Share the Pain
    a[5835] = b:New(5835, 10, fac.Horde, 5836); -- Tricks and Treats of Northrend
    a[5836] = b:New(5836, 10, fac.Alliance, 5835); -- Tricks and Treats of Northrend
    a[5837] = b:New(5837, 10, fac.Alliance, 5838); -- Tricks and Treats of the Cataclysm
    a[5838] = b:New(5838, 10, fac.Horde, 5837); -- Tricks and Treats of the Cataclysm
    a[5839] = b:New(5839, 0); -- "Dragonwrath, Tarecgosa's Rest"
    a[5841] = b:New(5841, 10, fac.Alliance, 5843); -- Let's Do Lunch: Ironforge
    a[5842] = b:New(5842, 10, fac.Alliance, 5844); -- Let's Do Lunch: Darnassus
    a[5843] = b:New(5843, 10, fac.Horde, 5841); -- Let's Do Lunch: Thunder Bluff
    a[5844] = b:New(5844, 10, fac.Horde, 5842); -- Let's Do Lunch: Undercity
    a[5845] = b:New(5845, 10); -- A Bunch of Lunch
    a[5847] = b:New(5847, 10, fac.Alliance, 5849); -- Fish or Cut Bait: Ironforge
    a[5848] = b:New(5848, 10, fac.Alliance, 5850); -- Fish or Cut Bait: Darnassus
    a[5849] = b:New(5849, 10, fac.Horde, 5847); -- Fish or Cut Bait: Thunder Bluff
    a[5850] = b:New(5850, 10, fac.Horde, 5848); -- Fish or Cut Bait: Undercity
    a[5851] = b:New(5851, 10); -- Gone Fishin'
    a[5853] = b:New(5853, 10, fac.Alliance, 5854); -- A-Caroling We Will Go
    a[5854] = b:New(5854, 10, fac.Horde, 5853); -- A-Caroling We Will Go
    a[5855] = b:New(5855, 10); -- Ragnar-O's
    a[5858] = b:New(5858, 10); -- Bear-ly Made It
    a[5859] = b:New(5859, 10); -- Legacy of Leyara
    a[5860] = b:New(5860, 10); -- The 'Unbeatable?' Pterodactyl: BEATEN.
    a[5861] = b:New(5861, 10); -- The Fiery Lords of Sethria's Roost
    a[5862] = b:New(5862, 10); -- Ludicrous Speed
    a[5863] = b:New(5863, 0); -- WoW's 7th Anniversary
    O(a[5863]);
    a[5864] = b:New(5864, 10); -- Gang War
    a[5865] = b:New(5865, 10); -- Have... Have We Met?
    a[5866] = b:New(5866, 10); -- The Molten Front Offensive
    a[5867] = b:New(5867, 10); -- Flawless Victory
    a[5868] = b:New(5868, 10); -- And the Meek Shall Inherit Kalimdor
    a[5869] = b:New(5869, 10); -- Infernal Ambassadors
    a[5870] = b:New(5870, 10); -- Fireside Chat
    a[5871] = b:New(5871, 10); -- Master of the Molten Flow
    a[5872] = b:New(5872, 10); -- King of the Spider-Hill
    a[5873] = b:New(5873, 10); -- Ready for Raiding II
    a[5874] = b:New(5874, 10); -- Death From Above
    a[5875] = b:New(5875, 10); -- Littlest Pet Shop
    a[5876] = b:New(5876, 10); -- Petting Zoo
    a[5877] = b:New(5877, 10); -- Menagerie
    a[5879] = b:New(5879, 10); -- Veteran of the Molten Front
    a[5995] = b:New(5995, 10); -- Moon Guard
    a[6002] = b:New(6002, 0); -- Vicious Gladiator
    O(a[6002], "From", "PvP Season", 9, "Until", "PvP Season", 9);
    a[6003] = b:New(6003, 0); -- Vicious Gladiator's Twilight Drake
    O(a[6003], "From", "PvP Season", 9, "Until", "PvP Season", 9);
    a[6006] = b:New(6006, 10); -- Elders of Cataclysm
    a[6007] = b:New(6007, 10, fac.Alliance, 6010); -- Extinguishing Northrend
    a[6008] = b:New(6008, 10, fac.Alliance, 6009); -- Flame Warden of Northrend
    a[6009] = b:New(6009, 10, fac.Horde, 6008); -- Flame Keeper of Northrend
    a[6010] = b:New(6010, 10, fac.Horde, 6007); -- Extinguishing Northrend
    a[6011] = b:New(6011, 10, fac.Alliance, 6012); -- Flame Warden of Cataclysm
    a[6012] = b:New(6012, 10, fac.Horde, 6011); -- Flame Keeper of Cataclysm
    a[6013] = b:New(6013, 5, fac.Alliance, 6014); -- Extinguishing the Cataclysm
    a[6014] = b:New(6014, 5, fac.Horde, 6013); -- Extinguishing the Cataclysm
    a[6019] = b:New(6019, 5); -- "Come One, Come All!"
    a[6020] = b:New(6020, 10); -- Step Right Up
    a[6021] = b:New(6021, 10); -- Blastenheimer Bullseye
    a[6022] = b:New(6022, 10); -- Quick Shot
    a[6023] = b:New(6023, 10); -- Darkmoon Duelist
    a[6024] = b:New(6024, 20); -- Darkmoon Dominator
    a[6025] = b:New(6025, 5); -- I Was Promised a Pony
    a[6026] = b:New(6026, 10); -- Fairegoer's Feast
    a[6027] = b:New(6027, 10); -- Darkmoon Dungeoneer
    a[6028] = b:New(6028, 10); -- Darkmoon Defender
    a[6029] = b:New(6029, 10); -- Darkmoon Despoiler
    a[6030] = b:New(6030, 10, fac.Alliance, 6031); -- Taking the Show on the Road
    a[6031] = b:New(6031, 10, fac.Horde, 6030); -- Taking the Show on the Road
    a[6032] = b:New(6032, 10); -- Faire Favors
    a[6045] = b:New(6045, 10); -- Occu'thar
    a[6059] = b:New(6059, 0); -- Red Rider Air Rifle
    a[6060] = b:New(6060, 0); -- MiniZep Controller
    a[6061] = b:New(6061, 0); -- Gaudy Winter Veil Sweater
    a[6070] = b:New(6070, 10); -- That's Not Canon!
    a[6084] = b:New(6084, 10); -- Minutes to Midnight
    a[6089] = b:New(6089, 10); -- Keep Rollin' Rollin' Rollin'
    a[6105] = b:New(6105, 10); -- Deck Defender
    a[6106] = b:New(6106, 10); -- Siege of Wyrmrest Temple
    a[6107] = b:New(6107, 10); -- Fall of Deathwing
    a[6108] = b:New(6108, 10); -- Alizabal
    a[6109] = b:New(6109, 10); -- Heroic: Morchok
    a[6110] = b:New(6110, 10); -- Heroic: Warlord Zon'ozz
    a[6111] = b:New(6111, 10); -- Heroic: Yor'sahj the Unsleeping
    a[6112] = b:New(6112, 10); -- Heroic: Hagara the Stormbinder
    a[6113] = b:New(6113, 10); -- Heroic: Ultraxion
    a[6114] = b:New(6114, 10); -- Heroic: Warmaster Blackhorn
    a[6115] = b:New(6115, 10); -- Heroic: Spine of Deathwing
    a[6116] = b:New(6116, 10); -- Heroic: Madness of Deathwing
    a[6117] = b:New(6117, 10); -- Heroic: End Time
    a[6118] = b:New(6118, 10); -- Heroic: Well of Eternity
    a[6119] = b:New(6119, 10); -- Heroic: Hour of Twilight
    a[6124] = b:New(6124, 0); -- Ruthless Gladiator
    O(a[6124], "From", "PvP Season", 10, "Until", "PvP Season", 10);
    a[6127] = b:New(6127, 10); -- Lazy Eye
    a[6128] = b:New(6128, 10); -- Ping Pong Champion
    a[6129] = b:New(6129, 10); -- Taste the Rainbow!
    a[6130] = b:New(6130, 10); -- Severed Ties
    a[6131] = b:New(6131, 0); -- WoW's 8th Anniversary
    O(a[6131]);
    a[6132] = b:New(6132, 10); -- Eclipse
    a[6133] = b:New(6133, 10); -- Maybe He'll Get Dizzy...
    a[6169] = b:New(6169, 25); -- Glory of the Dragon Soul Raider
    a[6174] = b:New(6174, 10); -- Don't Stand So Close to Me
    a[6175] = b:New(6175, 10); -- Holding Hands
    a[6177] = b:New(6177, 10); -- Destroyer's End
    a[6180] = b:New(6180, 10); -- Chromatic Champion
    a[6181] = b:New(6181, 0); -- Fangs of the Father
    a[6185] = b:New(6185, 0); -- Murkablo
    a[6193] = b:New(6193, 0); -- Level 90 (Legacy)
    O(a[6193], "From", "Version", "050005", "Before", "Version", "090001");
    a[6300] = b:New(6300, 10, fac.Alliance, 6534); -- Upjade Complete
    a[6301] = b:New(6301, 10); -- Rally the Valley
    a[6316] = b:New(6316, 0, fac.Alliance, 6317); -- Hero of the Alliance: Ruthless
    O(a[6316], "From", "PvP Season", 10, "Until", "PvP Season", 10);
    a[6317] = b:New(6317, 0, fac.Horde, 6316); -- Hero of the Horde: Ruthless
    O(a[6317], "From", "PvP Season", 10, "Until", "PvP Season", 10);
    a[6322] = b:New(6322, 0); -- Ruthless Gladiator's Twilight Drake
    O(a[6322], "From", "PvP Season", 10, "Until", "PvP Season", 10);
    a[6332] = b:New(6332, 10); -- That Rabbit's Dynamite!
    a[6348] = b:New(6348, 0); -- Mystically Superior
    O(a[6348], "From", "Version", "050005", "Before", "Version", "080001");
    a[6349] = b:New(6349, 0); -- Mystically Epic
    O(a[6349], "From", "Version", "050005", "Before", "Version", "080001");
    a[6350] = b:New(6350, 10); -- To All the Squirrels I Once Caressed?
    a[6351] = b:New(6351, 10); -- Explore Jade Forest
    a[6365] = b:New(6365, 10); -- Zen Master Cook
    a[6366] = b:New(6366, 10); -- Shado-Pan
    a[6374] = b:New(6374, 0); -- Challenge Conqueror: Bronze
    O(a[6374], "From", "Version", "050005", "Before", "Version", "060002");
    a[6375] = b:New(6375, 0); -- Challenge Conqueror: Silver
    O(a[6375], "From", "Version", "050005", "Before", "Version", "060002");
    a[6378] = b:New(6378, 0); -- Challenge Conqueror: Gold
    O(a[6378], "From", "Version", "050005", "Before", "Version", "060002");
    a[6394] = b:New(6394, 10); -- Rattle No More
    a[6396] = b:New(6396, 10); -- Sanguinarian
    a[6400] = b:New(6400, 10); -- How Did He Get Up There?
    a[6402] = b:New(6402, 10); -- Ling-Ting's Herbal Journey
    a[6420] = b:New(6420, 10); -- Hopocalypse Now!
    a[6427] = b:New(6427, 10); -- Mosh Pit
    a[6433] = b:New(6433, 0, nil, nil, true); -- Realm First! Challenge Conqueror: Gold
    O(a[6433], "Once");
    a[6455] = b:New(6455, 10); -- Show Me Your Moves!
    a[6456] = b:New(6456, 10); -- Heroic: Stormstout Brewery
    a[6457] = b:New(6457, 10); -- Stormstout Brewery
    a[6458] = b:New(6458, 10); -- Guardians of Mogu'shan
    a[6460] = b:New(6460, 10); -- Hydrophobia
    a[6462] = b:New(6462, 5); -- Master Pet Battler
    a[6469] = b:New(6469, 10); -- Shado-Pan Monastery
    a[6470] = b:New(6470, 10); -- Heroic: Shado-Pan Monastery
    a[6471] = b:New(6471, 10); -- Hate Leads to Suffering
    a[6472] = b:New(6472, 10); -- The Obvious Solution
    a[6475] = b:New(6475, 10); -- Cleaning Up
    a[6476] = b:New(6476, 10); -- Conscriptinator
    a[6477] = b:New(6477, 10); -- Respect
    a[6478] = b:New(6478, 10); -- Glintrok N' Roll
    a[6479] = b:New(6479, 10); -- Bomberman
    a[6480] = b:New(6480, 10); -- "Settle Down, Bro"
    a[6485] = b:New(6485, 10); -- Return to Sender
    a[6517] = b:New(6517, 10); -- Extinction Event
    a[6518] = b:New(6518, 10); -- I Heard You Like Amber...
    a[6523] = b:New(6523, 0, nil, nil, true); -- Realm First! Level 90 Shaman
    O(a[6523], "Once");
    a[6524] = b:New(6524, 0, nil, nil, true); -- Realm First! Level 90
    O(a[6524], "Once");
    a[6531] = b:New(6531, 10); -- Attention to Detail
    a[6534] = b:New(6534, 10, fac.Horde, 6300); -- Upjade Complete
    a[6535] = b:New(6535, 10, fac.Alliance, 6536); -- Mighty Roamin' Krasaranger
    a[6536] = b:New(6536, 10, fac.Horde, 6535); -- Mighty Roamin' Krasaranger
    a[6537] = b:New(6537, 10, fac.Alliance, 6538); -- Slum It in the Summit
    a[6538] = b:New(6538, 10, fac.Horde, 6537); -- Slum It in the Summit
    a[6539] = b:New(6539, 10); -- "One Steppe Forward, Two Steppes Back"
    a[6540] = b:New(6540, 10); -- Dread Haste Makes Dread Waste
    a[6541] = b:New(6541, 10); -- Loremaster of Pandaria
    a[6543] = b:New(6543, 10); -- The August Celestials
    a[6544] = b:New(6544, 10); -- The Tillers
    a[6545] = b:New(6545, 10); -- Klaxxi
    a[6546] = b:New(6546, 10); -- The Golden Lotus
    a[6547] = b:New(6547, 10); -- The Anglers
    a[6548] = b:New(6548, 10); -- The Lorewalkers
    a[6550] = b:New(6550, 10); -- Order of the Cloud Serpent
    a[6551] = b:New(6551, 10); -- Friend on the Farm
    a[6552] = b:New(6552, 10); -- Friends on the Farm
    a[6553] = b:New(6553, 10); -- Like an Arrow to the Face
    a[6554] = b:New(6554, 5); -- He's Mine!
    a[6555] = b:New(6555, 5); -- Building a Team
    a[6556] = b:New(6556, 5); -- Going to Need More Traps
    a[6557] = b:New(6557, 5); -- Master Pet Hunter
    a[6558] = b:New(6558, 5); -- Local Pet Mauler
    a[6559] = b:New(6559, 5); -- Traveling Pet Mauler
    a[6560] = b:New(6560, 10); -- World Pet Mauler
    a[6566] = b:New(6566, 5); -- Just a Pup
    a[6567] = b:New(6567, 5); -- Growing Up
    a[6568] = b:New(6568, 5); -- Time for a Leash
    a[6569] = b:New(6569, 5); -- Old Timer
    a[6570] = b:New(6570, 10); -- All Growns Up!
    a[6571] = b:New(6571, 5); -- That Was Close!
    a[6578] = b:New(6578, 5); -- Pro Pet Group
    a[6579] = b:New(6579, 5); -- Rookie Pet Group
    a[6580] = b:New(6580, 5); -- Rookie Pet Crew
    a[6581] = b:New(6581, 5); -- Pro Pet Crew
    a[6582] = b:New(6582, 10); -- Pro Pet Mob
    a[6583] = b:New(6583, 10); -- Rookie Pet Mob
    a[6584] = b:New(6584, 5); -- Big City Pet Brawlin' - Alliance
    a[6585] = b:New(6585, 5); -- Kalimdor Safari
    a[6586] = b:New(6586, 5); -- Eastern Kingdoms Safari
    a[6587] = b:New(6587, 5); -- Outland Safari
    a[6588] = b:New(6588, 5); -- Northrend Safari
    a[6589] = b:New(6589, 5); -- Pandaria Safari
    a[6590] = b:New(6590, 10); -- World Safari
    a[6591] = b:New(6591, 5); -- Grand Master Pet Battler
    a[6592] = b:New(6592, 10); -- Legendary Pet Battler
    a[6593] = b:New(6593, 5); -- Experienced Pet Battler
    a[6594] = b:New(6594, 5); -- Cat Fight!
    a[6595] = b:New(6595, 5); -- Pet Brawler
    a[6596] = b:New(6596, 5); -- Experienced Pet Brawler
    a[6597] = b:New(6597, 5); -- Master Pet Brawler
    a[6598] = b:New(6598, 5); -- Grand Master Pet Brawler
    a[6599] = b:New(6599, 10); -- Legendary Pet Brawler
    a[6600] = b:New(6600, 5); -- Ultimate Trainer
    a[6601] = b:New(6601, 5); -- Taming the Wild
    a[6602] = b:New(6602, 5, fac.Horde, 6603); -- Taming Kalimdor
    a[6603] = b:New(6603, 5, fac.Alliance, 6602); -- Taming Eastern Kingdoms
    a[6604] = b:New(6604, 5); -- Taming Outland
    a[6605] = b:New(6605, 5); -- Taming Northrend
    a[6606] = b:New(6606, 5); -- Taming Pandaria
    a[6607] = b:New(6607, 10); -- Taming Azeroth
    a[6608] = b:New(6608, 10); -- Family Reunion
    a[6609] = b:New(6609, 5); -- No Favorites
    a[6610] = b:New(6610, 10); -- All Pets Allowed
    a[6611] = b:New(6611, 10); -- Continental Tamer
    a[6612] = b:New(6612, 5); -- Kalimdor Tamer
    a[6613] = b:New(6613, 5); -- Eastern Kingdoms Tamer
    a[6614] = b:New(6614, 5); -- Outland Tamer
    a[6615] = b:New(6615, 5); -- Northrend Tamer
    a[6616] = b:New(6616, 5); -- Pandaria Tamer
    a[6618] = b:New(6618, 5); -- On A Roll
    a[6619] = b:New(6619, 10); -- Win Streak
    a[6620] = b:New(6620, 10); -- No Time To Heal
    a[6621] = b:New(6621, 5); -- Big City Pet Brawlin' - Horde
    a[6622] = b:New(6622, 10); -- Big City Pet Brawler
    a[6634] = b:New(6634, 0); -- Challenge Conquerors: Gold - Guild Edition
    a[6671] = b:New(6671, 10); -- Seeds of Doubt
    a[6674] = b:New(6674, 10); -- "Anything You Can Do, I Can Do Better..."
    a[6683] = b:New(6683, 10); -- Less Than Three
    a[6684] = b:New(6684, 10); -- Humane Society
    a[6686] = b:New(6686, 10); -- Straight Six
    a[6687] = b:New(6687, 10); -- Getting Hot In Here
    a[6688] = b:New(6688, 10); -- Where's My Air Support?
    a[6689] = b:New(6689, 10); -- Terrace of Endless Spring
    a[6713] = b:New(6713, 10); -- Quarrelsome Quilen Quintet
    a[6715] = b:New(6715, 10); -- Polyformic Acid Science
    a[6716] = b:New(6716, 10); -- Between a Saurok and a Hard Place
    a[6717] = b:New(6717, 10); -- Power Overwhelming
    a[6718] = b:New(6718, 10); -- The Dread Approach
    a[6719] = b:New(6719, 10); -- Heroic: Stone Guard
    a[6720] = b:New(6720, 10); -- Heroic: Feng the Accursed
    a[6721] = b:New(6721, 10); -- Heroic: Gara'jal the Spiritbinder
    a[6722] = b:New(6722, 10); -- Heroic: Four Kings
    a[6723] = b:New(6723, 10); -- Heroic: Elegon
    a[6724] = b:New(6724, 10); -- Heroic: Will of the Emperor
    a[6725] = b:New(6725, 10); -- Heroic: Imperial Vizier Zor'lok
    a[6726] = b:New(6726, 10); -- Heroic: Blade Lord Ta'yak
    a[6727] = b:New(6727, 10); -- Heroic: Garalon
    a[6728] = b:New(6728, 10); -- Heroic: Wind Lord Mel'jarak
    a[6729] = b:New(6729, 10); -- Heroic: Amber-Shaper Un'sok
    a[6730] = b:New(6730, 10); -- Heroic: Grand Empress Shek'zeer
    a[6731] = b:New(6731, 10); -- Heroic: Protectors of the Endless
    a[6732] = b:New(6732, 10); -- Heroic: Tsulong
    a[6733] = b:New(6733, 10); -- Heroic: Lei Shi
    a[6734] = b:New(6734, 10); -- Heroic: Sha of Fear
    a[6736] = b:New(6736, 10); -- What Does This Button Do?
    a[6739] = b:New(6739, 10); -- Silvershard Mines Victory
    a[6740] = b:New(6740, 10); -- Temple of Kotmogu Victory
    a[6741] = b:New(6741, 0); -- Cataclysmic Gladiator's Twilight Drake
    O(a[6741], "From", "PvP Season", 11, "Until", "PvP Season", 11);
    a[6742] = b:New(6742, 10); -- 60 Exalted Reputations
    a[6743] = b:New(6743, 0, nil, nil, true); -- Realm First! Level 90 Druid
    O(a[6743], "Once");
    a[6744] = b:New(6744, 0, nil, nil, true); -- Realm First! Level 90 Paladin
    O(a[6744], "Once");
    a[6745] = b:New(6745, 0, nil, nil, true); -- Realm First! Level 90 Priest
    O(a[6745], "Once");
    a[6746] = b:New(6746, 0, nil, nil, true); -- Realm First! Level 90 Warlock
    O(a[6746], "Once");
    a[6747] = b:New(6747, 0, nil, nil, true); -- Realm First! Level 90 Hunter
    O(a[6747], "Once");
    a[6748] = b:New(6748, 0, nil, nil, true); -- Realm First! Level 90 Death Knight
    O(a[6748], "Once");
    a[6749] = b:New(6749, 0, nil, nil, true); -- Realm First! Level 90 Mage
    O(a[6749], "Once");
    a[6750] = b:New(6750, 0, nil, nil, true); -- Realm First! Level 90 Warrior
    O(a[6750], "Once");
    a[6751] = b:New(6751, 0, nil, nil, true); -- Realm First! Level 90 Rogue
    O(a[6751], "Once");
    a[6752] = b:New(6752, 0, nil, nil, true); -- Realm First! Level 90 Monk
    O(a[6752], "Once");
    a[6753] = b:New(6753, 10); -- Got My Mind On My Money
    a[6754] = b:New(6754, 10); -- The Dark Heart of the Mogu
    a[6755] = b:New(6755, 10); -- Mogu'shan Palace
    a[6756] = b:New(6756, 10); -- Heroic: Mogu'shan Palace
    a[6757] = b:New(6757, 10); -- Temple of the Jade Serpent
    a[6758] = b:New(6758, 10); -- Heroic: Temple of the Jade Serpent
    a[6759] = b:New(6759, 10); -- Heroic: Gate of the Setting Sun
    a[6760] = b:New(6760, 10); -- Heroic: Scarlet Halls
    a[6761] = b:New(6761, 10); -- Heroic: Scarlet Monastery
    a[6762] = b:New(6762, 10); -- Heroic: Scholomance
    a[6763] = b:New(6763, 10); -- Heroic: Siege of Niuzao Temple
    a[6821] = b:New(6821, 10); -- School's Out Forever
    a[6822] = b:New(6822, 10); -- Run with the Wind
    a[6823] = b:New(6823, 10); -- Must Love Dogs
    a[6824] = b:New(6824, 10); -- Face Clutchers
    a[6825] = b:New(6825, 10); -- The Mind-Killer
    a[6826] = b:New(6826, 10); -- 55 Exalted Reputations
    a[6827] = b:New(6827, 20, fac.Horde, 6828); -- Pandaren Ambassador
    a[6828] = b:New(6828, 20, fac.Alliance, 6827); -- Pandaren Ambassador
    a[6829] = b:New(6829, 0, nil, nil, true); -- Realm First! Pandaren Ambassador
    O(a[6829], "Once");
    a[6830] = b:New(6830, 10); -- Professional Zen Master
    a[6835] = b:New(6835, 10); -- Working For a Living
    a[6836] = b:New(6836, 0); -- Serious Skills to Pay the Bills
    O(a[6836], "From", "Version", "050005", "Before", "Version", "080001");
    a[6837] = b:New(6837, 10); -- Zen Master Archaeologist
    a[6838] = b:New(6838, 0); -- Zen Master Medic
    O(a[6838], "From", "Version", "050005", "Before", "Version", "080001");
    a[6839] = b:New(6839, 10); -- Zen Master Fisherman
    a[6844] = b:New(6844, 10); -- The Vault of Mysteries
    a[6845] = b:New(6845, 10); -- Nightmare of Shek'zeer
    a[6846] = b:New(6846, 10); -- Fish Tales
    a[6847] = b:New(6847, 10); -- The Song of the Yaungol
    a[6848] = b:New(6848, 0); -- Collector's Edition: Lucky Quilen Cub
    a[6849] = b:New(6849, 0); -- Collector's Edition: Imperial Quilen
    a[6850] = b:New(6850, 10); -- Hozen in the Mist
    a[6851] = b:New(6851, 10); -- Take 'Em All On!
    a[6855] = b:New(6855, 10); -- The Seven Burdens of Shaohao
    a[6856] = b:New(6856, 10); -- Ballad of Liu Lang
    a[6857] = b:New(6857, 10); -- Heart of the Mantid Swarm
    a[6858] = b:New(6858, 10); -- What Is Worth Fighting For
    a[6859] = b:New(6859, 0, nil, nil, true); -- Realm First! Zen Master Alchemist
    O(a[6859], "Once");
    a[6860] = b:New(6860, 0, nil, nil, true); -- Realm First! Zen Master Blacksmith
    O(a[6860], "Once");
    a[6861] = b:New(6861, 0, nil, nil, true); -- Realm First! Zen Master Cook
    O(a[6861], "Once");
    a[6862] = b:New(6862, 0, nil, nil, true); -- Realm First! Zen Master Enchanter
    O(a[6862], "Once");
    a[6863] = b:New(6863, 0, nil, nil, true); -- Realm First! Zen Master Engineer
    O(a[6863], "Once");
    a[6864] = b:New(6864, 0, nil, nil, true); -- Realm First! Zen Master Medic
    O(a[6864], "Once");
    a[6865] = b:New(6865, 0, nil, nil, true); -- Realm First! Zen Master Angler
    O(a[6865], "Once");
    a[6866] = b:New(6866, 0, nil, nil, true); -- Realm First! Zen Master Herbalist
    O(a[6866], "Once");
    a[6867] = b:New(6867, 0, nil, nil, true); -- Realm First! Zen Master Scribe
    O(a[6867], "Once");
    a[6868] = b:New(6868, 0, nil, nil, true); -- Realm First! Zen Master Jewelcrafter
    O(a[6868], "Once");
    a[6869] = b:New(6869, 0, nil, nil, true); -- Realm First! Zen Master Leatherworker
    O(a[6869], "Once");
    a[6870] = b:New(6870, 0, nil, nil, true); -- Realm First! Zen Master Miner
    O(a[6870], "Once");
    a[6871] = b:New(6871, 0, nil, nil, true); -- Realm First! Zen Master Skinner
    O(a[6871], "Once");
    a[6872] = b:New(6872, 0, nil, nil, true); -- Realm First! Zen Master Tailor
    O(a[6872], "Once");
    a[6873] = b:New(6873, 0, nil, nil, true); -- Realm First! Zen Master Archaeologist
    O(a[6873], "Once");
    a[6874] = b:New(6874, 5, fac.Alliance, 7509); -- Scenaturday
    a[6882] = b:New(6882, 10); -- Temple of Kotmogu Veteran
    a[6883] = b:New(6883, 10); -- Silvershard Mines Veteran
    a[6884] = b:New(6884, 0); -- Temple of the Jade Serpent Challenger
    O(a[6884], "From", "Version", "050005", "Before", "Version", "060002");
    a[6885] = b:New(6885, 0); -- Temple of the Jade Serpent: Bronze
    O(a[6885], "From", "Version", "050005", "Before", "Version", "060002");
    a[6886] = b:New(6886, 0); -- Temple of the Jade Serpent: Silver
    O(a[6886], "From", "Version", "050005", "Before", "Version", "060002");
    a[6887] = b:New(6887, 0); -- Temple of the Jade Serpent: Gold
    O(a[6887], "From", "Version", "050005", "Before", "Version", "060002");
    a[6888] = b:New(6888, 0); -- Stormstout Brewery Challenger
    O(a[6888], "From", "Version", "050005", "Before", "Version", "060002");
    a[6889] = b:New(6889, 0); -- Stormstout Brewery: Bronze
    O(a[6889], "From", "Version", "050005", "Before", "Version", "060002");
    a[6890] = b:New(6890, 0); -- Stormstout Brewery: Silver
    O(a[6890], "From", "Version", "050005", "Before", "Version", "060002");
    a[6891] = b:New(6891, 0); -- Stormstout Brewery: Gold
    O(a[6891], "From", "Version", "050005", "Before", "Version", "060002");
    a[6892] = b:New(6892, 0); -- Mogu'shan Palace Challenger
    O(a[6892], "From", "Version", "050005", "Before", "Version", "060002");
    a[6893] = b:New(6893, 0); -- Shado-Pan Monastery Challenger
    O(a[6893], "From", "Version", "050005", "Before", "Version", "060002");
    a[6894] = b:New(6894, 0); -- Gate of the Setting Sun Challenger
    O(a[6894], "From", "Version", "050005", "Before", "Version", "060002");
    a[6895] = b:New(6895, 0); -- Scarlet Halls Challenger
    O(a[6895], "From", "Version", "050005", "Before", "Version", "060002");
    a[6896] = b:New(6896, 0); -- Scarlet Monastery Challenger
    O(a[6896], "From", "Version", "050005", "Before", "Version", "060002");
    a[6897] = b:New(6897, 0); -- Scholomance Challenger
    O(a[6897], "From", "Version", "050005", "Before", "Version", "060002");
    a[6898] = b:New(6898, 0); -- Siege of Niuzao Temple Challenger
    O(a[6898], "From", "Version", "050005", "Before", "Version", "060002");
    a[6899] = b:New(6899, 0); -- Mogu'shan Palace: Bronze
    O(a[6899], "From", "Version", "050005", "Before", "Version", "060002");
    a[6900] = b:New(6900, 0); -- Mogu'shan Palace: Silver
    O(a[6900], "From", "Version", "050005", "Before", "Version", "060002");
    a[6901] = b:New(6901, 0); -- Mogu'shan Palace: Gold
    O(a[6901], "From", "Version", "050005", "Before", "Version", "060002");
    a[6902] = b:New(6902, 0); -- Shado-Pan Monastery: Bronze
    O(a[6902], "From", "Version", "050005", "Before", "Version", "060002");
    a[6903] = b:New(6903, 0); -- Shado-Pan Monastery: Silver
    O(a[6903], "From", "Version", "050005", "Before", "Version", "060002");
    a[6904] = b:New(6904, 0); -- Shado-Pan Monastery: Gold
    O(a[6904], "From", "Version", "050005", "Before", "Version", "060002");
    a[6905] = b:New(6905, 0); -- Gate of the Setting Sun: Bronze
    O(a[6905], "From", "Version", "050005", "Before", "Version", "060002");
    a[6906] = b:New(6906, 0); -- Gate of the Setting Sun: Silver
    O(a[6906], "From", "Version", "050005", "Before", "Version", "060002");
    a[6907] = b:New(6907, 0); -- Gate of the Setting Sun: Gold
    O(a[6907], "From", "Version", "050005", "Before", "Version", "060002");
    a[6908] = b:New(6908, 0); -- Scarlet Halls: Bronze
    O(a[6908], "From", "Version", "050005", "Before", "Version", "060002");
    a[6909] = b:New(6909, 0); -- Scarlet Halls: Silver
    O(a[6909], "From", "Version", "050005", "Before", "Version", "060002");
    a[6910] = b:New(6910, 0); -- Scarlet Halls: Gold
    O(a[6910], "From", "Version", "050005", "Before", "Version", "060002");
    a[6911] = b:New(6911, 0); -- Scarlet Monastery: Bronze
    O(a[6911], "From", "Version", "050005", "Before", "Version", "060002");
    a[6912] = b:New(6912, 0); -- Scarlet Monastery: Silver
    O(a[6912], "From", "Version", "050005", "Before", "Version", "060002");
    a[6913] = b:New(6913, 0); -- Scarlet Monastery: Gold
    O(a[6913], "From", "Version", "050005", "Before", "Version", "060002");
    a[6914] = b:New(6914, 0); -- Scholomance: Bronze
    O(a[6914], "From", "Version", "050005", "Before", "Version", "060002");
    a[6915] = b:New(6915, 0); -- Scholomance: Silver
    O(a[6915], "From", "Version", "050005", "Before", "Version", "060002");
    a[6916] = b:New(6916, 0); -- Scholomance: Gold
    O(a[6916], "From", "Version", "050005", "Before", "Version", "060002");
    a[6917] = b:New(6917, 0); -- Siege of Niuzao Temple: Bronze
    O(a[6917], "From", "Version", "050005", "Before", "Version", "060002");
    a[6918] = b:New(6918, 0); -- Siege of Niuzao Temple: Silver
    O(a[6918], "From", "Version", "050005", "Before", "Version", "060002");
    a[6919] = b:New(6919, 0); -- Siege of Niuzao Temple: Gold
    O(a[6919], "From", "Version", "050005", "Before", "Version", "060002");
    a[6920] = b:New(6920, 0); -- Challenge Conqueror
    O(a[6920], "From", "Version", "050005", "Before", "Version", "060002");
    a[6922] = b:New(6922, 10); -- Timing is Everything
    a[6923] = b:New(6923, 10); -- Brewmoon Festival
    a[6924] = b:New(6924, 0); -- "100,000 Valor Points"
    O(a[6924]);
    a[6925] = b:New(6925, 20); -- Pandaria Dungeon Hero
    a[6926] = b:New(6926, 10); -- Tranquil Master
    a[6927] = b:New(6927, 25); -- Glory of the Pandaria Hero
    a[6928] = b:New(6928, 10); -- Burning Man
    a[6929] = b:New(6929, 10); -- And Stay Dead!
    a[6930] = b:New(6930, 10); -- Yaungolian Barbecue
    a[6931] = b:New(6931, 10); -- Binan Village All-Star
    a[6932] = b:New(6932, 25); -- Glory of the Pandaria Raider
    a[6933] = b:New(6933, 10); -- Who's Got Two Green Thumbs?
    a[6936] = b:New(6936, 10); -- Candle in the Wind
    a[6937] = b:New(6937, 10); -- Overzealous
    a[6938] = b:New(6938, 0); -- Cataclysmic Gladiator
    O(a[6938], "From", "PvP Season", 11, "Until", "PvP Season", 11);
    a[6939] = b:New(6939, 0, fac.Alliance, 6940); -- Hero of the Alliance: Cataclysmic
    O(a[6939], "From", "PvP Season", 11, "Until", "PvP Season", 11);
    a[6940] = b:New(6940, 0, fac.Horde, 6939); -- Hero of the Horde: Cataclysmic
    O(a[6940], "From", "PvP Season", 11, "Until", "PvP Season", 11);
    a[6941] = b:New(6941, 10, fac.Horde, 6942); -- Hero of the Horde
    a[6942] = b:New(6942, 10, fac.Alliance, 6941); -- Hero of the Alliance
    a[6943] = b:New(6943, 10); -- Queuing Spree
    a[6945] = b:New(6945, 10); -- Mantid Swarm
    a[6946] = b:New(6946, 10); -- Empowered Spiritualist
    a[6947] = b:New(6947, 10); -- Four Square
    a[6950] = b:New(6950, 10); -- Powerball
    a[6954] = b:New(6954, 0); -- Ahead of the Curve: Will of the Emperor
    O(a[6954], "From", "Version", "050004", "Before", "Version", "050200");
    a[6969] = b:New(6969, 10); -- Explore Valley of the Four Winds
    a[6970] = b:New(6970, 10); -- Blackout
    a[6971] = b:New(6971, 10); -- I've Got the Power
    a[6972] = b:New(6972, 10); -- What is Best in Life?
    a[6973] = b:New(6973, 10); -- Can't Stop Won't Stop
    a[6974] = b:New(6974, 25); -- Pandaria Explorer
    a[6975] = b:New(6975, 10); -- Explore Krasarang Wilds
    a[6976] = b:New(6976, 10); -- Explore Kun-Lai Summit
    a[6977] = b:New(6977, 10); -- Explore Townlong Steppes
    a[6978] = b:New(6978, 10); -- Explore Dread Wastes
    a[6979] = b:New(6979, 10); -- Explore Vale of Eternal Blossoms
    a[6980] = b:New(6980, 10); -- Temple of Kotmogu All-Star
    a[6981] = b:New(6981, 10); -- Master of Temple of Kotmogu
    a[7039] = b:New(7039, 10); -- The Long Riders
    a[7049] = b:New(7049, 10); -- Mine Cart Courier
    a[7056] = b:New(7056, 10); -- "Sorry, Were You Looking for This?"
    a[7057] = b:New(7057, 10); -- End of the Line
    a[7062] = b:New(7062, 10); -- Mine Mine Mine!
    a[7099] = b:New(7099, 10); -- Five for Five
    a[7100] = b:New(7100, 10); -- My Diamonds and Your Rust
    a[7102] = b:New(7102, 10); -- Escort Service
    a[7103] = b:New(7103, 10); -- Greed is Good
    a[7106] = b:New(7106, 10); -- Master of Silvershard Mines
    a[7230] = b:New(7230, 10); -- Legend of the Brewfathers
    a[7231] = b:New(7231, 10); -- Spill No Evil
    a[7232] = b:New(7232, 10); -- The Keg Runner
    a[7239] = b:New(7239, 10); -- Monkey in the Middle
    a[7248] = b:New(7248, 10); -- "Monkey See, Monkey Kill"
    a[7249] = b:New(7249, 10); -- Unga Ingoo
    a[7252] = b:New(7252, 10); -- A Brewing Storm
    a[7257] = b:New(7257, 10); -- Don't Shake the Keg
    a[7258] = b:New(7258, 10); -- Party of Six
    a[7261] = b:New(7261, 10); -- The Perfect Pour
    a[7265] = b:New(7265, 10); -- Greenstone Village
    a[7266] = b:New(7266, 10); -- Save it for Later
    a[7267] = b:New(7267, 10); -- Perfect Delivery
    a[7268] = b:New(7268, 10, nil, nil, nil, false); -- The Temple of Kotmogu
    O(a[7268], "Never");
    a[7269] = b:New(7269, 10, nil, nil, nil, false); -- Stay Off the Grass
    O(a[7269], "Never");
    a[7270] = b:New(7270, 10, nil, nil, nil, false); -- For Display Only
    O(a[7270], "Never");
    a[7271] = b:New(7271, 10); -- Arena of Annihilation
    a[7272] = b:New(7272, 10); -- In the Eye of the Tiger
    a[7273] = b:New(7273, 10); -- Beat the Heat
    a[7274] = b:New(7274, 10); -- Learning from the Best
    a[7275] = b:New(7275, 10); -- It's a Trap!
    a[7276] = b:New(7276, 10); -- Fancy Footwork
    a[7281] = b:New(7281, 10); -- Lost and Found
    a[7282] = b:New(7282, 10); -- Finders Keepers
    a[7283] = b:New(7283, 10); -- One Man's Trash...
    a[7284] = b:New(7284, 10); -- Is Another Man's Treasure
    a[7285] = b:New(7285, 10); -- Every Day I'm Pand-a-ren
    a[7286] = b:New(7286, 10); -- Finish Them!
    a[7287] = b:New(7287, 10); -- Champion of Chi-Ji
    a[7288] = b:New(7288, 10); -- Yak Attack
    a[7289] = b:New(7289, 10); -- Shadow Hopper
    a[7290] = b:New(7290, 10); -- How To Strain Your Dragon
    a[7291] = b:New(7291, 10); -- In a Trail of Smoke
    a[7292] = b:New(7292, 10); -- Green Acres
    a[7293] = b:New(7293, 10); -- Till the Break of Dawn
    a[7294] = b:New(7294, 10); -- A Taste of Things to Come
    a[7295] = b:New(7295, 10); -- Listen to the Drunk Fish
    a[7296] = b:New(7296, 10); -- Ain't Lost No More
    a[7297] = b:New(7297, 10); -- Proven Strength
    a[7298] = b:New(7298, 10); -- Getting Around with the Shado-Pan
    a[7299] = b:New(7299, 10); -- Loner and a Rebel
    a[7300] = b:New(7300, 10); -- Master of the Grill
    a[7301] = b:New(7301, 10); -- Master of the Wok
    a[7302] = b:New(7302, 10); -- Master of the Pot
    a[7303] = b:New(7303, 10); -- Master of the Steamer
    a[7304] = b:New(7304, 10); -- Master of the Oven
    a[7305] = b:New(7305, 10); -- Master of the Brew
    a[7306] = b:New(7306, 10); -- Master of Pandaren Cooking
    a[7307] = b:New(7307, 10); -- Silent Assassin
    a[7308] = b:New(7308, 10); -- Know Your Role
    a[7309] = b:New(7309, 10); -- Fire in the Yaung-hole!
    a[7310] = b:New(7310, 10); -- Defender of Gods
    a[7312] = b:New(7312, 10); -- Amber is the Color of My Energy
    a[7313] = b:New(7313, 10); -- Stay Klaxxi
    a[7314] = b:New(7314, 10); -- Test Drive
    a[7315] = b:New(7315, 0); -- Eternally in the Vale
    O(a[7315]);
    a[7316] = b:New(7316, 10); -- Over Their Heads
    a[7317] = b:New(7317, 10); -- One Many Army
    a[7318] = b:New(7318, 10); -- A Taste of History
    a[7319] = b:New(7319, 10); -- Ready for Raiding III
    a[7320] = b:New(7320, 10); -- Dog Pile
    a[7321] = b:New(7321, 10); -- Spreading the Warmth
    a[7322] = b:New(7322, 10); -- Roll Club
    a[7323] = b:New(7323, 10); -- Collateral Damage
    a[7324] = b:New(7324, 10); -- One Step at a Time
    a[7325] = b:New(7325, 10); -- Now I Am the Master
    a[7326] = b:New(7326, 10); -- The Pandaren Gourmet
    a[7327] = b:New(7327, 10); -- The Pandaren Gourmet
    a[7328] = b:New(7328, 10); -- Ironpaw Chef
    a[7329] = b:New(7329, 10); -- Pandaren Cuisine
    a[7330] = b:New(7330, 10); -- Pandaren Delicacies
    a[7331] = b:New(7331, 10); -- The Three Brew Fathers
    a[7332] = b:New(7332, 10); -- The Broken Hearted
    a[7333] = b:New(7333, 10); -- The Four Celestials
    a[7334] = b:New(7334, 10); -- Instruments of Cruelty
    a[7335] = b:New(7335, 10); -- Symbols of Strength
    a[7336] = b:New(7336, 10); -- Stone Servants
    a[7337] = b:New(7337, 10); -- Documents of a Dark History
    a[7338] = b:New(7338, 10); -- Collector: Pandaren Tea Sets
    a[7339] = b:New(7339, 10); -- Collector: Pandaren Game Boards
    a[7340] = b:New(7340, 10); -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    a[7341] = b:New(7341, 10); -- Collector: Walking Canes of Brewfather Ren Yun
    a[7342] = b:New(7342, 10); -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    a[7343] = b:New(7343, 10); -- Collector: Carved Bronze Mirrors
    a[7344] = b:New(7344, 10); -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    a[7345] = b:New(7345, 10); -- Collector: Apothecary Tins
    a[7346] = b:New(7346, 10); -- Collector: Pearls of Yu'lon
    a[7347] = b:New(7347, 10); -- Collector: Standards of Niuzao
    a[7348] = b:New(7348, 10); -- Collector: Manacles of Rebellion
    a[7349] = b:New(7349, 10); -- Collector: Cracked Mogu Runestones
    a[7350] = b:New(7350, 10); -- Collector: Terracotta Arms
    a[7351] = b:New(7351, 10); -- Collector: Petrified Bone Whips
    a[7352] = b:New(7352, 10); -- Collector: Thunder King Insignias
    a[7353] = b:New(7353, 10); -- Collector: Edicts of the Thunder King
    a[7354] = b:New(7354, 10); -- Collector: Iron Amulets
    a[7355] = b:New(7355, 10); -- Collector: Warlord's Branding Irons
    a[7356] = b:New(7356, 10); -- Collector: Mogu Coins
    a[7357] = b:New(7357, 10); -- Collector: Worn Monument Ledgers
    a[7358] = b:New(7358, 10); -- Collector: Pandaren Tea Sets
    a[7359] = b:New(7359, 10); -- Collector: Pandaren Game Boards
    a[7360] = b:New(7360, 10); -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    a[7361] = b:New(7361, 10); -- Collector: Walking Canes of Brewfather Ren Yun
    a[7362] = b:New(7362, 10); -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    a[7363] = b:New(7363, 10); -- Collector: Carved Bronze Mirrors
    a[7364] = b:New(7364, 10); -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    a[7365] = b:New(7365, 10); -- Collector: Apothecary Tins
    a[7366] = b:New(7366, 10); -- Collector: Pearls of Yu'lon
    a[7367] = b:New(7367, 10); -- Collector: Standards of Niuzao
    a[7368] = b:New(7368, 10); -- Collector: Manacles of Rebellion
    a[7369] = b:New(7369, 10); -- Collector: Cracked Mogu Runestones
    a[7370] = b:New(7370, 10); -- Collector: Terracotta Arms
    a[7371] = b:New(7371, 10); -- Collector: Petrified Bone Whips
    a[7372] = b:New(7372, 10); -- Collector: Thunder King Insignias
    a[7373] = b:New(7373, 10); -- Collector: Edicts of the Thunder King
    a[7374] = b:New(7374, 10); -- Collector: Iron Amulets
    a[7375] = b:New(7375, 10); -- Collector: Warlord's Branding Irons
    a[7376] = b:New(7376, 10); -- Collector: Mogu Coins
    a[7377] = b:New(7377, 10); -- Collector: Worn Monument Ledgers
    a[7378] = b:New(7378, 25); -- Jack of All Trades
    a[7379] = b:New(7379, 50); -- Pandaren Master of All
    a[7380] = b:New(7380, 25); -- Double Agent
    a[7381] = b:New(7381, 10); -- Restore Balance
    a[7382] = b:New(7382, 20); -- Dynamic Duo
    a[7383] = b:New(7383, 30); -- Terrific Trio
    a[7384] = b:New(7384, 50); -- Quintessential Quintet
    a[7385] = b:New(7385, 10); -- Pub Crawl
    a[7386] = b:New(7386, 10); -- Grand Expedition Yak
    a[7410] = b:New(7410, 10); -- 5000 Daily Quests Completed
    a[7411] = b:New(7411, 10); -- 10000 Daily Quests Completed
    a[7412] = b:New(7412, 0); -- Collector's Edition: Fetish Shaman
    a[7413] = b:New(7413, 10); -- Scarlet Halls
    a[7433] = b:New(7433, 5); -- Newbie
    a[7436] = b:New(7436, 10); -- Zen Pet Hunter
    a[7437] = b:New(7437, 10); -- A Worthy Opponent
    a[7438] = b:New(7438, 10); -- Could We Find More Like That?
    a[7439] = b:New(7439, 30); -- Glorious!
    a[7462] = b:New(7462, 5); -- A Rare Catch
    a[7463] = b:New(7463, 5); -- Lots of Rarity
    a[7464] = b:New(7464, 10); -- Quality & Quantity
    a[7465] = b:New(7465, 5); -- An Uncommon Find
    a[7467] = b:New(7467, 0, fac.Alliance, 7468); -- Theramore's Fall
    O(a[7467]);
    a[7468] = b:New(7468, 0, fac.Horde, 7467); -- Theramore's Fall
    O(a[7468]);
    a[7479] = b:New(7479, 10); -- The Shado-Master
    a[7482] = b:New(7482, 5); -- Trainer Extraordinaire
    a[7483] = b:New(7483, 5); -- Battle Master
    a[7485] = b:New(7485, 0); -- Cutting Edge: Will of the Emperor
    O(a[7485], "From", "Version", "050004", "Before", "Version", "050200");
    a[7486] = b:New(7486, 0); -- Cutting Edge: Grand Empress Shek'zeer
    O(a[7486], "From", "Version", "050004", "Before", "Version", "050200");
    a[7487] = b:New(7487, 0); -- Cutting Edge: Sha of Fear
    O(a[7487], "From", "Version", "050004", "Before", "Version", "050200");
    a[7498] = b:New(7498, 5); -- Taming the Great Outdoors
    a[7499] = b:New(7499, 10); -- Taming the World
    a[7500] = b:New(7500, 10); -- Going to Need More Leashes
    a[7501] = b:New(7501, 10); -- That's a Lot of Pet Food
    a[7502] = b:New(7502, 10); -- Savior of Stoneplow
    a[7509] = b:New(7509, 5, fac.Horde, 6874); -- Scenaturday
    a[7518] = b:New(7518, 10); -- "Wanderers, Dreamers, and You"
    a[7520] = b:New(7520, 10); -- The Loremaster
    a[7521] = b:New(7521, 10); -- Time to Open a Pet Store
    a[7522] = b:New(7522, 10); -- Crypt of Forgotten Kings
    a[7523] = b:New(7523, 10, fac.Alliance, 7524); -- Theramore's Fall
    a[7524] = b:New(7524, 10, fac.Horde, 7523); -- Theramore's Fall
    a[7525] = b:New(7525, 5); -- Taming Cataclysm
    a[7526] = b:New(7526, 10, fac.Alliance, 7529); -- Kite Fight
    a[7527] = b:New(7527, 10, fac.Alliance, 7530); -- No Tank You
    a[7529] = b:New(7529, 10, fac.Horde, 7526); -- Kite Fight
    a[7530] = b:New(7530, 10, fac.Horde, 7527); -- No Tank You
    a[7533] = b:New(7533, 0); -- Chapter I: Trial of the Black Prince
    O(a[7533], "From", "Version", "050005", "Before", "Version", "060002");
    a[7534] = b:New(7534, 0, fac.Alliance, 8008); -- Chapter II: Wrathion's War
    O(a[7534], "From", "Version", "050100", "Before", "Version", "060002");
    a[7535] = b:New(7535, 0); -- Chapter III: Two Princes
    O(a[7535], "From", "Version", "050200", "Before", "Version", "060002");
    a[7536] = b:New(7536, 0); -- Chapter IV: Celestial Blessings
    O(a[7536], "From", "Version", "050300", "Before", "Version", "060002");
    a[7601] = b:New(7601, 10, fac.Alliance, 7602); -- Tricks and Treats of Pandaria
    a[7602] = b:New(7602, 10, fac.Horde, 7601); -- Tricks and Treats of Pandaria
    a[7611] = b:New(7611, 10); -- Pandarian Angler
    a[7612] = b:New(7612, 10); -- The Seat of Knowledge
    a[7614] = b:New(7614, 10); -- Locking Down the Docks
    a[7842] = b:New(7842, 0); -- Collector's Edition: Baneling
    a[7852] = b:New(7852, 0); -- They're Both Footballs?
    a[7853] = b:New(7853, 0); -- WoW's 9th Anniversary
    O(a[7853]);
    a[7860] = b:New(7860, 10, fac.Alliance, 7862); -- We're Going to Need More Saddles
    a[7862] = b:New(7862, 10, fac.Horde, 7860); -- We're Going to Need More Saddles
    a[7908] = b:New(7908, 5); -- I Choose You
    a[7928] = b:New(7928, 10, fac.Alliance, 7929); -- Operation: Shieldwall Campaign
    a[7929] = b:New(7929, 10, fac.Horde, 7928); -- Dominance Offensive Campaign
    a[7932] = b:New(7932, 10); -- "I'm In Your Base, Killing Your Dudes"
    a[7933] = b:New(7933, 10); -- And... It's Good!
    a[7934] = b:New(7934, 10); -- Raiding with Leashes
    a[7936] = b:New(7936, 5); -- Pandaren Spirit Tamer
    a[7937] = b:New(7937, 0, fac.Alliance, 8020); -- You Are Not Your $#*@! Legplates (Season 1)
    O(a[7937], "From", "Version", "050100", "Before", "Version", "060002");
    a[7939] = b:New(7939, 0, fac.Horde, 7940); -- The Second Rule of Brawler's Guild (Season 1)
    O(a[7939], "From", "Version", "050100", "Before", "Version", "060002");
    a[7940] = b:New(7940, 0, fac.Alliance, 7939); -- The Second Rule of Brawler's Guild (Season 1)
    O(a[7940], "From", "Version", "050100", "Before", "Version", "060002");
    a[7941] = b:New(7941, 0, fac.Alliance, 7942); -- Brawlin' and Shot Callin' (Season 1)
    O(a[7941], "From", "Version", "050100", "Before", "Version", "060002");
    a[7942] = b:New(7942, 0, fac.Horde, 7941); -- Brawlin' and Shot Callin' (Season 1)
    O(a[7942], "From", "Version", "050100", "Before", "Version", "060002");
    a[7943] = b:New(7943, 0); -- I'm Your Number One Fan (Season 2)
    O(a[7943], "From", "Version", "060003", "Before", "Version", "070003");
    a[7944] = b:New(7944, 0); -- Bottle Service (Season 2)
    O(a[7944], "From", "Version", "060003", "Before", "Version", "070003");
    a[7945] = b:New(7945, 0); -- Haters Gonna Hate (Season 2)
    O(a[7945], "From", "Version", "060003", "Before", "Version", "070003");
    a[7946] = b:New(7946, 0, fac.Alliance, 8022); -- Now You're Just Showing Off (Season 1)
    O(a[7946], "From", "Version", "050100", "Before", "Version", "060002");
    a[7947] = b:New(7947, 0, fac.Alliance, 7948); -- The First Rule of Brawler's Guild (Season 1 or 2)
    O(a[7947], "From", "Version", "050100", "Before", "Version", "060002");
    a[7948] = b:New(7948, 0, fac.Horde, 7947); -- The First Rule of Brawler's Guild (Season 1 or 2)
    O(a[7948], "From", "Version", "050100", "Before", "Version", "060002");
    a[7949] = b:New(7949, 0, fac.Alliance, 7950); -- Rabble Rabble Rabble (Season 2)
    O(a[7949], "From", "Version", "060003", "Before", "Version", "070003");
    a[7950] = b:New(7950, 0, fac.Horde, 7949); -- Rabble Rabble Rabble (Season 2)
    O(a[7950], "From", "Version", "060003", "Before", "Version", "070003");
    a[7984] = b:New(7984, 10); -- Watery Grave
    a[7986] = b:New(7986, 10); -- You Mean That Wasn't a Void Zone?
    a[7987] = b:New(7987, 10); -- No Egg Left Behind
    a[7988] = b:New(7988, 10); -- A Little Patience
    a[7989] = b:New(7989, 10); -- Bubbletrapped!
    a[7990] = b:New(7990, 10); -- Cannonballer
    a[7991] = b:New(7991, 10); -- Which Came First?
    a[7992] = b:New(7992, 10); -- I Used To Love Them
    a[7993] = b:New(7993, 10); -- We've Been Dancin'
    a[7994] = b:New(7994, 10); -- Treasure of Pandaria
    a[7995] = b:New(7995, 10); -- Fortune of Pandaria
    a[7996] = b:New(7996, 10); -- Bounty of Pandaria
    a[7997] = b:New(7997, 10); -- Riches of Pandaria
    a[8008] = b:New(8008, 0, fac.Horde, 7534); -- Chapter II: Wrathion's War
    O(a[8008], "From", "Version", "050100", "Before", "Version", "060002");
    a[8009] = b:New(8009, 10); -- Dagger in the Dark
    a[8010] = b:New(8010, 10, fac.Alliance, 8013); -- Lion's Landing
    a[8011] = b:New(8011, 10, fac.Alliance, 8014); -- Number Five Is Alive
    a[8012] = b:New(8012, 10, fac.Alliance, 8015); -- "Waste Not, Want Not"
    a[8013] = b:New(8013, 10, fac.Horde, 8010); -- Domination Point
    a[8014] = b:New(8014, 10, fac.Horde, 8011); -- Number Five Is Alive
    a[8015] = b:New(8015, 10, fac.Horde, 8012); -- "Waste Not, Want Not"
    a[8016] = b:New(8016, 10); -- Assault on Zan'vess
    a[8017] = b:New(8017, 10); -- For the Swarm
    a[8020] = b:New(8020, 0, fac.Horde, 7937); -- You Are Not Your $#*@! Legplates (Season 1)
    O(a[8020], "From", "Version", "050100", "Before", "Version", "060002");
    a[8022] = b:New(8022, 0, fac.Horde, 7946); -- Now You're Just Showing Off (Season 1)
    O(a[8022], "From", "Version", "050100", "Before", "Version", "060002");
    a[8023] = b:New(8023, 10); -- Wakener
    a[8028] = b:New(8028, 10); -- Praise the Sun!
    a[8030] = b:New(8030, 0, fac.Alliance, 8031); -- A Test of Valor
    O(a[8030], "From", "Version", "050100", "Before", "Version", "060002");
    a[8031] = b:New(8031, 0, fac.Horde, 8030); -- A Test of Valor
    O(a[8031], "From", "Version", "050100", "Before", "Version", "060002");
    a[8037] = b:New(8037, 10); -- Genetically Unmodified Organism
    a[8038] = b:New(8038, 10); -- Cretaceous Collector
    a[8042] = b:New(8042, 10, fac.Alliance, 8043); -- Extinguishing Pandaria
    a[8043] = b:New(8043, 10, fac.Horde, 8042); -- Extinguishing Pandaria
    a[8044] = b:New(8044, 10, fac.Horde, 8045); -- Flame Keeper of Pandaria
    a[8045] = b:New(8045, 10, fac.Alliance, 8044); -- Flame Warden of Pandaria
    a[8049] = b:New(8049, 10); -- The Zandalari Prophecy
    a[8050] = b:New(8050, 10); -- Rumbles of Thunder
    a[8051] = b:New(8051, 10); -- Gods and Monsters
    a[8052] = b:New(8052, 50, fac.Alliance, 8055); -- Khan
    a[8055] = b:New(8055, 50, fac.Horde, 8052); -- Khan
    a[8056] = b:New(8056, 10); -- Heroic: Jin'rokh the Breaker
    a[8057] = b:New(8057, 10); -- Heroic: Horridon
    a[8058] = b:New(8058, 10); -- Heroic: Council of Elders
    a[8059] = b:New(8059, 10); -- Heroic: Tortos
    a[8060] = b:New(8060, 10); -- Heroic: Megaera
    a[8061] = b:New(8061, 10); -- Heroic: Ji-Kun
    a[8062] = b:New(8062, 10); -- Heroic: Durumu the Forgotten
    a[8063] = b:New(8063, 10); -- Heroic: Primordius
    a[8064] = b:New(8064, 10); -- Heroic: Dark Animus
    a[8065] = b:New(8065, 10); -- Heroic: Iron Qon
    a[8066] = b:New(8066, 10); -- Heroic: Twin Empyreans
    a[8067] = b:New(8067, 10); -- Heroic: Lei Shen
    a[8068] = b:New(8068, 10); -- Heroic: Ra-den
    a[8069] = b:New(8069, 10); -- Last Stand of the Zandalari
    a[8070] = b:New(8070, 10); -- Forgotten Depths
    a[8071] = b:New(8071, 10); -- Halls of Flesh-Shaping
    a[8072] = b:New(8072, 10); -- Pinnacle of Storms
    a[8073] = b:New(8073, 10); -- Cage Match
    a[8077] = b:New(8077, 10); -- One-Up
    a[8078] = b:New(8078, 10); -- Zul'Again
    a[8080] = b:New(8080, 5); -- Fabled Pandaren Tamer
    a[8081] = b:New(8081, 10); -- Ritualist Who?
    a[8082] = b:New(8082, 10); -- Head Case
    a[8086] = b:New(8086, 10); -- From Dusk 'til Dawn
    a[8087] = b:New(8087, 10); -- Can't Touch This
    a[8089] = b:New(8089, 0); -- I Thought He Was Supposed to Be Hard?
    O(a[8089], "From", "Version", "050200", "Before", "Version", "060002");
    a[8090] = b:New(8090, 10); -- A Complete Circuit
    a[8092] = b:New(8092, 0); -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    a[8093] = b:New(8093, 0, fac.Horde, 8218); -- Tyrannical Conquest
    O(a[8093], "From", "PvP Season", 13, "Until", "PvP Season", 13);
    a[8094] = b:New(8094, 10); -- Lightning Overload
    a[8097] = b:New(8097, 10); -- Soft Hands
    a[8098] = b:New(8098, 10); -- You Said Crossing the Streams Was Bad
    a[8099] = b:New(8099, 10); -- Isle of Thunder
    a[8100] = b:New(8100, 10); -- Pay to Slay
    a[8101] = b:New(8101, 10); -- It Was Worth Every Ritual Stone
    a[8103] = b:New(8103, 10); -- Champions of Lei Shen
    a[8104] = b:New(8104, 10); -- Thunder Plunder
    a[8105] = b:New(8105, 10); -- The Crumble Bundle
    a[8106] = b:New(8106, 0); -- In the Hall of the Thunder King
    O(a[8106]);
    a[8107] = b:New(8107, 10); -- Ready for RAAAAIIIIDDD?!?ing
    a[8108] = b:New(8108, 10); -- "When in Ihgaluk, Do as the Skumblade Do"
    a[8109] = b:New(8109, 10); -- The Mogu Below-gu
    a[8110] = b:New(8110, 10); -- These Mogu Have Gotta Go-gu
    a[8111] = b:New(8111, 10); -- This Isn't Even My Final Form
    a[8112] = b:New(8112, 10); -- Blue Response
    a[8114] = b:New(8114, 10); -- Platform Hero
    a[8115] = b:New(8115, 10); -- Speed Metal
    a[8116] = b:New(8116, 10); -- You Made Me Bleed My Own Blood
    a[8117] = b:New(8117, 10); -- For the Ward!
    a[8118] = b:New(8118, 10); -- Boop
    a[8119] = b:New(8119, 10); -- Our Powers Combined
    a[8120] = b:New(8120, 10); -- Direhorn in a China Shop
    a[8121] = b:New(8121, 10); -- Stormbreaker
    a[8123] = b:New(8123, 10); -- Millions of Years of Evolution vs. My Fist
    a[8124] = b:New(8124, 25); -- Glory of the Thundering Raider
    a[8205] = b:New(8205, 10, fac.Alliance, 8206); -- Operation: Shieldwall
    a[8206] = b:New(8206, 10, fac.Horde, 8205); -- Dominance Offensive
    a[8208] = b:New(8208, 10, fac.Alliance, 8209); -- Kirin Tor Offensive
    a[8209] = b:New(8209, 10, fac.Horde, 8208); -- Sunreaver Onslaught
    a[8210] = b:New(8210, 10); -- Shado-Pan Assault
    a[8212] = b:New(8212, 10); -- Zandalari Library Card
    a[8213] = b:New(8213, 0); -- Friends In Places Higher Yet
    O(a[8213]);
    a[8214] = b:New(8214, 0); -- Malevolent Gladiator
    O(a[8214], "From", "PvP Season", 12, "Until", "PvP Season", 12);
    a[8216] = b:New(8216, 0); -- Malevolent Gladiator's Cloud Serpent
    O(a[8216], "From", "PvP Season", 12, "Until", "PvP Season", 12);
    a[8218] = b:New(8218, 0, fac.Alliance, 8093); -- Tyrannical Conquest
    O(a[8218], "From", "PvP Season", 13, "Until", "PvP Season", 13);
    a[8219] = b:New(8219, 10); -- History of the Mantid
    a[8220] = b:New(8220, 10); -- Collector: Banners of the Mantid Empire
    a[8221] = b:New(8221, 10); -- Collector: Banners of the Mantid Empire
    a[8222] = b:New(8222, 10); -- Collector: Ancient Sap Feeders
    a[8223] = b:New(8223, 10); -- Collector: Ancient Sap Feeders
    a[8224] = b:New(8224, 10); -- Collector: Praying Mantids
    a[8225] = b:New(8225, 10); -- Collector: Praying Mantids
    a[8226] = b:New(8226, 10); -- Collector: Inert Sound Beacons
    a[8227] = b:New(8227, 10); -- Collector: Inert Sound Beacons
    a[8228] = b:New(8228, 10); -- Collector: Remains of Paragons
    a[8229] = b:New(8229, 10); -- Collector: Remains of Paragons
    a[8230] = b:New(8230, 10); -- Collector: Mantid Lamps
    a[8231] = b:New(8231, 10); -- Collector: Mantid Lamps
    a[8232] = b:New(8232, 10); -- Collector: Pollen Collectors
    a[8233] = b:New(8233, 10); -- Collector: Pollen Collectors
    a[8234] = b:New(8234, 10); -- Collector: Kypari Sap Containers
    a[8235] = b:New(8235, 10); -- Collector: Kypari Sap Containers
    a[8238] = b:New(8238, 0); -- Cutting Edge: Lei Shen
    O(a[8238], "From", "Version", "050200", "Before", "Version", "050400");
    a[8243] = b:New(8243, 0, fac.Alliance, 8244); -- Hero of the Alliance: Malevolent
    O(a[8243], "From", "PvP Season", 12, "Until", "PvP Season", 12);
    a[8244] = b:New(8244, 0, fac.Horde, 8243); -- Hero of the Horde: Malevolent
    O(a[8244], "From", "PvP Season", 12, "Until", "PvP Season", 12);
    a[8246] = b:New(8246, 0); -- Ahead of the Curve: Grand Empress Shek'zeer
    O(a[8246], "From", "Version", "050004", "Before", "Version", "050200");
    a[8248] = b:New(8248, 0); -- Ahead of the Curve: Sha of Fear
    O(a[8248], "From", "Version", "050004", "Before", "Version", "050200");
    a[8249] = b:New(8249, 0); -- Ahead of the Curve: Lei Shen
    O(a[8249], "From", "Version", "050200", "Before", "Version", "050400");
    a[8260] = b:New(8260, 0); -- Cutting Edge: Ra-den
    O(a[8260], "From", "Version", "050200", "Before", "Version", "050400");
    a[8293] = b:New(8293, 10); -- Raiding with Leashes II: Attunement Edition
    a[8294] = b:New(8294, 10); -- The Secrets of Ragefire
    a[8295] = b:New(8295, 10); -- "The Few, the Proud, the Gob Squad"
    a[8297] = b:New(8297, 10); -- Merciless Pet Brawler
    a[8298] = b:New(8298, 10); -- Vengeful Pet Brawler
    a[8300] = b:New(8300, 10); -- Brutal Pet Brawler
    a[8301] = b:New(8301, 10); -- Deadly Pet Brawler
    a[8302] = b:New(8302, 10, fac.Horde, 8304); -- Mount Parade
    a[8304] = b:New(8304, 10, fac.Alliance, 8302); -- Mount Parade
    a[8306] = b:New(8306, 0, fac.Alliance, 8307); -- Hordebreaker
    O(a[8306], "From", "Version", "050300", "Before", "Version", "050400");
    a[8307] = b:New(8307, 0, fac.Horde, 8306); -- Darkspear Revolutionary
    O(a[8307], "From", "Version", "050300", "Before", "Version", "050400");
    a[8310] = b:New(8310, 10); -- Heroic: A Brewing Storm
    a[8311] = b:New(8311, 10); -- Heroic: Crypt of Forgotten Kings
    a[8312] = b:New(8312, 10); -- Heroic: Blood in the Snow
    a[8314] = b:New(8314, 10, fac.Alliance, 8315); -- Battle on the High Seas
    a[8315] = b:New(8315, 10, fac.Horde, 8314); -- Battle on the High Seas
    a[8316] = b:New(8316, 10); -- Blood in the Snow
    a[8317] = b:New(8317, 10); -- Dark Heart of Pandaria
    a[8318] = b:New(8318, 10); -- Heroic: Dark Heart of Pandaria
    a[8319] = b:New(8319, 10); -- Accelerated Archaeology
    a[8325] = b:New(8325, 0); -- Chapter V: Judgment of the Black Prince
    O(a[8325], "From", "Version", "050400", "Before", "Version", "060002");
    a[8327] = b:New(8327, 10); -- Heroic: The Secrets of Ragefire
    a[8329] = b:New(8329, 10); -- Heed the Weed
    a[8330] = b:New(8330, 10); -- Hekima's Heal-Halter
    a[8331] = b:New(8331, 10); -- Deepwind Gorge Victory
    a[8332] = b:New(8332, 10); -- Deepwind Gorge Veteran
    a[8333] = b:New(8333, 20); -- Deepwind Gorge Perfection
    a[8335] = b:New(8335, 0, fac.Alliance, 8337); -- Having a Brawl (Season 1)
    O(a[8335], "From", "Version", "050100", "Before", "Version", "060002");
    a[8336] = b:New(8336, 0, fac.Alliance, 8338); -- I've Got the Biggest Brawls of Them All (Season 1)
    O(a[8336], "From", "Version", "050100", "Before", "Version", "060002");
    a[8337] = b:New(8337, 0, fac.Horde, 8335); -- Having a Brawl (Season 1)
    O(a[8337], "From", "Version", "050100", "Before", "Version", "060002");
    a[8338] = b:New(8338, 0, fac.Horde, 8336); -- I've Got the Biggest Brawls of Them All (Season 1)
    O(a[8338], "From", "Version", "050100", "Before", "Version", "060002");
    a[8339] = b:New(8339, 0, fac.Alliance, 8342); -- Collect Your Deck (Season 2)
    O(a[8339], "From", "Version", "060003", "Before", "Version", "070003");
    a[8340] = b:New(8340, 0, fac.Alliance, 8343); -- Deck Your Collection (Season 1)
    O(a[8340], "From", "Version", "050100", "Before", "Version", "060002");
    a[8342] = b:New(8342, 0, fac.Horde, 8339); -- Collect Your Deck (Season 2)
    O(a[8342], "From", "Version", "060003", "Before", "Version", "070003");
    a[8343] = b:New(8343, 0, fac.Horde, 8340); -- Deck Your Collection (Season 1)
    O(a[8343], "From", "Version", "050100", "Before", "Version", "060002");
    a[8345] = b:New(8345, 0); -- Hearthstoned
    a[8347] = b:New(8347, 10); -- Keep those Bombs Away! (From Me)
    a[8348] = b:New(8348, 10); -- The Longest Day
    a[8350] = b:New(8350, 0); -- Mine! Mine! Mine!
    O(a[8350], "From", "Version", "050300", "Before", "Version", "080300");
    a[8351] = b:New(8351, 0); -- Other People's Property
    O(a[8351], "From", "Version", "050300", "Before", "Version", "080300");
    a[8354] = b:New(8354, 0); -- Puddle Jumper
    O(a[8354], "From", "Version", "050300", "Before", "Version", "080300");
    a[8355] = b:New(8355, 0); -- Weighed Down
    O(a[8355], "From", "Version", "050300", "Before", "Version", "080300");
    a[8358] = b:New(8358, 0); -- Deepwind Gorge All-Star
    O(a[8358], "From", "Version", "050300", "Before", "Version", "080300");
    a[8359] = b:New(8359, 0); -- Capping Spree
    O(a[8359], "From", "Version", "050300", "Before", "Version", "080300");
    a[8360] = b:New(8360, 0); -- Master of Deepwind Gorge
    O(a[8360], "From", "Version", "050300", "Before", "Version", "080300");
    a[8364] = b:New(8364, 10, fac.Alliance, 8366); -- Heroic: Battle on the High Seas
    a[8366] = b:New(8366, 10, fac.Horde, 8364); -- Heroic: Battle on the High Seas
    a[8368] = b:New(8368, 10); -- Fight Anger with Anger
    a[8381] = b:New(8381, 0, fac.Horde, 8382); -- Grievous Conquest
    O(a[8381], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8382] = b:New(8382, 0, fac.Alliance, 8381); -- Grievous Conquest
    O(a[8382], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8391] = b:New(8391, 0); -- Tournament Participation 2013
    O(a[8391], "Never");
    a[8392] = b:New(8392, 0); -- Tournament Glory 2013
    O(a[8392], "Never");
    a[8397] = b:New(8397, 10); -- Crazy for Cats
    a[8398] = b:New(8398, 0); -- Ahead of the Curve: Garrosh Hellscream (10 player)
    O(a[8398], "From", "Version", "050400", "Before", "Version", "060002");
    a[8399] = b:New(8399, 0); -- Ahead of the Curve: Garrosh Hellscream (25 player)
    O(a[8399], "From", "Version", "050400", "Before", "Version", "060002");
    a[8400] = b:New(8400, 0); -- Cutting Edge: Garrosh Hellscream (10 player)
    O(a[8400], "From", "Version", "050400", "Before", "Version", "060002");
    a[8401] = b:New(8401, 0); -- Cutting Edge: Garrosh Hellscream (25 player)
    O(a[8401], "From", "Version", "050400", "Before", "Version", "060002");
    a[8410] = b:New(8410, 10); -- The Celestial Tournament
    a[8430] = b:New(8430, 0); -- Challenge Master: Temple of the Jade Serpent
    O(a[8430], "From", "Version", "050005", "Before", "Version", "060002");
    a[8431] = b:New(8431, 0); -- Challenge Master: Stormstout Brewery
    O(a[8431], "From", "Version", "050005", "Before", "Version", "060002");
    a[8432] = b:New(8432, 0); -- Challenge Master: Shado-Pan Monastery
    O(a[8432], "From", "Version", "050005", "Before", "Version", "060002");
    a[8433] = b:New(8433, 0); -- Challenge Master: Mogu'shan Palace
    O(a[8433], "From", "Version", "050005", "Before", "Version", "060002");
    a[8434] = b:New(8434, 0); -- Challenge Master: Gate of the Setting Sun
    O(a[8434], "From", "Version", "050005", "Before", "Version", "060002");
    a[8436] = b:New(8436, 0); -- Challenge Master: Scarlet Halls
    O(a[8436], "From", "Version", "050005", "Before", "Version", "060002");
    a[8437] = b:New(8437, 0); -- Challenge Master: Scarlet Monastery
    O(a[8437], "From", "Version", "050005", "Before", "Version", "060002");
    a[8438] = b:New(8438, 0); -- Challenge Master: Scholomance
    O(a[8438], "From", "Version", "050005", "Before", "Version", "060002");
    a[8439] = b:New(8439, 0); -- Challenge Master: Siege of Niuzao Temple
    O(a[8439], "From", "Version", "050005", "Before", "Version", "060002");
    a[8448] = b:New(8448, 10); -- Gamon Will Save Us!
    a[8450] = b:New(8450, 0, fac.Horde, 8451); -- Prideful Conquest
    O(a[8450], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8451] = b:New(8451, 0, fac.Alliance, 8450); -- Prideful Conquest
    O(a[8451], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8453] = b:New(8453, 10); -- Rescue Raiders
    a[8454] = b:New(8454, 25); -- Glory of the Orgrimmar Raider
    a[8458] = b:New(8458, 10); -- Vale of Eternal Sorrows
    a[8459] = b:New(8459, 10); -- Gates of Retribution
    a[8461] = b:New(8461, 10); -- The Underhold
    a[8462] = b:New(8462, 10); -- Downfall
    a[8463] = b:New(8463, 10); -- Mythic: Immerseus
    a[8465] = b:New(8465, 10); -- Mythic: Fallen Protectors
    a[8466] = b:New(8466, 10); -- Mythic: Norushen
    a[8467] = b:New(8467, 10); -- Mythic: Sha of Pride
    a[8468] = b:New(8468, 10); -- Mythic: Galakras
    a[8469] = b:New(8469, 10); -- Mythic: Iron Juggernaut
    a[8470] = b:New(8470, 10); -- Mythic: Kor'kron Dark Shaman
    a[8471] = b:New(8471, 10); -- Mythic: General Nazgrim
    a[8472] = b:New(8472, 10); -- Mythic: Malkorok
    a[8478] = b:New(8478, 10); -- Mythic: Spoils of Pandaria
    a[8479] = b:New(8479, 10); -- Mythic: Thok the Bloodthirsty
    a[8480] = b:New(8480, 10); -- Mythic: Siegecrafter Blackfuse
    a[8481] = b:New(8481, 10); -- Mythic: Paragons of the Klaxxi
    a[8482] = b:New(8482, 10); -- Mythic: Garrosh Hellscream
    a[8484] = b:New(8484, 0, fac.Horde, 8485); -- Grievous Combatant
    O(a[8484], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8485] = b:New(8485, 0, fac.Alliance, 8484); -- Grievous Combatant
    O(a[8485], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8486] = b:New(8486, 0); -- Proving Yourself: Bronze Damage (Level 90)
    O(a[8486], "From", "Version", "050400", "Before", "Version", "060002");
    a[8487] = b:New(8487, 0); -- Proving Yourself: Bronze Tank (Level 90)
    O(a[8487], "From", "Version", "050400", "Before", "Version", "060002");
    a[8488] = b:New(8488, 0); -- Proving Yourself: Bronze Healer (Level 90)
    O(a[8488], "From", "Version", "050400", "Before", "Version", "060002");
    a[8491] = b:New(8491, 0); -- Proving Yourself: Silver Damage (Level 90)
    O(a[8491], "From", "Version", "050400", "Before", "Version", "060002");
    a[8492] = b:New(8492, 0); -- Proving Yourself: Silver Tank (Level 90)
    O(a[8492], "From", "Version", "050400", "Before", "Version", "060002");
    a[8493] = b:New(8493, 0); -- Proving Yourself: Silver Healer (Level 90)
    O(a[8493], "From", "Version", "050400", "Before", "Version", "060002");
    a[8496] = b:New(8496, 0); -- Proving Yourself: Gold Damage (Level 90)
    O(a[8496], "From", "Version", "050400", "Before", "Version", "060002");
    a[8497] = b:New(8497, 0); -- Proving Yourself: Gold Tank (Level 90)
    O(a[8497], "From", "Version", "050400", "Before", "Version", "060002");
    a[8498] = b:New(8498, 0); -- Proving Yourself: Gold Healer (Level 90)
    O(a[8498], "From", "Version", "050400", "Before", "Version", "060002");
    a[8501] = b:New(8501, 0); -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
    O(a[8501], "From", "Version", "050400", "Before", "Version", "060002");
    a[8502] = b:New(8502, 0); -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
    O(a[8502], "From", "Version", "050400", "Before", "Version", "060002");
    a[8503] = b:New(8503, 0); -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
    O(a[8503], "From", "Version", "050400", "Before", "Version", "060002");
    a[8504] = b:New(8504, 0); -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
    O(a[8504], "From", "Version", "050400", "Before", "Version", "060002");
    a[8505] = b:New(8505, 0); -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
    O(a[8505], "From", "Version", "050400", "Before", "Version", "060002");
    a[8506] = b:New(8506, 0); -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
    O(a[8506], "From", "Version", "050400", "Before", "Version", "060002");
    a[8507] = b:New(8507, 0); -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
    O(a[8507], "From", "Version", "050400", "Before", "Version", "060002");
    a[8508] = b:New(8508, 0); -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
    O(a[8508], "From", "Version", "050400", "Before", "Version", "060002");
    a[8509] = b:New(8509, 0); -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
    O(a[8509], "From", "Version", "050400", "Before", "Version", "060002");
    a[8518] = b:New(8518, 5); -- Master of the Masters
    a[8519] = b:New(8519, 5); -- Celestial Family
    a[8520] = b:New(8520, 10); -- Fire in the Hole!
    a[8521] = b:New(8521, 10); -- Swallow Your Pride
    a[8527] = b:New(8527, 10); -- Giant Dinosaur vs. Mega Snail
    a[8528] = b:New(8528, 10); -- Go Long
    a[8529] = b:New(8529, 10); -- Criss Cross
    a[8530] = b:New(8530, 10); -- The Immortal Vanguard
    a[8531] = b:New(8531, 10); -- Now We are the Paragon
    a[8532] = b:New(8532, 10); -- None Shall Pass
    a[8533] = b:New(8533, 0); -- Ordos
    O(a[8533]);
    a[8535] = b:New(8535, 10); -- Celestial Challenge
    a[8536] = b:New(8536, 10); -- No More Tears
    a[8537] = b:New(8537, 10); -- Strike!
    a[8538] = b:New(8538, 10); -- Unlimited Potential
    a[8543] = b:New(8543, 10); -- Lasers and Magnets and Drills! Oh My!
    a[8641] = b:New(8641, 0, fac.Horde, 8642); -- Prideful Combatant
    O(a[8641], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8642] = b:New(8642, 0, fac.Alliance, 8641); -- Prideful Combatant
    O(a[8642], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8643] = b:New(8643, 0); -- Grievous Gladiator: Season 14
    O(a[8643], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8644] = b:New(8644, 0); -- Gladiator: Season 14
    O(a[8644], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8645] = b:New(8645, 0); -- Duelist: Season 14
    O(a[8645], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8646] = b:New(8646, 0); -- Rival: Season 14
    O(a[8646], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8649] = b:New(8649, 0); -- Challenger: Season 14
    O(a[8649], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8652] = b:New(8652, 0, fac.Alliance, 8653); -- Hero of the Alliance: Tyrannical
    O(a[8652], "From", "PvP Season", 13, "Until", "PvP Season", 13);
    a[8653] = b:New(8653, 0, fac.Horde, 8652); -- Hero of the Horde: Tyrannical
    O(a[8653], "From", "PvP Season", 13, "Until", "PvP Season", 13);
    a[8654] = b:New(8654, 0, fac.Alliance, 8657); -- Hero of the Alliance: Grievous
    O(a[8654], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8657] = b:New(8657, 0, fac.Horde, 8654); -- Hero of the Horde: Grievous
    O(a[8657], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8658] = b:New(8658, 0, fac.Alliance, 8659); -- Hero of the Alliance: Prideful
    O(a[8658], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8659] = b:New(8659, 0, fac.Horde, 8658); -- Hero of the Horde: Prideful
    O(a[8659], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8666] = b:New(8666, 0); -- Prideful Gladiator: Season 15
    O(a[8666], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8667] = b:New(8667, 0); -- Gladiator: Season 15
    O(a[8667], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8668] = b:New(8668, 0); -- Duelist: Season 15
    O(a[8668], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8669] = b:New(8669, 0); -- Rival: Season 15
    O(a[8669], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8670] = b:New(8670, 0); -- Challenger: Season 15
    O(a[8670], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8671] = b:New(8671, 10, fac.Horde, 8845); -- You'll Get Caught Up In The... Frostfire!
    a[8678] = b:New(8678, 0); -- Tyrannical Gladiator's Cloud Serpent
    O(a[8678], "From", "PvP Season", 13, "Until", "PvP Season", 13);
    a[8679] = b:New(8679, 10, fac.Alliance, 8680); -- Conqueror of Orgrimmar
    a[8680] = b:New(8680, 10, fac.Horde, 8679); -- Liberator of Orgrimmar
    a[8697] = b:New(8697, 0); -- You're Doing it Wrong (Level 90)
    O(a[8697], "From", "Version", "050400", "Before", "Version", "060002");
    a[8698] = b:New(8698, 0); -- Crashin' Thrashin' Flyer
    a[8699] = b:New(8699, 10); -- The Danger Zone
    a[8705] = b:New(8705, 0); -- Grievous Gladiator's Cloud Serpent
    O(a[8705], "From", "PvP Season", 14, "Until", "PvP Season", 14);
    a[8707] = b:New(8707, 0); -- Prideful Gladiator's Cloud Serpent
    O(a[8707], "From", "PvP Season", 15, "Until", "PvP Season", 15);
    a[8712] = b:New(8712, 10); -- Killing Time
    a[8714] = b:New(8714, 10); -- Timeless Champion
    a[8715] = b:New(8715, 10); -- Emperor Shaohao
    a[8716] = b:New(8716, 10); -- Emissary of Ordos
    a[8717] = b:New(8717, 10); -- Candlekeeper
    a[8718] = b:New(8718, 10); -- Oathguard
    a[8719] = b:New(8719, 10); -- Blazebinder
    a[8720] = b:New(8720, 10); -- Kilnmaster
    a[8721] = b:New(8721, 10); -- Fire-Watcher
    a[8722] = b:New(8722, 10); -- Timeless Nutriment
    a[8723] = b:New(8723, 10); -- Legend of the Past
    a[8724] = b:New(8724, 10); -- Pilgrimage
    a[8725] = b:New(8725, 10); -- Eyes On The Ground
    a[8726] = b:New(8726, 10); -- Extreme Treasure Hunter
    a[8727] = b:New(8727, 10); -- "Where There's Pirates, There's Booty"
    a[8728] = b:New(8728, 10); -- Going To Need A Bigger Bag
    a[8729] = b:New(8729, 10); -- "Treasure, Treasure Everywhere"
    a[8730] = b:New(8730, 10); -- Rolo's Riddle
    a[8743] = b:New(8743, 10); -- Zarhym Altogether
    a[8784] = b:New(8784, 10); -- Timeless Legends
    a[8791] = b:New(8791, 0); -- Tyrannical Gladiator
    O(a[8791], "From", "PvP Season", 13, "Until", "PvP Season", 13);
    a[8793] = b:New(8793, 0); -- Murkalot
    a[8794] = b:New(8794, 0); -- Friends In Places Even Higher Than That
    O(a[8794]);
    a[8795] = b:New(8795, 0); -- Collector's Edition: Treasure Goblin
    a[8812] = b:New(8812, 0); -- You're Really Doing It Wrong (Level 90)
    O(a[8812], "From", "Version", "050400", "Before", "Version", "060002");
    a[8820] = b:New(8820, 0); -- WoW's 10th Anniversary
    O(a[8820]);
    a[8843] = b:New(8843, 10); -- Skyreach
    a[8844] = b:New(8844, 10); -- Heroic: Skyreach
    a[8845] = b:New(8845, 10, fac.Alliance, 8671); -- As I Walk Through the Valley of the Shadow of Moon
    a[8871] = b:New(8871, 0); -- Skyreach Challenger
    O(a[8871], "From", "Version", "060003", "Before", "Version", "070003");
    a[8872] = b:New(8872, 0); -- Skyreach: Bronze
    O(a[8872], "From", "Version", "060003", "Before", "Version", "070003");
    a[8873] = b:New(8873, 0); -- Skyreach: Silver
    O(a[8873], "From", "Version", "060003", "Before", "Version", "070003");
    a[8874] = b:New(8874, 0); -- Skyreach: Gold
    O(a[8874], "From", "Version", "060003", "Before", "Version", "070003");
    a[8875] = b:New(8875, 0); -- Bloodmaul Slag Mines Challenger
    O(a[8875], "From", "Version", "060003", "Before", "Version", "070003");
    a[8876] = b:New(8876, 0); -- Bloodmaul Slag Mines: Bronze
    O(a[8876], "From", "Version", "060003", "Before", "Version", "070003");
    a[8877] = b:New(8877, 0); -- Bloodmaul Slag Mines: Silver
    O(a[8877], "From", "Version", "060003", "Before", "Version", "070003");
    a[8878] = b:New(8878, 0); -- Bloodmaul Slag Mines: Gold
    O(a[8878], "From", "Version", "060003", "Before", "Version", "070003");
    a[8879] = b:New(8879, 0); -- Auchindoun Challenger
    O(a[8879], "From", "Version", "060003", "Before", "Version", "070003");
    a[8880] = b:New(8880, 0); -- Auchindoun: Bronze
    O(a[8880], "From", "Version", "060003", "Before", "Version", "070003");
    a[8881] = b:New(8881, 0); -- Auchindoun: Silver
    O(a[8881], "From", "Version", "060003", "Before", "Version", "070003");
    a[8882] = b:New(8882, 0); -- Auchindoun: Gold
    O(a[8882], "From", "Version", "060003", "Before", "Version", "070003");
    a[8883] = b:New(8883, 0); -- Shadowmoon Burial Grounds Challenger
    O(a[8883], "From", "Version", "060003", "Before", "Version", "070003");
    a[8884] = b:New(8884, 0); -- Shadowmoon Burial Grounds: Bronze
    O(a[8884], "From", "Version", "060003", "Before", "Version", "070003");
    a[8885] = b:New(8885, 0); -- Shadowmoon Burial Grounds: Silver
    O(a[8885], "From", "Version", "060003", "Before", "Version", "070003");
    a[8886] = b:New(8886, 0); -- Shadowmoon Burial Grounds: Gold
    O(a[8886], "From", "Version", "060003", "Before", "Version", "070003");
    a[8887] = b:New(8887, 0); -- Grimrail Depot Challenger
    O(a[8887], "From", "Version", "060003", "Before", "Version", "070003");
    a[8888] = b:New(8888, 0); -- Grimrail Depot: Bronze
    O(a[8888], "From", "Version", "060003", "Before", "Version", "070003");
    a[8889] = b:New(8889, 0); -- Grimrail Depot: Silver
    O(a[8889], "From", "Version", "060003", "Before", "Version", "070003");
    a[8890] = b:New(8890, 0); -- Grimrail Depot: Gold
    O(a[8890], "From", "Version", "060003", "Before", "Version", "070003");
    a[8891] = b:New(8891, 0); -- Upper Blackrock Spire Challenger
    O(a[8891], "From", "Version", "060003", "Before", "Version", "070003");
    a[8892] = b:New(8892, 0); -- Upper Blackrock Spire: Bronze
    O(a[8892], "From", "Version", "060003", "Before", "Version", "070003");
    a[8893] = b:New(8893, 0); -- Upper Blackrock Spire: Silver
    O(a[8893], "From", "Version", "060003", "Before", "Version", "070003");
    a[8894] = b:New(8894, 0); -- Upper Blackrock Spire: Gold
    O(a[8894], "From", "Version", "060003", "Before", "Version", "070003");
    a[8895] = b:New(8895, 0); -- Challenge Warlord
    O(a[8895], "From", "Version", "060003", "Before", "Version", "070003");
    a[8897] = b:New(8897, 0); -- Challenge Warlord: Bronze
    O(a[8897], "From", "Version", "060003", "Before", "Version", "070003");
    a[8898] = b:New(8898, 0); -- Challenge Warlord: Silver
    O(a[8898], "From", "Version", "060003", "Before", "Version", "070003");
    a[8899] = b:New(8899, 0); -- Challenge Warlord: Gold
    O(a[8899], "From", "Version", "060003", "Before", "Version", "070003");
    a[8903] = b:New(8903, 0); -- Mistwalker
    O(a[8903], "From", "Version", "050005", "Before", "Version", "060002");
    a[8916] = b:New(8916, 0); -- Collector's Edition: Dread Raven
    a[8917] = b:New(8917, 0); -- Collector's Edition: Dread Hatchling
    a[8919] = b:New(8919, 10, fac.Horde, 8920); -- Don't Let the Tala-door Hit You on the Way Out
    a[8920] = b:New(8920, 10, fac.Alliance, 8919); -- Don't Let the Tala-door Hit You on the Way Out
    a[8921] = b:New(8921, 10, fac.Alliance, 8922); -- Welcome to Draenor
    a[8922] = b:New(8922, 10, fac.Horde, 8921); -- Welcome to Draenor
    a[8923] = b:New(8923, 10, fac.Alliance, 8924); -- Putting the Gore in Gorgrond
    a[8924] = b:New(8924, 10, fac.Horde, 8923); -- Putting the Gore in Gorgrond
    a[8925] = b:New(8925, 10, fac.Alliance, 8926); -- Between Arak and a Hard Place
    a[8926] = b:New(8926, 10, fac.Horde, 8925); -- Between Arak and a Hard Place
    a[8927] = b:New(8927, 10, fac.Alliance, 8928); -- Nagrandeur
    a[8928] = b:New(8928, 10, fac.Horde, 8927); -- Nagrandeur
    a[8929] = b:New(8929, 10); -- The Steel Has Been Brought
    a[8930] = b:New(8930, 10); -- "Ya, We've Got Time..."
    a[8932] = b:New(8932, 10); -- Mythic: Flamebender Ka'graz
    a[8933] = b:New(8933, 5); -- Staying Regular
    a[8935] = b:New(8935, 25); -- Draenor Explorer
    a[8937] = b:New(8937, 10); -- Explore Frostfire Ridge
    a[8938] = b:New(8938, 10); -- Explore Shadowmoon Valley
    a[8939] = b:New(8939, 10); -- Explore Gorgrond
    a[8940] = b:New(8940, 10); -- Explore Talador
    a[8941] = b:New(8941, 10); -- Explore Spires of Arak
    a[8942] = b:New(8942, 10); -- Explore Nagrand
    a[8947] = b:New(8947, 10); -- "Hurry Up, Maggot!"
    a[8948] = b:New(8948, 10); -- Flame On!
    a[8949] = b:New(8949, 10); -- Mythic: Kargath Bladefist
    a[8952] = b:New(8952, 10); -- "Ashes, Ashes..."
    a[8956] = b:New(8956, 10); -- Mythic: Beastlord Darmac
    a[8958] = b:New(8958, 10); -- Brothers in Arms
    a[8960] = b:New(8960, 10); -- Mythic: The Butcher
    a[8961] = b:New(8961, 10); -- Mythic: Tectus
    a[8962] = b:New(8962, 10); -- Mythic: Brackenspore
    a[8963] = b:New(8963, 10); -- Mythic: Twin Ogron
    a[8964] = b:New(8964, 10); -- Mythic: Ko'ragh
    a[8965] = b:New(8965, 10); -- Mythic: Imperator's Fall
    a[8966] = b:New(8966, 10); -- Mythic: Gruul
    a[8967] = b:New(8967, 10); -- Mythic: Oregorger
    a[8968] = b:New(8968, 10); -- Mythic: Hans'gar and Franzok
    a[8969] = b:New(8969, 10); -- Mythic: Operator Thogar
    a[8970] = b:New(8970, 10); -- Mythic: Blast Furnace
    a[8971] = b:New(8971, 10); -- Mythic: Kromog
    a[8972] = b:New(8972, 10); -- Mythic: Iron Maidens
    a[8973] = b:New(8973, 10); -- Mythic: Blackhand's Crucible
    a[8974] = b:New(8974, 10); -- More Like Wrecked-us
    a[8975] = b:New(8975, 10); -- A Fungus Among Us
    a[8976] = b:New(8976, 10); -- Pair Annihilation
    a[8977] = b:New(8977, 10); -- Lineage of Power
    a[8978] = b:New(8978, 10); -- The Iron Price
    a[8979] = b:New(8979, 10); -- "He Shoots, He Ores"
    a[8980] = b:New(8980, 10); -- Stamp Stamp Revolution
    a[8981] = b:New(8981, 10); -- Fain Would Lie Down
    a[8982] = b:New(8982, 10); -- There's Always a Bigger Train
    a[8983] = b:New(8983, 10); -- Would You Give Me a Hand?
    a[8984] = b:New(8984, 10); -- Be Quick or Be Dead
    a[8985] = b:New(8985, 25); -- Glory of the Draenor Raider
    a[8986] = b:New(8986, 10); -- The Walled City
    a[8987] = b:New(8987, 10); -- Arcane Sanctum
    a[8988] = b:New(8988, 10); -- Imperator's Fall
    a[8989] = b:New(8989, 10); -- Slagworks
    a[8990] = b:New(8990, 10); -- Black Forge
    a[8991] = b:New(8991, 10); -- Iron Assembly
    a[8992] = b:New(8992, 10); -- Blackhand's Crucible
    a[8993] = b:New(8993, 10); -- A Gift of Earth and Fire
    a[8997] = b:New(8997, 0); -- Iron Docks Challenger
    O(a[8997], "From", "Version", "060003", "Before", "Version", "070003");
    a[8998] = b:New(8998, 0); -- Iron Docks: Bronze
    O(a[8998], "From", "Version", "060003", "Before", "Version", "070003");
    a[8999] = b:New(8999, 0); -- Iron Docks: Silver
    O(a[8999], "From", "Version", "060003", "Before", "Version", "070003");
    a[9000] = b:New(9000, 0); -- Iron Docks: Gold
    O(a[9000], "From", "Version", "060003", "Before", "Version", "070003");
    a[9001] = b:New(9001, 0); -- The Everbloom Challenger
    O(a[9001], "From", "Version", "060003", "Before", "Version", "070003");
    a[9002] = b:New(9002, 0); -- The Everbloom: Bronze
    O(a[9002], "From", "Version", "060003", "Before", "Version", "070003");
    a[9003] = b:New(9003, 0); -- The Everbloom: Silver
    O(a[9003], "From", "Version", "060003", "Before", "Version", "070003");
    a[9004] = b:New(9004, 0); -- The Everbloom: Gold
    O(a[9004], "From", "Version", "060003", "Before", "Version", "070003");
    a[9005] = b:New(9005, 10); -- Come With Me If You Want to Live
    a[9007] = b:New(9007, 10); -- No Ticket
    a[9008] = b:New(9008, 10); -- Is Draenor on Fire?
    a[9016] = b:New(9016, 0); -- Breaker of the Black Harvest
    O(a[9016], "From", "Version", "050200", "Before", "Version", "060002");
    a[9017] = b:New(9017, 10); -- Water Management
    a[9018] = b:New(9018, 10); -- What's Your Sign?
    a[9023] = b:New(9023, 10); -- ...They All Fall Down
    a[9024] = b:New(9024, 10); -- This Is Why We Can't Have Nice Things
    a[9025] = b:New(9025, 10); -- Icky Ichors
    a[9026] = b:New(9026, 10); -- Souls of the Lost
    a[9033] = b:New(9033, 10); -- Ready for Raiding IV
    a[9034] = b:New(9034, 10); -- Magnify... Enhance
    a[9035] = b:New(9035, 10); -- I Saw Solis
    a[9036] = b:New(9036, 10); -- Monomania
    a[9037] = b:New(9037, 10); -- Bloodmaul Slag Mines
    a[9038] = b:New(9038, 10); -- Iron Docks
    a[9039] = b:New(9039, 10); -- Auchindoun
    a[9041] = b:New(9041, 10); -- Shadowmoon Burial Grounds
    a[9042] = b:New(9042, 10); -- Upper Blackrock Spire
    a[9043] = b:New(9043, 10); -- Grimrail Depot
    a[9044] = b:New(9044, 10); -- The Everbloom
    a[9045] = b:New(9045, 10); -- "Magnets, How Do They Work?"
    a[9046] = b:New(9046, 10); -- Heroic: Bloodmaul Slag Mines
    a[9047] = b:New(9047, 10); -- Heroic: Iron Docks
    a[9049] = b:New(9049, 10); -- Heroic: Auchindoun
    a[9052] = b:New(9052, 10); -- Heroic: Grimrail Depot
    a[9053] = b:New(9053, 10); -- Heroic: The Everbloom
    a[9054] = b:New(9054, 10); -- Heroic: Shadowmoon Burial Grounds
    a[9055] = b:New(9055, 10); -- Heroic: Upper Blackrock Spire
    a[9056] = b:New(9056, 10); -- Bridge Over Troubled Fire
    a[9057] = b:New(9057, 10); -- Dragonmaw? More Like Dragonfall!
    a[9058] = b:New(9058, 10); -- Leeeeeeeeeeeeeroy...?
    a[9060] = b:New(9060, 0); -- Level 100 (Legacy)
    O(a[9060], "From", "Version", "060003", "Before", "Version", "090001");
    a[9069] = b:New(9069, 10); -- An Awfully Big Adventure
    a[9070] = b:New(9070, 5); -- Overstuffed
    a[9071] = b:New(9071, 5); -- Inspector Gadgetzan
    a[9072] = b:New(9072, 5); -- Mantle of the Talon King
    a[9076] = b:New(9076, 5); -- Choppin' Some Logs
    a[9077] = b:New(9077, 5); -- Choppin' Some More Logs
    a[9078] = b:New(9078, 5, fac.Alliance, 9080); -- Choppin' Even More Logs
    a[9080] = b:New(9080, 5, fac.Horde, 9078); -- Choppin' Even More Logs
    a[9081] = b:New(9081, 10); -- Expert Timing
    a[9082] = b:New(9082, 10); -- Take Cover!
    a[9083] = b:New(9083, 10); -- "Militaristic, Expansionist"
    a[9087] = b:New(9087, 50); -- Draenor Master of All
    a[9094] = b:New(9094, 10); -- Garrison Architect
    a[9095] = b:New(9095, 5); -- Builder
    a[9096] = b:New(9096, 5); -- Master Builder
    a[9097] = b:New(9097, 5); -- Keepin' Busy
    a[9098] = b:New(9098, 5); -- Movin' On Up
    a[9099] = b:New(9099, 5); -- Time for an Upgrade
    a[9100] = b:New(9100, 5, fac.Alliance, 9545); -- More Plots
    a[9101] = b:New(9101, 5, fac.Alliance, 9546); -- Even More Plots
    a[9102] = b:New(9102, 10); -- Ashran Victory
    a[9103] = b:New(9103, 10, fac.Horde, 9104); -- Bounty Hunter
    a[9104] = b:New(9104, 10, fac.Alliance, 9103); -- Bounty Hunter
    a[9105] = b:New(9105, 10); -- Tour of Duty
    a[9106] = b:New(9106, 10); -- Just for Me
    a[9107] = b:New(9107, 5); -- Follow the Leader
    a[9108] = b:New(9108, 5); -- "Where You Go, They Will Follow"
    a[9109] = b:New(9109, 5); -- Fearless Leader
    a[9110] = b:New(9110, 5); -- Following Up
    a[9111] = b:New(9111, 5); -- Raising the Bar
    a[9125] = b:New(9125, 5); -- Draftsman
    a[9126] = b:New(9126, 5); -- Master Draftsman
    a[9128] = b:New(9128, 5); -- Grand Master Draftsman
    a[9129] = b:New(9129, 5); -- Filling the Ranks
    a[9130] = b:New(9130, 5); -- A Rare Friend
    a[9131] = b:New(9131, 5); -- An Epic Buddy
    a[9132] = b:New(9132, 5, fac.Horde, 9210); -- Garrison Buddies
    a[9133] = b:New(9133, 5); -- On a Mission
    a[9134] = b:New(9134, 5); -- On a Few Missions
    a[9138] = b:New(9138, 5); -- On a Lot of Missions
    a[9139] = b:New(9139, 5); -- On a Massive Number of Missions
    a[9140] = b:New(9140, 5); -- On a Metric Ton of Missions
    a[9141] = b:New(9141, 5); -- A Rare Mission
    a[9142] = b:New(9142, 5); -- Keeping It Rare
    a[9143] = b:New(9143, 5); -- The Rarer the Better
    a[9145] = b:New(9145, 5); -- Treasure Mission Specialist
    a[9146] = b:New(9146, 5); -- Patrol Mission Specialist
    a[9147] = b:New(9147, 5); -- Mission Specialist
    a[9150] = b:New(9150, 10); -- Exploration Mission Specialist
    a[9152] = b:New(9152, 5); -- It's an Invasion!
    a[9162] = b:New(9162, 5); -- Bronze Defender
    a[9164] = b:New(9164, 5); -- Silver Defender
    a[9165] = b:New(9165, 5); -- Golden Defender
    a[9167] = b:New(9167, 5); -- Invasion Specialist
    a[9168] = b:New(9168, 0, fac.Alliance, 9172); -- You Are Not Your $#*@! Legplates (Season 2)
    O(a[9168], "From", "Version", "060003", "Before", "Version", "070003");
    a[9169] = b:New(9169, 0, fac.Alliance, 9173); -- The Second Rule of Brawler's Guild (Season 2)
    O(a[9169], "From", "Version", "060003", "Before", "Version", "070003");
    a[9170] = b:New(9170, 0, fac.Alliance, 9174); -- Brawlin' and Shot Callin' (Season 2)
    O(a[9170], "From", "Version", "060003", "Before", "Version", "070003");
    a[9171] = b:New(9171, 0, fac.Alliance, 9175); -- Now You're Just Showing Off (Season 2)
    O(a[9171], "From", "Version", "060003", "Before", "Version", "070003");
    a[9172] = b:New(9172, 0, fac.Horde, 9168); -- You Are Not Your $#*@! Legplates (Season 2)
    O(a[9172], "From", "Version", "060003", "Before", "Version", "070003");
    a[9173] = b:New(9173, 0, fac.Horde, 9169); -- The Second Rule of Brawler's Guild (Season 2)
    O(a[9173], "From", "Version", "060003", "Before", "Version", "070003");
    a[9174] = b:New(9174, 0, fac.Horde, 9170); -- Brawlin' and Shot Callin' (Season 2)
    O(a[9174], "From", "Version", "060003", "Before", "Version", "070003");
    a[9175] = b:New(9175, 0, fac.Horde, 9171); -- Now You're Just Showing Off (Season 2)
    O(a[9175], "From", "Version", "060003", "Before", "Version", "070003");
    a[9176] = b:New(9176, 0, fac.Alliance, 9177); -- Deck Your Collection (Season 2)
    O(a[9176], "From", "Version", "060003", "Before", "Version", "070003");
    a[9177] = b:New(9177, 0, fac.Horde, 9176); -- Deck Your Collection (Season 2)
    O(a[9177], "From", "Version", "060003", "Before", "Version", "070003");
    a[9181] = b:New(9181, 5); -- Save Those Buildings!
    a[9203] = b:New(9203, 5); -- Shadow Council Invasion
    a[9204] = b:New(9204, 5); -- Ogre Invasion
    a[9205] = b:New(9205, 5); -- Iron Horde Invasion
    a[9206] = b:New(9206, 5); -- Shadowmoon Clan Invasion
    a[9207] = b:New(9207, 5); -- Goren Invasion
    a[9208] = b:New(9208, 5); -- Botani Invasion
    a[9209] = b:New(9209, 10); -- Master Defender
    a[9210] = b:New(9210, 5, fac.Alliance, 9132); -- Garrison Buddies
    a[9211] = b:New(9211, 5); -- My Item Level Is Higher than Yours
    a[9212] = b:New(9212, 5); -- My Item Level Is Way Higher than Yours
    a[9213] = b:New(9213, 5); -- Item Level Army
    a[9214] = b:New(9214, 0, fac.Alliance, 9215); -- Hero of Stormshield
    a[9215] = b:New(9215, 0, fac.Horde, 9214); -- Hero of Warspear
    a[9216] = b:New(9216, 10); -- High-value Targets
    a[9217] = b:New(9217, 10, fac.Horde, 9408); -- Operation Counterattack
    a[9218] = b:New(9218, 10); -- "Grand Theft, 1st Degree"
    a[9219] = b:New(9219, 10); -- "Grand Theft, 2nd Degree"
    a[9220] = b:New(9220, 10); -- "Grand Theft, 3rd Degree"
    a[9222] = b:New(9222, 10); -- Divide and Conquer
    a[9223] = b:New(9223, 10); -- Weed Whacker
    a[9224] = b:New(9224, 10, fac.Horde, 9225); -- Take Them Out
    a[9225] = b:New(9225, 10, fac.Alliance, 9224); -- Take Them Out
    a[9228] = b:New(9228, 10, fac.Alliance); -- Down Goes Van Rook
    a[9229] = b:New(9229, 0); -- Primal Gladiator's Felblood Gronnling
    O(a[9229], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9230] = b:New(9230, 0, fac.Alliance, 9231); -- Hero of the Alliance: Primal
    O(a[9230], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9231] = b:New(9231, 0, fac.Horde, 9230); -- Hero of the Horde: Primal
    O(a[9231], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9232] = b:New(9232, 0); -- Primal Gladiator: Warlords Season 1
    O(a[9232], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9233] = b:New(9233, 0, fac.Horde, 9234); -- Primal Conquest
    O(a[9233], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9234] = b:New(9234, 0, fac.Alliance, 9233); -- Primal Conquest
    O(a[9234], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9236] = b:New(9236, 0, fac.Horde, 9238); -- Primal Combatant
    O(a[9236], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9238] = b:New(9238, 0, fac.Alliance, 9236); -- Primal Combatant
    O(a[9238], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9239] = b:New(9239, 0); -- Gladiator: Warlords Season 1
    O(a[9239], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9240] = b:New(9240, 0); -- Duelist: Warlords Season 1
    O(a[9240], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9241] = b:New(9241, 0); -- Rival: Warlords Season 1
    O(a[9241], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9242] = b:New(9242, 0); -- Challenger: Warlords Season 1
    O(a[9242], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9243] = b:New(9243, 5); -- Item Level Force
    a[9244] = b:New(9244, 5); -- Invasions Are Better with Friends
    a[9246] = b:New(9246, 10); -- Master Draenor Crafter
    a[9248] = b:New(9248, 10, fac.Horde, 9630); -- Defender of Draenor
    a[9250] = b:New(9250, 10); -- Flying High
    a[9251] = b:New(9251, 10); -- Ringmaster
    a[9252] = b:New(9252, 10); -- Brood of Alysrazor
    a[9255] = b:New(9255, 10, fac.Horde, 9631); -- Mythic Draenor Raider
    a[9256] = b:New(9256, 10, fac.Alliance, 9257); -- Rescue Operation
    a[9257] = b:New(9257, 10, fac.Horde, 9256); -- Rescue Operation
    a[9264] = b:New(9264, 10); -- Draenor Pet Brawler
    a[9265] = b:New(9265, 10); -- Master of Apexis
    a[9389] = b:New(9389, 10); -- It Might Just Save Your Life
    a[9391] = b:New(9391, 20); -- Draenor Dungeon Hero
    a[9392] = b:New(9392, 10); -- Love Magnet
    a[9393] = b:New(9393, 10); -- Beacon of Love
    a[9394] = b:New(9394, 10); -- They Really Love Me!
    a[9396] = b:New(9396, 25); -- Glory of the Draenor Hero
    a[9400] = b:New(9400, 10); -- Gorgrond Monster Hunter
    a[9401] = b:New(9401, 10); -- Shredder Maniac
    a[9402] = b:New(9402, 10); -- Prove Your Strength
    a[9405] = b:New(9405, 5); -- Working Some Orders
    a[9406] = b:New(9406, 5); -- Working More Orders
    a[9407] = b:New(9407, 5); -- Working Many Orders
    a[9408] = b:New(9408, 10, fac.Alliance, 9217); -- Operation Counterattack
    a[9409] = b:New(9409, 10); -- Draenor Archaeologist
    a[9410] = b:New(9410, 15); -- Unite the Clans
    a[9411] = b:New(9411, 15); -- Highmaul Historian
    a[9412] = b:New(9412, 15); -- Arakkoa Archivist
    a[9413] = b:New(9413, 10); -- Strength and Honor
    a[9414] = b:New(9414, 10); -- Ogre Observer
    a[9415] = b:New(9415, 10); -- Secrets of Skettis
    a[9419] = b:New(9419, 25); -- Draenor Curator
    a[9422] = b:New(9422, 10); -- "The Search For Fact, Not Truth"
    a[9423] = b:New(9423, 10); -- Goliaths of Gorgrond
    a[9425] = b:New(9425, 10); -- So Grossly Incandescent
    a[9426] = b:New(9426, 5); -- To The Afterlife
    a[9427] = b:New(9427, 5); -- Vientos!
    a[9428] = b:New(9428, 10); -- Calavera
    a[9429] = b:New(9429, 5); -- Upgrading the Mill
    a[9432] = b:New(9432, 10); -- Would You Like a Pamphlet?
    a[9433] = b:New(9433, 10); -- A-VOID-ance
    a[9434] = b:New(9434, 10); -- One of Us! One of Us!
    a[9435] = b:New(9435, 10); -- Take From Them Everything
    a[9436] = b:New(9436, 10); -- It's the Stones!
    a[9437] = b:New(9437, 10); -- A Demidos of Reality
    a[9441] = b:New(9441, 0); -- Ahead of the Curve: Imperator's Fall
    O(a[9441], "From", "Version", "060003", "Before", "Version", "060200");
    a[9442] = b:New(9442, 0); -- Cutting Edge: Imperator's Fall
    O(a[9442], "From", "Version", "060003", "Before", "Version", "060200");
    a[9443] = b:New(9443, 0); -- Cutting Edge: Blackhand's Crucible
    O(a[9443], "From", "Version", "060003", "Before", "Version", "060200");
    a[9444] = b:New(9444, 0); -- Ahead of the Curve: Blackhand's Crucible
    O(a[9444], "From", "Version", "060003", "Before", "Version", "060200");
    a[9450] = b:New(9450, 5); -- The Trap Game
    a[9451] = b:New(9451, 5); -- Trapper's Delight
    a[9452] = b:New(9452, 5); -- Trap Superstar
    a[9453] = b:New(9453, 5); -- Draenic Stone Collector
    a[9454] = b:New(9454, 5); -- Draenic Seed Collector
    a[9455] = b:New(9455, 5); -- Fire Ammonite Angler
    a[9456] = b:New(9456, 5); -- Abyssal Gulper Eel Angler
    a[9457] = b:New(9457, 5); -- Blackwater Whiptail Angler
    a[9458] = b:New(9458, 5); -- Blind Lake Sturgeon Angler
    a[9459] = b:New(9459, 5); -- Fat Sleeper Angler
    a[9460] = b:New(9460, 5); -- Jawless Skulker Angler
    a[9461] = b:New(9461, 5); -- Sea Scorpion Angler
    a[9462] = b:New(9462, 10); -- Draenor Angler
    a[9463] = b:New(9463, 5); -- Draenic Pet Battler
    a[9464] = b:New(9464, 10); -- Professional Draenor Master
    a[9468] = b:New(9468, 5); -- Salvaging Pays Off
    a[9469] = b:New(9469, 5); -- Arakkoa Outcasts
    a[9470] = b:New(9470, 10, fac.Alliance, 9471); -- Council of Exarchs
    a[9471] = b:New(9471, 10, fac.Horde, 9470); -- Frostwolf Orcs
    a[9472] = b:New(9472, 10); -- Steamwheedle Preservation Society
    a[9473] = b:New(9473, 10, fac.Horde, 9474); -- Vol'jin's Spear
    a[9474] = b:New(9474, 10, fac.Alliance, 9473); -- Wrynn's Vanguard
    a[9475] = b:New(9475, 10, fac.Horde, 9476); -- Laughing Skull Orcs
    a[9476] = b:New(9476, 10, fac.Alliance, 9475); -- Sha'tari Defense
    a[9477] = b:New(9477, 5, fac.Horde, 9478); -- Savage Friends
    a[9478] = b:New(9478, 5, fac.Alliance, 9477); -- Savage Friends
    a[9479] = b:New(9479, 10); -- You Can't Make a Giant Omelette...
    a[9481] = b:New(9481, 10); -- You Have Been Rylakinated!
    a[9483] = b:New(9483, 10); -- I Was Framed!
    a[9486] = b:New(9486, 10); -- Goodness Gracious
    a[9487] = b:New(9487, 10); -- Got My Mind On My Draenor Money
    a[9491] = b:New(9491, 10, fac.Alliance, 9492); -- The Garrison Campaign
    a[9492] = b:New(9492, 10, fac.Horde, 9491); -- The Garrison Campaign
    a[9493] = b:New(9493, 10); -- "They Burn, Burn, Burn"
    a[9494] = b:New(9494, 5); -- Commander
    a[9495] = b:New(9495, 5); -- The Bone Collector
    a[9496] = b:New(9496, 0); -- Warlord's Deathwheel
    O(a[9496]);
    a[9497] = b:New(9497, 5); -- Finding Your Waystones
    a[9498] = b:New(9498, 5); -- Wingman
    a[9499] = b:New(9499, 5); -- Wingmen
    a[9500] = b:New(9500, 10); -- Draenor Cook
    a[9501] = b:New(9501, 10); -- The Draenor Gourmet
    a[9502] = b:New(9502, 10); -- Draenor Cuisine
    a[9503] = b:New(9503, 10); -- Draenor Fisherman
    a[9505] = b:New(9505, 0); -- Draenor Medic
    O(a[9505], "From", "Version", "060003", "Before", "Version", "080001");
    a[9506] = b:New(9506, 0); -- Savage Skills to Pay the Bills
    O(a[9506], "From", "Version", "060003", "Before", "Version", "080001");
    a[9507] = b:New(9507, 10); -- Working in Draenor
    a[9508] = b:New(9508, 10, fac.Horde, 9738); -- Warlord of Draenor
    a[9509] = b:New(9509, 5, fac.Horde, 9516); -- Nemesis: Draenei Destroyer
    a[9510] = b:New(9510, 5, fac.Horde, 9522); -- Nemesis: Dwarfstalker
    a[9511] = b:New(9511, 5, fac.Horde, 9521); -- Nemesis: Gnomebane
    a[9512] = b:New(9512, 5, fac.Horde, 9519); -- Nemesis: Manslayer
    a[9513] = b:New(9513, 5, fac.Horde, 9517); -- Nemesis: Scourge of the Kaldorei
    a[9514] = b:New(9514, 5, fac.Horde, 9520); -- Nemesis: Terror of the Tushui
    a[9515] = b:New(9515, 5, fac.Horde, 9518); -- Nemesis: Worgen Hunter
    a[9516] = b:New(9516, 5, fac.Alliance, 9509); -- Nemesis: Slayer of Sin'dorei
    a[9517] = b:New(9517, 5, fac.Alliance, 9513); -- Nemesis: Death Stalker
    a[9518] = b:New(9518, 5, fac.Alliance, 9515); -- Nemesis: Killer of Kezan
    a[9519] = b:New(9519, 5, fac.Alliance, 9512); -- Nemesis: Orcslayer
    a[9520] = b:New(9520, 5, fac.Alliance, 9514); -- Nemesis: Huojin's Fall
    a[9521] = b:New(9521, 5, fac.Alliance, 9511); -- Nemesis: The Butcher
    a[9522] = b:New(9522, 5, fac.Alliance, 9510); -- Nemesis: Troll Hunter
    a[9523] = b:New(9523, 5); -- Patrolling Draenor
    a[9524] = b:New(9524, 5); -- Treasure Master
    a[9526] = b:New(9526, 5); -- Master of Mounts
    a[9527] = b:New(9527, 5); -- Terrific Technology
    a[9528] = b:New(9528, 10, fac.Alliance, 9529); -- On the Shadow's Trail
    a[9529] = b:New(9529, 10, fac.Horde, 9528); -- On the Shadow's Trail
    a[9530] = b:New(9530, 10, fac.Alliance, 9531); -- Writing in the Snow
    a[9531] = b:New(9531, 10, fac.Horde, 9530); -- Writing in the Snow
    a[9533] = b:New(9533, 10); -- Breaker of Chains
    a[9534] = b:New(9534, 10); -- Delectable Ogre Delicacies
    a[9535] = b:New(9535, 10); -- That Was Entirely Unnecessary
    a[9536] = b:New(9536, 10); -- Slagnarok
    a[9537] = b:New(9537, 10); -- By Fire Be... Merged?
    a[9538] = b:New(9538, 5); -- Intro to Husbandry
    a[9539] = b:New(9539, 10, fac.Alliance, 9705); -- Advanced Husbandry
    a[9540] = b:New(9540, 10, fac.Alliance, 9706); -- The Stable Master
    a[9541] = b:New(9541, 10); -- The Song of Silence
    a[9543] = b:New(9543, 5); -- Invasion? What Invasion?
    a[9545] = b:New(9545, 5, fac.Horde, 9100); -- More Plots
    a[9546] = b:New(9546, 5, fac.Horde, 9101); -- Even More Plots
    a[9547] = b:New(9547, 10); -- Everything Is Awesome!
    a[9548] = b:New(9548, 10); -- Buried Treasures
    a[9550] = b:New(9550, 0); -- "Boldly, You Sought the Power of Ragnaros"
    O(a[9550], "From", "Event", "514", "Until", "Event", "514");
    a[9551] = b:New(9551, 10); -- Demon's Souls
    a[9552] = b:New(9552, 10); -- No Tag-backs!
    a[9562] = b:New(9562, 10, fac.Horde, 9564); -- Securing Draenor
    a[9564] = b:New(9564, 10, fac.Alliance, 9562); -- Securing Draenor
    a[9565] = b:New(9565, 5); -- Master Trapper
    a[9566] = b:New(9566, 0, fac.Horde, 9729); -- Victory in Hillsbrad
    O(a[9566]);
    a[9571] = b:New(9571, 10); -- Broke Back Precipice
    a[9572] = b:New(9572, 10); -- Proving Yourself: Bronze Damage
    a[9573] = b:New(9573, 10); -- Proving Yourself: Silver Damage
    a[9574] = b:New(9574, 10); -- Proving Yourself: Gold Damage
    a[9575] = b:New(9575, 10); -- Proving Yourself: Endless Damage (Wave 10)
    a[9576] = b:New(9576, 10); -- Proving Yourself: Endless Damage (Wave 20)
    a[9577] = b:New(9577, 10); -- Proving Yourself: Endless Damage (Wave 30)
    a[9578] = b:New(9578, 10); -- Proving Yourself: Bronze Tank
    a[9579] = b:New(9579, 10); -- Proving Yourself: Silver Tank
    a[9580] = b:New(9580, 10); -- Proving Yourself: Gold Tank
    a[9581] = b:New(9581, 10); -- Proving Yourself: Endless Tank (Wave 10)
    a[9582] = b:New(9582, 10); -- Proving Yourself: Endless Tank (Wave 20)
    a[9583] = b:New(9583, 10); -- Proving Yourself: Endless Tank (Wave 30)
    a[9584] = b:New(9584, 10); -- Proving Yourself: Bronze Healer
    a[9585] = b:New(9585, 10); -- Proving Yourself: Silver Healer
    a[9586] = b:New(9586, 10); -- Proving Yourself: Gold Healer
    a[9587] = b:New(9587, 10); -- Proving Yourself: Endless Healer (Wave 10)
    a[9588] = b:New(9588, 10); -- Proving Yourself: Endless Healer (Wave 20)
    a[9589] = b:New(9589, 10); -- Proving Yourself: Endless Healer (Wave 30)
    a[9590] = b:New(9590, 10); -- You're Doing it Wrong
    a[9597] = b:New(9597, 0); -- You're Really Doing It Wrong
    a[9598] = b:New(9598, 10, fac.Alliance, 9599); -- Mountacular
    a[9599] = b:New(9599, 10, fac.Horde, 9598); -- Mountacular
    a[9600] = b:New(9600, 10); -- Monster Mash
    a[9601] = b:New(9601, 10); -- King of the Monsters
    a[9602] = b:New(9602, 10, fac.Alliance, 9606); -- Shoot For the Moon
    a[9605] = b:New(9605, 10); -- Arak Star
    a[9606] = b:New(9606, 10, fac.Horde, 9602); -- Frostfire Fridge
    a[9607] = b:New(9607, 10); -- Make It a Bonus
    a[9610] = b:New(9610, 10); -- History of Violence
    a[9612] = b:New(9612, 10); -- Eggs in One Basket
    a[9613] = b:New(9613, 10); -- "Fish Gotta Swim, Birds Gotta Eat"
    a[9615] = b:New(9615, 10); -- With a Nagrand Cherry On Top
    a[9617] = b:New(9617, 10); -- Making the Cut
    a[9618] = b:New(9618, 0); -- The Iron Invasion
    O(a[9618], "From", "Version", "060002", "Until", "Version", "060002");
    a[9619] = b:New(9619, 10); -- Savage Hero
    a[9620] = b:New(9620, 0); -- Challenge Master: Bloodmaul Slag Mines
    O(a[9620], "From", "Version", "060003", "Before", "Version", "070003");
    a[9621] = b:New(9621, 0); -- Challenge Master: Iron Docks
    O(a[9621], "From", "Version", "060003", "Before", "Version", "070003");
    a[9622] = b:New(9622, 0); -- Challenge Master: Auchindoun
    O(a[9622], "From", "Version", "060003", "Before", "Version", "070003");
    a[9623] = b:New(9623, 0); -- Challenge Master: Skyreach
    O(a[9623], "From", "Version", "060003", "Before", "Version", "070003");
    a[9624] = b:New(9624, 0); -- Challenge Master: The Everbloom
    O(a[9624], "From", "Version", "060003", "Before", "Version", "070003");
    a[9625] = b:New(9625, 0); -- Challenge Master: Grimrail Depot
    O(a[9625], "From", "Version", "060003", "Before", "Version", "070003");
    a[9626] = b:New(9626, 0); -- Challenge Master: Shadowmoon Burial Grounds
    O(a[9626], "From", "Version", "060003", "Before", "Version", "070003");
    a[9627] = b:New(9627, 0); -- Challenge Master: Upper Blackrock Spire
    O(a[9627], "From", "Version", "060003", "Before", "Version", "070003");
    a[9630] = b:New(9630, 10, fac.Alliance, 9248); -- Defender of Draenor
    a[9631] = b:New(9631, 10, fac.Alliance, 9255); -- Mythic Draenor Raider
    a[9632] = b:New(9632, 10); -- The Power Is Yours
    a[9633] = b:New(9633, 10); -- Cut off the Head
    a[9634] = b:New(9634, 10); -- Charged Up
    a[9635] = b:New(9635, 10); -- Bobbing for Orcs
    a[9636] = b:New(9636, 10); -- United We Stand
    a[9637] = b:New(9637, 10); -- Poor Communication
    a[9638] = b:New(9638, 10); -- Heralds of the Legion
    a[9639] = b:New(9639, 10); -- "Fight, Kill, Salute!"
    a[9640] = b:New(9640, 0); -- Chapter I: Call of the Archmage
    O(a[9640], "From", "Version", "060003", "Before", "Version", "070003");
    a[9641] = b:New(9641, 0); -- Chapter II: Gul'dan Strikes Back
    O(a[9641], "From", "Version", "060003", "Before", "Version", "070003");
    a[9642] = b:New(9642, 0); -- Chapter III: The Foundry Falls
    O(a[9642], "From", "Version", "060003", "Before", "Version", "070003");
    a[9643] = b:New(9643, 10); -- So. Many. Pets.
    a[9654] = b:New(9654, 10); -- Mean and Green
    a[9655] = b:New(9655, 10); -- Fight the Power
    a[9656] = b:New(9656, 10); -- In Plain Sight
    a[9658] = b:New(9658, 10); -- Pillars of Draenor
    a[9659] = b:New(9659, 10); -- Iron Wings
    a[9663] = b:New(9663, 10); -- Picky Palate
    a[9667] = b:New(9667, 10); -- Burn It to the Ground
    a[9670] = b:New(9670, 10); -- Toying Around
    a[9671] = b:New(9671, 10); -- Having a Ball
    a[9672] = b:New(9672, 10); -- Tons of Toys
    a[9673] = b:New(9673, 10); -- The Toymaster
    a[9674] = b:New(9674, 10); -- I Want More Talador
    a[9678] = b:New(9678, 10); -- Ancient No More
    a[9680] = b:New(9680, 0); -- Time is a Flat Circle
    O(a[9680], "From", "Version", "060200", "Before", "Version", "070003");
    a[9685] = b:New(9685, 5); -- Draenor Safari
    a[9686] = b:New(9686, 5); -- Aquatic Acquiescence
    a[9687] = b:New(9687, 5); -- Best of the Beasts
    a[9688] = b:New(9688, 5); -- Mousing Around
    a[9689] = b:New(9689, 5); -- Dragons!
    a[9690] = b:New(9690, 5); -- "Ragnaros, Watch and Learn"
    a[9691] = b:New(9691, 5); -- Flock Together
    a[9692] = b:New(9692, 5); -- "Murlocs, Harpies, and Wolvar, Oh My!"
    a[9693] = b:New(9693, 5); -- Master of Magic
    a[9694] = b:New(9694, 5); -- Roboteer
    a[9695] = b:New(9695, 5); -- The Lil' Necromancer
    a[9696] = b:New(9696, 10); -- Family Familiar
    a[9703] = b:New(9703, 5); -- Stay Awhile and Listen
    a[9705] = b:New(9705, 10, fac.Horde, 9539); -- Advanced Husbandry
    a[9706] = b:New(9706, 10, fac.Horde, 9540); -- The Stable Master
    a[9707] = b:New(9707, 0); -- Savagely Superior
    O(a[9707], "From", "Version", "060003a", "Before", "Version", "080001");
    a[9708] = b:New(9708, 0); -- Savagely Epic
    O(a[9708], "From", "Version", "060003a", "Before", "Version", "080001");
    a[9710] = b:New(9710, 10); -- Poisoning the Well
    a[9711] = b:New(9711, 10); -- Planned to Fail
    a[9712] = b:New(9712, 5); -- Shiny Pet Charmer
    a[9713] = b:New(9713, 5); -- Awake the Drakes
    a[9714] = b:New(9714, 10, fac.Alliance, 9715); -- Thy Kingdom Come
    a[9715] = b:New(9715, 10, fac.Horde, 9714); -- Thy Kingdom Come
    a[9724] = b:New(9724, 5); -- Taming Draenor
    a[9725] = b:New(9725, 0); -- The Last of Us
    a[9726] = b:New(9726, 10); -- Treasure Hunter
    a[9727] = b:New(9727, 10); -- Expert Treasure Hunter
    a[9728] = b:New(9728, 10); -- Grand Treasure Hunter
    a[9729] = b:New(9729, 0, fac.Alliance, 9566); -- Victory in Hillsbrad
    O(a[9729]);
    a[9738] = b:New(9738, 10, fac.Alliance, 9508); -- Warlord of Draenor
    a[9755] = b:New(9755, 5); -- Darkmoon Race Enthusiast
    a[9756] = b:New(9756, 5); -- Darkmoon Racer Novice
    a[9759] = b:New(9759, 5); -- Darkmoon Racer Jockey
    a[9760] = b:New(9760, 5); -- Darkmoon Racer Leadfoot
    a[9761] = b:New(9761, 5); -- Darkmoon Racer Roadhog
    a[9763] = b:New(9763, 0); -- Grommloc
    a[9764] = b:New(9764, 5); -- Rocketeer: Gold
    a[9766] = b:New(9766, 5); -- Rocketeer: Silver
    a[9769] = b:New(9769, 5); -- Rocketeer: Bronze
    a[9770] = b:New(9770, 5); -- Blast Off!
    a[9780] = b:New(9780, 5); -- Go-Getter
    a[9781] = b:New(9781, 5); -- Powermonger: Bronze
    a[9783] = b:New(9783, 5); -- Powermonger: Silver
    a[9785] = b:New(9785, 5); -- Powermonger: Gold
    a[9786] = b:New(9786, 5); -- Wayfarer
    a[9787] = b:New(9787, 5); -- Wanderluster: Bronze
    a[9790] = b:New(9790, 5); -- Wanderluster: Silver
    a[9792] = b:New(9792, 5); -- Wanderluster: Gold
    a[9793] = b:New(9793, 5); -- Big Race Enthusiast
    a[9794] = b:New(9794, 5); -- Big Race Novice
    a[9795] = b:New(9795, 5); -- Big Race Jockey
    a[9797] = b:New(9797, 5); -- Big Race Leadfoot
    a[9799] = b:New(9799, 5); -- Big Race Roadhog
    a[9800] = b:New(9800, 5); -- Rocket Man
    a[9801] = b:New(9801, 5); -- Big Rocketeer: Bronze
    a[9803] = b:New(9803, 5); -- Big Rocketeer: Silver
    a[9805] = b:New(9805, 5); -- Big Rocketeer: Gold
    a[9806] = b:New(9806, 5); -- Vagabond
    a[9807] = b:New(9807, 5); -- Big Wanderluster: Bronze
    a[9809] = b:New(9809, 5); -- Big Wanderluster: Silver
    a[9811] = b:New(9811, 5); -- Big Wanderluster: Gold
    a[9812] = b:New(9812, 5); -- Goal-Oriented
    a[9813] = b:New(9813, 5); -- Big Powermonger: Bronze
    a[9815] = b:New(9815, 5); -- Big Powermonger: Silver
    a[9817] = b:New(9817, 5); -- Big Powermonger: Gold
    a[9819] = b:New(9819, 5); -- Darkmoon Like the Wind
    a[9824] = b:New(9824, 10); -- Raiding with Leashes III: Drinkin' From the Sunwell
    a[9825] = b:New(9825, 10, fac.Alliance, 9836); -- Master Relic Hunter
    a[9826] = b:New(9826, 5); -- Platinum Defender
    a[9827] = b:New(9827, 10); -- Impervious Defender
    a[9828] = b:New(9828, 5, fac.Alliance, 9897); -- Ten Hit Tunes
    a[9833] = b:New(9833, 10, fac.Alliance, 9923); -- Loremaster of Draenor
    a[9836] = b:New(9836, 10, fac.Horde, 9825); -- Master Relic Hunter
    a[9838] = b:New(9838, 10); -- "What A Strange, Interdimensional Trip It's Been"
    a[9858] = b:New(9858, 10); -- Master and Commander
    a[9885] = b:New(9885, 10); -- Ace Tonk Commander
    a[9894] = b:New(9894, 10); -- Triumphant Turtle Tossing
    a[9897] = b:New(9897, 5, fac.Horde, 9828); -- Ten Hit Tunes
    a[9900] = b:New(9900, 10); -- Exploration Mission Master
    a[9901] = b:New(9901, 10, fac.Horde, 9928); -- Don't Call Me Junior
    a[9906] = b:New(9906, 10); -- Alt-ernative Lifestyle
    a[9908] = b:New(9908, 10); -- Ready for Powerleveling
    a[9909] = b:New(9909, 10); -- Heirloom Hoarder
    a[9911] = b:New(9911, 5); -- Where's the Mailbox?
    a[9912] = b:New(9912, 5, fac.Alliance, 9914); -- Azeroth's Top Twenty Tunes
    a[9914] = b:New(9914, 5, fac.Horde, 9912); -- Azeroth's Top Twenty Tunes
    a[9915] = b:New(9915, 0); -- Crashin' Thrashin' Shredder
    a[9923] = b:New(9923, 10, fac.Horde, 9833); -- Loremaster of Draenor
    a[9924] = b:New(9924, 5); -- Field Photographer
    a[9925] = b:New(9925, 0); -- Friends In Places Yet Even Higher Than That
    O(a[9925]);
    a[9926] = b:New(9926, 0); -- Hero of the Storm
    a[9928] = b:New(9928, 10, fac.Alliance, 9901); -- Don't Call Me Junior
    a[9972] = b:New(9972, 10); -- A Race Against Slime
    a[9979] = b:New(9979, 10); -- Get In My Belly!
    a[9983] = b:New(9983, 10); -- That's Whack!
    a[9988] = b:New(9988, 10); -- Pro Toss
    a[9989] = b:New(9989, 10); -- Non-Lethal Enforcer
    a[9995] = b:New(9995, 0, fac.Alliance, 9998); -- Soldier of the Alliance: Warlords Season 1
    O(a[9995], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9996] = b:New(9996, 0, fac.Alliance, 10001); -- Defender of the Alliance: Warlords Season 1
    O(a[9996], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9997] = b:New(9997, 0, fac.Alliance, 10000); -- Guardian of the Alliance: Warlords Season 1
    O(a[9997], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[9998] = b:New(9998, 0, fac.Horde, 9995); -- Soldier of the Horde: Warlords Season 1
    O(a[9998], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[10000] = b:New(10000, 0, fac.Horde, 9997); -- Guardian of the Horde: Warlords Season 1
    O(a[10000], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[10001] = b:New(10001, 0, fac.Horde, 9996); -- Defender of the Horde: Warlords Season 1
    O(a[10001], "From", "PvP Season", 16, "Until", "PvP Season", 16);
    a[10010] = b:New(10010, 10); -- Gate of the Setting Sun
    a[10011] = b:New(10011, 10); -- Siege of Niuzao Temple
    a[10012] = b:New(10012, 10); -- This Land Was Green and Good Until...
    a[10013] = b:New(10013, 10); -- Waves Came Crashing Down All Around
    a[10015] = b:New(10015, 5, fac.Alliance, 10016); -- Full Discography
    a[10016] = b:New(10016, 5, fac.Horde, 10015); -- Full Discography
    a[10017] = b:New(10017, 5); -- Naval Bonus Specialist
    a[10018] = b:New(10018, 25); -- Draenor Pathfinder
    a[10019] = b:New(10019, 10); -- The Black Gate
    a[10020] = b:New(10020, 10); -- Destructor's Rise
    a[10021] = b:New(10021, 0, fac.Alliance, 10148); -- Chapter IV: Darkness Incarnate
    O(a[10021], "From", "Version", "060200", "Before", "Version", "070003");
    a[10023] = b:New(10023, 10); -- Hellbreach
    a[10024] = b:New(10024, 10); -- Halls of Blood
    a[10025] = b:New(10025, 10); -- Bastion of Shadows
    a[10026] = b:New(10026, 10); -- Nearly Indestructible
    a[10027] = b:New(10027, 10); -- Mythic: Hellfire Assault
    a[10030] = b:New(10030, 10); -- Bad Manner(oth)
    a[10032] = b:New(10032, 10); -- Mythic: Iron Reaver
    a[10033] = b:New(10033, 10); -- Mythic: Kormrok
    a[10034] = b:New(10034, 10); -- Mythic: Hellfire High Council
    a[10035] = b:New(10035, 10); -- Mythic: Kilrogg Deadeye
    a[10036] = b:New(10036, 5); -- Naval Bonus Expert
    a[10037] = b:New(10037, 10); -- Mythic: Shadow-Lord Iskar
    a[10038] = b:New(10038, 10); -- Mythic: Fel Lord Zakuun
    a[10039] = b:New(10039, 10); -- Mythic: Xhul'horac
    a[10040] = b:New(10040, 10); -- Mythic: Socrethar the Eternal
    a[10041] = b:New(10041, 10); -- Mythic: Tyrant Velhari
    a[10042] = b:New(10042, 10); -- Mythic: Mannoroth
    a[10043] = b:New(10043, 10); -- Mythic: Archimonde
    a[10044] = b:New(10044, 0); -- Ahead of the Curve: The Black Gate
    O(a[10044], "From", "Version", "060200", "Before", "Version", "070003");
    a[10045] = b:New(10045, 0); -- Cutting Edge: The Black Gate
    O(a[10045], "From", "Version", "060200", "Before", "Version", "070003");
    a[10052] = b:New(10052, 10); -- Tiny Terrors in Tanaan
    a[10053] = b:New(10053, 10); -- I Found Pepe!
    a[10054] = b:New(10054, 10); -- Don't Fear the Reaper
    a[10057] = b:New(10057, 10); -- Turning the Tide
    a[10058] = b:New(10058, 0); -- WoW's 11th Anniversary
    O(a[10058]);
    a[10059] = b:New(10059, 10); -- Ain't No Mountain High Enough
    a[10061] = b:New(10061, 10); -- Hellbane
    a[10067] = b:New(10067, 10, fac.Alliance, 10074); -- In Pursuit of Gul'dan
    a[10068] = b:New(10068, 10, fac.Alliance, 10075); -- Draenor's Last Stand
    a[10069] = b:New(10069, 10); -- "I Came, I Clawed, I Conquered"
    a[10070] = b:New(10070, 10); -- Jungle Stalker
    a[10071] = b:New(10071, 10); -- The Legion Will NOT Conquer All
    a[10072] = b:New(10072, 25, fac.Alliance, 10265); -- Rumble in the Jungle
    a[10073] = b:New(10073, 10); -- Echoes of Doomfire
    a[10074] = b:New(10074, 10, fac.Horde, 10067); -- In Pursuit of Gul'dan
    a[10075] = b:New(10075, 10, fac.Horde, 10068); -- Draenor's Last Stand
    a[10076] = b:New(10076, 10); -- Mythic: Bloodmaul Slag Mines
    a[10079] = b:New(10079, 10); -- Mythic: Iron Docks
    a[10080] = b:New(10080, 10); -- Mythic: Auchindoun
    a[10081] = b:New(10081, 10); -- Mythic: Skyreach
    a[10082] = b:New(10082, 10); -- Mythic: Grimrail Depot
    a[10083] = b:New(10083, 10); -- Mythic: The Everbloom
    a[10084] = b:New(10084, 10); -- Mythic: Shadowmoon Burial Grounds
    a[10085] = b:New(10085, 10); -- Mythic: Upper Blackrock Spire
    a[10086] = b:New(10086, 10); -- I'm a Soul Man
    a[10087] = b:New(10087, 10); -- You Gotta Keep 'em Separated
    a[10088] = b:New(10088, 0, fac.Horde, 10089); -- Wild Conquest
    O(a[10088], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10089] = b:New(10089, 0, fac.Alliance, 10088); -- Wild Conquest
    O(a[10089], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10090] = b:New(10090, 0, fac.Horde, 10091); -- Warmongering Conquest
    O(a[10090], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10091] = b:New(10091, 0, fac.Alliance, 10090); -- Warmongering Conquest
    O(a[10091], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10092] = b:New(10092, 0, fac.Horde, 10093); -- Wild Combatant
    O(a[10092], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10093] = b:New(10093, 0, fac.Alliance, 10092); -- Wild Combatant
    O(a[10093], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10094] = b:New(10094, 0, fac.Horde, 10095); -- Warmongering Combatant
    O(a[10094], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10095] = b:New(10095, 0, fac.Alliance, 10094); -- Warmongering Combatant
    O(a[10095], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10096] = b:New(10096, 0); -- Wild Gladiator: Warlords Season 2
    O(a[10096], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10097] = b:New(10097, 0); -- Warmongering Gladiator: Warlords Season 3
    O(a[10097], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10098] = b:New(10098, 0); -- Gladiator: Warlords Season 2
    O(a[10098], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10099] = b:New(10099, 0); -- Duelist: Warlords Season 2
    O(a[10099], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10100] = b:New(10100, 0); -- Rival: Warlords Season 2
    O(a[10100], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10101] = b:New(10101, 0); -- Challenger: Warlords Season 2
    O(a[10101], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10102] = b:New(10102, 0, fac.Alliance, 10103); -- Hero of the Alliance: Wild
    O(a[10102], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10103] = b:New(10103, 0, fac.Horde, 10102); -- Hero of the Horde: Wild
    O(a[10103], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10104] = b:New(10104, 0, fac.Alliance, 10105); -- Soldier of the Alliance: Warlords Season 2
    O(a[10104], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10105] = b:New(10105, 0, fac.Horde, 10104); -- Soldier of the Horde: Warlords Season 2
    O(a[10105], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10106] = b:New(10106, 0, fac.Alliance, 10107); -- Defender of the Alliance: Warlords Season 2
    O(a[10106], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10107] = b:New(10107, 0, fac.Horde, 10106); -- Defender of the Horde: Warlords Season 2
    O(a[10107], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10108] = b:New(10108, 0, fac.Alliance, 10109); -- Guardian of the Alliance: Warlords Season 2
    O(a[10108], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10109] = b:New(10109, 0, fac.Horde, 10108); -- Guardian of the Horde: Warlords Season 2
    O(a[10109], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10110] = b:New(10110, 0); -- Gladiator: Warlords Season 3
    O(a[10110], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10111] = b:New(10111, 0); -- Duelist: Warlords Season 3
    O(a[10111], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10112] = b:New(10112, 0); -- Rival: Warlords Season 3
    O(a[10112], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10113] = b:New(10113, 0); -- Challenger: Warlords Season 3
    O(a[10113], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10114] = b:New(10114, 0, fac.Alliance, 10115); -- Hero of the Alliance: Warmongering
    O(a[10114], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10115] = b:New(10115, 0, fac.Horde, 10114); -- Hero of the Horde: Warmongering
    O(a[10115], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10116] = b:New(10116, 0, fac.Alliance, 10117); -- Guardian of the Alliance: Warlords Season 3
    O(a[10116], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10117] = b:New(10117, 0, fac.Horde, 10116); -- Guardian of the Horde: Warlords Season 3
    O(a[10117], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10118] = b:New(10118, 0, fac.Alliance, 10119); -- Defender of the Alliance: Warlords Season 3
    O(a[10118], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10119] = b:New(10119, 0, fac.Horde, 10118); -- Defender of the Horde: Warlords Season 3
    O(a[10119], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10120] = b:New(10120, 0, fac.Alliance, 10121); -- Soldier of the Alliance: Warlords Season 3
    O(a[10120], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10121] = b:New(10121, 0, fac.Horde, 10120); -- Soldier of the Horde: Warlords Season 3
    O(a[10121], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10137] = b:New(10137, 0); -- Wild Gladiator's Felblood Gronnling
    O(a[10137], "From", "PvP Season", 17, "Until", "PvP Season", 17);
    a[10146] = b:New(10146, 0); -- Warmongering Gladiator's Felblood Gronnling
    O(a[10146], "From", "PvP Season", 18, "Until", "PvP Season", 18);
    a[10148] = b:New(10148, 0, fac.Horde, 10021); -- Chapter IV: Darkness Incarnate
    O(a[10148], "From", "Version", "060200", "Before", "Version", "070003");
    a[10149] = b:New(10149, 25); -- Glory of the Hellfire Raider
    a[10154] = b:New(10154, 5); -- Naval Combat Expert
    a[10155] = b:New(10155, 5); -- Naval Siege Expert
    a[10156] = b:New(10156, 5); -- Naval Combat Specialist
    a[10159] = b:New(10159, 5); -- Naval Treasure Specialist
    a[10160] = b:New(10160, 5); -- Naval Treasure Expert
    a[10161] = b:New(10161, 5); -- Naval Siege Specialist
    a[10162] = b:New(10162, 5); -- Naval Training Specialist
    a[10163] = b:New(10163, 5); -- Naval Training Expert
    a[10164] = b:New(10164, 5); -- Master of the Seas
    a[10165] = b:New(10165, 5); -- Ironsides
    a[10166] = b:New(10166, 5); -- Naval Mechanics
    a[10167] = b:New(10167, 10, fac.Alliance, 10307); -- Exploring the High Seas
    a[10168] = b:New(10168, 5); -- Naval Armada
    a[10169] = b:New(10169, 5); -- Naval Fleet
    a[10170] = b:New(10170, 5); -- Seaman
    a[10172] = b:New(10172, 5, fac.Alliance, 10255); -- Petty Officer
    a[10173] = b:New(10173, 5, fac.Alliance, 10275); -- Fleet Commander
    a[10174] = b:New(10174, 10, fac.Alliance, 10276); -- Admiral
    a[10177] = b:New(10177, 5); -- Set Sail!
    a[10253] = b:New(10253, 10); -- Mythic: Gorefiend
    a[10255] = b:New(10255, 5, fac.Horde, 10172); -- Petty Officer
    a[10256] = b:New(10256, 10, fac.Alliance, 10258); -- Charting a Course
    a[10258] = b:New(10258, 10, fac.Horde, 10256); -- Charting a Course
    a[10259] = b:New(10259, 10); -- Jungle Hunter
    a[10260] = b:New(10260, 10); -- Explore Tanaan Jungle
    a[10261] = b:New(10261, 5); -- Jungle Treasure Hunter
    a[10262] = b:New(10262, 5); -- Jungle Treasure Master
    a[10265] = b:New(10265, 25, fac.Horde, 10072); -- Rumble in the Jungle
    a[10275] = b:New(10275, 5, fac.Horde, 10173); -- Fleet Commander
    a[10276] = b:New(10276, 10, fac.Horde, 10174); -- Admiral
    a[10307] = b:New(10307, 10, fac.Horde, 10167); -- Exploring the High Seas
    a[10309] = b:New(10309, 0); -- Collector's Edition: Zeradar
    a[10320] = b:New(10320, 0); -- Collector's Edition: Illidari Felstalker
    a[10321] = b:New(10321, 0); -- Collector's Edition: Nibbles
    a[10322] = b:New(10322, 0); -- Murkidan
    a[10334] = b:New(10334, 0); -- Predator
    a[10335] = b:New(10335, 0); -- Did Someone Say...?
    a[10337] = b:New(10337, 0); -- Crashin' Thrashin' Flamer
    a[10348] = b:New(10348, 10); -- Master Treasure Hunter
    a[10349] = b:New(10349, 10, fac.Horde, 10350); -- Tanaan Diplomat
    a[10350] = b:New(10350, 10, fac.Alliance, 10349); -- Tanaan Diplomat
    a[10353] = b:New(10353, 10); -- Iron Armada
    a[10354] = b:New(10354, 10); -- Crashin' Thrashin' Commander
    a[10355] = b:New(10355, 10, fac.Horde, 10356); -- Lord of the Reins
    a[10356] = b:New(10356, 10, fac.Alliance, 10355); -- Lord of the Reins
    a[10365] = b:New(10365, 10); -- A Frightening Friend
    a[10398] = b:New(10398, 5); -- Drum Circle
    a[10411] = b:New(10411, 10); -- Helheim Hath No Fury
    a[10412] = b:New(10412, 10); -- Poor Unfortunate Souls
    a[10413] = b:New(10413, 10); -- Instant Karma
    a[10456] = b:New(10456, 10); -- But You Say He's Just a Friend
    a[10457] = b:New(10457, 10); -- Stay Salty
    a[10458] = b:New(10458, 10); -- Ready for Raiding V
    a[10459] = b:New(10459, 10); -- Improving on History
    a[10460] = b:New(10460, 10); -- Hidden Potential
    a[10461] = b:New(10461, 10); -- Fighting with Style: Classic
    a[10537] = b:New(10537, 0); -- Patron of War
    O(a[10537]);
    a[10542] = b:New(10542, 10); -- I Got What You Mead
    a[10543] = b:New(10543, 10); -- Surge Protector
    a[10544] = b:New(10544, 10); -- Stag Party
    a[10553] = b:New(10553, 10); -- You're Just Making It WORSE!
    a[10554] = b:New(10554, 10); -- I Made a Food!
    a[10555] = b:New(10555, 10); -- Buggy Fight
    a[10561] = b:New(10561, 10); -- Honorable Medallion
    a[10575] = b:New(10575, 10); -- Burning Bridges
    a[10580] = b:New(10580, 0); -- Heroic Skills to Pay the Bills
    O(a[10580], "From", "Version", "070003", "Before", "Version", "080001");
    a[10581] = b:New(10581, 10); -- Working the Isles
    a[10582] = b:New(10582, 10); -- Professional Legion Master
    a[10583] = b:New(10583, 50); -- Legion Master of All
    a[10585] = b:New(10585, 0); -- Fel-Smelter
    O(a[10585], "From", "Version", "070003", "Before", "Version", "090100");
    a[10586] = b:New(10586, 0); -- Mass Obliteration
    O(a[10586], "From", "Version", "070003", "Before", "Version", "090100");
    a[10587] = b:New(10587, 10); -- Hot Swapper
    a[10588] = b:New(10588, 10); -- The Shortest Distance
    a[10589] = b:New(10589, 10); -- Legion Cook
    a[10591] = b:New(10591, 10); -- All Grown Up
    a[10592] = b:New(10592, 10); -- Never A Day's Rest
    a[10593] = b:New(10593, 5); -- Everything Tastes Better
    a[10594] = b:New(10594, 10); -- Legion Fisherman
    a[10595] = b:New(10595, 10); -- A Cast Above the Rest
    a[10596] = b:New(10596, 10); -- Bigger Fish to Fry
    a[10597] = b:New(10597, 10); -- Legion Aquaculture
    a[10598] = b:New(10598, 10); -- Fishing 'Round the Isles
    a[10599] = b:New(10599, 0); -- Legion Medic
    O(a[10599], "From", "Version", "070003", "Before", "Version", "080001");
    a[10600] = b:New(10600, 10); -- Legion Archaeologist
    a[10601] = b:New(10601, 10); -- Surveying the Land
    a[10602] = b:New(10602, 10); -- This Side Up
    a[10603] = b:New(10603, 10); -- A Keen Eye
    a[10604] = b:New(10604, 25); -- Legion Curator
    a[10605] = b:New(10605, 10); -- Handle With Care
    a[10606] = b:New(10606, 5); -- The Dwarven Dream
    a[10607] = b:New(10607, 10); -- Getting Your Hands Dirty
    a[10608] = b:New(10608, 10); -- Sifting Through the Sand
    a[10609] = b:New(10609, 10); -- No Stone Unturned
    a[10610] = b:New(10610, 10); -- Waiting for Gerdo
    a[10611] = b:New(10611, 10); -- Dropping Some Eaves
    a[10617] = b:New(10617, 10); -- Nightfallen But Not Forgotten
    a[10626] = b:New(10626, 5); -- Zoom!
    a[10627] = b:New(10627, 5); -- Going Up
    a[10657] = b:New(10657, 0); -- Fledgling Hero of Warcraft
    a[10663] = b:New(10663, 10); -- Imagined Dragons World Tour
    a[10665] = b:New(10665, 10); -- Explore Azsuna
    a[10666] = b:New(10666, 10); -- Explore Val'sharah
    a[10667] = b:New(10667, 10); -- Explore Highmountain
    a[10668] = b:New(10668, 10); -- Explore Stormheim
    a[10669] = b:New(10669, 10); -- Explore Suramar
    a[10671] = b:New(10671, 0); -- Level 110 (Legacy)
    O(a[10671], "From", "Version", "070003", "Before", "Version", "090001");
    a[10672] = b:New(10672, 10); -- Broken Isles Diplomat
    a[10678] = b:New(10678, 10); -- Cage Rematch
    a[10679] = b:New(10679, 10); -- I Ain't Even Cold
    a[10680] = b:New(10680, 10); -- Who's Afraid of the Dark?
    a[10681] = b:New(10681, 5); -- Fashionista: Head
    a[10682] = b:New(10682, 5); -- Fashionista: Chest
    a[10684] = b:New(10684, 5); -- Fashionista: Legs
    a[10685] = b:New(10685, 5); -- Fashionista: Feet
    a[10686] = b:New(10686, 5); -- Fashionista: Waist
    a[10687] = b:New(10687, 5); -- Fashionista: Back
    a[10688] = b:New(10688, 5); -- Fashionista: Wrist
    a[10689] = b:New(10689, 5); -- Fashionista: Weapon & Off-Hand
    a[10690] = b:New(10690, 5); -- Fashionista: Tabard
    a[10691] = b:New(10691, 5); -- Fashionista: Shirt
    a[10692] = b:New(10692, 5); -- Fashionista: Shoulder
    a[10693] = b:New(10693, 5); -- Fashionista: Hand
    a[10694] = b:New(10694, 10); -- Fabulous
    a[10696] = b:New(10696, 10); -- I've Got My Eyes On You
    a[10697] = b:New(10697, 10); -- Grand Opening
    a[10698] = b:New(10698, 10); -- That's Val'sharah Folks!
    a[10699] = b:New(10699, 10); -- Infinitesimal
    a[10704] = b:New(10704, 10); -- Not For You
    a[10706] = b:New(10706, 5); -- Training the Troops
    a[10707] = b:New(10707, 10); -- "A Specter, Illuminated"
    a[10709] = b:New(10709, 10); -- You Used to Scrawl Me In Your Fel Tome
    a[10710] = b:New(10710, 10); -- Black Rook Moan
    a[10711] = b:New(10711, 10); -- Adds? More Like Bads
    a[10722] = b:New(10722, 10); -- The Wish Remover
    a[10741] = b:New(10741, 0); -- WoW's 12th Anniversary
    O(a[10741]);
    a[10742] = b:New(10742, 10); -- Gluten Free
    a[10743] = b:New(10743, 0, fac.Alliance, 10745); -- The Prestige
    O(a[10743], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[10745] = b:New(10745, 0, fac.Horde, 10743); -- The Prestige
    O(a[10745], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[10746] = b:New(10746, 10); -- Forged for Battle
    a[10747] = b:New(10747, 10); -- Fighting with Style: Upgraded
    O(a[10747], "From", "Version", "070003", "Before", "Version", "080001");
    a[10748] = b:New(10748, 10); -- Fighting with Style: Valorous
    a[10749] = b:New(10749, 10, fac.Alliance, 11173); -- Fighting with Style: War-torn
    a[10750] = b:New(10750, 10); -- Fighting with Style: Hidden
    a[10751] = b:New(10751, 0); -- Brr... It's Cold in Here
    a[10753] = b:New(10753, 10); -- Scare Bear
    a[10754] = b:New(10754, 10); -- Fruit of All Evil
    a[10755] = b:New(10755, 10); -- I Attack the Darkness
    a[10756] = b:New(10756, 10); -- Leyline Bling
    a[10761] = b:New(10761, 10); -- Resourceful
    a[10762] = b:New(10762, 10); -- The Legion Menu
    a[10763] = b:New(10763, 10); -- Azsuna Matata
    a[10764] = b:New(10764, 0); -- Brokenly Superior
    O(a[10764], "From", "Version", "070003", "Before", "Version", "080001");
    a[10765] = b:New(10765, 0); -- Brokenly Epic
    O(a[10765], "From", "Version", "070003", "Before", "Version", "080001");
    a[10766] = b:New(10766, 10); -- Egg-cellent!
    a[10769] = b:New(10769, 10); -- Burning Down the House
    a[10770] = b:New(10770, 5); -- The Tangerine Traveler
    a[10771] = b:New(10771, 10); -- Webbing Crashers
    a[10772] = b:New(10772, 10); -- Use the Force(s)
    a[10773] = b:New(10773, 10); -- Arcanic Cling
    a[10774] = b:New(10774, 5); -- Hatchling of the Talon
    a[10775] = b:New(10775, 10); -- Clean House
    a[10776] = b:New(10776, 10); -- No Time to Waste
    a[10778] = b:New(10778, 10); -- The Nightfallen
    a[10780] = b:New(10780, 10); -- Eye of Azshara
    a[10781] = b:New(10781, 10); -- Heroic: Eye of Azshara
    a[10782] = b:New(10782, 10); -- Mythic: Eye of Azshara
    a[10783] = b:New(10783, 10); -- Darkheart Thicket
    a[10784] = b:New(10784, 10); -- Heroic: Darkheart Thicket
    a[10785] = b:New(10785, 10); -- Mythic: Darkheart Thicket
    a[10786] = b:New(10786, 10); -- Halls of Valor
    a[10788] = b:New(10788, 10); -- Heroic: Halls of Valor
    a[10789] = b:New(10789, 10); -- Mythic: Halls of Valor
    a[10790] = b:New(10790, 10); -- "Vrykul Story, Bro"
    a[10793] = b:New(10793, 5); -- What a Ripoff!
    a[10795] = b:New(10795, 10); -- Neltharion's Lair
    a[10796] = b:New(10796, 10); -- Heroic: Neltharion's Lair
    a[10797] = b:New(10797, 10); -- Mythic: Neltharion's Lair
    a[10798] = b:New(10798, 10); -- Assault on Violet Hold
    a[10799] = b:New(10799, 10); -- Heroic: Assault on Violet Hold
    a[10800] = b:New(10800, 10); -- Mythic: Assault on Violet Hold
    a[10801] = b:New(10801, 10); -- Vault of the Wardens
    a[10802] = b:New(10802, 10); -- Heroic: Vault of the Wardens
    a[10803] = b:New(10803, 10); -- Mythic: Vault of the Wardens
    a[10804] = b:New(10804, 10); -- Black Rook Hold
    a[10805] = b:New(10805, 10); -- Heroic: Black Rook Hold
    a[10806] = b:New(10806, 10); -- Mythic: Black Rook Hold
    a[10807] = b:New(10807, 10); -- Maw of Souls
    a[10808] = b:New(10808, 10); -- Heroic: Maw of Souls
    a[10809] = b:New(10809, 10); -- Mythic: Maw of Souls
    a[10813] = b:New(10813, 10); -- Mythic: The Arcway
    a[10816] = b:New(10816, 10); -- Mythic: Court of Stars
    a[10817] = b:New(10817, 10); -- A Change In Scenery
    a[10818] = b:New(10818, 10); -- Darkbough
    a[10819] = b:New(10819, 10); -- Tormented Guardians
    a[10820] = b:New(10820, 10); -- Rift of Aln
    a[10821] = b:New(10821, 10); -- Mythic: Nythendra
    a[10822] = b:New(10822, 10); -- Mythic: Elerethe Renferal
    a[10823] = b:New(10823, 10); -- Mythic: Il'gynoth
    a[10824] = b:New(10824, 10); -- Mythic: Ursoc
    a[10825] = b:New(10825, 10); -- Mythic: Dragons of Nightmare
    a[10826] = b:New(10826, 10); -- Mythic: Cenarius
    a[10827] = b:New(10827, 10); -- Mythic: Xavius
    a[10829] = b:New(10829, 10); -- Arcing Aqueducts
    a[10830] = b:New(10830, 10); -- Took the Red Eye Down
    a[10837] = b:New(10837, 10); -- Royal Athenaeum
    a[10838] = b:New(10838, 10); -- Nightspire
    a[10839] = b:New(10839, 10); -- Betrayer's Rise
    a[10840] = b:New(10840, 10); -- Mythic: Skorpyron
    a[10842] = b:New(10842, 10); -- Mythic: Chronomatic Anomaly
    a[10843] = b:New(10843, 10); -- Mythic: Trilliax
    a[10844] = b:New(10844, 10); -- Mythic: Spellblade Aluriel
    a[10845] = b:New(10845, 10); -- Mythic: Star Augur Etraeus
    a[10846] = b:New(10846, 10); -- Mythic: High Botanist Tel'arn
    a[10847] = b:New(10847, 10); -- Mythic: Tichondrius
    a[10848] = b:New(10848, 10); -- Mythic: Krosus
    a[10849] = b:New(10849, 10); -- Mythic: Grand Magistrix Elisande
    a[10850] = b:New(10850, 10); -- Mythic: Gul'dan
    a[10851] = b:New(10851, 10); -- Elementalry!
    a[10852] = b:New(10852, 0); -- Artifact or Artifiction
    O(a[10852], "From", "Version", "070003", "Before", "Version", "080001");
    a[10853] = b:New(10853, 0); -- Part of History
    O(a[10853], "From", "Version", "070003", "Before", "Version", "080001");
    a[10875] = b:New(10875, 10); -- Can't Eat Just One
    a[10876] = b:New(10876, 10); -- Battle on the Broken Isles
    a[10877] = b:New(10877, 25); -- Pillars of Creation
    a[10991] = b:New(10991, 0); -- First Step into a Larger World
    O(a[10991], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[10992] = b:New(10992, 0); -- Here We Go Again
    O(a[10992], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[10993] = b:New(10993, 0); -- Third Time's the Charm
    O(a[10993], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[10994] = b:New(10994, 10); -- A Glorious Campaign
    a[10995] = b:New(10995, 0); -- For Prestige
    O(a[10995], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[10996] = b:New(10996, 10); -- Got to Ketchum All
    a[10997] = b:New(10997, 0, fac.Horde, 10998); -- Vindictive Combatant
    O(a[10997], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[10998] = b:New(10998, 0, fac.Alliance, 10997); -- Vindictive Combatant
    O(a[10998], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[10999] = b:New(10999, 0); -- Vindictive Gladiator's Storm Dragon
    O(a[10999], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11000] = b:New(11000, 0); -- Fearless Gladiator's Storm Dragon
    O(a[11000], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11001] = b:New(11001, 0); -- Cruel Gladiator's Storm Dragon
    O(a[11001], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11002] = b:New(11002, 0); -- Ferocious Gladiator's Storm Dragon
    O(a[11002], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11003] = b:New(11003, 0, fac.Horde, 11004); -- Fearless Combatant
    O(a[11003], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11004] = b:New(11004, 0, fac.Alliance, 11003); -- Fearless Combatant
    O(a[11004], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11005] = b:New(11005, 0, fac.Horde, 11008); -- Cruel Combatant
    O(a[11005], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11008] = b:New(11008, 0, fac.Alliance, 11005); -- Cruel Combatant
    O(a[11008], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11009] = b:New(11009, 0, fac.Horde, 11010); -- Ferocious Combatant
    O(a[11009], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11010] = b:New(11010, 0, fac.Alliance, 11009); -- Ferocious Combatant
    O(a[11010], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11011] = b:New(11011, 0); -- Gladiator: Legion Season 1
    O(a[11011], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11012] = b:New(11012, 0); -- Vindictive Gladiator: Legion Season 1
    O(a[11012], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11013] = b:New(11013, 0); -- Gladiator: Legion Season 2
    O(a[11013], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11014] = b:New(11014, 0); -- Fearless Gladiator: Legion Season 2
    O(a[11014], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11015] = b:New(11015, 0); -- Duelist: Legion Season 1
    O(a[11015], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11016] = b:New(11016, 0); -- Rival: Legion Season 1
    O(a[11016], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11017] = b:New(11017, 0); -- Challenger: Legion Season 1
    O(a[11017], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11018] = b:New(11018, 0, fac.Alliance, 11019); -- Hero of the Alliance: Vindictive
    O(a[11018], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11019] = b:New(11019, 0, fac.Horde, 11018); -- Hero of the Horde: Vindictive
    O(a[11019], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11020] = b:New(11020, 0, fac.Alliance, 11021); -- Guardian of the Alliance: Legion Season 1
    O(a[11020], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11021] = b:New(11021, 0, fac.Horde, 11020); -- Guardian of the Horde: Legion Season 1
    O(a[11021], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11022] = b:New(11022, 0, fac.Alliance, 11023); -- Defender of the Alliance: Legion Season 1
    O(a[11022], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11023] = b:New(11023, 0, fac.Horde, 11022); -- Defender of the Horde: Legion Season 1
    O(a[11023], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11024] = b:New(11024, 0, fac.Alliance, 11025); -- Soldier of the Alliance: Legion Season 1
    O(a[11024], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11025] = b:New(11025, 0, fac.Horde, 11024); -- Soldier of the Horde: Legion Season 1
    O(a[11025], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11026] = b:New(11026, 0); -- Duelist: Legion Season 2
    O(a[11026], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11027] = b:New(11027, 0); -- Rival: Legion Season 2
    O(a[11027], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11028] = b:New(11028, 0); -- Challenger: Legion Season 2
    O(a[11028], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11029] = b:New(11029, 0, fac.Horde, 11030); -- Hero of the Horde: Fearless
    O(a[11029], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11030] = b:New(11030, 0, fac.Alliance, 11029); -- Hero of the Alliance: Fearless
    O(a[11030], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11031] = b:New(11031, 0, fac.Horde, 11032); -- Guardian of the Horde: Legion Season 2
    O(a[11031], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11032] = b:New(11032, 0, fac.Alliance, 11031); -- Guardian of the Alliance: Legion Season 2
    O(a[11032], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11033] = b:New(11033, 0, fac.Horde, 11034); -- Defender of the Horde: Legion Season 2
    O(a[11033], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11034] = b:New(11034, 0, fac.Alliance, 11033); -- Defender of the Alliance: Legion Season 2
    O(a[11034], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11035] = b:New(11035, 0, fac.Horde, 11036); -- Soldier of the Horde: Legion Season 2
    O(a[11035], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11036] = b:New(11036, 0, fac.Alliance, 11035); -- Soldier of the Alliance: Legion Season 2
    O(a[11036], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11037] = b:New(11037, 0); -- Cruel Gladiator: Legion Season 3
    O(a[11037], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11038] = b:New(11038, 0); -- Gladiator: Legion Season 3
    O(a[11038], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11039] = b:New(11039, 0); -- Challenger: Legion Season 3
    O(a[11039], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11040] = b:New(11040, 0); -- Rival: Legion Season 3
    O(a[11040], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11041] = b:New(11041, 0); -- Duelist: Legion Season 3
    O(a[11041], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11042] = b:New(11042, 0, fac.Horde, 11043); -- Hero of the Horde: Cruel
    O(a[11042], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11043] = b:New(11043, 0, fac.Alliance, 11042); -- Hero of the Alliance: Cruel
    O(a[11043], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11044] = b:New(11044, 0, fac.Horde, 11045); -- Defender of the Horde: Legion Season 3
    O(a[11044], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11045] = b:New(11045, 0, fac.Alliance, 11044); -- Defender of the Alliance: Legion Season 3
    O(a[11045], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11046] = b:New(11046, 0, fac.Horde, 11047); -- Guardian of the Horde: Legion Season 3
    O(a[11046], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11047] = b:New(11047, 0, fac.Alliance, 11046); -- Guardian of the Alliance: Legion Season 3
    O(a[11047], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11048] = b:New(11048, 0, fac.Horde, 11049); -- Soldier of the Horde: Legion Season 3
    O(a[11048], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11049] = b:New(11049, 0, fac.Alliance, 11048); -- Soldier of the Alliance: Legion Season 3
    O(a[11049], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11050] = b:New(11050, 0, fac.Alliance, 11051); -- Soldier of the Alliance: Legion Season 4
    O(a[11050], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11051] = b:New(11051, 0, fac.Horde, 11050); -- Soldier of the Horde: Legion Season 4
    O(a[11051], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11052] = b:New(11052, 0, fac.Alliance, 11053); -- Guardian of the Alliance: Legion Season 4
    O(a[11052], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11053] = b:New(11053, 0, fac.Horde, 11052); -- Guardian of the Horde: Legion Season 4
    O(a[11053], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11054] = b:New(11054, 0, fac.Alliance, 11055); -- Defender of the Alliance: Legion Season 4
    O(a[11054], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11055] = b:New(11055, 0, fac.Horde, 11054); -- Defender of the Horde: Legion Season 4
    O(a[11055], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11056] = b:New(11056, 0, fac.Alliance, 11057); -- Hero of the Alliance: Ferocious
    O(a[11056], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11057] = b:New(11057, 0, fac.Horde, 11056); -- Hero of the Horde: Ferocious
    O(a[11057], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11058] = b:New(11058, 0); -- Duelist: Legion Season 4
    O(a[11058], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11059] = b:New(11059, 0); -- Rival: Legion Season 4
    O(a[11059], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11060] = b:New(11060, 0); -- Challenger: Legion Season 4
    O(a[11060], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11061] = b:New(11061, 0); -- Gladiator: Legion Season 4
    O(a[11061], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11062] = b:New(11062, 0); -- Ferocious Gladiator: Legion Season 4
    O(a[11062], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11064] = b:New(11064, 0); -- Collector's Edition: Baby Winston
    a[11065] = b:New(11065, 0); -- It All Makes Sense Now
    O(a[11065], "From", "Version", "070003", "Until", "Version", "070003");
    a[11066] = b:New(11066, 10); -- Underbelly Tycoon
    a[11124] = b:New(11124, 10); -- Good Suramaritan
    a[11125] = b:New(11125, 10); -- Now You're Thinking With Portals
    a[11126] = b:New(11126, 5); -- 50 World Quests Completed
    a[11127] = b:New(11127, 5); -- 200 World Quests Completed
    a[11128] = b:New(11128, 5); -- 500 World Quests Completed
    a[11129] = b:New(11129, 5); -- 1000 World Quests Completed
    a[11130] = b:New(11130, 5); -- 2500 World Quests Completed
    a[11131] = b:New(11131, 5); -- 5000 World Quests Completed
    a[11132] = b:New(11132, 5); -- "10,000 World Quests Completed"
    a[11133] = b:New(11133, 10); -- Why Can't I Hold All This Mana?
    a[11135] = b:New(11135, 20); -- A Heroic Campaign
    a[11136] = b:New(11136, 30); -- An Epic Campaign
    a[11137] = b:New(11137, 0); -- A Legendary Campaign
    a[11138] = b:New(11138, 0); -- Is There a Medic in the Zone?
    O(a[11138], "From", "Version", "070003", "Before", "Version", "080001");
    a[11139] = b:New(11139, 0); -- Field Medic
    O(a[11139], "From", "Version", "070003", "Before", "Version", "080001");
    a[11144] = b:New(11144, 0); -- Power Realized
    O(a[11144], "From", "Version", "070003", "Before", "Version", "080001");
    a[11157] = b:New(11157, 10); -- Loremaster of Legion
    a[11159] = b:New(11159, 5); -- Friends in a Broken Land
    a[11160] = b:New(11160, 10); -- Unleashed Monstrosities
    a[11162] = b:New(11162, 10); -- Keystone Master
    a[11163] = b:New(11163, 25); -- Glory of the Legion Hero
    a[11164] = b:New(11164, 20); -- Legion Dungeon Hero
    a[11165] = b:New(11165, 0, fac.Alliance, 11166); -- Crest of Heroism
    O(a[11165], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11166] = b:New(11166, 0, fac.Horde, 11165); -- Crest of Heroism
    O(a[11166], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11167] = b:New(11167, 0, fac.Alliance, 11168); -- Crest of Carnage
    O(a[11167], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11168] = b:New(11168, 0, fac.Horde, 11167); -- Crest of Carnage
    O(a[11168], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11169] = b:New(11169, 0, fac.Alliance, 11170); -- Crest of Devastation
    O(a[11169], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11170] = b:New(11170, 0, fac.Horde, 11169); -- Crest of Devastation
    O(a[11170], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11171] = b:New(11171, 10); -- Arsenal of Power
    a[11173] = b:New(11173, 10, fac.Horde, 10749); -- Fighting with Style: War-torn
    a[11175] = b:New(11175, 10); -- Higher Dimensional Learning
    a[11176] = b:New(11176, 10); -- Remember to Share
    a[11177] = b:New(11177, 10); -- 70 Exalted Reputations
    a[11178] = b:New(11178, 10); -- Wake the Dragon
    a[11180] = b:New(11180, 25); -- Glory of the Legion Raider
    a[11181] = b:New(11181, 10); -- Legion Keymaster
    O(a[11181], "From", "Version", "070003", "Before", "Version", "080001");
    a[11183] = b:New(11183, 10); -- Keystone Initiate
    a[11184] = b:New(11184, 10); -- Keystone Challenger
    a[11185] = b:New(11185, 10); -- Keystone Conqueror
    a[11186] = b:New(11186, 5); -- Tehd & Marius' Excellent Adventure
    a[11188] = b:New(11188, 25); -- Broken Isles Explorer
    a[11189] = b:New(11189, 10); -- Variety is the Spice of Life
    a[11190] = b:New(11190, 25); -- "Broken Isles Pathfinder, Part One"
    a[11191] = b:New(11191, 0); -- Cutting Edge: Xavius
    O(a[11191], "From", "Version", "070003", "Before", "Version", "070105");
    a[11192] = b:New(11192, 0); -- Cutting Edge: Gul'dan
    O(a[11192], "From", "Version", "070105", "Before", "Version", "070205");
    a[11194] = b:New(11194, 0); -- Ahead of the Curve: Xavius
    O(a[11194], "From", "Version", "070003", "Before", "Version", "070105");
    a[11195] = b:New(11195, 0); -- Ahead of the Curve: Gul'dan
    O(a[11195], "From", "Version", "070105", "Before", "Version", "070205");
    a[11200] = b:New(11200, 0); -- Stand Against the Legion
    O(a[11200], "From", "Version", "070003", "Until", "Version", "070003");
    a[11201] = b:New(11201, 0); -- Defender of Azeroth: Legion Invasions
    O(a[11201], "From", "Version", "070003", "Until", "Version", "070003");
    a[11210] = b:New(11210, 0); -- Fight for the Alliance
    O(a[11210]);
    a[11211] = b:New(11211, 0); -- Fight for the Horde
    O(a[11211]);
    a[11212] = b:New(11212, 5); -- Raise an Army
    a[11213] = b:New(11213, 5); -- Lead a Legion
    a[11214] = b:New(11214, 5); -- Many Missions
    a[11215] = b:New(11215, 5); -- Quite a Few Missions
    a[11216] = b:New(11216, 5); -- So Many Missions
    a[11217] = b:New(11217, 5); -- "Many Many Missions, Handle It!"
    a[11218] = b:New(11218, 0); -- There's a Boss In There
    O(a[11218], "From", "Version", "070003", "Before", "Version", "080001");
    a[11219] = b:New(11219, 5); -- Need Backup
    a[11220] = b:New(11220, 5); -- Roster of Champions
    a[11221] = b:New(11221, 5); -- Champions Rise
    a[11222] = b:New(11222, 5); -- Champions of Power
    a[11223] = b:New(11223, 5); -- Legendary Research
    a[11224] = b:New(11224, 0, nil, nil, true); -- Realm First! Legion Keystone Master
    O(a[11224], "Once");
    a[11232] = b:New(11232, 5); -- "Lock, Stock and Two Smoking Goblins"
    a[11233] = b:New(11233, 5); -- Broken Isles Safari
    a[11240] = b:New(11240, 5); -- Harbinger
    a[11256] = b:New(11256, 10); -- Treasures of Azsuna
    a[11257] = b:New(11257, 10); -- Treasures of Highmountain
    a[11258] = b:New(11258, 10); -- Treasures of Val'sharah
    a[11259] = b:New(11259, 10); -- Treasures of Stormheim
    a[11260] = b:New(11260, 10); -- Treasures of Suramar
    a[11261] = b:New(11261, 10); -- Adventurer of Azsuna
    a[11262] = b:New(11262, 10); -- Adventurer of Val'sharah
    a[11263] = b:New(11263, 10); -- Adventurer of Stormheim
    a[11264] = b:New(11264, 10); -- Adventurer of Highmountain
    a[11265] = b:New(11265, 10); -- Adventurer of Suramar
    a[11276] = b:New(11276, 10, fac.Alliance, 11277); -- Extinguishing Draenor
    a[11277] = b:New(11277, 10, fac.Horde, 11276); -- Extinguishing Draenor
    a[11278] = b:New(11278, 10, fac.Alliance, 11279); -- Extinguishing the Broken Isles
    a[11279] = b:New(11279, 10, fac.Horde, 11278); -- Extinguishing the Broken Isles
    a[11280] = b:New(11280, 10, fac.Alliance, 11282); -- Flame Warden of the Broken Isles
    a[11282] = b:New(11282, 10, fac.Horde, 11280); -- Flame Keeper of the Broken Isles
    a[11283] = b:New(11283, 10, fac.Alliance, 11284); -- Flame Warden of Draenor
    a[11284] = b:New(11284, 10, fac.Horde, 11283); -- Flame Keeper of Draenor
    a[11294] = b:New(11294, 0); -- Murloc Battlemasters
    a[11296] = b:New(11296, 0); -- The Ancient Keeper
    O(a[11296], "From", "Version", "030002", "Before", "Version", "040003a");
    a[11297] = b:New(11297, 0); -- The Balance of Light and Shadow
    O(a[11297], "From", "Version", "030002", "Before", "Version", "040003a");
    a[11298] = b:New(11298, 10); -- A Classy Outfit
    a[11320] = b:New(11320, 10); -- Raiding with Leashes IV: Wrath of the Lick King
    a[11335] = b:New(11335, 10); -- Season Tickets
    a[11337] = b:New(11337, 10); -- You Runed Everything!
    a[11338] = b:New(11338, 10); -- Dine and Bash
    a[11340] = b:New(11340, 10); -- Insurrection
    a[11377] = b:New(11377, 10); -- Patient Zero
    a[11386] = b:New(11386, 10); -- Boneafide Tri Tip
    a[11387] = b:New(11387, 0); -- The Chosen
    O(a[11387], "From", "Version", "070100", "Before", "Version", "080001");
    a[11394] = b:New(11394, 10); -- Trial of Valor
    a[11395] = b:New(11395, 0); -- Diablo's 20th Anniversary
    O(a[11395]);
    a[11396] = b:New(11396, 10); -- Mythic: Odyn
    a[11397] = b:New(11397, 10); -- Mythic: Guarm
    a[11398] = b:New(11398, 10); -- Mythic: Helya
    a[11425] = b:New(11425, 0); -- Herald of Flames
    O(a[11425]);
    a[11426] = b:New(11426, 10); -- Heroic: Trial of Valor
    a[11427] = b:New(11427, 5); -- No Shellfish Endeavor
    a[11429] = b:New(11429, 10); -- Mythic: Return to Karazhan
    a[11430] = b:New(11430, 10); -- One Night in Karazhan
    a[11431] = b:New(11431, 10); -- The Rat Pack
    a[11432] = b:New(11432, 10); -- Scared Straight
    a[11433] = b:New(11433, 10); -- Burn After Reading
    a[11446] = b:New(11446, 25); -- "Broken Isles Pathfinder, Part Two"
    a[11468] = b:New(11468, 0); -- Alive for Five
    O(a[11468], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11469] = b:New(11469, 0); -- The River Six
    O(a[11469], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11470] = b:New(11470, 0); -- Slayin' to Seven
    O(a[11470], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11471] = b:New(11471, 0); -- "Don't Hate, Grind to Eight"
    O(a[11471], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11472] = b:New(11472, 0); -- "Hell, It's About Nine"
    O(a[11472], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11474] = b:New(11474, 20, nil, nil, nil, nil, custObj[11474]); -- "Free For All, More For Me"
    a[11475] = b:New(11475, 10); -- Mission Accomplished
    a[11476] = b:New(11476, 10); -- Saddle Sore
    a[11477] = b:New(11477, 10); -- Off the Top Rook
    a[11478] = b:New(11478, 10); -- The Darkbrul-oh
    a[11543] = b:New(11543, 10); -- Explore Broken Shore
    a[11544] = b:New(11544, 10); -- Defender of the Broken Isles
    a[11545] = b:New(11545, 5); -- Legionfall Commander
    a[11546] = b:New(11546, 10); -- Breaching the Tomb
    a[11558] = b:New(11558, 5, fac.Alliance, 11559); -- The First Rule of Brawler's Guild
    O(a[11558], "From", "Version", "080105", "Before", "Version", "090001");
    a[11559] = b:New(11559, 5, fac.Horde, 11558); -- The First Rule of Brawler's Guild
    O(a[11559], "From", "Version", "080105", "Before", "Version", "090001");
    a[11560] = b:New(11560, 0, fac.Alliance, 11561); -- You Are Not Your $#*@! Legplates (Season 3)
    O(a[11560], "From", "Version", "070105", "Before", "Version", "080001");
    a[11561] = b:New(11561, 0, fac.Horde, 11560); -- You Are Not Your $#*@! Legplates (Season 3)
    O(a[11561], "From", "Version", "070105", "Before", "Version", "080001");
    a[11563] = b:New(11563, 0, fac.Alliance, 11564); -- The Second Rule of Brawler's Guild (Season 3)
    O(a[11563], "From", "Version", "070105", "Before", "Version", "080001");
    a[11564] = b:New(11564, 0, fac.Horde, 11563); -- The Second Rule of Brawler's Guild (Season 3)
    O(a[11564], "From", "Version", "070105", "Before", "Version", "080001");
    a[11565] = b:New(11565, 0, fac.Alliance, 11566); -- King of the Guild (Season 3)
    O(a[11565], "From", "Version", "070105", "Before", "Version", "080001");
    a[11566] = b:New(11566, 0, fac.Horde, 11565); -- King of the Guild (Season 3)
    O(a[11566], "From", "Version", "070105", "Before", "Version", "080001");
    a[11567] = b:New(11567, 5); -- You Are Not The Contents Of Your Wallet
    O(a[11567], "From", "Version", "080105", "Before", "Version", "090001");
    a[11570] = b:New(11570, 5); -- Educated Guesser
    O(a[11570], "From", "Version", "080105", "Before", "Version", "090001");
    a[11572] = b:New(11572, 0); -- I Am Thrall's Complete Lack Of Surprise (Season 3)
    O(a[11572], "From", "Version", "070105", "Before", "Version", "080001");
    a[11573] = b:New(11573, 5); -- Rumble Club
    O(a[11573], "From", "Version", "080105", "Before", "Version", "090001");
    a[11578] = b:New(11578, 0); -- Vindictive Elite
    O(a[11578], "From", "PvP Season", 19, "Until", "PvP Season", 19);
    a[11579] = b:New(11579, 0); -- Fearless Elite
    O(a[11579], "From", "PvP Season", 20, "Until", "PvP Season", 20);
    a[11580] = b:New(11580, 0); -- Cutting Edge: Helya
    O(a[11580], "From", "Version", "070100", "Before", "Version", "070205");
    a[11581] = b:New(11581, 0); -- Ahead of the Curve: Helya
    O(a[11581], "From", "Version", "070100", "Before", "Version", "070205");
    a[11607] = b:New(11607, 10); -- They See Me Rolling
    a[11609] = b:New(11609, 0); -- Power Unbound
    a[11610] = b:New(11610, 0); -- Power Unleashed
    a[11611] = b:New(11611, 0); -- A Challenging Look
    O(a[11611], "From", "Version", "070003", "Before", "Version", "080001");
    a[11612] = b:New(11612, 0); -- Fighting with Style: Challenging
    O(a[11612], "From", "Version", "070003", "Before", "Version", "080001");
    a[11628] = b:New(11628, 10); -- That's So Last Millennium
    T(a[11628], t[940]); -- Warplate of the Obsidian Aspect (Raid Finder)
    T(a[11628], t[937]); -- Warplate of the Obsidian Aspect (Normal)
    T(a[11628], t[938]); -- Warplate of the Obsidian Aspect (Heroic)
    T(a[11628], t[939]); -- Warplate of the Obsidian Aspect (Mythic)
    T(a[11628], t[981]); -- Battleplate of the Highlord (Raid Finder)
    T(a[11628], t[978]); -- Battleplate of the Highlord (Normal)
    T(a[11628], t[979]); -- Battleplate of the Highlord (Heroic)
    T(a[11628], t[980]); -- Battleplate of the Highlord (Mythic)
    T(a[11628], t[993]); -- Eagletalon Battlegear (Raid Finder)
    T(a[11628], t[990]); -- Eagletalon Battlegear (Normal)
    T(a[11628], t[991]); -- Eagletalon Battlegear (Heroic)
    T(a[11628], t[992]); -- Eagletalon Battlegear (Mythic)
    T(a[11628], t[945]); -- Doomblade Battlegear (Raid Finder)
    T(a[11628], t[942]); -- Doomblade Battlegear (Normal)
    T(a[11628], t[943]); -- Doomblade Battlegear (Heroic)
    T(a[11628], t[944]); -- Doomblade Battlegear (Mythic)
    T(a[11628], t[322]); -- Vestments of the Purifier (Raid Finder)
    T(a[11628], t[308]); -- Vestments of the Purifier (Normal)
    T(a[11628], t[309]); -- Vestments of the Purifier (Heroic)
    T(a[11628], t[311]); -- Vestments of the Purifier (Mythic)
    T(a[11628], t[1005]); -- Dreadwyrm Battleplate (Raid Finder)
    T(a[11628], t[1002]); -- Dreadwyrm Battleplate (Normal)
    T(a[11628], t[1003]); -- Dreadwyrm Battleplate (Heroic)
    T(a[11628], t[1004]); -- Dreadwyrm Battleplate (Mythic)
    T(a[11628], t[936]); -- Regalia of Shackled Elements (Raid Finder)
    T(a[11628], t[933]); -- Regalia of Shackled Elements (Normal)
    T(a[11628], t[934]); -- Regalia of Shackled Elements (Heroic)
    T(a[11628], t[935]); -- Regalia of Shackled Elements (Mythic)
    T(a[11628], t[989]); -- Regalia of Everburning Knowledge (Raid Finder)
    T(a[11628], t[986]); -- Regalia of Everburning Knowledge (Normal)
    T(a[11628], t[987]); -- Regalia of Everburning Knowledge (Heroic)
    T(a[11628], t[988]); -- Regalia of Everburning Knowledge (Mythic)
    T(a[11628], t[941]); -- Legacy of Azj'aqir (Raid Finder)
    T(a[11628], t[315]); -- Legacy of Azj'Aqir (Normal)
    T(a[11628], t[316]); -- Legacy of Azj'Aqir (Heroic)
    T(a[11628], t[321]); -- Legacy of Azj'Aqir (Mythic)
    T(a[11628], t[985]); -- Vestments of Enveloped Dissonance (Raid Finder)
    T(a[11628], t[982]); -- Vestments of Enveloped Dissonance (Normal)
    T(a[11628], t[983]); -- Vestments of Enveloped Dissonance (Heroic)
    T(a[11628], t[984]); -- Vestments of Enveloped Dissonance (Mythic)
    T(a[11628], t[997]); -- Garb of the Astral Warden (Raid Finder)
    T(a[11628], t[994]); -- Garb of the Astral Warden (Normal)
    T(a[11628], t[995]); -- Garb of the Astral Warden (Heroic)
    T(a[11628], t[996]); -- Garb of the Astral Warden (Mythic)
    T(a[11628], t[1001]); -- Vestment of Second Sight (Raid Finder)
    T(a[11628], t[998]); -- Vestment of Second Sight (Normal)
    T(a[11628], t[999]); -- Vestment of Second Sight (Heroic)
    T(a[11628], t[1000]); -- Vestment of Second Sight (Mythic)
    a[11629] = b:New(11629, 10); -- Untamed Beauty
    T(a[11629], t[72]); -- Primal Combatant's Plate Armor (Combatant I)
    T(a[11629], t[136]); -- Primal Gladiator's Plate Armor (Gladiator)
    T(a[11629], t[1156]); -- Primal Gladiator's Plate Armor (Elite)
    T(a[11629], t[70]); -- Primal Combatant's Scaled Armor (Combatant I)
    T(a[11629], t[142]); -- Primal Gladiator's Scaled Armor (Gladiator)
    T(a[11629], t[1148]); -- Primal Gladiator's Scaled Armor (Elite)
    T(a[11629], t[58]); -- Primal Combatant's Chain Armor (Combatant I)
    T(a[11629], t[124]); -- Primal Gladiator's Chain Armor (Gladiator)
    T(a[11629], t[1142]); -- Primal Gladiator's Chain Armor (Elite)
    T(a[11629], t[64]); -- Primal Combatant's Leather Armor (Combatant I)
    T(a[11629], t[134]); -- Primal Gladiator's Leather Armor (Gladiator)
    T(a[11629], t[1150]); -- Primal Gladiator's Leather Armor (Elite)
    T(a[11629], t[76]); -- Primal Combatant's Satin Armor (Combatant I)
    T(a[11629], t[140]); -- Primal Gladiator's Satin Armor (Gladiator)
    T(a[11629], t[403]); -- Primal Gladiator's Satin Armor (Elite)
    T(a[11629], t[68]); -- Primal Combatant's Dreadplate Armor (Combatant I)
    T(a[11629], t[128]); -- Primal Gladiator's Dreadplate Armor (Gladiator)
    T(a[11629], t[1138]); -- Primal Gladiator's Dreadplate Armor (Elite)
    T(a[11629], t[60]); -- Primal Combatant's Ringmail Armor (Combatant I)
    T(a[11629], t[138]); -- Primal Gladiator's Ringmail Armor (Gladiator)
    T(a[11629], t[1152]); -- Primal Gladiator's Ringmail Armor (Elite)
    T(a[11629], t[78]); -- Primal Combatant's Silk Armor (Combatant I)
    T(a[11629], t[144]); -- Primal Gladiator's Silk Armor (Gladiator)
    T(a[11629], t[1144]); -- Primal Gladiator's Silk Armor (Elite)
    T(a[11629], t[74]); -- Primal Combatant's Felweave Armor (Combatant I)
    T(a[11629], t[130]); -- Primal Gladiator's Felweave Armor (Gladiator)
    T(a[11629], t[1154]); -- Primal Gladiator's Felweave Armor (Elite)
    T(a[11629], t[66]); -- Primal Combatant's Ironskin Armor (Combatant I)
    T(a[11629], t[132]); -- Primal Gladiator's Ironskin Armor (Gladiator)
    T(a[11629], t[1146]); -- Primal Gladiator's Ironskin Armor (Elite)
    T(a[11629], t[62]); -- Primal Combatant's Dragonhide Armor (Combatant I)
    T(a[11629], t[126]); -- Primal Gladiator's Dragonhide Armor (Gladiator)
    T(a[11629], t[1140]); -- Primal Gladiator's Dragonhide Armor (Elite)
    T(a[11629], t[71]); -- Primal Combatant's Plate Armor (Combatant I)
    T(a[11629], t[135]); -- Primal Gladiator's Plate Armor (Gladiator)
    T(a[11629], t[1157]); -- Primal Gladiator's Plate Armor (Elite)
    T(a[11629], t[69]); -- Primal Combatant's Scaled Armor (Combatant I)
    T(a[11629], t[141]); -- Primal Gladiator's Scaled Armor (Gladiator)
    T(a[11629], t[1149]); -- Primal Gladiator's Scaled Armor (Elite)
    T(a[11629], t[57]); -- Primal Combatant's Chain Armor (Combatant I)
    T(a[11629], t[123]); -- Primal Gladiator's Chain Armor (Gladiator)
    T(a[11629], t[1143]); -- Primal Gladiator's Chain Armor (Elite)
    T(a[11629], t[63]); -- Primal Combatant's Leather Armor (Combatant I)
    T(a[11629], t[133]); -- Primal Gladiator's Leather Armor (Gladiator)
    T(a[11629], t[1151]); -- Primal Gladiator's Leather Armor (Elite)
    T(a[11629], t[75]); -- Primal Combatant's Satin Armor (Combatant I)
    T(a[11629], t[139]); -- Primal Gladiator's Satin Armor (Gladiator)
    T(a[11629], t[404]); -- Primal Gladiator's Satin Armor (Elite)
    T(a[11629], t[67]); -- Primal Combatant's Dreadplate Armor (Combatant I)
    T(a[11629], t[127]); -- Primal Gladiator's Dreadplate Armor (Gladiator)
    T(a[11629], t[1139]); -- Primal Gladiator's Dreadplate Armor (Elite)
    T(a[11629], t[59]); -- Primal Combatant's Ringmail Armor (Combatant I)
    T(a[11629], t[137]); -- Primal Gladiator's Ringmail Armor (Gladiator)
    T(a[11629], t[1153]); -- Primal Gladiator's Ringmail Armor (Elite)
    T(a[11629], t[77]); -- Primal Combatant's Silk Armor (Combatant I)
    T(a[11629], t[143]); -- Primal Gladiator's Silk Armor (Gladiator)
    T(a[11629], t[1145]); -- Primal Gladiator's Silk Armor (Elite)
    T(a[11629], t[73]); -- Primal Combatant's Felweave Armor (Combatant I)
    T(a[11629], t[129]); -- Primal Gladiator's Felweave Armor (Gladiator)
    T(a[11629], t[1155]); -- Primal Gladiator's Felweave Armor (Elite)
    T(a[11629], t[65]); -- Primal Combatant's Ironskin Armor (Combatant I)
    T(a[11629], t[131]); -- Primal Gladiator's Ironskin Armor (Gladiator)
    T(a[11629], t[1147]); -- Primal Gladiator's Ironskin Armor (Elite)
    T(a[11629], t[61]); -- Primal Combatant's Dragonhide Armor (Combatant I)
    T(a[11629], t[125]); -- Primal Gladiator's Dragonhide Armor (Gladiator)
    T(a[11629], t[1141]); -- Primal Gladiator's Dragonhide Armor (Elite)
    a[11630] = b:New(11630, 10); -- More Like Win-dictive
    T(a[11630], t[1070]); -- Vindictive Combatant's Plate Armor (Combatant I)
    T(a[11630], t[1133]); -- Vindictive Gladiator's Plate Armor (Gladiator)
    T(a[11630], t[1135]); -- Vindictive Gladiator's Plate Armor (Elite)
    T(a[11630], t[1164]); -- Vindictive Combatant's Scaled Armor (Combatant I)
    T(a[11630], t[1121]); -- Vindictive Gladiator's Scaled Armor (Gladiator)
    T(a[11630], t[1123]); -- Vindictive Gladiator's Scaled Armor (Elite)
    T(a[11630], t[409]); -- Vindictive Combatant's Chain Armor (Combatant I)
    T(a[11630], t[1113]); -- Vindictive Gladiator's Chain Armor (Gladiator)
    T(a[11630], t[1115]); -- Vindictive Gladiator's Chain Armor (Elite)
    T(a[11630], t[1068]); -- Vindictive Combatant's Leather Armor (Combatant I)
    T(a[11630], t[1125]); -- Vindictive Gladiator's Leather Armor (Gladiator)
    T(a[11630], t[1127]); -- Vindictive Gladiator's Leather Armor (Elite)
    T(a[11630], t[1071]); -- Vindictive Combatant's Satin Armor (Combatant I)
    T(a[11630], t[388]); -- Vindictive Gladiator's Satin Armor (Gladiator)
    T(a[11630], t[392]); -- Vindictive Gladiator's Satin Armor (Elite)
    T(a[11630], t[1163]); -- Vindictive Combatant's Dreadplate Armor (Combatant I)
    T(a[11630], t[1106]); -- Vindictive Gladiator's Dreadplate Armor (Gladiator)
    T(a[11630], t[1108]); -- Vindictive Gladiator's Dreadplate Armor (Elite)
    T(a[11630], t[1161]); -- Vindictive Combatant's Ringmail Armor (Combatant I)
    T(a[11630], t[1129]); -- Vindictive Gladiator's Ringmail Armor (Gladiator)
    T(a[11630], t[1131]); -- Vindictive Gladiator's Ringmail Armor (Elite)
    T(a[11630], t[1137]); -- Vindictive Combatant's Silk Armor (Combatant I)
    T(a[11630], t[1094]); -- Vindictive Gladiator's Silk Armor (Gladiator)
    T(a[11630], t[1096]); -- Vindictive Gladiator's Silk Armor (Elite)
    T(a[11630], t[1158]); -- Vindictive Combatant's Felweave Armor (Combatant I)
    T(a[11630], t[1101]); -- Vindictive Gladiator's Felweave Armor (Gladiator)
    T(a[11630], t[1103]); -- Vindictive Gladiator's Felweave Armor (Elite)
    T(a[11630], t[1169]); -- Vindictive Combatant's Ironskin Armor (Combatant I)
    T(a[11630], t[1117]); -- Vindictive Gladiator's Ironskin Armor (Gladiator)
    T(a[11630], t[1119]); -- Vindictive Gladiator's Ironskin Armor (Elite)
    T(a[11630], t[1168]); -- Vindictive Combatant's Dragonhide Armor (Combatant I)
    T(a[11630], t[1098]); -- Vindictive Gladiator's Dragonhide Armor (Gladiator)
    T(a[11630], t[1100]); -- Vindictive Gladiator's Dragonhide Armor (Elite)
    T(a[11630], t[1167]); -- Vindictive Combatant's Felskin Armor (Combatant I)
    T(a[11630], t[1110]); -- Vindictive Gladiator's Felskin Armor (Gladiator)
    T(a[11630], t[1112]); -- Vindictive Gladiator's Felskin Armor (Elite)
    T(a[11630], t[1069]); -- Vindictive Combatant's Plate Armor (Combatant I)
    T(a[11630], t[1134]); -- Vindictive Gladiator's Plate Armor (Gladiator)
    T(a[11630], t[1136]); -- Vindictive Gladiator's Plate Armor (Elite)
    T(a[11630], t[1166]); -- Vindictive Combatant's Scaled Armor (Combatant I)
    T(a[11630], t[1122]); -- Vindictive Gladiator's Scaled Armor (Gladiator)
    T(a[11630], t[1124]); -- Vindictive Gladiator's Scaled Armor (Elite)
    T(a[11630], t[410]); -- Vindictive Combatant's Chain Armor (Combatant I)
    T(a[11630], t[1114]); -- Vindictive Gladiator's Chain Armor (Gladiator)
    T(a[11630], t[1116]); -- Vindictive Gladiator's Chain Armor (Elite)
    T(a[11630], t[1067]); -- Vindictive Combatant's Leather Armor (Combatant I)
    T(a[11630], t[1126]); -- Vindictive Gladiator's Leather Armor (Gladiator)
    T(a[11630], t[1128]); -- Vindictive Gladiator's Leather Armor (Elite)
    T(a[11630], t[1072]); -- Vindictive Combatant's Satin Armor (Combatant I)
    T(a[11630], t[390]); -- Vindictive Gladiator's Satin Armor (Gladiator)
    T(a[11630], t[393]); -- Vindictive Gladiator's Satin Armor (Elite)
    T(a[11630], t[1165]); -- Vindictive Combatant's Dreadplate Armor (Combatant I)
    T(a[11630], t[1105]); -- Vindictive Gladiator's Dreadplate Armor (Gladiator)
    T(a[11630], t[1107]); -- Vindictive Gladiator's Dreadplate Armor (Elite)
    T(a[11630], t[1162]); -- Vindictive Combatant's Ringmail Armor (Combatant I)
    T(a[11630], t[1130]); -- Vindictive Gladiator's Ringmail Armor (Gladiator)
    T(a[11630], t[1132]); -- Vindictive Gladiator's Ringmail Armor (Elite)
    T(a[11630], t[1159]); -- Vindictive Combatant's Silk Armor (Combatant I)
    T(a[11630], t[1093]); -- Vindictive Gladiator's Silk Armor (Gladiator)
    T(a[11630], t[1095]); -- Vindictive Gladiator's Silk Armor (Elite)
    T(a[11630], t[1160]); -- Vindictive Combatant's Felweave Armor (Combatant I)
    T(a[11630], t[1102]); -- Vindictive Gladiator's Felweave Armor (Gladiator)
    T(a[11630], t[1104]); -- Vindictive Gladiator's Felweave Armor (Elite)
    T(a[11630], t[1172]); -- Vindictive Combatant's Ironskin Armor (Combatant I)
    T(a[11630], t[1118]); -- Vindictive Gladiator's Ironskin Armor (Gladiator)
    T(a[11630], t[1120]); -- Vindictive Gladiator's Ironskin Armor (Elite)
    T(a[11630], t[1171]); -- Vindictive Combatant's Dragonhide Armor (Combatant I)
    T(a[11630], t[1097]); -- Vindictive Gladiator's Dragonhide Armor (Gladiator)
    T(a[11630], t[1099]); -- Vindictive Gladiator's Dragonhide Armor (Elite)
    T(a[11630], t[1170]); -- Vindictive Combatant's Felskin Armor (Combatant I)
    T(a[11630], t[1109]); -- Vindictive Gladiator's Felskin Armor (Gladiator)
    T(a[11630], t[1111]); -- Vindictive Gladiator's Felskin Armor (Elite)
    a[11631] = b:New(11631, 10); -- Extreme Makeover: Fel Edition
    T(a[11631], t[584]); -- Demonbreaker Battleplate (Raid Finder)
    T(a[11631], t[583]); -- Rancorbite Armor (Raid Finder)
    T(a[11631], t[581]); -- Felfume Raiment (Raid Finder)
    T(a[11631], t[582]); -- Ironpelt Garb (Raid Finder)
    T(a[11631], t[432]); -- Battlegear of Iron Wrath (Normal)
    T(a[11631], t[433]); -- Battlegear of Iron Wrath (Heroic)
    T(a[11631], t[434]); -- Battlegear of Iron Wrath (Mythic)
    T(a[11631], t[480]); -- Watch of the Ceaseless Vigil (Normal)
    T(a[11631], t[481]); -- Watch of the Ceaseless Vigil (Heroic)
    T(a[11631], t[482]); -- Watch of the Ceaseless Vigil (Mythic)
    T(a[11631], t[533]); -- Battlegear of the Savage Hunt (Normal)
    T(a[11631], t[534]); -- Battlegear of the Savage Hunt (Heroic)
    T(a[11631], t[535]); -- Battlegear of the Savage Hunt (Mythic)
    T(a[11631], t[465]); -- Felblade Armor (Normal)
    T(a[11631], t[466]); -- Felblade Armor (Heroic)
    T(a[11631], t[467]); -- Felblade Armor (Mythic)
    T(a[11631], t[323]); -- Attire of Piety (Normal)
    T(a[11631], t[324]); -- Attire of Piety (Heroic)
    T(a[11631], t[325]); -- Attire of Piety (Mythic)
    T(a[11631], t[566]); -- Demongaze Armor (Normal)
    T(a[11631], t[567]); -- Demongaze Armor (Heroic)
    T(a[11631], t[568]); -- Demongaze Armor (Mythic)
    T(a[11631], t[415]); -- Embrace of the Living Mountain (Normal)
    T(a[11631], t[416]); -- Embrace of the Living Mountain (Heroic)
    T(a[11631], t[417]); -- Embrace of the Living Mountain (Mythic)
    T(a[11631], t[517]); -- Raiment of the Arcanic Conclave (Normal)
    T(a[11631], t[519]); -- Raiment of the Arcanic Conclave (Heroic)
    T(a[11631], t[518]); -- Raiment of the Arcanic Conclave (Mythic)
    T(a[11631], t[449]); -- Deathrattle Regalia (Normal)
    T(a[11631], t[451]); -- Deathrattle Regalia (Heroic)
    T(a[11631], t[450]); -- Deathrattle Regalia (Mythic)
    T(a[11631], t[502]); -- Battlewrap of the Hurricane's Eye (Normal)
    T(a[11631], t[503]); -- Battlewrap of the Hurricane's Eye (Heroic)
    T(a[11631], t[505]); -- Battlewrap of the Hurricane's Eye (Mythic)
    T(a[11631], t[551]); -- Oathclaw Wargarb (Normal)
    T(a[11631], t[552]); -- Oathclaw Wargarb (Heroic)
    T(a[11631], t[553]); -- Oathclaw Wargarb (Mythic)
    a[11652] = b:New(11652, 10); -- The Reputable
    a[11653] = b:New(11653, 10); -- Paragon of the Broken Isles
    a[11674] = b:New(11674, 10); -- "Great Soul, Great Purpose"
    a[11675] = b:New(11675, 10); -- Sky Walker
    a[11676] = b:New(11676, 10); -- Five Course Seafood Buffet
    a[11681] = b:New(11681, 10); -- Crate Expectations
    a[11683] = b:New(11683, 10); -- Bingo!
    a[11685] = b:New(11685, 0); -- Decade of Dominance
    O(a[11685], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11686] = b:New(11686, 0); -- These Go To Eleven
    O(a[11686], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11687] = b:New(11687, 0); -- Demonic Dozen
    O(a[11687], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11688] = b:New(11688, 0); -- Floor Thirteen
    O(a[11688], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11689] = b:New(11689, 0); -- Fourteen for the Team
    O(a[11689], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11690] = b:New(11690, 0); -- When You're Fifteen
    O(a[11690], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11691] = b:New(11691, 0); -- You Are Sixteen
    O(a[11691], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11692] = b:New(11692, 0); -- Going On Seventeen
    O(a[11692], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11693] = b:New(11693, 0); -- Eighteen and Over
    O(a[11693], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11694] = b:New(11694, 0); -- "Hell, It's About Nineteen"
    O(a[11694], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[11696] = b:New(11696, 10); -- Grin and Bear It
    a[11697] = b:New(11697, 0); -- Cruel Elite
    O(a[11697], "From", "PvP Season", 21, "Until", "PvP Season", 21);
    a[11698] = b:New(11698, 0); -- Ferocious Elite
    O(a[11698], "From", "PvP Season", 22, "Until", "PvP Season", 22);
    a[11699] = b:New(11699, 10); -- Grand Fin-ale
    a[11700] = b:New(11700, 10); -- Cathedral of Eternal Night
    a[11701] = b:New(11701, 10); -- Heroic: Cathedral of Eternal Night
    a[11702] = b:New(11702, 10); -- Mythic: Cathedral of Eternal Night
    a[11703] = b:New(11703, 10); -- Master of Shadows
    a[11706] = b:New(11706, 10); -- The Original
    T(a[11706], t[381]); -- Gladiator's Plate Armor (Gladiator)
    T(a[11706], t[974]); -- Gladiator's Scaled Armor (Gladiator)
    T(a[11706], t[976]); -- Gladiator's Chain Armor (Gladiator)
    T(a[11706], t[972]); -- Gladiator's Leather Armor (Gladiator)
    T(a[11706], t[382]); -- Satin Battlegear (PVP Rare)
    T(a[11706], t[973]); -- Gladiator's Satin Armor (Gladiator)
    T(a[11706], t[971]); -- Gladiator's Ringmail Armor (Gladiator)
    T(a[11706], t[975]); -- Gladiator's Silk Armor (Gladiator)
    T(a[11706], t[970]); -- Gladiator's Felweave Armor (Gladiator)
    T(a[11706], t[977]); -- Gladiator's Dragonhide Armor (Gladiator)
    a[11707] = b:New(11707, 10); -- No Mercy
    T(a[11707], t[962]); -- Merciless Gladiator's Plate Armor (Gladiator)
    T(a[11707], t[966]); -- Merciless Gladiator's Scaled Armor (Gladiator)
    T(a[11707], t[968]); -- Merciless Gladiator's Chain Armor (Gladiator)
    T(a[11707], t[965]); -- Merciless Gladiator's Leather Armor (Gladiator)
    T(a[11707], t[380]); -- Merciless Gladiator's Satin Armor (Gladiator)
    T(a[11707], t[964]); -- Merciless Gladiator's Ringmail Armor (Gladiator)
    T(a[11707], t[967]); -- Merciless Gladiator's Silk Armor (Gladiator)
    T(a[11707], t[963]); -- Merciless Gladiator's Felweave Armor (Gladiator)
    T(a[11707], t[969]); -- Merciless Gladiator's Dragonhide Armor (Gladiator)
    a[11708] = b:New(11708, 10); -- With a Vengeance
    T(a[11708], t[954]); -- Vengeful Gladiator's Plate Armor (Gladiator)
    T(a[11708], t[958]); -- Vengeful Gladiator's Scaled Armor (Gladiator)
    T(a[11708], t[960]); -- Vengeful Gladiator's Chain Armor (Gladiator)
    T(a[11708], t[957]); -- Vengeful Gladiator's Leather Armor (Gladiator)
    T(a[11708], t[379]); -- Vengeful Gladiator's Satin Armor (Gladiator)
    T(a[11708], t[956]); -- Vengeful Gladiator's Ringmail Armor (Gladiator)
    T(a[11708], t[959]); -- Vengeful Gladiator's Silk Armor (Gladiator)
    T(a[11708], t[955]); -- Vengeful Gladiator's Felweave Armor (Gladiator)
    T(a[11708], t[961]); -- Vengeful Gladiator's Dragonhide Armor (Gladiator)
    a[11709] = b:New(11709, 10); -- Tough Threads
    T(a[11709], t[946]); -- Brutal Gladiator's Plate Armor (Gladiator)
    T(a[11709], t[950]); -- Brutal Gladiator's Scaled Armor (Gladiator)
    T(a[11709], t[952]); -- Brutal Gladiator's Chain Armor (Gladiator)
    T(a[11709], t[949]); -- Brutal Gladiator's Leather Armor (Gladiator)
    T(a[11709], t[378]); -- Brutal Gladiator's Satin Armor (Gladiator)
    T(a[11709], t[1202]); -- Brutal Gladiator's Dreadplate Armor (Gladiator)
    T(a[11709], t[948]); -- Brutal Gladiator's Ringmail Armor (Gladiator)
    T(a[11709], t[951]); -- Brutal Gladiator's Silk Armor (Gladiator)
    T(a[11709], t[947]); -- Brutal Gladiator's Felweave Armor (Gladiator)
    T(a[11709], t[953]); -- Brutal Gladiator's Dragonhide Armor (Gladiator)
    a[11710] = b:New(11710, 10); -- Lethal Looks
    T(a[11710], t[797]); -- Hateful Gladiator's Plate Armor (Honor)
    T(a[11710], t[806]); -- Savage Gladiator's Plate Armor (PVP Rare)
    T(a[11710], t[788]); -- Deadly Gladiator's Plate Armor (Gladiator)
    T(a[11710], t[801]); -- Hateful Gladiator's Scaled Armor (Honor)
    T(a[11710], t[810]); -- Savage Gladiator's Scaled Armor (PVP Rare)
    T(a[11710], t[792]); -- Deadly Gladiator's Scaled Armor (Gladiator)
    T(a[11710], t[803]); -- Hateful Gladiator's Chain Armor (Honor)
    T(a[11710], t[812]); -- Savage Gladiator's Chain Armor (PVP Rare)
    T(a[11710], t[794]); -- Deadly Gladiator's Chain Armor (Gladiator)
    T(a[11710], t[800]); -- Hateful Gladiator's Leather Armor (Honor)
    T(a[11710], t[809]); -- Savage Gladiator's Leather Armor (PVP Rare)
    T(a[11710], t[791]); -- Deadly Gladiator's Leather Armor (Gladiator)
    T(a[11710], t[376]); -- Hateful Gladiator's Satin Armor (Honor)
    T(a[11710], t[377]); -- Savage Gladiator's Satin Armor (PVP Rare)
    T(a[11710], t[375]); -- Deadly Gladiator's Satin Armor (Gladiator)
    T(a[11710], t[805]); -- Hateful Gladiator's Dreadplate Armor (Honor)
    T(a[11710], t[814]); -- Savage Gladiator's Dreadplate Armor (PVP Rare)
    T(a[11710], t[796]); -- Deadly Gladiator's Dreadplate Armor (Gladiator)
    T(a[11710], t[799]); -- Hateful Gladiator's Ringmail Armor (Honor)
    T(a[11710], t[808]); -- Savage Gladiator's Ringmail Armor (PVP Rare)
    T(a[11710], t[790]); -- Deadly Gladiator's Ringmail Armor (Gladiator)
    T(a[11710], t[802]); -- Hateful Gladiator's Silk Armor (Honor)
    T(a[11710], t[811]); -- Savage Gladiator's Silk Armor (PVP Rare)
    T(a[11710], t[793]); -- Deadly Gladiator's Silk Armor (Gladiator)
    T(a[11710], t[798]); -- Hateful Gladiator's Felweave Armor (Honor)
    T(a[11710], t[807]); -- Savage Gladiator's Felweave Armor (PVP Rare)
    T(a[11710], t[789]); -- Deadly Gladiator's Felweave Armor (Gladiator)
    T(a[11710], t[804]); -- Hateful Gladiator's Dragonhide Armor (Honor)
    T(a[11710], t[813]); -- Savage Gladiator's Dragonhide Armor (PVP Rare)
    T(a[11710], t[795]); -- Deadly Gladiator's Dragonhide Armor (Gladiator)
    a[11711] = b:New(11711, 10); -- The Fierce and the Furious
    T(a[11711], t[779]); -- Furious Gladiator's Plate Armor (Gladiator)
    T(a[11711], t[783]); -- Furious Gladiator's Scaled Armor (Gladiator)
    T(a[11711], t[785]); -- Furious Gladiator's Chain Armor (Gladiator)
    T(a[11711], t[782]); -- Furious Gladiator's Leather Armor (Gladiator)
    T(a[11711], t[374]); -- Furious Gladiator's Satin Armor (Gladiator)
    T(a[11711], t[787]); -- Furious Gladiator's Dreadplate Armor (Gladiator)
    T(a[11711], t[781]); -- Furious Gladiator's Ringmail Armor (Gladiator)
    T(a[11711], t[784]); -- Furious Gladiator's Silk Armor (Gladiator)
    T(a[11711], t[780]); -- Furious Gladiator's Felweave Armor (Gladiator)
    T(a[11711], t[786]); -- Furious Gladiator's Dragonhide Armor (Gladiator)
    a[11712] = b:New(11712, 10); -- Relentlessly Good Looking
    T(a[11712], t[770]); -- Relentless Gladiator's Plate Armor (Gladiator)
    T(a[11712], t[774]); -- Relentless Gladiator's Scaled Armor (Gladiator)
    T(a[11712], t[776]); -- Relentless Gladiator's Chain Armor (Gladiator)
    T(a[11712], t[773]); -- Relentless Gladiator's Leather Armor (Gladiator)
    T(a[11712], t[373]); -- Relentless Gladiator's Satin Armor (Gladiator)
    T(a[11712], t[778]); -- Relentless Gladiator's Dreadplate Armor (Gladiator)
    T(a[11712], t[772]); -- Relentless Gladiator's Ringmail Armor (Gladiator)
    T(a[11712], t[775]); -- Relentless Gladiator's Silk Armor (Gladiator)
    T(a[11712], t[771]); -- Relentless Gladiator's Felweave Armor (Gladiator)
    T(a[11712], t[777]); -- Relentless Gladiator's Dragonhide Armor (Gladiator)
    a[11713] = b:New(11713, 10); -- Wrath of the Stitch King
    T(a[11713], t[761]); -- Wrathful Gladiator's Plate Armor (Gladiator)
    T(a[11713], t[765]); -- Wrathful Gladiator's Scaled Armor (Gladiator)
    T(a[11713], t[767]); -- Wrathful Gladiator's Chain Armor (Gladiator)
    T(a[11713], t[764]); -- Wrathful Gladiator's Leather Armor (Gladiator)
    T(a[11713], t[372]); -- Wrathful Gladiator's Satin Armor (Gladiator)
    T(a[11713], t[769]); -- Wrathful Gladiator's Dreadplate Armor (Gladiator)
    T(a[11713], t[763]); -- Wrathful Gladiator's Ringmail Armor (Gladiator)
    T(a[11713], t[766]); -- Wrathful Gladiator's Silk Armor (Gladiator)
    T(a[11713], t[762]); -- Wrathful Gladiator's Felweave Armor (Gladiator)
    T(a[11713], t[768]); -- Wrathful Gladiator's Dragonhide Armor (Gladiator)
    a[11714] = b:New(11714, 10); -- Viciously Vintage
    T(a[11714], t[1193]); -- Bloodthirsty Gladiator's Plate Armor (Honor)
    T(a[11714], t[626]); -- Vicious Gladiator's Plate Armor (Gladiator)
    T(a[11714], t[627]); -- Vicious Gladiator's Plate Armor (Elite)
    T(a[11714], t[1197]); -- Bloodthirsty Gladiator's Scaled Armor (Honor)
    T(a[11714], t[751]); -- Vicious Gladiator's Scaled Armor (Gladiator)
    T(a[11714], t[752]); -- Vicious Gladiator's Scaled Armor (Elite)
    T(a[11714], t[1199]); -- Bloodthirsty Gladiator's Chain Armor (Honor)
    T(a[11714], t[755]); -- Vicious Gladiator's Chain Armor (Gladiator)
    T(a[11714], t[756]); -- Vicious Gladiator's Chain Armor (Elite)
    T(a[11714], t[1196]); -- Bloodthirsty Gladiator's Leather Armor (Honor)
    T(a[11714], t[749]); -- Vicious Gladiator's Leather Armor (Gladiator)
    T(a[11714], t[750]); -- Vicious Gladiator's Leather Armor (Elite)
    T(a[11714], t[371]); -- Bloodthirsty Gladiator's Satin Armor (Honor)
    T(a[11714], t[369]); -- Vicious Gladiator's Satin Armor (Gladiator)
    T(a[11714], t[370]); -- Vicious Gladiator's Satin Armor (Elite)
    T(a[11714], t[1201]); -- Bloodthirsty Gladiator's Dreadplate Armor (Honor)
    T(a[11714], t[759]); -- Vicious Gladiator's Dreadplate Armor (Gladiator)
    T(a[11714], t[760]); -- Vicious Gladiator's Dreadplate Armor (Elite)
    T(a[11714], t[1195]); -- Bloodthirsty Gladiator's Ringmail Armor (Honor)
    T(a[11714], t[747]); -- Vicious Gladiator's Ringmail Armor (Gladiator)
    T(a[11714], t[748]); -- Vicious Gladiator's Ringmail Armor (Elite)
    T(a[11714], t[1198]); -- Bloodthirsty Gladiator's Silk Armor (Honor)
    T(a[11714], t[753]); -- Vicious Gladiator's Silk Armor (Gladiator)
    T(a[11714], t[754]); -- Vicious Gladiator's Silk Armor (Elite)
    T(a[11714], t[1194]); -- Bloodthirsty Gladiator's Felweave Armor (Honor)
    T(a[11714], t[628]); -- Vicious Gladiator's Felweave Armor (Gladiator)
    T(a[11714], t[629]); -- Vicious Gladiator's Felweave Armor (Elite)
    T(a[11714], t[1200]); -- Bloodthirsty Gladiator's Dragonhide Armor (Honor)
    T(a[11714], t[757]); -- Vicious Gladiator's Dragonhide Armor (Gladiator)
    T(a[11714], t[758]); -- Vicious Gladiator's Dragonhide Armor (Elite)
    a[11715] = b:New(11715, 10); -- (Ruth)less is More
    T(a[11715], t[606]); -- Ruthless Gladiator's Plate Armor (Gladiator)
    T(a[11715], t[607]); -- Ruthless Gladiator's Plate Armor (Elite)
    T(a[11715], t[616]); -- Ruthless Gladiator's Scaled Armor (Gladiator)
    T(a[11715], t[617]); -- Ruthless Gladiator's Scaled Armor (Elite)
    T(a[11715], t[620]); -- Ruthless Gladiator's Chain Armor (Gladiator)
    T(a[11715], t[621]); -- Ruthless Gladiator's Chain Armor (Elite)
    T(a[11715], t[615]); -- Ruthless Gladiator's Leather Armor (Gladiator)
    T(a[11715], t[613]); -- Ruthless Gladiator's Leather Armor (Elite)
    T(a[11715], t[612]); -- Ruthless Gladiator's Satin Armor (Gladiator)
    T(a[11715], t[614]); -- Ruthless Gladiator's Satin Armor (Elite)
    T(a[11715], t[624]); -- Ruthless Gladiator's Dreadplate Armor (Gladiator)
    T(a[11715], t[625]); -- Ruthless Gladiator's Dreadplate Armor (Elite)
    T(a[11715], t[610]); -- Ruthless Gladiator's Ringmail Armor (Gladiator)
    T(a[11715], t[611]); -- Ruthless Gladiator's Ringmail Armor (Elite)
    T(a[11715], t[618]); -- Ruthless Gladiator's Silk Armor (Gladiator)
    T(a[11715], t[619]); -- Ruthless Gladiator's Silk Armor (Elite)
    T(a[11715], t[608]); -- Ruthless Gladiator's Felweave Armor (Gladiator)
    T(a[11715], t[609]); -- Ruthless Gladiator's Felweave Armor (Elite)
    T(a[11715], t[622]); -- Ruthless Gladiator's Dragonhide Armor (Gladiator)
    T(a[11715], t[623]); -- Ruthless Gladiator's Dragonhide Armor (Elite)
    a[11716] = b:New(11716, 10); -- Cataclysmic Catwalk
    T(a[11716], t[588]); -- Cataclysmic Gladiator's Plate Armor (Gladiator)
    T(a[11716], t[589]); -- Cataclysmic Gladiator's Plate Armor (Elite)
    T(a[11716], t[596]); -- Cataclysmic Gladiator's Scaled Armor (Gladiator)
    T(a[11716], t[597]); -- Cataclysmic Gladiator's Scaled Armor (Elite)
    T(a[11716], t[600]); -- Cataclysmic Gladiator's Chain Armor (Gladiator)
    T(a[11716], t[601]); -- Cataclysmic Gladiator's Chain Armor (Elite)
    T(a[11716], t[594]); -- Cataclysmic Gladiator's Leather Armor (Gladiator)
    T(a[11716], t[595]); -- Cataclysmic Gladiator's Leather Armor (Elite)
    T(a[11716], t[365]); -- Cataclysmic Gladiator's Satin Armor (Gladiator)
    T(a[11716], t[366]); -- Cataclysmic Gladiator's Satin Armor (Elite)
    T(a[11716], t[604]); -- Cataclysmic Gladiator's Dreadplate Armor (Gladiator)
    T(a[11716], t[605]); -- Cataclysmic Gladiator's Dreadplate Armor (Elite)
    T(a[11716], t[592]); -- Cataclysmic Gladiator's Ringmail Armor (Gladiator)
    T(a[11716], t[593]); -- Cataclysmic Gladiator's Ringmail Armor (Elite)
    T(a[11716], t[598]); -- Cataclysmic Gladiator's Silk Armor (Gladiator)
    T(a[11716], t[599]); -- Cataclysmic Gladiator's Silk Armor (Elite)
    T(a[11716], t[590]); -- Cataclysmic Gladiator's Felweave Armor (Gladiator)
    T(a[11716], t[591]); -- Cataclysmic Gladiator's Felweave Armor (Elite)
    T(a[11716], t[602]); -- Cataclysmic Gladiator's Dragonhide Armor (Gladiator)
    T(a[11716], t[603]); -- Cataclysmic Gladiator's Dragonhide Armor (Elite)
    a[11717] = b:New(11717, 10); -- Why Male(volent) Models?
    T(a[11717], t[193]); -- Dreadful Gladiator's Plate (Honor)
    T(a[11717], t[278]); -- Malevolent Gladiator's Plate Armor (Gladiator)
    T(a[11717], t[1064]); -- Malevolent Gladiator's Plate Armor (Elite)
    T(a[11717], t[196]); -- Dreadful Gladiator's Scaled Armor (Honor)
    T(a[11717], t[277]); -- Malevolent Gladiator's Scaled Armor (Gladiator)
    T(a[11717], t[1060]); -- Malevolent Gladiator's Scaled Armor (Elite)
    T(a[11717], t[187]); -- Dreadful Gladiator's Chain Armor (Honor)
    T(a[11717], t[286]); -- Malevolent Gladiator's Chain Armor (Gladiator)
    T(a[11717], t[1056]); -- Malevolent Gladiator's Chain Armor (Elite)
    T(a[11717], t[192]); -- Dreadful Gladiator's Leather Armor (Honor)
    T(a[11717], t[280]); -- Malevolent Gladiator's Leather Armor (Gladiator)
    T(a[11717], t[1061]); -- Malevolent Gladiator's Leather Armor (Elite)
    T(a[11717], t[195]); -- Dreadful Gladiator's Satin Armor (Honor)
    T(a[11717], t[282]); -- Malevolent Gladiator's Satin Armor (Gladiator)
    T(a[11717], t[396]); -- Malevolent Gladiator's Satin Armor (Elite)
    T(a[11717], t[189]); -- Dreadful Gladiator's Dreadplate Armor (Honor)
    T(a[11717], t[285]); -- Malevolent Gladiator's Dreadplate Armor (Gladiator)
    T(a[11717], t[1054]); -- Malevolent Gladiator's Dreadplate Armor (Elite)
    T(a[11717], t[194]); -- Dreadful Gladiator's Ringmail Armor (Honor)
    T(a[11717], t[284]); -- Malevolent Gladiator's Ringmail Armor (Gladiator)
    T(a[11717], t[1062]); -- Malevolent Gladiator's Ringmail Armor (Elite)
    T(a[11717], t[197]); -- Dreadful Gladiator's Silk Armor (Honor)
    T(a[11717], t[276]); -- Malevolent Gladiator's Silk Armor (Gladiator)
    T(a[11717], t[1057]); -- Malevolent Gladiator's Silk Armor (Elite)
    T(a[11717], t[190]); -- Dreadful Gladiator's Felweave Armor (Honor)
    T(a[11717], t[283]); -- Malevolent Gladiator's Felweave Armor (Gladiator)
    T(a[11717], t[1063]); -- Malevolent Gladiator's Felweave Armor (Elite)
    T(a[11717], t[191]); -- Dreadful Gladiator's Ironskin Armor (Honor)
    T(a[11717], t[1059]); -- Malevolent Gladiator's Ironskin Armor (Gladiator)
    T(a[11717], t[279]); -- Malevolent Gladiator's Ironskin Armor (Elite)
    T(a[11717], t[188]); -- Dreadful Gladiator's Dragonhide Armor (Honor)
    T(a[11717], t[281]); -- Malevolent Gladiator's Dragonhide Armor (Gladiator)
    T(a[11717], t[1055]); -- Malevolent Gladiator's Dragonhide Armor (Elite)
    a[11718] = b:New(11718, 10); -- Dressed to Oppress
    T(a[11718], t[271]); -- Tyrannical Gladiator's Plate Armor (Gladiator)
    T(a[11718], t[1028]); -- Tyrannical Gladiator's Plate Armor (Elite)
    T(a[11718], t[274]); -- Tyrannical Gladiator's Scaled Armor (Gladiator)
    T(a[11718], t[1020]); -- Tyrannical Gladiator's Scaled Armor (Elite)
    T(a[11718], t[265]); -- Tyrannical Gladiator's Chain Armor (Gladiator)
    T(a[11718], t[1014]); -- Tyrannical Gladiator's Chain Armor (Elite)
    T(a[11718], t[270]); -- Tyrannical Gladiator's Leather Armor (Gladiator)
    T(a[11718], t[1022]); -- Tyrannical Gladiator's Leather Armor (Elite)
    T(a[11718], t[273]); -- Tyrannical Gladiator's Satin Armor (Gladiator)
    T(a[11718], t[397]); -- Tyrannical Gladiator's Satin Armor (Elite)
    T(a[11718], t[267]); -- Tyrannical Gladiator's Dreadplate Armor (Gladiator)
    T(a[11718], t[1010]); -- Tyrannical Gladiator's Dreadplate Armor (Elite)
    T(a[11718], t[272]); -- Tyrannical Gladiator's Ringmail Armor (Gladiator)
    T(a[11718], t[1024]); -- Tyrannical Gladiator's Ringmail Armor (Elite)
    T(a[11718], t[275]); -- Tyrannical Gladiator's Silk Armor (Gladiator)
    T(a[11718], t[1016]); -- Tyrannical Gladiator's Silk Armor (Elite)
    T(a[11718], t[268]); -- Tyrannical Gladiator's Felweave Armor (Gladiator)
    T(a[11718], t[1026]); -- Tyrannical Gladiator's Felweave Armor (Elite)
    T(a[11718], t[269]); -- Tyrannical Gladiator's Ironskin Armor (Gladiator)
    T(a[11718], t[1018]); -- Tyrannical Gladiator's Ironskin Armor (Elite)
    T(a[11718], t[266]); -- Tyrannical Gladiator's Dragonhide Armor (Gladiator)
    T(a[11718], t[1012]); -- Tyrannical Gladiator's Dragonhide Armor (Elite)
    T(a[11718], t[261]); -- Tyrannical Gladiator's Plate Armor (Gladiator)
    T(a[11718], t[1029]); -- Tyrannical Gladiator's Plate Armor (Elite)
    T(a[11718], t[263]); -- Tyrannical Gladiator's Scaled Armor (Gladiator)
    T(a[11718], t[1021]); -- Tyrannical Gladiator's Scaled Armor (Elite)
    T(a[11718], t[254]); -- Tyrannical Gladiator's Chain Armor (Gladiator)
    T(a[11718], t[1015]); -- Tyrannical Gladiator's Chain Armor (Elite)
    T(a[11718], t[260]); -- Tyrannical Gladiator's Leather Armor (Gladiator)
    T(a[11718], t[1023]); -- Tyrannical Gladiator's Leather Armor (Elite)
    T(a[11718], t[258]); -- Tyrannical Gladiator's Satin Armor (Gladiator)
    T(a[11718], t[398]); -- Tyrannical Gladiator's Satin Armor (Elite)
    T(a[11718], t[256]); -- Tyrannical Gladiator's Dreadplate Armor (Gladiator)
    T(a[11718], t[1011]); -- Tyrannical Gladiator's Dreadplate Armor (Elite)
    T(a[11718], t[262]); -- Tyrannical Gladiator's Ringmail Shaman (Gladiator)
    T(a[11718], t[1025]); -- Tyrannical Gladiator's Ringmail Armor (Elite)
    T(a[11718], t[264]); -- Tyrannical Gladiator's Silk Armor (Gladiator)
    T(a[11718], t[1017]); -- Tyrannical Gladiator's Silk Armor (Elite)
    T(a[11718], t[257]); -- Tyrannical Gladiator's Felweave Armor (Gladiator)
    T(a[11718], t[1027]); -- Tyrannical Gladiator's Felweave Armor (Elite)
    T(a[11718], t[259]); -- Tyrannical Gladiator's Ironskin Armor (Gladiator)
    T(a[11718], t[1019]); -- Tyrannical Gladiator's Ironskin Armor (Elite)
    T(a[11718], t[255]); -- Tyrannical Gladiator's Dragonhide Armor (Gladiator)
    T(a[11718], t[1013]); -- Tyrannical Gladiator's Dragonhide Armor (Elite)
    a[11719] = b:New(11719, 10); -- It's Not Fashion Unless It Hurts
    T(a[11719], t[215]); -- Grievous Gladiator's Plate Armor (Gladiator)
    T(a[11719], t[1048]); -- Grievous Gladiator's Plate Armor (Elite)
    T(a[11719], t[218]); -- Grievous Gladiator's Scaled Armor (Gladiator)
    T(a[11719], t[1040]); -- Grievous Gladiator's Scaled Armor (Elite)
    T(a[11719], t[199]); -- Grievous Gladiator's Chain Armor (Gladiator)
    T(a[11719], t[1034]); -- Grievous Gladiator's Chain Armor (Elite)
    T(a[11719], t[214]); -- Grievous Gladiator's Leather Armor (Gladiator)
    T(a[11719], t[1042]); -- Grievous Gladiator's Leather Armor (Elite)
    T(a[11719], t[217]); -- Grievous Gladiator's Satin Armor (Gladiator)
    T(a[11719], t[401]); -- Grievous Gladiator's Satin Armor (Elite)
    T(a[11719], t[211]); -- Grievous Gladiator's Dreadplate Armor (Gladiator)
    T(a[11719], t[1030]); -- Grievous Gladiator's Dreadplate Armor (Elite)
    T(a[11719], t[216]); -- Grievous Gladiator's Ringmail Armor (Gladiator)
    T(a[11719], t[1044]); -- Grievous Gladiator's Ringmail Armor (Elite)
    T(a[11719], t[219]); -- Grievous Gladiator's Silk Armor (Gladiator)
    T(a[11719], t[1036]); -- Grievous Gladiator's Silk Armor (Elite)
    T(a[11719], t[212]); -- Grievous Gladiator's Felweave Armor (Gladiator)
    T(a[11719], t[1046]); -- Grievous Gladiator's Felweave Armor (Elite)
    T(a[11719], t[213]); -- Grievous Gladiator's Ironskin Armor (Gladiator)
    T(a[11719], t[1038]); -- Grievous Gladiator's Ironskin Armor (Elite)
    T(a[11719], t[210]); -- Grievous Gladiator's Dragonhide Armor (Gladiator)
    T(a[11719], t[1032]); -- Grievous Gladiator's Dragonhide Armor (Elite)
    T(a[11719], t[205]); -- Grievous Gladiator's Plate Armor (Gladiator)
    T(a[11719], t[1049]); -- Grievous Gladiator's Plate Armor (Elite)
    T(a[11719], t[208]); -- Grievous Gladiator's Scaled Armor (Gladiator)
    T(a[11719], t[1041]); -- Grievous Gladiator's Scaled Armor (Elite)
    T(a[11719], t[198]); -- Grievous Gladiator's Chain Armor (Gladiator)
    T(a[11719], t[1035]); -- Grievous Gladiator's Chain Armor (Elite)
    T(a[11719], t[204]); -- Grievous Gladiator's Leather Armor (Gladiator)
    T(a[11719], t[1043]); -- Grievous Gladiator's Leather Armor (Elite)
    T(a[11719], t[207]); -- Grievous Gladiator's Satin Armor (Gladiator)
    T(a[11719], t[402]); -- Grievous Gladiator's Satin Armor (Elite)
    T(a[11719], t[201]); -- Grievous Gladiator's Dreadplate Armor (Gladiator)
    T(a[11719], t[1031]); -- Grievous Gladiator's Dreadplate Armor (Elite)
    T(a[11719], t[206]); -- Grievous Gladiator's Ringmail Armor (Gladiator)
    T(a[11719], t[1045]); -- Grievous Gladiator's Ringmail Armor (Elite)
    T(a[11719], t[209]); -- Grievous Gladiator's Silk Armor (Gladiator)
    T(a[11719], t[1037]); -- Grievous Gladiator's Silk Armor (Elite)
    T(a[11719], t[202]); -- Grievous Gladiator's Felweave Armor (Gladiator)
    T(a[11719], t[1047]); -- Grievous Gladiator's Felweave Armor (Elite)
    T(a[11719], t[203]); -- Grievous Gladiator's Ironskin Armor (Gladiator)
    T(a[11719], t[1039]); -- Grievous Gladiator's Ironskin Armor (Elite)
    T(a[11719], t[200]); -- Grievous Gladiator's Dragonhide Armor (Gladiator)
    T(a[11719], t[1033]); -- Grievous Gladiator's Dragonhide Armor (Elite)
    a[11720] = b:New(11720, 10); -- Wear It With Pride
    T(a[11720], t[238]); -- Prideful Gladiator's Plate Armor (Gladiator)
    T(a[11720], t[1091]); -- Prideful Gladiator's Plate Armor (Elite)
    T(a[11720], t[241]); -- Prideful Gladiator's Scaled Armor (Gladiator)
    T(a[11720], t[1083]); -- Prideful Gladiator's Scaled Armor (Elite)
    T(a[11720], t[232]); -- Prideful Gladiator's Chain Armor (Gladiator)
    T(a[11720], t[1077]); -- Prideful Gladiator's Chain Armor (Elite)
    T(a[11720], t[237]); -- Prideful Gladiator's Leather Armor (Gladiator)
    T(a[11720], t[1085]); -- Prideful Gladiator's Leather Armor (Elite)
    T(a[11720], t[240]); -- Prideful Gladiator's Satin Armor (Gladiator)
    T(a[11720], t[399]); -- Prideful Gladiator's Satin Armor (Elite)
    T(a[11720], t[234]); -- Prideful Gladiator's Dreadplate Armor (Gladiator)
    T(a[11720], t[1073]); -- Prideful Gladiator's Dreadplate Armor (Elite)
    T(a[11720], t[239]); -- Prideful Gladiator's Ringmail Armor (Gladiator)
    T(a[11720], t[1087]); -- Prideful Gladiator's Ringmail Armor (Elite)
    T(a[11720], t[242]); -- Prideful Gladiator's Silk Armor (Gladiator)
    T(a[11720], t[1079]); -- Prideful Gladiator's Silk Armor (Elite)
    T(a[11720], t[235]); -- Prideful Gladiator's Felweave Armor (Gladiator)
    T(a[11720], t[1089]); -- Prideful Gladiator's Felweave Armor (Elite)
    T(a[11720], t[236]); -- Prideful Gladiator's Ironskin Armor (Gladiator)
    T(a[11720], t[1081]); -- Prideful Gladiator's Ironskin Armor (Elite)
    T(a[11720], t[233]); -- Prideful Gladiator's Dragonhide Armor (Gladiator)
    T(a[11720], t[1075]); -- Prideful Gladiator's Dragonhide Armor (Elite)
    T(a[11720], t[249]); -- Prideful Gladiator's Plate Armor (Gladiator)
    T(a[11720], t[1092]); -- Prideful Gladiator's Plate Armor (Elite)
    T(a[11720], t[252]); -- Prideful Gladiator's Scaled Armor (Gladiator)
    T(a[11720], t[1084]); -- Prideful Gladiator's Scaled Armor (Elite)
    T(a[11720], t[243]); -- Prideful Gladiator's Chain Armor (Gladiator)
    T(a[11720], t[1078]); -- Prideful Gladiator's Chain Armor (Elite)
    T(a[11720], t[248]); -- Prideful Gladiator's Leather Armor (Gladiator)
    T(a[11720], t[1086]); -- Prideful Gladiator's Leather Armor (Elite)
    T(a[11720], t[251]); -- Prideful Gladiator's Satin Armor (Gladiator)
    T(a[11720], t[400]); -- Prideful Gladiator's Satin Armor (Elite)
    T(a[11720], t[245]); -- Prideful Gladiator's Dreadplate Armor (Gladiator)
    T(a[11720], t[1074]); -- Prideful Gladiator's Dreadplate Armor (Elite)
    T(a[11720], t[250]); -- Prideful Gladiator's Ringmail Armor (Gladiator)
    T(a[11720], t[1088]); -- Prideful Gladiator's Ringmail Armor (Elite)
    T(a[11720], t[253]); -- Prideful Gladiator's Silk Armor (Gladiator)
    T(a[11720], t[1080]); -- Prideful Gladiator's Silk Armor (Elite)
    T(a[11720], t[246]); -- Prideful Gladiator's Felweave Armor (Gladiator)
    T(a[11720], t[1090]); -- Prideful Gladiator's Felweave Armor (Elite)
    T(a[11720], t[247]); -- Prideful Gladiator's Ironskin Armor (Gladiator)
    T(a[11720], t[1082]); -- Prideful Gladiator's Ironskin Armor (Elite)
    T(a[11720], t[244]); -- Prideful Gladiator's Dragonhide Armor (Gladiator)
    T(a[11720], t[1076]); -- Prideful Gladiator's Dragonhide Armor (Elite)
    a[11721] = b:New(11721, 10); -- Wild Style
    T(a[11721], t[22]); -- Wild Combatant's Plate Armor (Combatant I)
    T(a[11721], t[92]); -- Wild Gladiator's Plate Armor (Gladiator)
    T(a[11721], t[1191]); -- Wild Gladiator's Plate Armor (Elite)
    T(a[11721], t[19]); -- Wild Combatant's Scaled Armor (Combatant I)
    T(a[11721], t[94]); -- Wild Gladiator's Scaled Paladin (Gladiator)
    T(a[11721], t[1183]); -- Wild Gladiator's Scaled Paladin (Elite)
    T(a[11721], t[13]); -- Wild Combatant's Chain Armor (Combatant I)
    T(a[11721], t[80]); -- Wild Gladiator's Chain Armor (Gladiator)
    T(a[11721], t[1177]); -- Wild Gladiator's Chain Armor (Elite)
    T(a[11721], t[23]); -- Wild Combatant's Leather Armor (Combatant I)
    T(a[11721], t[85]); -- Wild Gladiator's Leather Armor (Gladiator)
    T(a[11721], t[1185]); -- Wild Gladiator's Leather Armor (Elite)
    T(a[11721], t[31]); -- Wild Combatant's Satin Armor (Combatant I)
    T(a[11721], t[98]); -- Wild Gladiator's Satin Armor (Gladiator)
    T(a[11721], t[405]); -- Wild Gladiator's Satin Armor (Elite)
    T(a[11721], t[17]); -- Wild Combatant's Dreadplate Armor (Combatant I)
    T(a[11721], t[90]); -- Wild Gladiator's Dreadplate Armor (Gladiator)
    T(a[11721], t[1173]); -- Wild Gladiator's Dreadplate Armor (Elite)
    T(a[11721], t[15]); -- Wild Combatant's Ringmail Armor (Combatant I)
    T(a[11721], t[81]); -- Wild Gladiator's Ringmail Armor (Gladiator)
    T(a[11721], t[1187]); -- Wild Gladiator's Ringmail Armor (Elite)
    T(a[11721], t[29]); -- Wild Combatant's Silk Armor (Combatant I)
    T(a[11721], t[100]); -- Wild Gladiator's Silk Armor (Gladiator)
    T(a[11721], t[1179]); -- Wild Gladiator's Silk Armor (Elite)
    T(a[11721], t[34]); -- Wild Combatant's Felweave Armor (Combatant I)
    T(a[11721], t[96]); -- Wild Gladiator's Felweave Armor (Gladiator)
    T(a[11721], t[1189]); -- Wild Gladiator's Felweave Armor (Elite)
    T(a[11721], t[28]); -- Wild Combatant's Ironskin Armor (Combatant I)
    T(a[11721], t[88]); -- Wild Gladiator's Ironskin Armor (Gladiator)
    T(a[11721], t[1181]); -- Wild Gladiator's Ironskin Armor (Elite)
    T(a[11721], t[26]); -- Wild Combatant's Dragonhide Armor (Combatant I)
    T(a[11721], t[84]); -- Wild Gladiator's Dragonhide Armor (Gladiator)
    T(a[11721], t[1175]); -- Wild Gladiator's Dragonhide Armor (Elite)
    T(a[11721], t[21]); -- Wild Combatant's Plate Armor (Combatant I)
    T(a[11721], t[91]); -- Wild Gladiator's Plate Armor (Gladiator)
    T(a[11721], t[1192]); -- Wild Gladiator's Plate Armor (Elite)
    T(a[11721], t[20]); -- Wild Combatant's Scaled Armor (Combatant I)
    T(a[11721], t[93]); -- Wild Gladiator's Scaled Armor (Gladiator)
    T(a[11721], t[1184]); -- Wild Gladiator's Scaled Paladin (Elite)
    T(a[11721], t[14]); -- Wild Combatant's Chain Armor (Combatant I)
    T(a[11721], t[79]); -- Wild Gladiator's Chain Armor (Gladiator)
    T(a[11721], t[1178]); -- Wild Gladiator's Chain Armor (Elite)
    T(a[11721], t[24]); -- Wild Combatant's Leather Armor (Combatant I)
    T(a[11721], t[86]); -- Wild Gladiator's Leather Armor (Gladiator)
    T(a[11721], t[1186]); -- Wild Gladiator's Leather Armor (Elite)
    T(a[11721], t[32]); -- Wild Combatant's Satin Armor (Combatant I)
    T(a[11721], t[97]); -- Wild Gladiator's Satin Armor (Gladiator)
    T(a[11721], t[406]); -- Wild Gladiator's Satin Armor (Elite)
    T(a[11721], t[18]); -- Wild Combatant's Dreadplate Armor (Combatant I)
    T(a[11721], t[89]); -- Wild Gladiator's Dreadplate Armor (Gladiator)
    T(a[11721], t[1174]); -- Wild Gladiator's Dreadplate Armor (Elite)
    T(a[11721], t[16]); -- Wild Combatant's Ringmail Armor (Combatant I)
    T(a[11721], t[82]); -- Wild Gladiator's Ringmail Armor (Gladiator)
    T(a[11721], t[1188]); -- Wild Gladiator's Ringmail Armor (Elite)
    T(a[11721], t[30]); -- Wild Combatant's Silk Armor (Combatant I)
    T(a[11721], t[99]); -- Wild Gladiator's Silk Armor (Gladiator)
    T(a[11721], t[1180]); -- Wild Gladiator's Silk Armor (Elite)
    T(a[11721], t[33]); -- Wild Combatant's Felweave Armor (Combatant I)
    T(a[11721], t[95]); -- Wild Gladiator's Felweave Armor (Gladiator)
    T(a[11721], t[1190]); -- Wild Gladiator's Felweave Armor (Elite)
    T(a[11721], t[27]); -- Wild Combatant's Ironskin Armor (Combatant I)
    T(a[11721], t[87]); -- Wild Gladiator's Ironskin Armor (Gladiator)
    T(a[11721], t[1182]); -- Wild Gladiator's Ironskin Armor (Elite)
    T(a[11721], t[25]); -- Wild Combatant's Dragonhide Armor (Combatant I)
    T(a[11721], t[83]); -- Wild Gladiator's Dragonhide Armor (Gladiator)
    T(a[11721], t[1176]); -- Wild Gladiator's Dragonhide Armor (Elite)
    a[11722] = b:New(11722, 10); -- War-Mog-ering
    T(a[11722], t[50]); -- Warmongering Combatant's Plate Armor (Combatant I)
    T(a[11722], t[116]); -- Warmongering Gladiator's Plate Armor (Gladiator)
    T(a[11722], t[1222]); -- Warmongering Gladiator's Plate Armor (Elite)
    T(a[11722], t[48]); -- Warmongering Combatant's Scaled Armor (Combatant I)
    T(a[11722], t[120]); -- Warmongering Gladiator's Scaled Armor (Gladiator)
    T(a[11722], t[1214]); -- Warmongering Gladiator's Scaled Armor (Elite)
    T(a[11722], t[35]); -- Warmongering Combatant's Chain Armor (Combatant I)
    T(a[11722], t[102]); -- Warmongering Gladiator's Chain Armor (Gladiator)
    T(a[11722], t[1208]); -- Warmongering Gladiator's Chain Armor (Elite)
    T(a[11722], t[41]); -- Warmongering Combatant's Leather Armor (Combatant I)
    T(a[11722], t[114]); -- Warmongering Gladiator's Leather Armor (Gladiator)
    T(a[11722], t[1216]); -- Warmongering Gladiator's Leather Armor (Elite)
    T(a[11722], t[52]); -- Warmongering Combatant's Satin Armor (Combatant I)
    T(a[11722], t[118]); -- Warmongering Gladiator's Satin Armor (Gladiator)
    T(a[11722], t[407]); -- Warmongering Gladiator's Satin Armor (Elite)
    T(a[11722], t[45]); -- Warmongering Combatant's Dreadplate Armor (Combatant I)
    T(a[11722], t[108]); -- Warmongering Gladiator's Dreadplate Armor (Gladiator)
    T(a[11722], t[1204]); -- Warmongering Gladiator's Dreadplate Armor (Elite)
    T(a[11722], t[37]); -- Warmongering Combatant's Ringmail Armor (Combatant I)
    T(a[11722], t[104]); -- Warmongering Gladiator's Ringmail Armor (Gladiator)
    T(a[11722], t[1218]); -- Warmongering Gladiator's Ringmail Armor (Elite)
    T(a[11722], t[53]); -- Warmongering Combatant's Silk Armor (Combatant I)
    T(a[11722], t[122]); -- Warmongering Gladiator's Silk Armor (Gladiator)
    T(a[11722], t[1210]); -- Warmongering Gladiator's Silk Armor (Elite)
    T(a[11722], t[56]); -- Warmongering Combatant's Felweave Armor (Combatant I)
    T(a[11722], t[110]); -- Warmongering Gladiator's Felweave Armor (Gladiator)
    T(a[11722], t[1220]); -- Warmongering Gladiator's Felweave Armor (Elite)
    T(a[11722], t[44]); -- Warmongering Combatant's Ironskin Armor (Combatant I)
    T(a[11722], t[112]); -- Warmongering Gladiator's Ironskin Armor (Gladiator)
    T(a[11722], t[1212]); -- Warmongering Gladiator's Ironskin Armor (Elite)
    T(a[11722], t[39]); -- Warmongering Combatant's Dragonhide Armor (Combatant I)
    T(a[11722], t[106]); -- Warmongering Gladiator's Dragonhide Armor (Gladiator)
    T(a[11722], t[1206]); -- Warmongering Gladiator's Dragonhide Armor (Elite)
    T(a[11722], t[49]); -- Warmongering Combatant's Plate Armor (Combatant I)
    T(a[11722], t[115]); -- Warmongering Gladiator's Plate Armor (Gladiator)
    T(a[11722], t[1223]); -- Warmongering Gladiator's Plate Armor (Elite)
    T(a[11722], t[47]); -- Warmongering Combatant's Scaled Armor (Combatant I)
    T(a[11722], t[119]); -- Warmongering Gladiator's Scaled Armor (Gladiator)
    T(a[11722], t[1215]); -- Warmongering Gladiator's Scaled Armor (Elite)
    T(a[11722], t[36]); -- Warmongering Combatant's Chain Armor (Combatant I)
    T(a[11722], t[101]); -- Warmongering Gladiator's Chain Armor (Gladiator)
    T(a[11722], t[1209]); -- Warmongering Gladiator's Chain Armor (Elite)
    T(a[11722], t[42]); -- Warmongering Combatant's Leather Armor (Combatant I)
    T(a[11722], t[113]); -- Warmongering Gladiator's Leather Armor (Gladiator)
    T(a[11722], t[1217]); -- Warmongering Gladiator's Leather Armor (Elite)
    T(a[11722], t[51]); -- Warmongering Combatant's Satin Armor (Combatant I)
    T(a[11722], t[117]); -- Warmongering Gladiator's Satin Armor (Gladiator)
    T(a[11722], t[408]); -- Warmongering Gladiator's Satin Armor (Elite)
    T(a[11722], t[46]); -- Warmongering Combatant's Dreadplate Armor (Combatant I)
    T(a[11722], t[107]); -- Warmongering Gladiator's Dreadplate Armor (Gladiator)
    T(a[11722], t[1205]); -- Warmongering Gladiator's Dreadplate Armor (Elite)
    T(a[11722], t[38]); -- Warmongering Combatant's Ringmail Armor (Combatant I)
    T(a[11722], t[103]); -- Warmongering Gladiator's Ringmail Armor (Gladiator)
    T(a[11722], t[1219]); -- Warmongering Gladiator's Ringmail Armor (Elite)
    T(a[11722], t[54]); -- Warmongering Combatant's Silk Armor (Combatant I)
    T(a[11722], t[121]); -- Warmongering Gladiator's Silk Armor (Gladiator)
    T(a[11722], t[1211]); -- Warmongering Gladiator's Silk Armor (Elite)
    T(a[11722], t[55]); -- Warmongering Combatant's Felweave Armor (Combatant I)
    T(a[11722], t[109]); -- Warmongering Gladiator's Felweave Armor (Gladiator)
    T(a[11722], t[1221]); -- Warmongering Gladiator's Felweave Armor (Elite)
    T(a[11722], t[43]); -- Warmongering Combatant's Ironskin Armor (Combatant I)
    T(a[11722], t[111]); -- Warmongering Gladiator's Ironskin Armor (Gladiator)
    T(a[11722], t[1213]); -- Warmongering Gladiator's Ironskin Armor (Elite)
    T(a[11722], t[40]); -- Warmongering Combatant's Dragonhide Armor (Combatant I)
    T(a[11722], t[105]); -- Warmongering Gladiator's Dragonhide Armor (Gladiator)
    T(a[11722], t[1207]); -- Warmongering Gladiator's Dragonhide Armor (Elite)
    a[11723] = b:New(11723, 10); -- Cruel Intentions
    T(a[11723], t[1270]); -- Cruel Combatant's Plate Armor (Combatant I)
    T(a[11723], t[1225]); -- Cruel Gladiator's Plate Armor (Gladiator)
    T(a[11723], t[1227]); -- Cruel Gladiator's Plate Armor (Elite)
    T(a[11723], t[1280]); -- Cruel Combatant's Scaled Armor (Combatant I)
    T(a[11723], t[1241]); -- Cruel Gladiator's Scaled Armor (Gladiator)
    T(a[11723], t[1243]); -- Cruel Gladiator's Scaled Armor (Elite)
    T(a[11723], t[1286]); -- Cruel Combatant's Chain Armor (Combatant I)
    T(a[11723], t[1254]); -- Cruel Gladiator's Chain Armor (Gladiator)
    T(a[11723], t[1255]); -- Cruel Gladiator's Chain Armor (Elite)
    T(a[11723], t[1276]); -- Cruel Combatant's Leather Armor (Combatant I)
    T(a[11723], t[1237]); -- Cruel Gladiator's Leather Armor (Gladiator)
    T(a[11723], t[1239]); -- Cruel Gladiator's Leather Armor (Elite)
    T(a[11723], t[1278]); -- Cruel Combatant's Satin Armor (Combatant I)
    T(a[11723], t[389]); -- Cruel Gladiator's Satin Armor (Gladiator)
    T(a[11723], t[395]); -- Cruel Gladiator's Satin Armor (Elite)
    T(a[11723], t[1292]); -- Cruel Combatant's Dreadplate Armor (Combatant I)
    T(a[11723], t[1265]); -- Cruel Gladiator's Dreadplate Armor (Gladiator)
    T(a[11723], t[1267]); -- Cruel Gladiator's Dreadplate Armor (Elite)
    T(a[11723], t[1274]); -- Cruel Combatant's Ringmail Armor (Combatant I)
    T(a[11723], t[1233]); -- Cruel Gladiator's Ringmail Armor (Gladiator)
    T(a[11723], t[1235]); -- Cruel Gladiator's Ringmail Armor (Elite)
    T(a[11723], t[1284]); -- Cruel Combatant's Silk Armor (Combatant I)
    T(a[11723], t[1249]); -- Cruel Gladiator's Silk Armor (Gladiator)
    T(a[11723], t[1251]); -- Cruel Gladiator's Silk Armor (Elite)
    T(a[11723], t[1272]); -- Cruel Combatant's Felweave Armor (Combatant I)
    T(a[11723], t[1229]); -- Cruel Gladiator's Felweave Armor (Gladiator)
    T(a[11723], t[1231]); -- Cruel Gladiator's Felweave Armor (Elite)
    T(a[11723], t[1282]); -- Cruel Combatant's Ironskin Armor (Combatant I)
    T(a[11723], t[1245]); -- Cruel Gladiator's Ironskin Armor (Gladiator)
    T(a[11723], t[1247]); -- Cruel Gladiator's Ironskin Armor (Elite)
    T(a[11723], t[1288]); -- Cruel Combatant's Dragonhide Armor (Combatant I)
    T(a[11723], t[1257]); -- Cruel Gladiator's Dragonhide Armor (Gladiator)
    T(a[11723], t[1259]); -- Cruel Gladiator's Dragonhide Armor (Elite)
    T(a[11723], t[1290]); -- Cruel Combatant's Felskin Armor (Combatant I)
    T(a[11723], t[1262]); -- Cruel Gladiator's Felskin Armor (Gladiator)
    T(a[11723], t[1263]); -- Cruel Gladiator's Felskin Armor (Elite)
    T(a[11723], t[1269]); -- Cruel Combatant's Plate Armor (Combatant I)
    T(a[11723], t[1226]); -- Cruel Gladiator's Plate Armor (Gladiator)
    T(a[11723], t[1228]); -- Cruel Gladiator's Plate Armor (Elite)
    T(a[11723], t[1279]); -- Cruel Combatant's Scaled Armor (Combatant I)
    T(a[11723], t[1242]); -- Cruel Gladiator's Scaled Armor (Gladiator)
    T(a[11723], t[1244]); -- Cruel Gladiator's Scaled Armor (Elite)
    T(a[11723], t[1285]); -- Cruel Combatant's Chain Armor (Combatant I)
    T(a[11723], t[1253]); -- Cruel Gladiator's Chain Armor (Gladiator)
    T(a[11723], t[1256]); -- Cruel Gladiator's Chain Armor (Elite)
    T(a[11723], t[1275]); -- Cruel Combatant's Leather Armor (Combatant I)
    T(a[11723], t[1238]); -- Cruel Gladiator's Leather Armor (Gladiator)
    T(a[11723], t[1240]); -- Cruel Gladiator's Leather Armor (Elite)
    T(a[11723], t[1277]); -- Cruel Combatant's Satin Armor (Combatant I)
    T(a[11723], t[391]); -- Cruel Gladiator's Satin Armor (Gladiator)
    T(a[11723], t[394]); -- Cruel Gladiator's Satin Armor (Elite)
    T(a[11723], t[1291]); -- Cruel Combatant's Dreadplate Armor (Combatant I)
    T(a[11723], t[1266]); -- Cruel Gladiator's Dreadplate Armor (Gladiator)
    T(a[11723], t[1268]); -- Cruel Gladiator's Dreadplate Armor (Elite)
    T(a[11723], t[1273]); -- Cruel Combatant's Ringmail Armor (Combatant I)
    T(a[11723], t[1234]); -- Cruel Gladiator's Ringmail Armor (Gladiator)
    T(a[11723], t[1236]); -- Cruel Gladiator's Ringmail Armor (Elite)
    T(a[11723], t[1283]); -- Cruel Combatant's Silk Armor (Combatant I)
    T(a[11723], t[1250]); -- Cruel Gladiator's Silk Armor (Gladiator)
    T(a[11723], t[1252]); -- Cruel Gladiator's Silk Armor (Elite)
    T(a[11723], t[1271]); -- Cruel Combatant's Felweave Armor (Combatant I)
    T(a[11723], t[1230]); -- Cruel Gladiator's Felweave Armor (Gladiator)
    T(a[11723], t[1232]); -- Cruel Gladiator's Felweave Armor (Elite)
    T(a[11723], t[1281]); -- Cruel Combatant's Ironskin Armor (Combatant I)
    T(a[11723], t[1246]); -- Cruel Gladiator's Ironskin Armor (Gladiator)
    T(a[11723], t[1248]); -- Cruel Gladiator's Ironskin Armor (Elite)
    T(a[11723], t[1287]); -- Cruel Combatant's Dragonhide Armor (Combatant I)
    T(a[11723], t[1258]); -- Cruel Gladiator's Dragonhide Armor (Gladiator)
    T(a[11723], t[1260]); -- Cruel Gladiator's Dragonhide Armor (Elite)
    T(a[11723], t[1289]); -- Cruel Combatant's Felskin Armor (Combatant I)
    T(a[11723], t[1261]); -- Cruel Gladiator's Felskin Armor (Gladiator)
    T(a[11723], t[1264]); -- Cruel Gladiator's Felskin Armor (Elite)
    a[11724] = b:New(11724, 10); -- Fel Turkey!
    a[11725] = b:New(11725, 5); -- Fisherfriend of the Isles
    a[11731] = b:New(11731, 5); -- A Magic Contribution
    a[11732] = b:New(11732, 10); -- A Magnificent Contribution
    a[11735] = b:New(11735, 5); -- Take Command
    a[11736] = b:New(11736, 10); -- Assume Command
    a[11737] = b:New(11737, 5); -- Disrupting the Nether
    a[11738] = b:New(11738, 10); -- It'll Nether Happen
    a[11740] = b:New(11740, 10); -- Make it W-orc W-orc
    T(a[11740], t[435]); -- Blackhand's Battlegear (Normal)
    T(a[11740], t[436]); -- Blackhand's Battlegear (Heroic)
    T(a[11740], t[437]); -- Blackhand's Battlegear (Mythic)
    T(a[11740], t[483]); -- Battlegear of Guiding Light (Normal)
    T(a[11740], t[484]); -- Battlegear of Guiding Light (Heroic)
    T(a[11740], t[485]); -- Battlegear of Guiding Light (Mythic)
    T(a[11740], t[536]); -- Rylakstalker's Battlegear (Normal)
    T(a[11740], t[537]); -- Rylakstalker's Battlegear (Heroic)
    T(a[11740], t[538]); -- Rylakstalker's Battlegear (Mythic)
    T(a[11740], t[468]); -- Poisoner's Battlegear (Normal)
    T(a[11740], t[469]); -- Poisoner's Battlegear (Heroic)
    T(a[11740], t[470]); -- Poisoner's Battlegear (Mythic)
    T(a[11740], t[327]); -- Soul Priest's Raiment (Normal)
    T(a[11740], t[329]); -- Soul Priest's Raiment (Mythic)
    T(a[11740], t[419]); -- Soul Priest's Raiment (Heroic)
    T(a[11740], t[569]); -- Ogreskull Boneplate Battlegear (Normal)
    T(a[11740], t[570]); -- Ogreskull Boneplate Battlegear (Heroic)
    T(a[11740], t[571]); -- Ogreskull Boneplate Battlegear (Mythic)
    T(a[11740], t[418]); -- Windspeaker's Regalia (Normal)
    T(a[11740], t[328]); -- Windspeaker's Regalia (Heroic)
    T(a[11740], t[420]); -- Windspeaker's Regalia (Mythic)
    T(a[11740], t[520]); -- Arcanoshatter Regalia (Normal)
    T(a[11740], t[521]); -- Arcanoshatter Regalia (Heroic)
    T(a[11740], t[522]); -- Arcanoshatter Regalia (Mythic)
    T(a[11740], t[452]); -- Shadow Council's Garb (Normal)
    T(a[11740], t[454]); -- Shadow Council's Garb (Heroic)
    T(a[11740], t[453]); -- Shadow Council's Garb (Mythic)
    T(a[11740], t[498]); -- Battlegear of the Somber Gaze (Normal)
    T(a[11740], t[500]); -- Battlegear of the Somber Gaze (Heroic)
    T(a[11740], t[501]); -- Battlegear of the Somber Gaze (Mythic)
    T(a[11740], t[554]); -- Living Wood Battlegear (Normal)
    T(a[11740], t[555]); -- Living Wood Battlegear (Heroic)
    T(a[11740], t[556]); -- Living Wood Battlegear (Mythic)
    a[11741] = b:New(11741, 10); -- So Hot Right Now
    T(a[11741], t[853]); -- Battlegear of Might (Normal)
    T(a[11741], t[902]); -- Lawbringer Armor (Normal)
    T(a[11741], t[917]); -- Giantstalker Armor (Normal)
    T(a[11741], t[894]); -- Nightslayer Armor (Normal)
    T(a[11741], t[357]); -- Vestments of Prophecy (Normal)
    T(a[11741], t[876]); -- The Earthfury (Normal)
    T(a[11741], t[910]); -- Arcanist Regalia (Normal)
    T(a[11741], t[868]); -- Felheart Raiment (Normal)
    T(a[11741], t[928]); -- Cenarion Raiment (Normal)
    a[11742] = b:New(11742, 10); -- Dress in Lairs
    T(a[11742], t[852]); -- Battlegear of Wrath (Normal)
    T(a[11742], t[901]); -- Judgment Armor (Normal)
    T(a[11742], t[916]); -- Dragonstalker Armor (Normal)
    T(a[11742], t[893]); -- Bloodfang Armor (Normal)
    T(a[11742], t[356]); -- Vestments of Transcendence (Normal)
    T(a[11742], t[875]); -- The Ten Storms (Normal)
    T(a[11742], t[909]); -- Netherwind Regalia (Normal)
    T(a[11742], t[867]); -- Nemesis Raiment (Normal)
    T(a[11742], t[927]); -- Stormrage Raiment (Normal)
    a[11743] = b:New(11743, 10); -- Accessor-Eyes
    T(a[11743], t[851]); -- Conqueror's Battlegear (Normal)
    T(a[11743], t[900]); -- Avenger's Battlegear (Normal)
    T(a[11743], t[915]); -- Striker's Garb (Normal)
    T(a[11743], t[892]); -- Deathdealer's Embrace (Normal)
    T(a[11743], t[358]); -- Garments of the Oracle (Normal)
    T(a[11743], t[874]); -- Stormcaller's Garb (Normal)
    T(a[11743], t[908]); -- Enigma Vestments (Normal)
    T(a[11743], t[866]); -- Doomcaller's Attire (Normal)
    T(a[11743], t[926]); -- Genesis Raiment (Normal)
    a[11744] = b:New(11744, 0); -- "Drop Dead, Gorgeous"
    T(a[11744], t[850]); -- Dreadnaught's Battlegear (Normal)
    T(a[11744], t[899]); -- Redemption Armor (Normal)
    T(a[11744], t[914]); -- Cryptstalker Armor (Normal)
    T(a[11744], t[891]); -- Bonescythe Armor (Normal)
    T(a[11744], t[355]); -- Vestments of Faith (Normal)
    T(a[11744], t[873]); -- The Earthshatterer (Normal)
    T(a[11744], t[907]); -- Frostfire Regalia (Normal)
    T(a[11744], t[865]); -- Plagueheart Raiment (Normal)
    T(a[11744], t[924]); -- Dreamwalker Raiment (Normal)
    a[11746] = b:New(11746, 10); -- Outlandish Style
    T(a[11746], t[849]); -- Warbringer Armor (Normal)
    T(a[11746], t[906]); -- Justicar Armor (Normal)
    T(a[11746], t[913]); -- Demon Stalker Armor (Normal)
    T(a[11746], t[890]); -- Netherblade (Normal)
    T(a[11746], t[354]); -- Incarnate Regalia (Normal)
    T(a[11746], t[872]); -- Cyclone Regalia (Normal)
    T(a[11746], t[898]); -- Aldor Regalia (Normal)
    T(a[11746], t[864]); -- Voidheart Raiment (Normal)
    T(a[11746], t[922]); -- Malorne Raiment (Normal)
    a[11747] = b:New(11747, 10); -- Merely a Set
    T(a[11747], t[848]); -- Destroyer Armor (Normal)
    T(a[11747], t[897]); -- Crystalforge Armor (Normal)
    T(a[11747], t[918]); -- Rift Stalker Armor (Normal)
    T(a[11747], t[889]); -- Deathmantle (Normal)
    T(a[11747], t[353]); -- Avatar Regalia (Normal)
    T(a[11747], t[871]); -- Cataclysm Regalia (Normal)
    T(a[11747], t[905]); -- Tirisfal Regalia (Normal)
    T(a[11747], t[863]); -- Corruptor Raiment (Normal)
    T(a[11747], t[921]); -- Nordrassil Raiment (Normal)
    a[11748] = b:New(11748, 10); -- Black is the New Black
    T(a[11748], t[847]); -- Onslaught Armor (Normal)
    T(a[11748], t[896]); -- Lightbringer Armor (Normal)
    T(a[11748], t[912]); -- Gronnstalker's Armor (Normal)
    T(a[11748], t[888]); -- Slayer's Armor (Normal)
    T(a[11748], t[351]); -- Absolution Regalia (Normal)
    T(a[11748], t[870]); -- Skyshatter Regalia (Normal)
    T(a[11748], t[904]); -- Tempest Regalia (Normal)
    T(a[11748], t[862]); -- Malefic Raiment (Normal)
    T(a[11748], t[920]); -- Thunderheart Raiment (Normal)
    a[11749] = b:New(11749, 10); -- "Suns Out, Thori'dals Out"
    T(a[11749], t[931]); -- Onslaught Battlegear (Sunwell)
    T(a[11749], t[895]); -- Lightbringer Battlegear (Sunwell)
    T(a[11749], t[911]); -- Gronnstalker's Battlegear (Sunwell)
    T(a[11749], t[887]); -- Slayer's Battlegear (Sunwell)
    T(a[11749], t[352]); -- Vestments of Absolution (Sunwell)
    T(a[11749], t[869]); -- Skyshatter Raiment (Sunwell)
    T(a[11749], t[903]); -- Tempest Garb (Sunwell)
    T(a[11749], t[932]); -- Malefic Regalia (Sunwell)
    T(a[11749], t[919]); -- Thunderheart Regalia (Sunwell)
    a[11750] = b:New(11750, 10); -- Undying Aesthetic
    T(a[11750], t[661]); -- Heroes' Dreadnaught Battlegear (10 Player (Normal))
    T(a[11750], t[662]); -- Valorous Dreadnaught Battlegear (25 Player (Normal))
    T(a[11750], t[710]); -- Heroes' Redemption Plate (10 Player (Normal))
    T(a[11750], t[711]); -- Valorous Redemption Plate (25 Player (Normal))
    T(a[11750], t[742]); -- Heroes' Cryptstalker Battlegear (10 Player (Normal))
    T(a[11750], t[743]); -- Valorous Cryptstalker Battlegear (25 Player (Normal))
    T(a[11750], t[694]); -- Heroes' Bonescythe Battlegear (10 Player (Normal))
    T(a[11750], t[695]); -- Valorous Bonescythe Battlegear (25 Player (Normal))
    T(a[11750], t[361]); -- Heroes' Regalia of Faith (10 Player (Normal))
    T(a[11750], t[362]); -- Valorous Regalia of Faith (25 Player (Normal))
    T(a[11750], t[845]); -- Heroes' Scourgeborne Plate (10 Player (Normal))
    T(a[11750], t[846]); -- Valorous Scourgeborne Plate (25 Player (Normal))
    T(a[11750], t[644]); -- Heroes' Earthshatter Regalia (10 Player (Normal))
    T(a[11750], t[645]); -- Valorous Earthshatter Regalia (25 Player (Normal))
    T(a[11750], t[726]); -- Heroes' Frostfire Garb (10 Player (Normal))
    T(a[11750], t[727]); -- Valorous Frostfire Garb (25 Player (Normal))
    T(a[11750], t[678]); -- Heroes' Plagueheart Garb (10 Player (Normal))
    T(a[11750], t[679]); -- Valorous Plagueheart Garb (25 Player (Normal))
    T(a[11750], t[829]); -- Heroes' Dreamwalker Battlegear (10 Player (Normal))
    T(a[11750], t[830]); -- Valorous Dreamwalker Battlegear (25 Player (Normal))
    a[11751] = b:New(11751, 10); -- Mogg-Saron
    T(a[11751], t[659]); -- Valorous Siegebreaker Battlegear (10 Player (Normal))
    T(a[11751], t[660]); -- Conqueror's Siegebreaker Battlegear (25 Player (Normal))
    T(a[11751], t[708]); -- Valorous Aegis Plate (10 Player (Normal))
    T(a[11751], t[709]); -- Conqueror's Aegis Plate (25 Player (Normal))
    T(a[11751], t[740]); -- Valorous Scourgestalker Battlegear (10 Player (Normal))
    T(a[11751], t[741]); -- Conqueror's Scourgestalker Battlegear (25 Player (Normal))
    T(a[11751], t[692]); -- Valorous Terrorblade Battlegear (10 Player (Normal))
    T(a[11751], t[693]); -- Conqueror's Terrorblade Battlegear (25 Player (Normal))
    T(a[11751], t[363]); -- Valorous Sanctification Regalia (10 Player (Normal))
    T(a[11751], t[364]); -- Conqueror's Sanctification Regalia (25 Player (Normal))
    T(a[11751], t[843]); -- Valorous Darkruned Plate (10 Player (Normal))
    T(a[11751], t[844]); -- Conqueror's Darkruned Plate (25 Player (Normal))
    T(a[11751], t[642]); -- Valorous Worldbreaker Regalia (10 Player (Normal))
    T(a[11751], t[643]); -- Conqueror's Worldbreaker Regalia (25 Player (Normal))
    T(a[11751], t[724]); -- Valorous Kirin Tor Garb (10 Player (Normal))
    T(a[11751], t[725]); -- Conqueror's Kirin Tor Garb (25 Player (Normal))
    T(a[11751], t[676]); -- Valorous Deathbringer Garb (10 Player (Normal))
    T(a[11751], t[677]); -- Conqueror's Deathbringer Garb (25 Player (Normal))
    T(a[11751], t[827]); -- Valorous Nightsong Battlegear (10 Player (Normal))
    T(a[11751], t[828]); -- Conqueror's Nightsong Battlegear (25 Player (Normal))
    a[11752] = b:New(11752, 10); -- Style of the Crusader
    T(a[11752], t[658]); -- Wrynn's Battlegear (10 Player (Normal))
    T(a[11752], t[706]); -- Turalyon's Plate (10 Player (Normal))
    T(a[11752], t[739]); -- Windrunner's Battlegear (10 Player (Normal))
    T(a[11752], t[690]); -- VanCleef's Battlegear (10 Player (Normal))
    T(a[11752], t[349]); -- Velen's Regalia (10 Player (Normal))
    T(a[11752], t[842]); -- Thassarian's Battlegear (10 Player (Normal))
    T(a[11752], t[640]); -- Nobundo's Garb (10 Player (Normal))
    T(a[11752], t[722]); -- Khadgar's Regalia (10 Player (Normal))
    T(a[11752], t[674]); -- Kel'Thuzad's Regalia (10 Player (Normal))
    T(a[11752], t[825]); -- Malfurion's Battlegear (10 Player (Normal))
    T(a[11752], t[657]); -- Hellscream's Battlegear (10 Player (Normal))
    T(a[11752], t[707]); -- Liadrin's Plate (10 Player (Normal))
    T(a[11752], t[738]); -- Windrunner's Pursuit (10 Player (Normal))
    T(a[11752], t[691]); -- Garona's Battlegear (10 Player (Normal))
    T(a[11752], t[350]); -- Zabra's Regalia (10 Player (Normal))
    T(a[11752], t[841]); -- Koltira's Battlegear (10 Player (Normal))
    T(a[11752], t[641]); -- Thrall's Garb (10 Player (Normal))
    T(a[11752], t[723]); -- Sunstrider's Regalia (10 Player (Normal))
    T(a[11752], t[675]); -- Gul'dan's Regalia (10 Player (Normal))
    T(a[11752], t[826]); -- Runetotem's Battlegear (10 Player (Normal))
    a[11753] = b:New(11753, 10); -- Winter Catalog
    T(a[11753], t[655]); -- Ymirjar Lord's Battlegear (10 Player (Normal))
    T(a[11753], t[656]); -- Sanctified Ymirjar Lord's Battlegear (25 Player (Normal))
    T(a[11753], t[298]); -- Sanctified Ymirjar Lord's Battlegear (25 Player (Heroic))
    T(a[11753], t[703]); -- Lightsworn Plate (10 Player (Normal))
    T(a[11753], t[704]); -- Sanctified Lightsworn Plate (25 Player (Normal))
    T(a[11753], t[705]); -- Sanctified Lightsworn Plate (25 Player (Heroic))
    T(a[11753], t[735]); -- Ahn'Kahar Blood Hunter's Battlegear (10 Player (Normal))
    T(a[11753], t[736]); -- Sanctified Ahn'Kahar Blood Hunter's Battlegear (25 Player (Normal))
    T(a[11753], t[737]); -- Sanctified Ahn'Kahar Blood Hunter's Battlegear (25 Player (Heroic))
    T(a[11753], t[687]); -- Shadowblade's Battlegear (10 Player (Normal))
    T(a[11753], t[688]); -- Sanctified Shadowblade's Battlegear (25 Player (Normal))
    T(a[11753], t[689]); -- Sanctified Shadowblade's Battlegear (25 Player (Heroic))
    T(a[11753], t[346]); -- Crimson Acolyte Regalia (10 Player (Normal))
    T(a[11753], t[347]); -- Sanctified Crimson Acolyte Regalia (25 Player (Normal))
    T(a[11753], t[348]); -- Sanctified Crimson Acolyte Regalia (25 Player (Heroic))
    T(a[11753], t[838]); -- Scourgelord's Plate (10 Player (Normal))
    T(a[11753], t[839]); -- Sanctified Scourgelord's Plate (25 Player (Normal))
    T(a[11753], t[840]); -- Sanctified Scourgelord's Plate (25 Player (Heroic))
    T(a[11753], t[637]); -- Frost Witch's Regalia (10 Player (Normal))
    T(a[11753], t[638]); -- Frost Witch's Regalia (25 Player (Normal))
    T(a[11753], t[639]); -- Frost Witch's Regalia (25 Player (Heroic))
    T(a[11753], t[719]); -- Bloodmage's Regalia (10 Player (Normal))
    T(a[11753], t[720]); -- Sanctified Bloodmage's Regalia (25 Player (Normal))
    T(a[11753], t[721]); -- Sanctified Bloodmage's Regalia (25 Player (Heroic))
    T(a[11753], t[671]); -- Dark Coven's Regalia (10 Player (Normal))
    T(a[11753], t[672]); -- Sanctified Dark Coven's Regalia (25 Player (Normal))
    T(a[11753], t[673]); -- Sanctified Dark Coven's Regalia (25 Player (Heroic))
    T(a[11753], t[822]); -- Lasherweave Battlegear (10 Player (Normal))
    T(a[11753], t[823]); -- Sanctified Lasherweave Battlegear (25 Player (Normal))
    T(a[11753], t[824]); -- Sanctified Lasherweave Battlegear (25 Player (Heroic))
    a[11754] = b:New(11754, 10); -- Glamour of Twilight
    T(a[11754], t[653]); -- Earthen Battleplate (Normal)
    T(a[11754], t[654]); -- Earthen Battleplate (Heroic)
    T(a[11754], t[701]); -- Reinforced Sapphirium Battleplate (Normal)
    T(a[11754], t[702]); -- Reinforced Sapphirium Battleplate (Heroic)
    T(a[11754], t[733]); -- Lightning-Charged Battlegear (Normal)
    T(a[11754], t[734]); -- Lightning-Charged Battlegear (Heroic)
    T(a[11754], t[685]); -- Wind Dancer's Regalia (Normal)
    T(a[11754], t[686]); -- Wind Dancer's Regalia (Heroic)
    T(a[11754], t[344]); -- Mercurial Regalia (Normal)
    T(a[11754], t[345]); -- Mercurial Regalia (Heroic)
    T(a[11754], t[836]); -- Magma Plated Battlearmor (Normal)
    T(a[11754], t[837]); -- Magma Plated Battlearmor (Heroic)
    T(a[11754], t[635]); -- Regalia of the Raging Elements (Normal)
    T(a[11754], t[636]); -- Regalia of the Raging Elements (Heroic)
    T(a[11754], t[717]); -- Firelord's Vestments (Normal)
    T(a[11754], t[718]); -- Firelord's Vestments (Heroic)
    T(a[11754], t[669]); -- Shadowflame Regalia (Normal)
    T(a[11754], t[670]); -- Shadowflame Regalia (Heroic)
    T(a[11754], t[820]); -- Stormrider's Vestments (Normal)
    T(a[11754], t[821]); -- Stormrider's Vestments (Heroic)
    a[11755] = b:New(11755, 10); -- Hot Couture
    T(a[11755], t[651]); -- Molten Giant Battleplate (Normal)
    T(a[11755], t[652]); -- Molten Giant Battleplate (Heroic)
    T(a[11755], t[699]); -- Battleplate of Immolation (Normal)
    T(a[11755], t[700]); -- Battleplate of Immolation (Heroic)
    T(a[11755], t[731]); -- Flamewaker's Battlegear (Normal)
    T(a[11755], t[732]); -- Flamewaker's Battlegear (Heroic)
    T(a[11755], t[683]); -- Vestments of the Dark Phoenix (Normal)
    T(a[11755], t[684]); -- Vestments of the Dark Phoenix (Heroic)
    T(a[11755], t[342]); -- Regalia of the Cleansing Flame (Normal)
    T(a[11755], t[343]); -- Regalia of the Cleansing Flame (Heroic)
    T(a[11755], t[834]); -- Elementium Deathplate Battlearmor (Normal)
    T(a[11755], t[835]); -- Elementium Deathplate Battlearmor (Heroic)
    T(a[11755], t[633]); -- Volcanic Regalia (Normal)
    T(a[11755], t[634]); -- Volcanic Regalia (Heroic)
    T(a[11755], t[715]); -- Firehawk Robes of Conflagration (Normal)
    T(a[11755], t[716]); -- Firehawk Robes of Conflagration (Heroic)
    T(a[11755], t[667]); -- Balespider's Burning Vestments (Normal)
    T(a[11755], t[668]); -- Balespider's Burning Vestments (Heroic)
    T(a[11755], t[818]); -- Obsidian Arborweave Vestments (Normal)
    T(a[11755], t[819]); -- Obsidian Arborweave Vestments (Heroic)
    a[11756] = b:New(11756, 10); -- Wardrobe of the Old Gods
    T(a[11756], t[650]); -- Colossal Dragonplate Battlegear (Raid Finder)
    T(a[11756], t[649]); -- Colossal Dragonplate Battlegear (Normal)
    T(a[11756], t[631]); -- Colossal Dragonplate Battlegear (Heroic)
    T(a[11756], t[697]); -- Battleplate of Radiant Glory (Raid Finder)
    T(a[11756], t[696]); -- Battleplate of Radiant Glory (Normal)
    T(a[11756], t[698]); -- Battleplate of Radiant Glory (Heroic)
    T(a[11756], t[729]); -- Wyrmstalker Battlegear (Raid Finder)
    T(a[11756], t[728]); -- Wyrmstalker Battlegear (Normal)
    T(a[11756], t[730]); -- Wyrmstalker Battlegear (Heroic)
    T(a[11756], t[681]); -- Blackfang Battleweave (Raid Finder)
    T(a[11756], t[680]); -- Blackfang Battleweave (Normal)
    T(a[11756], t[682]); -- Blackfang Battleweave (Heroic)
    T(a[11756], t[340]); -- Regalia of Dying Light (Raid Finder)
    T(a[11756], t[339]); -- Regalia of Dying Light (Normal)
    T(a[11756], t[341]); -- Regalia of Dying Light (Heroic)
    T(a[11756], t[832]); -- Necrotic Boneplate Armor (Raid Finder)
    T(a[11756], t[831]); -- Necrotic Boneplate Armor (Normal)
    T(a[11756], t[833]); -- Necrotic Boneplate Armor (Heroic)
    T(a[11756], t[632]); -- Spiritwalker's Regalia (Raid Finder)
    T(a[11756], t[630]); -- Spiritwalker's Regalia (Normal)
    T(a[11756], t[663]); -- Spiritwalker's Regalia (Heroic)
    T(a[11756], t[713]); -- Time Lord's Regalia (Raid Finder)
    T(a[11756], t[712]); -- Time Lord's Regalia (Normal)
    T(a[11756], t[714]); -- Time Lord's Regalia (Heroic)
    T(a[11756], t[665]); -- Vestments of the Faceless Shroud (Raid Finder)
    T(a[11756], t[664]); -- Vestments of the Faceless Shroud (Normal)
    T(a[11756], t[666]); -- Vestments of the Faceless Shroud (Heroic)
    T(a[11756], t[816]); -- Deep Earth Vestments (Raid Finder)
    T(a[11756], t[815]); -- Deep Earth Vestments (Normal)
    T(a[11756], t[817]); -- Deep Earth Vestments (Heroic)
    a[11757] = b:New(11757, 10); -- Sha of Fabulous
    T(a[11757], t[446]); -- Battleplate of Resounding Rings (Raid Finder)
    T(a[11757], t[444]); -- Battleplate of Resounding Rings (Normal)
    T(a[11757], t[445]); -- Battleplate of Resounding Rings (Heroic)
    T(a[11757], t[495]); -- White Tiger Battlegear (Raid Finder)
    T(a[11757], t[493]); -- White Tiger Battlegear (Normal)
    T(a[11757], t[494]); -- White Tiger Battlegear (Heroic)
    T(a[11757], t[546]); -- Yaungol Slayer Battlegear (Raid Finder)
    T(a[11757], t[545]); -- Yaungol Slayer Battlegear (Normal)
    T(a[11757], t[547]); -- Yaungol Slayer Battlegear (Heroic)
    T(a[11757], t[479]); -- Battlegear of the Thousandfold Blades (Raid Finder)
    T(a[11757], t[478]); -- Battlegear of the Thousandfold Blades (Normal)
    T(a[11757], t[477]); -- Battlegear of the Thousandfold Blades (Heroic)
    T(a[11757], t[337]); -- Guardian Serpent Regalia (Raid Finder)
    T(a[11757], t[336]); -- Guardian Serpent Regalia (Normal)
    T(a[11757], t[429]); -- Guardian Serpent Regalia (Heroic)
    T(a[11757], t[579]); -- Plate of the Lost Catacomb (Raid Finder)
    T(a[11757], t[578]); -- Plate of the Lost Catacomb (Normal)
    T(a[11757], t[580]); -- Plate of the Lost Catacomb (Heroic)
    T(a[11757], t[428]); -- Regalia of the Firebird (Raid Finder)
    T(a[11757], t[427]); -- Regalia of the Firebird (Normal)
    T(a[11757], t[338]); -- Regalia of the Firebird (Heroic)
    T(a[11757], t[531]); -- Regalia of the Burning Scroll (Raid Finder)
    T(a[11757], t[529]); -- Regalia of the Burning Scroll (Normal)
    T(a[11757], t[530]); -- Regalia of the Burning Scroll (Heroic)
    T(a[11757], t[462]); -- Sha Skin Regalia (Raid Finder)
    T(a[11757], t[461]); -- Sha Skin Regalia (Normal)
    T(a[11757], t[463]); -- Sha Skin Regalia (Heroic)
    T(a[11757], t[515]); -- Vestments of the Red Crane (Raid Finder)
    T(a[11757], t[513]); -- Vestments of the Red Crane (Normal)
    T(a[11757], t[514]); -- Vestments of the Red Crane (Heroic)
    T(a[11757], t[565]); -- Vestments of the Eternal Blossom (Raid Finder)
    T(a[11757], t[563]); -- Vestments of the Eternal Blossom (Normal)
    T(a[11757], t[564]); -- Vestments of the Eternal Blossom (Heroic)
    a[11758] = b:New(11758, 10); -- Thunderwear
    T(a[11758], t[442]); -- Battleplate of the Last Mogu (Raid Finder)
    T(a[11758], t[441]); -- Battleplate of the Last Mogu (Normal)
    T(a[11758], t[443]); -- Battleplate of the Last Mogu (Heroic)
    T(a[11758], t[492]); -- Battlegear of the Lightning Emperor (Raid Finder)
    T(a[11758], t[490]); -- Battlegear of the Lightning Emperor (Normal)
    T(a[11758], t[491]); -- Battlegear of the Lightning Emperor (Heroic)
    T(a[11758], t[543]); -- Battlegear of the Saurok Stalker (Raid Finder)
    T(a[11758], t[542]); -- Battlegear of the Saurok Stalker (Normal)
    T(a[11758], t[544]); -- Battlegear of the Saurok Stalker (Heroic)
    T(a[11758], t[476]); -- Nine-Tail Battlegear (Raid Finder)
    T(a[11758], t[474]); -- Nine-Tail Battlegear (Normal)
    T(a[11758], t[475]); -- Nine-Tail Battlegear (Heroic)
    T(a[11758], t[335]); -- Regalia of the Exorcist (Raid Finder)
    T(a[11758], t[310]); -- Regalia of the Exorcist (Normal)
    T(a[11758], t[334]); -- Regalia of the Exorcist (Heroic)
    T(a[11758], t[576]); -- Battleplate of the All-Consuming Maw (Raid Finder)
    T(a[11758], t[575]); -- Battleplate of the All-Consuming Maw (Normal)
    T(a[11758], t[577]); -- Battleplate of the All-Consuming Maw (Heroic)
    T(a[11758], t[426]); -- Regalia of the Witch Doctor (Raid Finder)
    T(a[11758], t[424]); -- Regalia of the Witch Doctor (Normal)
    T(a[11758], t[425]); -- Regalia of the Witch Doctor (Heroic)
    T(a[11758], t[528]); -- Regalia of the Chromatic Hydra (Raid Finder)
    T(a[11758], t[526]); -- Regalia of the Chromatic Hydra (Normal)
    T(a[11758], t[527]); -- Regalia of the Chromatic Hydra (Heroic)
    T(a[11758], t[459]); -- Regalia of the Thousandfold Hells (Raid Finder)
    T(a[11758], t[458]); -- Regalia of the Thousandfold Hells (Normal)
    T(a[11758], t[460]); -- Regalia of the Thousandfold Hells (Heroic)
    T(a[11758], t[512]); -- Fire-Charm Vestments (Raid Finder)
    T(a[11758], t[510]); -- Fire-Charm Vestments (Normal)
    T(a[11758], t[511]); -- Fire-Charm Vestments (Heroic)
    T(a[11758], t[562]); -- Vestments of the Haunted Forest (Raid Finder)
    T(a[11758], t[560]); -- Vestments of the Haunted Forest (Normal)
    T(a[11758], t[561]); -- Vestments of the Haunted Forest (Heroic)
    a[11759] = b:New(11759, 10); -- Yaass'shaarj
    T(a[11759], t[440]); -- Battleplate of the Prehistoric Marauder (Raid Finder)
    T(a[11759], t[438]); -- Battleplate of the Prehistoric Marauder (Normal)
    T(a[11759], t[439]); -- Battleplate of the Prehistoric Marauder (Mythic)
    T(a[11759], t[489]); -- Vestments of Winged Triumph (Raid Finder)
    T(a[11759], t[487]); -- Vestments of Winged Triumph (Normal)
    T(a[11759], t[488]); -- Vestments of Winged Triumph (Mythic)
    T(a[11759], t[541]); -- Battlegear of the Unblinking Vigil (Raid Finder)
    T(a[11759], t[539]); -- Battlegear of the Unblinking Vigil (Normal)
    T(a[11759], t[540]); -- Battlegear of the Unblinking Vigil (Mythic)
    T(a[11759], t[473]); -- Barbed Assassin Battlegear (Raid Finder)
    T(a[11759], t[471]); -- Barbed Assassin Battlegear (Normal)
    T(a[11759], t[472]); -- Barbed Assassin Battlegear (Mythic)
    T(a[11759], t[333]); -- Regalia of Ternion Glory (Raid Finder)
    T(a[11759], t[331]); -- Regalia of Ternion Glory (Normal)
    T(a[11759], t[332]); -- Regalia of Ternion Glory (Mythic)
    T(a[11759], t[574]); -- Battleplate of Cyclopean Dread (Raid Finder)
    T(a[11759], t[572]); -- Battleplate of Cyclopean Dread (Normal)
    T(a[11759], t[573]); -- Battleplate of Cyclopean Dread (Mythic)
    T(a[11759], t[423]); -- Regalia of Celestial Harmony (Raid Finder)
    T(a[11759], t[421]); -- Regalia of Celestial Harmony (Normal)
    T(a[11759], t[422]); -- Regalia of Celestial Harmony (Mythic)
    T(a[11759], t[525]); -- Chronomancer Regalia (Raid Finder)
    T(a[11759], t[523]); -- Chronomancer Regalia (Normal)
    T(a[11759], t[524]); -- Chronomancer Regalia (Mythic)
    T(a[11759], t[457]); -- Regalia of the Horned Nightmare (Raid Finder)
    T(a[11759], t[455]); -- Regalia of the Horned Nightmare (Normal)
    T(a[11759], t[456]); -- Regalia of the Horned Nightmare (Mythic)
    T(a[11759], t[508]); -- Vestments of the Seven Sacred Seals (Raid Finder)
    T(a[11759], t[506]); -- Vestments of the Seven Sacred Seals (Normal)
    T(a[11759], t[507]); -- Vestments of the Seven Sacred Seals (Mythic)
    T(a[11759], t[559]); -- Vestments of the Shattered Vale (Raid Finder)
    T(a[11759], t[557]); -- Vestments of the Shattered Vale (Normal)
    T(a[11759], t[558]); -- Vestments of the Shattered Vale (Mythic)
    a[11760] = b:New(11760, 10); -- Retro Trend
    T(a[11760], t[1296]); -- Titanic Onslaught Armor (Raid Finder)
    T(a[11760], t[1293]); -- Titanic Onslaught Armor (Normal)
    T(a[11760], t[1294]); -- Titanic Onslaught Armor (Heroic)
    T(a[11760], t[1295]); -- Titanic Onslaught Armor (Mythic)
    T(a[11760], t[2305]); -- Titanic Onslaught Armor (Timewarped)
    T(a[11760], t[1315]); -- Radiant Lightbringer Armor (Raid Finder)
    T(a[11760], t[1313]); -- Radiant Lightbringer Armor (Normal)
    T(a[11760], t[1316]); -- Radiant Lightbringer Armor (Heroic)
    T(a[11760], t[1314]); -- Radiant Lightbringer Armor (Mythic)
    T(a[11760], t[2300]); -- Radiant Lightbringer Armor (Timewarped)
    T(a[11760], t[1327]); -- Wildstalker Armor (Raid Finder)
    T(a[11760], t[1325]); -- Wildstalker Armor (Normal)
    T(a[11760], t[1328]); -- Wildstalker Armor (Heroic)
    T(a[11760], t[1326]); -- Wildstalker Armor (Mythic)
    T(a[11760], t[2297]); -- Wildstalker Armor (Timewarped)
    T(a[11760], t[1306]); -- Fanged Slayer's Armor (Raid Finder)
    T(a[11760], t[1305]); -- Fanged Slayer's Armor (Normal)
    T(a[11760], t[1307]); -- Fanged Slayer's Armor (Heroic)
    T(a[11760], t[1308]); -- Fanged Slayer's Armor (Mythic)
    T(a[11760], t[2302]); -- Fanged Slayer's Armor (Timewarped)
    T(a[11760], t[1342]); -- Vestments of Blind Absolution (Raid Finder)
    T(a[11760], t[1309]); -- Vestments of Blind Absolution (Normal)
    T(a[11760], t[1312]); -- Vestments of Blind Absolution (Heroic)
    T(a[11760], t[1310]); -- Vestments of Blind Absolution (Mythic)
    T(a[11760], t[2301]); -- Vestments of Blind Absolution (Timewarped)
    T(a[11760], t[1339]); -- Gravewarden Armaments (Raid Finder)
    T(a[11760], t[1337]); -- Gravewarden Armaments (Normal)
    T(a[11760], t[1340]); -- Gravewarden Armaments (Heroic)
    T(a[11760], t[1338]); -- Gravewarden Armaments (Mythic)
    T(a[11760], t[2294]); -- Gravewarden Armaments (Timewarped)
    T(a[11760], t[1302]); -- Regalia of the Skybreaker (Raid Finder)
    T(a[11760], t[1301]); -- Regalia of the Skybreaker (Normal)
    T(a[11760], t[1303]); -- Regalia of the Skybreaker (Heroic)
    T(a[11760], t[1304]); -- Regalia of the Skybreaker (Mythic)
    T(a[11760], t[2303]); -- Regalia of the Skybreaker (Timewarped)
    T(a[11760], t[1323]); -- Regalia of the Arcane Tempest (Raid Finder)
    T(a[11760], t[1321]); -- Regalia of the Arcane Tempest (Normal)
    T(a[11760], t[1324]); -- Regalia of the Arcane Tempest (Heroic)
    T(a[11760], t[1322]); -- Regalia of the Arcane Tempest (Mythic)
    T(a[11760], t[2298]); -- Regalia of the Arcane Tempest (Timewarped)
    T(a[11760], t[1300]); -- Diabolic Raiment (Raid Finder)
    T(a[11760], t[1297]); -- Diabolic Raiment (Normal)
    T(a[11760], t[1298]); -- Diabolic Raiment (Heroic)
    T(a[11760], t[1299]); -- Diabolic Raiment (Mythic)
    T(a[11760], t[2304]); -- Diabolic Raiment (Timewarped)
    T(a[11760], t[1319]); -- Xuen's Battlegear (Raid Finder)
    T(a[11760], t[1317]); -- Xuen's Battlegear (Normal)
    T(a[11760], t[1320]); -- Xuen's Battlegear (Heroic)
    T(a[11760], t[1318]); -- Xuen's Battlegear (Mythic)
    T(a[11760], t[2299]); -- Xuen's Battlegear (Timewarped)
    T(a[11760], t[1331]); -- Stormheart Raiment (Raid Finder)
    T(a[11760], t[1329]); -- Stormheart Raiment (Normal)
    T(a[11760], t[1332]); -- Stormheart Raiment (Heroic)
    T(a[11760], t[1330]); -- Stormheart Raiment (Mythic)
    T(a[11760], t[2296]); -- Stormheart Raiment (Timewarped)
    T(a[11760], t[1335]); -- Demonbane Armor (Raid Finder)
    T(a[11760], t[1333]); -- Demonbane Armor (Normal)
    T(a[11760], t[1336]); -- Demonbane Armor (Heroic)
    T(a[11760], t[1334]); -- Demonbane Armor (Mythic)
    T(a[11760], t[2295]); -- Demonbane Armor (Timewarped)
    a[11761] = b:New(11761, 20); -- Azeroth's Next Top Model
    a[11762] = b:New(11762, 10); -- Can I Get A Helya
    T(a[11762], t[186]); -- Funerary Plate of the Chosen Dead (Raid Finder)
    T(a[11762], t[183]); -- Funerary Plate of the Chosen Dead (Normal)
    T(a[11762], t[184]); -- Funerary Plate of the Chosen Dead (Heroic)
    T(a[11762], t[185]); -- Funerary Plate of the Chosen Dead (Mythic)
    T(a[11762], t[182]); -- Chains of the Chosen Dead (Raid Finder)
    T(a[11762], t[179]); -- Chains of the Chosen Dead (Normal)
    T(a[11762], t[180]); -- Chains of the Chosen Dead (Heroic)
    T(a[11762], t[181]); -- Chains of the Chosen Dead (Mythic)
    T(a[11762], t[174]); -- Regalia of the Chosen Dead (Raid Finder)
    T(a[11762], t[171]); -- Regalia of the Chosen Dead (Normal)
    T(a[11762], t[172]); -- Regalia of the Chosen Dead (Heroic)
    T(a[11762], t[173]); -- Regalia of the Chosen Dead (Mythic)
    T(a[11762], t[178]); -- Garb of the Chosen Dead (Raid Finder)
    T(a[11762], t[175]); -- Garb of the Chosen Dead (Normal)
    T(a[11762], t[176]); -- Garb of the Chosen Dead (Heroic)
    T(a[11762], t[177]); -- Garb of the Chosen Dead (Mythic)
    a[11763] = b:New(11763, 25); -- Glory of the Tomb Raider
    a[11765] = b:New(11765, 5); -- Pet Battle Challenge: Wailing Caverns
    a[11767] = b:New(11767, 10); -- Mythic: Goroth
    a[11768] = b:New(11768, 10); -- Boom Bloom
    a[11769] = b:New(11769, 10); -- A Steamy Romance Saga
    a[11770] = b:New(11770, 10); -- Dark Souls
    a[11772] = b:New(11772, 0); -- Power Ascended
    O(a[11772], "From", "Version", "070003", "Before", "Version", "080001");
    a[11773] = b:New(11773, 10); -- "Wax On, Wax Off"
    a[11774] = b:New(11774, 10); -- Mythic: Demonic Inquisition
    a[11775] = b:New(11775, 10); -- Mythic: Harjatan
    a[11776] = b:New(11776, 10); -- Mythic: Mistress Sassz'ine
    a[11777] = b:New(11777, 10); -- Mythic: Sisters of the Moon
    a[11778] = b:New(11778, 10); -- Mythic: The Desolate Host
    a[11779] = b:New(11779, 10); -- Mythic: Maiden of Vigilance
    a[11780] = b:New(11780, 10); -- Mythic: Fallen Avatar
    a[11781] = b:New(11781, 10); -- Mythic: Kil'jaeden
    a[11786] = b:New(11786, 10); -- Terrors of the Shore
    a[11787] = b:New(11787, 10); -- The Gates of Hell
    a[11788] = b:New(11788, 10); -- Wailing Halls
    a[11789] = b:New(11789, 10); -- Chamber of the Avatar
    a[11790] = b:New(11790, 10); -- Deceiver's Fall
    a[11796] = b:New(11796, 5); -- Armies of Legionfall
    a[11802] = b:New(11802, 10); -- Bringing Home the Beacon
    a[11841] = b:New(11841, 10); -- Naxt Victim
    a[11846] = b:New(11846, 10); -- Champions of Legionfall
    a[11848] = b:New(11848, 0); -- WoW's 13th Anniversary
    O(a[11848]);
    a[11856] = b:New(11856, 5); -- Pet Battle Challenge: Deadmines
    a[11861] = b:New(11861, 10, fac.Horde, 12473); -- The Throne of Zuldazar
    a[11868] = b:New(11868, 10, fac.Horde, 12497); -- The Dark Heart of Nazmir
    a[11869] = b:New(11869, 0); -- I'll Hold These For You Until You Get Out
    a[11874] = b:New(11874, 0); -- Ahead of the Curve: Kil'jaeden
    O(a[11874], "From", "Version", "070205", "Before", "Version", "070300");
    a[11875] = b:New(11875, 0); -- Cutting Edge: Kil'jaeden
    O(a[11875], "From", "Version", "070205", "Before", "Version", "070300");
    a[11913] = b:New(11913, 0); -- Don't Play With That In The House
    a[11915] = b:New(11915, 10); -- Don't Sweat the Technique
    a[11918] = b:New(11918, 5); -- "Hey, You're a Rockstar!"
    a[11919] = b:New(11919, 10); -- Taking this Show on the Road
    a[11920] = b:New(11920, 10); -- Perfect Performance
    a[11921] = b:New(11921, 5); -- Mosh Pit
    a[11928] = b:New(11928, 10); -- Portal Combat
    a[11929] = b:New(11929, 10); -- Heroic: Return to Karazhan
    a[11930] = b:New(11930, 10); -- Worm-monger
    a[11931] = b:New(11931, 0); -- Rides of War
    a[11941] = b:New(11941, 10); -- Chromie Homie
    a[11948] = b:New(11948, 10); -- Together We Stand
    a[11949] = b:New(11949, 10); -- Hard to Kill
    a[11987] = b:New(11987, 25); -- Glory of the Argus Raider
    a[11988] = b:New(11988, 10); -- Light's Breach
    a[11989] = b:New(11989, 10); -- Forbidden Descent
    a[11990] = b:New(11990, 10); -- Hope's End
    a[11991] = b:New(11991, 10); -- Seat of the Pantheon
    a[11992] = b:New(11992, 10); -- Mythic: Garothi Worldbreaker
    a[11993] = b:New(11993, 10); -- Mythic: Hounds of Sargeras
    a[11994] = b:New(11994, 10); -- Mythic: Antoran High Command
    a[11995] = b:New(11995, 10); -- Mythic: Portal Keeper Hasabel
    a[11996] = b:New(11996, 10); -- Mythic: Eonar
    a[11997] = b:New(11997, 10); -- Mythic: Imonar the Soulhunter
    a[11998] = b:New(11998, 10); -- Mythic: Kin'garoth
    a[11999] = b:New(11999, 10); -- Mythic: Varimathras
    a[12000] = b:New(12000, 10); -- Mythic: The Coven of Shivarra
    a[12001] = b:New(12001, 10); -- Mythic: Aggramar
    a[12002] = b:New(12002, 10); -- Mythic: Argus the Unmaker
    a[12004] = b:New(12004, 10); -- Welcome the Void
    a[12005] = b:New(12005, 10); -- Let it All Out
    a[12007] = b:New(12007, 10); -- Heroic: Seat of the Triumvirate
    a[12008] = b:New(12008, 10); -- Mythic: Seat of the Triumvirate
    a[12009] = b:New(12009, 10); -- Darker Side
    a[12010] = b:New(12010, 0); -- Fierce Gladiator: Legion Season 5
    O(a[12010], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12020] = b:New(12020, 10); -- Argussy Up
    T(a[12020], t[1519]); -- Juggernaut Battlegear (Raid Finder)
    T(a[12020], t[1516]); -- Juggernaut Battlegear (Normal)
    T(a[12020], t[1517]); -- Juggernaut Battlegear (Heroic)
    T(a[12020], t[1518]); -- Juggernaut Battlegear (Mythic)
    T(a[12020], t[1499]); -- Light's Vanguard Battleplate (Raid Finder)
    T(a[12020], t[1496]); -- Light's Vanguard Battleplate (Normal)
    T(a[12020], t[1497]); -- Light's Vanguard Battleplate (Heroic)
    T(a[12020], t[1498]); -- Light's Vanguard Battleplate (Mythic)
    T(a[12020], t[1487]); -- Serpentstalker Guise (Raid Finder)
    T(a[12020], t[1484]); -- Serpentstalker Guise (Normal)
    T(a[12020], t[1485]); -- Serpentstalker Guise (Heroic)
    T(a[12020], t[1486]); -- Serpentstalker Guise (Mythic)
    T(a[12020], t[1507]); -- Regalia of the Dashing Scoundrel (Raid Finder)
    T(a[12020], t[1504]); -- Regalia of the Dashing Scoundrel (Normal)
    T(a[12020], t[1505]); -- Regalia of the Dashing Scoundrel (Heroic)
    T(a[12020], t[1506]); -- Regalia of the Dashing Scoundrel (Mythic)
    T(a[12020], t[1503]); -- Gilded Seraph's Raiment (Raid Finder)
    T(a[12020], t[1500]); -- Gilded Seraph's Raiment (Normal)
    T(a[12020], t[1501]); -- Gilded Seraph's Raiment (Heroic)
    T(a[12020], t[1502]); -- Gilded Seraph's Raiment (Mythic)
    T(a[12020], t[1475]); -- Dreadwake Armor (Raid Finder)
    T(a[12020], t[1472]); -- Dreadwake Armor (Normal)
    T(a[12020], t[1473]); -- Dreadwake Armor (Heroic)
    T(a[12020], t[1474]); -- Dreadwake Armor (Mythic)
    T(a[12020], t[1511]); -- Garb of Venerated Spirits (Raid Finder)
    T(a[12020], t[1508]); -- Garb of Venerated Spirits (Normal)
    T(a[12020], t[1509]); -- Garb of Venerated Spirits (Heroic)
    T(a[12020], t[1510]); -- Garb of Venerated Spirits (Mythic)
    T(a[12020], t[1491]); -- Runebound Regalia (Raid Finder)
    T(a[12020], t[1488]); -- Runebound Regalia (Normal)
    T(a[12020], t[1489]); -- Runebound Regalia (Heroic)
    T(a[12020], t[1490]); -- Runebound Regalia (Mythic)
    T(a[12020], t[1515]); -- Grim Inquisitor's Regalia (Raid Finder)
    T(a[12020], t[1512]); -- Grim Inquisitor's Regalia (Normal)
    T(a[12020], t[1513]); -- Grim Inquisitor's Regalia (Heroic)
    T(a[12020], t[1514]); -- Grim Inquisitor's Regalia (Mythic)
    T(a[12020], t[1495]); -- Chi-Ji's Battlegear (Raid Finder)
    T(a[12020], t[1492]); -- Chi-Ji's Battlegear (Normal)
    T(a[12020], t[1493]); -- Chi-Ji's Battlegear (Heroic)
    T(a[12020], t[1494]); -- Chi-Ji's Battlegear (Mythic)
    T(a[12020], t[1483]); -- Bearmantle Battlegear (Raid Finder)
    T(a[12020], t[1480]); -- Bearmantle Battlegear (Normal)
    T(a[12020], t[1481]); -- Bearmantle Battlegear (Heroic)
    T(a[12020], t[1482]); -- Bearmantle Battlegear (Mythic)
    T(a[12020], t[1479]); -- Felreaper Vestments (Raid Finder)
    T(a[12020], t[1476]); -- Felreaper Vestments (Normal)
    T(a[12020], t[1477]); -- Felreaper Vestments (Heroic)
    T(a[12020], t[1478]); -- Felreaper Vestments (Mythic)
    a[12021] = b:New(12021, 10); -- Claws Out
    T(a[12021], t[1378]); -- Fierce Combatant's Plate Armor (Combatant I)
    T(a[12021], t[1422]); -- Fierce Gladiator's Plate Armor (Gladiator)
    T(a[12021], t[1399]); -- Fierce Gladiator's Plate Armor (Elite)
    T(a[12021], t[1368]); -- Fierce Combatant's Scaled Armor (Combatant I)
    T(a[12021], t[1412]); -- Fierce Gladiator's Scaled Armor (Gladiator)
    T(a[12021], t[1388]); -- Fierce Gladiator's Scaled Armor (Elite)
    T(a[12021], t[1362]); -- Fierce Combatant's Chain Armor (Combatant I)
    T(a[12021], t[1406]); -- Fierce Gladiator's Chain Armor (Gladiator)
    T(a[12021], t[1382]); -- Fierce Gladiator's Chain Armor (Elite)
    T(a[12021], t[1372]); -- Fierce Combatant's Leather Armor (Combatant I)
    T(a[12021], t[1416]); -- Fierce Gladiator's Leather Armor (Gladiator)
    T(a[12021], t[1392]); -- Fierce Gladiator's Leather Armor (Elite)
    T(a[12021], t[1370]); -- Fierce Combatant's Satin Armor (Combatant I)
    T(a[12021], t[1414]); -- Fierce Gladiator's Satin Armor (Gladiator)
    T(a[12021], t[1390]); -- Fierce Gladiator's Satin Armor (Elite)
    T(a[12021], t[1348]); -- Fierce Combatant's Dreadplate Armor (Combatant I)
    T(a[12021], t[1400]); -- Fierce Gladiator's Dreadplate Armor (Gladiator)
    T(a[12021], t[1352]); -- Fierce Gladiator's Dreadplate Armor (Elite)
    T(a[12021], t[1374]); -- Fierce Combatant's Ringmail Armor (Combatant I)
    T(a[12021], t[1418]); -- Fierce Gladiator's Ringmail Armor (Gladiator)
    T(a[12021], t[1394]); -- Fierce Gladiator's Ringmail Armor (Elite)
    T(a[12021], t[1364]); -- Fierce Combatant's Silk Armor (Combatant I)
    T(a[12021], t[1408]); -- Fierce Gladiator's Silk Armor (Gladiator)
    T(a[12021], t[1384]); -- Fierce Gladiator's Silk Armor (Elite)
    T(a[12021], t[1376]); -- Fierce Combatant's Felweave Armor (Combatant I)
    T(a[12021], t[1420]); -- Fierce Gladiator's Felweave Armor (Gladiator)
    T(a[12021], t[1396]); -- Fierce Gladiator's Felweave Armor (Elite)
    T(a[12021], t[1366]); -- Fierce Combatant's Ironskin Armor (Combatant I)
    T(a[12021], t[1410]); -- Fierce Gladiator's Ironskin Armor (Gladiator)
    T(a[12021], t[1386]); -- Fierce Gladiator's Ironskin Armor (Elite)
    T(a[12021], t[1360]); -- Fierce Combatant's Dragonhide Armor (Combatant I)
    T(a[12021], t[1404]); -- Fierce Gladiator's Dragonhide Armor (Gladiator)
    T(a[12021], t[1380]); -- Fierce Gladiator's Dragonhide Armor (Elite)
    T(a[12021], t[1354]); -- Fierce Combatant's Felskin Armor (Combatant I)
    T(a[12021], t[1402]); -- Fierce Gladiator's Felskin Armor (Gladiator)
    T(a[12021], t[1358]); -- Fierce Gladiator's Felskin Armor (Elite)
    T(a[12021], t[1379]); -- Fierce Combatant's Plate Armor (Combatant I)
    T(a[12021], t[1423]); -- Fierce Gladiator's Plate Armor (Gladiator)
    T(a[12021], t[1398]); -- Fierce Gladiator's Plate Armor (Elite)
    T(a[12021], t[1369]); -- Fierce Combatant's Scaled Armor (Combatant I)
    T(a[12021], t[1413]); -- Fierce Gladiator's Scaled Armor (Gladiator)
    T(a[12021], t[1389]); -- Fierce Gladiator's Scaled Armor (Elite)
    T(a[12021], t[1363]); -- Fierce Combatant's Chain Armor (Combatant I)
    T(a[12021], t[1407]); -- Fierce Gladiator's Chain Armor (Gladiator)
    T(a[12021], t[1383]); -- Fierce Gladiator's Chain Armor (Elite)
    T(a[12021], t[1373]); -- Fierce Combatant's Leather Armor (Combatant I)
    T(a[12021], t[1417]); -- Fierce Gladiator's Leather Armor (Gladiator)
    T(a[12021], t[1393]); -- Fierce Gladiator's Leather Armor (Elite)
    T(a[12021], t[1371]); -- Fierce Combatant's Satin Armor (Combatant I)
    T(a[12021], t[1415]); -- Fierce Gladiator's Satin Armor (Gladiator)
    T(a[12021], t[1391]); -- Fierce Gladiator's Satin Armor (Elite)
    T(a[12021], t[1349]); -- Fierce Combatant's Dreadplate Armor (Combatant I)
    T(a[12021], t[1401]); -- Fierce Gladiator's Dreadplate Armor (Gladiator)
    T(a[12021], t[1353]); -- Fierce Gladiator's Dreadplate Armor (Elite)
    T(a[12021], t[1375]); -- Fierce Combatant's Ringmail Armor (Combatant I)
    T(a[12021], t[1419]); -- Fierce Gladiator's Ringmail Armor (Gladiator)
    T(a[12021], t[1395]); -- Fierce Gladiator's Ringmail Armor (Elite)
    T(a[12021], t[1365]); -- Fierce Combatant's Silk Armor (Combatant I)
    T(a[12021], t[1409]); -- Fierce Gladiator's Silk Armor (Gladiator)
    T(a[12021], t[1385]); -- Fierce Gladiator's Silk Armor (Elite)
    T(a[12021], t[1377]); -- Fierce Combatant's Felweave Armor (Combatant I)
    T(a[12021], t[1421]); -- Fierce Gladiator's Felweave Armor (Gladiator)
    T(a[12021], t[1397]); -- Fierce Gladiator's Felweave Armor (Elite)
    T(a[12021], t[1367]); -- Fierce Combatant's Ironskin Armor (Combatant I)
    T(a[12021], t[1411]); -- Fierce Gladiator's Ironskin Armor (Gladiator)
    T(a[12021], t[1387]); -- Fierce Gladiator's Ironskin Armor (Elite)
    T(a[12021], t[1361]); -- Fierce Combatant's Dragonhide Armor (Combatant I)
    T(a[12021], t[1405]); -- Fierce Gladiator's Dragonhide Armor (Gladiator)
    T(a[12021], t[1381]); -- Fierce Gladiator's Dragonhide Armor (Elite)
    T(a[12021], t[1355]); -- Fierce Combatant's Felskin Armor (Combatant I)
    T(a[12021], t[1403]); -- Fierce Gladiator's Felskin Armor (Gladiator)
    T(a[12021], t[1359]); -- Fierce Gladiator's Felskin Armor (Elite)
    a[12026] = b:New(12026, 10); -- Invasion Obliteration
    a[12028] = b:New(12028, 10); -- Envision Invasion Eradication
    a[12030] = b:New(12030, 10); -- The World Revolves Around Me
    a[12031] = b:New(12031, 0, fac.Horde, 12032); -- Fierce Combatant
    O(a[12031], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12032] = b:New(12032, 0, fac.Alliance, 12031); -- Fierce Combatant
    O(a[12032], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12034] = b:New(12034, 0); -- Duelist: Legion Season 5
    O(a[12034], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12035] = b:New(12035, 0); -- Rival: Legion Season 5
    O(a[12035], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12036] = b:New(12036, 0); -- Challenger: Legion Season 5
    O(a[12036], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12037] = b:New(12037, 0, fac.Alliance, 12041); -- Hero of the Alliance: Fierce
    O(a[12037], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12038] = b:New(12038, 0, fac.Alliance, 12042); -- Guardian of the Alliance: Legion Season 5
    O(a[12038], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12039] = b:New(12039, 0, fac.Alliance, 12043); -- Defender of the Alliance: Legion Season 5
    O(a[12039], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12040] = b:New(12040, 0, fac.Alliance, 12044); -- Soldier of the Alliance: Legion Season 5
    O(a[12040], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12041] = b:New(12041, 0, fac.Horde, 12037); -- Hero of the Horde: Fierce
    O(a[12041], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12042] = b:New(12042, 0, fac.Horde, 12038); -- Guardian of the Horde: Legion Season 5
    O(a[12042], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12043] = b:New(12043, 0, fac.Horde, 12039); -- Defender of the Horde: Legion Season 5
    O(a[12043], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12044] = b:New(12044, 0, fac.Horde, 12040); -- Soldier of the Horde: Legion Season 5
    O(a[12044], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12045] = b:New(12045, 0); -- Gladiator: Legion Season 5
    O(a[12045], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12046] = b:New(12046, 10); -- Remember the Titans
    a[12065] = b:New(12065, 10); -- Hounds Good To Me
    a[12066] = b:New(12066, 10); -- You Are Now Prepared!
    a[12067] = b:New(12067, 10); -- Spheres of Influence
    a[12069] = b:New(12069, 10); -- Explore Argus
    a[12071] = b:New(12071, 0); -- Crucible's Promise
    O(a[12071], "From", "Version", "070003", "Before", "Version", "080001");
    a[12072] = b:New(12072, 0); -- Now You're Cooking with Netherlight
    O(a[12072], "From", "Version", "070003", "Before", "Version", "080001");
    a[12073] = b:New(12073, 5); -- Locked and Loaded
    a[12074] = b:New(12074, 10); -- "Shoot First, Loot Later"
    a[12076] = b:New(12076, 10); -- Protector of the Argussian Reach
    a[12077] = b:New(12077, 10); -- Adventurer of Argus
    a[12078] = b:New(12078, 10); -- Commander of Argus
    a[12079] = b:New(12079, 10); -- Raiding with Leashes V: Cuteaclysm
    a[12081] = b:New(12081, 10); -- Officer of the Light
    a[12083] = b:New(12083, 25); -- Paragon of Argus
    a[12084] = b:New(12084, 5); -- Infused and Abused
    a[12087] = b:New(12087, 5, fac.Alliance); -- The Reining Champion
    a[12088] = b:New(12088, 10); -- Anomalous Animals of Argus
    a[12089] = b:New(12089, 5); -- Aquatic Assault
    a[12090] = b:New(12090, 0); -- Fierce Elite
    O(a[12090], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[12091] = b:New(12091, 5); -- Beast Blitz
    a[12092] = b:New(12092, 5); -- Critical Critters
    a[12093] = b:New(12093, 5); -- Draconic Destruction
    a[12094] = b:New(12094, 5); -- Elemental Escalation
    a[12095] = b:New(12095, 5); -- Fierce Fliers
    a[12096] = b:New(12096, 5); -- Humanoid Havoc
    a[12097] = b:New(12097, 5); -- Magical Mayhem
    a[12098] = b:New(12098, 5); -- Mechanical Melee
    a[12099] = b:New(12099, 5); -- Unstoppable Undead
    a[12100] = b:New(12100, 10); -- Family Fighter
    a[12101] = b:New(12101, 10); -- We Came Here For Two Reasons
    a[12102] = b:New(12102, 10); -- To Kill Demons...
    a[12103] = b:New(12103, 10); -- ...And Chew Mana Buns
    a[12104] = b:New(12104, 10); -- And We're All Out of Mana Buns
    a[12108] = b:New(12108, 0); -- Double Decade of Dominance
    O(a[12108], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[12109] = b:New(12109, 0); -- Twenty-One Arms Salute
    O(a[12109], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[12110] = b:New(12110, 0); -- Ahead of the Curve: Argus the Unmaker
    O(a[12110], "From", "Version", "070300", "Before", "Version", "080001");
    a[12111] = b:New(12111, 0); -- Cutting Edge: Argus the Unmaker
    O(a[12111], "From", "Version", "070300", "Before", "Version", "080001");
    a[12129] = b:New(12129, 10); -- This is the War Room!
    a[12134] = b:New(12134, 0); -- Dominant Gladiator: Legion Season 6
    O(a[12134], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12135] = b:New(12135, 0); -- Dominant Elite
    O(a[12135], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12136] = b:New(12136, 0, fac.Horde, 12137); -- Dominant Combatant
    O(a[12136], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12137] = b:New(12137, 0, fac.Alliance, 12136); -- Dominant Combatant
    O(a[12137], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12139] = b:New(12139, 0); -- Dominant Gladiator's Storm Dragon
    O(a[12139], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12140] = b:New(12140, 0); -- Demonic Gladiator's Storm Dragon
    O(a[12140], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12167] = b:New(12167, 0); -- Gladiator: Legion Season 6
    O(a[12167], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12168] = b:New(12168, 0); -- Gladiator: Legion Season 7
    O(a[12168], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12169] = b:New(12169, 0); -- Challenger: Legion Season 6
    O(a[12169], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12170] = b:New(12170, 0); -- Rival: Legion Season 6
    O(a[12170], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12171] = b:New(12171, 0); -- Duelist: Legion Season 6
    O(a[12171], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12172] = b:New(12172, 0, fac.Horde, 12173); -- Hero of the Horde: Dominant
    O(a[12172], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12173] = b:New(12173, 0, fac.Alliance, 12172); -- Hero of the Alliance: Dominant
    O(a[12173], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12174] = b:New(12174, 0, fac.Horde, 12175); -- Defender of the Horde: Legion Season 6
    O(a[12174], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12175] = b:New(12175, 0, fac.Alliance, 12174); -- Defender of the Alliance: Legion Season 6
    O(a[12175], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12176] = b:New(12176, 0, fac.Horde, 12177); -- Guardian of the Horde: Legion Season 6
    O(a[12176], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12177] = b:New(12177, 0, fac.Alliance, 12176); -- Guardian of the Alliance: Legion Season 6
    O(a[12177], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12178] = b:New(12178, 0, fac.Horde, 12179); -- Soldier of the Horde: Legion Season 6
    O(a[12178], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12179] = b:New(12179, 0, fac.Alliance, 12178); -- Soldier of the Alliance: Legion Season 6
    O(a[12179], "From", "PvP Season", 24, "Until", "PvP Season", 24);
    a[12180] = b:New(12180, 0); -- Catching Twenty-Two
    O(a[12180], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[12181] = b:New(12181, 0); -- Protocol 2.3
    O(a[12181], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[12182] = b:New(12182, 0); -- Demonic Double Dozen
    O(a[12182], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[12183] = b:New(12183, 0); -- Prestige Quartermaster
    O(a[12183], "From", "PvP Season", 19, "Until", "PvP Season", 25);
    a[12185] = b:New(12185, 0); -- Demonic Gladiator: Legion Season 7
    O(a[12185], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12186] = b:New(12186, 0); -- Duelist: Legion Season 7
    O(a[12186], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12187] = b:New(12187, 0); -- Challenger: Legion Season 7
    O(a[12187], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12188] = b:New(12188, 0); -- Rival: Legion Season 7
    O(a[12188], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12189] = b:New(12189, 0, fac.Alliance, 12190); -- Soldier of the Alliance: Legion Season 7
    O(a[12189], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12190] = b:New(12190, 0, fac.Horde, 12189); -- Soldier of the Horde: Legion Season 7
    O(a[12190], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12191] = b:New(12191, 0, fac.Alliance, 12192); -- Guardian of the Alliance: Legion Season 7
    O(a[12191], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12192] = b:New(12192, 0, fac.Horde, 12191); -- Guardian of the Horde: Legion Season 7
    O(a[12192], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12194] = b:New(12194, 0, fac.Horde, 12195); -- Defender of the Horde: Legion Season 7
    O(a[12194], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12195] = b:New(12195, 0, fac.Alliance, 12194); -- Defender of the Alliance: Legion Season 7
    O(a[12195], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12196] = b:New(12196, 0, fac.Horde, 12197); -- Hero of the Horde: Demonic
    O(a[12196], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12197] = b:New(12197, 0, fac.Alliance, 12196); -- Hero of the Alliance: Demonic
    O(a[12197], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12198] = b:New(12198, 0); -- Demonic Elite
    O(a[12198], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12199] = b:New(12199, 0, fac.Horde, 12200); -- Demonic Combatant
    O(a[12199], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12200] = b:New(12200, 0, fac.Alliance, 12199); -- Demonic Combatant
    O(a[12200], "From", "PvP Season", 25, "Until", "PvP Season", 25);
    a[12229] = b:New(12229, 0, fac.Alliance, 12230); -- Collector's Edition: Seabraid Stallion
    a[12230] = b:New(12230, 0, fac.Horde, 12229); -- Collector's Edition: Gilded Ravasaur
    a[12232] = b:New(12232, 0); -- Collector's Edition: Tottle
    a[12242] = b:New(12242, 10, fac.Alliance); -- Allied Races: Void Elf
    a[12243] = b:New(12243, 10, fac.Alliance); -- Allied Races: Lightforged Draenei
    a[12244] = b:New(12244, 10, fac.Horde); -- Allied Races: Nightborne
    a[12245] = b:New(12245, 10, fac.Horde); -- Allied Races: Highmountain Tauren
    a[12257] = b:New(12257, 10); -- Stardust Crusaders
    a[12270] = b:New(12270, 10); -- Bringing Hexy Back
    a[12272] = b:New(12272, 10); -- Gold Fever
    a[12273] = b:New(12273, 10); -- It's Lit!
    a[12279] = b:New(12279, 5); -- Mechanical Brawler
    a[12280] = b:New(12280, 5); -- Aquatic Brawler
    a[12281] = b:New(12281, 5); -- Beast Brawler
    a[12282] = b:New(12282, 5); -- Elemental Brawler
    a[12283] = b:New(12283, 5); -- Magic Brawler
    a[12284] = b:New(12284, 5); -- Critter Brawler
    a[12285] = b:New(12285, 5); -- Undead Brawler
    a[12286] = b:New(12286, 5); -- Flying Brawler
    a[12287] = b:New(12287, 5); -- Dragonkin Brawler
    a[12289] = b:New(12289, 5); -- Humanoid Brawler
    a[12290] = b:New(12290, 10); -- Family Brawler
    a[12291] = b:New(12291, 10, fac.Alliance); -- Heritage of the Void
    a[12292] = b:New(12292, 5); -- Highmountain Tribe
    a[12297] = b:New(12297, 10); -- The Siege of Ulduar
    a[12302] = b:New(12302, 10); -- The Antechamber of Ulduar
    a[12309] = b:New(12309, 10); -- The Keepers of Ulduar
    a[12310] = b:New(12310, 10); -- The Descent into Madness
    a[12311] = b:New(12311, 25); -- The Secrets of Ulduar
    a[12312] = b:New(12312, 10); -- Dwarfageddon
    a[12313] = b:New(12313, 10); -- Unbroken
    a[12314] = b:New(12314, 10); -- Three Car Garage
    a[12315] = b:New(12315, 10); -- Take Out Those Turrets
    a[12316] = b:New(12316, 10); -- Shutout
    a[12317] = b:New(12317, 10); -- Orbital Bombardment
    a[12318] = b:New(12318, 10); -- Orbital Devastation
    a[12319] = b:New(12319, 10); -- Nuked from Orbit
    a[12320] = b:New(12320, 10); -- Orbit-uary
    a[12321] = b:New(12321, 10); -- A Quick Shave
    a[12322] = b:New(12322, 10); -- "Iron Dwarf, Medium Rare"
    a[12323] = b:New(12323, 10); -- Shattered
    a[12324] = b:New(12324, 10); -- Hot Pocket
    a[12325] = b:New(12325, 10); -- Stokin' the Furnace
    a[12326] = b:New(12326, 10); -- Nerf Engineering
    a[12327] = b:New(12327, 10); -- Nerf Scrapbots
    a[12328] = b:New(12328, 10); -- Nerf Gravity Bombs
    a[12329] = b:New(12329, 10); -- Must Deconstruct Faster
    a[12330] = b:New(12330, 10); -- Heartbreaker
    a[12332] = b:New(12332, 10); -- "I Choose You, Runemaster Molgeim"
    a[12333] = b:New(12333, 10); -- "I Choose You, Stormcaller Brundir"
    a[12334] = b:New(12334, 10); -- "I Choose You, Steelbreaker"
    a[12335] = b:New(12335, 10); -- But I'm On Your Side
    a[12336] = b:New(12336, 10); -- Can't Do That While Stunned
    a[12337] = b:New(12337, 10); -- With Open Arms
    a[12338] = b:New(12338, 10); -- Disarmed
    a[12339] = b:New(12339, 10); -- If Looks Could Kill
    a[12340] = b:New(12340, 10); -- Rubble and Roll
    a[12341] = b:New(12341, 10); -- Crazy Cat Lady
    a[12342] = b:New(12342, 10); -- Nine Lives
    a[12343] = b:New(12343, 10); -- Cheese the Freeze
    a[12344] = b:New(12344, 10); -- I Have the Coolest Friends
    a[12345] = b:New(12345, 10); -- Getting Cold in Here
    a[12346] = b:New(12346, 10); -- Staying Buffed All Winter
    a[12347] = b:New(12347, 10); -- I Could Say That This Cache Was Rare
    a[12348] = b:New(12348, 10); -- Don't Stand in the Lightning
    a[12349] = b:New(12349, 10); -- I'll Take You All On
    a[12350] = b:New(12350, 10); -- Who Needs Bloodlust?
    a[12351] = b:New(12351, 10); -- Siffed
    a[12352] = b:New(12352, 10); -- Lose Your Illusion
    a[12360] = b:New(12360, 10); -- Lumberjacked
    a[12361] = b:New(12361, 10); -- Con-speed-atory
    a[12362] = b:New(12362, 10); -- Deforestation
    a[12363] = b:New(12363, 10); -- Getting Back to Nature
    a[12364] = b:New(12364, 10); -- Knock on Wood
    a[12365] = b:New(12365, 10); -- "Knock, Knock on Wood"
    a[12366] = b:New(12366, 10); -- "Knock, Knock, Knock on Wood"
    a[12367] = b:New(12367, 10); -- Set Up Us the Bomb
    a[12368] = b:New(12368, 10); -- Not-So-Friendly Fire
    a[12369] = b:New(12369, 10); -- Firefighter
    a[12372] = b:New(12372, 10); -- Shadowdodger
    a[12373] = b:New(12373, 10); -- I Love the Smell of Saronite in the Morning
    a[12384] = b:New(12384, 10); -- Kiss and Make Up
    a[12385] = b:New(12385, 10); -- Three Lights in the Darkness
    a[12386] = b:New(12386, 10); -- Two Lights in the Darkness
    a[12387] = b:New(12387, 10); -- One Light in the Darkness
    a[12388] = b:New(12388, 10); -- Alone in the Darkness
    a[12395] = b:New(12395, 10); -- Drive Me Crazy
    a[12396] = b:New(12396, 10); -- He's Not Getting Any Older
    a[12397] = b:New(12397, 10); -- They're Coming Out of the Walls
    a[12398] = b:New(12398, 10); -- In His House He Waits Dreaming
    a[12399] = b:New(12399, 10); -- Observed
    a[12400] = b:New(12400, 10); -- Supermassive
    a[12401] = b:New(12401, 25); -- Glory of the Ulduar Raider
    a[12404] = b:New(12404, 10); -- Claim Jumper
    a[12405] = b:New(12405, 10); -- Death from Above
    a[12406] = b:New(12406, 20); -- A Good Start
    a[12407] = b:New(12407, 20); -- Seething Shore Perfection
    a[12408] = b:New(12408, 20); -- Seething Shore Domination
    a[12409] = b:New(12409, 10); -- Seething Shore Victory
    a[12410] = b:New(12410, 15); -- Seething Shore Veteran
    a[12411] = b:New(12411, 10); -- Blood and Sand
    a[12412] = b:New(12412, 25); -- Master of Seething Shore
    a[12413] = b:New(12413, 10, fac.Horde); -- Heritage of the Nightborne
    a[12414] = b:New(12414, 10, fac.Alliance); -- Heritage of the Lightforged
    a[12415] = b:New(12415, 10, fac.Horde); -- Heritage of Highmountain
    a[12416] = b:New(12416, 5); -- The Total Package
    a[12429] = b:New(12429, 10, fac.Alliance); -- Wetlands Quests
    a[12430] = b:New(12430, 10, fac.Alliance); -- Duskwood Quests
    a[12431] = b:New(12431, 5); -- Post Haste
    a[12439] = b:New(12439, 5); -- Priority Mail
    a[12454] = b:New(12454, 0); -- Salute to StarCraft
    O(a[12454]);
    a[12455] = b:New(12455, 0, fac.Alliance, 4894); -- Westfall & Duskwood Quests
    a[12456] = b:New(12456, 0, fac.Alliance, 4908); -- Loch Modan & Wetlands Quests
    a[12457] = b:New(12457, 10); -- Remix to Ignition
    a[12462] = b:New(12462, 10); -- Shot Through the Heart
    a[12473] = b:New(12473, 10, fac.Alliance, 11861); -- A Sound Plan
    a[12478] = b:New(12478, 10, fac.Horde, 12496); -- Secrets in the Sands
    a[12479] = b:New(12479, 10, fac.Horde, 12891); -- Zandalar Forever!
    a[12480] = b:New(12480, 5, fac.Horde); -- A Bargain of Blood
    a[12481] = b:New(12481, 5, fac.Horde); -- The Final Seal
    a[12482] = b:New(12482, 5); -- Get Hek'd
    a[12483] = b:New(12483, 10); -- Waycrest Manor
    a[12484] = b:New(12484, 10); -- Heroic: Waycrest Manor
    a[12488] = b:New(12488, 10); -- Mythic: Waycrest Manor
    a[12489] = b:New(12489, 10); -- Losing My Profession
    a[12490] = b:New(12490, 10); -- Alchemical Romance
    a[12495] = b:New(12495, 10); -- Run Wild Like a Man On Fire
    a[12496] = b:New(12496, 10, fac.Alliance, 12478); -- Stormsong and Dance
    a[12497] = b:New(12497, 10, fac.Alliance, 11868); -- Drust Do It.
    a[12498] = b:New(12498, 10); -- Taint Nobody Got Time For That
    a[12499] = b:New(12499, 10); -- Sporely Alive
    a[12500] = b:New(12500, 10); -- Underrot
    a[12501] = b:New(12501, 10); -- Heroic: Underrot
    a[12502] = b:New(12502, 10); -- Mythic: Underrot
    a[12503] = b:New(12503, 10); -- Snake Eyes
    a[12504] = b:New(12504, 10); -- The Temple of Sethraliss
    a[12505] = b:New(12505, 10); -- Heroic: The Temple of Sethraliss
    a[12506] = b:New(12506, 10); -- Mythic: The Temple of Sethraliss
    a[12507] = b:New(12507, 10); -- Snake Eater
    a[12508] = b:New(12508, 10); -- "Good Night, Sweet Prince"
    a[12509] = b:New(12509, 10, fac.Horde, 12510); -- Ready for War
    a[12510] = b:New(12510, 10, fac.Alliance, 12509); -- Ready for War
    a[12515] = b:New(12515, 10, fac.Alliance); -- Allied Races: Dark Iron Dwarf
    a[12518] = b:New(12518, 10, fac.Horde); -- Allied Races: Mag'har Orc
    a[12521] = b:New(12521, 10); -- Halls of Containment
    a[12522] = b:New(12522, 10); -- Crimson Descent
    a[12523] = b:New(12523, 10); -- Heart of Corruption
    a[12524] = b:New(12524, 10); -- Mythic: Taloc
    a[12526] = b:New(12526, 10); -- Mythic: MOTHER
    a[12527] = b:New(12527, 10); -- Mythic: Zek'voz
    a[12529] = b:New(12529, 10); -- Mythic: Vectis
    a[12530] = b:New(12530, 10); -- Mythic: Fetid Devourer
    a[12531] = b:New(12531, 10); -- Mythic: Zul
    a[12532] = b:New(12532, 10); -- Mythic: Mythrax the Unraveler
    a[12533] = b:New(12533, 10); -- Mythic: G'huun
    a[12535] = b:New(12535, 0); -- Cutting Edge: G'huun
    O(a[12535], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1);
    a[12536] = b:New(12536, 0); -- Ahead of the Curve: G'huun
    O(a[12536], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1);
    a[12544] = b:New(12544, 0); -- Level 120 (Legacy)
    O(a[12544], "From", "Version", "080001", "Before", "Version", "090001");
    a[12546] = b:New(12546, 0); -- Superior (Battle)
    O(a[12546], "From", "Version", "080001", "Before", "Version", "090001");
    a[12547] = b:New(12547, 0); -- Epic (Battle)
    O(a[12547], "From", "Version", "080001", "Before", "Version", "090001");
    a[12548] = b:New(12548, 10); -- I'm in Charge Now!
    a[12549] = b:New(12549, 10); -- Not a Fun Guy
    a[12550] = b:New(12550, 10); -- Pecking Order
    a[12551] = b:New(12551, 10); -- Double Dribble
    a[12555] = b:New(12555, 10, fac.Horde, 12582); -- Welcome to Zandalar
    a[12556] = b:New(12556, 10); -- Explore Tiragarde Sound
    a[12557] = b:New(12557, 10); -- Explore Drustvar
    a[12558] = b:New(12558, 10); -- Explore Stormsong Valley
    a[12559] = b:New(12559, 10); -- Explore Zuldazar
    a[12560] = b:New(12560, 10); -- Explore Vol'dun
    a[12561] = b:New(12561, 10); -- Explore Nazmir
    a[12567] = b:New(12567, 0, fac.Alliance, 12568); -- The Horde Slayer
    a[12568] = b:New(12568, 0, fac.Horde, 12567); -- The Alliance Slayer
    a[12571] = b:New(12571, 10); -- Bounty Hunting
    a[12572] = b:New(12572, 10); -- War Supplied
    a[12573] = b:New(12573, 15); -- Band of Brothers
    a[12574] = b:New(12574, 10); -- Tour of Duty: Nazmir
    a[12575] = b:New(12575, 10); -- Tour of Duty: Zuldazar
    a[12576] = b:New(12576, 10); -- Tour of Duty: Vol'dun
    a[12577] = b:New(12577, 10); -- Tour of Duty: Tiragarde Sound
    a[12578] = b:New(12578, 10); -- Tour of Duty: Stormsong Valley
    a[12579] = b:New(12579, 10); -- Tour of Duty: Drustvar
    a[12582] = b:New(12582, 10, fac.Alliance, 12555); -- Come Sail Away
    a[12587] = b:New(12587, 10); -- Unbound Monstrosities
    a[12588] = b:New(12588, 5); -- Eat Your Greens
    a[12589] = b:New(12589, 10); -- Heroic: Un'gol Ruins
    a[12590] = b:New(12590, 10); -- Un'gol Ruins
    a[12591] = b:New(12591, 10); -- Mythic: Un'gol Ruins
    a[12592] = b:New(12592, 10); -- Ruined the Ruins
    a[12593] = b:New(12593, 10, fac.Alliance, 13294); -- Loremaster of Kul Tiras
    a[12594] = b:New(12594, 10); -- Competent Captain
    a[12595] = b:New(12595, 10); -- Expert Expeditioner
    a[12596] = b:New(12596, 10); -- No Tourist
    a[12597] = b:New(12597, 10); -- Bayside Brawler
    a[12600] = b:New(12600, 10); -- Breath of the Shrine
    a[12601] = b:New(12601, 10); -- The Void Lies Sleeping
    a[12602] = b:New(12602, 10); -- Trust No One
    a[12604] = b:New(12604, 20, fac.Horde, 12605); -- Conqueror of Azeroth
    a[12605] = b:New(12605, 20, fac.Alliance, 12604); -- Conqueror of Azeroth
    a[12614] = b:New(12614, 5, fac.Horde); -- Loa Expectations
    a[12719] = b:New(12719, 10, fac.Horde); -- Spirits Be With You
    a[12721] = b:New(12721, 10); -- Wrap God
    a[12722] = b:New(12722, 10); -- It Belongs in a Mausoleum!
    a[12723] = b:New(12723, 10); -- How to Keep a Mummy
    a[12726] = b:New(12726, 10); -- A Fish Out of Water
    a[12727] = b:New(12727, 10); -- Stand by Me
    a[12731] = b:New(12731, 10, fac.Alliance, 12733); -- Professional Kul Tiran Master
    a[12733] = b:New(12733, 10, fac.Horde, 12731); -- Professional Zandalari Master
    a[12734] = b:New(12734, 10, fac.Alliance, 12735); -- Working in Kul Tiras
    a[12735] = b:New(12735, 10, fac.Horde, 12734); -- Working in Zandalar
    a[12736] = b:New(12736, 50, fac.Alliance, 12737); -- Kul Tiran Master of All
    a[12737] = b:New(12737, 50, fac.Horde, 12736); -- Zandalari Master of All
    a[12738] = b:New(12738, 10); -- Holy Scrap!
    a[12739] = b:New(12739, 15); -- Scraptastic!
    a[12740] = b:New(12740, 25); -- Full of Scrap!
    a[12741] = b:New(12741, 5, fac.Alliance, 13056); -- Giving a Scrap
    a[12742] = b:New(12742, 10, fac.Alliance, 12743); -- Kul Tiran Cook
    a[12743] = b:New(12743, 10, fac.Horde, 12742); -- Zandalari Cook
    a[12744] = b:New(12744, 10, fac.Alliance, 12746); -- The Kul Tiran Menu
    a[12746] = b:New(12746, 10, fac.Horde, 12744); -- The Zandalari Menu
    a[12747] = b:New(12747, 25); -- Catering for Combat
    a[12753] = b:New(12753, 10, fac.Alliance, 12754); -- Kul Tiran Fisherman
    a[12754] = b:New(12754, 10, fac.Horde, 12753); -- Zandalari Fisherman
    a[12755] = b:New(12755, 10); -- Scent of the Sea
    a[12756] = b:New(12756, 10); -- Fish Me In the Moonlight
    a[12757] = b:New(12757, 10); -- Angling for Battle
    a[12758] = b:New(12758, 15, fac.Alliance, 12759); -- Baiting the Enemy
    a[12759] = b:New(12759, 15, fac.Horde, 12758); -- Baiting the Enemy
    a[12760] = b:New(12760, 10, fac.Alliance, 12761); -- Kul Tiran Archaeologist
    a[12761] = b:New(12761, 10, fac.Horde, 12760); -- Zandalari Archaeologist
    a[12762] = b:New(12762, 25, fac.Alliance, 12764); -- Kul Tiran Curator
    a[12764] = b:New(12764, 25, fac.Horde, 12762); -- Zandalari Curator
    a[12765] = b:New(12765, 10); -- Exotic Discoveries
    a[12769] = b:New(12769, 10); -- Light Travel
    a[12770] = b:New(12770, 10); -- Lengthy Legwork
    a[12771] = b:New(12771, 10); -- Treasures of Nazmir
    a[12772] = b:New(12772, 10); -- Now We Got Bad Blood
    a[12806] = b:New(12806, 25); -- Glory of the Uldir Raider
    a[12807] = b:New(12807, 20); -- Battle for Azeroth Dungeon Hero
    a[12812] = b:New(12812, 25); -- Glory of the Wartorn Hero
    a[12823] = b:New(12823, 10); -- Thrash Mouth - All Stars
    a[12824] = b:New(12824, 10); -- Atal'Dazar
    a[12825] = b:New(12825, 10); -- Heroic: Atal'Dazar
    a[12826] = b:New(12826, 10); -- Mythic: Atal'Dazar
    a[12827] = b:New(12827, 0); -- WoW's 14th Anniversary
    O(a[12827]);
    a[12828] = b:New(12828, 10); -- What's in the Box?
    a[12830] = b:New(12830, 10); -- Edgelords
    a[12831] = b:New(12831, 10); -- Freehold
    a[12832] = b:New(12832, 10); -- Heroic: Freehold
    a[12833] = b:New(12833, 10); -- Mythic: Freehold
    a[12835] = b:New(12835, 10); -- Shrine of the Storm
    a[12836] = b:New(12836, 10); -- Existential Crisis
    a[12837] = b:New(12837, 10); -- Heroic: Shrine of the Storm
    a[12838] = b:New(12838, 10); -- Mythic: Shrine of the Storm
    a[12840] = b:New(12840, 10); -- Tol Dagor
    a[12841] = b:New(12841, 10); -- Heroic: Tol Dagor
    a[12842] = b:New(12842, 10); -- Mythic: Tol Dagor
    a[12844] = b:New(12844, 10); -- The MOTHERLODE!!
    a[12845] = b:New(12845, 10); -- Heroic: The MOTHERLODE!!
    a[12846] = b:New(12846, 10); -- Mythic: The MOTHERLODE!!
    a[12847] = b:New(12847, 10); -- Siege of Boralus
    a[12848] = b:New(12848, 10); -- Kings' Rest
    a[12849] = b:New(12849, 10); -- Treasures of Vol'dun
    a[12850] = b:New(12850, 0); -- At Least You're Being Careful
    a[12851] = b:New(12851, 10); -- Treasures of Zuldazar
    a[12852] = b:New(12852, 10); -- Treasures of Tiragarde Sound
    a[12853] = b:New(12853, 10); -- Treasures of Stormsong Valley
    a[12854] = b:New(12854, 10); -- Ready for Raiding VI
    a[12855] = b:New(12855, 10); -- Pitch Invasion
    a[12856] = b:New(12856, 5); -- The First Rule of Dueler's Guild
    a[12857] = b:New(12857, 5); -- Trial by Combat
    a[12858] = b:New(12858, 5); -- Slugfest
    a[12859] = b:New(12859, 5); -- Prize Fighter
    a[12860] = b:New(12860, 5); -- Contender
    a[12861] = b:New(12861, 10); -- Master of Duels
    a[12862] = b:New(12862, 10); -- Thirty Six and Two
    a[12863] = b:New(12863, 5); -- Dueling Master
    a[12864] = b:New(12864, 10); -- 80 Exalted Reputations
    a[12865] = b:New(12865, 10); -- 90 Exalted Reputations
    a[12866] = b:New(12866, 20); -- 100 Exalted Reputations
    a[12867] = b:New(12867, 10, fac.Horde, 12896); -- Azeroth at War: The Barrens
    a[12869] = b:New(12869, 10, fac.Horde, 12898); -- Azeroth at War: After Lordaeron
    a[12870] = b:New(12870, 10, fac.Horde, 12899); -- Azeroth at War: Kalimdor on Fire
    a[12872] = b:New(12872, 10); -- The Dirty Five
    a[12873] = b:New(12873, 10, fac.Horde, 12881); -- War is Hell
    a[12874] = b:New(12874, 10); -- An Eventful Battle
    a[12876] = b:New(12876, 10, fac.Horde, 12889); -- Strike Fast
    a[12877] = b:New(12877, 10, fac.Horde, 12888); -- Strike Hard
    a[12878] = b:New(12878, 10, fac.Horde, 12884); -- Leader of Troops
    a[12879] = b:New(12879, 10, fac.Horde, 12886); -- Tour of War
    a[12881] = b:New(12881, 10, fac.Alliance, 12873); -- War is Hell
    a[12884] = b:New(12884, 10, fac.Alliance, 12878); -- Leader of Troops
    a[12886] = b:New(12886, 10, fac.Alliance, 12879); -- Tour of War
    a[12888] = b:New(12888, 10, fac.Alliance, 12877); -- Strike Hard
    a[12889] = b:New(12889, 10, fac.Alliance, 12876); -- Strike Fast
    a[12891] = b:New(12891, 10, fac.Alliance, 12479); -- A Nation United
    a[12893] = b:New(12893, 10); -- Honor Level 5
    a[12894] = b:New(12894, 10); -- Honor Level 10
    a[12895] = b:New(12895, 10); -- Honor Level 15
    a[12896] = b:New(12896, 10, fac.Alliance, 12867); -- Azeroth at War: The Barrens
    a[12898] = b:New(12898, 10, fac.Alliance, 12869); -- Azeroth at War: After Lordaeron
    a[12899] = b:New(12899, 10, fac.Alliance, 12870); -- Azeroth at War: Kalimdor on Fire
    a[12900] = b:New(12900, 10); -- Honor Level 20
    a[12901] = b:New(12901, 10); -- Honor Level 25
    a[12902] = b:New(12902, 10); -- Honor Level 30
    a[12903] = b:New(12903, 10); -- Honor Level 40
    a[12904] = b:New(12904, 10); -- Honor Level 50
    a[12905] = b:New(12905, 10); -- Honor Level 60
    a[12906] = b:New(12906, 10); -- Honor Level 70
    a[12907] = b:New(12907, 10); -- Honor Level 80
    a[12908] = b:New(12908, 10); -- Honor Level 90
    a[12909] = b:New(12909, 10); -- Honor Level 100
    a[12910] = b:New(12910, 10); -- Honor Level 125
    a[12911] = b:New(12911, 10); -- Honor Level 150
    a[12912] = b:New(12912, 10); -- Honor Level 175
    a[12913] = b:New(12913, 10); -- Honor Level 200
    a[12914] = b:New(12914, 10); -- Honor Level 250
    a[12915] = b:New(12915, 10); -- Honor Level 300
    a[12916] = b:New(12916, 10); -- Honor Level 400
    a[12917] = b:New(12917, 10); -- Honor Level 500
    a[12918] = b:New(12918, 10); -- Have a Heart
    a[12927] = b:New(12927, 5); -- Polished Pet Charmer
    a[12930] = b:New(12930, 5); -- Battle Safari
    a[12931] = b:New(12931, 10, fac.Horde, 12932); -- No Stable Big Enough
    a[12932] = b:New(12932, 10, fac.Alliance, 12931); -- No Stable Big Enough
    a[12933] = b:New(12933, 10, fac.Alliance, 12934); -- A Horde of Hoofbeats
    a[12934] = b:New(12934, 10, fac.Horde, 12933); -- A Horde of Hoofbeats
    a[12936] = b:New(12936, 10); -- Battle on Zandalar and Kul Tiras
    a[12937] = b:New(12937, 10); -- Elevator Music
    a[12938] = b:New(12938, 10); -- Parental Controls
    a[12939] = b:New(12939, 10); -- Adventurer of Tiragarde Sound
    a[12940] = b:New(12940, 10); -- Adventurer of Stormsong Valley
    a[12941] = b:New(12941, 10); -- Adventurer of Drustvar
    a[12942] = b:New(12942, 10); -- Adventurer of Nazmir
    a[12943] = b:New(12943, 10); -- Adventurer of Vol'dun
    a[12944] = b:New(12944, 10); -- Adventurer of Zuldazar
    a[12945] = b:New(12945, 0); -- Dread Gladiator: Battle for Azeroth Season 1
    O(a[12945], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12947] = b:New(12947, 10); -- Azerothian Diplomat
    a[12948] = b:New(12948, 5, fac.Horde, 12952); -- Talanji's Expedition
    a[12949] = b:New(12949, 5, fac.Horde, 12953); -- The Voldunai
    a[12950] = b:New(12950, 5, fac.Horde, 12951); -- Zandalari Empire
    a[12951] = b:New(12951, 5, fac.Alliance, 12950); -- Proudmoore Admiralty
    a[12952] = b:New(12952, 5, fac.Alliance, 12948); -- Order of Embers
    a[12953] = b:New(12953, 5, fac.Alliance, 12949); -- Storm's Wake
    a[12954] = b:New(12954, 5, fac.Alliance, 12957); -- Champion of the 7th Legion
    a[12955] = b:New(12955, 5); -- Champions of Azeroth
    a[12956] = b:New(12956, 5); -- Tortollan Seekers
    a[12957] = b:New(12957, 5, fac.Horde, 12954); -- Champion of the Honorbound
    a[12958] = b:New(12958, 10); -- Master of Minions
    a[12959] = b:New(12959, 0); -- Challenger: Battle for Azeroth Season 1
    O(a[12959], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12960] = b:New(12960, 0); -- Rival: Battle for Azeroth Season 1
    O(a[12960], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12961] = b:New(12961, 0); -- Gladiator: Battle for Azeroth Season 1
    O(a[12961], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12962] = b:New(12962, 0); -- Duelist: Battle for Azeroth Season 1
    O(a[12962], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12963] = b:New(12963, 0, fac.Alliance, 12964); -- Hero of the Alliance: Dread
    O(a[12963], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12964] = b:New(12964, 0, fac.Horde, 12963); -- Hero of the Horde: Dread
    O(a[12964], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[12988] = b:New(12988, 25); -- Battle for Azeroth Explorer
    a[12989] = b:New(12989, 25); -- "Battle for Azeroth Pathfinder, Part One"
    a[12990] = b:New(12990, 10); -- Catchin' Some Rays
    a[12991] = b:New(12991, 10); -- "New Mog, G'huun This?"
    T(a[12991], t[1653]); -- Eternal Curator's Protectorate (Raid Finder)
    T(a[12991], t[1650]); -- Eternal Curator's Protectorate (Normal)
    T(a[12991], t[1651]); -- Eternal Curator's Protectorate (Heroic)
    T(a[12991], t[1652]); -- Eternal Curator's Protectorate (Mythic)
    T(a[12991], t[1649]); -- Eternal Curator's Chains (Raid Finder)
    T(a[12991], t[1646]); -- Eternal Curator's Chains (Normal)
    T(a[12991], t[1647]); -- Eternal Curator's Chains (Heroic)
    T(a[12991], t[1648]); -- Eternal Curator's Chains (Mythic)
    T(a[12991], t[1641]); -- Eternal Curator's Vestment (Raid Finder)
    T(a[12991], t[1638]); -- Eternal Curator's Vestment (Normal)
    T(a[12991], t[1639]); -- Eternal Curator's Vestment (Heroic)
    T(a[12991], t[1640]); -- Eternal Curator's Vestment (Mythic)
    T(a[12991], t[1645]); -- Eternal Curator's Garb (Raid Finder)
    T(a[12991], t[1642]); -- Eternal Curator's Garb (Normal)
    T(a[12991], t[1643]); -- Eternal Curator's Garb (Heroic)
    T(a[12991], t[1644]); -- Eternal Curator's Garb (Mythic)
    a[12992] = b:New(12992, 10); -- Pet Emporium
    a[12993] = b:New(12993, 10); -- Don't Warfront Me
    T(a[12993], t[1664]); -- Dread Aspirant's Plate (Aspirant)
    T(a[12993], t[1665]); -- 7th Legionnaire's Plate (Warfront)
    T(a[12993], t[1663]); -- Dread Gladiator's Plate (Gladiator)
    T(a[12993], t[1735]); -- Dread Gladiator's Plate (Elite)
    T(a[12993], t[1661]); -- Dread Aspirant's Chain (Aspirant)
    T(a[12993], t[1662]); -- 7th Legionnaire's Chain (Warfront)
    T(a[12993], t[1660]); -- Dread Gladiator's Chain (Gladiator)
    T(a[12993], t[1736]); -- Dread Gladiator's Chain (Elite)
    T(a[12993], t[1655]); -- Dread Aspirant's Vestment (Aspirant)
    T(a[12993], t[1656]); -- 7th Legionnaire's Vestment (Warfront)
    T(a[12993], t[1654]); -- Dread Gladiator's Vestment (Gladiator)
    T(a[12993], t[1738]); -- Dread Gladiator's Vestment (Elite)
    T(a[12993], t[1658]); -- Dread Aspirant's Leathers (Aspirant)
    T(a[12993], t[1659]); -- 7th Legionnaire's Leathers (Warfront)
    T(a[12993], t[1657]); -- Dread Gladiator's Leathers (Gladiator)
    T(a[12993], t[1737]); -- Dread Gladiator's Leathers (Elite)
    T(a[12993], t[1676]); -- Dread Aspirant's Plate (Aspirant)
    T(a[12993], t[1677]); -- Honorbound Centurion's Plate (Warfront)
    T(a[12993], t[1675]); -- Dread Gladiator's Plate (Gladiator)
    T(a[12993], t[1731]); -- Dread Gladiator's Plate (Elite)
    T(a[12993], t[1673]); -- Dread Aspirant's Chain (Aspirant)
    T(a[12993], t[1674]); -- Honorbound Vanguard's Chain (Warfront)
    T(a[12993], t[1672]); -- Dread Gladiator's Chain (Gladiator)
    T(a[12993], t[1732]); -- Dread Gladiator's Chain (Elite)
    T(a[12993], t[1667]); -- Dread Aspirant's Vestment (Aspirant)
    T(a[12993], t[1668]); -- Honorbound Artificer's Vestment (Warfront)
    T(a[12993], t[1666]); -- Dread Gladiator's Vestment (Gladiator)
    T(a[12993], t[1734]); -- Dread Gladiator's Vestment (Elite)
    T(a[12993], t[1670]); -- Dread Aspirant's Leathers (Aspirant)
    T(a[12993], t[1671]); -- Honorbound Outrider's Leathers (Warfront)
    T(a[12993], t[1669]); -- Dread Gladiator's Leathers (Gladiator)
    T(a[12993], t[1733]); -- Dread Gladiator's Leathers (Elite)
    a[12995] = b:New(12995, 10); -- Treasures of Drustvar
    a[12996] = b:New(12996, 10); -- Toybox Tycoon
    a[12997] = b:New(12997, 10, fac.Alliance); -- The Pride of Kul Tiras
    a[12998] = b:New(12998, 10); -- That Sweete Booty
    a[13009] = b:New(13009, 5, fac.Horde); -- Adept Sandfisher
    a[13011] = b:New(13011, 5); -- Scourge of Zem'lan
    a[13014] = b:New(13014, 5, fac.Horde); -- Vorrik's Champion
    a[13016] = b:New(13016, 5); -- Scavenger of the Sands
    a[13017] = b:New(13017, 5, fac.Horde); -- Champion of the Vulpera
    a[13018] = b:New(13018, 10); -- Dune Rider
    a[13020] = b:New(13020, 5, fac.Horde); -- Bow to Your Masters
    a[13021] = b:New(13021, 5, fac.Horde); -- A Most Efficient Apocalypse
    a[13022] = b:New(13022, 5, fac.Horde); -- Revenge is Best Served Speedily
    a[13023] = b:New(13023, 5); -- It's Really Getting Out of Hand
    a[13024] = b:New(13024, 5); -- "Carved in Stone, Written in Blood"
    a[13025] = b:New(13025, 5, fac.Horde); -- Zandalari Spycatcher
    a[13026] = b:New(13026, 5, fac.Alliance); -- 7th Legion Spycatcher
    a[13027] = b:New(13027, 5); -- Mushroom Harvest
    a[13028] = b:New(13028, 5); -- Hoppin' Sad
    a[13029] = b:New(13029, 5); -- Eating Out of the Palm of My Tiny Hand
    a[13030] = b:New(13030, 5, fac.Horde); -- How to Ptrain Your Pterrordax
    a[13035] = b:New(13035, 5); -- By de Power of de Loa!
    a[13036] = b:New(13036, 5); -- A Loa of a Tale
    a[13038] = b:New(13038, 5, fac.Horde); -- Raptari Rider
    a[13039] = b:New(13039, 5, fac.Horde); -- Paku'ai
    a[13041] = b:New(13041, 5, fac.Horde); -- "Hungry, Hungry Ranishu"
    a[13042] = b:New(13042, 5); -- About To Break
    a[13045] = b:New(13045, 5); -- Every Day I'm Truffling
    a[13046] = b:New(13046, 5); -- These Hills Sing
    a[13047] = b:New(13047, 5); -- Clever Use of Mechanical Explosives
    a[13048] = b:New(13048, 5); -- Life Finds a Way... To Die!
    a[13049] = b:New(13049, 5, fac.Alliance); -- The Long Con
    a[13050] = b:New(13050, 5); -- Bless the Rains Down in Freehold
    a[13051] = b:New(13051, 5); -- Legends of the Tidesages
    a[13053] = b:New(13053, 5, fac.Alliance); -- Deadliest Cache
    a[13054] = b:New(13054, 5); -- Sabertron Assemble
    a[13056] = b:New(13056, 5, fac.Horde, 12741); -- Giving a Scrap
    a[13057] = b:New(13057, 5); -- Shanty Raid
    a[13058] = b:New(13058, 5); -- Kul Tiran Up the Dance Floor
    a[13059] = b:New(13059, 5, fac.Alliance); -- Drag Race
    a[13060] = b:New(13060, 5, fac.Alliance); -- Kul Runnings
    a[13061] = b:New(13061, 5); -- Three Sheets to the Wind
    a[13062] = b:New(13062, 5, fac.Alliance); -- Let's Bee Friends
    a[13064] = b:New(13064, 5); -- "Drust the Facts, Ma'am"
    a[13075] = b:New(13075, 10); -- Battle for Azeroth Keymaster
    a[13076] = b:New(13076, 10, fac.Alliance); -- Heritage of the Dark Iron
    a[13077] = b:New(13077, 10, fac.Horde); -- Heritage of the Mag'har
    a[13078] = b:New(13078, 0, nil, nil, true); -- Realm First! Battle for Azeroth Keystone Master
    O(a[13078], "Once");
    a[13079] = b:New(13079, 0); -- Battle for Azeroth Keystone Conqueror: Season One
    O(a[13079], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1);
    a[13080] = b:New(13080, 0); -- Battle for Azeroth Keystone Master: Season One
    O(a[13080], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1);
    a[13082] = b:New(13082, 5, fac.Alliance); -- Everything Old Is New Again
    a[13083] = b:New(13083, 5); -- "Better, Faster, Stronger"
    a[13087] = b:New(13087, 5); -- Sausage Sampler
    a[13093] = b:New(13093, 0); -- Dread Gladiator's Proto-Drake
    O(a[13093], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[13094] = b:New(13094, 5); -- Cursed Game Hunter
    a[13095] = b:New(13095, 10); -- Dread Chain
    a[13096] = b:New(13096, 10); -- Heroic: Dread Chain
    a[13097] = b:New(13097, 10); -- Mythic: Dread Chain
    a[13098] = b:New(13098, 10); -- Bane of the Chain
    a[13099] = b:New(13099, 10); -- Molten Cay
    a[13100] = b:New(13100, 10); -- Heroic: Molten Cay
    a[13101] = b:New(13101, 10); -- Mythic: Molten Cay
    a[13102] = b:New(13102, 10); -- Clash at the Cay
    a[13103] = b:New(13103, 10); -- Rotting Mire
    a[13104] = b:New(13104, 10); -- Heroic: Rotting Mire
    a[13105] = b:New(13105, 10); -- Mythic: Rotting Mire
    a[13106] = b:New(13106, 10); -- Mire Marauder
    a[13107] = b:New(13107, 10); -- Skittering Hollow
    a[13108] = b:New(13108, 10); -- Heroic: Skittering Hollow
    a[13109] = b:New(13109, 10); -- Mythic: Skittering Hollow
    a[13110] = b:New(13110, 10); -- Skittering Smashed
    a[13111] = b:New(13111, 10); -- Verdant Wilds
    a[13112] = b:New(13112, 10); -- Heroic: Verdant Wilds
    a[13113] = b:New(13113, 10); -- Mythic: Verdant Wilds
    a[13114] = b:New(13114, 10); -- War for the Wilds
    a[13115] = b:New(13115, 10); -- Reef Madness
    a[13116] = b:New(13116, 10); -- Mythic: Whispering Reef
    a[13118] = b:New(13118, 10); -- Heroic: Whispering Reef
    a[13119] = b:New(13119, 10); -- Whispering Reef
    a[13120] = b:New(13120, 10); -- Blood in the Water
    a[13121] = b:New(13121, 10); -- Notorious
    a[13122] = b:New(13122, 10); -- Island Conqueror
    a[13123] = b:New(13123, 10); -- My Dubs
    a[13124] = b:New(13124, 10); -- Metal Detector
    a[13125] = b:New(13125, 10); -- Azerite Admiral
    a[13126] = b:New(13126, 10); -- Give Me The Energy
    a[13127] = b:New(13127, 10); -- Tell Me A Tale
    a[13128] = b:New(13128, 10); -- I'm Here for the Pets
    a[13129] = b:New(13129, 10); -- Sucker Punch
    a[13132] = b:New(13132, 10); -- Helping Hand
    a[13133] = b:New(13133, 10, fac.Alliance, 13135); -- Team Deathmatch
    a[13134] = b:New(13134, 20); -- Expedition Leader
    a[13135] = b:New(13135, 10, fac.Horde, 13133); -- Team Deathmatch
    a[13138] = b:New(13138, 0); -- Flying Colors
    a[13141] = b:New(13141, 10); -- Island Slayer
    a[13142] = b:New(13142, 10); -- Archipelago Explorer
    a[13144] = b:New(13144, 10); -- Wide World of Quests
    a[13161] = b:New(13161, 10, fac.Horde); -- Allied Races: Zandalari Troll
    a[13163] = b:New(13163, 10, fac.Alliance); -- Allied Races: Kul Tiran
    a[13186] = b:New(13186, 5, fac.Alliance, 13188); -- You Are Not Your $#*@! Legplates
    O(a[13186], "From", "Version", "080105", "Before", "Version", "090001");
    a[13188] = b:New(13188, 5, fac.Horde, 13186); -- You Are Not Your $#*@! Legplates
    O(a[13188], "From", "Version", "080105", "Before", "Version", "090001");
    a[13189] = b:New(13189, 5, fac.Alliance, 13190); -- The Second Rule of Brawler's Guild
    O(a[13189], "From", "Version", "080105", "Before", "Version", "090001");
    a[13190] = b:New(13190, 5, fac.Horde, 13189); -- The Second Rule of Brawler's Guild
    O(a[13190], "From", "Version", "080105", "Before", "Version", "090001");
    a[13191] = b:New(13191, 5, fac.Alliance, 13192); -- Brawler for Azeroth
    O(a[13191], "From", "Version", "080105", "Before", "Version", "090001");
    a[13192] = b:New(13192, 5, fac.Horde, 13191); -- Brawler for Azeroth
    O(a[13192], "From", "Version", "080105", "Before", "Version", "090001");
    a[13194] = b:New(13194, 5); -- I Am Thrall's Complete Lack Of Surprise
    O(a[13194], "From", "Version", "080105", "Before", "Version", "090001");
    a[13196] = b:New(13196, 0); -- Meat Marauder
    a[13199] = b:New(13199, 0); -- Combatant: Battle for Azeroth Season 1
    O(a[13199], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[13200] = b:New(13200, 0); -- Sinister Gladiator: Battle for Azeroth Season 2
    O(a[13200], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13202] = b:New(13202, 0); -- Sinister Gladiator's Proto-Drake
    O(a[13202], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13203] = b:New(13203, 0); -- Challenger: Battle for Azeroth Season 2
    O(a[13203], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13204] = b:New(13204, 0); -- Combatant: Battle for Azeroth Season 2
    O(a[13204], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13205] = b:New(13205, 0); -- Rival: Battle for Azeroth Season 2
    O(a[13205], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13206] = b:New(13206, 10, fac.Horde); -- Allied Races: Vulpera
    a[13209] = b:New(13209, 0); -- Duelist: Battle for Azeroth Season 2
    O(a[13209], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13210] = b:New(13210, 0, fac.Alliance, 13211); -- Hero of the Alliance: Sinister
    O(a[13210], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13211] = b:New(13211, 0, fac.Horde, 13210); -- Hero of the Horde: Sinister
    O(a[13211], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13212] = b:New(13212, 0); -- Gladiator: Battle for Azeroth Season 2
    O(a[13212], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13250] = b:New(13250, 25); -- "Battle for Azeroth Pathfinder, Part Two"
    a[13251] = b:New(13251, 0, fac.Alliance, 13263); -- In Teldrassil's Shadow
    a[13263] = b:New(13263, 10, fac.Horde, 13251); -- The Shadow Hunter
    a[13269] = b:New(13269, 5); -- Pet Battle Challenge: Gnomeregan
    a[13270] = b:New(13270, 5); -- Beast Mode
    a[13271] = b:New(13271, 5); -- Critters With Huge Teeth
    a[13272] = b:New(13272, 5); -- Dragons Make Everything Better
    a[13273] = b:New(13273, 5); -- Element of Success
    a[13274] = b:New(13274, 5); -- Fun With Flying
    a[13275] = b:New(13275, 5); -- Magician's Secrets
    a[13277] = b:New(13277, 5); -- Machine Learning
    a[13278] = b:New(13278, 5); -- Not Quite Dead Yet
    a[13279] = b:New(13279, 10); -- Family Battler
    a[13280] = b:New(13280, 5); -- Hobbyist Aquarist
    a[13281] = b:New(13281, 5); -- Human Resources
    a[13283] = b:New(13283, 10, fac.Alliance, 13284); -- Frontline Warrior
    a[13284] = b:New(13284, 10, fac.Horde, 13283); -- Frontline Warrior
    a[13285] = b:New(13285, 5, fac.Alliance); -- Upright Citizens
    a[13286] = b:New(13286, 10, fac.Alliance, 13289); -- Siege of Dazar'alor
    a[13287] = b:New(13287, 10, fac.Alliance, 13290); -- Empire's Fall
    a[13288] = b:New(13288, 10, fac.Alliance, 13291); -- Might of the Alliance
    a[13289] = b:New(13289, 10, fac.Horde, 13286); -- Defense of Dazar'alor
    a[13290] = b:New(13290, 10, fac.Horde, 13287); -- Death's Bargain
    a[13291] = b:New(13291, 10, fac.Horde, 13288); -- Victory or Death
    a[13292] = b:New(13292, 10); -- Mythic: Champion of the Light
    a[13293] = b:New(13293, 10); -- Mythic: Grong
    a[13294] = b:New(13294, 10, fac.Horde, 12593); -- Loremaster of Zandalar
    a[13295] = b:New(13295, 10, fac.Horde, 13298); -- Mythic: Jadefire Masters
    a[13296] = b:New(13296, 10, fac.Horde, 13297); -- War for the Shore
    a[13297] = b:New(13297, 10, fac.Alliance, 13296); -- War for the Shore
    a[13298] = b:New(13298, 10, fac.Alliance, 13295); -- Mythic: Jadefire Masters
    a[13299] = b:New(13299, 10); -- Mythic: Opulence
    a[13300] = b:New(13300, 10); -- Mythic: Conclave of the Chosen
    a[13301] = b:New(13301, 10, fac.Horde, 13302); -- Under Cover of Darkness
    a[13302] = b:New(13302, 10, fac.Alliance, 13301); -- Under Cover of Darkness
    a[13305] = b:New(13305, 10, fac.Alliance, 13306); -- Night Moves
    a[13306] = b:New(13306, 10, fac.Horde, 13305); -- Night Moves
    a[13307] = b:New(13307, 10, fac.Horde, 13308); -- Recruitment Officer
    a[13308] = b:New(13308, 10, fac.Alliance, 13307); -- Recruitment Officer
    a[13309] = b:New(13309, 10, fac.Horde, 13310); -- Deforester
    a[13310] = b:New(13310, 10, fac.Alliance, 13309); -- By Nature's Call
    a[13311] = b:New(13311, 10); -- Mythic: King Rastakhan
    a[13312] = b:New(13312, 10); -- Mythic: Mekkatorque
    a[13313] = b:New(13313, 10); -- Mythic: Stormwall Blockade
    a[13314] = b:New(13314, 10); -- Mythic: Lady Jaina Proudmoore
    a[13315] = b:New(13315, 25); -- Glory of the Dazar'alor Raider
    a[13316] = b:New(13316, 10); -- Can I Get a Hek Hek Hek Yeah?
    a[13317] = b:New(13317, 5); -- Supplied and Ready
    a[13322] = b:New(13322, 0); -- Ahead of the Curve: Lady Jaina Proudmoore
    O(a[13322], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2);
    a[13323] = b:New(13323, 0); -- Cutting Edge: Lady Jaina Proudmoore
    O(a[13323], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2);
    a[13325] = b:New(13325, 10); -- Walk the Dinosaur
    a[13340] = b:New(13340, 10, fac.Horde, 13341); -- Flame Keeper of Zandalar
    a[13341] = b:New(13341, 10, fac.Alliance, 13340); -- Flame Warden of Kul Tiras
    a[13342] = b:New(13342, 10, fac.Horde, 13343); -- Extinguishing Kul Tiras
    a[13343] = b:New(13343, 10, fac.Alliance, 13342); -- Extinguishing Zandalar
    a[13345] = b:New(13345, 10); -- Praise the Sunflower
    a[13383] = b:New(13383, 10); -- Barrel of Monkeys
    a[13384] = b:New(13384, 10, fac.Alliance); -- Kul Tirans Don't Look at Explosions
    a[13385] = b:New(13385, 10); -- Daz'aling Attire
    T(a[13385], t[1819]); -- Gravelord's Direplate (Raid Finder)
    T(a[13385], t[1818]); -- Gravelord's Direplate (Normal)
    T(a[13385], t[1820]); -- Gravelord's Direplate (Heroic)
    T(a[13385], t[1821]); -- Gravelord's Direplate (Mythic)
    T(a[13385], t[1815]); -- Death-Devourer Vestments (Raid Finder)
    T(a[13385], t[1814]); -- Death-Devourer Vestments (Normal)
    T(a[13385], t[1816]); -- Death-Devourer Vestments (Heroic)
    T(a[13385], t[1817]); -- Death-Devourer Vestments (Mythic)
    T(a[13385], t[1807]); -- Soul Reaper's Raiment (Raid Finder)
    T(a[13385], t[1806]); -- Soul Reaper's Raiment (Normal)
    T(a[13385], t[1808]); -- Soul Reaper's Raiment (Heroic)
    T(a[13385], t[1809]); -- Soul Reaper's Raiment (Mythic)
    T(a[13385], t[1811]); -- Boneblade Battlegear (Raid Finder)
    T(a[13385], t[1810]); -- Boneblade Battlegear (Normal)
    T(a[13385], t[1812]); -- Boneblade Battlegear (Heroic)
    T(a[13385], t[1813]); -- Boneblade Battlegear (Mythic)
    a[13387] = b:New(13387, 10, fac.Alliance, 13388); -- Frontline Veteran
    a[13388] = b:New(13388, 10, fac.Horde, 13387); -- Frontline Veteran
    a[13389] = b:New(13389, 10); -- Jorundall
    a[13394] = b:New(13394, 10); -- Heroic: Jorundall
    a[13395] = b:New(13395, 10); -- Mythic: Jorundall
    a[13396] = b:New(13396, 10); -- Havenswood
    a[13397] = b:New(13397, 10); -- Heroic: Havenswood
    a[13398] = b:New(13398, 10); -- Mythic: Havenswood
    a[13399] = b:New(13399, 10); -- Jorundall Justice
    a[13400] = b:New(13400, 10); -- Havenswood Hero
    a[13401] = b:New(13401, 10); -- I Got Next!
    a[13402] = b:New(13402, 5, fac.Alliance, 13403); -- Frontline Slayer
    a[13403] = b:New(13403, 5, fac.Horde, 13402); -- Frontline Slayer
    a[13410] = b:New(13410, 10); -- Snow Fun Allowed
    a[13414] = b:New(13414, 10); -- Crucible of Storms
    a[13416] = b:New(13416, 10); -- Mythic: The Restless Cabal
    a[13417] = b:New(13417, 10); -- "Mythic: Uu'nat, Harbinger of the Void"
    a[13418] = b:New(13418, 0); -- "Ahead of the Curve: Uu'nat, Harbinger of the Void"
    O(a[13418], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2);
    a[13419] = b:New(13419, 0); -- "Cutting Edge: Uu'nat, Harbinger of the Void"
    O(a[13419], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2);
    a[13425] = b:New(13425, 10); -- "We Got Spirit, How About You?"
    a[13426] = b:New(13426, 5, fac.Alliance); -- Come On and Slam
    a[13429] = b:New(13429, 5); -- Azerfighter
    a[13430] = b:New(13430, 10); -- De Lurker Be'loa
    a[13431] = b:New(13431, 10); -- Hidden Dragon
    a[13433] = b:New(13433, 10); -- "Tall, Dark, and Sinister"
    T(a[13433], t[1776]); -- Sinister Aspirant's Plate (Aspirant)
    T(a[13433], t[1775]); -- Wardenguard's Battleplate (Warfront)
    T(a[13433], t[1781]); -- Sinister Gladiator's Plate (Gladiator)
    T(a[13433], t[1780]); -- Sinister Gladiator's Plate (Elite)
    T(a[13433], t[1783]); -- Sinister Aspirant's Chain (Aspirant)
    T(a[13433], t[1782]); -- Kaldorei Archer's Chainmail (Warfront)
    T(a[13433], t[1788]); -- Sinister Gladiator's Chain (Gladiator)
    T(a[13433], t[1787]); -- Sinister Gladiator's Chain (Elite)
    T(a[13433], t[1797]); -- Sinister Aspirant's Vestment (Aspirant)
    T(a[13433], t[1796]); -- Moonpriest's Vestments (Warfront)
    T(a[13433], t[1802]); -- Sinister Gladiator's Vestment (Gladiator)
    T(a[13433], t[1801]); -- Sinister Gladiator's Vestment (Elite)
    T(a[13433], t[1790]); -- Sinister Aspirant's Leathers (Aspirant)
    T(a[13433], t[1789]); -- Darkwood Sentinel's Guise (Warfront)
    T(a[13433], t[1795]); -- Sinister Gladiator's Leathers (Gladiator)
    T(a[13433], t[1794]); -- Sinister Gladiator's Leathers (Elite)
    T(a[13433], t[1746]); -- Sinister Aspirant's Plate (Aspirant)
    T(a[13433], t[1745]); -- Deathguard's Battleplate (Warfront)
    T(a[13433], t[1751]); -- Sinister Gladiator's Plate (Gladiator)
    T(a[13433], t[1750]); -- Sinister Gladiator's Plate (Elite)
    T(a[13433], t[1753]); -- Sinister Aspirant's Chain (Aspirant)
    T(a[13433], t[1752]); -- Blightguard's Chains (Warfront)
    T(a[13433], t[1758]); -- Sinister Gladiator's Chain (Gladiator)
    T(a[13433], t[1757]); -- Sinister Gladiator's Chain (Elite)
    T(a[13433], t[1767]); -- Sinister Aspirant's Vestment (Aspirant)
    T(a[13433], t[1766]); -- Plaguebringer's Raiment (Warfront)
    T(a[13433], t[1772]); -- Sinister Gladiator's Vestment (Gladiator)
    T(a[13433], t[1771]); -- Sinister Gladiator's Vestment (Elite)
    T(a[13433], t[1760]); -- Sinister Aspirant's Leathers (Aspirant)
    T(a[13433], t[1759]); -- Deathstalker's Guise (Warfront)
    T(a[13433], t[1765]); -- Sinister Gladiator's Leathers (Gladiator)
    T(a[13433], t[1764]); -- Sinister Gladiator's Leathers (Elite)
    a[13435] = b:New(13435, 5, fac.Horde); -- Doomsoul Surprise
    a[13437] = b:New(13437, 5, fac.Horde); -- Scavenge like a Vulpera
    a[13438] = b:New(13438, 5, fac.Horde, 13439); -- Boxing Match
    a[13439] = b:New(13439, 5, fac.Alliance, 13438); -- Boxing Match
    a[13440] = b:New(13440, 5, fac.Alliance, 13441); -- Pushing the Payload
    a[13441] = b:New(13441, 5, fac.Horde, 13440); -- Pushing the Payload
    a[13448] = b:New(13448, 0); -- Battle for Azeroth Keystone Conqueror: Season Two
    O(a[13448], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2);
    a[13449] = b:New(13449, 0); -- Battle for Azeroth Keystone Master: Season Two
    O(a[13449], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2);
    a[13450] = b:New(13450, 0); -- Fierce Gladiator's Storm Dragon
    O(a[13450], "From", "PvP Season", 23, "Until", "PvP Season", 23);
    a[13451] = b:New(13451, 0); -- Elite: Battle for Azeroth Season 2
    O(a[13451], "From", "PvP Season", 27, "Until", "PvP Season", 27);
    a[13465] = b:New(13465, 0); -- Elite: Battle for Azeroth Season 1
    O(a[13465], "From", "PvP Season", 26, "Until", "PvP Season", 26);
    a[13466] = b:New(13466, 10, fac.Horde, 13467); -- Tides of Vengeance
    a[13467] = b:New(13467, 10, fac.Alliance, 13466); -- Tides of Vengeance
    a[13469] = b:New(13469, 10); -- Raiding with Leashes VI: Pets of Pandaria
    a[13470] = b:New(13470, 10); -- Rest In Pistons
    a[13472] = b:New(13472, 10); -- Deep Pockets
    a[13473] = b:New(13473, 10); -- Diversified Investments
    a[13474] = b:New(13474, 10); -- Junkyard Machinist
    a[13475] = b:New(13475, 10); -- Junkyard Scavenger
    a[13476] = b:New(13476, 10); -- Junkyard Tinkerer
    a[13477] = b:New(13477, 10); -- Junkyard Apprentice
    a[13478] = b:New(13478, 10); -- Junkyard Collector
    a[13479] = b:New(13479, 10); -- Junkyard Architect
    a[13482] = b:New(13482, 10); -- Head Financier of Mechagon
    a[13489] = b:New(13489, 5); -- Secret Fish of Mechagon
    a[13501] = b:New(13501, 10); -- Gotta Bounce
    a[13502] = b:New(13502, 10); -- Secret Fish and Where to Find Them
    a[13503] = b:New(13503, 10, fac.Horde); -- Heritage of the Zandalari
    a[13504] = b:New(13504, 10, fac.Alliance); -- Heritage of the Kul Tirans
    a[13506] = b:New(13506, 10); -- A Good Eye-dea
    a[13512] = b:New(13512, 10); -- Master Calligrapher
    a[13513] = b:New(13513, 5); -- Available in Eight Colors
    a[13516] = b:New(13516, 10); -- Massive Tool
    a[13517] = b:New(13517, 20); -- Two Sides to Every Tale
    a[13541] = b:New(13541, 20); -- Mecha-Done
    a[13542] = b:New(13542, 5, fac.Horde); -- How to Train Your Direhorn
    a[13545] = b:New(13545, 10); -- "Go Ahead, Make My Daisy"
    a[13549] = b:New(13549, 10); -- Trove Tracker
    a[13553] = b:New(13553, 10, fac.Alliance); -- The Mechagonian Threat
    a[13555] = b:New(13555, 10); -- Junkyard Tinkmaster
    a[13556] = b:New(13556, 10); -- Outside Influences
    a[13557] = b:New(13557, 5); -- Rustbolt Rebellion
    a[13558] = b:New(13558, 5, fac.Alliance); -- Waveblade Ankoan
    a[13559] = b:New(13559, 5, fac.Horde); -- The Unshackled
    a[13568] = b:New(13568, 10); -- For Nazjatar!
    a[13569] = b:New(13569, 10); -- Tour of Duty: Nazjatar
    a[13570] = b:New(13570, 10); -- Tour of Duty: Mechagon
    a[13571] = b:New(13571, 10); -- Under the Seams
    T(a[13571], t[1842]); -- Naga Lord's Warplate (Raid Finder)
    T(a[13571], t[1830]); -- Naga Lord's Warplate (Normal)
    T(a[13571], t[1834]); -- Naga Lord's Warplate (Heroic)
    T(a[13571], t[1838]); -- Naga Lord's Warplate (Mythic)
    T(a[13571], t[1843]); -- Queen's Guard Scalemail (Raid Finder)
    T(a[13571], t[1831]); -- Queen's Guard Scalemail (Normal)
    T(a[13571], t[1835]); -- Queen's Guard Scalemail (Heroic)
    T(a[13571], t[1839]); -- Queen's Guard Scalemail (Mythic)
    T(a[13571], t[1845]); -- Frilled Harbinger's Vestments (Raid Finder)
    T(a[13571], t[1833]); -- Frilled Harbinger's Vestments (Normal)
    T(a[13571], t[1837]); -- Frilled Harbinger's Vestments (Heroic)
    T(a[13571], t[1841]); -- Frilled Harbinger's Vestments (Mythic)
    T(a[13571], t[1844]); -- Razorfin Regalia (Raid Finder)
    T(a[13571], t[1832]); -- Razorfin Regalia (Normal)
    T(a[13571], t[1836]); -- Razorfin Regalia (Heroic)
    T(a[13571], t[1840]); -- Razorfin Regalia (Mythic)
    a[13572] = b:New(13572, 10); -- The Heart Forge
    a[13573] = b:New(13573, 5, fac.Horde); -- How to Ptrain Your Pterrordax
    a[13577] = b:New(13577, 10); -- Crestfall
    a[13578] = b:New(13578, 10); -- Heroic: Crestfall
    a[13579] = b:New(13579, 10); -- Mythic: Crestfall
    a[13580] = b:New(13580, 10); -- Crestfallen
    a[13581] = b:New(13581, 10); -- Snowblossom Village
    a[13582] = b:New(13582, 10); -- Heroic: Snowblossom Village
    a[13583] = b:New(13583, 10); -- Mythic: Snowblossom Village
    a[13584] = b:New(13584, 10); -- Snowblossom Scrapper
    a[13585] = b:New(13585, 10); -- "Never Lose, Never Choose To"
    T(a[13585], t[1869]); -- Notorious Aspirant's Plate (Aspirant)
    T(a[13585], t[1864]); -- Notorious Gladiator's Plate (Gladiator)
    T(a[13585], t[1865]); -- Notorious Gladiator's Plate (Elite)
    T(a[13585], t[1863]); -- Notorious Aspirant's Chain (Aspirant)
    T(a[13585], t[1858]); -- Notorious Gladiator's Chain (Gladiator)
    T(a[13585], t[1859]); -- Notorious Gladiator's Chain (Elite)
    T(a[13585], t[1851]); -- Notorious Aspirant's Vestment (Aspirant)
    T(a[13585], t[1846]); -- Notorious Gladiator's Vestment (Gladiator)
    T(a[13585], t[1847]); -- Notorious Gladiator's Vestment (Elite)
    T(a[13585], t[1857]); -- Notorious Aspirant's Leathers (Aspirant)
    T(a[13585], t[1852]); -- Notorious Gladiator's Leathers (Gladiator)
    T(a[13585], t[1853]); -- Notorious Gladiator's Leathers (Elite)
    T(a[13585], t[1874]); -- Notorious Aspirant's Plate (Aspirant)
    T(a[13585], t[1879]); -- Notorious Gladiator's Plate (Gladiator)
    T(a[13585], t[1878]); -- Notorious Gladiator's Plate (Elite)
    T(a[13585], t[1880]); -- Notorious Aspirant's Chain (Aspirant)
    T(a[13585], t[1885]); -- Notorious Gladiator's Chain (Gladiator)
    T(a[13585], t[1884]); -- Notorious Gladiator's Chain (Elite)
    T(a[13585], t[1892]); -- Notorious Aspirant's Vestment (Aspirant)
    T(a[13585], t[1897]); -- Notorious Gladiator's Vestment (Gladiator)
    T(a[13585], t[1896]); -- Notorious Gladiator's Vestment (Elite)
    T(a[13585], t[1886]); -- Notorious Aspirant's Leathers (Aspirant)
    T(a[13585], t[1891]); -- Notorious Gladiator's Leathers (Gladiator)
    T(a[13585], t[1890]); -- Notorious Gladiator's Leathers (Elite)
    a[13623] = b:New(13623, 5); -- Fighting on Two Fronts
    a[13624] = b:New(13624, 10); -- Keep DPS-ing and Nobody Explodes
    a[13625] = b:New(13625, 10); -- Mighty Minions of Mechagon
    a[13626] = b:New(13626, 10); -- Nautical Nuisances of Nazjatar
    a[13627] = b:New(13627, 5); -- Pet Battle Challenge: Stratholme
    a[13628] = b:New(13628, 10); -- Intro to Marine Biology
    a[13629] = b:New(13629, 10); -- Simple Geometry
    a[13630] = b:New(13630, 0); -- Notorious Gladiator: Battle for Azeroth Season 3
    O(a[13630], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13632] = b:New(13632, 0); -- Notorious Gladiator's Proto-Drake
    O(a[13632], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13633] = b:New(13633, 10); -- If It Pleases the Court
    a[13634] = b:New(13634, 0); -- Challenger: Battle for Azeroth Season 3
    O(a[13634], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13635] = b:New(13635, 10); -- Tour of the Depths
    a[13638] = b:New(13638, 20); -- Undersea Usurper
    a[13639] = b:New(13639, 0); -- Combatant: Battle for Azeroth Season 3
    O(a[13639], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13641] = b:New(13641, 0); -- Rival: Battle for Azeroth Season 3
    O(a[13641], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13642] = b:New(13642, 0); -- Duelist: Battle for Azeroth Season 3
    O(a[13642], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13643] = b:New(13643, 0, fac.Alliance, 13644); -- Hero of the Alliance: Notorious
    O(a[13643], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13644] = b:New(13644, 0, fac.Horde, 13643); -- Hero of the Horde: Notorious
    O(a[13644], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13645] = b:New(13645, 10, fac.Horde, 13704); -- Nautical Battlefield Training
    a[13647] = b:New(13647, 0); -- Gladiator: Battle for Azeroth Season 3
    O(a[13647], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13676] = b:New(13676, 0); -- Elite: Battle for Azeroth Season 3
    O(a[13676], "From", "PvP Season", 28, "Until", "PvP Season", 28);
    a[13684] = b:New(13684, 10); -- You and What Army?
    a[13686] = b:New(13686, 10); -- Junkyard Melomaniac
    a[13687] = b:New(13687, 25); -- Glory of the Eternal Raider
    a[13690] = b:New(13690, 10); -- Nazjatarget Eliminated
    a[13691] = b:New(13691, 10); -- I Thought You Said They'd Be Rare?
    a[13692] = b:New(13692, 10); -- Give Me the Biggest Bag You've Got
    a[13693] = b:New(13693, 5); -- Mecha-Safari
    a[13694] = b:New(13694, 5); -- Nazjatari Safari
    a[13695] = b:New(13695, 10); -- Team Aquashock
    a[13696] = b:New(13696, 10); -- Scrappy's Best Friend
    a[13698] = b:New(13698, 10); -- Clean Up On Aisle Mechagon
    a[13699] = b:New(13699, 10); -- Periodic Destruction
    a[13700] = b:New(13700, 10, fac.Horde); -- The Mechagonian Threat
    a[13701] = b:New(13701, 0); -- Battlefield Brawler
    a[13702] = b:New(13702, 0); -- Battlefield Tactician
    a[13703] = b:New(13703, 0); -- Battlefield Master
    a[13704] = b:New(13704, 10, fac.Alliance, 13645); -- Nautical Battlefield Training
    a[13706] = b:New(13706, 10); -- Stay Positive
    a[13707] = b:New(13707, 5); -- Mrrl's Secret Stash
    a[13708] = b:New(13708, 10); -- Most Minis Wins
    a[13709] = b:New(13709, 10, fac.Horde, 13710); -- Unfathomable
    a[13710] = b:New(13710, 10, fac.Alliance, 13709); -- Sunken Ambitions
    a[13711] = b:New(13711, 10); -- A Fistful of Manapearls
    a[13712] = b:New(13712, 10); -- Explore Nazjatar
    a[13713] = b:New(13713, 5); -- Nothing To Scry About
    a[13715] = b:New(13715, 10); -- From The Belly Of The Jelly
    a[13716] = b:New(13716, 10); -- Lactose Intolerant
    a[13718] = b:New(13718, 10); -- The Grand Reception
    a[13719] = b:New(13719, 10); -- Depths of the Devoted
    a[13720] = b:New(13720, 10); -- Supplying the Assassins
    a[13722] = b:New(13722, 5); -- Terror of the Tadpoles
    a[13723] = b:New(13723, 10); -- "M.C., Hammered"
    a[13724] = b:New(13724, 10); -- A Smack of Jellyfish
    a[13725] = b:New(13725, 10); -- The Circle of Stars
    a[13726] = b:New(13726, 10); -- Mythic: Abyssal Commander Sivara
    a[13727] = b:New(13727, 10); -- Mythic: Radiance of Azshara
    a[13728] = b:New(13728, 10); -- Mythic: Blackwater Behemoth
    a[13729] = b:New(13729, 10); -- Mythic: Lady Ashvane
    a[13730] = b:New(13730, 10); -- Mythic: Orgozoa
    a[13731] = b:New(13731, 10); -- Mythic: The Queen's Court
    a[13732] = b:New(13732, 10); -- Mythic: Za'qul
    a[13733] = b:New(13733, 10); -- Mythic: Queen Azshara
    a[13735] = b:New(13735, 10, fac.Horde, 13737); -- Heroic: War is Hell
    a[13737] = b:New(13737, 10, fac.Alliance, 13735); -- Heroic: War is Hell
    a[13738] = b:New(13738, 10, fac.Horde, 13739); -- Heroic: Tour of War
    a[13739] = b:New(13739, 10, fac.Alliance, 13738); -- Heroic: Tour of War
    a[13743] = b:New(13743, 5, fac.Alliance, 13746); -- Seasoned: Hunter Akana
    a[13744] = b:New(13744, 5, fac.Alliance, 13747); -- Seasoned: Bladesman Inowari
    a[13745] = b:New(13745, 5, fac.Alliance, 13748); -- Seasoned: Farseer Ori
    a[13746] = b:New(13746, 5, fac.Horde, 13743); -- Seasoned: Neri Sharpfin
    a[13747] = b:New(13747, 5, fac.Horde, 13744); -- Seasoned: Poen Gillbrack
    a[13748] = b:New(13748, 5, fac.Horde, 13745); -- Seasoned: Vim Brineheart
    a[13749] = b:New(13749, 5, fac.Horde, 13753); -- Veteran: Neri Sharpfin
    a[13750] = b:New(13750, 5, fac.Horde, 13758); -- Battle-Scarred: Neri Sharpfin
    a[13751] = b:New(13751, 5, fac.Horde, 13754); -- Veteran: Poen Gillbrack
    a[13752] = b:New(13752, 5, fac.Horde, 13755); -- Veteran: Vim Brineheart
    a[13753] = b:New(13753, 5, fac.Alliance, 13749); -- Veteran: Hunter Akana
    a[13754] = b:New(13754, 5, fac.Alliance, 13751); -- Veteran: Bladesman Inowari
    a[13755] = b:New(13755, 5, fac.Alliance, 13752); -- Veteran: Farseer Ori
    a[13756] = b:New(13756, 5, fac.Horde, 13759); -- Battle-Scarred: Poen Gillbrack
    a[13757] = b:New(13757, 5, fac.Horde, 13760); -- Battle-Scarred: Vim Brineheart
    a[13758] = b:New(13758, 5, fac.Alliance, 13750); -- Battle-Scarred: Hunter Akana
    a[13759] = b:New(13759, 5, fac.Alliance, 13756); -- Battle-Scarred: Bladesman Inowari
    a[13760] = b:New(13760, 5, fac.Alliance, 13757); -- Battle-Scarred: Farseer Ori
    a[13761] = b:New(13761, 10, fac.Horde, 13762); -- Aqua Team Murder Force
    a[13762] = b:New(13762, 10, fac.Alliance, 13761); -- Aqua Team Murder Force
    a[13763] = b:New(13763, 10); -- Back to the Depths!
    a[13764] = b:New(13764, 10); -- Puzzle Performer
    a[13765] = b:New(13765, 10); -- Subaquatic Support
    a[13766] = b:New(13766, 10); -- Malowned
    a[13767] = b:New(13767, 10); -- Fun Run
    a[13768] = b:New(13768, 10); -- The Best of Us
    a[13769] = b:New(13769, 10); -- Power Up
    a[13770] = b:New(13770, 10); -- Power Creep
    a[13771] = b:New(13771, 10); -- Power Is Beautiful
    a[13772] = b:New(13772, 10); -- Essence Essentials
    a[13773] = b:New(13773, 10); -- Essence Gains
    a[13775] = b:New(13775, 10); -- Essence Overload
    a[13776] = b:New(13776, 10); -- Explore Mechagon
    a[13777] = b:New(13777, 10); -- My Heart Container is Full
    a[13779] = b:New(13779, 0); -- Phenomenal Cosmic Power
    O(a[13779], "From", "Version", "080200", "Before", "Version", "090001");
    a[13780] = b:New(13780, 0); -- Battle for Azeroth Keystone Conqueror: Season Three
    O(a[13780], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3);
    a[13781] = b:New(13781, 0); -- Battle for Azeroth Keystone Master: Season Three
    O(a[13781], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3);
    a[13784] = b:New(13784, 0); -- Ahead of the Curve: Queen Azshara
    O(a[13784], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3);
    a[13785] = b:New(13785, 0); -- Cutting Edge: Queen Azshara
    O(a[13785], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3);
    a[13789] = b:New(13789, 0); -- Hertz Locker
    a[13790] = b:New(13790, 5); -- Armed for Action
    a[13791] = b:New(13791, 10); -- Making the Mount
    a[13836] = b:New(13836, 5); -- Feline Figurines Found
    a[13878] = b:New(13878, 10); -- The Master of Revendreth
    a[13917] = b:New(13917, 0); -- WoW's 15th Anniversary
    O(a[13917]);
    a[13924] = b:New(13924, 10, fac.Horde, 13925); -- The Fourth War
    a[13925] = b:New(13925, 10, fac.Alliance, 13924); -- The Fourth War
    a[13927] = b:New(13927, 0); -- Crashin' Splashin'
    a[13928] = b:New(13928, 10, fac.Alliance, 13930); -- Alterac Valley of Olde
    a[13930] = b:New(13930, 10, fac.Horde, 13928); -- Alterac Valley of Olde
    a[13931] = b:New(13931, 0); -- "Memories of Fel, Frost and Fire"
    O(a[13931]);
    a[13957] = b:New(13957, 0); -- Corrupted Gladiator: Battle for Azeroth Season 4
    O(a[13957], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13958] = b:New(13958, 0); -- Corrupted Gladiator's Proto-Drake
    O(a[13958], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13959] = b:New(13959, 0); -- Challenger: Battle for Azeroth Season 4
    O(a[13959], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13962] = b:New(13962, 0); -- Combatant: Battle for Azeroth Season 4
    O(a[13962], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13963] = b:New(13963, 0); -- Rival: Battle for Azeroth Season 4
    O(a[13963], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13964] = b:New(13964, 0); -- Duelist: Battle for Azeroth Season 4
    O(a[13964], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13965] = b:New(13965, 0, fac.Horde, 13966); -- Hero of the Horde: Corrupted
    O(a[13965], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13966] = b:New(13966, 0, fac.Alliance, 13965); -- Hero of the Alliance: Corrupted
    O(a[13966], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13967] = b:New(13967, 0); -- Gladiator: Battle for Azeroth Season 4
    O(a[13967], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13989] = b:New(13989, 0); -- Elite: Battle for Azeroth Season 4
    O(a[13989], "From", "PvP Season", 29, "Until", "PvP Season", 29);
    a[13990] = b:New(13990, 10); -- "You Can Pet the Dog, But..."
    a[13994] = b:New(13994, 20); -- Through the Depths of Visions
    a[13998] = b:New(13998, 10); -- Pure of Heart
    a[13999] = b:New(13999, 10); -- How? Isn't it Obelisk?
    a[14002] = b:New(14002, 10, fac.Horde); -- Heritage of the Vulpera
    a[14008] = b:New(14008, 10); -- Mana Sponge
    a[14013] = b:New(14013, 10, fac.Alliance); -- Allied Races: Mechagnome
    a[14014] = b:New(14014, 10, fac.Alliance); -- Heritage of the Mechagnome
    a[14019] = b:New(14019, 10); -- Smoke Test
    a[14020] = b:New(14020, 5); -- Pet Battle Challenge: Blackrock Depths
    a[14021] = b:New(14021, 10); -- The Shadows Revealed
    a[14023] = b:New(14023, 10); -- Realizing Your Potential
    a[14024] = b:New(14024, 10); -- Buzzer Beater
    a[14026] = b:New(14026, 10); -- Temper Tantrum
    a[14027] = b:New(14027, 0); -- Battle for Mrrglroth
    a[14037] = b:New(14037, 10); -- Phase 3: Prophet
    a[14038] = b:New(14038, 10); -- Bloody Mess
    a[14041] = b:New(14041, 10); -- "Mythic: Wrathion, the Black Emperor"
    a[14043] = b:New(14043, 10); -- Mythic: Maut
    a[14044] = b:New(14044, 10); -- Mythic: The Prophet Skitra
    a[14045] = b:New(14045, 10); -- Mythic: Dark Inquisitor Xanesh
    a[14046] = b:New(14046, 10); -- Mythic: The Hivemind
    a[14048] = b:New(14048, 10); -- Mythic: Shad'har the Insatiable
    a[14049] = b:New(14049, 10); -- Mythic: Drest'agath
    a[14050] = b:New(14050, 10); -- Mythic: Vexiona
    a[14051] = b:New(14051, 10); -- Mythic: Ra-den the Despoiled
    a[14052] = b:New(14052, 10); -- "Mythic: Il'gynoth, Corruption Reborn"
    a[14054] = b:New(14054, 10); -- Mythic: Carapace of N'Zoth
    a[14055] = b:New(14055, 10); -- Mythic: N'Zoth the Corruptor
    a[14058] = b:New(14058, 10); -- All Eyes On Me
    T(a[14058], t[1983]); -- Cosmic Aberration's Plate (Raid Finder)
    T(a[14058], t[1982]); -- Cosmic Aberration's Plate (Normal)
    T(a[14058], t[1984]); -- Cosmic Aberration's Plate (Heroic)
    T(a[14058], t[1985]); -- Cosmic Aberration's Plate (Mythic)
    T(a[14058], t[1987]); -- Lurking Defiler's Scalemail (Raid Finder)
    T(a[14058], t[1986]); -- Lurking Defiler's Scalemail (Normal)
    T(a[14058], t[1988]); -- Lurking Defiler's Scalemail (Heroic)
    T(a[14058], t[1989]); -- Lurking Defiler's Scalemail (Mythic)
    T(a[14058], t[1995]); -- Oblivion Cultist's Robes (Raid Finder)
    T(a[14058], t[1994]); -- Oblivion Cultist's Robes (Normal)
    T(a[14058], t[1996]); -- Oblivion Cultist's Robes (Heroic)
    T(a[14058], t[1997]); -- Oblivion Cultist's Robes (Mythic)
    T(a[14058], t[1991]); -- Treacherous Schemer's Leathers (Raid Finder)
    T(a[14058], t[1990]); -- Treacherous Schemer's Leathers (Normal)
    T(a[14058], t[1992]); -- Treacherous Schemer's Leathers (Heroic)
    T(a[14058], t[1993]); -- Treacherous Schemer's Leathers (Mythic)
    a[14059] = b:New(14059, 10); -- The Eyes Have It
    T(a[14059], t[1951]); -- Corrupted Gladiator's Plate (Gladiator)
    T(a[14059], t[1950]); -- Corrupted Gladiator's Plate (Elite)
    T(a[14059], t[1972]); -- Corrupted Gladiator's Plate (Elite)
    T(a[14059], t[1957]); -- Corrupted Gladiator's Chain (Gladiator)
    T(a[14059], t[1956]); -- Corrupted Gladiator's Chain (Elite)
    T(a[14059], t[1973]); -- Corrupted Gladiator's Chain (Elite)
    T(a[14059], t[1963]); -- Corrupted Gladiator's Leathers (Gladiator)
    T(a[14059], t[1962]); -- Corrupted Gladiator's Leathers (Elite)
    T(a[14059], t[1974]); -- Corrupted Gladiator's Leathers (Elite)
    T(a[14059], t[1969]); -- Corrupted Gladiator's Vestment (Gladiator)
    T(a[14059], t[1968]); -- Corrupted Gladiator's Vestment (Elite)
    T(a[14059], t[1975]); -- Corrupted Gladiator's Vestment (Elite)
    a[14060] = b:New(14060, 10); -- Unwavering Resolve
    a[14061] = b:New(14061, 10); -- We Have the Technology
    a[14062] = b:New(14062, 5); -- Horrific Vision of Stormwind
    a[14063] = b:New(14063, 5); -- Horrific Vision of Orgrimmar
    a[14064] = b:New(14064, 10); -- The Even More Horrific Vision of Stormwind
    a[14065] = b:New(14065, 10); -- The Even More Horrific Vision of Orgrimmar
    a[14066] = b:New(14066, 15); -- The Most Horrific Vision of Stormwind
    a[14067] = b:New(14067, 15); -- The Most Horrific Vision of Orgrimmar
    a[14068] = b:New(14068, 0); -- Ahead of the Curve: N'Zoth the Corruptor
    O(a[14068], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4);
    a[14069] = b:New(14069, 0); -- Cutting Edge: N'Zoth the Corruptor
    O(a[14069], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4);
    a[14139] = b:New(14139, 10); -- Total Annihilation
    a[14140] = b:New(14140, 0); -- Mad World
    O(a[14140], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4);
    a[14143] = b:New(14143, 10); -- Reeking of Visions
    a[14144] = b:New(14144, 0); -- Battle for Azeroth Keystone Conqueror: Season Four
    O(a[14144], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4);
    a[14145] = b:New(14145, 0); -- Battle for Azeroth Keystone Master: Season Four
    O(a[14145], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4);
    a[14146] = b:New(14146, 25); -- Glory of the Ny'alotha Raider
    a[14147] = b:New(14147, 10); -- Cleansing Treatment
    a[14148] = b:New(14148, 10); -- It's Not A Cult
    a[14149] = b:New(14149, 10, fac.Horde, 14150); -- Heroic: War for the Shore
    a[14150] = b:New(14150, 10, fac.Alliance, 14149); -- Heroic: War for the Shore
    a[14153] = b:New(14153, 5); -- Uldum Under Assault
    a[14154] = b:New(14154, 5); -- Defend the Vale
    a[14155] = b:New(14155, 5); -- Uldum Accord
    a[14156] = b:New(14156, 5); -- The Rajani
    a[14157] = b:New(14157, 10); -- The Corruptor's End
    a[14158] = b:New(14158, 10); -- It's Not A Tumor!
    a[14159] = b:New(14159, 10); -- Combating the Corruption
    a[14160] = b:New(14160, 10); -- Rare to Well Done
    a[14161] = b:New(14161, 5); -- All Consuming
    a[14162] = b:New(14162, 10); -- Horrific Masquerade
    a[14164] = b:New(14164, 10); -- "Awaken, Ardenweald"
    a[14165] = b:New(14165, 5); -- Masked Soliloquy
    a[14166] = b:New(14166, 5); -- Masked Duet
    a[14167] = b:New(14167, 5); -- Masked Trio
    a[14168] = b:New(14168, 5); -- Masked Quartet
    a[14169] = b:New(14169, 10); -- Symphony of Masks
    a[14170] = b:New(14170, 5); -- Thanks For The Mementos
    a[14171] = b:New(14171, 10); -- Memento Mori
    a[14172] = b:New(14172, 10); -- A Monumental Amount of Mementos
    a[14173] = b:New(14173, 20); -- A Mountain of Mementos
    a[14175] = b:New(14175, 10); -- Master of Deepwind Gorge
    a[14183] = b:New(14183, 0); -- Conspicuous Consumption
    O(a[14183], "From", "Version", "080300", "Before", "Version", "090001");
    a[14186] = b:New(14186, 20); -- Market Dominance
    a[14187] = b:New(14187, 20); -- Cruisin' for a Brewsin'
    a[14188] = b:New(14188, 20); -- Well Gorged
    a[14191] = b:New(14191, 0); -- Servant of N'Zoth
    a[14193] = b:New(14193, 10); -- Vision of Destiny
    a[14194] = b:New(14194, 10); -- Halls of Devotion
    a[14195] = b:New(14195, 10); -- Gift of Flesh
    a[14196] = b:New(14196, 10); -- The Waking Dream
    a[14197] = b:New(14197, 10); -- Sanguine Depths
    a[14198] = b:New(14198, 10); -- Heroic: Sanguine Depths
    a[14199] = b:New(14199, 10); -- Mythic: Sanguine Depths
    a[14206] = b:New(14206, 10); -- Blade of the Primus
    a[14222] = b:New(14222, 10); -- Exile's Reach
    a[14233] = b:New(14233, 10); -- Tea Tales
    a[14271] = b:New(14271, 0); -- WoW's 16th Anniversary
    O(a[14271]);
    a[14272] = b:New(14272, 5); -- Best Bud With Benefits
    a[14273] = b:New(14273, 5); -- Crypt Kicker
    a[14274] = b:New(14274, 5); -- Absolution for All
    a[14276] = b:New(14276, 5); -- It's Always Sinny in Revendreth
    a[14277] = b:New(14277, 15); -- The Accuser's Avowed
    a[14280] = b:New(14280, 10); -- Loremaster of Shadowlands
    a[14281] = b:New(14281, 10); -- The Path to Ascension
    a[14283] = b:New(14283, 0); -- Heroic Edition: Ensorcelled Everwyrm
    a[14284] = b:New(14284, 10); -- Breaking Bad
    a[14285] = b:New(14285, 10); -- Ready for Raiding VII
    a[14286] = b:New(14286, 10); -- Residue Evil
    a[14289] = b:New(14289, 10); -- Kaal-ed Shot
    a[14290] = b:New(14290, 10); -- I Only Have Eyes For You
    a[14291] = b:New(14291, 10); -- Someone Could Trip on These!
    a[14292] = b:New(14292, 10); -- Riding with my Slimes
    a[14293] = b:New(14293, 10); -- Blind as a Bat
    a[14294] = b:New(14294, 10); -- Dirtflap's Revenge
    a[14295] = b:New(14295, 10); -- Bountiful Harvest
    a[14296] = b:New(14296, 10); -- Going Viral
    a[14297] = b:New(14297, 10); -- Three Choose One
    a[14303] = b:New(14303, 10); -- Explore Bastion
    a[14304] = b:New(14304, 10); -- Explore Ardenweald
    a[14305] = b:New(14305, 10); -- Explore Maldraxxus
    a[14306] = b:New(14306, 10); -- Explore Revendreth
    a[14307] = b:New(14307, 10); -- Adventurer of Bastion
    a[14308] = b:New(14308, 10); -- Adventurer of Maldraxxus
    a[14309] = b:New(14309, 10); -- Adventurer of Ardenweald
    a[14310] = b:New(14310, 10); -- Adventurer of Revendreth
    a[14311] = b:New(14311, 10); -- Treasures of Bastion
    a[14312] = b:New(14312, 10); -- Treasures of Maldraxxus
    a[14313] = b:New(14313, 10); -- Treasures of Ardenweald
    a[14314] = b:New(14314, 10); -- Treasures of Revendreth
    a[14315] = b:New(14315, 10); -- Shadowlands Diplomat
    a[14320] = b:New(14320, 10); -- Surgeon's Supplies
    a[14322] = b:New(14322, 25); -- Glory of the Shadowlands Hero
    a[14323] = b:New(14323, 10); -- ExSPEARiential
    a[14324] = b:New(14324, 10); -- Heroic: Spires of Ascension
    a[14325] = b:New(14325, 10); -- Mythic: Spires of Ascension
    a[14326] = b:New(14326, 10); -- Spires of Ascension
    a[14327] = b:New(14327, 10); -- I Can See My House From Here
    a[14328] = b:New(14328, 10); -- Professional Shadowlands Master
    a[14329] = b:New(14329, 10); -- Working the Afterlife
    a[14330] = b:New(14330, 50); -- Shadowlands Master of All
    a[14331] = b:New(14331, 10); -- Goliath Offline
    a[14332] = b:New(14332, 10); -- Shadowlands Cook
    a[14333] = b:New(14333, 10); -- Shadowlands Fisherman
    a[14334] = b:New(14334, 10); -- Into the Maw
    a[14335] = b:New(14335, 5); -- The Ascended
    a[14336] = b:New(14336, 5); -- Undying Army
    a[14337] = b:New(14337, 5); -- The Wild Hunt
    a[14338] = b:New(14338, 5); -- Court of Harvesters
    a[14339] = b:New(14339, 10); -- Shard Labor
    a[14347] = b:New(14347, 10); -- Full Gores Meal
    a[14352] = b:New(14352, 10); -- Nobody Puts Denathrius in a Corner
    a[14353] = b:New(14353, 5); -- Ardenweald's a Stage
    a[14354] = b:New(14354, 10); -- Highly Communicable
    a[14355] = b:New(14355, 25); -- Glory of the Nathria Raider
    a[14356] = b:New(14356, 10); -- Mythic: Shriekwing
    a[14357] = b:New(14357, 10); -- Mythic: Huntsman Altimor
    a[14358] = b:New(14358, 10); -- Mythic: Hungering Destroyer
    a[14359] = b:New(14359, 10); -- Mythic: Artificer Xy'mox
    a[14360] = b:New(14360, 10); -- Mythic: Sun King's Salvation
    a[14361] = b:New(14361, 10); -- Mythic: Lady Inerva Darkvein
    a[14362] = b:New(14362, 10); -- Mythic: The Council of Blood
    a[14363] = b:New(14363, 10); -- Mythic: Sludgefist
    a[14364] = b:New(14364, 10); -- Mythic: Stone Legion Generals
    a[14365] = b:New(14365, 10); -- Mythic: Sire Denathrius
    a[14366] = b:New(14366, 10); -- The Necrotic Wake
    a[14367] = b:New(14367, 10); -- Heroic: The Necrotic Wake
    a[14368] = b:New(14368, 10); -- Mythic: The Necrotic Wake
    a[14369] = b:New(14369, 10); -- Plaguefall
    a[14370] = b:New(14370, 10); -- Halls of Atonement
    a[14371] = b:New(14371, 10); -- Mists of Tirna Scithe
    a[14372] = b:New(14372, 10); -- Theater of Pain
    a[14373] = b:New(14373, 10); -- De Other Side
    a[14374] = b:New(14374, 10); -- Couple's Therapy
    a[14375] = b:New(14375, 10); -- Hunger for Knowledge
    a[14376] = b:New(14376, 10); -- Feed the Beast
    a[14408] = b:New(14408, 10); -- Heroic: De Other Side
    a[14409] = b:New(14409, 10); -- Mythic: De Other Side
    a[14410] = b:New(14410, 10); -- Heroic: Halls of Atonement
    a[14411] = b:New(14411, 10); -- Mythic: Halls of Atonement
    a[14412] = b:New(14412, 10); -- Heroic: Mists of Tirna Scithe
    a[14413] = b:New(14413, 10); -- Mythic: Mists of Tirna Scithe
    a[14414] = b:New(14414, 10); -- Heroic: Plaguefall
    a[14415] = b:New(14415, 10); -- Mythic: Plaguefall
    a[14416] = b:New(14416, 10); -- Heroic: Theater of Pain
    a[14417] = b:New(14417, 10); -- Mythic: Theater of Pain
    a[14418] = b:New(14418, 20); -- Shadowlands Dungeon Hero
    a[14460] = b:New(14460, 0); -- Ahead of the Curve: Sire Denathrius
    O(a[14460], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5);
    a[14461] = b:New(14461, 0); -- Cutting Edge: Sire Denathrius
    O(a[14461], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5);
    a[14463] = b:New(14463, 10); -- Skoldus Hall
    a[14468] = b:New(14468, 10); -- Twisting Corridors: Layer 1
    a[14469] = b:New(14469, 10); -- Twisting Corridors: Layer 2
    a[14470] = b:New(14470, 10); -- Twisting Corridors: Layer 3
    a[14471] = b:New(14471, 10); -- Twisting Corridors: Layer 4
    a[14472] = b:New(14472, 10); -- Twisting Corridors: Layer 5
    a[14473] = b:New(14473, 10); -- Fracture Chambers
    a[14478] = b:New(14478, 10); -- The Soulforges
    a[14483] = b:New(14483, 10); -- Coldheart Interstitia
    a[14488] = b:New(14488, 10); -- Mort'regar
    a[14493] = b:New(14493, 10); -- The Upper Reaches
    a[14498] = b:New(14498, 10); -- Gatekeepers of Torghast
    a[14499] = b:New(14499, 5); -- Phanciful
    a[14500] = b:New(14500, 5); -- Phantastic
    a[14501] = b:New(14501, 5); -- Phanatical
    a[14502] = b:New(14502, 10); -- Pursuing Loyalty
    a[14503] = b:New(14503, 10); -- Hooked On Hydroponics
    a[14504] = b:New(14504, 0); -- "Niya, As Xavius"
    a[14505] = b:New(14505, 0); -- "Senthii, As Gul'dan"
    a[14506] = b:New(14506, 0); -- "Glimmerdust, As Kil'jaeden"
    a[14507] = b:New(14507, 0); -- "Mi'kai, As Argus"
    a[14508] = b:New(14508, 0); -- "Glimmerdust, As Jaina"
    a[14509] = b:New(14509, 0); -- "Astra, As Azshara"
    a[14510] = b:New(14510, 0); -- "Dreamweaver, As N'Zoth"
    a[14511] = b:New(14511, 10); -- Tour of Duty: Ardenweald
    a[14512] = b:New(14512, 10); -- Tour of Duty: Revendreth
    a[14513] = b:New(14513, 10); -- Tour of Duty: Maldraxxus
    a[14514] = b:New(14514, 10); -- Tour of Duty: Bastion
    a[14515] = b:New(14515, 5); -- Zo'Sorg's Bidding
    a[14516] = b:New(14516, 20); -- Impressing Zo'Sorg
    a[14519] = b:New(14519, 10); -- Covenant Combat
    a[14523] = b:New(14523, 10); -- Taking Care of Business
    a[14524] = b:New(14524, 10); -- I Don't Know What I Expected
    a[14525] = b:New(14525, 10); -- "Feed Me, Seymour!"
    a[14531] = b:New(14531, 0); -- Shadowlands Keystone Conqueror: Season One
    O(a[14531], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5);
    a[14532] = b:New(14532, 0); -- Shadowlands Keystone Master: Season One
    O(a[14532], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5);
    a[14533] = b:New(14533, 10); -- Royal Rumble
    a[14567] = b:New(14567, 10); -- Picking Up the Pieces
    a[14568] = b:New(14568, 10); -- Twisting Corridors: Layer 6
    a[14569] = b:New(14569, 10); -- Twisting Corridors: Layer 7
    a[14570] = b:New(14570, 10); -- Twisting Corridors: Layer 8
    a[14606] = b:New(14606, 10); -- Thinking with...
    a[14607] = b:New(14607, 10); -- Fresh Meat!
    a[14608] = b:New(14608, 10); -- Burning Bright
    a[14610] = b:New(14610, 10); -- Clear Conscience
    a[14614] = b:New(14614, 10); -- Castle Vain
    T(a[14614], t[2151]); -- Grand Sentinel's Greatplate (Raid Finder)
    T(a[14614], t[2150]); -- Grand Sentinel's Greatplate (Normal)
    T(a[14614], t[2152]); -- Grand Sentinel's Greatplate (Heroic)
    T(a[14614], t[2153]); -- Grand Sentinel's Greatplate (Mythic)
    T(a[14614], t[2155]); -- Inexorable Castigator's Guise (Raid Finder)
    T(a[14614], t[2154]); -- Inexorable Castigator's Guise (Normal)
    T(a[14614], t[2156]); -- Inexorable Castigator's Guise (Heroic)
    T(a[14614], t[2157]); -- Inexorable Castigator's Guise (Mythic)
    T(a[14614], t[2159]); -- Depraved Beguiler's Visage (Raid Finder)
    T(a[14614], t[2158]); -- Depraved Beguiler's Visage (Normal)
    T(a[14614], t[2160]); -- Depraved Beguiler's Visage (Heroic)
    T(a[14614], t[2161]); -- Depraved Beguiler's Visage (Mythic)
    T(a[14614], t[2163]); -- Sin Slayer's Leathers (Raid Finder)
    T(a[14614], t[2162]); -- Sin Slayer's Leathers (Normal)
    T(a[14614], t[2164]); -- Sin Slayer's Leathers (Heroic)
    T(a[14614], t[2165]); -- Sin Slayer's Leathers (Mythic)
    a[14617] = b:New(14617, 10); -- Private Stock
    a[14619] = b:New(14619, 10); -- Pour Decision Making
    a[14625] = b:New(14625, 10); -- Battle in the Shadowlands
    a[14626] = b:New(14626, 5); -- Harvester of Sorrow
    a[14627] = b:New(14627, 10); -- Choosing Your Purpose
    a[14628] = b:New(14628, 10); -- The Road to Renown
    a[14629] = b:New(14629, 10); -- Gaining Respect
    a[14630] = b:New(14630, 10); -- Becoming a Hero
    a[14631] = b:New(14631, 10); -- Champion of the Covenant
    a[14632] = b:New(14632, 10); -- Conducting Anima
    a[14633] = b:New(14633, 10); -- Master Navigator
    a[14634] = b:New(14634, 10); -- Nine Afterlives
    a[14636] = b:New(14636, 10); -- Adventurer in Chief
    a[14637] = b:New(14637, 10); -- Your Covenant's Flavor
    a[14638] = b:New(14638, 10); -- The Anima Must Flow
    a[14639] = b:New(14639, 10); -- Dedication to the Restoration
    a[14656] = b:New(14656, 10); -- Trading Partners
    a[14658] = b:New(14658, 10); -- Soulkeeper's Burden
    a[14659] = b:New(14659, 5); -- Handling His Henchmen
    a[14660] = b:New(14660, 10); -- It's About Sending a Message
    a[14662] = b:New(14662, 0, nil, nil, true); -- Realm First! Shadowlands Keystone Master
    O(a[14662], "Once");
    a[14663] = b:New(14663, 10); -- Explore The Maw
    a[14670] = b:New(14670, 10); -- That's the Spirit
    a[14671] = b:New(14671, 10); -- Something's Not Quite Right....
    a[14672] = b:New(14672, 10); -- "A Bit of This, A Bit of That"
    a[14675] = b:New(14675, 10); -- Spirit Talker
    a[14676] = b:New(14676, 15); -- Divine Spirit Savior
    a[14677] = b:New(14677, 5); -- Spiritual Observations
    a[14678] = b:New(14678, 10); -- Court Favors
    a[14679] = b:New(14679, 10); -- Party Palace
    a[14680] = b:New(14680, 10); -- Something for Everyone
    a[14681] = b:New(14681, 5); -- Dredger Academy
    a[14682] = b:New(14682, 5); -- The Party Herald
    a[14683] = b:New(14683, 5); -- Dredger Style
    a[14684] = b:New(14684, 10); -- Abominable Lives
    a[14685] = b:New(14685, 0); -- Combatant: Shadowlands Season 1
    O(a[14685], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14686] = b:New(14686, 0); -- Challenger: Shadowlands Season 1
    O(a[14686], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14687] = b:New(14687, 0); -- Rival: Shadowlands Season 1
    O(a[14687], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14688] = b:New(14688, 0); -- Duelist: Shadowlands Season 1
    O(a[14688], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14689] = b:New(14689, 0); -- Gladiator: Shadowlands Season 1
    O(a[14689], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14690] = b:New(14690, 0); -- Sinful Gladiator: Shadowlands Season 1
    O(a[14690], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14691] = b:New(14691, 0); -- Elite: Shadowlands Season 1
    O(a[14691], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14692] = b:New(14692, 0, fac.Alliance, 14693); -- Hero of the Alliance: Sinful
    O(a[14692], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14693] = b:New(14693, 0, fac.Horde, 14692); -- Hero of the Horde: Sinful
    O(a[14693], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14715] = b:New(14715, 10); -- Castle Nathria
    a[14717] = b:New(14717, 10); -- Heroic: Castle Nathria
    a[14718] = b:New(14718, 10); -- Mythic: Castle Nathria
    a[14721] = b:New(14721, 10); -- It's In The Mix
    a[14723] = b:New(14723, 5); -- Be Our Guest
    a[14724] = b:New(14724, 5); -- People Pleaser
    a[14725] = b:New(14725, 5); -- We Happy Few
    a[14726] = b:New(14726, 5); -- It's Certainly Never Boring
    a[14727] = b:New(14727, 5); -- Master of Ceremonies
    a[14728] = b:New(14728, 10); -- To All the Squirrels Through Time and Space
    a[14729] = b:New(14729, 10); -- To All the Squirrels I Love Despite Their Scars
    a[14730] = b:New(14730, 10); -- To All the Squirrels I Set Sail to See
    a[14731] = b:New(14731, 10); -- To All the Squirrels I've Loved and Lost
    a[14733] = b:New(14733, 10); -- In the Hot Seat
    a[14734] = b:New(14734, 5); -- Rallying Cry of the Ascended
    a[14735] = b:New(14735, 5); -- Flight School Graduate
    a[14737] = b:New(14737, 10); -- What Bastion Remembered
    a[14738] = b:New(14738, 10); -- Hunting Party
    a[14741] = b:New(14741, 5); -- Aerial Ace
    a[14742] = b:New(14742, 10); -- Who Sent You?
    a[14743] = b:New(14743, 5); -- Deadly Serious
    a[14744] = b:New(14744, 10); -- Better to Be Lucky Than Dead
    a[14745] = b:New(14745, 10); -- Grand Theft Shadehound
    a[14746] = b:New(14746, 10); -- Prepare for Trouble!
    a[14747] = b:New(14747, 10); -- Make it Double!
    a[14748] = b:New(14748, 10); -- Wardrobe Makeover
    a[14749] = b:New(14749, 5); -- Rendle's Big Day
    a[14750] = b:New(14750, 0); -- Death Rising
    O(a[14750], "From", "Version", "090001", "Until", "Version", "090001");
    a[14751] = b:New(14751, 15); -- The Gang's All Here
    a[14752] = b:New(14752, 15); -- Things To Do When You're Dead
    a[14753] = b:New(14753, 5); -- It's a Wrap
    a[14754] = b:New(14754, 10); -- The Forgotten One
    a[14755] = b:New(14755, 10); -- Legendary Accord
    a[14758] = b:New(14758, 10); -- The World Beyond
    a[14759] = b:New(14759, 5); -- It's Coming Back to Me...
    a[14760] = b:New(14760, 10); -- Recollection Collection
    a[14761] = b:New(14761, 10); -- Deciphering Death's Intentions
    a[14762] = b:New(14762, 5); -- Breaking the Stratus Fear
    a[14763] = b:New(14763, 10); -- Crypt Couture
    a[14764] = b:New(14764, 10); -- The Great Luckydo
    a[14765] = b:New(14765, 10); -- Ramparts Racer
    a[14766] = b:New(14766, 10); -- Parasoling
    a[14767] = b:New(14767, 10); -- Count Your Blessings
    a[14768] = b:New(14768, 10); -- What is that Melody?
    a[14769] = b:New(14769, 10); -- Bat!
    a[14770] = b:New(14770, 10); -- What We Ride in the Shadows
    a[14771] = b:New(14771, 10); -- The Afterlife Express
    a[14772] = b:New(14772, 5); -- Caught in a Bat Romance
    a[14773] = b:New(14773, 10); -- Explosive Extermination
    a[14774] = b:New(14774, 10); -- Ardenweald Gourmand
    a[14775] = b:New(14775, 5); -- Mush Appreciated
    a[14776] = b:New(14776, 10); -- For the Hoarder!
    a[14777] = b:New(14777, 25); -- Restoration Expert
    a[14778] = b:New(14778, 10); -- Extremely Ravenous
    a[14779] = b:New(14779, 10); -- Wild Hunting
    a[14780] = b:New(14780, 15); -- Meditation Master
    a[14782] = b:New(14782, 10); -- Level 50
    a[14783] = b:New(14783, 10); -- Level 60
    a[14788] = b:New(14788, 10); -- Fractured Faerie Tales
    a[14789] = b:New(14789, 15); -- All Spirits Great and Small
    a[14790] = b:New(14790, 10); -- Covenant Campaign
    a[14791] = b:New(14791, 5); -- Toss a Seed to Your Hunter...
    a[14795] = b:New(14795, 15); -- Clearing the Fog
    a[14796] = b:New(14796, 10); -- Superior
    a[14797] = b:New(14797, 10); -- Epic
    a[14798] = b:New(14798, 10); -- Sojourner of Revendreth
    a[14799] = b:New(14799, 10); -- Sojourner of Maldraxxus
    a[14800] = b:New(14800, 10); -- Sojourner of Ardenweald
    a[14801] = b:New(14801, 10); -- Sojourner of Bastion
    a[14802] = b:New(14802, 10); -- Bloodsport
    a[14808] = b:New(14808, 10); -- Touring Torghast
    a[14809] = b:New(14809, 10); -- Traversing Torghast
    a[14810] = b:New(14810, 10); -- Terror of Torghast
    a[14815] = b:New(14815, 10, fac.Horde, 14817); -- Executing the Exarch
    a[14816] = b:New(14816, 0); -- Sinful Gladiator's Soul Eater
    O(a[14816], "From", "PvP Season", 30, "Until", "PvP Season", 30);
    a[14817] = b:New(14817, 10, fac.Alliance, 14815); -- Opposing Orgrimmar
    a[14825] = b:New(14825, 25); -- Shadowlands Voyager
    a[14831] = b:New(14831, 10); -- "I Live, I Die, I Queue Again"
    T(a[14831], t[2177]); -- Sinful Aspirant's Plate (Aspirant)
    T(a[14831], t[2173]); -- Sinful Gladiator's Plate (Gladiator)
    T(a[14831], t[2169]); -- Sinful Gladiator's Plate (Elite)
    T(a[14831], t[2176]); -- Sinful Aspirant's Chain (Aspirant)
    T(a[14831], t[2172]); -- Sinful Gladiator's Chain (Gladiator)
    T(a[14831], t[2168]); -- Sinful Gladiator's Chain (Elite)
    T(a[14831], t[2174]); -- Sinful Aspirant's Vestment (Aspirant)
    T(a[14831], t[2170]); -- Sinful Gladiator's Vestment (Gladiator)
    T(a[14831], t[2166]); -- Sinful Gladiator's Vestment (Elite)
    T(a[14831], t[2175]); -- Sinful Aspirant's Leathers (Aspirant)
    T(a[14831], t[2171]); -- Sinful Gladiator's Leathers (Gladiator)
    T(a[14831], t[2167]); -- Sinful Gladiator's Leathers (Elite)
    a[14833] = b:New(14833, 10); -- Fashion Abomination
    a[14834] = b:New(14834, 10); -- Bound with Purpose
    a[14835] = b:New(14835, 10); -- A Resolute Bond
    a[14836] = b:New(14836, 10); -- Unwavering Bond
    a[14837] = b:New(14837, 10); -- Nexus of Bonds
    a[14839] = b:New(14839, 10); -- Adventures: Off To Adventure
    a[14840] = b:New(14840, 10); -- Adventures: Learning the Ropes
    a[14841] = b:New(14841, 10); -- Adventures: Now You're Cooking
    a[14842] = b:New(14842, 10); -- Adventures: Strength and Resilience
    a[14843] = b:New(14843, 10); -- Adventures: Harmony of Purpose
    a[14844] = b:New(14844, 10); -- Adventures: Into the Breach
    a[14845] = b:New(14845, 10); -- Adventures: A Step in the Right Direction
    a[14846] = b:New(14846, 10); -- Adventures: Leaves in the Forest
    a[14847] = b:New(14847, 10); -- Adventures: Protector of the Shadowlands
    a[14851] = b:New(14851, 5); -- Bastion of Protection
    a[14852] = b:New(14852, 5); -- The Hoot of the Issue
    a[14853] = b:New(14853, 5); -- All The Colors of the Painbow
    a[14854] = b:New(14854, 5); -- It's Not What You Wear
    a[14856] = b:New(14856, 5); -- "Charmed, I'm Sure"
    a[14857] = b:New(14857, 5); -- Itsy Bitsy Fighters
    a[14858] = b:New(14858, 5); -- Curse of Thirst
    a[14859] = b:New(14859, 5); -- Inside the Park Home Run
    a[14860] = b:New(14860, 5); -- Bare Necessities
    a[14861] = b:New(14861, 5); -- Learning from the Masters
    a[14862] = b:New(14862, 5); -- It's How You Wear It
    a[14863] = b:New(14863, 5); -- Death Foursworn
    a[14864] = b:New(14864, 5); -- Personal Nightmare
    a[14865] = b:New(14865, 5); -- Disciple of Humility
    a[14866] = b:New(14866, 5); -- Master of the Path
    a[14867] = b:New(14867, 5); -- Shadowlands Safari
    a[14868] = b:New(14868, 5); -- Aquatic Apparitions
    a[14869] = b:New(14869, 5); -- Beast Busters
    a[14870] = b:New(14870, 5); -- Creepy Critters
    a[14871] = b:New(14871, 5); -- Deathly Dragonkin
    a[14872] = b:New(14872, 5); -- Eerie Elementals
    a[14873] = b:New(14873, 5); -- Flickering Fliers
    a[14874] = b:New(14874, 5); -- Haunted Humanoids
    a[14875] = b:New(14875, 5); -- Mummified Magics
    a[14876] = b:New(14876, 5); -- Macabre Mechanicals
    a[14877] = b:New(14877, 5); -- Unholy Undead
    a[14879] = b:New(14879, 10); -- Family Exorcist
    a[14881] = b:New(14881, 10); -- Abhorrent Adversaries of the Afterlife
    a[14887] = b:New(14887, 0); -- To the Moon
    a[14894] = b:New(14894, 10); -- "To 'Ghast, Two Curios"
    a[14895] = b:New(14895, 10); -- 'Ghast Five
    a[14904] = b:New(14904, 0); -- Netherwhelp Online
    O(a[14904]);
    a[14931] = b:New(14931, 0); -- Flying Festivities
    a[14938] = b:New(14938, 0); -- Shadowlands Keystone Explorer: Season One
    O(a[14938], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5);
    a[14942] = b:New(14942, 0); -- WoW's 17th Anniversary
    O(a[14942]);
    a[14943] = b:New(14943, 10); -- Guarmageddon
    a[14961] = b:New(14961, 10); -- Chains of Domination
    a[14968] = b:New(14968, 0); -- Combatant I: Shadowlands Season 2
    O(a[14968], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14969] = b:New(14969, 0); -- Challenger I: Shadowlands Season 2
    O(a[14969], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14970] = b:New(14970, 0); -- Rival I: Shadowlands Season 2
    O(a[14970], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14971] = b:New(14971, 0); -- Duelist: Shadowlands Season 2
    O(a[14971], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14972] = b:New(14972, 0); -- Gladiator: Shadowlands Season 2
    O(a[14972], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14973] = b:New(14973, 0); -- Unchained Gladiator: Shadowlands Season 2
    O(a[14973], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14974] = b:New(14974, 0); -- Elite: Shadowlands Season 2
    O(a[14974], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14975] = b:New(14975, 0, fac.Alliance, 14976); -- Hero of the Alliance: Unchained
    O(a[14975], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14976] = b:New(14976, 0, fac.Horde, 14975); -- Hero of the Horde: Unchained
    O(a[14976], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[14998] = b:New(14998, 10); -- "Name A Better Duo, I'll Wait"
    a[14999] = b:New(14999, 0); -- Unchained Gladiator's Soul Eater
    O(a[14999], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[15000] = b:New(15000, 10); -- United Front
    a[15001] = b:New(15001, 5); -- Jailer's Personal Stash
    a[15003] = b:New(15003, 10); -- To the Nines
    a[15004] = b:New(15004, 5); -- A Sly Fox
    a[15023] = b:New(15023, 10); -- We Can Rebuild
    a[15024] = b:New(15024, 10); -- Denying the Drought
    a[15025] = b:New(15025, 10); -- Sanctum Superior
    a[15032] = b:New(15032, 10); -- Breaking Their Hold
    a[15033] = b:New(15033, 10); -- Taking the Tremaculum
    a[15034] = b:New(15034, 10); -- Wings Against the Flames
    a[15035] = b:New(15035, 15); -- On the Offensive
    a[15036] = b:New(15036, 10); -- Rooting Out the Evil
    a[15037] = b:New(15037, 5); -- This Army
    a[15039] = b:New(15039, 5); -- Up For Grabs
    a[15040] = b:New(15040, 10); -- Flawless Fate
    a[15041] = b:New(15041, 5); -- The Zovaal Shuffle
    a[15042] = b:New(15042, 5); -- Tea for the Troubled
    a[15043] = b:New(15043, 0); -- Hoarder of Torghast
    a[15044] = b:New(15044, 5); -- Krrprripripkraak's Heroes
    a[15045] = b:New(15045, 0); -- Keystone Hero: The Necrotic Wake
    O(a[15045], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15046] = b:New(15046, 0); -- Keystone Hero: Plaguefall
    O(a[15046], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15047] = b:New(15047, 0); -- Keystone Hero: Mists of Tirna Scithe
    O(a[15047], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15048] = b:New(15048, 0); -- Keystone Hero: Halls of Atonement
    O(a[15048], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15049] = b:New(15049, 0); -- Keystone Hero: Spires of Ascension
    O(a[15049], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15050] = b:New(15050, 0); -- Keystone Hero: Theater of Pain
    O(a[15050], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15051] = b:New(15051, 0); -- Keystone Hero: De Other Side
    O(a[15051], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15052] = b:New(15052, 0); -- Keystone Hero: Sanguine Depths
    O(a[15052], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7);
    a[15053] = b:New(15053, 10); -- Explore Korthia
    a[15054] = b:New(15054, 15); -- Minions of the Cold Dark
    a[15055] = b:New(15055, 10); -- Friend of Ooz
    a[15056] = b:New(15056, 10); -- Friend of Bloop
    a[15057] = b:New(15057, 10); -- Friend of Plaguey
    a[15058] = b:New(15058, 10); -- I Used to Bullseye Deeprun Rats Back Home
    a[15059] = b:New(15059, 5); -- Death's Advance
    a[15064] = b:New(15064, 10); -- Breaking the Chains
    a[15065] = b:New(15065, 10); -- Eye Wish You Were Here
    a[15066] = b:New(15066, 10); -- Reliquary Restoration
    a[15067] = b:New(15067, 10); -- Adamant Vaults
    a[15069] = b:New(15069, 5); -- The Archivists' Codex
    a[15073] = b:New(15073, 0); -- Shadowlands Keystone Explorer: Season Two
    O(a[15073], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6);
    a[15075] = b:New(15075, 10); -- Infiltrators
    a[15076] = b:New(15076, 5); -- The Box of Many Things
    a[15077] = b:New(15077, 0); -- Shadowlands Keystone Conqueror: Season Two
    O(a[15077], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6);
    a[15078] = b:New(15078, 0); -- Shadowlands Keystone Master: Season Two
    O(a[15078], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6);
    a[15079] = b:New(15079, 10); -- "Many, Many Things"
    a[15080] = b:New(15080, 10); -- So Blessed
    a[15081] = b:New(15081, 10); -- Flawless: Skoldus Hall (Layer 12)
    a[15082] = b:New(15082, 10); -- Flawless: Fracture Chambers (Layer 12)
    a[15083] = b:New(15083, 10); -- Flawless: Coldheart Interstitia (Layer 12)
    a[15084] = b:New(15084, 10); -- Flawless: The Soulforges (Layer 12)
    a[15087] = b:New(15087, 10); -- Flawless: Mort'regar (Layer 12)
    a[15088] = b:New(15088, 10); -- Flawless: The Upper Reaches (Layer 12)
    a[15089] = b:New(15089, 20); -- Flawless Master (Layer 12)
    a[15091] = b:New(15091, 10); -- A Taste of Perfection
    a[15092] = b:New(15092, 20); -- Master of Torment
    a[15093] = b:New(15093, 10); -- Avenge Me!
    a[15094] = b:New(15094, 10); -- Rampage
    a[15095] = b:New(15095, 10); -- No Doubt
    a[15096] = b:New(15096, 10); -- Crowd Pleaser
    a[15099] = b:New(15099, 0); -- Treasures of Korthia
    a[15102] = b:New(15102, 10); -- It's Off the Chain!
    T(a[15102], t[2249]); -- Unchained Aspirant's Plate (Aspirant)
    T(a[15102], t[2227]); -- Unchained Gladiator's Plate (Gladiator)
    T(a[15102], t[2231]); -- Unchained Gladiator's Plate (Elite)
    T(a[15102], t[2248]); -- Unchained Aspirant's Chain (Aspirant)
    T(a[15102], t[2226]); -- Unchained Gladiator's Chain (Gladiator)
    T(a[15102], t[2230]); -- Unchained Gladiator's Chain (Elite)
    T(a[15102], t[2246]); -- Unchained Aspirant's Vestment (Aspirant)
    T(a[15102], t[2224]); -- Unchained Gladiator's Vestment (Gladiator)
    T(a[15102], t[2228]); -- Unchained Gladiator's Vestment (Elite)
    T(a[15102], t[2247]); -- Unchained Aspirant's Leathers (Aspirant)
    T(a[15102], t[2225]); -- Unchained Gladiator's Leathers (Gladiator)
    T(a[15102], t[2229]); -- Unchained Gladiator's Leathers (Elite)
    a[15105] = b:New(15105, 10); -- Tormentor's Tango
    a[15106] = b:New(15106, 10); -- Quality Control
    a[15107] = b:New(15107, 10); -- Conquering Korthia
    a[15108] = b:New(15108, 10); -- Together Forever
    a[15109] = b:New(15109, 10); -- Will it Blend?
    a[15110] = b:New(15110, 10); -- Dominating the Catwalk
    T(a[15110], t[2251]); -- Soulforged Dreadplate (Raid Finder)
    T(a[15110], t[2250]); -- Soulforged Dreadplate (Normal)
    T(a[15110], t[2252]); -- Soulforged Dreadplate (Heroic)
    T(a[15110], t[2253]); -- Soulforged Dreadplate (Mythic)
    T(a[15110], t[2255]); -- Tower Ascendant's Battlegear (Raid Finder)
    T(a[15110], t[2254]); -- Tower Ascendant's Battlegear (Normal)
    T(a[15110], t[2256]); -- Tower Ascendant's Battlegear (Heroic)
    T(a[15110], t[2257]); -- Tower Ascendant's Battlegear (Mythic)
    T(a[15110], t[2263]); -- Dark Supplicant's Garb (Raid Finder)
    T(a[15110], t[2262]); -- Dark Supplicant's Garb (Normal)
    T(a[15110], t[2264]); -- Dark Supplicant's Garb (Heroic)
    T(a[15110], t[2265]); -- Dark Supplicant's Garb (Mythic)
    T(a[15110], t[2259]); -- Sanctum Assailant's Trappings (Raid Finder)
    T(a[15110], t[2258]); -- Sanctum Assailant's Trappings (Normal)
    T(a[15110], t[2260]); -- Sanctum Assailant's Trappings (Heroic)
    T(a[15110], t[2261]); -- Sanctum Assailant's Trappings (Mythic)
    a[15112] = b:New(15112, 10); -- Mythic: The Tarragrue
    a[15113] = b:New(15113, 10); -- Mythic: The Eye of the Jailer
    a[15114] = b:New(15114, 10); -- Mythic: The Nine
    a[15115] = b:New(15115, 10); -- Mythic: Remnant of Ner'zhul
    a[15116] = b:New(15116, 10); -- Mythic: Soulrender Dormazain
    a[15117] = b:New(15117, 10); -- Mythic: Painsmith Raznal
    a[15118] = b:New(15118, 10); -- Mythic: Guardian of the First Ones
    a[15119] = b:New(15119, 10); -- Mythic: Fatescribe Roh-Kalo
    a[15120] = b:New(15120, 10); -- Mythic: Kel'Thuzad
    a[15121] = b:New(15121, 10); -- Mythic: Sylvanas Windrunner
    a[15122] = b:New(15122, 10); -- The Jailer's Vanguard
    a[15123] = b:New(15123, 10); -- The Dark Bastille
    a[15124] = b:New(15124, 10); -- Shackles of Fate
    a[15125] = b:New(15125, 10); -- The Reckoning
    a[15126] = b:New(15126, 10); -- Sanctum of Domination
    a[15127] = b:New(15127, 10); -- Heroic: Sanctum of Domination
    a[15128] = b:New(15128, 10); -- Mythic: Sanctum of Domination
    a[15130] = b:New(15130, 25); -- Glory of the Dominant Raider
    a[15131] = b:New(15131, 10); -- Whack-A-Soul
    a[15132] = b:New(15132, 10); -- Knowledge is Power
    a[15133] = b:New(15133, 10); -- This World is a Prism
    a[15134] = b:New(15134, 0); -- Ahead of the Curve: Sylvanas Windrunner
    O(a[15134], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6);
    a[15135] = b:New(15135, 0); -- Cutting Edge: Sylvanas Windrunner
    O(a[15135], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6);
    a[15177] = b:New(15177, 10); -- "Tazavesh, the Veiled Market"
    a[15178] = b:New(15178, 10); -- Fake It 'Til You Make It
    a[15179] = b:New(15179, 10); -- This is Fine
    a[15181] = b:New(15181, 10); -- Rock n' Roll
    a[15190] = b:New(15190, 10); -- Mischief!
    a[15191] = b:New(15191, 0); -- "Rae'shalare, Death's Whisper"
    a[15211] = b:New(15211, 5); -- Completing the Code
    a[15212] = b:New(15212, 5); -- First Dance
    a[15213] = b:New(15213, 10); -- Don't Stop Dancing
    a[15214] = b:New(15214, 5); -- What a Feeling
    a[15215] = b:New(15215, 10); -- Can't Stop the Feeling
    a[15216] = b:New(15216, 5); -- Make You Sweat
    a[15217] = b:New(15217, 10); -- Maniac on the Dance Floor
    a[15218] = b:New(15218, 0); -- WoW's 18th Anniversary
    a[15220] = b:New(15220, 5); -- The Enlightened
    a[15221] = b:New(15221, 10); -- Dancing Machine
    a[15222] = b:New(15222, 5); -- You Got the Beat
    a[15223] = b:New(15223, 10); -- Feeling It
    a[15224] = b:New(15224, 10); -- Explore Zereth Mortis
    a[15229] = b:New(15229, 5); -- Traversing the Spheres
    a[15232] = b:New(15232, 0); -- Combatant II: Shadowlands Season 2
    O(a[15232], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[15233] = b:New(15233, 0); -- Challenger II: Shadowlands Season 2
    O(a[15233], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[15234] = b:New(15234, 0); -- Rival II: Shadowlands Season 2
    O(a[15234], "From", "PvP Season", 31, "Until", "PvP Season", 31);
    a[15241] = b:New(15241, 10); -- Renowned
    a[15251] = b:New(15251, 10); -- The Jailer's Gauntlet: Layer 1
    a[15252] = b:New(15252, 10); -- The Jailer's Gauntlet: Layer 2
    a[15253] = b:New(15253, 10); -- The Jailer's Gauntlet: Layer 3
    a[15254] = b:New(15254, 10); -- The Jailer's Gauntlet: Layer 4
    a[15255] = b:New(15255, 10); -- The Jailer's Gauntlet: Layer 5
    a[15256] = b:New(15256, 10); -- The Jailer's Gauntlet: Layer 6
    a[15257] = b:New(15257, 10); -- The Jailer's Gauntlet: Layer 7
    a[15258] = b:New(15258, 10); -- The Jailer's Gauntlet: Layer 8
    a[15259] = b:New(15259, 10); -- Secrets of the First Ones
    a[15308] = b:New(15308, 0); -- Tower Overwhelming
    a[15309] = b:New(15309, 10); -- A Towering Success
    a[15310] = b:New(15310, 20); -- A Tour of Towers
    a[15313] = b:New(15313, 0); -- Rockin' Rollin' Racer
    a[15314] = b:New(15314, 10); -- Flawless: Skoldus Hall (Layer 16)
    a[15315] = b:New(15315, 10); -- Amidst Ourselves
    a[15316] = b:New(15316, 10); -- Flawless: Fracture Chambers (Layer 16)
    a[15317] = b:New(15317, 10); -- Flawless: The Soulforges (Layer 16)
    a[15318] = b:New(15318, 10); -- Flawless: Coldheart Interstitia (Layer 16)
    a[15319] = b:New(15319, 10); -- Flawless: Mort'regar (Layer 16)
    a[15320] = b:New(15320, 10); -- Flawless: The Upper Reaches (Layer 16)
    a[15322] = b:New(15322, 20); -- Flawless Master (Layer 16)
    a[15323] = b:New(15323, 0); -- Sarge's Tale
    a[15324] = b:New(15324, 20); -- Tower Ranger
    a[15325] = b:New(15325, 10, fac.Alliance); -- "Dracthyr, Awaken"
    a[15327] = b:New(15327, 0); -- Tormented Hero: Shadowlands Season 2
    O(a[15327], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6);
    a[15331] = b:New(15331, 10); -- Treasures of Zereth Mortis
    a[15336] = b:New(15336, 25); -- From A to Zereth
    a[15348] = b:New(15348, 0); -- Combatant I: Shadowlands Season 3
    O(a[15348], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15349] = b:New(15349, 0); -- Challenger I: Shadowlands Season 3
    O(a[15349], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15350] = b:New(15350, 0); -- Rival I: Shadowlands Season 3
    O(a[15350], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15351] = b:New(15351, 0); -- Duelist: Shadowlands Season 3
    O(a[15351], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15352] = b:New(15352, 0); -- Gladiator: Shadowlands Season 3
    O(a[15352], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15353] = b:New(15353, 0); -- Cosmic Gladiator: Shadowlands Season 3
    O(a[15353], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15354] = b:New(15354, 0); -- Elite: Shadowlands Season 3
    O(a[15354], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15355] = b:New(15355, 0, fac.Alliance, 15356); -- Hero of the Alliance: Cosmic
    O(a[15355], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15356] = b:New(15356, 0, fac.Horde, 15355); -- Hero of the Horde: Cosmic
    O(a[15356], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15378] = b:New(15378, 0); -- Rival II: Shadowlands Season 3
    O(a[15378], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15379] = b:New(15379, 0); -- Challenger II: Shadowlands Season 3
    O(a[15379], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15380] = b:New(15380, 0); -- Combatant II: Shadowlands Season 3
    O(a[15380], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15381] = b:New(15381, 10); -- Power ON
    a[15384] = b:New(15384, 0); -- Cosmic Gladiator's Soul Eater
    O(a[15384], "From", "PvP Season", 32, "Until", "PvP Season", 32);
    a[15386] = b:New(15386, 10); -- Shimmering Secrets
    a[15388] = b:New(15388, 25); -- Shadowlands Explorer
    a[15391] = b:New(15391, 10); -- Adventurer of Zereth Mortis
    a[15392] = b:New(15392, 10); -- Dune Dominance
    a[15394] = b:New(15394, 0); -- Ohn'a'Roll
    a[15396] = b:New(15396, 10); -- We Are All Made of Stars
    a[15397] = b:New(15397, 0); -- Four Ring Circus
    a[15398] = b:New(15398, 10); -- "Xy Never, Ever Marks the Spot."
    a[15399] = b:New(15399, 10); -- Coming to Terms
    a[15400] = b:New(15400, 10); -- Where the Wild Corgis Are
    a[15401] = b:New(15401, 0); -- Wisdom Comes From the Desert
    a[15402] = b:New(15402, 10); -- Cyphers of the First Ones
    a[15404] = b:New(15404, 10); -- Cosmic Empowerment
    a[15406] = b:New(15406, 10, nil, nil, nil, nil, custObj[15406]); -- Synthesized!
    a[15407] = b:New(15407, 10, nil, nil, nil, nil, custObj[15407]); -- Synthe-fived!
    a[15408] = b:New(15408, 10); -- Cosmic Chic
    T(a[15408], t[2319]); -- Cosmic Aspirant's Plate (Aspirant)
    T(a[15408], t[2318]); -- Cosmic Aspirant's Chain (Aspirant)
    T(a[15408], t[2316]); -- Cosmic Aspirant's Vestment (Aspirant)
    T(a[15408], t[2317]); -- Cosmic Aspirant's Leathers (Aspirant)
    T(a[15408], t[2418]); -- Cosmic Gladiator's Plate Armor (Gladiator)
    T(a[15408], t[2419]); -- Cosmic Gladiator's Plate Armor (Elite)
    T(a[15408], t[2388]); -- Cosmic Gladiator's Scaled Armor (Gladiator)
    T(a[15408], t[2389]); -- Cosmic Gladiator's Scaled Armor (Elite)
    T(a[15408], t[2370]); -- Cosmic Gladiator's Chain Armor (Gladiator)
    T(a[15408], t[2371]); -- Cosmic Gladiator's Chain Armor (Elite)
    T(a[15408], t[2400]); -- Cosmic Gladiator's Leather Armor (Gladiator)
    T(a[15408], t[2401]); -- Cosmic Gladiator's Leather Armor (Elite)
    T(a[15408], t[2394]); -- Cosmic Gladiator's Satin Armor (Gladiator)
    T(a[15408], t[2395]); -- Cosmic Gladiator's Satin Armor (Elite)
    T(a[15408], t[2352]); -- Cosmic Gladiator's Dreadplate Armor (Gladiator)
    T(a[15408], t[2353]); -- Cosmic Gladiator's Dreadplate Armor (Elite)
    T(a[15408], t[2406]); -- Cosmic Gladiator's Ringmail Armor (Gladiator)
    T(a[15408], t[2407]); -- Cosmic Gladiator's Ringmail Armor (Elite)
    T(a[15408], t[2376]); -- Cosmic Gladiator's Silk Armor (Gladiator)
    T(a[15408], t[2377]); -- Cosmic Gladiator's Silk Armor (Elite)
    T(a[15408], t[2412]); -- Cosmic Gladiator's Felweave Armor (Gladiator)
    T(a[15408], t[2413]); -- Cosmic Gladiator's Felweave Armor (Elite)
    T(a[15408], t[2382]); -- Cosmic Gladiator's Ironskin Armor (Gladiator)
    T(a[15408], t[2383]); -- Cosmic Gladiator's Ironskin Armor (Elite)
    T(a[15408], t[2364]); -- Cosmic Gladiator's Dragonhide Armor (Gladiator)
    T(a[15408], t[2365]); -- Cosmic Gladiator's Dragonhide Armor (Elite)
    T(a[15408], t[2358]); -- Cosmic Gladiator's Felskin Armor (Gladiator)
    T(a[15408], t[2359]); -- Cosmic Gladiator's Felskin Armor (Elite)
    a[15409] = b:New(15409, 10); -- First Wonders
    T(a[15409], t[2415]); -- Armaments of the Infinite Infantry (Raid Finder)
    T(a[15409], t[2414]); -- Armaments of the Infinite Infantry (Normal)
    T(a[15409], t[2416]); -- Armaments of the Infinite Infantry (Heroic)
    T(a[15409], t[2417]); -- Armaments of the Infinite Infantry (Mythic)
    T(a[15409], t[2385]); -- Luminous Chevalier's Gallantry (Raid Finder)
    T(a[15409], t[2384]); -- Luminous Chevalier's Gallantry (Normal)
    T(a[15409], t[2386]); -- Luminous Chevalier's Gallantry (Heroic)
    T(a[15409], t[2387]); -- Luminous Chevalier's Gallantry (Mythic)
    T(a[15409], t[2367]); -- Godstalker's Battlegear (Raid Finder)
    T(a[15409], t[2366]); -- Godstalker's Battlegear (Normal)
    T(a[15409], t[2368]); -- Godstalker's Battlegear (Heroic)
    T(a[15409], t[2369]); -- Godstalker's Battlegear (Mythic)
    T(a[15409], t[2397]); -- Soulblade Shadowhide (Raid Finder)
    T(a[15409], t[2396]); -- Soulblade Shadowhide (Normal)
    T(a[15409], t[2398]); -- Soulblade Shadowhide (Heroic)
    T(a[15409], t[2399]); -- Soulblade Shadowhide (Mythic)
    T(a[15409], t[2391]); -- Habiliments of the Empyrean (Raid Finder)
    T(a[15409], t[2390]); -- Habiliments of the Empyrean (Normal)
    T(a[15409], t[2392]); -- Habiliments of the Empyrean (Heroic)
    T(a[15409], t[2393]); -- Habiliments of the Empyrean (Mythic)
    T(a[15409], t[2349]); -- The First Eidolon's Soulsteel (Raid Finder)
    T(a[15409], t[2348]); -- The First Eidolon's Soulsteel (Normal)
    T(a[15409], t[2350]); -- The First Eidolon's Soulsteel (Heroic)
    T(a[15409], t[2351]); -- The First Eidolon's Soulsteel (Mythic)
    T(a[15409], t[2403]); -- Theurgic Starspeaker's Regalia (Raid Finder)
    T(a[15409], t[2402]); -- Theurgic Starspeaker's Regalia (Normal)
    T(a[15409], t[2404]); -- Theurgic Starspeaker's Regalia (Heroic)
    T(a[15409], t[2405]); -- Theurgic Starspeaker's Regalia (Mythic)
    T(a[15409], t[2373]); -- Erudite Occultist's Vestments (Raid Finder)
    T(a[15409], t[2372]); -- Erudite Occultist's Vestments (Normal)
    T(a[15409], t[2374]); -- Erudite Occultist's Vestments (Heroic)
    T(a[15409], t[2375]); -- Erudite Occultist's Vestments (Mythic)
    T(a[15409], t[2409]); -- Shroud of the Demon Star (Raid Finder)
    T(a[15409], t[2408]); -- Shroud of the Demon Star (Normal)
    T(a[15409], t[2410]); -- Shroud of the Demon Star (Heroic)
    T(a[15409], t[2411]); -- Shroud of the Demon Star (Mythic)
    T(a[15409], t[2379]); -- Garb of the Grand Upwelling (Raid Finder)
    T(a[15409], t[2378]); -- Garb of the Grand Upwelling (Normal)
    T(a[15409], t[2380]); -- Garb of the Grand Upwelling (Heroic)
    T(a[15409], t[2381]); -- Garb of the Grand Upwelling (Mythic)
    T(a[15409], t[2361]); -- Tapestry of the Fixed Stars (Raid Finder)
    T(a[15409], t[2360]); -- Tapestry of the Fixed Stars (Normal)
    T(a[15409], t[2362]); -- Tapestry of the Fixed Stars (Heroic)
    T(a[15409], t[2363]); -- Tapestry of the Fixed Stars (Mythic)
    T(a[15409], t[2355]); -- Mercurial Punisher's Painweave (Raid Finder)
    T(a[15409], t[2354]); -- Mercurial Punisher's Painweave (Normal)
    T(a[15409], t[2356]); -- Mercurial Punisher's Painweave (Heroic)
    T(a[15409], t[2357]); -- Mercurial Punisher's Painweave (Mythic)
    a[15410] = b:New(15410, 10, nil, nil, nil, nil, custObj[15410]); -- Synthe-superfived!
    a[15411] = b:New(15411, 20, nil, nil, nil, nil, custObj[15411]); -- Synthe-supersized!
    a[15416] = b:New(15416, 10); -- Domination's Grasp
    a[15417] = b:New(15417, 10); -- Sepulcher of the First Ones
    a[15418] = b:New(15418, 10); -- The Grand Design
    a[15419] = b:New(15419, 10); -- The Protoform Matrix
    a[15468] = b:New(15468, 0); -- We Are All Made of Stars (Heroic)
    O(a[15468], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15469] = b:New(15469, 0); -- We Are All Made of Stars (Mythic)
    O(a[15469], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15470] = b:New(15470, 0); -- Ahead of the Curve: The Jailer
    O(a[15470], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15471] = b:New(15471, 0); -- Cutting Edge: The Jailer
    O(a[15471], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15478] = b:New(15478, 10); -- Heroic: Sepulcher of the First Ones
    a[15479] = b:New(15479, 10); -- Mythic: Vigilant Guardian
    a[15480] = b:New(15480, 10); -- Mythic: Skolex
    a[15481] = b:New(15481, 10); -- Mythic: Artificer Xy'mox
    a[15482] = b:New(15482, 10); -- Mythic: Dausegne
    a[15483] = b:New(15483, 10); -- Mythic: Prototype Pantheon
    a[15484] = b:New(15484, 10); -- Mythic: Lihuvim
    a[15485] = b:New(15485, 10); -- Mythic: Halondrus
    a[15486] = b:New(15486, 10); -- Mythic: Anduin Wrynn
    a[15487] = b:New(15487, 10); -- Mythic: Lords of Dread
    a[15488] = b:New(15488, 10); -- Mythic: Rygelon
    a[15489] = b:New(15489, 10); -- Mythic: The Jailer
    a[15490] = b:New(15490, 10); -- Mythic: Sepulcher of the First Ones
    a[15491] = b:New(15491, 25); -- Glory of the Sepulcher Raider
    a[15492] = b:New(15492, 10); -- Cornerstone of Creation
    a[15493] = b:New(15493, 10); -- Ephemeral Plains
    a[15494] = b:New(15494, 0); -- Damnation Aviation
    a[15496] = b:New(15496, 0); -- Shadowlands Keystone Explorer: Season Three
    O(a[15496], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15498] = b:New(15498, 0); -- Shadowlands Keystone Conqueror: Season Three
    O(a[15498], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15499] = b:New(15499, 0); -- Shadowlands Keystone Master: Season Three
    O(a[15499], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15500] = b:New(15500, 0); -- "Keystone Hero: Tazavesh, the Veiled Market"
    O(a[15500], "From", "Mythic+ Season", 7, "Until", "Version", "100000");
    a[15502] = b:New(15502, 10); -- "Sand, Sand Everywhere!"
    a[15506] = b:New(15506, 0); -- Shadowlands Keystone Hero: Season Three
    O(a[15506], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15508] = b:New(15508, 10); -- Fashion of the First Ones
    a[15509] = b:New(15509, 5); -- Tales of the Exile
    a[15511] = b:New(15511, 10); -- Solely Motivated
    a[15512] = b:New(15512, 5); -- Adventures in Zereth Mortis
    a[15513] = b:New(15513, 5); -- Curious Collections
    a[15514] = b:New(15514, 15); -- Unlocking the Secrets
    a[15515] = b:New(15515, 5); -- Path to Enlightenment
    a[15518] = b:New(15518, 5); -- A Means to an End
    a[15539] = b:New(15539, 10); -- Solo Aspirations
    a[15540] = b:New(15540, 20); -- Steadfast Soloist
    a[15541] = b:New(15541, 10); -- Sole Survivor
    a[15542] = b:New(15542, 10); -- Apocopocolypse Now
    a[15543] = b:New(15543, 10); -- Successful Solos
    a[15544] = b:New(15544, 20); -- Supreme Soloist
    a[15579] = b:New(15579, 10); -- Return to Lordaeron
    a[15594] = b:New(15594, 0); -- Fearless Spectator
    O(a[15594]);
    a[15600] = b:New(15600, 0); -- Challenger I: Shadowlands Season 4
    O(a[15600], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15601] = b:New(15601, 0); -- Challenger II: Shadowlands Season 4
    O(a[15601], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15602] = b:New(15602, 0); -- Rival I: Shadowlands Season 4
    O(a[15602], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15603] = b:New(15603, 0); -- Rival II: Shadowlands Season 4
    O(a[15603], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15604] = b:New(15604, 0); -- Duelist: Shadowlands Season 4
    O(a[15604], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15605] = b:New(15605, 0); -- Gladiator: Shadowlands Season 4
    O(a[15605], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15606] = b:New(15606, 0); -- Eternal Gladiator: Shadowlands Season 4
    O(a[15606], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15607] = b:New(15607, 0, fac.Horde, 15608); -- Hero of the Horde: Eternal
    O(a[15607], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15608] = b:New(15608, 0, fac.Alliance, 15607); -- Hero of the Alliance: Eternal
    O(a[15608], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15609] = b:New(15609, 0); -- Combatant I: Shadowlands Season 4
    O(a[15609], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15610] = b:New(15610, 0); -- Combatant II: Shadowlands Season 4
    O(a[15610], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15612] = b:New(15612, 0); -- Eternal Gladiator's Soul Eater
    O(a[15612], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15638] = b:New(15638, 10, fac.Horde); -- "Dracthyr, Awaken"
    a[15639] = b:New(15639, 0); -- Elite: Shadowlands Season 4
    O(a[15639], "From", "PvP Season", 33, "Until", "PvP Season", 33);
    a[15641] = b:New(15641, 10); -- Many More Mini Minions
    a[15642] = b:New(15642, 10); -- Proven Pet Parent
    a[15643] = b:New(15643, 10); -- What Can I Say? They Love Me.
    a[15644] = b:New(15644, 10); -- Good Things Come in Small Packages
    a[15645] = b:New(15645, 0); -- To Catch Falling Stars
    a[15646] = b:New(15646, 10); -- Re-Re-Re-Renowned
    a[15647] = b:New(15647, 10); -- Dead Men Tell Some Tales
    a[15648] = b:New(15648, 10); -- Walking in Maw-mphis
    a[15649] = b:New(15649, 10); -- Shadowlands Dilettante
    a[15650] = b:New(15650, 10); -- Mythic: Streets of Wonder
    a[15651] = b:New(15651, 10); -- Myths of the Shadowlands Dungeons
    a[15652] = b:New(15652, 10); -- Mythic: So'leah's Gambit
    a[15653] = b:New(15653, 0); -- The More You Know*
    a[15654] = b:New(15654, 0); -- Back from the Beyond
    O(a[15654], "From", "Version", "090205", "Before", "Version", "100002");
    a[15663] = b:New(15663, 10); -- Fate of Nathria
    O(a[15663], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15664] = b:New(15664, 10); -- Heroic: Fate of Nathria
    O(a[15664], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15665] = b:New(15665, 10); -- Mythic: Fate of Nathria
    O(a[15665], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15667] = b:New(15667, 10); -- Fate of Domination
    O(a[15667], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15668] = b:New(15668, 10); -- Heroic: Fate of Domination
    O(a[15668], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15669] = b:New(15669, 10); -- Mythic: Fate of Domination
    O(a[15669], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15681] = b:New(15681, 10); -- Fate of the Sepulcher
    O(a[15681], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15682] = b:New(15682, 10); -- Heroic: Fate of the Sepulcher
    O(a[15682], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15683] = b:New(15683, 10); -- Mythic: Fate of the Sepulcher
    O(a[15683], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15684] = b:New(15684, 10); -- Fates of the Shadowlands Raids
    O(a[15684], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15685] = b:New(15685, 10); -- Heroic: Fates of the Shadowlands Raids
    O(a[15685], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15687] = b:New(15687, 10); -- Mythic: Fates of the Shadowlands Raids
    O(a[15687], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15688] = b:New(15688, 0); -- Shadowlands Keystone Explorer: Season Four
    O(a[15688], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15689] = b:New(15689, 0); -- Shadowlands Keystone Conqueror: Season Four
    O(a[15689], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15690] = b:New(15690, 0); -- Shadowlands Keystone Master: Season Four
    O(a[15690], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15691] = b:New(15691, 0); -- Cryptic Hero: Shadowlands Season 3
    O(a[15691], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7);
    a[15692] = b:New(15692, 0); -- Keystone Hero: Return to Karazhan
    O(a[15692], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15693] = b:New(15693, 0); -- Keystone Hero: Operation: Mechagon
    O(a[15693], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15694] = b:New(15694, 0); -- Keystone Hero: Iron Docks
    O(a[15694], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15695] = b:New(15695, 0); -- Keystone Hero: Grimrail Depot
    O(a[15695], "From", "Mythic+ Season", 8, "Until", "Version", "100000");
    a[15696] = b:New(15696, 0); -- Ruby Lifeshrine Loop: Bronze
    a[15697] = b:New(15697, 0); -- Ruby Lifeshrine Loop: Silver
    a[15698] = b:New(15698, 0); -- Ruby Lifeshrine Loop: Gold
    a[15702] = b:New(15702, 0); -- Ruby Lifeshrine Loop Advanced: Bronze
    a[15703] = b:New(15703, 0); -- Ruby Lifeshrine Loop Advanced: Silver
    a[15704] = b:New(15704, 0); -- Ruby Lifeshrine Loop Advanced: Gold
    a[15705] = b:New(15705, 0); -- Flashfrost Flyover: Bronze
    a[15706] = b:New(15706, 0); -- Flashfrost Flyover: Silver
    a[15707] = b:New(15707, 0); -- Flashfrost Flyover: Gold
    a[15709] = b:New(15709, 0); -- Flashfrost Flyover Advanced: Bronze
    a[15710] = b:New(15710, 0); -- Flashfrost Flyover Advanced: Silver
    a[15711] = b:New(15711, 0); -- Flashfrost Flyover Advanced: Gold
    a[15712] = b:New(15712, 0); -- Wild Preserve Slalom: Bronze
    a[15713] = b:New(15713, 0); -- Wild Preserve Slalom: Silver
    a[15714] = b:New(15714, 0); -- Wild Preserve Slalom: Gold
    a[15715] = b:New(15715, 0); -- Wild Preserve Slalom Advanced: Bronze
    a[15716] = b:New(15716, 0); -- Wild Preserve Slalom Advanced: Silver
    a[15717] = b:New(15717, 0); -- Wild Preserve Slalom Advanced: Gold
    a[15718] = b:New(15718, 0); -- Wild Preserve Circuit: Bronze
    a[15719] = b:New(15719, 0); -- Wild Preserve Circuit: Silver
    a[15720] = b:New(15720, 0); -- Wild Preserve Circuit: Gold
    a[15721] = b:New(15721, 0); -- Wild Preserve Circuit Advanced: Bronze
    a[15722] = b:New(15722, 0); -- Wild Preserve Circuit Advanced: Silver
    a[15723] = b:New(15723, 0); -- Wild Preserve Circuit Advanced: Gold
    a[15724] = b:New(15724, 0); -- Emberflow Flight: Bronze
    a[15725] = b:New(15725, 0); -- Emberflow Flight: Silver
    a[15726] = b:New(15726, 0); -- Emberflow Flight: Gold
    a[15727] = b:New(15727, 0); -- Emberflow Flight Advanced: Bronze
    a[15728] = b:New(15728, 0); -- Emberflow Flight Advanced: Silver
    a[15729] = b:New(15729, 0); -- Emberflow Flight Advanced: Gold
    a[15730] = b:New(15730, 0); -- Apex Canopy River Run: Bronze
    a[15731] = b:New(15731, 0); -- Apex Canopy River Run: Silver
    a[15732] = b:New(15732, 0); -- Apex Canopy River Run: Gold
    a[15733] = b:New(15733, 0); -- Apex Canopy River Run Advanced: Bronze
    a[15734] = b:New(15734, 0); -- Apex Canopy River Run Advanced: Silver
    a[15735] = b:New(15735, 0); -- Apex Canopy River Run Advanced: Gold
    a[15736] = b:New(15736, 0); -- Uktulut Coaster: Bronze
    a[15737] = b:New(15737, 0); -- Uktulut Coaster: Silver
    a[15738] = b:New(15738, 0); -- Uktulut Coaster: Gold
    a[15739] = b:New(15739, 0); -- Uktulut Coaster Advanced: Bronze
    a[15740] = b:New(15740, 0); -- Uktulut Coaster Advanced: Silver
    a[15741] = b:New(15741, 0); -- Uktulut Coaster Advanced: Gold
    a[15742] = b:New(15742, 0); -- Wingrest Roundabout: Bronze
    a[15743] = b:New(15743, 0); -- Wingrest Roundabout: Silver
    a[15744] = b:New(15744, 0); -- Wingrest Roundabout: Gold
    a[15745] = b:New(15745, 0); -- Wingrest Roundabout Advanced: Bronze
    a[15746] = b:New(15746, 0); -- Wingrest Roundabout Advanced: Silver
    a[15747] = b:New(15747, 0); -- Wingrest Roundabout Advanced: Gold
    a[15756] = b:New(15756, 0); -- Shrouded Hero: Shadowlands Season 4
    O(a[15756], "From", "Mythic+ Season", 8, "Until", "Mythic+ Season", 8);
    a[15757] = b:New(15757, 0); -- Sundapple Copse Circuit: Bronze
    a[15758] = b:New(15758, 0); -- Sundapple Copse Circuit: Silver
    a[15759] = b:New(15759, 0); -- Sundapple Copse Circuit: Gold
    a[15760] = b:New(15760, 0); -- Sundapple Copse Circuit Advanced: Bronze
    a[15761] = b:New(15761, 0); -- Sundapple Copse Circuit Advanced: Silver
    a[15762] = b:New(15762, 0); -- Sundapple Copse Circuit Advanced: Gold
    a[15763] = b:New(15763, 0); -- Fen Flythrough: Bronze
    a[15764] = b:New(15764, 0); -- Fen Flythrough: Silver
    a[15765] = b:New(15765, 0); -- Fen Flythrough: Gold
    a[15766] = b:New(15766, 0); -- Fen Flythrough Advanced: Bronze
    a[15767] = b:New(15767, 0); -- Fen Flythrough Advanced: Silver
    a[15768] = b:New(15768, 0); -- Fen Flythrough Advanced: Gold
    a[15769] = b:New(15769, 0); -- Ravine River Run: Bronze
    a[15770] = b:New(15770, 0); -- Ravine River Run: Silver
    a[15771] = b:New(15771, 0); -- Ravine River Run: Gold
    a[15772] = b:New(15772, 0); -- Ravine River Run Advanced: Bronze
    a[15773] = b:New(15773, 0); -- Ravine River Run Advanced: Silver
    a[15774] = b:New(15774, 0); -- "Ravine River Ru, Advanced: Gold"
    a[15775] = b:New(15775, 0); -- Emerald Garden Ascent: Bronze
    a[15776] = b:New(15776, 0); -- Emerald Garden Ascent: Silver
    a[15777] = b:New(15777, 0); -- Emerald Garden Ascent: Gold
    a[15778] = b:New(15778, 0); -- Emerald Garden Ascent Advanced: Bronze
    a[15779] = b:New(15779, 0); -- Emerald Garden Ascent Advanced: Silver
    a[15780] = b:New(15780, 0); -- Emerald Garden Ascent Advanced: Gold
    a[15781] = b:New(15781, 10); -- The Joy of Toy
    a[15782] = b:New(15782, 0); -- Maruukai Dash: Bronze
    a[15783] = b:New(15783, 0); -- Maruukai Dash: Silver
    a[15784] = b:New(15784, 0); -- Maruukai Dash: Gold
    a[15785] = b:New(15785, 0); -- Mirror of the Sky Dash: Bronze
    a[15786] = b:New(15786, 0); -- Mirror of the Sky Dash: Silver
    a[15787] = b:New(15787, 0); -- Mirror of the Sky Dash: Gold
    a[15788] = b:New(15788, 0); -- The Azure Span Sprint: Bronze
    a[15789] = b:New(15789, 0); -- The Azure Span Sprint: Silver
    a[15790] = b:New(15790, 0); -- The Azure Span Sprint: Gold
    a[15791] = b:New(15791, 0); -- The Azure Span Sprint Advanced: Bronze
    a[15792] = b:New(15792, 0); -- The Azure Span Sprint Advanced: Silver
    a[15793] = b:New(15793, 0); -- The Azure Span Sprint Advanced: Gold
    a[15794] = b:New(15794, 0); -- A New Friend
    a[15795] = b:New(15795, 0); -- Together in the Skies
    a[15796] = b:New(15796, 0); -- Cliffside Companion
    a[15797] = b:New(15797, 0); -- An Azure Ally
    a[15799] = b:New(15799, 0); -- The Azure Span Slalom: Bronze
    a[15800] = b:New(15800, 0); -- The Azure Span Slalom: Silver
    a[15801] = b:New(15801, 0); -- The Azure Span Slalom: Gold
    a[15802] = b:New(15802, 0); -- The Azure Span Slalom Advanced: Bronze
    a[15803] = b:New(15803, 0); -- The Azure Span Slalom Advanced: Silver
    a[15804] = b:New(15804, 0); -- The Azure Span Slalom Advanced: Gold
    a[15805] = b:New(15805, 10); -- Level 70
    a[15818] = b:New(15818, 0); -- The Vakthros Ascent: Bronze
    a[15819] = b:New(15819, 0); -- The Vakthros Ascent: Silver
    a[15820] = b:New(15820, 0); -- The Vakthros Ascent: Gold
    a[15821] = b:New(15821, 0); -- The Vakthros Ascent Advanced: Bronze
    a[15822] = b:New(15822, 0); -- The Vakthros Ascent Advanced: Silver
    a[15823] = b:New(15823, 0); -- The Vakthros Ascent Advanced: Gold
    a[15827] = b:New(15827, 0); -- The Flowing Forest Flight: Bronze
    a[15828] = b:New(15828, 0); -- The Flowing Forest Flight: Silver
    a[15829] = b:New(15829, 0); -- The Flowing Forest Flight: Gold
    a[15830] = b:New(15830, 0); -- The Flowing Forest Flight Advanced: Bronze
    a[15831] = b:New(15831, 0); -- The Flowing Forest Flight Advanced: Silver
    a[15832] = b:New(15832, 0); -- The Flowing Forest Flight Advanced: Gold
    a[15833] = b:New(15833, 10, fac.Horde); -- Thanks for the Carry!
    a[15834] = b:New(15834, 10, fac.Alliance); -- Thanks for the Carry!
    a[15835] = b:New(15835, 0); -- Iskaara Tour: Bronze
    a[15836] = b:New(15836, 0); -- Iskaara Tour: Silver
    a[15837] = b:New(15837, 0); -- Iskaara Tour: Gold
    a[15838] = b:New(15838, 0); -- Iskaara Tour Advanced: Bronze
    a[15839] = b:New(15839, 0); -- Iskaara Tour Advanced: Silver
    a[15840] = b:New(15840, 0); -- Iskaara Tour Advanced: Gold
    a[15841] = b:New(15841, 0); -- Frostland Flyover: Bronze
    a[15842] = b:New(15842, 0); -- Frostland Flyover: Silver
    a[15843] = b:New(15843, 0); -- Frostland Flyover: Gold
    a[15844] = b:New(15844, 0); -- Frostland Flyover Advanced: Bronze
    a[15845] = b:New(15845, 0); -- Frostland Flyover Advanced: Silver
    a[15846] = b:New(15846, 0); -- Frostland Flyover Advanced: Gold
    a[15847] = b:New(15847, 0); -- Archive Ambit: Bronze
    a[15848] = b:New(15848, 0); -- Archive Ambit: Silver
    a[15849] = b:New(15849, 0); -- Archive Ambit: Gold
    a[15850] = b:New(15850, 0); -- Archive Ambit Advanced: Bronze
    a[15851] = b:New(15851, 0); -- Archive Ambit Advanced: Silver
    a[15852] = b:New(15852, 0); -- Archive Ambit Advanced: Gold
    a[15855] = b:New(15855, 0); -- Tyrhold Trial: Bronze
    a[15856] = b:New(15856, 0); -- Tyrhold Trial: Silver
    a[15857] = b:New(15857, 0); -- Tyrhold Trial: Gold
    a[15858] = b:New(15858, 0); -- Tyrhold Trial Advanced: Bronze
    a[15859] = b:New(15859, 0); -- Tyrhold Trial Advanced: Silver
    a[15860] = b:New(15860, 0); -- Tyrhold Trial Advanced: Gold
    a[15889] = b:New(15889, 0); -- River Rapids Wrangler
    a[15890] = b:New(15890, 5); -- Dragonscale Expedition: The Highest Peaks
    a[15891] = b:New(15891, 0); -- Cliffside Circuit: Bronze
    a[15892] = b:New(15892, 0); -- Cliffside Circuit: Silver
    a[15893] = b:New(15893, 0); -- Cliffside Circuit: Gold
    a[15894] = b:New(15894, 0); -- Cliffside Circuit Advanced: Bronze
    a[15895] = b:New(15895, 0); -- Cliffside Circuit Advanced: Silver
    a[15896] = b:New(15896, 0); -- Cliffside Circuit Advanced: Gold
    a[15897] = b:New(15897, 0); -- Academy Ascent: Bronze
    a[15898] = b:New(15898, 0); -- Academy Ascent: Silver
    a[15899] = b:New(15899, 0); -- Academy Ascent: Gold
    a[15900] = b:New(15900, 0); -- Academy Ascent Advanced: Bronze
    a[15901] = b:New(15901, 0); -- Academy Ascent Advanced: Silver
    a[15902] = b:New(15902, 0); -- Academy Ascent Advanced: Gold
    a[15903] = b:New(15903, 0); -- Garden Gallivant: Bronze
    a[15904] = b:New(15904, 0); -- Garden Gallivant: Silver
    a[15905] = b:New(15905, 0); -- Garden Gallivant: Gold
    a[15906] = b:New(15906, 0); -- Garden Gallivant Advanced: Bronze
    a[15907] = b:New(15907, 0); -- Garden Gallivant Advanced: Silver
    a[15908] = b:New(15908, 0); -- Garden Gallivant Advanced: Gold
    a[15909] = b:New(15909, 0); -- Caverns Criss-Cross: Bronze
    a[15910] = b:New(15910, 0); -- Caverns Criss-Cross: Silver
    a[15911] = b:New(15911, 0); -- Caverns Criss-Cross: Gold
    a[15912] = b:New(15912, 0); -- Caverns Criss-Cross Advanced: Bronze
    a[15913] = b:New(15913, 0); -- Caverns Criss-Cross Advanced: Silver
    a[15914] = b:New(15914, 0); -- Caverns Criss-Cross Advanced: Gold
    a[15915] = b:New(15915, 0); -- Waking Shores: Bronze
    a[15916] = b:New(15916, 0); -- Waking Shores: Silver
    a[15917] = b:New(15917, 0); -- Waking Shores: Gold
    a[15918] = b:New(15918, 0); -- Ohn'ahran Plains: Bronze
    a[15919] = b:New(15919, 0); -- Ohn'ahran Plains: Silver
    a[15920] = b:New(15920, 0); -- Ohn'ahran Plains: Gold
    a[15921] = b:New(15921, 0); -- Azure Span: Bronze
    a[15922] = b:New(15922, 0); -- Azure Span: Silver
    a[15923] = b:New(15923, 0); -- Azure Span: Gold
    a[15924] = b:New(15924, 0); -- Thaldraszus: Bronze
    a[15925] = b:New(15925, 0); -- Thaldraszus: Silver
    a[15926] = b:New(15926, 0); -- Thaldraszus: Gold
    a[15927] = b:New(15927, 0); -- Waking Shores Advanced: Bronze
    a[15928] = b:New(15928, 0); -- Waking Shores Advanced: Silver
    a[15929] = b:New(15929, 0); -- Waking Shores Advanced: Gold
    a[15930] = b:New(15930, 0); -- Ohn'ahran Plains Advanced: Bronze
    a[15931] = b:New(15931, 0); -- Ohn'ahran Plains Advanced: Silver
    a[15932] = b:New(15932, 0); -- Ohn'ahran Plains Advanced: Gold
    a[15933] = b:New(15933, 0); -- Azure Span Advanced: Bronze
    a[15934] = b:New(15934, 0); -- Azure Span Advanced: Silver
    a[15935] = b:New(15935, 0); -- Azure Span Advanced: Gold
    a[15936] = b:New(15936, 0); -- Thaldraszus Advanced: Bronze
    a[15937] = b:New(15937, 0); -- Thaldraszus Advanced: Silver
    a[15938] = b:New(15938, 0); -- Thaldraszus Advanced: Gold
    a[15939] = b:New(15939, 0); -- Dragon Racing Completionist
    a[15940] = b:New(15940, 0); -- Dragon Racing Completionist: Silver
    a[15941] = b:New(15941, 0); -- Dragon Racing Completionist: Gold
    a[15951] = b:New(15951, 0); -- Crimson Gladiator: Dragonflight Season 1
    O(a[15951], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15952] = b:New(15952, 0); -- Rival I: Dragonflight Season 1
    O(a[15952], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15953] = b:New(15953, 0); -- Rival II: Dragonflight Season 1
    O(a[15953], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15954] = b:New(15954, 0); -- Duelist: Dragonflight Season 1
    O(a[15954], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15955] = b:New(15955, 0); -- Challenger I: Dragonflight Season 1
    O(a[15955], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15956] = b:New(15956, 0); -- Challenger II: Dragonflight Season 1
    O(a[15956], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15957] = b:New(15957, 0); -- Gladiator: Dragonflight Season 1
    O(a[15957], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15958] = b:New(15958, 0, fac.Horde); -- Hero of the Horde: Crimson
    O(a[15958], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15959] = b:New(15959, 0, fac.Alliance); -- Hero of the Alliance: Crimson
    O(a[15959], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15960] = b:New(15960, 0); -- Combatant I: Dragonflight Season 1
    O(a[15960], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15961] = b:New(15961, 0); -- Combatant II: Dragonflight Season 1
    O(a[15961], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15984] = b:New(15984, 0); -- Elite: Dragonflight Season 1
    O(a[15984], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[15985] = b:New(15985, 0); -- Dragon Glyphs: Skytop Observatory Tower
    a[15986] = b:New(15986, 0); -- Dragon Glyphs: Wingrest Embassy
    a[15987] = b:New(15987, 0); -- Dragon Glyphs: Obsidian Bulwark
    a[15988] = b:New(15988, 0); -- Dragon Glyphs: Ruby Life Pools Peaks
    a[15989] = b:New(15989, 0); -- Dragon Glyphs: The Overflowing Spring
    a[15990] = b:New(15990, 0); -- Dragon Glyphs: Life-Binder Observatory
    a[15991] = b:New(15991, 0); -- Dragon Glyphs: Crumbling Life Archway
    a[16051] = b:New(16051, 0); -- Dragon Glyphs: Dragonheart Outpost
    a[16052] = b:New(16052, 0); -- Dragon Glyphs: Scalecracker Peak
    a[16053] = b:New(16053, 0); -- Dragon Glyphs: Obsidian Throne
    a[16054] = b:New(16054, 0); -- Dragon Glyphs: Ohn'ahra's Roost
    a[16055] = b:New(16055, 0); -- Dragon Glyphs: Nokhudon Hold
    a[16056] = b:New(16056, 0); -- Dragon Glyphs: Emerald Gardens
    a[16057] = b:New(16057, 0); -- Dragon Glyphs: The Eternal Kurgans
    a[16058] = b:New(16058, 0); -- Dragon Glyphs: Szar Skeleth
    a[16059] = b:New(16059, 0); -- Dragon Glyphs: Mirror of the Sky
    a[16060] = b:New(16060, 0); -- Dragon Glyphs: Ohn'iri Springs
    a[16061] = b:New(16061, 0); -- Dragon Glyphs: Dragonsprings Summit
    a[16062] = b:New(16062, 0); -- Dragon Glyphs: Rusza'thar Reach
    a[16063] = b:New(16063, 0); -- Dragon Glyphs: Windsong Rise
    a[16064] = b:New(16064, 0); -- Dragon Glyphs: Cobalt Assembly
    a[16065] = b:New(16065, 0); -- Dragon Glyphs: Azure Archives
    a[16066] = b:New(16066, 0); -- Dragon Glyphs: Ruins of Karnthar
    a[16067] = b:New(16067, 0); -- Dragon Glyphs: Lost Ruins
    a[16068] = b:New(16068, 0); -- Dragon Glyphs: Brackenhide Hollow
    a[16069] = b:New(16069, 0); -- Dragon Glyphs: Creektooth Den
    a[16070] = b:New(16070, 0); -- Dragon Glyphs: Imbu
    a[16071] = b:New(16071, 0); -- Dragon Glyphs: Zelthrak Outpost
    a[16072] = b:New(16072, 0); -- Dragon Glyphs: Rhonin's Shield
    a[16073] = b:New(16073, 0); -- Dragon Glyphs: Vakthros Range
    a[16098] = b:New(16098, 0); -- Dragon Glyphs: Temporal Conflux
    a[16099] = b:New(16099, 0); -- Dragon Glyphs: Stormshroud Peak
    a[16100] = b:New(16100, 0); -- Dragon Glyphs: South Hold Gate
    a[16101] = b:New(16101, 0); -- Dragon Glyphs: Valdrakken
    a[16102] = b:New(16102, 0); -- Dragon Glyphs: Algeth'era
    a[16103] = b:New(16103, 0); -- Dragon Glyphs: Tyrhold
    a[16104] = b:New(16104, 0); -- Dragon Glyphs: Algeth'ar Academy
    a[16105] = b:New(16105, 0); -- Dragon Glyphs: Veiled Ossuary
    a[16106] = b:New(16106, 0); -- Dragon Glyphs: Vault of the Incarnates
    a[16107] = b:New(16107, 0); -- Dragon Glyphs: Thaldraszus Apex
    a[16110] = b:New(16110, 10); -- Subscribed to Hyena Facts
    a[16255] = b:New(16255, 10); -- Brackenhide Hollow
    a[16256] = b:New(16256, 10); -- Heroic: Brackenhide Hollow
    a[16257] = b:New(16257, 10); -- Mythic: Brackenhide Hollow
    a[16260] = b:New(16260, 10); -- Halls of Infusion
    a[16261] = b:New(16261, 10); -- Heroic: Halls of Infusion
    a[16262] = b:New(16262, 10); -- Mythic: Halls of Infusion
    a[16263] = b:New(16263, 10); -- Neltharus
    a[16264] = b:New(16264, 10); -- Heroic: Neltharus
    a[16265] = b:New(16265, 10); -- Mythic: Neltharus
    a[16266] = b:New(16266, 10); -- Ruby Life Pools
    a[16267] = b:New(16267, 10); -- Heroic: Ruby Life Pools
    a[16268] = b:New(16268, 10); -- Mythic: Ruby Life Pools
    a[16269] = b:New(16269, 10); -- Algeth'ar Academy
    a[16270] = b:New(16270, 10); -- Heroic: Algeth'ar Academy
    a[16271] = b:New(16271, 10); -- Mythic: Algeth'ar Academy
    a[16272] = b:New(16272, 10); -- The Azure Vault
    a[16273] = b:New(16273, 10); -- Heroic: The Azure Vault
    a[16274] = b:New(16274, 10); -- Mythic: The Azure Vault
    a[16275] = b:New(16275, 10); -- The Nokhud Offensive
    a[16276] = b:New(16276, 10); -- Heroic: The Nokhud Offensive
    a[16277] = b:New(16277, 10); -- Mythic: The Nokhud Offensive
    a[16278] = b:New(16278, 10); -- Uldaman: Legacy of Tyr
    a[16279] = b:New(16279, 10); -- Heroic: Uldaman: Legacy of Tyr
    a[16280] = b:New(16280, 10); -- Mythic: Uldaman: Legacy of Tyr
    a[16281] = b:New(16281, 10); -- Like Sands Through the Hourglass
    a[16282] = b:New(16282, 10); -- "No, You're Stunning!"
    a[16291] = b:New(16291, 5); -- An Ancient Awakening
    a[16292] = b:New(16292, 5); -- Mastering the Waygates
    a[16294] = b:New(16294, 20); -- Dragonflight Dungeon Hero
    a[16295] = b:New(16295, 25); -- Glory of the Dragonflight Hero
    a[16296] = b:New(16296, 10); -- Growlbossify
    a[16297] = b:New(16297, 5); -- Treasures of The Waking Shores
    a[16298] = b:New(16298, 10); -- Treasure Hunter of the Dragon Isles
    a[16299] = b:New(16299, 5); -- Treasures of the Ohn'ahran Plains
    a[16300] = b:New(16300, 5); -- Treasures of The Azure Span
    a[16301] = b:New(16301, 5); -- Treasures of Thaldraszus
    a[16302] = b:New(16302, 0); -- River Rapids Route: Bronze
    a[16303] = b:New(16303, 0); -- River Rapids Route: Silver
    a[16304] = b:New(16304, 0); -- River Rapids Route: Gold
    a[16305] = b:New(16305, 0); -- River Rapids Route Advanced: Bronze
    a[16306] = b:New(16306, 0); -- River Rapids Route Advanced: Silver
    a[16307] = b:New(16307, 0); -- River Rapids Route Advanced: Gold
    a[16317] = b:New(16317, 0); -- Secret Fishing Spots
    a[16320] = b:New(16320, 10); -- Does Steam Do Fire Damage?
    a[16321] = b:New(16321, 0); -- Cutting Tusk Equipment
    a[16322] = b:New(16322, 0); -- Best in Slot
    a[16323] = b:New(16323, 5); -- Fragments of History
    a[16329] = b:New(16329, 10); -- "Duck, Duck, Spruce!"
    a[16330] = b:New(16330, 10); -- You Must Be Made of Hide
    a[16331] = b:New(16331, 10); -- The Cracked Crystal
    a[16334] = b:New(16334, 0); -- Waking Hope
    a[16335] = b:New(16335, 10); -- What Frozen Things Do
    a[16336] = b:New(16336, 0); -- Azure Spanner
    a[16337] = b:New(16337, 10); -- It's a Trogg Eat Trogg World
    a[16338] = b:New(16338, 5); -- Fang Flap Fire Fighter
    a[16339] = b:New(16339, 10); -- Myths of the Dragonflight Dungeons
    a[16343] = b:New(16343, 10); -- Vault of the Incarnates
    a[16345] = b:New(16345, 10); -- Heroic: Vault of the Incarnates
    a[16346] = b:New(16346, 10); -- Mythic: Eranog
    a[16347] = b:New(16347, 10); -- Mythic: Terros
    a[16348] = b:New(16348, 10); -- Mythic: The Primal Council
    a[16349] = b:New(16349, 10); -- "Mythic: Sennarth, The Cold Breath"
    a[16350] = b:New(16350, 10); -- "Mythic: Dathea, Ascended"
    a[16351] = b:New(16351, 10); -- Mythic: Kurog Grimtotem
    a[16352] = b:New(16352, 10); -- Mythic: Broodkeeper Diurna
    a[16353] = b:New(16353, 10); -- Mythic: Raszageth the Storm-Eater
    a[16354] = b:New(16354, 10); -- Mythic: Vault of the Incarnates
    a[16355] = b:New(16355, 25); -- Glory of the Vault Raider
    a[16363] = b:New(16363, 0); -- Just Don't Ask Me to Spell It
    a[16364] = b:New(16364, 10); -- The Lunker Below
    a[16365] = b:New(16365, 10); -- Little Friends
    a[16395] = b:New(16395, 10); -- Vaulternative Fashion
    a[16398] = b:New(16398, 10); -- Sojourner of Thaldraszus
    a[16399] = b:New(16399, 5); -- Lovin' Lubbins
    a[16400] = b:New(16400, 10); -- Explore the Waking Shores
    a[16401] = b:New(16401, 10); -- Sojourner of the Waking Shores
    a[16402] = b:New(16402, 10); -- Dragon Kill Points
    a[16404] = b:New(16404, 10); -- So You Can Kill This in a Way That Matters...
    a[16405] = b:New(16405, 10); -- Sojourner of Ohn'ahran Plains
    a[16406] = b:New(16406, 10); -- All Sides of the Story
    a[16409] = b:New(16409, 5); -- Let's Get Quacking
    a[16410] = b:New(16410, 5); -- Siege on Dragonbane Keep: Snack Attack
    a[16411] = b:New(16411, 10); -- Siege on Dragonbane Keep: Home Sweet Home
    a[16412] = b:New(16412, 5); -- Siege on Dragonbane Keep: Chiseled Record
    a[16419] = b:New(16419, 10); -- I Was Saving That For Later
    a[16423] = b:New(16423, 10); -- Honor Our Ancestors
    a[16424] = b:New(16424, 10); -- Who's a Good Bakar?
    a[16426] = b:New(16426, 10); -- Hungry Hungry Hornswog
    a[16427] = b:New(16427, 10); -- Go With the Flow
    a[16428] = b:New(16428, 10); -- Sojourner of Azure Span
    a[16429] = b:New(16429, 0); -- Thundering Hero: Dragonflight Season 1
    a[16430] = b:New(16430, 10); -- "All Bark, All Bite"
    a[16431] = b:New(16431, 0); -- Against the Elements
    a[16432] = b:New(16432, 10); -- Ready for Raiding VIII
    a[16434] = b:New(16434, 10); -- See Me After Class
    a[16438] = b:New(16438, 10); -- Knowledge is... Preserved?
    a[16440] = b:New(16440, 10); -- Are You My Broodmother?
    a[16441] = b:New(16441, 10); -- Squad Goals
    a[16442] = b:New(16442, 10); -- Incubation Extermination
    a[16443] = b:New(16443, 10); -- Soupervisor
    a[16444] = b:New(16444, 10); -- Leftovers' Revenge
    a[16445] = b:New(16445, 10); -- Icy What You Did There
    a[16446] = b:New(16446, 10); -- That's Pretty Neat!
    a[16447] = b:New(16447, 10); -- What Are The Chances...
    a[16450] = b:New(16450, 10); -- The Power is MINE!
    a[16451] = b:New(16451, 0); -- The Ol Raszle Daszle
    a[16452] = b:New(16452, 5); -- Famliar Skies
    a[16453] = b:New(16453, 10); -- Liquid Hot Magma
    a[16456] = b:New(16456, 10); -- Weapons of the Maruukai
    a[16457] = b:New(16457, 10); -- Explore the Ohn'ahran Plains
    a[16458] = b:New(16458, 10); -- Nothing But Air
    a[16460] = b:New(16460, 10); -- Explore the Azure Span
    a[16461] = b:New(16461, 10); -- Stormed Off
    a[16462] = b:New(16462, 10); -- The Ohn'ahran Trail
    a[16463] = b:New(16463, 5); -- Thunderstorms in The Waking Shores
    a[16464] = b:New(16464, 10); -- Battle on the Dragon Isles
    a[16465] = b:New(16465, 5); -- Sandstorms in The Waking Shores
    a[16466] = b:New(16466, 5); -- Firestorms in The Waking Shores
    a[16467] = b:New(16467, 5); -- Snowstorms in The Waking Shores
    a[16468] = b:New(16468, 10); -- Chasing Storms in The Waking Shores
    a[16474] = b:New(16474, 5); -- Do You Wanna Build a Snowman?
    a[16475] = b:New(16475, 5); -- Thunderstorms in the Ohn'ahran Plains
    a[16476] = b:New(16476, 10); -- Chasing Storms in the Ohn'ahran Plains
    a[16477] = b:New(16477, 5); -- Sandstorms in the Ohn'ahran Plains
    a[16478] = b:New(16478, 5); -- Firestorms in the Ohn'ahran Plains
    a[16479] = b:New(16479, 5); -- Snowstorms in the Ohn'ahran Plains
    a[16480] = b:New(16480, 5); -- Thunderstorms in The Azure Span
    a[16481] = b:New(16481, 5); -- Sandstorms in The Azure Span
    a[16482] = b:New(16482, 5); -- Firestorms in The Azure Span
    a[16483] = b:New(16483, 5); -- Snowstorms in The Azure Span
    a[16484] = b:New(16484, 10); -- Chasing Storms in The Azure Span
    a[16485] = b:New(16485, 5); -- Thunderstorms in Thaldraszus
    a[16486] = b:New(16486, 5); -- Sandstorms in Thaldraszus
    a[16487] = b:New(16487, 5); -- Firestorms in Thaldraszus
    a[16488] = b:New(16488, 5); -- Snowstorms in Thaldraszus
    a[16489] = b:New(16489, 10); -- Chasing Storms in Thaldraszus
    a[16490] = b:New(16490, 10); -- Storm Chaser
    a[16492] = b:New(16492, 20); -- Into the Storm
    a[16493] = b:New(16493, 5); -- Grand Theft Mammoth
    a[16494] = b:New(16494, 5); -- Loyalty to the Prince
    a[16495] = b:New(16495, 5); -- Obsidian Keymaster
    a[16496] = b:New(16496, 5); -- Obsidian Champion
    a[16497] = b:New(16497, 5); -- I'm Playing All Sides
    a[16498] = b:New(16498, 5); -- Elemental Overflow
    a[16499] = b:New(16499, 5); -- Elemental Overflowing
    a[16500] = b:New(16500, 10); -- Elemental Overload
    a[16501] = b:New(16501, 5); -- Aquatic Battler of the Dragon Isles
    a[16502] = b:New(16502, 0); -- Storming the Runway
    a[16503] = b:New(16503, 5); -- Beast Battler of the Dragon Isles
    a[16504] = b:New(16504, 5); -- Critter Battler of the Dragon Isles
    a[16505] = b:New(16505, 5); -- Dragonkin Battler of the Dragon Isles
    a[16506] = b:New(16506, 5); -- Elemental Battler of the Dragon Isles
    a[16507] = b:New(16507, 5); -- Flying Battler of the Dragon Isles
    a[16508] = b:New(16508, 5); -- Humanoid Battler of the Dragon Isles
    a[16509] = b:New(16509, 5); -- Magic Battler of the Dragon Isles
    a[16510] = b:New(16510, 5); -- Mechanical Battler of the Dragon Isles
    a[16511] = b:New(16511, 5); -- Undead Battler of the Dragon Isles
    a[16512] = b:New(16512, 10); -- Family Battler of the Dragon Isles
    a[16517] = b:New(16517, 10); -- Toxicity Strike Team
    a[16518] = b:New(16518, 10); -- Explore Thaldraszus
    a[16519] = b:New(16519, 5); -- Dragon Isles Safari
    a[16522] = b:New(16522, 5); -- A True Explorer
    a[16528] = b:New(16528, 5); -- Joining the Khansguard
    a[16529] = b:New(16529, 5); -- Joining the Community
    a[16530] = b:New(16530, 5); -- Ally of the Flights
    a[16531] = b:New(16531, 10); -- A Whole Heap of Lunkers
    a[16532] = b:New(16532, 5); -- Friends with Sabellian
    a[16533] = b:New(16533, 10); -- Lots of Lunkers
    a[16536] = b:New(16536, 5); -- True Friends with Wrathion
    a[16537] = b:New(16537, 5); -- Maximum Power!
    a[16539] = b:New(16539, 5); -- In High Esteem
    a[16540] = b:New(16540, 15); -- Hunt Master
    a[16541] = b:New(16541, 10); -- Longhunter
    a[16542] = b:New(16542, 15); -- The Disgruntled Hunter
    a[16543] = b:New(16543, 10); -- Tetrachromancer
    a[16544] = b:New(16544, 5); -- Grand Hunter
    a[16545] = b:New(16545, 15); -- The Best at What I Do
    a[16546] = b:New(16546, 10); -- What's Down There?
    a[16547] = b:New(16547, 10); -- Pulled!
    a[16548] = b:New(16548, 10); -- It Takes a Tuskarr Buddy
    a[16549] = b:New(16549, 40); -- Popular Around the Isles
    a[16550] = b:New(16550, 10); -- Giving Back to Nature
    a[16551] = b:New(16551, 10); -- Giving More Back to Nature
    a[16552] = b:New(16552, 10); -- Giving Even More Back to Nature
    a[16553] = b:New(16553, 10); -- Taking From Nature
    a[16556] = b:New(16556, 10); -- Great Gourmand of The Ruby Feast
    a[16560] = b:New(16560, 10); -- Wildlife Photographer
    a[16561] = b:New(16561, 10); -- "Lunkers, Lunkers Everywhere"
    a[16562] = b:New(16562, 10); -- That's not a Fish...
    a[16563] = b:New(16563, 10); -- We're Going to Need a Bigger Harpoon
    a[16564] = b:New(16564, 10); -- It Takes a Tuskarr Family
    a[16565] = b:New(16565, 10); -- It Takes a Tuskarr Village
    a[16566] = b:New(16566, 5); -- Great Shot!
    a[16567] = b:New(16567, 5); -- A Lot of Great Shots!
    a[16568] = b:New(16568, 10); -- Great Shots Galore!
    a[16569] = b:New(16569, 5); -- Cobalt Enthusiast
    a[16570] = b:New(16570, 10); -- A Legendary Album
    a[16571] = b:New(16571, 10); -- Well Supplied
    a[16572] = b:New(16572, 5); -- Legendary Photograph
    a[16573] = b:New(16573, 5); -- Legendary Photographs
    a[16574] = b:New(16574, 5); -- Sleeping on the Job
    a[16575] = b:New(16575, 20); -- Waking Shores Glyph Hunter
    a[16576] = b:New(16576, 20); -- Ohn'ahran Plains Glyph Hunter
    a[16577] = b:New(16577, 20); -- Azure Span Glyph Hunter
    a[16578] = b:New(16578, 20); -- Thaldraszus Glyph Hunter
    a[16580] = b:New(16580, 10); -- Lend a Helping Span
    a[16581] = b:New(16581, 0); -- Seeing Blue
    a[16583] = b:New(16583, 10); -- Knew You Nokhud Do It!
    a[16584] = b:New(16584, 5); -- Symbols of Hope
    a[16585] = b:New(16585, 0); -- Loremaster of the Dragon Isles
    a[16587] = b:New(16587, 5); -- Lead Climber
    a[16588] = b:New(16588, 5); -- How Did These Get Here?
    a[16589] = b:New(16589, 5); -- Malicia's Challenge
    a[16590] = b:New(16590, 20); -- A Champion's Tour: Dragon Isles
    a[16591] = b:New(16591, 5); -- The Gentleman Elemental
    a[16592] = b:New(16592, 10); -- Tour of Duty: The Waking Shores
    a[16593] = b:New(16593, 10); -- Tour of Duty: Thaldraszus
    a[16594] = b:New(16594, 10); -- Tour of Duty: The Azure Span
    a[16595] = b:New(16595, 10); -- Tour of Duty: Ohn'ahran Plains
    a[16599] = b:New(16599, 10); -- A Champion's Pursuit
    a[16600] = b:New(16600, 10); -- Isles Ascender
    a[16601] = b:New(16601, 25); -- Dragonfight Club
    a[16602] = b:New(16602, 10); -- Nokhud Deed Goes Unnoticed
    a[16603] = b:New(16603, 10); -- Bounty Hunter
    a[16611] = b:New(16611, 10); -- Resource Scavanger
    a[16612] = b:New(16612, 10); -- Bounty Vigalante
    a[16613] = b:New(16613, 20); -- Finder's Keepers
    a[16614] = b:New(16614, 10); -- Bloodstained Bounty
    a[16615] = b:New(16615, 10); -- Blood Bank
    a[16616] = b:New(16616, 10); -- Prosperously Bloody
    a[16620] = b:New(16620, 10); -- Ohuna Incubation
    a[16621] = b:New(16621, 10); -- "One of Everything, Please"
    a[16622] = b:New(16622, 5); -- Three Minutes or It's Free
    a[16623] = b:New(16623, 10); -- Toe Tension
    a[16624] = b:New(16624, 5); -- Which Knot Was It Again?
    a[16625] = b:New(16625, 10); -- Belay On!
    a[16626] = b:New(16626, 10); -- Working with Wyrms
    a[16627] = b:New(16627, 10); -- Professional Draconic Master
    a[16630] = b:New(16630, 50); -- Draconic Master of All
    a[16631] = b:New(16631, 10); -- Dragon Isles Cook
    a[16632] = b:New(16632, 10); -- Dragon Isles Fisherman
    a[16634] = b:New(16634, 10); -- Framing a New Perspective
    a[16638] = b:New(16638, 5); -- Ley Line in the Span
    a[16639] = b:New(16639, 0); -- Keystone Hero: Uldaman: Legacy of Tyr
    O(a[16639], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10);
    a[16640] = b:New(16640, 0); -- Keystone Hero: Ruby Life Pools
    O(a[16640], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16641] = b:New(16641, 0); -- Keystone Hero: The Nokhud Offensive
    O(a[16641], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16642] = b:New(16642, 0); -- Keystone Hero: Brackenhide Hollow
    O(a[16642], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10);
    a[16643] = b:New(16643, 0); -- Keystone Hero: Algeth'ar Academy
    O(a[16643], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16644] = b:New(16644, 0); -- Keystone Hero: Neltharus
    O(a[16644], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10);
    a[16645] = b:New(16645, 0); -- Keystone Hero: The Azure Vault
    O(a[16645], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16646] = b:New(16646, 0); -- Keystone Hero: Halls of Infusion
    O(a[16646], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10);
    a[16647] = b:New(16647, 0); -- Dragonflight Keystone Explorer: Season One
    O(a[16647], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16648] = b:New(16648, 0); -- Dragonflight Keystone Conqueror: Season One
    O(a[16648], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16649] = b:New(16649, 0); -- Dragonflight Keystone Master: Season One
    O(a[16649], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16650] = b:New(16650, 0); -- Dragonflight Keystone Hero: Season One
    O(a[16650], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16658] = b:New(16658, 0); -- Keystone Hero: Court of Stars
    O(a[16658], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16659] = b:New(16659, 0); -- Keystone Hero: Halls of Valor
    O(a[16659], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16660] = b:New(16660, 0); -- Keystone Hero: Shadowmoon Burial Grounds
    O(a[16660], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16661] = b:New(16661, 0); -- Keystone Hero: Temple of the Jade Serpent
    O(a[16661], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9);
    a[16666] = b:New(16666, 5); -- Dragon Glyphs: Gelikyr Overlook
    a[16667] = b:New(16667, 5); -- Dragon Glyphs: Passage of Time
    a[16668] = b:New(16668, 5); -- Dragon Glyphs: Skytop Observatory Rostrum
    a[16669] = b:New(16669, 5); -- Dragon Glyphs: Flashfrost Enclave
    a[16670] = b:New(16670, 5); -- Dragon Glyphs: Rubyscale Outpost
    a[16671] = b:New(16671, 5); -- Dragon Glyphs: Mirewood Fen
    a[16672] = b:New(16672, 5); -- Dragon Glyphs: Forkriver Crossing
    a[16673] = b:New(16673, 5); -- Dragon Glyphs: The Fallen Course
    a[16676] = b:New(16676, 5); -- Adventurer of The Waking Shores
    a[16677] = b:New(16677, 5); -- Adventurer of the Ohn'ahran Plains
    a[16678] = b:New(16678, 0); -- Adventurer of The Azure Span
    a[16679] = b:New(16679, 5); -- Adventurer of Thaldraszus
    a[16683] = b:New(16683, 15); -- In Tyr's Footsteps
    a[16729] = b:New(16729, 10); -- To All the Squirrels Hidden Til Now
    a[16730] = b:New(16730, 0); -- Crimson Gladiator's Drake
    O(a[16730], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[16731] = b:New(16731, 10); -- Court is Now in Session
    a[16734] = b:New(16734, 0); -- Crimson Soloist: Dragonflight Season 1
    O(a[16734], "From", "PvP Season", 34, "Until", "PvP Season", 34);
    a[16736] = b:New(16736, 10); -- Grand Theft Mammoth
    a[16758] = b:New(16758, 0); -- "Ready, Aim, Catalog!"
    a[16760] = b:New(16760, 10); -- The Obsidian Bloodline

    local aIDs = {};
    for i = 1, 16760 do
        if a[i] ~= nil then
            tinsert(aIDs, i);
        end
    end

    return aIDs;
end

