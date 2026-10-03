# TBL_MYTC_DETAIL

| Property | Value |
|---|---|
| Table ID | 143 |
| Record count | 80 |
| JSON | `docs/database/game_data/TBL_MYTC_DETAIL.json` |
| Client constant | `GamePredef.TBL_MYTC_DETAIL = 143` |

## Purpose

Defines per-level stat bonus rows for each Mặc Ý Tụ Cẩm suit. There are 8 suits × 10 levels = 80 rows. Each row encodes up to 6 class-specific stat bonus strings (`c1`–`c6`), where the class index matches the player's `classId` (1–6). The crafting upgrade cost in materials (a special crafting resource) is also stored per level. The client secondary-indexes this table by `tid` so all 10 levels for a suit can be retrieved in one pass.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (1–80). |
| `tid` | int | Foreign key to `TBL_MYTC_SUIT.id`. Identifies which suit this level row belongs to. Used as the secondary index key: `gameDataIndex[TBL_MYTC_DETAIL][suitTid]` (`Moyintuce.as:4205`). `TBL_INDEX_ARRAY[TBL_MYTC_DETAIL] = "tid"` (`GamePredef.as:8403`). |
| `lev` | int | Level of this suit progression row (1–10). Used as a key within the per-suit detail object: `_local_7[_local_6[_local_8].lev] = _local_6[_local_8]` (`Moyintuce.as:4211`). |
| `cost` | int | Crafting resource cost (in units of special material, item ID 6874) required to upgrade to this level. `0` at level 1; escalates per level (e.g., 10, 50, 675, 1235, 1600 observed). |
| `c1` | pipe-list | Stat bonuses for class 1. Format: `"propType:value|propType:value|..."`. Parsed by `Moyintuce.as:2729–2746`: `_arg_2[lev][("c" + classId)]` → split by `"|"` → each part split by `":"` → `[propTypeId, propValue]`. |
| `c2` | pipe-list | Stat bonuses for class 2. Same format as `c1`. |
| `c3` | pipe-list | Stat bonuses for class 3. Same format as `c1`. |
| `c4` | pipe-list | Stat bonuses for class 4. Same format as `c1`. |
| `c5` | pipe-list | Stat bonuses for class 5. Same format as `c1`. |
| `c6` | pipe-list | Stat bonuses for class 6. Same format as `c1`. Different classes receive different stat distributions (e.g., `c1`/`c5` use `propType 4`, while `c2`/`c3`/`c4` use `propType 5` for the 4th stat at higher levels). |

## Value distributions / sentinels

- `lev`: 1–10, each value appears exactly 8 times (one per suit).
- `cost`: `0`×8 (lev 1), `10`×8 (lev 2), up to `1235`×8 or `1600`×8 at max level.
- `tid`: 1–8, each appears exactly 10 times.
- `c1`–`c6` pipe-list format: `"propTypeId:value|..."`. Property type IDs seen include 1, 4, 5, 6, 7, 8, 11, 13, 14, 31, 32, 34, 58, 59, 60, 61, 62, 63, 72 — matching `GamePredef.EQUIPT_PROP_NAME` indices.

## Client usage

- `Moyintuce.as:4205` — `gameDataIndex[TBL_MYTC_DETAIL][suitId]` fetches all level rows for a suit.
- `Moyintuce.as:4207–4213` — iterates rows; builds `_local_7[row.lev] = row` lookup table stored as `_local_5.detail` on the suit VO.
- `Moyintuce.as:2716–2773` (`setDetailPropPanel`) — reads `_arg_2[levelNum][("c" + classId)]`; splits by `"|"`, then by `":"` to get `[propTypeId, propValue]`; accumulates values and renders to `dprop1_<propTypeId>` label elements. `Language.MYTC_PROP[propTypeId]` provides the localized stat name.
- `Moyintuce.as:3258` — passes `_local_1.detail` to `setDetailPropPanel(1, ...)` on suit selection.

## Related tables

- `tid` → [[TBL_MYTC_SUIT]] (the parent suit group).
- Prop type IDs in `c1`–`c6` → `GamePredef.EQUIPT_PROP_NAME` (stat name lookup, same namespace as equipment properties).
- Crafting material (item ID 6874) → [[TBL_ITEM_TEMPLATE]].
