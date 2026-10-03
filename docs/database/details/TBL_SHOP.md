# TBL_SHOP

| Property | Value |
|---|---|
| Table ID | 53 |
| Record count | 121 |
| JSON | `docs/database/game_data/TBL_SHOP.json` |
| Client constant | `GamePredef.TBL_SHOP = 53` |

## Purpose

A directory of every NPC shop or special point-exchange shop in the game. Each row is a named shop container; the slots it sells are rows in [[TBL_SHOP_SLOT]] (linked by `sid`). The client indexes this table by `name` (`TBL_INDEX_ARRAY[TBL_SHOP] = "name"`, `GameData.as:8369`) for name-based lookups, and reads it via `gameDataIndex[TBL_SHOP][shopId]` when rendering the shop UI.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Referenced as `sid` in [[TBL_SHOP_SLOT]] and `shopId` in [[TBL_CREDIT]]. VIP shop constant `GamePredef.VIP_SHOP_ID = 99` is filtered out of general shop lookups (`GameIntroPanel.as:4656`, `10781`). |
| `name` | string | Internal/debug name for the shop (often Chinese, e.g., `"出云村防具店"` = Xuất Vân Thôn Armor Shop, `"公会商店"` = Guild Shop). Not shown to players; used as the secondary index key. |
| `type` | int | Shop category: `1` = standard NPC shop (buys with gold/silver, 83 shops); `2` = special point/event shop (buys with score/event currency, 38 shops). Client reads `.shopType` on the slot VO to branch display logic (`ShopSlot.as:351`, `ShopSlot.as:784`). |

## Value distributions / sentinels

- `type`: `1`×83 (standard shops), `2`×38 (event/point shops).
- `id=99` is the VIP shop, excluded from regular price-lookup sweeps by `!(sid == GamePredef.VIP_SHOP_ID)` guards.

## Client usage

- `EquipFuncBag.as:1231, 1236` — looks up `gameDataIndex[TBL_SHOP][shopId]` then iterates its slots to find a buy-back entry.
- `FuncBag.as:602` — `gameDataIndex[TBL_SHOP_SLOT][_sysShopId[n]]` (indirect via `TBL_SHOP_SLOT`).
- `GameIntroPanel.as:4656, 8114, 10781` — scans `TBL_SHOP_SLOT` entries, filters `sid != VIP_SHOP_ID` (id 99).
- `JXHD.as:1039` — iterates `TBL_SHOP_SLOT` where `sid == 99` (VIP shop slot scan).
- Secondary index `TBL_INDEX_ARRAY[TBL_SHOP] = "name"` (`GameData.as:8369`).

## Related tables

- `id` ← `sid` in [[TBL_SHOP_SLOT]] (the items sold by this shop).
- `id` ← `shopId` in [[TBL_CREDIT]] (the NPC point-exchange items sold in this shop).
