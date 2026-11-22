---@diagnostic disable: undefined-global
-- Test fixture: exercises the PTR/Beta fallback-build code path.
-- Ach(42300) "Two Minutes to Midnight" exists on the live "wow" build (12.0.7.68887)
-- and is listed FIRST, so build auto-detection (which probes the first id in the
-- file) picks "wow" as the primary build.
-- Ach(63692) "Kith'ix" exists only on the "wowxptr" (PTR) build (12.1.5.70077)
-- locally — it is NOT present in the primary "wow" build. Before the fallback fix,
-- this id would be misreported as "not found in DB" (a false id-exists failure)
-- because the whole file was queried against one build only. The verifier must
-- retry ids missing from the primary build against remaining candidate builds
-- (wowt, wow_beta, ...) and merge in anything it finds there.
-- No -Build override is passed for this fixture — it must be run through
-- Verify-AchievementData.ps1 without -Build so auto-detection AND the fallback
-- pass both actually run.
-- 63692 is live since 12.1.5, so the 12.1.7 ids (PTR 12.1.7.71087 until it is live)
-- now carry the fallback pass; Test-VerifyScript.ps1 probes 63734. They also cover
-- the 12.1.7 reward texts:
-- "Small Pile of Bound Silver" (:TaleboundSilver()), "Traveling Raven: Hexed Tiny
-- Tome" (a toy) and "Traveling Raven: Voidlight Marl Crystal" (a container, :Other()).

KrowiAF.AchievementData["03_00_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 0, 2},
    Ach(42300):Mount():Title():Obtainable("Before", "Version", {12, 0, 1}), -- Two Minutes to Midnight
    Ach(63692), -- Kith'ix
    Ach(63734):TaleboundSilver(), -- Veteran: The Giant of Greenthistle Wood
    Ach(64464):Toy(), -- Stories Shared
    Ach(64418):Other(), -- The Tale of the Puzzle Master Rewarded
}
