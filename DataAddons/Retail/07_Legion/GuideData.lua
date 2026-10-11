local _, addon = ...
local Guide = KrowiAF.Guide

KrowiAF.GuideData.Legion = {
    Guide(60962) -- Legendary Research of the Ebon Blade
        :Travel(50977) -- Death Gate
        :Npc(97485, addon.L["Archivist Zubashi"], 648, 47.7, 53.8) -- Acherus, upper floor; /kafwhere on 2026-10-11
        :Criteria("Any"), -- Frost and Death or Roster of Champions: the root operator is 8, either one completes it
}