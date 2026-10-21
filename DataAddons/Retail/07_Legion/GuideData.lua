local Guide = KrowiAF.Guide
local faction = KrowiAF.Enum.Faction

-- The NPCs and entrances were measured in each class hall with /kafwhere on 2026-10-11 (step 0 of
-- docs/work/2026-10-11-achievement-guides/plan.md); a portal's spot is its area POI's position. Every Legendary Research
-- achievement has root operator 8: either Tier VII talent completes it. A hall reached only by a class spell names the
-- spell, any other the hall, at the spot where the player walks in (docs/work/2026-10-21-legendary-research-guides).
KrowiAF.GuideData.Legion = {
    Guide(60962) -- Legendary Research of the Ebon Blade
        :Travel(50977) -- Death Gate
        :Npc(97485, "Archivist Zubashi", 648, 47.7, 53.8) -- Acherus, upper floor; /kafwhere on 2026-10-11
        :Criteria("Any"), -- Frost and Death or Roster of Champions: the root operator is 8, either one completes it
    Guide(60963) -- Legendary Research of the Illidari
        :Area(8023, 627, 98.0, 69.3) -- The Fel Hammer, through the Illidari Gateway on Dalaran's east edge
        :Npc(108527, "Loramus Thalipedes", 721, 55.3, 62.7) -- the Fel Hammer's other floor
        :Criteria("Any"),
    Guide(60964) -- Legendary Research of the Dreamgrove
        :Travel(193753) -- Dreamwalk, into the Emerald Dreamway
        :Area(7846, 715, 45.2, 26.4) -- The Dreamgrove, through its portal in the Emerald Dreamway
        :Npc(97989, "Leafbeard the Storied", 747, 32.7, 29.4)
        :Criteria("Any"),
    Guide(60965) -- Legendary Research of the Unseen Path
        :Area(7877, 627, 72.9, 41.2) -- Trueshot Lodge, on the eagle Talua (108868) offers in Dalaran
        :Npc(108050, "Survivalist Bahn", 739, 58.7, 51.1)
        :Criteria("Any"),
    Guide(60966) -- Legendary Research of the Tirisgarde
        :Travel(193759) -- Teleport: Hall of the Guardian
        :Npc(108331, "Chronicler Elrianne", 734, 74.9, 28.9)
        :Criteria("Any"),
    Guide(60967) -- Legendary Research of Five Dawns
        :Travel(126892) -- Zen Pilgrimage
        :Npc(98939, "Number Nine Jia", 709, 53.0, 59.8)
        :Criteria("Any"),
    Guide(60968) -- Legendary Research of the Silver Hand
        :Poi(5057, 627, 32.7, 69.8):Faction(faction.Alliance) -- Sanctum of Light, each faction's portal in Dalaran
        :Poi(5058, 627, 61.9, 13.5):Faction(faction.Horde)
        :Npc(109901, "Sir Alamande Graythorn", 24, 39.9, 56.5)
        :Criteria("Any"),
    Guide(60969) -- Legendary Research of the Netherlight Conclave
        :Poi(5062, 627, 39.6, 57.3):Faction(faction.Alliance) -- Netherlight Temple, each faction's portal in Dalaran
        :Poi(5063, 627, 62.9, 17.6):Faction(faction.Horde)
        :Npc(110725, "Archon Torias", 702, 56.0, 40.7)
        :Criteria("Any"),
    Guide(60970) -- Legendary Research of the Uncrowned
        :Poi(5102, 627, 52.7, 70.3) -- Hall of Shadows, the bookcase door at "Red" Jack Findle; the hall's map is also named Dalaran
        :Npc(105998, "Winstone Wolfe", 626, 46.0, 69.2)
        :Criteria("Any"),
    Guide(60971) -- Legendary Research of the Maelstrom
        :Poi(5059, 627, 67.1, 48.1)
        :Npc(112199, "Journeyman Goldmine", 726, 33.4, 58.2)
        :Criteria("Any"),
    Guide(60972) -- Legendary Research of the Black Harvest
        :Poi(5061, 628, 27.7, 44.3) -- Dreadscar Rift, on the Underbelly floor below Dalaran where the portal stands
        :Npc(108018, "Archivist Melinda", 717, 55.3, 41.0)
        :Criteria("Any"),
    Guide(60973) -- Legendary Research of the Valarjar
        :Poi(5060, 627, 75.0, 47.5) -- Skyhold: stand in the light there and use the extra action button
        :Npc(107994, "Einar the Runecaster", 695, 46.5, 29.0)
        :Criteria("Any"),
}