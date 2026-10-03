# TBL_DRESS

| Property | Value |
|---|---|
| Table ID | 104 |
| Record count | 93 |
| JSON | `docs/database/game_data/TBL_DRESS.json` |
| Client constant | `GamePredef.TBL_DRESS = 104` |

## Purpose

Defines every costume/fashion entry in the Dress (thời trang) system. Records split into two visual categories: character costumes (type 1, `DressDisplay.TYPE_DRESS`) and flying mounts/flyers (type 2, `DressDisplay.TYPE_FLYER`). Each row carries the linked equipment template that renders the appearance, the activation material costs, up to four stat-bonus grants, and a recipe for conversion. The `DressPanel` and `DressDisplay` components use this table to populate the fashion wardrobe UI and compute the cumulative stat bonuses from collected costumes.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[GamePredef.TBL_DRESS][id]` (`DressPanel.as:1536`, `DressDisplay.as:553`). IDs 1001–1071 = costumes; 2001–2022 = flyers. |
| `name` | string | Vietnamese display name (e.g., `"Thời Trang Học Sinh"`, `"Chổi Phi Thiên"`). Shown in the wardrobe list (`DressPanel.as:1307`). |
| `type` | int | Visual category. `1` = character costume (`DressDisplay.TYPE_DRESS`); `2` = flying mount / flyer (`DressDisplay.TYPE_FLYER`). Drives which display canvas is refreshed (`DressDisplay.as:55–56`, `DressPanel.as:1485–1486`). |
| `position` | int | Sort/slot index within the wardrobe list. Used as a sort field by `DressPanel.as:1298` (`SortField("position")`). Values 1–9 for costumes in slots 1–9 each, higher values for flyers. At `:1306` this value is also temporarily assigned as `position` and `type` for a display object. |
| `equiptId` | int | Foreign key → `TBL_EQUIPT_TEMPLATE.id`. The equipment template whose visual defines how this dress looks when worn. Read at `DressPanel.as:1736`, `DressDisplay.as:569/586`. |
| `isOpen` | bool(0/1) | Whether this dress is available in the current build. All 93 records = `1` (all open). |
| `color` | int | Rarity colour code. `3` = Blue (27 records), `4` = Purple (66 records). Displayed as nameplate/tooltip colour in the wardrobe grid. |
| `num1` | int | Number of Crystal (`tinh thể`) materials required to activate (permanently add to wardrobe book). Read as `needCrystalNum` at `DressPanel.as:1548`. |
| `num2` | int | Number of Jewel (`ngọc`) materials required to activate. Read as `needJewelNum` at `DressPanel.as:1549`. |
| `prop1` | int | First stat-bonus type ID (references `GamePredef.EQUIPT_PROP_*` constants, e.g., `1`=HP, `4`=Physical Attack, `5`=Magic Attack, `11`=Speed). Read via `GameData.d[TBL_DRESS][id][("prop"+n)]` loop at `DressPanel.as:1509`. |
| `prop2` | int | Second stat-bonus type ID. |
| `prop3` | int | Third stat-bonus type ID. |
| `prop4` | int | Fourth stat-bonus type ID. |
| `propNum1` | int | Flat value of the first stat bonus (`prop1`). Accumulated into wardrobe totals at `DressPanel.as:1504`. |
| `propNum2` | int | Flat value of the second stat bonus. |
| `propNum3` | int | Flat value of the third stat bonus. |
| `propNum4` | int | Flat value of the fourth stat bonus. |
| `recipeId` | int | Foreign key → `TBL_RECIPE.id`. Recipe used to craft or exchange this dress via `exchangeRecipe` RPC (`RecipeItem.as:251`). Read at `DressPanel.as:1237`, `RecipeCell.as:91`. |

## Value distributions / sentinels

- `type`: `1`×71 (costume), `2`×22 (flyer).
- `isOpen`: `1`×93 (all entries active).
- `color`: `3`×27 (Blue rarity), `4`×66 (Purple rarity).
- `prop1`–`prop4`: The first record samples all use `prop1=1` (HP), `prop2=4` (Physical Attack), `prop3=5` (Magic Attack), `prop4=11` (Speed) — a standard wardrobe bonus quartet. Specific distributions vary per dress.
- `position`: values 1–9 each appear twice for the base costume slots (type=1 pairs), 10–71 for individual entries; type=2 flyers share positions 1–22.

## Client usage

- `DressPanel.as:1296–1307` — loads all `TBL_DRESS` records, sorts by `position`, groups by `type` to populate wardrobe categories.
- `DressPanel.as:1499–1521` — iterates player's `dressInfo.book` (collected dresses); for each, reads `prop1`–`prop4` and `propNum1`–`propNum4` to aggregate total wardrobe stat bonuses (`hp`, `phAtt`, `mgAtt`, `sp`).
- `DressPanel.as:1548–1549` — reads `num1`/`num2` for activation cost display.
- `DressPanel.as:1731–1748` — reads `equiptId` and `recipeId` for the dress preview tooltip.
- `DressDisplay.as:306–324` — iterates all TBL_DRESS records filtered by `type` and `isOpen==1` to build the visual wardrobe display.
- `DressDisplay.as:553–586` — reads `dressMeta.type` to decide between `TBL_EQUIPT_TEMPLATE` lookup paths for costume vs. flyer visuals.
- `DressItemRenderer.as:59/171` — reads a dress record by id to render a grid cell.
- `RecipeItem.as:251–253` — calls `"exchangeRecipe"` RPC using `recipeCell.recipeId` sourced from this table.

## Related tables

- `equiptId` → [[TBL_EQUIPT_TEMPLATE]] (visual definition of the costume appearance).
- `recipeId` → [[TBL_RECIPE]] (crafting/exchange recipe).
- `color` uses rarity codes (3=Blue, 4=Purple) that differ from the equipment `ColorCode` scale — do not conflate.
