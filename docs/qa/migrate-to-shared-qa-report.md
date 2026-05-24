# QA Report — migrate-to-shared (WoTLK, Cata, MoP)

**Branch under test:** `dev`  
**Reference (old data):** `main` branch on GitHub  
**Scope:** `DataAddons/Shared/`, `DataAddons/Retail/`, and `DataAddons/Classic/` for expansions 03, 04, 05  
**Date:** 2025-07-10

---

## Summary

| Check | WoTLK | Cata | MoP |
|-------|-------|------|-----|
| ID count — Retail parity | ✅ PASS | ✅ PASS | ✅ PASS |
| ID count — Classic parity | ✅ PASS | ✅ PASS | ✅ PASS |
| Exclusive split — Retail ∩ Shared | ✅ PASS | ✅ PASS | ✅ PASS |
| Exclusive split — Classic ∩ Shared | ✅ PASS | ✅ PASS | ✅ PASS |
| Patch key coverage | ✅ PASS | ✅ PASS | ✅ PASS |
| Classic-only patches preserved | ✅ PASS | ✅ PASS | ✅ PASS |
| `HousingDecor` flag placement | ✅ PASS | ✅ PASS | ✅ PASS |
| Client-specific `Obtainable()` spot checks | ✅ PASS | ✅ PASS | ✅ PASS |

**Overall result: ✅ ALL PASS — no data loss, no misplaced entries, no duplicates.**

---

## 1. ID Count Verification

Achievement IDs were counted per file using the pattern `Ach(\d+)`. The expected invariant is:

- `dev Retail + dev Shared` = `main Retail`
- `dev Classic + dev Shared` = `main Classic`

| Expansion | File | main count | dev count | Delta |
|-----------|------|-----------|-----------|-------|
| WoTLK | Retail (main) | 1195 | — | — |
| WoTLK | Retail (dev) | 44 | — | — |
| WoTLK | Shared (dev) | 1151 | — | — |
| WoTLK | **Retail dev + Shared** | — | **1195** | ✅ 0 |
| WoTLK | Classic (main) | 1273 | — | — |
| WoTLK | Classic (dev) | 122 | — | — |
| WoTLK | **Classic dev + Shared** | — | **1273** | ✅ 0 |
| Cata | Retail (main) | 428 | — | — |
| Cata | Retail (dev) | 20 | — | — |
| Cata | Shared (dev) | 408 | — | — |
| Cata | **Retail dev + Shared** | — | **428** | ✅ 0 |
| Cata | Classic (main) | 450 | — | — |
| Cata | Classic (dev) | 42 | — | — |
| Cata | **Classic dev + Shared** | — | **450** | ✅ 0 |
| MoP | Retail (main) | 755 | — | — |
| MoP | Retail (dev) | 6 | — | — |
| MoP | Shared (dev) | 749 | — | — |
| MoP | **Retail dev + Shared** | — | **755** | ✅ 0 |
| MoP | Classic (main) | 819 | — | — |
| MoP | Classic (dev) | 70 | — | — |
| MoP | **Classic dev + Shared** | — | **819** | ✅ 0 |

No achievements were lost or duplicated in any expansion.

---

## 2. Exclusive Split (No Duplicate IDs)

Every achievement ID must appear in **exactly one** location per client: either the Shared `_S` table or the client-specific table, never both.

Overlap was computed by extracting all IDs from each file and checking for intersection.

| Expansion | Retail ∩ Shared | Classic ∩ Shared |
|-----------|----------------|-----------------|
| WoTLK | **0** ✅ | **0** ✅ |
| Cata | **0** ✅ | **0** ✅ |
| MoP | **0** ✅ | **0** ✅ |

The exclusive split invariant holds across all six file pairs.

---

## 3. Patch Key Coverage

### 3.1 WoTLK (`03_WrathOfTheLichKing`)

