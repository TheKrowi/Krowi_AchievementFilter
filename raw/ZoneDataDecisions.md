# Zone Data Decisions Log

Records every achievement evaluated for zone placement — added, already present, or skipped with reason.
Update this file whenever a zone placement decision is made via the `add-zone-data` skill.

**Highest ID Analyzed: 1050**

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
| 303 | Have Keg, Will Travel | ⏭ skipped | — | — | Mount/toy reward collection achievement; no geographic association | 2026-07-08 |
| 306 | Master Angler of Azeroth | ✅ added | 210 | The Cape of Stranglethorn | Added to Cape of Stranglethorn (210) in `Shared/04_Cataclysm/ZoneData.lua`; Booty Bay fishing tournament — Classic is MoP era so Cata zone split is in effect for both Retail and Classic | 2026-07-08 |
| 388 | City Defender | ✅ already present | 84, 87, 89, 103 | Stormwind City, Ironforge, Darnassus, The Exodar | Already in `Shared/01_Vanilla/ZoneData.lua` (Stormwind, Ironforge, Darnassus) and `Shared/02_TheBurningCrusade/ZoneData.lua` (The Exodar); Alliance city-defense achievement | 2026-07-10 |
| 389 | Gurubashi Arena Master | ✅ already present | 210 | The Cape of Stranglethorn | Already in `Shared/04_Cataclysm/ZoneData.lua` Gurubashi Arena entry | 2026-07-10 |
| 396 | Gurubashi Arena Grand Master | ✅ already present | 210 | The Cape of Stranglethorn | Already in `Shared/04_Cataclysm/ZoneData.lua` Gurubashi Arena entry | 2026-07-10 |
| 397 | Step Into The Arena | ⏭ skipped | — | — | PvP arena achievement; no geographic zone association | 2026-07-10 |
| 398 | Mercilessly Dedicated | ⏭ skipped | — | — | PvP season arena achievement; no geographic zone association | 2026-07-10 |
| 408 | Hot Streak | ⏭ skipped | — | — | PvP arena achievement (win 10 ranked matches in a row); no geographic zone association | 2026-07-10 |
| 409 | Last Man Standing | ⏭ skipped | — | — | PvP arena achievement (sole survivor in 5v5 match); no geographic zone association | 2026-07-10 |
| 411 | Murky | ⏭ skipped | — | — | Pet collection Feat of Strength (BlizzCon 2005 exclusive); no geographic association | 2026-07-10 |
| 412 | Murloc Costume | ⏭ skipped | — | — | Special item Feat of Strength (BlizzCon 2007 exclusive); no geographic association | 2026-07-10 |
| 414 | Tyrael's Hilt | ⏭ skipped | — | — | Special item Feat of Strength (2008 WWI exclusive); no geographic association | 2026-07-10 |
| 415 | Big Blizzard Bear | ⏭ skipped | — | — | Mount collection Feat of Strength (BlizzCon 2008 exclusive); no geographic association | 2026-07-10 |
| 416 | Scarab Lord | ✅ already present | 81 | Silithus | Already in `Shared/01_Vanilla/ZoneData.lua` Silithus entry | 2026-07-10 |
| 418 | Merciless Gladiator | ⏭ skipped | — | — | PvP season title Feat of Strength; no geographic zone association | 2026-07-10 |
| 419 | Vengeful Gladiator | ⏭ skipped | — | — | PvP season title Feat of Strength; no geographic zone association | 2026-07-10 |
| 420 | Brutal Gladiator | ⏭ skipped | — | — | PvP season title Feat of Strength; no geographic zone association | 2026-07-10 |
| 424 | Why? Because It's Red | ✅ already present | 319 | Ahn'Qiraj | Already in `Shared/01_Vanilla/ZoneData.lua` Ahn'Qiraj (raid) entry | 2026-07-10 |
| 425 | Atiesh, Greatstaff of the Guardian | ⏭ skipped | — | — | Legendary item Feat of Strength; original 40-man Naxxramas no longer accessible, no current zone requirement | 2026-07-10 |
| 426 | Warglaives of Azzinoth | ✅ already present | 339 | Black Temple | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Black Temple entry | 2026-07-10 |
| 428 | Thunderfury, Blessed Blade of the Windseeker | ✅ already present | 232 | Molten Core | Already in `Shared/01_Vanilla/ZoneData.lua` Molten Core entry | 2026-07-10 |
| 429 | Sulfuras, Hand of Ragnaros | ✅ already present | 232 | Molten Core | Already in `Shared/01_Vanilla/ZoneData.lua` Molten Core entry | 2026-07-10 |
| 430 | Amani War Bear | ✅ already present | 333 | Zul'Aman | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Zul'Aman entry | 2026-07-10 |
| 431 | Hand of A'dal | ✅ added | 104 | Shadowmoon Valley | Added to Shadowmoon Valley (104) in `Shared/02_TheBurningCrusade/ZoneData.lua`; title achievement obtained via quest chain in Shadowmoon Valley | 2026-07-11 |
| 432 | Champion of the Naaru | ✅ added | 111 | Shattrath City | Added to Shattrath City (111) in `Shared/02_TheBurningCrusade/ZoneData.lua`; title achievement obtained via quest chain in Shattrath City | 2026-07-11 |
| 433 | Grand Marshal | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 434 | Field Marshal | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 435 | Commander | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 436 | Lieutenant Commander | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 437 | Knight-Champion | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 438 | Knight-Captain | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 439 | Knight | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 440 | Sergeant Major | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 441 | Master Sergeant | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 442 | Private | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 443 | High Warlord | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 444 | Lieutenant General | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 445 | Warlord | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 446 | General | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 447 | Champion | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 448 | Centurion | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 449 | Blood Guard | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 450 | Senior Sergeant | ⏭ skipped | — | — | PvP rank title Feat of Strength (Classic Honor System); no geographic zone association | 2026-07-10 |
| 451 | Stone Guard | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 452 | First Sergeant | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 453 | Sergeant | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 454 | Scout | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 456 | Realm First! Obsidian Slayer | ✅ added | 155 | The Obsidian Sanctum | Realm First! raid boss feat (25-player); added to `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-12 |
| 457 | Realm First! Level 80 (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 458 | Realm First! Level 80 Rogue (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 459 | Realm First! Level 80 Warrior (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 460 | Realm First! Level 80 Mage (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 461 | Realm First! Level 80 Death Knight (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 462 | Realm First! Level 80 Hunter (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 463 | Realm First! Level 80 Warlock (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 464 | Realm First! Level 80 Priest (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 465 | Realm First! Level 80 Paladin (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 466 | Realm First! Level 80 Druid (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 467 | Realm First! Level 80 Shaman (Legacy) | ⏭ skipped | — | — | Level milestone Feat of Strength; no geographic association | 2026-07-12 |
| 468 | Grunt | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 469 | Legionnaire | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 470 | Corporal | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 471 | Sergeant | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 472 | Knight-Lieutenant | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 473 | Marshal | ⏭ skipped | — | — | PvP honor rank title (Classic Honor System); no geographic association | 2026-07-12 |
| 477 | Utgarde Keep | ✅ already present | 133, 134, 135 | Utgarde Keep | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Utgarde Keep entry | 2026-07-12 |
| 478 | The Nexus | ✅ already present | 129 | The Nexus | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` The Nexus entry | 2026-07-12 |
| 479 | The Culling of Stratholme | ✅ already present | 130, 131 | The Culling of Stratholme | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Culling of Stratholme entry | 2026-07-12 |
| 480 | Azjol-Nerub | ✅ already present | 157, 158, 159 | Azjol-Nerub | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Azjol-Nerub entry | 2026-07-12 |
| 481 | Ahn'kahet: The Old Kingdom | ✅ already present | 132 | Ahn'kahet: The Old Kingdom | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Ahn'kahet entry | 2026-07-12 |
| 482 | Drak'Tharon Keep | ✅ already present | 160, 161 | Drak'Tharon Keep | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Drak'Tharon Keep entry | 2026-07-12 |
| 483 | The Violet Hold | ✅ already present | 168 | The Violet Hold | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Violet Hold entry | 2026-07-12 |
| 484 | Gundrak | ✅ already present | 154 | Gundrak | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Gundrak entry | 2026-07-12 |
| 485 | Halls of Stone | ✅ already present | 140 | Halls of Stone | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Halls of Stone entry | 2026-07-12 |
| 486 | Halls of Lightning | ✅ already present | 138, 139 | Halls of Lightning | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Halls of Lightning entry | 2026-07-12 |
| 487 | The Oculus | ✅ already present | 143, 144, 145, 146 | The Oculus | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Oculus entry | 2026-07-12 |
| 488 | Utgarde Pinnacle | ✅ already present | 136, 137 | Utgarde Pinnacle | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Utgarde Pinnacle entry | 2026-07-12 |
| 489 | Heroic: Utgarde Keep | ✅ already present | 133, 134, 135 | Utgarde Keep | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Utgarde Keep entry | 2026-07-12 |
| 490 | Heroic: The Nexus | ✅ already present | 129 | The Nexus | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` The Nexus entry | 2026-07-12 |
| 491 | Heroic: Azjol-Nerub | ✅ already present | 157, 158, 159 | Azjol-Nerub | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Azjol-Nerub entry | 2026-07-12 |
| 492 | Heroic: Ahn'kahet: The Old Kingdom | ✅ already present | 132 | Ahn'kahet: The Old Kingdom | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Ahn'kahet entry | 2026-07-12 |
| 493 | Heroic: Drak'Tharon Keep | ✅ already present | 160, 161 | Drak'Tharon Keep | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Drak'Tharon Keep entry | 2026-07-12 |
| 494 | Heroic: The Violet Hold | ✅ already present | 168 | The Violet Hold | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Violet Hold entry | 2026-07-12 |
| 495 | Heroic: Gundrak | ✅ already present | 154 | Gundrak | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Gundrak entry | 2026-07-12 |
| 496 | Heroic: Halls of Stone | ✅ already present | 140 | Halls of Stone | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Halls of Stone entry | 2026-07-12 |
| 497 | Heroic: Halls of Lightning | ✅ already present | 138, 139 | Halls of Lightning | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Halls of Lightning entry | 2026-07-12 |
| 498 | Heroic: The Oculus | ✅ already present | 143, 144, 145, 146 | The Oculus | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Oculus entry | 2026-07-12 |
| 499 | Heroic: Utgarde Pinnacle | ✅ already present | 136, 137 | Utgarde Pinnacle | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Utgarde Pinnacle entry | 2026-07-12 |
| 500 | Heroic: The Culling of Stratholme | ✅ already present | 130, 131 | The Culling of Stratholme | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Culling of Stratholme entry | 2026-07-12 |
| 518 | 30 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 519 | 25 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 520 | 20 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 521 | 15 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 522 | Somebody Likes Me | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 523 | 5 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 524 | 10 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-07-12 |
| 545 | Shave and a Haircut | ⏭ skipped | — | — | Barber shop cosmetic; no geographic association | 2026-07-12 |
| 546 | Safe Deposit | ⏭ skipped | — | — | Bank slot purchase; no geographic association | 2026-07-12 |
| 547 | Veteran of the Wrathgate | ✅ already present | 115 | Dragonblight | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-12 |
| 556 | Epic | ⏭ skipped | — | — | Gear/equipment achievement; no geographic association | 2026-07-13 |
| 557 | Superior | ⏭ skipped | — | — | Gear/equipment achievement; no geographic association | 2026-07-13 |
| 558 | Greedy | ⏭ skipped | — | — | Loot roll achievement; no geographic association | 2026-07-13 |
| 559 | Needy | ⏭ skipped | — | — | Loot roll achievement; no geographic association | 2026-07-13 |
| 560 | Deadliest Catch | ✅ already present | 337 | Zul'Gurub | Already in `Shared/04_Cataclysm/ZoneData.lua` | 2026-07-13 |
| 561 | D.E.H.T.A's Little P.I.T.A. | ✅ already present | 114 | Borean Tundra | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 562 | The Arachnid Quarter (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 563 | The Arachnid Quarter (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 564 | The Construct Quarter (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 565 | The Construct Quarter (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 566 | The Plague Quarter (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 567 | The Plague Quarter (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 568 | The Military Quarter (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 569 | The Military Quarter (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 572 | Sapphiron's Demise (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 573 | Sapphiron's Demise (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 574 | Kel'Thuzad's Defeat (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 575 | Kel'Thuzad's Defeat (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 576 | The Fall of Naxxramas (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 577 | The Fall of Naxxramas (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 578 | The Dedicated Few (10 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 579 | The Dedicated Few (25 player) | ✅ already present | 162 | Naxxramas | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-07-13 |
| 582 | Alterac Valley All-Star | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-13 |
| 583 | Arathi Basin All-Star | ✅ already present | 93 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-13 |
| 584 | Arathi Basin Assassin | ✅ already present | 93 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-13 |
| 587 | Stormy Assassin | ✅ already present | 112 | Eye of the Storm | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Eye of the Storm entry | 2026-07-13 |
| 603 | Wrath of the Horde | ✅ already present | 84, 87, 89, 103 | Stormwind City, Ironforge, Darnassus, The Exodar | Already in `Shared/01_Vanilla/ZoneData.lua` (Stormwind City, Ironforge, Darnassus) and `Shared/02_TheBurningCrusade/ZoneData.lua` (The Exodar); Horde PvP city-raid achievement requiring kills of Alliance players in each Alliance capital | 2026-07-13 |
| 604 | Wrath of the Alliance | ✅ already present | 85, 88, 90, 110 | Orgrimmar, Thunder Bluff, Undercity, Silvermoon City | Already in `Shared/01_Vanilla/ZoneData.lua` (Orgrimmar, Thunder Bluff, Undercity) and `Shared/02_TheBurningCrusade/ZoneData.lua` (Silvermoon City); Alliance PvP city-raid achievement requiring kills of Horde players in each Horde capital | 2026-07-13 |
| 605 | A Coin of Ancestry | ⏭ skipped | — | — | Event achievement (Lunar Festival); collecting coins has no fixed geographic zone | 2026-07-13 |
| 606 | 5 Coins of Ancestry | ⏭ skipped | — | — | Event achievement (Lunar Festival); collecting coins has no fixed geographic zone | 2026-07-13 |
| 607 | 10 Coins of Ancestry | ⏭ skipped | — | — | Event achievement (Lunar Festival); collecting coins has no fixed geographic zone | 2026-07-13 |
| 608 | 25 Coins of Ancestry | ⏭ skipped | — | — | Event achievement (Lunar Festival); collecting coins has no fixed geographic zone | 2026-07-13 |
| 609 | 50 Coins of Ancestry | ⏭ skipped | — | — | Event achievement (Lunar Festival); collecting coins has no fixed geographic zone | 2026-07-13 |
| 610 | Orgrimmar Offensive | ✅ already present | 85 | Orgrimmar | Already in `Shared/01_Vanilla/ZoneData.lua` Orgrimmar entry | 2026-07-13 |
| 611 | Bleeding Bloodhoof | ✅ already present | 88 | Thunder Bluff | Already in `Shared/01_Vanilla/ZoneData.lua` Thunder Bluff entry | 2026-07-13 |
| 612 | Downing the Dark Lady | ✅ already present | 90 | Undercity | Already in `Shared/01_Vanilla/ZoneData.lua` Undercity entry | 2026-07-13 |
| 613 | Killed in Quel'Thalas | ✅ already present | 110 | Silvermoon City | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Silvermoon City entry | 2026-07-13 |
| 614 | For the Alliance! | ✅ already present | 85, 110 | Orgrimmar, Silvermoon City | Already in `Shared/01_Vanilla/ZoneData.lua` and `Shared/02_TheBurningCrusade/ZoneData.lua`; meta-achievement for slaying all Horde leaders | 2026-07-13 |
| 615 | Storming Stormwind | ✅ already present | 84 | Stormwind City | Already in `Shared/01_Vanilla/ZoneData.lua` Stormwind City entry | 2026-07-13 |
| 616 | Overthrow the Council | ✅ already present | 87 | Ironforge | Already in `Shared/01_Vanilla/ZoneData.lua` Ironforge entry | 2026-07-13 |
| 617 | Immortal No More | ✅ already present | 89 | Darnassus | Already in `Shared/01_Vanilla/ZoneData.lua` Darnassus entry | 2026-07-13 |
| 618 | Putting Out the Light | ✅ already present | 103 | The Exodar | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Exodar entry | 2026-07-13 |
| 619 | For the Horde! | ✅ added | 84, 87, 103 | Stormwind City, Ironforge, The Exodar | Added 619 to Stormwind City (84) in `Shared/01_Vanilla/ZoneData.lua`; already present in Ironforge (87) and The Exodar (103); Darnassus excluded — Immortal No More removed from criteria in Patch 8.0.1 | 2026-07-13 |
| 621 | Represent | ⏭ skipped | — | — | Tabard slot appearance collection achievement; no geographic association | 2026-07-13 |
| 622 | The Spellweaver's Downfall (10 player) | ✅ already present | 141 | Eye of Eternity | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Eye of Eternity entry | 2026-07-13 |
| 623 | The Spellweaver's Downfall (25 player) | ✅ already present | 141 | Eye of Eternity | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Eye of Eternity entry | 2026-07-13 |
| 624 | Less Is More (10 player) | ✅ already present | 155 | The Obsidian Sanctum | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` The Obsidian Sanctum entry | 2026-07-13 |
| 625 | Besting the Black Dragonflight (25 player) | ✅ already present | 155 | The Obsidian Sanctum | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` The Obsidian Sanctum entry | 2026-07-13 |
| 626 | Lunar Festival Finery | ⏭ skipped | — | — | Event achievement (Lunar Festival); no fixed geographic zone | 2026-07-13 |
| 627 | Explore Dun Morogh | ✅ already present | 27 | Dun Morogh | Already in `Shared/01_Vanilla/ZoneData.lua` Dun Morogh entry | 2026-07-13 |
| 628 | Deadmines | ✅ already present | 291 | The Deadmines | Already in `Shared/01_Vanilla/ZoneData.lua` The Deadmines entry | 2026-07-13 |
| 629 | Ragefire Chasm | ✅ already present | 213 | Ragefire Chasm | Already in `Shared/01_Vanilla/ZoneData.lua` Ragefire Chasm entry | 2026-07-13 |
| 630 | Wailing Caverns | ✅ already present | 279 | Wailing Caverns | Already in `Shared/01_Vanilla/ZoneData.lua` Wailing Caverns entry | 2026-07-13 |
| 631 | Shadowfang Keep | ✅ already present | 310 | Shadowfang Keep | Already in `Shared/01_Vanilla/ZoneData.lua` Shadowfang Keep entry | 2026-07-13 |
| 632 | Blackfathom Deeps | ✅ already present | 221 | Blackfathom Deeps | Already in `Shared/01_Vanilla/ZoneData.lua` Blackfathom Deeps entry | 2026-07-13 |
| 633 | Stormwind Stockade | ✅ already present | 225 | The Stockade | Already in `Shared/01_Vanilla/ZoneData.lua` The Stockade entry | 2026-07-13 |
| 634 | Gnomeregan | ✅ already present | 226 | Gnomeregan | Already in `Shared/01_Vanilla/ZoneData.lua` Gnomeregan entry | 2026-07-13 |
| 635 | Razorfen Kraul | ✅ already present | 301 | Razorfen Kraul | Already in `Shared/01_Vanilla/ZoneData.lua` Razorfen Kraul entry | 2026-07-13 |
| 636 | Razorfen Downs | ✅ already present | 300 | Razorfen Downs | Already in `Shared/01_Vanilla/ZoneData.lua` Razorfen Downs entry | 2026-07-13 |
| 637 | Scarlet Monastery | ✅ already present | 435 | Scarlet Monastery | Already in `Shared/05_MistsOfPandaria/ZoneData.lua` Scarlet Monastery entry | 2026-07-13 |
| 638 | Uldaman | ✅ already present | 230 | Uldaman | Already in `Shared/01_Vanilla/ZoneData.lua` Uldaman entry | 2026-07-13 |
| 639 | Zul'Farrak | ✅ already present | 219 | Zul'Farrak | Already in `Shared/01_Vanilla/ZoneData.lua` Zul'Farrak entry | 2026-07-13 |
| 640 | Maraudon | ✅ already present | 280 | Maraudon | Already in `Shared/01_Vanilla/ZoneData.lua` Maraudon entry | 2026-07-13 |
| 641 | Sunken Temple | ✅ already present | 220 | The Temple of Atal'Hakkar | Already in `Shared/01_Vanilla/ZoneData.lua` The Temple of Atal'Hakkar entry | 2026-07-13 |
| 642 | Blackrock Depths | ✅ already present | 242 | Blackrock Depths | Already in `Shared/01_Vanilla/ZoneData.lua` Blackrock Depths entry | 2026-07-13 |
| 643 | Lower Blackrock Spire | ✅ already present | 250 | Blackrock Spire | Already in `Shared/01_Vanilla/ZoneData.lua` Blackrock Spire entry | 2026-07-13 |
| 644 | King of Dire Maul | ✅ already present | 235 | Dire Maul | Already in `Shared/01_Vanilla/ZoneData.lua` Dire Maul entry | 2026-07-13 |
| 645 | Scholomance | ✅ already present | 476 | Scholomance | Already in `Shared/05_MistsOfPandaria/ZoneData.lua` Scholomance entry | 2026-07-13 |
| 646 | Stratholme | ✅ already present | 317 | Stratholme | Already in `Shared/01_Vanilla/ZoneData.lua` Stratholme entry | 2026-07-13 |
| 647 | Hellfire Ramparts | ✅ already present | 347 | Hellfire Ramparts | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Hellfire Ramparts entry | 2026-07-13 |
| 648 | The Blood Furnace | ✅ already present | 261 | The Blood Furnace | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Blood Furnace entry | 2026-07-13 |
| 649 | The Slave Pens | ✅ already present | 265 | The Slave Pens | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Slave Pens entry | 2026-07-13 |
| 650 | Underbog | ✅ already present | 262 | The Underbog | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Underbog entry | 2026-07-13 |
| 651 | Mana-Tombs | ✅ already present | 272 | Mana-Tombs | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Mana-Tombs entry | 2026-07-13 |
| 652 | The Escape From Durnholde | ✅ already present | 274 | Old Hillsbrad Foothills | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Old Hillsbrad Foothills entry | 2026-07-13 |
| 653 | Sethekk Halls | ✅ already present | 258, 259 | Sethekk Halls | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Sethekk Halls entry | 2026-07-13 |
| 654 | Shadow Labyrinth | ✅ already present | 260 | Shadow Labyrinth | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Shadow Labyrinth entry | 2026-07-13 |
| 655 | Opening of the Dark Portal | ✅ already present | 273 | The Black Morass | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Black Morass entry | 2026-07-13 |
| 656 | The Steamvault | ✅ already present | 263, 264 | The Steamvault | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Steamvault entry | 2026-07-13 |
| 657 | The Shattered Halls | ✅ already present | 246 | The Shattered Halls | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Shattered Halls entry | 2026-07-13 |
| 658 | The Mechanar | ✅ already present | 267, 268 | The Mechanar | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Mechanar entry | 2026-07-13 |
| 659 | The Botanica | ✅ already present | 266 | The Botanica | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Botanica entry | 2026-07-13 |
| 660 | The Arcatraz | ✅ already present | 269, 270, 271 | The Arcatraz | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Arcatraz entry | 2026-07-13 |
| 661 | Magister's Terrace | ✅ already present | 348, 349 | Magisters' Terrace | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Magisters' Terrace entry | 2026-07-13 |
| 662 | Collector's Edition: Mini-Diablo | ⏭ skipped | — | — | Real-world exclusive Collector's Edition pet FoS; no geographic association | 2026-07-13 |
| 663 | Collector's Edition: Panda | ⏭ skipped | — | — | Real-world exclusive Collector's Edition pet FoS; no geographic association | 2026-07-13 |
| 664 | Collector's Edition: Zergling | ⏭ skipped | — | — | Real-world exclusive Collector's Edition pet FoS; no geographic association | 2026-07-13 |
| 665 | Collector's Edition: Netherwhelp | ⏭ skipped | — | — | Real-world exclusive Collector's Edition pet FoS (TBC); no geographic association | 2026-07-13 |
| 666 | Auchenai Crypts | ✅ already present | 256, 257 | Auchenai Crypts | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Auchenai Crypts entry | 2026-07-13 |
| 667 | Heroic: Hellfire Ramparts | ✅ already present | 347 | Hellfire Ramparts | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Hellfire Ramparts entry | 2026-07-13 |
| 668 | Heroic: The Blood Furnace | ✅ already present | 261 | The Blood Furnace | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Blood Furnace entry | 2026-07-13 |
| 669 | Heroic: The Slave Pens | ✅ already present | 265 | The Slave Pens | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Slave Pens entry | 2026-07-13 |
| 670 | Heroic: Underbog | ✅ already present | 262 | The Underbog | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Underbog entry | 2026-07-13 |
| 671 | Heroic: Mana-Tombs | ✅ already present | 272 | Mana-Tombs | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Mana-Tombs entry | 2026-07-13 |
| 672 | Heroic: Auchenai Crypts | ✅ already present | 256, 257 | Auchenai Crypts | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Auchenai Crypts entry | 2026-07-13 |
| 673 | Heroic: The Escape From Durnholde | ✅ already present | 274 | Old Hillsbrad Foothills | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Old Hillsbrad Foothills entry | 2026-07-13 |
| 674 | Heroic: Sethekk Halls | ✅ already present | 258, 259 | Sethekk Halls | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Sethekk Halls entry | 2026-07-13 |
| 675 | Heroic: Shadow Labyrinth | ✅ already present | 260 | Shadow Labyrinth | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Shadow Labyrinth entry | 2026-07-13 |
| 676 | Heroic: Opening of the Dark Portal | ✅ already present | 273 | The Black Morass | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Black Morass entry | 2026-07-13 |
| 677 | Heroic: The Steamvault | ✅ already present | 263 | The Steamvault | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Steamvault entry | 2026-07-13 |
| 678 | Heroic: The Shattered Halls | ✅ already present | 246 | The Shattered Halls | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Shattered Halls entry | 2026-07-13 |
| 679 | Heroic: The Mechanar | ✅ already present | 267 | The Mechanar | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Mechanar entry | 2026-07-13 |
| 680 | Heroic: The Botanica | ✅ already present | 266 | The Botanica | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Botanica entry | 2026-07-13 |
| 681 | Heroic: The Arcatraz | ✅ already present | 269 | The Arcatraz | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Arcatraz entry | 2026-07-13 |
| 682 | Heroic: Magister's Terrace | ✅ already present | 348 | Magisters' Terrace | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Magisters' Terrace entry | 2026-07-13 |
| 683 | Collector's Edition: Frost Wyrm Whelp | ⏭ skipped | — | — | Feat of Strength for real-world event exclusive (WotLK CE); no geographic association | 2026-07-13 |
| 684 | Onyxia's Lair (Level 60) | ✅ already present | 248 | Onyxia's Lair | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` Onyxia's Lair entry | 2026-07-13 |
| 685 | Blackwing Lair | ✅ already present | 287 | Blackwing Lair | Already in `Shared/01_Vanilla/ZoneData.lua` Blackwing Lair entry | 2026-07-13 |
| 686 | Molten Core | ✅ already present | 232 | Molten Core | Already in `Shared/01_Vanilla/ZoneData.lua` Molten Core entry | 2026-07-13 |
| 687 | Temple of Ahn'Qiraj | ✅ already present | 319 | Ahn'Qiraj (raid) | Already in `Shared/01_Vanilla/ZoneData.lua` Ahn'Qiraj entry | 2026-07-13 |
| 688 | Zul'Gurub | ✅ already present | 337 | Zul'Gurub | Already in `Shared/04_Cataclysm/ZoneData.lua` Zul'Gurub entry | 2026-07-13 |
| 689 | Ruins of Ahn'Qiraj | ✅ already present | 247 | Ruins of Ahn'Qiraj | Already in `Shared/01_Vanilla/ZoneData.lua` Ruins of Ahn'Qiraj entry | 2026-07-13 |
| 690 | Karazhan | ✅ already present | 350 | Karazhan | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Karazhan entry | 2026-07-13 |
| 691 | Zul'Aman (Burning Crusade) | ✅ already present | 333 | Zul'Aman | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Zul'Aman entry | 2026-07-13 |
| 692 | Gruul's Lair | ✅ already present | 330 | Gruul's Lair | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Gruul's Lair entry | 2026-07-13 |
| 693 | Magtheridon's Lair | ✅ already present | 331 | Magtheridon's Lair | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Magtheridon's Lair entry | 2026-07-13 |
| 694 | Serpentshrine Cavern | ✅ already present | 332 | Serpentshrine Cavern | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Serpentshrine Cavern entry | 2026-07-13 |
| 695 | The Battle for Mount Hyjal | ✅ already present | 329 | The Battle for Mount Hyjal | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Battle for Mount Hyjal entry | 2026-07-13 |
| 696 | Tempest Keep | ✅ already present | 334 | The Eye (Tempest Keep) | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Eye entry | 2026-07-13 |
| 697 | The Black Temple | ✅ already present | 339 | The Black Temple | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` The Black Temple entry | 2026-07-13 |
| 698 | Sunwell Plateau | ✅ already present | 335 | Sunwell Plateau | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Sunwell Plateau entry | 2026-07-13 |
| 699 | World Wide Winner | ⏭ skipped | — | — | Multi-arena PvP requirement spanning multiple zones; no single geographic association | 2026-07-13 |
| 700 | Freedom of the Horde | ⏭ skipped | — | — | PvP item collection achievement; no geographic association | 2026-07-13 |
| 701 | Freedom of the Alliance | ⏭ skipped | — | — | PvP item collection achievement; no geographic association | 2026-07-13 |
| 705 | Master of Arms | ⏭ skipped | — | — | Weapon skill mastery achievement; no geographic association | 2026-07-13 |
| 706 | Frostwolf Howler | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-13 |
| 707 | Stormpike Battle Charger | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-13 |
| 708 | Hero of the Frostwolf Clan | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-13 |
| 709 | Hero of the Stormpike Guard | ✅ already present | 91 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-13 |
| 710 | The Defiler | ✅ already present | 93 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-13 |
| 711 | Knight of Arathor | ✅ already present | 93 | Arathi Basin | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Basin entry | 2026-07-13 |
| 712 | Warsong Outrider | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-13 |
| 713 | Silverwing Sentinel | ✅ already present | 92 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-13 |
| 714 | The Conqueror | ✅ added | 91, 92, 93 | Alterac Valley, Warsong Gulch, Arathi Basin | Added to all 3 BG zone entries in `Shared/01_Vanilla/ZoneData.lua` | 2026-07-13 |
| 725 | Thori'dal, the Stars' Fury | ✅ already present | 335 | Sunwell Plateau | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Sunwell Plateau entry | 2026-07-13 |
| 726 | Mr. Pinchy's Magical Crawdad Box | ✅ added | 108 | Terokkar Forest | Added to `Shared/02_TheBurningCrusade/ZoneData.lua` Terokkar Forest entry | 2026-07-13 |
| 727 | Call in the Cavalry | ⏭ skipped | — | — | Mount collection via PvP honor; no geographic association | 2026-07-13 |
| 728 | Explore Durotar | ✅ already present | 1 | Durotar | Already in `Shared/01_Vanilla/ZoneData.lua` Durotar entry | 2026-07-13 |
| 729 | Deathcharger's Reins | ✅ already present | 317 | Stratholme | Already in `Shared/01_Vanilla/ZoneData.lua` Stratholme entry | 2026-07-13 |
| 730 | Skills to Pay the Bills | ⏭ skipped | — | — | Multi-skill proficiency achievement; no geographic association | 2026-07-13 |
| 731 | Professional Expert | ⏭ skipped | — | — | Proficiency/skill rank achievement; no geographic association | 2026-07-13 |
| 732 | Professional Classic Master | ⏭ skipped | — | — | Proficiency/skill rank achievement; no geographic association | 2026-07-13 |
| 733 | Professional Outland Master | ⏭ skipped | — | — | Proficiency/skill rank achievement; no geographic association | 2026-07-13 |
| 734 | Professional Northrend Master | ⏭ skipped | — | — | Proficiency/skill rank achievement; no geographic association | 2026-07-13 |
| 735 | Working In the Cold | ⏭ skipped | — | — | Proficiency/skill rank achievement; no geographic association | 2026-07-13 |
| 736 | Explore Mulgore | ✅ already present | 7 | Mulgore | Already in `Shared/01_Vanilla/ZoneData.lua` Mulgore entry | 2026-07-13 |
| 750 | Explore Northern Barrens | ✅ already present | 10 | Northern Barrens | Already in `Shared/04_Cataclysm/ZoneData.lua` Northern Barrens entry | 2026-07-13 |
| 761 | Explore Arathi Highlands | ✅ already present | 14 | Arathi Highlands | Already in `Shared/01_Vanilla/ZoneData.lua` Arathi Highlands entry | 2026-07-13 |
| 762 | Ambassador of the Horde | ✅ already present | 1, 7, 10, 14, 17, 18, 21, 22, 25, 26, 50, 64, 65, 66, 69, 71, 76, 77, 85, 94, 95, 100, 102, 199, 210, 241 | All 6 Horde faction rep zones: Durotar, Mulgore, Northern Barrens, Arathi Highlands, Blasted Lands, Tirisfal Glades, Silverpine Forest, Western Plaguelands, Hillsbrad Foothills, The Hinterlands, Northern Stranglethorn, Thousand Needles, Stonetalon Mountains, Desolace, Feralas, Tanaris, Azshara, Felwood, Orgrimmar, Eversong Woods, Ghostlands, Hellfire Peninsula, Zangarmarsh, Southern Barrens, Cape of Stranglethorn, Twilight Highlands | All 25 wiki-listed rep zones verified present across `Shared/01_Vanilla`, `Shared/02_TheBurningCrusade`, and `Shared/04_Cataclysm` ZoneData files; Echo Isles has no separate map entry and is covered by Durotar (1) | 2026-07-13 |
| 763 | The Burning Crusader | ✅ added | 74, 100, 101, 102, 108, 109, 246, 256, 258, 260, 261, 262, 263, 265, 266, 267, 269, 272, 273, 274, 334, 347 | Outland zones + all 14 TBC rep dungeons | All 5 TBC dungeon rep factions covered: Honor Hold/Thrallmar (347, 261, 246), Cenarion Expedition (265, 262, 263), Lower City (256, 258, 260, 272), Keepers of Time (274, 273), The Sha'tar (267, 266, 269, 334); zone entries for Hellfire Peninsula (100), Zangarmarsh (102), Terokkar Forest (108), Netherstorm (109), Outland continent (101), Caverns of Time (74) also covered; **added 763 to Mana-Tombs (272) and Netherstorm (109)** which were missing | 2026-07-13 |
| 764 | The Burning Crusader | ✅ added | 74, 100, 101, 102, 108, 109, 246, 256, 258, 260, 261, 262, 263, 265, 266, 267, 269, 272, 273, 274, 334, 347 | Outland zones + all 14 TBC rep dungeons | Horde faction variant of 763; same zone coverage; **added 764 to Mana-Tombs (272) and Netherstorm (109)** which were missing | 2026-07-13 |
| 765 | Explore Badlands | ✅ already present | 15 | Badlands | Already in `Shared/01_Vanilla/ZoneData.lua` Badlands entry | 2026-07-13 |
| 766 | Explore Blasted Lands | ✅ already present | 17 | Blasted Lands | Already in `Shared/01_Vanilla/ZoneData.lua` Blasted Lands entry | 2026-07-13 |
| 768 | Explore Tirisfal Glades | ✅ already present | 18 | Tirisfal Glades | Already in `Shared/01_Vanilla/ZoneData.lua` Tirisfal Glades entry | 2026-07-13 |
| 769 | Explore Silverpine Forest | ✅ already present | 21 | Silverpine Forest | Already in `Shared/01_Vanilla/ZoneData.lua` Silverpine Forest entry | 2026-07-13 |
| 770 | Explore Western Plaguelands | ✅ already present | 22 | Western Plaguelands | Already in `Shared/01_Vanilla/ZoneData.lua` Western Plaguelands entry | 2026-07-13 |
| 771 | Explore Eastern Plaguelands | ✅ already present | 23 | Eastern Plaguelands | Already in `Shared/01_Vanilla/ZoneData.lua` Eastern Plaguelands entry | 2026-07-13 |
| 772 | Explore Hillsbrad Foothills | ✅ already present | 25 | Hillsbrad Foothills | Already in `Shared/01_Vanilla/ZoneData.lua` Hillsbrad Foothills entry | 2026-07-13 |
| 773 | Explore The Hinterlands | ✅ already present | 26 | The Hinterlands | Already in `Shared/01_Vanilla/ZoneData.lua` The Hinterlands entry | 2026-07-13 |
| 774 | Explore Searing Gorge | ✅ already present | 32, 33 | Searing Gorge | Already in `Shared/01_Vanilla/ZoneData.lua` Searing Gorge entry | 2026-07-13 |
| 775 | Explore Burning Steppes | ✅ already present | 33, 36 | Burning Steppes | Already in `Shared/01_Vanilla/ZoneData.lua` Burning Steppes entry | 2026-07-13 |
| 776 | Explore Elwynn Forest | ✅ already present | 37 | Elwynn Forest | Already in `Shared/01_Vanilla/ZoneData.lua` Elwynn Forest entry | 2026-07-13 |
| 777 | Explore Deadwind Pass | ✅ already present | 42 | Deadwind Pass | Already in `Shared/01_Vanilla/ZoneData.lua` Deadwind Pass entry | 2026-07-13 |
| 778 | Explore Duskwood | ✅ already present | 47 | Duskwood | Already in `Shared/01_Vanilla/ZoneData.lua` Duskwood entry | 2026-07-13 |
| 779 | Explore Loch Modan | ✅ already present | 48 | Loch Modan | Already in `Shared/01_Vanilla/ZoneData.lua` Loch Modan entry | 2026-07-13 |
| 780 | Explore Redridge Mountains | ✅ already present | 49 | Redridge Mountains | Already in `Shared/01_Vanilla/ZoneData.lua` Redridge Mountains entry | 2026-07-13 |
| 781 | Explore Northern Stranglethorn | ✅ already present | 50 | Northern Stranglethorn | Already in `Shared/04_Cataclysm/ZoneData.lua` Northern Stranglethorn entry | 2026-07-13 |
| 782 | Explore Swamp of Sorrows | ✅ already present | 51 | Swamp of Sorrows | Already in `Shared/01_Vanilla/ZoneData.lua` Swamp of Sorrows entry | 2026-07-13 |
| 783 | The Perfect Storm | ✅ already present | 112 | Eye of the Storm | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Eye of the Storm entry | 2026-07-13 |
| 784 | Eye of the Storm Domination | ✅ already present | 112 | Eye of the Storm | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Eye of the Storm entry | 2026-07-13 |
| 802 | Explore Westfall | ✅ already present | 52 | Westfall | Already in `Shared/01_Vanilla/ZoneData.lua` Westfall entry | 2026-07-13 |
| 841 | Explore Wetlands | ✅ already present | 56 | Wetlands | Already in `Shared/01_Vanilla/ZoneData.lua` Wetlands entry | 2026-07-13 |
| 842 | Explore Teldrassil | ✅ already present | 57 | Teldrassil | Already in `Shared/01_Vanilla/ZoneData.lua` Teldrassil entry | 2026-07-13 |
| 843 | Explore Netherstorm | ✅ already present | 109 | Netherstorm | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Netherstorm entry | 2026-07-13 |
| 844 | Explore Darkshore | ✅ already present | 62 | Darkshore | Already in `Shared/01_Vanilla/ZoneData.lua` Darkshore entry | 2026-07-13 |
| 845 | Explore Ashenvale | ✅ already present | 63 | Ashenvale | Already in `Shared/01_Vanilla/ZoneData.lua` Ashenvale entry | 2026-07-13 |
| 846 | Explore Thousand Needles | ✅ already present | 64 | Thousand Needles | Already in `Shared/01_Vanilla/ZoneData.lua` Thousand Needles entry | 2026-07-13 |
| 847 | Explore Stonetalon Mountains | ✅ already present | 65 | Stonetalon Mountains | Already in `Shared/01_Vanilla/ZoneData.lua` Stonetalon Mountains entry | 2026-07-13 |
| 848 | Explore Desolace | ✅ already present | 66 | Desolace | Already in `Shared/01_Vanilla/ZoneData.lua` Desolace entry | 2026-07-13 |
| 849 | Explore Feralas | ✅ already present | 69 | Feralas | Already in `Shared/01_Vanilla/ZoneData.lua` Feralas entry | 2026-07-13 |
| 850 | Explore Dustwallow Marsh | ✅ already present | 70 | Dustwallow Marsh | Already in `Shared/01_Vanilla/ZoneData.lua` Dustwallow Marsh entry | 2026-07-13 |
| 851 | Explore Tanaris | ✅ already present | 71, 72, 73 | Tanaris | Already in `Shared/01_Vanilla/ZoneData.lua` Tanaris entry | 2026-07-13 |
| 852 | Explore Azshara | ✅ already present | 76 | Azshara | Already in `Shared/01_Vanilla/ZoneData.lua` Azshara entry | 2026-07-13 |
| 853 | Explore Felwood | ✅ already present | 77 | Felwood | Already in `Shared/01_Vanilla/ZoneData.lua` Felwood entry | 2026-07-13 |
| 854 | Explore Un'Goro Crater | ✅ already present | 78, 79 | Un'Goro Crater | Already in `Shared/01_Vanilla/ZoneData.lua` Un'Goro Crater entry | 2026-07-13 |
| 855 | Explore Moonglade | ✅ already present | 80 | Moonglade | Already in `Shared/01_Vanilla/ZoneData.lua` Moonglade entry | 2026-07-13 |
| 856 | Explore Silithus | ✅ already present | 81 | Silithus | Already in `Shared/01_Vanilla/ZoneData.lua` Silithus entry | 2026-07-13 |
| 857 | Explore Winterspring | ✅ already present | 83 | Winterspring | Already in `Shared/01_Vanilla/ZoneData.lua` Winterspring entry | 2026-07-13 |
| 858 | Explore Ghostlands | ✅ already present | 95, 96 | Ghostlands | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Ghostlands entry | 2026-07-13 |
| 859 | Explore Eversong Woods (Burning Crusade) | ✅ already present | 94 | Eversong Woods | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Eversong Woods entry | 2026-07-13 |
| 860 | Explore Azuremyst Isle | ✅ already present | 97, 98, 99, 106 | Azuremyst Isle | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Azuremyst Isle entry | 2026-07-13 |
| 861 | Explore Bloodmyst Isle | ✅ already present | 97, 98, 99, 106 | Azuremyst Isle | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Azuremyst Isle entry; Bloodmyst Isle (map 98) is included in the same entry | 2026-07-13 |
| 862 | Explore Hellfire Peninsula | ✅ already present | 100 | Hellfire Peninsula | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Hellfire Peninsula entry | 2026-07-13 |
| 863 | Explore Zangarmarsh | ✅ already present | 102 | Zangarmarsh | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Zangarmarsh entry | 2026-07-13 |
| 864 | Explore Shadowmoon Valley | ✅ already present | 104 | Shadowmoon Valley | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Shadowmoon Valley entry | 2026-07-13 |
| 865 | Explore Blade's Edge Mountains | ✅ already present | 105 | Blade's Edge Mountains | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Blade's Edge Mountains entry | 2026-07-13 |
| 866 | Explore Nagrand | ✅ already present | 107 | Nagrand | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Nagrand entry | 2026-07-13 |
| 867 | Explore Terokkar Forest | ✅ already present | 108 | Terokkar Forest | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Terokkar Forest entry | 2026-07-13 |
| 868 | Explore Isle of Quel'Danas | ✅ already present | 122 | Isle of Quel'Danas | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Isle of Quel'Danas entry | 2026-07-13 |
| 871 | Avast Ye, Admiral! | ✅ already present | 210 | The Cape of Stranglethorn | Already in `Shared/04_Cataclysm/ZoneData.lua` Cape of Stranglethorn entry; Bloodsail Buccaneers are based in Cape of Stranglethorn near Booty Bay | 2026-07-13 |
| 872 | Frenzied Defender | ✅ already present | 92, 1339 | Warsong Gulch | Already in `Shared/01_Vanilla/ZoneData.lua` Warsong Gulch entry | 2026-07-13 |
| 873 | Frostwolf Perfection | ✅ already present | 91, 1537, 2162 | Alterac Valley | Already in `Shared/01_Vanilla/ZoneData.lua` Alterac Valley entry | 2026-07-13 |
| 875 | Vengefully Dedicated | ⏭ skipped | — | — | PvP arena achievement (win 200 ranked matches); no geographic zone association | 2026-07-13 |
| 877 | The Cake Is Not A Lie | ⏭ skipped | — | — | Cooking recipe achievement; no geographic association | 2026-07-13 |
| 878 | One That Didn't Get Away | ⏭ skipped | — | — | Fishing achievement requiring any one of several rare fish from diverse zones; no single primary zone | 2026-07-13 |
| 879 | Old School Ride | ⏭ skipped | — | — | FoS for owning original epic mounts no longer attainable; mount collection, no geographic association | 2026-07-13 |
| 880 | Swift Zulian Tiger | ✅ already present | 337 | Zul'Gurub | Already in ZoneData.lua Zul'Gurub entry | 2026-07-13 |
| 881 | Swift Razzashi Raptor | ✅ already present | 337 | Zul'Gurub | Already in ZoneData.lua Zul'Gurub entry | 2026-07-13 |
| 882 | Fiery Warhorse's Reins | ✅ already present | 350 | Karazhan | Already in ZoneData.lua Karazhan entry | 2026-07-13 |
| 883 | Reins of the Raven Lord | ✅ already present | 258 | Sethekk Halls | Already in ZoneData.lua Sethekk Halls entry | 2026-07-13 |
| 884 | Swift White Hawkstrider | ✅ already present | 348 | Magisters' Terrace | Already in ZoneData.lua Magisters' Terrace entry | 2026-07-13 |
| 885 | Ashes of Al'ar | ✅ already present | 334 | Tempest Keep | Already in ZoneData.lua Tempest Keep entry | 2026-07-13 |
| 886 | Swift Nether Drake | ⏭ skipped | — | — | PvP arena season 1 (TBC) elite reward; no geographic association | 2026-07-13 |
| 887 | Merciless Nether Drake | ⏭ skipped | — | — | PvP arena season 2 (TBC) elite reward; no geographic association | 2026-07-13 |
| 888 | Vengeful Nether Drake | ⏭ skipped | — | — | PvP arena season 3 (TBC) elite reward; no geographic association | 2026-07-13 |
| 889 | Fast and Furious | ⏭ skipped | — | — | Riding skill rank achievement; no geographic association | 2026-07-13 |
| 890 | Into the Wild Blue Yonder | ⏭ skipped | — | — | Riding skill rank achievement; no geographic association | 2026-07-13 |
| 891 | Giddy Up! | ⏭ skipped | — | — | Riding skill rank achievement; no geographic association | 2026-07-13 |
| 892 | The Right Stuff | ⏭ skipped | — | — | Riding skill rank achievement; no geographic association | 2026-07-13 |
| 893 | Cenarion War Hippogryph | ✅ already present | 102 | Zangarmarsh | Already in ZoneData.lua Zangarmarsh entry; Cenarion Expedition based in Zangarmarsh | 2026-07-13 |
| 894 | Flying High Over Skettis | ✅ already present | 105, 108 | Blade's Edge Mountains, Terokkar Forest | Already in ZoneData.lua; Sha'tari Skyguard has quests in Terokkar Forest (Skettis) and Blade's Edge Mountains | 2026-07-13 |
| 896 | A Quest a Day Keeps the Ogres at Bay | ✅ already present | 105 | Blade's Edge Mountains | Already in ZoneData.lua Blade's Edge Mountains entry; Ogri'la is in Blade's Edge | 2026-07-13 |
| 897 | You're So Offensive | ✅ already present | 122, 348 | Isle of Quel'Danas, Magisters' Terrace | Already in ZoneData.lua zones 122 and 348; zone 13 (Eastern Kingdoms) is a parent map appearing in CSV via hierarchy, not directly coded; wiki confirms SSO rep is earned on the Isle and in Magisters' Terrace only | 2026-07-13 |
| 898 | On Wings of Nether | ✅ already present | 104 | Shadowmoon Valley | Already in ZoneData.lua Shadowmoon Valley entry; Netherwing Ledge is in Shadowmoon Valley | 2026-07-13 |
| 899 | Oh My, Kurenai | ✅ already present | 107 | Nagrand | Already in ZoneData.lua Nagrand entry; Kurenai is based in Nagrand | 2026-07-13 |
| 900 | The Czar of Sporeggar | ✅ already present | 102 | Zangarmarsh | Already in ZoneData.lua Zangarmarsh entry; Sporeggar is in Zangarmarsh | 2026-07-13 |
| 901 | Mag'har of Draenor | ✅ already present | 107 | Nagrand | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Nagrand entry | 2026-07-14 |
| 902 | Chief Exalted Officer | ✅ already present | 107, 109, 272 | Nagrand, Netherstorm, Mana-Tombs | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` entries; removed from Outland continent (101) — Consortium has no presence at continent level | 2026-07-14 |
| 903 | Shattrath Divided | ✅ already present | 108 | Terokkar Forest | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` Terokkar Forest entry | 2026-07-14 |
| 905 | Old Man Barlowned | ✅ added | 108 | Terokkar Forest | Added to Terokkar Forest entry in `Shared/02_TheBurningCrusade/ZoneData.lua`; Old Man Barlo's fishing dailies are in Terokkar Forest | 2026-07-14 |
| 906 | Kickin' It Up a Notch | ✅ added | 111 | Shattrath City | Added to Shattrath City entry in `Shared/02_TheBurningCrusade/ZoneData.lua`; The Rokk's cooking dailies are in Shattrath City | 2026-07-14 |
| 907 | The Justicar | ✅ added | 91, 92, 93 | Alterac Valley, Warsong Gulch, Arathi Basin | Added to all three battleground entries in `Shared/01_Vanilla/ZoneData.lua`; achievement requires Exalted with all three BG factions | 2026-07-14 |
| 908 | Call to Arms! | ⏭ skipped | — | — | Battleground participation count achievement; no single geographic association | 2026-07-14 |
| 909 | Call to Arms! | ⏭ skipped | — | — | Battleground participation count achievement; no single geographic association | 2026-07-14 |
| 910 | Elders of the Dungeons | ✅ added | 219, 220, 250, 280, 242/243, 317, 129, 133–135, 136/137, 140, 154, 157–159, 160/161 | Zul'Farrak, Sunken Temple, Blackrock Spire, Maraudon, Blackrock Depths, Stratholme, The Nexus, Utgarde Keep, Utgarde Pinnacle, Halls of Stone, Gundrak, Azjol-Nerub, Drak'Tharon Keep | Added 910 to each dungeon entry containing a Lunar Festival elder in `Shared/01_Vanilla/ZoneData.lua` (Vanilla dungeons) and `Shared/03_WrathOfTheLichKing/ZoneData.lua` (WotLK dungeons) | 2026-07-15 |
| 911 | Elders of Kalimdor | ✅ added | 1, 7, 57, 62, 63, 64, 65, 69, 71–73, 76, 77, 81/82, 83, 235, 78/79, 10/11 | Durotar, Mulgore, Teldrassil, Darkshore, Ashenvale, Thousand Needles, Stonetalon Mountains, Feralas, Tanaris, Azshara, Felwood, Silithus, Winterspring, Dire Maul, Un'Goro Crater, Northern Barrens | Added 911 to each zone entry containing a Lunar Festival elder in `Shared/01_Vanilla/ZoneData.lua` and `Shared/04_Cataclysm/ZoneData.lua` | 2026-07-15 |
| 912 | Elders of Eastern Kingdoms | ✅ added | 17, 18, 21, 22, 23, 26, 27, 36, 37, 48, 52, 32, 210, 337, 476 | Blasted Lands, Tirisfal Glades, Silverpine Forest, Western Plaguelands, Eastern Plaguelands, The Hinterlands, Dun Morogh, Burning Steppes, Elwynn Forest, Loch Modan, Westfall, Searing Gorge, Cape of Stranglethorn, Zul'Gurub, Scholomance | Added 912 to each zone entry containing a Lunar Festival elder across `Shared/01_Vanilla/ZoneData.lua`, `Shared/04_Cataclysm/ZoneData.lua`, and `Shared/05_MistsOfPandaria/ZoneData.lua` | 2026-07-15 |
| 913 | To Honor One's Elders | ⏭ skipped | — | — | Lunar Festival meta-achievement with no single geographic association | 2026-07-14 |
| 914 | Elders of the Horde | ✅ added | 85, 88, 90, 110 | Orgrimmar, Thunder Bluff, Undercity, Silvermoon City | Added to Horde capital city entries in `Shared/01_Vanilla/ZoneData.lua` and `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-07-14 |
| 915 | Elders of the Alliance | ✅ added | 84, 87, 89, 103 | Stormwind City, Ironforge, Darnassus, The Exodar | Added to Alliance capital city entries in `Shared/01_Vanilla/ZoneData.lua` and `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-07-14 |
| 62282 | Altar of Fangs | ✅ added | 2588 | Altar of Fangs | New Midnight Season 2 dungeon in `Retail/12_Midnight/ZoneData.lua` | 2026-08-06 |
| 62283 | Heroic: Altar of Fangs | ✅ added | 2588 | Altar of Fangs | Same new dungeon entry | 2026-08-06 |
| 62284 | Mythic: Altar of Fangs | ✅ added | 2588 | Altar of Fangs | Same new dungeon entry | 2026-08-06 |
| 62297 | The Curse of Ula'tek | ✅ added | 2437, 2512 | Zul'Aman, The Coiled Isle | Quest achievement bridging both zones; added to Zul'Aman and The Coiled Isle zone entries | 2026-08-06 |
| 62410 | Adventurer of the Mist | ⏭ skipped | — | — | Character crest-trade chain; no geographic association (Season 1 equivalent 42767 also absent from ZoneData) | 2026-08-06 |
| 62411 | Veteran of the Mist | ⏭ skipped | — | — | Character crest-trade chain; no geographic association | 2026-08-06 |
| 62412 | Champion of the Mist | ⏭ skipped | — | — | Character crest-trade chain; no geographic association | 2026-08-06 |
| 62414 | Hero of the Mist | ⏭ skipped | — | — | Character crest-trade chain; no geographic association | 2026-08-06 |
| 62416 | Myth of the Mist | ⏭ skipped | — | — | Character crest-trade chain; no geographic association | 2026-08-06 |
| 62417 | Midnight Season 2: Resilient Keystone 12 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62418 | Midnight Season 2: Resilient Keystone 13 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62419 | Midnight Season 2: Resilient Keystone 14 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62420 | Midnight Season 2: Resilient Keystone 15 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62421 | Midnight Season 2: Resilient Keystone 16 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62422 | Midnight Season 2: Resilient Keystone 17 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62423 | Midnight Season 2: Resilient Keystone 18 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62424 | Midnight Season 2: Resilient Keystone 19 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62425 | Midnight Season 2: Resilient Keystone 20 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62426 | Midnight Season 2: Resilient Keystone 21 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62427 | Midnight Season 2: Resilient Keystone 22 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62428 | Midnight Season 2: Resilient Keystone 23 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62429 | Midnight Season 2: Resilient Keystone 24 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62430 | Midnight Season 2: Resilient Keystone 25 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62431 | Midnight Season 2: Resilient Keystone 26 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62432 | Midnight Season 2: Resilient Keystone 27 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62433 | Midnight Season 2: Resilient Keystone 28 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62434 | Midnight Season 2: Resilient Keystone 29 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62435 | Midnight Season 2: Resilient Keystone 30 | ⏭ skipped | — | — | M+ season ladder achievement; no geographic association | 2026-08-06 |
| 62436 | Venomous Hero: Midnight Season 2 | ⏭ skipped | — | — | M+ season meta achievement; no geographic association | 2026-08-06 |
| 62437 | Keystone Hero: The Blinding Vale | ✅ added | 2500 | The Blinding Vale | Season 2 M+ rotation dungeon, added to existing entry | 2026-08-06 |
| 62438 | Keystone Hero: Voidscar Arena | ✅ added | 2572 | Voidscar Arena | Season 2 M+ rotation dungeon, added to existing entry | 2026-08-06 |
| 62439 | Keystone Hero: Den of Nalorakk | ✅ added | 2513 | Den of Nalorakk | Season 2 M+ rotation dungeon, added to existing entry | 2026-08-06 |
| 62440 | Keystone Hero: Murder Row | ✅ added | 2433 | Murder Row | Season 2 M+ rotation dungeon, added to existing entry | 2026-08-06 |
| 62441 | Keystone Hero: Altar of Fangs | ✅ added | 2588 | Altar of Fangs | New Season 2 dungeon | 2026-08-06 |
| 62442 | Keystone Hero: Ruby Life Pools (Midnight Season 2) | ✅ added | 2094 | Ruby Life Pools | Old Dragonflight dungeon rejoining rotation; new entry in `Retail/10_Dragonflight/ZoneData.lua` | 2026-08-06 |
| 62443 | Keystone Hero: Temple of Sethraliss | ✅ added | 1038 | Temple of Sethraliss | Old BfA dungeon rejoining rotation, added to existing entry in `Retail/08_BattleForAzeroth/ZoneData.lua` | 2026-08-06 |
| 62444 | Keystone Hero: Kings' Rest | ✅ added | 1004 | Kings' Rest | Old BfA dungeon rejoining rotation, added to existing entry in `Retail/08_BattleForAzeroth/ZoneData.lua` | 2026-08-06 |
| 62445 | Midnight Keystone Explorer: Season 2 | ⏭ skipped | — | — | M+ season meta achievement; no geographic association | 2026-08-06 |
| 62446 | Midnight Keystone Conqueror: Season 2 | ⏭ skipped | — | — | M+ season meta achievement; no geographic association | 2026-08-06 |
| 62447 | Midnight Keystone Master: Season 2 | ⏭ skipped | — | — | M+ season meta achievement; no geographic association | 2026-08-06 |
| 62448 | Midnight Keystone Hero: Season 2 | ⏭ skipped | — | — | M+ season meta achievement; no geographic association | 2026-08-06 |
| 62449 | Midnight Keystone Legend: Season 2 | ⏭ skipped | — | — | M+ season meta achievement; no geographic association | 2026-08-06 |
| 62460 | Family Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent for any "Battler of" achievement | 2026-08-06 |
| 62461 | Family Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62466 | Aquatic Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62467 | Beast Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62468 | Critter Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62469 | Dragonkin Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62470 | Elemental Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62471 | Flying Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62472 | Humanoid Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62473 | Magic Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62474 | Mechanical Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62475 | Undead Battler of Outland | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62476 | Aquatic Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62477 | Beast Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62478 | Critter Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62479 | Dragonkin Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62480 | Elemental Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62481 | Flying Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62482 | Humanoid Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62483 | Magic Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62487 | Mechanical Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62488 | Undead Battler of Cataclysm | ⏭ skipped | — | — | Pet battle achievement; no ZoneData precedent | 2026-08-06 |
| 62492 | The Coiled Isle Safari | ⏭ skipped | — | — | Pet battle safari achievement; no ZoneData precedent (Midnight Safari 61091 also absent) | 2026-08-06 |
| 62497 | Venomous Weapons of Conquest | ⏭ skipped | — | — | PvP season transmog set; no ZoneData precedent (Galactic Weapons of Conquest 61443 also absent) | 2026-08-06 |
| 62600 | Ritual Behavior | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle (2512) | 2026-08-06 |
| 62601 | Soft Underbelly | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 62604 | Dance While Everyone Watches | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 62649 | A Lone Wanderer | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 62871 | Midnight Season 2: Catalyst Unbound | ⏭ skipped | — | — | Character catalyst achievement; no geographic association (Season 1 equivalent 61519 also absent) | 2026-08-06 |
| 62872 | Midnight Season 2: Serpent Scion | ⏭ skipped | — | — | NotCategorized PvP/raid combo achievement; no geographic association | 2026-08-06 |
| 62889 | Midnight Delves: Tier 4 (Season 2) | ✅ added | — | Midnight delves (all) | New `delvesS2Progress` table referenced by all 10 Season 1 delves + new Season 2 delves | 2026-08-06 |
| 62890 | Midnight Delves: Tier 5 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62891 | Midnight Delves: Tier 6 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62892 | Midnight Delves: Tier 7 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62893 | Midnight Delves: Tier 8 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62894 | Midnight Delves: Tier 9 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62895 | Midnight Delves: Tier 10 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62897 | Midnight Delves: Tier 11 (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 62911 | Rival II: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62921 | Battle Mender: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62922 | Venomous Gladiator: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62923 | Venomous Legend: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62924 | Venomous Marshal: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62925 | Venomous Warlord: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder (Horde faction split of 62924); no geographic association | 2026-08-06 |
| 62926 | Combatant I: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62927 | Challenger I: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62928 | Rival I: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62929 | Duelist: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62930 | Gladiator: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62931 | Elite: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62932 | Legend: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62950 | Strategist: Midnight Season 2 | ⏭ skipped | — | — | PvP BG Blitz ladder; no geographic association | 2026-08-06 |
| 62951 | Combatant II: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62952 | Challenger II: Midnight Season 2 | ⏭ skipped | — | — | PvP arena ladder; no geographic association | 2026-08-06 |
| 62953 | Hero of the Alliance: Venomous | ⏭ skipped | — | — | PvP RBG ladder; no geographic association | 2026-08-06 |
| 62954 | Hero of the Horde: Venomous | ⏭ skipped | — | — | PvP RBG ladder (Horde faction split of 62953); no geographic association | 2026-08-06 |
| 62955 | Venomous Gladiator's Goredrake | ⏭ skipped | — | — | PvP season mount reward achievement; no geographic association | 2026-08-06 |
| 63104 | Umbral Champion: Midnight Season 1 | ⏭ skipped | — | — | PvP season mount meta; no geographic association (Umbral Hero 61259 also absent) | 2026-08-06 |
| 63167 | Tour of Duty: The Coiled Isle | ✅ added | 2512 | The Coiled Isle | Zone PvP quest chain | 2026-08-06 |
| 63170 | Gnarldor Isle Discoveries | ✅ added | 2635 | Gnarldor Isle | New Season 2 delve | 2026-08-06 |
| 63171 | The Ring of Glory Discoveries | ✅ added | 2633 | The Ring of Glory | New Season 2 delve | 2026-08-06 |
| 63250 | Is Venom Stasis A Joke To You? | ✅ added | 2606 | The Venomous Abyss | New Season 2 raid, Glory-analog achievement | 2026-08-06 |
| 63253 | A Round on the House in Midnight | ⏭ skipped | — | — | Brewfest holiday achievement; belongs in CategoryData_Events.lua, no ZoneData precedent | 2026-08-06 |
| 63254 | Glory of the Venomous Raider | ✅ added | 2606 | The Venomous Abyss | Season 2 raid glory meta (Tidebound Grotto excluded — single-boss mini-raid, matches Sporefall precedent of no shared meta) | 2026-08-06 |
| 63326 | My Venomous Nemesis | ✅ added | 2634 | Venomfall Deeps | New Season 2 boss-lair delve | 2026-08-06 |
| 63332 | Purging the Poison | ✅ added | 2634 | Venomfall Deeps | New Season 2 boss-lair delve | 2026-08-06 |
| 63333 | Let Me Solo Him: Azta'rec | ✅ added | 2634 | Venomfall Deeps | New Season 2 boss-lair delve | 2026-08-06 |
| 63334 | Fabled Let Me Solo Him: Azta'rec | ✅ added | 2634 | Venomfall Deeps | New Season 2 boss-lair delve | 2026-08-06 |
| 63358 | Coiled to Strike | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63359 | Treasures of the Coiled Isle | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63381 | Cursebreaker | ⏭ skipped | — | — | Curse Surges expansion-wide rotating mechanic; no ZoneData precedent (matches Ritual Sites/Void Assaults) | 2026-08-06 |
| 63382 | It's Definitely Something | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63390 | Turn the Surge | ⏭ skipped | — | — | Curse Surges expansion-wide rotating mechanic; no ZoneData precedent | 2026-08-06 |
| 63391 | Jumping Through Hoops | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63395 | The Coiled Isles Glyph Hunter | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63397 | Kept You Waiting Huh? | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63400 | Tricks and Treats of Midnight | ⏭ skipped | — | — | Hallow's End holiday achievement; belongs in CategoryData_Events.lua, no ZoneData precedent | 2026-08-06 |
| 63415 | Prey: Coiled Nightmares | ⏭ skipped | — | — | Prey rotating world-hunt mechanic; no ZoneData precedent | 2026-08-06 |
| 63416 | That's a Wrap | ⏭ skipped | — | — | Prey rotating world-hunt mechanic; no ZoneData precedent | 2026-08-06 |
| 63418 | Well, Well, Little Sky | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63432 | Mysterious Mix Master | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63433 | Midnight: Journey's End (Season 2) | ✅ added | — | Midnight delves (all) | `delvesS2Progress` table | 2026-08-06 |
| 63434 | Buddy System VII: Valeera | ✅ added | — | Midnight delves (all) | Appended to base `delves` table (persistent companion chain, like TWW Buddy System) | 2026-08-06 |
| 63435 | Buddy System VIII: Valeera | ✅ added | — | Midnight delves (all) | Appended to base `delves` table | 2026-08-06 |
| 63436 | The Ring of Glory Stories | ✅ added | 2633 | The Ring of Glory | New Season 2 delve | 2026-08-06 |
| 63437 | Gnarldor Isle Stories | ✅ added | 2635 | Gnarldor Isle | New Season 2 delve | 2026-08-06 |
| 63441 | Souvenir Seeker, Razorwind Shores | ⏭ skipped | — | — | Housing neighborhood achievement; no ZoneData precedent for Housing | 2026-08-06 |
| 63451 | Scales for Days | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63452 | Fangs for the Memories | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63453 | One, Two, Ral'kala's Coming for You | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63454 | Nine, Ten, Never Sleep Again | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63457 | Let Sleeping Skulls Lie | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63472 | Fang Fatale | ✅ added | 2606 | The Venomous Abyss | Raid transmog-set achievement, root list after AotC/CE | 2026-08-06 |
| 63473 | Sssensational! | ⏭ skipped | — | — | NotCategorized PvP/raid combo achievement; no geographic association (matches 61490/61858 pattern) | 2026-08-06 |
| 63476 | Mythic: Ula'tek | ✅ added | 2606 | The Venomous Abyss | Final boss, end of Mythic boss-kill list | 2026-08-06 |
| 63510 | The Briny Best | ⏭ skipped | — | — | Fishing profession achievement; no ZoneData precedent for professions | 2026-08-06 |
| 63512 | Treasures of the Damned | ⏭ skipped | — | — | Fishing profession achievement; no ZoneData precedent | 2026-08-06 |
| 63520 | Heroic: The Venomous Abyss | ✅ added | 2606 | The Venomous Abyss | Base raid clear | 2026-08-06 |
| 63521 | The Venomous Abyss | ✅ added | 2606 | The Venomous Abyss | Base raid clear | 2026-08-06 |
| 63522 | Mythic: The Venomous Abyss | ✅ added | 2606 | The Venomous Abyss | Base raid clear | 2026-08-06 |
| 63523 | Mythic: Nek'zali the Soulcoiler | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63524 | Mythic: Entombed Sentinels | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63525 | Mythic: The Lost Explorers | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63526 | Mythic: Vashnik the Malignant | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63527 | Mythic: Sszorak | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63528 | Mythic: The Twin Fangs | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63529 | Mythic: The Coiled Altar | ✅ added | 2606 | The Venomous Abyss | Mythic boss kill | 2026-08-06 |
| 63530 | The Venomous Abyss: Essence of Ula'tek | ✅ added | 2606 | The Venomous Abyss | Boss-group meta achievement | 2026-08-06 |
| 63531 | The Venomous Abyss: Beasts of Ula'tek | ✅ added | 2606 | The Venomous Abyss | Boss-group meta achievement | 2026-08-06 |
| 63532 | The Venomous Abyss: Ula'tek | ✅ added | 2606 | The Venomous Abyss | Boss-group meta achievement | 2026-08-06 |
| 63596 | Snake Stompin' | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63598 | Roll the Patrol | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63599 | Submerge the Incursion | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63600 | Spike the Strike | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63601 | Oppose the Foes | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63605 | Souvenir Seeker, Founder's Point | ⏭ skipped | — | — | Housing neighborhood achievement; no ZoneData precedent | 2026-08-06 |
| 63606 | Superlative Souvenir Seeker | ⏭ skipped | — | — | Housing neighborhood achievement; no ZoneData precedent | 2026-08-06 |
| 63608 | Venomous Vestments | ⏭ skipped | — | — | PvP season transmog set; no ZoneData precedent (Galactic Gala 61586 also absent) | 2026-08-06 |
| 63609 | No Egg Scramble | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63610 | The Honored Dead | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63611 | Big Prey Hunter (Season 2) | ⏭ skipped | — | — | Prey rotating world-hunt mechanic; no ZoneData precedent | 2026-08-06 |
| 63619 | New Friends | ✅ added | 2541 | Arcantina | Added to existing Arcantina zone | 2026-08-06 |
| 63620 | Well Decorated | ✅ added | 2541 | Arcantina | Added to existing Arcantina zone | 2026-08-06 |
| 63621 | Keystone Victor: Altar of Fangs | ✅ added | 2588 | Altar of Fangs | New Season 2 dungeon | 2026-08-06 |
| 63622 | Keystone Victor: Den of Nalorakk | ✅ added | 2513 | Den of Nalorakk | Season 2 M+ rotation dungeon | 2026-08-06 |
| 63623 | Keystone Victor: Murder Row | ✅ added | 2433 | Murder Row | Season 2 M+ rotation dungeon | 2026-08-06 |
| 63624 | Keystone Victor: The Blinding Vale | ✅ added | 2500 | The Blinding Vale | Season 2 M+ rotation dungeon | 2026-08-06 |
| 63625 | Keystone Victor: Voidscar Arena | ✅ added | 2572 | Voidscar Arena | Season 2 M+ rotation dungeon | 2026-08-06 |
| 63626 | Keystone Victor: Kings' Rest | ✅ added | 1004 | Kings' Rest | Old BfA dungeon, added to existing entry in `Retail/08_BattleForAzeroth/ZoneData.lua` | 2026-08-06 |
| 63627 | Keystone Victor: Ruby Life Pools | ✅ added | 2094 | Ruby Life Pools | Old Dragonflight dungeon, new entry in `Retail/10_Dragonflight/ZoneData.lua` | 2026-08-06 |
| 63628 | Keystone Victor: Temple of Sethraliss | ✅ added | 1038 | Temple of Sethraliss | Old BfA dungeon, added to existing entry in `Retail/08_BattleForAzeroth/ZoneData.lua` | 2026-08-06 |
| 63629 | Angler of The Coiled Isle | ⏭ skipped | — | — | Fishing profession achievement; no ZoneData precedent | 2026-08-06 |
| 63630 | Assault the Vault | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63631 | Captain Tokka's Crew | ✅ added | 2512 | The Coiled Isle | Zone reputation | 2026-08-06 |
| 63632 | Toxic Trophies | ⏭ skipped | — | — | Fishing profession achievement; no ZoneData precedent | 2026-08-06 |
| 63633 | A Stack of Snacks | ✅ added | 2512 | The Coiled Isle | Zone quest | 2026-08-06 |
| 63634 | Where Did You Get That? | ⏭ skipped | — | — | Fishing profession achievement; no ZoneData precedent | 2026-08-06 |
| 63635 | Tokka's Terrible Trials | ⏭ skipped | — | — | Fishing profession achievement; no ZoneData precedent | 2026-08-06 |
| 63636 | Fully Corroded | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63639 | Ula'tek Uncoiled | ✅ added | 2512 | The Coiled Isle | Zone summary/meta achievement | 2026-08-06 |
| 63640 | Explore the Coiled Isle | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63641 | Snake Charmed, I'm Sure | ✅ added | 2512 | The Coiled Isle | Zone quest | 2026-08-06 |
| 63642 | Sashay Away | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63643 | You Guys, Again? | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63644 | Kill Me Now | ⏭ skipped | — | — | Prey "Coiled Nightmares" sub-tier; no ZoneData precedent | 2026-08-06 |
| 63645 | Accidental Inclusion | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63650 | Ahead of the Curve: Ula'tek | ✅ added | 2606 | The Venomous Abyss | Raid AotC | 2026-08-06 |
| 63651 | Cutting Edge: Ula'tek | ✅ added | 2606 | The Venomous Abyss | Raid CE | 2026-08-06 |
| 63653 | Pro Poison Patroller | ✅ added | 2509 | Vaults of Atal'Utek | Own zone, distinct from The Coiled Isle | 2026-08-06 |
| 63656 | Taking a Bite out of Slime | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63662 | Student of Hissstory | ✅ added | 2512 | The Coiled Isle | Zone exploration | 2026-08-06 |
| 63669 | Watch Out Behind You | ✅ added | 2606 | The Venomous Abyss | Glory-analog achievement | 2026-08-06 |
| 63670 | Comforting Da Spirits | ✅ added | 2606 | The Venomous Abyss | Raid lore achievement | 2026-08-06 |
| 63679 | In Case Of Emergency | ✅ added | 2588 | Altar of Fangs | Dungeon lore achievement, listed first per convention | 2026-08-06 |
| 63681 | Heroic: Nymrissa Wavecaller | ✅ added | 2632 | The Tidebound Grotto | New Season 2 single-boss raid | 2026-08-06 |
| 63682 | Mythic: Nymrissa Wavecaller | ✅ added | 2632 | The Tidebound Grotto | New Season 2 single-boss raid | 2026-08-06 |
| 63683 | Nymrissa Wavecaller | ✅ added | 2632 | The Tidebound Grotto | New Season 2 single-boss raid | 2026-08-06 |
| 63695 | Arena Exercise | ⏭ skipped | — | — | PvP Training Grounds achievement; no ZoneData precedent | 2026-08-06 |
| 63696 | Arena Exercise | ⏭ skipped | — | — | PvP Training Grounds achievement; no ZoneData precedent | 2026-08-06 |
| 63697 | Arena Exercise | ⏭ skipped | — | — | PvP Training Grounds achievement; no ZoneData precedent | 2026-08-06 |
| 63698 | Arena Exercise | ⏭ skipped | — | — | PvP Training Grounds achievement; no ZoneData precedent | 2026-08-06 |
| 63699 | World Wide Trainer | ⏭ skipped | — | — | PvP Training Grounds meta; no ZoneData precedent | 2026-08-06 |
| 937 | Elune's Blessing | ✅ added | 80 | Moonglade | Lunar Festival quest (defeat Omen); zone-specific | 2026-08-07 |
| 938 | The Snows of Northrend | ✅ already present | 119 | Sholazar Basin | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 939 | Hills Like White Elekk | ✅ already present | 107 | Nagrand | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-08-07 |
| 940 | The Green Hills of Stranglethorn | ✅ already present | 50 | Northern Stranglethorn | Present in `Shared/04_Cataclysm/ZoneData.lua` zone 50 list (inline comment there reads "Of Blood and Anguish" — pre-existing stale/mislabeled comment, functionally still ID 940) | 2026-08-07 |
| 941 | Hemet Nesingwary: The Collected Quests | ✅ already present | 50, 107, 119 | Northern Stranglethorn + Nagrand + Sholazar Basin | Meta achievement; present in `Shared/04_Cataclysm` (comment there reads "Better Him Than Me" — same stale-comment issue as 940), `Shared/02_TheBurningCrusade`, and `Shared/03_WrathOfTheLichKing` ZoneData files | 2026-08-07 |
| 942 | The Diplomat | ✅ already present | 12, 77, 83, 101, 102, 107 | Multi-zone (Timbermaw/Sporeggar/Kurenai rep) | Already in `Shared/01_Vanilla`/`Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-08-07 |
| 943 | The Diplomat | ✅ already present | 12, 77, 83, 101, 102, 107 | Multi-zone (Timbermaw/Sporeggar/Mag'har rep) | Already in `Shared/01_Vanilla`/`Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-08-07 |
| 944 | They Love Me In That Tunnel | ✅ already present | 12, 77, 83 | Kalimdor (continent) + Felwood + Winterspring | Already in `Shared/01_Vanilla/ZoneData.lua` | 2026-08-07 |
| 945 | The Argent Champion | ✅ already present | 23, 118 | Eastern Plaguelands + Icecrown | Already in `Shared/01_Vanilla`/`Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 946 | The Argent Dawn | ✅ already present | 23 | Eastern Plaguelands | Already in `Shared/01_Vanilla/ZoneData.lua` | 2026-08-07 |
| 947 | The Argent Crusade | ✅ already present | 118 | Icecrown | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 948 | Ambassador of the Alliance | ✅ added (partial) | 28 zones (was missing Gilneas) | Multiple Alliance rep zones + Ruins of Gilneas | Wowhead criteria confirms the 6 required factions are Stormwind/Ironforge/Gnomeregan Exiles/Darnassus/Exodar/Gilneas; audit found 28 zones already present (Western Plaguelands, Arathi Highlands, Wetlands, Loch Modan, Dun Morogh, Redridge, Elwynn, Duskwood, Swamp of Sorrows, Blasted Lands, Westfall, Teldrassil, Darkshore, Ashenvale, Stonetalon, Felwood, Thousand Needles, Feralas, Dustwallow Marsh, Tanaris, Stormwind City, Azuremyst/Bloodmyst Isle, Hellfire Peninsula, Zangarmarsh, Twilight Highlands, Northern Stranglethorn, Southern Barrens) but Gilneas (217, 1030, 1031 — Ruins of Gilneas) was missing; added there in `Shared/04_Cataclysm/ZoneData.lua` | 2026-08-07 |
| 949 | Tuskarrmageddon | ✅ already present | 114 | Borean Tundra | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 950 | Frenzyheart Tribe | ✅ already present | 119 | Sholazar Basin | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 951 | The Oracles | ✅ already present | 119 | Sholazar Basin | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 952 | Mercenary of Sholazar | ✅ already present | 119 | Sholazar Basin | Multi-faction (Oracles + Frenzyheart Tribe) but both based in Sholazar Basin — single zone, no continent tag; already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 953 | Guardian of Cenarius | ✅ already present | 81, 102, 247 | Silithus + Zangarmarsh + Ruins of Ahn'Qiraj (raid) | Multi-faction (Cenarion Circle + Cenarion Expedition); already in `Shared/01_Vanilla`/`Shared/02_TheBurningCrusade/ZoneData.lua`; no continent tag — consistent with continent tags being reserved for genuinely continent-wide achievements | 2026-08-07 |
| 955 | Hydraxian Waterlords | ✅ already present | 232 | Molten Core (raid) | Already in `Shared/01_Vanilla/ZoneData.lua` | 2026-08-07 |
| 956 | Brood of Nozdormu | ✅ already present | 319, 320, 321 | Ahn'Qiraj (raid) | Already in `Shared/01_Vanilla/ZoneData.lua` | 2026-08-07 |
| 957 | Hero of the Zandalar Tribe | ✅ already present | 337 | Zul'Gurub (dungeon) | Already in `Shared/04_Cataclysm/ZoneData.lua` | 2026-08-07 |
| 958 | Sworn to the Deathsworn | ✅ already present | 339, 340, 341, 342, 343, 344, 345, 346 | Black Temple | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-08-07 |
| 959 | The Scale of the Sands | ✅ already present | 329 | The Battle for Mount Hyjal | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-08-07 |
| 960 | The Violet Eye | ✅ already present | 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366 | Karazhan | Already in `Shared/02_TheBurningCrusade/ZoneData.lua` | 2026-08-07 |
| 961 | Honorary Frenzyheart | ✅ already present | 119 | Sholazar Basin | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 962 | Savior of the Oracles | ✅ already present | 119 | Sholazar Basin | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 963 | Tricks and Treats of Kalimdor | ✅ added | 12 + 16 zones | Kalimdor (continent) + Ashenvale, Azuremyst/Bloodmyst Isle, Darnassus, Darkshore, Desolace, Dustwallow Marsh, Exodar, Felwood, Feralas, Northern Barrens, Silithus, Southern Barrens, Stonetalon Mountains, Tanaris, Teldrassil, Un'Goro Crater, Winterspring | Wowhead criteria (Alliance side) mapped to zone-level tags per user instruction (2026-08-07): add to both continent tag AND each individual criteria zone | 2026-08-07 |
| 964 | Going Down? | ⏭ skipped | — | — | Fall-damage achievement; no geographic association | 2026-08-07 |
| 965 | Tricks and Treats of Kalimdor | ✅ added | 12 + 17 zones | Kalimdor (continent) + Ashenvale, Azshara, Desolace, Durotar, Dustwallow Marsh, Felwood, Feralas, Mulgore, Northern Barrens, Orgrimmar, Silithus, Southern Barrens, Stonetalon Mountains, Tanaris, Thunder Bluff, Un'Goro Crater, Winterspring | Horde faction-split pairing of 963 (`AutoFactionSplit`); Wowhead criteria (Horde side) mapped to zone-level tags per user instruction | 2026-08-07 |
| 966 | Tricks and Treats of Eastern Kingdoms | ✅ added | 13 + 18 zones | Eastern Kingdoms (continent) + Arathi Highlands, Badlands, Blasted Lands, Cape of Stranglethorn, Dun Morogh, Duskwood, Eastern Plaguelands, Elwynn Forest, Hinterlands, Ironforge, Loch Modan, Northern Stranglethorn, Redridge Mountains, Searing Gorge, Stormwind City, Swamp of Sorrows, Westfall, Wetlands | Wowhead criteria mapped to zone-level tags per user instruction | 2026-08-07 |
| 967 | Tricks and Treats of Eastern Kingdoms | ✅ added | 13 + 16 zones | Eastern Kingdoms (continent) + Arathi Highlands, Blasted Lands, Cape of Stranglethorn, Eastern Plaguelands, Eversong Woods, Ghostlands, Hillsbrad Foothills, Hinterlands, Northern Stranglethorn, Searing Gorge, Silvermoon City, Silverpine Forest, Swamp of Sorrows, Tirisfal Glades, Undercity, Western Plaguelands | Alliance faction-split pairing of 966 (`AutoFactionSplit`); Wowhead criteria mapped to zone-level tags per user instruction | 2026-08-07 |
| 968 | Tricks and Treats of Outland | ✅ added | 101 + 8 zones | Outland (continent) + Blade's Edge Mountains, Hellfire Peninsula, Nagrand, Netherstorm, Shadowmoon Valley, Shattrath City, Terokkar Forest, Zangarmarsh | Wowhead criteria mapped to zone-level tags per user instruction | 2026-08-07 |
| 969 | Tricks and Treats of Outland | ✅ added | 101 + 8 zones | Outland (continent) + Blade's Edge Mountains, Hellfire Peninsula, Nagrand, Netherstorm, Shadowmoon Valley, Shattrath City, Terokkar Forest, Zangarmarsh | Horde faction-split pairing of 968 (`AutoFactionSplit`); Wowhead criteria mapped to zone-level tags per user instruction | 2026-08-07 |
| 971 | Tricks and Treats of Azeroth | ✅ added | 12, 13, 101, 947 | Kalimdor, Eastern Kingdoms, Outland, Azeroth (continent) | Meta achievement (complete 963/966/968) — user explicitly confirmed continent tags for this one (2026-08-07); new `947 Azeroth (continent)` entry created in `Shared/ZoneData.lua`'s CrossExpansion table | 2026-08-07 |
| 972 | Trick or Treat! | ⏭ skipped | — | — | Received from any inn's Candy Bucket; not zone-specific (per user, 2026-08-07) | 2026-08-07 |
| 979 | The Mask Task | ⏭ skipped | — | — | Holiday/event achievement (Hallow's End); no ZoneData precedent | 2026-08-07 |
| 980 | The Horseman's Reins | ✅ already present | 435, 436 | Scarlet Monastery (dungeon) | Already in `Shared/05_MistsOfPandaria/ZoneData.lua` | 2026-08-07 |
| 981 | That Sparkling Smile | ⏭ skipped | — | — | Item-use achievement (Tooth Pick); no geographic association | 2026-08-07 |
| 1005 | Know Thy Enemy | ⏭ skipped | — | — | PvP general achievement; no specific zone | 2026-08-07 |
| 1006 | City Defender | ✅ already present | 85, 88, 90, 110 | Orgrimmar, Thunder Bluff, Undercity, Silvermoon City | Already in `Shared/01_Vanilla/ZoneData.lua` (Orgrimmar, Thunder Bluff, Undercity) and `Shared/02_TheBurningCrusade/ZoneData.lua` (Silvermoon City); Horde city-defense achievement, all 4 Horde home cities covered | 2026-08-07 |
| 1007 | The Wyrmrest Accord | ✅ already present | 115 | Dragonblight | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 1008 | The Kirin Tor | ✅ already present | 113, 114, 115, 125 | Northrend + Borean Tundra, Dragonblight, Dalaran | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 1009 | Knights of the Ebon Blade | ✅ already present | 113, 118, 121 | Northrend + Icecrown, Zul'Drak | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua` | 2026-08-07 |
| 1010 | Northrend Vanguard | ✅ already present | 113, 114, 115, 118, 121, 125 | Northrend + Borean Tundra, Dragonblight, Icecrown, Zul'Drak, Dalaran | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; meta rep achievement (Argent Crusade, Wyrmrest Accord, Kirin Tor, Knights of the Ebon Blade) | 2026-08-07 |
| 1011 | The Winds of the North | ✅ already present | 113, 114, 115, 117, 118 | Northrend + Borean Tundra, Dragonblight, Howling Fjord, Icecrown | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; Horde Expedition rep (Warsong Offensive/Taunka/Hand of Vengeance) variant | 2026-08-07 |
| 1012 | The Winds of the North | ✅ already present | 113, 114, 115, 117, 118, 120 | Northrend + Borean Tundra, Dragonblight, Howling Fjord, Icecrown, The Storm Peaks | Already in `Shared/03_WrathOfTheLichKing/ZoneData.lua`; Alliance Vanguard rep variant | 2026-08-07 |
| 1014 | 35 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-08-07 |
| 1015 | 40 Exalted Reputations | ⏭ skipped | — | — | Reputation count achievement; no geographic association | 2026-08-07 |
| 1017 | Can I Keep Him? | ⏭ skipped | — | — | Pet collection achievement; no geographic association | 2026-08-07 |
| 1020 | Ten Tabards | ⏭ skipped | — | — | Tabard appearance collection achievement; no geographic association | 2026-08-07 |
| 1021 | Twenty-Five Tabards | ⏭ skipped | — | — | Tabard appearance collection achievement; no geographic association | 2026-08-07 |
| 1022 | Flame Warden of Eastern Kingdoms | ✅ added | 13 + 14 zones | Eastern Kingdoms (continent) + Arathi Highlands, Badlands, Blasted Lands, Burning Steppes, Dun Morogh, Duskwood, Elwynn Forest, Loch Modan, Northern Stranglethorn, Redridge Mountains, Swamp of Sorrows, The Cape of Stranglethorn, The Hinterlands, Westfall, Wetlands | CORRECTED (2026-08-07): originally miscategorized as a Hallow's End-style holiday skip; Wowhead criteria confirms this is a continent-wide bonfire achievement structurally identical to Tricks and Treats of `<Continent>` — same treatment applied (continent tag + every criteria zone) | 2026-08-07 |
| 1023 | Flame Warden of Kalimdor | ✅ added | 12 + 13 zones | Kalimdor (continent) + Ashenvale, Azuremyst/Bloodmyst Isle, Darkshore, Desolace, Dustwallow Marsh, Feralas, Silithus, Southern Barrens, Stonetalon Mountains, Tanaris, Teldrassil, Un'Goro Crater, Winterspring | CORRECTED (2026-08-07): same Tricks-and-Treats-style treatment as 1022 | 2026-08-07 |
| 1024 | Flame Warden of Outland | ✅ added | 101 + 7 zones | Outland (continent) + Blade's Edge Mountains, Hellfire Peninsula, Nagrand, Netherstorm, Shadowmoon Valley, Terokkar Forest, Zangarmarsh | CORRECTED (2026-08-07): same Tricks-and-Treats-style treatment as 1022 | 2026-08-07 |
| 1025 | Flame Keeper of Eastern Kingdoms | ✅ added | 13 + 14 zones | Eastern Kingdoms (continent) + Arathi Highlands, Badlands, Blasted Lands, Burning Steppes, Eversong Woods, Ghostlands, Hillsbrad Foothills, Northern Stranglethorn, Silverpine Forest, Swamp of Sorrows, The Cape of Stranglethorn, The Hinterlands, Tirisfal Glades, Western Plaguelands | CORRECTED (2026-08-07): Horde faction variant of 1022 (Flame Keeper vs Flame Warden); same treatment | 2026-08-07 |
| 1026 | Flame Keeper of Kalimdor | ✅ added | 12 + 14 zones | Kalimdor (continent) + Ashenvale, Azshara, Desolace, Durotar, Dustwallow Marsh, Feralas, Mulgore, Northern Barrens, Silithus, Southern Barrens, Stonetalon Mountains, Tanaris, Un'Goro Crater, Winterspring | Horde faction variant of 1023 (Flame Warden); Wowhead criteria confirms Horde-territory + contested Kalimdor zones, same continent+zone treatment | 2026-08-07 |
| 1027 | Flame Keeper of Outland | ✅ added | 101 + 7 zones | Outland (continent) + Blade's Edge Mountains, Hellfire Peninsula, Nagrand, Netherstorm, Shadowmoon Valley, Terokkar Forest, Zangarmarsh | Horde faction variant of 1024 (Flame Warden); identical zone footprint (Outland zones aren't faction-split) | 2026-08-07 |
| 1028 | Extinguishing Eastern Kingdoms | ✅ added | 13 + 13 zones | Eastern Kingdoms (continent) + Arathi Highlands, Badlands, Blasted Lands, Burning Steppes, Eversong Woods, Ghostlands, Hillsbrad Foothills, Northern Stranglethorn, Silverpine Forest, Swamp of Sorrows, The Hinterlands, Tirisfal Glades, Western Plaguelands | Alliance-side, extinguishes Horde's bonfires; mirrors 1025 (Flame Keeper EK) zone footprint exactly (verified via Wowhead criteria) | 2026-08-07 |
| 1029 | Extinguishing Kalimdor | ✅ added | 12 + 14 zones | Kalimdor (continent) + Ashenvale, Azshara, Desolace, Durotar, Dustwallow Marsh, Feralas, Mulgore, Northern Barrens, Silithus, Southern Barrens, Stonetalon Mountains, Tanaris, Un'Goro Crater, Winterspring | Alliance-side, extinguishes Horde's bonfires; mirrors 1026 (Flame Keeper Kalimdor) zone footprint exactly (verified via Wowhead criteria) | 2026-08-07 |
| 1030 | Extinguishing Outland | ✅ added | 101 + 7 zones | Outland (continent) + Blade's Edge Mountains, Hellfire Peninsula, Nagrand, Netherstorm, Shadowmoon Valley, Terokkar Forest, Zangarmarsh | Alliance-side, extinguishes Horde's bonfires; mirrors 1024/1027 Outland zone footprint (verified via Wowhead criteria) | 2026-08-07 |
| 1031 | Extinguishing Eastern Kingdoms | ✅ added | 13 + 16 zones | Eastern Kingdoms (continent) + Arathi Highlands, Badlands, Blasted Lands, Burning Steppes, Cape of Stranglethorn, Dun Morogh, Duskwood, Elwynn Forest, Loch Modan, Northern Stranglethorn, Redridge Mountains, Swamp of Sorrows, The Hinterlands, Western Plaguelands, Westfall, Wetlands | Horde-side, extinguishes Alliance's bonfires; mirrors 1022 (Flame Warden EK) zone footprint exactly (verified via Wowhead criteria) | 2026-08-07 |
| 1032 | Extinguishing Kalimdor | ✅ added | 12 + 14 zones | Kalimdor (continent) + Ashenvale, Azuremyst Isle, Bloodmyst Isle, Darkshore, Desolace, Dustwallow Marsh, Feralas, Silithus, Southern Barrens, Stonetalon Mountains, Tanaris, Teldrassil, Un'Goro Crater, Winterspring | Horde-side, extinguishes Alliance's bonfires; mirrors 1023 (Flame Warden Kalimdor), PLUS Bloodmyst Isle which 1023 itself is missing (real gap in 1023's existing coverage, confirmed via Wowhead criteria — flagged for future audit, not auto-fixed per standing rule) | 2026-08-07 |
| 1033 | Extinguishing Outland | ✅ added | 101 + 7 zones | Outland (continent) + Blade's Edge Mountains, Hellfire Peninsula, Nagrand, Netherstorm, Shadowmoon Valley, Terokkar Forest, Zangarmarsh | Horde-side, extinguishes Alliance's bonfires; mirrors 1024/1027/1030 Outland zone footprint (verified via Wowhead criteria) | 2026-08-07 |
| 1034 | The Fires of Azeroth | ✅ added | 12, 13, 101, 947 | Kalimdor, Eastern Kingdoms, Outland, Azeroth (continent) | Meta achievement (complete the 3 Flame Warden continent achievements); same treatment as 971, user-confirmed 2026-08-07 | 2026-08-07 |
| 1035 | Desecration of the Horde | ✅ added | 12, 13, 101, 947 | Kalimdor, Eastern Kingdoms, Outland, Azeroth (continent) | Meta achievement (complete the 3 Extinguishing-vs-Horde achievements); same treatment as 971, user-confirmed 2026-08-07 | 2026-08-07 |
| 1036 | The Fires of Azeroth | ✅ added | 12, 13, 101, 947 | Kalimdor, Eastern Kingdoms, Outland, Azeroth (continent) | Meta achievement (complete the 3 Flame Keeper continent achievements); same treatment as 971, user-confirmed 2026-08-07 | 2026-08-07 |
| 1037 | Desecration of the Alliance | ✅ added | 12, 13, 101, 947 | Kalimdor, Eastern Kingdoms, Outland, Azeroth (continent) | Meta achievement (complete the 3 Extinguishing-vs-Alliance achievements); same treatment as 971, user-confirmed 2026-08-07 | 2026-08-07 |
| 1038 | The Flame Warden | ⏭ skipped | — | — | Title meta requiring 1034 plus other achievements outside this batch (Ice the Frost Lord, King of the Fire Festival, Burning Hot Pole Dance, Torch Juggler) with unverified zone footprint; deferred to a later batch per user (2026-08-07) | 2026-08-07 |
| 1039 | The Flame Keeper | ⏭ skipped | — | — | Title meta requiring 1036 plus other achievements outside this batch; same deferral as 1038 per user (2026-08-07) | 2026-08-07 |
| 1040 | Rotten Hallow | ⏭ skipped | — | — | Hallow's End quest chain sourced primarily from inn-generic "Stink Bombs Away!" daily quest (10 quest-giver locations, confirmed via Wowhead quest search) plus a Stormwind-specific side quest; not meaningfully zone-specific, matches 972 Trick or Treat! precedent | 2026-08-07 |
| 1041 | Rotten Hallow | ⏭ skipped | — | — | Horde-side counterpart of 1040; same inn-generic reasoning | 2026-08-07 |
<!-- END_MAIN_LOG -->

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
| 318 | Total deaths from opposite faction |
| 319 | Duels won |
| 320 | Duels lost |
| 321 | Total raid and dungeon deaths |
| 326 | Gold from quest rewards |
| 328 | Total gold acquired |
| 329 | Auctions posted |
| 330 | Auction purchases |
| 331 | Most expensive bid on auction |
| 332 | Most expensive auction sold |
| 333 | Gold looted |
| 334 | Most gold ever owned |
| 338 | Vanity pets owned |
| 344 | Bandages used |
| 345 | Health potions consumed |
| 346 | Beverages consumed |
| 347 | Food eaten |
| 349 | Flight paths taken |
| 350 | Mage Portals taken |
| 353 | Number of times hearthed |
| 362 | 5v5 victories |
| 363 | 5v5 matches |
| 364 | 3v3 victories |
| 365 | 3v3 matches |
| 366 | 2v2 victories |
| 367 | 2v2 matches |
| 370 | Highest 2v2 personal rating |
| 374 | Highest 2v2 team rating |
| 399 | Just the Two of Us: 1550 |
| 400 | Just the Two of Us: 1750 |
| 401 | Just the Two of Us: 2000 |
| 402 | Three's Company: 1550 |
| 403 | Three's Company: 1750 |
| 404 | High Five: 2000 |
| 405 | Three's Company: 2000 |
| 406 | High Five: 1550 |
| 407 | High Five: 1750 |
| 503 | 50 Quests Completed |
| 504 | 100 Quests Completed |
| 505 | 250 Quests Completed |
| 506 | 500 Quests Completed |
| 507 | 1000 Quests Completed |
| 508 | 1500 Quests Completed |
| 509 | 10000 Honorable Kills |
| 512 | 5000 Honorable Kills |
| 513 | 100 Honorable Kills |
| 515 | 500 Honorable Kills |
| 516 | 1000 Honorable Kills |
| 585 | Eye of the Storm flags captured |
| 586 | Warsong Gulch flags returned |
| 588 | Total Honorable Kills |
| 589 | Highest 5v5 team rating |
| 590 | Highest 3v3 team rating |
| 595 | Highest 3v3 personal rating |
| 596 | Highest 5v5 personal rating |
| 753 | Average gold earned per day |
| 759 | Average daily quests completed per day |
| 796 | Resurrected by priests |
| 798 | Rebirthed by druids |
| 799 | Spirit returned to body by shamans |
| 800 | Redeemed by paladins |
| 801 | Resurrected by soulstones |
| 811 | Flasks consumed |
| 812 | Healthstones used |
| 837 | Arenas won |
| 838 | Arenas played |
| 839 | Battlegrounds played |
| 840 | Battlegrounds won |
| 869 | 50000 Honorable Kills |
| 870 | 100000 Honorable Kills |
| 876 | Brutally Dedicated |
| 919 | Gold earned from auctions |
| 921 | Gold from vendors |
| 922 | Mana potions consumed |
| 923 | Elixirs consumed |
| 932 | Total 5-player dungeons entered |
| 933 | Total 10-player raids entered |
| 934 | Total 25-player raids entered |
| 973 | 5 Daily Quests Completed |
| 974 | 50 Daily Quests Completed |
| 975 | 200 Daily Quests Completed |
| 976 | 500 Daily Quests Completed |
| 977 | 1000 Daily Quests Completed |
| 978 | 3000 Quests Completed |
| 1042 | Number of hugs |
| 1045 | Total cheers |
| 1047 | Total facepalms |
<!-- END_STATS_LOG -->

## IDs Not Found in Game DB (Skipped)

All skipped — achievement ID not found in game DB (verified against build 12.0.7.68275).

0, 1, 2, 3, 4, 5, 14, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 47, 48,
56, 57, 58, 59, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 96,
106, 109, 111, 117, 118, 119, 120, 136, 138, 139, 140, 142, 143, 145, 146, 147, 148, 149,
151, 152, 160, 163, 164, 169, 170, 171, 172, 173, 175, 176, 177, 179, 180, 182, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198,
205, 210, 215, 217, 228, 232, 234, 235, 236, 237, 240, 241, 242, 243, 244,
250, 251, 253, 254, 256, 257, 258, 261, 262, 264, 265, 266, 267, 268, 269, 270, 274, 276, 278, 280, 282, 285, 286, 287, 290, 294, 296, 297, 298, 299,
300, 301, 302, 304, 305, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 322, 323, 324, 325, 327, 335, 336, 337, 339, 340, 341, 342, 343, 348,
351, 352, 354, 355, 356, 357, 358, 359, 360, 361, 368, 369, 371, 372, 373, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 390, 391, 392, 393, 394, 395,
410, 413, 417, 421, 422, 423, 427,
455, 474, 475, 476,
501, 502, 510, 511, 514, 517, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 548, 549,
550, 551, 552, 553, 554, 555, 570, 571, 580, 581, 591, 592, 593, 594, 597, 598, 599,
600, 601, 602, 620,
702, 703, 704, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749,
751, 752, 754, 755, 756, 757, 758, 760, 767, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 797,
803, 804, 805, 806, 807, 808, 809, 810, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836,
874, 895,
916, 917, 918, 920, 924, 925, 926, 927, 928, 929, 930, 931, 935, 936,
954, 970, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999,
1000, 1001, 1002, 1003, 1004, 1013, 1016, 1018, 1019, 1043, 1044, 1046, 1048, 1049, 1050
<!-- END_NOTFOUND -->