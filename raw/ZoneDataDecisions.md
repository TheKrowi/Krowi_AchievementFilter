# Zone Data Decisions Log

Records every achievement evaluated for zone placement — added, already present, or skipped with reason.
Update this file whenever a zone placement decision is made via the `add-zone-data` skill.

**Highest ID Analyzed: 300**

## Main Log

| ID | Title | Decision | Zone ID | Zone Name | Reason | Date |
|---|---|---|---|---|---|---|
| 6 | Level 10 | ⏭ skipped | — | — | Level milestone; no geographic association | 2026-07-04 |
| 7 | Level 20 | ⏭ skipped | — | — | Level milestone; no geographic association | 2026-07-04 |
| 8 | Level 30 | ⏭ skipped | — | — | Level milestone; no geographic association | 2026-07-04 |
| 9 | Level 40 | ⏭ skipped | — | — | Level milestone; no geographic association | 2026-07-04 |
| 10 | Level 50 (Legacy) | ⏭ skipped | — | — | Character progression achievement; no geographic association | 2026-07-04 |
| 11 | Level 60 (Legacy) | ⏭ skipped | — | — | Character progression achievement; no geographic association | 2026-07-04 |
| 12 | Level 70 (Legacy) | ⏭ skipped | — | — | Character progression achievement; no geographic association | 2026-07-04 |
| 13 | Level 80 (Legacy) | ⏭ skipped | — | — | Character progression achievement; no geographic association | 2026-07-04 |
| 15 | Plenty of Pets | ⏭ skipped | — | — | Pet collection achievement; no geographic association | 2026-07-04 |
| 16 | Did Somebody Order a Knuckle Sandwich? | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-04 |
| 31 | A Simple Re-Quest | ⏭ skipped | — | — | Daily quest streak achievement; no geographic association | 2026-07-04 |
| 32 | 2000 Quests Completed | ⏭ skipped | — | — | General quest count achievement; no geographic association | 2026-07-04 |
| 33 | Nothing Boring About Borean | ✅ already present | 114 | Borean Tundra | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 34 | I've Toured the Fjord | ✅ already present | 117 | Howling Fjord | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 35 | Might of Dragonblight | ✅ already present | 115 | Dragonblight | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 36 | The Empire of Zul'Drak | ✅ already present | 121 | Zul'Drak | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 37 | Fo' Grizzle My Shizzle | ✅ already present | 116 | Grizzly Hills | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 38 | The Summit of Storm Peaks | ✅ already present | 120 | The Storm Peaks | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 39 | Into the Basin | ✅ already present | 119 | Sholazar Basin | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 40 | Icecrown: The Final Goal | ✅ already present | 118 | Icecrown | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-05 |
| 41 | Loremaster of Northrend | ✅ already present | 113, 114, 115, 116, 117, 118, 119, 120, 121 | Northrend + 8 WotLK zones | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; Crystalsong Forest (127) and Wintergrasp (123) correctly excluded — no Loremaster component | 2026-07-05 |
| 42 | Eastern Kingdoms Explorer | ✅ already present | 13, 14, 15, 17, 18, 21, 22, 23, 25, 26, 27, 32, 33, 36, 37, 42, 47, 48, 49, 50, 51, 52, 56, 94, 95, 122, 210, 224 | EK continent + 20 Vanilla zones + Eversong Woods/Ghostlands (TBC) + Isle of Quel'Danas (TBC) + Stranglethorn splits (Cata) | `Shared/01_Vanilla/ZoneData.lua` (EK zones), `Shared/02_TheBurningCrusade/ZoneData.lua` (Eversong/Ghostlands + Isle of Quel'Danas), `Shared/04_Cataclysm/ZoneData.lua` (Stranglethorn variants); all 25 criteria zones covered | 2026-07-05 |
| 43 | Kalimdor Explorer | ✅ already present | 1, 7, 10, 12, 57, 62, 63, 64, 65, 66, 69, 70, 71, 76, 77, 78, 80, 81, 83, 97, 199 | Kalimdor continent + 17 Vanilla zones + Azuremyst/Bloodmyst (TBC) + Barrens splits (Cata) | `Shared/01_Vanilla/ZoneData.lua` (Kalimdor zones), `Shared/02_TheBurningCrusade/ZoneData.lua` (Azuremyst Isle/Bloodmyst Isle), `Shared/04_Cataclysm/ZoneData.lua` (Northern/Southern Barrens); all 21 criteria zones covered | 2026-07-05 |
| 44 | Outland Explorer | ✅ already present | 100, 101, 102, 104, 105, 107, 108, 109 | Outland continent + 7 Outland zones (Hellfire Peninsula, Zangarmarsh, Shadowmoon Valley, Blade's Edge Mountains, Nagrand, Terokkar Forest, Netherstorm) | `Shared/02_TheBurningCrusade/ZoneData.lua`; all 7 criteria zones covered | 2026-07-05 |
| 45 | Northrend Explorer | ✅ already present | 113, 114, 115, 116, 117, 118, 119, 120, 121, 127 | Northrend continent + 9 criteria zones (incl. Crystalsong Forest) | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; all 9 criteria zones covered; Crystalsong Forest (127) correctly included — it IS a criteria zone (unlike Loremaster of Northrend); Wintergrasp (123) correctly excluded | 2026-07-05 |
| 46 | Universal Explorer | ✅ already present | All zone entries across 8 expansions (see Reason) | All zone entries: Vanilla, TBC, WotLK, Cata, MoP, WoD, Legion, BfA | 100+ zone entries across `Shared/01_Vanilla` through `Shared/05_MistsOfPandaria` ZoneData files + `Retail/06_WarlordsOfDraenor` through `Retail/08_BattleForAzeroth`; Shadowlands+ correctly absent — not criteria for Universal Explorer | 2026-07-05 |
| 73 | Disgracin' The Basin | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 116 | Professional Journeyman | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 121 | Journeyman Cook | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 122 | Expert Cook | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 123 | Classic Cook | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 124 | Outland Cook | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 125 | Northrend Cook | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 126 | Journeyman Fisherman | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 127 | Expert Fisherman | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 128 | Artisan Fisherman | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 129 | Outland Fisherman | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 130 | Northrend Fisherman | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 131 | Journeyman Medic | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 132 | Expert Medic | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 133 | Artisan Medic | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 134 | Master Medic | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 135 | Grand Master Medic | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-05 |
| 137 | Stocking Up | ⏭ skipped | — | — | Proficiency/skill achievement (create bandages); no geographic association | 2026-07-05 |
| 141 | Ultimate Triage | ⏭ skipped | — | — | Proficiency/skill achievement (use bandages); no geographic association | 2026-07-05 |
| 144 | The Lurker Above | ✅ already present | 332 | Serpentshrine Cavern | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-07-05 |
| 150 | The Fishing Diplomat | ✅ added | 84, 85 | Stormwind City, Orgrimmar | Added to both Stormwind City (84) and Orgrimmar ({85,86,1534}) in `Shared/01_Vanilla/ZoneData.lua`; achievement requires fishing in both capitals | 2026-07-05 |
| 153 | The Old Gnome and the Sea | ⏭ skipped | — | — | Generic fishing achievement (fish from any school); no specific geographic association | 2026-07-05 |
| 154 | Arathi Basin Victory | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 155 | Arathi Basin Veteran | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 156 | Territorial Dominance | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 157 | To The Rescue! | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 158 | Me and the Cappin' Makin' It Happen | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry; previously misclassified as statistics due to wrong title from text-search lookup | 2026-07-05 |
| 159 | Let's Get This Done | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry; previously misclassified as statistics due to wrong title from text-search lookup | 2026-07-05 |
| 161 | Resilient Victory | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 162 | We Had It All Along *cough* | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 165 | Arathi Basin Perfection | ✅ already present | 93, 1366, 1383 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-05 |
| 166 | Warsong Gulch Victory | ✅ already present | 92, 1339 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 167 | Warsong Gulch Veteran | ✅ already present | 92, 1339 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 168 | Warsong Gulch Perfection | ✅ already present | 92, 1339 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 174 | Nothing Boring About Borean | ✅ added | 114 | Borean Tundra | Added to `Shared/03_WrathOfTheLichKing/ZoneData.lua`; Classic variant achievement ID for same zone | 2026-07-05 |
| 199 | Capture the Flag | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 200 | Persistent Defender | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 201 | Warsong Expedience | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 202 | Quick Cap | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 203 | Not In My House | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 204 | Ironman | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 206 | Supreme Defender | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 207 | Save the Day | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-05 |
| 208 | Eye of the Storm Victory | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 209 | Eye of the Storm Veteran | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 211 | Storm Glory | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 212 | Storm Capper | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 213 | Stormtrooper | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 214 | Flurry | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 216 | Bound for Glory | ✅ already present | 112 | Eye of the Storm | Already in `Shared/01_Vanilla/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 218 | Alterac Valley Victory | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 219 | Alterac Valley Veteran | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 220 | Stormpike Perfection | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 221 | Alterac Grave Robber | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 222 | Tower Defense | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 223 | The Sickly Gazelle | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 224 | Loyal Defender | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 225 | Everything Counts | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 226 | The Alterac Blitz | ✅ already present | 91, 1537, 2162 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-05 |
| 227 | Damage Control | ✅ added | all BGs | All battlegrounds | Added to all 18 BG zone entries via `shared.GenericBattleground` in `DataAddons/Shared/ZoneData.lua` | 2026-07-05 |
| 229 | The Grim Reaper | ✅ added | all BGs | All battlegrounds | Added to all 18 BG zone entries via `shared.GenericBattleground` in `DataAddons/Shared/ZoneData.lua` | 2026-07-05 |
| 230 | Battlemaster | ✅ added | 91, 92, 93, 112 | Alterac Valley, Warsong Gulch, Arathi Basin, Eye of the Storm | Added to all 4 BG entries in `Shared/01_Vanilla/ZoneData.lua` and `Shared/02_TheBurningCrusade/ZoneData.lua`; meta-achievement requiring completion of achievements in each | 2026-07-05 |
| 231 | Wrecking Ball | ✅ added | all BGs | All battlegrounds | Added to all 18 BG zone entries via `shared.GenericBattleground` in `DataAddons/Shared/ZoneData.lua` | 2026-07-05 |
| 233 | Bloodthirsty Berserker | ✅ already present | 112 | Eye of the Storm | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Eye of the Storm entry | 2026-07-05 |
| 238 | An Honorable Kill | ⏭ skipped | — | — | PvP general achievement; no specific zone | 2026-07-05 |
| 245 | That Takes Class | ⏭ skipped | — | — | PvP general achievement; no specific zone | 2026-07-05 |
| 246 | Know Thy Enemy | ⏭ skipped | — | — | PvP general achievement; no specific zone | 2026-07-05 |
| 247 | Make Love, Not Warcraft | ⏭ skipped | — | — | PvP general achievement; no specific zone | 2026-07-05 |
| 248 | Sunday's Finest | ⏭ skipped | — | — | Event achievement (Noblegarden); no fixed geographic zone | 2026-07-05 |
| 249 | Dressed for the Occasion | ⏭ skipped | — | — | Event achievement (Noblegarden); no fixed geographic zone | 2026-07-05 |
| 252 | With a Little Helper from My Friends | ⏭ skipped | — | — | Event achievement (Winter Veil); no fixed geographic zone | 2026-07-06 |
| 255 | Bring Me The Head of... Oh Wait | ✅ added | 435, 436 | Scarlet Monastery | Added to `{435, 436}` entry in `Shared/05_MistsOfPandaria/ZoneData.lua`; Headless Horseman uses the revamped Scarlet Monastery maps | 2026-07-06 |
| 259 | Scrooge | ✅ added | 88 | Thunder Bluff | Added to Thunder Bluff (88) entry in `Shared/01_Vanilla/ZoneData.lua`; requires throwing a snowball at Baine Bloodhoof in Thunder Bluff during Winter Veil | 2026-07-06 |
| 260 | Charming | ⏭ skipped | — | — | Event achievement (Love is in the Air); crafting bracelets has no zone requirement | 2026-07-06 |
| 263 | Ice the Frost Lord | ✅ added | 265 | The Slave Pens | Added to existing Slave Pens (265) entry in `Shared/02_TheBurningCrusade/ZoneData.lua`; Ahune fought in The Slave Pens during Midsummer Fire Festival | 2026-07-06 |
| 271 | Burning Hot Pole Dance | ⏭ skipped | — | — | Event achievement (Midsummer); ribbon poles in many zones, no fixed zone | 2026-07-06 |
| 272 | Torch Juggler | ✅ added | 125 | Dalaran | Added to existing Dalaran (125) entry in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; specifically requires being in Dalaran | 2026-07-06 |
| 273 | On Metzen! | ✅ added | 25 | Hillsbrad Foothills | Added to Hillsbrad Foothills (25) entry in `Shared/01_Vanilla/ZoneData.lua`; Horde version of the Winter Veil rescue quest takes place in this zone | 2026-07-06 |
| 275 | Veteran Nanny | ✅ added | 84, 85, 111, 2339, 2393 | Stormwind City, Orgrimmar, Shattrath City, Isle of Dorn (Dornogal), Silvermoon City | Added to city/zone entries across 4 files; Children's Week pets obtained from quest hubs in each location | 2026-07-06 |
| 277 | 'Tis the Season | ⏭ skipped | — | — | World event achievement (Winter Veil); activities span multiple locations | 2026-07-07 |
| 279 | Simply Abominable | ✅ added | {85, 86}, {87, 1361} | Orgrimmar, Ironforge | Added to Orgrimmar and Ironforge entries in `Shared/01_Vanilla/ZoneData.lua`; Winter Veil quest (retrieve stolen treats) originates from Smokywood Pastures in both capitals | 2026-07-07 |
| 281 | First Aid skill | ⏭ skipped | — | — | Proficiency/skill achievement; no geographic association | 2026-07-07 |
| 283 | The Masquerade | ⏭ skipped | — | — | Hallow's End event achievement; no fixed geographic zone | 2026-07-07 |
| 284 | A Mask for All Occasions | ⏭ skipped | — | — | Hallow's End event achievement; collecting masks has no zone requirement | 2026-07-07 |
| 288 | Out With It | ⏭ skipped | — | — | Hallow's End event achievement; no fixed geographic zone | 2026-07-07 |
| 289 | The Savior of Hallow's End | ✅ added | {18,...}, {27,...}, {37,...}, {1,...}, {94,467}, {97,...} | Tirisfal Glades, Dun Morogh, Elwynn Forest, Durotar, Eversong Woods, Azuremyst Isle | Added to all 6 Hallow's End village zones in `Shared/01_Vanilla/ZoneData.lua` and `Shared/02_TheBurningCrusade/ZoneData.lua`; quest to save Brill, Kharanos, Goldshire, Razor Hill, Falconwing Square, and Azure Watch | 2026-07-07 |
| 291 | Check Your Head | ⏭ skipped | — | — | Hallow's End event achievement; no fixed geographic zone | 2026-07-07 |
| 292 | Sinister Calling | ⏭ skipped | — | — | Hallow's End event achievement; no fixed geographic zone | 2026-07-07 |
| 293 | Disturbing the Peace | ✅ added | 125 | Dalaran | Added to Dalaran (125) in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; specifically requires dancing in Dalaran during Brewfest | 2026-07-07 |
| 295 | Direbrewfest | ✅ added | {242, 243} | Blackrock Depths | Added to Blackrock Depths ({242, 243}) in `Shared/01_Vanilla/ZoneData.lua`; Coren Direbrew fought in Brewfest dungeon (Grim Guzzler) | 2026-07-07 |

## Statistics-Tracking Achievements (Skipped)

All skipped — cumulative counter / statistics-tracking achievements not in AchievementData; no zone entry warranted.

| ID | Title |
|---|---|
| 49 | Alterac Valley victories |
| 50 | Eye of the Storm victories |
| 51 | Arathi Basin victories |
| 52 | Warsong Gulch battles |
| 53 | Alterac Valley battles |
| 54 | Eye of the Storm battles |
| 55 | Arathi Basin battles |
| 60 | Total deaths |
| 94 | Quests abandoned |
| 95 | Average quests completed per day |
| 97 | Daily quests completed |
| 98 | Quests completed |
| 99 | Ruins of Lordaeron matches |
| 100 | Nagrand Arena victories |
| 101 | Nagrand Arena matches |
| 102 | Ruins of Lordaeron victories |
| 103 | Blade's Edge Arena matches |
| 104 | Blade's Edge Arena victories |
| 105 | Warsong Gulch victories |
| 107 | Creatures killed |
| 108 | Critters killed |
| 110 | Lich King 5-player boss defeated the most |
| 112 | Deaths from drowning |
| 113 | Deaths from fatigue |
| 114 | Deaths from falling |
| 115 | Deaths from fire and lava |
| 178 | Enchanting formulae learned |
| 181 | Items disenchanted |
| 183 | Materials produced from disenchanting |
| 239 | 25000 Honorable Kills |

## IDs Not Found in Game DB (Skipped)

All skipped — achievement ID not found in game DB (verified against build 12.0.7.68275).

1, 2, 3, 4, 5, 14, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 47, 48,
56, 57, 58, 59, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 96,
106, 109, 111, 117, 118, 119, 120, 136, 138, 139, 140, 142, 143, 145, 146, 147, 148, 149,
151, 152, 160, 163, 164, 169, 170, 171, 172, 173, 175, 176, 177, 179, 180, 182, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198,
205, 210, 215, 217, 228, 232, 234, 235, 236, 237, 240, 241, 242, 243, 244, 250,
251, 253, 254, 256, 257, 258, 261, 262, 264, 265, 266, 267, 268, 269, 270, 274,
276, 278, 280, 282, 285, 286, 287, 290, 294, 296, 297, 298, 299, 300