# TBL_MYSTRE_RECIPE

| Property | Value |
|---|---|
| Table ID | 122 |
| Record count | 66 |
| JSON | `docs/database/game_data/TBL_MYSTRE_RECIPE.json` |
| Client constant | `GamePredef.TBL_MYSTRE_RECIPE = 122` |

## Purpose

Defines crafting recipes for Mystery Treasure items (Bí Bảo synthesis). Each recipe takes up to 6 Mystery Treasure ingredients (identified by template ID, required count, and quality) and produces an output element. The client uses this table to populate the "make" panel in `DecoratePanel` and dispatches the `makeMysTre` RPC when the player confirms synthesis.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (`_selectRecipe` in `DecoratePanel.as`). Looked up as `GameData.d[122][id]`. |
| `name` | string | Vietnamese recipe name (truncated in dump, e.g., `"Thái Cổ Thần Binh Cấ"`). Displayed in `makeOutputLabel` at `DecoratePanel.as:9305`. |
| `iconCode` | int | Asset code for the recipe's icon. |
| `level` | int | Recipe tier/difficulty (1–66 all unique in this dump; recipes are indexed by level via `TBL_INDEX_ARRAY[TBL_MYSTRE_RECIPE] = "level"` at `GameData.as:8399`). |
| `t1`–`t6` | int | Template ID of required ingredient in slot 1–6. Refers to `TBL_ITEM_TEMPLATE.id` (a Mystre-class item template). `0` = slot unused. Read at `DecoratePanel.as:9281`. |
| `n1`–`n6` | int | Required stack quantity for ingredient slot 1–6. Read at `DecoratePanel.as:9282`; stored as `slot.stackNum`. |
| `q1`–`q6` | int | Required quality/color of ingredient in slot 1–6. Read at `DecoratePanel.as:9283`; stored as `slot.quality`. `0` = any quality / slot unused. |
| `st` | string | Output element specifier in `"tableId-slotId-quantity"` format. All 66 records use prefix `"16"` (= `TBL_ELEMENT_TEMPLATE`, id=16), confirming the output is always an Element Template item. The second component identifies the specific element slot; the third is the output quantity. Format: `"16-<elementSlot>-<qty>"`. `(inferred from data — no direct client parse of this field found in identified .as files)` |

## Value distributions / sentinels

- `t6` / `n6` / `q6`: frequently `0` (many recipes use fewer than 6 slots; first record has `q6=0, t6=16`).
- `st` prefix: always `"16"` across all 66 records.
- `level`: 1–66, each unique (one record per level).

## Client usage

- `DecoratePanel.as:4756` — loads recipe `GameData.d[122][_selectRecipe]` to fill material requirement slots.
- `DecoratePanel.as:9276–9304` — `selectRecipe(_arg_1)`: reads all 6 `t`/`n`/`q` triplets, builds ingredient slot objects (`slotType=SLOT_MYSTRE`, `type=TBL_ITEM_TEMPLATE`, `quality=q`, `giid=t`, `stackNum=n`), and updates the output label with `name`.
- `DecoratePanel.as:10214–10233` — `makeMystre()`: re-reads the recipe, calls `_core.remote.call("makeMysTre", null, _selectRecipe, slotIndexMap, stackNumMap)` on confirm.
- `DecoratePanel.as:10317` — uses secondary index `_dm.gameDataIndex[122][levelKey]` to look up recipe by level.

## Related tables

- `t1`–`t6` → [[TBL_ITEM_TEMPLATE]] (ingredient item templates of Mystre class).
- `st` prefix `16` → [[TBL_ELEMENT_TEMPLATE]] (output element type).
- Outputs are equipped as [[TBL_MYSTRE]] items.
- Secondary index: `TBL_INDEX_ARRAY[TBL_MYSTRE_RECIPE] = "level"` (`GameData.as:8399`).
