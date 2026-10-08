# Spec: Transmog set progress in the achievement tooltip stops working on 12.1.5
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. On Retail 12.1.5 and later, hovering an achievement with transmog set data (for example 40469 I'm Bringing Nerub-ack, or 16395 Vaulternative Fashion) shows the transmog set progress lines under "Objectives progress", not a "Collecting data" that never resolves. This holds whether or not the client loads Blizzard's deprecated API fallbacks.
2. The tooltip behaves as today on Mists of Pandaria Classic (5.5.4) and Wrath Classic (3.80.2), including the Classic item tooltip hook in `Data/TooltipData.lua`.
3. No addon file outside `Libs/` reads a global that Blizzard has removed from the Retail client. The offline lint reports such a read with its file and line, and is the reproduction for this bug.
4. The headless stubs do not provide a global that the Retail client no longer has.

## Root cause
- `Gui/AchievementTooltip/TransmogObjectives.lua:41` and `:44` call the bare global `GetItemInfo` to read an item's equip slot (`select(9, ...)`). The calls run inside the coroutine `AddCriteria` (created at `:210`), which `GET_ITEM_INFO_RECEIVED` resumes (`:7-11`).
- On 12.1.0 that global exists only because Blizzard's `Blizzard_DeprecatedItemScript` defines `GetItemInfo = C_Item.GetItemInfo` (`Interface/AddOns/Blizzard_DeprecatedItemScript/Deprecated_ItemScript.lua`, Gethe/wow-ui-source `live`, 12.1.0.69933). Even there it does so only when the `loadDeprecationFallbacks` CVar is on: the file returns early otherwise.
- 12.1.5 (Gethe/wow-ui-source `ptr2`, 12.1.5.70077) deletes `Blizzard_DeprecatedItemScript` along with nine other deprecation addons: CurrencyScript, Glue, ItemSocketInfo, LFG, PetInfo, PvpScript, SoundScript, TradeInfo and WorldElapsedTimerTypes. No global `GetItemInfo` is defined anywhere in its source; the API documentation lists only `C_Item.GetItemInfo`.
- The call raises "attempt to call a nil value", and `coroutine.resume` (`:211`, `:9`) returns that error instead of raising it, so nothing reaches BugGrabber. The tooltip keeps the "Collecting data" line added at `:179`. `GET_ITEM_INFO_RECEIVED` stays registered because the unregister at `:205` is never reached, and every later item-info event resumes a dead coroutine.
- `Data/TooltipData.lua:177` makes the same call, on the `tocVersion < 100002` path only (`:223-237`), which is Classic. 12.1.5 does not change it, but the Classic clients may follow Retail later.
- Why nothing caught it: the `globals` lint rule only checks writes, and the `.luarc.json` / `ketho.wow-api` annotations still know `GetItemInfo` from the deprecation file. The headless runner stubs `GetItemInfo` in `.claude/tools/headless/client-env.lua:140`.
- `C_Item.GetItemInfo` exists with the same 17 return values on Retail (`live`, `ptr2`), Mists Classic (`classic`, 5.5.4.70032) and Wrath Classic (`classic_titan`, 3.80.2.70177): position 9 is `itemEquipLoc` and 12 is `classID`.

## Design
Recommended: option A.

- Replace the three calls with `C_Item.GetItemInfo`. No fallback is needed, because every supported client has it.
- Add a lint rule `removed-api` to `.claude/tools/Check-Repo.ps1`. Its list, `.claude/tools/Check-Repo.removed-api`, has one global per line with the Retail build that removed it. The list is seeded from the global assignments in the ten deprecation addons 12.1.5 deletes, as found in the 12.1.0 source.
- The rule reuses the `luac -l` pass the `globals` rule already makes, and reports every `GETGLOBAL` of a listed name in an addon file outside `Libs/` as an error with file and line.
- Before the fix the rule reports `TransmogObjectives.lua:41`, `:44` and `TooltipData.lua:177`. That is the test-first reproduction, and it stays behind as the guard for this whole class of bug.
- Drop `GetItemInfo` from the headless `knownGlobals` stub list in `client-env.lua`, which has no reader at load time.

## Options considered
- **A. Swap the calls, and add a `removed-api` lint rule as the reproduction (recommended).**
  - What players see: the set progress fills in again on 12.1.5.
  - The rule fails now and passes after the fix. It covers every global the ten deleted addons provided, not just `GetItemInfo`, and runs on every lint and in the Stop hook.
  - Departure from policy: the reproduction is a lint finding, not a scenario in `Tests/`. A removed API is a static fact about a client, and no in-game run on live 12.1.0 can show it while the fallbacks are loaded.
- **B. Swap the calls, and reproduce with a scenario in a new `tooltip` suite.**
  - The headless runner would load the real `TransmogObjectives.lua` against models of `Krowi_Tooltip`, `C_TransmogSets`, `C_TransmogCollection`, `C_Item` and the item-info event, on a 12.1.5 environment without the global. It would record "Collecting data" with the event still registered, against the target "set progress lines, event unregistered".
  - Players see the same as under A, and the policy is followed literally.
  - Costs:
    - The in-game run cannot reproduce the bug on 12.1.0 when the fallbacks are on, so the game and headless results would differ until 12.1.5 is live.
    - It catches only this one call.
    - It is about a day of modelling, against the 2026-10-13 deadline.
- **C. A and B together.** Both guards, B's cost.
- **D. Swap the calls only.** Players see the same, but nothing reproduces the bug or guards against the next removed API. Not recommended.

## Areas of concern
- **Taint and secret values:** none. These are tooltip and tooltip-hook reads of item info. No Blizzard frame, function or protected API is touched, and nothing is written to the global environment.
- **Retail and Classic:** `C_Item.GetItemInfo` is on every supported client with the same returns (see Root cause). On Classic the `TooltipData.lua` path changes from the deprecated global to its replacement and behaves the same.
- **Plugins and skins:** none. The section and the hook are internal.
- **Saved variables and migrations:** none.
- **Localization:** none.
- **Data snapshots:** none. No data or category file changes.
- **Lint:**
  - The new rule must not flag `Libs/` (vendored, fixed upstream). None of the bundled libraries reads a listed global (checked in the 12.1.5 diff).
  - It must not flag the `.claude/` tooling.
  - It must not flag an addon's own local of the same name: `GETGLOBAL` only lists real global reads.

## Verification
- **Reproduction:** with the rule and list added and the calls unchanged, `Check-Repo.ps1 -ChangedOnly` fails with three `removed-api` errors, at `TransmogObjectives.lua:41`, `:44` and `TooltipData.lua:177`.
- **After the fix:** `Check-Repo.ps1` (full run) is clean, and the headless data load and every suite pass.
- **In game, Retail 12.1.0 now and 12.1.5 after 2026-10-13:**
  - `/dump GetCVarDefault("loadDeprecationFallbacks"), GetCVar("loadDeprecationFallbacks"), GetItemInfo ~= nil` is recorded in the plan, which answers the intent's open question.
  - Hovering 40469 and 16395 in the addon's window shows the set progress lines.
  - `Read-GameErrors.ps1` shows nothing new.
- **In game, Mists Classic:** hovering an achievement with transmog set data shows the same as before, and an item tooltip of a recipe still skips the embedded item.

## Decision
Option C, both guards, chosen by Krowi (maintainer) on 2026-10-08. A was recommended. The fix swaps the three calls to `C_Item.GetItemInfo`. The reproduction is twofold, and both are built before the fix:
- the `removed-api` lint rule with its list (A);
- a scenario in a new `tooltip` suite that runs the real transmog section on a 12.1.5 environment (B).

Accepting the spec also accepts the intent.