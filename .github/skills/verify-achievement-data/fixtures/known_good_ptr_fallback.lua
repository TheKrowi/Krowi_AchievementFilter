---@diagnostic disable: undefined-global
-- Test fixture: exercises the PTR/Beta fallback-build code path.
-- Ach(42300) "Two Minutes to Midnight" exists on the live "wow" build (12.0.7.68887)
-- and is listed FIRST, so build auto-detection (which probes the first id in the
-- file) picks "wow" as the primary build.
-- Ach(62282) "Altar of Fangs" exists only on the "wowt" (PTR) build (12.1.0.68914)
-- locally — it is NOT present in the primary "wow" build. Before the fallback fix,
-- this id would be misreported as "not found in DB" (a false id-exists failure)
-- because the whole file was queried against one build only. The verifier must
-- retry ids missing from the primary build against remaining candidate builds
-- (wowt, wow_beta, ...) and merge in anything it finds there.
-- No -Build override is passed for this fixture — it must be run through
-- Verify-AchievementData.ps1 without -Build so auto-detection AND the fallback
-- pass both actually run.

KrowiAF.AchievementData["03_00_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 0, 2},
    Ach(42300):Mount():Title():Obtainable("Before", "Version", {12, 0, 1}), -- Two Minutes to Midnight
    Ach(62282), -- Altar of Fangs
}
