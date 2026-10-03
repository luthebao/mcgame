# TBL_RECIPE_PLAN

| Property | Value |
|---|---|
| Table ID | 106 |
| Record count | 362 |
| JSON | `docs/database/game_data/TBL_RECIPE_PLAN.json` |
| Client constant | `GamePredef.TBL_RECIPE_PLAN = 106` |

## Purpose

Links each recipe to its ingredient or drop plan entries. Each record specifies one item that is either consumed as a crafting ingredient or produced as an output for a given recipe, together with a success rate, quantity, and slot type. Each recipe in `TBL_RECIPE` has exactly 3 plan rows (one per `st` value 2, 3, 4 for ingredient classes).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. |
| `recipeId` | int | Foreign key to `TBL_RECIPE.id`. Groups plan entries per recipe. |
| `p` | int | Item template ID of the ingredient or product item. `0` = no specific item (uses recipe's generic product) `(inferred from data — no direct client field access found for this table's p field)`. |
| `num` | int | Quantity of the item. Always `1` in this dataset `(inferred from data — no direct client field access found)`. |
| `rate` | float | Probability (percentage, e.g., `15.000000` = 15%) of this item slot yielding an output. `(inferred from data — no direct client field access found)` |
| `st` | int | Slot/material type. Values: `1` (28) = special plan; `2` (150) = primary ingredient; `3` (92) = secondary ingredient; `4` (92) = tertiary/bonus. Referenced in `TipItem.as:435` and `FuncBag.as:1223–1226` where `st == 3` indicates "for sale in recipe exchange" shop-sell type. |

## Value distributions / sentinels

- `st`: `1`×28, `2`×150, `3`×92, `4`×92.
- `p`: `0`×312 (no specific item), positive item IDs×50 (specific items).
- `num`: always `1` (362 records).
- `rate`: ranges from 10.0 to 100.0.
- Per-recipe grouping: each `recipeId` appears exactly 3 times (3 plan slots per recipe). 362 rows / ~3 ≈ 120 recipes with plans.

## Client usage

- `TipItem.as:435` — checks `value.slotData.st == 3` to determine if a bag item is a recipe-plan material that is currently listed in the player's recipe exchange shop.
- `FuncBag.as:1223–1226` — reads `_local_8.st`; `st == 3` shown differently from `SHOP_SELL_TYPE_HIDE`; routes item display in the functional bag.
- `EquipFuncBag.as:1505–1510` — `_local_2.st = _arg_1.st`; `st == 3` combined with `sid` check for system shop slot detection.
- `LinkEventUtil.as:338` — `_local_11.recipeId` populated from link parsing (the recipeId is the handle used to open the recipe tooltip).
- No direct `GameData.d[106]` reads found in logic/UI files; the table appears to be consumed server-side for recipe crafting validation; the client only uses the derived plan data embedded in the player's server-side inventory/slot data (`slotData.st`).

## Related tables

- `recipeId` → [[TBL_RECIPE]] (the parent recipe this plan belongs to).
- `p` (when > 0) → [[TBL_ITEM_TEMPLATE]] (specific ingredient or product item).
