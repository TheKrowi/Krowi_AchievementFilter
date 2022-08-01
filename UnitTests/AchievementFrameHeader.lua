-- -- [[ Namespaces ]] --
-- local _, addon = ...;
-- local unitTests = addon.UnitTests;

-- if not unitTests.Active then return; end

-- local header = addon.GUI.AchievementFrameHeader;
-- local registerTests = unitTests:RegisterGroup("AchievementFrameHeader");

-- local charactersMock = {};
-- charactersMock["Player-1303-0B62E475"] = {
--     Name = "Krowi",
--     Faction = "Alliance",
--     Class = "PALADIN",
--     Points = 31825,
--     Realm = "Frostmane"
-- };
-- charactersMock["Nils"] = {
--     Name = nil,
--     Faction = nil,
--     Class = nil,
--     Points = nil,
--     Realm = nil
-- };
-- charactersMock["Player-1303-0B61DA55"] = {
--     Name = "Dohaa",
--     Faction = "Horde",
--     Class = "DRUID",
--     Points = 5940,
--     Realm = "Frostmane"
-- };
-- charactersMock["Player-3391-0B61DA55"] = {
--     Name = "SbyKrowi",
--     Faction = "Alliance",
--     Class = "WARRIOR",
--     Points = 122502,
--     Realm = "Silvermoon"
-- };

-- -- CompareRealms
-- registerTests("CompareRealms a = nil", function()
--     WoWUnit.AreEqual(true, header.CompareRealmsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Nils"]));
-- end);
-- registerTests("CompareRealms b = nil", function()
--     WoWUnit.AreEqual(false, header.CompareRealmsFunc(charactersMock["Nils"], charactersMock["Player-1303-0B62E475"]));
-- end);
-- registerTests("CompareRealms a = b = nil", function()
--     WoWUnit.AreEqual(false, header.CompareRealmsFunc(charactersMock["Nils"], charactersMock["Nils"]));
-- end);

-- registerTests("CompareRealms a = b", function()
--     WoWUnit.AreEqual(true, header.CompareRealmsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-1303-0B62E475"]));
-- end);

-- registerTests("CompareRealms a < b", function()
--     WoWUnit.AreEqual(true, header.CompareRealmsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-3391-0B61DA55"]));
-- end);
-- registerTests("CompareRealms a > b", function()
--     WoWUnit.AreEqual(false, header.CompareRealmsFunc(charactersMock["Player-3391-0B61DA55"], charactersMock["Player-1303-0B62E475"]));
-- end);

-- registerTests("CompareRealms a < b reverse", function()
--     WoWUnit.AreEqual(false, header.CompareRealmsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-3391-0B61DA55"], true));
-- end);
-- registerTests("CompareRealms a > b reverse", function()
--     WoWUnit.AreEqual(true, header.CompareRealmsFunc(charactersMock["Player-3391-0B61DA55"], charactersMock["Player-1303-0B62E475"], true));
-- end);

-- -- CompareNames
-- registerTests("CompareNames a = nil", function()
--     WoWUnit.AreEqual(true, header.CompareNamesFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Nils"]));
-- end);
-- registerTests("CompareNames b = nil", function()
--     WoWUnit.AreEqual(false, header.CompareNamesFunc(charactersMock["Nils"], charactersMock["Player-1303-0B62E475"]));
-- end);
-- registerTests("CompareNames a = b = nil", function()
--     WoWUnit.AreEqual(false, header.CompareNamesFunc(charactersMock["Nils"], charactersMock["Nils"]));
-- end);

-- registerTests("CompareNames a = b", function()
--     WoWUnit.AreEqual(true, header.CompareNamesFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-1303-0B62E475"]));
-- end);

-- registerTests("CompareNames a < b", function()
--     WoWUnit.AreEqual(true, header.CompareNamesFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-3391-0B61DA55"]));
-- end);
-- registerTests("CompareNames a > b", function()
--     WoWUnit.AreEqual(false, header.CompareNamesFunc(charactersMock["Player-3391-0B61DA55"], charactersMock["Player-1303-0B62E475"]));
-- end);

-- registerTests("CompareNames a < b reverse", function()
--     WoWUnit.AreEqual(false, header.CompareNamesFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-3391-0B61DA55"], true));
-- end);
-- registerTests("CompareNames a > b reverse", function()
--     WoWUnit.AreEqual(true, header.CompareNamesFunc(charactersMock["Player-3391-0B61DA55"], charactersMock["Player-1303-0B62E475"], true));
-- end);

-- -- ComparePoints
-- registerTests("ComparePoints a = nil", function()
--     WoWUnit.AreEqual(true, header.ComparePointsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Nils"]));
-- end);
-- registerTests("ComparePoints b = nil", function()
--     WoWUnit.AreEqual(false, header.ComparePointsFunc(charactersMock["Nils"], charactersMock["Player-1303-0B62E475"]));
-- end);
-- registerTests("ComparePoints a = b = nil", function()
--     WoWUnit.AreEqual(false, header.ComparePointsFunc(charactersMock["Nils"], charactersMock["Nils"]));
-- end);

-- registerTests("ComparePoints a = b", function()
--     WoWUnit.AreEqual(true, header.ComparePointsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-1303-0B62E475"]));
-- end);

-- registerTests("ComparePoints a < b", function()
--     WoWUnit.AreEqual(false, header.ComparePointsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-3391-0B61DA55"]));
-- end);
-- registerTests("ComparePoints a > b", function()
--     WoWUnit.AreEqual(true, header.ComparePointsFunc(charactersMock["Player-3391-0B61DA55"], charactersMock["Player-1303-0B62E475"]));
-- end);

-- registerTests("ComparePoints a < b reverse", function()
--     WoWUnit.AreEqual(true, header.ComparePointsFunc(charactersMock["Player-1303-0B62E475"], charactersMock["Player-3391-0B61DA55"], true));
-- end);
-- registerTests("ComparePoints a > b reverse", function()
--     WoWUnit.AreEqual(false, header.ComparePointsFunc(charactersMock["Player-3391-0B61DA55"], charactersMock["Player-1303-0B62E475"], true));
-- end);