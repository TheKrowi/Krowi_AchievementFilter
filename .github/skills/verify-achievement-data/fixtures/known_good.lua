---@diagnostic disable: undefined-global
-- Test fixture: known-good WotLK entries.
-- All 8 checks should pass → script must exit 0 with "All 8 entries passed."
-- Build: wow_classic (WotLK Classic). IDs sourced from verified Classic/03 and Shared/03 files.
--
-- Covers every passing code path for all 5 checks:
--   Ach(938)  — plain entry with correct comment       → id-exists + description-lang pass
--   Ach(418)  — :Title() + DB has title                → title-reward pass
--   Ach(714)a — :Title() + :AutoFactionSplit() + merged comment  → faction (Horde split) + description-lang AutoFactionSplit merge pass
--   Ach(940)  — plain, no reward, no method            → reward-item non-false-positive
--   Ach(2136) — :Mount() + DB has mount reward         → reward-item pass (DB reward + method present)
--   Ach(714)b — :Title() + :FactionSplit() (non-Auto)  → description-lang non-Auto path (uses primary title)
--   Ach(938)b — no comment                             → description-lang skips empty comment
--   Ach(938)c — :IsPvP(), no reward                   → :IsPvP() is not a reward method (no false-positive)

KrowiAF.AchievementData["03_00_02"] = {
	{KrowiAF.SetAchievementPatch, 3, 0, 2},
	Ach(938), -- The Snows of Northrend
	Ach(418):Title(), -- Merciless Gladiator: Season 2
	Ach(714):Title():AutoFactionSplit(faction.Horde, 907), -- The Conqueror / Justicar
	Ach(940), -- The Green Hills of Stranglethorn
	Ach(2136):Mount(), -- Glory of the Hero
	Ach(714):Title():FactionSplit(faction.Horde, 907), -- The Conqueror
	Ach(938),
	Ach(938):IsPvP(), -- The Snows of Northrend
}
