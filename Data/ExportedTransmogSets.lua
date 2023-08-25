local _, addon = ...;
local data = addon.Data;
data.ExportedTransmogSets = {};
local exportedTransmogSets = data.ExportedTransmogSets;
local objects = addon.Objects;
local transmogSet = objects.TransmogSet;

local workload, transmogSets;
function exportedTransmogSets.RegisterWorkload(_transmogSets)
    transmogSets = _transmogSets;
    wipe(transmogSets);

    local name = "Transmog Sets";
    data.InjectLoadingDebug(workload, name);

    tinsert(data.Workload, 1, workload);
end

local function T(id, ...)
    transmogSet:New(id, ...)
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-08-25 18-34-26 ]] --
workload = {
    {T, 2909, 128}, -- Underlight Conjurer's Brilliance
    {T, 2908, 128}, -- Underlight Conjurer's Brilliance
    {T, 2907, 128}, -- Underlight Conjurer's Brilliance
    {T, 2906, 4096}, -- Legacy of Obsidian Secrets
    {T, 2905, 4096}, -- Legacy of Obsidian Secrets
    {T, 2904, 4096}, -- Legacy of Obsidian Secrets
    {T, 2903, 2048}, -- Kinslayer's Burdens
    {T, 2902, 2048}, -- Kinslayer's Burdens
    {T, 2901, 2048}, -- Kinslayer's Burdens
    {T, 2900, 1}, -- Irons of the Onyx Crucible
    {T, 2899, 1}, -- Irons of the Onyx Crucible
    {T, 2898, 1}, -- Irons of the Onyx Crucible
    {T, 2897, 32}, -- Lingering Phantom's Encasement
    {T, 2896, 32}, -- Lingering Phantom's Encasement
    {T, 2895, 32}, -- Lingering Phantom's Encasement
    {T, 2894, 1024}, -- Strands of the Autumn Blaze
    {T, 2893, 1024}, -- Strands of the Autumn Blaze
    {T, 2892, 1024}, -- Strands of the Autumn Blaze
    {T, 2891, 4}, -- Ashen Predator's Scaleform
    {T, 2890, 4}, -- Ashen Predator's Scaleform
    {T, 2889, 4}, -- Ashen Predator's Scaleform
    {T, 2888, 512}, -- Fangs of the Vermillion Forge
    {T, 2887, 512}, -- Fangs of the Vermillion Forge
    {T, 2886, 512}, -- Fangs of the Vermillion Forge
    {T, 2885, 16}, -- The Furnace Seraph's Verdict
    {T, 2884, 16}, -- The Furnace Seraph's Verdict
    {T, 2883, 16}, -- The Furnace Seraph's Verdict
    {T, 2882, 8}, -- Lurking Specter's Shadeweave
    {T, 2881, 8}, -- Lurking Specter's Shadeweave
    {T, 2880, 8}, -- Lurking Specter's Shadeweave
    {T, 2879, 64}, -- Runes of the Cinderwolf
    {T, 2878, 64}, -- Runes of the Cinderwolf
    {T, 2877, 64}, -- Runes of the Cinderwolf
    {T, 2876, 256}, -- Sinister Savant's Cursethreads
    {T, 2875, 256}, -- Sinister Savant's Cursethreads
    {T, 2874, 256}, -- Sinister Savant's Cursethreads
    {T, 2873, 2}, -- Heartfire Sentinel's Authority
    {T, 2872, 2}, -- Heartfire Sentinel's Authority
    {T, 2871, 2}, -- Heartfire Sentinel's Authority
    {T, 2870, 32}, -- Lingering Phantom's Encasement
    {T, 2869, 2048}, -- Kinslayer's Burdens
    {T, 2868, 1024}, -- Strands of the Autumn Blaze
    {T, 2867, 4096}, -- Legacy of Obsidian Secrets
    {T, 2866, 4}, -- Ashen Predator's Scaleform
    {T, 2865, 128}, -- Underlight Conjurer's Brilliance
    {T, 2864, 512}, -- Fangs of the Vermillion Forge
    {T, 2863, 16}, -- The Furnace Seraph's Verdict
    {T, 2862, 8}, -- Lurking Specter's Shadeweave
    {T, 2861, 64}, -- Runes of the Cinderwolf
    {T, 2860, 256}, -- Sinister Savant's Cursethreads
    {T, 2859, 2}, -- Heartfire Sentinel's Authority
    {T, 2858, 1}, -- Irons of the Onyx Crucible
    {T, 2749, 35}, -- Primal Molten
    {T, 2748, 35}, -- Dreamfire
    {T, 2747, 3592}, -- Life-Bound
    {T, 2746, 3592}, -- Green Draketracker
    {T, 2745, 4164}, -- Flame-Touched
    {T, 2744, 4164}, -- Emerald Scale
    {T, 2743, 400}, -- Vibrant Wildercloth
    {T, 2742, 400}, -- Verdant Wing
    {T, 2741, 1}, -- Crimson Gladiator's Plate Armor
    {T, 2740, 1}, -- Crimson Gladiator's Plate Armor
    {T, 2739, 2}, -- Crimson Gladiator's Plate Armor
    {T, 2738, 2}, -- Crimson Gladiator's Plate Armor
    {T, 2737, 32}, -- Crimson Gladiator's Plate Armor
    {T, 2736, 32}, -- Crimson Gladiator's Plate Armor
    {T, 2735, 64}, -- Crimson Gladiator's Chain Armor
    {T, 2734, 64}, -- Crimson Gladiator's Chain Armor
    {T, 2733, 4}, -- Crimson Gladiator's Chain Armor
    {T, 2732, 4}, -- Crimson Gladiator's Chain Armor
    {T, 2731, 4096}, -- Crimson Gladiator's Chain Armor
    {T, 2730, 4096}, -- Crimson Gladiator's Chain Armor
    {T, 2729, 8}, -- Crimson Gladiator's Leather Armor
    {T, 2728, 8}, -- Crimson Gladiator's Leather Armor
    {T, 2727, 512}, -- Crimson Gladiator's Leather Armor
    {T, 2726, 512}, -- Crimson Gladiator's Leather Armor
    {T, 2725, 2048}, -- Crimson Gladiator's Leather Armor
    {T, 2724, 2048}, -- Crimson Gladiator's Leather Armor
    {T, 2723, 1024}, -- Crimson Gladiator's Leather Armor
    {T, 2722, 1024}, -- Crimson Gladiator's Leather Armor
    {T, 2721, 256}, -- Crimson Gladiator's Silk Armor
    {T, 2720, 256}, -- Crimson Gladiator's Silk Armor
    {T, 2719, 16}, -- Crimson Gladiator's Silk Armor
    {T, 2718, 16}, -- Crimson Gladiator's Silk Armor
    {T, 2717, 128}, -- Crimson Gladiator's Silk Armor
    {T, 2716, 128}, -- Crimson Gladiator's Silk Armor
    {T, 2715, 35}, -- Crimson Aspirant's Plate Battlegear
    {T, 2714, 35}, -- Drakeender's Battlegear
    {T, 2713, 35}, -- Citadel Breaker's Battlegear
    {T, 2712, 35}, -- Djaradin Dungeon Battlegear
    {T, 2711, 35}, -- Wyrmforged Battlegear
    {T, 2710, 4164}, -- Centaur Dungeon Harness
    {T, 2709, 4164}, -- Nokuhd Regalia
    {T, 2708, 4164}, -- Aylaag Nomad's Regalia
    {T, 2707, 4164}, -- Crimson Aspirant's Chain Armor
    {T, 2706, 4164}, -- Ohn'ahran Falconer's Regalia
    {T, 2705, 400}, -- Lost Watcher's Vestments
    {T, 2704, 400}, -- Tyr Hold Vestments
    {T, 2703, 400}, -- Titan Dungeonkeeper's Vestments
    {T, 2702, 400}, -- Crimson Aspirant's Silk Vestments
    {T, 2701, 400}, -- Cobalt Watcher's Vestments
    {T, 2700, 35}, -- Shorebreaker's Armor
    {T, 2699, 35}, -- Firestorm Armor
    {T, 2698, 35}, -- Crimson Combatant's Draconium Armor
    {T, 2697, 35}, -- Trailblazer's Plate Armor
    {T, 2696, 4164}, -- Hornstrider's Battlegear
    {T, 2695, 4164}, -- Cyclonic Battlegear
    {T, 2694, 4164}, -- Crimson Combatant's Adamant Battlegear
    {T, 2693, 400}, -- Drakewatcher's Armor
    {T, 2692, 4164}, -- Trailblazer's Mail Armor
    {T, 2691, 400}, -- Crimson Combatant's Wildercloth Regalia
    {T, 2690, 400}, -- Cloudburst Regalia
    {T, 2689, 400}, -- Trailblazer's Cloth Armor
    {T, 2688, 3592}, -- Crimson Combatant's Resilient Armor
    {T, 2687, 3592}, -- Dust Devil Armor
    {T, 2686, 3592}, -- Isle Trapper's Gear
    {T, 2685, 3592}, -- Trailblazer's Leather Armor
    {T, 2684, 3592}, -- Tuskarr Field Garb
    {T, 2683, 3592}, -- Tuskarr Dungeoneer's Garb
    {T, 2682, 3592}, -- Crimson Aspirant's Battlegarb
    {T, 2681, 3592}, -- Ottuk Hide Armor
    {T, 2675, 4164}, -- Sandshaped Dracthyr Battlegear
    {T, 2674, 4164}, -- Cobalt Dracthyr Battlegear
    {T, 2673, 4164}, -- Crimson Dracthyr Battlegear
    {T, 2672, 4164}, -- Emerald Dracthyr Battlegear
    {T, 2670, 4164}, -- Obsidian Dracthyr Battlegear
    {T, 2668, 35}, -- Drakebreaker
    {T, 2667, 35}, -- Raging Tempest
    {T, 2666, 3592}, -- Drakebreaker
    {T, 2665, 3592}, -- Raging Tempest
    {T, 2664, 4164}, -- Drakebreaker
    {T, 2663, 4164}, -- Raging Tempest
    {T, 2662, 400}, -- Drakebreaker
    {T, 2661, 400}, -- Raging Tempest
    {T, 2652, 1}, -- Stones of the Walking Mountain
    {T, 2651, 1}, -- Stones of the Walking Mountain
    {T, 2650, 1}, -- Stones of the Walking Mountain
    {T, 2649, 256}, -- Scalesworn Cultist's Habit
    {T, 2648, 256}, -- Scalesworn Cultist's Habit
    {T, 2647, 256}, -- Scalesworn Cultist's Habit
    {T, 2646, 64}, -- Elements of Infused Earth
    {T, 2645, 64}, -- Elements of Infused Earth
    {T, 2644, 64}, -- Elements of Infused Earth
    {T, 2643, 8}, -- Vault Delver's Toolkit
    {T, 2642, 8}, -- Vault Delver's Toolkit
    {T, 2641, 8}, -- Vault Delver's Toolkit
    {T, 2640, 16}, -- Draconic Hierophant's Finery
    {T, 2639, 16}, -- Draconic Hierophant's Finery
    {T, 2638, 16}, -- Draconic Hierophant's Finery
    {T, 2637, 2}, -- Virtuous Silver Cataphract
    {T, 2636, 2}, -- Virtuous Silver Cataphract
    {T, 2635, 2}, -- Virtuous Silver Cataphract
    {T, 2634, 512}, -- Wrappings of the Waking Fist
    {T, 2633, 512}, -- Wrappings of the Waking Fist
    {T, 2632, 512}, -- Wrappings of the Waking Fist
    {T, 2631, 128}, -- Bindings of the Crystal Scholar
    {T, 2630, 128}, -- Bindings of the Crystal Scholar
    {T, 2629, 128}, -- Bindings of the Crystal Scholar
    {T, 2628, 4}, -- Stormwing Harrier's Camouflage
    {T, 2627, 4}, -- Stormwing Harrier's Camouflage
    {T, 2626, 4}, -- Stormwing Harrier's Camouflage
    {T, 2625, 4096}, -- Scales of the Awakened
    {T, 2624, 4096}, -- Scales of the Awakened
    {T, 2623, 4096}, -- Scales of the Awakened
    {T, 2622, 1024}, -- Lost Landcaller's Vesture
    {T, 2621, 1024}, -- Lost Landcaller's Vesture
    {T, 2620, 1024}, -- Lost Landcaller's Vesture
    {T, 2619, 2048}, -- Skybound Avenger's Flightwear
    {T, 2618, 2048}, -- Skybound Avenger's Flightwear
    {T, 2617, 2048}, -- Skybound Avenger's Flightwear
    {T, 2616, 32}, -- Haunted Frostbrood Remains
    {T, 2615, 32}, -- Haunted Frostbrood Remains
    {T, 2614, 32}, -- Haunted Frostbrood Remains
    {T, 2613, 1}, -- Stones of the Walking Mountain
    {T, 2612, 256}, -- Scalesworn Cultist's Habit
    {T, 2611, 64}, -- Elements of Infused Earth
    {T, 2610, 8}, -- Vault Delver's Toolkit
    {T, 2609, 16}, -- Draconic Hierophant's Finery
    {T, 2608, 2}, -- Virtuous Silver Cataphract
    {T, 2607, 512}, -- Wrappings of the Waking Fist
    {T, 2606, 128}, -- Bindings of the Crystal Scholar
    {T, 2605, 4}, -- Stormwing Harrier's Camouflage
    {T, 2604, 4096}, -- Scales of the Awakened
    {T, 2603, 1024}, -- Lost Landcaller's Vesture
    {T, 2602, 2048}, -- Skybound Avenger's Flightwear
    {T, 2601, 32}, -- Haunted Frostbrood Remains
    {T, 2587, 3592}, -- Tuskarr Trader's Garb
    {T, 2580, 1}, -- Eternal Gladiator's Plate Armor
    {T, 2579, 256}, -- Eternal Gladiator's Felweave Armor
    {T, 2578, 64}, -- Eternal Gladiator's Ringmail Armor
    {T, 2577, 8}, -- Eternal Gladiator's Leather Armor
    {T, 2576, 16}, -- Eternal Gladiator's Satin Armor
    {T, 2575, 2}, -- Eternal Gladiator's Scaled Armor
    {T, 2574, 512}, -- Eternal Gladiator's Ironskin Armor
    {T, 2573, 128}, -- Eternal Gladiator's Silk Armor
    {T, 2572, 4}, -- Eternal Gladiator's Chain Armor
    {T, 2571, 1024}, -- Eternal Gladiator's Dragonhide Armor
    {T, 2570, 2048}, -- Eternal Gladiator's Felskin Armor
    {T, 2569, 32}, -- Eternal Gladiator's Dreadplate Armor
    {T, 2568, 35}, -- Eternal Aspirant's Plate
    {T, 2567, 4164}, -- Eternal Aspirant's Chain
    {T, 2566, 3592}, -- Eternal Aspirant's Leathers
    {T, 2565, 400}, -- Eternal Aspirant's Vestment
    {T, 2564, 1}, -- Eternal Gladiator's Plate Armor
    {T, 2558, 256}, -- Eternal Gladiator's Felweave Armor
    {T, 2552, 64}, -- Eternal Gladiator's Ringmail Armor
    {T, 2546, 8}, -- Eternal Gladiator's Leather Armor
    {T, 2540, 16}, -- Eternal Gladiator's Satin Armor
    {T, 2534, 2}, -- Eternal Gladiator's Scaled Armor
    {T, 2528, 512}, -- Eternal Gladiator's Ironskin Armor
    {T, 2522, 128}, -- Eternal Gladiator's Silk Armor
    {T, 2516, 4}, -- Eternal Gladiator's Chain Armor
    {T, 2510, 1024}, -- Eternal Gladiator's Dragonhide Armor
    {T, 2504, 2048}, -- Eternal Gladiator's Felskin Armor
    {T, 2498, 32}, -- Eternal Gladiator's Dreadplate Armor
    {T, 2492, 35}, -- Renowned Expeditioner's Plate Armor
    {T, 2491, 4164}, -- Renowned Expeditioner's Mail Armor
    {T, 2490, 0}, -- Renowned Expeditioner's Leather Armor
    {T, 2489, 400}, -- Renowned Expeditioner's Cloth Armor
    {T, 2419, 1}, -- Cosmic Gladiator's Plate Armor
    {T, 2418, 1}, -- Cosmic Gladiator's Plate Armor
    {T, 2417, 1}, -- Armaments of the Infinite Infantry
    {T, 2416, 1}, -- Armaments of the Infinite Infantry
    {T, 2415, 1}, -- Armaments of the Infinite Infantry
    {T, 2414, 1}, -- Armaments of the Infinite Infantry
    {T, 2413, 256}, -- Cosmic Gladiator's Felweave Armor
    {T, 2412, 256}, -- Cosmic Gladiator's Felweave Armor
    {T, 2411, 256}, -- Shroud of the Demon Star
    {T, 2410, 256}, -- Shroud of the Demon Star
    {T, 2409, 256}, -- Shroud of the Demon Star
    {T, 2408, 256}, -- Shroud of the Demon Star
    {T, 2407, 64}, -- Cosmic Gladiator's Ringmail Armor
    {T, 2406, 64}, -- Cosmic Gladiator's Ringmail Armor
    {T, 2405, 64}, -- Theurgic Starspeaker's Regalia
    {T, 2404, 64}, -- Theurgic Starspeaker's Regalia
    {T, 2403, 64}, -- Theurgic Starspeaker's Regalia
    {T, 2402, 64}, -- Theurgic Starspeaker's Regalia
    {T, 2401, 8}, -- Cosmic Gladiator's Leather Armor
    {T, 2400, 8}, -- Cosmic Gladiator's Leather Armor
    {T, 2399, 8}, -- Soulblade Shadowhide
    {T, 2398, 8}, -- Soulblade Shadowhide
    {T, 2397, 8}, -- Soulblade Shadowhide
    {T, 2396, 8}, -- Soulblade Shadowhide
    {T, 2395, 16}, -- Cosmic Gladiator's Satin Armor
    {T, 2394, 16}, -- Cosmic Gladiator's Satin Armor
    {T, 2393, 16}, -- Habiliments of the Empyrean
    {T, 2392, 16}, -- Habiliments of the Empyrean
    {T, 2391, 16}, -- Habiliments of the Empyrean
    {T, 2390, 16}, -- Habiliments of the Empyrean
    {T, 2389, 2}, -- Cosmic Gladiator's Scaled Armor
    {T, 2388, 2}, -- Cosmic Gladiator's Scaled Armor
    {T, 2387, 2}, -- Luminous Chevalier's Gallantry
    {T, 2386, 2}, -- Luminous Chevalier's Gallantry
    {T, 2385, 2}, -- Luminous Chevalier's Gallantry
    {T, 2384, 2}, -- Luminous Chevalier's Gallantry
    {T, 2383, 512}, -- Cosmic Gladiator's Ironskin Armor
    {T, 2382, 512}, -- Cosmic Gladiator's Ironskin Armor
    {T, 2381, 512}, -- Garb of the Grand Upwelling
    {T, 2380, 512}, -- Garb of the Grand Upwelling
    {T, 2379, 512}, -- Garb of the Grand Upwelling
    {T, 2378, 512}, -- Garb of the Grand Upwelling
    {T, 2377, 128}, -- Cosmic Gladiator's Silk Armor
    {T, 2376, 128}, -- Cosmic Gladiator's Silk Armor
    {T, 2375, 128}, -- Erudite Occultist's Vestments
    {T, 2374, 128}, -- Erudite Occultist's Vestments
    {T, 2373, 128}, -- Erudite Occultist's Vestments
    {T, 2372, 128}, -- Erudite Occultist's Vestments
    {T, 2371, 4}, -- Cosmic Gladiator's Chain Armor
    {T, 2370, 4}, -- Cosmic Gladiator's Chain Armor
    {T, 2369, 4}, -- Godstalker's Battlegear
    {T, 2368, 4}, -- Godstalker's Battlegear
    {T, 2367, 4}, -- Godstalker's Battlegear
    {T, 2366, 4}, -- Godstalker's Battlegear
    {T, 2365, 1024}, -- Cosmic Gladiator's Dragonhide Armor
    {T, 2364, 1024}, -- Cosmic Gladiator's Dragonhide Armor
    {T, 2363, 1024}, -- Tapestry of the Fixed Stars
    {T, 2362, 1024}, -- Tapestry of the Fixed Stars
    {T, 2361, 1024}, -- Tapestry of the Fixed Stars
    {T, 2360, 1024}, -- Tapestry of the Fixed Stars
    {T, 2359, 2048}, -- Cosmic Gladiator's Felskin Armor
    {T, 2358, 2048}, -- Cosmic Gladiator's Felskin Armor
    {T, 2357, 2048}, -- Mercurial Punisher's Painweave
    {T, 2356, 2048}, -- Mercurial Punisher's Painweave
    {T, 2355, 2048}, -- Mercurial Punisher's Painweave
    {T, 2354, 2048}, -- Mercurial Punisher's Painweave
    {T, 2353, 32}, -- Cosmic Gladiator's Dreadplate Armor
    {T, 2352, 32}, -- Cosmic Gladiator's Dreadplate Armor
    {T, 2351, 32}, -- The First Eidolon's Soulsteel
    {T, 2350, 32}, -- The First Eidolon's Soulsteel
    {T, 2349, 32}, -- The First Eidolon's Soulsteel
    {T, 2348, 32}, -- The First Eidolon's Soulsteel
    {T, 2319, 35}, -- Cosmic Aspirant's Plate
    {T, 2318, 68}, -- Cosmic Aspirant's Chain
    {T, 2317, 3592}, -- Cosmic Aspirant's Leathers
    {T, 2316, 400}, -- Cosmic Aspirant's Vestment
    {T, 2305, 1}, -- Titanic Onslaught Armor
    {T, 2304, 256}, -- Diabolic Raiment
    {T, 2303, 64}, -- Regalia of the Skybreaker
    {T, 2302, 8}, -- Fanged Slayer's Armor
    {T, 2301, 16}, -- Vestments of Blind Absolution
    {T, 2300, 2}, -- Radiant Lightbringer Armor
    {T, 2299, 512}, -- Xuen's Battlegear
    {T, 2298, 128}, -- Regalia of the Arcane Tempest
    {T, 2297, 4}, -- Wildstalker Armor
    {T, 2296, 1024}, -- Stormheart Raiment
    {T, 2295, 2048}, -- Demonbane Armor
    {T, 2294, 32}, -- Gravewarden Armaments
    {T, 2265, 400}, -- Dark Supplicant's Garb
    {T, 2264, 400}, -- Dark Supplicant's Garb
    {T, 2263, 400}, -- Dark Supplicant's Garb
    {T, 2262, 400}, -- Dark Supplicant's Garb
    {T, 2261, 3592}, -- Sanctum Assailant's Trappings
    {T, 2260, 3592}, -- Sanctum Assailant's Trappings
    {T, 2259, 3592}, -- Sanctum Assailant's Trappings
    {T, 2258, 3592}, -- Sanctum Assailant's Trappings
    {T, 2257, 68}, -- Tower Ascendant's Battlegear
    {T, 2256, 68}, -- Tower Ascendant's Battlegear
    {T, 2255, 68}, -- Tower Ascendant's Battlegear
    {T, 2254, 68}, -- Tower Ascendant's Battlegear
    {T, 2253, 35}, -- Soulforged Dreadplate
    {T, 2252, 35}, -- Soulforged Dreadplate
    {T, 2251, 35}, -- Soulforged Dreadplate
    {T, 2250, 35}, -- Soulforged Dreadplate
    {T, 2249, 35}, -- Unchained Aspirant's Plate
    {T, 2248, 68}, -- Unchained Aspirant's Chain
    {T, 2247, 3592}, -- Unchained Aspirant's Leathers
    {T, 2246, 400}, -- Unchained Aspirant's Vestment
    {T, 2231, 35}, -- Unchained Gladiator's Plate
    {T, 2230, 68}, -- Unchained Gladiator's Chain
    {T, 2229, 3592}, -- Unchained Gladiator's Leathers
    {T, 2228, 400}, -- Unchained Gladiator's Vestment
    {T, 2227, 35}, -- Unchained Gladiator's Plate
    {T, 2226, 68}, -- Unchained Gladiator's Chain
    {T, 2225, 3592}, -- Unchained Gladiator's Leathers
    {T, 2224, 400}, -- Unchained Gladiator's Vestment
    {T, 2177, 35}, -- Sinful Aspirant's Plate
    {T, 2176, 68}, -- Sinful Aspirant's Chain
    {T, 2175, 3592}, -- Sinful Aspirant's Leathers
    {T, 2174, 400}, -- Sinful Aspirant's Vestment
    {T, 2173, 35}, -- Sinful Gladiator's Plate
    {T, 2172, 68}, -- Sinful Gladiator's Chain
    {T, 2171, 3592}, -- Sinful Gladiator's Leathers
    {T, 2170, 400}, -- Sinful Gladiator's Vestment
    {T, 2169, 35}, -- Sinful Gladiator's Plate
    {T, 2168, 68}, -- Sinful Gladiator's Chain
    {T, 2167, 3592}, -- Sinful Gladiator's Leathers
    {T, 2166, 400}, -- Sinful Gladiator's Vestment
    {T, 2165, 3592}, -- Sin Slayer's Leathers
    {T, 2164, 3592}, -- Sin Slayer's Leathers
    {T, 2163, 3592}, -- Sin Slayer's Leathers
    {T, 2162, 3592}, -- Sin Slayer's Leathers
    {T, 2161, 400}, -- Depraved Beguiler's Visage
    {T, 2160, 400}, -- Depraved Beguiler's Visage
    {T, 2159, 400}, -- Depraved Beguiler's Visage
    {T, 2158, 400}, -- Depraved Beguiler's Visage
    {T, 2157, 68}, -- Inexorable Castigator's Guise
    {T, 2156, 68}, -- Inexorable Castigator's Guise
    {T, 2155, 68}, -- Inexorable Castigator's Guise
    {T, 2154, 68}, -- Inexorable Castigator's Guise
    {T, 2153, 35}, -- Grand Sentinel's Greatplate
    {T, 2152, 35}, -- Grand Sentinel's Greatplate
    {T, 2151, 35}, -- Grand Sentinel's Greatplate
    {T, 2150, 35}, -- Grand Sentinel's Greatplate
    {T, 1997, 400}, -- Oblivion Cultist's Robes
    {T, 1996, 400}, -- Oblivion Cultist's Robes
    {T, 1995, 400}, -- Oblivion Cultist's Robes
    {T, 1994, 400}, -- Oblivion Cultist's Robes
    {T, 1993, 3592}, -- Treacherous Schemer's Leathers
    {T, 1992, 3592}, -- Treacherous Schemer's Leathers
    {T, 1991, 3592}, -- Treacherous Schemer's Leathers
    {T, 1990, 3592}, -- Treacherous Schemer's Leathers
    {T, 1989, 68}, -- Lurking Defiler's Scalemail
    {T, 1988, 68}, -- Lurking Defiler's Scalemail
    {T, 1987, 68}, -- Lurking Defiler's Scalemail
    {T, 1986, 68}, -- Lurking Defiler's Scalemail
    {T, 1985, 35}, -- Cosmic Aberration's Plate
    {T, 1984, 35}, -- Cosmic Aberration's Plate
    {T, 1983, 35}, -- Cosmic Aberration's Plate
    {T, 1982, 35}, -- Cosmic Aberration's Plate
    {T, 1975, 400}, -- Corrupted Gladiator's Vestment
    {T, 1974, 3592}, -- Corrupted Gladiator's Leathers
    {T, 1973, 68}, -- Corrupted Gladiator's Chain
    {T, 1972, 35}, -- Corrupted Gladiator's Plate
    {T, 1969, 400}, -- Corrupted Gladiator's Vestment
    {T, 1968, 400}, -- Corrupted Gladiator's Vestment
    {T, 1963, 3592}, -- Corrupted Gladiator's Leathers
    {T, 1962, 3592}, -- Corrupted Gladiator's Leathers
    {T, 1957, 68}, -- Corrupted Gladiator's Chain
    {T, 1956, 68}, -- Corrupted Gladiator's Chain
    {T, 1951, 35}, -- Corrupted Gladiator's Plate
    {T, 1950, 35}, -- Corrupted Gladiator's Plate
    {T, 1897, 400}, -- Notorious Gladiator's Vestment
    {T, 1896, 400}, -- Notorious Gladiator's Vestment
    {T, 1892, 400}, -- Notorious Aspirant's Vestment
    {T, 1891, 3592}, -- Notorious Gladiator's Leathers
    {T, 1890, 3592}, -- Notorious Gladiator's Leathers
    {T, 1886, 3592}, -- Notorious Aspirant's Leathers
    {T, 1885, 68}, -- Notorious Gladiator's Chain
    {T, 1884, 68}, -- Notorious Gladiator's Chain
    {T, 1880, 68}, -- Notorious Aspirant's Chain
    {T, 1879, 35}, -- Notorious Gladiator's Plate
    {T, 1878, 35}, -- Notorious Gladiator's Plate
    {T, 1874, 35}, -- Notorious Aspirant's Plate
    {T, 1869, 35}, -- Notorious Aspirant's Plate
    {T, 1865, 35}, -- Notorious Gladiator's Plate
    {T, 1864, 35}, -- Notorious Gladiator's Plate
    {T, 1863, 68}, -- Notorious Aspirant's Chain
    {T, 1859, 68}, -- Notorious Gladiator's Chain
    {T, 1858, 68}, -- Notorious Gladiator's Chain
    {T, 1857, 3592}, -- Notorious Aspirant's Leathers
    {T, 1853, 3592}, -- Notorious Gladiator's Leathers
    {T, 1852, 3592}, -- Notorious Gladiator's Leathers
    {T, 1851, 400}, -- Notorious Aspirant's Vestment
    {T, 1847, 400}, -- Notorious Gladiator's Vestment
    {T, 1846, 400}, -- Notorious Gladiator's Vestment
    {T, 1845, 400}, -- Frilled Harbinger's Vestments
    {T, 1844, 3592}, -- Razorfin Regalia
    {T, 1843, 68}, -- Queen's Guard Scalemail
    {T, 1842, 35}, -- Naga Lord's Warplate
    {T, 1841, 400}, -- Frilled Harbinger's Vestments
    {T, 1840, 3592}, -- Razorfin Regalia
    {T, 1839, 68}, -- Queen's Guard Scalemail
    {T, 1838, 35}, -- Naga Lord's Warplate
    {T, 1837, 400}, -- Frilled Harbinger's Vestments
    {T, 1836, 3592}, -- Razorfin Regalia
    {T, 1835, 68}, -- Queen's Guard Scalemail
    {T, 1834, 35}, -- Naga Lord's Warplate
    {T, 1833, 400}, -- Frilled Harbinger's Vestments
    {T, 1832, 3592}, -- Razorfin Regalia
    {T, 1831, 68}, -- Queen's Guard Scalemail
    {T, 1830, 35}, -- Naga Lord's Warplate
    {T, 1821, 35}, -- Gravelord's Direplate
    {T, 1820, 35}, -- Gravelord's Direplate
    {T, 1819, 35}, -- Gravelord's Direplate
    {T, 1818, 35}, -- Gravelord's Direplate
    {T, 1817, 68}, -- Death-Devourer Vestments
    {T, 1816, 68}, -- Death-Devourer Vestments
    {T, 1815, 68}, -- Death-Devourer Vestments
    {T, 1814, 68}, -- Death-Devourer Vestments
    {T, 1813, 3592}, -- Boneblade Battlegear
    {T, 1812, 3592}, -- Boneblade Battlegear
    {T, 1811, 3592}, -- Boneblade Battlegear
    {T, 1810, 3592}, -- Boneblade Battlegear
    {T, 1809, 400}, -- Soul Reaper's Raiment
    {T, 1808, 400}, -- Soul Reaper's Raiment
    {T, 1807, 400}, -- Soul Reaper's Raiment
    {T, 1806, 400}, -- Soul Reaper's Raiment
    {T, 1802, 400}, -- Sinister Gladiator's Vestment
    {T, 1801, 400}, -- Sinister Gladiator's Vestment
    {T, 1797, 400}, -- Sinister Aspirant's Vestment
    {T, 1796, 400}, -- Moonpriest's Vestments
    {T, 1795, 3592}, -- Sinister Gladiator's Leathers
    {T, 1794, 3592}, -- Sinister Gladiator's Leathers
    {T, 1790, 3592}, -- Sinister Aspirant's Leathers
    {T, 1789, 3592}, -- Darkwood Sentinel's Guise
    {T, 1788, 68}, -- Sinister Gladiator's Chain
    {T, 1787, 68}, -- Sinister Gladiator's Chain
    {T, 1783, 68}, -- Sinister Aspirant's Chain
    {T, 1782, 68}, -- Kaldorei Archer's Chainmail
    {T, 1781, 35}, -- Sinister Gladiator's Plate
    {T, 1780, 35}, -- Sinister Gladiator's Plate
    {T, 1776, 35}, -- Sinister Aspirant's Plate
    {T, 1775, 35}, -- Wardenguard's Battleplate
    {T, 1772, 400}, -- Sinister Gladiator's Vestment
    {T, 1771, 400}, -- Sinister Gladiator's Vestment
    {T, 1767, 400}, -- Sinister Aspirant's Vestment
    {T, 1766, 400}, -- Plaguebringer's Raiment
    {T, 1765, 3592}, -- Sinister Gladiator's Leathers
    {T, 1764, 3592}, -- Sinister Gladiator's Leathers
    {T, 1760, 3592}, -- Sinister Aspirant's Leathers
    {T, 1759, 3592}, -- Deathstalker's Guise
    {T, 1758, 68}, -- Sinister Gladiator's Chain
    {T, 1757, 68}, -- Sinister Gladiator's Chain
    {T, 1753, 68}, -- Sinister Aspirant's Chain
    {T, 1752, 68}, -- Blightguard's Chains
    {T, 1751, 35}, -- Sinister Gladiator's Plate
    {T, 1750, 35}, -- Sinister Gladiator's Plate
    {T, 1746, 35}, -- Sinister Aspirant's Plate
    {T, 1745, 35}, -- Deathguard's Battleplate
    {T, 1738, 400}, -- Dread Gladiator's Vestment
    {T, 1737, 3592}, -- Dread Gladiator's Leathers
    {T, 1736, 68}, -- Dread Gladiator's Chain
    {T, 1735, 35}, -- Dread Gladiator's Plate
    {T, 1734, 400}, -- Dread Gladiator's Vestment
    {T, 1733, 3592}, -- Dread Gladiator's Leathers
    {T, 1732, 68}, -- Dread Gladiator's Chain
    {T, 1731, 35}, -- Dread Gladiator's Plate
    {T, 1677, 35}, -- Honorbound Centurion's Plate
    {T, 1676, 35}, -- Dread Aspirant's Plate
    {T, 1675, 35}, -- Dread Gladiator's Plate
    {T, 1674, 68}, -- Honorbound Vanguard's Chain
    {T, 1673, 68}, -- Dread Aspirant's Chain
    {T, 1672, 68}, -- Dread Gladiator's Chain
    {T, 1671, 3592}, -- Honorbound Outrider's Leathers
    {T, 1670, 3592}, -- Dread Aspirant's Leathers
    {T, 1669, 3592}, -- Dread Gladiator's Leathers
    {T, 1668, 400}, -- Honorbound Artificer's Vestment
    {T, 1667, 400}, -- Dread Aspirant's Vestment
    {T, 1666, 400}, -- Dread Gladiator's Vestment
    {T, 1665, 35}, -- 7th Legionnaire's Plate
    {T, 1664, 35}, -- Dread Aspirant's Plate
    {T, 1663, 35}, -- Dread Gladiator's Plate
    {T, 1662, 68}, -- 7th Legionnaire's Chain
    {T, 1661, 68}, -- Dread Aspirant's Chain
    {T, 1660, 68}, -- Dread Gladiator's Chain
    {T, 1659, 3592}, -- 7th Legionnaire's Leathers
    {T, 1658, 3592}, -- Dread Aspirant's Leathers
    {T, 1657, 3592}, -- Dread Gladiator's Leathers
    {T, 1656, 400}, -- 7th Legionnaire's Vestment
    {T, 1655, 400}, -- Dread Aspirant's Vestment
    {T, 1654, 400}, -- Dread Gladiator's Vestment
    {T, 1653, 35}, -- Eternal Curator's Protectorate
    {T, 1652, 35}, -- Eternal Curator's Protectorate
    {T, 1651, 35}, -- Eternal Curator's Protectorate
    {T, 1650, 35}, -- Eternal Curator's Protectorate
    {T, 1649, 68}, -- Eternal Curator's Chains
    {T, 1648, 68}, -- Eternal Curator's Chains
    {T, 1647, 68}, -- Eternal Curator's Chains
    {T, 1646, 68}, -- Eternal Curator's Chains
    {T, 1645, 3592}, -- Eternal Curator's Garb
    {T, 1644, 3592}, -- Eternal Curator's Garb
    {T, 1643, 3592}, -- Eternal Curator's Garb
    {T, 1642, 3592}, -- Eternal Curator's Garb
    {T, 1641, 400}, -- Eternal Curator's Vestment
    {T, 1640, 400}, -- Eternal Curator's Vestment
    {T, 1639, 400}, -- Eternal Curator's Vestment
    {T, 1638, 400}, -- Eternal Curator's Vestment
    {T, 1519, 1}, -- Juggernaut Battlegear
    {T, 1518, 1}, -- Juggernaut Battlegear
    {T, 1517, 1}, -- Juggernaut Battlegear
    {T, 1516, 1}, -- Juggernaut Battlegear
    {T, 1515, 256}, -- Grim Inquisitor's Regalia
    {T, 1514, 256}, -- Grim Inquisitor's Regalia
    {T, 1513, 256}, -- Grim Inquisitor's Regalia
    {T, 1512, 256}, -- Grim Inquisitor's Regalia
    {T, 1511, 64}, -- Garb of Venerated Spirits
    {T, 1510, 64}, -- Garb of Venerated Spirits
    {T, 1509, 64}, -- Garb of Venerated Spirits
    {T, 1508, 64}, -- Garb of Venerated Spirits
    {T, 1507, 8}, -- Regalia of the Dashing Scoundrel
    {T, 1506, 8}, -- Regalia of the Dashing Scoundrel
    {T, 1505, 8}, -- Regalia of the Dashing Scoundrel
    {T, 1504, 8}, -- Regalia of the Dashing Scoundrel
    {T, 1503, 16}, -- Gilded Seraph's Raiment
    {T, 1502, 16}, -- Gilded Seraph's Raiment
    {T, 1501, 16}, -- Gilded Seraph's Raiment
    {T, 1500, 16}, -- Gilded Seraph's Raiment
    {T, 1499, 2}, -- Light's Vanguard Battleplate
    {T, 1498, 2}, -- Light's Vanguard Battleplate
    {T, 1497, 2}, -- Light's Vanguard Battleplate
    {T, 1496, 2}, -- Light's Vanguard Battleplate
    {T, 1495, 512}, -- Chi-Ji's Battlegear
    {T, 1494, 512}, -- Chi-Ji's Battlegear
    {T, 1493, 512}, -- Chi-Ji's Battlegear
    {T, 1492, 512}, -- Chi-Ji's Battlegear
    {T, 1491, 128}, -- Runebound Regalia
    {T, 1490, 128}, -- Runebound Regalia
    {T, 1489, 128}, -- Runebound Regalia
    {T, 1488, 128}, -- Runebound Regalia
    {T, 1487, 4}, -- Serpentstalker Guise
    {T, 1486, 4}, -- Serpentstalker Guise
    {T, 1485, 4}, -- Serpentstalker Guise
    {T, 1484, 4}, -- Serpentstalker Guise
    {T, 1483, 1024}, -- Bearmantle Battlegear
    {T, 1482, 1024}, -- Bearmantle Battlegear
    {T, 1481, 1024}, -- Bearmantle Battlegear
    {T, 1480, 1024}, -- Bearmantle Battlegear
    {T, 1479, 2048}, -- Felreaper Vestments
    {T, 1478, 2048}, -- Felreaper Vestments
    {T, 1477, 2048}, -- Felreaper Vestments
    {T, 1476, 2048}, -- Felreaper Vestments
    {T, 1475, 32}, -- Dreadwake Armor
    {T, 1474, 32}, -- Dreadwake Armor
    {T, 1473, 32}, -- Dreadwake Armor
    {T, 1472, 32}, -- Dreadwake Armor
    {T, 1423, 1}, -- Fierce Gladiator's Plate Armor
    {T, 1422, 1}, -- Fierce Gladiator's Plate Armor
    {T, 1421, 256}, -- Fierce Gladiator's Felweave Armor
    {T, 1420, 256}, -- Fierce Gladiator's Felweave Armor
    {T, 1419, 64}, -- Fierce Gladiator's Ringmail Armor
    {T, 1418, 64}, -- Fierce Gladiator's Ringmail Armor
    {T, 1417, 8}, -- Fierce Gladiator's Leather Armor
    {T, 1416, 8}, -- Fierce Gladiator's Leather Armor
    {T, 1415, 16}, -- Fierce Gladiator's Satin Armor
    {T, 1414, 16}, -- Fierce Gladiator's Satin Armor
    {T, 1413, 2}, -- Fierce Gladiator's Scaled Armor
    {T, 1412, 2}, -- Fierce Gladiator's Scaled Armor
    {T, 1411, 512}, -- Fierce Gladiator's Ironskin Armor
    {T, 1410, 512}, -- Fierce Gladiator's Ironskin Armor
    {T, 1409, 128}, -- Fierce Gladiator's Silk Armor
    {T, 1408, 128}, -- Fierce Gladiator's Silk Armor
    {T, 1407, 4}, -- Fierce Gladiator's Chain Armor
    {T, 1406, 4}, -- Fierce Gladiator's Chain Armor
    {T, 1405, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {T, 1404, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {T, 1403, 2048}, -- Fierce Gladiator's Felskin Armor
    {T, 1402, 2048}, -- Fierce Gladiator's Felskin Armor
    {T, 1401, 32}, -- Fierce Gladiator's Dreadplate Armor
    {T, 1400, 32}, -- Fierce Gladiator's Dreadplate Armor
    {T, 1399, 1}, -- Fierce Gladiator's Plate Armor
    {T, 1398, 1}, -- Fierce Gladiator's Plate Armor
    {T, 1397, 256}, -- Fierce Gladiator's Felweave Armor
    {T, 1396, 256}, -- Fierce Gladiator's Felweave Armor
    {T, 1395, 64}, -- Fierce Gladiator's Ringmail Armor
    {T, 1394, 64}, -- Fierce Gladiator's Ringmail Armor
    {T, 1393, 8}, -- Fierce Gladiator's Leather Armor
    {T, 1392, 8}, -- Fierce Gladiator's Leather Armor
    {T, 1391, 16}, -- Fierce Gladiator's Satin Armor
    {T, 1390, 16}, -- Fierce Gladiator's Satin Armor
    {T, 1389, 2}, -- Fierce Gladiator's Scaled Armor
    {T, 1388, 2}, -- Fierce Gladiator's Scaled Armor
    {T, 1387, 512}, -- Fierce Gladiator's Ironskin Armor
    {T, 1386, 512}, -- Fierce Gladiator's Ironskin Armor
    {T, 1385, 128}, -- Fierce Gladiator's Silk Armor
    {T, 1384, 128}, -- Fierce Gladiator's Silk Armor
    {T, 1383, 4}, -- Fierce Gladiator's Chain Armor
    {T, 1382, 4}, -- Fierce Gladiator's Chain Armor
    {T, 1381, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {T, 1380, 1024}, -- Fierce Gladiator's Dragonhide Armor
    {T, 1379, 1}, -- Fierce Combatant's Plate Armor
    {T, 1378, 1}, -- Fierce Combatant's Plate Armor
    {T, 1377, 256}, -- Fierce Combatant's Felweave Armor
    {T, 1376, 256}, -- Fierce Combatant's Felweave Armor
    {T, 1375, 64}, -- Fierce Combatant's Ringmail Armor
    {T, 1374, 64}, -- Fierce Combatant's Ringmail Armor
    {T, 1373, 8}, -- Fierce Combatant's Leather Armor
    {T, 1372, 8}, -- Fierce Combatant's Leather Armor
    {T, 1371, 16}, -- Fierce Combatant's Satin Armor
    {T, 1370, 16}, -- Fierce Combatant's Satin Armor
    {T, 1369, 2}, -- Fierce Combatant's Scaled Armor
    {T, 1368, 2}, -- Fierce Combatant's Scaled Armor
    {T, 1367, 512}, -- Fierce Combatant's Ironskin Armor
    {T, 1366, 512}, -- Fierce Combatant's Ironskin Armor
    {T, 1365, 128}, -- Fierce Combatant's Silk Armor
    {T, 1364, 128}, -- Fierce Combatant's Silk Armor
    {T, 1363, 4}, -- Fierce Combatant's Chain Armor
    {T, 1362, 4}, -- Fierce Combatant's Chain Armor
    {T, 1361, 1024}, -- Fierce Combatant's Dragonhide Armor
    {T, 1360, 1024}, -- Fierce Combatant's Dragonhide Armor
    {T, 1359, 2048}, -- Fierce Gladiator's Felskin Armor
    {T, 1358, 2048}, -- Fierce Gladiator's Felskin Armor
    {T, 1355, 2048}, -- Fierce Combatant's Felskin Armor
    {T, 1354, 2048}, -- Fierce Combatant's Felskin Armor
    {T, 1353, 32}, -- Fierce Gladiator's Dreadplate Armor
    {T, 1352, 32}, -- Fierce Gladiator's Dreadplate Armor
    {T, 1349, 32}, -- Fierce Combatant's Dreadplate Armor
    {T, 1348, 32}, -- Fierce Combatant's Dreadplate Armor
    {T, 1343, 16}, -- Warmongering Gladiator's Satin Armor Boogaloo
    {T, 1342, 16}, -- Vestments of Blind Absolution
    {T, 1340, 32}, -- Gravewarden Armaments
    {T, 1339, 32}, -- Gravewarden Armaments
    {T, 1338, 32}, -- Gravewarden Armaments
    {T, 1337, 32}, -- Gravewarden Armaments
    {T, 1336, 2048}, -- Demonbane Armor
    {T, 1335, 2048}, -- Demonbane Armor
    {T, 1334, 2048}, -- Demonbane Armor
    {T, 1333, 2048}, -- Demonbane Armor
    {T, 1332, 1024}, -- Stormheart Raiment
    {T, 1331, 1024}, -- Stormheart Raiment
    {T, 1330, 1024}, -- Stormheart Raiment
    {T, 1329, 1024}, -- Stormheart Raiment
    {T, 1328, 4}, -- Wildstalker Armor
    {T, 1327, 4}, -- Wildstalker Armor
    {T, 1326, 4}, -- Wildstalker Armor
    {T, 1325, 4}, -- Wildstalker Armor
    {T, 1324, 128}, -- Regalia of the Arcane Tempest
    {T, 1323, 128}, -- Regalia of the Arcane Tempest
    {T, 1322, 128}, -- Regalia of the Arcane Tempest
    {T, 1321, 128}, -- Regalia of the Arcane Tempest
    {T, 1320, 512}, -- Xuen's Battlegear
    {T, 1319, 512}, -- Xuen's Battlegear
    {T, 1318, 512}, -- Xuen's Battlegear
    {T, 1317, 512}, -- Xuen's Battlegear
    {T, 1316, 2}, -- Radiant Lightbringer Armor
    {T, 1315, 2}, -- Radiant Lightbringer Armor
    {T, 1314, 2}, -- Radiant Lightbringer Armor
    {T, 1313, 2}, -- Radiant Lightbringer Armor
    {T, 1312, 16}, -- Vestments of Blind Absolution
    {T, 1310, 16}, -- Vestments of Blind Absolution
    {T, 1309, 16}, -- Vestments of Blind Absolution
    {T, 1308, 8}, -- Fanged Slayer's Armor
    {T, 1307, 8}, -- Fanged Slayer's Armor
    {T, 1306, 8}, -- Fanged Slayer's Armor
    {T, 1305, 8}, -- Fanged Slayer's Armor
    {T, 1304, 64}, -- Regalia of the Skybreaker
    {T, 1303, 64}, -- Regalia of the Skybreaker
    {T, 1302, 64}, -- Regalia of the Skybreaker
    {T, 1301, 64}, -- Regalia of the Skybreaker
    {T, 1300, 256}, -- Diabolic Raiment
    {T, 1299, 256}, -- Diabolic Raiment
    {T, 1298, 256}, -- Diabolic Raiment
    {T, 1297, 256}, -- Diabolic Raiment
    {T, 1296, 1}, -- Titanic Onslaught Armor
    {T, 1295, 1}, -- Titanic Onslaught Armor
    {T, 1294, 1}, -- Titanic Onslaught Armor
    {T, 1293, 1}, -- Titanic Onslaught Armor
    {T, 1292, 32}, -- Cruel Combatant's Dreadplate Armor
    {T, 1291, 32}, -- Cruel Combatant's Dreadplate Armor
    {T, 1290, 2048}, -- Cruel Combatant's Felskin Armor
    {T, 1289, 2048}, -- Cruel Combatant's Felskin Armor
    {T, 1288, 1024}, -- Cruel Combatant's Dragonhide Armor
    {T, 1287, 1024}, -- Cruel Combatant's Dragonhide Armor
    {T, 1286, 4}, -- Cruel Combatant's Chain Armor
    {T, 1285, 4}, -- Cruel Combatant's Chain Armor
    {T, 1284, 128}, -- Cruel Combatant's Silk Armor
    {T, 1283, 128}, -- Cruel Combatant's Silk Armor
    {T, 1282, 512}, -- Cruel Combatant's Ironskin Armor
    {T, 1281, 512}, -- Cruel Combatant's Ironskin Armor
    {T, 1280, 2}, -- Cruel Combatant's Scaled Armor
    {T, 1279, 2}, -- Cruel Combatant's Scaled Armor
    {T, 1278, 16}, -- Cruel Combatant's Satin Armor
    {T, 1277, 16}, -- Cruel Combatant's Satin Armor
    {T, 1276, 8}, -- Cruel Combatant's Leather Armor
    {T, 1275, 8}, -- Cruel Combatant's Leather Armor
    {T, 1274, 64}, -- Cruel Combatant's Ringmail Armor
    {T, 1273, 64}, -- Cruel Combatant's Ringmail Armor
    {T, 1272, 256}, -- Cruel Combatant's Felweave Armor
    {T, 1271, 256}, -- Cruel Combatant's Felweave Armor
    {T, 1270, 1}, -- Cruel Combatant's Plate Armor
    {T, 1269, 1}, -- Cruel Combatant's Plate Armor
    {T, 1268, 32}, -- Cruel Gladiator's Dreadplate Armor
    {T, 1267, 32}, -- Cruel Gladiator's Dreadplate Armor
    {T, 1266, 32}, -- Cruel Gladiator's Dreadplate Armor
    {T, 1265, 32}, -- Cruel Gladiator's Dreadplate Armor
    {T, 1264, 2048}, -- Cruel Gladiator's Felskin Armor
    {T, 1263, 2048}, -- Cruel Gladiator's Felskin Armor
    {T, 1262, 2048}, -- Cruel Gladiator's Felskin Armor
    {T, 1261, 2048}, -- Cruel Gladiator's Felskin Armor
    {T, 1260, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {T, 1259, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {T, 1258, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {T, 1257, 1024}, -- Cruel Gladiator's Dragonhide Armor
    {T, 1256, 4}, -- Cruel Gladiator's Chain Armor
    {T, 1255, 4}, -- Cruel Gladiator's Chain Armor
    {T, 1254, 4}, -- Cruel Gladiator's Chain Armor
    {T, 1253, 4}, -- Cruel Gladiator's Chain Armor
    {T, 1252, 128}, -- Cruel Gladiator's Silk Armor
    {T, 1251, 128}, -- Cruel Gladiator's Silk Armor
    {T, 1250, 128}, -- Cruel Gladiator's Silk Armor
    {T, 1249, 128}, -- Cruel Gladiator's Silk Armor
    {T, 1248, 512}, -- Cruel Gladiator's Ironskin Armor
    {T, 1247, 512}, -- Cruel Gladiator's Ironskin Armor
    {T, 1246, 512}, -- Cruel Gladiator's Ironskin Armor
    {T, 1245, 512}, -- Cruel Gladiator's Ironskin Armor
    {T, 1244, 2}, -- Cruel Gladiator's Scaled Armor
    {T, 1243, 2}, -- Cruel Gladiator's Scaled Armor
    {T, 1242, 2}, -- Cruel Gladiator's Scaled Armor
    {T, 1241, 2}, -- Cruel Gladiator's Scaled Armor
    {T, 1240, 8}, -- Cruel Gladiator's Leather Armor
    {T, 1239, 8}, -- Cruel Gladiator's Leather Armor
    {T, 1238, 8}, -- Cruel Gladiator's Leather Armor
    {T, 1237, 8}, -- Cruel Gladiator's Leather Armor
    {T, 1236, 64}, -- Cruel Gladiator's Ringmail Armor
    {T, 1235, 64}, -- Cruel Gladiator's Ringmail Armor
    {T, 1234, 64}, -- Cruel Gladiator's Ringmail Armor
    {T, 1233, 64}, -- Cruel Gladiator's Ringmail Armor
    {T, 1232, 256}, -- Cruel Gladiator's Felweave Armor
    {T, 1231, 256}, -- Cruel Gladiator's Felweave Armor
    {T, 1230, 256}, -- Cruel Gladiator's Felweave Armor
    {T, 1229, 256}, -- Cruel Gladiator's Felweave Armor
    {T, 1228, 1}, -- Cruel Gladiator's Plate Armor
    {T, 1227, 1}, -- Cruel Gladiator's Plate Armor
    {T, 1226, 1}, -- Cruel Gladiator's Plate Armor
    {T, 1225, 1}, -- Cruel Gladiator's Plate Armor
    {T, 1223, 1}, -- Warmongering Gladiator's Plate Armor
    {T, 1222, 1}, -- Warmongering Gladiator's Plate Armor
    {T, 1221, 256}, -- Warmongering Gladiator's Felweave Armor
    {T, 1220, 256}, -- Warmongering Gladiator's Felweave Armor
    {T, 1219, 64}, -- Warmongering Gladiator's Ringmail Armor
    {T, 1218, 64}, -- Warmongering Gladiator's Ringmail Armor
    {T, 1217, 8}, -- Warmongering Gladiator's Leather Armor
    {T, 1216, 8}, -- Warmongering Gladiator's Leather Armor
    {T, 1215, 2}, -- Warmongering Gladiator's Scaled Armor
    {T, 1214, 2}, -- Warmongering Gladiator's Scaled Armor
    {T, 1213, 512}, -- Warmongering Gladiator's Ironskin Armor
    {T, 1212, 512}, -- Warmongering Gladiator's Ironskin Armor
    {T, 1211, 128}, -- Warmongering Gladiator's Silk Armor
    {T, 1210, 128}, -- Warmongering Gladiator's Silk Armor
    {T, 1209, 4}, -- Warmongering Gladiator's Chain Armor
    {T, 1208, 4}, -- Warmongering Gladiator's Chain Armor
    {T, 1207, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {T, 1206, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {T, 1205, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {T, 1204, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {T, 1202, 32}, -- Brutal Gladiator's Dreadplate Armor
    {T, 1201, 32}, -- Bloodthirsty Gladiator's Dreadplate Armor
    {T, 1200, 1024}, -- Bloodthirsty Gladiator's Dragonhide Armor
    {T, 1199, 4}, -- Bloodthirsty Gladiator's Chain Armor
    {T, 1198, 128}, -- Bloodthirsty Gladiator's Silk Armor
    {T, 1197, 2}, -- Bloodthirsty Gladiator's Scaled Armor
    {T, 1196, 8}, -- Bloodthirsty Gladiator's Leather Armor
    {T, 1195, 64}, -- Bloodthirsty Gladiator's Ringmail Armor
    {T, 1194, 256}, -- Bloodthirsty Gladiator's Felweave Armor
    {T, 1193, 1}, -- Bloodthirsty Gladiator's Plate Armor
    {T, 1192, 1}, -- Wild Gladiator's Plate Armor
    {T, 1191, 1}, -- Wild Gladiator's Plate Armor
    {T, 1190, 256}, -- Wild Gladiator's Felweave Armor
    {T, 1189, 256}, -- Wild Gladiator's Felweave Armor
    {T, 1188, 64}, -- Wild Gladiator's Ringmail Armor
    {T, 1187, 64}, -- Wild Gladiator's Ringmail Armor
    {T, 1186, 8}, -- Wild Gladiator's Leather Armor
    {T, 1185, 8}, -- Wild Gladiator's Leather Armor
    {T, 1184, 2}, -- Wild Gladiator's Scaled Paladin
    {T, 1183, 2}, -- Wild Gladiator's Scaled Paladin
    {T, 1182, 512}, -- Wild Gladiator's Ironskin Armor
    {T, 1181, 512}, -- Wild Gladiator's Ironskin Armor
    {T, 1180, 128}, -- Wild Gladiator's Silk Armor
    {T, 1179, 128}, -- Wild Gladiator's Silk Armor
    {T, 1178, 4}, -- Wild Gladiator's Chain Armor
    {T, 1177, 4}, -- Wild Gladiator's Chain Armor
    {T, 1176, 1024}, -- Wild Gladiator's Dragonhide Armor
    {T, 1175, 1024}, -- Wild Gladiator's Dragonhide Armor
    {T, 1174, 32}, -- Wild Gladiator's Dreadplate Armor
    {T, 1173, 32}, -- Wild Gladiator's Dreadplate Armor
    {T, 1172, 512}, -- Vindictive Combatant's Ironskin Armor
    {T, 1171, 1024}, -- Vindictive Combatant's Dragonhide Armor
    {T, 1170, 2048}, -- Vindictive Combatant's Felskin Armor
    {T, 1169, 512}, -- Vindictive Combatant's Ironskin Armor
    {T, 1168, 1024}, -- Vindictive Combatant's Dragonhide Armor
    {T, 1167, 2048}, -- Vindictive Combatant's Felskin Armor
    {T, 1166, 2}, -- Vindictive Combatant's Scaled Armor
    {T, 1165, 32}, -- Vindictive Combatant's Dreadplate Armor
    {T, 1164, 2}, -- Vindictive Combatant's Scaled Armor
    {T, 1163, 32}, -- Vindictive Combatant's Dreadplate Armor
    {T, 1162, 64}, -- Vindictive Combatant's Ringmail Armor
    {T, 1161, 64}, -- Vindictive Combatant's Ringmail Armor
    {T, 1160, 256}, -- Vindictive Combatant's Felweave Armor
    {T, 1159, 128}, -- Vindictive Combatant's Silk Armor
    {T, 1158, 256}, -- Vindictive Combatant's Felweave Armor
    {T, 1157, 1}, -- Primal Gladiator's Plate Armor
    {T, 1156, 1}, -- Primal Gladiator's Plate Armor
    {T, 1155, 256}, -- Primal Gladiator's Felweave Armor
    {T, 1154, 256}, -- Primal Gladiator's Felweave Armor
    {T, 1153, 64}, -- Primal Gladiator's Ringmail Armor
    {T, 1152, 64}, -- Primal Gladiator's Ringmail Armor
    {T, 1151, 8}, -- Primal Gladiator's Leather Armor
    {T, 1150, 8}, -- Primal Gladiator's Leather Armor
    {T, 1149, 2}, -- Primal Gladiator's Scaled Armor
    {T, 1148, 2}, -- Primal Gladiator's Scaled Armor
    {T, 1147, 512}, -- Primal Gladiator's Ironskin Armor
    {T, 1146, 512}, -- Primal Gladiator's Ironskin Armor
    {T, 1145, 128}, -- Primal Gladiator's Silk Armor
    {T, 1144, 128}, -- Primal Gladiator's Silk Armor
    {T, 1143, 4}, -- Primal Gladiator's Chain Armor
    {T, 1142, 4}, -- Primal Gladiator's Chain Armor
    {T, 1141, 1024}, -- Primal Gladiator's Dragonhide Armor
    {T, 1140, 1024}, -- Primal Gladiator's Dragonhide Armor
    {T, 1139, 32}, -- Primal Gladiator's Dreadplate Armor
    {T, 1138, 32}, -- Primal Gladiator's Dreadplate Armor
    {T, 1137, 128}, -- Vindictive Combatant's Silk Armor
    {T, 1136, 1}, -- Vindictive Gladiator's Plate Armor
    {T, 1135, 1}, -- Vindictive Gladiator's Plate Armor
    {T, 1134, 1}, -- Vindictive Gladiator's Plate Armor
    {T, 1133, 1}, -- Vindictive Gladiator's Plate Armor
    {T, 1132, 64}, -- Vindictive Gladiator's Ringmail Armor
    {T, 1131, 64}, -- Vindictive Gladiator's Ringmail Armor
    {T, 1130, 64}, -- Vindictive Gladiator's Ringmail Armor
    {T, 1129, 64}, -- Vindictive Gladiator's Ringmail Armor
    {T, 1128, 8}, -- Vindictive Gladiator's Leather Armor
    {T, 1127, 8}, -- Vindictive Gladiator's Leather Armor
    {T, 1126, 8}, -- Vindictive Gladiator's Leather Armor
    {T, 1125, 8}, -- Vindictive Gladiator's Leather Armor
    {T, 1124, 2}, -- Vindictive Gladiator's Scaled Armor
    {T, 1123, 2}, -- Vindictive Gladiator's Scaled Armor
    {T, 1122, 2}, -- Vindictive Gladiator's Scaled Armor
    {T, 1121, 2}, -- Vindictive Gladiator's Scaled Armor
    {T, 1120, 512}, -- Vindictive Gladiator's Ironskin Armor
    {T, 1119, 512}, -- Vindictive Gladiator's Ironskin Armor
    {T, 1118, 512}, -- Vindictive Gladiator's Ironskin Armor
    {T, 1117, 512}, -- Vindictive Gladiator's Ironskin Armor
    {T, 1116, 4}, -- Vindictive Gladiator's Chain Armor
    {T, 1115, 4}, -- Vindictive Gladiator's Chain Armor
    {T, 1114, 4}, -- Vindictive Gladiator's Chain Armor
    {T, 1113, 4}, -- Vindictive Gladiator's Chain Armor
    {T, 1112, 2048}, -- Vindictive Gladiator's Felskin Armor
    {T, 1111, 2048}, -- Vindictive Gladiator's Felskin Armor
    {T, 1110, 2048}, -- Vindictive Gladiator's Felskin Armor
    {T, 1109, 2048}, -- Vindictive Gladiator's Felskin Armor
    {T, 1108, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {T, 1107, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {T, 1106, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {T, 1105, 32}, -- Vindictive Gladiator's Dreadplate Armor
    {T, 1104, 256}, -- Vindictive Gladiator's Felweave Armor
    {T, 1103, 256}, -- Vindictive Gladiator's Felweave Armor
    {T, 1102, 256}, -- Vindictive Gladiator's Felweave Armor
    {T, 1101, 256}, -- Vindictive Gladiator's Felweave Armor
    {T, 1100, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {T, 1099, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {T, 1098, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {T, 1097, 1024}, -- Vindictive Gladiator's Dragonhide Armor
    {T, 1096, 128}, -- Vindictive Gladiator's Silk Armor
    {T, 1095, 128}, -- Vindictive Gladiator's Silk Armor
    {T, 1094, 128}, -- Vindictive Gladiator's Silk Armor
    {T, 1093, 128}, -- Vindictive Gladiator's Silk Armor
    {T, 1092, 1}, -- Prideful Gladiator's Plate Armor
    {T, 1091, 1}, -- Prideful Gladiator's Plate Armor
    {T, 1090, 256}, -- Prideful Gladiator's Felweave Armor
    {T, 1089, 256}, -- Prideful Gladiator's Felweave Armor
    {T, 1088, 64}, -- Prideful Gladiator's Ringmail Armor
    {T, 1087, 64}, -- Prideful Gladiator's Ringmail Armor
    {T, 1086, 8}, -- Prideful Gladiator's Leather Armor
    {T, 1085, 8}, -- Prideful Gladiator's Leather Armor
    {T, 1084, 2}, -- Prideful Gladiator's Scaled Armor
    {T, 1083, 2}, -- Prideful Gladiator's Scaled Armor
    {T, 1082, 512}, -- Prideful Gladiator's Ironskin Armor
    {T, 1081, 512}, -- Prideful Gladiator's Ironskin Armor
    {T, 1080, 128}, -- Prideful Gladiator's Silk Armor
    {T, 1079, 128}, -- Prideful Gladiator's Silk Armor
    {T, 1078, 4}, -- Prideful Gladiator's Chain Armor
    {T, 1077, 4}, -- Prideful Gladiator's Chain Armor
    {T, 1076, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {T, 1075, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {T, 1074, 32}, -- Prideful Gladiator's Dreadplate Armor
    {T, 1073, 32}, -- Prideful Gladiator's Dreadplate Armor
    {T, 1072, 16}, -- Vindictive Combatant's Satin Armor
    {T, 1071, 16}, -- Vindictive Combatant's Satin Armor
    {T, 1070, 1}, -- Vindictive Combatant's Plate Armor
    {T, 1069, 1}, -- Vindictive Combatant's Plate Armor
    {T, 1068, 8}, -- Vindictive Combatant's Leather Armor
    {T, 1067, 8}, -- Vindictive Combatant's Leather Armor
    {T, 1064, 1}, -- Malevolent Gladiator's Plate Armor
    {T, 1063, 256}, -- Malevolent Gladiator's Felweave Armor
    {T, 1062, 64}, -- Malevolent Gladiator's Ringmail Armor
    {T, 1061, 8}, -- Malevolent Gladiator's Leather Armor
    {T, 1060, 2}, -- Malevolent Gladiator's Scaled Armor
    {T, 1059, 512}, -- Malevolent Gladiator's Ironskin Armor
    {T, 1057, 128}, -- Malevolent Gladiator's Silk Armor
    {T, 1056, 4}, -- Malevolent Gladiator's Chain Armor
    {T, 1055, 1024}, -- Malevolent Gladiator's Dragonhide Armor
    {T, 1054, 32}, -- Malevolent Gladiator's Dreadplate Armor
    {T, 1049, 1}, -- Grievous Gladiator's Plate Armor
    {T, 1048, 1}, -- Grievous Gladiator's Plate Armor
    {T, 1047, 256}, -- Grievous Gladiator's Felweave Armor
    {T, 1046, 256}, -- Grievous Gladiator's Felweave Armor
    {T, 1045, 64}, -- Grievous Gladiator's Ringmail Armor
    {T, 1044, 64}, -- Grievous Gladiator's Ringmail Armor
    {T, 1043, 8}, -- Grievous Gladiator's Leather Armor
    {T, 1042, 8}, -- Grievous Gladiator's Leather Armor
    {T, 1041, 2}, -- Grievous Gladiator's Scaled Armor
    {T, 1040, 2}, -- Grievous Gladiator's Scaled Armor
    {T, 1039, 512}, -- Grievous Gladiator's Ironskin Armor
    {T, 1038, 512}, -- Grievous Gladiator's Ironskin Armor
    {T, 1037, 128}, -- Grievous Gladiator's Silk Armor
    {T, 1036, 128}, -- Grievous Gladiator's Silk Armor
    {T, 1035, 4}, -- Grievous Gladiator's Chain Armor
    {T, 1034, 4}, -- Grievous Gladiator's Chain Armor
    {T, 1033, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {T, 1032, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {T, 1031, 32}, -- Grievous Gladiator's Dreadplate Armor
    {T, 1030, 32}, -- Grievous Gladiator's Dreadplate Armor
    {T, 1029, 1}, -- Tyrannical Gladiator's Plate Armor
    {T, 1028, 1}, -- Tyrannical Gladiator's Plate Armor
    {T, 1027, 256}, -- Tyrannical Gladiator's Felweave Armor
    {T, 1026, 256}, -- Tyrannical Gladiator's Felweave Armor
    {T, 1025, 64}, -- Tyrannical Gladiator's Ringmail Armor
    {T, 1024, 64}, -- Tyrannical Gladiator's Ringmail Armor
    {T, 1023, 8}, -- Tyrannical Gladiator's Leather Armor
    {T, 1022, 8}, -- Tyrannical Gladiator's Leather Armor
    {T, 1021, 2}, -- Tyrannical Gladiator's Scaled Armor
    {T, 1020, 2}, -- Tyrannical Gladiator's Scaled Armor
    {T, 1019, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {T, 1018, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {T, 1017, 128}, -- Tyrannical Gladiator's Silk Armor
    {T, 1016, 128}, -- Tyrannical Gladiator's Silk Armor
    {T, 1015, 4}, -- Tyrannical Gladiator's Chain Armor
    {T, 1014, 4}, -- Tyrannical Gladiator's Chain Armor
    {T, 1013, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {T, 1012, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {T, 1011, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {T, 1010, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {T, 1005, 32}, -- Dreadwyrm Battleplate
    {T, 1004, 32}, -- Dreadwyrm Battleplate
    {T, 1003, 32}, -- Dreadwyrm Battleplate
    {T, 1002, 32}, -- Dreadwyrm Battleplate
    {T, 1001, 2048}, -- Vestment of Second Sight
    {T, 1000, 2048}, -- Vestment of Second Sight
    {T, 999, 2048}, -- Vestment of Second Sight
    {T, 998, 2048}, -- Vestment of Second Sight
    {T, 997, 1024}, -- Garb of the Astral Warden
    {T, 996, 1024}, -- Garb of the Astral Warden
    {T, 995, 1024}, -- Garb of the Astral Warden
    {T, 994, 1024}, -- Garb of the Astral Warden
    {T, 993, 4}, -- Eagletalon Battlegear
    {T, 992, 4}, -- Eagletalon Battlegear
    {T, 991, 4}, -- Eagletalon Battlegear
    {T, 990, 4}, -- Eagletalon Battlegear
    {T, 989, 128}, -- Regalia of Everburning Knowledge
    {T, 988, 128}, -- Regalia of Everburning Knowledge
    {T, 987, 128}, -- Regalia of Everburning Knowledge
    {T, 986, 128}, -- Regalia of Everburning Knowledge
    {T, 985, 512}, -- Vestments of Enveloped Dissonance
    {T, 984, 512}, -- Vestments of Enveloped Dissonance
    {T, 983, 512}, -- Vestments of Enveloped Dissonance
    {T, 982, 512}, -- Vestments of Enveloped Dissonance
    {T, 981, 2}, -- Battleplate of the Highlord
    {T, 980, 2}, -- Battleplate of the Highlord
    {T, 979, 2}, -- Battleplate of the Highlord
    {T, 978, 2}, -- Battleplate of the Highlord
    {T, 977, 1024}, -- Gladiator's Dragonhide Armor
    {T, 976, 4}, -- Gladiator's Chain Armor
    {T, 975, 128}, -- Gladiator's Silk Armor
    {T, 974, 2}, -- Gladiator's Scaled Armor
    {T, 973, 16}, -- Gladiator's Satin Armor
    {T, 972, 8}, -- Gladiator's Leather Armor
    {T, 971, 64}, -- Gladiator's Ringmail Armor
    {T, 970, 256}, -- Gladiator's Felweave Armor
    {T, 969, 1024}, -- Merciless Gladiator's Dragonhide Armor
    {T, 968, 4}, -- Merciless Gladiator's Chain Armor
    {T, 967, 128}, -- Merciless Gladiator's Silk Armor
    {T, 966, 2}, -- Merciless Gladiator's Scaled Armor
    {T, 965, 8}, -- Merciless Gladiator's Leather Armor
    {T, 964, 64}, -- Merciless Gladiator's Ringmail Armor
    {T, 963, 256}, -- Merciless Gladiator's Felweave Armor
    {T, 962, 1}, -- Merciless Gladiator's Plate Armor
    {T, 961, 1024}, -- Vengeful Gladiator's Dragonhide Armor
    {T, 960, 4}, -- Vengeful Gladiator's Chain Armor
    {T, 959, 128}, -- Vengeful Gladiator's Silk Armor
    {T, 958, 2}, -- Vengeful Gladiator's Scaled Armor
    {T, 957, 8}, -- Vengeful Gladiator's Leather Armor
    {T, 956, 64}, -- Vengeful Gladiator's Ringmail Armor
    {T, 955, 256}, -- Vengeful Gladiator's Felweave Armor
    {T, 954, 1}, -- Vengeful Gladiator's Plate Armor
    {T, 953, 1024}, -- Brutal Gladiator's Dragonhide Armor
    {T, 952, 4}, -- Brutal Gladiator's Chain Armor
    {T, 951, 128}, -- Brutal Gladiator's Silk Armor
    {T, 950, 2}, -- Brutal Gladiator's Scaled Armor
    {T, 949, 8}, -- Brutal Gladiator's Leather Armor
    {T, 948, 64}, -- Brutal Gladiator's Ringmail Armor
    {T, 947, 256}, -- Brutal Gladiator's Felweave Armor
    {T, 946, 1}, -- Brutal Gladiator's Plate Armor
    {T, 945, 8}, -- Doomblade Battlegear
    {T, 944, 8}, -- Doomblade Battlegear
    {T, 943, 8}, -- Doomblade Battlegear
    {T, 942, 8}, -- Doomblade Battlegear
    {T, 941, 256}, -- Legacy of Azj'aqir
    {T, 940, 1}, -- Warplate of the Obsidian Aspect
    {T, 939, 1}, -- Warplate of the Obsidian Aspect
    {T, 938, 1}, -- Warplate of the Obsidian Aspect
    {T, 937, 1}, -- Warplate of the Obsidian Aspect
    {T, 936, 64}, -- Regalia of Shackled Elements
    {T, 935, 64}, -- Regalia of Shackled Elements
    {T, 934, 64}, -- Regalia of Shackled Elements
    {T, 933, 64}, -- Regalia of Shackled Elements
    {T, 932, 256}, -- Malefic Regalia
    {T, 931, 1}, -- Onslaught Battlegear
    {T, 928, 1024}, -- Cenarion Raiment
    {T, 927, 1024}, -- Stormrage Raiment
    {T, 926, 1024}, -- Genesis Raiment
    {T, 924, 1024}, -- Dreamwalker Raiment
    {T, 922, 1024}, -- Malorne Raiment
    {T, 921, 1024}, -- Nordrassil Raiment
    {T, 920, 1024}, -- Thunderheart Raiment
    {T, 919, 1024}, -- Thunderheart Regalia
    {T, 918, 4}, -- Rift Stalker Armor
    {T, 917, 4}, -- Giantstalker Armor
    {T, 916, 4}, -- Dragonstalker Armor
    {T, 915, 4}, -- Striker's Garb
    {T, 914, 4}, -- Cryptstalker Armor
    {T, 913, 4}, -- Demon Stalker Armor
    {T, 912, 4}, -- Gronnstalker's Armor
    {T, 911, 4}, -- Gronnstalker's Battlegear
    {T, 910, 128}, -- Arcanist Regalia
    {T, 909, 128}, -- Netherwind Regalia
    {T, 908, 128}, -- Enigma Vestments
    {T, 907, 128}, -- Frostfire Regalia
    {T, 906, 2}, -- Justicar Armor
    {T, 905, 128}, -- Tirisfal Regalia
    {T, 904, 128}, -- Tempest Regalia
    {T, 903, 128}, -- Tempest Garb
    {T, 902, 2}, -- Lawbringer Armor
    {T, 901, 2}, -- Judgment Armor
    {T, 900, 2}, -- Avenger's Battlegear
    {T, 899, 2}, -- Redemption Armor
    {T, 898, 128}, -- Aldor Regalia
    {T, 897, 2}, -- Crystalforge Armor
    {T, 896, 2}, -- Lightbringer Armor
    {T, 895, 2}, -- Lightbringer Battlegear
    {T, 894, 8}, -- Nightslayer Armor
    {T, 893, 8}, -- Bloodfang Armor
    {T, 892, 8}, -- Deathdealer's Embrace
    {T, 891, 8}, -- Bonescythe Armor
    {T, 890, 8}, -- Netherblade
    {T, 889, 8}, -- Deathmantle
    {T, 888, 8}, -- Slayer's Armor
    {T, 887, 8}, -- Slayer's Battlegear
    {T, 876, 64}, -- The Earthfury
    {T, 875, 64}, -- The Ten Storms
    {T, 874, 64}, -- Stormcaller's Garb
    {T, 873, 64}, -- The Earthshatterer
    {T, 872, 64}, -- Cyclone Regalia
    {T, 871, 64}, -- Cataclysm Regalia
    {T, 870, 64}, -- Skyshatter Regalia
    {T, 869, 64}, -- Skyshatter Raiment
    {T, 868, 256}, -- Felheart Raiment
    {T, 867, 256}, -- Nemesis Raiment
    {T, 866, 256}, -- Doomcaller's Attire
    {T, 865, 256}, -- Plagueheart Raiment
    {T, 864, 256}, -- Voidheart Raiment
    {T, 863, 256}, -- Corruptor Raiment
    {T, 862, 256}, -- Malefic Raiment
    {T, 853, 1}, -- Battlegear of Might
    {T, 852, 1}, -- Battlegear of Wrath
    {T, 851, 1}, -- Conqueror's Battlegear
    {T, 850, 1}, -- Dreadnaught's Battlegear
    {T, 849, 1}, -- Warbringer Armor
    {T, 848, 1}, -- Destroyer Armor
    {T, 847, 1}, -- Onslaught Armor
    {T, 846, 32}, -- Valorous Scourgeborne Plate
    {T, 845, 32}, -- Heroes' Scourgeborne Plate
    {T, 844, 32}, -- Conqueror's Darkruned Plate
    {T, 843, 32}, -- Valorous Darkruned Plate
    {T, 842, 32}, -- Thassarian's Battlegear
    {T, 841, 32}, -- Koltira's Battlegear
    {T, 840, 32}, -- Sanctified Scourgelord's Plate
    {T, 839, 32}, -- Sanctified Scourgelord's Plate
    {T, 838, 32}, -- Scourgelord's Plate
    {T, 837, 32}, -- Magma Plated Battlearmor
    {T, 836, 32}, -- Magma Plated Battlearmor
    {T, 835, 32}, -- Elementium Deathplate Battlearmor
    {T, 834, 32}, -- Elementium Deathplate Battlearmor
    {T, 833, 32}, -- Necrotic Boneplate Armor
    {T, 832, 32}, -- Necrotic Boneplate Armor
    {T, 831, 32}, -- Necrotic Boneplate Armor
    {T, 830, 1024}, -- Valorous Dreamwalker Battlegear
    {T, 829, 1024}, -- Heroes' Dreamwalker Battlegear
    {T, 828, 1024}, -- Conqueror's Nightsong Battlegear
    {T, 827, 1024}, -- Valorous Nightsong Battlegear
    {T, 826, 1024}, -- Runetotem's Battlegear
    {T, 825, 1024}, -- Malfurion's Battlegear
    {T, 824, 1024}, -- Sanctified Lasherweave Battlegear
    {T, 823, 1024}, -- Sanctified Lasherweave Battlegear
    {T, 822, 1024}, -- Lasherweave Battlegear
    {T, 821, 1024}, -- Stormrider's Vestments
    {T, 820, 1024}, -- Stormrider's Vestments
    {T, 819, 1024}, -- Obsidian Arborweave Vestments
    {T, 818, 1024}, -- Obsidian Arborweave Vestments
    {T, 817, 1024}, -- Deep Earth Vestments
    {T, 816, 1024}, -- Deep Earth Vestments
    {T, 815, 1024}, -- Deep Earth Vestments
    {T, 814, 32}, -- Savage Gladiator's Dreadplate Armor
    {T, 813, 1024}, -- Savage Gladiator's Dragonhide Armor
    {T, 812, 4}, -- Savage Gladiator's Chain Armor
    {T, 811, 128}, -- Savage Gladiator's Silk Armor
    {T, 810, 2}, -- Savage Gladiator's Scaled Armor
    {T, 809, 8}, -- Savage Gladiator's Leather Armor
    {T, 808, 64}, -- Savage Gladiator's Ringmail Armor
    {T, 807, 256}, -- Savage Gladiator's Felweave Armor
    {T, 806, 1}, -- Savage Gladiator's Plate Armor
    {T, 805, 32}, -- Hateful Gladiator's Dreadplate Armor
    {T, 804, 1024}, -- Hateful Gladiator's Dragonhide Armor
    {T, 803, 4}, -- Hateful Gladiator's Chain Armor
    {T, 802, 128}, -- Hateful Gladiator's Silk Armor
    {T, 801, 2}, -- Hateful Gladiator's Scaled Armor
    {T, 800, 8}, -- Hateful Gladiator's Leather Armor
    {T, 799, 64}, -- Hateful Gladiator's Ringmail Armor
    {T, 798, 256}, -- Hateful Gladiator's Felweave Armor
    {T, 797, 1}, -- Hateful Gladiator's Plate Armor
    {T, 796, 32}, -- Deadly Gladiator's Dreadplate Armor
    {T, 795, 1024}, -- Deadly Gladiator's Dragonhide Armor
    {T, 794, 4}, -- Deadly Gladiator's Chain Armor
    {T, 793, 128}, -- Deadly Gladiator's Silk Armor
    {T, 792, 2}, -- Deadly Gladiator's Scaled Armor
    {T, 791, 8}, -- Deadly Gladiator's Leather Armor
    {T, 790, 64}, -- Deadly Gladiator's Ringmail Armor
    {T, 789, 256}, -- Deadly Gladiator's Felweave Armor
    {T, 788, 1}, -- Deadly Gladiator's Plate Armor
    {T, 787, 32}, -- Furious Gladiator's Dreadplate Armor
    {T, 786, 1024}, -- Furious Gladiator's Dragonhide Armor
    {T, 785, 4}, -- Furious Gladiator's Chain Armor
    {T, 784, 128}, -- Furious Gladiator's Silk Armor
    {T, 783, 2}, -- Furious Gladiator's Scaled Armor
    {T, 782, 8}, -- Furious Gladiator's Leather Armor
    {T, 781, 64}, -- Furious Gladiator's Ringmail Armor
    {T, 780, 256}, -- Furious Gladiator's Felweave Armor
    {T, 779, 1}, -- Furious Gladiator's Plate Armor
    {T, 778, 32}, -- Relentless Gladiator's Dreadplate Armor
    {T, 777, 1024}, -- Relentless Gladiator's Dragonhide Armor
    {T, 776, 4}, -- Relentless Gladiator's Chain Armor
    {T, 775, 128}, -- Relentless Gladiator's Silk Armor
    {T, 774, 2}, -- Relentless Gladiator's Scaled Armor
    {T, 773, 8}, -- Relentless Gladiator's Leather Armor
    {T, 772, 64}, -- Relentless Gladiator's Ringmail Armor
    {T, 771, 256}, -- Relentless Gladiator's Felweave Armor
    {T, 770, 1}, -- Relentless Gladiator's Plate Armor
    {T, 769, 32}, -- Wrathful Gladiator's Dreadplate Armor
    {T, 768, 1024}, -- Wrathful Gladiator's Dragonhide Armor
    {T, 767, 4}, -- Wrathful Gladiator's Chain Armor
    {T, 766, 128}, -- Wrathful Gladiator's Silk Armor
    {T, 765, 2}, -- Wrathful Gladiator's Scaled Armor
    {T, 764, 8}, -- Wrathful Gladiator's Leather Armor
    {T, 763, 64}, -- Wrathful Gladiator's Ringmail Armor
    {T, 762, 256}, -- Wrathful Gladiator's Felweave Armor
    {T, 761, 1}, -- Wrathful Gladiator's Plate Armor
    {T, 760, 32}, -- Vicious Gladiator's Dreadplate Armor
    {T, 759, 32}, -- Vicious Gladiator's Dreadplate Armor
    {T, 758, 1024}, -- Vicious Gladiator's Dragonhide Armor
    {T, 757, 1024}, -- Vicious Gladiator's Dragonhide Armor
    {T, 756, 4}, -- Vicious Gladiator's Chain Armor
    {T, 755, 4}, -- Vicious Gladiator's Chain Armor
    {T, 754, 128}, -- Vicious Gladiator's Silk Armor
    {T, 753, 128}, -- Vicious Gladiator's Silk Armor
    {T, 752, 2}, -- Vicious Gladiator's Scaled Armor
    {T, 751, 2}, -- Vicious Gladiator's Scaled Armor
    {T, 750, 8}, -- Vicious Gladiator's Leather Armor
    {T, 749, 8}, -- Vicious Gladiator's Leather Armor
    {T, 748, 64}, -- Vicious Gladiator's Ringmail Armor
    {T, 747, 64}, -- Vicious Gladiator's Ringmail Armor
    {T, 743, 4}, -- Valorous Cryptstalker Battlegear
    {T, 742, 4}, -- Heroes' Cryptstalker Battlegear
    {T, 741, 4}, -- Conqueror's Scourgestalker Battlegear
    {T, 740, 4}, -- Valorous Scourgestalker Battlegear
    {T, 739, 4}, -- Windrunner's Battlegear
    {T, 738, 4}, -- Windrunner's Pursuit
    {T, 737, 4}, -- Sanctified Ahn'Kahar Blood Hunter's Battlegear
    {T, 736, 4}, -- Sanctified Ahn'Kahar Blood Hunter's Battlegear
    {T, 735, 4}, -- Ahn'Kahar Blood Hunter's Battlegear
    {T, 734, 4}, -- Lightning-Charged Battlegear
    {T, 733, 4}, -- Lightning-Charged Battlegear
    {T, 732, 4}, -- Flamewaker's Battlegear
    {T, 731, 4}, -- Flamewaker's Battlegear
    {T, 730, 4}, -- Wyrmstalker Battlegear
    {T, 729, 4}, -- Wyrmstalker Battlegear
    {T, 728, 4}, -- Wyrmstalker Battlegear
    {T, 727, 128}, -- Valorous Frostfire Garb
    {T, 726, 128}, -- Heroes' Frostfire Garb
    {T, 725, 128}, -- Conqueror's Kirin Tor Garb
    {T, 724, 128}, -- Valorous Kirin Tor Garb
    {T, 723, 128}, -- Sunstrider's Regalia
    {T, 722, 128}, -- Khadgar's Regalia
    {T, 721, 128}, -- Sanctified Bloodmage's Regalia
    {T, 720, 128}, -- Sanctified Bloodmage's Regalia
    {T, 719, 128}, -- Bloodmage's Regalia
    {T, 718, 128}, -- Firelord's Vestments
    {T, 717, 128}, -- Firelord's Vestments
    {T, 716, 128}, -- Firehawk Robes of Conflagration
    {T, 715, 128}, -- Firehawk Robes of Conflagration
    {T, 714, 128}, -- Time Lord's Regalia
    {T, 713, 128}, -- Time Lord's Regalia
    {T, 712, 128}, -- Time Lord's Regalia
    {T, 711, 2}, -- Valorous Redemption Plate
    {T, 710, 2}, -- Heroes' Redemption Plate
    {T, 709, 2}, -- Conqueror's Aegis Plate
    {T, 708, 2}, -- Valorous Aegis Plate
    {T, 707, 2}, -- Liadrin's Plate
    {T, 706, 2}, -- Turalyon's Plate
    {T, 705, 2}, -- Sanctified Lightsworn Plate
    {T, 704, 2}, -- Sanctified Lightsworn Plate
    {T, 703, 2}, -- Lightsworn Plate
    {T, 702, 2}, -- Reinforced Sapphirium Battleplate
    {T, 701, 2}, -- Reinforced Sapphirium Battleplate
    {T, 700, 2}, -- Battleplate of Immolation
    {T, 699, 2}, -- Battleplate of Immolation
    {T, 698, 2}, -- Battleplate of Radiant Glory
    {T, 697, 2}, -- Battleplate of Radiant Glory
    {T, 696, 2}, -- Battleplate of Radiant Glory
    {T, 695, 8}, -- Valorous Bonescythe Battlegear
    {T, 694, 8}, -- Heroes' Bonescythe Battlegear
    {T, 693, 8}, -- Conqueror's Terrorblade Battlegear
    {T, 692, 8}, -- Valorous Terrorblade Battlegear
    {T, 691, 8}, -- Garona's Battlegear
    {T, 690, 8}, -- VanCleef's Battlegear
    {T, 689, 8}, -- Sanctified Shadowblade's Battlegear
    {T, 688, 8}, -- Sanctified Shadowblade's Battlegear
    {T, 687, 8}, -- Shadowblade's Battlegear
    {T, 686, 8}, -- Wind Dancer's Regalia
    {T, 685, 8}, -- Wind Dancer's Regalia
    {T, 684, 8}, -- Vestments of the Dark Phoenix
    {T, 683, 8}, -- Vestments of the Dark Phoenix
    {T, 682, 8}, -- Blackfang Battleweave
    {T, 681, 8}, -- Blackfang Battleweave
    {T, 680, 8}, -- Blackfang Battleweave
    {T, 679, 256}, -- Valorous Plagueheart Garb
    {T, 678, 256}, -- Heroes' Plagueheart Garb
    {T, 677, 256}, -- Conqueror's Deathbringer Garb
    {T, 676, 256}, -- Valorous Deathbringer Garb
    {T, 675, 256}, -- Gul'dan's Regalia
    {T, 674, 256}, -- Kel'Thuzad's Regalia
    {T, 673, 256}, -- Sanctified Dark Coven's Regalia
    {T, 672, 256}, -- Sanctified Dark Coven's Regalia
    {T, 671, 256}, -- Dark Coven's Regalia
    {T, 670, 256}, -- Shadowflame Regalia
    {T, 669, 256}, -- Shadowflame Regalia
    {T, 668, 256}, -- Balespider's Burning Vestments
    {T, 667, 256}, -- Balespider's Burning Vestments
    {T, 666, 256}, -- Vestments of the Faceless Shroud
    {T, 665, 256}, -- Vestments of the Faceless Shroud
    {T, 664, 256}, -- Vestments of the Faceless Shroud
    {T, 663, 64}, -- Spiritwalker's Regalia
    {T, 662, 1}, -- Valorous Dreadnaught Battlegear
    {T, 661, 1}, -- Heroes' Dreadnaught Battlegear
    {T, 660, 1}, -- Conqueror's Siegebreaker Battlegear
    {T, 659, 1}, -- Valorous Siegebreaker Battlegear
    {T, 658, 1}, -- Wrynn's Battlegear
    {T, 657, 1}, -- Hellscream's Battlegear
    {T, 656, 1}, -- Sanctified Ymirjar Lord's Battlegear
    {T, 655, 1}, -- Ymirjar Lord's Battlegear
    {T, 654, 1}, -- Earthen Battleplate
    {T, 653, 1}, -- Earthen Battleplate
    {T, 652, 1}, -- Molten Giant Battleplate
    {T, 651, 1}, -- Molten Giant Battleplate
    {T, 650, 1}, -- Colossal Dragonplate Battlegear
    {T, 649, 1}, -- Colossal Dragonplate Battlegear
    {T, 645, 64}, -- Valorous Earthshatter Regalia
    {T, 644, 64}, -- Heroes' Earthshatter Regalia
    {T, 643, 64}, -- Conqueror's Worldbreaker Regalia
    {T, 642, 64}, -- Valorous Worldbreaker Regalia
    {T, 641, 64}, -- Thrall's Garb
    {T, 640, 64}, -- Nobundo's Garb
    {T, 639, 64}, -- Frost Witch's Regalia
    {T, 638, 64}, -- Frost Witch's Regalia
    {T, 637, 64}, -- Frost Witch's Regalia
    {T, 636, 64}, -- Regalia of the Raging Elements
    {T, 635, 64}, -- Regalia of the Raging Elements
    {T, 634, 64}, -- Volcanic Regalia
    {T, 633, 64}, -- Volcanic Regalia
    {T, 632, 64}, -- Spiritwalker's Regalia
    {T, 631, 1}, -- Colossal Dragonplate Battlegear
    {T, 630, 64}, -- Spiritwalker's Regalia
    {T, 629, 256}, -- Vicious Gladiator's Felweave Armor
    {T, 628, 256}, -- Vicious Gladiator's Felweave Armor
    {T, 627, 1}, -- Vicious Gladiator's Plate Armor
    {T, 626, 1}, -- Vicious Gladiator's Plate Armor
    {T, 625, 32}, -- Ruthless Gladiator's Dreadplate Armor
    {T, 624, 32}, -- Ruthless Gladiator's Dreadplate Armor
    {T, 623, 1024}, -- Ruthless Gladiator's Dragonhide Armor
    {T, 622, 1024}, -- Ruthless Gladiator's Dragonhide Armor
    {T, 621, 4}, -- Ruthless Gladiator's Chain Armor
    {T, 620, 4}, -- Ruthless Gladiator's Chain Armor
    {T, 619, 128}, -- Ruthless Gladiator's Silk Armor
    {T, 618, 128}, -- Ruthless Gladiator's Silk Armor
    {T, 617, 2}, -- Ruthless Gladiator's Scaled Armor
    {T, 616, 2}, -- Ruthless Gladiator's Scaled Armor
    {T, 615, 8}, -- Ruthless Gladiator's Leather Armor
    {T, 614, 16}, -- Ruthless Gladiator's Satin Armor
    {T, 613, 8}, -- Ruthless Gladiator's Leather Armor
    {T, 612, 16}, -- Ruthless Gladiator's Satin Armor
    {T, 611, 64}, -- Ruthless Gladiator's Ringmail Armor
    {T, 610, 64}, -- Ruthless Gladiator's Ringmail Armor
    {T, 609, 256}, -- Ruthless Gladiator's Felweave Armor
    {T, 608, 256}, -- Ruthless Gladiator's Felweave Armor
    {T, 607, 1}, -- Ruthless Gladiator's Plate Armor
    {T, 606, 1}, -- Ruthless Gladiator's Plate Armor
    {T, 605, 32}, -- Cataclysmic Gladiator's Dreadplate Armor
    {T, 604, 32}, -- Cataclysmic Gladiator's Dreadplate Armor
    {T, 603, 1024}, -- Cataclysmic Gladiator's Dragonhide Armor
    {T, 602, 1024}, -- Cataclysmic Gladiator's Dragonhide Armor
    {T, 601, 4}, -- Cataclysmic Gladiator's Chain Armor
    {T, 600, 4}, -- Cataclysmic Gladiator's Chain Armor
    {T, 599, 128}, -- Cataclysmic Gladiator's Silk Armor
    {T, 598, 128}, -- Cataclysmic Gladiator's Silk Armor
    {T, 597, 2}, -- Cataclysmic Gladiator's Scaled Armor
    {T, 596, 2}, -- Cataclysmic Gladiator's Scaled Armor
    {T, 595, 8}, -- Cataclysmic Gladiator's Leather Armor
    {T, 594, 8}, -- Cataclysmic Gladiator's Leather Armor
    {T, 593, 64}, -- Cataclysmic Gladiator's Ringmail Armor
    {T, 592, 64}, -- Cataclysmic Gladiator's Ringmail Armor
    {T, 591, 256}, -- Cataclysmic Gladiator's Felweave Armor
    {T, 590, 256}, -- Cataclysmic Gladiator's Felweave Armor
    {T, 589, 1}, -- Cataclysmic Gladiator's Plate Armor
    {T, 588, 1}, -- Cataclysmic Gladiator's Plate Armor
    {T, 584, 35}, -- Demonbreaker Battleplate
    {T, 583, 68}, -- Rancorbite Armor
    {T, 582, 3592}, -- Ironpelt Garb
    {T, 581, 400}, -- Felfume Raiment
    {T, 580, 32}, -- Plate of the Lost Catacomb
    {T, 579, 32}, -- Plate of the Lost Catacomb
    {T, 578, 32}, -- Plate of the Lost Catacomb
    {T, 577, 32}, -- Battleplate of the All-Consuming Maw
    {T, 576, 32}, -- Battleplate of the All-Consuming Maw
    {T, 575, 32}, -- Battleplate of the All-Consuming Maw
    {T, 574, 32}, -- Battleplate of Cyclopean Dread
    {T, 573, 32}, -- Battleplate of Cyclopean Dread
    {T, 572, 32}, -- Battleplate of Cyclopean Dread
    {T, 571, 32}, -- Ogreskull Boneplate Battlegear
    {T, 570, 32}, -- Ogreskull Boneplate Battlegear
    {T, 569, 32}, -- Ogreskull Boneplate Battlegear
    {T, 568, 32}, -- Demongaze Armor
    {T, 567, 32}, -- Demongaze Armor
    {T, 566, 32}, -- Demongaze Armor
    {T, 565, 1024}, -- Vestments of the Eternal Blossom
    {T, 564, 1024}, -- Vestments of the Eternal Blossom
    {T, 563, 1024}, -- Vestments of the Eternal Blossom
    {T, 562, 1024}, -- Vestments of the Haunted Forest
    {T, 561, 1024}, -- Vestments of the Haunted Forest
    {T, 560, 1024}, -- Vestments of the Haunted Forest
    {T, 559, 1024}, -- Vestments of the Shattered Vale
    {T, 558, 1024}, -- Vestments of the Shattered Vale
    {T, 557, 1024}, -- Vestments of the Shattered Vale
    {T, 556, 1024}, -- Living Wood Battlegear
    {T, 555, 1024}, -- Living Wood Battlegear
    {T, 554, 1024}, -- Living Wood Battlegear
    {T, 553, 1024}, -- Oathclaw Wargarb
    {T, 552, 1024}, -- Oathclaw Wargarb
    {T, 551, 1024}, -- Oathclaw Wargarb
    {T, 547, 4}, -- Yaungol Slayer Battlegear
    {T, 546, 4}, -- Yaungol Slayer Battlegear
    {T, 545, 4}, -- Yaungol Slayer Battlegear
    {T, 544, 4}, -- Battlegear of the Saurok Stalker
    {T, 543, 4}, -- Battlegear of the Saurok Stalker
    {T, 542, 4}, -- Battlegear of the Saurok Stalker
    {T, 541, 4}, -- Battlegear of the Unblinking Vigil
    {T, 540, 4}, -- Battlegear of the Unblinking Vigil
    {T, 539, 4}, -- Battlegear of the Unblinking Vigil
    {T, 538, 4}, -- Rylakstalker's Battlegear
    {T, 537, 4}, -- Rylakstalker's Battlegear
    {T, 536, 4}, -- Rylakstalker's Battlegear
    {T, 535, 4}, -- Battlegear of the Savage Hunt
    {T, 534, 4}, -- Battlegear of the Savage Hunt
    {T, 533, 4}, -- Battlegear of the Savage Hunt
    {T, 531, 128}, -- Regalia of the Burning Scroll
    {T, 530, 128}, -- Regalia of the Burning Scroll
    {T, 529, 128}, -- Regalia of the Burning Scroll
    {T, 528, 128}, -- Regalia of the Chromatic Hydra
    {T, 527, 128}, -- Regalia of the Chromatic Hydra
    {T, 526, 128}, -- Regalia of the Chromatic Hydra
    {T, 525, 128}, -- Chronomancer Regalia
    {T, 524, 128}, -- Chronomancer Regalia
    {T, 523, 128}, -- Chronomancer Regalia
    {T, 522, 128}, -- Arcanoshatter Regalia
    {T, 521, 128}, -- Arcanoshatter Regalia
    {T, 520, 128}, -- Arcanoshatter Regalia
    {T, 519, 128}, -- Raiment of the Arcanic Conclave
    {T, 518, 128}, -- Raiment of the Arcanic Conclave
    {T, 517, 128}, -- Raiment of the Arcanic Conclave
    {T, 515, 512}, -- Vestments of the Red Crane
    {T, 514, 512}, -- Vestments of the Red Crane
    {T, 513, 512}, -- Vestments of the Red Crane
    {T, 512, 512}, -- Fire-Charm Vestments
    {T, 511, 512}, -- Fire-Charm Vestments
    {T, 510, 512}, -- Fire-Charm Vestments
    {T, 508, 512}, -- Vestments of the Seven Sacred Seals
    {T, 507, 512}, -- Vestments of the Seven Sacred Seals
    {T, 506, 512}, -- Vestments of the Seven Sacred Seals
    {T, 505, 512}, -- Battlewrap of the Hurricane's Eye
    {T, 503, 512}, -- Battlewrap of the Hurricane's Eye
    {T, 502, 512}, -- Battlewrap of the Hurricane's Eye
    {T, 501, 512}, -- Battlegear of the Somber Gaze
    {T, 500, 512}, -- Battlegear of the Somber Gaze
    {T, 498, 512}, -- Battlegear of the Somber Gaze
    {T, 495, 2}, -- White Tiger Battlegear
    {T, 494, 2}, -- White Tiger Battlegear
    {T, 493, 2}, -- White Tiger Battlegear
    {T, 492, 2}, -- Battlegear of the Lightning Emperor
    {T, 491, 2}, -- Battlegear of the Lightning Emperor
    {T, 490, 2}, -- Battlegear of the Lightning Emperor
    {T, 489, 2}, -- Vestments of Winged Triumph
    {T, 488, 2}, -- Vestments of Winged Triumph
    {T, 487, 2}, -- Vestments of Winged Triumph
    {T, 485, 2}, -- Battlegear of Guiding Light
    {T, 484, 2}, -- Battlegear of Guiding Light
    {T, 483, 2}, -- Battlegear of Guiding Light
    {T, 482, 2}, -- Watch of the Ceaseless Vigil
    {T, 481, 2}, -- Watch of the Ceaseless Vigil
    {T, 480, 2}, -- Watch of the Ceaseless Vigil
    {T, 479, 8}, -- Battlegear of the Thousandfold Blades
    {T, 478, 8}, -- Battlegear of the Thousandfold Blades
    {T, 477, 8}, -- Battlegear of the Thousandfold Blades
    {T, 476, 8}, -- Nine-Tail Battlegear
    {T, 475, 8}, -- Nine-Tail Battlegear
    {T, 474, 8}, -- Nine-Tail Battlegear
    {T, 473, 8}, -- Barbed Assassin Battlegear
    {T, 472, 8}, -- Barbed Assassin Battlegear
    {T, 471, 8}, -- Barbed Assassin Battlegear
    {T, 470, 8}, -- Poisoner's Battlegear
    {T, 469, 8}, -- Poisoner's Battlegear
    {T, 468, 8}, -- Poisoner's Battlegear
    {T, 467, 8}, -- Felblade Armor
    {T, 466, 8}, -- Felblade Armor
    {T, 465, 8}, -- Felblade Armor
    {T, 463, 256}, -- Sha Skin Regalia
    {T, 462, 256}, -- Sha Skin Regalia
    {T, 461, 256}, -- Sha Skin Regalia
    {T, 460, 256}, -- Regalia of the Thousandfold Hells
    {T, 459, 256}, -- Regalia of the Thousandfold Hells
    {T, 458, 256}, -- Regalia of the Thousandfold Hells
    {T, 457, 256}, -- Regalia of the Horned Nightmare
    {T, 456, 256}, -- Regalia of the Horned Nightmare
    {T, 455, 256}, -- Regalia of the Horned Nightmare
    {T, 454, 256}, -- Shadow Council's Garb
    {T, 453, 256}, -- Shadow Council's Garb
    {T, 452, 256}, -- Shadow Council's Garb
    {T, 451, 256}, -- Deathrattle Regalia
    {T, 450, 256}, -- Deathrattle Regalia
    {T, 449, 256}, -- Deathrattle Regalia
    {T, 446, 1}, -- Battleplate of Resounding Rings
    {T, 445, 1}, -- Battleplate of Resounding Rings
    {T, 444, 1}, -- Battleplate of Resounding Rings
    {T, 443, 1}, -- Battleplate of the Last Mogu
    {T, 442, 1}, -- Battleplate of the Last Mogu
    {T, 441, 1}, -- Battleplate of the Last Mogu
    {T, 440, 1}, -- Battleplate of the Prehistoric Marauder
    {T, 439, 1}, -- Battleplate of the Prehistoric Marauder
    {T, 438, 1}, -- Battleplate of the Prehistoric Marauder
    {T, 437, 1}, -- Blackhand's Battlegear
    {T, 436, 1}, -- Blackhand's Battlegear
    {T, 435, 1}, -- Blackhand's Battlegear
    {T, 434, 1}, -- Battlegear of Iron Wrath
    {T, 433, 1}, -- Battlegear of Iron Wrath
    {T, 432, 1}, -- Battlegear of Iron Wrath
    {T, 429, 16}, -- Guardian Serpent Regalia
    {T, 428, 64}, -- Regalia of the Firebird
    {T, 427, 64}, -- Regalia of the Firebird
    {T, 426, 64}, -- Regalia of the Witch Doctor
    {T, 425, 64}, -- Regalia of the Witch Doctor
    {T, 424, 64}, -- Regalia of the Witch Doctor
    {T, 423, 64}, -- Regalia of Celestial Harmony
    {T, 422, 64}, -- Regalia of Celestial Harmony
    {T, 421, 64}, -- Regalia of Celestial Harmony
    {T, 420, 64}, -- Windspeaker's Regalia
    {T, 419, 16}, -- Soul Priest's Raiment
    {T, 418, 64}, -- Windspeaker's Regalia
    {T, 417, 64}, -- Embrace of the Living Mountain
    {T, 416, 64}, -- Embrace of the Living Mountain
    {T, 415, 64}, -- Embrace of the Living Mountain
    {T, 410, 4}, -- Vindictive Combatant's Chain Armor
    {T, 409, 4}, -- Vindictive Combatant's Chain Armor
    {T, 408, 16}, -- Warmongering Gladiator's Satin Armor
    {T, 407, 16}, -- Warmongering Gladiator's Satin Armor
    {T, 406, 16}, -- Wild Gladiator's Satin Armor
    {T, 405, 16}, -- Wild Gladiator's Satin Armor
    {T, 404, 16}, -- Primal Gladiator's Satin Armor
    {T, 403, 16}, -- Primal Gladiator's Satin Armor
    {T, 402, 16}, -- Grievous Gladiator's Satin Armor
    {T, 401, 16}, -- Grievous Gladiator's Satin Armor
    {T, 400, 16}, -- Prideful Gladiator's Satin Armor
    {T, 399, 16}, -- Prideful Gladiator's Satin Armor
    {T, 398, 16}, -- Tyrannical Gladiator's Satin Armor
    {T, 397, 16}, -- Tyrannical Gladiator's Satin Armor
    {T, 396, 16}, -- Malevolent Gladiator's Satin Armor
    {T, 395, 16}, -- Cruel Gladiator's Satin Armor
    {T, 394, 16}, -- Cruel Gladiator's Satin Armor
    {T, 393, 16}, -- Vindictive Gladiator's Satin Armor
    {T, 392, 16}, -- Vindictive Gladiator's Satin Armor
    {T, 391, 16}, -- Cruel Gladiator's Satin Armor
    {T, 390, 16}, -- Vindictive Gladiator's Satin Armor
    {T, 389, 16}, -- Cruel Gladiator's Satin Armor
    {T, 388, 16}, -- Vindictive Gladiator's Satin Armor
    {T, 382, 16}, -- Satin Battlegear
    {T, 381, 1}, -- Gladiator's Plate Armor
    {T, 380, 16}, -- Merciless Gladiator's Satin Armor
    {T, 379, 16}, -- Vengeful Gladiator's Satin Armor
    {T, 378, 16}, -- Brutal Gladiator's Satin Armor
    {T, 377, 16}, -- Savage Gladiator's Satin Armor
    {T, 376, 16}, -- Hateful Gladiator's Satin Armor
    {T, 375, 16}, -- Deadly Gladiator's Satin Armor
    {T, 374, 16}, -- Furious Gladiator's Satin Armor
    {T, 373, 16}, -- Relentless Gladiator's Satin Armor
    {T, 372, 16}, -- Wrathful Gladiator's Satin Armor
    {T, 371, 16}, -- Bloodthirsty Gladiator's Satin Armor
    {T, 370, 16}, -- Vicious Gladiator's Satin Armor
    {T, 369, 16}, -- Vicious Gladiator's Satin Armor
    {T, 366, 16}, -- Cataclysmic Gladiator's Satin Armor
    {T, 365, 16}, -- Cataclysmic Gladiator's Satin Armor
    {T, 364, 16}, -- Conqueror's Sanctification Regalia
    {T, 363, 16}, -- Valorous Sanctification Regalia
    {T, 362, 16}, -- Valorous Regalia of Faith
    {T, 361, 16}, -- Heroes' Regalia of Faith
    {T, 358, 16}, -- Garments of the Oracle
    {T, 357, 16}, -- Vestments of Prophecy
    {T, 356, 16}, -- Vestments of Transcendence
    {T, 355, 16}, -- Vestments of Faith
    {T, 354, 16}, -- Incarnate Regalia
    {T, 353, 16}, -- Avatar Regalia
    {T, 352, 16}, -- Vestments of Absolution
    {T, 351, 16}, -- Absolution Regalia
    {T, 350, 16}, -- Zabra's Regalia
    {T, 349, 16}, -- Velen's Regalia
    {T, 348, 16}, -- Sanctified Crimson Acolyte Regalia
    {T, 347, 16}, -- Sanctified Crimson Acolyte Regalia
    {T, 346, 16}, -- Crimson Acolyte Regalia
    {T, 345, 16}, -- Mercurial Regalia
    {T, 344, 16}, -- Mercurial Regalia
    {T, 343, 16}, -- Regalia of the Cleansing Flame
    {T, 342, 16}, -- Regalia of the Cleansing Flame
    {T, 341, 16}, -- Regalia of Dying Light
    {T, 340, 16}, -- Regalia of Dying Light
    {T, 339, 16}, -- Regalia of Dying Light
    {T, 338, 64}, -- Regalia of the Firebird
    {T, 337, 16}, -- Guardian Serpent Regalia
    {T, 336, 16}, -- Guardian Serpent Regalia
    {T, 335, 16}, -- Regalia of the Exorcist
    {T, 334, 16}, -- Regalia of the Exorcist
    {T, 333, 16}, -- Regalia of Ternion Glory
    {T, 332, 16}, -- Regalia of Ternion Glory
    {T, 331, 16}, -- Regalia of Ternion Glory
    {T, 329, 16}, -- Soul Priest's Raiment
    {T, 328, 64}, -- Windspeaker's Regalia
    {T, 327, 16}, -- Soul Priest's Raiment
    {T, 325, 16}, -- Attire of Piety
    {T, 324, 16}, -- Attire of Piety
    {T, 323, 16}, -- Attire of Piety
    {T, 322, 16}, -- Vestments of the Purifier
    {T, 321, 256}, -- Legacy of Azj'Aqir
    {T, 316, 256}, -- Legacy of Azj'Aqir
    {T, 315, 256}, -- Legacy of Azj'Aqir
    {T, 311, 16}, -- Vestments of the Purifier
    {T, 310, 16}, -- Regalia of the Exorcist
    {T, 309, 16}, -- Vestments of the Purifier
    {T, 308, 16}, -- Vestments of the Purifier
    {T, 298, 1}, -- Sanctified Ymirjar Lord's Battlegear
    {T, 286, 4}, -- Malevolent Gladiator's Chain Armor
    {T, 285, 32}, -- Malevolent Gladiator's Dreadplate Armor
    {T, 284, 64}, -- Malevolent Gladiator's Ringmail Armor
    {T, 283, 256}, -- Malevolent Gladiator's Felweave Armor
    {T, 282, 16}, -- Malevolent Gladiator's Satin Armor
    {T, 281, 1024}, -- Malevolent Gladiator's Dragonhide Armor
    {T, 280, 8}, -- Malevolent Gladiator's Leather Armor
    {T, 279, 512}, -- Malevolent Gladiator's Ironskin Armor
    {T, 278, 1}, -- Malevolent Gladiator's Plate Armor
    {T, 277, 2}, -- Malevolent Gladiator's Scaled Armor
    {T, 276, 128}, -- Malevolent Gladiator's Silk Armor
    {T, 275, 128}, -- Tyrannical Gladiator's Silk Armor
    {T, 274, 2}, -- Tyrannical Gladiator's Scaled Armor
    {T, 273, 16}, -- Tyrannical Gladiator's Satin Armor
    {T, 272, 64}, -- Tyrannical Gladiator's Ringmail Armor
    {T, 271, 1}, -- Tyrannical Gladiator's Plate Armor
    {T, 270, 8}, -- Tyrannical Gladiator's Leather Armor
    {T, 269, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {T, 268, 256}, -- Tyrannical Gladiator's Felweave Armor
    {T, 267, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {T, 266, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {T, 265, 4}, -- Tyrannical Gladiator's Chain Armor
    {T, 264, 128}, -- Tyrannical Gladiator's Silk Armor
    {T, 263, 2}, -- Tyrannical Gladiator's Scaled Armor
    {T, 262, 64}, -- Tyrannical Gladiator's Ringmail Shaman
    {T, 261, 1}, -- Tyrannical Gladiator's Plate Armor
    {T, 260, 8}, -- Tyrannical Gladiator's Leather Armor
    {T, 259, 512}, -- Tyrannical Gladiator's Ironskin Armor
    {T, 258, 16}, -- Tyrannical Gladiator's Satin Armor
    {T, 257, 256}, -- Tyrannical Gladiator's Felweave Armor
    {T, 256, 32}, -- Tyrannical Gladiator's Dreadplate Armor
    {T, 255, 1024}, -- Tyrannical Gladiator's Dragonhide Armor
    {T, 254, 4}, -- Tyrannical Gladiator's Chain Armor
    {T, 253, 128}, -- Prideful Gladiator's Silk Armor
    {T, 252, 2}, -- Prideful Gladiator's Scaled Armor
    {T, 251, 16}, -- Prideful Gladiator's Satin Armor
    {T, 250, 64}, -- Prideful Gladiator's Ringmail Armor
    {T, 249, 1}, -- Prideful Gladiator's Plate Armor
    {T, 248, 8}, -- Prideful Gladiator's Leather Armor
    {T, 247, 512}, -- Prideful Gladiator's Ironskin Armor
    {T, 246, 256}, -- Prideful Gladiator's Felweave Armor
    {T, 245, 32}, -- Prideful Gladiator's Dreadplate Armor
    {T, 244, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {T, 243, 4}, -- Prideful Gladiator's Chain Armor
    {T, 242, 128}, -- Prideful Gladiator's Silk Armor
    {T, 241, 2}, -- Prideful Gladiator's Scaled Armor
    {T, 240, 16}, -- Prideful Gladiator's Satin Armor
    {T, 239, 64}, -- Prideful Gladiator's Ringmail Armor
    {T, 238, 1}, -- Prideful Gladiator's Plate Armor
    {T, 237, 8}, -- Prideful Gladiator's Leather Armor
    {T, 236, 512}, -- Prideful Gladiator's Ironskin Armor
    {T, 235, 256}, -- Prideful Gladiator's Felweave Armor
    {T, 234, 32}, -- Prideful Gladiator's Dreadplate Armor
    {T, 233, 1024}, -- Prideful Gladiator's Dragonhide Armor
    {T, 232, 4}, -- Prideful Gladiator's Chain Armor
    {T, 219, 128}, -- Grievous Gladiator's Silk Armor
    {T, 218, 2}, -- Grievous Gladiator's Scaled Armor
    {T, 217, 16}, -- Grievous Gladiator's Satin Armor
    {T, 216, 64}, -- Grievous Gladiator's Ringmail Armor
    {T, 215, 1}, -- Grievous Gladiator's Plate Armor
    {T, 214, 8}, -- Grievous Gladiator's Leather Armor
    {T, 213, 512}, -- Grievous Gladiator's Ironskin Armor
    {T, 212, 256}, -- Grievous Gladiator's Felweave Armor
    {T, 211, 32}, -- Grievous Gladiator's Dreadplate Armor
    {T, 210, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {T, 209, 128}, -- Grievous Gladiator's Silk Armor
    {T, 208, 2}, -- Grievous Gladiator's Scaled Armor
    {T, 207, 16}, -- Grievous Gladiator's Satin Armor
    {T, 206, 64}, -- Grievous Gladiator's Ringmail Armor
    {T, 205, 1}, -- Grievous Gladiator's Plate Armor
    {T, 204, 8}, -- Grievous Gladiator's Leather Armor
    {T, 203, 512}, -- Grievous Gladiator's Ironskin Armor
    {T, 202, 256}, -- Grievous Gladiator's Felweave Armor
    {T, 201, 32}, -- Grievous Gladiator's Dreadplate Armor
    {T, 200, 1024}, -- Grievous Gladiator's Dragonhide Armor
    {T, 199, 4}, -- Grievous Gladiator's Chain Armor
    {T, 198, 4}, -- Grievous Gladiator's Chain Armor
    {T, 197, 128}, -- Dreadful Gladiator's Silk Armor
    {T, 196, 2}, -- Dreadful Gladiator's Scaled Armor
    {T, 195, 16}, -- Dreadful Gladiator's Satin Armor
    {T, 194, 64}, -- Dreadful Gladiator's Ringmail Armor
    {T, 193, 1}, -- Dreadful Gladiator's Plate
    {T, 192, 8}, -- Dreadful Gladiator's Leather Armor
    {T, 191, 512}, -- Dreadful Gladiator's Ironskin Armor
    {T, 190, 256}, -- Dreadful Gladiator's Felweave Armor
    {T, 189, 32}, -- Dreadful Gladiator's Dreadplate Armor
    {T, 188, 1024}, -- Dreadful Gladiator's Dragonhide Armor
    {T, 187, 4}, -- Dreadful Gladiator's Chain Armor
    {T, 186, 35}, -- Funerary Plate of the Chosen Dead
    {T, 185, 35}, -- Funerary Plate of the Chosen Dead
    {T, 184, 35}, -- Funerary Plate of the Chosen Dead
    {T, 183, 35}, -- Funerary Plate of the Chosen Dead
    {T, 182, 68}, -- Chains of the Chosen Dead
    {T, 181, 68}, -- Chains of the Chosen Dead
    {T, 180, 68}, -- Chains of the Chosen Dead
    {T, 179, 68}, -- Chains of the Chosen Dead
    {T, 178, 3592}, -- Garb of the Chosen Dead
    {T, 177, 3592}, -- Garb of the Chosen Dead
    {T, 176, 3592}, -- Garb of the Chosen Dead
    {T, 175, 3592}, -- Garb of the Chosen Dead
    {T, 174, 400}, -- Regalia of the Chosen Dead
    {T, 173, 400}, -- Regalia of the Chosen Dead
    {T, 172, 400}, -- Regalia of the Chosen Dead
    {T, 171, 400}, -- Regalia of the Chosen Dead
    {T, 144, 128}, -- Primal Gladiator's Silk Armor
    {T, 143, 128}, -- Primal Gladiator's Silk Armor
    {T, 142, 2}, -- Primal Gladiator's Scaled Armor
    {T, 141, 2}, -- Primal Gladiator's Scaled Armor
    {T, 140, 16}, -- Primal Gladiator's Satin Armor
    {T, 139, 16}, -- Primal Gladiator's Satin Armor
    {T, 138, 64}, -- Primal Gladiator's Ringmail Armor
    {T, 137, 64}, -- Primal Gladiator's Ringmail Armor
    {T, 136, 1}, -- Primal Gladiator's Plate Armor
    {T, 135, 1}, -- Primal Gladiator's Plate Armor
    {T, 134, 8}, -- Primal Gladiator's Leather Armor
    {T, 133, 8}, -- Primal Gladiator's Leather Armor
    {T, 132, 512}, -- Primal Gladiator's Ironskin Armor
    {T, 131, 512}, -- Primal Gladiator's Ironskin Armor
    {T, 130, 256}, -- Primal Gladiator's Felweave Armor
    {T, 129, 256}, -- Primal Gladiator's Felweave Armor
    {T, 128, 32}, -- Primal Gladiator's Dreadplate Armor
    {T, 127, 32}, -- Primal Gladiator's Dreadplate Armor
    {T, 126, 1024}, -- Primal Gladiator's Dragonhide Armor
    {T, 125, 1024}, -- Primal Gladiator's Dragonhide Armor
    {T, 124, 4}, -- Primal Gladiator's Chain Armor
    {T, 123, 4}, -- Primal Gladiator's Chain Armor
    {T, 122, 128}, -- Warmongering Gladiator's Silk Armor
    {T, 121, 128}, -- Warmongering Gladiator's Silk Armor
    {T, 120, 2}, -- Warmongering Gladiator's Scaled Armor
    {T, 119, 2}, -- Warmongering Gladiator's Scaled Armor
    {T, 118, 16}, -- Warmongering Gladiator's Satin Armor
    {T, 117, 16}, -- Warmongering Gladiator's Satin Armor
    {T, 116, 1}, -- Warmongering Gladiator's Plate Armor
    {T, 115, 1}, -- Warmongering Gladiator's Plate Armor
    {T, 114, 8}, -- Warmongering Gladiator's Leather Armor
    {T, 113, 8}, -- Warmongering Gladiator's Leather Armor
    {T, 112, 512}, -- Warmongering Gladiator's Ironskin Armor
    {T, 111, 512}, -- Warmongering Gladiator's Ironskin Armor
    {T, 110, 256}, -- Warmongering Gladiator's Felweave Armor
    {T, 109, 256}, -- Warmongering Gladiator's Felweave Armor
    {T, 108, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {T, 107, 32}, -- Warmongering Gladiator's Dreadplate Armor
    {T, 106, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {T, 105, 1024}, -- Warmongering Gladiator's Dragonhide Armor
    {T, 104, 64}, -- Warmongering Gladiator's Ringmail Armor
    {T, 103, 64}, -- Warmongering Gladiator's Ringmail Armor
    {T, 102, 4}, -- Warmongering Gladiator's Chain Armor
    {T, 101, 4}, -- Warmongering Gladiator's Chain Armor
    {T, 100, 128}, -- Wild Gladiator's Silk Armor
    {T, 99, 128}, -- Wild Gladiator's Silk Armor
    {T, 98, 16}, -- Wild Gladiator's Satin Armor
    {T, 97, 16}, -- Wild Gladiator's Satin Armor
    {T, 96, 256}, -- Wild Gladiator's Felweave Armor
    {T, 95, 256}, -- Wild Gladiator's Felweave Armor
    {T, 94, 2}, -- Wild Gladiator's Scaled Paladin
    {T, 93, 2}, -- Wild Gladiator's Scaled Armor
    {T, 92, 1}, -- Wild Gladiator's Plate Armor
    {T, 91, 1}, -- Wild Gladiator's Plate Armor
    {T, 90, 32}, -- Wild Gladiator's Dreadplate Armor
    {T, 89, 32}, -- Wild Gladiator's Dreadplate Armor
    {T, 88, 512}, -- Wild Gladiator's Ironskin Armor
    {T, 87, 512}, -- Wild Gladiator's Ironskin Armor
    {T, 86, 8}, -- Wild Gladiator's Leather Armor
    {T, 85, 8}, -- Wild Gladiator's Leather Armor
    {T, 84, 1024}, -- Wild Gladiator's Dragonhide Armor
    {T, 83, 1024}, -- Wild Gladiator's Dragonhide Armor
    {T, 82, 64}, -- Wild Gladiator's Ringmail Armor
    {T, 81, 64}, -- Wild Gladiator's Ringmail Armor
    {T, 80, 4}, -- Wild Gladiator's Chain Armor
    {T, 79, 4}, -- Wild Gladiator's Chain Armor
    {T, 78, 128}, -- Primal Combatant's Silk Armor
    {T, 77, 128}, -- Primal Combatant's Silk Armor
    {T, 76, 16}, -- Primal Combatant's Satin Armor
    {T, 75, 16}, -- Primal Combatant's Satin Armor
    {T, 74, 256}, -- Primal Combatant's Felweave Armor
    {T, 73, 256}, -- Primal Combatant's Felweave Armor
    {T, 72, 1}, -- Primal Combatant's Plate Armor
    {T, 71, 1}, -- Primal Combatant's Plate Armor
    {T, 70, 2}, -- Primal Combatant's Scaled Armor
    {T, 69, 2}, -- Primal Combatant's Scaled Armor
    {T, 68, 32}, -- Primal Combatant's Dreadplate Armor
    {T, 67, 32}, -- Primal Combatant's Dreadplate Armor
    {T, 66, 512}, -- Primal Combatant's Ironskin Armor
    {T, 65, 512}, -- Primal Combatant's Ironskin Armor
    {T, 64, 8}, -- Primal Combatant's Leather Armor
    {T, 63, 8}, -- Primal Combatant's Leather Armor
    {T, 62, 1024}, -- Primal Combatant's Dragonhide Armor
    {T, 61, 1024}, -- Primal Combatant's Dragonhide Armor
    {T, 60, 64}, -- Primal Combatant's Ringmail Armor
    {T, 59, 64}, -- Primal Combatant's Ringmail Armor
    {T, 58, 4}, -- Primal Combatant's Chain Armor
    {T, 57, 4}, -- Primal Combatant's Chain Armor
    {T, 56, 256}, -- Warmongering Combatant's Felweave Armor
    {T, 55, 256}, -- Warmongering Combatant's Felweave Armor
    {T, 54, 128}, -- Warmongering Combatant's Silk Armor
    {T, 53, 128}, -- Warmongering Combatant's Silk Armor
    {T, 52, 16}, -- Warmongering Combatant's Satin Armor
    {T, 51, 16}, -- Warmongering Combatant's Satin Armor
    {T, 50, 1}, -- Warmongering Combatant's Plate Armor
    {T, 49, 1}, -- Warmongering Combatant's Plate Armor
    {T, 48, 2}, -- Warmongering Combatant's Scaled Armor
    {T, 47, 2}, -- Warmongering Combatant's Scaled Armor
    {T, 46, 32}, -- Warmongering Combatant's Dreadplate Armor
    {T, 45, 32}, -- Warmongering Combatant's Dreadplate Armor
    {T, 44, 512}, -- Warmongering Combatant's Ironskin Armor
    {T, 43, 512}, -- Warmongering Combatant's Ironskin Armor
    {T, 42, 8}, -- Warmongering Combatant's Leather Armor
    {T, 41, 8}, -- Warmongering Combatant's Leather Armor
    {T, 40, 1024}, -- Warmongering Combatant's Dragonhide Armor
    {T, 39, 1024}, -- Warmongering Combatant's Dragonhide Armor
    {T, 38, 64}, -- Warmongering Combatant's Ringmail Armor
    {T, 37, 64}, -- Warmongering Combatant's Ringmail Armor
    {T, 36, 4}, -- Warmongering Combatant's Chain Armor
    {T, 35, 4}, -- Warmongering Combatant's Chain Armor
    {T, 34, 256}, -- Wild Combatant's Felweave Armor
    {T, 33, 256}, -- Wild Combatant's Felweave Armor
    {T, 32, 16}, -- Wild Combatant's Satin Armor
    {T, 31, 16}, -- Wild Combatant's Satin Armor
    {T, 30, 128}, -- Wild Combatant's Silk Armor
    {T, 29, 128}, -- Wild Combatant's Silk Armor
    {T, 28, 512}, -- Wild Combatant's Ironskin Armor
    {T, 27, 512}, -- Wild Combatant's Ironskin Armor
    {T, 26, 1024}, -- Wild Combatant's Dragonhide Armor
    {T, 25, 1024}, -- Wild Combatant's Dragonhide Armor
    {T, 24, 8}, -- Wild Combatant's Leather Armor
    {T, 23, 8}, -- Wild Combatant's Leather Armor
    {T, 22, 1}, -- Wild Combatant's Plate Armor
    {T, 21, 1}, -- Wild Combatant's Plate Armor
    {T, 20, 2}, -- Wild Combatant's Scaled Armor
    {T, 19, 2}, -- Wild Combatant's Scaled Armor
    {T, 18, 32}, -- Wild Combatant's Dreadplate Armor
    {T, 17, 32}, -- Wild Combatant's Dreadplate Armor
    {T, 16, 64}, -- Wild Combatant's Ringmail Armor
    {T, 15, 64}, -- Wild Combatant's Ringmail Armor
    {T, 14, 4}, -- Wild Combatant's Chain Armor
    {T, 13, 4}, -- Wild Combatant's Chain Armor
};