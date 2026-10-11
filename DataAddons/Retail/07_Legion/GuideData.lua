local _, addon = ...
local Guide = KrowiAF.Guide

KrowiAF.GuideData.Legion = {
    Guide(60962) -- Legendary Research of the Ebon Blade
        :Travel(50977) -- Death Gate
        :Npc(97485, addon.L["Archivist Zubashi"], 648, 47.7, 53.8) -- Acherus, upper floor; /kafwhere on 2026-10-11
        :Criteria() -- Frost and Death, Roster of Champions
        :Tip(addon.L["Either Tier VII upgrade completes it."]),
}