| Patch | Shared (`_S`) | Retail (client) | Classic (client) | Notes |
|-------|--------------|-----------------|-----------------|-------|
| `03_00_02` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed: shared + client-specific entries |
| `03_01_00` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `03_02_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `03_02_02` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `03_03_00` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `03_03_03` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `03_03_05` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `03_04_00` | — | — | ✅ Classic-only | Untouched |
| `03_04_01` | — | — | ✅ Classic-only | Untouched |
| `03_04_02` | — | — | ✅ Classic-only | Untouched |
| `03_04_03` | — | — | ✅ Classic-only | Untouched |

### 3.2 Cataclysm (`04_Cataclysm`)

| Patch | Shared (`_S`) | Retail (client) | Classic (client) | Notes |
|-------|--------------|-----------------|-----------------|-------|
| `04_00_01` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `04_00_03` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `04_00_06` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `04_01_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `04_02_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `04_02_02` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `04_03_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `04_03_02` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `04_04_00` | — | — | ✅ Classic-only | Untouched |
| `04_04_01` | — | — | ✅ Classic-only | Untouched |

### 3.3 Mists of Pandaria (`05_MistsOfPandaria`)

| Patch | Shared (`_S`) | Retail (client) | Classic (client) | Notes |
|-------|--------------|-----------------|-----------------|-------|
| `05_00_04` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `05_01_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `05_02_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `05_03_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `05_04_00` | ✅ `_S` exists | ✅ client block | ✅ client block | Mixed |
| `05_04_01` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `05_04_02` | ✅ `_S` exists | — | — | Fully shared; removed from both clients |
| `05_05_00` | — | — | ✅ Classic-only | Untouched |
| `05_05_01` | — | — | ✅ Classic-only | Untouched |
| `05_05_03` | — | — | ✅ Classic-only | Untouched |

---

## 4. Classic-Only Patch Preservation

Patches that exist only in Classic (and therefore should not have been touched by migration) are confirmed present in the dev Classic files:

| Expansion | Classic-only patches | Dev status |
|-----------|---------------------|------------|
| WoTLK | `03_04_00`, `03_04_01`, `03_04_02`, `03_04_03` | ✅ All present |
| Cata | `04_04_00`, `04_04_01` | ✅ All present |
| MoP | `05_05_00`, `05_05_01`, `05_05_03` | ✅ All present |

No Classic-only patch content was altered or migrated into Shared.

---

## 5. Client-Specific Flag Placement

### 5.1 `HousingDecor()` Flag

`HousingDecor()` is a Retail-only flag. Verified that it appears **only** in Retail client-specific blocks and **never** in any Shared file.

| Expansion | Retail count | Shared count | Classic count |
|-----------|-------------|-------------|--------------|
| WoTLK | 14 | 0 ✅ | 0 ✅ |
| Cata | 4 | 0 ✅ | 0 ✅ |
| MoP | 2 | 0 ✅ | 0 ✅ |

The Retail count matches the count in the old `main` branch file for all three expansions.

### 5.2 Differing `Obtainable()` Arguments

Entries where Retail and Classic use different `Obtainable()` arguments were confirmed to be correctly split between client-specific blocks (not placed in Shared).

| ID | Achievement | Retail (dev) | Classic (dev) | In Shared? |
|----|-------------|-------------|--------------|------------|
| `2398` | WoW's 4th Anniversary | `Obtainable("From","Date",{2008,11,23},"Until","Date",{2008,12,7})` | `Obtainable("Never")` | 0 ✅ |
| `4824` | Collector's Edition: Mini Thor | plain `Ach(4824)` | `Obtainable("Never")` | 0 ✅ |
| `4832` | Friends In Even Higher Places | `Obtainable("Before","Date",{2019,6,11})` | `Obtainable("Never")` | 0 ✅ |
| `7853` | WoW's 9th Anniversary | `Obtainable("From","Date",{2013,11,18},"Until","Date",{2013,12,1})` | `Obtainable("Never")` | 0 ✅ |

All client-specific differences are correctly represented in the appropriate client file only.

---

## 6. Issues Found

**None.** All checks passed without exception.

---

## 7. Methodology

All checks were performed using PowerShell `Select-String` against the local dev branch files in
`e:\World of Warcraft Addon Development\Krowi_AchievementFilter\DataAddons\`
and against the raw GitHub `main` branch files fetched via `Invoke-WebRequest`.

- **ID counts**: `Select-String -Pattern 'Ach\((\d+)\)'` per file (one `Ach()` call per line).
- **Exclusive split**: IDs extracted with `-AllMatches`, converted to `[int]`, then set intersection via `-in` operator.
- **Patch keys**: `Select-String -Pattern 'KrowiAF\.AchievementData\['` per file.
- **Flag placement**: Targeted `Select-String` for `HousingDecor` and specific achievement IDs across all three file variants.
