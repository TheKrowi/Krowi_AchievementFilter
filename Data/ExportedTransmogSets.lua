local _, addon = ...;
addon.Data.ExportedTransmogSets = {};
local exportedTransmogSets = addon.Data.ExportedTransmogSets;

local tasks, transmogSets;
function exportedTransmogSets.RegisterTasks(_transmogSets)
    transmogSets = _transmogSets;
    wipe(transmogSets);

    local name = "Transmog Sets";
    addon.Data.InjectLoadingDebug(tasks, name);

    tinsert(addon.Data.TasksGroups, 1, tasks);
end

local transmogSet = addon.Objects.TransmogSet;
local function N(id, ...)
    transmogSets[id] = transmogSet:New(id, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-11-06 22-45-28 ]] --
tasks = {
    {N, 2909, 128}, -- Underlight Conjurer's Brilliance
    {N, 2908, 128}, -- Underlight Conjurer's Brilliance
    {N, 2907, 128}, -- Underlight Conjurer's Brilliance
    {N, 2906, 4096}, -- Legacy of Obsidian Secrets
    {N, 2905, 4096}, -- Legacy of Obsidian Secrets
    {N, 2904, 4096}, -- Legacy of Obsidian Secrets
    {N, 2903, 2048}, -- Kinslayer's Burdens
    {N, 2902, 2048}, -- Kinslayer's Burdens
    {N, 2901, 2048}, -- Kinslayer's Burdens
    {N, 2900, 1}, -- Irons of the Onyx Crucible
    {N, 2899, 1}, -- Irons of the Onyx Crucible
    {N, 2898, 1}, -- Irons of the Onyx Crucible
    {N, 2897, 32}, -- Lingering Phantom's Encasement
    {N, 2896, 32}, -- Lingering Phantom's Encasement
    {N, 2895, 32}, -- Lingering Phantom's Encasement
    {N, 2894, 1024}, -- Strands of the Autumn Blaze
    {N, 2893, 1024}, -- Strands of the Autumn Blaze
    {N, 2892, 1024}, -- Strands of the Autumn Blaze
    {N, 2891, 4}, -- Ashen Predator's Scaleform
    {N, 2890, 4}, -- Ashen Predator's Scaleform
    {N, 2889, 4}, -- Ashen Predator's Scaleform
    {N, 2888, 512}, -- Fangs of the Vermillion Forge
    {N, 2887, 512}, -- Fangs of the Vermillion Forge
    {N, 2886, 512}, -- Fangs of the Vermillion Forge
    {N, 2885, 16}, -- The Furnace Seraph's Verdict
    {N, 2884, 16}, -- The Furnace Seraph's Verdict
    {N, 2883, 16}, -- The Furnace Seraph's Verdict
    {N, 2882, 8}, -- Lurking Specter's Shadeweave
    {N, 2881, 8}, -- Lurking Specter's Shadeweave
    {N, 2880, 8}, -- Lurking Specter's Shadeweave
    {N, 2879, 64}, -- Runes of the Cinderwolf
    {N, 2878, 64}, -- Runes of the Cinderwolf
    {N, 2877, 64}, -- Runes of the Cinderwolf
    {N, 2876, 256}, -- Sinister Savant's Cursethreads
    {N, 2875, 256}, -- Sinister Savant's Cursethreads
    {N, 2874, 256}, -- Sinister Savant's Cursethreads
    {N, 2873, 2}, -- Heartfire Sentinel's Authority
    {N, 2872, 2}, -- Heartfire Sentinel's Authority
    {N, 2871, 2}, -- Heartfire Sentinel's Authority
    {N, 2870, 32}, -- Lingering Phantom's Encasement
    {N, 2869, 2048}, -- Kinslayer's Burdens
    {N, 2868, 1024}, -- Strands of the Autumn Blaze
    {N, 2867, 4096}, -- Legacy of Obsidian Secrets
    {N, 2866, 4}, -- Ashen Predator's Scaleform
    {N, 2865, 128}, -- Underlight Conjurer's Brilliance
    {N, 2864, 512}, -- Fangs of the Vermillion Forge
    {N, 2863, 16}, -- The Furnace Seraph's Verdict
    {N, 2862, 8}, -- Lurking Specter's Shadeweave
    {N, 2861, 64}, -- Runes of the Cinderwolf
    {N, 2860, 256}, -- Sinister Savant's Cursethreads
    {N, 2859, 2}, -- Heartfire Sentinel's Authority
    {N, 2858, 1}, -- Irons of the Onyx Crucible
    {N, 2749, 35}, -- Primal Molten
    {N, 2748, 35}, -- Dreamfire
    {N, 2747, 3592}, -- Life-Bound
    {N, 2746, 3592}, -- Green Draketracker
    {N, 2745, 4164}, -- Flame-Touched
    {N, 2744, 4164}, -- Emerald Scale
    {N, 2743, 400}, -- Vibrant Wildercloth
    {N, 2742, 400}, -- Verdant Wing
    {N, 2741, 1}, -- Crimson Gladiator's Plate Armor
    {N, 2740, 1}, -- Crimson Gladiator's Plate Armor
    {N, 2739, 2}, -- Crimson Gladiator's Plate Armor
    {N, 2738, 2}, -- Crimson Gladiator's Plate Armor
    {N, 2737, 32}, -- Crimson Gladiator's Plate Armor
    {N, 2736, 32}, -- Crimson Gladiator's Plate Armor
    {N, 2735, 64}, -- Crimson Gladiator's Chain Armor
    {N, 2734, 64}, -- Crimson Gladiator's Chain Armor
    {N, 2733, 4}, -- Crimson Gladiator's Chain Armor
    {N, 2732, 4}, -- Crimson Gladiator's Chain Armor
    {N, 2731, 4096}, -- Crimson Gladiator's Chain Armor
    {N, 2730, 4096}, -- Crimson Gladiator's Chain Armor
    {N, 2729, 8}, -- Crimson Gladiator's Leather Armor
    {N, 2728, 8}, -- Crimson Gladiator's Leather Armor
    {N, 2727, 512}, -- Crimson Gladiator's Leather Armor
    {N, 2726, 512}, -- Crimson Gladiator's Leather Armor
    {N, 2725, 2048}, -- Crimson Gladiator's Leather Armor
    {N, 2724, 2048}, -- Crimson Gladiator's Leather Armor
    {N, 2723, 1024}, -- Crimson Gladiator's Leather Armor
    {N, 2722, 1024}, -- Crimson Gladiator's Leather Armor
    {N, 2721, 256}, -- Crimson Gladiator's Silk Armor
    {N, 2720, 256}, -- Crimson Gladiator's Silk Armor
    {N, 2719, 16}, -- Crimson Gladiator's Silk Armor
    {N, 2718, 16}, -- Crimson Gladiator's Silk Armor
    {N, 2717, 128}, -- Crimson Gladiator's Silk Armor
    {N, 2716, 128}, -- Crimson Gladiator's Silk Armor
    {N, 2715, 35}, -- Crimson Aspirant's Plate Battlegear
    {N, 2714, 35}, -- Drakeender's Battlegear
    {N, 2713, 35}, -- Citadel Breaker's Battlegear
    {N, 2712, 35}, -- Djaradin Dungeon Battlegear
    {N, 2711, 35}, -- Wyrmforged Battlegear
    {N, 2710, 4164}, -- Centaur Dungeon Harness
    {N, 2709, 4164}, -- Nokuhd Regalia
    {N, 2708, 4164}, -- Aylaag Nomad's Regalia
    {N, 2707, 4164}, -- Crimson Aspirant's Chain Armor
    {N, 2706, 4164}, -- Ohn'ahran Falconer's Regalia
    {N, 2705, 400}, -- Lost Watcher's Vestments
    {N, 2704, 400}, -- Tyr Hold Vestments
    {N, 2703, 400}, -- Titan Dungeonkeeper's Vestments
    {N, 2702, 400}, -- Crimson Aspirant's Silk Vestments
    {N, 2701, 400}, -- Cobalt Watcher's Vestments
    {N, 2700, 35}, -- Shorebreaker's Armor
    {N, 2699, 35}, -- Firestorm Armor
    {N, 2698, 35}, -- Crimson Combatant's Draconium Armor
    {N, 2697, 35}, -- Trailblazer's Plate Armor
    {N, 2696, 4164}, -- Hornstrider's Battlegear
    {N, 2695, 4164}, -- Cyclonic Battlegear
    {N, 2694, 4164}, -- Crimson Combatant's Adamant Battlegear
    {N, 2693, 400}, -- Drakewatcher's Armor
    {N, 2692, 4164}, -- Trailblazer's Mail Armor
    {N, 2691, 400}, -- Crimson Combatant's Wildercloth Regalia
    {N, 2690, 400}, -- Cloudburst Regalia
    {N, 2689, 400}, -- Trailblazer's Cloth Armor
    {N, 2688, 3592}, -- Crimson Combatant's Resilient Armor
    {N, 2687, 3592}, -- Dust Devil Armor
    {N, 2686, 3592}, -- Isle Trapper's Gear
    {N, 2685, 3592}, -- Trailblazer's Leather Armor
    {N, 2684, 3592}, -- Tuskarr Field Garb
    {N, 2683, 3592}, -- Tuskarr Dungeoneer's Garb
    {N, 2682, 3592}, -- Crimson Aspirant's Battlegarb
    {N, 2681, 3592}, -- Ottuk Hide Armor
    {N, 2675, 4164}, -- Sandshaped Dracthyr Battlegear
    {N, 2674, 4164}, -- Cobalt Dracthyr Battlegear
    {N, 2673, 4164}, -- Crimson Dracthyr Battlegear
    {N, 2672, 4164}, -- Emerald Dracthyr Battlegear
    {N, 2670, 4164}, -- Obsidian Dracthyr Battlegear
    {N, 2668, 35}, -- Drakebreaker
    {N, 2667, 35}, -- Raging Tempest
    {N, 2666, 3592}, -- Drakebreaker
    {N, 2665, 3592}, -- Raging Tempest
    {N, 2664, 4164}, -- Drakebreaker
    {N, 2663, 4164}, -- Raging Tempest
    {N, 2662, 400}, -- Drakebreaker
    {N, 2661, 400}, -- Raging Tempest
    {N, 2652, 1}, -- Stones of the Walking Mountain
    {N, 2651, 1}, -- Stones of the Walking Mountain
    {N, 2650, 1}, -- Stones of the Walking Mountain
    {N, 2649, 256}, -- Scalesworn Cultist's Habit
    {N, 2648, 256}, -- Scalesworn Cultist's Habit
    {N, 2647, 256}, -- Scalesworn Cultist's Habit
    {N, 2646, 64}, -- Elements of Infused Earth
    {N, 2645, 64}, -- Elements of Infused Earth
    {N, 2644, 64}, -- Elements of Infused Earth
    {N, 2643, 8}, -- Vault Delver's Toolkit
    {N, 2642, 8}, -- Vault Delver's Toolkit
    {N, 2641, 8}, -- Vault Delver's Toolkit
    {N, 2640, 16}, -- Draconic Hierophant's Finery
    {N, 2639, 16}, -- Draconic Hierophant's Finery
    {N, 2638, 16}, -- Draconic Hierophant's Finery
    {N, 2637, 2}, -- Virtuous Silver Cataphract
    {N, 2636, 2}, -- Virtuous Silver Cataphract
    {N, 2635, 2}, -- Virtuous Silver Cataphract
    {N, 2634, 512}, -- Wrappings of the Waking Fist
    {N, 2633, 512}, -- Wrappings of the Waking Fist
    {N, 2632, 512}, -- Wrappings of the Waking Fist
    {N, 2631, 128}, -- Bindings of the Crystal Scholar
    {N, 2630, 128}, -- Bindings of the Crystal Scholar
    {N, 2629, 128}, -- Bindings of the Crystal Scholar
    {N, 2628, 4}, -- Stormwing Harrier's Camouflage
    {N, 2627, 4}, -- Stormwing Harrier's Camouflage
    {N, 2626, 4}, -- Stormwing Harrier's Camouflage
    {N, 2625, 4096}, -- Scales of the Awakened
    {N, 2624, 4096}, -- Scales of the Awakened
    {N, 2623, 4096}, -- Scales of the Awakened
    {N, 2622, 1024}, -- Lost Landcaller's Vesture
    {N, 2621, 1024}, -- Lost Landcaller's Vesture
    {N, 2620, 1024}, -- Lost Landcaller's Vesture
    {N, 2619, 2048}, -- Skybound Avenger's Flightwear
    {N, 2618, 2048}, -- Skybound Avenger's Flightwear
    {N, 2617, 2048}, -- Skybound Avenger's Flightwear
    {N, 2616, 32}, -- Haunted Frostbrood Remains
    {N, 2615, 32}, -- Haunted Frostbrood Remains
    {N, 2614, 32}, -- Haunted Frostbrood Remains
    {N, 2613, 1}, -- Stones of the Walking Mountain
    {N, 2612, 256}, -- Scalesworn Cultist's Habit
    {N, 2611, 64}, -- Elements of Infused Earth
    {N, 2610, 8}, -- Vault Delver's Toolkit
    {N, 2609, 16}, -- Draconic Hierophant's Finery
    {N, 2608, 2}, -- Virtuous Silver Cataphract
    {N, 2607, 512}, -- Wrappings of the Waking Fist
    {N, 2606, 128}, -- Bindings of the Crystal Scholar
    {N, 2605, 4}, -- Stormwing Harrier's Camouflage
    {N, 2604, 4096}, -- Scales of the Awakened
    {N, 2603, 1024}, -- Lost Landcaller's Vesture
    {N, 2602, 2048}, -- Skybound Avenger's Flightwear
    {N, 2601, 32}, -- Haunted Frostbrood Remains
    {N, 2587, 3592}, -- Tuskarr Trader's Garb
    {N, 2580, 1}, -- Eternal Gladiator's Plate Armor
    {N, 2579, 256}, -- Eternal Gladiator's Felweave Armor
    {N, 2578, 64}, -- Eternal Gladiator's Ringmail Armor
    {N, 2577, 8}, -- Eternal Gladiator's Leather Armor
    {N, 2576, 16}, -- Eternal Gladiator's Satin Armor
    {N, 2575, 2}, -- Eternal Gladiator's Scaled Armor
    {N, 2574, 512}, -- Eternal Gladiator's Ironskin Armor
    {N, 2573, 128}, -- Eternal Gladiator's Silk Armor
    {N, 2572, 4}, -- Eternal Gladiator's Chain Armor
    {N, 2571, 1024}, -- Eternal Gladiator's Dragonhide Armor
    {N, 2570, 2048}, -- Eternal Gladiator's Felskin Armor
    {N, 2569, 32}, -- Eternal Gladiator's Dreadplate Armor
    {N, 2568, 35}, -- Eternal Aspirant's Plate
    {N, 2567, 4164}, -- Eternal Aspirant's Chain
    {N, 2566, 3592}, -- Eternal Aspirant's Leathers
    {N, 2565, 400}, -- Eternal Aspirant's Vestment
    {N, 2564, 1}, -- Eternal Gladiator's Plate Armor
    {N, 2558, 256}, -- Eternal Gladiator's Felweave Armor
    {N, 2552, 64}, -- Eternal Gladiator's Ringmail Armor
    {N, 2546, 8}, -- Eternal Gladiator's Leather Armor
    {N, 2540, 16}, -- Eternal Gladiator's Satin Armor
    {N, 2534, 2}, -- Eternal Gladiator's Scaled Armor
    {N, 2528, 512}, -- Eternal Gladiator's Ironskin Armor
    {N, 2522, 128}, -- Eternal Gladiator's Silk Armor
    {N, 2516, 4}, -- Eternal Gladiator's Chain Armor
    {N, 2510, 1024}, -- Eternal Gladiator's Dragonhide Armor
    {N, 2504, 2048}, -- Eternal Gladiator's Felskin Armor
    {N, 2498, 32}, -- Eternal Gladiator's Dreadplate Armor
    {N, 2492, 35}, -- Renowned Expeditioner's Plate Armor
    {N, 2491, 4164}, -- Renowned Expeditioner's Mail Armor
    {N, 2490, 0}, -- Renowned Expeditioner's Leather Armor
    {N, 2489, 400}, -- Renowned Expeditioner's Cloth Armor
    {N, 2419, 1}, -- Cosmic Gladiator's Plate Armor
    {N, 2418, 1}, -- Cosmic Gladiator's Plate Armor
    {N, 2417, 1}, -- Armaments of the Infinite Infantry
    {N, 2416, 1}, -- Armaments of the Infinite Infantry
    {N, 2415, 1}, -- Armaments of the Infinite Infantry
    {N, 2414, 1}, -- Armaments of the Infinite Infantry
    {N, 2413, 256}, -- Cosmic Gladiator's Felweave Armor
    {N, 2412, 256}, -- Cosmic Gladiator's Felweave Armor
    {N, 2411, 256}, -- Shroud of the Demon Star
    {N, 2410, 256}, -- Shroud of the Demon Star
    {N, 2409, 256}, -- Shroud of the Demon Star
    {N, 2408, 256}, -- Shroud of the Demon Star
    {N, 2407, 64}, -- Cosmic Gladiator's Ringmail Armor
    {N, 2406, 64}, -- Cosmic Gladiator's Ringmail Armor
    {N, 2405, 64}, -- Theurgic Starspeaker's Regalia
    {N, 2404, 64}, -- Theurgic Starspeaker's Regalia
    {N, 2403, 64}, -- Theurgic Starspeaker's Regalia
    {N, 2402, 64}, -- Theurgic Starspeaker's Regalia
    {N, 2401, 8}, -- Cosmic Gladiator's Leather Armor
    {N, 2400, 8}, -- Cosmic Gladiator's Leather Armor
    {N, 2399, 8}, -- Soulblade Shadowhide
    {N, 2398, 8}, -- Soulblade Shadowhide
    {N, 2397, 8}, -- Soulblade Shadowhide
    {N, 2396, 8}, -- Soulblade Shadowhide
    {N, 2395, 16}, -- Cosmic Gladiator's Satin Armor
    {N, 2394, 16}, -- Cosmic Gladiator's Satin Armor
    {N, 2393, 16}, -- Habiliments of the Empyrean
    {N, 2392, 16}, -- Habiliments of the Empyrean
    {N, 2391, 16}, -- Habiliments of the Empyrean
    {N, 2390, 16}, -- Habiliments of the Empyrean
    {N, 2389, 2}, -- Cosmic Gladiator's Scaled Armor
    {N, 2388, 2}, -- Cosmic Gladiator's Scaled Armor
    {N, 2387, 2}, -- Luminous Chevalier's Gallantry
    {N, 2386, 2}, -- Luminous Chevalier's Gallantry
    {N, 2385, 2}, -- Luminous Chevalier's Gallantry
    {N, 2384, 2}, -- Luminous Chevalier's Gallantry
    {N, 2383, 512}, -- Cosmic Gladiator's Ironskin Armor
    {N, 2382, 512}, -- Cosmic Gladiator's Ironskin Armor
    {N, 2381, 512}, -- Garb of the Grand Upwelling
    {N, 2380, 512}, -- Garb of the Grand Upwelling
    {N, 2379, 512}, -- Garb of the Grand Upwelling
    {N, 2378, 512}, -- Garb of the Grand Upwelling
    {N, 2377, 128}, -- Cosmic Gladiator's Silk Armor
    {N, 2376, 128}, -- Cosmic Gladiator's Silk Armor
    {N, 2375, 128}, -- Erudite Occultist's Vestments
    {N, 2374, 128}, -- Erudite Occultist's Vestments
    {N, 2373, 128}, -- Erudite Occultist's Vestments
    {N, 2372, 128}, -- Erudite Occultist's Vestments
    {N, 2371, 4}, -- Cosmic Gladiator's Chain Armor
    {N, 2370, 4}, -- Cosmic Gladiator's Chain Armor
    {N, 2369, 4}, -- Godstalker's Battlegear
    {N, 2368, 4}, -- Godstalker's Battlegear
    {N, 2367, 4}, -- Godstalker's Battlegear
    {N, 2366, 4}, -- Godstalker's Battlegear
    {N, 2365, 1024}, -- Cosmic Gladiator's Dragonhide Armor
    {N, 2364, 1024}, -- Cosmic Gladiator's Dragonhide Armor
    {N, 2363, 1024}, -- Tapestry of the Fixed Stars
    {N, 2362, 1024}, -- Tapestry of the Fixed Stars
    {N, 2361, 1024}, -- Tapestry of the Fixed Stars
    {N, 2360, 1024}, -- Tapestry of the Fixed Stars
    {N, 2359, 2048}, -- Cosmic Gladiator's Felskin Armor
    {N, 2358, 2048}, -- Cosmic Gladiator's Felskin Armor
    {N, 2357, 2048}, -- Mercurial Punisher's Painweave
    {N, 2356, 2048}, -- Mercurial Punisher's Painweave
    {N, 2355, 2048}, -- Mercurial Punisher's Painweave
    {N, 2354, 2048}, -- Mercurial Punisher's Painweave
    {N, 2353, 32}, -- Cosmic Gladiator's Dreadplate Armor
    {N, 2352, 32}, -- Cosmic Gladiator's Dreadplate Armor
    {N, 2351, 32}, -- The First Eidolon's Soulsteel
    {N, 2350, 32}, -- The First Eidolon's Soulsteel
    {N, 2349, 32}, -- The First Eidolon's Soulsteel
    {N, 2348, 32}, -- The First Eidolon's Soulsteel
    {N, 2319, 35}, -- Cosmic Aspirant's Plate
    {N, 2318, 68}, -- Cosmic Aspirant's Chain
    {N, 2317, 3592}, -- Cosmic Aspirant's Leathers
    {N, 2316, 400}, -- Cosmic Aspirant's Vestment
    {N, 2305, 1}, -- Titanic Onslaught Armor
    {N, 2304, 256}, -- Diabolic Raiment
    {N, 2303, 64}, -- Regalia of the Skybreaker
    {N, 2302, 8}, -- Fanged Slayer's Armor
    {N, 2301, 16}, -- Vestments of Blind Absolution
    {N, 2300, 2}, -- Radiant Lightbringer Armor
    {N, 2299, 512}, -- Xuen's Battlegear
    {N, 2298, 128}, -- Regalia of the Arcane Tempest
    {N, 2297, 4}, -- Wildstalker Armor
    {N, 2296, 1024}, -- Stormheart Raiment
    {N, 2295, 2048}, -- Demonbane Armor
    {N, 2294, 32}, -- Gravewarden Armaments
    {N, 2265, 400}, -- Dark Supplicant's Garb
    {N, 2264, 400}, -- Dark Supplicant's Garb
    {N, 2263, 400}, -- Dark Supplicant's Garb
    {N, 2262, 400}, -- Dark Supplicant's Garb
    {N, 2261, 3592}, -- Sanctum Assailant's Trappings
    {N, 2260, 3592}, -- Sanctum Assailant's Trappings
    {N, 2259, 3592}, -- Sanctum Assailant's Trappings
    {N, 2258, 3592}, -- Sanctum Assailant's Trappings
    {N, 2257, 68}, -- Tower Ascendant's Battlegear
    {N, 2256, 68}, -- Tower Ascendant's Battlegear
    {N, 2255, 68}, -- Tower Ascendant's Battlegear
    {N, 2254, 68}, -- Tower Ascendant's Battlegear
    {N, 2253, 35}, -- Soulforged Dreadplate
    {N, 2252, 35}, -- Soulforged Dreadplate
    {N, 2251, 35}, -- Soulforged Dreadplate
    {N, 2250, 35}, -- Soulforged Dreadplate
    {N, 2249, 35}, -- Unchained Aspirant's Plate
    {N, 2248, 68}, -- Unchained Aspirant's Chain
    {N, 2247, 3592}, -- Unchained Aspirant's Leathers
    {N, 2246, 400}, -- Unchained Aspirant's Vestment
    {N, 2231, 35}, -- Unchained Gladiator's Plate
    {N, 2230, 68}, -- Unchained Gladiator's Chain
    {N, 2229, 3592}, -- Unchained Gladiator's Leathers
    {N, 2228, 400}, -- Unchained Gladiator's Vestment
    {N, 2227, 35}, -- Unchained Gladiator's Plate
    {N, 2226, 68}, -- Unchained Gladiator's Chain
    {N, 2225, 3592}, -- Unchained Gladiator's Leathers
    {N, 2224, 400}, -- Unchained Gladiator's Vestment
    {N, 2177, 35}, -- Sinful Aspirant's Plate
    {N, 2176, 68}, -- Sinful Aspirant's Chain
    {N, 2175, 3592}, -- Sinful Aspirant's Leathers
    {N, 2174, 400}, -- Sinful Aspirant's Vestment
    {N, 2173, 35}, -- Sinful Gladiator's Plate
    {N, 2172, 68}, -- Sinful Gladiator's Chain
    {N, 2171, 3592}, -- Sinful Gladiator's Leathers
    {N, 2170, 400}, -- Sinful Gladiator's Vestment
    {N, 2169, 35}, -- Sinful Gladiator's Plate
    {N, 2168, 68}, -- Sinful Gladiator's Chain
    {N, 2167, 3592}, -- Sinful Gladiator's Leathers
    {N, 2166, 400}, -- Sinful Gladiator's Vestment
    {N, 2165, 3592}, -- Sin Slayer's Leathers
    {N, 2164, 3592}, -- Sin Slayer's Leathers
    {N, 2163, 3592}, -- Sin Slayer's Leathers
    {N, 2162, 3592}, -- Sin Slayer's Leathers
    {N, 2161, 400}, -- Depraved Beguiler's Visage
    {N, 2160, 400}, -- Depraved Beguiler's Visage
    {N, 2159, 400}, -- Depraved Beguiler's Visage
    {N, 2158, 400}, -- Depraved Beguiler's Visage
    {N, 2157, 68}, -- Inexorable Castigator's Guise
    {N, 2156, 68}, -- Inexorable Castigator's Guise
    {N, 2155, 68}, -- Inexorable Castigator's Guise
    {N, 2154, 68}, -- Inexorable Castigator's Guise
    {N, 2153, 35}, -- Grand Sentinel's Greatplate
    {N, 2152, 35}, -- Grand Sentinel's Greatplate
    {N, 2151, 35}, -- Grand Sentinel's Greatplate
    {N, 2150, 35}, -- Grand Sentinel's Greatplate
    {N, 1997, 400}, -- Oblivion Cultist's Robes
    {N, 1996, 400}, -- Oblivion Cultist's Robes
    {N, 1995, 400}, -- Oblivion Cultist's Robes
    {N, 1994, 400}, -- Oblivion Cultist's Robes
    {N, 1993, 3592}, -- Treacherous Schemer's Leathers
    {N, 1992, 3592}, -- Treacherous Schemer's Leathers
    {N, 1991, 3592}, -- Treacherous Schemer's Leathers
    {N, 1990, 3592}, -- Treacherous Schemer's Leathers
    {N, 1989, 68}, -- Lurking Defiler's Scalemail
    {N, 1988, 68}, -- Lurking Defiler's Scalemail
    {N, 1987, 68}, -- Lurking Defiler's Scalemail
    {N, 1986, 68}, -- Lurking Defiler's Scalemail
    {N, 1985, 35}, -- Cosmic Aberration's Plate
    {N, 1984, 35}, -- Cosmic Aberration's Plate
    {N, 1983, 35}, -- Cosmic Aberration's Plate
    {N, 1982, 35}, -- Cosmic Aberration's Plate
    {N, 1975, 400}, -- Corrupted Gladiator's Vestment
    {N, 1974, 3592}, -- Corrupted Gladiator's Leathers
    {N, 1973, 68}, -- Corrupted Gladiator's Chain
    {N, 1972, 35}, -- Corrupted Gladiator's Plate
    {N, 1969, 400}, -- Corrupted Gladiator's Vestment
    {N, 1968, 400}, -- Corrupted Gladiator's Vestment
    {N, 1963, 3592}, -- Corrupted Gladiator's Leathers
    {N, 1962, 3592}, -- Corrupted Gladiator's Leathers
    {N, 1957, 68}, -- Corrupted Gladiator's Chain
    {N, 1956, 68}, -- Corrupted Gladiator's Chain
    {N, 1951, 35}, -- Corrupted Gladiator's Plate
    {N, 1950, 35}, -- Corrupted Gladiator's Plate
    {N, 1897, 400}, -- Notorious Gladiator's Vestment
    {N, 1896, 400}, -- Notorious Gladiator's Vestment
    {N, 1892, 400}, -- Notorious Aspirant's Vestment
    {N, 1891, 3592}, -- Notorious Gladiator's Leathers
    {N, 1890, 3592}, -- Notorious Gladiator's Leathers
    {N, 1886, 3592}, -- Notorious Aspirant's Leathers
    {N, 1885, 68}, -- Notorious Gladiator's Chain
    {N, 1884, 68}, -- Notorious Gladiator's Chain
    {N, 1880, 68}, -- Notorious Aspirant's Chain
    {N, 1879, 35}, -- Notorious Gladiator's Plate
    {N, 1878, 35}, -- Notorious Gladiator's Plate
    {N, 1874, 35}, -- Notorious Aspirant's Plate
    {N, 1869, 35}, -- Notorious Aspirant's Plate
    {N, 1865, 35}, -- Notorious Gladiator's Plate
    {N, 1864, 35}, -- Notorious Gladiator's Plate
    {N, 1863, 68}, -- Notorious Aspirant's Chain
    {N, 1859, 68}, -- Notorious Gladiator's Chain
    {N, 1858, 68}, -- Notorious Gladiator's Chain
    {N, 1857, 3592}, -- Notorious Aspirant's Leathers
    {N, 1853, 3592}, -- Notorious Gladiator's Leathers
    {N, 1852, 3592}, -- Notorious Gladiator's Leathers
    {N, 1851, 400}, -- Notorious Aspirant's Vestment
    {N, 1847, 400}, -- Notorious Gladiator's Vestment
    {N, 1846, 400}, -- Notorious Gladiator's Vestment
    {N, 1845, 400}, -- Frilled Harbinger's Vestments
    {N, 1844, 3592}, -- Razorfin Regalia
    {N, 1843, 68}, -- Queen's Guard Scalemail
    {N, 1842, 35}, -- Naga Lord's Warplate
    {N, 1841, 400}, -- Frilled Harbinger's Vestments
    {N, 1840, 3592}, -- Razorfin Regalia
    {N, 1839, 68}, -- Queen's Guard Scalemail
    {N, 1838, 35}, -- Naga Lord's Warplate
    {N, 1837, 400}, -- Frilled Harbinger's Vestments
    {N, 1836, 3592}, -- Razorfin Regalia
    {N, 1835, 68}, -- Queen's Guard Scalemail
    {N, 1834, 35}, -- Naga Lord's Warplate
    {N, 1833, 400}, -- Frilled Harbinger's Vestments
    {N, 1832, 3592}, -- Razorfin Regalia
    {N, 1831, 68}, -- Queen's Guard Scalemail
    {N, 1830, 35}, -- Naga Lord's Warplate
    {N, 1821, 35}, -- Gravelord's Direplate
    {N, 1820, 35}, -- Gravelord's Direplate
    {N, 1819, 35}, -- Gravelord's Direplate
    {N, 1818, 35}, -- Gravelord's Direplate
    {N, 1817, 68}, -- Death-Devourer Vestments
    {N, 1816, 68}, -- Death-Devourer Vestments
    {N, 1815, 68}, -- Death-Devourer Vestments
    {N, 1814, 68}, -- Death-Devourer Vestments
    {N, 1813, 3592}, -- Boneblade Battlegear
    {N, 1812, 3592}, -- Boneblade Battlegear
    {N, 1811, 3592}, -- Boneblade Battlegear
    {N, 1810, 3592}, -- Boneblade Battlegear
    {N, 1809, 400}, -- Soul Reaper's Raiment
    {N, 1808, 400}, -- Soul Reaper's Raiment
    {N, 1807, 400}, -- Soul Reaper's Raiment
    {N, 1806, 400}, -- Soul Reaper's Raiment
    {N, 1802, 400}, -- Sinister Gladiator's Vestment
    {N, 1801, 400}, -- Sinister Gladiator's Vestment
    {N, 1797, 400}, -- Sinister Aspirant's Vestment
    {N, 1796, 400}, -- Moonpriest's Vestments
    {N, 1795, 3592}, -- Sinister Gladiator's Leathers
    {N, 1794, 3592}, -- Sinister Gladiator's Leathers
    {N, 1790, 3592}, -- Sinister Aspirant's Leathers
    {N, 1789, 3592}, -- Darkwood Sentinel's Guise
    {N, 1788, 68}, -- Sinister Gladiator's Chain
    {N, 1787, 68}, -- Sinister Gladiator's Chain
    {N, 1783, 68}, -- Sinister Aspirant's Chain
    {N, 1782, 68}, -- Kaldorei Archer's Chainmail
    {N, 1781, 35}, -- Sinister Gladiator's Plate
    {N, 1780, 35}, -- Sinister Gladiator's Plate
    {N, 1776, 35}, -- Sinister Aspirant's Plate
    {N, 1775, 35}, -- Wardenguard's Battleplate
    {N, 1772, 400}, -- Sinister Gladiator's Vestment
    {N, 1771, 400}, -- Sinister Gladiator's Vestment
    {N, 1767, 400}, -- Sinister Aspirant's Vestment
    {N, 1766, 400}, -- Plaguebringer's Raiment
    {N, 1765, 3592}, -- Sinister Gladiator's Leathers
    {N, 1764, 3592}, -- Sinister Gladiator's Leathers
    {N, 1760, 3592}, -- Sinister Aspirant's Leathers
    {N, 1759, 3592}, -- Deathstalker's Guise
    {N, 1758, 68}, -- Sinister Gladiator's Chain
    {N, 1757, 68}, -- Sinister Gladiator's Chain
    {N, 1753, 68}, -- Sinister Aspirant's Chain
    {N, 1752, 68}, -- Blightguard's Chains
    {N, 1751, 35}, -- Sinister Gladiator's Plate
    {N, 1750, 35}, -- Sinister Gladiator's Plate
    {N, 1746, 35}, -- Sinister Aspirant's Plate
    {N, 1745, 35}, -- Deathguard's Battleplate
    {N, 1738, 400}, -- Dread Gladiator's Vestment
    {N, 1737, 3592}, -- Dread Gladiator's Leathers
    {N, 1736, 68}, -- Dread Gladiator's Chain
    {N, 1735, 35}, -- Dread Gladiator's Plate
    {N, 1734, 400}, -- Dread Gladiator's Vestment
    {N, 1733, 3592}, -- Dread Gladiator's Leathers
    {N, 1732, 68}, -- Dread Gladiator's Chain
    {N, 1731, 35}, -- Dread Gladiator's Plate
    {N, 1677, 35}, -- Honorbound Centurion's Plate
    {N, 1676, 35}, -- Dread Aspirant's Plate
    {N, 1675, 35}, -- Dread Gladiator's Plate
    {N, 1674, 68}, -- Honorbound Vanguard's Chain
    {N, 1673, 68}, -- Dread Aspirant's Chain
    {N, 1672, 68}, -- Dread Gladiator's Chain
    {N, 1671, 3592}, -- Honorbound Outrider's Leathers
    {N, 1670, 3592}, -- Dread Aspirant's Leathers
    {N, 1669, 3592}, -- Dread Gladiator's Leathers
    {N, 1668, 400}, -- Honorbound Artificer's Vestment
    {N, 1667, 400}, -- Dread Aspirant's Vestment
    {N, 1666, 400}, -- Dread Gladiator's Vestment
    {N, 1665, 35}, -- 7th Legionnaire's Plate
    {N, 1664, 35}, -- Dread Aspirant's Plate
    {N, 1663, 35}, -- Dread Gladiator's Plate
    {N, 1662, 68}, -- 7th Legionnaire's Chain
    {N, 1661, 68}, -- Dread Aspirant's Chain
    {N, 1660, 68}, -- Dread Gladiator's Chain
    {N, 1659, 3592}, -- 7th Legionnaire's Leathers
    {N, 1658, 3592}, -- Dread Aspirant's Leathers
    {N, 1657, 3592}, -- Dread Gladiator's Leathers
    {N, 1656, 400}, -- 7th Legionnaire's Vestment
    {N, 1655, 400}, -- Dread Aspirant's Vestment
    {N, 1654, 400}, -- Dread Gladiator's Vestment
    {N, 1653, 35}, -- Eternal Curator's Protectorate
    {N, 1652, 35}, -- Eternal Curator's Protectorate
    {N, 1651, 35}, -- Eternal Curator's Protectorate
    {N, 1650, 35}, -- Eternal Curator's Protectorate
    {N, 1649, 68}, -- Eternal Curator's Chains
    {N, 1648, 68}, -- Eternal Curator's Chains
    {N, 1647, 68}, -- Eternal Curator's Chains
    {N, 1646, 68}, -- Eternal Curator's Chains
    {N, 1645, 3592}, -- Eternal Curator's Garb
    {N, 1644, 3592}, -- Eternal Curator's Garb
    {N, 1643, 3592}, -- Eternal Curator's Garb
    {N, 1642, 3592}, -- Eternal Curator's Garb
    {N, 1641, 400}, -- Eternal Curator's Vestment
    {N, 1640, 400}, -- Eternal Curator's Vestment
    {N, 1639, 400}, -- Eternal Curator's Vestment
    {N, 1638, 400}, -- Eternal Curator's Vestment
    {N, 1519, 1}, -- Juggernaut Battlegear
    {N, 1518, 1}, -- Juggernaut Battlegear
    {N, 1517, 1}, -- Juggernaut Battlegear
    {N, 1516, 1}, -- Juggernaut Battlegear
    {N, 1515, 256}, -- Grim Inquisitor's Regalia
    {N, 1514, 256}, -- Grim Inquisitor's Regalia
    {N, 1513, 256}, -- Grim Inquisitor's Regalia
    {N, 1512, 256}, -- Grim Inquisitor's Regalia
    {N, 1511, 64}, -- Garb of Venerated Spirits
    {N, 1510, 64}, -- Garb of Venerated Spirits
    {N, 1509, 64}, -- Garb of Venerated Spirits
    {N, 1508, 64}, -- Garb of Venerated Spirits
    {N, 1507, 8}, -- Regalia of the Dashing Scoundrel
    {N, 1506, 8}, -- Regalia of the Dashing Scoundrel
    {N, 1505, 8}, -- Regalia of the Dashing Scoundrel
    {N, 1504, 8}, -- Regalia of the Dashing Scoundrel
    {N, 1503, 16}, -- Gilded Seraph's Raiment
    {N, 1502, 16}, -- Gilded Seraph's Raiment
    {N, 1501, 16}, -- Gilded Seraph's Raiment
    {N, 1500, 16}, -- Gilded Seraph's Raiment
    {N, 1499, 2}, -- Light's Vanguard Battleplate
    {N, 1498, 2}, -- Light's Vanguard Battleplate
    {N, 1497, 2}, -- Light's Vanguard Battleplate
    {N, 1496, 2}, -- Light's Vanguard Battleplate
    {N, 1495, 512}, -- Chi-Ji's Battlegear
    {N, 1494, 512}, -- Chi-Ji's Battlegear
    {N, 1493, 512}, -- Chi-Ji's Battlegear
    {N, 1492, 512}, -- Chi-Ji's Battlegear
    {N, 1491, 128}, -- Runebound Regalia
    {N, 1490, 128}, -- Runebound Regalia
    {N, 1489, 128}, -- Runebound Regalia
    {N, 1488, 128}, -- Runebound Regalia
    {N, 1487, 4}, -- Serpentstalker Guise
    {N, 1486, 4}, -- Serpentstalker Guise
    {N, 1485, 4}, -- Serpentstalker Guise
    {N, 1484, 4}, -- Serpentstalker Guise
    {N, 1483, 1024}, -- Bearmantle Battlegear
    {N, 1482, 1024}, -- Bearmantle Battlegear
    {N, 1481, 1024}, -- Bearmantle Battlegear
    {N, 1480, 1024}, -- Bearmantle Battlegear
    {N, 1479, 2048}, -- Felreaper Vestments
    {N, 1478, 2048}, -- Felreaper Vestments
    {N, 1477, 2048}, -- Felreaper Vestments
    {N, 1476, 2048}, -- Felreaper Vestments
    {N, 1475, 32}, -- Dreadwake Armor
    {N, 1474, 32}, -- Dreadwake Armor
    {N, 1473, 32}, -- Dreadwake Armor
    {N, 1472, 32}, -- Dreadwake Armor
    {N, 1423, 1}, -- Fierce Gladiator's Plate Armor
    {N, 1422, 1}, -- Fierce Gladiator's Plate Armor
    {N, 1421, 256}, -- Fierce Gladiator's Felweave Armor
    {N, 1420, 256}, -- Fierce Gladiator's Felweave Armor
    {N, 1419, 64}, -- Fierce Gladiator's Ringmail Armor
    {N, 1418, 64}, -- Fierce Gladiator's Ringmail Armor
    {N, 1417, 8}, -- Fierce Gladiator's Leather Armor
    {N, 1416, 8}, -- Fierce Gladiator's Leather Armor
    {N, 1415, 16}, -- Fierce Gladiator's Satin Armor
    {N, 1414, 16}, -- Fierce Gladiator's Satin Armor
    {N, 1413, 2}, -- Fierce Gladiator's Scaled Armor
    {N, 1412, 2}, -- Fierce Gladiator's Scaled Armor
    {N, 1411, 512}, -- Fierce Gladiator's Ironskin Armor
    {N, 1410, 512}, -- Fierce Gladiator's Ironskin Armor
    {N, 1409, 128}, -- Fierce Gladiator's Silk Armor
    {N, 1408, 128}, -- Fierce Gladiator's Silk Armor
    {N, 1407, 4}, -- Fierce Gladiator's Chain Armor
    {N, 1406, 4}, -- Fierce Gladiator's Chain Armor
    {N, 1405, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {N, 1404, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {N, 1403, 2048}, -- Fierce Gladiator's Felskin Armor
    {N, 1402, 2048}, -- Fierce Gladiator's Felskin Armor
    {N, 1401, 32}, -- Fierce Gladiator's Dreadplate Armor
    {N, 1400, 32}, -- Fierce Gladiator's Dreadplate Armor
    {N, 1399, 1}, -- Fierce Gladiator's Plate Armor
    {N, 1398, 1}, -- Fierce Gladiator's Plate Armor
    {N, 1397, 256}, -- Fierce Gladiator's Felweave Armor
    {N, 1396, 256}, -- Fierce Gladiator's Felweave Armor
    {N, 1395, 64}, -- Fierce Gladiator's Ringmail Armor
    {N, 1394, 64}, -- Fierce Gladiator's Ringmail Armor
    {N, 1393, 8}, -- Fierce Gladiator's Leather Armor
    {N, 1392, 8}, -- Fierce Gladiator's Leather Armor
    {N, 1391, 16}, -- Fierce Gladiator's Satin Armor
    {N, 1390, 16}, -- Fierce Gladiator's Satin Armor
    {N, 1389, 2}, -- Fierce Gladiator's Scaled Armor
    {N, 1388, 2}, -- Fierce Gladiator's Scaled Armor
    {N, 1387, 512}, -- Fierce Gladiator's Ironskin Armor
    {N, 1386, 512}, -- Fierce Gladiator's Ironskin Armor
    {N, 1385, 128}, -- Fierce Gladiator's Silk Armor
    {N, 1384, 128}, -- Fierce Gladiator's Silk Armor
    {N, 1383, 4}, -- Fierce Gladiator's Chain Armor
    {N, 1382, 4}, -- Fierce Gladiator's Chain Armor
    {N, 1381, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {N, 1380, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {N, 1379, 1}, -- Fierce Combatant's Plate Armor
    {N, 1378, 1}, -- Fierce Combatant's Plate Armor
    {N, 1377, 256}, -- Fierce Combatant's Felweave Armor
    {N, 1376, 256}, -- Fierce Combatant's Felweave Armor
    {N, 1375, 64}, -- Fierce Combatant's Ringmail Armor
    {N, 1374, 64}, -- Fierce Combatant's Ringmail Armor
    {N, 1373, 8}, -- Fierce Combatant's Leather Armor
    {N, 1372, 8}, -- Fierce Combatant's Leather Armor
    {N, 1371, 16}, -- Fierce Combatant's Satin Armor
    {N, 1370, 16}, -- Fierce Combatant's Satin Armor
    {N, 1369, 2}, -- Fierce Combatant's Scaled Armor
    {N, 1368, 2}, -- Fierce Combatant's Scaled Armor
    {N, 1367, 512}, -- Fierce Combatant's Ironskin Armor
    {N, 1366, 512}, -- Fierce Combatant's Ironskin Armor
    {N, 1365, 128}, -- Fierce Combatant's Silk Armor
    {N, 1364, 128}, -- Fierce Combatant's Silk Armor
    {N, 1363, 4}, -- Fierce Combatant's Chain Armor
    {N, 1362, 4}, -- Fierce Combatant's Chain Armor
    {N, 1361, 1024}, -- Fierce Combatant's Dragonhide Armor
    {N, 1360, 1024}, -- Fierce Combatant's Dragonhide Armor
    {N, 1359, 2048}, -- Fierce Gladiator's Felskin Armor
    {N, 1358, 2048}, -- Fierce Gladiator's Felskin Armor
    {N, 1355, 2048}, -- Fierce Combatant's Felskin Armor
    {N, 1354, 2048}, -- Fierce Combatant's Felskin Armor
    {N, 1353, 32}, -- Fierce Gladiator's Dreadplate Armor
    {N, 1352, 32}, -- Fierce Gladiator's Dreadplate Armor
    {N, 1349, 32}, -- Fierce Combatant's Dreadplate Armor
    {N, 1348, 32}, -- Fierce Combatant's Dreadplate Armor
    {N, 1343, 16}, -- Warmongering Gladiator's Satin Armor Boogaloo
    {N, 1342, 16}, -- Vestments of Blind Absolution
    {N, 1340, 32}, -- Gravewarden Armaments
    {N, 1339, 32}, -- Gravewarden Armaments
    {N, 1338, 32}, -- Gravewarden Armaments
    {N, 1337, 32}, -- Gravewarden Armaments
    {N, 1336, 2048}, -- Demonbane Armor
    {N, 1335, 2048}, -- Demonbane Armor
    {N, 1334, 2048}, -- Demonbane Armor
    {N, 1333, 2048}, -- Demonbane Armor
    {N, 1332, 1024}, -- Stormheart Raiment
    {N, 1331, 1024}, -- Stormheart Raiment
    {N, 1330, 1024}, -- Stormheart Raiment
    {N, 1329, 1024}, -- Stormheart Raiment
    {N, 1328, 4}, -- Wildstalker Armor
    {N, 1327, 4}, -- Wildstalker Armor
    {N, 1326, 4}, -- Wildstalker Armor
    {N, 1325, 4}, -- Wildstalker Armor
    {N, 1324, 128}, -- Regalia of the Arcane Tempest
    {N, 1323, 128}, -- Regalia of the Arcane Tempest
    {N, 1322, 128}, -- Regalia of the Arcane Tempest
    {N, 1321, 128}, -- Regalia of the Arcane Tempest
    {N, 1320, 512}, -- Xuen's Battlegear
    {N, 1319, 512}, -- Xuen's Battlegear
    {N, 1318, 512}, -- Xuen's Battlegear
    {N, 1317, 512}, -- Xuen's Battlegear
    {N, 1316, 2}, -- Radiant Lightbringer Armor
    {N, 1315, 2}, -- Radiant Lightbringer Armor
    {N, 1314, 2}, -- Radiant Lightbringer Armor
    {N, 1313, 2}, -- Radiant Lightbringer Armor
    {N, 1312, 16}, -- Vestments of Blind Absolution
    {N, 1310, 16}, -- Vestments of Blind Absolution
    {N, 1309, 16}, -- Vestments of Blind Absolution
    {N, 1308, 8}, -- Fanged Slayer's Armor
    {N, 1307, 8}, -- Fanged Slayer's Armor
    {N, 1306, 8}, -- Fanged Slayer's Armor
    {N, 1305, 8}, -- Fanged Slayer's Armor
    {N, 1304, 64}, -- Regalia of the Skybreaker
    {N, 1303, 64}, -- Regalia of the Skybreaker
    {N, 1302, 64}, -- Regalia of the Skybreaker
    {N, 1301, 64}, -- Regalia of the Skybreaker
    {N, 1300, 256}, -- Diabolic Raiment
    {N, 1299, 256}, -- Diabolic Raiment
    {N, 1298, 256}, -- Diabolic Raiment
    {N, 1297, 256}, -- Diabolic Raiment
    {N, 1296, 1}, -- Titanic Onslaught Armor
    {N, 1295, 1}, -- Titanic Onslaught Armor
    {N, 1294, 1}, -- Titanic Onslaught Armor
    {N, 1293, 1}, -- Titanic Onslaught Armor
    {N, 1292, 32}, -- Cruel Combatant's Dreadplate Armor
    {N, 1291, 32}, -- Cruel Combatant's Dreadplate Armor
    {N, 1290, 2048}, -- Cruel Combatant's Felskin Armor
    {N, 1289, 2048}, -- Cruel Combatant's Felskin Armor
    {N, 1288, 1024}, -- Cruel Combatant's Dragonhide Armor
    {N, 1287, 1024}, -- Cruel Combatant's Dragonhide Armor
    {N, 1286, 4}, -- Cruel Combatant's Chain Armor
    {N, 1285, 4}, -- Cruel Combatant's Chain Armor
    {N, 1284, 128}, -- Cruel Combatant's Silk Armor
    {N, 1283, 128}, -- Cruel Combatant's Silk Armor
    {N, 1282, 512}, -- Cruel Combatant's Ironskin Armor
    {N, 1281, 512}, -- Cruel Combatant's Ironskin Armor
    {N, 1280, 2}, -- Cruel Combatant's Scaled Armor
    {N, 1279, 2}, -- Cruel Combatant's Scaled Armor
    {N, 1278, 16}, -- Cruel Combatant's Satin Armor
    {N, 1277, 16}, -- Cruel Combatant's Satin Armor
    {N, 1276, 8}, -- Cruel Combatant's Leather Armor
    {N, 1275, 8}, -- Cruel Combatant's Leather Armor
    {N, 1274, 64}, -- Cruel Combatant's Ringmail Armor
    {N, 1273, 64}, -- Cruel Combatant's Ringmail Armor
    {N, 1272, 256}, -- Cruel Combatant's Felweave Armor
    {N, 1271, 256}, -- Cruel Combatant's Felweave Armor
    {N, 1270, 1}, -- Cruel Combatant's Plate Armor
    {N, 1269, 1}, -- Cruel Combatant's Plate Armor
    {N, 1268, 32}, -- Cruel Gladiator's Dreadplate Armor
    {N, 1267, 32}, -- Cruel Gladiator's Dreadplate Armor
    {N, 1266, 32}, -- Cruel Gladiator's Dreadplate Armor
    {N, 1265, 32}, -- Cruel Gladiator's Dreadplate Armor
    {N, 1264, 2048}, -- Cruel Gladiator's Felskin Armor
    {N, 1263, 2048}, -- Cruel Gladiator's Felskin Armor
    {N, 1262, 2048}, -- Cruel Gladiator's Felskin Armor
    {N, 1261, 2048}, -- Cruel Gladiator's Felskin Armor
    {N, 1260, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {N, 1259, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {N, 1258, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {N, 1257, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {N, 1256, 4}, -- Cruel Gladiator's Chain Armor
    {N, 1255, 4}, -- Cruel Gladiator's Chain Armor
    {N, 1254, 4}, -- Cruel Gladiator's Chain Armor
    {N, 1253, 4}, -- Cruel Gladiator's Chain Armor
    {N, 1252, 128}, -- Cruel Gladiator's Silk Armor
    {N, 1251, 128}, -- Cruel Gladiator's Silk Armor
    {N, 1250, 128}, -- Cruel Gladiator's Silk Armor
    {N, 1249, 128}, -- Cruel Gladiator's Silk Armor
    {N, 1248, 512}, -- Cruel Gladiator's Ironskin Armor
    {N, 1247, 512}, -- Cruel Gladiator's Ironskin Armor
    {N, 1246, 512}, -- Cruel Gladiator's Ironskin Armor
    {N, 1245, 512}, -- Cruel Gladiator's Ironskin Armor
    {N, 1244, 2}, -- Cruel Gladiator's Scaled Armor
    {N, 1243, 2}, -- Cruel Gladiator's Scaled Armor
    {N, 1242, 2}, -- Cruel Gladiator's Scaled Armor
    {N, 1241, 2}, -- Cruel Gladiator's Scaled Armor
    {N, 1240, 8}, -- Cruel Gladiator's Leather Armor
    {N, 1239, 8}, -- Cruel Gladiator's Leather Armor
    {N, 1238, 8}, -- Cruel Gladiator's Leather Armor
    {N, 1237, 8}, -- Cruel Gladiator's Leather Armor
    {N, 1236, 64}, -- Cruel Gladiator's Ringmail Armor
    {N, 1235, 64}, -- Cruel Gladiator's Ringmail Armor
    {N, 1234, 64}, -- Cruel Gladiator's Ringmail Armor
    {N, 1233, 64}, -- Cruel Gladiator's Ringmail Armor
    {N, 1232, 256}, -- Cruel Gladiator's Felweave Armor
    {N, 1231, 256}, -- Cruel Gladiator's Felweave Armor
    {N, 1230, 256}, -- Cruel Gladiator's Felweave Armor
    {N, 1229, 256}, -- Cruel Gladiator's Felweave Armor
    {N, 1228, 1}, -- Cruel Gladiator's Plate Armor
    {N, 1227, 1}, -- Cruel Gladiator's Plate Armor
    {N, 1226, 1}, -- Cruel Gladiator's Plate Armor
    {N, 1225, 1}, -- Cruel Gladiator's Plate Armor
    {N, 1223, 1}, -- Warmongering Gladiator's Plate Armor
    {N, 1222, 1}, -- Warmongering Gladiator's Plate Armor
    {N, 1221, 256}, -- Warmongering Gladiator's Felweave Armor
    {N, 1220, 256}, -- Warmongering Gladiator's Felweave Armor
    {N, 1219, 64}, -- Warmongering Gladiator's Ringmail Armor
    {N, 1218, 64}, -- Warmongering Gladiator's Ringmail Armor
    {N, 1217, 8}, -- Warmongering Gladiator's Leather Armor
    {N, 1216, 8}, -- Warmongering Gladiator's Leather Armor
    {N, 1215, 2}, -- Warmongering Gladiator's Scaled Armor
    {N, 1214, 2}, -- Warmongering Gladiator's Scaled Armor
    {N, 1213, 512}, -- Warmongering Gladiator's Ironskin Armor
    {N, 1212, 512}, -- Warmongering Gladiator's Ironskin Armor
    {N, 1211, 128}, -- Warmongering Gladiator's Silk Armor
    {N, 1210, 128}, -- Warmongering Gladiator's Silk Armor
    {N, 1209, 4}, -- Warmongering Gladiator's Chain Armor
    {N, 1208, 4}, -- Warmongering Gladiator's Chain Armor
    {N, 1207, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {N, 1206, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {N, 1205, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {N, 1204, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {N, 1202, 32}, -- Brutal Gladiator's Dreadplate Armor
    {N, 1201, 32}, -- Bloodthirsty Gladiator's Dreadplate Armor
    {N, 1200, 1024}, -- Bloodthirsty Gladiator's Dragonhide Armor
    {N, 1199, 4}, -- Bloodthirsty Gladiator's Chain Armor
    {N, 1198, 128}, -- Bloodthirsty Gladiator's Silk Armor
    {N, 1197, 2}, -- Bloodthirsty Gladiator's Scaled Armor
    {N, 1196, 8}, -- Bloodthirsty Gladiator's Leather Armor
    {N, 1195, 64}, -- Bloodthirsty Gladiator's Ringmail Armor
    {N, 1194, 256}, -- Bloodthirsty Gladiator's Felweave Armor
    {N, 1193, 1}, -- Bloodthirsty Gladiator's Plate Armor
    {N, 1192, 1}, -- Wild Gladiator's Plate Armor
    {N, 1191, 1}, -- Wild Gladiator's Plate Armor
    {N, 1190, 256}, -- Wild Gladiator's Felweave Armor
    {N, 1189, 256}, -- Wild Gladiator's Felweave Armor
    {N, 1188, 64}, -- Wild Gladiator's Ringmail Armor
    {N, 1187, 64}, -- Wild Gladiator's Ringmail Armor
    {N, 1186, 8}, -- Wild Gladiator's Leather Armor
    {N, 1185, 8}, -- Wild Gladiator's Leather Armor
    {N, 1184, 2}, -- Wild Gladiator's Scaled Paladin
    {N, 1183, 2}, -- Wild Gladiator's Scaled Paladin
    {N, 1182, 512}, -- Wild Gladiator's Ironskin Armor
    {N, 1181, 512}, -- Wild Gladiator's Ironskin Armor
    {N, 1180, 128}, -- Wild Gladiator's Silk Armor
    {N, 1179, 128}, -- Wild Gladiator's Silk Armor
    {N, 1178, 4}, -- Wild Gladiator's Chain Armor
    {N, 1177, 4}, -- Wild Gladiator's Chain Armor
    {N, 1176, 1024}, -- Wild Gladiator's Dragonhide Armor
    {N, 1175, 1024}, -- Wild Gladiator's Dragonhide Armor
    {N, 1174, 32}, -- Wild Gladiator's Dreadplate Armor
    {N, 1173, 32}, -- Wild Gladiator's Dreadplate Armor
    {N, 1172, 512}, -- Vindictive Combatant's Ironskin Armor
    {N, 1171, 1024}, -- Vindictive Combatant's Dragonhide Armor
    {N, 1170, 2048}, -- Vindictive Combatant's Felskin Armor
    {N, 1169, 512}, -- Vindictive Combatant's Ironskin Armor
    {N, 1168, 1024}, -- Vindictive Combatant's Dragonhide Armor
    {N, 1167, 2048}, -- Vindictive Combatant's Felskin Armor
    {N, 1166, 2}, -- Vindictive Combatant's Scaled Armor
    {N, 1165, 32}, -- Vindictive Combatant's Dreadplate Armor
    {N, 1164, 2}, -- Vindictive Combatant's Scaled Armor
    {N, 1163, 32}, -- Vindictive Combatant's Dreadplate Armor
    {N, 1162, 64}, -- Vindictive Combatant's Ringmail Armor
    {N, 1161, 64}, -- Vindictive Combatant's Ringmail Armor
    {N, 1160, 256}, -- Vindictive Combatant's Felweave Armor
    {N, 1159, 128}, -- Vindictive Combatant's Silk Armor
    {N, 1158, 256}, -- Vindictive Combatant's Felweave Armor
    {N, 1157, 1}, -- Primal Gladiator's Plate Armor
    {N, 1156, 1}, -- Primal Gladiator's Plate Armor
    {N, 1155, 256}, -- Primal Gladiator's Felweave Armor
    {N, 1154, 256}, -- Primal Gladiator's Felweave Armor
    {N, 1153, 64}, -- Primal Gladiator's Ringmail Armor
    {N, 1152, 64}, -- Primal Gladiator's Ringmail Armor
    {N, 1151, 8}, -- Primal Gladiator's Leather Armor
    {N, 1150, 8}, -- Primal Gladiator's Leather Armor
    {N, 1149, 2}, -- Primal Gladiator's Scaled Armor
    {N, 1148, 2}, -- Primal Gladiator's Scaled Armor
    {N, 1147, 512}, -- Primal Gladiator's Ironskin Armor
    {N, 1146, 512}, -- Primal Gladiator's Ironskin Armor
    {N, 1145, 128}, -- Primal Gladiator's Silk Armor
    {N, 1144, 128}, -- Primal Gladiator's Silk Armor
    {N, 1143, 4}, -- Primal Gladiator's Chain Armor
    {N, 1142, 4}, -- Primal Gladiator's Chain Armor
    {N, 1141, 1024}, -- Primal Gladiator's Dragonhide Armor
    {N, 1140, 1024}, -- Primal Gladiator's Dragonhide Armor
    {N, 1139, 32}, -- Primal Gladiator's Dreadplate Armor
    {N, 1138, 32}, -- Primal Gladiator's Dreadplate Armor
    {N, 1137, 128}, -- Vindictive Combatant's Silk Armor
    {N, 1136, 1}, -- Vindictive Gladiator's Plate Armor
    {N, 1135, 1}, -- Vindictive Gladiator's Plate Armor
    {N, 1134, 1}, -- Vindictive Gladiator's Plate Armor
    {N, 1133, 1}, -- Vindictive Gladiator's Plate Armor
    {N, 1132, 64}, -- Vindictive Gladiator's Ringmail Armor
    {N, 1131, 64}, -- Vindictive Gladiator's Ringmail Armor
    {N, 1130, 64}, -- Vindictive Gladiator's Ringmail Armor
    {N, 1129, 64}, -- Vindictive Gladiator's Ringmail Armor
    {N, 1128, 8}, -- Vindictive Gladiator's Leather Armor
    {N, 1127, 8}, -- Vindictive Gladiator's Leather Armor
    {N, 1126, 8}, -- Vindictive Gladiator's Leather Armor
    {N, 1125, 8}, -- Vindictive Gladiator's Leather Armor
    {N, 1124, 2}, -- Vindictive Gladiator's Scaled Armor
    {N, 1123, 2}, -- Vindictive Gladiator's Scaled Armor
    {N, 1122, 2}, -- Vindictive Gladiator's Scaled Armor
    {N, 1121, 2}, -- Vindictive Gladiator's Scaled Armor
    {N, 1120, 512}, -- Vindictive Gladiator's Ironskin Armor
    {N, 1119, 512}, -- Vindictive Gladiator's Ironskin Armor
    {N, 1118, 512}, -- Vindictive Gladiator's Ironskin Armor
    {N, 1117, 512}, -- Vindictive Gladiator's Ironskin Armor
    {N, 1116, 4}, -- Vindictive Gladiator's Chain Armor
    {N, 1115, 4}, -- Vindictive Gladiator's Chain Armor
    {N, 1114, 4}, -- Vindictive Gladiator's Chain Armor
    {N, 1113, 4}, -- Vindictive Gladiator's Chain Armor
    {N, 1112, 2048}, -- Vindictive Gladiator's Felskin Armor
    {N, 1111, 2048}, -- Vindictive Gladiator's Felskin Armor
    {N, 1110, 2048}, -- Vindictive Gladiator's Felskin Armor
    {N, 1109, 2048}, -- Vindictive Gladiator's Felskin Armor
    {N, 1108, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {N, 1107, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {N, 1106, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {N, 1105, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {N, 1104, 256}, -- Vindictive Gladiator's Felweave Armor
    {N, 1103, 256}, -- Vindictive Gladiator's Felweave Armor
    {N, 1102, 256}, -- Vindictive Gladiator's Felweave Armor
    {N, 1101, 256}, -- Vindictive Gladiator's Felweave Armor
    {N, 1100, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {N, 1099, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {N, 1098, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {N, 1097, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {N, 1096, 128}, -- Vindictive Gladiator's Silk Armor
    {N, 1095, 128}, -- Vindictive Gladiator's Silk Armor
    {N, 1094, 128}, -- Vindictive Gladiator's Silk Armor
    {N, 1093, 128}, -- Vindictive Gladiator's Silk Armor
    {N, 1092, 1}, -- Prideful Gladiator's Plate Armor
    {N, 1091, 1}, -- Prideful Gladiator's Plate Armor
    {N, 1090, 256}, -- Prideful Gladiator's Felweave Armor
    {N, 1089, 256}, -- Prideful Gladiator's Felweave Armor
    {N, 1088, 64}, -- Prideful Gladiator's Ringmail Armor
    {N, 1087, 64}, -- Prideful Gladiator's Ringmail Armor
    {N, 1086, 8}, -- Prideful Gladiator's Leather Armor
    {N, 1085, 8}, -- Prideful Gladiator's Leather Armor
    {N, 1084, 2}, -- Prideful Gladiator's Scaled Armor
    {N, 1083, 2}, -- Prideful Gladiator's Scaled Armor
    {N, 1082, 512}, -- Prideful Gladiator's Ironskin Armor
    {N, 1081, 512}, -- Prideful Gladiator's Ironskin Armor
    {N, 1080, 128}, -- Prideful Gladiator's Silk Armor
    {N, 1079, 128}, -- Prideful Gladiator's Silk Armor
    {N, 1078, 4}, -- Prideful Gladiator's Chain Armor
    {N, 1077, 4}, -- Prideful Gladiator's Chain Armor
    {N, 1076, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {N, 1075, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {N, 1074, 32}, -- Prideful Gladiator's Dreadplate Armor
    {N, 1073, 32}, -- Prideful Gladiator's Dreadplate Armor
    {N, 1072, 16}, -- Vindictive Combatant's Satin Armor
    {N, 1071, 16}, -- Vindictive Combatant's Satin Armor
    {N, 1070, 1}, -- Vindictive Combatant's Plate Armor
    {N, 1069, 1}, -- Vindictive Combatant's Plate Armor
    {N, 1068, 8}, -- Vindictive Combatant's Leather Armor
    {N, 1067, 8}, -- Vindictive Combatant's Leather Armor
    {N, 1064, 1}, -- Malevolent Gladiator's Plate Armor
    {N, 1063, 256}, -- Malevolent Gladiator's Felweave Armor
    {N, 1062, 64}, -- Malevolent Gladiator's Ringmail Armor
    {N, 1061, 8}, -- Malevolent Gladiator's Leather Armor
    {N, 1060, 2}, -- Malevolent Gladiator's Scaled Armor
    {N, 1059, 512}, -- Malevolent Gladiator's Ironskin Armor
    {N, 1057, 128}, -- Malevolent Gladiator's Silk Armor
    {N, 1056, 4}, -- Malevolent Gladiator's Chain Armor
    {N, 1055, 1024}, -- Malevolent Gladiator's Dragonhide Armor
    {N, 1054, 32}, -- Malevolent Gladiator's Dreadplate Armor
    {N, 1049, 1}, -- Grievous Gladiator's Plate Armor
    {N, 1048, 1}, -- Grievous Gladiator's Plate Armor
    {N, 1047, 256}, -- Grievous Gladiator's Felweave Armor
    {N, 1046, 256}, -- Grievous Gladiator's Felweave Armor
    {N, 1045, 64}, -- Grievous Gladiator's Ringmail Armor
    {N, 1044, 64}, -- Grievous Gladiator's Ringmail Armor
    {N, 1043, 8}, -- Grievous Gladiator's Leather Armor
    {N, 1042, 8}, -- Grievous Gladiator's Leather Armor
    {N, 1041, 2}, -- Grievous Gladiator's Scaled Armor
    {N, 1040, 2}, -- Grievous Gladiator's Scaled Armor
    {N, 1039, 512}, -- Grievous Gladiator's Ironskin Armor
    {N, 1038, 512}, -- Grievous Gladiator's Ironskin Armor
    {N, 1037, 128}, -- Grievous Gladiator's Silk Armor
    {N, 1036, 128}, -- Grievous Gladiator's Silk Armor
    {N, 1035, 4}, -- Grievous Gladiator's Chain Armor
    {N, 1034, 4}, -- Grievous Gladiator's Chain Armor
    {N, 1033, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {N, 1032, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {N, 1031, 32}, -- Grievous Gladiator's Dreadplate Armor
    {N, 1030, 32}, -- Grievous Gladiator's Dreadplate Armor
    {N, 1029, 1}, -- Tyrannical Gladiator's Plate Armor
    {N, 1028, 1}, -- Tyrannical Gladiator's Plate Armor
    {N, 1027, 256}, -- Tyrannical Gladiator's Felweave Armor
    {N, 1026, 256}, -- Tyrannical Gladiator's Felweave Armor
    {N, 1025, 64}, -- Tyrannical Gladiator's Ringmail Armor
    {N, 1024, 64}, -- Tyrannical Gladiator's Ringmail Armor
    {N, 1023, 8}, -- Tyrannical Gladiator's Leather Armor
    {N, 1022, 8}, -- Tyrannical Gladiator's Leather Armor
    {N, 1021, 2}, -- Tyrannical Gladiator's Scaled Armor
    {N, 1020, 2}, -- Tyrannical Gladiator's Scaled Armor
    {N, 1019, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {N, 1018, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {N, 1017, 128}, -- Tyrannical Gladiator's Silk Armor
    {N, 1016, 128}, -- Tyrannical Gladiator's Silk Armor
    {N, 1015, 4}, -- Tyrannical Gladiator's Chain Armor
    {N, 1014, 4}, -- Tyrannical Gladiator's Chain Armor
    {N, 1013, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {N, 1012, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {N, 1011, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {N, 1010, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {N, 1005, 32}, -- Dreadwyrm Battleplate
    {N, 1004, 32}, -- Dreadwyrm Battleplate
    {N, 1003, 32}, -- Dreadwyrm Battleplate
    {N, 1002, 32}, -- Dreadwyrm Battleplate
    {N, 1001, 2048}, -- Vestment of Second Sight
    {N, 1000, 2048}, -- Vestment of Second Sight
    {N, 999, 2048}, -- Vestment of Second Sight
    {N, 998, 2048}, -- Vestment of Second Sight
    {N, 997, 1024}, -- Garb of the Astral Warden
    {N, 996, 1024}, -- Garb of the Astral Warden
    {N, 995, 1024}, -- Garb of the Astral Warden
    {N, 994, 1024}, -- Garb of the Astral Warden
    {N, 993, 4}, -- Eagletalon Battlegear
    {N, 992, 4}, -- Eagletalon Battlegear
    {N, 991, 4}, -- Eagletalon Battlegear
    {N, 990, 4}, -- Eagletalon Battlegear
    {N, 989, 128}, -- Regalia of Everburning Knowledge
    {N, 988, 128}, -- Regalia of Everburning Knowledge
    {N, 987, 128}, -- Regalia of Everburning Knowledge
    {N, 986, 128}, -- Regalia of Everburning Knowledge
    {N, 985, 512}, -- Vestments of Enveloped Dissonance
    {N, 984, 512}, -- Vestments of Enveloped Dissonance
    {N, 983, 512}, -- Vestments of Enveloped Dissonance
    {N, 982, 512}, -- Vestments of Enveloped Dissonance
    {N, 981, 2}, -- Battleplate of the Highlord
    {N, 980, 2}, -- Battleplate of the Highlord
    {N, 979, 2}, -- Battleplate of the Highlord
    {N, 978, 2}, -- Battleplate of the Highlord
    {N, 977, 1024}, -- Gladiator's Dragonhide Armor
    {N, 976, 4}, -- Gladiator's Chain Armor
    {N, 975, 128}, -- Gladiator's Silk Armor
    {N, 974, 2}, -- Gladiator's Scaled Armor
    {N, 973, 16}, -- Gladiator's Satin Armor
    {N, 972, 8}, -- Gladiator's Leather Armor
    {N, 971, 64}, -- Gladiator's Ringmail Armor
    {N, 970, 256}, -- Gladiator's Felweave Armor
    {N, 969, 1024}, -- Merciless Gladiator's Dragonhide Armor
    {N, 968, 4}, -- Merciless Gladiator's Chain Armor
    {N, 967, 128}, -- Merciless Gladiator's Silk Armor
    {N, 966, 2}, -- Merciless Gladiator's Scaled Armor
    {N, 965, 8}, -- Merciless Gladiator's Leather Armor
    {N, 964, 64}, -- Merciless Gladiator's Ringmail Armor
    {N, 963, 256}, -- Merciless Gladiator's Felweave Armor
    {N, 962, 1}, -- Merciless Gladiator's Plate Armor
    {N, 961, 1024}, -- Vengeful Gladiator's Dragonhide Armor
    {N, 960, 4}, -- Vengeful Gladiator's Chain Armor
    {N, 959, 128}, -- Vengeful Gladiator's Silk Armor
    {N, 958, 2}, -- Vengeful Gladiator's Scaled Armor
    {N, 957, 8}, -- Vengeful Gladiator's Leather Armor
    {N, 956, 64}, -- Vengeful Gladiator's Ringmail Armor
    {N, 955, 256}, -- Vengeful Gladiator's Felweave Armor
    {N, 954, 1}, -- Vengeful Gladiator's Plate Armor
    {N, 953, 1024}, -- Brutal Gladiator's Dragonhide Armor
    {N, 952, 4}, -- Brutal Gladiator's Chain Armor
    {N, 951, 128}, -- Brutal Gladiator's Silk Armor
    {N, 950, 2}, -- Brutal Gladiator's Scaled Armor
    {N, 949, 8}, -- Brutal Gladiator's Leather Armor
    {N, 948, 64}, -- Brutal Gladiator's Ringmail Armor
    {N, 947, 256}, -- Brutal Gladiator's Felweave Armor
    {N, 946, 1}, -- Brutal Gladiator's Plate Armor
    {N, 945, 8}, -- Doomblade Battlegear
    {N, 944, 8}, -- Doomblade Battlegear
    {N, 943, 8}, -- Doomblade Battlegear
    {N, 942, 8}, -- Doomblade Battlegear
    {N, 941, 256}, -- Legacy of Azj'aqir
    {N, 940, 1}, -- Warplate of the Obsidian Aspect
    {N, 939, 1}, -- Warplate of the Obsidian Aspect
    {N, 938, 1}, -- Warplate of the Obsidian Aspect
    {N, 937, 1}, -- Warplate of the Obsidian Aspect
    {N, 936, 64}, -- Regalia of Shackled Elements
    {N, 935, 64}, -- Regalia of Shackled Elements
    {N, 934, 64}, -- Regalia of Shackled Elements
    {N, 933, 64}, -- Regalia of Shackled Elements
    {N, 932, 256}, -- Malefic Regalia
    {N, 931, 1}, -- Onslaught Battlegear
    {N, 928, 1024}, -- Cenarion Raiment
    {N, 927, 1024}, -- Stormrage Raiment
    {N, 926, 1024}, -- Genesis Raiment
    {N, 924, 1024}, -- Dreamwalker Raiment
    {N, 922, 1024}, -- Malorne Raiment
    {N, 921, 1024}, -- Nordrassil Raiment
    {N, 920, 1024}, -- Thunderheart Raiment
    {N, 919, 1024}, -- Thunderheart Regalia
    {N, 918, 4}, -- Rift Stalker Armor
    {N, 917, 4}, -- Giantstalker Armor
    {N, 916, 4}, -- Dragonstalker Armor
    {N, 915, 4}, -- Striker's Garb
    {N, 914, 4}, -- Cryptstalker Armor
    {N, 913, 4}, -- Demon Stalker Armor
    {N, 912, 4}, -- Gronnstalker's Armor
    {N, 911, 4}, -- Gronnstalker's Battlegear
    {N, 910, 128}, -- Arcanist Regalia
    {N, 909, 128}, -- Netherwind Regalia
    {N, 908, 128}, -- Enigma Vestments
    {N, 907, 128}, -- Frostfire Regalia
    {N, 906, 2}, -- Justicar Armor
    {N, 905, 128}, -- Tirisfal Regalia
    {N, 904, 128}, -- Tempest Regalia
    {N, 903, 128}, -- Tempest Garb
    {N, 902, 2}, -- Lawbringer Armor
    {N, 901, 2}, -- Judgment Armor
    {N, 900, 2}, -- Avenger's Battlegear
    {N, 899, 2}, -- Redemption Armor
    {N, 898, 128}, -- Aldor Regalia
    {N, 897, 2}, -- Crystalforge Armor
    {N, 896, 2}, -- Lightbringer Armor
    {N, 895, 2}, -- Lightbringer Battlegear
    {N, 894, 8}, -- Nightslayer Armor
    {N, 893, 8}, -- Bloodfang Armor
    {N, 892, 8}, -- Deathdealer's Embrace
    {N, 891, 8}, -- Bonescythe Armor
    {N, 890, 8}, -- Netherblade
    {N, 889, 8}, -- Deathmantle
    {N, 888, 8}, -- Slayer's Armor
    {N, 887, 8}, -- Slayer's Battlegear
    {N, 876, 64}, -- The Earthfury
    {N, 875, 64}, -- The Ten Storms
    {N, 874, 64}, -- Stormcaller's Garb
    {N, 873, 64}, -- The Earthshatterer
    {N, 872, 64}, -- Cyclone Regalia
    {N, 871, 64}, -- Cataclysm Regalia
    {N, 870, 64}, -- Skyshatter Regalia
    {N, 869, 64}, -- Skyshatter Raiment
    {N, 868, 256}, -- Felheart Raiment
    {N, 867, 256}, -- Nemesis Raiment
    {N, 866, 256}, -- Doomcaller's Attire
    {N, 865, 256}, -- Plagueheart Raiment
    {N, 864, 256}, -- Voidheart Raiment
    {N, 863, 256}, -- Corruptor Raiment
    {N, 862, 256}, -- Malefic Raiment
    {N, 853, 1}, -- Battlegear of Might
    {N, 852, 1}, -- Battlegear of Wrath
    {N, 851, 1}, -- Conqueror's Battlegear
    {N, 850, 1}, -- Dreadnaught's Battlegear
    {N, 849, 1}, -- Warbringer Armor
    {N, 848, 1}, -- Destroyer Armor
    {N, 847, 1}, -- Onslaught Armor
    {N, 846, 32}, -- Valorous Scourgeborne Plate
    {N, 845, 32}, -- Heroes' Scourgeborne Plate
    {N, 844, 32}, -- Conqueror's Darkruned Plate
    {N, 843, 32}, -- Valorous Darkruned Plate
    {N, 842, 32}, -- Thassarian's Battlegear
    {N, 841, 32}, -- Koltira's Battlegear
    {N, 840, 32}, -- Sanctified Scourgelord's Plate
    {N, 839, 32}, -- Sanctified Scourgelord's Plate
    {N, 838, 32}, -- Scourgelord's Plate
    {N, 837, 32}, -- Magma Plated Battlearmor
    {N, 836, 32}, -- Magma Plated Battlearmor
    {N, 835, 32}, -- Elementium Deathplate Battlearmor
    {N, 834, 32}, -- Elementium Deathplate Battlearmor
    {N, 833, 32}, -- Necrotic Boneplate Armor
    {N, 832, 32}, -- Necrotic Boneplate Armor
    {N, 831, 32}, -- Necrotic Boneplate Armor
    {N, 830, 1024}, -- Valorous Dreamwalker Battlegear
    {N, 829, 1024}, -- Heroes' Dreamwalker Battlegear
    {N, 828, 1024}, -- Conqueror's Nightsong Battlegear
    {N, 827, 1024}, -- Valorous Nightsong Battlegear
    {N, 826, 1024}, -- Runetotem's Battlegear
    {N, 825, 1024}, -- Malfurion's Battlegear
    {N, 824, 1024}, -- Sanctified Lasherweave Battlegear
    {N, 823, 1024}, -- Sanctified Lasherweave Battlegear
    {N, 822, 1024}, -- Lasherweave Battlegear
    {N, 821, 1024}, -- Stormrider's Vestments
    {N, 820, 1024}, -- Stormrider's Vestments
    {N, 819, 1024}, -- Obsidian Arborweave Vestments
    {N, 818, 1024}, -- Obsidian Arborweave Vestments
    {N, 817, 1024}, -- Deep Earth Vestments
    {N, 816, 1024}, -- Deep Earth Vestments
    {N, 815, 1024}, -- Deep Earth Vestments
    {N, 814, 32}, -- Savage Gladiator's Dreadplate Armor
    {N, 813, 1024}, -- Savage Gladiator's Dragonhide Armor
    {N, 812, 4}, -- Savage Gladiator's Chain Armor
    {N, 811, 128}, -- Savage Gladiator's Silk Armor
    {N, 810, 2}, -- Savage Gladiator's Scaled Armor
    {N, 809, 8}, -- Savage Gladiator's Leather Armor
    {N, 808, 64}, -- Savage Gladiator's Ringmail Armor
    {N, 807, 256}, -- Savage Gladiator's Felweave Armor
    {N, 806, 1}, -- Savage Gladiator's Plate Armor
    {N, 805, 32}, -- Hateful Gladiator's Dreadplate Armor
    {N, 804, 1024}, -- Hateful Gladiator's Dragonhide Armor
    {N, 803, 4}, -- Hateful Gladiator's Chain Armor
    {N, 802, 128}, -- Hateful Gladiator's Silk Armor
    {N, 801, 2}, -- Hateful Gladiator's Scaled Armor
    {N, 800, 8}, -- Hateful Gladiator's Leather Armor
    {N, 799, 64}, -- Hateful Gladiator's Ringmail Armor
    {N, 798, 256}, -- Hateful Gladiator's Felweave Armor
    {N, 797, 1}, -- Hateful Gladiator's Plate Armor
    {N, 796, 32}, -- Deadly Gladiator's Dreadplate Armor
    {N, 795, 1024}, -- Deadly Gladiator's Dragonhide Armor
    {N, 794, 4}, -- Deadly Gladiator's Chain Armor
    {N, 793, 128}, -- Deadly Gladiator's Silk Armor
    {N, 792, 2}, -- Deadly Gladiator's Scaled Armor
    {N, 791, 8}, -- Deadly Gladiator's Leather Armor
    {N, 790, 64}, -- Deadly Gladiator's Ringmail Armor
    {N, 789, 256}, -- Deadly Gladiator's Felweave Armor
    {N, 788, 1}, -- Deadly Gladiator's Plate Armor
    {N, 787, 32}, -- Furious Gladiator's Dreadplate Armor
    {N, 786, 1024}, -- Furious Gladiator's Dragonhide Armor
    {N, 785, 4}, -- Furious Gladiator's Chain Armor
    {N, 784, 128}, -- Furious Gladiator's Silk Armor
    {N, 783, 2}, -- Furious Gladiator's Scaled Armor
    {N, 782, 8}, -- Furious Gladiator's Leather Armor
    {N, 781, 64}, -- Furious Gladiator's Ringmail Armor
    {N, 780, 256}, -- Furious Gladiator's Felweave Armor
    {N, 779, 1}, -- Furious Gladiator's Plate Armor
    {N, 778, 32}, -- Relentless Gladiator's Dreadplate Armor
    {N, 777, 1024}, -- Relentless Gladiator's Dragonhide Armor
    {N, 776, 4}, -- Relentless Gladiator's Chain Armor
    {N, 775, 128}, -- Relentless Gladiator's Silk Armor
    {N, 774, 2}, -- Relentless Gladiator's Scaled Armor
    {N, 773, 8}, -- Relentless Gladiator's Leather Armor
    {N, 772, 64}, -- Relentless Gladiator's Ringmail Armor
    {N, 771, 256}, -- Relentless Gladiator's Felweave Armor
    {N, 770, 1}, -- Relentless Gladiator's Plate Armor
    {N, 769, 32}, -- Wrathful Gladiator's Dreadplate Armor
    {N, 768, 1024}, -- Wrathful Gladiator's Dragonhide Armor
    {N, 767, 4}, -- Wrathful Gladiator's Chain Armor
    {N, 766, 128}, -- Wrathful Gladiator's Silk Armor
    {N, 765, 2}, -- Wrathful Gladiator's Scaled Armor
    {N, 764, 8}, -- Wrathful Gladiator's Leather Armor
    {N, 763, 64}, -- Wrathful Gladiator's Ringmail Armor
    {N, 762, 256}, -- Wrathful Gladiator's Felweave Armor
    {N, 761, 1}, -- Wrathful Gladiator's Plate Armor
    {N, 760, 32}, -- Vicious Gladiator's Dreadplate Armor
    {N, 759, 32}, -- Vicious Gladiator's Dreadplate Armor
    {N, 758, 1024}, -- Vicious Gladiator's Dragonhide Armor
    {N, 757, 1024}, -- Vicious Gladiator's Dragonhide Armor
    {N, 756, 4}, -- Vicious Gladiator's Chain Armor
    {N, 755, 4}, -- Vicious Gladiator's Chain Armor
    {N, 754, 128}, -- Vicious Gladiator's Silk Armor
    {N, 753, 128}, -- Vicious Gladiator's Silk Armor
    {N, 752, 2}, -- Vicious Gladiator's Scaled Armor
    {N, 751, 2}, -- Vicious Gladiator's Scaled Armor
    {N, 750, 8}, -- Vicious Gladiator's Leather Armor
    {N, 749, 8}, -- Vicious Gladiator's Leather Armor
    {N, 748, 64}, -- Vicious Gladiator's Ringmail Armor
    {N, 747, 64}, -- Vicious Gladiator's Ringmail Armor
    {N, 743, 4}, -- Valorous Cryptstalker Battlegear
    {N, 742, 4}, -- Heroes' Cryptstalker Battlegear
    {N, 741, 4}, -- Conqueror's Scourgestalker Battlegear
    {N, 740, 4}, -- Valorous Scourgestalker Battlegear
    {N, 739, 4}, -- Windrunner's Battlegear
    {N, 738, 4}, -- Windrunner's Pursuit
    {N, 737, 4}, -- Sanctified Ahn'Kahar Blood Hunter's Battlegear
    {N, 736, 4}, -- Sanctified Ahn'Kahar Blood Hunter's Battlegear
    {N, 735, 4}, -- Ahn'Kahar Blood Hunter's Battlegear
    {N, 734, 4}, -- Lightning-Charged Battlegear
    {N, 733, 4}, -- Lightning-Charged Battlegear
    {N, 732, 4}, -- Flamewaker's Battlegear
    {N, 731, 4}, -- Flamewaker's Battlegear
    {N, 730, 4}, -- Wyrmstalker Battlegear
    {N, 729, 4}, -- Wyrmstalker Battlegear
    {N, 728, 4}, -- Wyrmstalker Battlegear
    {N, 727, 128}, -- Valorous Frostfire Garb
    {N, 726, 128}, -- Heroes' Frostfire Garb
    {N, 725, 128}, -- Conqueror's Kirin Tor Garb
    {N, 724, 128}, -- Valorous Kirin Tor Garb
    {N, 723, 128}, -- Sunstrider's Regalia
    {N, 722, 128}, -- Khadgar's Regalia
    {N, 721, 128}, -- Sanctified Bloodmage's Regalia
    {N, 720, 128}, -- Sanctified Bloodmage's Regalia
    {N, 719, 128}, -- Bloodmage's Regalia
    {N, 718, 128}, -- Firelord's Vestments
    {N, 717, 128}, -- Firelord's Vestments
    {N, 716, 128}, -- Firehawk Robes of Conflagration
    {N, 715, 128}, -- Firehawk Robes of Conflagration
    {N, 714, 128}, -- Time Lord's Regalia
    {N, 713, 128}, -- Time Lord's Regalia
    {N, 712, 128}, -- Time Lord's Regalia
    {N, 711, 2}, -- Valorous Redemption Plate
    {N, 710, 2}, -- Heroes' Redemption Plate
    {N, 709, 2}, -- Conqueror's Aegis Plate
    {N, 708, 2}, -- Valorous Aegis Plate
    {N, 707, 2}, -- Liadrin's Plate
    {N, 706, 2}, -- Turalyon's Plate
    {N, 705, 2}, -- Sanctified Lightsworn Plate
    {N, 704, 2}, -- Sanctified Lightsworn Plate
    {N, 703, 2}, -- Lightsworn Plate
    {N, 702, 2}, -- Reinforced Sapphirium Battleplate
    {N, 701, 2}, -- Reinforced Sapphirium Battleplate
    {N, 700, 2}, -- Battleplate of Immolation
    {N, 699, 2}, -- Battleplate of Immolation
    {N, 698, 2}, -- Battleplate of Radiant Glory
    {N, 697, 2}, -- Battleplate of Radiant Glory
    {N, 696, 2}, -- Battleplate of Radiant Glory
    {N, 695, 8}, -- Valorous Bonescythe Battlegear
    {N, 694, 8}, -- Heroes' Bonescythe Battlegear
    {N, 693, 8}, -- Conqueror's Terrorblade Battlegear
    {N, 692, 8}, -- Valorous Terrorblade Battlegear
    {N, 691, 8}, -- Garona's Battlegear
    {N, 690, 8}, -- VanCleef's Battlegear
    {N, 689, 8}, -- Sanctified Shadowblade's Battlegear
    {N, 688, 8}, -- Sanctified Shadowblade's Battlegear
    {N, 687, 8}, -- Shadowblade's Battlegear
    {N, 686, 8}, -- Wind Dancer's Regalia
    {N, 685, 8}, -- Wind Dancer's Regalia
    {N, 684, 8}, -- Vestments of the Dark Phoenix
    {N, 683, 8}, -- Vestments of the Dark Phoenix
    {N, 682, 8}, -- Blackfang Battleweave
    {N, 681, 8}, -- Blackfang Battleweave
    {N, 680, 8}, -- Blackfang Battleweave
    {N, 679, 256}, -- Valorous Plagueheart Garb
    {N, 678, 256}, -- Heroes' Plagueheart Garb
    {N, 677, 256}, -- Conqueror's Deathbringer Garb
    {N, 676, 256}, -- Valorous Deathbringer Garb
    {N, 675, 256}, -- Gul'dan's Regalia
    {N, 674, 256}, -- Kel'Thuzad's Regalia
    {N, 673, 256}, -- Sanctified Dark Coven's Regalia
    {N, 672, 256}, -- Sanctified Dark Coven's Regalia
    {N, 671, 256}, -- Dark Coven's Regalia
    {N, 670, 256}, -- Shadowflame Regalia
    {N, 669, 256}, -- Shadowflame Regalia
    {N, 668, 256}, -- Balespider's Burning Vestments
    {N, 667, 256}, -- Balespider's Burning Vestments
    {N, 666, 256}, -- Vestments of the Faceless Shroud
    {N, 665, 256}, -- Vestments of the Faceless Shroud
    {N, 664, 256}, -- Vestments of the Faceless Shroud
    {N, 663, 64}, -- Spiritwalker's Regalia
    {N, 662, 1}, -- Valorous Dreadnaught Battlegear
    {N, 661, 1}, -- Heroes' Dreadnaught Battlegear
    {N, 660, 1}, -- Conqueror's Siegebreaker Battlegear
    {N, 659, 1}, -- Valorous Siegebreaker Battlegear
    {N, 658, 1}, -- Wrynn's Battlegear
    {N, 657, 1}, -- Hellscream's Battlegear
    {N, 656, 1}, -- Sanctified Ymirjar Lord's Battlegear
    {N, 655, 1}, -- Ymirjar Lord's Battlegear
    {N, 654, 1}, -- Earthen Battleplate
    {N, 653, 1}, -- Earthen Battleplate
    {N, 652, 1}, -- Molten Giant Battleplate
    {N, 651, 1}, -- Molten Giant Battleplate
    {N, 650, 1}, -- Colossal Dragonplate Battlegear
    {N, 649, 1}, -- Colossal Dragonplate Battlegear
    {N, 645, 64}, -- Valorous Earthshatter Regalia
    {N, 644, 64}, -- Heroes' Earthshatter Regalia
    {N, 643, 64}, -- Conqueror's Worldbreaker Regalia
    {N, 642, 64}, -- Valorous Worldbreaker Regalia
    {N, 641, 64}, -- Thrall's Garb
    {N, 640, 64}, -- Nobundo's Garb
    {N, 639, 64}, -- Frost Witch's Regalia
    {N, 638, 64}, -- Frost Witch's Regalia
    {N, 637, 64}, -- Frost Witch's Regalia
    {N, 636, 64}, -- Regalia of the Raging Elements
    {N, 635, 64}, -- Regalia of the Raging Elements
    {N, 634, 64}, -- Volcanic Regalia
    {N, 633, 64}, -- Volcanic Regalia
    {N, 632, 64}, -- Spiritwalker's Regalia
    {N, 631, 1}, -- Colossal Dragonplate Battlegear
    {N, 630, 64}, -- Spiritwalker's Regalia
    {N, 629, 256}, -- Vicious Gladiator's Felweave Armor
    {N, 628, 256}, -- Vicious Gladiator's Felweave Armor
    {N, 627, 1}, -- Vicious Gladiator's Plate Armor
    {N, 626, 1}, -- Vicious Gladiator's Plate Armor
    {N, 625, 32}, -- Ruthless Gladiator's Dreadplate Armor
    {N, 624, 32}, -- Ruthless Gladiator's Dreadplate Armor
    {N, 623, 1024}, -- Ruthless Gladiator's Dragonhide Armor
    {N, 622, 1024}, -- Ruthless Gladiator's Dragonhide Armor
    {N, 621, 4}, -- Ruthless Gladiator's Chain Armor
    {N, 620, 4}, -- Ruthless Gladiator's Chain Armor
    {N, 619, 128}, -- Ruthless Gladiator's Silk Armor
    {N, 618, 128}, -- Ruthless Gladiator's Silk Armor
    {N, 617, 2}, -- Ruthless Gladiator's Scaled Armor
    {N, 616, 2}, -- Ruthless Gladiator's Scaled Armor
    {N, 615, 8}, -- Ruthless Gladiator's Leather Armor
    {N, 614, 16}, -- Ruthless Gladiator's Satin Armor
    {N, 613, 8}, -- Ruthless Gladiator's Leather Armor
    {N, 612, 16}, -- Ruthless Gladiator's Satin Armor
    {N, 611, 64}, -- Ruthless Gladiator's Ringmail Armor
    {N, 610, 64}, -- Ruthless Gladiator's Ringmail Armor
    {N, 609, 256}, -- Ruthless Gladiator's Felweave Armor
    {N, 608, 256}, -- Ruthless Gladiator's Felweave Armor
    {N, 607, 1}, -- Ruthless Gladiator's Plate Armor
    {N, 606, 1}, -- Ruthless Gladiator's Plate Armor
    {N, 605, 32}, -- Cataclysmic Gladiator's Dreadplate Armor
    {N, 604, 32}, -- Cataclysmic Gladiator's Dreadplate Armor
    {N, 603, 1024}, -- Cataclysmic Gladiator's Dragonhide Armor
    {N, 602, 1024}, -- Cataclysmic Gladiator's Dragonhide Armor
    {N, 601, 4}, -- Cataclysmic Gladiator's Chain Armor
    {N, 600, 4}, -- Cataclysmic Gladiator's Chain Armor
    {N, 599, 128}, -- Cataclysmic Gladiator's Silk Armor
    {N, 598, 128}, -- Cataclysmic Gladiator's Silk Armor
    {N, 597, 2}, -- Cataclysmic Gladiator's Scaled Armor
    {N, 596, 2}, -- Cataclysmic Gladiator's Scaled Armor
    {N, 595, 8}, -- Cataclysmic Gladiator's Leather Armor
    {N, 594, 8}, -- Cataclysmic Gladiator's Leather Armor
    {N, 593, 64}, -- Cataclysmic Gladiator's Ringmail Armor
    {N, 592, 64}, -- Cataclysmic Gladiator's Ringmail Armor
    {N, 591, 256}, -- Cataclysmic Gladiator's Felweave Armor
    {N, 590, 256}, -- Cataclysmic Gladiator's Felweave Armor
    {N, 589, 1}, -- Cataclysmic Gladiator's Plate Armor
    {N, 588, 1}, -- Cataclysmic Gladiator's Plate Armor
    {N, 584, 35}, -- Demonbreaker Battleplate
    {N, 583, 68}, -- Rancorbite Armor
    {N, 582, 3592}, -- Ironpelt Garb
    {N, 581, 400}, -- Felfume Raiment
    {N, 580, 32}, -- Plate of the Lost Catacomb
    {N, 579, 32}, -- Plate of the Lost Catacomb
    {N, 578, 32}, -- Plate of the Lost Catacomb
    {N, 577, 32}, -- Battleplate of the All-Consuming Maw
    {N, 576, 32}, -- Battleplate of the All-Consuming Maw
    {N, 575, 32}, -- Battleplate of the All-Consuming Maw
    {N, 574, 32}, -- Battleplate of Cyclopean Dread
    {N, 573, 32}, -- Battleplate of Cyclopean Dread
    {N, 572, 32}, -- Battleplate of Cyclopean Dread
    {N, 571, 32}, -- Ogreskull Boneplate Battlegear
    {N, 570, 32}, -- Ogreskull Boneplate Battlegear
    {N, 569, 32}, -- Ogreskull Boneplate Battlegear
    {N, 568, 32}, -- Demongaze Armor
    {N, 567, 32}, -- Demongaze Armor
    {N, 566, 32}, -- Demongaze Armor
    {N, 565, 1024}, -- Vestments of the Eternal Blossom
    {N, 564, 1024}, -- Vestments of the Eternal Blossom
    {N, 563, 1024}, -- Vestments of the Eternal Blossom
    {N, 562, 1024}, -- Vestments of the Haunted Forest
    {N, 561, 1024}, -- Vestments of the Haunted Forest
    {N, 560, 1024}, -- Vestments of the Haunted Forest
    {N, 559, 1024}, -- Vestments of the Shattered Vale
    {N, 558, 1024}, -- Vestments of the Shattered Vale
    {N, 557, 1024}, -- Vestments of the Shattered Vale
    {N, 556, 1024}, -- Living Wood Battlegear
    {N, 555, 1024}, -- Living Wood Battlegear
    {N, 554, 1024}, -- Living Wood Battlegear
    {N, 553, 1024}, -- Oathclaw Wargarb
    {N, 552, 1024}, -- Oathclaw Wargarb
    {N, 551, 1024}, -- Oathclaw Wargarb
    {N, 547, 4}, -- Yaungol Slayer Battlegear
    {N, 546, 4}, -- Yaungol Slayer Battlegear
    {N, 545, 4}, -- Yaungol Slayer Battlegear
    {N, 544, 4}, -- Battlegear of the Saurok Stalker
    {N, 543, 4}, -- Battlegear of the Saurok Stalker
    {N, 542, 4}, -- Battlegear of the Saurok Stalker
    {N, 541, 4}, -- Battlegear of the Unblinking Vigil
    {N, 540, 4}, -- Battlegear of the Unblinking Vigil
    {N, 539, 4}, -- Battlegear of the Unblinking Vigil
    {N, 538, 4}, -- Rylakstalker's Battlegear
    {N, 537, 4}, -- Rylakstalker's Battlegear
    {N, 536, 4}, -- Rylakstalker's Battlegear
    {N, 535, 4}, -- Battlegear of the Savage Hunt
    {N, 534, 4}, -- Battlegear of the Savage Hunt
    {N, 533, 4}, -- Battlegear of the Savage Hunt
    {N, 531, 128}, -- Regalia of the Burning Scroll
    {N, 530, 128}, -- Regalia of the Burning Scroll
    {N, 529, 128}, -- Regalia of the Burning Scroll
    {N, 528, 128}, -- Regalia of the Chromatic Hydra
    {N, 527, 128}, -- Regalia of the Chromatic Hydra
    {N, 526, 128}, -- Regalia of the Chromatic Hydra
    {N, 525, 128}, -- Chronomancer Regalia
    {N, 524, 128}, -- Chronomancer Regalia
    {N, 523, 128}, -- Chronomancer Regalia
    {N, 522, 128}, -- Arcanoshatter Regalia
    {N, 521, 128}, -- Arcanoshatter Regalia
    {N, 520, 128}, -- Arcanoshatter Regalia
    {N, 519, 128}, -- Raiment of the Arcanic Conclave
    {N, 518, 128}, -- Raiment of the Arcanic Conclave
    {N, 517, 128}, -- Raiment of the Arcanic Conclave
    {N, 515, 512}, -- Vestments of the Red Crane
    {N, 514, 512}, -- Vestments of the Red Crane
    {N, 513, 512}, -- Vestments of the Red Crane
    {N, 512, 512}, -- Fire-Charm Vestments
    {N, 511, 512}, -- Fire-Charm Vestments
    {N, 510, 512}, -- Fire-Charm Vestments
    {N, 508, 512}, -- Vestments of the Seven Sacred Seals
    {N, 507, 512}, -- Vestments of the Seven Sacred Seals
    {N, 506, 512}, -- Vestments of the Seven Sacred Seals
    {N, 505, 512}, -- Battlewrap of the Hurricane's Eye
    {N, 503, 512}, -- Battlewrap of the Hurricane's Eye
    {N, 502, 512}, -- Battlewrap of the Hurricane's Eye
    {N, 501, 512}, -- Battlegear of the Somber Gaze
    {N, 500, 512}, -- Battlegear of the Somber Gaze
    {N, 498, 512}, -- Battlegear of the Somber Gaze
    {N, 495, 2}, -- White Tiger Battlegear
    {N, 494, 2}, -- White Tiger Battlegear
    {N, 493, 2}, -- White Tiger Battlegear
    {N, 492, 2}, -- Battlegear of the Lightning Emperor
    {N, 491, 2}, -- Battlegear of the Lightning Emperor
    {N, 490, 2}, -- Battlegear of the Lightning Emperor
    {N, 489, 2}, -- Vestments of Winged Triumph
    {N, 488, 2}, -- Vestments of Winged Triumph
    {N, 487, 2}, -- Vestments of Winged Triumph
    {N, 485, 2}, -- Battlegear of Guiding Light
    {N, 484, 2}, -- Battlegear of Guiding Light
    {N, 483, 2}, -- Battlegear of Guiding Light
    {N, 482, 2}, -- Watch of the Ceaseless Vigil
    {N, 481, 2}, -- Watch of the Ceaseless Vigil
    {N, 480, 2}, -- Watch of the Ceaseless Vigil
    {N, 479, 8}, -- Battlegear of the Thousandfold Blades
    {N, 478, 8}, -- Battlegear of the Thousandfold Blades
    {N, 477, 8}, -- Battlegear of the Thousandfold Blades
    {N, 476, 8}, -- Nine-Tail Battlegear
    {N, 475, 8}, -- Nine-Tail Battlegear
    {N, 474, 8}, -- Nine-Tail Battlegear
    {N, 473, 8}, -- Barbed Assassin Battlegear
    {N, 472, 8}, -- Barbed Assassin Battlegear
    {N, 471, 8}, -- Barbed Assassin Battlegear
    {N, 470, 8}, -- Poisoner's Battlegear
    {N, 469, 8}, -- Poisoner's Battlegear
    {N, 468, 8}, -- Poisoner's Battlegear
    {N, 467, 8}, -- Felblade Armor
    {N, 466, 8}, -- Felblade Armor
    {N, 465, 8}, -- Felblade Armor
    {N, 463, 256}, -- Sha Skin Regalia
    {N, 462, 256}, -- Sha Skin Regalia
    {N, 461, 256}, -- Sha Skin Regalia
    {N, 460, 256}, -- Regalia of the Thousandfold Hells
    {N, 459, 256}, -- Regalia of the Thousandfold Hells
    {N, 458, 256}, -- Regalia of the Thousandfold Hells
    {N, 457, 256}, -- Regalia of the Horned Nightmare
    {N, 456, 256}, -- Regalia of the Horned Nightmare
    {N, 455, 256}, -- Regalia of the Horned Nightmare
    {N, 454, 256}, -- Shadow Council's Garb
    {N, 453, 256}, -- Shadow Council's Garb
    {N, 452, 256}, -- Shadow Council's Garb
    {N, 451, 256}, -- Deathrattle Regalia
    {N, 450, 256}, -- Deathrattle Regalia
    {N, 449, 256}, -- Deathrattle Regalia
    {N, 446, 1}, -- Battleplate of Resounding Rings
    {N, 445, 1}, -- Battleplate of Resounding Rings
    {N, 444, 1}, -- Battleplate of Resounding Rings
    {N, 443, 1}, -- Battleplate of the Last Mogu
    {N, 442, 1}, -- Battleplate of the Last Mogu
    {N, 441, 1}, -- Battleplate of the Last Mogu
    {N, 440, 1}, -- Battleplate of the Prehistoric Marauder
    {N, 439, 1}, -- Battleplate of the Prehistoric Marauder
    {N, 438, 1}, -- Battleplate of the Prehistoric Marauder
    {N, 437, 1}, -- Blackhand's Battlegear
    {N, 436, 1}, -- Blackhand's Battlegear
    {N, 435, 1}, -- Blackhand's Battlegear
    {N, 434, 1}, -- Battlegear of Iron Wrath
    {N, 433, 1}, -- Battlegear of Iron Wrath
    {N, 432, 1}, -- Battlegear of Iron Wrath
    {N, 429, 16}, -- Guardian Serpent Regalia
    {N, 428, 64}, -- Regalia of the Firebird
    {N, 427, 64}, -- Regalia of the Firebird
    {N, 426, 64}, -- Regalia of the Witch Doctor
    {N, 425, 64}, -- Regalia of the Witch Doctor
    {N, 424, 64}, -- Regalia of the Witch Doctor
    {N, 423, 64}, -- Regalia of Celestial Harmony
    {N, 422, 64}, -- Regalia of Celestial Harmony
    {N, 421, 64}, -- Regalia of Celestial Harmony
    {N, 420, 64}, -- Windspeaker's Regalia
    {N, 419, 16}, -- Soul Priest's Raiment
    {N, 418, 64}, -- Windspeaker's Regalia
    {N, 417, 64}, -- Embrace of the Living Mountain
    {N, 416, 64}, -- Embrace of the Living Mountain
    {N, 415, 64}, -- Embrace of the Living Mountain
    {N, 410, 4}, -- Vindictive Combatant's Chain Armor
    {N, 409, 4}, -- Vindictive Combatant's Chain Armor
    {N, 408, 16}, -- Warmongering Gladiator's Satin Armor
    {N, 407, 16}, -- Warmongering Gladiator's Satin Armor
    {N, 406, 16}, -- Wild Gladiator's Satin Armor
    {N, 405, 16}, -- Wild Gladiator's Satin Armor
    {N, 404, 16}, -- Primal Gladiator's Satin Armor
    {N, 403, 16}, -- Primal Gladiator's Satin Armor
    {N, 402, 16}, -- Grievous Gladiator's Satin Armor
    {N, 401, 16}, -- Grievous Gladiator's Satin Armor
    {N, 400, 16}, -- Prideful Gladiator's Satin Armor
    {N, 399, 16}, -- Prideful Gladiator's Satin Armor
    {N, 398, 16}, -- Tyrannical Gladiator's Satin Armor
    {N, 397, 16}, -- Tyrannical Gladiator's Satin Armor
    {N, 396, 16}, -- Malevolent Gladiator's Satin Armor
    {N, 395, 16}, -- Cruel Gladiator's Satin Armor
    {N, 394, 16}, -- Cruel Gladiator's Satin Armor
    {N, 393, 16}, -- Vindictive Gladiator's Satin Armor
    {N, 392, 16}, -- Vindictive Gladiator's Satin Armor
    {N, 391, 16}, -- Cruel Gladiator's Satin Armor
    {N, 390, 16}, -- Vindictive Gladiator's Satin Armor
    {N, 389, 16}, -- Cruel Gladiator's Satin Armor
    {N, 388, 16}, -- Vindictive Gladiator's Satin Armor
    {N, 382, 16}, -- Satin Battlegear
    {N, 381, 1}, -- Gladiator's Plate Armor
    {N, 380, 16}, -- Merciless Gladiator's Satin Armor
    {N, 379, 16}, -- Vengeful Gladiator's Satin Armor
    {N, 378, 16}, -- Brutal Gladiator's Satin Armor
    {N, 377, 16}, -- Savage Gladiator's Satin Armor
    {N, 376, 16}, -- Hateful Gladiator's Satin Armor
    {N, 375, 16}, -- Deadly Gladiator's Satin Armor
    {N, 374, 16}, -- Furious Gladiator's Satin Armor
    {N, 373, 16}, -- Relentless Gladiator's Satin Armor
    {N, 372, 16}, -- Wrathful Gladiator's Satin Armor
    {N, 371, 16}, -- Bloodthirsty Gladiator's Satin Armor
    {N, 370, 16}, -- Vicious Gladiator's Satin Armor
    {N, 369, 16}, -- Vicious Gladiator's Satin Armor
    {N, 366, 16}, -- Cataclysmic Gladiator's Satin Armor
    {N, 365, 16}, -- Cataclysmic Gladiator's Satin Armor
    {N, 364, 16}, -- Conqueror's Sanctification Regalia
    {N, 363, 16}, -- Valorous Sanctification Regalia
    {N, 362, 16}, -- Valorous Regalia of Faith
    {N, 361, 16}, -- Heroes' Regalia of Faith
    {N, 358, 16}, -- Garments of the Oracle
    {N, 357, 16}, -- Vestments of Prophecy
    {N, 356, 16}, -- Vestments of Transcendence
    {N, 355, 16}, -- Vestments of Faith
    {N, 354, 16}, -- Incarnate Regalia
    {N, 353, 16}, -- Avatar Regalia
    {N, 352, 16}, -- Vestments of Absolution
    {N, 351, 16}, -- Absolution Regalia
    {N, 350, 16}, -- Zabra's Regalia
    {N, 349, 16}, -- Velen's Regalia
    {N, 348, 16}, -- Sanctified Crimson Acolyte Regalia
    {N, 347, 16}, -- Sanctified Crimson Acolyte Regalia
    {N, 346, 16}, -- Crimson Acolyte Regalia
    {N, 345, 16}, -- Mercurial Regalia
    {N, 344, 16}, -- Mercurial Regalia
    {N, 343, 16}, -- Regalia of the Cleansing Flame
    {N, 342, 16}, -- Regalia of the Cleansing Flame
    {N, 341, 16}, -- Regalia of Dying Light
    {N, 340, 16}, -- Regalia of Dying Light
    {N, 339, 16}, -- Regalia of Dying Light
    {N, 338, 64}, -- Regalia of the Firebird
    {N, 337, 16}, -- Guardian Serpent Regalia
    {N, 336, 16}, -- Guardian Serpent Regalia
    {N, 335, 16}, -- Regalia of the Exorcist
    {N, 334, 16}, -- Regalia of the Exorcist
    {N, 333, 16}, -- Regalia of Ternion Glory
    {N, 332, 16}, -- Regalia of Ternion Glory
    {N, 331, 16}, -- Regalia of Ternion Glory
    {N, 329, 16}, -- Soul Priest's Raiment
    {N, 328, 64}, -- Windspeaker's Regalia
    {N, 327, 16}, -- Soul Priest's Raiment
    {N, 325, 16}, -- Attire of Piety
    {N, 324, 16}, -- Attire of Piety
    {N, 323, 16}, -- Attire of Piety
    {N, 322, 16}, -- Vestments of the Purifier
    {N, 321, 256}, -- Legacy of Azj'Aqir
    {N, 316, 256}, -- Legacy of Azj'Aqir
    {N, 315, 256}, -- Legacy of Azj'Aqir
    {N, 311, 16}, -- Vestments of the Purifier
    {N, 310, 16}, -- Regalia of the Exorcist
    {N, 309, 16}, -- Vestments of the Purifier
    {N, 308, 16}, -- Vestments of the Purifier
    {N, 298, 1}, -- Sanctified Ymirjar Lord's Battlegear
    {N, 286, 4}, -- Malevolent Gladiator's Chain Armor
    {N, 285, 32}, -- Malevolent Gladiator's Dreadplate Armor
    {N, 284, 64}, -- Malevolent Gladiator's Ringmail Armor
    {N, 283, 256}, -- Malevolent Gladiator's Felweave Armor
    {N, 282, 16}, -- Malevolent Gladiator's Satin Armor
    {N, 281, 1024}, -- Malevolent Gladiator's Dragonhide Armor
    {N, 280, 8}, -- Malevolent Gladiator's Leather Armor
    {N, 279, 512}, -- Malevolent Gladiator's Ironskin Armor
    {N, 278, 1}, -- Malevolent Gladiator's Plate Armor
    {N, 277, 2}, -- Malevolent Gladiator's Scaled Armor
    {N, 276, 128}, -- Malevolent Gladiator's Silk Armor
    {N, 275, 128}, -- Tyrannical Gladiator's Silk Armor
    {N, 274, 2}, -- Tyrannical Gladiator's Scaled Armor
    {N, 273, 16}, -- Tyrannical Gladiator's Satin Armor
    {N, 272, 64}, -- Tyrannical Gladiator's Ringmail Armor
    {N, 271, 1}, -- Tyrannical Gladiator's Plate Armor
    {N, 270, 8}, -- Tyrannical Gladiator's Leather Armor
    {N, 269, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {N, 268, 256}, -- Tyrannical Gladiator's Felweave Armor
    {N, 267, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {N, 266, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {N, 265, 4}, -- Tyrannical Gladiator's Chain Armor
    {N, 264, 128}, -- Tyrannical Gladiator's Silk Armor
    {N, 263, 2}, -- Tyrannical Gladiator's Scaled Armor
    {N, 262, 64}, -- Tyrannical Gladiator's Ringmail Shaman
    {N, 261, 1}, -- Tyrannical Gladiator's Plate Armor
    {N, 260, 8}, -- Tyrannical Gladiator's Leather Armor
    {N, 259, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {N, 258, 16}, -- Tyrannical Gladiator's Satin Armor
    {N, 257, 256}, -- Tyrannical Gladiator's Felweave Armor
    {N, 256, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {N, 255, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {N, 254, 4}, -- Tyrannical Gladiator's Chain Armor
    {N, 253, 128}, -- Prideful Gladiator's Silk Armor
    {N, 252, 2}, -- Prideful Gladiator's Scaled Armor
    {N, 251, 16}, -- Prideful Gladiator's Satin Armor
    {N, 250, 64}, -- Prideful Gladiator's Ringmail Armor
    {N, 249, 1}, -- Prideful Gladiator's Plate Armor
    {N, 248, 8}, -- Prideful Gladiator's Leather Armor
    {N, 247, 512}, -- Prideful Gladiator's Ironskin Armor
    {N, 246, 256}, -- Prideful Gladiator's Felweave Armor
    {N, 245, 32}, -- Prideful Gladiator's Dreadplate Armor
    {N, 244, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {N, 243, 4}, -- Prideful Gladiator's Chain Armor
    {N, 242, 128}, -- Prideful Gladiator's Silk Armor
    {N, 241, 2}, -- Prideful Gladiator's Scaled Armor
    {N, 240, 16}, -- Prideful Gladiator's Satin Armor
    {N, 239, 64}, -- Prideful Gladiator's Ringmail Armor
    {N, 238, 1}, -- Prideful Gladiator's Plate Armor
    {N, 237, 8}, -- Prideful Gladiator's Leather Armor
    {N, 236, 512}, -- Prideful Gladiator's Ironskin Armor
    {N, 235, 256}, -- Prideful Gladiator's Felweave Armor
    {N, 234, 32}, -- Prideful Gladiator's Dreadplate Armor
    {N, 233, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {N, 232, 4}, -- Prideful Gladiator's Chain Armor
    {N, 219, 128}, -- Grievous Gladiator's Silk Armor
    {N, 218, 2}, -- Grievous Gladiator's Scaled Armor
    {N, 217, 16}, -- Grievous Gladiator's Satin Armor
    {N, 216, 64}, -- Grievous Gladiator's Ringmail Armor
    {N, 215, 1}, -- Grievous Gladiator's Plate Armor
    {N, 214, 8}, -- Grievous Gladiator's Leather Armor
    {N, 213, 512}, -- Grievous Gladiator's Ironskin Armor
    {N, 212, 256}, -- Grievous Gladiator's Felweave Armor
    {N, 211, 32}, -- Grievous Gladiator's Dreadplate Armor
    {N, 210, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {N, 209, 128}, -- Grievous Gladiator's Silk Armor
    {N, 208, 2}, -- Grievous Gladiator's Scaled Armor
    {N, 207, 16}, -- Grievous Gladiator's Satin Armor
    {N, 206, 64}, -- Grievous Gladiator's Ringmail Armor
    {N, 205, 1}, -- Grievous Gladiator's Plate Armor
    {N, 204, 8}, -- Grievous Gladiator's Leather Armor
    {N, 203, 512}, -- Grievous Gladiator's Ironskin Armor
    {N, 202, 256}, -- Grievous Gladiator's Felweave Armor
    {N, 201, 32}, -- Grievous Gladiator's Dreadplate Armor
    {N, 200, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {N, 199, 4}, -- Grievous Gladiator's Chain Armor
    {N, 198, 4}, -- Grievous Gladiator's Chain Armor
    {N, 197, 128}, -- Dreadful Gladiator's Silk Armor
    {N, 196, 2}, -- Dreadful Gladiator's Scaled Armor
    {N, 195, 16}, -- Dreadful Gladiator's Satin Armor
    {N, 194, 64}, -- Dreadful Gladiator's Ringmail Armor
    {N, 193, 1}, -- Dreadful Gladiator's Plate
    {N, 192, 8}, -- Dreadful Gladiator's Leather Armor
    {N, 191, 512}, -- Dreadful Gladiator's Ironskin Armor
    {N, 190, 256}, -- Dreadful Gladiator's Felweave Armor
    {N, 189, 32}, -- Dreadful Gladiator's Dreadplate Armor
    {N, 188, 1024}, -- Dreadful Gladiator's Dragonhide Armor
    {N, 187, 4}, -- Dreadful Gladiator's Chain Armor
    {N, 186, 35}, -- Funerary Plate of the Chosen Dead
    {N, 185, 35}, -- Funerary Plate of the Chosen Dead
    {N, 184, 35}, -- Funerary Plate of the Chosen Dead
    {N, 183, 35}, -- Funerary Plate of the Chosen Dead
    {N, 182, 68}, -- Chains of the Chosen Dead
    {N, 181, 68}, -- Chains of the Chosen Dead
    {N, 180, 68}, -- Chains of the Chosen Dead
    {N, 179, 68}, -- Chains of the Chosen Dead
    {N, 178, 3592}, -- Garb of the Chosen Dead
    {N, 177, 3592}, -- Garb of the Chosen Dead
    {N, 176, 3592}, -- Garb of the Chosen Dead
    {N, 175, 3592}, -- Garb of the Chosen Dead
    {N, 174, 400}, -- Regalia of the Chosen Dead
    {N, 173, 400}, -- Regalia of the Chosen Dead
    {N, 172, 400}, -- Regalia of the Chosen Dead
    {N, 171, 400}, -- Regalia of the Chosen Dead
    {N, 144, 128}, -- Primal Gladiator's Silk Armor
    {N, 143, 128}, -- Primal Gladiator's Silk Armor
    {N, 142, 2}, -- Primal Gladiator's Scaled Armor
    {N, 141, 2}, -- Primal Gladiator's Scaled Armor
    {N, 140, 16}, -- Primal Gladiator's Satin Armor
    {N, 139, 16}, -- Primal Gladiator's Satin Armor
    {N, 138, 64}, -- Primal Gladiator's Ringmail Armor
    {N, 137, 64}, -- Primal Gladiator's Ringmail Armor
    {N, 136, 1}, -- Primal Gladiator's Plate Armor
    {N, 135, 1}, -- Primal Gladiator's Plate Armor
    {N, 134, 8}, -- Primal Gladiator's Leather Armor
    {N, 133, 8}, -- Primal Gladiator's Leather Armor
    {N, 132, 512}, -- Primal Gladiator's Ironskin Armor
    {N, 131, 512}, -- Primal Gladiator's Ironskin Armor
    {N, 130, 256}, -- Primal Gladiator's Felweave Armor
    {N, 129, 256}, -- Primal Gladiator's Felweave Armor
    {N, 128, 32}, -- Primal Gladiator's Dreadplate Armor
    {N, 127, 32}, -- Primal Gladiator's Dreadplate Armor
    {N, 126, 1024}, -- Primal Gladiator's Dragonhide Armor
    {N, 125, 1024}, -- Primal Gladiator's Dragonhide Armor
    {N, 124, 4}, -- Primal Gladiator's Chain Armor
    {N, 123, 4}, -- Primal Gladiator's Chain Armor
    {N, 122, 128}, -- Warmongering Gladiator's Silk Armor
    {N, 121, 128}, -- Warmongering Gladiator's Silk Armor
    {N, 120, 2}, -- Warmongering Gladiator's Scaled Armor
    {N, 119, 2}, -- Warmongering Gladiator's Scaled Armor
    {N, 118, 16}, -- Warmongering Gladiator's Satin Armor
    {N, 117, 16}, -- Warmongering Gladiator's Satin Armor
    {N, 116, 1}, -- Warmongering Gladiator's Plate Armor
    {N, 115, 1}, -- Warmongering Gladiator's Plate Armor
    {N, 114, 8}, -- Warmongering Gladiator's Leather Armor
    {N, 113, 8}, -- Warmongering Gladiator's Leather Armor
    {N, 112, 512}, -- Warmongering Gladiator's Ironskin Armor
    {N, 111, 512}, -- Warmongering Gladiator's Ironskin Armor
    {N, 110, 256}, -- Warmongering Gladiator's Felweave Armor
    {N, 109, 256}, -- Warmongering Gladiator's Felweave Armor
    {N, 108, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {N, 107, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {N, 106, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {N, 105, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {N, 104, 64}, -- Warmongering Gladiator's Ringmail Armor
    {N, 103, 64}, -- Warmongering Gladiator's Ringmail Armor
    {N, 102, 4}, -- Warmongering Gladiator's Chain Armor
    {N, 101, 4}, -- Warmongering Gladiator's Chain Armor
    {N, 100, 128}, -- Wild Gladiator's Silk Armor
    {N, 99, 128}, -- Wild Gladiator's Silk Armor
    {N, 98, 16}, -- Wild Gladiator's Satin Armor
    {N, 97, 16}, -- Wild Gladiator's Satin Armor
    {N, 96, 256}, -- Wild Gladiator's Felweave Armor
    {N, 95, 256}, -- Wild Gladiator's Felweave Armor
    {N, 94, 2}, -- Wild Gladiator's Scaled Paladin
    {N, 93, 2}, -- Wild Gladiator's Scaled Armor
    {N, 92, 1}, -- Wild Gladiator's Plate Armor
    {N, 91, 1}, -- Wild Gladiator's Plate Armor
    {N, 90, 32}, -- Wild Gladiator's Dreadplate Armor
    {N, 89, 32}, -- Wild Gladiator's Dreadplate Armor
    {N, 88, 512}, -- Wild Gladiator's Ironskin Armor
    {N, 87, 512}, -- Wild Gladiator's Ironskin Armor
    {N, 86, 8}, -- Wild Gladiator's Leather Armor
    {N, 85, 8}, -- Wild Gladiator's Leather Armor
    {N, 84, 1024}, -- Wild Gladiator's Dragonhide Armor
    {N, 83, 1024}, -- Wild Gladiator's Dragonhide Armor
    {N, 82, 64}, -- Wild Gladiator's Ringmail Armor
    {N, 81, 64}, -- Wild Gladiator's Ringmail Armor
    {N, 80, 4}, -- Wild Gladiator's Chain Armor
    {N, 79, 4}, -- Wild Gladiator's Chain Armor
    {N, 78, 128}, -- Primal Combatant's Silk Armor
    {N, 77, 128}, -- Primal Combatant's Silk Armor
    {N, 76, 16}, -- Primal Combatant's Satin Armor
    {N, 75, 16}, -- Primal Combatant's Satin Armor
    {N, 74, 256}, -- Primal Combatant's Felweave Armor
    {N, 73, 256}, -- Primal Combatant's Felweave Armor
    {N, 72, 1}, -- Primal Combatant's Plate Armor
    {N, 71, 1}, -- Primal Combatant's Plate Armor
    {N, 70, 2}, -- Primal Combatant's Scaled Armor
    {N, 69, 2}, -- Primal Combatant's Scaled Armor
    {N, 68, 32}, -- Primal Combatant's Dreadplate Armor
    {N, 67, 32}, -- Primal Combatant's Dreadplate Armor
    {N, 66, 512}, -- Primal Combatant's Ironskin Armor
    {N, 65, 512}, -- Primal Combatant's Ironskin Armor
    {N, 64, 8}, -- Primal Combatant's Leather Armor
    {N, 63, 8}, -- Primal Combatant's Leather Armor
    {N, 62, 1024}, -- Primal Combatant's Dragonhide Armor
    {N, 61, 1024}, -- Primal Combatant's Dragonhide Armor
    {N, 60, 64}, -- Primal Combatant's Ringmail Armor
    {N, 59, 64}, -- Primal Combatant's Ringmail Armor
    {N, 58, 4}, -- Primal Combatant's Chain Armor
    {N, 57, 4}, -- Primal Combatant's Chain Armor
    {N, 56, 256}, -- Warmongering Combatant's Felweave Armor
    {N, 55, 256}, -- Warmongering Combatant's Felweave Armor
    {N, 54, 128}, -- Warmongering Combatant's Silk Armor
    {N, 53, 128}, -- Warmongering Combatant's Silk Armor
    {N, 52, 16}, -- Warmongering Combatant's Satin Armor
    {N, 51, 16}, -- Warmongering Combatant's Satin Armor
    {N, 50, 1}, -- Warmongering Combatant's Plate Armor
    {N, 49, 1}, -- Warmongering Combatant's Plate Armor
    {N, 48, 2}, -- Warmongering Combatant's Scaled Armor
    {N, 47, 2}, -- Warmongering Combatant's Scaled Armor
    {N, 46, 32}, -- Warmongering Combatant's Dreadplate Armor
    {N, 45, 32}, -- Warmongering Combatant's Dreadplate Armor
    {N, 44, 512}, -- Warmongering Combatant's Ironskin Armor
    {N, 43, 512}, -- Warmongering Combatant's Ironskin Armor
    {N, 42, 8}, -- Warmongering Combatant's Leather Armor
    {N, 41, 8}, -- Warmongering Combatant's Leather Armor
    {N, 40, 1024}, -- Warmongering Combatant's Dragonhide Armor
    {N, 39, 1024}, -- Warmongering Combatant's Dragonhide Armor
    {N, 38, 64}, -- Warmongering Combatant's Ringmail Armor
    {N, 37, 64}, -- Warmongering Combatant's Ringmail Armor
    {N, 36, 4}, -- Warmongering Combatant's Chain Armor
    {N, 35, 4}, -- Warmongering Combatant's Chain Armor
    {N, 34, 256}, -- Wild Combatant's Felweave Armor
    {N, 33, 256}, -- Wild Combatant's Felweave Armor
    {N, 32, 16}, -- Wild Combatant's Satin Armor
    {N, 31, 16}, -- Wild Combatant's Satin Armor
    {N, 30, 128}, -- Wild Combatant's Silk Armor
    {N, 29, 128}, -- Wild Combatant's Silk Armor
    {N, 28, 512}, -- Wild Combatant's Ironskin Armor
    {N, 27, 512}, -- Wild Combatant's Ironskin Armor
    {N, 26, 1024}, -- Wild Combatant's Dragonhide Armor
    {N, 25, 1024}, -- Wild Combatant's Dragonhide Armor
    {N, 24, 8}, -- Wild Combatant's Leather Armor
    {N, 23, 8}, -- Wild Combatant's Leather Armor
    {N, 22, 1}, -- Wild Combatant's Plate Armor
    {N, 21, 1}, -- Wild Combatant's Plate Armor
    {N, 20, 2}, -- Wild Combatant's Scaled Armor
    {N, 19, 2}, -- Wild Combatant's Scaled Armor
    {N, 18, 32}, -- Wild Combatant's Dreadplate Armor
    {N, 17, 32}, -- Wild Combatant's Dreadplate Armor
    {N, 16, 64}, -- Wild Combatant's Ringmail Armor
    {N, 15, 64}, -- Wild Combatant's Ringmail Armor
    {N, 14, 4}, -- Wild Combatant's Chain Armor
    {N, 13, 4}, -- Wild Combatant's Chain Armor
};