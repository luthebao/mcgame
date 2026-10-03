# TBL_SHOP_SLOT

| Property | Value |
|---|---|
| Table ID | 51 |
| Record count | 2542 |
| JSON | `docs/database/game_data/TBL_SHOP_SLOT.json` |
| Client constant | `GamePredef.TBL_SHOP_SLOT = 51` |

## Purpose

Defines every item slot available in every NPC or event shop. Each row is one purchasable listing: the item being sold, its prices in various currencies, stock/quantity limits, visibility status, and position in the shop UI. The client indexes this table by `sid` (`TBL_INDEX_ARRAY[TBL_SHOP_SLOT] = "sid"`, `GameData.as:8367`) and by `st` as a secondary index (`TBL_INDEX_ARRAY2[TBL_SHOP_SLOT] = "st"`, `GameData.as:8455`), allowing fast grouping of slots by shop and by status.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Accessed as `GameData.d[51][id]`. |
| `sid` | int | Foreign key → [[TBL_SHOP]].`id`. Groups all slots belonging to the same shop. Primary index key. |
| `itemId` | int | Template ID of the item for sale. Resolved against the table identified by `type`. |
| `type` | int | Template table ID of `itemId`: `29` = TBL_ITEM_TEMPLATE (1906 slots), `19` = TBL_EQUIPT_TEMPLATE (636 slots). Used as `GameData.d[type][itemId]` to fetch the item template. Confirmed: `MoneyItemPanel.as:333`, `FazendaPorTraitCanvas.as:579`. |
| `gold` | int | Price in premium currency (gold/元宝). `0` = not for gold. If `gt=1`, this is a group-buy gold price. Displayed as primary cost when `>0` (`ShopSlot.as:608–618`, `Slot.as:471–473`). |
| `money` | int | Price in silver/copper (in-game currency). `0` = not for money. Displayed if `gold == 0` and `money > 0` (`ShopSlot.as:622–632`, `Slot.as:478–480`). |
| `point` | int | Price in activity/point currency (event points, e.g., 999999 sentinel = "not applicable", 0 = free or no point cost). Displayed if both `gold` and `money` are `0` (`ShopSlot.as:636–639`, `LimitShopSlot.as:604–607`). Distribution: `0`×2230, `999999`×272 (sentinel/disabled), various real point costs. |
| `priceAll` | int | Bulk-buy total price (buy-all cost). `0` or blank = single-item pricing. `999999` or `8888888888` are sentinel values meaning "cannot buy all". Used for bundle/package offers. `(inferred from data — specific client usage of this field not found in UI code)` |
| `gt` | int | Gold-type flag: `0` = standard gold price (2117 slots), `1` = group-buy / bulk gold price (425 slots). When `gt=1`, the `gold` field reflects a discounted bundle price. `ShopSlot.as:610, 624`. |
| `sale` | int | Sale/discount status. Always `0` in the current export (no sale rows active in the static data). Reserved for server-side activation. `(inferred from data — no active distribution)` |
| `amount` | int | Maximum stack size or purchase limit per transaction. `-1` = unlimited (2213 rows); positive values cap how many the player can buy in one purchase. Read as `shopSlotVO.stackMax = _arg_1.amount` (`ShopSlot.as:348`). |
| `quality` | int | For equipment slots: minimum quality tier of the item for display tinting. `0` = no quality filter. Used as `Math.ceil(quality / 5)` to determine color tier (`ShopSlot.as:772`, `TipItem.as:421`). |
| `r` | float | Price multiplier / discount rate. `1.000000` = full price (2461 rows); fractional values (e.g., `0.5`) reduce displayed price. `(inferred from data — client usage of this multiplier not confirmed in UI code reviewed)` |
| `position` | int | UI display position/ordering within the shop panel. Slots are sorted by `position` ascending. |
| `st` | int | Slot status / visibility flag. `0` = active/visible (1998 rows), `5` = hidden/disabled (402 rows, filtered out by `!(st == 5)` checks). Values 1–4 appear on small numbers of rows; likely staging states. Secondary index key. Confirmed exclusion: `MoneyItemPanel.as:333`, `GameIntroPanel.as:4656`. |
| `pType1` | int | Primary alternative-currency type code. References `GamePredef.CURRENCY_*` constants (e.g., `29`=World Cup points, `65`=Pet Arena activity points). The `ShopSlot.as:135` array `["pType1","pType2"]` is iterated to build the alternative cost display. `0` = no alternative currency. |
| `pNum1` | int | Amount of the `pType1` currency required. `WaWaSlot.as:426`: `shopSlotVO.itemCost = _arg_1.pNum1`. |
| `pType2` | int | Secondary alternative-currency type code. `0` = unused (2452 slots). Used for dual-currency purchase requirements (e.g., `61`=shop gold + `2`=another currency). |
| `pNum2` | int | Amount of the `pType2` currency required. `0` when `pType2=0`. |

## Value distributions / sentinels

- `type`: `29`×1906 (items), `19`×636 (equipment).
- `st`: `0`×1998 (active), `5`×402 (hidden), `-1`×29 (deleted/inactive), `4`×87.
- `gt`: `0`×2117, `1`×425 (group-buy gold).
- `amount`: `-1`×2213 (unlimited), positive values for timed/limited stock.
- `sale`: all `0` (static data has no active sales).
- `priceAll`: `999999`×272 (disabled), `8888888888`×67 (extreme sentinel), `0`×1595 (no bulk price).
- `pType1`: `0`×1763 (no alt currency), rest are various `CURRENCY_*` values.
- `pType2`: `0`×2452 (unused secondary cost).

## Client usage

- `ShopSlot.as:135–136, 348, 608–639` — primary shop slot renderer; reads all price fields (`gold`, `money`, `point`, `gt`, `amount`) and iterates `pType1/pType2`+`pNum1/pNum2` for alternative currency display.
- `MoneyItemPanel.as:329–335` — scans all slots to find where a given item is sold, excludes `st==5` (hidden) and `sid==VIP_SHOP_ID`.
- `GameIntroPanel.as:4654–4658, 8112–8116, 10779–10783` — searches for a slot matching an item type+id, filters `st!=5`, `money<=0`, `gold>0`, `sid!=99`.
- `FazendaPorTraitCanvas.as:575–587` — scans all slots for a specific item ID, reads `gold` for display.
- `FuncBag.as:602, 1182` — `gameDataIndex[TBL_SHOP_SLOT][shopId]` for NPC-shop bag item lookup.
- `EquipFuncBag.as:1231–1236` — locates shop by `TBL_SHOP` then retrieves its slots.
- `JXHD.as:1037–1044` — iterates slots of `sid=99` (VIP shop), reads `type` and `itemId`.
- `WorldCupPanel.as:7334` — loads all shop slot data for World Cup shop.
- `TipItem.as:433, 443` — reads `b` (bind flag) and `amount` from `slotData`.

## Related tables

- `sid` → [[TBL_SHOP]].`id` (parent shop).
- `itemId` + `type=29` → [[TBL_ITEM_TEMPLATE]].`id`.
- `itemId` + `type=19` → [[TBL_EQUIPT_TEMPLATE]].`id`.
- `pType1`/`pType2` → `GamePredef.CURRENCY_*` constants (event currency types, not a DB table).
