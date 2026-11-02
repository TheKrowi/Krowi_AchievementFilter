# Plan: The options window's Overview shows the sections as cards
Spec: [spec.md](spec.md). Status: accepted

## Context
Overview (new in 105.0) lists the sections as gold links under their group names, the same list as the navigation beside it. Krowi wants the mockup's boxes instead (2026-11-02). Accepted in the spec the same day:
- a card per section, three to a row, under each group's header (22 cards in 9 rows);
- each card has the section's first help picture (cut to the card from its top left), its name with NEW, and a line on what the section covers;
- a section without a picture gets a game icon (A1);
- every card carries a line: 22 new strings in every locale (B1).

Work happens in the worktree `.claude/worktrees/feature-2026-11-02-overview-cards` on branch `feature/2026-11-02-overview-cards`. Intent and spec are committed in 898b337d.

## Files that change
| File | Change |
|---|---|
| `Krowi_Options/Krowi_Options.lua` | Minor 2 to 3. The config comment names the `Cards` element under `GetElements`. |
| `Krowi_Options/Rows.xml` | **New `Krowi_OptionsCardTemplate`** (Button, mixin `Krowi_OptionsCardMixin`) holds: <br>• `Fill` and a 1 px `Border` (four edge textures, WHITE8X8 tinted); <br>• `Picture` (top, 86 high, inset 1); <br>• `Icon` (48 x 48, centred on the picture area, hidden unless used); <br>• `Name` (`GameFontNormal`, one line); <br>• `NewFeature` (`NewFeatureLabelTemplate`, scale .8, as the navigation's); <br>• `Line` (`GameFontDisableSmall`, wraps, `justifyV` TOP); <br>• OnClick, OnEnter and OnLeave. <br>**New `Krowi_OptionsCardRowTemplate`** (Frame, mixin `Krowi_OptionsCardRowMixin`) holds the three cards, made in `OnLoad` as the grid row makes its cells (`RowMixins.lua:426-440`). |
| `Krowi_Options/RowMixins.lua` | **`lib.CardWidth(rowWidth)`** returns `(rowWidth - 2 * 12) / 3`. **`lib.CardCrop(card, width, height)`** returns the texture coordinates that fill `width x height` from the picture's top left, inside its `TexCoords` part: scale = `max(width / W, height / H)`, visible = `width / scale` x `height / scale`, mapped onto `l + (r - l) * x / W`. Both are frame-free, so the headless suite can test them. **`Krowi_OptionsCardRowMixin:Init(element, window)`** places each card at `(i - 1) * (cardWidth + 12)`, hands it its data and hides the unused ones. **`Krowi_OptionsCardMixin:Init(card, width)`** sets the picture and its crop, or the icon on the dark area; the name; NEW at the right end of the name line, with the name stopping before it; the line. The fill and border lighten on enter and go back on leave. OnClick calls `card.OnClick`. |
| `Krowi_Options/WindowMixin.lua` | **`rowTemplates`** gets `CardRow = { "Krowi_OptionsCardRowTemplate" }`. **`Flatten`** splits `{ Kind = "Cards", Cards }` into `CardRow` elements of three, each with `Key` = the cards' names joined, as it splits a `Grid` (`:670-674`). **The page's extent calculator** (`:225-228`) calls a new `self:CardRowHeight(element)`: 86 + 8 + the tallest name + 2 + the tallest line (`MeasureText` at the card's width - 20) + 10, + 12 between rows. **`Signature`** (`:713`) reads `element.Key or element.Text or element.Label`. |
| `Options/Window/Map.lua` | Each of the 22 sections gets `Card = L["Card <Id>"]`. Sections without a picture get `CardIcon = "Interface\\Icons\\..."`, vanilla icons that every client has: <br>• criteria INV_Misc_Spyglass_03; <br>• eventlist INV_Misc_Note_01; <br>• keys INV_Misc_Key_03; <br>• plugins INV_Misc_Gear_01; <br>• profiles INV_Misc_Book_09; <br>• advanced INV_Misc_Wrench_01; <br>• about the addon's own TOC icon Achievement_Dungeon_Heroic_GloryoftheRaider; <br>• guides INV_Misc_Map_01, used on Mists, where it has no picture. <br>Krowi judges them in game. |
| `Options/Window/Window.lua` | `OverviewElements` keeps the New list and the changelog. After each group's header it adds one `Cards` element; `SectionLink` stays for the New list. A local `SectionCard(section)` takes the first `Picture` block of `window.Help[id]` (its `Picture`, `Width`, `Height`, `TexCoords`), otherwise `section.CardIcon`, plus `section.Name`, `section.Card`, `window.IsNew(id)` and the same OnClick as the link. |
| `Localization/*.lua` (11 files) | 22 strings `L["Card Tabs"]` ... `L["Card About"]` below the `Exported at` line. The English is the mockup's lines (`MockupSpec.ps1`), reread against each section: "Right-click menu" becomes "Wowhead links, Go to and more." unless the Watch List is in that menu. The other 10 files get my translations, in each file's own terms. |
| `Tests/Options.lua` | **Scenario `overview-cards`** walks `Controller.Config.GetElements("overview")` under the three group headers: `links=%d cards=%d rows=%d pictures=%d icons=%d lines=%d`. **Scenario `card-geometry`**: `lib.CardWidth` at 635 and 619, and `lib.CardCrop` for one wide picture (NewTabs) and one tall one (CategoryTree). **New live step `overview-cards`** after `section-overview`: every shown card inside its row and as wide as its neighbours, a picture texture or the icon shown, name and line not cut short (`IsTruncated`); screenshot. The header comment lists the step. |
| `docs/work/2026-11-02-overview-cards/plan.md` | This plan. |

Reused as they are: `InitList` and its extent calculator, `MeasureText` (`WindowMixin.lua:432-437`), the grid row's way of making its children (`RowMixins.lua:426-440`), the navigation's `NewFeatureLabelTemplate` use (`Window.xml:26-31`, `WindowMixin.lua:39-45`), `window.IsNew` and `window.Controller:Open`, and the help pictures with their `Pictures.lua` sizes. There are no new Lua files, so `Files.xml` does not change.

## Order of work
1. Copy this plan to `docs/work/2026-11-02-overview-cards/plan.md`. Commit `docs(work): plan for 2026-11-02-overview-cards`.
2. **Test first:** add `overview-cards` with `Recorded` as the code is today: `links=22 cards=0 rows=0 pictures=0 icons=0 lines=0` on both clients. `Target` is `links=0 cards=22 rows=9 pictures=15 icons=7 lines=22`, and `TargetClassic` is `pictures=14 icons=8`, since guides has no picture on Mists. Add `card-geometry` with `Recorded` "no card helpers". Run `run-tests.lua <worktree> options` for Retail and Classic. Commit `test: record the Overview's section list in the options suite`.
   **The in-game before-run:** tonight's `/kaftest options` on Retail (22:30, 65 passed, 0 failed) was on this code. The new scenarios read the model only and run headless on both clients, so no separate before-run is asked for.
3. **Krowi_Options:** the templates, mixins, helpers, `Flatten`, the extent, `Signature` and the minor bump. Set `card-geometry` to `Target`; headless green.
4. **Overview:** `Map.lua` and `Window.lua`, then the 22 strings in enUS and the 10 other locale files. Set `overview-cards` (with `RecordedClassic`) to `Target`.
5. **Live step** `overview-cards` in `Tests/Options.lua`.
6. **Checks:** `Check-Repo.ps1`; the `options` and `help` suites headless on both clients; `Find-DeprecatedApi.ps1`; `krowi:taint-reviewer` on the diff.
7. **In game:** `Deploy.ps1 -WhatIf`, then deploy to Retail and Mists, and tell Krowi what was copied. The peer session `krowi-achievementfilter-f7` is idle; check it first, since a deploy replaces its build. Krowi runs `/kaftest options` on both clients and opens Overview with the pane open and collapsed. Then `Read-GameTests.ps1`, `Read-GameErrors.ps1` and the screenshots.
8. **Krowi's look:** the crops, icons, fill and border, and any hitch when Overview opens. Adjust: a section's own crop (a `CardPart` x/y on its `Map.lua` entry), other icons, or other colours. Record the changes here.
9. **CurseForge:** `krowi:localization` report. Then, with Krowi's go, `-Export`, so translators see the 22 strings and get my translations.
10. **Wrap up:** set the work files to `done`, run `/code-review`, open the PR against `main`. No changelog line: the window is new in 105.0, and its line covers it.

## Departures from the plan
- **Two in-game steps instead of one:** `overview-cards` checks the cards scrolled to the first group, `overview-cards-end` those at the page's end. The page draws only the rows in view.
- **Reward preview's picture at its default size** (Krowi, 2026-11-02, step 8: "the reward preview picture looks odd with only the top visible"). The 2026-11-01 run had shot Krowi's own preview at 485 x 654. `Tests/Pictures.lua` now sets the preview to the default 280 x 360 for its shot (`SetForRun`, which the colour rows' header colours now use too) and puts the player's size back (`RestoreOptions`). Remade with `/kaftest pictures rewardpreview` and `Make-HelpPictures.ps1 -Only RewardPreview`: 363 x 443.
- **`CardPart`** (Krowi, the same day: "the lower part, so the card shows the mount itself"). `lib.CardCrop` reads a card's `Part = { X, Y }`, as CSS's `object-position`. Reward preview's `{ X = 0, Y = 0.74 }` shows 48 % to 83 % of the picture's height: the mount, without the zoom buttons. `card-geometry` has a square cut at its bottom for it.

## Risks
- **The row has no width yet in `Init`.** The card width comes from `window:PageWidth()`, as the notes' height does. The extent calculator and `Init` both use it, so the height and the placement agree.
- **Loading the pictures:** Overview loads 15 TGA files, 11.5 MB on disk, where today it loads none. Step 7 looks for a hitch on the first open after a `/reload`. If one shows, the cards get small copies made by `Make-HelpPictures.ps1`, a follow-up.
- **The pictures' transparent margins** (PR #376) show at the top left of a crop as dark area. Step 8 judges it; a section's `CardPart` moves its crop.
- **`NewFeatureLabelTemplate`** is Blizzard's. The navigation already uses it on Retail and Mists with no taint, and the card uses it the same way, on the addon's own frame.
- **Long names and lines in other languages:** names stay on one line and are reported when cut (the live step). Lines wrap, and their row grows to the tallest.
- **The release gate:** `Tests/Options.lua` changes, so `options` needs fresh green runs on Retail and Mists before 105.0. That is step 7.

## Proof
- `lua.exe .claude\tools\headless\run-tests.lua <worktree> options` (Retail and Classic): `overview-cards` and `card-geometry` PASS and met. Every other scenario stays as it is.
- `Check-Repo.ps1` clean; the `help` suite unchanged; `krowi:taint-reviewer` finds nothing open.
- In game on Retail and Mists, `/kaftest options`: 0 failed. The `overview-cards` step passes, and its screenshot shows three cards to a row with pictures, icons, names, NEW and lines. `Read-GameErrors.ps1` has no new row.