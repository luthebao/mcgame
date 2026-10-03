# TBL_RECYCLING

| Property | Value |
|---|---|
| Table ID | 115 |
| Record count | 322 |
| JSON | `docs/database/game_data/TBL_RECYCLING.json` |
| Client constant | `GamePredef.TBL_RECYCLING = 115` |

## Purpose

Maps items and currencies to their "Mystery Furnace" (Lò Bí Ẩn) recycle values. Each row specifies how many furnace-score points a particular item (`itemId`) at a given quality tier (`color`) contributes, or how many points a score-currency of a given type (`type > 1`) is worth. The client loads this entire table into `GameData.d[115]` and uses it to compute the total score a player will earn before confirming a recycling operation.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. |
| `itemId` | int | Foreign key into [[TBL_ITEM_TEMPLATE]] — the item template this rule applies to. Only meaningful when `type == 1` (item-based rule). `0` or absent for score-currency rows. |
| `type` | int | Rule category. `1` = item-based (305 rows — matched by `itemId` + `color`); values `2`–`18` = score-currency type IDs (one row each, matched by `type` alone as `scoreMetaDict[type]`). See `MysteryFurnace.as:1517–1529`. |
| `color` | int | Quality-color tier of the item: `-1` = any/wildcard (17 rows), `0` = white (130), `1` = green (59), `2` = blue (47), `3` = purple (41), `4` = orange (28). Matches `inst.color` on the item instance at recycle time (`MysteryFurnace.as:928,1563–1565`). |
| `value` | int | Furnace-score points contributed per unit. For items (`type==1`): multiplied by `stackNum` (`MysteryFurnace.as:1566`). For score currencies (`type>1`): multiplied by the amount of that currency the player inputs (`MysteryFurnace.as:1582`). |

## Value distributions / sentinels

**`type`:** `1` accounts for 305/322 rows (item rules). Types `2`–`18` have exactly one row each (17 score-currency types).

**`color`:** `-1` (wildcard) = 17, `0` = 130, `1` = 59, `2` = 47, `3` = 41, `4` = 28. Higher-quality items (`color 3/4`) have fewer rows but higher `value` per unit (inferred from data — the relationship is monotonic within a given `itemId` group).

## Client usage

- `MysteryFurnace.as:1514–1529` — iterates `GameData.d[GamePredef.TBL_RECYCLING]`; rows with `type == 1` go into `_itemMetaDict[itemId][color]`, all other rows into `_scoreMetaDict[type]`.
- `MysteryFurnace.as:1563–1566` — for each item slot the player has placed in the furnace, looks up `_itemMetaDict[inst.tid][inst.color]` and accumulates `value * stackNum`.
- `MysteryFurnace.as:1579–1582` — for each score-currency type the player has entered, looks up `_scoreMetaDict[type]` and accumulates `value * inputAmount`.
- `MysteryFurnace.as:928` — drag-accept filter: only accepts items that have a matching `_itemMetaDict[tid][color]` entry.
- No other panels reference `TBL_RECYCLING` directly; the table is exclusively consumed by the Mystery Furnace UI.

## Related tables

- `itemId` → [[TBL_ITEM_TEMPLATE]] (the item being recycled).
- `color` matches `inst.color` from [[TBL_ITEM_INSTANCE]] or [[TBL_EQUIPT_INSTANCE]] on the placed item.
