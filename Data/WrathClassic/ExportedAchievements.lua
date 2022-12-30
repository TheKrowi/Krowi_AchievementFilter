-- [[ Exported at 2022-12-30 10-49-54 ]] --
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
    O(a[13], "From", "Version", "030400", "Before", "Version", "090001");
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
    a[41] = b:New(41, 10, fac.Alliance); -- Loremaster of Northrend
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
    O(a[135], "From", "Version", "030400", "Before", "Version", "080001");
    a[137] = b:New(137, 0); -- Stocking Up
    O(a[137], "From", "Version", "030400", "Before", "Version", "080001");
    a[141] = b:New(141, 0); -- Ultimate Triage
    O(a[141], "From", "Version", "030400", "Before", "Version", "080001");
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
    O(a[404], "From", "Version", "030400", "Before", "Version", "070003");
    a[405] = b:New(405, 10); -- Three's Company: 2000
    a[406] = b:New(406, 0); -- High Five: 1550
    O(a[406], "From", "Version", "030400", "Before", "Version", "070003");
    a[407] = b:New(407, 0); -- High Five: 1750
    O(a[407], "From", "Version", "030400", "Before", "Version", "070003");
    a[408] = b:New(408, 10); -- Hot Streak
    a[409] = b:New(409, 0); -- Last Man Standing
    O(a[409], "From", "Version", "030400", "Before", "Version", "070003");
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
    O(a[556], "From", "Version", "030400", "Before", "Version", "080001");
    a[557] = b:New(557, 0); -- Superior
    O(a[557], "From", "Version", "030400", "Before", "Version", "080001");
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
    O(a[730], "From", "Version", "030400", "Before", "Version", "080001");
    a[731] = b:New(731, 10); -- Professional Expert
    a[732] = b:New(732, 10); -- Professional Classic Master
    a[733] = b:New(733, 10); -- Professional Outland Master
    a[734] = b:New(734, 10); -- Professional Northrend Master
    a[735] = b:New(735, 10); -- Working In the Cold
    a[736] = b:New(736, 10); -- Explore Mulgore
    a[750] = b:New(750, 10); -- Explore Northern Barrens
    a[760] = b:New(760, 10); -- Explore Alterac Mountains
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
    a[970] = b:New(970, 20, fac.Alliance); -- Tricks and Treats of Azeroth
    a[971] = b:New(971, 20, fac.Horde); -- Tricks and Treats of Azeroth
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
    O(a[1161], "From", "Version", "030400", "Before", "Version", "070003");
    a[1162] = b:New(1162, 10); -- Hotter Streak
    a[1164] = b:New(1164, 10, fac.Horde, 225); -- Everything Counts
    a[1165] = b:New(1165, 10); -- "My Storage is ""Gigantique"""
    a[1166] = b:New(1166, 10); -- To the Looter Go the Spoils
    a[1167] = b:New(1167, 25, fac.Alliance); -- Master of Alterac Valley
    a[1168] = b:New(1168, 25, fac.Horde); -- Master of Alterac Valley
    a[1169] = b:New(1169, 25, fac.Alliance); -- Master of Arathi Basin
    a[1170] = b:New(1170, 25, fac.Horde); -- Master of Arathi Basin
    a[1171] = b:New(1171, 25); -- Master of Eye of the Storm
    a[1172] = b:New(1172, 25, fac.Alliance); -- Master of Warsong Gulch
    a[1173] = b:New(1173, 25, fac.Horde); -- Master of Warsong Gulch
    a[1174] = b:New(1174, 0); -- The Arena Master
    O(a[1174], "From", "Version", "030400", "Before", "Version", "070003");
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
    a[1187] = b:New(1187, 10); -- The Keymaster
    O(a[1187], "From", "Version", "030002", "Before", "Version", "040003a");
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
    a[1262] = b:New(1262, 10, fac.Alliance); -- Loremaster of Outland
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
    a[1274] = b:New(1274, 10, fac.Horde); -- Loremaster of Outland
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
    O(a[1308], "From", "Version", "030400", "Before", "Version", "080001");
    a[1309] = b:New(1309, 0); -- Strand of the Ancients Veteran
    O(a[1309], "From", "Version", "030400", "Before", "Version", "080001");
    a[1310] = b:New(1310, 0); -- Storm the Beach
    O(a[1310], "From", "Version", "030400", "Before", "Version", "080001");
    a[1311] = b:New(1311, 10); -- Medium Rare
    a[1312] = b:New(1312, 25); -- Bloody Rare
    a[1356] = b:New(1356, 10, fac.Horde, 34); -- I've Toured the Fjord
    a[1357] = b:New(1357, 10, fac.Horde, 37); -- Fo' Grizzle My Shizzle
    a[1358] = b:New(1358, 10, fac.Horde, 33); -- Nothing Boring About Borean
    a[1359] = b:New(1359, 10, fac.Horde, 35); -- Might of Dragonblight
    a[1360] = b:New(1360, 10, fac.Horde); -- Loremaster of Northrend
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
    a[1563] = b:New(1563, 10, fac.Alliance); -- Hail to the Chef
    a[1576] = b:New(1576, 10); -- Of Blood and Anguish
    a[1596] = b:New(1596, 10); -- Guru of Drakuru
    a[1636] = b:New(1636, 0); -- Competitor's Tabard
    O(a[1636]);
    a[1637] = b:New(1637, 0); -- Spirit of Competition
    O(a[1637]);
    a[1638] = b:New(1638, 10); -- Skyshattered
    a[1656] = b:New(1656, 10, fac.Alliance); -- Hallowed Be Thy Name
    a[1657] = b:New(1657, 10, fac.Horde); -- Hallowed Be Thy Name
    a[1658] = b:New(1658, 10); -- Champion of the Frozen Wastes
    a[1676] = b:New(1676, 10, fac.Alliance); -- Loremaster of Eastern Kingdoms
    a[1677] = b:New(1677, 10, fac.Horde); -- Loremaster of Eastern Kingdoms
    a[1678] = b:New(1678, 10, fac.Alliance); -- Loremaster of Kalimdor
    a[1680] = b:New(1680, 10, fac.Horde); -- Loremaster of Kalimdor
    a[1681] = b:New(1681, 10, fac.Alliance); -- The Loremaster
    a[1682] = b:New(1682, 10, fac.Horde); -- The Loremaster
    a[1683] = b:New(1683, 10, fac.Horde); -- Brewmaster
    a[1684] = b:New(1684, 10, fac.Alliance); -- Brewmaster
    a[1685] = b:New(1685, 10, fac.Horde, 1686); -- Holiday Bromance
    a[1686] = b:New(1686, 10, fac.Alliance, 1685); -- Holiday Bromance
    a[1687] = b:New(1687, 10); -- Let It Snow
    a[1688] = b:New(1688, 10); -- The Winter Veil Gourmet
    a[1689] = b:New(1689, 10); -- He Knows If You've Been Naughty
    a[1690] = b:New(1690, 10); -- A Frosty Shake
    a[1691] = b:New(1691, 10, fac.Horde); -- Merrymaker
    a[1692] = b:New(1692, 10, fac.Alliance); -- Merrymaker
    a[1693] = b:New(1693, 10, fac.Horde); -- Fool For Love
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
    a[1707] = b:New(1707, 10, fac.Alliance); -- Fool For Love
    a[1717] = b:New(1717, 10); -- Wintergrasp Victory
    a[1718] = b:New(1718, 10); -- Wintergrasp Veteran
    a[1721] = b:New(1721, 10); -- Archavon the Stone Watcher (25 player)
    a[1722] = b:New(1722, 10); -- Archavon the Stone Watcher (10 player)
    a[1723] = b:New(1723, 10); -- Vehicular Gnomeslaughter
    a[1727] = b:New(1727, 10); -- Leaning Tower
    a[1737] = b:New(1737, 10, fac.Alliance, 2476); -- Destruction Derby
    a[1751] = b:New(1751, 10); -- Didn't Stand a Chance
    a[1752] = b:New(1752, 10, fac.Alliance); -- Master of Wintergrasp
    a[1755] = b:New(1755, 10); -- Within Our Grasp
    a[1757] = b:New(1757, 0, fac.Alliance, 2200); -- Defense of the Ancients
    O(a[1757], "From", "Version", "030400", "Before", "Version", "080001");
    a[1761] = b:New(1761, 0); -- The Dapper Sapper
    O(a[1761], "From", "Version", "030400", "Before", "Version", "080001");
    a[1762] = b:New(1762, 0, fac.Alliance, 2192); -- Not Even a Scratch
    O(a[1762], "From", "Version", "030400", "Before", "Version", "080001");
    a[1763] = b:New(1763, 0); -- Artillery Veteran
    O(a[1763], "From", "Version", "030400", "Before", "Version", "080001");
    a[1764] = b:New(1764, 0); -- Drop It!
    O(a[1764], "From", "Version", "030400", "Before", "Version", "080001");
    a[1765] = b:New(1765, 0); -- Steady Hands
    O(a[1765], "From", "Version", "030400", "Before", "Version", "080001");
    a[1766] = b:New(1766, 0); -- Ancient Protector
    O(a[1766], "From", "Version", "030400", "Before", "Version", "080001");
    a[1777] = b:New(1777, 10); -- The Northrend Gourmet
    a[1778] = b:New(1778, 10); -- The Northrend Gourmet
    a[1779] = b:New(1779, 10); -- The Northrend Gourmet
    a[1780] = b:New(1780, 10); -- Second That Emotion
    a[1781] = b:New(1781, 10); -- Critter Gitter
    a[1782] = b:New(1782, 10, fac.Alliance, 1783); -- Our Daily Bread
    a[1783] = b:New(1783, 10, fac.Horde, 1782); -- Our Daily Bread
    a[1784] = b:New(1784, 10, fac.Horde); -- Hail to the Chef
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
    O(a[2018], "From", "Version", "030400", "Before", "Version", "030700");
    a[2019] = b:New(2019, 0); -- Proof of Demise
    O(a[2019], "From", "Version", "030400", "Before", "Version", "030700");
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
    O(a[2085], "From", "Version", "030400", "Before", "Version", "040001");
    a[2086] = b:New(2086, 0); -- 100 Stone Keeper's Shards
    O(a[2086], "From", "Version", "030400", "Before", "Version", "040001");
    a[2087] = b:New(2087, 0); -- 250 Stone Keeper's Shards
    O(a[2087], "From", "Version", "030400", "Before", "Version", "040001");
    a[2088] = b:New(2088, 0); -- 500 Stone Keeper's Shards
    O(a[2088], "From", "Version", "030400", "Before", "Version", "040001");
    a[2089] = b:New(2089, 0); -- 1000 Stone Keeper's Shards
    O(a[2089], "From", "Version", "030400", "Before", "Version", "040001");
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
    a[2144] = b:New(2144, 50, fac.Alliance); -- "What a Long, Strange Trip It's Been"
    a[2145] = b:New(2145, 50, fac.Horde); -- "What A Long, Strange Trip It's Been"
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
    O(a[2186], "From", "Version", "030400", "Before", "Version", "040003a");
    a[2187] = b:New(2187, 0); -- The Undying
    O(a[2187], "From", "Version", "030400", "Before", "Version", "040003a");
    a[2188] = b:New(2188, 0); -- Leeeeeeeeeeeeeroy!
    O(a[2188], "From", "Version", "030002", "Before", "Version", "060002");
    a[2189] = b:New(2189, 0); -- Artillery Expert
    O(a[2189], "From", "Version", "030400", "Before", "Version", "080001");
    a[2190] = b:New(2190, 0); -- Drop It Now!
    O(a[2190], "From", "Version", "030400", "Before", "Version", "080001");
    a[2191] = b:New(2191, 0); -- Ancient Courtyard Protector
    O(a[2191], "From", "Version", "030400", "Before", "Version", "080001");
    a[2192] = b:New(2192, 0, fac.Horde, 1762); -- Not Even a Scratch
    O(a[2192], "From", "Version", "030400", "Before", "Version", "080001");
    a[2193] = b:New(2193, 0); -- Explosives Expert
    O(a[2193], "From", "Version", "030400", "Before", "Version", "080001");
    a[2194] = b:New(2194, 0, fac.Alliance); -- Master of Strand of the Ancients
    O(a[2194], "From", "Version", "030400", "Before", "Version", "080001");
    a[2195] = b:New(2195, 25, fac.Horde); -- Master of Strand of the Ancients
    O(a[2195], "From", "Version", "030400", "Before", "Version", "080001");
    a[2199] = b:New(2199, 10); -- Wintergrasp Ranger
    a[2200] = b:New(2200, 0, fac.Horde, 1757); -- Defense of the Ancients
    O(a[2200], "From", "Version", "030400", "Before", "Version", "080001");
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
    O(a[2716], "From", "Version", "030400", "Before", "Version", "070003");
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
    a[2776] = b:New(2776, 10, fac.Horde); -- Master of Wintergrasp
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
    a[2797] = b:New(2797, 10, fac.Alliance); -- Noble Gardener
    a[2798] = b:New(2798, 10, fac.Horde); -- Noble Gardener
    a[2816] = b:New(2816, 10, fac.Horde, 2817); -- Exalted Argent Champion of the Horde
    a[2817] = b:New(2817, 10, fac.Alliance, 2816); -- Exalted Argent Champion of the Alliance
    a[2836] = b:New(2836, 10); -- Lance a Lot
    a[2886] = b:New(2886, 0); -- The Siege of Ulduar (10 player)
    a[2887] = b:New(2887, 0); -- The Siege of Ulduar (25 player)
    a[2888] = b:New(2888, 0); -- The Antechamber of Ulduar (10 player)
    a[2889] = b:New(2889, 0); -- The Antechamber of Ulduar (25 player)
    a[2890] = b:New(2890, 0); -- The Keepers of Ulduar (10 player)
    a[2891] = b:New(2891, 0); -- The Keepers of Ulduar (25 player)
    a[2892] = b:New(2892, 0); -- The Descent into Madness (10 player)
    a[2893] = b:New(2893, 0); -- The Descent into Madness (25 player)
    a[2894] = b:New(2894, 0); -- The Secrets of Ulduar (10 player)
    a[2895] = b:New(2895, 0); -- The Secrets of Ulduar (25 player)
    a[2903] = b:New(2903, 0); -- Champion of Ulduar
    a[2904] = b:New(2904, 0); -- Conqueror of Ulduar
    a[2905] = b:New(2905, 0); -- Unbroken (10 player)
    a[2906] = b:New(2906, 0); -- Unbroken (25 player)
    a[2907] = b:New(2907, 0); -- Three Car Garage (10 player)
    a[2908] = b:New(2908, 0); -- Three Car Garage (25 player)
    a[2909] = b:New(2909, 0); -- Take Out Those Turrets (10 player)
    a[2910] = b:New(2910, 0); -- Take Out Those Turrets (25 player)
    a[2911] = b:New(2911, 0); -- Shutout (10 player)
    a[2912] = b:New(2912, 0); -- Shutout (25 player)
    a[2913] = b:New(2913, 0); -- Orbital Bombardment (10 player)
    a[2914] = b:New(2914, 0); -- Orbital Devastation (10 player)
    a[2915] = b:New(2915, 0); -- Nuked from Orbit (10 player)
    a[2916] = b:New(2916, 0); -- Orbital Devastation (25 player)
    a[2917] = b:New(2917, 0); -- Nuked from Orbit (25 player)
    a[2918] = b:New(2918, 0); -- Orbital Bombardment (25 player)
    a[2919] = b:New(2919, 0); -- A Quick Shave (10 player)
    a[2921] = b:New(2921, 0); -- A Quick Shave (25 player)
    a[2923] = b:New(2923, 0); -- "Iron Dwarf, Medium Rare (10 player)"
    a[2924] = b:New(2924, 0); -- "Iron Dwarf, Medium Rare (25 player)"
    a[2925] = b:New(2925, 0); -- Shattered (10 player)
    a[2926] = b:New(2926, 0); -- Shattered (25 player)
    a[2927] = b:New(2927, 0); -- Hot Pocket (10 player)
    a[2928] = b:New(2928, 0); -- Hot Pocket (25 player)
    a[2929] = b:New(2929, 0); -- Stokin' the Furnace (25 player)
    a[2930] = b:New(2930, 0); -- Stokin' the Furnace (10 player)
    a[2931] = b:New(2931, 0); -- Nerf Engineering (10 player)
    a[2932] = b:New(2932, 0); -- Nerf Engineering (25 player)
    a[2933] = b:New(2933, 0); -- Nerf Scrapbots (10 player)
    a[2934] = b:New(2934, 0); -- Nerf Gravity Bombs (10 player)
    a[2935] = b:New(2935, 0); -- Nerf Scrapbots (25 player)
    a[2936] = b:New(2936, 0); -- Nerf Gravity Bombs (25 player)
    a[2937] = b:New(2937, 0); -- Must Deconstruct Faster (10 player)
    a[2938] = b:New(2938, 0); -- Must Deconstruct Faster (25 player)
    a[2939] = b:New(2939, 0); -- "I Choose You, Runemaster Molgeim (10 player)"
    a[2940] = b:New(2940, 0); -- "I Choose You, Stormcaller Brundir (10 player)"
    a[2941] = b:New(2941, 0); -- "I Choose You, Steelbreaker (10 player)"
    a[2942] = b:New(2942, 0); -- "I Choose You, Runemaster Molgeim (25 player)"
    a[2943] = b:New(2943, 0); -- "I Choose You, Stormcaller Brundir (25 player)"
    a[2944] = b:New(2944, 0); -- "I Choose You, Steelbreaker (25 player)"
    a[2945] = b:New(2945, 0); -- But I'm On Your Side (10 player)
    a[2946] = b:New(2946, 0); -- But I'm On Your Side (25 player)
    a[2947] = b:New(2947, 0); -- Can't Do That While Stunned (10 player)
    a[2948] = b:New(2948, 0); -- Can't Do That While Stunned (25 player)
    a[2951] = b:New(2951, 0); -- With Open Arms (10 player)
    a[2952] = b:New(2952, 0); -- With Open Arms (25 player)
    a[2953] = b:New(2953, 0); -- Disarmed (10 player)
    a[2954] = b:New(2954, 0); -- Disarmed (25 player)
    a[2955] = b:New(2955, 0); -- If Looks Could Kill (10 player)
    a[2956] = b:New(2956, 0); -- If Looks Could Kill (25 player)
    a[2957] = b:New(2957, 0); -- Glory of the Ulduar Raider (10 player)
    a[2958] = b:New(2958, 0); -- Glory of the Ulduar Raider (25 player)
    a[2959] = b:New(2959, 0); -- Rubble and Roll (10 player)
    a[2960] = b:New(2960, 0); -- Rubble and Roll (25 player)
    a[2961] = b:New(2961, 0); -- Cheese the Freeze (10 player)
    a[2962] = b:New(2962, 0); -- Cheese the Freeze (25 player)
    a[2963] = b:New(2963, 0); -- I Have the Coolest Friends (10 player)
    a[2965] = b:New(2965, 0); -- I Have the Coolest Friends (25 player)
    a[2967] = b:New(2967, 0); -- Getting Cold in Here (10 player)
    a[2968] = b:New(2968, 0); -- Getting Cold in Here (25 player)
    a[2969] = b:New(2969, 0); -- Staying Buffed All Winter (10 player)
    a[2970] = b:New(2970, 0); -- Staying Buffed All Winter (25 player)
    a[2971] = b:New(2971, 0); -- Don't Stand in the Lightning (10 player)
    a[2972] = b:New(2972, 0); -- Don't Stand in the Lightning (25 player)
    a[2973] = b:New(2973, 0); -- I'll Take You All On (10 player)
    a[2974] = b:New(2974, 0); -- I'll Take You All On (25 player)
    a[2975] = b:New(2975, 0); -- Who Needs Bloodlust? (10 player)
    a[2976] = b:New(2976, 0); -- Who Needs Bloodlust? (25 player)
    a[2977] = b:New(2977, 0); -- Siffed (10 player)
    a[2978] = b:New(2978, 0); -- Siffed (25 player)
    a[2979] = b:New(2979, 0); -- Lumberjacked (10 player)
    a[2980] = b:New(2980, 0); -- Con-speed-atory (10 player)
    a[2981] = b:New(2981, 0); -- Con-speed-atory (25 player)
    a[2982] = b:New(2982, 0); -- Getting Back to Nature (10 player)
    a[2983] = b:New(2983, 0); -- Getting Back to Nature (25 player)
    a[2984] = b:New(2984, 0); -- Deforestation (25 player)
    a[2985] = b:New(2985, 0); -- Deforestation (10 player)
    a[2989] = b:New(2989, 0); -- Set Up Us the Bomb (10 player)
    a[2995] = b:New(2995, 0); -- Not-So-Friendly Fire (25 player)
    a[2996] = b:New(2996, 0); -- Shadowdodger (10 player)
    a[2997] = b:New(2997, 0); -- Shadowdodger (25 player)
    a[3002] = b:New(3002, 0); -- Supermassive (25 player)
    a[3003] = b:New(3003, 0); -- Supermassive (10 player)
    a[3004] = b:New(3004, 0); -- He Feeds On Your Tears (10 player)
    O(a[3004], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3005] = b:New(3005, 0); -- He Feeds On Your Tears (25 player)
    O(a[3005], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3006] = b:New(3006, 0); -- Crazy Cat Lady (10 player)
    a[3007] = b:New(3007, 0); -- Crazy Cat Lady (25 player)
    a[3008] = b:New(3008, 0); -- Drive Me Crazy (10 player)
    a[3009] = b:New(3009, 0); -- Kiss and Make Up (10 player)
    a[3010] = b:New(3010, 0); -- Drive Me Crazy (25 player)
    a[3011] = b:New(3011, 0); -- Kiss and Make Up (25 player)
    a[3012] = b:New(3012, 0); -- He's Not Getting Any Older (10 player)
    a[3013] = b:New(3013, 0); -- He's Not Getting Any Older (25 player)
    a[3014] = b:New(3014, 0); -- They're Coming Out of the Walls (10 player)
    a[3015] = b:New(3015, 0); -- In His House He Waits Dreaming (10 player)
    a[3016] = b:New(3016, 0); -- In His House He Waits Dreaming (25 player)
    a[3017] = b:New(3017, 0); -- They're Coming Out of the Walls (25 player)
    a[3036] = b:New(3036, 0); -- Observed (10 player)
    a[3037] = b:New(3037, 0); -- Observed (25 player)
    a[3056] = b:New(3056, 0); -- Orbit-uary (10 player)
    a[3057] = b:New(3057, 0); -- Orbit-uary (25 player)
    a[3058] = b:New(3058, 0); -- Heartbreaker (10 player)
    a[3059] = b:New(3059, 0); -- Heartbreaker (25 player)
    a[3076] = b:New(3076, 0); -- Nine Lives (10 player)
    a[3077] = b:New(3077, 0); -- Nine Lives (25 player)
    a[3096] = b:New(3096, 0); -- Deadly Gladiator's Frost Wyrm
    O(a[3096], "From", "PvP Season", 5, "Until", "PvP Season", 5);
    a[3097] = b:New(3097, 0); -- Dwarfageddon (10 player)
    a[3098] = b:New(3098, 0); -- Dwarfageddon (25 player)
    a[3117] = b:New(3117, 0, nil, nil, true); -- Realm First! Death's Demise
    O(a[3117], "Once");
    a[3118] = b:New(3118, 0); -- Lumberjacked (25 player)
    a[3136] = b:New(3136, 10); -- Emalon the Storm Watcher (10 player)
    a[3137] = b:New(3137, 10); -- Emalon the Storm Watcher (25 player)
    a[3138] = b:New(3138, 0); -- Not-So-Friendly Fire (10 player)
    a[3141] = b:New(3141, 0); -- Two Lights in the Darkness (10 player)
    a[3142] = b:New(3142, 0); -- "Val'anyr, Hammer of Ancient Kings"
    a[3157] = b:New(3157, 0); -- Three Lights in the Darkness (10 player)
    a[3158] = b:New(3158, 0); -- One Light in the Darkness (10 player)
    a[3159] = b:New(3159, 0); -- Alone in the Darkness (10 player)
    a[3161] = b:New(3161, 0); -- Three Lights in the Darkness (25 player)
    a[3162] = b:New(3162, 0); -- Two Lights in the Darkness (25 player)
    a[3163] = b:New(3163, 0); -- One Light in the Darkness (25 player)
    a[3164] = b:New(3164, 0); -- Alone in the Darkness (25 player)
    a[3176] = b:New(3176, 0); -- Lose Your Illusion (10 player)
    a[3177] = b:New(3177, 0); -- Knock on Wood (10 player)
    a[3178] = b:New(3178, 0); -- "Knock, Knock on Wood (10 player)"
    a[3179] = b:New(3179, 0); -- "Knock, Knock, Knock on Wood (10 player)"
    a[3180] = b:New(3180, 0); -- Firefighter (10 player)
    a[3181] = b:New(3181, 0); -- I Love the Smell of Saronite in the Morning (10 player)
    a[3182] = b:New(3182, 0); -- I Could Say That This Cache Was Rare (10 player)
    a[3183] = b:New(3183, 0); -- Lose Your Illusion (25 player)
    a[3184] = b:New(3184, 0); -- I Could Say That This Cache Was Rare (25 player)
    a[3185] = b:New(3185, 0); -- Knock on Wood (25 player)
    a[3186] = b:New(3186, 0); -- "Knock, Knock on Wood (25 player)"
    a[3187] = b:New(3187, 0); -- "Knock, Knock, Knock on Wood (25 player)"
    a[3188] = b:New(3188, 0); -- I Love the Smell of Saronite in the Morning (25 player)
    a[3189] = b:New(3189, 0); -- Firefighter (25 player)
    a[3217] = b:New(3217, 10); -- Chasing Marcia
    a[3218] = b:New(3218, 10); -- Turtles All the Way Down
    a[3237] = b:New(3237, 0); -- Set Up Us the Bomb (25 player)
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
    a[3478] = b:New(3478, 10, fac.Alliance); -- Pilgrim
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
    a[3656] = b:New(3656, 10, fac.Horde); -- Pilgrim
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
    O(a[3808], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3809] = b:New(3809, 0); -- A Tribute to Mad Skill (10 player)
    O(a[3809], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3810] = b:New(3810, 0); -- A Tribute to Insanity (10 player)
    O(a[3810], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3812] = b:New(3812, 10); -- Call of the Grand Crusade (25 player)
    a[3813] = b:New(3813, 10); -- Upper Back Pain (25 player)
    a[3814] = b:New(3814, 10); -- Resilience Will Fix It (25 player)
    O(a[3814], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3815] = b:New(3815, 10); -- Salt and Pepper (25 player)
    a[3816] = b:New(3816, 10); -- The Traitor King (25 player)
    a[3817] = b:New(3817, 0); -- A Tribute to Skill (25 player)
    O(a[3817], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3818] = b:New(3818, 0); -- A Tribute to Mad Skill (25 player)
    O(a[3818], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3819] = b:New(3819, 0); -- A Tribute to Insanity (25 player)
    O(a[3819], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3836] = b:New(3836, 10); -- Koralon the Flame Watcher (10 player)
    a[3837] = b:New(3837, 10); -- Koralon the Flame Watcher (25 player)
    a[3838] = b:New(3838, 10); -- Dungeon & Raid Emblem
    O(a[3838], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3839] = b:New(3839, 10); -- 25 Dungeon & Raid Emblems
    O(a[3839], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3840] = b:New(3840, 10); -- 50 Dungeon & Raid Emblems
    O(a[3840], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3841] = b:New(3841, 10); -- 100 Dungeon & Raid Emblems
    O(a[3841], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3842] = b:New(3842, 10); -- 250 Dungeon & Raid Emblems
    O(a[3842], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3843] = b:New(3843, 10); -- 500 Dungeon & Raid Emblems
    O(a[3843], "From", "Version", "030400", "Before", "Version", "040003a");
    a[3844] = b:New(3844, 0); -- 1000 Dungeon & Raid Emblems
    O(a[3844], "From", "Version", "030400", "Before", "Version", "040003a");
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
    a[3876] = b:New(3876, 10); -- 1500 Dungeon & Raid Emblems
    O(a[3876], "From", "Version", "030400", "Before", "Version", "040003a");
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
    O(a[4079], "From", "Version", "030400", "Before", "Version", "040003a");
    a[4080] = b:New(4080, 0); -- A Tribute to Dedicated Insanity
    O(a[4080], "From", "Version", "030400", "Before", "Version", "040003a");
    a[4156] = b:New(4156, 0, fac.Alliance, 4079); -- A Tribute to Immortality
    O(a[4156], "From", "Version", "030400", "Before", "Version", "040003a");
    a[4176] = b:New(4176, 10, fac.Horde, 3846); -- Resource Glut
    a[4177] = b:New(4177, 10, fac.Horde, 3851); -- Mine
    a[4256] = b:New(4256, 10, fac.Horde, 3856); -- Demolition Derby
    a[4296] = b:New(4296, 10, fac.Alliance, 3778); -- Trial of the Champion
    a[4297] = b:New(4297, 10, fac.Horde, 4298); -- Heroic: Trial of the Champion
    a[4298] = b:New(4298, 10, fac.Alliance, 4297); -- Heroic: Trial of the Champion
    a[4316] = b:New(4316, 0); -- 2500 Dungeon & Raid Emblems
    O(a[4316], "From", "Version", "030400", "Before", "Version", "040003a");
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
    a[4784] = b:New(4784, 0, fac.Alliance); -- Emblematic
    O(a[4784], "From", "Version", "030400", "Before", "Version", "040003a");
    a[4785] = b:New(4785, 0, fac.Horde); -- Emblematic
    O(a[4785], "From", "Version", "030400", "Before", "Version", "040003a");
    a[4786] = b:New(4786, 0, fac.Alliance); -- Operation: Gnomeregan
    O(a[4786], "From", "Version", "030400", "Before", "Version", "040001");
    a[4790] = b:New(4790, 0, fac.Horde); -- Zalazane's Fall
    O(a[4790], "From", "Version", "030400", "Before", "Version", "040001");
    a[4815] = b:New(4815, 10); -- The Twilight Destroyer (25 player)
    a[4816] = b:New(4816, 10); -- Heroic: The Twilight Destroyer (25 player)
    a[4817] = b:New(4817, 10); -- The Twilight Destroyer (10 player)
    a[4818] = b:New(4818, 10); -- Heroic: The Twilight Destroyer (10 player)
    a[4824] = b:New(4824, 0); -- Collector's Edition: Mini Thor
    a[15330] = b:New(15330, 0); -- Survivor of the Firelord (Season of Mastery)
    O(a[15330], "Never");
    a[15333] = b:New(15333, 0); -- Survivor of the Shadow Flame (Season of Mastery)
    O(a[15333], "Never");
    a[15334] = b:New(15334, 0); -- Survivor of the Old God (Season of Mastery)
    O(a[15334], "Never");
    a[15335] = b:New(15335, 0); -- Survivor of the Damned (Season of Mastery)
    O(a[15335], "Never");
    a[15637] = b:New(15637, 0); -- The Immortal (Season of Mastery)
    O(a[15637], "Never");
    a[16332] = b:New(16332, 0); -- The Perfect Pebble
    a[16433] = b:New(16433, 0); -- Soul of Iron (Season of Mastery)
    O(a[16433], "Never");
    a[17213] = b:New(17213, 10); -- Defense Protocol Alpha: Utgarde Keep
    a[17283] = b:New(17283, 10); -- Defense Protocol Alpha: The Nexus
    a[17285] = b:New(17285, 10); -- Defense Protocol Alpha: Azjol-Nerub
    a[17291] = b:New(17291, 10); -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
    a[17292] = b:New(17292, 10); -- Defense Protocol Alpha: Drak'Tharon Keep
    a[17293] = b:New(17293, 10); -- Defense Protocol Alpha: The Violet Hold
    a[17295] = b:New(17295, 10); -- Defense Protocol Alpha: Gundrak
    a[17297] = b:New(17297, 10); -- Defense Protocol Alpha: Halls of Stone
    a[17299] = b:New(17299, 10); -- Defense Protocol Alpha: Halls of Lightning
    a[17300] = b:New(17300, 10); -- Defense Protocol Alpha: The Oculus
    a[17301] = b:New(17301, 10); -- Defense Protocol Alpha: Utgarde Pinnacle
    a[17302] = b:New(17302, 10); -- Defense Protocol Alpha: The Culling of Stratholme
    a[17304] = b:New(17304, 20); -- Defense Protocol Alpha: Terminated

    local aIDs = {};
    for i = 1, 17332 do
        if a[i] ~= nil then
            tinsert(aIDs, i);
        end
    end

    return aIDs;
end

