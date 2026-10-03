# TBL_CREDIT

| Property | Value |
|---|---|
| Table ID | 107 |
| Record count | 252 |
| JSON | `docs/database/game_data/TBL_CREDIT.json` |
| Client constant | `GamePredef.TBL_CREDIT = 107` |

## Purpose

Defines items available in NPC point-exchange shops (also called "credit shops" or "score shops"). Unlike [[TBL_SHOP_SLOT]] (which uses gold/money pricing), credit shop entries cost special in-game score currencies (battle points, hero points, crystal, etc.). Each row specifies the item, its cost in up to two score currencies, per-player purchase limits (daily/weekly/monthly/total), and bind-on-exchange behavior. The client indexes by `shopId` (`TBL_INDEX_ARRAY[TBL_CREDIT] = "shopId"`, `GameData.as:8397`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Accessed as `GameData.d[107][id]` and `GameData.d[107][creditId]` (`NpcShopItemDisplay.as:208, 251, 321, 498`). |
| `shopId` | int | Foreign key → [[TBL_SHOP]].`id`. Groups entries by the shop they belong to. Primary index key. Observed shops: 1 (Crystal/Kết Tinh, 96 entries), 2 (Valor/Dũng Khí, 27), 3 (Hero/Anh Hùng, 70), 4 (Anniversary, 6), 5 (Christmas candy, 18), 6 (reward points, 22), 7 (pencil points, 5), 8 (JXHD panel, 3), 9 (JXHD panel 2, 5). |
| `itemId` | int | Template ID of the item to receive on exchange. Resolved in table `type`. |
| `type` | int | Template table ID of `itemId`. `19`=TBL_EQUIPT_TEMPLATE (96 rows), `29`=TBL_ITEM_TEMPLATE (156 rows). Used as `GameData.d[type][itemId]` (`NpcShopItemDisplay.as:327–335`). |
| `quality` | int | Equipment quality override for display color. When `type=19`, used as `getColorByQuality(quality)`. When `type=12` (creature), used as `colorByGrowRate(quality/10)`. `0` = use template default. |
| `cType1` | int | Primary cost currency type. Maps to `ViewManager.SCORENAME_CONFIG[cType1]` for a display label. Confirmed mappings: `32`="Kết Tinh Trí Thạch" (Crystal), `34`="Điểm Dũng Khí" (Valor Points), `41`="Điểm Anh Hùng" (Hero Points), `49`="Điểm Thưởng" (Reward Points), `66`="Kẹo Noel" (Xmas Candy), `67`="Điểm thưởng" (reward pts variant), `68`="Bút Chì" (Pencil/event currency), `70`=NPC_SHOP_PANEL[328], `72`=NPC_SHOP_PANEL[331]. Iterated at `NpcShopItemDisplay.as:372`. |
| `cNum1` | int | Amount of `cType1` currency required. Read at `NpcShopItemDisplay.as:373, 502`. |
| `cType2` | int | Secondary cost currency type. Always `0` in current data (no dual-currency entries). Structure mirrors `cType1`. |
| `cNum2` | int | Amount of `cType2` currency required. Always `0` in current data. |
| `tab` | int | Tab/category index within the shop UI panel. Values: `1`×162 (main tab), `2`×6, `3`×6, `4`×39, `5`×39. Used to split a shop into category tabs. `(inferred from data — specific tab-rendering client code not located)` |
| `position` | int | Display ordering position within the tab. |
| `bind` | int | Bind-on-exchange: `0`=unbound on receive (96 rows, type-19/equipment entries), `1`=bound on receive (156 rows, type-29/item entries). Documented to player in the shop description text (`Language.NPC_SHOP_PANEL[103]`: "Khi đổi sẽ nhận toàn bộ vật phẩm là khóa"). |
| `isSell` | int | Whether this entry is currently available for exchange. `1`=available (207 rows), `0`=unlisted/disabled (45 rows). `(inferred from data — client usage not confirmed; likely a server/admin flag)` |
| `limitType` | int | Per-player purchase limit period: `0`=no limit (96 rows), `2`=weekly limit (21 rows), `3`=monthly limit (135 rows). Used at `NpcShopItemDisplay.as:209–243` to update `creditDayDict`/`creditWeekDict`/`creditMonthDict`/`creditTotalDict` on the player object. Value `4` (total/lifetime limit) also handled in client code. |
| `limitNum` | int | Maximum exchanges allowed within the `limitType` period. `0` when `limitType=0` (unlimited). |

## Value distributions / sentinels

- `type`: `19`×96 (equipment), `29`×156 (items).
- `bind`: `0`×96, `1`×156.
- `limitType`: `0`×96 (no limit), `3`×135 (monthly), `2`×21 (weekly).
- `isSell`: `1`×207, `0`×45.
- `tab`: `1`×162 (default tab), `4`×39, `5`×39.
- `cType2`, `cNum2`: both always `0` (dual-currency not used in current data).

## Client usage

- `NpcShopItemDisplay.as:208–380` — primary display component for a credit shop entry. Reads `type`, `itemId`, `quality`, `cType1`, `cNum1`, `cType2`, `cNum2` (iterated), `limitType`, `limitNum`. The `SCORENAME_CONFIG[cType]` lookup converts the type code to a Vietnamese currency name label. Calls `core.remote.call("exchangeItem", ...)` on purchase.
- `NpcShopPanel.as:308` — `gameDataIndex[TBL_CREDIT][shopId]` to load a shop's credit listing.
- `JXHD.as:1055–1080` — scans `TBL_CREDIT` entries where `shopId == 8` or `shopId == 9` to populate a special panel, reads `type` and `itemId`.

## Related tables

- `shopId` → [[TBL_SHOP]].`id` (parent shop).
- `itemId` + `type=29` → [[TBL_ITEM_TEMPLATE]].`id`.
- `itemId` + `type=19` → [[TBL_EQUIPT_TEMPLATE]].`id`.
- `cType1`/`cType2` → `ViewManager.SCORENAME_CONFIG` → `Language.NPC_SHOP_PANEL` (currency label strings; not a DB table).
