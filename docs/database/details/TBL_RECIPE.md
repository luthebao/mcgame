# TBL_RECIPE

| Property | Value |
|---|---|
| Table ID | 105 |
| Record count | 185 |
| JSON | `docs/database/game_data/TBL_RECIPE.json` |
| Client constant | `GamePredef.TBL_RECIPE = 105` |

## Purpose

Defines craftable costume/fashion item recipes ("thời trang"). Each recipe is a named, colored blueprint that a player can acquire and exchange for a dressed appearance. The client uses this table to render recipe tooltips (`TipRecipe.as`) and recipe cell icons (`RecipeCell.as`), and to dispatch the `exchangeRecipe` RPC when a player activates a recipe from their inventory.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up via `GameData.d[105][recipeId]`. |
| `name` | string | Vietnamese display name (e.g., `"Bộ Thời Trang Học Sinh"`). Shown in `TipRecipe.as:241` as colored HTML. |
| `desc` | string | Tooltip description text. Shown in `TipRecipe.as:242` via `recipeInfo.text`. |
| `iconCode` | string | Asset code passed to `ResManager.getIconUrl(iconCode)` for the recipe's UI icon (`TipRecipe.as:240`). |
| `color` | int | Color tier index (3 or 4) used to select `GamePredef.MSG_ITEM_COLOR[color]` for the name color in tooltip (`TipRecipe.as:235–241`). |
| `kind` | int | Recipe sub-kind: `-1` (92) = non-craftable / display only; `1` (71) = standard; `2` (22) = special. `(inferred from data — no client usage found for the kind field itself on this table)` |
| `type` | int | Recipe category: `1` (93) or `2` (92). Used to bucket recipes into UI tabs. `(inferred from data — no client usage found directly for this table's type field)` |
| `isOpen` | bool(0/1) | Whether the recipe is currently available: `1` (93) = open, `-1` (92) = locked/disabled. `(inferred from data — no client usage found)` |
| `position` | int | UI slot position: `-1` for non-slotted (92 records); positive integers 1–77 for slotted costumes (93 records), corresponding to appearance slot index. `(inferred from data — no client usage found directly)` |
| `money` | int | Score/activation cost shown in `RecipeItem.as:194` via `Language.DRESS_PANEL[42]` and in exchange confirm at `RecipeItem.as:254`. |
| `product` | int | Item template ID of the resulting appearance item: `-1` for non-producing (93), positive item IDs (92 recipes). `(inferred from data and RecipeItem.as:253 reads the meta object)` |
| `num` | int | Quantity produced: `-1` (93) = not applicable; `10` (92) = produces 10 items. `(inferred from data — no direct usage found)` |

## Value distributions / sentinels

- `color`: `3`×54, `4`×131.
- `kind`: `-1`×92, `1`×71, `2`×22.
- `type`: `1`×93, `2`×92.
- `isOpen`: `-1`×92, `1`×93.
- `position`: `-1`×92 (non-slotted), integers 1–77 (93 records, one per slot).
- `num`: `-1`×93, `10`×92.
- `product`: `-1`×93; 92 distinct positive item IDs (one per craftable recipe).

## Client usage

- `TipRecipe.as:229–242` — loads `GameData.d[TBL_RECIPE][recipeId]`; reads `color`, `iconCode`, `name`, `desc` to render tooltip.
- `RecipeCell.as:108` — `GameData.d[GamePredef.TBL_RECIPE][_recipeId]` to draw recipe cell.
- `RecipeItem.as:182` — `GameData.d[GamePredef.TBL_RECIPE][recipeId]`; reads `money` for cost display.
- `RecipeItem.as:251` — dispatches `remote.call("exchangeRecipe", ...)` with `recipeCell.recipeId` as argument.
- `RecipeExchangePanel.as:301` — iterates `GameData.d[GamePredef.TBL_RECIPE]` for bulk display.
- `LinkEventUtil.as:336` — LINK_TYPE `"RECIPE"` resolves to `TBL_RECIPE` for in-chat recipe links.

## Related tables

- `product` (positive values) → [[TBL_ITEM_TEMPLATE]] (the appearance item produced).
- Recipe plan ingredients → [[TBL_RECIPE_PLAN]] (`recipeId` foreign key).
